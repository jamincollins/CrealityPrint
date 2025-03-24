set(patch_command git init && ${PATCH_CMD} ${CMAKE_CURRENT_LIST_DIR}/0001-crealityprint-build.patch && ${PATCH_CMD} ${CMAKE_CURRENT_LIST_DIR}/0002-crealityprint-build.patch)
orcaslicer_add_cmake_project(BREAKPAD
  # GIT_REPOSITORY https://github.com/aliyun/aliyun-oss-cpp-sdk.git
  # GIT_TAG v1.9.2
  URL https://github.com/google/breakpad/archive/refs/tags/v2023.06.01.zip
  URL_HASH SHA256=6031c0039e016242801673463562d01a70ae016bf842c1244581e29359e25552
  PATCH_COMMAND ${patch_command}
  CMAKE_ARGS
    -DINSTALL_HEADERS:BOOL=ON
)
add_dependencies(dep_BREAKPAD dep_CURL)
if (MSVC)
    add_debug_dep(dep_BREAKPAD)
endif ()