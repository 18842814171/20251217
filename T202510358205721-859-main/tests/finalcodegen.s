	.text
	.align 2
	.globl main
	.type main, @function
main:
	B main_1
main_1:
	MOVZ W0, #15
	RET
	.size main, .-main
