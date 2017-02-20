file(GLOB SPD_HEADERS
  "${SPD_BUILD_DIR}/include/spdlog/*.h"
)

file (COPY ${SPD_HEADERS} DESTINATION ${CMAKE_INSTALL_PREFIX}/include/spdlog)