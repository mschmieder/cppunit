set(CPPUNIT_SRC 
    AdditionalMessage.cpp
    Asserter.cpp
    BriefTestProgressListener.cpp
    CompilerOutputter.cpp
    DefaultProtector.cpp
    DynamicLibraryManager.cpp
    DynamicLibraryManagerException.cpp
    Exception.cpp
    Message.cpp
    PlugInManager.cpp
    PlugInParameters.cpp
    Protector.cpp
    ProtectorChain.cpp
    RepeatedTest.cpp
    ShlDynamicLibraryManager.cpp
    SourceLine.cpp
    StringTools.cpp
    SynchronizedObject.cpp
    Test.cpp
    TestAssert.cpp
    TestCase.cpp
    TestCaseDecorator.cpp
    TestComposite.cpp
    TestDecorator.cpp
    TestFactoryRegistry.cpp
    TestFailure.cpp
    TestLeaf.cpp
    TestNamer.cpp
    TestPath.cpp
    TestPlugInDefaultImpl.cpp
    TestResult.cpp
    TestResultCollector.cpp
    TestRunner.cpp
    TestSetUp.cpp
    TestSuccessListener.cpp
    TestSuite.cpp
    TestSuiteBuilderContext.cpp
    TextOutputter.cpp
    TextTestProgressListener.cpp
    TextTestResult.cpp
    TextTestRunner.cpp
    TypeInfoHelper.cpp
    UnixDynamicLibraryManager.cpp
    XmlDocument.cpp
    XmlElement.cpp
    XmlOutputter.cpp
    XmlOutputterHook.cpp)

set(CPPUNIT_HEADER
    DefaultProtector.h
    ProtectorChain.h 
    ProtectorContext.h)


# on windows shared build we need to add the DllMain.cpp
if(WIN32 AND BUILD_SHARED_LIBS)
    list(APPEND CPPUNIT_SRC 
                DllMain.cpp    
                Win32DynamicLibraryManager.cpp)
endif()

# Platform specific source files
# Microsoft Windows
if(WIN32)
    list(APPEND CPPUNIT_SRC
        DllMain.cpp
        Win32DynamicLibraryManager.cpp)
# Unix based systems
elseif(UNIX)
    list(APPEND CPPUNIT_SRC
        UnixDynamicLibraryManager.cpp)
    if(CPPUNIT_HAVE_UNIX_SHL_LOADER)
        list(APPEND CPPUNIT_SRC
             ShlDynamicLibraryManager.cpp)
    endif()
# BeOS
elseif(CMAKE_SYSTEM_NAME MATCHES "BeOS.*")
    list(APPEND CPPUNIT_SRC
         BeOsDynamicLibraryManager.cpp)
endif()
           
# add the cppunit library
add_library(cppunit ${CPPUNIT_SRC} ${CPPUNIT_HEADER})

# setup cppunit include directories
target_include_directories(cppunit PUBLIC
                           $<BUILD_INTERFACE:${PROJECT_SOURCE_DIR}/include>
                           $<INSTALL_INTERFACE:include>)

target_link_libraries(cppunit ${CPPUNIT_COMMON_LIBS})

if(WIN32 AND BUILD_SHARED_LIBS)
  # windows dlls have specific naming so let's set them up correctly
  # lib\:
  # cppunit.lib         : CppUnit static library "Multithreaded DLL"
  # cppunitd.lib        : CppUnit static library "Debug Multithreaded DLL"
  # cppunit_dll.dll     : CppUnit dynamic library (DLL) "Multithreaded DLL"
  # cppunit_dll.lib     : CppUnit dynamic import library "Multithreaded DLL"
  # cppunitd_dll.dll    : CppUnit dynamic library (DLL) "Debug Multithreaded DLL"
  # cppunitd_dll.lib    : CppUnit dynamic import library "Debug Multithreaded DLL"
  set_target_properties(cppunit
                        PROPERTIES
                        DEBUG_POSTFIX "d_dll"
                        RELEASE_POSTFIX "_dll")

  # add flags for dll exports
  target_compile_options(cppunit PRIVATE "-DCPPUNIT_BUILD_DLL")
  target_compile_options(cppunit PUBLIC "$<INSTALL_INTERFACE:-DCPPUNIT_BUILD_DLL>")
endif()

set_target_properties(cppunit
                      PROPERTIES
                      VERSION ${CPPUNIT_VERSION}
                      SOVERSION ${CPPUNIT_SOVERSION}) 

# setup install routine for cppunit target 
install(TARGETS cppunit EXPORT cppunitConfig
        INCLUDES DESTINATION "include"
        RUNTIME DESTINATION "bin"
        LIBRARY DESTINATION "lib"
        ARCHIVE DESTINATION "lib"
        COMPONENT "Library")

# create cmake export for cppunit for easy import into other cmake projects
install(EXPORT cppunitConfig
        DESTINATION "cmake")