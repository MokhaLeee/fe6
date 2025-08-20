	.include "macro.inc"

	.syntax unified

	thumb_func_start func_fe6_0809480C
func_fe6_0809480C: @ 0x0809480C
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r3, .L08094854 @ =gPal
	ldr r2, .L08094858 @ =0x02000000
	movs r1, #0x80
	lsls r1, r1, #2
.L08094818:
	ldrh r0, [r3]
	strh r0, [r2]
	adds r3, #2
	adds r2, #2
	subs r1, #1
	cmp r1, #0
	bne .L08094818
	ldr r4, .L08094858 @ =0x02000000
	ldrh r5, [r5, #0x2a]
	lsrs r3, r5, #1
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0x20
	bl EfxPalBlackInOut
	ldr r2, .L08094854 @ =gPal
	movs r1, #0x80
	lsls r1, r1, #2
.L0809483C:
	ldrh r0, [r4]
	strh r0, [r2]
	adds r4, #2
	adds r2, #2
	subs r1, #1
	cmp r1, #0
	bne .L0809483C
	bl EnablePalSync
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08094854: .4byte gPal
.L08094858: .4byte 0x02000000

	thumb_func_start func_fe6_0809485C
func_fe6_0809485C: @ 0x0809485C
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, .L08094874 @ =ProcScr_ClassDemo_0868FEDC
	movs r1, #4
	bl SpawnProc
	strh r4, [r0, #0x2a]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08094874: .4byte ProcScr_ClassDemo_0868FEDC

	thumb_func_start func_fe6_08094878
func_fe6_08094878: @ 0x08094878
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	str r2, [sp, #8]
	str r3, [sp, #0xc]
	ldr r2, [sp, #0x30]
	ldr r3, [sp, #0x34]
	ldr r4, [sp, #0x38]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #4]
	lsls r1, r1, #0x18
	lsrs r7, r1, #0x18
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov sl, r2
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	mov r8, r3
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	movs r5, #1
	ldr r2, .L080948D4 @ =gPal
	movs r0, #0x80
	lsls r0, r0, #1
	ldr r1, .L080948D8 @ =0x0000021E
	adds r6, r2, r1
	adds r0, r4, r0
	lsls r1, r7, #5
	lsls r0, r0, #1
	adds r0, r0, r2
	adds r3, r0, #2
	ldr r0, .L080948DC @ =0x00000222
	adds r1, r1, r0
	adds r1, r1, r2
.L080948C4:
	adds r0, r5, r4
	cmp r0, #0xf
	ble .L080948E0
	ldrh r0, [r6]
	strh r0, [r1]
	adds r2, r7, #1
	mov sb, r2
	b .L080948E8
	.align 2, 0
.L080948D4: .4byte gPal
.L080948D8: .4byte 0x0000021E
.L080948DC: .4byte 0x00000222
.L080948E0:
	ldrh r0, [r3]
	strh r0, [r1]
	adds r0, r7, #1
	mov sb, r0
.L080948E8:
	adds r1, #2
	adds r3, #2
	adds r5, #1
	cmp r5, #0xf
	ble .L080948C4
	bl EnablePalSync
	mov r1, sl
	cmp r1, #7
	bhi .L08094900
	movs r2, #8
	mov sl, r2
.L08094900:
	mov r3, r8
	cmp r3, #7
	bhi .L0809490A
	movs r0, #8
	mov r8, r0
.L0809490A:
	ldr r4, .L080949A8 @ =gSinLut
	ldr r1, .L080949AC @ =gSinLut+0x80
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #4
	mov r1, sl
	bl Div
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	movs r3, #0
	ldrsh r0, [r4, r3]
	rsbs r0, r0, #0
	lsls r0, r0, #4
	mov r1, r8
	bl Div
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	movs r1, #0
	ldrsh r0, [r4, r1]
	lsls r0, r0, #4
	mov r1, sl
	bl Div
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	ldr r2, .L080949AC @ =gSinLut+0x80
	movs r3, #0
	ldrsh r0, [r2, r3]
	lsls r0, r0, #4
	mov r1, r8
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	adds r0, r7, #0
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl SetObjAffine
	ldr r0, .L080949B0 @ =0x000001FF
	ldr r1, [sp, #8]
	ands r1, r0
	str r1, [sp, #8]
	lsls r1, r7, #9
	ldr r2, [sp, #8]
	adds r1, r2, r1
	ldr r3, [sp, #0xc]
	ands r3, r0
	str r3, [sp, #0xc]
	ldr r2, .L080949B4 @ =gUnk_08690288
	ldr r3, [sp, #4]
	adds r0, r3, r7
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r3, [r0]
	movs r0, #0xf
	mov r2, sb
	ands r2, r0
	lsls r0, r2, #0xc
	str r0, [sp]
	movs r0, #4
	ldr r2, [sp, #0xc]
	bl PutSpriteExt
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L080949A8: .4byte gSinLut
.L080949AC: .4byte gSinLut+0x80
.L080949B0: .4byte 0x000001FF
.L080949B4: .4byte gUnk_08690288

	thumb_func_start func_fe6_080949B8
func_fe6_080949B8: @ 0x080949B8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r5, r0, #0
	ldr r2, .L08094A04 @ =gDispIo
	movs r0, #0x21
	rsbs r0, r0, #0
	ldrb r1, [r2, #1]
	ands r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r2, #1]
	movs r0, #0
	strh r0, [r5, #0x2a]
	adds r2, r5, #0
	adds r2, #0x30
	ldrb r0, [r2]
	cmp r0, #0
	bne .L08094A0C
	adds r1, r5, #0
	adds r1, #0x2f
	movs r0, #0
	strb r0, [r1]
	mov sb, r2
	ldr r2, .L08094A08 @ =gUnk_08690288
	mov ip, r2
	movs r0, #0x2e
	adds r0, r0, r5
	mov r8, r0
	movs r2, #0x34
	adds r2, r2, r5
	mov sl, r2
	b .L08094A42
	.align 2, 0
.L08094A04: .4byte gDispIo
.L08094A08: .4byte gUnk_08690288
.L08094A0C:
	movs r4, #0
	movs r3, #0
	mov sb, r2
	adds r1, r5, #0
	adds r1, #0x2f
	ldr r0, .L08094A78 @ =gUnk_08690288
	mov ip, r0
	movs r2, #0x2e
	adds r2, r2, r5
	mov r8, r2
	movs r0, #0x34
	adds r0, r0, r5
	mov sl, r0
	mov r6, sb
	adds r7, r1, #0
	mov r2, ip
.L08094A2C:
	adds r2, #4
	adds r4, #1
	ldr r0, [r2]
	cmp r0, #0
	bne .L08094A2C
	adds r3, #1
	ldrb r0, [r6]
	cmp r3, r0
	bne .L08094A2C
	adds r0, r4, #1
	strb r0, [r7]
.L08094A42:
	movs r0, #0
	mov r2, r8
	strb r0, [r2]
	ldrb r1, [r1]
	lsls r0, r1, #2
	mov r2, ip
	adds r1, r0, r2
	ldr r0, [r1]
	cmp r0, #0
	beq .L08094A66
	mov r2, r8
.L08094A58:
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	adds r1, #4
	ldr r0, [r1]
	cmp r0, #0
	bne .L08094A58
.L08094A66:
	mov r0, sb
	ldrb r0, [r0]
	cmp r0, #0x13
	bls .L08094A84
	ldr r0, .L08094A7C @ =gUnk_08357140
	ldr r1, .L08094A80 @ =0x06010000
	bl Decompress
	b .L08094A8C
	.align 2, 0
.L08094A78: .4byte gUnk_08690288
.L08094A7C: .4byte gUnk_08357140
.L08094A80: .4byte 0x06010000
.L08094A84:
	ldr r0, .L08094B0C @ =gUnk_08354780
	ldr r1, .L08094B10 @ =0x06010000
	bl Decompress
.L08094A8C:
	ldr r0, .L08094B14 @ =gUnk_08354760
	movs r1, #0x80
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r4, .L08094B18 @ =gUnk_0835A368
	movs r1, #0xf0
	lsls r1, r1, #2
	adds r0, r4, #0
	movs r2, #0x20
	bl ApplyPaletteExt
	movs r1, #0xf8
	lsls r1, r1, #2
	adds r0, r4, #0
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, .L08094B1C @ =gUnk_083599AC
	ldr r1, .L08094B20 @ =0x06016000
	bl Decompress
	mov r1, sl
	movs r2, #0
	adds r0, r1, #0
	adds r0, #0x24
.L08094AC2:
	str r2, [r0]
	subs r0, #4
	cmp r0, r1
	bge .L08094AC2
	mov r2, r8
	ldrb r2, [r2]
	lsls r1, r2, #3
	mov r0, r8
	ldrb r0, [r0]
	subs r1, r1, r0
	lsls r1, r1, #2
	movs r0, #0xf0
	subs r0, r0, r1
	asrs r0, r0, #1
	subs r0, #0x10
	ldr r2, .L08094B24 @ =0x000001FF
	adds r1, r2, #0
	ands r0, r1
	strh r0, [r5, #0x2c]
	adds r0, r5, #0
	movs r1, #0
	bl func_fe6_08094EE8
	str r0, [r5, #0x34]
	mov r0, sb
	ldrb r1, [r0]
	adds r0, r5, #0
	bl func_fe6_080951DC
	str r0, [r5, #0x5c]
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08094B0C: .4byte gUnk_08354780
.L08094B10: .4byte 0x06010000
.L08094B14: .4byte gUnk_08354760
.L08094B18: .4byte gUnk_0835A368
.L08094B1C: .4byte gUnk_083599AC
.L08094B20: .4byte 0x06016000
.L08094B24: .4byte 0x000001FF

	thumb_func_start func_fe6_08094B28
func_fe6_08094B28: @ 0x08094B28
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, .L08094B7C @ =gDispIo
	mov ip, r0
	mov r3, ip
	adds r3, #0x3c
	movs r2, #0x3f
	ldrb r0, [r3]
	ands r2, r0
	movs r0, #0x80
	orrs r2, r0
	mov r0, ip
	adds r0, #0x44
	movs r5, #0
	strb r5, [r0]
	adds r0, #1
	strb r5, [r0]
	ldrh r0, [r4, #0x2a]
	lsrs r1, r0, #1
	movs r0, #0x10
	subs r0, r0, r1
	mov r1, ip
	adds r1, #0x46
	strb r0, [r1]
	movs r0, #0x20
	orrs r2, r0
	strb r2, [r3]
	ldrh r0, [r4, #0x2a]
	adds r0, #1
	strh r0, [r4, #0x2a]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x20
	bne .L08094B74
	strh r5, [r4, #0x2a]
	adds r0, r4, #0
	bl Proc_Break
.L08094B74:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08094B7C: .4byte gDispIo

	thumb_func_start func_fe6_08094B80
func_fe6_08094B80: @ 0x08094B80
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2a]
	cmp r0, #0x5f
	bls .L08094B94
	adds r0, r4, #0
	bl Proc_Break
	movs r0, #0
	b .L08094BD8
.L08094B94:
	cmp r0, #0xf
	bls .L08094BD4
	ldrh r1, [r4, #0x2a]
	adds r6, r1, #0
	subs r6, #0x10
	movs r0, #3
	ands r0, r6
	cmp r0, #0
	bne .L08094BD4
	adds r0, r6, #0
	cmp r6, #0
	bge .L08094BB0
	adds r0, r1, #0
	subs r0, #0xd
.L08094BB0:
	asrs r0, r0, #2
	adds r5, r0, #1
	adds r0, r4, #0
	adds r0, #0x2e
	ldrb r0, [r0]
	cmp r5, r0
	bge .L08094BD4
	lsls r1, r5, #0x18
	lsrs r1, r1, #0x18
	adds r0, r4, #0
	bl func_fe6_08094EE8
	adds r2, r0, #0
	lsls r1, r5, #2
	adds r0, r4, #0
	adds r0, #0x34
	adds r0, r0, r1
	str r2, [r0]
.L08094BD4:
	ldrh r0, [r4, #0x2a]
	adds r0, #1
.L08094BD8:
	strh r0, [r4, #0x2a]
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start func_fe6_08094BE0
func_fe6_08094BE0: @ 0x08094BE0
	push {r4, r5, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2a]
	cmp r0, #0x14
	bne .L08094BF2
	ldr r0, [r4, #0x5c]
	movs r1, #4
	bl Proc_Goto
.L08094BF2:
	ldrh r0, [r4, #0x2a]
	cmp r0, #0x4f
	bls .L08094C0E
	adds r0, r4, #0
	bl Proc_Break
	movs r0, #0
	strh r0, [r4, #0x2a]
	adds r1, r4, #0
	adds r1, #0x30
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	b .L08094C48
.L08094C0E:
	ldrh r5, [r4, #0x2a]
	adds r0, r5, #0
	movs r1, #6
	bl __umodsi3
	lsls r0, r0, #0x10
	cmp r0, #0
	bne .L08094C42
	adds r0, r5, #0
	movs r1, #6
	bl __udivsi3
	adds r1, r4, #0
	adds r1, #0x2e
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrb r1, [r1]
	cmp r0, r1
	bhs .L08094C42
	lsls r0, r0, #2
	adds r1, r4, #0
	adds r1, #0x34
	adds r1, r1, r0
	ldr r0, [r1]
	bl Proc_Break
.L08094C42:
	ldrh r0, [r4, #0x2a]
	adds r0, #1
	strh r0, [r4, #0x2a]
.L08094C48:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_fe6_08094C50
func_fe6_08094C50: @ 0x08094C50
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r4, r6, #0
	adds r4, #0x34
	movs r5, #7
.L08094C5A:
	ldr r0, [r4]
	cmp r0, #0
	beq .L08094C64
	bl Proc_End
.L08094C64:
	adds r4, #4
	subs r5, #1
	cmp r5, #0
	bge .L08094C5A
	ldr r0, [r6, #0x60]
	movs r1, #0
	str r1, [r0, #0x34]
	adds r0, #0x2c
	movs r1, #3
	strb r1, [r0]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_fe6_08094C80
func_fe6_08094C80: @ 0x08094C80
	push {r4, r5, lr}
	adds r5, r0, #0
	lsls r4, r1, #0x18
	lsrs r4, r4, #0x18
	ldr r0, .L08094CB4 @ =ProcScr_ClassDemo_0868FEFC
	adds r1, r5, #0
	bl SpawnProc
	adds r2, r0, #0
	str r5, [r2, #0x60]
	adds r0, #0x30
	strb r4, [r0]
	movs r3, #0
	movs r1, #9
	adds r0, #0x28
.L08094C9E:
	str r3, [r0]
	subs r0, #4
	subs r1, #1
	cmp r1, #0
	bge .L08094C9E
	movs r0, #0
	str r0, [r2, #0x5c]
	adds r0, r2, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
.L08094CB4: .4byte ProcScr_ClassDemo_0868FEFC

	thumb_func_start func_fe6_08094CB8
func_fe6_08094CB8: @ 0x08094CB8
	push {r4, lr}
	movs r1, #0
	strh r1, [r0, #0x2a]
	ldr r2, [r0, #0x14]
	adds r1, r2, #0
	adds r1, #0x2f
	ldrb r1, [r1]
	strh r1, [r0, #0x2c]
	adds r3, r0, #0
	adds r3, #0x2e
	ldrb r4, [r3]
	lsls r1, r4, #3
	subs r1, r1, r4
	lsls r1, r1, #2
	ldrh r2, [r2, #0x2c]
	adds r1, r2, r1
	ldr r3, .L08094CE8 @ =0x000001FF
	adds r2, r3, #0
	ands r1, r2
	strh r1, [r0, #0x30]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08094CE8: .4byte 0x000001FF

	thumb_func_start func_fe6_08094CEC
func_fe6_08094CEC: @ 0x08094CEC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	adds r7, r0, #0
	movs r0, #0x2e
	adds r0, r0, r7
	mov sb, r0
	ldrb r1, [r0]
	mov sl, r1
	cmp r1, #0
	bne .L08094DC0
	ldr r3, .L08094DB8 @ =gSinLut
	movs r2, #0xa0
	lsls r2, r2, #1
	adds r0, r3, r2
	movs r5, #0
	ldrsh r6, [r0, r5]
	asrs r6, r6, #6
	adds r0, r3, #0
	adds r0, #0xc0
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r4, r0, #1
	adds r4, r4, r0
	asrs r4, r4, #9
	ldrh r0, [r7, #0x2a]
	movs r2, #0xc0
	subs r2, r2, r0
	movs r1, #0xff
	ands r2, r1
	adds r1, r2, #0
	adds r1, #0x40
	lsls r1, r1, #1
	adds r1, r1, r3
	movs r5, #0
	ldrsh r1, [r1, r5]
	asrs r5, r1, #6
	lsls r2, r2, #1
	adds r2, r2, r3
	movs r1, #0
	ldrsh r2, [r2, r1]
	lsls r1, r2, #1
	adds r1, r1, r2
	asrs r3, r1, #9
	lsls r0, r0, #8
	movs r1, #0x60
	str r3, [sp, #0xc]
	bl __divsi3
	movs r2, #0x80
	lsls r2, r2, #2
	adds r1, r2, #0
	subs r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldrh r0, [r7, #0x2c]
	mov r8, r0
	mov r2, sb
	ldrb r2, [r2]
	mov sb, r2
	ldrh r0, [r7, #0x30]
	adds r5, r0, r5
	subs r5, r5, r6
	ldr r0, .L08094DBC @ =0x000001FF
	ands r5, r0
	subs r4, #0x18
	ldr r3, [sp, #0xc]
	subs r4, r3, r4
	ands r4, r0
	str r1, [sp]
	str r1, [sp, #4]
	ldrh r0, [r7, #0x2a]
	movs r1, #0xc
	bl __divsi3
	movs r1, #8
	subs r1, r1, r0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	str r1, [sp, #8]
	mov r0, r8
	mov r1, sb
	adds r2, r5, #0
	adds r3, r4, #0
	bl func_fe6_08094878
	ldrh r0, [r7, #0x2a]
	adds r0, #4
	strh r0, [r7, #0x2a]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x60
	bne .L08094E10
	mov r1, sl
	strh r1, [r7, #0x2a]
	adds r0, r7, #0
	bl Proc_Break
	b .L08094E10
	.align 2, 0
.L08094DB8: .4byte gSinLut
.L08094DBC: .4byte 0x000001FF
.L08094DC0:
	ldrh r1, [r7, #0x2a]
	adds r0, r1, #0
	adds r2, r1, #0
	asrs r6, r0, #4
	movs r0, #0x10
	subs r5, r0, r6
	adds r3, r5, #0
	ldrh r4, [r7, #0x2c]
	mov r2, sb
	ldrb r5, [r2]
	ldrh r0, [r7, #0x30]
	subs r2, r0, r3
	movs r0, #0x18
	subs r3, r0, r3
	str r1, [sp]
	movs r1, #0x80
	lsls r1, r1, #1
	mov r8, r1
	str r1, [sp, #4]
	movs r0, #0x10
	subs r0, r0, r6
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #8]
	adds r0, r4, #0
	adds r1, r5, #0
	bl func_fe6_08094878
	ldrh r0, [r7, #0x2a]
	adds r0, #0x10
	strh r0, [r7, #0x2a]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, r8
	bne .L08094E10
	movs r0, #0
	strh r0, [r7, #0x2a]
	adds r0, r7, #0
	bl Proc_Break
.L08094E10:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start func_fe6_08094E20
func_fe6_08094E20: @ 0x08094E20
	push {r4, r5, lr}
	sub sp, #0xc
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r1, r4, #0
	adds r1, #0x2e
	ldrb r1, [r1]
	ldrh r2, [r4, #0x30]
	movs r3, #0x80
	lsls r3, r3, #1
	str r3, [sp]
	str r3, [sp, #4]
	movs r5, #0
	str r5, [sp, #8]
	movs r3, #0x18
	bl func_fe6_08094878
	strh r5, [r4, #0x2a]
	add sp, #0xc
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start func_fe6_08094E4C
func_fe6_08094E4C: @ 0x08094E4C
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r4, r0, #0
	ldrh r2, [r4, #0x2a]
	movs r0, #0x80
	lsls r0, r0, #1
	adds r6, r2, r0
	subs r0, r0, r2
	mov ip, r0
	ldrh r0, [r4, #0x30]
	cmp r0, #0xff
	bls .L08094E78
	adds r1, r2, #0
	muls r1, r2, r1
	asrs r1, r1, #7
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	subs r0, r0, r1
	lsls r0, r0, #3
	rsbs r0, r0, #0
	b .L08094E86
.L08094E78:
	movs r1, #0xff
	ands r1, r0
	subs r1, #0x58
	adds r0, r2, #0
	muls r0, r2, r0
	asrs r0, r0, #7
	muls r0, r1, r0
.L08094E86:
	cmp r0, #0
	bge .L08094E8C
	adds r0, #0xff
.L08094E8C:
	asrs r0, r0, #8
	ldrh r3, [r4, #0x2c]
	adds r5, r4, #0
	adds r5, #0x2e
	ldrb r1, [r5]
	ldrh r7, [r4, #0x30]
	adds r2, r7, r0
	lsls r0, r6, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp]
	mov r6, ip
	lsls r0, r6, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #4]
	ldrh r0, [r4, #0x2a]
	asrs r0, r0, #4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #8]
	adds r0, r3, #0
	movs r3, #0x18
	bl func_fe6_08094878
	movs r0, #0x80
	lsls r0, r0, #1
	ldrh r7, [r4, #0x2a]
	cmp r7, r0
	bne .L08094ED8
	ldr r0, [r4, #0x14]
	ldrb r5, [r5]
	lsls r1, r5, #2
	adds r0, #0x34
	adds r0, r0, r1
	movs r1, #0
	str r1, [r0]
	adds r0, r4, #0
	bl Proc_Break
.L08094ED8:
	ldrh r0, [r4, #0x2a]
	adds r0, #8
	strh r0, [r4, #0x2a]
	add sp, #0xc
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_fe6_08094EE8
func_fe6_08094EE8: @ 0x08094EE8
	push {r4, lr}
	adds r2, r0, #0
	lsls r4, r1, #0x18
	lsrs r4, r4, #0x18
	ldr r0, .L08094F04 @ =gUnk_0868FF4C
	adds r1, r2, #0
	bl SpawnProc
	adds r1, r0, #0
	adds r1, #0x2e
	strb r4, [r1]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
.L08094F04: .4byte gUnk_0868FF4C

	thumb_func_start func_fe6_08094F08
func_fe6_08094F08: @ 0x08094F08
	push {lr}
	bl EnablePalSync
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_fe6_08094F14
func_fe6_08094F14: @ 0x08094F14
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r3, r0, #0
	movs r0, #0
	strh r0, [r3, #0x2a]
	ldr r0, .L08094F88 @ =gPal
	movs r1, #0
	movs r4, #0xf
	ldr r2, .L08094F8C @ =0x000003FE
	adds r0, r0, r2
.L08094F2A:
	strh r1, [r0]
	subs r0, #2
	subs r4, #1
	cmp r4, #0
	bge .L08094F2A
	adds r0, r3, #0
	adds r0, #0x2e
	movs r1, #0
	strb r1, [r0]
	adds r2, r3, #0
	adds r2, #0x2d
	strb r1, [r2]
	movs r4, #0
	adds r7, r3, #0
	adds r7, #0x2c
	ldr r1, .L08094F90 @ =gUnk_08690A99
	mov r8, r1
	adds r6, r0, #0
	adds r5, r2, #0
.L08094F50:
	ldrb r0, [r7]
	add r0, r8
	ldrb r0, [r0]
	bl GetJInfo
	adds r0, #0x28
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0
	beq .L08094F74
	movs r0, #1
	lsls r0, r4
	ldrb r2, [r6]
	orrs r0, r2
	strb r0, [r6]
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
.L08094F74:
	adds r4, #1
	cmp r4, #7
	ble .L08094F50
	bl EnablePalSync
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08094F88: .4byte gPal
.L08094F8C: .4byte 0x000003FE
.L08094F90: .4byte gUnk_08690A99

	thumb_func_start func_fe6_08094F94
func_fe6_08094F94: @ 0x08094F94
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	lsls r1, r1, #0x18
	movs r7, #0xe0
	lsls r7, r7, #8
	cmp r1, #0
	beq .L08094FB2
	movs r7, #0xf0
	lsls r7, r7, #8
.L08094FB2:
	ldr r4, .L08094FF4 @ =gUnk_086900F8
	str r7, [sp]
	movs r0, #4
	movs r1, #0x74
	movs r2, #0x48
	adds r3, r4, #0
	bl PutSpriteExt
	movs r5, #0
	cmp r5, r8
	bge .L0809501E
	mov sb, r4
	movs r6, #0x74
	movs r4, #0x74
.L08094FCE:
	mov r0, r8
	subs r0, #1
	cmp r5, r0
	bge .L08094FF8
	str r7, [sp]
	movs r0, #4
	adds r1, r4, #0
	movs r2, #0x48
	mov r3, sb
	bl PutSpriteExt
	str r7, [sp]
	movs r0, #4
	adds r1, r6, #0
	movs r2, #0x48
	mov r3, sb
	bl PutSpriteExt
	b .L08095014
	.align 2, 0
.L08094FF4: .4byte gUnk_086900F8
.L08094FF8:
	str r7, [sp]
	movs r0, #4
	adds r1, r4, #0
	movs r2, #0x48
	ldr r3, .L0809502C @ =gUnk_086900F0
	bl PutSpriteExt
	str r7, [sp]
	movs r0, #4
	adds r1, r6, #0
	movs r2, #0x48
	ldr r3, .L08095030 @ =gUnk_08690100
	bl PutSpriteExt
.L08095014:
	adds r6, #8
	subs r4, #8
	adds r5, #1
	cmp r5, r8
	blt .L08094FCE
.L0809501E:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0809502C: .4byte gUnk_086900F0
.L08095030: .4byte gUnk_08690100

	thumb_func_start func_fe6_08095034
func_fe6_08095034: @ 0x08095034
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov r8, r1
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	mov sb, r2
	movs r0, #0xe0
	lsls r0, r0, #8
	mov sl, r0
	cmp r5, #0
	beq .L08095060
	movs r1, #0xf0
	lsls r1, r1, #8
	mov sl, r1
.L08095060:
	movs r4, #0
	ldr r6, .L080950F0 @ =gPal
	movs r7, #0xf8
	lsls r7, r7, #2
	adds r3, r6, r7
	lsls r2, r5, #0x10
	movs r0, #0xf0
	lsls r0, r0, #1
	mov ip, r0
.L08095072:
	adds r0, r5, r4
	movs r1, #0xf
	cmp r0, #0xf
	bgt .L0809507C
	lsrs r1, r2, #0x10
.L0809507C:
	mov r7, ip
	adds r0, r1, r7
	lsls r0, r0, #1
	adds r0, r0, r6
	ldrh r0, [r0]
	strh r0, [r3]
	adds r3, #2
	movs r0, #0x80
	lsls r0, r0, #9
	adds r2, r2, r0
	adds r4, #1
	cmp r4, #0xf
	ble .L08095072
	bl EnablePalSync
	movs r4, #0
	mov r1, r8
	lsls r0, r1, #5
	subs r0, #0x88
	ldr r6, .L080950F4 @ =gUnk_086900BC
	rsbs r5, r0, #0
.L080950A6:
	mov r0, sb
	asrs r0, r4
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq .L080950C8
	ldr r1, .L080950F8 @ =0x000001FF
	ands r1, r5
	ldr r3, [r6]
	movs r0, #0xf0
	lsls r0, r0, #8
	str r0, [sp]
	movs r0, #4
	movs r2, #0x50
	bl PutSpriteExt
	adds r5, #0x20
.L080950C8:
	adds r6, #4
	adds r4, #1
	cmp r4, #7
	ble .L080950A6
	ldr r3, .L080950FC @ =gUnk_086900DC
	mov r7, sl
	str r7, [sp]
	movs r0, #4
	movs r1, #0x90
	movs r2, #0x50
	bl PutSpriteExt
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L080950F0: .4byte gPal
.L080950F4: .4byte gUnk_086900BC
.L080950F8: .4byte 0x000001FF
.L080950FC: .4byte gUnk_086900DC

	thumb_func_start func_fe6_08095100
func_fe6_08095100: @ 0x08095100
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2a]
	adds r0, #1
	adds r1, r0, #0
	strh r0, [r4, #0x2a]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xd
	bhi .L08095120
	lsls r0, r1, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0
	bl func_fe6_08094F94
	b .L08095132
.L08095120:
	movs r0, #0xe
	movs r1, #0
	bl func_fe6_08094F94
	movs r0, #0
	strh r0, [r4, #0x2a]
	adds r0, r4, #0
	bl Proc_Break
.L08095132:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start func_fe6_08095138
func_fe6_08095138: @ 0x08095138
	push {r4, r5, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2a]
	adds r0, #1
	adds r1, r0, #0
	strh r0, [r4, #0x2a]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x10
	bls .L08095156
	movs r5, #0
	adds r0, r4, #0
	bl Proc_Break
	b .L0809515E
.L08095156:
	movs r0, #0x10
	subs r0, r0, r1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
.L0809515E:
	movs r0, #0xe
	movs r1, #0
	bl func_fe6_08094F94
	adds r0, r4, #0
	adds r0, #0x2d
	ldrb r1, [r0]
	adds r0, #1
	ldrb r2, [r0]
	adds r0, r5, #0
	bl func_fe6_08095034
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start func_fe6_0809517C
func_fe6_0809517C: @ 0x0809517C
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0xe
	movs r1, #0
	bl func_fe6_08094F94
	adds r0, r4, #0
	adds r0, #0x2d
	ldrb r1, [r0]
	adds r0, #1
	ldrb r2, [r0]
	movs r0, #0
	bl func_fe6_08095034
	movs r0, #0
	strh r0, [r4, #0x2a]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_fe6_080951A4
func_fe6_080951A4: @ 0x080951A4
	push {lr}
	adds r2, r0, #0
	ldrh r0, [r2, #0x2a]
	adds r0, #1
	strh r0, [r2, #0x2a]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x11
	cmp r0, #0x10
	bls .L080951BE
	adds r0, r2, #0
	bl Proc_Break
	b .L080951D8
.L080951BE:
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, r2, #0
	adds r1, #0x2d
	ldrb r1, [r1]
	adds r2, #0x2e
	ldrb r2, [r2]
	bl func_fe6_08095034
	movs r0, #0xe
	movs r1, #1
	bl func_fe6_08094F94
.L080951D8:
	pop {r0}
	bx r0

	thumb_func_start func_fe6_080951DC
func_fe6_080951DC: @ 0x080951DC
	push {r4, lr}
	adds r2, r0, #0
	lsls r4, r1, #0x18
	lsrs r4, r4, #0x18
	ldr r0, .L080951F8 @ =gUnk_0868FF84
	adds r1, r2, #0
	bl SpawnProc
	adds r1, r0, #0
	adds r1, #0x2c
	strb r4, [r1]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
.L080951F8: .4byte gUnk_0868FF84

	thumb_func_start func_fe6_080951FC
func_fe6_080951FC: @ 0x080951FC
	ldr r0, .L08095224 @ =0x04000006
	ldrh r0, [r0]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x6d
	bhi .L08095234
	ldr r3, .L08095228 @ =0x04000008
	ldrh r2, [r3]
	ldr r1, .L0809522C @ =0x0000FFFC
	adds r0, r1, #0
	ands r0, r2
	adds r0, #2
	strh r0, [r3]
	ldr r2, .L08095230 @ =0x0400000C
	ldrh r0, [r2]
	ands r1, r0
	adds r1, #2
	b .L0809524A
	.align 2, 0
.L08095224: .4byte 0x04000006
.L08095228: .4byte 0x04000008
.L0809522C: .4byte 0x0000FFFC
.L08095230: .4byte 0x0400000C
.L08095234:
	ldr r3, .L08095250 @ =0x04000008
	ldrh r2, [r3]
	ldr r1, .L08095254 @ =0x0000FFFC
	adds r0, r1, #0
	ands r0, r2
	adds r0, #1
	strh r0, [r3]
	ldr r2, .L08095258 @ =0x0400000C
	ldrh r0, [r2]
	ands r1, r0
	adds r1, #1
.L0809524A:
	strh r1, [r2]
	bx lr
	.align 2, 0
.L08095250: .4byte 0x04000008
.L08095254: .4byte 0x0000FFFC
.L08095258: .4byte 0x0400000C

	thumb_func_start func_fe6_0809525C
func_fe6_0809525C: @ 0x0809525C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r0, .L08095328 @ =gDispIo
	mov ip, r0
	mov r2, ip
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	mov r1, ip
	adds r1, #0x44
	movs r2, #0
	movs r3, #0x10
	mov r8, r3
	movs r0, #0x10
	strb r0, [r1]
	adds r1, #1
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x46
	strb r2, [r0]
	ldr r0, .L0809532C @ =0x0000FFE0
	mov r1, ip
	ldrh r1, [r1, #0x3c]
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	ldr r1, .L08095330 @ =0x0000E0FF
	ands r0, r1
	movs r3, #0xe0
	lsls r3, r3, #5
	adds r1, r3, #0
	orrs r0, r1
	mov r1, ip
	strh r0, [r1, #0x3c]
	movs r5, #0x20
	ldrb r0, [r1, #1]
	orrs r0, r5
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	mov r3, ip
	strb r0, [r3, #1]
	mov r0, ip
	adds r0, #0x2d
	strb r2, [r0]
	adds r0, #4
	strb r2, [r0]
	mov r1, ip
	adds r1, #0x2c
	movs r0, #0xf0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0xa0
	strb r0, [r1]
	mov r6, ip
	adds r6, #0x34
	movs r0, #1
	ldrb r1, [r6]
	orrs r1, r0
	movs r2, #2
	orrs r1, r2
	movs r4, #4
	orrs r1, r4
	movs r3, #8
	orrs r1, r3
	mov r2, r8
	orrs r1, r2
	mov r7, ip
	adds r7, #0x36
	ldrb r2, [r7]
	orrs r0, r2
	movs r2, #3
	rsbs r2, r2, #0
	ands r0, r2
	orrs r0, r4
	orrs r0, r3
	mov r3, r8
	orrs r0, r3
	orrs r1, r5
	strb r1, [r6]
	movs r1, #0x21
	rsbs r1, r1, #0
	ands r0, r1
	strb r0, [r7]
	mov r0, ip
	adds r0, #0x3d
	ldrb r1, [r0]
	orrs r5, r1
	strb r5, [r0]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08095328: .4byte gDispIo
.L0809532C: .4byte 0x0000FFE0
.L08095330: .4byte 0x0000E0FF

	thumb_func_start func_fe6_08095334
func_fe6_08095334: @ 0x08095334
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x38
	adds r7, r0, #0
	movs r0, #0
	str r0, [sp, #0x1c]
	add r1, sp, #4
	ldr r0, .L08095358 @ =gUnk_0835C80C
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldm r0!, {r2, r3, r6}
	stm r1!, {r2, r3, r6}
	movs r6, #4
	ldr r4, .L0809535C @ =gUnk_08690A99
	b .L08095362
	.align 2, 0
.L08095358: .4byte gUnk_0835C80C
.L0809535C: .4byte gUnk_08690A99
.L08095360:
	adds r6, #1
.L08095362:
	movs r0, #0x31
	adds r0, r0, r7
	mov sl, r0
	cmp r6, #7
	bgt .L08095384
	ldrb r1, [r0]
	adds r0, r1, r4
	ldrb r0, [r0]
	bl GetJInfo
	adds r0, #0x28
	adds r0, r0, r6
	ldrb r0, [r0]
	cmp r0, #0
	beq .L08095360
	movs r2, #1
	str r2, [sp, #0x1c]
.L08095384:
	movs r0, #0
	strh r0, [r7, #0x2a]
	strh r0, [r7, #0x2c]
	strh r0, [r7, #0x2e]
	adds r1, r7, #0
	adds r1, #0x3e
	movs r0, #1
	strb r0, [r1]
	adds r1, #6
	movs r0, #0xfa
	strb r0, [r1]
	ldr r0, .L080953EC @ =gBg0Tm
	movs r1, #0
	bl TmFill
	ldr r0, .L080953F0 @ =gBg1Tm
	movs r1, #0
	bl TmFill
	ldr r0, .L080953F4 @ =gBg2Tm
	movs r1, #0
	bl TmFill
	mov r3, sl
	ldrb r0, [r3]
	cmp r0, #0
	bne .L08095400
	strh r0, [r7, #0x2e]
	ldr r4, .L080953F8 @ =gUnk_086905F8
	mov r8, r4
	adds r5, r7, #0
	adds r5, #0x30
	ldr r4, .L080953FC @ =gDispIo
	adds r6, r7, #0
	adds r6, #0x38
	str r6, [sp, #0x24]
	movs r0, #0x39
	adds r0, r0, r7
	mov sb, r0
	adds r1, r7, #0
	adds r1, #0x3a
	str r1, [sp, #0x28]
	adds r2, r7, #0
	adds r2, #0x3b
	str r2, [sp, #0x2c]
	adds r3, r7, #0
	adds r3, #0x3c
	str r3, [sp, #0x30]
	adds r6, #5
	str r6, [sp, #0x34]
	b .L08095448
	.align 2, 0
.L080953EC: .4byte gBg0Tm
.L080953F0: .4byte gBg1Tm
.L080953F4: .4byte gBg2Tm
.L080953F8: .4byte gUnk_086905F8
.L080953FC: .4byte gDispIo
.L08095400:
	movs r6, #0
	movs r2, #0
	ldr r0, .L080955E8 @ =gUnk_086905F8
	mov r8, r0
	adds r5, r7, #0
	adds r5, #0x30
	ldr r4, .L080955EC @ =gDispIo
	adds r1, r7, #0
	adds r1, #0x38
	str r1, [sp, #0x24]
	movs r3, #0x39
	adds r3, r3, r7
	mov sb, r3
	adds r0, r7, #0
	adds r0, #0x3a
	str r0, [sp, #0x28]
	adds r1, #3
	str r1, [sp, #0x2c]
	adds r3, r7, #0
	adds r3, #0x3c
	str r3, [sp, #0x30]
	adds r0, #3
	str r0, [sp, #0x34]
	mov r3, sl
	mov r1, r8
.L08095432:
	adds r1, #4
	adds r6, #1
	ldrb r0, [r1, #1]
	cmp r0, #0
	bne .L08095432
	adds r2, #1
	ldrb r0, [r3]
	cmp r2, r0
	bne .L08095432
	adds r0, r6, #1
	strh r0, [r7, #0x2e]
.L08095448:
	ldrh r1, [r7, #0x2e]
	lsls r0, r1, #2
	add r0, r8
	ldrb r0, [r0]
	strb r0, [r5]
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r2, [r4, #1]
	ands r0, r2
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #2
	ands r0, r1
	subs r1, #4
	ands r0, r1
	subs r1, #8
	ands r0, r1
	strb r0, [r4, #1]
	bl ResetTextFont
	bl ResetText
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r3, [r4, #0xc]
	ands r0, r3
	movs r2, #2
	orrs r0, r2
	strb r0, [r4, #0xc]
	adds r0, r1, #0
	ldrb r6, [r4, #0x10]
	ands r0, r6
	orrs r0, r2
	strb r0, [r4, #0x10]
	ldrb r0, [r4, #0x14]
	ands r1, r0
	orrs r1, r2
	strb r1, [r4, #0x14]
	movs r0, #3
	ldrb r1, [r4, #0x18]
	orrs r0, r1
	strb r0, [r4, #0x18]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r4, .L080955F0 @ =Img_MonologueBG
	movs r0, #3
	bl GetBgChrOffset
	adds r1, r0, #0
	movs r5, #0xc0
	lsls r5, r5, #0x13
	adds r1, r1, r5
	adds r0, r4, #0
	bl Decompress
	ldr r0, .L080955F4 @ =gUnk_0835AB08
	movs r1, #0xa0
	lsls r1, r1, #1
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, .L080955F8 @ =gBg3Tm
	ldr r1, .L080955FC @ =gUnk_0835AB28
	movs r2, #0xa0
	lsls r2, r2, #8
	bl TmApplyTsa_thm
	ldr r4, .L08095600 @ =gUnk_0835A3E8
	movs r0, #2
	bl GetBgChrOffset
	adds r1, r0, #0
	adds r1, r1, r5
	adds r0, r4, #0
	bl Decompress
	ldr r0, .L08095604 @ =gUnk_0835A5D0
	movs r1, #0x90
	lsls r1, r1, #1
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, .L08095608 @ =gBg2Tm
	ldr r1, .L0809560C @ =gUnk_0835A5F0
	movs r2, #0x90
	lsls r2, r2, #8
	bl TmApplyTsa_thm
	movs r0, #0xf
	bl EnableBgSync
	ldr r5, .L08095610 @ =gBg0Tm
	adds r0, r5, #0
	movs r1, #0
	bl TmFill
	ldr r4, .L08095614 @ =gUnk_08690A99
	mov r2, sl
	ldrb r2, [r2]
	adds r0, r2, r4
	ldrb r0, [r0]
	bl GetJInfo
	ldrb r0, [r0, #0xb]
	ldr r3, [sp, #0x24]
	strb r0, [r3]
	mov r6, sl
	ldrb r6, [r6]
	adds r0, r6, r4
	ldrb r0, [r0]
	bl GetJInfo
	ldrb r0, [r0, #0xc]
	mov r1, sb
	strb r0, [r1]
	mov r2, sl
	ldrb r2, [r2]
	adds r0, r2, r4
	ldrb r0, [r0]
	bl GetJInfo
	ldrb r0, [r0, #0xd]
	ldr r3, [sp, #0x28]
	strb r0, [r3]
	mov r6, sl
	ldrb r6, [r6]
	adds r0, r6, r4
	ldrb r0, [r0]
	bl GetJInfo
	ldrb r0, [r0, #0xe]
	ldr r1, [sp, #0x2c]
	strb r0, [r1]
	mov r2, sl
	ldrb r2, [r2]
	adds r0, r2, r4
	ldrb r0, [r0]
	bl GetJInfo
	ldrb r0, [r0, #0xf]
	ldr r3, [sp, #0x30]
	strb r0, [r3]
	mov r6, sl
	ldrb r6, [r6]
	adds r4, r6, r4
	ldrb r0, [r4]
	bl GetJInfo
	ldrb r0, [r0, #0x10]
	ldr r1, [sp, #0x34]
	strb r0, [r1]
	movs r6, #0
	ldr r2, .L08095618 @ =0x0200FF24
	str r2, [sp, #0x20]
	movs r3, #0x4a
	adds r3, r3, r5
	mov sb, r3
	adds r5, #0x42
	mov r8, r5
	adds r4, r2, #0
	add r5, sp, #4
.L080955B2:
	adds r0, r4, #0
	movs r1, #3
	bl InitText
	adds r0, r4, #0
	bl ClearText
	adds r0, r4, #0
	movs r1, #3
	bl Text_SetColor
	adds r0, r4, #0
	movs r1, #0
	bl Text_SetCursor
	ldr r0, [sp, #0x1c]
	cmp r0, #0
	beq .L08095620
	cmp r6, #1
	bne .L08095620
	ldr r0, [sp, #0x20]
	adds r0, #8
	ldr r1, .L0809561C @ =gUnk_0835C824
	bl Text_DrawString
	b .L08095628
	.align 2, 0
.L080955E8: .4byte gUnk_086905F8
.L080955EC: .4byte gDispIo
.L080955F0: .4byte Img_MonologueBG
.L080955F4: .4byte gUnk_0835AB08
.L080955F8: .4byte gBg3Tm
.L080955FC: .4byte gUnk_0835AB28
.L08095600: .4byte gUnk_0835A3E8
.L08095604: .4byte gUnk_0835A5D0
.L08095608: .4byte gBg2Tm
.L0809560C: .4byte gUnk_0835A5F0
.L08095610: .4byte gBg0Tm
.L08095614: .4byte gUnk_08690A99
.L08095618: .4byte 0x0200FF24
.L0809561C: .4byte gUnk_0835C824
.L08095620:
	ldr r1, [r5]
	adds r0, r4, #0
	bl Text_DrawString
.L08095628:
	adds r0, r4, #0
	mov r1, r8
	bl PutText
	ldr r1, [sp, #0x24]
	adds r0, r1, r6
	ldrb r2, [r0]
	mov r0, sb
	movs r1, #0
	bl PutNumber
	movs r2, #0x80
	add sb, r2
	add r8, r2
	adds r4, #8
	adds r5, #4
	adds r6, #1
	cmp r6, #5
	ble .L080955B2
	movs r5, #0
	adds r0, r7, #0
	bl func_fe6_08095D2C
	str r0, [r7, #0x40]
	movs r0, #0x80
	lsls r0, r0, #1
	movs r1, #2
	movs r2, #0
	bl InitTalk
	bl SetInitTalkTextFont
	bl ClearTalkText
	bl EndTalk
	ldr r1, .L08095800 @ =gUnk_086905B0
	mov r3, sl
	ldrb r3, [r3]
	lsls r0, r3, #1
	adds r0, r0, r1
	ldrh r2, [r0]
	movs r0, #2
	movs r1, #0xf
	bl StartTalkMsg
	movs r0, #0
	bl SetTalkPrintColor
	movs r0, #1
	bl SetTalkFlag
	movs r0, #2
	bl SetTalkFlag
	movs r0, #4
	bl SetTalkFlag
	movs r0, #8
	bl SetTalkFlag
	movs r0, #0x40
	bl SetTalkFlag
	movs r0, #4
	bl SetTalkPrintDelay
	ldr r0, .L08095804 @ =0x02000400
	movs r2, #0
	movs r1, #0x82
	lsls r1, r1, #1
	strh r1, [r0, #2]
	movs r1, #0x58
	strh r1, [r0, #4]
	ldr r1, .L08095808 @ =gUnk_0869058C
	mov r4, sl
	ldrb r4, [r4]
	adds r1, r4, r1
	ldrb r1, [r1]
	strh r1, [r0, #6]
	movs r1, #6
	strh r1, [r0, #8]
	strb r2, [r0, #1]
	movs r4, #1
	strh r4, [r0, #0xa]
	movs r1, #0xc0
	lsls r1, r1, #1
	strh r1, [r0, #0xc]
	movs r1, #2
	strh r1, [r0, #0xe]
	ldr r1, .L0809580C @ =0x02000434
	str r1, [r0, #0x18]
	ldr r1, .L08095810 @ =0x02002434
	str r1, [r0, #0x20]
	ldr r1, .L08095814 @ =0x02007C34
	str r1, [r0, #0x1c]
	ldr r1, .L08095818 @ =0x02007CD4
	str r1, [r0, #0x24]
	ldr r2, .L0809581C @ =0x0200A6D4
	str r2, [r0, #0x2c]
	ldr r3, .L08095820 @ =gUnk_086909A4
	mov r6, sl
	ldrb r6, [r6]
	lsls r1, r6, #2
	mov r7, sl
	ldrb r7, [r7]
	adds r1, r1, r7
	adds r1, r1, r3
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	strh r1, [r2]
	mov r6, sl
	ldrb r6, [r6]
	lsls r1, r6, #2
	mov r7, sl
	ldrb r7, [r7]
	adds r1, r1, r7
	adds r1, #1
	adds r1, r1, r3
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	strh r1, [r2, #2]
	mov r6, sl
	ldrb r6, [r6]
	lsls r1, r6, #2
	mov r7, sl
	ldrb r7, [r7]
	adds r1, r1, r7
	adds r1, #2
	adds r1, r1, r3
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	strh r1, [r2, #4]
	mov r6, sl
	ldrb r6, [r6]
	lsls r1, r6, #2
	mov r7, sl
	ldrb r7, [r7]
	adds r1, r1, r7
	adds r1, #3
	adds r1, r1, r3
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	strh r1, [r2, #6]
	mov r6, sl
	ldrb r6, [r6]
	lsls r1, r6, #2
	mov r7, sl
	ldrb r7, [r7]
	adds r1, r1, r7
	adds r1, #4
	adds r1, r1, r3
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	strh r1, [r2, #8]
	movs r1, #0xa0
	lsls r1, r1, #2
	strh r1, [r2, #0xe]
	movs r3, #0xf
	strh r3, [r2, #0x10]
	subs r1, #0x80
	strh r1, [r2, #0xa]
	strh r3, [r2, #0xc]
	strh r4, [r2, #0x12]
	ldr r1, .L08095824 @ =gBg1Tm
	str r1, [r2, #0x14]
	ldr r1, .L08095828 @ =0x0200A6FC
	str r1, [r2, #0x18]
	ldr r1, .L0809582C @ =0x0200C6FC
	str r1, [r2, #0x1c]
	ldr r1, .L08095830 @ =0x0200CEFC
	str r1, [r2, #0x20]
	ldr r1, .L08095834 @ =func_fe6_0809525C
	str r1, [r2, #0x24]
	bl NewEkrUnitMainMini
	ldr r4, .L08095838 @ =0x0200DEFC
	ldr r1, .L0809583C @ =gUnk_08690A53
	mov r2, sl
	ldrb r2, [r2]
	lsls r0, r2, #1
	adds r0, r0, r1
	ldrb r0, [r0]
	strh r0, [r4]
	movs r0, #0xa
	strh r0, [r4, #2]
	movs r0, #0xe0
	lsls r0, r0, #2
	strh r0, [r4, #4]
	mov r3, sl
	ldrb r3, [r3]
	lsls r0, r3, #1
	adds r1, #1
	adds r0, r0, r1
	ldrb r0, [r0]
	strh r0, [r4, #6]
	movs r0, #0xb
	strh r0, [r4, #8]
	movs r0, #0xf0
	lsls r0, r0, #2
	strh r0, [r4, #0xa]
	strh r5, [r4, #0xc]
	ldr r0, .L08095840 @ =0x0000FFFF
	strh r0, [r4, #0xe]
	ldr r0, .L08095844 @ =0x06010000
	str r0, [r4, #0x1c]
	ldr r0, .L08095848 @ =0x0200DF24
	str r0, [r4, #0x20]
	adds r0, r4, #0
	bl EkrMainMini_PutTerrainfx
	movs r3, #0x98
	lsls r3, r3, #1
	movs r0, #0x68
	str r0, [sp]
	adds r0, r4, #0
	movs r1, #0xd0
	movs r2, #0x68
	bl func_fe6_0804C318
	ldr r0, .L0809584C @ =func_fe6_080951FC
	bl SetOnHBlankA
	add sp, #0x38
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08095800: .4byte gUnk_086905B0
.L08095804: .4byte 0x02000400
.L08095808: .4byte gUnk_0869058C
.L0809580C: .4byte 0x02000434
.L08095810: .4byte 0x02002434
.L08095814: .4byte 0x02007C34
.L08095818: .4byte 0x02007CD4
.L0809581C: .4byte 0x0200A6D4
.L08095820: .4byte gUnk_086909A4
.L08095824: .4byte gBg1Tm
.L08095828: .4byte 0x0200A6FC
.L0809582C: .4byte 0x0200C6FC
.L08095830: .4byte 0x0200CEFC
.L08095834: .4byte func_fe6_0809525C
.L08095838: .4byte 0x0200DEFC
.L0809583C: .4byte gUnk_08690A53
.L08095840: .4byte 0x0000FFFF
.L08095844: .4byte 0x06010000
.L08095848: .4byte 0x0200DF24
.L0809584C: .4byte func_fe6_080951FC

	thumb_func_start func_fe6_08095850
func_fe6_08095850: @ 0x08095850
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r7, r0, #0
	adds r5, r7, #0
	adds r5, #0x44
	movs r0, #0x50
	ldrh r1, [r7, #0x2a]
	subs r0, r0, r1
	movs r1, #0xe
	bl __divsi3
	adds r0, #1
	ldrb r1, [r5]
	subs r0, r1, r0
	strb r0, [r5]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xb3
	bhi .L08095882
	movs r0, #0xb4
	strb r0, [r5]
.L08095882:
	ldr r0, .L08095934 @ =gDispIo
	mov ip, r0
	movs r2, #1
	ldrb r0, [r0, #1]
	orrs r0, r2
	movs r1, #2
	mov r8, r1
	mov r1, r8
	orrs r0, r1
	movs r1, #4
	mov sl, r1
	mov r1, sl
	orrs r0, r1
	movs r1, #8
	mov sb, r1
	mov r1, sb
	orrs r0, r1
	movs r4, #0x10
	orrs r0, r4
	movs r1, #0x20
	orrs r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	mov r1, ip
	strb r0, [r1, #1]
	mov r0, ip
	adds r0, #0x2d
	movs r1, #0
	strb r1, [r0]
	ldrh r6, [r7, #0x2a]
	adds r1, r6, #0
	movs r0, #0x50
	subs r0, r0, r1
	mov r3, ip
	adds r3, #0x31
	strb r0, [r3]
	subs r3, #5
	movs r0, #0xf0
	strb r0, [r3]
	adds r1, #0x50
	mov r0, ip
	adds r0, #0x30
	strb r1, [r0]
	adds r0, #4
	ldrb r1, [r0]
	orrs r2, r1
	mov r1, r8
	orrs r2, r1
	mov r1, sl
	orrs r2, r1
	mov r1, sb
	orrs r2, r1
	orrs r2, r4
	strb r2, [r0]
	mov r2, ip
	adds r2, #0x36
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #2
	ands r0, r1
	subs r1, #4
	ands r0, r1
	subs r1, #8
	ands r0, r1
	strb r0, [r2]
	lsls r0, r6, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x50
	bne .L08095938
	movs r0, #0xb4
	strb r0, [r5]
	movs r0, #0
	strh r0, [r7, #0x2a]
	adds r0, r7, #0
	bl Proc_Break
	ldr r0, [r7, #0x40]
	bl func_fe6_08095D48
	b .L0809593C
	.align 2, 0
.L08095934: .4byte gDispIo
.L08095938:
	adds r0, r6, #4
	strh r0, [r7, #0x2a]
.L0809593C:
	ldr r0, .L08095974 @ =0x02000400
	adds r4, r7, #0
	adds r4, #0x44
	ldrb r1, [r4]
	movs r2, #0x58
	bl EkrMainMini_SetAnimPosition
	ldr r0, .L08095978 @ =0x0200DEFC
	ldrb r3, [r4]
	adds r1, r3, #0
	subs r1, #0x30
	adds r3, #0x30
	movs r2, #0x68
	str r2, [sp]
	bl func_fe6_0804C318
	ldr r0, [r7, #0x40]
	movs r1, #0x78
	bl func_fe6_08095D40
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08095974: .4byte 0x02000400
.L08095978: .4byte 0x0200DEFC

	thumb_func_start func_fe6_0809597C
func_fe6_0809597C: @ 0x0809597C
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	movs r6, #0
	ldrh r1, [r4, #0x2c]
	ldr r0, .L08095994 @ =0x0000018F
	cmp r1, r0
	bls .L08095998
	ldr r0, [r4, #0x34]
	adds r0, #0x2c
	movs r1, #2
	strb r1, [r0]
	b .L080959E8
	.align 2, 0
.L08095994: .4byte 0x0000018F
.L08095998:
	ldrh r2, [r4, #0x2a]
	adds r2, #1
	strh r2, [r4, #0x2a]
	adds r0, r1, #1
	strh r0, [r4, #0x2c]
	ldr r1, .L08095A18 @ =gUnk_086905F8
	ldrh r3, [r4, #0x2e]
	lsls r0, r3, #2
	adds r1, r0, r1
	ldrb r0, [r1, #1]
	cmp r0, #0
	beq .L080959E8
	adds r1, r0, #0
	lsls r0, r2, #0x10
	lsrs r0, r0, #0x10
	cmp r0, r1
	bhi .L080959EC
	cmp r1, #0xff
	bne .L080959E8
	adds r5, r4, #0
	adds r5, #0x3e
	ldrb r0, [r5]
	cmp r0, #0
	beq .L080959DA
	ldr r0, .L08095A1C @ =0x02000400
	bl EkrMainMini_CheckBlocking
	lsls r0, r0, #0x18
	cmp r0, #0
	bne .L080959EC
	ldrb r0, [r5]
	cmp r0, #0
	bne .L080959E8
.L080959DA:
	ldr r0, .L08095A1C @ =0x02000400
	bl EkrMainMini_CheckDone
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L080959E8
	movs r6, #1
.L080959E8:
	cmp r6, #0
	beq .L08095A62
.L080959EC:
	ldrh r0, [r4, #0x2e]
	adds r0, #1
	strh r0, [r4, #0x2e]
	ldr r7, .L08095A18 @ =gUnk_086905F8
	lsls r0, r0, #2
	adds r1, r0, r7
	ldrb r0, [r1, #1]
	cmp r0, #0
	beq .L08095A62
	ldrb r2, [r1]
	cmp r2, #0xff
	bne .L08095A20
	ldr r0, .L08095A1C @ =0x02000400
	bl EkrMainMini_EndBlock
	adds r1, r4, #0
	adds r1, #0x3e
	movs r0, #0
	strb r0, [r1]
	adds r6, r4, #0
	adds r6, #0x30
	b .L08095A52
	.align 2, 0
.L08095A18: .4byte gUnk_086905F8
.L08095A1C: .4byte 0x02000400
.L08095A20:
	adds r0, r4, #0
	adds r0, #0x30
	adds r6, r0, #0
	ldrb r0, [r6]
	cmp r0, r2
	beq .L08095A52
	ldr r5, .L08095A68 @ =0x02000400
	ldrb r0, [r1]
	strh r0, [r5, #8]
	adds r0, r5, #0
	bl EkrMainMini_UpdateAnim
	ldrh r1, [r4, #0x2e]
	lsls r0, r1, #2
	adds r0, r0, r7
	ldrb r0, [r0]
	cmp r0, #4
	bne .L08095A4A
	adds r0, r5, #0
	bl EkrMainMini_EndBlock
.L08095A4A:
	adds r1, r4, #0
	adds r1, #0x3e
	movs r0, #1
	strb r0, [r1]
.L08095A52:
	ldr r1, .L08095A6C @ =gUnk_086905F8
	ldrh r2, [r4, #0x2e]
	lsls r0, r2, #2
	adds r0, r0, r1
	ldrb r0, [r0]
	movs r1, #0
	strb r0, [r6]
	strh r1, [r4, #0x2a]
.L08095A62:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08095A68: .4byte 0x02000400
.L08095A6C: .4byte gUnk_086905F8

	thumb_func_start func_fe6_08095A70
func_fe6_08095A70: @ 0x08095A70
	bx lr
	.align 2, 0

	thumb_func_start func_fe6_08095A74
func_fe6_08095A74: @ 0x08095A74
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0
	bl SetOnHBlankA
	bl EndTalk
	bl EndActiveClassReelBgColorProc
	ldr r0, .L08095AB0 @ =0x0200DEFC
	bl func_fe6_0804C2EC
	bl EndActiveClassReelSpell
	ldr r0, .L08095AB4 @ =0x02000400
	bl EndEkrMainMini
	ldr r0, [r4, #0x40]
	cmp r0, #0
	beq .L08095AA2
	movs r1, #4
	bl Proc_Goto
.L08095AA2:
	ldr r1, [r4, #0x34]
	movs r0, #0
	str r0, [r1, #0x38]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08095AB0: .4byte 0x0200DEFC
.L08095AB4: .4byte 0x02000400

	thumb_func_start StartClassAnimDisplay
StartClassAnimDisplay: @ 0x08095AB8
	push {r4, r5, lr}
	adds r5, r0, #0
	lsls r4, r1, #0x18
	lsrs r4, r4, #0x18
	ldr r0, .L08095ADC @ =gUnk_0868FFCC
	adds r1, r5, #0
	bl SpawnProc
	adds r2, r0, #0
	adds r2, #0x31
	movs r1, #0
	strb r4, [r2]
	str r5, [r0, #0x34]
	str r1, [r0, #0x40]
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
.L08095ADC: .4byte gUnk_0868FFCC

	thumb_func_start func_fe6_08095AE0
func_fe6_08095AE0: @ 0x08095AE0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	mov ip, r0
	ldr r0, [r0, #0x14]
	mov r1, ip
	str r0, [r1, #0x30]
	movs r1, #0
	movs r0, #0
	mov r2, ip
	strh r0, [r2, #0x2a]
	adds r2, #0x42
	strb r1, [r2]
	mov r1, ip
	adds r1, #0x43
	movs r0, #0xfa
	strb r0, [r1]
	movs r4, #0
	ldr r0, .L08095B48 @ =gUnk_08690D44
	mov sb, r0
	movs r1, #0x34
	add r1, ip
	mov r8, r1
	adds r7, r2, #0
	mov sl, sb
.L08095B16:
	lsls r0, r4, #2
	ldr r2, .L08095B4C @ =0x0200FF54
	adds r0, r0, r2
	movs r1, #0
	strb r1, [r0]
	strb r1, [r0, #1]
	mov r1, ip
	ldr r0, [r1, #0x30]
	adds r0, #0x31
	ldrb r0, [r0]
	lsls r3, r0, #2
	mov r2, sb
	adds r0, r3, r2
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne .L08095B64
	mov r0, r8
	adds r1, r0, r4
	movs r0, #0xff
	strb r0, [r1]
	b .L08095B98
	.align 2, 0
.L08095B48: .4byte gUnk_08690D44
.L08095B4C: .4byte 0x0200FF54
.L08095B50:
	mov r1, r8
	adds r0, r1, r4
	strb r5, [r0]
	ldrb r2, [r3, #6]
	ldrb r1, [r3, #5]
	subs r0, r2, r1
	ldrb r2, [r7]
	adds r0, r2, r0
	strb r0, [r7]
	b .L08095B92
.L08095B64:
	movs r5, #0
	ldr r1, .L08095BBC @ =gUnk_08690C14
	ldr r0, [r1]
	adds r6, r4, #1
	cmp r0, #0
	beq .L08095B92
	mov r2, sl
	adds r0, r3, r2
	ldr r0, [r0]
	adds r0, r0, r4
	movs r2, #0
	ldrsb r2, [r0, r2]
	adds r3, r1, #0
.L08095B7E:
	movs r0, #4
	ldrsb r0, [r3, r0]
	cmp r0, r2
	beq .L08095B50
	adds r1, #8
	adds r3, #8
	adds r5, #1
	ldr r0, [r1]
	cmp r0, #0
	bne .L08095B7E
.L08095B92:
	adds r4, r6, #0
	cmp r4, #0xd
	ble .L08095B16
.L08095B98:
	ldr r1, .L08095BC0 @ =0x06010000
	ldr r0, .L08095BC4 @ =gUnk_0835B040
	bl Decompress
	ldr r0, .L08095BC8 @ =gUnk_0835C034
	movs r1, #0xa0
	lsls r1, r1, #2
	movs r2, #0x40
	bl ApplyPaletteExt
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08095BBC: .4byte gUnk_08690C14
.L08095BC0: .4byte 0x06010000
.L08095BC4: .4byte gUnk_0835B040
.L08095BC8: .4byte gUnk_0835C034

	thumb_func_start func_fe6_08095BCC
func_fe6_08095BCC: @ 0x08095BCC
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
	ldr r0, .L08095D20 @ =gUnk_0869006C
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
	ldr r3, .L08095D20 @ =gUnk_0869006C
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
	ldr r5, .L08095D24 @ =gUnk_08690C14
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
.L08095D20: .4byte gUnk_0869006C
.L08095D24: .4byte gUnk_08690C14

	thumb_func_start func_fe6_08095D28
func_fe6_08095D28: @ 0x08095D28
	bx lr
	.align 2, 0

	thumb_func_start func_fe6_08095D2C
func_fe6_08095D2C: @ 0x08095D2C
	push {lr}
	adds r1, r0, #0
	ldr r0, .L08095D3C @ =gUnk_08690014
	bl SpawnProc
	pop {r1}
	bx r1
	.align 2, 0
.L08095D3C: .4byte gUnk_08690014

	thumb_func_start func_fe6_08095D40
func_fe6_08095D40: @ 0x08095D40
	adds r0, #0x43
	strb r1, [r0]
	bx lr
	.align 2, 0

	thumb_func_start func_fe6_08095D48
func_fe6_08095D48: @ 0x08095D48
	ldr r0, .L08095D54 @ =0x0200FF54
	movs r1, #0x80
	strb r1, [r0]
	movs r1, #2
	strb r1, [r0, #1]
	bx lr
	.align 2, 0
.L08095D54: .4byte 0x0200FF54

	thumb_func_start func_fe6_08095D58
func_fe6_08095D58: @ 0x08095D58
	bx lr
	.align 2, 0
