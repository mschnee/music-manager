ExternalProject_Add(
    zlib-1.2.11
    GIT_REPOSITORY https://github.com/madler/zlib.git
    GIT_TAG "v1.2.11"
    PREFIX "${EXTERNAL_PREFIX}"
    CMAKE_ARGS -DCMAKE_INSTALL_PREFIX=${CMAKE_INSTALL_PREFIX} -DCMAKE_BUILD_TYPE=Release
)
