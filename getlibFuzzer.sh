#!/bin/bash

svn co https://llvm.org/svn/llvm-project/compiler-rt/trunk/lib/fuzzer Fuzzer
cd Fuzzer
clang++ -c -g -O2 -std=c++11 *.cpp
ar r libFuzzer.a *.o
ranlib libFuzzer.a
