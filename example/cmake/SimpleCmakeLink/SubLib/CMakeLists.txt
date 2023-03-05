project(SubLib)

set(target_name ${PROJECT_NAME})
set(head_dir ${CMAKE_CURRENT_SOURCE_DIR}/include)
set(head_list include/sub.h)
set(source_list ${head_list} src/sub.cpp)
set(build_for_shared ON)

funInstall(${target_name} ${head_dir} "${head_list}"
        "${source_list}" ${build_for_shared})

include_directories(include)
#add_library(${PROJECT_NAME} src/sub.cpp)
