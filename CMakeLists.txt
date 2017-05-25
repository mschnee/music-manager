cmake_minimum_required(VERSION 3.8)
set(CMAKE_CXX_STANDARD 11)
project(music-manager)

find_library(spdlog REQUIRED)
find_library(uwebsockets REQUIRED)

OPTION(DIST_DEV "Install into ./dist for development" ON)
OPTION(BUILD_UI "Build the UI component" OFF)
OPTION(BUILD_CORE "Build the Core component" ON)


if(DIST_DEV)
    set(CMAKE_INSTALL_PREFIX "${CMAKE_SOURCE_DIR}/dist")
endif()

if (BUILD_UI)
    add_subdirectory(Ui)
endif()

if (BUILD_CORE)
    add_subdirectory(Core)
endif()