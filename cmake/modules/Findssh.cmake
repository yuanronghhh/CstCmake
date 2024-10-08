set(search_dirs
  ${LIBDIR}
  /usr/local
  /usr
)

FIND_PATH(SSH_INCLUDE_DIR
  NAMES libssh/libssh.h
  HINTS ${search_dirs}
  PATH_SUFFIXES libssh/include
)

FIND_LIBRARY(SSH_LIBRARY
  NAMES ssh
  HINTS ${search_dirs}
  PATH_SUFFIXES lib64 lib libssh/lib
)

set(SSH_FILES "")
IF(WIN32)
  set(SSH_FILE
    "ssh.dll"
  )
  FOREACH(COMPONENT ${SSH_FILE})
    STRING(TOUPPER ${COMPONENT} UPPERCOMPONENT)


    FIND_FILE(SSH_${COMPONENT}_FILE
      NAMES ${COMPONENT}
      HINTS ${search_dirs}
      PATH_SUFFIXES libssh/bin
    )

    LIST(APPEND SSH_FILES "${SSH_${COMPONENT}_FILE}")
  ENDFOREACH()
ENDIF()

INCLUDE(FindPackageHandleStandardArgs)
FIND_PACKAGE_HANDLE_STANDARD_ARGS(SSH DEFAULT_MSG
  SSH_LIBRARY SSH_INCLUDE_DIR)

IF(SSH_FOUND)
  SET(SSH_LIBRARIES ${SSH_LIBRARY})
  SET(SSH_INCLUDE_DIRS ${SSH_INCLUDE_DIR})
ENDIF(SSH_FOUND)

MARK_AS_ADVANCED(
  SSH_INCLUDE_DIR
  SSH_LIBRARY
)
