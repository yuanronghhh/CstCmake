set(search_dirs
  ${LIBDIR}
  /usr/local
  /usr
)

FIND_PATH(SYSTEM_INCLUDE_DIR
  NAMES System/SysCore.h
  HINTS ${search_dirs}
  PATH_SUFFIXES System/include
)

FIND_LIBRARY(SYSTEM_LIBRARY
  NAMES System
  HINTS ${search_dirs}
  PATH_SUFFIXES System/lib
)

set(SYSTEM_FILES "")

IF(WIN32)
  set(SYSTEM_FILE
  )

  FOREACH(COMPONENT ${SYSTEM_FILE})
    STRING(TOUPPER ${COMPONENT} UPPERCOMPONENT)

    FIND_FILE(SYSTEM_${COMPONENT}_FILE
      NAMES ${COMPONENT}
      HINTS ${search_dirs}
      PATH_SUFFIXES system-win32/bin
    )

    LIST(APPEND SYSTEM_FILES "${SYSTEM_${COMPONENT}_FILE}")
  ENDFOREACH()
ENDIF()

INCLUDE(FindPackageHandleStandardArgs)
FIND_PACKAGE_HANDLE_STANDARD_ARGS(SYSTEM DEFAULT_MSG
  SYSTEM_LIBRARY SYSTEM_INCLUDE_DIR)

IF(SYSTEM_FOUND)
  SET(SYSTEM_LIBRARIES ${SYSTEM_LIBRARY})
  SET(SYSTEM_INCLUDE_DIRS ${SYSTEM_INCLUDE_DIR})
ENDIF(SYSTEM_FOUND)

MARK_AS_ADVANCED(
  SYSTEM_INCLUDE_DIR
  SYSTEM_LIBRARY
)
