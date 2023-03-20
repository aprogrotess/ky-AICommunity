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


add_executable(FuncAndMarco main.cpp)
