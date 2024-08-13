set_property(GLOBAL PROPERTY USE_FOLDERS ON)

include(${CMAKE_CURRENT_LIST_DIR}/macros/logger.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/macros/project_common.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/macros/policy.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/extern/env.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/extern/extern.cmake)

include(CMakePrintHelpers)

if(NOT DEFINED CMAKE_SUPPRESS_DEVELOPER_WARNINGS)
  set(CMAKE_SUPPRESS_DEVELOPER_WARNINGS 1 CACHE INTERNAL "No dev warnings")
endif()

if (CMAKE_BUILD_TYPE STREQUAL "Debug")
  set(DEBUG 1)
else()
  set(DEBUG 0)
endif()

if(WIN32)
  include(${CMAKE_CURRENT_LIST_DIR}/config/platform_win32.cmake)
elseif(ANDROID)
  include(${CMAKE_CURRENT_LIST_DIR}/config/platform_android.cmake)
elseif(UNIX)
  include(${CMAKE_CURRENT_LIST_DIR}/config/platform_unix.cmake)
elseif(MSYS)
  include(${CMAKE_CURRENT_LIST_DIR}/config/platform_msys.cmake)
endif()
