cmake_minimum_required(VERSION 3.7.2)
set(CMAKE_CXX_STANDARD 11)
project(music-manager-core)
include(ExternalProject)

set(EXTERNAL_PREFIX ${CMAKE_BINARY_DIR}/external)
file(MAKE_DIRECTORY ${EXTERNAL_PREFIX})
set_directory_properties(PROPERTIES EP_BASE ${EXTERNAL_PREFIX})

## Import the externals
include(./.cmake/libuv.cmake)
include(./.cmake/openssl.cmake)
include(./.cmake/zlib.cmake)
include(./.cmake/uwebsockets.cmake)
include(./.cmake/spdlog.cmake)
## Resume please

include_directories(${CMAKE_INSTALL_PREFIX}/include ${CMAKE_INSTALL_PREFIX}/include ${LIBUV_INCLUDE_DIR})
set(SOURCES)
set(SOURCES ${SOURCES} "Core/src/demo.cpp")

link_directories(${CMAKE_INSTALL_PREFIX}/lib ${CMAKE_INSTALL_PREFIX}/lib ${CMAKE_INSTALL_PREFIX}/usr/lib64)

# ==============================================================================
# Setup targets
# ==============================================================================
add_executable(demo ${SOURCES})
add_dependencies(demo uWebSockets-0.13.0a4 zlib-1.2.11 openssl-1.0.2k libuv-1.11.0 spdlog)
target_link_libraries(demo
    uWS ws2_32 advapi32 iphlpapi shell32
    ${LIBUV_LIBRARY} ${CMAKE_INSTALL_PREFIX}/lib/libeay32.lib
    ${CMAKE_INSTALL_PREFIX}/lib/ssleay32.lib
    ${CMAKE_INSTALL_PREFIX}/lib/zlibd.lib
)

set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_INSTALL_PREFIX}/lib)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_INSTALL_PREFIX}/lib)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_INSTALL_PREFIX}/bin)
set_target_properties(demo
    PROPERTIES
    RUNTIME_OUTPUT_DIRECTORY_DEBUG ${CMAKE_INSTALL_PREFIX}/bin
    RUNTIME_OUTPUT_DIRECTORY_RELEASE ${CMAKE_INSTALL_PREFIX}/bin
    RUNTIME_OUTPUT_DIRECTORY ${CMAKE_INSTALL_PREFIX}/bin
    ARCHIVE_OUTPUT_DIRECTORY_DEBUG ${CMAKE_INSTALL_PREFIX}/lib
    ARCHIVE_OUTPUT_DIRECTORY_RELEASE ${CMAKE_INSTALL_PREFIX}/lib
    ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_INSTALL_PREFIX}/lib
    LIBRARY_OUTPUT_DIRECTORY_DEBUG ${CMAKE_INSTALL_PREFIX}/lib
    LIBRARY_OUTPUT_DIRECTORY_RELEASE ${CMAKE_INSTALL_PREFIX}/lib
    LIBRARY_OUTPUT_DIRECTORY ${CMAKE_INSTALL_PREFIX}/lib
)

install (TARGETS demo DESTINATION ${CMAKE_INSTALL_PREFIX}/bin)
