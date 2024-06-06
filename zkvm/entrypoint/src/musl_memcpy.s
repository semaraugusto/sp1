	.text
	.attribute	4, 16
	.attribute	5, "rv64im"
	.file	"musl_memcpy.c"
	.globl	memcpy                          # -- Begin function memcpy
	.p2align	2
	.type	memcpy,@function
memcpy:                                 # @memcpy
# %bb.0:
	andi	a3, a1, 3
	seqz	a3, a3
	seqz	a4, a2
	or	a3, a3, a4
	bnez	a3, .LBBmemcpy0_11
# %bb.1:
	addi	a5, a1, 1
	mv	a6, a0
.LBBmemcpy0_2:                                # =>This Inner Loop Header: Depth=1
	lbu	a7, 0(a1)
	addi	a4, a1, 1
	addi	a3, a6, 1
	sb	a7, 0(a6)
	addi	a2, a2, -1
	andi	a1, a5, 3
	snez	a1, a1
	snez	a6, a2
	and	a7, a1, a6
	addi	a5, a5, 1
	mv	a1, a4
	mv	a6, a3
	bnez	a7, .LBBmemcpy0_2
# %bb.3:
	andi	a1, a3, 3
	beqz	a1, .LBBmemcpy0_12
.LBBmemcpy0_4:
	li	a5, 32
	bltu	a2, a5, .LBBmemcpy0_22
# %bb.5:
	li	a5, 3
	beq	a1, a5, .LBBmemcpy0_19
# %bb.6:
	li	a5, 2
	beq	a1, a5, .LBBmemcpy0_31
# %bb.7:
	li	a5, 1
	bne	a1, a5, .LBBmemcpy0_22
# %bb.8:
	lw	a5, 0(a4)
	sb	a5, 0(a3)
	srli	a1, a5, 8
	sb	a1, 1(a3)
	srli	a1, a5, 16
	sb	a1, 2(a3)
	addi	a3, a3, 3
	addi	a2, a2, -3
	addi	a4, a4, 16
	li	a1, 16
.LBBmemcpy0_9:                                # =>This Inner Loop Header: Depth=1
	lw	a6, -12(a4)
	srliw	a5, a5, 24
	slli	a7, a6, 8
	lw	t0, -8(a4)
	or	a5, a7, a5
	sw	a5, 0(a3)
	srliw	a5, a6, 24
	slli	a6, t0, 8
	lw	a7, -4(a4)
	or	a5, a6, a5
	sw	a5, 4(a3)
	srliw	a6, t0, 24
	slli	t0, a7, 8
	lw	a5, 0(a4)
	or	a6, t0, a6
	sw	a6, 8(a3)
	srliw	a6, a7, 24
	slli	a7, a5, 8
	or	a6, a7, a6
	sw	a6, 12(a3)
	addi	a3, a3, 16
	addi	a2, a2, -16
	addi	a4, a4, 16
	bltu	a1, a2, .LBBmemcpy0_9
# %bb.10:
	addi	a4, a4, -13
	andi	a1, a2, 16
	beqz	a1, .LBBmemcpy0_23
	j	.LBBmemcpy0_34
.LBBmemcpy0_11:
	mv	a3, a0
	mv	a4, a1
	andi	a1, a0, 3
	bnez	a1, .LBBmemcpy0_4
.LBBmemcpy0_12:
	li	a1, 16
	bltu	a2, a1, .LBBmemcpy0_15
# %bb.13:
	li	a1, 15
.LBBmemcpy0_14:                               # =>This Inner Loop Header: Depth=1
	lw	a5, 0(a4)
	lw	a6, 4(a4)
	lw	a7, 8(a4)
	lw	t0, 12(a4)
	sw	a5, 0(a3)
	sw	a6, 4(a3)
	sw	a7, 8(a3)
	sw	t0, 12(a3)
	addi	a4, a4, 16
	addi	a2, a2, -16
	addi	a3, a3, 16
	bltu	a1, a2, .LBBmemcpy0_14
.LBBmemcpy0_15:
	li	a1, 8
	bltu	a2, a1, .LBBmemcpy0_17
# %bb.16:
	lw	a1, 0(a4)
	lw	a5, 4(a4)
	sw	a1, 0(a3)
	sw	a5, 4(a3)
	addi	a3, a3, 8
	addi	a4, a4, 8
.LBBmemcpy0_17:
	andi	a1, a2, 4
	beqz	a1, .LBBmemcpy0_26
# %bb.18:
	lw	a1, 0(a4)
	sw	a1, 0(a3)
	addi	a3, a3, 4
	addi	a4, a4, 4
	j	.LBBmemcpy0_26
.LBBmemcpy0_19:
	lw	a5, 0(a4)
	sb	a5, 0(a3)
	addi	a3, a3, 1
	addi	a2, a2, -1
	addi	a4, a4, 16
	li	a1, 18
.LBBmemcpy0_20:                               # =>This Inner Loop Header: Depth=1
	lw	a6, -12(a4)
	srliw	a5, a5, 8
	slli	a7, a6, 24
	lw	t0, -8(a4)
	or	a5, a7, a5
	sw	a5, 0(a3)
	srliw	a5, a6, 8
	slli	a6, t0, 24
	lw	a7, -4(a4)
	or	a5, a6, a5
	sw	a5, 4(a3)
	srliw	a6, t0, 8
	slli	t0, a7, 24
	lw	a5, 0(a4)
	or	a6, t0, a6
	sw	a6, 8(a3)
	srliw	a6, a7, 8
	slli	a7, a5, 24
	or	a6, a7, a6
	sw	a6, 12(a3)
	addi	a3, a3, 16
	addi	a2, a2, -16
	addi	a4, a4, 16
	bltu	a1, a2, .LBBmemcpy0_20
# %bb.21:
	addi	a4, a4, -15
.LBBmemcpy0_22:
	andi	a1, a2, 16
	bnez	a1, .LBBmemcpy0_34
.LBBmemcpy0_23:
	andi	a1, a2, 8
	bnez	a1, .LBBmemcpy0_35
.LBBmemcpy0_24:
	andi	a1, a2, 4
	beqz	a1, .LBBmemcpy0_26
.LBBmemcpy0_25:
	lbu	a1, 0(a4)
	lbu	a5, 1(a4)
	lbu	a6, 2(a4)
	sb	a1, 0(a3)
	sb	a5, 1(a3)
	lbu	a1, 3(a4)
	sb	a6, 2(a3)
	addi	a4, a4, 4
	addi	a5, a3, 4
	sb	a1, 3(a3)
	mv	a3, a5
.LBBmemcpy0_26:
	andi	a1, a2, 2
	bnez	a1, .LBBmemcpy0_29
# %bb.27:
	andi	a2, a2, 1
	bnez	a2, .LBBmemcpy0_30
.LBBmemcpy0_28:
	ret
.LBBmemcpy0_29:
	lbu	a1, 0(a4)
	lbu	a5, 1(a4)
	sb	a1, 0(a3)
	addi	a4, a4, 2
	addi	a1, a3, 2
	sb	a5, 1(a3)
	mv	a3, a1
	andi	a2, a2, 1
	beqz	a2, .LBBmemcpy0_28
.LBBmemcpy0_30:
	lbu	a1, 0(a4)
	sb	a1, 0(a3)
	ret
.LBBmemcpy0_31:
	lw	a5, 0(a4)
	sb	a5, 0(a3)
	srli	a1, a5, 8
	sb	a1, 1(a3)
	addi	a3, a3, 2
	addi	a2, a2, -2
	addi	a4, a4, 16
	li	a1, 17
.LBBmemcpy0_32:                               # =>This Inner Loop Header: Depth=1
	lw	a6, -12(a4)
	srliw	a5, a5, 16
	slli	a7, a6, 16
	lw	t0, -8(a4)
	or	a5, a7, a5
	sw	a5, 0(a3)
	srliw	a5, a6, 16
	slli	a6, t0, 16
	lw	a7, -4(a4)
	or	a5, a6, a5
	sw	a5, 4(a3)
	srliw	a6, t0, 16
	slli	t0, a7, 16
	lw	a5, 0(a4)
	or	a6, t0, a6
	sw	a6, 8(a3)
	srliw	a6, a7, 16
	slli	a7, a5, 16
	or	a6, a7, a6
	sw	a6, 12(a3)
	addi	a3, a3, 16
	addi	a2, a2, -16
	addi	a4, a4, 16
	bltu	a1, a2, .LBBmemcpy0_32
# %bb.33:
	addi	a4, a4, -14
	andi	a1, a2, 16
	beqz	a1, .LBBmemcpy0_23
.LBBmemcpy0_34:
	lbu	a1, 0(a4)
	lbu	a5, 1(a4)
	lbu	a6, 2(a4)
	sb	a1, 0(a3)
	sb	a5, 1(a3)
	lbu	a1, 3(a4)
	sb	a6, 2(a3)
	lbu	a5, 4(a4)
	lbu	a6, 5(a4)
	sb	a1, 3(a3)
	lbu	a1, 6(a4)
	sb	a5, 4(a3)
	sb	a6, 5(a3)
	lbu	a5, 7(a4)
	sb	a1, 6(a3)
	lbu	a1, 8(a4)
	lbu	a6, 9(a4)
	sb	a5, 7(a3)
	lbu	a5, 10(a4)
	sb	a1, 8(a3)
	sb	a6, 9(a3)
	lbu	a1, 11(a4)
	sb	a5, 10(a3)
	lbu	a5, 12(a4)
	lbu	a6, 13(a4)
	sb	a1, 11(a3)
	lbu	a1, 14(a4)
	sb	a5, 12(a3)
	sb	a6, 13(a3)
	lbu	a5, 15(a4)
	sb	a1, 14(a3)
	addi	a4, a4, 16
	addi	a1, a3, 16
	sb	a5, 15(a3)
	mv	a3, a1
	andi	a1, a2, 8
	beqz	a1, .LBBmemcpy0_24
.LBBmemcpy0_35:
	lbu	a1, 0(a4)
	lbu	a5, 1(a4)
	lbu	a6, 2(a4)
	sb	a1, 0(a3)
	sb	a5, 1(a3)
	lbu	a1, 3(a4)
	sb	a6, 2(a3)
	lbu	a5, 4(a4)
	lbu	a6, 5(a4)
	sb	a1, 3(a3)
	lbu	a1, 6(a4)
	sb	a5, 4(a3)
	sb	a6, 5(a3)
	lbu	a5, 7(a4)
	sb	a1, 6(a3)
	addi	a4, a4, 8
	addi	a1, a3, 8
	sb	a5, 7(a3)
	mv	a3, a1
	andi	a1, a2, 4
	bnez	a1, .LBBmemcpy0_25
	j	.LBBmemcpy0_26
.Lfuncmemcpy_end0:
	.size	memcpy, .Lfuncmemcpy_end0-memcpy
                                        # -- End function
	.ident	"clang version 17.0.6"
	.section	".note.GNU-stack","",@progbits
	.addrsig
