source_file="$1"
target_file="$2"

mid_file_s="${target_file}.s"

# …˙≥…ARMª„±‡
./build/compiler -S -o "$mid_file_s" "$source_file"

# ±‡“ÎARMª„±‡≥Ã–Ú£®æ≤Ã¨¡¥Ω”£©
aarch64-linux-gnu-gcc -static "$mid_file_s" -L ./build/lib -l:sylib++.a -o "$target_file"