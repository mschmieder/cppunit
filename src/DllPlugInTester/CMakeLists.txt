# Create plugin tester executable
set(PLUGINTESTER_SOURCES
    CommandLineParser.cpp
    DllPlugInTester.cpp)

add_executable(DllPluginTester ${PLUGINTESTER_SOURCES})
target_link_libraries(DllPluginTester cppunit)

install(TARGETS DllPluginTester
    RUNTIME DESTINATION "bin" 
    COMPONENT "misc")

if(CPPUNIT_BUILD_TESTING)
    # Create plugin tester test executable
    set(PLUGINTESTER_TEST_SOURCES
        CommandLineParser.cpp
        CommandLineParserTest.cpp
        DllPlugInTesterTest.cpp)

    add_executable(DllPluginTesterTest ${PLUGINTESTER_TEST_SOURCES})
    target_link_libraries(DllPluginTesterTest cppunit)

    add_test(NAME DllPluginTesterTest 
       COMMAND DllPluginTesterTest)

    # install target to <INSTALL_PREFIX>/bin folder
    install(TARGETS DllPluginTesterTest
        RUNTIME DESTINATION "bin" 
        COMPONENT "misc")
endif()
