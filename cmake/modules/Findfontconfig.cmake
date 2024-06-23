set(search_dirs
  ${LIBDIR}
  /usr/local
  /usr
  /usr/lib/x86_64-linux-gnu
)

FIND_PATH(FONTCONFIG_INCLUDE_DIR
  NAMES fontconfig/fcfreetype.h fontconfig/fontconfig.h fontconfig/fcprivate.h
  HINTS ${search_dirs}
  PATH_SUFFIXES include fontconfig/include
)

FIND_LIBRARY(FONTCONFIG_LIBRARY
  NAMES fontconfig
  HINTS ${search_dirs}
  PATH_SUFFIXES lib64 lib fontconfig/lib
)

set(FONTCONFIG_FILES "")
if(WIN32)
  set(FONTCONFIG_FILE_COMPONENTS
    "fontconfig-1.dll")

  FOREACH(COMPONENT ${FONTCONFIG_FILE_COMPONENTS})
    STRING(TOUPPER ${COMPONENT} UPPERCOMPONENT)

    FIND_FILE(FONTCONFIG_${COMPONENT}_FILE
      NAMES ${COMPONENT}
      HINTS ${search_dirs}
      PATH_SUFFIXES fontconfig/bin
      )

    LIST(APPEND FONTCONFIG_FILES "${FONTCONFIG_${COMPONENT}_FILE}")
  ENDFOREACH()
endif()

INCLUDE(FindPackageHandleStandardArgs)
FIND_PACKAGE_HANDLE_STANDARD_ARGS(FONTCONFIG DEFAULT_MSG
  FONTCONFIG_LIBRARY FONTCONFIG_INCLUDE_DIR)

IF(FONTCONFIG_FOUND)
  SET(FONTCONFIG_LIBRARIES ${FONTCONFIG_LIBRARY})
  SET(FONTCONFIG_INCLUDE_DIRS ${FONTCONFIG_INCLUDE_DIR})
ENDIF(FONTCONFIG_FOUND)

MARK_AS_ADVANCED(
  FONTCONFIG_INCLUDE_DIR
  FONTCONFIG_LIBRARY
)
