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
  %op86 = phi i32 [ 0, %label_0 ], [ %op23, %label_3 ]
  %op14 = icmp slt i32 %op86, %arg0
  br i1 %op14, label %label_18, label %label_5
label_2:		; preds = %label_4, %label_18		; succs = %label_4, %label_3
  %op88 = phi i32 [ %op30, %label_4 ], [ 0, %label_18 ]
  %op20 = icmp slt i32 %op88, %arg0
  br i1 %op20, label %label_4, label %label_3
label_3:		; preds = %label_2		; succs = %label_1
  %op23 = add i32 %op86, 1
  br label %label_1
label_4:		; preds = %label_2		; succs = %label_2
  %op95 = getelementptr [1024 x i32], [1024 x i32]* %op113, i32 0, i32 %op88
  store i32 0, i32* %op95
  %op30 = add i32 %op88, 1
  br label %label_2
label_5:		; preds = %label_8, %label_1		; succs = %label_6, %label_16
  %op91 = phi i32 [ %op43, %label_8 ], [ 0, %label_1 ]
  %op34 = icmp slt i32 %op91, %arg0
  br i1 %op34, label %label_16, label %label_6
label_6:		; preds = %label_5
  ret void
label_7:		; preds = %label_10, %label_15		; succs = %label_9, %label_8
  %op92 = phi i32 [ %op106, %label_15 ], [ %op53, %label_10 ]
  %op40 = icmp slt i32 %op92, %arg0
  br i1 %op40, label %label_9, label %label_8
label_8:		; preds = %label_7		; succs = %label_5
  %op43 = add i32 %op91, 1
  br label %label_5
label_9:		; preds = %label_7		; succs = %label_10, %label_14
  %op96 = getelementptr [1024 x i32], [1024 x i32]* %op108, i32 0, i32 %op92
  %op49 = load i32, i32* %op96
  %op50 = icmp eq i32 %op49, 0
  br i1 %op50, label %label_10, label %label_14
label_10:		; preds = %label_9		; succs = %label_7
  %op53 = add i32 %op92, 1
  br label %label_7
label_11:		; preds = %label_13, %label_14		; succs = %label_13, %label_12
  %op94 = phi i32 [ %op85, %label_13 ], [ 0, %label_14 ]
  %op58 = icmp slt i32 %op94, %arg0
  br i1 %op58, label %label_13, label %label_12
label_12:		; preds = %label_11		; succs = %label_15
  %op61 = add i32 %op92, 1
  br label %label_15
label_13:		; preds = %label_11		; succs = %label_11
  %op97 = getelementptr [1024 x i32], [1024 x i32]* %op102, i32 0, i32 %op94
  %op71 = load i32, i32* %op97
  %op99 = getelementptr [1024 x i32], [1024 x i32]* %op110, i32 0, i32 %op94
  %op81 = load i32, i32* %op99
  %op82 = mul i32 %op76, %op81
  %op83 = add i32 %op71, %op82
  store i32 %op83, i32* %op97
  %op85 = add i32 %op94, 1
  br label %label_11
label_14:		; preds = %label_9		; succs = %label_11
  %op102 = getelementptr [1024 x i32], [1024 x i32]* %arg3, i32 %op92
  %op104 = getelementptr [1024 x i32], [1024 x i32]* %op108, i32 0, i32 %op92
  %op76 = load i32, i32* %op104
  br label %label_11
label_15:		; preds = %label_12, %label_16		; succs = %label_7
  %op106 = phi i32 [ 0, %label_16 ], [ %op61, %label_12 ]
  br label %label_7
label_16:		; preds = %label_5		; succs = %label_15
  %op108 = getelementptr [1024 x i32], [1024 x i32]* %arg1, i32 %op91
  %op110 = getelementptr [1024 x i32], [1024 x i32]* %arg2, i32 %op91
  br label %label_15
label_18:		; preds = %label_1		; succs = %label_2
  %op113 = getelementptr [1024 x i32], [1024 x i32]* %arg3, i32 %op86
  br label %label_2
}
define i32 @main() {
label_0:		; succs = %label_1
  %op4 = call i32 @getint()
  %op19 = bitcast [1048576 x i32]* @A to [1024 x [1024 x i32]]* 
  br label %label_1
label_1:		; preds = %label_3, %label_0		; succs = %label_21, %label_2
  %op92 = phi i32 [ 0, %label_0 ], [ %op17, %label_3 ]
  %op8 = icmp slt i32 %op92, %op4
  br i1 %op8, label %label_2, label %label_21
label_2:		; preds = %label_4, %label_1		; succs = %label_4, %label_3
  %op94 = phi i32 [ %op25, %label_4 ], [ 0, %label_1 ]
  %op14 = icmp slt i32 %op94, %op4
  br i1 %op14, label %label_4, label %label_3
label_3:		; preds = %label_2		; succs = %label_1
  %op17 = add i32 %op92, 1
  br label %label_1
label_4:		; preds = %label_2		; succs = %label_2
  %op104 = getelementptr [1024 x [1024 x i32]], [1024 x [1024 x i32]]* %op19, i32 0, i32 %op94
  %op105 = getelementptr [1024 x i32], [1024 x i32]* %op104, i32 0, i32 %op92
  %op23 = call i32 @getint()
  store i32 %op23, i32* %op105
  %op25 = add i32 %op94, 1
  br label %label_2
label_5:		; preds = %label_8, %label_21		; succs = %label_6, %label_20
  %op95 = phi i32 [ %op38, %label_8 ], [ 0, %label_21 ]
  %op29 = icmp slt i32 %op95, %op4
  br i1 %op29, label %label_20, label %label_6
label_6:		; preds = %label_5		; succs = %label_10
  call void @_sysy_starttime(i32 65)
  %op53 = bitcast [1048576 x i32]* @A to [1024 x [1024 x i32]]* 
  %op114 = getelementptr [1024 x [1024 x i32]], [1024 x [1024 x i32]]* %op53, i32 0, i32 0
  %op55 = bitcast [1048576 x i32]* @B to [1024 x [1024 x i32]]* 
  %op115 = getelementptr [1024 x [1024 x i32]], [1024 x [1024 x i32]]* %op55, i32 0, i32 0
  %op57 = bitcast [1048576 x i32]* @C to [1024 x [1024 x i32]]* 
  %op116 = getelementptr [1024 x [1024 x i32]], [1024 x [1024 x i32]]* %op57, i32 0, i32 0
  br label %label_10
label_7:		; preds = %label_9, %label_20		; succs = %label_9, %label_8
  %op97 = phi i32 [ %op46, %label_9 ], [ 0, %label_20 ]
  %op35 = icmp slt i32 %op97, %op4
  br i1 %op35, label %label_9, label %label_8
label_8:		; preds = %label_7		; succs = %label_5
  %op38 = add i32 %op95, 1
  br label %label_5
label_9:		; preds = %label_7		; succs = %label_7
  %op106 = getelementptr [1024 x i32], [1024 x i32]* %op121, i32 0, i32 %op97
  %op44 = call i32 @getint()
  store i32 %op44, i32* %op106
  %op46 = add i32 %op97, 1
  br label %label_7
label_10:		; preds = %label_11, %label_6		; succs = %label_11, %label_18
  %op98 = phi i32 [ 0, %label_6 ], [ %op67, %label_11 ]
  %op49 = icmp slt i32 %op98, 5
  br i1 %op49, label %label_11, label %label_18
label_11:		; preds = %label_10		; succs = %label_10
  call void @mm(i32 %op4, [1024 x i32]* %op114, [1024 x i32]* %op115, [1024 x i32]* %op116)
  call void @mm(i32 %op4, [1024 x i32]* %op114, [1024 x i32]* %op116, [1024 x i32]* %op115)
  %op67 = add i32 %op98, 1
  br label %label_10
label_12:		; preds = %label_15, %label_18		; succs = %label_13, %label_17
  %op99 = phi i32 [ %op81, %label_15 ], [ 0, %label_18 ]
  %op101 = phi i32 [ %op103, %label_15 ], [ 0, %label_18 ]
  %op71 = icmp slt i32 %op99, %op4
  br i1 %op71, label %label_17, label %label_13
label_13:		; preds = %label_12
  call void @_sysy_stoptime(i32 84)
  call void @putint(i32 %op101)
  call void @putch(i32 10)
  ret i32 0
label_14:		; preds = %label_16, %label_17		; succs = %label_16, %label_15
  %op102 = phi i32 [ %op91, %label_16 ], [ 0, %label_17 ]
  %op103 = phi i32 [ %op89, %label_16 ], [ %op101, %label_17 ]
  %op78 = icmp slt i32 %op102, %op4
  br i1 %op78, label %label_16, label %label_15
label_15:		; preds = %label_14		; succs = %label_12
  %op81 = add i32 %op99, 1
  br label %label_12
label_16:		; preds = %label_14		; succs = %label_14
  %op109 = getelementptr [1024 x i32], [1024 x i32]* %op111, i32 0, i32 %op102
  %op88 = load i32, i32* %op109
  %op89 = add i32 %op103, %op88
  %op91 = add i32 %op102, 1
  br label %label_14
label_17:		; preds = %label_12		; succs = %label_14
  %op111 = getelementptr [1024 x [1024 x i32]], [1024 x [1024 x i32]]* %op84, i32 0, i32 %op99
  br label %label_14
label_18:		; preds = %label_10		; succs = %label_12
  %op84 = bitcast [1048576 x i32]* @B to [1024 x [1024 x i32]]* 
  br label %label_12
label_20:		; preds = %label_5		; succs = %label_7
  %op121 = getelementptr [1024 x [1024 x i32]], [1024 x [1024 x i32]]* %op40, i32 0, i32 %op95
  br label %label_7
label_21:		; preds = %label_1		; succs = %label_5
  %op40 = bitcast [1048576 x i32]* @B to [1024 x [1024 x i32]]* 
  br label %label_5
}
declare void @llvm.memset.p0i8.i64(i8*, i8, i64, i1)
declare void @llvm.memcpy.p0i8.p0i8.i64(i8*, i8*, i64, i1)