# 下面通常放在最外面的cmake初始化一次就好了
# 导入cmake标准库，这里面的常量通常用于标准库的名字指定
include(GNUInstallDirs)
# 创建config文件用的
include(CMakePackageConfigHelpers)
# 设置文件安装位置
set(CMAKE_INSTALL_PREFIX ${CMAKE_CURRENT_BINARY_DIR}/install)

function(funInstall
        target_name
        head_dir
        head_list
        source_list
        build_for_shared
        )

    # funInstall 函数名字
    # target_name, 模块的project_name
    # head_dir, 头文件路径
    # head_list, 头文件列表
    # source_list, cpp文件列表用于编译
    # build_for_shared, 是否编译为动态库


    message(STATUS "${target_name} Input info list: ")
    message(STATUS "  Target name: ${target_name}")
    message(STATUS "  Head dir: ${head_dir}")
    message(STATUS "  Head list: ${head_list}")
    message(STATUS "  Source list: ${source_list}")
    message(STATUS "  Build shared: ${build_for_shared}")


    # 创建对象，并指定生成的库文件类型
    if(${build_for_shared})
        add_library(${target_name} SHARED ${source_list})
    else()
        add_library(${target_name} STATIC ${source_list})
    endif()

    # 设置安装的cmake头文件搜索路径(相对搜索)
    # 注意用法和常规的不同
    target_include_directories(${target_name}
            INTERFACE
                $<BUILD_INTERFACE:${head_dir}>
                $<INSTALL_INTERFACE:${CMAKE_INSTALL_INCLUDEDIR}>
    )

    # 设置需要安装的头文件
    # 这里还能设置许多编译行为
    set_target_properties(${target_name}
            PROPERTIES
                PUBLIC_HEADER ${head_list}
                LINKER_LANGUAGE CXX
    )

    # 设置安装属性
    # 并安装相关lib以及head
    # 同时导出target
    install(
            TARGETS ${target_name}
            EXPORT ${target_name}Targets
            PUBLIC_HEADER DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}
            RUNTIME DESTINATION bin
            LIBRARY DESTINATION lib
            ARCHIVE DESTINATION lib
    )
    # 如果设定target的头文件属性，就可以按照下面的写法手动安装
#    install(FILES ${head_list} DESTINATION ${CMAKE_INSTALL_INCLUDEDIR})

    # 安装target对象，并设定供外界使用的命名空间
    install(
            EXPORT ${target_name}Targets
            FILE ${target_name}Targets.cmake
            DESTINATION ${CMAKE_INSTALL_DATADIR}/${target_name}/cmake
            NAMESPACE ${target_name}::
    )

    # 生成config文件
    # 这里的cmake.in实际上是自己的target模块搜索方法
    # 这里偷懒直接网上考了一个
    configure_package_config_file(
            ${CMAKE_SOURCE_DIR}/cmake/NeedOpenCV.cmake.in
            ${CMAKE_CURRENT_BINARY_DIR}/${target_name}Config.cmake
            INSTALL_DESTINATION ${CMAKE_INSTALL_DATADIR}/${target_name}/cmake
    )

    # 安装config文件
    install(
            FILES ${CMAKE_CURRENT_BINARY_DIR}/${target_name}Config.cmake
            DESTINATION ${CMAKE_INSTALL_DATADIR}/${target_name}/cmake
    )



endfunction()