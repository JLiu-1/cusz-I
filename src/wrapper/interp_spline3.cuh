/**
 * @file interp_spline3.cuh
 * @author Jiannan Tian
 * @brief (header) A high-level Spline3D wrapper. Allocations are explicitly out of called functions.
 * @version 0.3
 * @date 2021-06-15
 *
 * (C) 2021 by Washington State University, Argonne National Laboratory
 *
 */

#ifndef CUSZ_WRAPPER_INTERP_SPLINE_CUH
#define CUSZ_WRAPPER_INTERP_SPLINE_CUH

#include "../../include/predictor.hh"
#include "../common.hh"

namespace cusz {

template <typename T, typename E, typename FP>
class Spline3 : public PredictorAbstraction<T, E> {
   public:
    using Precision = FP;

   private:
    static const auto BLOCK = 8;

    using TITER = T*;
    using EITER = E*;

   private:
    unsigned int dimx, dimx_aligned, nblockx, nanchorx;
    unsigned int dimy, dimy_aligned, nblocky, nanchory;
    unsigned int dimz, dimz_aligned, nblockz, nanchorz;
    unsigned int len, len_aligned, len_anchor;
    dim3         size, size_aligned, leap, leap_aligned, anchor_size, anchor_leap;

    double eb;
    FP     eb_r, ebx2, ebx2_r;

    bool delay_postquant_dummy;

    float time_elapsed;

    int radius;

   public:
    unsigned int get_anchor_len() const { return len_anchor; }
    unsigned int get_quant_len() const
    {
        auto m = Reinterpret1DTo2D::get_square_size(len_aligned);
        return m * m;
    }
    unsigned int get_quant_footprint() const
    {
        auto m = Reinterpret1DTo2D::get_square_size(len_aligned);
        return m * m;
    }
    float    get_time_elapsed() const { return time_elapsed; }
    uint32_t get_workspace_nbyte() const { return 0; };

    Spline3(dim3 xyz, double _eb, int _radius, bool _delay_postquant_dummy = true);

    void construct(TITER in_data, TITER out_anchor, EITER out_errctrl);

    void reconstruct(TITER in_anchor, EITER in_errctrl, TITER out_data);
};

}  // namespace cusz

#endif