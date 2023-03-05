//
// Created by tacom on 23-2-19.
//
#include "sub.h"
#include "third.h"
#include "iostream"

void third::useSub() {
    sub s;
    s.printHello();
    std::cout << "i was third, now use sub" << s.doSub(1, 1) << std::endl;
}
