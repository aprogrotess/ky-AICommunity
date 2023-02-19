project(Third)

include_directories(include)

add_library(${PROJECT_NAME} src/third.cpp)

target_include_directories(${PROJECT_NAME} PRIVATE ../SubLib/include)
target_link_libraries(${PROJECT_NAME} SubLib)