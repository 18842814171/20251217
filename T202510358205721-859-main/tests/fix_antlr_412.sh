#!/bin/bash
echo "修复 ANTLR 4.12.0 生成的代码..."
for file in antlr/SysYLexer.cpp antlr/SysYParser.cpp; do
    if [ -f "$file" ]; then
        echo "处理 $file"
        # 替换 OnceFlag 为 std::once_flag
        sed -i 's/::antlr4::internal::OnceFlag/static std::once_flag/g' "$file"
        # 替换 call_once 为 std::call_once
        sed -i 's/::antlr4::internal::call_once/std::call_once/g' "$file"
        # 添加必要的头文件
        if ! grep -q "#include <mutex>" "$file"; then
            sed -i '1i #include <mutex>' "$file"
        fi
    fi
done
# 也需要修复对应的头文件（如果存在）
for file in antlr/*.h; do
    if [ -f "$file" ]; then
        sed -i 's/::antlr4::internal::OnceFlag/static std::once_flag/g' "$file" 2>/dev/null || true
    fi
done
