set(MONEY_SRC
  Money.h
  MoneyTest.h
  MoneyTest.cpp
  MoneyApp.cpp
  StdAfx.h
  )

# create executable
add_executable(money ${MONEY_SRC})

# link against cppunit
target_link_libraries(money cppunit)

# set executable debug postfix
set_target_properties(money PROPERTIES 
  DEBUG_POSTFIX ${CMAKE_DEBUG_POSTFIX})

# install target to <INSTALL_PREFIX>/bin folder
install(TARGETS money
  RUNTIME DESTINATION "bin"
  COMPONENT "misc")