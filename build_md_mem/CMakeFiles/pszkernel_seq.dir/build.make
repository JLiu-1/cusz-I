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
include CMakeFiles/pszkernel_seq.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/pszkernel_seq.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/pszkernel_seq.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/pszkernel_seq.dir/flags.make

CMakeFiles/pszkernel_seq.dir/src/kernel/l23.seq.cc.o: CMakeFiles/pszkernel_seq.dir/flags.make
CMakeFiles/pszkernel_seq.dir/src/kernel/l23.seq.cc.o: /pscratch/sd/s/swu264/sc25_interp/workspace_cuSZ-i/cusz-interp/src/kernel/l23.seq.cc
CMakeFiles/pszkernel_seq.dir/src/kernel/l23.seq.cc.o: CMakeFiles/pszkernel_seq.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/pscratch/sd/s/swu264/sc25_interp/workspace_cuSZ-i/cusz-interp/build_md_mem/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/pszkernel_seq.dir/src/kernel/l23.seq.cc.o"
	/opt/cray/pe/gcc/12.2.0/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/pszkernel_seq.dir/src/kernel/l23.seq.cc.o -MF CMakeFiles/pszkernel_seq.dir/src/kernel/l23.seq.cc.o.d -o CMakeFiles/pszkernel_seq.dir/src/kernel/l23.seq.cc.o -c /pscratch/sd/s/swu264/sc25_interp/workspace_cuSZ-i/cusz-interp/src/kernel/l23.seq.cc

CMakeFiles/pszkernel_seq.dir/src/kernel/l23.seq.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/pszkernel_seq.dir/src/kernel/l23.seq.cc.i"
	/opt/cray/pe/gcc/12.2.0/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /pscratch/sd/s/swu264/sc25_interp/workspace_cuSZ-i/cusz-interp/src/kernel/l23.seq.cc > CMakeFiles/pszkernel_seq.dir/src/kernel/l23.seq.cc.i

CMakeFiles/pszkernel_seq.dir/src/kernel/l23.seq.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/pszkernel_seq.dir/src/kernel/l23.seq.cc.s"
	/opt/cray/pe/gcc/12.2.0/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /pscratch/sd/s/swu264/sc25_interp/workspace_cuSZ-i/cusz-interp/src/kernel/l23.seq.cc -o CMakeFiles/pszkernel_seq.dir/src/kernel/l23.seq.cc.s

CMakeFiles/pszkernel_seq.dir/src/kernel/hist.seq.cc.o: CMakeFiles/pszkernel_seq.dir/flags.make
CMakeFiles/pszkernel_seq.dir/src/kernel/hist.seq.cc.o: /pscratch/sd/s/swu264/sc25_interp/workspace_cuSZ-i/cusz-interp/src/kernel/hist.seq.cc
CMakeFiles/pszkernel_seq.dir/src/kernel/hist.seq.cc.o: CMakeFiles/pszkernel_seq.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/pscratch/sd/s/swu264/sc25_interp/workspace_cuSZ-i/cusz-interp/build_md_mem/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/pszkernel_seq.dir/src/kernel/hist.seq.cc.o"
	/opt/cray/pe/gcc/12.2.0/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/pszkernel_seq.dir/src/kernel/hist.seq.cc.o -MF CMakeFiles/pszkernel_seq.dir/src/kernel/hist.seq.cc.o.d -o CMakeFiles/pszkernel_seq.dir/src/kernel/hist.seq.cc.o -c /pscratch/sd/s/swu264/sc25_interp/workspace_cuSZ-i/cusz-interp/src/kernel/hist.seq.cc

CMakeFiles/pszkernel_seq.dir/src/kernel/hist.seq.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/pszkernel_seq.dir/src/kernel/hist.seq.cc.i"
	/opt/cray/pe/gcc/12.2.0/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /pscratch/sd/s/swu264/sc25_interp/workspace_cuSZ-i/cusz-interp/src/kernel/hist.seq.cc > CMakeFiles/pszkernel_seq.dir/src/kernel/hist.seq.cc.i

CMakeFiles/pszkernel_seq.dir/src/kernel/hist.seq.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/pszkernel_seq.dir/src/kernel/hist.seq.cc.s"
	/opt/cray/pe/gcc/12.2.0/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /pscratch/sd/s/swu264/sc25_interp/workspace_cuSZ-i/cusz-interp/src/kernel/hist.seq.cc -o CMakeFiles/pszkernel_seq.dir/src/kernel/hist.seq.cc.s

CMakeFiles/pszkernel_seq.dir/src/kernel/histsp.seq.cc.o: CMakeFiles/pszkernel_seq.dir/flags.make
CMakeFiles/pszkernel_seq.dir/src/kernel/histsp.seq.cc.o: /pscratch/sd/s/swu264/sc25_interp/workspace_cuSZ-i/cusz-interp/src/kernel/histsp.seq.cc
CMakeFiles/pszkernel_seq.dir/src/kernel/histsp.seq.cc.o: CMakeFiles/pszkernel_seq.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/pscratch/sd/s/swu264/sc25_interp/workspace_cuSZ-i/cusz-interp/build_md_mem/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object CMakeFiles/pszkernel_seq.dir/src/kernel/histsp.seq.cc.o"
	/opt/cray/pe/gcc/12.2.0/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/pszkernel_seq.dir/src/kernel/histsp.seq.cc.o -MF CMakeFiles/pszkernel_seq.dir/src/kernel/histsp.seq.cc.o.d -o CMakeFiles/pszkernel_seq.dir/src/kernel/histsp.seq.cc.o -c /pscratch/sd/s/swu264/sc25_interp/workspace_cuSZ-i/cusz-interp/src/kernel/histsp.seq.cc

CMakeFiles/pszkernel_seq.dir/src/kernel/histsp.seq.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/pszkernel_seq.dir/src/kernel/histsp.seq.cc.i"
	/opt/cray/pe/gcc/12.2.0/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /pscratch/sd/s/swu264/sc25_interp/workspace_cuSZ-i/cusz-interp/src/kernel/histsp.seq.cc > CMakeFiles/pszkernel_seq.dir/src/kernel/histsp.seq.cc.i

CMakeFiles/pszkernel_seq.dir/src/kernel/histsp.seq.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/pszkernel_seq.dir/src/kernel/histsp.seq.cc.s"
	/opt/cray/pe/gcc/12.2.0/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /pscratch/sd/s/swu264/sc25_interp/workspace_cuSZ-i/cusz-interp/src/kernel/histsp.seq.cc -o CMakeFiles/pszkernel_seq.dir/src/kernel/histsp.seq.cc.s

CMakeFiles/pszkernel_seq.dir/src/kernel/spvn.seq.cc.o: CMakeFiles/pszkernel_seq.dir/flags.make
CMakeFiles/pszkernel_seq.dir/src/kernel/spvn.seq.cc.o: /pscratch/sd/s/swu264/sc25_interp/workspace_cuSZ-i/cusz-interp/src/kernel/spvn.seq.cc
CMakeFiles/pszkernel_seq.dir/src/kernel/spvn.seq.cc.o: CMakeFiles/pszkernel_seq.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/pscratch/sd/s/swu264/sc25_interp/workspace_cuSZ-i/cusz-interp/build_md_mem/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object CMakeFiles/pszkernel_seq.dir/src/kernel/spvn.seq.cc.o"
	/opt/cray/pe/gcc/12.2.0/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/pszkernel_seq.dir/src/kernel/spvn.seq.cc.o -MF CMakeFiles/pszkernel_seq.dir/src/kernel/spvn.seq.cc.o.d -o CMakeFiles/pszkernel_seq.dir/src/kernel/spvn.seq.cc.o -c /pscratch/sd/s/swu264/sc25_interp/workspace_cuSZ-i/cusz-interp/src/kernel/spvn.seq.cc

CMakeFiles/pszkernel_seq.dir/src/kernel/spvn.seq.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/pszkernel_seq.dir/src/kernel/spvn.seq.cc.i"
	/opt/cray/pe/gcc/12.2.0/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /pscratch/sd/s/swu264/sc25_interp/workspace_cuSZ-i/cusz-interp/src/kernel/spvn.seq.cc > CMakeFiles/pszkernel_seq.dir/src/kernel/spvn.seq.cc.i

CMakeFiles/pszkernel_seq.dir/src/kernel/spvn.seq.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/pszkernel_seq.dir/src/kernel/spvn.seq.cc.s"
	/opt/cray/pe/gcc/12.2.0/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /pscratch/sd/s/swu264/sc25_interp/workspace_cuSZ-i/cusz-interp/src/kernel/spvn.seq.cc -o CMakeFiles/pszkernel_seq.dir/src/kernel/spvn.seq.cc.s

# Object files for target pszkernel_seq
pszkernel_seq_OBJECTS = \
"CMakeFiles/pszkernel_seq.dir/src/kernel/l23.seq.cc.o" \
"CMakeFiles/pszkernel_seq.dir/src/kernel/hist.seq.cc.o" \
"CMakeFiles/pszkernel_seq.dir/src/kernel/histsp.seq.cc.o" \
"CMakeFiles/pszkernel_seq.dir/src/kernel/spvn.seq.cc.o"

# External object files for target pszkernel_seq
pszkernel_seq_EXTERNAL_OBJECTS =

libpszkernel_seq.so: CMakeFiles/pszkernel_seq.dir/src/kernel/l23.seq.cc.o
libpszkernel_seq.so: CMakeFiles/pszkernel_seq.dir/src/kernel/hist.seq.cc.o
libpszkernel_seq.so: CMakeFiles/pszkernel_seq.dir/src/kernel/histsp.seq.cc.o
libpszkernel_seq.so: CMakeFiles/pszkernel_seq.dir/src/kernel/spvn.seq.cc.o
libpszkernel_seq.so: CMakeFiles/pszkernel_seq.dir/build.make
libpszkernel_seq.so: CMakeFiles/pszkernel_seq.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir=/pscratch/sd/s/swu264/sc25_interp/workspace_cuSZ-i/cusz-interp/build_md_mem/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Linking CXX shared library libpszkernel_seq.so"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/pszkernel_seq.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/pszkernel_seq.dir/build: libpszkernel_seq.so
.PHONY : CMakeFiles/pszkernel_seq.dir/build

CMakeFiles/pszkernel_seq.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/pszkernel_seq.dir/cmake_clean.cmake
.PHONY : CMakeFiles/pszkernel_seq.dir/clean

CMakeFiles/pszkernel_seq.dir/depend:
	cd /pscratch/sd/s/swu264/sc25_interp/workspace_cuSZ-i/cusz-interp/build_md_mem && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /pscratch/sd/s/swu264/sc25_interp/workspace_cuSZ-i/cusz-interp /pscratch/sd/s/swu264/sc25_interp/workspace_cuSZ-i/cusz-interp /pscratch/sd/s/swu264/sc25_interp/workspace_cuSZ-i/cusz-interp/build_md_mem /pscratch/sd/s/swu264/sc25_interp/workspace_cuSZ-i/cusz-interp/build_md_mem /pscratch/sd/s/swu264/sc25_interp/workspace_cuSZ-i/cusz-interp/build_md_mem/CMakeFiles/pszkernel_seq.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : CMakeFiles/pszkernel_seq.dir/depend

