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
include libzip/src/CMakeFiles/zipcmp.dir/depend.make

# Include the progress variables for this target.
include libzip/src/CMakeFiles/zipcmp.dir/progress.make

# Include the compile flags for this target's objects.
include libzip/src/CMakeFiles/zipcmp.dir/flags.make

libzip/src/CMakeFiles/zipcmp.dir/zipcmp.c.o: libzip/src/CMakeFiles/zipcmp.dir/flags.make
libzip/src/CMakeFiles/zipcmp.dir/zipcmp.c.o: ../libzip/src/zipcmp.c
	$(CMAKE_COMMAND) -E cmake_progress_report /home/fserrano/OpenWRTCompilerServer/build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object libzip/src/CMakeFiles/zipcmp.dir/zipcmp.c.o"
	cd /home/fserrano/OpenWRTCompilerServer/build/libzip/src && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/zipcmp.dir/zipcmp.c.o   -c /home/fserrano/OpenWRTCompilerServer/libzip/src/zipcmp.c

libzip/src/CMakeFiles/zipcmp.dir/zipcmp.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/zipcmp.dir/zipcmp.c.i"
	cd /home/fserrano/OpenWRTCompilerServer/build/libzip/src && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -E /home/fserrano/OpenWRTCompilerServer/libzip/src/zipcmp.c > CMakeFiles/zipcmp.dir/zipcmp.c.i

libzip/src/CMakeFiles/zipcmp.dir/zipcmp.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/zipcmp.dir/zipcmp.c.s"
	cd /home/fserrano/OpenWRTCompilerServer/build/libzip/src && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -S /home/fserrano/OpenWRTCompilerServer/libzip/src/zipcmp.c -o CMakeFiles/zipcmp.dir/zipcmp.c.s

libzip/src/CMakeFiles/zipcmp.dir/zipcmp.c.o.requires:
.PHONY : libzip/src/CMakeFiles/zipcmp.dir/zipcmp.c.o.requires

libzip/src/CMakeFiles/zipcmp.dir/zipcmp.c.o.provides: libzip/src/CMakeFiles/zipcmp.dir/zipcmp.c.o.requires
	$(MAKE) -f libzip/src/CMakeFiles/zipcmp.dir/build.make libzip/src/CMakeFiles/zipcmp.dir/zipcmp.c.o.provides.build
.PHONY : libzip/src/CMakeFiles/zipcmp.dir/zipcmp.c.o.provides

libzip/src/CMakeFiles/zipcmp.dir/zipcmp.c.o.provides.build: libzip/src/CMakeFiles/zipcmp.dir/zipcmp.c.o

# Object files for target zipcmp
zipcmp_OBJECTS = \
"CMakeFiles/zipcmp.dir/zipcmp.c.o"

# External object files for target zipcmp
zipcmp_EXTERNAL_OBJECTS =

libzip/src/zipcmp: libzip/src/CMakeFiles/zipcmp.dir/zipcmp.c.o
libzip/src/zipcmp: libzip/src/CMakeFiles/zipcmp.dir/build.make
libzip/src/zipcmp: libzip/lib/libzip.so.3.0
libzip/src/zipcmp: /usr/lib/x86_64-linux-gnu/libz.so
libzip/src/zipcmp: libzip/src/CMakeFiles/zipcmp.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking C executable zipcmp"
	cd /home/fserrano/OpenWRTCompilerServer/build/libzip/src && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/zipcmp.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
libzip/src/CMakeFiles/zipcmp.dir/build: libzip/src/zipcmp
.PHONY : libzip/src/CMakeFiles/zipcmp.dir/build

libzip/src/CMakeFiles/zipcmp.dir/requires: libzip/src/CMakeFiles/zipcmp.dir/zipcmp.c.o.requires
.PHONY : libzip/src/CMakeFiles/zipcmp.dir/requires

libzip/src/CMakeFiles/zipcmp.dir/clean:
	cd /home/fserrano/OpenWRTCompilerServer/build/libzip/src && $(CMAKE_COMMAND) -P CMakeFiles/zipcmp.dir/cmake_clean.cmake
.PHONY : libzip/src/CMakeFiles/zipcmp.dir/clean

libzip/src/CMakeFiles/zipcmp.dir/depend:
	cd /home/fserrano/OpenWRTCompilerServer/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/fserrano/OpenWRTCompilerServer /home/fserrano/OpenWRTCompilerServer/libzip/src /home/fserrano/OpenWRTCompilerServer/build /home/fserrano/OpenWRTCompilerServer/build/libzip/src /home/fserrano/OpenWRTCompilerServer/build/libzip/src/CMakeFiles/zipcmp.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : libzip/src/CMakeFiles/zipcmp.dir/depend

