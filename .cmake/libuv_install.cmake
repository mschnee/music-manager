file(GLOB UV_HEADERS
  "${UV_BUILD_DIR}/include/*.h"
)

file (COPY ${UV_HEADERS} DESTINATION ${CMAKE_INSTALL_PREFIX}/include/uv)
if (WIN32)
    if("${CMAKE_BUILD_TYPE}" STREQUAL "Release")
        file (COPY
            ${UV_BUILD_DIR}/Release/libuv.lib
            ${UV_BUILD_DIR}/Release/libuv.exp
            ${UV_BUILD_DIR}/Release/libuv.pdb
            DESTINATION ${CMAKE_INSTALL_PREFIX}/lib
        )
        file (COPY
            ${UV_BUILD_DIR}/Release/libuv.lib
            DESTINATION ${CMAKE_INSTALL_PREFIX}/bin
        )
    else()
        file (COPY
            ${UV_BUILD_DIR}/Debug/libuv.lib
            ${UV_BUILD_DIR}/Debug/libuv.exp
            ${UV_BUILD_DIR}/Debug/libuv.pdb
            DESTINATION ${CMAKE_INSTALL_PREFIX}/lib
        )
        file (COPY
            ${UV_BUILD_DIR}/Debug/libuv.lib
            DESTINATION ${CMAKE_INSTALL_PREFIX}/bin
        )
    endif()
endif (WIN32)
