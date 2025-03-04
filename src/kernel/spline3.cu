/**
 * @file spline3.cu
 * @author Jinyang Liu, Shixun Wu, Jiannan Tian
 * @brief A high-level Spline3D wrapper. Allocations are explicitly out of
 * called functions.
 * @version 0.3
 * @date 2021-06-15
 *
 * (copyright to be updated)
 * (C) 2021 by Washington State University, Argonne National Laboratory
 *
 */

#include "busyheader.hh"
#include "cusz/type.h"
#include "detail/spline3.inl"
#include "kernel/spline.hh"
#include "mem/compact.hh"

#include <cuda_runtime.h>
//#include "mem/memseg_cxx.hh"
//#include "mem/memseg.h"
//#include "mem/layout.h"
//#include "mem/layout_cxx.hh"

constexpr int DEFAULT_BLOCK_SIZE = 384;

#define SETUP                                                   \
  auto div3 = [](dim3 len, dim3 sublen) {                       \
    return dim3(                                                \
        (len.x - 1) / sublen.x + 1, (len.y - 1) / sublen.y + 1, \
        (len.z - 1) / sublen.z + 1);                            \
  };                                                            \
  auto ndim = [&]() {                                           \
    if (len3.z == 1 and len3.y == 1)                            \
      return 1;                                                 \
    else if (len3.z == 1 and len3.y != 1)                       \
      return 2;                                                 \
    else                                                        \
      return 3;                                                 \
  };

template <typename T, typename E, typename FP>
int spline_construct(
    pszmem_cxx<T>* data, pszmem_cxx<T>* anchor, pszmem_cxx<E>* ectrl,
    void* _outlier, double eb, double rel_eb, uint32_t radius, INTERPOLATION_PARAMS &intp_param, float* time, void* stream, pszmem_cxx<T>* profiling_errors)
{
  constexpr auto BLOCK = 8;
  auto div = [](auto _l, auto _subl) { return (_l - 1) / _subl + 1; };

  auto ebx2 = eb * 2;
  auto eb_r = 1 / eb;

  auto l3 = data->template len3<dim3>();
  auto grid_dim =
      dim3(div(l3.x, BLOCK * 2), div(l3.y, BLOCK * 2), div(l3.z, BLOCK * 2));


  auto auto_tuning_grid_dim =
      dim3(1, 1, 1);



  using Compact = typename CompactDram<PROPER_GPU_BACKEND, T>::Compact;
  auto ot = (Compact*)_outlier;

  CREATE_GPUEVENT_PAIR;
  START_GPUEVENT_RECORDING(stream);

 if(intp_param.auto_tuning>0){
   //std::cout<<"att "<<(int)intp_param.auto_tuning<<std::endl;
   double a1=2.0;
   double a2=1.75;
   double a3=1.5;
   double a4=1.25;
   double a5=1;
   double e1=1e-1;
   double e2=1e-2;
   double e3=1e-3;
   double e4=1e-4;
   double e5=1e-5;

   intp_param.beta=4.0;
   if(rel_eb>=e1)
    intp_param.alpha=a1;
   else if(rel_eb>=e2)
    intp_param.alpha=a2+(a1-a2)*(rel_eb-e2)/(e1-e2);
   else if(rel_eb>=e3)
    intp_param.alpha=a3+(a2-a3)*(rel_eb-e3)/(e2-e3);
   else if(rel_eb>=e4)
    intp_param.alpha=a4+(a3-a4)*(rel_eb-e4)/(e3-e4);
   else if(rel_eb>=e5)
    intp_param.alpha=a5+(a4-a5)*(rel_eb-e5)/(e4-e5);
   else
    intp_param.alpha=a5;
    if(intp_param.auto_tuning==1){
   
      cusz::c_spline3d_profiling_16x16x16data<T*, DEFAULT_BLOCK_SIZE>  //
        <<<auto_tuning_grid_dim, dim3(DEFAULT_BLOCK_SIZE, 1, 1), 0, (GpuStreamT)stream>>>(
            data->dptr(), data->template len3<dim3>(),
            data->template st3<dim3>(),  //
            profiling_errors->dptr());
      //profiling_errors->control({D2H});
      CHECK_GPU(cudaMemcpy(profiling_errors->m->h, profiling_errors->m->d, profiling_errors->m->bytes, cudaMemcpyDeviceToHost));
      auto errors=profiling_errors->hptr();
      
      //printf("host %.4f %.4f\n",errors[0],errors[1]);
      bool do_reverse=(errors[1]>3*errors[0]);
      intp_param.reverse[0]=intp_param.reverse[1]=intp_param.reverse[2]=do_reverse;
    }
    else{
      cusz::c_spline3d_profiling_data_2<T*, DEFAULT_BLOCK_SIZE>  //
        <<<auto_tuning_grid_dim, dim3(DEFAULT_BLOCK_SIZE, 1, 1), 0, (GpuStreamT)stream>>>(
            data->dptr(), data->template len3<dim3>(),
            data->template st3<dim3>(),  //
            profiling_errors->dptr());
      //profiling_errors->control({D2H});
      CHECK_GPU(cudaMemcpy(profiling_errors->m->h, profiling_errors->m->d, profiling_errors->m->bytes, cudaMemcpyDeviceToHost));
      auto errors=profiling_errors->hptr();

      intp_param.interpolators[0]=(errors[0]>errors[1]);
      intp_param.interpolators[1]=(errors[2]>errors[3]);
      intp_param.interpolators[2]=(errors[4]>errors[5]);
      
      bool do_reverse=(errors[4+intp_param.interpolators[2]]>3*errors[intp_param.interpolators[0]]);
       // bool do_reverse=(errors[1]>2*errors[0]);
       intp_param.reverse[0]=intp_param.reverse[1]=intp_param.reverse[2]=do_reverse;
    }
   
   
    
    
  
  }


  cusz::c_spline3d_infprecis_16x16x16data<T*, E*, float, DEFAULT_BLOCK_SIZE>  //
      <<<grid_dim, dim3(DEFAULT_BLOCK_SIZE, 1, 1), 0, (GpuStreamT)stream>>>(
          data->dptr(), data->template len3<dim3>(),
          data->template st3<dim3>(),  //
          ectrl->dptr(), ectrl->template len3<dim3>(),
          ectrl->template st3<dim3>(),  //
          anchor->dptr(), anchor->template st3<dim3>(), ot->val(), ot->idx(),
          ot->num(), eb_r, ebx2, radius, intp_param);//,profiling_errors->dptr());

  STOP_GPUEVENT_RECORDING(stream);
  CHECK_GPU(GpuStreamSync(stream));
  TIME_ELAPSED_GPUEVENT(time);
  DESTROY_GPUEVENT_PAIR;

  return 0;
}

template <typename T, typename E, typename FP>
int spline_reconstruct(
    pszmem_cxx<T>* anchor, pszmem_cxx<E>* ectrl, pszmem_cxx<T>* xdata,
    double eb, uint32_t radius, INTERPOLATION_PARAMS intp_param, float* time, void* stream)
{
  constexpr auto BLOCK = 8;

  auto div = [](auto _l, auto _subl) { return (_l - 1) / _subl + 1; };

  auto ebx2 = eb * 2;
  auto eb_r = 1 / eb;

  auto l3 = xdata->template len3<dim3>();
  auto grid_dim =
      dim3(div(l3.x, BLOCK * 2), div(l3.y, BLOCK * 2), div(l3.z, BLOCK * 2));

  CREATE_GPUEVENT_PAIR;
  START_GPUEVENT_RECORDING(stream);

  cusz::x_spline3d_infprecis_16x16x16data<E*, T*, float, DEFAULT_BLOCK_SIZE>   //
      <<<grid_dim, dim3(DEFAULT_BLOCK_SIZE, 1, 1), 0, (GpuStreamT)stream>>>  //
      (ectrl->dptr(), ectrl->template len3<dim3>(),
       ectrl->template st3<dim3>(),  //
       anchor->dptr(), anchor->template len3<dim3>(),
       anchor->template st3<dim3>(),  //
       xdata->dptr(), xdata->template len3<dim3>(),
       xdata->template st3<dim3>(),  //
       eb_r, ebx2, radius, intp_param);

  STOP_GPUEVENT_RECORDING(stream);
  CHECK_GPU(GpuStreamSync(stream));
  TIME_ELAPSED_GPUEVENT(time);
  DESTROY_GPUEVENT_PAIR;

  return 0;
}

#define INIT(T, E)                                                            \
  template int spline_construct<T, E>(                                        \
      pszmem_cxx<T> * data, pszmem_cxx<T> * anchor, pszmem_cxx<E> * ectrl,    \
      void* _outlier, double eb, double rel_eb, uint32_t radius, struct INTERPOLATION_PARAMS &intp_param, float* time, void* stream, pszmem_cxx<T> * profiling_errors); \
  template int spline_reconstruct<T, E>(                                      \
      pszmem_cxx<T> * anchor, pszmem_cxx<E> * ectrl, pszmem_cxx<T> * xdata,   \
      double eb, uint32_t radius, struct INTERPOLATION_PARAMS intp_param, float* time, void* stream);

INIT(f4, u1)
INIT(f4, u2)
INIT(f4, u4)
INIT(f4, f4)

//INIT(f8, u1)
//INIT(f8, u2)
//INIT(f8, u4)
//INIT(f8, f4)

#undef INIT
#undef SETUP