# Find required executables
find_package(LATEX)
find_package(Doxygen REQUIRED)

# Add build options
option(CPPUNIT_BUILD_APIDOC_ALWAYS "Always builds the documentation when building"        OFF)
option(CPPUNIT_INSTALL_APIDOC      "Installs the doxygen-generated documentation"         OFF)
if(LATEX_COMPILER)
    option(CPPUNIT_BUILD_APIDOC_LATEX "Generate LaTex API documentation"                  OFF)
endif()

if(CPPUNIT_BUILD_APIDOC_LATEX)
    set(_CPPUNIT_GENERATE_LATEX "YES" CACHE INTERNAL "Variable for Doxyfile")
else()
    set(_CPPUNIT_GENERATE_LATEX "NO" CACHE INTERNAL "Variable for Doxyfile")
endif()

if(DOXYGEN_DOT_FOUND)
    set(_CPPUNIT_USE_DOT "YES" CACHE INTERNAL "Variable for using the Graphviz dot tool")
else()
    set(_CPPUNIT_USE_DOT "NO" CACHE INTERNAL "Variable for using the Graphviz dot tool")
endif()

# Setup config files
set(srcdir ${CMAKE_CURRENT_LIST_DIR})
set(outdir ${PROJECT_BINARY_DIR}/doc)

configure_file("${CMAKE_CURRENT_SOURCE_DIR}/Doxyfile.in"
               "${CMAKE_CURRENT_BINARY_DIR}/Doxyfile")

if(CPPUNIT_BUILD_APIDOC_ALWAYS)
    set(_cppunit_apidoc_all "ALL")
endif()

add_custom_target(apidoc ${_cppunit_apidoc_all}
    COMMAND             ${DOXYGEN_EXECUTABLE}
                        ${CMAKE_CURRENT_BINARY_DIR}/Doxyfile
    COMMENT             "Generating HTML documentation")

if(CPPUNIT_INSTALL_APIDOC)
    install(DIRECTORY ${PROJECT_BINARY_DIR}/doc/
        DESTINATION share/${CPPUNIT_VERSION}/doc COMPONENT doc)
endif()
