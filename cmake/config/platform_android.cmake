if(NOT EXISTS "${LIBDIR}/")
  message(FATAL_ERROR "Windows requires pre-compiled libs at: '${LIBDIR}'")
endif()

add_definitions("-D__ANDROID__=1")
set(ANDROID_LIBRARIES
  "android"
  "log"
)
