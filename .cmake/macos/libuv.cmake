set (UV_INSTALL_SCRIPT .cmake/libuv_install.cmake)

ExternalProject_Add(
    libuv-1.11.0
    GIT_REPOSITORY https://github.com/libuv/libuv.git
    GIT_TAG "v1.11.0"
    UPDATE_COMMAND ""
    CONFIGURE_COMMAND ./autogen.sh && ./configure --prefix=${CMAKE_INSTALL_PREFIX}
    BUILD_IN_SOURCE 1
    BUILD_COMMAND make
    INSTALL_COMMAND make install
)