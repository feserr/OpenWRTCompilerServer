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
CMAKE_SOURCE_DIR = /home/fserrano/libzip

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/fserrano/libzip/build

# Include any dependencies generated for this target.
include regress/CMakeFiles/fread.dir/depend.make

# Include the progress variables for this target.
include regress/CMakeFiles/fread.dir/progress.make

# Include the compile flags for this target's objects.
include regress/CMakeFiles/fread.dir/flags.make

regress/CMakeFiles/fread.dir/fread.c.o: regress/CMakeFiles/fread.dir/flags.make
regress/CMakeFiles/fread.dir/fread.c.o: ../regress/fread.c
	$(CMAKE_COMMAND) -E cmake_progress_report /home/fserrano/libzip/build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object regress/CMakeFiles/fread.dir/fread.c.o"
	cd /home/fserrano/libzip/build/regress && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/fread.dir/fread.c.o   -c /home/fserrano/libzip/regress/fread.c

regress/CMakeFiles/fread.dir/fread.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/fread.dir/fread.c.i"
	cd /home/fserrano/libzip/build/regress && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -E /home/fserrano/libzip/regress/fread.c > CMakeFiles/fread.dir/fread.c.i

regress/CMakeFiles/fread.dir/fread.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/fread.dir/fread.c.s"
	cd /home/fserrano/libzip/build/regress && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -S /home/fserrano/libzip/regress/fread.c -o CMakeFiles/fread.dir/fread.c.s

regress/CMakeFiles/fread.dir/fread.c.o.requires:
.PHONY : regress/CMakeFiles/fread.dir/fread.c.o.requires

regress/CMakeFiles/fread.dir/fread.c.o.provides: regress/CMakeFiles/fread.dir/fread.c.o.requires
	$(MAKE) -f regress/CMakeFiles/fread.dir/build.make regress/CMakeFiles/fread.dir/fread.c.o.provides.build
.PHONY : regress/CMakeFiles/fread.dir/fread.c.o.provides

regress/CMakeFiles/fread.dir/fread.c.o.provides.build: regress/CMakeFiles/fread.dir/fread.c.o

# Object files for target fread
fread_OBJECTS = \
"CMakeFiles/fread.dir/fread.c.o"

# External object files for target fread
fread_EXTERNAL_OBJECTS =

regress/fread: regress/CMakeFiles/fread.dir/fread.c.o
regress/fread: regress/CMakeFiles/fread.dir/build.make
regress/fread: lib/libzip.so.3.0
regress/fread: /usr/lib/x86_64-linux-gnu/libz.so
regress/fread: regress/CMakeFiles/fread.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking C executable fread"
	cd /home/fserrano/libzip/build/regress && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/fread.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
regress/CMakeFiles/fread.dir/build: regress/fread
.PHONY : regress/CMakeFiles/fread.dir/build

regress/CMakeFiles/fread.dir/requires: regress/CMakeFiles/fread.dir/fread.c.o.requires
.PHONY : regress/CMakeFiles/fread.dir/requires

regress/CMakeFiles/fread.dir/clean:
	cd /home/fserrano/libzip/build/regress && $(CMAKE_COMMAND) -P CMakeFiles/fread.dir/cmake_clean.cmake
.PHONY : regress/CMakeFiles/fread.dir/clean

regress/CMakeFiles/fread.dir/depend:
	cd /home/fserrano/libzip/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/fserrano/libzip /home/fserrano/libzip/regress /home/fserrano/libzip/build /home/fserrano/libzip/build/regress /home/fserrano/libzip/build/regress/CMakeFiles/fread.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : regress/CMakeFiles/fread.dir/depend

