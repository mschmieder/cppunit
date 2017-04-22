set(DUMPERPLUGIN_SRC
  DumperListener.h     
  DumperListener.cpp   
  DumperPlugIn.cpp)

# add library target
add_library(DumperPlugIn
 ${DUMPERPLUGIN_SRC})

# link against cppunit
target_link_libraries(DumperPlugIn cppunit)

# setup install routine for DumperPlugIn target 
install(TARGETS DumperPlugIn EXPORT cppunit-exports
  INCLUDES DESTINATION "include"
  RUNTIME DESTINATION "bin"
  LIBRARY DESTINATION "lib"
  ARCHIVE DESTINATION "lib")