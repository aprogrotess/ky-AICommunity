#include <iostream>
#include "sub.h"
#include "third.h"

//#include "sub.h"  // 写了target_include_directories头文件搜索路径
//#include "SubLib/include/sub.h"  // 不写头文件搜索路径，则提供全路径
//#include "ThridLib/include/third.h"

int main() {
    sub s;
    s.printHello();
    std::cout << s.doSub(1, 2) << std::endl;

    third t;
    t.useSub();
    return 0;
}
