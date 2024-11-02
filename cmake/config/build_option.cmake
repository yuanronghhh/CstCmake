# add_use_name("mono")
# add_use_name("llvm")
# add_use_name("ndk")
# add_use_name("sanitizer")
# add_use_name("vld")

if(WIN32)
  set(OS_ARCHITECH "Win64")
  set(LIBDIR ${CMAKE_SOURCE_DIR}/../lib/${OS_ARCHITECH}_vc14)
  # set enviroment first

  if(USE_LLVM)
    set(CMAKE_TOOLCHAIN_FILE ${INIT_HOME}/toolchain/ClangWindows.cmake)
    set(CMAKE_GENERATOR_TOOLSET "ClangCL")
  endif()

  if(USE_MONO)
    set(CMAKE_Csharp_COMPILER "C:/Program Files/Mono/bin/mcs.bat")
  endif()

  if(USE_NDK)
    include(${INIT_HOME}/toolchain/NdkWindows.cmake)
  endif()

  if(${CMAKE_BUILD_TYPE} STREQUAL "Debug")
    set(CMAKE_C_FLAGS "-Wall -gdwarf -Wno-unused-function")
  else()
  endif()
else()
  set(OS_ARCHITECH "Linux")
  set(LIBDIR ${CMAKE_SOURCE_DIR}/../lib/linux)

  if(${CMAKE_BUILD_TYPE} STREQUAL "Debug")
    set(CMAKE_C_FLAGS "-Wall")
  else()
  endif()
endif()
