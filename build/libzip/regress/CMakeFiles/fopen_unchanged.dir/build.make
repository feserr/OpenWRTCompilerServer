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
include libzip/regress/CMakeFiles/fopen_unchanged.dir/depend.make

# Include the progress variables for this target.
include libzip/regress/CMakeFiles/fopen_unchanged.dir/progress.make

# Include the compile flags for this target's objects.
include libzip/regress/CMakeFiles/fopen_unchanged.dir/flags.make

libzip/regress/CMakeFiles/fopen_unchanged.dir/fopen_unchanged.c.o: libzip/regress/CMakeFiles/fopen_unchanged.dir/flags.make
libzip/regress/CMakeFiles/fopen_unchanged.dir/fopen_unchanged.c.o: ../libzip/regress/fopen_unchanged.c
	$(CMAKE_COMMAND) -E cmake_progress_report /home/fserrano/OpenWRTCompilerServer/build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object libzip/regress/CMakeFiles/fopen_unchanged.dir/fopen_unchanged.c.o"
	cd /home/fserrano/OpenWRTCompilerServer/build/libzip/regress && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/fopen_unchanged.dir/fopen_unchanged.c.o   -c /home/fserrano/OpenWRTCompilerServer/libzip/regress/fopen_unchanged.c

libzip/regress/CMakeFiles/fopen_unchanged.dir/fopen_unchanged.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/fopen_unchanged.dir/fopen_unchanged.c.i"
	cd /home/fserrano/OpenWRTCompilerServer/build/libzip/regress && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -E /home/fserrano/OpenWRTCompilerServer/libzip/regress/fopen_unchanged.c > CMakeFiles/fopen_unchanged.dir/fopen_unchanged.c.i

libzip/regress/CMakeFiles/fopen_unchanged.dir/fopen_unchanged.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/fopen_unchanged.dir/fopen_unchanged.c.s"
	cd /home/fserrano/OpenWRTCompilerServer/build/libzip/regress && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -S /home/fserrano/OpenWRTCompilerServer/libzip/regress/fopen_unchanged.c -o CMakeFiles/fopen_unchanged.dir/fopen_unchanged.c.s

libzip/regress/CMakeFiles/fopen_unchanged.dir/fopen_unchanged.c.o.requires:
.PHONY : libzip/regress/CMakeFiles/fopen_unchanged.dir/fopen_unchanged.c.o.requires

libzip/regress/CMakeFiles/fopen_unchanged.dir/fopen_unchanged.c.o.provides: libzip/regress/CMakeFiles/fopen_unchanged.dir/fopen_unchanged.c.o.requires
	$(MAKE) -f libzip/regress/CMakeFiles/fopen_unchanged.dir/build.make libzip/regress/CMakeFiles/fopen_unchanged.dir/fopen_unchanged.c.o.provides.build
.PHONY : libzip/regress/CMakeFiles/fopen_unchanged.dir/fopen_unchanged.c.o.provides

libzip/regress/CMakeFiles/fopen_unchanged.dir/fopen_unchanged.c.o.provides.build: libzip/regress/CMakeFiles/fopen_unchanged.dir/fopen_unchanged.c.o

# Object files for target fopen_unchanged
fopen_unchanged_OBJECTS = \
"CMakeFiles/fopen_unchanged.dir/fopen_unchanged.c.o"

# External object files for target fopen_unchanged
fopen_unchanged_EXTERNAL_OBJECTS =

libzip/regress/fopen_unchanged: libzip/regress/CMakeFiles/fopen_unchanged.dir/fopen_unchanged.c.o
libzip/regress/fopen_unchanged: libzip/regress/CMakeFiles/fopen_unchanged.dir/build.make
libzip/regress/fopen_unchanged: libzip/lib/libzip.so.3.0
libzip/regress/fopen_unchanged: /usr/lib/x86_64-linux-gnu/libz.so
libzip/regress/fopen_unchanged: libzip/regress/CMakeFiles/fopen_unchanged.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking C executable fopen_unchanged"
	cd /home/fserrano/OpenWRTCompilerServer/build/libzip/regress && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/fopen_unchanged.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
libzip/regress/CMakeFiles/fopen_unchanged.dir/build: libzip/regress/fopen_unchanged
.PHONY : libzip/regress/CMakeFiles/fopen_unchanged.dir/build

libzip/regress/CMakeFiles/fopen_unchanged.dir/requires: libzip/regress/CMakeFiles/fopen_unchanged.dir/fopen_unchanged.c.o.requires
.PHONY : libzip/regress/CMakeFiles/fopen_unchanged.dir/requires

libzip/regress/CMakeFiles/fopen_unchanged.dir/clean:
	cd /home/fserrano/OpenWRTCompilerServer/build/libzip/regress && $(CMAKE_COMMAND) -P CMakeFiles/fopen_unchanged.dir/cmake_clean.cmake
.PHONY : libzip/regress/CMakeFiles/fopen_unchanged.dir/clean

libzip/regress/CMakeFiles/fopen_unchanged.dir/depend:
	cd /home/fserrano/OpenWRTCompilerServer/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/fserrano/OpenWRTCompilerServer /home/fserrano/OpenWRTCompilerServer/libzip/regress /home/fserrano/OpenWRTCompilerServer/build /home/fserrano/OpenWRTCompilerServer/build/libzip/regress /home/fserrano/OpenWRTCompilerServer/build/libzip/regress/CMakeFiles/fopen_unchanged.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : libzip/regress/CMakeFiles/fopen_unchanged.dir/depend

