if(WIN32)
    set(UWS_DEPENDS zlib-1.2.11 openssl-1.0.2k libuv-1.11.0)
else()
    set(UWS_DEPENDS libuv-1.11.0)
endif()

ExternalProject_Add(
    uWebSockets-0.13.0a4
    GIT_REPOSITORY https://github.com/mschnee/uWebSockets.git
    GIT_TAG "fix-play-nice-with-winnt-h"
    UPDATE_COMMAND ""
    PREFIX ${EXTERNAL_PREFIX}
    CMAKE_ARGS -DCMAKE_INSTALL_PREFIX=${CMAKE_INSTALL_PREFIX} -DCMAKE_BUILD_TYPE=Release -DLIBUV_LIBRARY=${LIBUV_LIBRARY} -DLIBUV_INCLUDE_DIR=${LIBUV_INCLUDE_DIR}
    DEPENDS ${UWS_DEPENDS}
)
