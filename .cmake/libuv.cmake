ExternalProject_Add(
    libuv-1.11.0
    GIT_REPOSITORY https://github.com/libuv/libuv.git
    GIT_TAG "v1.11.0"
    CONFIGURE_COMMAND ""
    BUILD_IN_SOURCE 1
    BUILD_COMMAND vcbuild.bat release x64 shared
    INSTALL_COMMAND ""
)

set(LIBUV_INCLUDE_DIR ${EXTERNAL_PREFIX}/Source/libuv-1.11.0/include)
set(LIBS ${LIBS} ${EXTERNAL_PREFIX}/Source/libuv-1.11.0/Release)
set(LIBUV_LIBRARY ${EXTERNAL_PREFIX}/Source/libuv-1.11.0/Release/libuv.lib)