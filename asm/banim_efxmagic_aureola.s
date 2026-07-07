	.include "macro.inc"

	.syntax unified

	thumb_func_start EfxApocalypseOBJ3RND_Loop
EfxApocalypseOBJ3RND_Loop: @ 0x080536C4
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r6, r0, #0
	ldr r5, [r6, #0x60]
	movs r0, #0x2c
	ldrsh r3, [r6, r0]
	movs r1, #0x2e
	ldrsh r0, [r6, r1]
	str r0, [sp]
	movs r0, #1
	movs r1, #0x6e
	movs r2, #0
	bl Interpolate
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	ldr r1, [r6, #0x44]
	ldr r2, [r6, #0x48]
	movs r7, #0x2c
	ldrsh r3, [r6, r7]
	movs r7, #0x2e
	ldrsh r0, [r6, r7]
	str r0, [sp]
	movs r0, #1
	bl Interpolate
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x18
	ldr r2, .L0805375C @ =gSinLut
	lsls r1, r0, #1
	adds r1, r1, r2
	adds r0, #0x40
	lsls r0, r0, #1
	adds r0, r0, r2
	movs r2, #0
	ldrsh r1, [r1, r2]
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	muls r1, r4, r1
	lsls r1, r1, #4
	movs r7, #0
	ldrsh r0, [r0, r7]
	muls r0, r4, r0
	lsls r0, r0, #4
	asrs r1, r1, #0x10
	ldrh r2, [r6, #0x32]
	adds r1, r2, r1
	asrs r0, r0, #0x10
	ldrh r7, [r6, #0x3a]
	adds r0, r7, r0
	strh r1, [r5, #2]
	strh r0, [r5, #4]
	ldrh r0, [r6, #0x2c]
	adds r0, #1
	strh r0, [r6, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r6, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	ble .L08053752
	ldr r0, [r6, #0x60]
	bl BasRemove
	ldr r1, .L08053760 @ =gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r6, #0
	bl Proc_Break
.L08053752:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0805375C: .4byte gSinLut
.L08053760: .4byte gEfxBgSemaphore
