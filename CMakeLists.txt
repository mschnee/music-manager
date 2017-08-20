cmake_minimum_required(VERSION 3.8)
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)
project(music-manager)
enable_testing()
set(CTEST_OUTPUT_ON_FAILURE 1)

find_package(spdlog REQUIRED)

OPTION(DIST_DEV "Install into ./dist for development" ON)
OPTION(BUILD_UI "Build the UI component" OFF)
OPTION(BUILD_CORE "Build the Core component" ON)
OPTION(PRODUCTION "Create a production build" OFF)
OPTION(BUILD_TESTS "Build and run tests" ON)

find_package(ZLIB REQUIRED)
find_package(OpenSSL REQUIRED)
find_path(LIBUV_INCLUDE_DIR uv.h)
find_library(LIBUV_LIBRARY NAMES libuv)

## find spdlog
find_path(SPDLOG_INCLUDE_DIR spdlog/spdlog.h)
include_directories(${SPDLOG_INCLUDE_DIR})

## find uws
find_path(UWS_INCLUDE_DIR uWS/uWS.h)
include_directories(${UWS_INCLUDE_DIR})
find_library(UWS_LIBRARY uWS)

find_library(FMT_LIBRARY fmt)

if(DIST_DEV)
    set(CMAKE_INSTALL_PREFIX "${CMAKE_SOURCE_DIR}/dist")
endif()

if (BUILD_UI)
    add_subdirectory(Ui)
endif()

if (BUILD_CORE)
    add_subdirectory(Core)
endif()
