cmake_minimum_required(VERSION 2.8)

project(OpenWRTCompilerServer)

set(SOURCES
  main.cpp
  callbacks.c
  compress.c
  host.c
  list.c
  packet.c
  peer.c
  protocol.c
  unix.c
  win32.c
  )

#Bring the headers into the project
include_directories(${CMAKE_SOURCE_DIR}/include)

add_executable(${PROJECT_NAME} ${SOURCES})
