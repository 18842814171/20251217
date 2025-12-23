	.text
	.file	"03_sort3.out.ll"
	.globl	getNumPos                       // -- Begin function getNumPos
	.p2align	4
	.type	getNumPos,@function
getNumPos:                              // @getNumPos
	.cfi_startproc
// %bb.0:                               // %label_0
	mov	w8, wzr
	cmp	w8, w1
	b.ge	.LBB0_2
	.p2align	4, , 8
.LBB0_1:                                // %label_3
                                        // =>This Inner Loop Header: Depth=1
	add	w9, w0, #15
	cmp	w0, #0
	csel	w9, w9, w0, lt
	add	w8, w8, #1
	asr	w0, w9, #4
	cmp	w8, w1
	b.lt	.LBB0_1
.LBB0_2:                                // %label_2
	negs	w8, w0
	and	w9, w0, #0xf
	and	w8, w8, #0xf
	csneg	w0, w9, w8, mi
	ret
.Lfunc_end0:
	.size	getNumPos, .Lfunc_end0-getNumPos
	.cfi_endproc
                                        // -- End function
	.globl	radixSort                       // -- Begin function radixSort
	.p2align	4
	.type	radixSort,@function
radixSort:                              // @radixSort
	.cfi_startproc
// %bb.0:                               // %label_0
	sub	sp, sp, #304
	stp	x29, x30, [sp, #208]            // 16-byte Folded Spill
	stp	x28, x27, [sp, #224]            // 16-byte Folded Spill
	stp	x26, x25, [sp, #240]            // 16-byte Folded Spill
	stp	x24, x23, [sp, #256]            // 16-byte Folded Spill
	stp	x22, x21, [sp, #272]            // 16-byte Folded Spill
	stp	x20, x19, [sp, #288]            // 16-byte Folded Spill
	.cfi_def_cfa_offset 304
	.cfi_offset w19, -8
	.cfi_offset w20, -16
	.cfi_offset w21, -24
	.cfi_offset w22, -32
	.cfi_offset w23, -40
	.cfi_offset w24, -48
	.cfi_offset w25, -56
	.cfi_offset w26, -64
	.cfi_offset w27, -72
	.cfi_offset w28, -80
	.cfi_offset w30, -88
	.cfi_offset w29, -96
	movi	v0.2d, #0000000000000000
	cmn	w0, #1
	stp	q0, q0, [sp, #16]
	stp	q0, q0, [sp, #48]
	stp	q0, q0, [sp, #80]
	stp	q0, q0, [sp, #112]
	stp	q0, q0, [sp, #144]
	stp	q0, q0, [sp, #176]
	b.eq	.LBB1_20
// %bb.1:                               // %label_0
	mov	w22, w3
	mov	w20, w2
	add	w8, w2, #1
	cmp	w8, w3
	b.ge	.LBB1_20
// %bb.2:                               // %label_3.preheader
	mov	x19, x1
	mov	w21, w0
	add	x24, sp, #16
	sxtw	x25, w20
	cmp	w25, w22
	b.ge	.LBB1_4
	.p2align	4, , 8
.LBB1_3:                                // %label_5
                                        // =>This Inner Loop Header: Depth=1
	lsl	x23, x25, #2
	mov	w1, w21
	ldr	w0, [x19, x23]
	bl	getNumPos
	ldr	w8, [x19, x23]
	mov	w23, w0
	mov	w1, w21
	mov	w0, w8
	bl	getNumPos
	ldr	w8, [x24, w0, sxtw #2]
	add	x25, x25, #1
	add	w8, w8, #1
	str	w8, [x24, w23, sxtw #2]
	cmp	w25, w22
	b.lt	.LBB1_3
.LBB1_4:                                // %label_4
	ldr	w9, [sp, #16]
	add	x10, sp, #16
	mov	x8, xzr
	add	x11, sp, #80
	str	w20, [sp, #144]
	add	w12, w20, w9
	orr	x9, x10, #0x4
	add	x10, sp, #144
	orr	x10, x10, #0x4
	str	w12, [sp, #80]
	.p2align	4, , 8
.LBB1_5:                                // %label_6
                                        // =>This Inner Loop Header: Depth=1
	add	w12, w8, #1
	cmp	w12, #16
	b.ge	.LBB1_7
// %bb.6:                               // %label_7
                                        //   in Loop: Header=BB1_5 Depth=1
	lsl	x12, x8, #2
	add	x13, x11, x12
	add	x8, x8, #1
	ldr	w14, [x9, x12]
	ldr	w15, [x13]
	add	w14, w15, w14
	str	w15, [x10, x12]
	str	w14, [x13, #4]
	b	.LBB1_5
.LBB1_7:                                // %label_8.preheader
	mov	w24, wzr
	add	x25, sp, #144
	add	x26, sp, #80
	b	.LBB1_9
	.p2align	4, , 8
.LBB1_8:                                // %label_11
                                        //   in Loop: Header=BB1_9 Depth=1
	add	w24, w24, #1
.LBB1_9:                                // %label_8
                                        // =>This Loop Header: Depth=1
                                        //     Child Loop BB1_12 Depth 2
                                        //       Child Loop BB1_13 Depth 3
	cmp	w24, #16
	b.ge	.LBB1_15
// %bb.10:                              // %label_22
                                        //   in Loop: Header=BB1_9 Depth=1
	sbfiz	x27, x24, #2, #32
	ldr	w28, [x26, x27]
	ldr	w8, [x25, x27]
	cmp	w8, w28
	b.lt	.LBB1_12
	b	.LBB1_8
	.p2align	4, , 8
.LBB1_11:                               // %label_14
                                        //   in Loop: Header=BB1_12 Depth=2
	ldrsw	x8, [x25, w24, sxtw #2]
	add	w9, w8, #1
	str	w22, [x19, x8, lsl #2]
	str	w9, [x25, w24, sxtw #2]
	ldr	w9, [x25, x27]
	cmp	w9, w28
	b.ge	.LBB1_8
.LBB1_12:                               // %label_10
                                        //   Parent Loop BB1_9 Depth=1
                                        // =>  This Loop Header: Depth=2
                                        //       Child Loop BB1_13 Depth 3
	ldrsw	x8, [x25, w24, sxtw #2]
	ldr	w22, [x19, x8, lsl #2]
	.p2align	4, , 8
.LBB1_13:                               // %label_13
                                        //   Parent Loop BB1_9 Depth=1
                                        //     Parent Loop BB1_12 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	mov	w0, w22
	mov	w1, w21
	bl	getNumPos
	cmp	w0, w24
	b.eq	.LBB1_11
// %bb.14:                              // %label_15
                                        //   in Loop: Header=BB1_13 Depth=3
	mov	w0, w22
	mov	w1, w21
	bl	getNumPos
	ldrsw	x8, [x25, w0, sxtw #2]
	mov	w0, w22
	mov	w1, w21
	ldr	w29, [x19, x8, lsl #2]
	bl	getNumPos
	ldrsw	x8, [x25, w0, sxtw #2]
	mov	w0, w22
	mov	w1, w21
	str	w22, [x19, x8, lsl #2]
	bl	getNumPos
	mov	w23, w0
	mov	w0, w22
	mov	w1, w21
	bl	getNumPos
	ldr	w8, [x25, w0, sxtw #2]
	mov	w22, w29
	add	w8, w8, #1
	str	w8, [x25, w23, sxtw #2]
	b	.LBB1_13
.LBB1_15:                               // %label_9
	ldr	w8, [sp, #16]
	mov	x22, xzr
	sub	w21, w21, #1
	add	x23, sp, #80
	add	x24, sp, #144
	add	x25, sp, #16
	str	w20, [sp, #144]
	add	w8, w20, w8
	str	w8, [sp, #80]
	b	.LBB1_17
	.p2align	4, , 8
.LBB1_16:                               // %label_19
                                        //   in Loop: Header=BB1_17 Depth=1
	ldr	w2, [x24, x8]
	mov	w0, w21
	ldr	w3, [x23, x8]
	mov	x1, x19
	bl	radixSort
	add	x22, x22, #1
.LBB1_17:                               // %label_16
                                        // =>This Inner Loop Header: Depth=1
	cmp	w22, #15
	b.gt	.LBB1_20
// %bb.18:                              // %label_17
                                        //   in Loop: Header=BB1_17 Depth=1
	lsl	x8, x22, #2
	cmp	w22, #1
	b.lt	.LBB1_16
// %bb.19:                              // %label_18
                                        //   in Loop: Header=BB1_17 Depth=1
	add	x9, x23, x8
	ldr	w11, [x25, x8]
	ldur	w10, [x9, #-4]
	add	w11, w10, w11
	str	w10, [x24, x8]
	str	w11, [x9]
	b	.LBB1_16
.LBB1_20:                               // %label_26
	ldp	x20, x19, [sp, #288]            // 16-byte Folded Reload
	ldp	x22, x21, [sp, #272]            // 16-byte Folded Reload
	ldp	x24, x23, [sp, #256]            // 16-byte Folded Reload
	ldp	x26, x25, [sp, #240]            // 16-byte Folded Reload
	ldp	x28, x27, [sp, #224]            // 16-byte Folded Reload
	ldp	x29, x30, [sp, #208]            // 16-byte Folded Reload
	add	sp, sp, #304
	ret
.Lfunc_end1:
	.size	radixSort, .Lfunc_end1-radixSort
	.cfi_endproc
                                        // -- End function
	.globl	main                            // -- Begin function main
	.p2align	4
	.type	main,@function
main:                                   // @main
	.cfi_startproc
// %bb.0:                               // %label_0
	stp	x30, x21, [sp, #-32]!           // 16-byte Folded Spill
	stp	x20, x19, [sp, #16]             // 16-byte Folded Spill
	.cfi_def_cfa_offset 32
	.cfi_offset w19, -8
	.cfi_offset w20, -16
	.cfi_offset w21, -24
	.cfi_offset w30, -32
	adrp	x19, :got:a
	ldr	x19, [x19, :got_lo12:a]
	mov	x0, x19
	bl	getarray
	mov	w20, w0
	mov	w0, #90                         // =0x5a
	bl	_sysy_starttime
	mov	w0, #8                          // =0x8
	mov	x1, x19
	mov	w2, wzr
	mov	w3, w20
	bl	radixSort
	adrp	x21, :got:ans
	mov	x8, xzr
	ldr	x21, [x21, :got_lo12:ans]
	.p2align	4, , 8
.LBB2_1:                                // %label_1
                                        // =>This Inner Loop Header: Depth=1
	ldr	w9, [x21]
	cmp	w8, w20
	b.ge	.LBB2_3
// %bb.2:                               // %label_3
                                        //   in Loop: Header=BB2_1 Depth=1
	ldr	w10, [x19, x8, lsl #2]
	add	w11, w8, #2
	sdiv	w12, w10, w11
	msub	w10, w12, w11, w10
	madd	w9, w8, w10, w9
	add	x8, x8, #1
	str	w9, [x21]
	b	.LBB2_1
.LBB2_3:                                // %label_2
	tbz	w9, #31, .LBB2_5
// %bb.4:                               // %label_4
	ldr	w8, [x21]
	neg	w8, w8
	str	w8, [x21]
.LBB2_5:                                // %label_5
	mov	w0, #102                        // =0x66
	bl	_sysy_stoptime
	ldr	w0, [x21]
	bl	putint
	mov	w0, #10                         // =0xa
	bl	putch
	ldp	x20, x19, [sp, #16]             // 16-byte Folded Reload
	mov	w0, wzr
	ldp	x30, x21, [sp], #32             // 16-byte Folded Reload
	ret
.Lfunc_end2:
	.size	main, .Lfunc_end2-main
	.cfi_endproc
                                        // -- End function
	.type	a,@object                       // @a
	.bss
	.globl	a
	.p2align	4, 0x0
a:
	.zero	120000040
	.size	a, 120000040

	.type	ans,@object                     // @ans
	.globl	ans
	.p2align	2, 0x0
ans:
	.word	0                               // 0x0
	.size	ans, 4

	.section	".note.GNU-stack","",@progbits
