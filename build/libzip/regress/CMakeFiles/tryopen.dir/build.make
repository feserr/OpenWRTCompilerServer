# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 2.8

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list

# Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/fserrano/OpenWRTCompilerServer

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/fserrano/OpenWRTCompilerServer/build

# Include any dependencies generated for this target.
include libzip/regress/CMakeFiles/tryopen.dir/depend.make

# Include the progress variables for this target.
include libzip/regress/CMakeFiles/tryopen.dir/progress.make

# Include the compile flags for this target's objects.
include libzip/regress/CMakeFiles/tryopen.dir/flags.make

libzip/regress/CMakeFiles/tryopen.dir/tryopen.c.o: libzip/regress/CMakeFiles/tryopen.dir/flags.make
libzip/regress/CMakeFiles/tryopen.dir/tryopen.c.o: ../libzip/regress/tryopen.c
	$(CMAKE_COMMAND) -E cmake_progress_report /home/fserrano/OpenWRTCompilerServer/build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object libzip/regress/CMakeFiles/tryopen.dir/tryopen.c.o"
	cd /home/fserrano/OpenWRTCompilerServer/build/libzip/regress && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/tryopen.dir/tryopen.c.o   -c /home/fserrano/OpenWRTCompilerServer/libzip/regress/tryopen.c

libzip/regress/CMakeFiles/tryopen.dir/tryopen.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/tryopen.dir/tryopen.c.i"
	cd /home/fserrano/OpenWRTCompilerServer/build/libzip/regress && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -E /home/fserrano/OpenWRTCompilerServer/libzip/regress/tryopen.c > CMakeFiles/tryopen.dir/tryopen.c.i

libzip/regress/CMakeFiles/tryopen.dir/tryopen.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/tryopen.dir/tryopen.c.s"
	cd /home/fserrano/OpenWRTCompilerServer/build/libzip/regress && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -S /home/fserrano/OpenWRTCompilerServer/libzip/regress/tryopen.c -o CMakeFiles/tryopen.dir/tryopen.c.s

libzip/regress/CMakeFiles/tryopen.dir/tryopen.c.o.requires:
.PHONY : libzip/regress/CMakeFiles/tryopen.dir/tryopen.c.o.requires

libzip/regress/CMakeFiles/tryopen.dir/tryopen.c.o.provides: libzip/regress/CMakeFiles/tryopen.dir/tryopen.c.o.requires
	$(MAKE) -f libzip/regress/CMakeFiles/tryopen.dir/build.make libzip/regress/CMakeFiles/tryopen.dir/tryopen.c.o.provides.build
.PHONY : libzip/regress/CMakeFiles/tryopen.dir/tryopen.c.o.provides

libzip/regress/CMakeFiles/tryopen.dir/tryopen.c.o.provides.build: libzip/regress/CMakeFiles/tryopen.dir/tryopen.c.o

# Object files for target tryopen
tryopen_OBJECTS = \
"CMakeFiles/tryopen.dir/tryopen.c.o"

# External object files for target tryopen
tryopen_EXTERNAL_OBJECTS =

libzip/regress/tryopen: libzip/regress/CMakeFiles/tryopen.dir/tryopen.c.o
libzip/regress/tryopen: libzip/regress/CMakeFiles/tryopen.dir/build.make
libzip/regress/tryopen: libzip/lib/libzip.so.3.0
libzip/regress/tryopen: /usr/lib/x86_64-linux-gnu/libz.so
libzip/regress/tryopen: libzip/regress/CMakeFiles/tryopen.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking C executable tryopen"
	cd /home/fserrano/OpenWRTCompilerServer/build/libzip/regress && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/tryopen.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
libzip/regress/CMakeFiles/tryopen.dir/build: libzip/regress/tryopen
.PHONY : libzip/regress/CMakeFiles/tryopen.dir/build

libzip/regress/CMakeFiles/tryopen.dir/requires: libzip/regress/CMakeFiles/tryopen.dir/tryopen.c.o.requires
.PHONY : libzip/regress/CMakeFiles/tryopen.dir/requires

libzip/regress/CMakeFiles/tryopen.dir/clean:
	cd /home/fserrano/OpenWRTCompilerServer/build/libzip/regress && $(CMAKE_COMMAND) -P CMakeFiles/tryopen.dir/cmake_clean.cmake
.PHONY : libzip/regress/CMakeFiles/tryopen.dir/clean

libzip/regress/CMakeFiles/tryopen.dir/depend:
	cd /home/fserrano/OpenWRTCompilerServer/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/fserrano/OpenWRTCompilerServer /home/fserrano/OpenWRTCompilerServer/libzip/regress /home/fserrano/OpenWRTCompilerServer/build /home/fserrano/OpenWRTCompilerServer/build/libzip/regress /home/fserrano/OpenWRTCompilerServer/build/libzip/regress/CMakeFiles/tryopen.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : libzip/regress/CMakeFiles/tryopen.dir/depend
