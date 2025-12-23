@x = global [100010 x i32] zeroinitializer
@y = global [3000000 x i32] zeroinitializer
@v = global [3000000 x i32] zeroinitializer
@a = global [100010 x i32] zeroinitializer
@b = global [100010 x i32] zeroinitializer
declare void @_sysy_starttime(i32)

declare void @_sysy_stoptime(i32)

declare i32 @getint()

declare float @getfloat()

declare i32 @getch()

declare i32 @getarray(i32*)

declare i32 @getfarray(float*)

declare void @putint(i32)

declare void @putch(i32)

declare void @putarray(i32, i32*)

declare void @putfloat(float)

declare void @putfarray(i32, float*)

define void @spmv(i32 %arg0, i32* %arg1, i32* %arg2, i32* %arg3, i32* %arg4, i32* %arg5) {
label_0:		; succs = %label_1
  br label %label_1
label_1:		; preds = %label_2, %label_0		; succs = %label_2, %label_3
  %op108 = phi i32 [ 0, %label_0 ], [ %op25, %label_2 ]
  %op18 = icmp slt i32 %op108, %arg0
  br i1 %op18, label %label_2, label %label_3
label_2:		; preds = %label_1		; succs = %label_1
  %op23 = getelementptr i32, i32* %arg5, i32 %op108
  store i32 0, i32* %op23
  %op25 = add i32 %op108, 1
  br label %label_1
label_3:		; preds = %label_10, %label_1		; succs = %label_5, %label_4
  %op109 = phi i32 [ %op80, %label_10 ], [ 0, %label_1 ]
  %op29 = icmp slt i32 %op109, %arg0
  br i1 %op29, label %label_5, label %label_4
label_4:		; preds = %label_3
  ret void
label_5:		; preds = %label_3		; succs = %label_6
  %op34 = getelementptr i32, i32* %arg1, i32 %op109
  %op35 = load i32, i32* %op34
  %op40 = add i32 %op109, 1
  %op41 = getelementptr i32, i32* %arg1, i32 %op40
  %op42 = load i32, i32* %op41
  br label %label_6
label_6:		; preds = %label_8, %label_5		; succs = %label_8, %label_7
  %op111 = phi i32 [ %op35, %label_5 ], [ %op69, %label_8 ]
  %op43 = icmp slt i32 %op111, %op42
  br i1 %op43, label %label_8, label %label_7
label_7:		; preds = %label_6		; succs = %label_9
  %op47 = getelementptr i32, i32* %arg1, i32 %op109
  %op48 = load i32, i32* %op47
  %op101 = getelementptr i32, i32* %arg4, i32 %op109
  %op102 = load i32, i32* %op101
  %op103 = sub i32 %op102, 1
  %op74 = add i32 %op109, 1
  %op75 = getelementptr i32, i32* %arg1, i32 %op74
  %op76 = load i32, i32* %op75
  br label %label_9
label_8:		; preds = %label_6		; succs = %label_6
  %op53 = getelementptr i32, i32* %arg2, i32 %op111
  %op54 = load i32, i32* %op53
  %op55 = getelementptr i32, i32* %arg5, i32 %op54
  %op60 = load i32, i32* %op53
  %op61 = getelementptr i32, i32* %arg5, i32 %op60
  %op62 = load i32, i32* %op61
  %op65 = getelementptr i32, i32* %arg3, i32 %op111
  %op66 = load i32, i32* %op65
  %op67 = add i32 %op62, %op66
  store i32 %op67, i32* %op55
  %op69 = add i32 %op111, 1
  br label %label_6
label_9:		; preds = %label_11, %label_7		; succs = %label_11, %label_10
  %op112 = phi i32 [ %op48, %label_7 ], [ %op107, %label_11 ]
  %op77 = icmp slt i32 %op112, %op76
  br i1 %op77, label %label_11, label %label_10
label_10:		; preds = %label_9		; succs = %label_3
  %op80 = add i32 %op109, 1
  br label %label_3
label_11:		; preds = %label_9		; succs = %label_9
  %op85 = getelementptr i32, i32* %arg2, i32 %op112
  %op86 = load i32, i32* %op85
  %op87 = getelementptr i32, i32* %arg5, i32 %op86
  %op92 = load i32, i32* %op85
  %op93 = getelementptr i32, i32* %arg5, i32 %op92
  %op94 = load i32, i32* %op93
  %op97 = getelementptr i32, i32* %arg3, i32 %op112
  %op98 = load i32, i32* %op97
  %op104 = mul i32 %op98, %op103
  %op105 = add i32 %op94, %op104
  store i32 %op105, i32* %op87
  %op107 = add i32 %op112, 1
  br label %label_9
}
define i32 @main() {
label_0:		; succs = %label_1
  %op3 = bitcast [100010 x i32]* @x to [100010 x i32]* 
  %op49 = getelementptr [100010 x i32], [100010 x i32]* %op3, i32 0, i32 0
  %op5 = call i32 @getarray(i32* %op49)
  %op7 = bitcast [3000000 x i32]* @y to [3000000 x i32]* 
  %op50 = getelementptr [3000000 x i32], [3000000 x i32]* %op7, i32 0, i32 0
  %op9 = call i32 @getarray(i32* %op50)
  %op10 = bitcast [3000000 x i32]* @v to [3000000 x i32]* 
  %op51 = getelementptr [3000000 x i32], [3000000 x i32]* %op10, i32 0, i32 0
  %op12 = call i32 @getarray(i32* %op51)
  %op13 = bitcast [100010 x i32]* @a to [100010 x i32]* 
  %op52 = getelementptr [100010 x i32], [100010 x i32]* %op13, i32 0, i32 0
  %op15 = call i32 @getarray(i32* %op52)
  call void @_sysy_starttime(i32 39)
  %op6 = sub i32 %op5, 1
  %op33 = bitcast [100010 x i32]* @b to [100010 x i32]* 
  %op59 = getelementptr [100010 x i32], [100010 x i32]* %op33, i32 0, i32 0
  br label %label_1
label_1:		; preds = %label_3, %label_0		; succs = %label_3, %label_2
  %op48 = phi i32 [ 0, %label_0 ], [ %op47, %label_3 ]
  %op18 = icmp slt i32 %op48, 100
  br i1 %op18, label %label_3, label %label_2
label_2:		; preds = %label_1
  call void @_sysy_stoptime(i32 47)
  %op21 = bitcast [100010 x i32]* @b to [100010 x i32]* 
  %op53 = getelementptr [100010 x i32], [100010 x i32]* %op21, i32 0, i32 0
  call void @putarray(i32 %op6, i32* %op53)
  ret i32 0
label_3:		; preds = %label_1		; succs = %label_1
  call void @spmv(i32 %op6, i32* %op49, i32* %op50, i32* %op51, i32* %op52, i32* %op59)
  call void @spmv(i32 %op6, i32* %op49, i32* %op50, i32* %op51, i32* %op59, i32* %op52)
  %op47 = add i32 %op48, 1
  br label %label_1
}
declare void @llvm.memset.p0i8.i64(i8*, i8, i64, i1)
declare void @llvm.memcpy.p0i8.p0i8.i64(i8*, i8*, i64, i1)