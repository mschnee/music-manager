cmake_minimum_required(VERSION 3.5)
set(CMAKE_CXX_STANDARD 11)
project(music-manager-core)
include(ExternalProject)

set(EXTERNAL_PREFIX ${CMAKE_BINARY_DIR}/dist)
file(MAKE_DIRECTORY ${EXTERNAL_PREFIX})
set_directory_properties(PROPERTIES EP_BASE ${EXTERNAL_PREFIX})

## Import the externals
include(./.cmake/libuv.cmake)
include(./.cmake/openssl.cmake)
include(./.cmake/zlib.cmake)
include(./.cmake/uwebsockets.cmake)
## Resume please

include_directories(${CMAKE_INSTALL_PREFIX}/include ${EXTERNAL_PREFIX}/include ${LIBUV_INCLUDE_DIR})
set(SOURCES)
set(SOURCES ${SOURCES} "Core/src/demo.cpp")

link_directories(${CMAKE_INSTALL_PREFIX}/lib ${EXTERNAL_PREFIX}/lib)
add_executable(demo ${SOURCES})
add_dependencies(demo uWebSockets-0.13.0a4)
target_link_libraries(demo uWS)
install (TARGETS demo DESTINATION bin)
