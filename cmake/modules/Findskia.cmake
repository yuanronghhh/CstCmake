set(search_dirs
  ${LIBDIR}
  /usr/local
  /usr
)

FIND_PATH(SKIA_INCLUDE_DIR
  NAMES skia/effects/SkRuntimeEffect.h
  HINTS ${search_dirs}
  PATH_SUFFIXES skia/include
)

FIND_LIBRARY(SKIA_LIBRARY
  NAMES skshaper.dll.lib
  HINTS ${search_dirs}
  PATH_SUFFIXES lib64 lib skia/lib
)

set(SKIA_FILES "")
IF(WIN32)
  set(SKIA_FILE
    "skunicode_icu.dll"
    "skunicode_core.dll"
    "skshaper.dll"
    "skia.dll"
  )
  FOREACH(COMPONENT ${SKIA_FILE})
    STRING(TOUPPER ${COMPONENT} UPPERCOMPONENT)


    FIND_FILE(SKIA_${COMPONENT}_FILE
      NAMES ${COMPONENT}
      HINTS ${search_dirs}
      PATH_SUFFIXES skia/bin
    )

    LIST(APPEND SKIA_FILES "${SKIA_${COMPONENT}_FILE}")
  ENDFOREACH()
ENDIF()

set(SKIA_DEPS
)
add_dep_for_libray_N(skia "${SKIA_DEPS}")

INCLUDE(FindPackageHandleStandardArgs)
FIND_PACKAGE_HANDLE_STANDARD_ARGS(SKIA DEFAULT_MSG
  SKIA_LIBRARY SKIA_INCLUDE_DIR)

IF(SKIA_FOUND)
  SET(SKIA_LIBRARIES ${SKIA_LIBRARY})
  SET(SKIA_INCLUDE_DIRS ${SKIA_INCLUDE_DIR})
ENDIF(SKIA_FOUND)

MARK_AS_ADVANCED(
  SKIA_INCLUDE_DIR
  SKIA_LIBRARY
)


