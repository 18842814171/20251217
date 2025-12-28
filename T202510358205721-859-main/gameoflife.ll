@sheet1 = global [250000 x i32] zeroinitializer
@sheet2 = global [250000 x i32] zeroinitializer
@active = global i32 1
@width = global i32 0
@height = global i32 0
@steps = global i32 0
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

define void @read_map() {
label_0:		; succs = %label_1
  %op3 = call i32 @getint()
  store i32 %op3, i32* @width
  %op4 = call i32 @getint()
  store i32 %op4, i32* @height
  %op5 = call i32 @getint()
  store i32 %op5, i32* @steps
  %op6 = call i32 @getch()
  %op31 = bitcast [250000 x i32]* @sheet1 to [500 x [500 x i32]]* 
  %op15 = load i32, i32* @width
  %op9 = load i32, i32* @height
  br label %label_1
label_1:		; preds = %label_4, %label_0		; succs = %label_2, %label_9
  %op39 = phi i32 [ 1, %label_0 ], [ %op20, %label_4 ]
  %op10 = icmp sle i32 %op39, %op9
  br i1 %op10, label %label_9, label %label_2
label_2:		; preds = %label_1
  ret void
label_3:		; preds = %label_8, %label_9		; succs = %label_5, %label_4
  %op41 = phi i32 [ %op37, %label_8 ], [ 1, %label_9 ]
  %op16 = icmp sle i32 %op41, %op15
  br i1 %op16, label %label_5, label %label_4
label_4:		; preds = %label_3		; succs = %label_1
  %op18 = call i32 @getch()
  %op20 = add i32 %op39, 1
  br label %label_1
label_5:		; preds = %label_3		; succs = %label_6, %label_7
  %op22 = call i32 @getch()
  %op24 = icmp eq i32 %op22, 35
  br i1 %op24, label %label_6, label %label_7
label_6:		; preds = %label_5		; succs = %label_8
  %op43 = getelementptr [500 x i32], [500 x i32]* %op46, i32 0, i32 %op41
  store i32 1, i32* %op43
  br label %label_8
label_7:		; preds = %label_5		; succs = %label_8
  %op44 = getelementptr [500 x i32], [500 x i32]* %op46, i32 0, i32 %op41
  store i32 0, i32* %op44
  br label %label_8
label_8:		; preds = %label_6, %label_7		; succs = %label_3
  %op37 = add i32 %op41, 1
  br label %label_3
label_9:		; preds = %label_1		; succs = %label_3
  %op46 = getelementptr [500 x [500 x i32]], [500 x [500 x i32]]* %op31, i32 0, i32 %op39
  br label %label_3
}
define void @put_map() {
label_0:		; succs = %label_1
  %op16 = bitcast [250000 x i32]* @sheet1 to [500 x [500 x i32]]* 
  %op10 = load i32, i32* @width
  %op4 = load i32, i32* @height
  br label %label_1
label_1:		; preds = %label_4, %label_0		; succs = %label_2, %label_9
  %op28 = phi i32 [ 1, %label_0 ], [ %op14, %label_4 ]
  %op5 = icmp sle i32 %op28, %op4
  br i1 %op5, label %label_9, label %label_2
label_2:		; preds = %label_1
  ret void
label_3:		; preds = %label_8, %label_9		; succs = %label_5, %label_4
  %op29 = phi i32 [ %op26, %label_8 ], [ 1, %label_9 ]
  %op11 = icmp sle i32 %op29, %op10
  br i1 %op11, label %label_5, label %label_4
label_4:		; preds = %label_3		; succs = %label_1
  call void @putch(i32 10)
  %op14 = add i32 %op28, 1
  br label %label_1
label_5:		; preds = %label_3		; succs = %label_6, %label_7
  %op30 = getelementptr [500 x i32], [500 x i32]* %op32, i32 0, i32 %op29
  %op20 = load i32, i32* %op30
  %op21 = icmp eq i32 %op20, 1
  br i1 %op21, label %label_6, label %label_7
label_6:		; preds = %label_5		; succs = %label_8
  call void @putch(i32 35)
  br label %label_8
label_7:		; preds = %label_5		; succs = %label_8
  call void @putch(i32 46)
  br label %label_8
label_8:		; preds = %label_6, %label_7		; succs = %label_3
  %op26 = add i32 %op29, 1
  br label %label_3
label_9:		; preds = %label_1		; succs = %label_3
  %op32 = getelementptr [500 x [500 x i32]], [500 x [500 x i32]]* %op16, i32 0, i32 %op28
  br label %label_3
}
define void @swap12() {
label_0:		; succs = %label_1
  %op16 = bitcast [250000 x i32]* @sheet1 to [500 x [500 x i32]]* 
  %op20 = bitcast [250000 x i32]* @sheet2 to [500 x [500 x i32]]* 
  %op10 = load i32, i32* @width
  %op4 = load i32, i32* @height
  br label %label_1
label_1:		; preds = %label_4, %label_0		; succs = %label_2, %label_6
  %op28 = phi i32 [ 1, %label_0 ], [ %op14, %label_4 ]
  %op5 = icmp sle i32 %op28, %op4
  br i1 %op5, label %label_6, label %label_2
label_2:		; preds = %label_1
  ret void
label_3:		; preds = %label_5, %label_6		; succs = %label_5, %label_4
  %op29 = phi i32 [ %op26, %label_5 ], [ 1, %label_6 ]
  %op11 = icmp sle i32 %op29, %op10
  br i1 %op11, label %label_5, label %label_4
label_4:		; preds = %label_3		; succs = %label_1
  %op14 = add i32 %op28, 1
  br label %label_1
label_5:		; preds = %label_3		; succs = %label_3
  %op30 = getelementptr [500 x i32], [500 x i32]* %op33, i32 0, i32 %op29
  %op31 = getelementptr [500 x i32], [500 x i32]* %op34, i32 0, i32 %op29
  %op24 = load i32, i32* %op31
  store i32 %op24, i32* %op30
  %op26 = add i32 %op29, 1
  br label %label_3
label_6:		; preds = %label_1		; succs = %label_3
  %op33 = getelementptr [500 x [500 x i32]], [500 x [500 x i32]]* %op16, i32 0, i32 %op28
  %op34 = getelementptr [500 x [500 x i32]], [500 x [500 x i32]]* %op20, i32 0, i32 %op28
  br label %label_3
}
define void @step([500 x i32]* %arg0, [500 x i32]* %arg1) {
label_0:		; succs = %label_1
  %op15 = load i32, i32* @width
  %op9 = load i32, i32* @height
  br label %label_1
label_1:		; preds = %label_4, %label_0		; succs = %label_2, %label_12
  %op112 = phi i32 [ 1, %label_0 ], [ %op19, %label_4 ]
  %op10 = icmp sle i32 %op112, %op9
  br i1 %op10, label %label_12, label %label_2
label_2:		; preds = %label_1
  ret void
label_3:		; preds = %label_8, %label_12		; succs = %label_5, %label_4
  %op114 = phi i32 [ %op96, %label_8 ], [ 1, %label_12 ]
  %op16 = icmp sle i32 %op114, %op15
  br i1 %op16, label %label_5, label %label_4
label_4:		; preds = %label_3		; succs = %label_1
  %op19 = add i32 %op112, 1
  br label %label_1
label_5:		; preds = %label_3		; succs = %label_9, %label_7
  %op25 = sub i32 %op114, 1
  %op116 = getelementptr [500 x i32], [500 x i32]* %op132, i32 0, i32 %op25
  %op27 = load i32, i32* %op116
  %op117 = getelementptr [500 x i32], [500 x i32]* %op132, i32 0, i32 %op114
  %op33 = load i32, i32* %op117
  %op34 = add i32 %op27, %op33
  %op39 = add i32 %op114, 1
  %op118 = getelementptr [500 x i32], [500 x i32]* %op132, i32 0, i32 %op39
  %op41 = load i32, i32* %op118
  %op42 = add i32 %op34, %op41
  %op119 = getelementptr [500 x i32], [500 x i32]* %op135, i32 0, i32 %op25
  %op48 = load i32, i32* %op119
  %op49 = add i32 %op42, %op48
  %op120 = getelementptr [500 x i32], [500 x i32]* %op135, i32 0, i32 %op39
  %op55 = load i32, i32* %op120
  %op56 = add i32 %op49, %op55
  %op121 = getelementptr [500 x i32], [500 x i32]* %op137, i32 0, i32 %op25
  %op63 = load i32, i32* %op121
  %op64 = add i32 %op56, %op63
  %op122 = getelementptr [500 x i32], [500 x i32]* %op137, i32 0, i32 %op114
  %op70 = load i32, i32* %op122
  %op71 = add i32 %op64, %op70
  %op123 = getelementptr [500 x i32], [500 x i32]* %op137, i32 0, i32 %op39
  %op78 = load i32, i32* %op123
  %op79 = add i32 %op71, %op78
  %op124 = getelementptr [500 x i32], [500 x i32]* %op135, i32 0, i32 %op114
  %op84 = load i32, i32* %op124
  %op85 = icmp eq i32 %op84, 1
  br i1 %op85, label %label_9, label %label_7
label_6:		; preds = %label_9		; succs = %label_8
  %op125 = getelementptr [500 x i32], [500 x i32]* %op129, i32 0, i32 %op114
  store i32 1, i32* %op125
  br label %label_8
label_7:		; preds = %label_5, %label_9		; succs = %label_10, %label_11
  %op93 = icmp eq i32 %op79, 3
  br i1 %op93, label %label_10, label %label_11
label_8:		; preds = %label_6, %label_10, %label_11		; succs = %label_3
  %op96 = add i32 %op114, 1
  br label %label_3
label_9:		; preds = %label_5		; succs = %label_6, %label_7
  %op99 = icmp eq i32 %op79, 2
  br i1 %op99, label %label_6, label %label_7
label_10:		; preds = %label_7		; succs = %label_8
  %op126 = getelementptr [500 x i32], [500 x i32]* %op129, i32 0, i32 %op114
  store i32 1, i32* %op126
  br label %label_8
label_11:		; preds = %label_7		; succs = %label_8
  %op127 = getelementptr [500 x i32], [500 x i32]* %op129, i32 0, i32 %op114
  store i32 0, i32* %op127
  br label %label_8
label_12:		; preds = %label_1		; succs = %label_3
  %op129 = getelementptr [500 x i32], [500 x i32]* %arg1, i32 %op112
  %op23 = sub i32 %op112, 1
  %op132 = getelementptr [500 x i32], [500 x i32]* %arg0, i32 %op23
  %op135 = getelementptr [500 x i32], [500 x i32]* %arg0, i32 %op112
  %op59 = add i32 %op112, 1
  %op137 = getelementptr [500 x i32], [500 x i32]* %arg0, i32 %op59
  br label %label_3
}
define i32 @main() {
label_0:		; succs = %label_2, %label_10
  call void @read_map()
  call void @_sysy_starttime(i32 95)
  %op29 = load i32, i32* @steps
  %op30 = icmp sgt i32 %op29, 0
  br i1 %op30, label %label_10, label %label_2
label_1:		; preds = %label_6, %label_10		; succs = %label_4, %label_5
  %op7 = load i32, i32* @active
  %op8 = icmp eq i32 %op7, 1
  br i1 %op8, label %label_4, label %label_5
label_2:		; preds = %label_6, %label_0		; succs = %label_7, %label_8
  call void @_sysy_stoptime(i32 106)
  %op4 = load i32, i32* @active
  %op5 = icmp eq i32 %op4, 2
  br i1 %op5, label %label_7, label %label_8
label_4:		; preds = %label_1		; succs = %label_6
  call void @step([500 x i32]* %op28, [500 x i32]* %op27)
  store i32 2, i32* @active
  br label %label_6
label_5:		; preds = %label_1		; succs = %label_6
  call void @step([500 x i32]* %op27, [500 x i32]* %op28)
  store i32 1, i32* @active
  br label %label_6
label_6:		; preds = %label_4, %label_5		; succs = %label_1, %label_2
  %op20 = load i32, i32* @steps
  %op21 = sub i32 %op20, 1
  store i32 %op21, i32* @steps
  %op1 = load i32, i32* @steps
  %op2 = icmp sgt i32 %op1, 0
  br i1 %op2, label %label_1, label %label_2
label_7:		; preds = %label_2		; succs = %label_8
  call void @swap12()
  br label %label_8
label_8:		; preds = %label_2, %label_7
  call void @put_map()
  ret i32 0
label_10:		; preds = %label_0		; succs = %label_1
  %op17 = bitcast [250000 x i32]* @sheet1 to [500 x [500 x i32]]* 
  %op15 = bitcast [250000 x i32]* @sheet2 to [500 x [500 x i32]]* 
  %op28 = getelementptr [500 x [500 x i32]], [500 x [500 x i32]]* %op17, i32 0, i32 0
  %op27 = getelementptr [500 x [500 x i32]], [500 x [500 x i32]]* %op15, i32 0, i32 0
  br label %label_1
}
declare void @llvm.memset.p0i8.i64(i8*, i8, i64, i1)
declare void @llvm.memcpy.p0i8.p0i8.i64(i8*, i8*, i64, i1)