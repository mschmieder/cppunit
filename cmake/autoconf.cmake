###########################################################
# cppunit assumes that the a number of capabilities are 
# checked in order to support different features.
# 
# Within the original build system this is done by 
# 'autoconf'. This function replaces the autoconf functionality
# and create a given header file from the config.h.in.cmake file
# located at the source directory 
#
# will set the following defines if available:
#
#     CPPUNIT_FUNC_STRING_COMPARE_STRING_FIRST
#     CPPUNIT_HAVE_CLASS_STRSTREAM
#     CPPUNIT_HAVE_CMATH
#     CPPUNIT_HAVE_CXX11
#     CPPUNIT_HAVE_DLD
#     CPPUNIT_HAVE_DLERROR
#     CPPUNIT_HAVE_DLFCN_H
#     CPPUNIT_HAVE_FINITE
#     CPPUNIT_HAVE_GCC_ABI_DEMANGLE
#     CPPUNIT_HAVE_INTTYPES_H
#     CPPUNIT_HAVE_ISFINITE
#     CPPUNIT_HAVE_LIBDL
#     CPPUNIT_HAVE_MEMORY_H
#     CPPUNIT_HAVE_NAMESPACES
#     CPPUNIT_HAVE_SHL_LOAD
#     CPPUNIT_HAVE_SSTREAM
#     CPPUNIT_HAVE_STDINT_H
#     CPPUNIT_HAVE_STDLIB_H
#     CPPUNIT_HAVE_STRINGS_H
#     CPPUNIT_HAVE_STRING_H
#     CPPUNIT_HAVE_STRSTREAM
#     CPPUNIT_HAVE_SYS_STAT_H
#     CPPUNIT_HAVE_SYS_TYPES_H
#     CPPUNIT_HAVE_UNISTD_H
#     CPPUNIT_LT_OBJDIR
#     CPPUNIT_NDEBUG
#     CPPUNIT_PACKAGE
#     CPPUNIT_PACKAGE_BUGREPORT
#     CPPUNIT_PACKAGE_NAME
#     CPPUNIT_PACKAGE_STRING
#     CPPUNIT_PACKAGE_TARNAME
#     CPPUNIT_PACKAGE_URL
#     CPPUNIT_PACKAGE_VERSION
#     CPPUNIT_STDC_HEADERS
#     CPPUNIT_VERSION
###########################################################
# Generates include/cppunit/config-auto.h
# This is originally done by autoconf

include(CheckIncludeFile)
include(CheckIncludeFileCXX)
include(CheckCXXSourceCompiles)
include(CheckCSourceCompiles)
include(CheckLibraryExists)
include(CheckFunctionExists)
include(CheckCXXCompilerFlag)

#Not used == not seen in any *.h *.cpp files
#Not used FUNC_STRING_COMPARE_STRING_FIRST

check_cxx_compiler_flag("-std=c++11" HAVE_CXX11)
check_cxx_compiler_flag("-std=c++0x" HAVE_CXX0X)

if(HAVE_CXX0X)
  set(CPPUNIT_HAVE_CXX0X ${HAVE_CXX0X})
  set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++0x")
endif()
if(HAVE_CXX11)
  set(CPPUNIT_HAVE_CXX11 ${HAVE_CXX11})
  set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11")
endif()

check_include_file_cxx(sstream CPPUNIT_HAVE_SSTREAM)
check_include_file_cxx(strstream CPPUNIT_HAVE_STRSTREAM)

set(CMAKE_REQUIRED_DEFINITIONS -DHAVE_STRSTREAM=${CPPUNIT_HAVE_STRSTREAM})
check_cxx_source_compiles(
  "#ifdef HAVE_STRSTREAM
  # include <strstream>
  #else
  # include <strstream.h>
  #endif
  int main() {
  std::ostrstream message;
  message << \"Hello\";
  return 0;
  }" CPPUNIT_HAVE_CLASS_STRSTREAM)

check_include_file_cxx(cmath CPPUNIT_HAVE_CMATH)
#Not used, dld library is obsolete anyway HAVE_DLD

check_function_exists(dlerror CPPUNIT_HAVE_DLERROR)
check_include_file(dlfcn.h CPPUNIT_HAVE_DLFCN_H)

check_c_source_compiles(
  "#include <math.h>
  int main() {
  return finite(3);
  }" CPPUNIT_HAVE_FINITE)

check_c_source_compiles(
  "#include <math.h>
  int main() {
  return _finite(3);
  }" CPPUNIT_HAVE__FINITE)

check_include_file_cxx(cxxabi.h CPPUNIT_HAVE_GCC_ABI_DEMANGLE)
check_include_file_cxx(inttypes.h CPPUNIT_HAVE_INTTYPES_H)

check_c_source_compiles(
  "#include <math.h>
  int main() {
  return isfinite(3);
  }" CPPUNIT_HAVE_ISFINITE)

check_library_exists(dl dlopen "" CPPUNIT_HAVE_LIBDL)
check_include_file_cxx(memory.h HAVE_MEMORY_H)

check_cxx_source_compiles(
  "namespace Outer {
  namespace Inner {
  int i = 0;
  }
  }
  using namespace Outer::Inner;
  int main() {
  return i;
  }" CPPUNIT_HAVE_NAMESPACES)

check_cxx_source_compiles(
  "#include <typeinfo>
  class Base {
  public:
  Base() {}
  virtual int f() { return 0; }
  };
  class Derived : public Base {
  public:
  Derived() {}
  virtual int f() { return 1; }
  };
  int main() {
  Derived d;
  Base * ptr = &d;
  return typeid(*ptr) == typeid(Derived);
  }" CPPUNIT_HAVE_RTTI)

check_library_exists(dl shl_load "" CPPUNIT_HAVE_SHL_LOAD)

check_include_file_cxx(stdint.h CPPUNIT_HAVE_STDINT_H)
check_include_file_cxx(stdlib.h CPPUNIT_HAVE_STDLIB_H)
check_include_file_cxx(strings.h CPPUNIT_HAVE_STRINGS_H)
check_include_file_cxx(string.h CPPUNIT_HAVE_STRING_H)
check_include_file_cxx(sys/stat.h CPPUNIT_HAVE_SYS_STAT_H)
check_include_file_cxx(sys/types.h CPPUNIT_HAVE_SYS_TYPES_H)
check_include_file_cxx(unistd.h CPPUNIT_HAVE_UNISTD_H)

#Not used PACKAGE
#Not used PACKAGE_BUGREPORT
#Not used PACKAGE_NAME
#Not used PACKAGE_STRING
#Not used PACKAGE_TARNAME
#Not used PACKAGE_VERSION
#Not used STDC_HEADERS
check_include_file_cxx(typeinfo CPPUNIT_USE_TYPEINFO_NAME)