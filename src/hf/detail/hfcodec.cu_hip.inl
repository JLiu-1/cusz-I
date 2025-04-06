/**
 * @file codec_huffman.cuh
 * @author Jiannan Tian
 * @brief Huffman kernel definitions
 * @version 0.2
 * @date 2020-02-13
 * (created) 2020-02-02, (rev1) 2021-02-13, (rev2) 2021-12-29
 *
 * @copyright (C) 2020 by Washington State University, The University of
 * Alabama, Argonne National Laboratory See LICENSE in top-level directory
 *
 */

#ifndef CUSZ_KERNEL_CODEC_HUFFMAN_CUH
#define CUSZ_KERNEL_CODEC_HUFFMAN_CUH

#include "busyheader.hh"
#include "hf/hfcodec.hh"
#include "hf/hfstruct.h"
#include "typing.hh"
#include "utils/config.hh"
#include "utils/err.hh"
#include "utils/timer.hh"

#define TIX threadIdx.x
#define BIX blockIdx.x
#define BDX blockDim.x

using BYTE = uint8_t;

extern __shared__ char __codec_huffman_uninitialized[];

struct __helper {
  __device__ __forceinline__ static unsigned int local_tid_1()
  {
    return threadIdx.x;
  }
  __device__ __forceinline__ static unsigned int global_tid_1()
  {
    return blockIdx.x * blockDim.x + threadIdx.x;
  }
  __device__ __forceinline__ static unsigned int block_stride_1()
  {
    return blockDim.x;
  }
  __device__ __forceinline__ static unsigned int grid_stride_1()
  {
    return blockDim.x * gridDim.x;
  }
  template <int SEQ>
  __device__ __forceinline__ static unsigned int global_tid()
  {
    return blockIdx.x * blockDim.x * SEQ + threadIdx.x;
  }
  template <int SEQ>
  __device__ __forceinline__ static unsigned int grid_stride()
  {
    return blockDim.x * gridDim.x * SEQ;
  }
};

template <typename E, typename H, typename M>
__global__ void hf_decode_kernel(
    H* in, uint8_t* revbook, M* par_nbit, M* par_entry,
    int const revbook_nbyte, int const sublen, int const pardeg, E* out);

namespace psz {
namespace detail {

template <typename E, typename H>
__global__ void hf_encode_phase1_fill(
    E* in_uncompressed, size_t const in_uncompressed_len, H* in_book,
    int const in_booklen, H* out_encoded);

template <typename H, typename M>
__global__ void hf_encode_phase2_deflate(
    H* inout_inplace, size_t const len, M* par_nbit, M* par_ncell,
    int const sublen, int const pardeg);

template <typename H, typename M>
__global__ void hf_encode_phase4_concatenate(
    H* gapped, M* par_entry, M* par_ncell, int const cfg_sublen,
    H* non_gapped);

// TODO change size_t to unsigned int
template <typename H, typename E>
__device__ void hf_decode_single_thread_inflate(
    H* input, E* out, int const total_bw, BYTE* revbook);

}  // namespace detail
}  // namespace psz

// TODO change size_t to unsigned int
template <typename H, typename E>
__device__ void psz::detail::hf_decode_single_thread_inflate(
    const H* input,    // 压缩数据输入（全局内存）
    E* out,            // 解码后符号输出（全局内存）
    int total_bw,      // 压缩数据的总比特数
    const uint8_t* revbook) // 查找表，已加载到共享内存中
{
    // 每个H型数据的位宽
    constexpr int CELL_BITWIDTH = sizeof(H) * 8;

    // 输出索引、全局已处理比特数、输入word索引
    int outIndex = 0;
    int bitCount = 0;  
    int wordIndex = 0;
    
    // 从输入加载第一个数据单元到位缓冲区
    H bitBuffer = input[wordIndex];
    
    // 加载查找表：revbook中按以下布局存储
    //   - 前 CELL_BITWIDTH * sizeof(H) 字节存放 first[]
    //   - 接下来 CELL_BITWIDTH * sizeof(H) 字节存放 entry[]
    //   - 剩下存放 keys[]
    const H* first = reinterpret_cast<const H*>(revbook);
    const H* entry = first + CELL_BITWIDTH;
    const E* keys = reinterpret_cast<const E*>(revbook + sizeof(H) * (2 * CELL_BITWIDTH));
    
    // Lookahead 寄存器：初始载入一个数据单元
    unsigned int lookahead = bitBuffer;
    int lookahead_bits = CELL_BITWIDTH;

    // 主循环：逐个符号解码
    while (bitCount < total_bw) {
        // 如果当前窗口位数较少且未到末尾，则从输入加载下一数据单元
        if (lookahead_bits < 16 && (bitCount + lookahead_bits < total_bw)) {
            wordIndex++;
            bitBuffer = input[wordIndex];
            lookahead = (lookahead << CELL_BITWIDTH) | bitBuffer;
            lookahead_bits += CELL_BITWIDTH;
        }
        
        // Lookahead解码：尝试取1~CELL_BITWIDTH个比特，直到找到满足条件的码字
        int code = 0;
        int code_length = 0;
        bool found = false;
        for (int l = 1; l <= CELL_BITWIDTH && l <= lookahead_bits; ++l) {
            // 从窗口中提取当前l位
            code = (lookahead >> (lookahead_bits - l)) & ((1 << l) - 1);
            // 当码值达到查找表要求时，即可判定符号
            if (code >= first[l]) {
                code_length = l;
                found = true;
                break;
            }
        }
        if (!found) {
            // 输入可能不完整或数据损坏，退出解码
            break;
        }
        
        // 利用查找表计算输出符号
        int index = entry[code_length] + (code - first[code_length]);
        out[outIndex++] = keys[index];
        
        // 消耗掉已使用的比特
        lookahead_bits -= code_length;
        bitCount += code_length;
    }
}

template <typename E, typename H>
__global__ void psz::detail::hf_encode_phase1_fill(
    E* in_uncompressed, size_t const in_uncompressed_len, H* in_book,
    int const in_booklen, H* out_encoded)
{
  auto shmem_cb = reinterpret_cast<H*>(__codec_huffman_uninitialized);

  // load from global memory
  for (auto idx = __helper::local_tid_1();  //
       idx < in_booklen;                    //
       idx += __helper::block_stride_1())
    shmem_cb[idx] = in_book[idx];

  __syncthreads();

  for (auto idx = __helper::global_tid_1();  //
       idx < in_uncompressed_len;            //
       idx += __helper::grid_stride_1()      //
  )
    out_encoded[idx] = shmem_cb[(int)in_uncompressed[idx]];
}

template <typename H, typename M>
__global__ void psz::detail::hf_encode_phase2_deflate(
    H* inout_inplace, size_t const len, M* par_nbit, M* par_ncell,
    int const sublen, int const pardeg)
{
  constexpr int CELL_BITWIDTH = sizeof(H) * 8;

  auto tid = BIX * BDX + TIX;

  if (tid * sublen < len) {
    int residue_bits = CELL_BITWIDTH;
    int total_bits = 0;
    H* ptr = inout_inplace + tid * sublen;
    H bufr;
    uint8_t word_width;

    auto did = tid * sublen;
    for (auto i = 0; i < sublen; i++, did++) {
      if (did == len) break;

      H packed_word = inout_inplace[tid * sublen + i];
      auto word_ptr =
          reinterpret_cast<struct PackedWordByWidth<sizeof(H)>*>(&packed_word);
      word_width = word_ptr->bits;
      word_ptr->bits = (uint8_t)0x0;

      if (residue_bits == CELL_BITWIDTH) {  // a new unit of compact format
        bufr = 0x0;
      }
      ////////////////////////////////////////////////////////////////

      if (word_width <= residue_bits) {
        residue_bits -= word_width;
        bufr |= packed_word << residue_bits;

        if (residue_bits == 0) {
          residue_bits = CELL_BITWIDTH;
          *(ptr++) = bufr;
        }
      }
      else {
        // example: we have 5-bit code 11111 but 3 bits available in (*ptr)
        // 11111 for the residue 3 bits in (*ptr); 11111 for 2 bits of
        // (*(++ptr)), starting with MSB
        // ^^^                                        ^^
        auto l_bits = word_width - residue_bits;
        auto r_bits = CELL_BITWIDTH - l_bits;

        bufr |= packed_word >> l_bits;
        *(ptr++) = bufr;
        bufr = packed_word << r_bits;

        residue_bits = r_bits;
      }
      total_bits += word_width;
    }
    *ptr = bufr;  // manage the last unit

    par_nbit[tid] = total_bits;
    par_ncell[tid] = (total_bits + CELL_BITWIDTH - 1) / CELL_BITWIDTH;
  }
}

template <typename H, typename M>
__global__ void psz::detail::hf_encode_phase4_concatenate(
    H* gapped, M* par_entry, M* par_ncell, int const cfg_sublen,
    H* non_gapped)
{
  auto n = par_ncell[blockIdx.x];
  auto src = gapped + cfg_sublen * blockIdx.x;
  auto dst = non_gapped + par_entry[blockIdx.x];

  for (auto i = threadIdx.x; i < n; i += blockDim.x) {  // block-stride
    dst[i] = src[i];
  }
}

// 优化后的Huffman解码kernel
template <typename E, typename H, typename M>
__global__ void hf_decode_kernel(
    H* in,                // 压缩数据输入（全局内存）
    uint8_t* revbook,     // 查找表（全局内存）
    M* par_nbit,          // 每段压缩数据的总比特数
    M* par_entry,         // 每段压缩数据在输入数据中的起始偏移
    int const revbook_nbyte, // 查找表字节数
    int const sublen,        // 每个线程输出数据的长度
    int const pardeg,        // 总的并行度
    E* out)                  // 解码输出（全局内存）
{
    // 利用共享内存存储查找表，减少全局内存访问
    extern __shared__ uint8_t shmem[];
    int tid = threadIdx.x;
    int blockDimX = blockDim.x;
    
    // 每个线程分段加载共享内存数据
    for (int i = tid; i < revbook_nbyte; i += blockDimX) {
        shmem[i] = revbook[i];
    }
    __syncthreads();

    // 计算全局线程ID
    int gid = blockIdx.x * blockDimX + tid;
    if (gid < pardeg) {
        hf_decode_single_thread_inflate(
            in + par_entry[gid],   // 当前线程对应的数据起始位置
            out + sublen * gid,      // 当前线程输出区域
            par_nbit[gid],           // 当前数据的总比特数
            shmem                  // 查找表数据已加载到共享内存
        );
    }
}

#endif
