	.text
	.attribute	4, 16
	.attribute	5, "rv64im"
	.file	"musl_memset.c"
	.globl	memset                          # -- Begin function memset
	.p2align	2
	.type	memset,@function
memset:                                 # @memset
# %bb.0:
	beqz	a2, .LBB0_9memset
# %bb.1:
	sb	a1, 0(a0)
	add	a3, a2, a0
	li	a4, 3
	sb	a1, -1(a3)
	bltu	a2, a4, .LBB0_9memset
# %bb.2:
	sb	a1, 1(a0)
	sb	a1, 2(a0)
	sb	a1, -2(a3)
	li	a4, 7
	sb	a1, -3(a3)
	bltu	a2, a4, .LBB0_9memset
# %bb.3:
	sb	a1, 3(a0)
	li	a5, 9
	sb	a1, -4(a3)
	bltu	a2, a5, .LBB0_9memset
# %bb.4:
	negw	a3, a0
	andi	a4, a3, 3
	add	a3, a0, a4
	sub	a2, a2, a4
	andi	a2, a2, -4
	slli	a1, a1, 56
	lui	a4, 65793
	slli	a4, a4, 4
	addi	a4, a4, 256
	mulhu	a1, a1, a4
	sw	a1, 0(a3)
	add	a4, a3, a2
	sw	a1, -4(a4)
	bltu	a2, a5, .LBB0_9memset
# %bb.5:
	sw	a1, 4(a3)
	sw	a1, 8(a3)
	sw	a1, -12(a4)
	li	a5, 25
	sw	a1, -8(a4)
	bltu	a2, a5, .LBB0_9memset
# %bb.6:
	sw	a1, 12(a3)
	sw	a1, 16(a3)
	sw	a1, 20(a3)
	sw	a1, 24(a3)
	sw	a1, -28(a4)
	sw	a1, -24(a4)
	sw	a1, -20(a4)
	andi	a5, a3, 4
	addi	a5, a5, 24
	sub	a2, a2, a5
	li	a6, 32
	sw	a1, -16(a4)
	bltu	a2, a6, .LBB0_9memset
# %bb.7:
	slli	a1, a1, 32
	srli	a4, a1, 32
	or	a1, a1, a4
	add	a3, a3, a5
	li	a4, 31
.LBB0_8memset:                                # =>This Inner Loop Header: Depth=1
	sd	a1, 0(a3)
	sd	a1, 8(a3)
	sd	a1, 16(a3)
	sd	a1, 24(a3)
	addi	a2, a2, -32
	addi	a3, a3, 32
	bltu	a4, a2, .LBB0_8memset
.LBB0_9memset:
	ret
.Lfunc_end0memset:
	.size	memset, .Lfunc_end0memset-memset
                                        # -- End function
	.ident	"clang version 17.0.6"
	.section	".note.GNU-stack","",@progbits
	.addrsig
