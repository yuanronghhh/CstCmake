set(search_dirs
  ${LIBDIR}
  /usr/local
  /usr
)

FIND_PATH(SDL3_INCLUDE_DIR
  NAMES SDL3/SDL.h
  HINTS ${search_dirs}
  PATH_SUFFIXES sdl3/include
)

FIND_LIBRARY(SDL3_LIBRARY
  NAMES SDL3.lib
  HINTS ${search_dirs}
  PATH_SUFFIXES lib64 lib sdl3/lib
)

set(SDL3_FILES "")
IF(WIN32)
  set(SDL3_FILE
    "SDL3.dll"
  )
  FOREACH(COMPONENT ${SDL3_FILE})
    STRING(TOUPPER ${COMPONENT} UPPERCOMPONENT)

    FIND_FILE(SDL3_${COMPONENT}_FILE
      NAMES ${COMPONENT}
      HINTS ${search_dirs}
      PATH_SUFFIXES sdl3/bin
    )

    LIST(APPEND SDL3_FILES "${SDL3_${COMPONENT}_FILE}")
  ENDFOREACH()
ENDIF()

set(SDL3_DEPS
)
add_dep_for_libray_N(sdl3 "${SDL3_DEPS}")

INCLUDE(FindPackageHandleStandardArgs)
FIND_PACKAGE_HANDLE_STANDARD_ARGS(SDL3 DEFAULT_MSG
  SDL3_LIBRARY SDL3_INCLUDE_DIR)

IF(SDL3_FOUND)
  SET(SDL3_LIBRARIES ${SDL3_LIBRARY})
  SET(SDL3_INCLUDE_DIRS ${SDL3_INCLUDE_DIR})
ENDIF(SDL3_FOUND)

MARK_AS_ADVANCED(
  SDL3_INCLUDE_DIR
  SDL3_LIBRARY
)

