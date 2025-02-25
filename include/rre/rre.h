#pragma once

void RRE1_COMPRESS(uint8_t* input, size_t insize, uint8_t** output, int* outsize, float* time);
void RRE1_DECOMPRESS(uint8_t* input, uint8_t** output, int* pre_size, float* time);