set(MM_HEADERS
	src/SettingsManager.h
)
set(MM_SOURCES
    src/MusicManager.cpp
	src/SettingsManager.cpp
	src/SettingsManager_win.cpp
)
add_executable(MusicManager ${MM_SOURCES})
target_link_libraries(MusicManager ${UWS_LIBRARY} ${OPENSSL_LIBRARIES} ${ZLIB_LIBRARIES} ${LIBUV_LIBRARY} ${FMT_LIBRARY})
find_package(spdlog REQUIRED)
OPTION(CORE_BUILD_TESTS "Build the unit tests" ON)


find_package(GTest REQUIRED)
include_directories(${GTEST_INCLUDE_DIRS})
add_executable(TestSettingsManager test/TestSettingsManager.cpp src/SettingsManager.cpp src/SettingsManager_win.cpp)
target_link_libraries(TestSettingsManager  GTest::GTest GTest::Main)
gtest_add_tests(TestSettingsManager "" AUTO)