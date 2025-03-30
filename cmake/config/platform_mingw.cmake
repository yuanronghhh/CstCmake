if(NOT EXISTS "${LIBDIR}/")
  message(FATAL_ERROR "Windows requires pre-compiled libs at: '${LIBDIR}'")
endif()

add_definitions("-D__MINGW__=1")

set(ADDTIONAL_LIBRARIES
  ws2_32
  pthread
  mingw32
  gcc
  user32
  kernel32
)

message(STATUS "load mingw")
