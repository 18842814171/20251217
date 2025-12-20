#include "PeepHolePass.h"

static bool str_contains(const std::string & str, const std::string & sub)
{
	return str.find(sub) != std::string::npos;
}

/*******************************************************************************
                                   滑动窗口
*******************************************************************************/
/*
    初始化窗口
*/
PeepHoleWindow::PeepHoleWindow(unsigned long sz, std::list<ArmInst *> & cd) : size(sz), code(cd)
{
    unsigned long i;

    // 一次最多取size个指令，放到cont中
    for (pos = code.begin(), i = 0; pos != code.end() && i < size; pos++, i++) {
        ArmInst * inst = *pos;

        // Dead code
        if (inst->dead) {
            continue;
        }

        cont.push_back(inst);
    }
}

/*
    窗口移动函数，跳过无效指令
*/
bool PeepHoleWindow::move()
{
    bool canMove = false;

    // 窗口移动一条指令
    while (pos != code.end()) {

        ArmInst * inst = *pos;

        //无效指令，跳过
        if ((inst->dead)) {
            pos++;
            continue;
        }

        if(inst->opcode.empty()) {
			// 无效指令，跳过
			pos++;
			continue;
		}

        if (inst->opcode == "//") {
            // 注释指令，跳过
            pos++;
            continue;
        }

        // 移出前边的指令
        if(!cont.empty()) {
            cont.pop_front();
		}

        // 移入新指令
        cont.push_back(inst);

        // 移动到下个位置
        pos++;

        canMove = true;

        break;
    }

    return canMove;
}

/*
    指令模板匹配,若匹配执行替换动作
*/
bool PeepHoleWindow::match()
{
    bool canMatch = false;

    // 窗口中必须包含有足够的指令才能进行相应的匹配
    if (cont.size() == size) {
        if (size == 1) {
            // 单指令匹配
            canMatch = match_single();
        } else if (size == 2) {
            // 双指令匹配
            canMatch = match_double();
        } else if (size == 3) {
            // 三指令匹配
            canMatch = match_triple();
        }
    }

    return canMatch;
}

/*
    单指令模板匹配,若匹配执行替换动作
*/
bool PeepHoleWindow::match_single()
{
    ArmInst & inst = *cont.front();
    std::string op = inst.opcode;

    bool canMatch = false;

    if ((op == "sub" || op == "add") && (inst.arg2 == "#0")) {
        // 第二个参数是0,修改为mov
        inst.replace("mov", inst.result, inst.arg1);
        canMatch = true;
    }
    if ((op == "fsub" || op == "fadd") && (inst.arg2 == "#0.0")) {
        // 第二个参数是0,修改为mov
        inst.replace("fmov", inst.result, inst.arg1);
        canMatch = true;
    } else if ((op == "mul") && (inst.arg2 == "#1")) {
        // 第二个参数是0,修改为mov
        inst.replace("mov", inst.result, inst.arg1);
        canMatch = true;
    } else if ((op == "fmul") && (inst.arg2 == "#1" || inst.arg2 == "#1.0")) {
        // 第二个参数是0,修改为mov
        inst.replace("fmov", inst.result, inst.arg1);
        canMatch = true;
    } else if ((op == "mov" || op == "fmov") && inst.arg1 == inst.result) {
        // 移动的目的寄存器和操作数相同，无效指令
        inst.setDead();
        canMatch = true;
    }

    return canMatch;
}

/*
    双指令模板匹配,若匹配执行替换动作
*/
bool PeepHoleWindow::match_double()
{
    //匹配成功后指令1设为无效，指令2为合并后的指令

    // 窗口中的指令1
    ArmInst & inst1 = *cont.front();

    // 窗口中的指令2
    ArmInst & inst2 = **(++cont.begin());

    std::string op1 = inst1.opcode;
    std::string rs1 = inst1.result;
    std::string a11 = inst1.arg1;
    std::string a12 = inst1.arg2;

    std::string op2 = inst2.opcode;
    std::string rs2 = inst2.result;
    std::string a21 = inst2.arg1;
    std::string a22 = inst2.arg2;

    bool canMatch = false;

    // FIXME 目前没有考虑条件指令

    if (op1 == "mov" && op2 == "mov" && rs1 == a21 && rs2 == a11) {
        // 双mov合并
        // mov r7, r0 and mov r0 r7 ===> 第二个mov可删除
        inst1.setDead();
        inst2.replace(op1, rs1, a11);

        canMatch = true;
    } else if (op1 == "fmov" && op2 == "fmov" && rs1 == a21 && rs2 == a11) {
        // 双mov合并
        // mov r7, r0 and mov r0 r7 ===> 第二个mov可删除
        inst1.setDead();
        inst2.replace(op1, rs1, a11);

        canMatch = true;
    } else if (((op1 == "ldr" && op2 == "str")) && rs1 == rs2 && a11 == a21) {
        // 重复的ldr str
        inst1.setDead();
        inst2.replace(op1, rs1, a11);

        canMatch = true;
    } else if (((op1 == "str" && op2 == "ldr")) && (a11 == a21)) {
        if (rs1 == rs2) {
            // str r0, [fp, #-24], ldr r0, [fp,#-24] => str r0, [fp, #-24]
            inst1.setDead();
            inst2.replace(op1, rs1, a11);
        } else {
            // str r1, [fp, #-24], ldr r0, [fp,#-24] =>
            // str r0, [fp, #-24], mov r0, r1
            if (rs1[0] == 's') {
                inst2.replace("fmov", rs2, rs1);
            } else {
                inst2.replace("mov", rs2, rs1);
            }
        }

        canMatch = true;
    } else if (op1 == "b" && rs2 == ":" && rs1 == op2) {
        //跳转优化

        //删除当前跳转指令，不能删除标号，还可能有其他跳转到此
        inst1.setDead();

        canMatch = true;
    } else if ((op1 == "mov" || op1 == "add") && (op2 == "ldr" || op2 == "str") && (a21 == "[" + rs1 + ']')) {
        // 例子：
        // mov x9,x0       add x9,x0,#4     add x9,x0,#4
        // ldr s1,[x9]	   ldr s3,[x9]      str s3,[x9]
        // 合并成
        // mov x9,x0       add x9,x0,#4     add x9,x0,#4
        // ldr s1,[x0]     ldr s3,[x0, #4]  str s3,[x0, #4]
        // 直接替换
        std::string inst1_arg = inst1.outPut(true);
        if(!str_contains(inst1_arg,rs1)) {
            inst2.replace(op2, rs2, "[" + inst1_arg + "]");
            canMatch = true;
        }
    }

    return canMatch;
}

/*
    三指令模板匹配,若匹配执行替换动作
*/
bool PeepHoleWindow::match_triple()
{
    //匹配成功后指令1设为无效，指令2为合并后的指令
    // 窗口中的指令1
    ArmInst & inst1 = *cont.front();

    // 窗口中的指令2
    ArmInst & inst2 = **(++cont.begin());

    // 窗口中的指令3
    ArmInst & inst3 = **(++ ++cont.begin());

    // 注意：这里所有的操作不用使用引用，因为后面会存在replace操作，一旦replace后这些就会发生更改
    std::string op1 = inst1.opcode;
    std::string rs1 = inst1.result;
    std::string a11 = inst1.arg1;
    std::string a12 = inst1.arg2;

    std::string op2 = inst2.opcode;
    std::string rs2 = inst2.result;
    std::string a21 = inst2.arg1;

    std::string op3 = inst3.opcode;
    std::string rs3 = inst3.result;
    std::string a31 = inst3.arg1;

    bool canMatch = false;
    if (op2.empty() && ((op1 == "str" && op3 == "ldr")) && rs1 == rs3 && a11 == a31) {
        //重复的str ldr

        //消除ldr，指令后移
        inst1.setDead();
        inst2.replace(op1, rs1, a11);
        inst3.replace("");
        canMatch = true;
    } else if (op1.size() > 3 && op2.size() > 3 && !op1.find("mov") && !op2.find("mov") && op3 == "mov" && rs1 == rs2 &&
               rs2 == a31) {
        //比较结果合并mov
        inst1.setDead(); //消除mov，指令后移
        inst2.replace(op1, rs3, a11);
        inst3.replace(op2, rs3, a21);
        canMatch = true;
    } else if ((op1 == "mov" || op1 == "add") && (op2 == "ldr") && op3 == "mov" && (str_contains(a21, rs1)) && (rs3 == rs1)) {
        // 例子：
        // mov x9,x0       add x9,x0,#4
        // ldr s1,[x9]	   ldr s3,[x9]
        // mov x9,x3	   mov x9,x4
        // 合并成
        // ldr s1,[x0]     ldr s3,[x0, #4]
        // mov x9,x3       mov x9, x4
        if(a21 == "[" + rs1 + ']') {
            // 直接替换
            std::string inst1_arg = inst1.outPut(true);
            inst2.replace("ldr", rs2, "[" + inst1_arg + "]");
            // 消除第一条指令
            inst1.setDead();
            canMatch = true;
        }
    }

    return canMatch;
}

/*******************************************************************************
                                   窥孔优化器
*******************************************************************************/
/*
    内部过滤器，只处理一遍
*/
bool PeepHolePass::__filter(unsigned long sz)
{
    // 新建滑动窗口
    PeepHoleWindow win(sz, iloc.getCode());

    //记录匹配成功出现标记
    bool flag = false;

    do {
        // 模式匹配事是否成功
        bool ret = win.match();
        if ((!flag) && ret) {
            // 尝试设定成功标记，不重复设定
            flag = ret;
        }

        //移动滑动窗口,直到不出现匹配成功为止
    } while (win.move());

    //返回是否发生匹配标记
    return flag;
}

void PeepHolePass::run()
{
    // 开辟大小1,2,3的窗口，直到不能匹配为止
    bool changed = false;
    while (!changed) {
        if (__filter(3)) {
            changed = false;
        } else if (__filter(2)) {
            changed = false;
        } else if (__filter(1)) {
            changed = false;
        } else {
			changed = true; // 没有匹配成功，退出
		}
    }
}