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
CMAKE_BINARY_DIR = /pscratch/sd/s/swu264/sc25_interp/workspace_cuSZ-i/cusz-interp/build_balance

# Include any dependencies generated for this target.
include test/CMakeFiles/psztest_utils_cu.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include test/CMakeFiles/psztest_utils_cu.dir/compiler_depend.make

# Include the progress variables for this target.
include test/CMakeFiles/psztest_utils_cu.dir/progress.make

# Include the compile flags for this target's objects.
include test/CMakeFiles/psztest_utils_cu.dir/flags.make

test/CMakeFiles/psztest_utils_cu.dir/src/utils/rand.seq.cc.o: test/CMakeFiles/psztest_utils_cu.dir/flags.make
test/CMakeFiles/psztest_utils_cu.dir/src/utils/rand.seq.cc.o: /pscratch/sd/s/swu264/sc25_interp/workspace_cuSZ-i/cusz-interp/test/src/utils/rand.seq.cc
test/CMakeFiles/psztest_utils_cu.dir/src/utils/rand.seq.cc.o: test/CMakeFiles/psztest_utils_cu.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/pscratch/sd/s/swu264/sc25_interp/workspace_cuSZ-i/cusz-interp/build_balance/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object test/CMakeFiles/psztest_utils_cu.dir/src/utils/rand.seq.cc.o"
	cd /pscratch/sd/s/swu264/sc25_interp/workspace_cuSZ-i/cusz-interp/build_balance/test && /opt/cray/pe/gcc/12.2.0/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT test/CMakeFiles/psztest_utils_cu.dir/src/utils/rand.seq.cc.o -MF CMakeFiles/psztest_utils_cu.dir/src/utils/rand.seq.cc.o.d -o CMakeFiles/psztest_utils_cu.dir/src/utils/rand.seq.cc.o -c /pscratch/sd/s/swu264/sc25_interp/workspace_cuSZ-i/cusz-interp/test/src/utils/rand.seq.cc

test/CMakeFiles/psztest_utils_cu.dir/src/utils/rand.seq.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/psztest_utils_cu.dir/src/utils/rand.seq.cc.i"
	cd /pscratch/sd/s/swu264/sc25_interp/workspace_cuSZ-i/cusz-interp/build_balance/test && /opt/cray/pe/gcc/12.2.0/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /pscratch/sd/s/swu264/sc25_interp/workspace_cuSZ-i/cusz-interp/test/src/utils/rand.seq.cc > CMakeFiles/psztest_utils_cu.dir/src/utils/rand.seq.cc.i

test/CMakeFiles/psztest_utils_cu.dir/src/utils/rand.seq.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/psztest_utils_cu.dir/src/utils/rand.seq.cc.s"
	cd /pscratch/sd/s/swu264/sc25_interp/workspace_cuSZ-i/cusz-interp/build_balance/test && /opt/cray/pe/gcc/12.2.0/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /pscratch/sd/s/swu264/sc25_interp/workspace_cuSZ-i/cusz-interp/test/src/utils/rand.seq.cc -o CMakeFiles/psztest_utils_cu.dir/src/utils/rand.seq.cc.s

test/CMakeFiles/psztest_utils_cu.dir/src/utils/rand.cu_hip.cc.o: test/CMakeFiles/psztest_utils_cu.dir/flags.make
test/CMakeFiles/psztest_utils_cu.dir/src/utils/rand.cu_hip.cc.o: /pscratch/sd/s/swu264/sc25_interp/workspace_cuSZ-i/cusz-interp/test/src/utils/rand.cu_hip.cc
test/CMakeFiles/psztest_utils_cu.dir/src/utils/rand.cu_hip.cc.o: test/CMakeFiles/psztest_utils_cu.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/pscratch/sd/s/swu264/sc25_interp/workspace_cuSZ-i/cusz-interp/build_balance/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object test/CMakeFiles/psztest_utils_cu.dir/src/utils/rand.cu_hip.cc.o"
	cd /pscratch/sd/s/swu264/sc25_interp/workspace_cuSZ-i/cusz-interp/build_balance/test && /opt/cray/pe/gcc/12.2.0/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT test/CMakeFiles/psztest_utils_cu.dir/src/utils/rand.cu_hip.cc.o -MF CMakeFiles/psztest_utils_cu.dir/src/utils/rand.cu_hip.cc.o.d -o CMakeFiles/psztest_utils_cu.dir/src/utils/rand.cu_hip.cc.o -c /pscratch/sd/s/swu264/sc25_interp/workspace_cuSZ-i/cusz-interp/test/src/utils/rand.cu_hip.cc

test/CMakeFiles/psztest_utils_cu.dir/src/utils/rand.cu_hip.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/psztest_utils_cu.dir/src/utils/rand.cu_hip.cc.i"
	cd /pscratch/sd/s/swu264/sc25_interp/workspace_cuSZ-i/cusz-interp/build_balance/test && /opt/cray/pe/gcc/12.2.0/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /pscratch/sd/s/swu264/sc25_interp/workspace_cuSZ-i/cusz-interp/test/src/utils/rand.cu_hip.cc > CMakeFiles/psztest_utils_cu.dir/src/utils/rand.cu_hip.cc.i

test/CMakeFiles/psztest_utils_cu.dir/src/utils/rand.cu_hip.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/psztest_utils_cu.dir/src/utils/rand.cu_hip.cc.s"
	cd /pscratch/sd/s/swu264/sc25_interp/workspace_cuSZ-i/cusz-interp/build_balance/test && /opt/cray/pe/gcc/12.2.0/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /pscratch/sd/s/swu264/sc25_interp/workspace_cuSZ-i/cusz-interp/test/src/utils/rand.cu_hip.cc -o CMakeFiles/psztest_utils_cu.dir/src/utils/rand.cu_hip.cc.s

# Object files for target psztest_utils_cu
psztest_utils_cu_OBJECTS = \
"CMakeFiles/psztest_utils_cu.dir/src/utils/rand.seq.cc.o" \
"CMakeFiles/psztest_utils_cu.dir/src/utils/rand.cu_hip.cc.o"

# External object files for target psztest_utils_cu
psztest_utils_cu_EXTERNAL_OBJECTS =

test/libpsztest_utils_cu.so: test/CMakeFiles/psztest_utils_cu.dir/src/utils/rand.seq.cc.o
test/libpsztest_utils_cu.so: test/CMakeFiles/psztest_utils_cu.dir/src/utils/rand.cu_hip.cc.o
test/libpsztest_utils_cu.so: test/CMakeFiles/psztest_utils_cu.dir/build.make
test/libpsztest_utils_cu.so: /opt/nvidia/hpc_sdk/Linux_x86_64/24.5/cuda/12.4/targets/x86_64-linux/lib/libcudart.so
test/libpsztest_utils_cu.so: /opt/nvidia/hpc_sdk/Linux_x86_64/24.5/math_libs/12.4/lib64/libcurand.so
test/libpsztest_utils_cu.so: /usr/lib64/librt.so
test/libpsztest_utils_cu.so: test/CMakeFiles/psztest_utils_cu.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir=/pscratch/sd/s/swu264/sc25_interp/workspace_cuSZ-i/cusz-interp/build_balance/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking CXX shared library libpsztest_utils_cu.so"
	cd /pscratch/sd/s/swu264/sc25_interp/workspace_cuSZ-i/cusz-interp/build_balance/test && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/psztest_utils_cu.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
test/CMakeFiles/psztest_utils_cu.dir/build: test/libpsztest_utils_cu.so
.PHONY : test/CMakeFiles/psztest_utils_cu.dir/build

test/CMakeFiles/psztest_utils_cu.dir/clean:
	cd /pscratch/sd/s/swu264/sc25_interp/workspace_cuSZ-i/cusz-interp/build_balance/test && $(CMAKE_COMMAND) -P CMakeFiles/psztest_utils_cu.dir/cmake_clean.cmake
.PHONY : test/CMakeFiles/psztest_utils_cu.dir/clean

test/CMakeFiles/psztest_utils_cu.dir/depend:
	cd /pscratch/sd/s/swu264/sc25_interp/workspace_cuSZ-i/cusz-interp/build_balance && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /pscratch/sd/s/swu264/sc25_interp/workspace_cuSZ-i/cusz-interp /pscratch/sd/s/swu264/sc25_interp/workspace_cuSZ-i/cusz-interp/test /pscratch/sd/s/swu264/sc25_interp/workspace_cuSZ-i/cusz-interp/build_balance /pscratch/sd/s/swu264/sc25_interp/workspace_cuSZ-i/cusz-interp/build_balance/test /pscratch/sd/s/swu264/sc25_interp/workspace_cuSZ-i/cusz-interp/build_balance/test/CMakeFiles/psztest_utils_cu.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : test/CMakeFiles/psztest_utils_cu.dir/depend

