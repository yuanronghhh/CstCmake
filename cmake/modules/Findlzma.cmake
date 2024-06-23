set(search_dirs
  ${LIBDIR}
  /usr/local
  /usr
)

FIND_PATH(LZMA_INCLUDE_DIR
  NAMES lzma/lzma12.h
  HINTS ${search_dirs}
  PATH_SUFFIXES liblzma/include
)

FIND_LIBRARY(LZMA_LIBRARY
  NAMES lzma.lib
  HINTS ${search_dirs}
  PATH_SUFFIXES lib64 lib liblzma/lib
)

set(LZMA_FILES "")
IF(WIN32)
  set(LZMA_FILE
    "liblzma.dll"
  )
  FOREACH(COMPONENT ${LZMA_FILE})
    STRING(TOUPPER ${COMPONENT} UPPERCOMPONENT)


    FIND_FILE(LZMA_${COMPONENT}_FILE
      NAMES ${COMPONENT}
      HINTS ${search_dirs}
      PATH_SUFFIXES liblzma/bin
    )

    LIST(APPEND LZMA_FILES "${LZMA_${COMPONENT}_FILE}")
  ENDFOREACH()
ENDIF()

set(LZMA_DEPS
   
)
add_dep_for_libray_N(lzma "${LZMA_DEPS}")

INCLUDE(FindPackageHandleStandardArgs)
FIND_PACKAGE_HANDLE_STANDARD_ARGS(LZMA DEFAULT_MSG
  LZMA_LIBRARY LZMA_INCLUDE_DIR)

IF(LZMA_FOUND)
  SET(LZMA_LIBRARIES ${LZMA_LIBRARY})
  SET(LZMA_INCLUDE_DIRS ${LZMA_INCLUDE_DIR})
ENDIF(LZMA_FOUND)

MARK_AS_ADVANCED(
  LZMA_INCLUDE_DIR
  LZMA_LIBRARY
)

