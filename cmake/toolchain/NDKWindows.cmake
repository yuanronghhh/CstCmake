set(CMAKE_ANDROID_NDK "$ENV{ANDROID_NDK}")
if(NOT EXISTS "${CMAKE_ANDROID_NDK}")
  message(FATAL_ERROR "Require ANDROID_NDK for Android NDK ToolChain")
endif()
STRING(REPLACE "\\" "/" CMAKE_ANDROID_NDK ${CMAKE_ANDROID_NDK})

message(STATUS "USE NdkWindows ToolChain ${ANDROID_NDK}")

set(CMAKE_SYSTEM_NAME Android)
set(CMAKE_SYSTEM_PROCESSOR ARM)
set(CMAKE_ANDROID_ARCH_ABI arm64-v8a)
set(CMAKE_ANDROID_NDK_TOOLCHAIN_VERSION clang)
set(LLVM_HOME "${CMAKE_ANDROID_NDK}/toolchains/llvm/prebuilt/windows-x86_64")
set(ANDROID_NDK ${CMAKE_ANDROID_NDK})
set(ANDROID_PLATFORM "android-26")

set(CMAKE_C_COMPILER "${LLVM_HOME}/bin/clang.exe")
set(CMAKE_CXX_COMPILER "${LLVM_HOME}/bin/clang++.exe")
set(CMAKE_TOOLCHAIN_FILE ${CMAKE_ANDROID_NDK}/build/cmake/android.toolchain.cmake)
