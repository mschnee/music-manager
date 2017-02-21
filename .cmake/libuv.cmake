if (WIN32)
    include(./.cmake/windows/libuv.cmake)
    set(LIBUV_LIBRARY ${CMAKE_INSTALL_PREFIX}/lib/libuv.lib)
elseif(UNIX AND APPLE)
    include(./.cmake/macos/libuv.cmake)
    set(LIBUV_LIBRARY ${CMAKE_INSTALL_PREFIX}/lib/libuv.dylib)
else()
    include(./.cmake/linux/libuv.cmake)
    set(LIBUV_LIBRARY ${CMAKE_INSTALL_PREFIX}/lib/libuv.a)
endif()

set(LIBUV_INCLUDE_DIR ${CMAKE_INSTALL_PREFIX}/include/uv)

