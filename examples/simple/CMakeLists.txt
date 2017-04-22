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
        RUNTIME DESTINATION "bin")