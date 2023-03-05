# 发布CMAKE标准的静态库和动态库

## Cmake的xxxConfig.cmake文件

通常cmake标准的发布采用一个Config多个Target的方式

- Config通常描述了目标的相对位置
  - `get_filename_component(PACKAGE_PREFIX_DIR "${CMAKE_CURRENT_LIST_DIR}/../../../" ABSOLUTE)`
- 在使用`find_package`的时候，会从这个config文件的绝对路径开始，进行相对位置跳转
  - 如果库文件繁多，那么就会有很多的相对路径跳转了
  - 我个人能力有限，基本只能写一些简单的，所以生成出来的就会有一定的可读性
- xxxTarget.cmake会被加入到config中
  - `include("${CMAKE_CURRENT_LIST_DIR}/cvcudaImplTargets.cmake")`
  - 这样子导入config的时候，会同步初始化**子模块**
  - 每个target实际上就是代表着子模块用到了那些头文件，库文件等，方便后续使用者进行导入



## 图示

