# Include the current binary dir, so files produced by moc can be found
include_directories(${CMAKE_CURRENT_BINARY_DIR})

set(cppunit-simple_SOURCES
    ExampleTestCase.cpp
)

# Create the test executable
add_executable(cppunit-simple-bin Main.cpp ${cppunit-simple_SOURCES})
target_link_libraries(cppunit-simple-bin cppunit)

# Create the test plugin
add_library(cppunit-simple-plugin MODULE SimplePlugIn.cpp ${cppunit-simple_SOURCES})
target_link_libraries(cppunit-simple-plugin cppunit)

# Create install target
install(TARGETS cppunit-simple-bin
    DESTINATION share/${CPPUNIT_VERSION}/examples COMPONENT examples)

install(TARGETS cppunit-simple-plugin
     DESTINATION share/${CPPUNIT_VERSION}/examples COMPONENT examples)
