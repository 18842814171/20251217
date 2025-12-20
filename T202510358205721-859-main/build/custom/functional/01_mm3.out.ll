@A = global [1048576 x i32] zeroinitializer
@B = global [1048576 x i32] zeroinitializer
@C = global [1048576 x i32] zeroinitializer
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

define void @mm(i32 %arg0, [1024 x i32]* %arg1, [1024 x i32]* %arg2, [1024 x i32]* %arg3) {
label_0:		; succs = %label_1
  br label %label_1
label_1:		; preds = %label_3, %label_0		; succs = %label_18, %label_5
  %op5 = phi i32 [ 0, %label_0 ], [ %op13, %label_3 ]
  %op6 = icmp slt i32 %op5, %arg0
  br i1 %op6, label %label_18, label %label_5
label_2:		; preds = %label_4, %label_18		; succs = %label_4, %label_3
  %op10 = phi i32 [ %op16, %label_4 ], [ 0, %label_18 ]
  %op11 = icmp slt i32 %op10, %arg0
  br i1 %op11, label %label_4, label %label_3
label_3:		; preds = %label_2		; succs = %label_1
  %op13 = add i32 %op5, 1
  br label %label_1
label_4:		; preds = %label_2		; succs = %label_2
  %op50 = getelementptr [1024 x i32], [1024 x i32]* %op68, i32 0, i32 %op10
  store i32 0, i32* %op50
  %op16 = add i32 %op10, 1
  br label %label_2
label_5:		; preds = %label_8, %label_1		; succs = %label_6, %label_16
  %op18 = phi i32 [ %op26, %label_8 ], [ 0, %label_1 ]
  %op19 = icmp slt i32 %op18, %arg0
  br i1 %op19, label %label_16, label %label_6
label_6:		; preds = %label_5
  ret void
label_7:		; preds = %label_10, %label_15		; succs = %label_9, %label_8
  %op23 = phi i32 [ %op61, %label_15 ], [ %op32, %label_10 ]
  %op24 = icmp slt i32 %op23, %arg0
  br i1 %op24, label %label_9, label %label_8
label_8:		; preds = %label_7		; succs = %label_5
  %op26 = add i32 %op18, 1
  br label %label_5
label_9:		; preds = %label_7		; succs = %label_10, %label_14
  %op51 = getelementptr [1024 x i32], [1024 x i32]* %op63, i32 0, i32 %op23
  %op29 = load i32, i32* %op51
  %op30 = icmp eq i32 %op29, 0
  br i1 %op30, label %label_10, label %label_14
label_10:		; preds = %label_9		; succs = %label_7
  %op32 = add i32 %op23, 1
  br label %label_7
label_11:		; preds = %label_13, %label_14		; succs = %label_13, %label_12
  %op35 = phi i32 [ %op49, %label_13 ], [ 0, %label_14 ]
  %op36 = icmp slt i32 %op35, %arg0
  br i1 %op36, label %label_13, label %label_12
label_12:		; preds = %label_11		; succs = %label_15
  %op38 = add i32 %op23, 1
  br label %label_15
label_13:		; preds = %label_11		; succs = %label_11
  %op52 = getelementptr [1024 x i32], [1024 x i32]* %op57, i32 0, i32 %op35
  %op42 = load i32, i32* %op52
  %op54 = getelementptr [1024 x i32], [1024 x i32]* %op65, i32 0, i32 %op35
  %op46 = load i32, i32* %op54
  %op47 = mul i32 %op44, %op46
  %op48 = add i32 %op42, %op47
  store i32 %op48, i32* %op52
  %op49 = add i32 %op35, 1
  br label %label_11
label_14:		; preds = %label_9		; succs = %label_11
  %op57 = getelementptr [1024 x i32], [1024 x i32]* %arg3, i32 %op23
  %op59 = getelementptr [1024 x i32], [1024 x i32]* %op63, i32 0, i32 %op23
  %op44 = load i32, i32* %op59
  br label %label_11
label_15:		; preds = %label_12, %label_16		; succs = %label_7
  %op61 = phi i32 [ 0, %label_16 ], [ %op38, %label_12 ]
  br label %label_7
label_16:		; preds = %label_5		; succs = %label_15
  %op63 = getelementptr [1024 x i32], [1024 x i32]* %arg1, i32 %op18
  %op65 = getelementptr [1024 x i32], [1024 x i32]* %arg2, i32 %op18
  br label %label_15
label_18:		; preds = %label_1		; succs = %label_2
  %op68 = getelementptr [1024 x i32], [1024 x i32]* %arg3, i32 %op5
  br label %label_2
}
define i32 @main() {
label_0:		; succs = %label_1
  %op0 = call i32 @getint()
  %op12 = bitcast [1048576 x i32]* @A to [1024 x [1024 x i32]]* 
  br label %label_1
label_1:		; preds = %label_3, %label_0		; succs = %label_21, %label_2
  %op2 = phi i32 [ 0, %label_0 ], [ %op10, %label_3 ]
  %op3 = icmp slt i32 %op2, %op0
  br i1 %op3, label %label_2, label %label_21
label_2:		; preds = %label_4, %label_1		; succs = %label_4, %label_3
  %op7 = phi i32 [ %op15, %label_4 ], [ 0, %label_1 ]
  %op8 = icmp slt i32 %op7, %op0
  br i1 %op8, label %label_4, label %label_3
label_3:		; preds = %label_2		; succs = %label_1
  %op10 = add i32 %op2, 1
  br label %label_1
label_4:		; preds = %label_2		; succs = %label_2
  %op67 = getelementptr [1024 x [1024 x i32]], [1024 x [1024 x i32]]* %op12, i32 0, i32 %op7
  %op68 = getelementptr [1024 x i32], [1024 x i32]* %op67, i32 0, i32 %op2
  %op14 = call i32 @getint()
  store i32 %op14, i32* %op68
  %op15 = add i32 %op7, 1
  br label %label_2
label_5:		; preds = %label_8, %label_21		; succs = %label_6, %label_20
  %op17 = phi i32 [ %op25, %label_8 ], [ 0, %label_21 ]
  %op18 = icmp slt i32 %op17, %op0
  br i1 %op18, label %label_20, label %label_6
label_6:		; preds = %label_5		; succs = %label_10
  call void @_sysy_starttime(i32 65)
  %op36 = bitcast [1048576 x i32]* @A to [1024 x [1024 x i32]]* 
  %op77 = getelementptr [1024 x [1024 x i32]], [1024 x [1024 x i32]]* %op36, i32 0, i32 0
  %op38 = bitcast [1048576 x i32]* @B to [1024 x [1024 x i32]]* 
  %op78 = getelementptr [1024 x [1024 x i32]], [1024 x [1024 x i32]]* %op38, i32 0, i32 0
  %op40 = bitcast [1048576 x i32]* @C to [1024 x [1024 x i32]]* 
  %op79 = getelementptr [1024 x [1024 x i32]], [1024 x [1024 x i32]]* %op40, i32 0, i32 0
  br label %label_10
label_7:		; preds = %label_9, %label_20		; succs = %label_9, %label_8
  %op22 = phi i32 [ %op30, %label_9 ], [ 0, %label_20 ]
  %op23 = icmp slt i32 %op22, %op0
  br i1 %op23, label %label_9, label %label_8
label_8:		; preds = %label_7		; succs = %label_5
  %op25 = add i32 %op17, 1
  br label %label_5
label_9:		; preds = %label_7		; succs = %label_7
  %op69 = getelementptr [1024 x i32], [1024 x i32]* %op84, i32 0, i32 %op22
  %op29 = call i32 @getint()
  store i32 %op29, i32* %op69
  %op30 = add i32 %op22, 1
  br label %label_7
label_10:		; preds = %label_11, %label_6		; succs = %label_11, %label_18
  %op32 = phi i32 [ 0, %label_6 ], [ %op48, %label_11 ]
  %op33 = icmp slt i32 %op32, 5
  br i1 %op33, label %label_11, label %label_18
label_11:		; preds = %label_10		; succs = %label_10
  call void @mm(i32 %op0, [1024 x i32]* %op77, [1024 x i32]* %op78, [1024 x i32]* %op79)
  call void @mm(i32 %op0, [1024 x i32]* %op77, [1024 x i32]* %op79, [1024 x i32]* %op78)
  %op48 = add i32 %op32, 1
  br label %label_10
label_12:		; preds = %label_15, %label_18		; succs = %label_13, %label_17
  %op50 = phi i32 [ %op60, %label_15 ], [ 0, %label_18 ]
  %op51 = phi i32 [ %op57, %label_15 ], [ 0, %label_18 ]
  %op52 = icmp slt i32 %op50, %op0
  br i1 %op52, label %label_17, label %label_13
label_13:		; preds = %label_12
  call void @_sysy_stoptime(i32 84)
  call void @putint(i32 %op51)
  call void @putch(i32 10)
  ret i32 0
label_14:		; preds = %label_16, %label_17		; succs = %label_16, %label_15
  %op56 = phi i32 [ %op66, %label_16 ], [ 0, %label_17 ]
  %op57 = phi i32 [ %op65, %label_16 ], [ %op51, %label_17 ]
  %op58 = icmp slt i32 %op56, %op0
  br i1 %op58, label %label_16, label %label_15
label_15:		; preds = %label_14		; succs = %label_12
  %op60 = add i32 %op50, 1
  br label %label_12
label_16:		; preds = %label_14		; succs = %label_14
  %op72 = getelementptr [1024 x i32], [1024 x i32]* %op74, i32 0, i32 %op56
  %op64 = load i32, i32* %op72
  %op65 = add i32 %op57, %op64
  %op66 = add i32 %op56, 1
  br label %label_14
label_17:		; preds = %label_12		; succs = %label_14
  %op74 = getelementptr [1024 x [1024 x i32]], [1024 x [1024 x i32]]* %op62, i32 0, i32 %op50
  br label %label_14
label_18:		; preds = %label_10		; succs = %label_12
  %op62 = bitcast [1048576 x i32]* @B to [1024 x [1024 x i32]]* 
  br label %label_12
label_20:		; preds = %label_5		; succs = %label_7
  %op84 = getelementptr [1024 x [1024 x i32]], [1024 x [1024 x i32]]* %op27, i32 0, i32 %op17
  br label %label_7
label_21:		; preds = %label_1		; succs = %label_5
  %op27 = bitcast [1048576 x i32]* @B to [1024 x [1024 x i32]]* 
  br label %label_5
}
declare void @llvm.memset.p0i8.i64(i8*, i8, i64, i1)
declare void @llvm.memcpy.p0i8.p0i8.i64(i8*, i8*, i64, i1)