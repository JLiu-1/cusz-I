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
include CMakeFiles/psztime.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/psztime.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/psztime.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/psztime.dir/flags.make

CMakeFiles/psztime.dir/src/utils/timer_cpu.cc.o: CMakeFiles/psztime.dir/flags.make
CMakeFiles/psztime.dir/src/utils/timer_cpu.cc.o: /pscratch/sd/s/swu264/sc25_interp/workspace_cuSZ-i/cusz-interp/src/utils/timer_cpu.cc
CMakeFiles/psztime.dir/src/utils/timer_cpu.cc.o: CMakeFiles/psztime.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/pscratch/sd/s/swu264/sc25_interp/workspace_cuSZ-i/cusz-interp/build_md_mem/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/psztime.dir/src/utils/timer_cpu.cc.o"
	/opt/cray/pe/gcc/12.2.0/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/psztime.dir/src/utils/timer_cpu.cc.o -MF CMakeFiles/psztime.dir/src/utils/timer_cpu.cc.o.d -o CMakeFiles/psztime.dir/src/utils/timer_cpu.cc.o -c /pscratch/sd/s/swu264/sc25_interp/workspace_cuSZ-i/cusz-interp/src/utils/timer_cpu.cc

CMakeFiles/psztime.dir/src/utils/timer_cpu.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/psztime.dir/src/utils/timer_cpu.cc.i"
	/opt/cray/pe/gcc/12.2.0/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /pscratch/sd/s/swu264/sc25_interp/workspace_cuSZ-i/cusz-interp/src/utils/timer_cpu.cc > CMakeFiles/psztime.dir/src/utils/timer_cpu.cc.i

CMakeFiles/psztime.dir/src/utils/timer_cpu.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/psztime.dir/src/utils/timer_cpu.cc.s"
	/opt/cray/pe/gcc/12.2.0/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /pscratch/sd/s/swu264/sc25_interp/workspace_cuSZ-i/cusz-interp/src/utils/timer_cpu.cc -o CMakeFiles/psztime.dir/src/utils/timer_cpu.cc.s

CMakeFiles/psztime.dir/src/utils/timer_gpu.cc.o: CMakeFiles/psztime.dir/flags.make
CMakeFiles/psztime.dir/src/utils/timer_gpu.cc.o: /pscratch/sd/s/swu264/sc25_interp/workspace_cuSZ-i/cusz-interp/src/utils/timer_gpu.cc
CMakeFiles/psztime.dir/src/utils/timer_gpu.cc.o: CMakeFiles/psztime.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/pscratch/sd/s/swu264/sc25_interp/workspace_cuSZ-i/cusz-interp/build_md_mem/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/psztime.dir/src/utils/timer_gpu.cc.o"
	/opt/cray/pe/gcc/12.2.0/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/psztime.dir/src/utils/timer_gpu.cc.o -MF CMakeFiles/psztime.dir/src/utils/timer_gpu.cc.o.d -o CMakeFiles/psztime.dir/src/utils/timer_gpu.cc.o -c /pscratch/sd/s/swu264/sc25_interp/workspace_cuSZ-i/cusz-interp/src/utils/timer_gpu.cc

CMakeFiles/psztime.dir/src/utils/timer_gpu.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/psztime.dir/src/utils/timer_gpu.cc.i"
	/opt/cray/pe/gcc/12.2.0/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /pscratch/sd/s/swu264/sc25_interp/workspace_cuSZ-i/cusz-interp/src/utils/timer_gpu.cc > CMakeFiles/psztime.dir/src/utils/timer_gpu.cc.i

CMakeFiles/psztime.dir/src/utils/timer_gpu.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/psztime.dir/src/utils/timer_gpu.cc.s"
	/opt/cray/pe/gcc/12.2.0/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /pscratch/sd/s/swu264/sc25_interp/workspace_cuSZ-i/cusz-interp/src/utils/timer_gpu.cc -o CMakeFiles/psztime.dir/src/utils/timer_gpu.cc.s

# Object files for target psztime
psztime_OBJECTS = \
"CMakeFiles/psztime.dir/src/utils/timer_cpu.cc.o" \
"CMakeFiles/psztime.dir/src/utils/timer_gpu.cc.o"

# External object files for target psztime
psztime_EXTERNAL_OBJECTS =

libpsztime.so: CMakeFiles/psztime.dir/src/utils/timer_cpu.cc.o
libpsztime.so: CMakeFiles/psztime.dir/src/utils/timer_gpu.cc.o
libpsztime.so: CMakeFiles/psztime.dir/build.make
libpsztime.so: /opt/nvidia/hpc_sdk/Linux_x86_64/24.5/cuda/12.4/targets/x86_64-linux/lib/libcudart.so
libpsztime.so: /usr/lib64/librt.so
libpsztime.so: CMakeFiles/psztime.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir=/pscratch/sd/s/swu264/sc25_interp/workspace_cuSZ-i/cusz-interp/build_md_mem/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking CXX shared library libpsztime.so"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/psztime.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/psztime.dir/build: libpsztime.so
.PHONY : CMakeFiles/psztime.dir/build

CMakeFiles/psztime.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/psztime.dir/cmake_clean.cmake
.PHONY : CMakeFiles/psztime.dir/clean

CMakeFiles/psztime.dir/depend:
	cd /pscratch/sd/s/swu264/sc25_interp/workspace_cuSZ-i/cusz-interp/build_md_mem && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /pscratch/sd/s/swu264/sc25_interp/workspace_cuSZ-i/cusz-interp /pscratch/sd/s/swu264/sc25_interp/workspace_cuSZ-i/cusz-interp /pscratch/sd/s/swu264/sc25_interp/workspace_cuSZ-i/cusz-interp/build_md_mem /pscratch/sd/s/swu264/sc25_interp/workspace_cuSZ-i/cusz-interp/build_md_mem /pscratch/sd/s/swu264/sc25_interp/workspace_cuSZ-i/cusz-interp/build_md_mem/CMakeFiles/psztime.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : CMakeFiles/psztime.dir/depend

