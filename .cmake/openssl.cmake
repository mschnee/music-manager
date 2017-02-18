ExternalProject_Add(
    openssl-1.0.2k
    #URL ${CMAKE_SOURCE_DIR}/../openssl
    GIT_REPOSITORY https://github.com/openssl/openssl.git
    GIT_TAG "OpenSSL_1_0_2k"
    CONFIGURE_COMMAND perl Configure no-asm VC-WIN64A "--prefix=${EXTERNAL_PREFIX}"
    BUILD_COMMAND "ms\\do_win64a.bat"
    COMMAND nmake -f "ms\\ntdll.mak"
    BUILD_IN_SOURCE 1
    INSTALL_COMMAND nmake -f "ms\\ntdll.mak" install
)
