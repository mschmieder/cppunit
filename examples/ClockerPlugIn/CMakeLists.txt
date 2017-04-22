set(CLOCKER_PLUGIN_SRC
  WinNtTimer.h
  WinNtTimer.cpp
  Timer.h
  ClockerListener.h
  Timer.cpp
  ClockerListener.cpp
  ClockerPlugIn.cpp
  ClockerModel.h
  ClockerModel.cpp
  ClockerXmlHook.h
  ClockerXmlHook.cpp
)

# create executable
add_executable(ClockerPlugin ${CLOCKER_PLUGIN_SRC})

# link against cppunit
target_link_libraries(ClockerPlugin cppunit)

# set executable debug postfix
set_target_properties(ClockerPlugin PROPERTIES 
                      DEBUG_POSTFIX ${CMAKE_DEBUG_POSTFIX})

# install target to <INSTALL_PREFIX>/bin folder
install(TARGETS ClockerPlugin
        RUNTIME DESTINATION "bin")