#!/bin/bash
source_file="$1" # e.g., tests/functional/gameoflife-gosper.sy
target_file="$2" # e.g., build/custom/gameoflife-gosper.out

# Get the base name without .out (e.g., build/custom/gameoflife-gosper)
base_path="${target_file%.*}"

# 1. Compile .sy to clean .ll
./build/compiler -S -o "${base_path}.ll" "$source_file" -O1 -ir

# 2. Compile .ll to clean .s
llc -march=aarch64 -mcpu=cortex-a53 -filetype=asm "${base_path}.ll" -o "${base_path}.s"

# 3. Link .s to an extensionless ELF file
aarch64-linux-gnu-g++ "${base_path}.s" -include lib/sylib.h1 -L build/lib -l:sylib.a -o "${base_path}"

# 4. Create the .out file (the test driver expects this specifically)
cp "${base_path}" "$target_file"