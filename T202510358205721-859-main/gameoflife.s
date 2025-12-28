	.text
	.file	"gameoflife.ll"
	.globl	read_map                        // -- Begin function read_map
	.p2align	4
	.type	read_map,@function
read_map:                               // @read_map
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
	bl	getint
	adrp	x20, :got:width
	ldr	x20, [x20, :got_lo12:width]
	str	w0, [x20]
	bl	getint
	adrp	x21, :got:height
	ldr	x21, [x21, :got_lo12:height]
	str	w0, [x21]
	bl	getint
	adrp	x8, :got:steps
	ldr	x8, [x8, :got_lo12:steps]
	str	w0, [x8]
	bl	getch
	adrp	x19, :got:sheet1
	mov	w22, #1                         // =0x1
	mov	w23, #2000                      // =0x7d0
	ldr	x19, [x19, :got_lo12:sheet1]
	ldr	w20, [x20]
	ldr	w21, [x21]
	b	.LBB0_2
	.p2align	4, , 8
.LBB0_1:                                // %label_4
                                        //   in Loop: Header=BB0_2 Depth=1
	add	w22, w22, #1
.LBB0_2:                                // %label_1
                                        // =>This Loop Header: Depth=1
                                        //     Child Loop BB0_4 Depth 2
	cmp	w22, w21
	b.gt	.LBB0_6
// %bb.3:                               // %label_9
                                        //   in Loop: Header=BB0_2 Depth=1
	smaddl	x24, w22, w23, x19
	mov	w25, #1                         // =0x1
	.p2align	4, , 8
.LBB0_4:                                // %label_3
                                        //   Parent Loop BB0_2 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	bl	getch
	cmp	w25, w20
	b.gt	.LBB0_1
// %bb.5:                               // %label_5
                                        //   in Loop: Header=BB0_4 Depth=2
	cmp	w0, #35
	cset	w8, eq
	str	w8, [x24, w25, sxtw #2]
	add	w25, w25, #1
	b	.LBB0_4
.LBB0_6:                                // %label_2
	ldp	x20, x19, [sp, #48]             // 16-byte Folded Reload
	ldp	x22, x21, [sp, #32]             // 16-byte Folded Reload
	ldp	x24, x23, [sp, #16]             // 16-byte Folded Reload
	ldp	x30, x25, [sp], #64             // 16-byte Folded Reload
	ret
.Lfunc_end0:
	.size	read_map, .Lfunc_end0-read_map
	.cfi_endproc
                                        // -- End function
	.globl	put_map                         // -- Begin function put_map
	.p2align	4
	.type	put_map,@function
put_map:                                // @put_map
	.cfi_startproc
// %bb.0:                               // %label_0
	stp	x30, x27, [sp, #-80]!           // 16-byte Folded Spill
	stp	x26, x25, [sp, #16]             // 16-byte Folded Spill
	stp	x24, x23, [sp, #32]             // 16-byte Folded Spill
	stp	x22, x21, [sp, #48]             // 16-byte Folded Spill
	stp	x20, x19, [sp, #64]             // 16-byte Folded Spill
	.cfi_def_cfa_offset 80
	.cfi_offset w19, -8
	.cfi_offset w20, -16
	.cfi_offset w21, -24
	.cfi_offset w22, -32
	.cfi_offset w23, -40
	.cfi_offset w24, -48
	.cfi_offset w25, -56
	.cfi_offset w26, -64
	.cfi_offset w27, -72
	.cfi_offset w30, -80
	adrp	x8, :got:width
	adrp	x9, :got:height
	adrp	x19, :got:sheet1
	mov	w22, #1                         // =0x1
	mov	w23, #2000                      // =0x7d0
	mov	w24, #46                        // =0x2e
	ldr	x8, [x8, :got_lo12:width]
	mov	w25, #35                        // =0x23
	ldr	x9, [x9, :got_lo12:height]
	ldr	x19, [x19, :got_lo12:sheet1]
	ldr	w20, [x8]
	ldr	w21, [x9]
	b	.LBB1_2
	.p2align	4, , 8
.LBB1_1:                                // %label_4
                                        //   in Loop: Header=BB1_2 Depth=1
	mov	w0, #10                         // =0xa
	bl	putch
	add	w22, w22, #1
.LBB1_2:                                // %label_1
                                        // =>This Loop Header: Depth=1
                                        //     Child Loop BB1_4 Depth 2
	cmp	w22, w21
	b.gt	.LBB1_5
// %bb.3:                               // %label_9
                                        //   in Loop: Header=BB1_2 Depth=1
	smaddl	x26, w22, w23, x19
	mov	w27, #1                         // =0x1
	cmp	w27, w20
	b.gt	.LBB1_1
	.p2align	4, , 8
.LBB1_4:                                // %label_5
                                        //   Parent Loop BB1_2 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	ldr	w8, [x26, w27, sxtw #2]
	cmp	w8, #1
	csel	w0, w25, w24, eq
	bl	putch
	add	w27, w27, #1
	cmp	w27, w20
	b.le	.LBB1_4
	b	.LBB1_1
.LBB1_5:                                // %label_2
	ldp	x20, x19, [sp, #64]             // 16-byte Folded Reload
	ldp	x22, x21, [sp, #48]             // 16-byte Folded Reload
	ldp	x24, x23, [sp, #32]             // 16-byte Folded Reload
	ldp	x26, x25, [sp, #16]             // 16-byte Folded Reload
	ldp	x30, x27, [sp], #80             // 16-byte Folded Reload
	ret
.Lfunc_end1:
	.size	put_map, .Lfunc_end1-put_map
	.cfi_endproc
                                        // -- End function
	.globl	swap12                          // -- Begin function swap12
	.p2align	4
	.type	swap12,@function
swap12:                                 // @swap12
	.cfi_startproc
// %bb.0:                               // %label_0
	adrp	x10, :got:width
	adrp	x11, :got:height
	adrp	x8, :got:sheet1
	adrp	x9, :got:sheet2
	mov	w12, #1                         // =0x1
	mov	w13, #2000                      // =0x7d0
	ldr	x10, [x10, :got_lo12:width]
	ldr	x11, [x11, :got_lo12:height]
	ldr	x8, [x8, :got_lo12:sheet1]
	ldr	x9, [x9, :got_lo12:sheet2]
	ldr	w10, [x10]
	ldr	w11, [x11]
	b	.LBB2_2
	.p2align	4, , 8
.LBB2_1:                                // %label_4
                                        //   in Loop: Header=BB2_2 Depth=1
	add	w12, w12, #1
.LBB2_2:                                // %label_1
                                        // =>This Loop Header: Depth=1
                                        //     Child Loop BB2_4 Depth 2
	cmp	w12, w11
	b.gt	.LBB2_5
// %bb.3:                               // %label_6
                                        //   in Loop: Header=BB2_2 Depth=1
	smaddl	x14, w12, w13, x8
	mov	w16, #1                         // =0x1
	smaddl	x15, w12, w13, x9
	cmp	w16, w10
	b.gt	.LBB2_1
	.p2align	4, , 8
.LBB2_4:                                // %label_5
                                        //   Parent Loop BB2_2 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	sbfiz	x17, x16, #2, #32
	add	w16, w16, #1
	ldr	w18, [x15, x17]
	str	w18, [x14, x17]
	cmp	w16, w10
	b.le	.LBB2_4
	b	.LBB2_1
.LBB2_5:                                // %label_2
	ret
.Lfunc_end2:
	.size	swap12, .Lfunc_end2-swap12
	.cfi_endproc
                                        // -- End function
	.globl	step                            // -- Begin function step
	.p2align	4
	.type	step,@function
step:                                   // @step
	.cfi_startproc
// %bb.0:                               // %label_0
	str	x19, [sp, #-16]!                // 8-byte Folded Spill
	.cfi_def_cfa_offset 16
	.cfi_offset w19, -16
	adrp	x8, :got:width
	adrp	x9, :got:height
	mov	w10, #1                         // =0x1
	mov	w11, #2000                      // =0x7d0
	ldr	x8, [x8, :got_lo12:width]
	ldr	x9, [x9, :got_lo12:height]
	ldr	w8, [x8]
	ldr	w9, [x9]
	b	.LBB3_2
	.p2align	4, , 8
.LBB3_1:                                // %label_4
                                        //   in Loop: Header=BB3_2 Depth=1
	add	w10, w10, #1
.LBB3_2:                                // %label_1
                                        // =>This Loop Header: Depth=1
                                        //     Child Loop BB3_4 Depth 2
	cmp	w10, w9
	b.gt	.LBB3_5
// %bb.3:                               // %label_12
                                        //   in Loop: Header=BB3_2 Depth=1
	sub	w14, w10, #1
	add	w15, w10, #1
	smaddl	x12, w10, w11, x1
	mov	w16, #1                         // =0x1
	smaddl	x13, w10, w11, x0
	smaddl	x14, w14, w11, x0
	smaddl	x15, w15, w11, x0
	cmp	w16, w8
	b.gt	.LBB3_1
	.p2align	4, , 8
.LBB3_4:                                // %label_5
                                        //   Parent Loop BB3_2 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	sub	w17, w16, #1
	sbfiz	x18, x16, #2, #32
	add	w16, w16, #1
	sbfiz	x17, x17, #2, #32
	sbfiz	x2, x16, #2, #32
	ldr	w3, [x14, x18]
	ldr	w4, [x14, x17]
                                        // kill: def $w16 killed $w16 killed $x16 def $x16
	ldr	w5, [x14, x2]
	ldr	w6, [x13, x17]
	ldr	w7, [x13, x2]
	ldr	w17, [x15, x17]
	add	w3, w4, w3
	ldr	w19, [x15, x18]
	ldr	w2, [x15, x2]
	add	w4, w5, w6
	add	w3, w3, w4
	add	w17, w7, w17
	add	w17, w17, w19
	add	w17, w3, w17
	ldr	w3, [x13, x18]
	add	w17, w17, w2
	cmp	w17, #3
	sub	w17, w17, #2
	cset	w2, eq
	tst	w17, #0xfffffffe
	cset	w17, eq
	cmp	w3, #1
	csel	w17, w17, w2, eq
	str	w17, [x12, x18]
	cmp	w16, w8
	b.le	.LBB3_4
	b	.LBB3_1
.LBB3_5:                                // %label_2
	ldr	x19, [sp], #16                  // 8-byte Folded Reload
	ret
.Lfunc_end3:
	.size	step, .Lfunc_end3-step
	.cfi_endproc
                                        // -- End function
	.globl	main                            // -- Begin function main
	.p2align	4
	.type	main,@function
main:                                   // @main
	.cfi_startproc
// %bb.0:                               // %label_0
	str	x30, [sp, #-48]!                // 8-byte Folded Spill
	stp	x22, x21, [sp, #16]             // 16-byte Folded Spill
	stp	x20, x19, [sp, #32]             // 16-byte Folded Spill
	.cfi_def_cfa_offset 48
	.cfi_offset w19, -8
	.cfi_offset w20, -16
	.cfi_offset w21, -24
	.cfi_offset w22, -32
	.cfi_offset w30, -48
	bl	read_map
	mov	w0, #95                         // =0x5f
	bl	_sysy_starttime
	adrp	x22, :got:steps
	adrp	x21, :got:active
	ldr	x22, [x22, :got_lo12:steps]
	ldr	w8, [x22]
	ldr	x21, [x21, :got_lo12:active]
	cmp	w8, #0
	b.le	.LBB4_6
// %bb.1:                               // %label_10
	adrp	x19, :got:sheet1
	adrp	x20, :got:sheet2
	ldr	x19, [x19, :got_lo12:sheet1]
	ldr	x20, [x20, :got_lo12:sheet2]
	b	.LBB4_4
	.p2align	4, , 8
.LBB4_2:                                // %label_4
                                        //   in Loop: Header=BB4_4 Depth=1
	mov	x0, x19
	mov	x1, x20
	bl	step
	mov	w8, #2                          // =0x2
.LBB4_3:                                // %label_6
                                        //   in Loop: Header=BB4_4 Depth=1
	ldr	w9, [x22]
	str	w8, [x21]
	sub	w9, w9, #1
	cmp	w9, #0
	str	w9, [x22]
	b.le	.LBB4_6
.LBB4_4:                                // %label_1
                                        // =>This Inner Loop Header: Depth=1
	ldr	w8, [x21]
	cmp	w8, #1
	b.eq	.LBB4_2
// %bb.5:                               // %label_5
                                        //   in Loop: Header=BB4_4 Depth=1
	mov	x0, x20
	mov	x1, x19
	bl	step
	mov	w8, #1                          // =0x1
	b	.LBB4_3
.LBB4_6:                                // %label_2
	mov	w0, #106                        // =0x6a
	bl	_sysy_stoptime
	ldr	w8, [x21]
	cmp	w8, #2
	b.ne	.LBB4_8
// %bb.7:                               // %label_7
	bl	swap12
.LBB4_8:                                // %label_8
	bl	put_map
	ldp	x20, x19, [sp, #32]             // 16-byte Folded Reload
	mov	w0, wzr
	ldp	x22, x21, [sp, #16]             // 16-byte Folded Reload
	ldr	x30, [sp], #48                  // 8-byte Folded Reload
	ret
.Lfunc_end4:
	.size	main, .Lfunc_end4-main
	.cfi_endproc
                                        // -- End function
	.type	sheet1,@object                  // @sheet1
	.bss
	.globl	sheet1
	.p2align	4, 0x0
sheet1:
	.zero	1000000
	.size	sheet1, 1000000

	.type	sheet2,@object                  // @sheet2
	.globl	sheet2
	.p2align	4, 0x0
sheet2:
	.zero	1000000
	.size	sheet2, 1000000

	.type	active,@object                  // @active
	.data
	.globl	active
	.p2align	2, 0x0
active:
	.word	1                               // 0x1
	.size	active, 4

	.type	width,@object                   // @width
	.bss
	.globl	width
	.p2align	2, 0x0
width:
	.word	0                               // 0x0
	.size	width, 4

	.type	height,@object                  // @height
	.globl	height
	.p2align	2, 0x0
height:
	.word	0                               // 0x0
	.size	height, 4

	.type	steps,@object                   // @steps
	.globl	steps
	.p2align	2, 0x0
steps:
	.word	0                               // 0x0
	.size	steps, 4

	.section	".note.GNU-stack","",@progbits
