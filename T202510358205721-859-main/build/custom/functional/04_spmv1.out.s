	.text
	.file	"04_spmv1.out.ll"
	.globl	spmv                            // -- Begin function spmv
	.p2align	4
	.type	spmv,@function
spmv:                                   // @spmv
	.cfi_startproc
// %bb.0:                               // %label_0
	mov	x8, xzr
	cmp	w8, w0
	b.ge	.LBB0_2
	.p2align	4, , 8
.LBB0_1:                                // %label_2
                                        // =>This Inner Loop Header: Depth=1
	str	wzr, [x5, x8, lsl #2]
	add	x8, x8, #1
	cmp	w8, w0
	b.lt	.LBB0_1
.LBB0_2:                                // %label_3.preheader
	mov	w8, wzr
	b	.LBB0_4
	.p2align	4, , 8
.LBB0_3:                                // %label_10
                                        //   in Loop: Header=BB0_4 Depth=1
	add	w8, w8, #1
.LBB0_4:                                // %label_3
                                        // =>This Loop Header: Depth=1
                                        //     Child Loop BB0_6 Depth 2
                                        //     Child Loop BB0_8 Depth 2
	cmp	w8, w0
	b.ge	.LBB0_9
// %bb.5:                               // %label_5
                                        //   in Loop: Header=BB0_4 Depth=1
	add	w10, w8, #1
	ldrsw	x9, [x1, w8, sxtw #2]
	ldr	w10, [x1, w10, sxtw #2]
	cmp	w9, w10
	b.ge	.LBB0_7
	.p2align	4, , 8
.LBB0_6:                                // %label_8
                                        //   Parent Loop BB0_4 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	lsl	x11, x9, #2
	add	x9, x9, #1
	ldrsw	x12, [x2, x11]
	ldr	w11, [x3, x11]
	lsl	x12, x12, #2
	ldr	w13, [x5, x12]
	add	w11, w13, w11
	str	w11, [x5, x12]
	cmp	w9, w10
	b.lt	.LBB0_6
.LBB0_7:                                // %label_7
                                        //   in Loop: Header=BB0_4 Depth=1
	sbfiz	x9, x8, #2, #32
	add	w10, w8, #1
	ldr	w11, [x4, x9]
	ldrsw	x9, [x1, x9]
	ldr	w10, [x1, w10, sxtw #2]
	sub	w11, w11, #1
	cmp	w9, w10
	b.ge	.LBB0_3
	.p2align	4, , 8
.LBB0_8:                                // %label_11
                                        //   Parent Loop BB0_4 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	lsl	x12, x9, #2
	add	x9, x9, #1
	ldrsw	x13, [x2, x12]
	ldr	w12, [x3, x12]
	lsl	x13, x13, #2
	ldr	w14, [x5, x13]
	madd	w12, w12, w11, w14
	str	w12, [x5, x13]
	cmp	w9, w10
	b.lt	.LBB0_8
	b	.LBB0_3
.LBB0_9:                                // %label_4
	ret
.Lfunc_end0:
	.size	spmv, .Lfunc_end0-spmv
	.cfi_endproc
                                        // -- End function
	.globl	main                            // -- Begin function main
	.p2align	4
	.type	main,@function
main:                                   // @main
	.cfi_startproc
// %bb.0:                               // %label_0
	stp	x30, x25, [sp, #-64]!           // 16-byte Folded Spill
	stp	x24, x23, [sp, #16]             // 16-byte Folded Spill
	stp	x22, x21, [sp, #32]             // 16-byte Folded Spill
	stp	x20, x19, [sp, #48]             // 16-byte Folded Spill
	.cfi_def_cfa_offset 64
	.cfi_offset w19, -8
	.cfi_offset w20, -16
	.cfi_offset w21, -24
	.cfi_offset w22, -32
	.cfi_offset w23, -40
	.cfi_offset w24, -48
	.cfi_offset w25, -56
	.cfi_offset w30, -64
	adrp	x19, :got:x
	ldr	x19, [x19, :got_lo12:x]
	mov	x0, x19
	bl	getarray
	adrp	x20, :got:y
	mov	w23, w0
	ldr	x20, [x20, :got_lo12:y]
	mov	x0, x20
	bl	getarray
	adrp	x21, :got:v
	ldr	x21, [x21, :got_lo12:v]
	mov	x0, x21
	bl	getarray
	adrp	x22, :got:a
	ldr	x22, [x22, :got_lo12:a]
	mov	x0, x22
	bl	getarray
	mov	w0, #39                         // =0x27
	bl	_sysy_starttime
	adrp	x24, :got:b
	mov	w25, wzr
	sub	w23, w23, #1
	ldr	x24, [x24, :got_lo12:b]
	cmp	w25, #100
	b.ge	.LBB1_2
	.p2align	4, , 8
.LBB1_1:                                // %label_3
                                        // =>This Inner Loop Header: Depth=1
	mov	w0, w23
	mov	x1, x19
	mov	x2, x20
	mov	x3, x21
	mov	x4, x22
	mov	x5, x24
	bl	spmv
	mov	w0, w23
	mov	x1, x19
	mov	x2, x20
	mov	x3, x21
	mov	x4, x24
	mov	x5, x22
	bl	spmv
	add	w25, w25, #1
	cmp	w25, #100
	b.lt	.LBB1_1
.LBB1_2:                                // %label_2
	mov	w0, #47                         // =0x2f
	bl	_sysy_stoptime
	adrp	x1, :got:b
	mov	w0, w23
	ldr	x1, [x1, :got_lo12:b]
	bl	putarray
	ldp	x20, x19, [sp, #48]             // 16-byte Folded Reload
	mov	w0, wzr
	ldp	x22, x21, [sp, #32]             // 16-byte Folded Reload
	ldp	x24, x23, [sp, #16]             // 16-byte Folded Reload
	ldp	x30, x25, [sp], #64             // 16-byte Folded Reload
	ret
.Lfunc_end1:
	.size	main, .Lfunc_end1-main
	.cfi_endproc
                                        // -- End function
	.type	x,@object                       // @x
	.bss
	.globl	x
	.p2align	4, 0x0
x:
	.zero	400040
	.size	x, 400040

	.type	y,@object                       // @y
	.globl	y
	.p2align	4, 0x0
y:
	.zero	12000000
	.size	y, 12000000

	.type	v,@object                       // @v
	.globl	v
	.p2align	4, 0x0
v:
	.zero	12000000
	.size	v, 12000000

	.type	a,@object                       // @a
	.globl	a
	.p2align	4, 0x0
a:
	.zero	400040
	.size	a, 400040

	.type	b,@object                       // @b
	.globl	b
	.p2align	4, 0x0
b:
	.zero	400040
	.size	b, 400040

	.section	".note.GNU-stack","",@progbits
