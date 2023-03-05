cmake_minimum_required(VERSION 3.25)
project(SimpleLib)

set(CMAKE_CXX_STANDARD 14)
set(CMAKE_VERBOSE_MAKEFILE ON)

include(cmake/InstallTools.cmake)

add_subdirectory(SubLib)
add_subdirectory(ThridLib)

add_executable(SimpleLib main.cpp)
target_include_directories(${PROJECT_NAME} PRIVATE SubLib/include)
target_link_libraries(${PROJECT_NAME} SubLib Third)

