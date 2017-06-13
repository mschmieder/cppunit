set(SIMPLE_SRC
  ExampleTestCase.cpp
  Main.cpp
  ExampleTestCase.h
  )

# create executable
add_executable(simple ${SIMPLE_SRC})

# link against cppunit
target_link_libraries(simple cppunit)

# set executable debug postfix
set_target_properties(simple PROPERTIES 
  DEBUG_POSTFIX ${CMAKE_DEBUG_POSTFIX})

# install target to <INSTALL_PREFIX>/bin folder
install(TARGETS simple
    RUNTIME DESTINATION "bin"
    COMPONENT "misc")

set(SIMPLE_PLUGIN_SRC
  SimplePlugIn.cpp
  ExampleTestCase.cpp
  ExampleTestCase.h
  )

# create executable
add_library(simple_plugin ${SIMPLE_PLUGIN_SRC})

# link against cppunit
target_link_libraries(simple_plugin cppunit)

# set executable debug postfix
set_target_properties(simple_plugin PROPERTIES 
  DEBUG_POSTFIX ${CMAKE_DEBUG_POSTFIX})

# setup install routine for ClockerPlugin target 
install(TARGETS simple_plugin EXPORT cppunit-exports
    COMPONENT "misc"
    INCLUDES DESTINATION "include"
    RUNTIME DESTINATION "bin"
    LIBRARY DESTINATION "lib"
    ARCHIVE DESTINATION "lib")