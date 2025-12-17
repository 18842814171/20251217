source_file="$1"
target_file="$2"

mid_file_s="${target_file}.s"

./build/compiler -S -o "$mid_file_s" "$source_file" -O1
aarch64-linux-gnu-g++ -x c++ "$mid_file" -include ./lib/sylib.h1 -L ./build/lib -l:sylib++.a -o "$target_file" 