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
include CMakeFiles/pszstat_seq.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/pszstat_seq.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/pszstat_seq.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/pszstat_seq.dir/flags.make

CMakeFiles/pszstat_seq.dir/src/stat/compare.stl.cc.o: CMakeFiles/pszstat_seq.dir/flags.make
CMakeFiles/pszstat_seq.dir/src/stat/compare.stl.cc.o: /pscratch/sd/s/swu264/sc25_interp/workspace_cuSZ-i/cusz-interp/src/stat/compare.stl.cc
CMakeFiles/pszstat_seq.dir/src/stat/compare.stl.cc.o: CMakeFiles/pszstat_seq.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/pscratch/sd/s/swu264/sc25_interp/workspace_cuSZ-i/cusz-interp/build_md_mem/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/pszstat_seq.dir/src/stat/compare.stl.cc.o"
	/opt/cray/pe/gcc/12.2.0/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/pszstat_seq.dir/src/stat/compare.stl.cc.o -MF CMakeFiles/pszstat_seq.dir/src/stat/compare.stl.cc.o.d -o CMakeFiles/pszstat_seq.dir/src/stat/compare.stl.cc.o -c /pscratch/sd/s/swu264/sc25_interp/workspace_cuSZ-i/cusz-interp/src/stat/compare.stl.cc

CMakeFiles/pszstat_seq.dir/src/stat/compare.stl.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/pszstat_seq.dir/src/stat/compare.stl.cc.i"
	/opt/cray/pe/gcc/12.2.0/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /pscratch/sd/s/swu264/sc25_interp/workspace_cuSZ-i/cusz-interp/src/stat/compare.stl.cc > CMakeFiles/pszstat_seq.dir/src/stat/compare.stl.cc.i

CMakeFiles/pszstat_seq.dir/src/stat/compare.stl.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/pszstat_seq.dir/src/stat/compare.stl.cc.s"
	/opt/cray/pe/gcc/12.2.0/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /pscratch/sd/s/swu264/sc25_interp/workspace_cuSZ-i/cusz-interp/src/stat/compare.stl.cc -o CMakeFiles/pszstat_seq.dir/src/stat/compare.stl.cc.s

# Object files for target pszstat_seq
pszstat_seq_OBJECTS = \
"CMakeFiles/pszstat_seq.dir/src/stat/compare.stl.cc.o"

# External object files for target pszstat_seq
pszstat_seq_EXTERNAL_OBJECTS =

libpszstat_seq.so: CMakeFiles/pszstat_seq.dir/src/stat/compare.stl.cc.o
libpszstat_seq.so: CMakeFiles/pszstat_seq.dir/build.make
libpszstat_seq.so: CMakeFiles/pszstat_seq.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir=/pscratch/sd/s/swu264/sc25_interp/workspace_cuSZ-i/cusz-interp/build_md_mem/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX shared library libpszstat_seq.so"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/pszstat_seq.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/pszstat_seq.dir/build: libpszstat_seq.so
.PHONY : CMakeFiles/pszstat_seq.dir/build

CMakeFiles/pszstat_seq.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/pszstat_seq.dir/cmake_clean.cmake
.PHONY : CMakeFiles/pszstat_seq.dir/clean

CMakeFiles/pszstat_seq.dir/depend:
	cd /pscratch/sd/s/swu264/sc25_interp/workspace_cuSZ-i/cusz-interp/build_md_mem && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /pscratch/sd/s/swu264/sc25_interp/workspace_cuSZ-i/cusz-interp /pscratch/sd/s/swu264/sc25_interp/workspace_cuSZ-i/cusz-interp /pscratch/sd/s/swu264/sc25_interp/workspace_cuSZ-i/cusz-interp/build_md_mem /pscratch/sd/s/swu264/sc25_interp/workspace_cuSZ-i/cusz-interp/build_md_mem /pscratch/sd/s/swu264/sc25_interp/workspace_cuSZ-i/cusz-interp/build_md_mem/CMakeFiles/pszstat_seq.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : CMakeFiles/pszstat_seq.dir/depend

