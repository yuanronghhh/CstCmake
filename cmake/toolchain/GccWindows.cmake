set(GCC_HOME "$ENV{GCC_BIN}/..")
if(NOT EXISTS "${GCC_HOME}")
  message(FATAL_ERROR "Require GCC_BIN for GccWindows ToolChain")
endif()
STRING(REPLACE "\\" "/" GCC_HOME ${GCC_HOME})
set(GCC_VERSION "10.3.0")

set(CMAKE_SYSTEM_NAME Windows)
set(CMAKE_SYSTEM_VERSION 10.0)
set(CMAKE_SYSTEM_PROCESSOR AMD64)
set(MINGW_INCLUDE_DIR "${GCC_HOME}/x86_64-w64-mingw32/include")
set(MINGW_LIBRARY_DIR "${GCC_HOME}/x86_64-w64-mingw32/lib")

if(WIN32)
  set(GCC_PROPS "${CMAKE_BINARY_DIR}/Directory.build.props")
  if (NOT EXISTS ${GCC_PROPS})
    configure_file(
      "${CMAKE_CURRENT_LIST_DIR}/Directory.build.props.in"
      "${GCC_PROPS}"
    )
  endif()
endif()

set(CMAKE_C_COMPILER "${GCC_HOME}/bin/gcc.exe")
set(CMAKE_CXX_COMPILER "${GCC_HOME}/bin/g++.exe")
set(CMAKE_C_COMPILER_TARGET "x86_64-w64-mingw32")
