#!/bin/bash

output_dir="./build/lib"

if [ ! -d "$output_dir" ]; then
    mkdir -p "$output_dir"
fi

aarch64-linux-gnu-gcc -x c -c ./lib/sylib.c1 -fsingle-precision-constant -o ./build/sylib.o
aarch64-linux-gnu-g++ -x c++ -c ./lib/sylib.c1 -fsingle-precision-constant -o ./build/sylib++.o
ar rcs ./build/lib/sylib.a ./build/sylib.o
ar rcs ./build/lib/sylib++.a ./build/sylib++.o
rm ./build/sylib.o
rm ./build/sylib++.o