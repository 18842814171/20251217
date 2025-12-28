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
  %op0 = call i32 @getint()
  store i32 %op0, i32* @width
  %op1 = call i32 @getint()
  store i32 %op1, i32* @height
  %op2 = call i32 @getint()
  store i32 %op2, i32* @steps
  %op3 = call i32 @getch()
  %op24 = bitcast [250000 x i32]* @sheet1 to [500 x [500 x i32]]* 
  %op12 = load i32, i32* @width
  %op6 = load i32, i32* @height
  br label %label_1
label_1:		; preds = %label_4, %label_0		; succs = %label_2, %label_9
  %op5 = phi i32 [ 1, %label_0 ], [ %op16, %label_4 ]
  %op7 = icmp sle i32 %op5, %op6
  br i1 %op7, label %label_9, label %label_2
label_2:		; preds = %label_1
  ret void
label_3:		; preds = %label_8, %label_9		; succs = %label_5, %label_4
  %op11 = phi i32 [ %op27, %label_8 ], [ 1, %label_9 ]
  %op13 = icmp sle i32 %op11, %op12
  br i1 %op13, label %label_5, label %label_4
label_4:		; preds = %label_3		; succs = %label_1
  %op15 = call i32 @getch()
  %op16 = add i32 %op5, 1
  br label %label_1
label_5:		; preds = %label_3		; succs = %label_6, %label_7
  %op18 = call i32 @getch()
  %op19 = icmp eq i32 %op18, 35
  br i1 %op19, label %label_6, label %label_7
label_6:		; preds = %label_5		; succs = %label_8
  %op28 = getelementptr [500 x i32], [500 x i32]* %op31, i32 0, i32 %op11
  store i32 1, i32* %op28
  br label %label_8
label_7:		; preds = %label_5		; succs = %label_8
  %op29 = getelementptr [500 x i32], [500 x i32]* %op31, i32 0, i32 %op11
  store i32 0, i32* %op29
  br label %label_8
label_8:		; preds = %label_6, %label_7		; succs = %label_3
  %op27 = add i32 %op11, 1
  br label %label_3
label_9:		; preds = %label_1		; succs = %label_3
  %op31 = getelementptr [500 x [500 x i32]], [500 x [500 x i32]]* %op24, i32 0, i32 %op5
  br label %label_3
}
define void @put_map() {
label_0:		; succs = %label_1
  %op13 = bitcast [250000 x i32]* @sheet1 to [500 x [500 x i32]]* 
  %op8 = load i32, i32* @width
  %op2 = load i32, i32* @height
  br label %label_1
label_1:		; preds = %label_4, %label_0		; succs = %label_2, %label_9
  %op1 = phi i32 [ 1, %label_0 ], [ %op11, %label_4 ]
  %op3 = icmp sle i32 %op1, %op2
  br i1 %op3, label %label_9, label %label_2
label_2:		; preds = %label_1
  ret void
label_3:		; preds = %label_8, %label_9		; succs = %label_5, %label_4
  %op7 = phi i32 [ %op20, %label_8 ], [ 1, %label_9 ]
  %op9 = icmp sle i32 %op7, %op8
  br i1 %op9, label %label_5, label %label_4
label_4:		; preds = %label_3		; succs = %label_1
  call void @putch(i32 10)
  %op11 = add i32 %op1, 1
  br label %label_1
label_5:		; preds = %label_3		; succs = %label_6, %label_7
  %op21 = getelementptr [500 x i32], [500 x i32]* %op23, i32 0, i32 %op7
  %op15 = load i32, i32* %op21
  %op16 = icmp eq i32 %op15, 1
  br i1 %op16, label %label_6, label %label_7
label_6:		; preds = %label_5		; succs = %label_8
  call void @putch(i32 35)
  br label %label_8
label_7:		; preds = %label_5		; succs = %label_8
  call void @putch(i32 46)
  br label %label_8
label_8:		; preds = %label_6, %label_7		; succs = %label_3
  %op20 = add i32 %op7, 1
  br label %label_3
label_9:		; preds = %label_1		; succs = %label_3
  %op23 = getelementptr [500 x [500 x i32]], [500 x [500 x i32]]* %op13, i32 0, i32 %op1
  br label %label_3
}
define void @swap12() {
label_0:		; succs = %label_1
  %op13 = bitcast [250000 x i32]* @sheet1 to [500 x [500 x i32]]* 
  %op15 = bitcast [250000 x i32]* @sheet2 to [500 x [500 x i32]]* 
  %op8 = load i32, i32* @width
  %op2 = load i32, i32* @height
  br label %label_1
label_1:		; preds = %label_4, %label_0		; succs = %label_2, %label_6
  %op1 = phi i32 [ 1, %label_0 ], [ %op11, %label_4 ]
  %op3 = icmp sle i32 %op1, %op2
  br i1 %op3, label %label_6, label %label_2
label_2:		; preds = %label_1
  ret void
label_3:		; preds = %label_5, %label_6		; succs = %label_5, %label_4
  %op7 = phi i32 [ %op18, %label_5 ], [ 1, %label_6 ]
  %op9 = icmp sle i32 %op7, %op8
  br i1 %op9, label %label_5, label %label_4
label_4:		; preds = %label_3		; succs = %label_1
  %op11 = add i32 %op1, 1
  br label %label_1
label_5:		; preds = %label_3		; succs = %label_3
  %op19 = getelementptr [500 x i32], [500 x i32]* %op22, i32 0, i32 %op7
  %op20 = getelementptr [500 x i32], [500 x i32]* %op23, i32 0, i32 %op7
  %op17 = load i32, i32* %op20
  store i32 %op17, i32* %op19
  %op18 = add i32 %op7, 1
  br label %label_3
label_6:		; preds = %label_1		; succs = %label_3
  %op22 = getelementptr [500 x [500 x i32]], [500 x [500 x i32]]* %op13, i32 0, i32 %op1
  %op23 = getelementptr [500 x [500 x i32]], [500 x [500 x i32]]* %op15, i32 0, i32 %op1
  br label %label_3
}
define void @step([500 x i32]* %arg0, [500 x i32]* %arg1) {
label_0:		; succs = %label_1
  %op10 = load i32, i32* @width
  %op4 = load i32, i32* @height
  br label %label_1
label_1:		; preds = %label_4, %label_0		; succs = %label_2, %label_12
  %op3 = phi i32 [ 1, %label_0 ], [ %op13, %label_4 ]
  %op5 = icmp sle i32 %op3, %op4
  br i1 %op5, label %label_12, label %label_2
label_2:		; preds = %label_1
  ret void
label_3:		; preds = %label_8, %label_12		; succs = %label_5, %label_4
  %op9 = phi i32 [ %op58, %label_8 ], [ 1, %label_12 ]
  %op11 = icmp sle i32 %op9, %op10
  br i1 %op11, label %label_5, label %label_4
label_4:		; preds = %label_3		; succs = %label_1
  %op13 = add i32 %op3, 1
  br label %label_1
label_5:		; preds = %label_3		; succs = %label_9, %label_7
  %op16 = sub i32 %op9, 1
  %op66 = getelementptr [500 x i32], [500 x i32]* %op82, i32 0, i32 %op16
  %op18 = load i32, i32* %op66
  %op67 = getelementptr [500 x i32], [500 x i32]* %op82, i32 0, i32 %op9
  %op21 = load i32, i32* %op67
  %op22 = add i32 %op18, %op21
  %op24 = add i32 %op9, 1
  %op68 = getelementptr [500 x i32], [500 x i32]* %op82, i32 0, i32 %op24
  %op26 = load i32, i32* %op68
  %op27 = add i32 %op22, %op26
  %op69 = getelementptr [500 x i32], [500 x i32]* %op85, i32 0, i32 %op16
  %op30 = load i32, i32* %op69
  %op31 = add i32 %op27, %op30
  %op70 = getelementptr [500 x i32], [500 x i32]* %op85, i32 0, i32 %op24
  %op34 = load i32, i32* %op70
  %op35 = add i32 %op31, %op34
  %op71 = getelementptr [500 x i32], [500 x i32]* %op87, i32 0, i32 %op16
  %op39 = load i32, i32* %op71
  %op40 = add i32 %op35, %op39
  %op72 = getelementptr [500 x i32], [500 x i32]* %op87, i32 0, i32 %op9
  %op43 = load i32, i32* %op72
  %op44 = add i32 %op40, %op43
  %op73 = getelementptr [500 x i32], [500 x i32]* %op87, i32 0, i32 %op24
  %op48 = load i32, i32* %op73
  %op49 = add i32 %op44, %op48
  %op74 = getelementptr [500 x i32], [500 x i32]* %op85, i32 0, i32 %op9
  %op51 = load i32, i32* %op74
  %op52 = icmp eq i32 %op51, 1
  br i1 %op52, label %label_9, label %label_7
label_6:		; preds = %label_9		; succs = %label_8
  %op75 = getelementptr [500 x i32], [500 x i32]* %op79, i32 0, i32 %op9
  store i32 1, i32* %op75
  br label %label_8
label_7:		; preds = %label_5, %label_9		; succs = %label_10, %label_11
  %op56 = icmp eq i32 %op49, 3
  br i1 %op56, label %label_10, label %label_11
label_8:		; preds = %label_6, %label_10, %label_11		; succs = %label_3
  %op58 = add i32 %op9, 1
  br label %label_3
label_9:		; preds = %label_5		; succs = %label_6, %label_7
  %op60 = icmp eq i32 %op49, 2
  br i1 %op60, label %label_6, label %label_7
label_10:		; preds = %label_7		; succs = %label_8
  %op76 = getelementptr [500 x i32], [500 x i32]* %op79, i32 0, i32 %op9
  store i32 1, i32* %op76
  br label %label_8
label_11:		; preds = %label_7		; succs = %label_8
  %op77 = getelementptr [500 x i32], [500 x i32]* %op79, i32 0, i32 %op9
  store i32 0, i32* %op77
  br label %label_8
label_12:		; preds = %label_1		; succs = %label_3
  %op79 = getelementptr [500 x i32], [500 x i32]* %arg1, i32 %op3
  %op15 = sub i32 %op3, 1
  %op82 = getelementptr [500 x i32], [500 x i32]* %arg0, i32 %op15
  %op85 = getelementptr [500 x i32], [500 x i32]* %arg0, i32 %op3
  %op36 = add i32 %op3, 1
  %op87 = getelementptr [500 x i32], [500 x i32]* %arg0, i32 %op36
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