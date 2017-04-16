
set (UV_INSTALL_SCRIPT ${CMAKE_SOURCE_DIR}/.cmake/libuv_install.cmake)
set (SPD_INSTALL_SCRIPT ${CMAKE_SOURCE_DIR}/.cmake/spdlog_install.cmake)

string(REGEX REPLACE " " ";" msbuildInclude INCLUDE_PATH)
ExternalProject_Add(
    libuv-1.11.0
    GIT_REPOSITORY https://github.com/libuv/libuv.git
    GIT_TAG "v1.11.0"
    CONFIGURE_COMMAND ""
    BUILD_IN_SOURCE 1
    BUILD_COMMAND vcbuild.bat release x64 shared
    INSTALL_COMMAND cmake -DUV_BUILD_DIR=${EXTERNAL_PREFIX}/Source/libuv-1.11.0/ -DCMAKE_INSTALL_PREFIX=${CMAKE_INSTALL_PREFIX} -DCMAKE_BUILD_TYPE=Release -P ${UV_INSTALL_SCRIPT}
)

ExternalProject_Add(
    openssl-1.0.2k
    #URL ${CMAKE_SOURCE_DIR}/../openssl
    GIT_REPOSITORY https://github.com/openssl/openssl.git
    GIT_TAG "OpenSSL_1_0_2k"
    CONFIGURE_COMMAND perl Configure no-asm VC-WIN64A "--prefix=${CMAKE_INSTALL_PREFIX}"
    UPDATE_COMMAND ""
    BUILD_COMMAND "ms\\do_win64a.bat"
    COMMAND nmake -f "ms\\ntdll.mak"
    BUILD_IN_SOURCE 1
    INSTALL_COMMAND nmake -f "ms\\ntdll.mak" install
)

ExternalProject_Add(
    zlib-1.2.11
    GIT_REPOSITORY https://github.com/madler/zlib.git
    GIT_TAG "v1.2.11"
    UPDATE_COMMAND ""
    PREFIX "${EXTERNAL_PREFIX}"
    CMAKE_ARGS -DCMAKE_INSTALL_PREFIX=${CMAKE_INSTALL_PREFIX} -DCMAKE_BUILD_TYPE=Release
)

ExternalProject_Add(
    uWebSockets-0.14.2
    GIT_REPOSITORY https://github.com/uWebSockets/uWebSockets.git
    GIT_TAG "v0.14.2"
    UPDATE_COMMAND ""
    CONFIGURE_COMMAND ""
    PREFIX ${EXTERNAL_PREFIX}
    #CMAKE_ARGS -DCMAKE_INSTALL_PREFIX=${CMAKE_INSTALL_PREFIX} -DCMAKE_BUILD_TYPE=Release -DLIBUV_LIBRARY=${LIBUV_LIBRARY} -DLIBUV_INCLUDE_DIR=${LIBUV_INCLUDE_DIR}
    BUILD_COMMAND ${CMAKE_SOURCE_DIR}/.cmake/builduws.bat ${CMAKE_INSTALL_PREFIX}
    BUILD_IN_SOURCE 1
    DEPENDS zlib-1.2.11 openssl-1.0.2k libuv-1.11.0
)

ExternalProject_Add(
    spdlog
    GIT_REPOSITORY https://github.com/gabime/spdlog.git
    UPDATE_COMMAND ""
    PREFIX "${EXTERNAL_PREFIX}"
    CMAKE_ARGS -DCMAKE_INSTALL_PREFIX=${CMAKE_INSTALL_PREFIX} -DCMAKE_BUILD_TYPE=Release
    INSTALL_COMMAND cmake -DSPD_BUILD_DIR=${EXTERNAL_PREFIX}/src/spdlog -DCMAKE_INSTALL_PREFIX=${CMAKE_INSTALL_PREFIX} -DCMAKE_BUILD_TYPE=Release -P ${SPD_INSTALL_SCRIPT}
)


set(LIBUV_LIBRARY ${CMAKE_INSTALL_PREFIX}/lib/libuv.lib)
set(LIBUV_INCLUDE_DIR ${CMAKE_INSTALL_PREFIX}/include/uv)
