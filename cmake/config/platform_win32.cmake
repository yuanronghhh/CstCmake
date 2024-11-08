if(NOT EXISTS "${LIBDIR}/")
  message(FATAL_ERROR "Windows requires pre-compiled libs at: '${LIBDIR}'")
endif()

find_package(openssl REQUIRED)
find_package(unity REQUIRED)
find_package(harfbuzz REQUIRED)
find_package(png REQUIRED)
find_package(zlib REQUIRED)
find_package(brotli REQUIRED)
find_package(graphene REQUIRED)
find_package(libepoxy REQUIRED)
find_package(tiff REQUIRED)
find_package(gettext REQUIRED)
find_package(iconv REQUIRED)
find_package(ffi REQUIRED)
find_package(pcre2 REQUIRED)
find_package(lzo REQUIRED)
find_package(bzip2 REQUIRED)
find_package(fontconfig REQUIRED)
find_package(freetype REQUIRED)
find_package(pixman REQUIRED)
find_package(pthread REQUIRED)
find_package(tinyexpr REQUIRED)
find_package(fribidi REQUIRED)
find_package(gcoroutine REQUIRED)
find_package(glad REQUIRED)
find_package(glfw3 REQUIRED)
find_package(stb REQUIRED)
find_package(pthread REQUIRED)
find_package(gstreamer REQUIRED)
find_package(ssh2 REQUIRED)
find_package(getopt REQUIRED)
find_package(lzma REQUIRED)
find_package(expat REQUIRED)
find_package(jpegturbo REQUIRED)
find_package(gdkpixbuf REQUIRED)
find_package(ffmpeg REQUIRED)
find_package(skia REQUIRED)
find_package(vld REQUIRED)

# find_package(sdl2 REQUIRED)
find_package(sdl3 REQUIRED)
find_package(system REQUIRED)

find_package(glib REQUIRED)
find_package(pango REQUIRED)
find_package(cairo REQUIRED)
find_package(gtk REQUIRED)
#find_package(mono REQUIRED)

set(MPG123_LIBRARIES "libmpg123.lib")

set(DWM_INCLUDE_DIRS "c:/Program Files (x86)/Windows Kits/10/Include/10.0.16299.0/um")
set(DWM_LIBRARIES dwmapi.lib)

set(GL_INCLUDE_DIRS "C:/Program Files (x86)/Windows Kits/10/Include/10.0.16299.0/um/gl")
set(GL_LIBRARIES opengl32.lib)

set(ASAN_DLL "G:/Download/vs2022IDE/VC/Tools/MSVC/14.39.33519/bin/Hostx64/x64/clang_rt.asan_dynamic-x86_64.dll")

if(USE_LLVM)
  add_definitions("-Wall")
  add_definitions("-Wno-unused-function")
  add_definitions("-Wno-unused-variable")
  add_definitions("-Wno-unused-parameter")
  add_definitions("-Wno-nonportable-system-include-path")
  add_definitions("-Wno-reserved-identifier")
  add_definitions("-Wno-strict-prototypes")
  add_definitions("-Wno-cast-function-type-strict")
  add_definitions("-Wno-sign-conversion")
  add_definitions("-Wno-unsafe-buffer-usage")
  add_definitions("-Wno-cast-qual")
  add_definitions("-Wno-bad-function-cast")
  add_definitions("-Wno-documentation-unknown-command")
  add_definitions("-Wno-deprecated-declarations")
  add_definitions("-Wno-language-extension-token")
  add_definitions("-Wno-cast-function-type")
  add_definitions("-Wno-switch-default")
  add_definitions("-Wno-declaration-after-statement")
  add_definitions("-Wno-float-equal")
  add_definitions("-Wno-unused-macros")
  add_definitions("-Wno-ignored-qualifiers")
  add_definitions("-Wno-sign-compare")
  add_definitions("-Wno-implicit-int-conversion")
  add_definitions("-Wno-documentation")
  add_definitions("-Wno-cast-align")
  add_definitions("-Wno-extra-semi")
  add_definitions("-Wno-extra-semi-stmt")
  add_definitions("-Wno-overlength-strings")
  add_definitions("-Wno-assign-enum")
  add_definitions("-Wno-missing-noreturn")
  add_definitions("-Wno-format-nonliteral")
  add_definitions("-Wno-null-pointer-subtraction")
  set(ADDTIONAL_LIBRARIES "")
else()
  add_definitions("/MT")
  add_definitions("/MP")
  add_definitions("/W3")
  add_definitions("/WX")
  add_compile_options("$<$<C_COMPILER_ID:MSVC>:/utf-8>")
  add_compile_options("$<$<CXX_COMPILER_ID:MSVC>:/utf-8>")
  add_definitions("/wd\"4100\" /wd\"4206\" /wd\"4201\" /wd\"4996\" /wd\"4819\"")

  set(ADDTIONAL_LIBRARIES
    kernel32.lib
    user32.lib
    winspool.lib
    ws2_32.lib
    comdlg32.lib
    advapi32.lib
    shell32.lib
    ole32.lib
    oleaut32.lib
    uuid.lib
    odbc32.lib
    odbccp32.lib)

  set(CRT_LIBRAREIS
    libucrt.lib
    ucrt.lib
    ucrtd.lib
    libucrtd.lib)
endif()
SET(CMAKE_CONFIGURATION_TYPES "Debug;Release;RelWithDebInfo")

if(USE_SANITIZER)
  add_definitions("/fsanitize=address")

  LIST(APPEND ADDTIONAL_LIBRARIES
    "-fsanitize=address"
    "clang_rt.asan_dynamic-x86_64"
    "clang_rt.asan_dynamic_runtime_thunk-x86_64"
  )
endif()

# set(GLUT_INCLUDE_DIRS ${LIBDIR}/opengl/include)
# set(GLUT_LIBRARIES ${OPENGL_DIR}/lib/freeglut_static.lib)
