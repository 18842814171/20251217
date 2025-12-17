#!/bin/bash
# compileLib.sh - 修正版

output_dir="./build/lib"

if [ ! -d "$output_dir" ]; then
    mkdir -p "$output_dir"
fi

# 1. 编译C版本（修正-o位置）
aarch64-linux-gnu-gcc -c ./lib/sylib.c1 -fsingle-precision-constant -o "$output_dir/sylib.o"

# 2. 编译C++版本  
aarch64-linux-gnu-g++ -c ./lib/sylib.c1 -fsingle-precision-constant -o "$output_dir/sylib++.o"

# 3. 创建静态库（现在.o文件在正确位置）
ar rcs "$output_dir/sylib.a" "$output_dir/sylib.o"
ar rcs "$output_dir/sylib++.a" "$output_dir/sylib++.o"

# 4. 验证
echo "=== compiled fine ==="
ls -la "$output_dir/"*.{o,a} 2>/dev/null | awk '{print $9, $5" bytes"}'