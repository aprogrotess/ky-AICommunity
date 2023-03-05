cmake_minimum_required(VERSION 3.25)
project(SimpleLibInstall)

set(CMAKE_CXX_STANDARD 14)

set(CMAKE_INSTALL_PREFIX ${CMAKE_CURRENT_BINARY_DIR}/install)

#add_library(SimpleLibInstall STATIC library.cpp)
#
#install(
#        TARGETS ${PROJECT_NAME}
#        RUNTIME DESTINATION bin
#        LIBRARY DESTINATION lib
#        ARCHIVE DESTINATION lib
#)
#install(FILES library.h DESTINATION include)

include_directories(${CMAKE_INSTALL_PREFIX}/include)
link_directories(${CMAKE_INSTALL_PREFIX}/lib)
add_executable(${PROJECT_NAME} main.cpp)
target_link_libraries(${PROJECT_NAME} libSimpleLibInstall.a)