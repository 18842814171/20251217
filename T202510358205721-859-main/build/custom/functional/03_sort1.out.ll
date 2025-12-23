@a = global [30000010 x i32] zeroinitializer
@ans = global i32 0
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

define i32 @getNumPos(i32 %arg0, i32 %arg1) {
label_0:		; succs = %label_1
  br label %label_1
label_1:		; preds = %label_3, %label_0		; succs = %label_3, %label_2
  %op18 = phi i32 [ %arg0, %label_0 ], [ %op15, %label_3 ]
  %op19 = phi i32 [ 0, %label_0 ], [ %op17, %label_3 ]
  %op9 = icmp slt i32 %op19, %arg1
  br i1 %op9, label %label_3, label %label_2
label_2:		; preds = %label_1
  %op12 = srem i32 %op18, 16
  ret i32 %op12
label_3:		; preds = %label_1		; succs = %label_1
  %op15 = sdiv i32 %op18, 16
  %op17 = add i32 %op19, 1
  br label %label_1
}
define void @radixSort(i32 %arg0, i32* %arg1, i32 %arg2, i32 %arg3) {
label_0:		; succs = %label_2, %label_26
  %op8 = alloca [16 x i32]
  %op9 = alloca [16 x i32]
  %op10 = alloca [16 x i32]
  %op207 = getelementptr [16 x i32], [16 x i32]* %op8, i32 0, i32 0
  %op16 = bitcast i32* %op207 to i8*
  call void @llvm.memset.p0i8.i64(i8* %op16, i8 0 , i64 64, i1 false)
  %op208 = getelementptr [16 x i32], [16 x i32]* %op9, i32 0, i32 0
  %op18 = bitcast i32* %op208 to i8*
  call void @llvm.memset.p0i8.i64(i8* %op18, i8 0 , i64 64, i1 false)
  %op209 = getelementptr [16 x i32], [16 x i32]* %op10, i32 0, i32 0
  %op20 = bitcast i32* %op209 to i8*
  call void @llvm.memset.p0i8.i64(i8* %op20, i8 0 , i64 64, i1 false)
  %op22 = icmp eq i32 %arg0, -1
  br i1 %op22, label %label_26, label %label_2
label_2:		; preds = %label_0		; succs = %label_26, %label_3
  %op28 = add i32 %arg2, 1
  %op30 = icmp sge i32 %op28, %arg3
  br i1 %op30, label %label_26, label %label_3
label_3:		; preds = %label_5, %label_2		; succs = %label_5, %label_4
  %op197 = phi i32 [ %op61, %label_5 ], [ %arg2, %label_2 ]
  %op34 = icmp slt i32 %op197, %arg3
  br i1 %op34, label %label_5, label %label_4
label_4:		; preds = %label_3		; succs = %label_6
  %op210 = getelementptr [16 x i32], [16 x i32]* %op8, i32 0, i32 0
  store i32 %arg2, i32* %op210
  %op211 = getelementptr [16 x i32], [16 x i32]* %op9, i32 0, i32 0
  %op212 = getelementptr [16 x i32], [16 x i32]* %op10, i32 0, i32 0
  %op41 = load i32, i32* %op212
  %op42 = add i32 %arg2, %op41
  store i32 %op42, i32* %op211
  br label %label_6
label_5:		; preds = %label_3		; succs = %label_3
  %op46 = getelementptr i32, i32* %arg1, i32 %op197
  %op47 = load i32, i32* %op46
  %op49 = call i32 @getNumPos(i32 %op47, i32 %arg0)
  %op213 = getelementptr [16 x i32], [16 x i32]* %op10, i32 0, i32 %op49
  %op54 = load i32, i32* %op46
  %op56 = call i32 @getNumPos(i32 %op54, i32 %arg0)
  %op214 = getelementptr [16 x i32], [16 x i32]* %op10, i32 0, i32 %op56
  %op58 = load i32, i32* %op214
  %op59 = add i32 %op58, 1
  store i32 %op59, i32* %op213
  %op61 = add i32 %op197, 1
  br label %label_3
label_6:		; preds = %label_7, %label_4		; succs = %label_7, %label_8
  %op198 = phi i32 [ 1, %label_4 ], [ %op83, %label_7 ]
  %op64 = icmp slt i32 %op198, 16
  br i1 %op64, label %label_7, label %label_8
label_7:		; preds = %label_6		; succs = %label_6
  %op215 = getelementptr [16 x i32], [16 x i32]* %op8, i32 0, i32 %op198
  %op70 = sub i32 %op198, 1
  %op216 = getelementptr [16 x i32], [16 x i32]* %op9, i32 0, i32 %op70
  %op72 = load i32, i32* %op216
  store i32 %op72, i32* %op215
  %op217 = getelementptr [16 x i32], [16 x i32]* %op9, i32 0, i32 %op198
  %op77 = load i32, i32* %op215
  %op219 = getelementptr [16 x i32], [16 x i32]* %op10, i32 0, i32 %op198
  %op80 = load i32, i32* %op219
  %op81 = add i32 %op77, %op80
  store i32 %op81, i32* %op217
  %op83 = add i32 %op198, 1
  br label %label_6
label_8:		; preds = %label_11, %label_6		; succs = %label_9, %label_22
  %op199 = phi i32 [ %op107, %label_11 ], [ 0, %label_6 ]
  %op86 = icmp slt i32 %op199, 16
  br i1 %op86, label %label_22, label %label_9
label_9:		; preds = %label_8		; succs = %label_16
  %op220 = getelementptr [16 x i32], [16 x i32]* %op8, i32 0, i32 0
  store i32 %arg2, i32* %op220
  %op221 = getelementptr [16 x i32], [16 x i32]* %op9, i32 0, i32 0
  %op222 = getelementptr [16 x i32], [16 x i32]* %op10, i32 0, i32 0
  %op94 = load i32, i32* %op222
  %op95 = add i32 %arg2, %op94
  store i32 %op95, i32* %op221
  %op187 = sub i32 %arg0, 1
  br label %label_16
label_10:		; preds = %label_14, %label_27		; succs = %label_13
  %op112 = load i32, i32* %op241
  %op113 = getelementptr i32, i32* %arg1, i32 %op112
  %op114 = load i32, i32* %op113
  br label %label_13
label_11:		; preds = %label_22, %label_14		; succs = %label_8
  %op107 = add i32 %op199, 1
  br label %label_8
label_13:		; preds = %label_15, %label_10		; succs = %label_15, %label_14
  %op204 = phi i32 [ %op114, %label_10 ], [ %op143, %label_15 ]
  %op118 = call i32 @getNumPos(i32 %op204, i32 %arg0)
  %op120 = icmp ne i32 %op118, %op199
  br i1 %op120, label %label_15, label %label_14
label_14:		; preds = %label_13		; succs = %label_10, %label_11
  %op125 = load i32, i32* %op241
  %op126 = getelementptr i32, i32* %arg1, i32 %op125
  store i32 %op204, i32* %op126
  %op132 = load i32, i32* %op241
  %op133 = add i32 %op132, 1
  store i32 %op133, i32* %op241
  %op100 = load i32, i32* %op242
  %op104 = icmp slt i32 %op100, %op103
  br i1 %op104, label %label_10, label %label_11
label_15:		; preds = %label_13		; succs = %label_13
  %op139 = call i32 @getNumPos(i32 %op204, i32 %arg0)
  %op224 = getelementptr [16 x i32], [16 x i32]* %op8, i32 0, i32 %op139
  %op141 = load i32, i32* %op224
  %op142 = getelementptr i32, i32* %arg1, i32 %op141
  %op143 = load i32, i32* %op142
  %op147 = call i32 @getNumPos(i32 %op204, i32 %arg0)
  %op225 = getelementptr [16 x i32], [16 x i32]* %op8, i32 0, i32 %op147
  %op149 = load i32, i32* %op225
  %op150 = getelementptr i32, i32* %arg1, i32 %op149
  store i32 %op204, i32* %op150
  %op154 = call i32 @getNumPos(i32 %op204, i32 %arg0)
  %op226 = getelementptr [16 x i32], [16 x i32]* %op8, i32 0, i32 %op154
  %op158 = call i32 @getNumPos(i32 %op204, i32 %arg0)
  %op227 = getelementptr [16 x i32], [16 x i32]* %op8, i32 0, i32 %op158
  %op160 = load i32, i32* %op227
  %op161 = add i32 %op160, 1
  store i32 %op161, i32* %op226
  br label %label_13
label_16:		; preds = %label_19, %label_9		; succs = %label_17, %label_26
  %op206 = phi i32 [ 0, %label_9 ], [ %op196, %label_19 ]
  %op164 = icmp slt i32 %op206, 16
  br i1 %op164, label %label_17, label %label_26
label_17:		; preds = %label_16		; succs = %label_18, %label_19
  %op168 = icmp sgt i32 %op206, 0
  br i1 %op168, label %label_18, label %label_19
label_18:		; preds = %label_17		; succs = %label_19
  %op228 = getelementptr [16 x i32], [16 x i32]* %op8, i32 0, i32 %op206
  %op173 = sub i32 %op206, 1
  %op229 = getelementptr [16 x i32], [16 x i32]* %op9, i32 0, i32 %op173
  %op175 = load i32, i32* %op229
  store i32 %op175, i32* %op228
  %op230 = getelementptr [16 x i32], [16 x i32]* %op9, i32 0, i32 %op206
  %op180 = load i32, i32* %op228
  %op232 = getelementptr [16 x i32], [16 x i32]* %op10, i32 0, i32 %op206
  %op183 = load i32, i32* %op232
  %op184 = add i32 %op180, %op183
  store i32 %op184, i32* %op230
  br label %label_19
label_19:		; preds = %label_17, %label_18		; succs = %label_16
  %op233 = getelementptr [16 x i32], [16 x i32]* %op8, i32 0, i32 %op206
  %op191 = load i32, i32* %op233
  %op234 = getelementptr [16 x i32], [16 x i32]* %op9, i32 0, i32 %op206
  %op194 = load i32, i32* %op234
  call void @radixSort(i32 %op187, i32* %arg1, i32 %op191, i32 %op194)
  %op196 = add i32 %op206, 1
  br label %label_16
label_22:		; preds = %label_8		; succs = %label_11, %label_27
  %op242 = getelementptr [16 x i32], [16 x i32]* %op8, i32 0, i32 %op199
  %op243 = getelementptr [16 x i32], [16 x i32]* %op9, i32 0, i32 %op199
  %op103 = load i32, i32* %op243
  %op244 = load i32, i32* %op242
  %op245 = icmp slt i32 %op244, %op103
  br i1 %op245, label %label_27, label %label_11
label_26:		; preds = %label_16, %label_0, %label_2
  ret void
label_27:		; preds = %label_22		; succs = %label_10
  %op241 = getelementptr [16 x i32], [16 x i32]* %op8, i32 0, i32 %op199
  br label %label_10
}
define i32 @main() {
label_0:		; succs = %label_1
  %op2 = bitcast [30000010 x i32]* @a to [30000010 x i32]* 
  %op35 = getelementptr [30000010 x i32], [30000010 x i32]* %op2, i32 0, i32 0
  %op4 = call i32 @getarray(i32* %op35)
  call void @_sysy_starttime(i32 90)
  call void @radixSort(i32 8, i32* %op35, i32 0, i32 %op4)
  br label %label_1
label_1:		; preds = %label_3, %label_0		; succs = %label_3, %label_2
  %op34 = phi i32 [ 0, %label_0 ], [ %op28, %label_3 ]
  %op11 = icmp slt i32 %op34, %op4
  br i1 %op11, label %label_3, label %label_2
label_2:		; preds = %label_1		; succs = %label_4, %label_5
  %op13 = load i32, i32* @ans
  %op14 = icmp slt i32 %op13, 0
  br i1 %op14, label %label_4, label %label_5
label_3:		; preds = %label_1		; succs = %label_1
  %op16 = load i32, i32* @ans
  %op37 = getelementptr [30000010 x i32], [30000010 x i32]* %op2, i32 0, i32 %op34
  %op21 = load i32, i32* %op37
  %op23 = add i32 2, %op34
  %op24 = srem i32 %op21, %op23
  %op25 = mul i32 %op34, %op24
  %op26 = add i32 %op16, %op25
  store i32 %op26, i32* @ans
  %op28 = add i32 %op34, 1
  br label %label_1
label_4:		; preds = %label_2		; succs = %label_5
  %op30 = load i32, i32* @ans
  %op31 = sub i32 0, %op30
  store i32 %op31, i32* @ans
  br label %label_5
label_5:		; preds = %label_2, %label_4
  call void @_sysy_stoptime(i32 102)
  %op33 = load i32, i32* @ans
  call void @putint(i32 %op33)
  call void @putch(i32 10)
  ret i32 0
}
declare void @llvm.memset.p0i8.i64(i8*, i8, i64, i1)
declare void @llvm.memcpy.p0i8.p0i8.i64(i8*, i8*, i64, i1)