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
include CMakeFiles/pszutils_seq.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/pszutils_seq.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/pszutils_seq.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/pszutils_seq.dir/flags.make

CMakeFiles/pszutils_seq.dir/src/utils/vis_stat.cc.o: CMakeFiles/pszutils_seq.dir/flags.make
CMakeFiles/pszutils_seq.dir/src/utils/vis_stat.cc.o: /pscratch/sd/s/swu264/sc25_interp/workspace_cuSZ-i/cusz-interp/src/utils/vis_stat.cc
CMakeFiles/pszutils_seq.dir/src/utils/vis_stat.cc.o: CMakeFiles/pszutils_seq.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/pscratch/sd/s/swu264/sc25_interp/workspace_cuSZ-i/cusz-interp/build_md_mem/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/pszutils_seq.dir/src/utils/vis_stat.cc.o"
	/opt/cray/pe/gcc/12.2.0/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/pszutils_seq.dir/src/utils/vis_stat.cc.o -MF CMakeFiles/pszutils_seq.dir/src/utils/vis_stat.cc.o.d -o CMakeFiles/pszutils_seq.dir/src/utils/vis_stat.cc.o -c /pscratch/sd/s/swu264/sc25_interp/workspace_cuSZ-i/cusz-interp/src/utils/vis_stat.cc

CMakeFiles/pszutils_seq.dir/src/utils/vis_stat.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/pszutils_seq.dir/src/utils/vis_stat.cc.i"
	/opt/cray/pe/gcc/12.2.0/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /pscratch/sd/s/swu264/sc25_interp/workspace_cuSZ-i/cusz-interp/src/utils/vis_stat.cc > CMakeFiles/pszutils_seq.dir/src/utils/vis_stat.cc.i

CMakeFiles/pszutils_seq.dir/src/utils/vis_stat.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/pszutils_seq.dir/src/utils/vis_stat.cc.s"
	/opt/cray/pe/gcc/12.2.0/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /pscratch/sd/s/swu264/sc25_interp/workspace_cuSZ-i/cusz-interp/src/utils/vis_stat.cc -o CMakeFiles/pszutils_seq.dir/src/utils/vis_stat.cc.s

CMakeFiles/pszutils_seq.dir/src/context.cc.o: CMakeFiles/pszutils_seq.dir/flags.make
CMakeFiles/pszutils_seq.dir/src/context.cc.o: /pscratch/sd/s/swu264/sc25_interp/workspace_cuSZ-i/cusz-interp/src/context.cc
CMakeFiles/pszutils_seq.dir/src/context.cc.o: CMakeFiles/pszutils_seq.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/pscratch/sd/s/swu264/sc25_interp/workspace_cuSZ-i/cusz-interp/build_md_mem/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/pszutils_seq.dir/src/context.cc.o"
	/opt/cray/pe/gcc/12.2.0/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/pszutils_seq.dir/src/context.cc.o -MF CMakeFiles/pszutils_seq.dir/src/context.cc.o.d -o CMakeFiles/pszutils_seq.dir/src/context.cc.o -c /pscratch/sd/s/swu264/sc25_interp/workspace_cuSZ-i/cusz-interp/src/context.cc

CMakeFiles/pszutils_seq.dir/src/context.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/pszutils_seq.dir/src/context.cc.i"
	/opt/cray/pe/gcc/12.2.0/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /pscratch/sd/s/swu264/sc25_interp/workspace_cuSZ-i/cusz-interp/src/context.cc > CMakeFiles/pszutils_seq.dir/src/context.cc.i

CMakeFiles/pszutils_seq.dir/src/context.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/pszutils_seq.dir/src/context.cc.s"
	/opt/cray/pe/gcc/12.2.0/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /pscratch/sd/s/swu264/sc25_interp/workspace_cuSZ-i/cusz-interp/src/context.cc -o CMakeFiles/pszutils_seq.dir/src/context.cc.s

# Object files for target pszutils_seq
pszutils_seq_OBJECTS = \
"CMakeFiles/pszutils_seq.dir/src/utils/vis_stat.cc.o" \
"CMakeFiles/pszutils_seq.dir/src/context.cc.o"

# External object files for target pszutils_seq
pszutils_seq_EXTERNAL_OBJECTS =

libpszutils_seq.so: CMakeFiles/pszutils_seq.dir/src/utils/vis_stat.cc.o
libpszutils_seq.so: CMakeFiles/pszutils_seq.dir/src/context.cc.o
libpszutils_seq.so: CMakeFiles/pszutils_seq.dir/build.make
libpszutils_seq.so: CMakeFiles/pszutils_seq.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir=/pscratch/sd/s/swu264/sc25_interp/workspace_cuSZ-i/cusz-interp/build_md_mem/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking CXX shared library libpszutils_seq.so"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/pszutils_seq.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/pszutils_seq.dir/build: libpszutils_seq.so
.PHONY : CMakeFiles/pszutils_seq.dir/build

CMakeFiles/pszutils_seq.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/pszutils_seq.dir/cmake_clean.cmake
.PHONY : CMakeFiles/pszutils_seq.dir/clean

CMakeFiles/pszutils_seq.dir/depend:
	cd /pscratch/sd/s/swu264/sc25_interp/workspace_cuSZ-i/cusz-interp/build_md_mem && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /pscratch/sd/s/swu264/sc25_interp/workspace_cuSZ-i/cusz-interp /pscratch/sd/s/swu264/sc25_interp/workspace_cuSZ-i/cusz-interp /pscratch/sd/s/swu264/sc25_interp/workspace_cuSZ-i/cusz-interp/build_md_mem /pscratch/sd/s/swu264/sc25_interp/workspace_cuSZ-i/cusz-interp/build_md_mem /pscratch/sd/s/swu264/sc25_interp/workspace_cuSZ-i/cusz-interp/build_md_mem/CMakeFiles/pszutils_seq.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : CMakeFiles/pszutils_seq.dir/depend

