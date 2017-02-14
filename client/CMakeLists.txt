cmake_minimum_required(VERSION 2.8)

project(OpenWRTCompilerClient)

set(SOURCES
  client.c
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
include_directories(${CMAKE_SOURCE_DIR}/include
    ${CMAKE_SOURCE_DIR}/libzip/lib
    ${CMAKE_BINARY_DIR}/libzip)

LINK_DIRECTORIES(${CMAKE_BINARY_DIR}/libzip/lib/)

add_executable(${PROJECT_NAME} ${SOURCES})
TARGET_LINK_LIBRARIES(${PROJECT_NAME} zip)
