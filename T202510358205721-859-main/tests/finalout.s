	.text
	.file	"finalout.ll"
	.globl	main                            // -- Begin function main
	.p2align	4
	.type	main,@function
main:                                   // @main
	.cfi_startproc
// %bb.0:                               // %label_0
	mov	w0, #15                         // =0xf
	ret
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc
                                        // -- End function
	.section	".note.GNU-stack","",@progbits
