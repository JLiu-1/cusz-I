# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.30

# compile CUDA with /opt/nvidia/hpc_sdk/Linux_x86_64/24.5/cuda/12.4/bin/nvcc
CUDA_DEFINES = -DPSZ_USE_CUDA -Dpszhf_cu_EXPORTS

CUDA_INCLUDES = --options-file CMakeFiles/pszhf_cu.dir/includes_CUDA.rsp

CUDA_FLAGS = -O3 -DNDEBUG -std=c++17 "--generate-code=arch=compute_80,code=[compute_80,sm_80]" -Xcompiler=-fPIC --extended-lambda --expt-relaxed-constexpr -Wno-deprecated-declarations

