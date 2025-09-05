	.include "macro.inc"

	.syntax unified

	thumb_func_start OpInfoEnter_Init
OpInfoEnter_Init: @ 0x080949B8
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
	ldr r2, .L08094A08 @ =Sprites_OpInfo_08690288
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
.L08094A08: .4byte Sprites_OpInfo_08690288
.L08094A0C:
	movs r4, #0
	movs r3, #0
	mov sb, r2
	adds r1, r5, #0
	adds r1, #0x2f
	ldr r0, .L08094A78 @ =Sprites_OpInfo_08690288
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
	ldr r0, .L08094A7C @ =Img_OpInfoViewLettersA
	ldr r1, .L08094A80 @ =0x06010000
	bl Decompress
	b .L08094A8C
	.align 2, 0
.L08094A78: .4byte Sprites_OpInfo_08690288
.L08094A7C: .4byte Img_OpInfoViewLettersA
.L08094A80: .4byte 0x06010000
.L08094A84:
	ldr r0, .L08094B0C @ =Img_OpInfoViewLettersB
	ldr r1, .L08094B10 @ =0x06010000
	bl Decompress
.L08094A8C:
	ldr r0, .L08094B14 @ =Pal_OpInfoViewLetters
	movs r1, #0x80
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r4, .L08094B18 @ =Pal_OpInfoViewIcon
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
	ldr r0, .L08094B1C @ =Img_OpInfoViewIcon
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
	bl NewOpInfoView
	str r0, [r5, #0x34]
	mov r0, sb
	ldrb r1, [r0]
	adds r0, r5, #0
	bl NewOpInfoIcon
	str r0, [r5, #0x5c]
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08094B0C: .4byte Img_OpInfoViewLettersB
.L08094B10: .4byte 0x06010000
.L08094B14: .4byte Pal_OpInfoViewLetters
.L08094B18: .4byte Pal_OpInfoViewIcon
.L08094B1C: .4byte Img_OpInfoViewIcon
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

	thumb_func_start OpInfoEnter_Loop_In
OpInfoEnter_Loop_In: @ 0x08094B80
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
	bl NewOpInfoView
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

	thumb_func_start OpInfoEnter_Loop_Out
OpInfoEnter_Loop_Out: @ 0x08094BE0
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

	thumb_func_start OpInfoEnter_OnEnd
OpInfoEnter_OnEnd: @ 0x08094C50
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

	thumb_func_start NewOpInfoEnter
NewOpInfoEnter: @ 0x08094C80
	push {r4, r5, lr}
	adds r5, r0, #0
	lsls r4, r1, #0x18
	lsrs r4, r4, #0x18
	ldr r0, .L08094CB4 @ =ProcScr_OpInfoEnter
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
.L08094CB4: .4byte ProcScr_OpInfoEnter

	thumb_func_start OpInfoView_Init
OpInfoView_Init: @ 0x08094CB8
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

	thumb_func_start OpInfoView_Loop_FadeIn
OpInfoView_Loop_FadeIn: @ 0x08094CEC
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
	bl PutOpInfoViewLetter
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
	bl PutOpInfoViewLetter
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

	thumb_func_start OpInfoView_Loop_Display
OpInfoView_Loop_Display: @ 0x08094E20
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
	bl PutOpInfoViewLetter
	strh r5, [r4, #0x2a]
	add sp, #0xc
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start OpInfoView_Loop_FadeOut
OpInfoView_Loop_FadeOut: @ 0x08094E4C
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
	bl PutOpInfoViewLetter
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

	thumb_func_start NewOpInfoView
NewOpInfoView: @ 0x08094EE8
	push {r4, lr}
	adds r2, r0, #0
	lsls r4, r1, #0x18
	lsrs r4, r4, #0x18
	ldr r0, .L08094F04 @ =ProcScr_OpInfoView
	adds r1, r2, #0
	bl SpawnProc
	adds r1, r0, #0
	adds r1, #0x2e
	strb r4, [r1]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
.L08094F04: .4byte ProcScr_OpInfoView

	thumb_func_start func_fe6_08094F08
func_fe6_08094F08: @ 0x08094F08
	push {lr}
	bl EnablePalSync
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start OpInfoIcon_Init
OpInfoIcon_Init: @ 0x08094F14
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
	ldr r1, .L08094F90 @ =gClassDemoData
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
.L08094F90: .4byte gClassDemoData

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
	ldr r4, .L08094FF4 @ =Sprite_OpInfo_086900F8
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
.L08094FF4: .4byte Sprite_OpInfo_086900F8
.L08094FF8:
	str r7, [sp]
	movs r0, #4
	adds r1, r4, #0
	movs r2, #0x48
	ldr r3, .L0809502C @ =Sprite_OpInfo_086900F0
	bl PutSpriteExt
	str r7, [sp]
	movs r0, #4
	adds r1, r6, #0
	movs r2, #0x48
	ldr r3, .L08095030 @ =Sprite_OpInfo_08690100
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
.L0809502C: .4byte Sprite_OpInfo_086900F0
.L08095030: .4byte Sprite_OpInfo_08690100

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
	ldr r6, .L080950F4 @ =Sprites_OpInfo_086900BC
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
	ldr r3, .L080950FC @ =Sprite_OpInfo_086900DC
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
.L080950F4: .4byte Sprites_OpInfo_086900BC
.L080950F8: .4byte 0x000001FF
.L080950FC: .4byte Sprite_OpInfo_086900DC

	thumb_func_start OpInfoIcon_Loop_FadeIn
OpInfoIcon_Loop_FadeIn: @ 0x08095100
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

	thumb_func_start OpInfoIcon_LoopA
OpInfoIcon_LoopA: @ 0x08095138
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

	thumb_func_start OpInfoIcon_LoopB
OpInfoIcon_LoopB: @ 0x0809517C
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

	thumb_func_start OpInfoIcon_Loop_FadeOut
OpInfoIcon_Loop_FadeOut: @ 0x080951A4
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

	thumb_func_start NewOpInfoIcon
NewOpInfoIcon: @ 0x080951DC
	push {r4, lr}
	adds r2, r0, #0
	lsls r4, r1, #0x18
	lsrs r4, r4, #0x18
	ldr r0, .L080951F8 @ =ProcScr_OpInfoIcon
	adds r1, r2, #0
	bl SpawnProc
	adds r1, r0, #0
	adds r1, #0x2c
	strb r4, [r1]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
.L080951F8: .4byte ProcScr_OpInfoIcon
