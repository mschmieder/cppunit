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

# add library target
add_library(ClockerPlugin
   ${CLOCKER_PLUGIN_SRC})

# link against cppunit
target_link_libraries(ClockerPlugin cppunit)

# setup install routine for ClockerPlugin target 
install(TARGETS ClockerPlugin EXPORT cppunit-exports
    COMPONENT "misc"
    INCLUDES DESTINATION "include"
    RUNTIME DESTINATION "bin"
    LIBRARY DESTINATION "lib"
    ARCHIVE DESTINATION "lib")