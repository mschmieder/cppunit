#***************************************************************************
# Copyright:  Matthias Schmieder,
# E-Mail:     schmieder.matthias@gmail.com
# Year:       2016
#***************************************************************************
cmake_minimum_required(VERSION 3.0)


# Set a consistent MACOSX_RPATH default across all CMake versions. 
# When CMake 2.8.12 is required, change this default to 1.
# When CMake 3.0.0 is required, remove this block (see CMP0042).
if(NOT DEFINED CMAKE_MACOSX_RPATH)
  set(CMAKE_MACOSX_RPATH 0)
endif()

project("cppunit")


# set cppunit version
set(CPPUNIT_MAJOR_VERSION 1)
set(CPPUNIT_MINOR_VERSION 14)
set(CPPUNIT_MICRO_VERSION 0)
set(CPPUNIT_VERSION   "${CPPUNIT_MAJOR_VERSION}.${CPPUNIT_MINOR_VERSION}.${CPPUNIT_MICRO_VERSION}" CACHE STRING "Version of cppunit")
set(CPPUNIT_SOVERSION "${CPPUNIT_MAJOR_VERSION}.${CPPUNIT_MINOR_VERSION}" CACHE STRING "Version of cppunit used for *.so files")

# add module path
list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_LIST_DIR}/cmake")

# invokes checks for compiler and system specifics
include(autoconf)

# Add default option to build shared libraries
option(BUILD_SHARED_LIBS       "Global flag to cause add_library to create shared libraries if ON" ON)
option(CPPUNIT_BUILD_TESTING   "Enables testing with CTest and adds a 'test' target"               OFF)
option(CPPUNIT_BUILD_EXAMPLES  "Enables the build of all exmaples"                                 OFF)
option(CPPUNIT_BUILD_APIDOC    "Enables the build of api doc"                                      OFF)

if(CPPUNIT_BUILD_TESTING)
    enable_testing()
endif()

# after having checked all defines, create config file
configure_file(config.h.in.cmake ${PROJECT_BINARY_DIR}/cppunit/config-auto.h)
install(FILES ${PROJECT_BINARY_DIR}/cppunit/config-auto.h
        DESTINATION include/cppunit)

# set cmake debug postfix to d
set(CMAKE_DEBUG_POSTFIX "d")

# add default include directories 
include_directories(${PROJECT_BINARY_DIR})

# add source directory
add_subdirectory("src")


if(CPPUNIT_BUILD_EXAMPLES)
  add_subdirectory("examples")
endif()

if(CPPUNIT_BUILD_APIDOC)
    add_subdirectory("doc")
endif()

# install public headers
install(DIRECTORY "include/cppunit"
        DESTINATION "include/cppunit")

