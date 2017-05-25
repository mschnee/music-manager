set(MM_SOURCES
    src/MusicManager.cpp
)
add_executable(MusicManager ${MM_SOURCES})
target_link_libraries(MusicManager ${MM_SOURCS})
find_package(spdlog REQUIRED)
OPTION(CORE_BUILD_TESTS "Build the unit tests" OFF)

if (CORE_BUILD_TESTS)
    enable_testing()
    add_test()
endif()