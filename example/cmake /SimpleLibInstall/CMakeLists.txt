cmake_minimum_required(VERSION 3.25)
project(SimpleLibInstall)

set(CMAKE_CXX_STANDARD 14)

set(CMAKE_INSTALL_PREFIX ${CMAKE_CURRENT_BINARY_DIR}/install)

add_library(SimpleLibInstall SHARED library.cpp)

install(
        TARGETS ${PROJECT_NAME}
        RUNTIME DESTINATION bin
        LIBRARY DESTINATION lib
        ARCHIVE DESTINATION lib
)