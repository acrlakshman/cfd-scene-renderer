cmake_minimum_required(VERSION 3.10)

project(cfd-scene-renderer DESCRIPTION "CFD Scene Renderer" LANGUAGES CXX C)

add_subdirectory(ext)

add_subdirectory(viewer)
file(GLOB_RECURSE VIEWER_SRC
  viewer/*.cpp
  )

set(VIEWER_INCLUDE "${CMAKE_CURRENT_SOURCE_DIR}/viewer/include")
include_directories(${VIEWER_INCLUDE} ${NANOGUI_INCLUDE_DIRS} ${CMAKE_CURRENT_SOURCE_DIR}/ext/nanogui/ext/glfw/include
  ${CMAKE_CURRENT_SOURCE_DIR}/ext/nanogui/ext/nanovg/src
)

add_executable(viewer ${VIEWER_SRC})
# target_include_directories(scpp_exe PUBLIC src)
# target_link_libraries(scpp_exe PUBLIC scpp_lib PRIVATE yaml-cpp spdlog filesystem)
# target_link_libraries(scpp_exe PUBLIC scpp_lib)

install(TARGETS viewer DESTINATION .)