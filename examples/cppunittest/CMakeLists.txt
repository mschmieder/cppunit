set(CPPUNITTEST_SRC
  assertion_traitsTest.cpp 
  assertion_traitsTest.h 
  BaseTestCase.cpp 
  BaseTestCase.h 
  CoreSuite.h 
  CppUnitTestMain.cpp 
  CppUnitTestSuite.cpp 
  ExceptionTest.cpp 
  ExceptionTest.h 
  ExceptionTestCaseDecoratorTest.h 
  ExceptionTestCaseDecoratorTest.cpp 
  ExtensionSuite.h 
  FailureException.h 
  HelperMacrosTest.cpp 
  HelperMacrosTest.h 
  HelperSuite.h 
  MessageTest.h 
  MessageTest.cpp 
  MockFunctor.h 
  MockProtector.h 
  MockTestCase.h 
  MockTestCase.cpp 
  MockTestListener.cpp 
  MockTestListener.h 
  OrthodoxTest.cpp 
  OrthodoxTest.h 
  OutputSuite.h 
  RepeatedTestTest.cpp 
  RepeatedTestTest.h 
  StringToolsTest.h 
  StringToolsTest.cpp 
  SubclassedTestCase.cpp 
  SubclassedTestCase.h 
  SynchronizedTestResult.h 
  TestAssertTest.cpp 
  TestAssertTest.h 
  TestCallerTest.cpp 
  TestCallerTest.h 
  TestCaseTest.cpp 
  TestCaseTest.h 
  TestDecoratorTest.cpp 
  TestDecoratorTest.h 
  TestFailureTest.cpp 
  TestFailureTest.h 
  TestPathTest.h 
  TestPathTest.cpp 
  TestResultCollectorTest.cpp 
  TestResultCollectorTest.h 
  TestResultTest.cpp 
  TestResultTest.h 
  TestSetUpTest.cpp 
  TestSetUpTest.h 
  TestSuiteTest.cpp 
  TestSuiteTest.h 
  TestTest.cpp 
  TestTest.h 
  ToolsSuite.h 
  TrackedTestCase.cpp 
  TrackedTestCase.h 
  UnitTestToolSuite.h 
  XmlElementTest.h 
  XmlElementTest.cpp 
  XmlOutputterTest.h 
  XmlOutputterTest.cpp 
  XmlUniformiser.h 
  XmlUniformiser.cpp 
  XmlUniformiserTest.h 
  XmlUniformiserTest.cpp
)

# create executable
add_executable(cppunittestmain ${CPPUNITTEST_SRC})

# link against cppunit
target_link_libraries(cppunittestmain cppunit)

# set executable debug postfix
set_target_properties(cppunittestmain PROPERTIES 
                      DEBUG_POSTFIX ${CMAKE_DEBUG_POSTFIX})

# install target to <INSTALL_PREFIX>/bin folder
install(TARGETS cppunittestmain
        RUNTIME DESTINATION "bin")
