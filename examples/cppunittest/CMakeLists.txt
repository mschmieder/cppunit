set(CPPUNITTEST_SRC
  assertion_traitsTest.cpp
  assertion_traitsTest.h
  ExceptionTest.cpp
  ExceptionTest.h
  MessageTest.cpp
  MessageTest.h
  TestAssertTest.cpp
  TestAssertTest.h
  TestCallerTest.cpp
  TestCallerTest.h
  TestCaseTest.cpp
  TestCaseTest.h
  TestFailureTest.cpp
  TestFailureTest.h
  TestPathTest.cpp
  TestPathTest.h
  TestResultTest.cpp
  TestResultTest.h
  TestSuiteTest.cpp
  TestSuiteTest.h
  TestTest.cpp
  TestTest.h
  XmlUniformiser.cpp
  XmlUniformiser.h
  XmlUniformiserTest.cpp
  XmlUniformiserTest.h
  HelperMacrosTest.cpp
  HelperMacrosTest.h
  ExceptionTestCaseDecoratorTest.cpp
  ExceptionTestCaseDecoratorTest.h
  OrthodoxTest.cpp
  OrthodoxTest.h
  RepeatedTestTest.cpp
  RepeatedTestTest.h
  TestDecoratorTest.cpp
  TestDecoratorTest.h
  TestSetUpTest.cpp
  TestSetUpTest.h
  TestResultCollectorTest.cpp
  TestResultCollectorTest.h
  XmlOutputterTest.cpp
  XmlOutputterTest.h
  StringToolsTest.cpp
  StringToolsTest.h
  XmlElementTest.cpp
  XmlElementTest.h
  BaseTestCase.cpp
  BaseTestCase.h
  FailureException.h
  MockFunctor.h
  MockProtector.h
  MockTestCase.cpp
  MockTestCase.h
  MockTestListener.cpp
  MockTestListener.h
  SubclassedTestCase.cpp
  SubclassedTestCase.h
  SynchronizedTestResult.h
  TrackedTestCase.cpp
  TrackedTestCase.h
  CoreSuite.h
  CppUnitTestSuite.cpp
  ExtensionSuite.h
  HelperSuite.h
  OutputSuite.h
  ToolsSuite.h
  UnitTestToolSuite.h
  CppUnitTestMain.cpp
  )

# create executable
add_executable(CppUnitTestMain ${CPPUNITTEST_SRC})

# link against cppunit
target_link_libraries(CppUnitTestMain cppunit)

# set executable debug postfix
set_target_properties(CppUnitTestMain PROPERTIES 
  DEBUG_POSTFIX ${CMAKE_DEBUG_POSTFIX})

# install target to <INSTALL_PREFIX>/bin folder
install(TARGETS CppUnitTestMain
  RUNTIME DESTINATION "bin"
  COMPONENT "misc")

set(CPPUNIT_TEST_PLUGIN_SRC 
  CoreSuite.h
  CppUnitTestSuite.cpp
  # CppUnitTestSuite.h <-- does not exist, but mentioned in *.dsp file
  ExtensionSuite.h
  HelperSuite.h
  OutputSuite.h
  ToolsSuite.h
  UnitTestToolSuite.h
  BaseTestCase.cpp
  BaseTestCase.h
  FailureException.h
  MockFunctor.h
  MockProtector.h
  MockTestCase.cpp
  MockTestCase.h
  MockTestListener.cpp
  MockTestListener.h
  SubclassedTestCase.cpp
  SubclassedTestCase.h
  SynchronizedTestResult.h
  TrackedTestCase.cpp
  TrackedTestCase.h
  ExceptionTest.cpp
  ExceptionTest.h
  MessageTest.cpp
  MessageTest.h
  TestAssertTest.cpp
  TestAssertTest.h
  TestCallerTest.cpp
  TestCallerTest.h
  TestCaseTest.cpp
  TestCaseTest.h
  TestFailureTest.cpp
  TestFailureTest.h
  TestPathTest.cpp
  TestPathTest.h
  TestResultTest.cpp
  TestResultTest.h
  TestSuiteTest.cpp
  TestSuiteTest.h
  TestTest.cpp
  TestTest.h
  XmlUniformiser.cpp
  XmlUniformiser.h
  XmlUniformiserTest.cpp
  XmlUniformiserTest.h
  HelperMacrosTest.cpp
  HelperMacrosTest.h
  ExceptionTestCaseDecoratorTest.cpp
  ExceptionTestCaseDecoratorTest.h
  OrthodoxTest.cpp
  OrthodoxTest.h
  RepeatedTestTest.cpp
  RepeatedTestTest.h
  TestDecoratorTest.cpp
  TestDecoratorTest.h
  TestSetUpTest.cpp
  TestSetUpTest.h
  TestResultCollectorTest.cpp
  TestResultCollectorTest.h
  XmlOutputterTest.cpp
  XmlOutputterTest.h
  StringToolsTest.cpp
  StringToolsTest.h
  XmlElementTest.cpp
  XmlElementTest.h
  CppUnitTestPlugIn.cpp)


# add library target
add_library(CppUnitTestPlugIn
   ${CPPUNIT_TEST_PLUGIN_SRC})

# link against cppunit
target_link_libraries(CppUnitTestPlugIn cppunit)

# setup install routine for CppUnitTestPlugIn target 
install(TARGETS CppUnitTestPlugIn EXPORT cppunit-exports
    COMPONENT "misc"
    INCLUDES DESTINATION "include"
    RUNTIME DESTINATION "bin"
    LIBRARY DESTINATION "lib"
    ARCHIVE DESTINATION "lib")