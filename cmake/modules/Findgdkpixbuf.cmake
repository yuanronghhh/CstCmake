set(search_dirs
  ${LIBDIR}
  /usr/local
  /usr
)

FIND_PATH(GDKPIXBUF_INCLUDE_DIR
  NAMES gdk-pixbuf/gdk-pixbuf-marshal.h
  HINTS ${search_dirs}
  PATH_SUFFIXES gdk-pixbuf/include/gdk-pixbuf-2.0
)

FIND_LIBRARY(GDKPIXBUF_LIBRARY
  NAMES gdk_pixbuf-2.0.lib
  HINTS ${search_dirs}
  PATH_SUFFIXES lib64 lib gdk-pixbuf/lib
)

set(GDKPIXBUF_FILES "")
IF(WIN32)
  set(GDKPIXBUF_FILE
    "gdk_pixbuf-2.0-0.dll"
  )
  FOREACH(COMPONENT ${GDKPIXBUF_FILE})
    STRING(TOUPPER ${COMPONENT} UPPERCOMPONENT)


    FIND_FILE(GDKPIXBUF_${COMPONENT}_FILE
      NAMES ${COMPONENT}
      HINTS ${search_dirs}
      PATH_SUFFIXES gdk-pixbuf/bin
    )

    LIST(APPEND GDKPIXBUF_FILES "${GDKPIXBUF_${COMPONENT}_FILE}")
  ENDFOREACH()
ENDIF()

set(GDKPIXBUF_DEPS
   gettext
 glib
 libpng
 tiff
 vcpkg-tool-meson
 zlib
)
add_dep_for_libray_N(gdkpixbuf "${GDKPIXBUF_DEPS}")

INCLUDE(FindPackageHandleStandardArgs)
FIND_PACKAGE_HANDLE_STANDARD_ARGS(GDKPIXBUF DEFAULT_MSG
  GDKPIXBUF_LIBRARY GDKPIXBUF_INCLUDE_DIR)

IF(GDKPIXBUF_FOUND)
  SET(GDKPIXBUF_LIBRARIES ${GDKPIXBUF_LIBRARY})
  SET(GDKPIXBUF_INCLUDE_DIRS ${GDKPIXBUF_INCLUDE_DIR})
ENDIF(GDKPIXBUF_FOUND)

MARK_AS_ADVANCED(
  GDKPIXBUF_INCLUDE_DIR
  GDKPIXBUF_LIBRARY
)

