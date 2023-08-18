/**
 * @file demo_capi_nvcc.cu
 * @author Jiannan Tian
 * @brief
 * @version 0.3
 * @date 2022-05-06
 *
 * (C) 2022 by Washington State University, Argonne National Laboratory
 *
 */

#include "cusz.h"
#include "utils/io.hh"
#include "utils/print_gpu.hh"
#include "utils/viewer.hh"

template <typename T>
void f(std::string fname)
{
  /* For demo, we use 3600x1800 CESM data. */
  auto len = 3600 * 1800;

  cusz_header header;
  uint8_t* exposed_compressed;
  uint8_t* compressed;
  size_t compressed_len;

  T *d_uncompressed, *h_uncompressed;
  T *d_decompressed, *h_decompressed;

  cudaMalloc(&d_uncompressed, sizeof(T) * len),
      cudaMallocHost(&h_uncompressed, sizeof(T) * len);
  cudaMalloc(&d_decompressed, sizeof(T) * len),
      cudaMallocHost(&h_decompressed, sizeof(T) * len);

  /* User handles loading from filesystem & transferring to device. */
  io::read_binary_to_array(fname, h_uncompressed, len);
  cudaMemcpy(
      d_uncompressed, h_uncompressed, sizeof(T) * len, cudaMemcpyHostToDevice);

  /* a casual peek */
  printf("peeking uncompressed data, 20 elements\n");
  psz::peek_device_data(d_uncompressed, 20);

  cudaStream_t stream;
  cudaStreamCreate(&stream);

  // Using default:
  pszframe* work = pszdefault_framework();
  // Alternatively,
  //   pszframe w = pszframe{
  //       .predictor = pszpredictor{.type = Lorenzo},
  //       .quantizer = pszquantizer{.radius = 512},
  //       .hfcoder = pszhfrc{.style = Coarse},
  //       .max_outlier_percent = 20};
  //   auto work = &w;

  // Brace initializing a struct pointer is not supported by all host compilers
  // when nvcc forwards.
  //   pszframe* work = new pszframe{
  //       .predictor = pszpredictor{.type = Lorenzo},
  //       .quantizer = pszquantizer{.radius = 512},
  //       .hfcoder = pszhfrc{.style = Coarse},
  //       .max_outlier_percent = 20};

  cusz_compressor* comp = cusz_create(work, F4);
  pszrc* config = new pszrc{.eb = 2.4e-4, .mode = Rel};
  pszlen uncomp_len = pszlen{3600, 1800, 1, 1};  // x, y, z, w
  pszlen decomp_len = uncomp_len;

  cusz::TimeRecord compress_timerecord;
  cusz::TimeRecord decompress_timerecord;

  {
    cusz_compress(
        comp, config, d_uncompressed, uncomp_len, &exposed_compressed,
        &compressed_len, &header, (void*)&compress_timerecord, stream);

    /* User can interpret the collected time information in other ways. */
    cusz::TimeRecordViewer::view_compression(
        &compress_timerecord, len * sizeof(T), compressed_len);

    /* verify header */
    printf("header.%-*s : %x\n", 12, "(addr)", &header);
    printf(
        "header.%-*s : %lu, %lu, %lu\n", 12, "{x,y,z}", header.x, header.y,
        header.z);
    printf(
        "header.%-*s : %lu\n", 12, "filesize", psz_utils::filesize(&header));
  }

  /* If needed, User should perform a memcopy to transfer `exposed_compressed`
   * before `compressor` is destroyed. */
  cudaMalloc(&compressed, compressed_len);
  cudaMemcpy(
      compressed, exposed_compressed, compressed_len,
      cudaMemcpyDeviceToDevice);

  {
    cusz_decompress(
        comp, &header, exposed_compressed, compressed_len, d_decompressed,
        decomp_len, (void*)&decompress_timerecord, stream);

    cusz::TimeRecordViewer::view_decompression(
        &decompress_timerecord, len * sizeof(T));
  }

  /* a casual peek */
  printf("peeking decompressed data, 20 elements\n");
  psz::peek_device_data(d_decompressed, 20);

  /* demo: offline checking (de)compression quality. */
  psz::eval_dataquality_gpu(
      d_decompressed, d_uncompressed, len, compressed_len);

  cusz_release(comp);

  cudaFree(compressed);

  cudaStreamDestroy(stream);
}

int main(int argc, char** argv)
{
  if (argc < 2) {
    printf("PROG /path/to/cesm-3600x1800\n");
    exit(0);
  }

  f<float>(std::string(argv[1]));
  return 0;
}
