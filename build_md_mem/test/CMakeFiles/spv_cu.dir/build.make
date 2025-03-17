# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.30

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /global/common/software/nersc9/cmake/3.30.2-013e22751e86e490ff355f301911830bb34fc1e5/bin/cmake

# The command to remove a file.
RM = /global/common/software/nersc9/cmake/3.30.2-013e22751e86e490ff355f301911830bb34fc1e5/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /pscratch/sd/s/swu264/sc25_interp/workspace_cuSZ-i/cusz-interp

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /pscratch/sd/s/swu264/sc25_interp/workspace_cuSZ-i/cusz-interp/build_md_mem

# Include any dependencies generated for this target.
include test/CMakeFiles/spv_cu.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include test/CMakeFiles/spv_cu.dir/compiler_depend.make

# Include the progress variables for this target.
include test/CMakeFiles/spv_cu.dir/progress.make

# Include the compile flags for this target's objects.
include test/CMakeFiles/spv_cu.dir/flags.make

test/CMakeFiles/spv_cu.dir/src/test_spv.cu.o: test/CMakeFiles/spv_cu.dir/flags.make
test/CMakeFiles/spv_cu.dir/src/test_spv.cu.o: test/CMakeFiles/spv_cu.dir/includes_CUDA.rsp
test/CMakeFiles/spv_cu.dir/src/test_spv.cu.o: /pscratch/sd/s/swu264/sc25_interp/workspace_cuSZ-i/cusz-interp/test/src/test_spv.cu
test/CMakeFiles/spv_cu.dir/src/test_spv.cu.o: test/CMakeFiles/spv_cu.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/pscratch/sd/s/swu264/sc25_interp/workspace_cuSZ-i/cusz-interp/build_md_mem/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CUDA object test/CMakeFiles/spv_cu.dir/src/test_spv.cu.o"
	cd /pscratch/sd/s/swu264/sc25_interp/workspace_cuSZ-i/cusz-interp/build_md_mem/test && /opt/nvidia/hpc_sdk/Linux_x86_64/24.5/cuda/12.4/bin/nvcc -forward-unknown-to-host-compiler $(CUDA_DEFINES) $(CUDA_INCLUDES) $(CUDA_FLAGS) -MD -MT test/CMakeFiles/spv_cu.dir/src/test_spv.cu.o -MF CMakeFiles/spv_cu.dir/src/test_spv.cu.o.d -x cu -c /pscratch/sd/s/swu264/sc25_interp/workspace_cuSZ-i/cusz-interp/test/src/test_spv.cu -o CMakeFiles/spv_cu.dir/src/test_spv.cu.o

test/CMakeFiles/spv_cu.dir/src/test_spv.cu.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CUDA source to CMakeFiles/spv_cu.dir/src/test_spv.cu.i"
	$(CMAKE_COMMAND) -E cmake_unimplemented_variable CMAKE_CUDA_CREATE_PREPROCESSED_SOURCE

test/CMakeFiles/spv_cu.dir/src/test_spv.cu.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CUDA source to assembly CMakeFiles/spv_cu.dir/src/test_spv.cu.s"
	$(CMAKE_COMMAND) -E cmake_unimplemented_variable CMAKE_CUDA_CREATE_ASSEMBLY_SOURCE

# Object files for target spv_cu
spv_cu_OBJECTS = \
"CMakeFiles/spv_cu.dir/src/test_spv.cu.o"

# External object files for target spv_cu
spv_cu_EXTERNAL_OBJECTS =

test/spv_cu: test/CMakeFiles/spv_cu.dir/src/test_spv.cu.o
test/spv_cu: test/CMakeFiles/spv_cu.dir/build.make
test/spv_cu: libpszspv_cu.so
test/spv_cu: test/libpsztest_utils_cu.so
test/spv_cu: libpszkernel_cu.so
test/spv_cu: /opt/nvidia/hpc_sdk/Linux_x86_64/24.5/cuda/12.4/targets/x86_64-linux/lib/libcudart.so
test/spv_cu: /usr/lib64/librt.so
test/spv_cu: /opt/nvidia/hpc_sdk/Linux_x86_64/24.5/math_libs/12.4/lib64/libcurand.so
test/spv_cu: test/CMakeFiles/spv_cu.dir/linkLibs.rsp
test/spv_cu: test/CMakeFiles/spv_cu.dir/objects1.rsp
test/spv_cu: test/CMakeFiles/spv_cu.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir=/pscratch/sd/s/swu264/sc25_interp/workspace_cuSZ-i/cusz-interp/build_md_mem/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CUDA executable spv_cu"
	cd /pscratch/sd/s/swu264/sc25_interp/workspace_cuSZ-i/cusz-interp/build_md_mem/test && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/spv_cu.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
test/CMakeFiles/spv_cu.dir/build: test/spv_cu
.PHONY : test/CMakeFiles/spv_cu.dir/build

test/CMakeFiles/spv_cu.dir/clean:
	cd /pscratch/sd/s/swu264/sc25_interp/workspace_cuSZ-i/cusz-interp/build_md_mem/test && $(CMAKE_COMMAND) -P CMakeFiles/spv_cu.dir/cmake_clean.cmake
.PHONY : test/CMakeFiles/spv_cu.dir/clean

test/CMakeFiles/spv_cu.dir/depend:
	cd /pscratch/sd/s/swu264/sc25_interp/workspace_cuSZ-i/cusz-interp/build_md_mem && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /pscratch/sd/s/swu264/sc25_interp/workspace_cuSZ-i/cusz-interp /pscratch/sd/s/swu264/sc25_interp/workspace_cuSZ-i/cusz-interp/test /pscratch/sd/s/swu264/sc25_interp/workspace_cuSZ-i/cusz-interp/build_md_mem /pscratch/sd/s/swu264/sc25_interp/workspace_cuSZ-i/cusz-interp/build_md_mem/test /pscratch/sd/s/swu264/sc25_interp/workspace_cuSZ-i/cusz-interp/build_md_mem/test/CMakeFiles/spv_cu.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : test/CMakeFiles/spv_cu.dir/depend

