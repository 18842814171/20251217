#!/bin/bash

source_file="$1"
target_file="$2"

out_dir=$(dirname "$target_file")
mkdir -p "$out_dir"

mid_ll="${target_file}.ll"
mid_s="${target_file}.s"

./build/compiler -S "$source_file" -o "$mid_ll" -O1 -ir

llc -march=aarch64 -mcpu=cortex-a53 -filetype=asm "$mid_ll" -o "$mid_s"

aarch64-linux-gnu-g++ \
  -static \
  "$mid_s" \
  -include lib/sylib.h1 \
  -L build/lib -l:sylib.a \
  -o "$target_file"
