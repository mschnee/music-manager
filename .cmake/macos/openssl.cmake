ExternalProject_Add(
    openssl-1.0.2k
    #URL ${CMAKE_SOURCE_DIR}/../openssl
    GIT_REPOSITORY https://github.com/openssl/openssl.git
    GIT_TAG "OpenSSL_1_0_2k"
    UPDATE_COMMAND ""
    CONFIGURE_COMMAND ./Configure darwin64-x86_64-cc --prefix=${CMAKE_INSTALL_PREFIX}
    BUILD_COMMAND make
    BUILD_IN_SOURCE 1
    INSTALL_COMMAND make install
)
