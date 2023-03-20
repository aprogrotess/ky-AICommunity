# 如何编写CMAKE的函数以及宏

## 函数以及宏函数

计算机学生对函数都比较熟悉，cmake的函数用起来也是一样的

- 变量有自己的作用域，和外界有一定的隔离

宏函数在用法上和cmake的函数没有什么特别的区别，主要区别在于函数作用域

- 它实际上更象是在调用位置展开，然后执行执行的一段随时调用的话
- opencv大量运用宏函数来组织编译（他有很多变量离开了当前的cmake就无法起作用，函数会很难写)

从参数角度来看，二者的参数都是可以不定长的，这点上没有什么区别

## CMAKE的函数

```cmake
cmake_minimum_required(VERSION 3.25)
project(FuncAndMarco)

set(CMAKE_CXX_STANDARD 14)

# 准备一些变量
set(arg1 111)
set(arg2 222)
set(argList 333 5555)

function(DemoFunc a1 a2 aList)
    message(STATUS "I Am DemoFunc")
    message(STATUS "  a1 is: ${a1}, a2 is: ${a2}")
    message(STATUS "  aList is: ${argList}")

    set(arg1 "hh")  # 局部变量无效
    message(STATUS "  Change arg1 is: ${arg1}")
endfunction()


DemoFunc(${arg1} ${arg2} "${argList}")
message(STATUS "After Function")
message(STATUS "  arg1 is: ${arg1}, arg2 is: ${arg2}")
message(STATUS "  argList is: ${argList}")
```

### Marco宏函数

```cmake
macro(DemoMarco a1)
    message(STATUS "marco arg is: ")
    message(STATUS "  ARGN: ${ARGN}")
    message(STATUS "  ARGC: ${ARGC}")
    message(STATUS "  ARGV: ${ARGV}")
    message(STATUS "  ARGV2: ${ARGV2}")

    foreach(each_value ${ARGV})
        message(STATUS "each_value is: ${each_value}")
    endforeach()

    set(a1 "hh")  # 无效
    set(arg1 "hh")  # 有效
endmacro()

DemoMarco(${arg1} ${arg2} "${argList}")
message(STATUS "After Marco")
message(STATUS "  arg1 is: ${arg1}, arg2 is: ${arg2}")
message(STATUS "  argList is: ${argList}")
```

