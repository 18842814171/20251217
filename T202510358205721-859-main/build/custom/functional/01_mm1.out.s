	.text
	.file	"01_mm1.out.ll"
	.globl	mm                              // -- Begin function mm
	.p2align	4
	.type	mm,@function
mm:                                     // @mm
	.cfi_startproc
// %bb.0:                               // %label_0
	mov	w8, wzr
	mov	x9, x3
	b	.LBB0_2
	.p2align	4, , 8
.LBB0_1:                                // %label_3
                                        //   in Loop: Header=BB0_2 Depth=1
	add	w8, w8, #1
	add	x9, x9, #1, lsl #12             // =4096
.LBB0_2:                                // %label_1
                                        // =>This Loop Header: Depth=1
                                        //     Child Loop BB0_4 Depth 2
	cmp	w8, w0
	b.ge	.LBB0_5
// %bb.3:                               // %label_18
                                        //   in Loop: Header=BB0_2 Depth=1
	mov	x10, xzr
	cmp	w10, w0
	b.ge	.LBB0_1
	.p2align	4, , 8
.LBB0_4:                                // %label_4
                                        //   Parent Loop BB0_2 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	str	wzr, [x9, x10, lsl #2]
	add	x10, x10, #1
	cmp	w10, w0
	b.lt	.LBB0_4
	b	.LBB0_1
.LBB0_5:                                // %label_5.preheader
	mov	w8, wzr
	b	.LBB0_7
	.p2align	4, , 8
.LBB0_6:                                // %label_8
                                        //   in Loop: Header=BB0_7 Depth=1
	add	w8, w8, #1
	add	x2, x2, #1, lsl #12             // =4096
.LBB0_7:                                // %label_5
                                        // =>This Loop Header: Depth=1
                                        //     Child Loop BB0_10 Depth 2
                                        //       Child Loop BB0_12 Depth 3
	cmp	w8, w0
	b.ge	.LBB0_14
// %bb.8:                               // %label_16
                                        //   in Loop: Header=BB0_7 Depth=1
	sxtw	x10, w8
	mov	w9, wzr
	add	x10, x1, x10, lsl #12
	cmp	w9, w0
	b.lt	.LBB0_10
	b	.LBB0_6
	.p2align	4, , 8
.LBB0_9:                                // %label_12
                                        //   in Loop: Header=BB0_10 Depth=2
	add	w9, w9, #1
	cmp	w9, w0
	b.ge	.LBB0_6
.LBB0_10:                               // %label_9
                                        //   Parent Loop BB0_7 Depth=1
                                        // =>  This Loop Header: Depth=2
                                        //       Child Loop BB0_12 Depth 3
	ldr	w11, [x10, w9, sxtw #2]
	cbz	w11, .LBB0_13
// %bb.11:                              // %label_14
                                        //   in Loop: Header=BB0_10 Depth=2
	ldr	w12, [x10, w9, sxtw #2]
	sxtw	x13, w9
	mov	x11, xzr
	add	x13, x3, x13, lsl #12
	cmp	w11, w0
	b.ge	.LBB0_9
	.p2align	4, , 8
.LBB0_12:                               // %label_13
                                        //   Parent Loop BB0_7 Depth=1
                                        //     Parent Loop BB0_10 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	lsl	x14, x11, #2
	add	x11, x11, #1
	ldr	w15, [x13, x14]
	ldr	w16, [x2, x14]
	madd	w15, w12, w16, w15
	str	w15, [x13, x14]
	cmp	w11, w0
	b.lt	.LBB0_12
	b	.LBB0_9
	.p2align	4, , 8
.LBB0_13:                               // %label_10
                                        //   in Loop: Header=BB0_10 Depth=2
	add	w9, w9, #1
	cmp	w9, w0
	b.lt	.LBB0_10
	b	.LBB0_6
.LBB0_14:                               // %label_6
	ret
.Lfunc_end0:
	.size	mm, .Lfunc_end0-mm
	.cfi_endproc
                                        // -- End function
	.globl	main                            // -- Begin function main
	.p2align	4
	.type	main,@function
main:                                   // @main
	.cfi_startproc
// %bb.0:                               // %label_0
	stp	x30, x23, [sp, #-48]!           // 16-byte Folded Spill
	stp	x22, x21, [sp, #16]             // 16-byte Folded Spill
	stp	x20, x19, [sp, #32]             // 16-byte Folded Spill
	.cfi_def_cfa_offset 48
	.cfi_offset w19, -8
	.cfi_offset w20, -16
	.cfi_offset w21, -24
	.cfi_offset w22, -32
	.cfi_offset w23, -40
	.cfi_offset w30, -48
	bl	getint
	adrp	x20, :got:A
	mov	w19, w0
	mov	w21, wzr
	ldr	x20, [x20, :got_lo12:A]
	b	.LBB1_2
	.p2align	4, , 8
.LBB1_1:                                // %label_3
                                        //   in Loop: Header=BB1_2 Depth=1
	add	w21, w21, #1
	add	x20, x20, #4
.LBB1_2:                                // %label_1
                                        // =>This Loop Header: Depth=1
                                        //     Child Loop BB1_4 Depth 2
	cmp	w21, w19
	b.ge	.LBB1_5
// %bb.3:                               // %label_2.preheader
                                        //   in Loop: Header=BB1_2 Depth=1
	mov	w22, wzr
	mov	x23, x20
	cmp	w22, w19
	b.ge	.LBB1_1
	.p2align	4, , 8
.LBB1_4:                                // %label_4
                                        //   Parent Loop BB1_2 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	bl	getint
	add	w22, w22, #1
	str	w0, [x23]
	add	x23, x23, #1, lsl #12           // =4096
	cmp	w22, w19
	b.lt	.LBB1_4
	b	.LBB1_1
.LBB1_5:                                // %label_21
	adrp	x20, :got:B
	mov	w21, wzr
	ldr	x20, [x20, :got_lo12:B]
	b	.LBB1_7
	.p2align	4, , 8
.LBB1_6:                                // %label_8
                                        //   in Loop: Header=BB1_7 Depth=1
	add	w21, w21, #1
	add	x20, x20, #1, lsl #12           // =4096
.LBB1_7:                                // %label_5
                                        // =>This Loop Header: Depth=1
                                        //     Child Loop BB1_9 Depth 2
	cmp	w21, w19
	b.ge	.LBB1_10
// %bb.8:                               // %label_20
                                        //   in Loop: Header=BB1_7 Depth=1
	mov	x22, xzr
	cmp	w22, w19
	b.ge	.LBB1_6
	.p2align	4, , 8
.LBB1_9:                                // %label_9
                                        //   Parent Loop BB1_7 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	bl	getint
	str	w0, [x20, x22, lsl #2]
	add	x22, x22, #1
	cmp	w22, w19
	b.lt	.LBB1_9
	b	.LBB1_6
.LBB1_10:                               // %label_6
	mov	w0, #65                         // =0x41
	bl	_sysy_starttime
	adrp	x20, :got:A
	adrp	x21, :got:B
	adrp	x22, :got:C
	mov	w23, wzr
	ldr	x20, [x20, :got_lo12:A]
	ldr	x21, [x21, :got_lo12:B]
	ldr	x22, [x22, :got_lo12:C]
	cmp	w23, #4
	b.gt	.LBB1_12
	.p2align	4, , 8
.LBB1_11:                               // %label_11
                                        // =>This Inner Loop Header: Depth=1
	mov	w0, w19
	mov	x1, x20
	mov	x2, x21
	mov	x3, x22
	bl	mm
	mov	w0, w19
	mov	x1, x20
	mov	x2, x22
	mov	x3, x21
	bl	mm
	add	w23, w23, #1
	cmp	w23, #4
	b.le	.LBB1_11
.LBB1_12:                               // %label_18
	adrp	x9, :got:B
	mov	w8, wzr
	mov	w20, wzr
	ldr	x9, [x9, :got_lo12:B]
	b	.LBB1_14
	.p2align	4, , 8
.LBB1_13:                               // %label_15
                                        //   in Loop: Header=BB1_14 Depth=1
	add	w8, w8, #1
	add	x9, x9, #1, lsl #12             // =4096
.LBB1_14:                               // %label_12
                                        // =>This Loop Header: Depth=1
                                        //     Child Loop BB1_16 Depth 2
	cmp	w8, w19
	b.ge	.LBB1_17
// %bb.15:                              // %label_17
                                        //   in Loop: Header=BB1_14 Depth=1
	mov	x10, xzr
	cmp	w10, w19
	b.ge	.LBB1_13
	.p2align	4, , 8
.LBB1_16:                               // %label_16
                                        //   Parent Loop BB1_14 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	ldr	w11, [x9, x10, lsl #2]
	add	x10, x10, #1
	add	w20, w20, w11
	cmp	w10, w19
	b.lt	.LBB1_16
	b	.LBB1_13
.LBB1_17:                               // %label_13
	mov	w0, #84                         // =0x54
	bl	_sysy_stoptime
	mov	w0, w20
	bl	putint
	mov	w0, #10                         // =0xa
	bl	putch
	ldp	x20, x19, [sp, #32]             // 16-byte Folded Reload
	mov	w0, wzr
	ldp	x22, x21, [sp, #16]             // 16-byte Folded Reload
	ldp	x30, x23, [sp], #48             // 16-byte Folded Reload
	ret
.Lfunc_end1:
	.size	main, .Lfunc_end1-main
	.cfi_endproc
                                        // -- End function
	.type	A,@object                       // @A
	.bss
	.globl	A
	.p2align	4, 0x0
A:
	.zero	4194304
	.size	A, 4194304

	.type	B,@object                       // @B
	.globl	B
	.p2align	4, 0x0
B:
	.zero	4194304
	.size	B, 4194304

	.type	C,@object                       // @C
	.globl	C
	.p2align	4, 0x0
C:
	.zero	4194304
	.size	C, 4194304

	.section	".note.GNU-stack","",@progbits
