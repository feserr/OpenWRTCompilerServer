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
include libzip/regress/CMakeFiles/fread.dir/depend.make

# Include the progress variables for this target.
include libzip/regress/CMakeFiles/fread.dir/progress.make

# Include the compile flags for this target's objects.
include libzip/regress/CMakeFiles/fread.dir/flags.make

libzip/regress/CMakeFiles/fread.dir/fread.c.o: libzip/regress/CMakeFiles/fread.dir/flags.make
libzip/regress/CMakeFiles/fread.dir/fread.c.o: ../libzip/regress/fread.c
	$(CMAKE_COMMAND) -E cmake_progress_report /home/fserrano/OpenWRTCompilerServer/build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object libzip/regress/CMakeFiles/fread.dir/fread.c.o"
	cd /home/fserrano/OpenWRTCompilerServer/build/libzip/regress && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/fread.dir/fread.c.o   -c /home/fserrano/OpenWRTCompilerServer/libzip/regress/fread.c

libzip/regress/CMakeFiles/fread.dir/fread.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/fread.dir/fread.c.i"
	cd /home/fserrano/OpenWRTCompilerServer/build/libzip/regress && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -E /home/fserrano/OpenWRTCompilerServer/libzip/regress/fread.c > CMakeFiles/fread.dir/fread.c.i

libzip/regress/CMakeFiles/fread.dir/fread.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/fread.dir/fread.c.s"
	cd /home/fserrano/OpenWRTCompilerServer/build/libzip/regress && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -S /home/fserrano/OpenWRTCompilerServer/libzip/regress/fread.c -o CMakeFiles/fread.dir/fread.c.s

libzip/regress/CMakeFiles/fread.dir/fread.c.o.requires:
.PHONY : libzip/regress/CMakeFiles/fread.dir/fread.c.o.requires

libzip/regress/CMakeFiles/fread.dir/fread.c.o.provides: libzip/regress/CMakeFiles/fread.dir/fread.c.o.requires
	$(MAKE) -f libzip/regress/CMakeFiles/fread.dir/build.make libzip/regress/CMakeFiles/fread.dir/fread.c.o.provides.build
.PHONY : libzip/regress/CMakeFiles/fread.dir/fread.c.o.provides

libzip/regress/CMakeFiles/fread.dir/fread.c.o.provides.build: libzip/regress/CMakeFiles/fread.dir/fread.c.o

# Object files for target fread
fread_OBJECTS = \
"CMakeFiles/fread.dir/fread.c.o"

# External object files for target fread
fread_EXTERNAL_OBJECTS =

libzip/regress/fread: libzip/regress/CMakeFiles/fread.dir/fread.c.o
libzip/regress/fread: libzip/regress/CMakeFiles/fread.dir/build.make
libzip/regress/fread: libzip/lib/libzip.so.3.0
libzip/regress/fread: /usr/lib/x86_64-linux-gnu/libz.so
libzip/regress/fread: libzip/regress/CMakeFiles/fread.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking C executable fread"
	cd /home/fserrano/OpenWRTCompilerServer/build/libzip/regress && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/fread.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
libzip/regress/CMakeFiles/fread.dir/build: libzip/regress/fread
.PHONY : libzip/regress/CMakeFiles/fread.dir/build

libzip/regress/CMakeFiles/fread.dir/requires: libzip/regress/CMakeFiles/fread.dir/fread.c.o.requires
.PHONY : libzip/regress/CMakeFiles/fread.dir/requires

libzip/regress/CMakeFiles/fread.dir/clean:
	cd /home/fserrano/OpenWRTCompilerServer/build/libzip/regress && $(CMAKE_COMMAND) -P CMakeFiles/fread.dir/cmake_clean.cmake
.PHONY : libzip/regress/CMakeFiles/fread.dir/clean

libzip/regress/CMakeFiles/fread.dir/depend:
	cd /home/fserrano/OpenWRTCompilerServer/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/fserrano/OpenWRTCompilerServer /home/fserrano/OpenWRTCompilerServer/libzip/regress /home/fserrano/OpenWRTCompilerServer/build /home/fserrano/OpenWRTCompilerServer/build/libzip/regress /home/fserrano/OpenWRTCompilerServer/build/libzip/regress/CMakeFiles/fread.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : libzip/regress/CMakeFiles/fread.dir/depend
