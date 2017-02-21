if (CMAKE_CXX_COMPLIER_ID MATCHES "Clang")
    set(OPENSSL_BUILD_TARGET linux-x86_64-clang)
else()
    set(OPENSSL_BUILD_TARGET linux-x86_64)
endif()

ExternalProject_Add(
    openssl-1.0.2k
    #URL ${CMAKE_SOURCE_DIR}/../openssl
    GIT_REPOSITORY https://github.com/openssl/openssl.git
    GIT_TAG "OpenSSL_1_0_2k"
    CONFIGURE_COMMAND ./Configure ${OPENSSL_BUILD_TARGET} --prefix=${CMAKE_INSTALL_PREFIX}
    BUILD_COMMAND make
    BUILD_IN_SOURCE 1
    INSTALL_COMMAND make install
)
