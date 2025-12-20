source_file="$1"     # tests/functional/xx.sy
target_file="$2"     # build/custom/functional/xx.out

mid_file_s="${target_file}.s"

# 1. run YOUR compiler: .sy ¡ú .s
./build/compiler -S -o "$mid_file_s" "$source_file"

# 2. assemble + link: .s ¡ú executable
aarch64-linux-gnu-gcc -static "$mid_file_s" \
  -L build/lib \
  -l:sylib.a \
  -o "$target_file"
