---
sidebar: auto
---

# CMAKE组织子模块

## 建立文件结构

![image-20230219141413378](./assets/image-20230219141413378.png)

```
SimpleLib
	|- SubLib
		|- CMakeLists.txt
		|- include
			| - sub.h
	    |- src
			| - sub.cpp
	|- main.cpp
	|- CMakeLists.txt
```

简单的来说就是用`main.cpp`去调用`SubLib`里的内容，这种形式最适合`一个主对象，调用多个没有交互的子模块`

- 子模块间如何平行相互调用，则需要其他方法传递自己的对象信息
- 也就是`多叉树`, 顶部的`CmakeLists`代表这个树的顶点，其余子模块代表分支，分支之间不能直接通信
  - 需要提交给顶部节点进行中转，或者使用`cmake`的`cache`系统



## Cmake解析

![image-20230219142722640](./assets/image-20230219142722640.png)

- 子模块(SubLib)`的cmake使用`include_directories将头文件搜索路径加入，从而让`sub.cpp`知道自己的头文件在哪里，并编译cpp为一个lib
- 主cmake将**路径**`SubLib`，加入此工程中，cmake立刻进入此目录递归搜索模块，发现了子模块的对象名字`SubLib`
- 主cmake将main.cpp编译成可执行文件，并告诉编译器`main.cpp`需要的头文件来自`SubLib/include`文件夹，需要链接的Target是`SubLib`



## 编译生成的文件

![image-20230219143835553](./assets/image-20230219143835553.png)

- 子模块在cmake的指挥下，编译成了一个叫`libSubLib.a`的静态库

![image-20230219144824620](./assets/image-20230219144824620.png)

- 以及在cmake的指挥中，被g++链接到了主程序二进制中并最终生成执行文件
