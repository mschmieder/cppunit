set(HIERARCHY_SRC
  BoardGame.cpp 
  Chess.cpp 
  main.cpp 
  BoardGame.h 
  Chess.h 
  BoardGameTest.h 
  ChessTest.h
  )

add_executable(hierarchy ${HIERARCHY_SRC})
target_link_libraries(hierarchy cppunit)

set_target_properties(hierarchy PROPERTIES 
  DEBUG_POSTFIX ${CMAKE_DEBUG_POSTFIX})

install(TARGETS hierarchy
  RUNTIME DESTINATION "bin"
  COMPONENT "misc")