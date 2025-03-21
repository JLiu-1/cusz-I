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
CMAKE_BINARY_DIR = /pscratch/sd/s/swu264/sc25_interp/workspace_cuSZ-i/cusz-interp/build_test

# Include any dependencies generated for this target.
include test/CMakeFiles/decomp_lrz_cu.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include test/CMakeFiles/decomp_lrz_cu.dir/compiler_depend.make

# Include the progress variables for this target.
include test/CMakeFiles/decomp_lrz_cu.dir/progress.make

# Include the compile flags for this target's objects.
include test/CMakeFiles/decomp_lrz_cu.dir/flags.make

test/CMakeFiles/decomp_lrz_cu.dir/src/test_decomp_lrz.cu.o: test/CMakeFiles/decomp_lrz_cu.dir/flags.make
test/CMakeFiles/decomp_lrz_cu.dir/src/test_decomp_lrz.cu.o: test/CMakeFiles/decomp_lrz_cu.dir/includes_CUDA.rsp
test/CMakeFiles/decomp_lrz_cu.dir/src/test_decomp_lrz.cu.o: /pscratch/sd/s/swu264/sc25_interp/workspace_cuSZ-i/cusz-interp/test/src/test_decomp_lrz.cu
test/CMakeFiles/decomp_lrz_cu.dir/src/test_decomp_lrz.cu.o: test/CMakeFiles/decomp_lrz_cu.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/pscratch/sd/s/swu264/sc25_interp/workspace_cuSZ-i/cusz-interp/build_test/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CUDA object test/CMakeFiles/decomp_lrz_cu.dir/src/test_decomp_lrz.cu.o"
	cd /pscratch/sd/s/swu264/sc25_interp/workspace_cuSZ-i/cusz-interp/build_test/test && /opt/nvidia/hpc_sdk/Linux_x86_64/24.5/cuda/12.4/bin/nvcc -forward-unknown-to-host-compiler $(CUDA_DEFINES) $(CUDA_INCLUDES) $(CUDA_FLAGS) -MD -MT test/CMakeFiles/decomp_lrz_cu.dir/src/test_decomp_lrz.cu.o -MF CMakeFiles/decomp_lrz_cu.dir/src/test_decomp_lrz.cu.o.d -x cu -c /pscratch/sd/s/swu264/sc25_interp/workspace_cuSZ-i/cusz-interp/test/src/test_decomp_lrz.cu -o CMakeFiles/decomp_lrz_cu.dir/src/test_decomp_lrz.cu.o

test/CMakeFiles/decomp_lrz_cu.dir/src/test_decomp_lrz.cu.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CUDA source to CMakeFiles/decomp_lrz_cu.dir/src/test_decomp_lrz.cu.i"
	$(CMAKE_COMMAND) -E cmake_unimplemented_variable CMAKE_CUDA_CREATE_PREPROCESSED_SOURCE

test/CMakeFiles/decomp_lrz_cu.dir/src/test_decomp_lrz.cu.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CUDA source to assembly CMakeFiles/decomp_lrz_cu.dir/src/test_decomp_lrz.cu.s"
	$(CMAKE_COMMAND) -E cmake_unimplemented_variable CMAKE_CUDA_CREATE_ASSEMBLY_SOURCE

# Object files for target decomp_lrz_cu
decomp_lrz_cu_OBJECTS = \
"CMakeFiles/decomp_lrz_cu.dir/src/test_decomp_lrz.cu.o"

# External object files for target decomp_lrz_cu
decomp_lrz_cu_EXTERNAL_OBJECTS =

test/decomp_lrz_cu: test/CMakeFiles/decomp_lrz_cu.dir/src/test_decomp_lrz.cu.o
test/decomp_lrz_cu: test/CMakeFiles/decomp_lrz_cu.dir/build.make
test/decomp_lrz_cu: libpszkernel_cu.so
test/decomp_lrz_cu: test/CMakeFiles/decomp_lrz_cu.dir/linkLibs.rsp
test/decomp_lrz_cu: test/CMakeFiles/decomp_lrz_cu.dir/objects1.rsp
test/decomp_lrz_cu: test/CMakeFiles/decomp_lrz_cu.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir=/pscratch/sd/s/swu264/sc25_interp/workspace_cuSZ-i/cusz-interp/build_test/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CUDA executable decomp_lrz_cu"
	cd /pscratch/sd/s/swu264/sc25_interp/workspace_cuSZ-i/cusz-interp/build_test/test && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/decomp_lrz_cu.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
test/CMakeFiles/decomp_lrz_cu.dir/build: test/decomp_lrz_cu
.PHONY : test/CMakeFiles/decomp_lrz_cu.dir/build

test/CMakeFiles/decomp_lrz_cu.dir/clean:
	cd /pscratch/sd/s/swu264/sc25_interp/workspace_cuSZ-i/cusz-interp/build_test/test && $(CMAKE_COMMAND) -P CMakeFiles/decomp_lrz_cu.dir/cmake_clean.cmake
.PHONY : test/CMakeFiles/decomp_lrz_cu.dir/clean

test/CMakeFiles/decomp_lrz_cu.dir/depend:
	cd /pscratch/sd/s/swu264/sc25_interp/workspace_cuSZ-i/cusz-interp/build_test && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /pscratch/sd/s/swu264/sc25_interp/workspace_cuSZ-i/cusz-interp /pscratch/sd/s/swu264/sc25_interp/workspace_cuSZ-i/cusz-interp/test /pscratch/sd/s/swu264/sc25_interp/workspace_cuSZ-i/cusz-interp/build_test /pscratch/sd/s/swu264/sc25_interp/workspace_cuSZ-i/cusz-interp/build_test/test /pscratch/sd/s/swu264/sc25_interp/workspace_cuSZ-i/cusz-interp/build_test/test/CMakeFiles/decomp_lrz_cu.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : test/CMakeFiles/decomp_lrz_cu.dir/depend

