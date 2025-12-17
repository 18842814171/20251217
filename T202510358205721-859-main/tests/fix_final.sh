#!/bin/bash
echo "=== 修复ANLTR 4.12.0生成的代码 ==="

# 修复SysYLexer.cpp
if [ -f "antlr/SysYLexer.cpp" ]; then
    echo "修复 antlr/SysYLexer.cpp"
    sed -i 's/::antlr4::internal::OnceFlag/static std::once_flag/g' antlr/SysYLexer.cpp
    sed -i 's/::antlr4::internal::call_once/std::call_once/g' antlr/SysYLexer.cpp
    if ! grep -q "#include <mutex>" antlr/SysYLexer.cpp; then
        sed -i '1i #include <mutex>' antlr/SysYLexer.cpp
    fi
fi

# 修复SysYParser.cpp
if [ -f "antlr/SysYParser.cpp" ]; then
    echo "修复 antlr/SysYParser.cpp"
    sed -i 's/::antlr4::internal::OnceFlag/static std::once_flag/g' antlr/SysYParser.cpp
    sed -i 's/::antlr4::internal::call_once/std::call_once/g' antlr/SysYParser.cpp
    if ! grep -q "#include <mutex>" antlr/SysYParser.cpp; then
        sed -i '1i #include <mutex>' antlr/SysYParser.cpp
    fi
fi

# 修复头文件（如果存在）
for hfile in antlr/*.h; do
    if [ -f "$hfile" ]; then
        echo "修复头文件: $hfile"
        sed -i 's/::antlr4::internal::OnceFlag/static std::once_flag/g' "$hfile"
    fi
done

echo "=== 修复完成 ==="
