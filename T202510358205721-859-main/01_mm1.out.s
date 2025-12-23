	.bss
	.align 4
	.globl A
	.type A, @object
A:
	.zero 4194304
	.size A, 4194304
	.align 4
	.globl B
	.type B, @object
B:
	.zero 4194304
	.size B, 4194304
	.align 4
	.globl C
	.type C, @object
C:
	.zero 4194304
	.size C, 4194304
	.text
	.align 2
	.globl mm
	.type mm, @function
mm:
	SUB SP, SP, #64
	STR X19, [SP, #0]
	STP X20, X21, [SP, #8]
	STP X22, X23, [SP, #24]
	STP X24, X25, [SP, #40]
	B mm_1
mm_1:
	MOV W19, WZR
	B mm_2
mm_2:
	CMP W19, W0
	B.LT mm_4
	B mm_3
mm_3:
	MOV W19, WZR
	B mm_8
mm_4:
	MOV W20, WZR
	B mm_5
mm_5:
	CMP W20, W0
	B.LT mm_7
	B mm_6
mm_6:
	ADD W19, W19, #1
	B mm_2
mm_7:
	LSL W21, W19, #10
	ADD W21, W21, W20
	LSL W21, W21, #2
	SXTW X21, W21
	ADD X21, X3, X21
	MOV W16, WZR
	STR W16, [X21, #0]
	ADD W20, W20, #1
	B mm_5
mm_8:
	CMP W19, W0
	B.LT mm_10
	B mm_9
mm_9:
	LDP X24, X25, [SP, #40]
	LDP X22, X23, [SP, #24]
	LDP X20, X21, [SP, #8]
	LDR X19, [SP, #0]
	ADD SP, SP, #64
	RET
mm_10:
	MOV W20, WZR
	B mm_11
mm_11:
	CMP W20, W0
	B.LT mm_13
	B mm_12
mm_12:
	ADD W19, W19, #1
	B mm_8
mm_13:
	LSL W21, W20, #10
	ADD W21, W21, W19
	LSL W21, W21, #2
	SXTW X21, W21
	ADD X21, X1, X21
	LDR W21, [X21, #0]
	CMP W21, #0
	B.EQ mm_14
	B mm_15
mm_14:
	ADD W20, W20, #1
	B mm_11
mm_15:
	MOV W21, WZR
	B mm_16
mm_16:
	CMP W21, W0
	B.LT mm_18
	B mm_17
mm_17:
	ADD W20, W20, #1
	B mm_11
mm_18:
	LSL W22, W20, #10
	ADD W22, W22, W21
	LSL W22, W22, #2
	SXTW X22, W22
	ADD X25, X3, X22
	LSL W22, W20, #10
	ADD W22, W22, W21
	LSL W22, W22, #2
	SXTW X22, W22
	ADD X22, X3, X22
	LDR W22, [X22, #0]
	LSL W23, W20, #10
	ADD W23, W23, W19
	LSL W23, W23, #2
	SXTW X23, W23
	ADD X23, X1, X23
	LDR W23, [X23, #0]
	LSL W24, W19, #10
	ADD W24, W24, W21
	LSL W24, W24, #2
	SXTW X24, W24
	ADD X24, X2, X24
	LDR W24, [X24, #0]
	MUL W23, W23, W24
	ADD W22, W22, W23
	STR W22, [X25, #0]
	ADD W21, W21, #1
	B mm_16
	.size mm, .-mm
	.globl main
	.type main, @function
main:
	SUB SP, SP, #48
	STP X19, X20, [SP, #0]
	STP X21, X22, [SP, #16]
	STP X23, X24, [SP, #32]
	MOV X20, X30
	B main_1
main_1:
	BL getint
	MOV W19, W0
	MOV W21, WZR
	B main_2
main_2:
	CMP W21, W19
	B.LT main_4
	B main_3
main_3:
	MOV W21, WZR
	B main_8
main_4:
	MOV W22, WZR
	B main_5
main_5:
	CMP W22, W19
	B.LT main_7
	B main_6
main_6:
	ADD W21, W21, #1
	B main_2
main_7:
	LSL W23, W21, #10
	ADD W23, W23, W22
	LSL W23, W23, #2
	SXTW X23, W23
	LDR X17, =A
	ADD X23, X17, X23
	BL getint
	STR W0, [X23, #0]
	ADD W22, W22, #1
	B main_5
main_8:
	CMP W21, W19
	B.LT main_10
	B main_9
main_9:
	MOVZ W0, #65
	BL _sysy_starttime
	MOV W21, WZR
	B main_14
main_10:
	MOV W22, WZR
	B main_11
main_11:
	CMP W22, W19
	B.LT main_13
	B main_12
main_12:
	ADD W21, W21, #1
	B main_8
main_13:
	LSL W23, W21, #10
	ADD W23, W23, W22
	LSL W23, W23, #2
	SXTW X23, W23
	LDR X16, =B
	ADD X23, X16, X23
	BL getint
	STR W0, [X23, #0]
	ADD W22, W22, #1
	B main_11
main_14:
	CMP W21, #5
	B.LT main_16
	B main_15
main_15:
	MOV W21, WZR
	MOV W22, WZR
	B main_17
main_16:
	MOV W0, W19
	LDR X1, =A
	LDR X2, =B
	LDR X3, =C
	BL mm
	MOV W0, W19
	LDR X1, =A
	LDR X2, =C
	LDR X3, =B
	BL mm
	ADD W21, W21, #1
	B main_14
main_17:
	CMP W22, W19
	B.LT main_19
	B main_18
main_18:
	MOVZ W0, #84
	BL _sysy_stoptime
	MOV W0, W21
	BL putint
	MOVZ W0, #10
	BL putch
	MOV W0, WZR
	MOV X30, X20
	LDP X23, X24, [SP, #32]
	LDP X21, X22, [SP, #16]
	LDP X19, X20, [SP, #0]
	ADD SP, SP, #48
	RET
main_19:
	MOV W23, WZR
	B main_20
main_20:
	CMP W23, W19
	B.LT main_22
	B main_21
main_21:
	ADD W22, W22, #1
	B main_17
main_22:
	LSL W24, W22, #10
	ADD W24, W24, W23
	LSL W24, W24, #2
	SXTW X24, W24
	LDR X17, =B
	ADD X24, X17, X24
	LDR W24, [X24, #0]
	ADD W21, W21, W24
	ADD W23, W23, #1
	B main_20
	.size main, .-main
