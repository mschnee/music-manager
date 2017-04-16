set (UV_INSTALL_SCRIPT ${CMAKE_SOURCE_DIR}/.cmake/windows/libuv_install.cmake)
ExternalProject_Add(
    libuv-1.11.0
    GIT_REPOSITORY https://github.com/libuv/libuv.git
    GIT_TAG "v1.11.0"
    CONFIGURE_COMMAND ""
    BUILD_IN_SOURCE 1
    BUILD_COMMAND vcbuild.bat release x64 shared
    INSTALL_COMMAND cmake -DUV_BUILD_DIR=${EXTERNAL_PREFIX}/Source/libuv-1.11.0/ -DCMAKE_INSTALL_PREFIX=${CMAKE_INSTALL_PREFIX} -DCMAKE_BUILD_TYPE=Release -P ${UV_INSTALL_SCRIPT}
)