

# 如何使用cmake

::: tip
c/c++的工程化是一个学习比较痛苦的过程，需要更多的耐心

:::

## 什么是cmake
c/cxx从代码变成二进制通常由以下几个步骤实现:
1. 将代码翻译成汇编码，并检索依赖关系
2. 搜索机器中指定位置（通常用户传入）的静态库/动态库
3. 和当前代码建立链接，并转换为elf格式的文件(可执行文件)

---

cmake是一个代码的组织工具，他的目的就是为了组织三个步骤
> 否则自己一个个用gcc/g++编译, 文件一多怕不是凉凉
> 
> 何况开发的时候还要使用大量的三方库

通过cmake，可以将代码进行分层组织
- 通常由多个静态库(a/lib)以及多个动态库(dll/so)组成
- 这些库由项目子模块编译而成,并通常交给其他模块使用
- 在cmake中通常使用自行定义的`PROJECT_NAME`来把自己的模块加入别的模块进行编译

如果使用了三方库，只要它满足cmake的路径搜索语法
- 那么就可以省略自行指定搜索路径以及具体需要哪一个库的繁杂编译指令
- 他会自动记录用到的这些库位置，并为后续服务
- 如今的cmake加入了检查时编译等函数库(根据提供的仓库地址，尝试自行编译的功能)
    - 这方便了开发者减少了自行编译各个依赖的问题
    

最后cmake作为一个中间层，会给各个编译器输出所需要的代码编译过程:
- 比如linux对应的就是`makefile`，里面记录了gcc/g++每一行怎么执行的过程
    - 如果报错可以查看是缺了啥，然后去cmake里补上重新生成
- windows就是ms编译器的`sln`工程
- 以及转化出最近较新的编译器`ninja`的编译执行流程等

所以掌握cmake是让c/c++进入工程化的必要学习工具


## leaning cmake with demo

::: tip
Demo请查看仓库`example/cmake`部分

通常这些demo由clion进行编写, 并在linux上执行通过
windows在编译环节上会有比较大的差异，需要自行判断

:::

- CMAKE简单入门:
  - [CMAKE简单使用](./SimpleUse.md)


- CXX模块化:
  - [CMAKE进行模块组织](./SimpleLib.md)
  - [CMAKE子模块间的相互调用](./SimpleLibInteract.md)

- CMAKE进行包发布:
  - [静态库和动态库以及编译器](./LibSoCompile.md)
  - [发布自己的静态库和动态库](./SimpleLibInstall.md)
  - [发布CMAKE标准的静态库和动态库](./SimpleCmakeInstall.md)
  - [链接常规的静态库和动态库](./SimpleLink.md)
  - [链接CMAKE标准的静态库和动态库](./SimpleCmakeLink.md)
- CMAKE组织三方到工程
  - [三方库的Compile](./ThirdPartCompile.md)
  - 编写FindXXX，补其三方库以及链接
  - 组织opencv-cuda以及cuda到程序中
- CMAKE的持续学习：
  - 如何编写CMAKE的函数以及宏
  - CMAKE自动编译三方库
  - OPTION开关模块
