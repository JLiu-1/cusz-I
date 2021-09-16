#ifndef HEADER_HH
#define HEADER_HH

/**
 * @file header.hh
 * @author Jiannan Tian
 * @brief
 * @version 0.2
 * @date 2021-01-22
 * (created) 2020-09-25, (rev.1) 2021-01-22 (rev.2) 2021-09-08
 *
 * @copyright (C) 2020 by Washington State University, Argonne National Laboratory
 * See LICENSE in top-level directory
 *
 */

#include "argparse.hh"

typedef struct alignas(128) cuszHEADER {
    uint32_t x, y, z, w, ndim;
    uint32_t data_len;
    double   eb;

    struct {
        uint32_t dtype : 8;        // (1) fp32, (2) fp64
        uint32_t quant_nbyte : 4;  //
        uint32_t huff_nbyte : 4;   //
    } config;

    struct {
        int nnz;
    } outlier;

    struct {
        // uint32_t num_bits;
        uint32_t num_uints;
        uint32_t chunk;
    } huffman;

    bool skip_huffman;

    // stat
    float maximum, minimum;

    struct {
        /* 0 header */
        /* 1 */ uint32_t book;
        /* 2 */ uint32_t quant;
        /* 3 */ uint32_t revbook;
        /* 4 */ uint32_t outlier;
        /* 5 */ uint32_t huff_meta;
        /* 6 */ uint32_t huff_bitstream;
    } nbyte;

} cusz_header;

#endif