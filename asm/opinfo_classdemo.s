	.include "macro.inc"

	.syntax unified

	thumb_func_start ClassDemoStatus_Loop
ClassDemoStatus_Loop: @ 0x08095BCC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x20
	str r0, [sp, #0x10]
	ldr r1, .L08095D1C @ =gUnk_0835C829
	add r0, sp, #4
	movs r2, #0xc
	bl memcpy
	movs r0, #0
	mov sb, r0
	ldr r1, [sp, #0x10]
	adds r1, #0x42
	str r1, [sp, #0x18]
	ldr r2, [sp, #0x10]
	adds r2, #0x43
	str r2, [sp, #0x1c]
	ldr r3, [sp, #0x10]
	adds r3, #0x34
	str r3, [sp, #0x14]
.L08095BFA:
	ldr r1, [sp, #0x10]
	ldr r0, [r1, #0x30]
	adds r0, #0x38
	add r0, sb
	ldrb r0, [r0]
	mov r8, r0
	movs r7, #0
	lsrs r0, r0, #2
	movs r2, #1
	add r2, sb
	mov sl, r2
	cmp r7, r0
	bge .L08095C3E
	adds r6, r0, #0
	movs r4, #0x30
	mov r3, sb
	lsls r5, r3, #4
	adds r7, r6, #0
.L08095C1E:
	ldr r0, .L08095D20 @ =Sprites_OpInfo_0869006C
	ldr r3, [r0, #0xc]
	movs r0, #0xa0
	lsls r0, r0, #7
	str r0, [sp]
	movs r0, #0xd
	adds r1, r4, #0
	adds r2, r5, #0
	adds r2, #0x10
	bl PutSpriteExt
	adds r4, #8
	subs r7, #1
	cmp r7, #0
	bne .L08095C1E
	adds r7, r6, #0
.L08095C3E:
	movs r0, #3
	mov r1, r8
	ands r0, r1
	cmp r0, #0
	beq .L08095C68
	lsls r1, r7, #3
	adds r1, #0x30
	mov r3, sb
	lsls r2, r3, #4
	adds r2, #0x10
	subs r0, #1
	lsls r0, r0, #2
	ldr r3, .L08095D20 @ =Sprites_OpInfo_0869006C
	adds r0, r0, r3
	ldr r3, [r0]
	movs r0, #0xa0
	lsls r0, r0, #7
	str r0, [sp]
	movs r0, #0xd
	bl PutSpriteExt
.L08095C68:
	mov sb, sl
	mov r0, sb
	cmp r0, #5
	ble .L08095BFA
	movs r0, #0x78
	ldr r1, [sp, #0x18]
	ldrb r1, [r1]
	subs r0, r0, r1
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	ldr r2, [sp, #0x1c]
	ldrb r2, [r2]
	adds r7, r2, r0
	movs r3, #0
	mov sb, r3
	ldr r1, [sp, #0x14]
	ldrb r0, [r1]
	cmp r0, #0xff
	beq .L08095D00
	ldr r5, .L08095D24 @ =gClassDisplayFont1
	adds r4, r1, #0
.L08095C94:
	ldrb r2, [r4]
	lsls r0, r2, #3
	adds r0, r0, r5
	movs r1, #5
	ldrsb r1, [r0, r1]
	subs r1, r7, r1
	movs r3, #7
	ldrsb r3, [r0, r3]
	movs r2, #8
	subs r2, r2, r3
	ldr r3, [r0]
	movs r0, #0xa0
	lsls r0, r0, #7
	str r0, [sp]
	movs r0, #4
	bl PutSpriteExt
	ldrb r3, [r4]
	lsls r0, r3, #3
	adds r0, r0, r5
	movs r1, #5
	ldrsb r1, [r0, r1]
	subs r1, r7, r1
	subs r1, #2
	movs r3, #7
	ldrsb r3, [r0, r3]
	movs r2, #6
	subs r2, r2, r3
	ldr r3, [r0]
	movs r0, #0x80
	lsls r0, r0, #7
	str r0, [sp]
	movs r0, #4
	bl PutSpriteExt
	ldrb r1, [r4]
	lsls r0, r1, #3
	adds r0, r0, r5
	movs r1, #6
	ldrsb r1, [r0, r1]
	ldrb r0, [r0, #5]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r1, r1, r0
	adds r7, r7, r1
	adds r4, #1
	movs r2, #1
	add sb, r2
	mov r3, sb
	cmp r3, #0xd
	bgt .L08095D00
	ldrb r0, [r4]
	cmp r0, #0xff
	bne .L08095C94
.L08095D00:
	ldr r1, [sp, #0x10]
	ldrh r0, [r1, #0x2a]
	cmp r0, #0xfe
	bhi .L08095D0C
	adds r0, #1
	strh r0, [r1, #0x2a]
.L08095D0C:
	add sp, #0x20
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08095D1C: .4byte gUnk_0835C829
.L08095D20: .4byte Sprites_OpInfo_0869006C
.L08095D24: .4byte gClassDisplayFont1

	thumb_func_start func_fe6_08095D28
func_fe6_08095D28: @ 0x08095D28
	bx lr
	.align 2, 0

	thumb_func_start StartClassDemoStatus
StartClassDemoStatus: @ 0x08095D2C
	push {lr}
	adds r1, r0, #0
	ldr r0, .L08095D3C @ =ProcScr_ClassDemoStatus
	bl SpawnProc
	pop {r1}
	bx r1
	.align 2, 0
.L08095D3C: .4byte ProcScr_ClassDemoStatus

	thumb_func_start SetOpClassDemoStatusPos
SetOpClassDemoStatusPos: @ 0x08095D40
	adds r0, #0x43
	strb r1, [r0]
	bx lr
	.align 2, 0

	thumb_func_start func_fe6_08095D48
func_fe6_08095D48: @ 0x08095D48
	ldr r0, .L08095D54 @ =unk_opinfo_0200FF54
	movs r1, #0x80
	strb r1, [r0]
	movs r1, #2
	strb r1, [r0, #1]
	bx lr
	.align 2, 0
.L08095D54: .4byte unk_opinfo_0200FF54

	thumb_func_start func_fe6_08095D58
func_fe6_08095D58: @ 0x08095D58
	bx lr
	.align 2, 0
