	.include "macro.inc"

	.syntax unified

	thumb_func_start GetSelectedGameOption
GetSelectedGameOption: @ 0x0808C340
	ldr r0, .L0808C34C @ =gpUiConfigSt
	ldr r0, [r0]
	ldrh r0, [r0, #0x2a]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bx lr
	.align 2, 0
.L0808C34C: .4byte gpUiConfigSt

	thumb_func_start GetSelectedOptionValue
GetSelectedOptionValue: @ 0x0808C350
	push {lr}
	ldr r1, .L0808C378 @ =gUnk_0868AAE4
	ldr r0, .L0808C37C @ =gpUiConfigSt
	ldr r2, [r0]
	movs r3, #0x32
	ldrsh r0, [r2, r3]
	lsls r0, r0, #3
	adds r1, #4
	adds r0, r0, r1
	movs r3, #0x2a
	ldrsh r1, [r2, r3]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	bl GetGameOption
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r1}
	bx r1
	.align 2, 0
.L0808C378: .4byte gUnk_0868AAE4
.L0808C37C: .4byte gpUiConfigSt

	thumb_func_start func_fe6_0808C380
func_fe6_0808C380: @ 0x0808C380
	push {lr}
	ldr r0, .L0808C38C @ =gUnk_0868AB22
	bl InitBgs
	pop {r0}
	bx r0
	.align 2, 0
.L0808C38C: .4byte gUnk_0868AB22

	thumb_func_start StartMuralBackgroundExt
StartMuralBackgroundExt: @ 0x0808C390
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	ldr r4, .L0808C410 @ =gBg3Tm
	cmp r5, #0
	bne .L0808C3AA
	movs r0, #3
	bl GetBgChrOffset
	movs r1, #0xc0
	lsls r1, r1, #0x13
	adds r5, r0, r1
.L0808C3AA:
	cmp r6, #0
	bge .L0808C3B0
	movs r6, #0xe
.L0808C3B0:
	ldr r0, .L0808C414 @ =Img_MuralBackground
	adds r1, r5, #0
	bl Decompress
	ldr r0, .L0808C418 @ =Pal_MuralBackground
	lsls r1, r6, #5
	movs r2, #0x40
	bl ApplyPaletteExt
	movs r0, #3
	bl GetBgChrOffset
	subs r0, r5, r0
	lsls r0, r0, #0xf
	lsrs r0, r0, #0x14
	movs r1, #0xf
	ands r1, r6
	lsls r1, r1, #0xc
	adds r1, r0, r1
	movs r2, #0
	ldr r3, .L0808C41C @ =0x0000027F
.L0808C3DA:
	adds r0, r2, r1
	strh r0, [r4]
	adds r4, #2
	adds r2, #1
	cmp r2, r3
	ble .L0808C3DA
	ldr r4, .L0808C420 @ =gBg3Tm+0xC0
	ldr r3, .L0808C424 @ =ProcScr_BackgroundSlide
	movs r5, #0x80
	lsls r5, r5, #5
	adds r1, r5, #0
	movs r2, #0xe0
	lsls r2, r2, #1
.L0808C3F4:
	ldrh r5, [r4]
	adds r0, r1, r5
	strh r0, [r4]
	adds r4, #2
	subs r2, #1
	cmp r2, #0
	bne .L0808C3F4
	adds r0, r3, #0
	adds r1, r7, #0
	bl SpawnProc
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0808C410: .4byte gBg3Tm
.L0808C414: .4byte Img_MuralBackground
.L0808C418: .4byte Pal_MuralBackground
.L0808C41C: .4byte 0x0000027F
.L0808C420: .4byte gBg3Tm+0xC0
.L0808C424: .4byte ProcScr_BackgroundSlide

	thumb_func_start DrawGameOptionIcon
DrawGameOptionIcon: @ 0x0808C428
	push {r4, r5, lr}
	lsls r3, r0, #1
	adds r3, r3, r1
	lsls r3, r3, #5
	ldr r4, .L0808C490 @ =gUnk_0868AB3C
	ldr r2, .L0808C494 @ =gUnk_0868AAE4
	ldr r1, .L0808C498 @ =gpUiConfigSt
	ldr r1, [r1]
	movs r5, #0x32
	ldrsh r1, [r1, r5]
	lsls r1, r1, #3
	adds r2, #4
	adds r1, r1, r2
	ldr r1, [r1]
	adds r1, r1, r0
	movs r0, #0x2c
	ldrb r1, [r1]
	muls r0, r1, r0
	adds r0, r0, r4
	adds r0, #0x24
	ldrb r2, [r0]
	movs r1, #0x84
	lsls r1, r1, #7
	adds r1, r2, r1
	ldr r4, .L0808C49C @ =gBg2Tm
	adds r0, r3, #2
	lsls r0, r0, #1
	adds r0, r0, r4
	strh r1, [r0]
	adds r0, r3, #3
	lsls r0, r0, #1
	adds r0, r0, r4
	ldr r5, .L0808C4A0 @ =0x00004201
	adds r1, r2, r5
	strh r1, [r0]
	adds r0, r3, #0
	adds r0, #0x22
	lsls r0, r0, #1
	adds r0, r0, r4
	adds r5, #0x1f
	adds r1, r2, r5
	strh r1, [r0]
	adds r3, #0x23
	lsls r3, r3, #1
	adds r3, r3, r4
	ldr r0, .L0808C4A4 @ =0x00004221
	adds r2, r2, r0
	strh r2, [r3]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0808C490: .4byte gUnk_0868AB3C
.L0808C494: .4byte gUnk_0868AAE4
.L0808C498: .4byte gpUiConfigSt
.L0808C49C: .4byte gBg2Tm
.L0808C4A0: .4byte 0x00004201
.L0808C4A4: .4byte 0x00004221

	thumb_func_start func_fe6_0808C4A8
func_fe6_0808C4A8: @ 0x0808C4A8
	push {r4, r5, r6, lr}
	sub sp, #8
	ldr r4, .L0808C504 @ =gpUiConfigSt
	ldr r0, [r4]
	adds r0, #0xa8
	bl ClearText
	ldr r5, .L0808C508 @ =gUnk_0868AB3C
	bl GetSelectedOptionValue
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x15
	ldr r2, .L0808C50C @ =gUnk_0868AAE4
	ldr r3, [r4]
	movs r6, #0x32
	ldrsh r1, [r3, r6]
	lsls r1, r1, #3
	adds r2, #4
	adds r1, r1, r2
	movs r6, #0x2a
	ldrsh r2, [r3, r6]
	ldr r1, [r1]
	adds r1, r1, r2
	movs r2, #0x2c
	ldrb r1, [r1]
	muls r1, r2, r1
	adds r0, r0, r1
	adds r0, r0, r5
	ldrh r0, [r0, #4]
	bl DecodeMsg
	adds r3, r0, #0
	ldr r0, [r4]
	adds r0, #0xa8
	ldr r1, .L0808C510 @ =gBg0Tm+0x448
	movs r2, #0x16
	str r2, [sp]
	str r3, [sp, #4]
	movs r2, #0
	movs r3, #0
	bl PutDrawText
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L0808C504: .4byte gpUiConfigSt
.L0808C508: .4byte gUnk_0868AB3C
.L0808C50C: .4byte gUnk_0868AAE4
.L0808C510: .4byte gBg0Tm+0x448

	thumb_func_start DrawGameOptionText
DrawGameOptionText: @ 0x0808C514
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #8
	mov r8, r0
	adds r4, r1, #0
	adds r5, r2, #0
	ldr r6, .L0808C57C @ =gpUiConfigSt
	lsls r4, r4, #3
	adds r4, #0x38
	ldr r0, [r6]
	adds r0, r0, r4
	bl ClearText
	ldr r2, .L0808C580 @ =gUnk_0868AB3C
	ldr r1, .L0808C584 @ =gUnk_0868AAE4
	ldr r0, [r6]
	movs r3, #0x32
	ldrsh r0, [r0, r3]
	lsls r0, r0, #3
	adds r1, #4
	adds r0, r0, r1
	ldr r0, [r0]
	add r0, r8
	movs r1, #0x2c
	ldrb r0, [r0]
	muls r0, r1, r0
	adds r0, r0, r2
	ldrh r0, [r0]
	bl DecodeMsg
	adds r2, r0, #0
	ldr r0, [r6]
	adds r0, r0, r4
	lsls r5, r5, #6
	ldr r1, .L0808C588 @ =gBg2Tm+0x8
	adds r5, r5, r1
	movs r1, #9
	str r1, [sp]
	str r2, [sp, #4]
	adds r1, r5, #0
	movs r2, #0
	movs r3, #0
	bl PutDrawText
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L0808C57C: .4byte gpUiConfigSt
.L0808C580: .4byte gUnk_0868AB3C
.L0808C584: .4byte gUnk_0868AAE4
.L0808C588: .4byte gBg2Tm+0x8

	thumb_func_start DrawOptionValueTexts
DrawOptionValueTexts: @ 0x0808C58C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	adds r3, r0, #0
	str r1, [sp]
	str r2, [sp, #4]
	ldr r2, .L0808C658 @ =gUnk_0868AAE4
	ldr r0, .L0808C65C @ =gpUiConfigSt
	ldr r0, [r0]
	movs r4, #0x32
	ldrsh r1, [r0, r4]
	lsls r1, r1, #3
	adds r2, #4
	adds r1, r1, r2
	ldr r1, [r1]
	adds r1, r1, r3
	ldrb r1, [r1]
	mov sb, r1
	ldr r2, .L0808C660 @ =gUnk_0868AB3C
	movs r1, #0x2c
	mov r3, sb
	muls r3, r1, r3
	adds r1, r3, #0
	adds r4, r1, r2
	ldrb r1, [r4, #8]
	lsrs r1, r1, #3
	str r1, [sp, #8]
	ldr r2, [sp]
	lsls r1, r2, #3
	adds r5, r1, #0
	adds r5, #0x70
	adds r0, r0, r5
	bl ClearText
	movs r3, #0
	mov r8, r3
	ldrh r0, [r4, #6]
	cmp r0, #0
	beq .L0808C628
	mov sl, r5
.L0808C5E2:
	ldr r0, .L0808C65C @ =gpUiConfigSt
	ldr r0, [r0]
	mov r1, sl
	adds r7, r0, r1
	ldrb r6, [r4, #8]
	subs r6, #0x78
	mov r2, sb
	lsls r0, r2, #0x18
	lsrs r0, r0, #0x18
	bl GetGameOption
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r5, #1
	cmp r8, r0
	bne .L0808C604
	movs r5, #2
.L0808C604:
	ldrh r0, [r4, #6]
	bl DecodeMsg
	adds r3, r0, #0
	adds r0, r7, #0
	adds r1, r6, #0
	adds r2, r5, #0
	bl Text_InsertDrawString
	adds r4, #8
	movs r3, #1
	add r8, r3
	mov r0, r8
	cmp r0, #3
	bgt .L0808C628
	ldrh r0, [r4, #6]
	cmp r0, #0
	bne .L0808C5E2
.L0808C628:
	ldr r0, .L0808C65C @ =gpUiConfigSt
	ldr r2, [sp]
	lsls r1, r2, #3
	adds r1, #0x70
	ldr r0, [r0]
	adds r0, r0, r1
	ldr r3, [sp, #4]
	lsls r1, r3, #5
	ldr r4, [sp, #8]
	adds r1, r1, r4
	lsls r1, r1, #1
	ldr r2, .L0808C664 @ =gBg2Tm
	adds r1, r1, r2
	bl PutText
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0808C658: .4byte gUnk_0868AAE4
.L0808C65C: .4byte gpUiConfigSt
.L0808C660: .4byte gUnk_0868AB3C
.L0808C664: .4byte gBg2Tm

	thumb_func_start func_fe6_0808C668
func_fe6_0808C668: @ 0x0808C668
	push {lr}
	movs r0, #1
	movs r1, #0x12
	bl ApplyIconPalette
	movs r0, #0x80
	movs r1, #3
	bl UnpackUiVArrowGfx
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_fe6_0808C680
func_fe6_0808C680: @ 0x0808C680
	push {lr}
	bl GetSelectedGameOption
	lsls r0, r0, #0x18
	cmp r0, #0
	bne .L0808C6A2
	bl GetSelectedOptionValue
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #3
	bne .L0808C6A2
	movs r0, #0xc0
	movs r1, #0x20
	movs r2, #0x12
	bl PutSysAButton
.L0808C6A2:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start DrawConfigUiSprites
DrawConfigUiSprites: @ 0x0808C6A8
	push {r4, r5, r6, lr}
	ldr r1, .L0808C74C @ =gUnk_0868AAE4
	ldr r6, .L0808C750 @ =gpUiConfigSt
	ldr r2, [r6]
	movs r3, #0x32
	ldrsh r0, [r2, r3]
	lsls r0, r0, #3
	adds r1, #4
	adds r0, r0, r1
	movs r3, #0x2a
	ldrsh r1, [r2, r3]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r5, [r0]
	ldr r2, .L0808C754 @ =gUnk_0868AAFC
	movs r3, #0x83
	lsls r3, r3, #6
	movs r0, #0x22
	movs r1, #8
	bl PutOamHiRam
	ldr r0, [r6]
	movs r1, #0x2a
	ldrsh r4, [r0, r1]
	movs r2, #0x2c
	ldrsh r0, [r0, r2]
	subs r4, r4, r0
	lsls r4, r4, #4
	adds r4, #0x20
	movs r0, #0x10
	adds r1, r4, #0
	bl PutFrozenUiHand
	adds r0, r5, #0
	bl GetGameOption
	ldr r2, .L0808C758 @ =gUnk_0868AB3C
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x15
	movs r1, #0x2c
	muls r1, r5, r1
	adds r0, r0, r1
	adds r0, r0, r2
	ldrb r0, [r0, #8]
	subs r0, #2
	adds r1, r4, #0
	bl PutUiHand
	ldr r1, [r6]
	movs r3, #0x34
	ldrsh r0, [r1, r3]
	cmp r0, #6
	ble .L0808C746
	movs r2, #0x2c
	ldrsh r0, [r1, r2]
	cmp r0, #0
	beq .L0808C728
	movs r2, #0xc2
	lsls r2, r2, #6
	movs r0, #0x64
	movs r1, #0x1d
	movs r3, #1
	bl DisplayUiVArrow
.L0808C728:
	ldr r0, [r6]
	movs r3, #0x2c
	ldrsh r1, [r0, r3]
	movs r2, #0x34
	ldrsh r0, [r0, r2]
	subs r0, #6
	cmp r1, r0
	bge .L0808C746
	movs r2, #0xc2
	lsls r2, r2, #6
	movs r0, #0x64
	movs r1, #0x7d
	movs r3, #0
	bl DisplayUiVArrow
.L0808C746:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L0808C74C: .4byte gUnk_0868AAE4
.L0808C750: .4byte gpUiConfigSt
.L0808C754: .4byte gUnk_0868AAFC
.L0808C758: .4byte gUnk_0868AB3C

	thumb_func_start Config_Init
Config_Init: @ 0x0808C75C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	mov sb, r0
	ldr r0, .L0808C964 @ =gpUiConfigSt
	mov sl, r0
	ldr r0, [r0]
	movs r4, #0
	strh r4, [r0, #0x32]
	bl IsNotFirstPlaythrough
	cmp r0, #0
	beq .L0808C784
	mov r2, sl
	ldr r1, [r2]
	ldrh r0, [r1, #0x32]
	adds r0, #1
	strh r0, [r1, #0x32]
.L0808C784:
	mov r3, sl
	ldr r1, [r3]
	ldr r2, .L0808C968 @ =gUnk_0868AAE4
	movs r3, #0x32
	ldrsh r0, [r1, r3]
	lsls r0, r0, #3
	adds r0, r0, r2
	ldrb r0, [r0]
	strh r0, [r1, #0x34]
	strh r4, [r1, #0x2a]
	strh r4, [r1, #0x2c]
	mov r0, sb
	strh r4, [r0, #0x2e]
	strh r4, [r0, #0x30]
	adds r0, #0x36
	movs r1, #0
	strb r1, [r0]
	bl UnpackUiWindowFrameGraphics
	ldr r7, .L0808C96C @ =gDispIo
	movs r4, #1
	ldrb r0, [r7, #1]
	orrs r0, r4
	movs r2, #2
	mov r8, r2
	mov r3, r8
	orrs r0, r3
	movs r1, #4
	orrs r0, r1
	movs r6, #8
	orrs r0, r6
	movs r5, #0x10
	orrs r0, r5
	strb r0, [r7, #1]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	mov r3, sb
	ldrh r2, [r3, #0x2e]
	movs r0, #2
	movs r1, #0
	bl SetBgOffset
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #0x20
	ldrb r1, [r7, #1]
	orrs r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r7, #1]
	adds r0, r7, #0
	adds r0, #0x2d
	movs r2, #0
	strb r2, [r0]
	adds r1, r7, #0
	adds r1, #0x31
	movs r0, #0x20
	strb r0, [r1]
	subs r1, #5
	movs r0, #0xf0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x80
	strb r0, [r1]
	adds r1, #4
	ldrb r0, [r1]
	orrs r0, r4
	mov r3, r8
	orrs r0, r3
	movs r2, #4
	orrs r0, r2
	orrs r0, r6
	orrs r0, r5
	strb r0, [r1]
	adds r1, #2
	ldrb r3, [r1]
	orrs r4, r3
	mov r0, r8
	orrs r4, r0
	movs r0, #5
	rsbs r0, r0, #0
	ands r4, r0
	orrs r4, r6
	orrs r4, r5
	strb r4, [r1]
	ldr r0, .L0808C970 @ =gBg0Tm
	movs r1, #0
	bl TmFill
	ldr r5, .L0808C974 @ =gBg1Tm
	adds r0, r5, #0
	movs r1, #0
	bl TmFill
	ldr r0, .L0808C978 @ =gBg2Tm
	movs r1, #0
	bl TmFill
	ldr r0, .L0808C97C @ =gBg3Tm
	movs r1, #0
	bl TmFill
	ldr r4, .L0808C980 @ =gUnk_0833C03C
	adds r0, r4, #0
	movs r1, #0x80
	movs r2, #0x20
	bl ApplyPaletteExt
	movs r1, #0x90
	lsls r1, r1, #2
	adds r0, r4, #0
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, .L0808C984 @ =gUnk_0833B958
	ldr r1, .L0808C988 @ =0x06011800
	bl Decompress
	ldr r0, .L0808C98C @ =gUnk_0833BB28
	ldr r1, .L0808C990 @ =0x06004000
	bl Decompress
	ldr r4, .L0808C994 @ =gUnk_0833BB14
	movs r0, #2
	bl GetBgChrOffset
	adds r1, r0, #0
	ldr r2, .L0808C998 @ =0x06005000
	adds r1, r1, r2
	adds r0, r4, #0
	bl Decompress
	ldr r1, .L0808C99C @ =gUnk_0833BE84
	movs r4, #0x80
	lsls r4, r4, #5
	adds r0, r5, #0
	adds r2, r4, #0
	bl TmApplyTsa_thm
	ldr r3, .L0808C9A0 @ =0x00000404
	adds r5, r5, r3
	ldr r1, .L0808C9A4 @ =gUnk_0833BF08
	adds r0, r5, #0
	adds r2, r4, #0
	bl TmApplyTsa_thm
	bl ResetTextFont
	mov r1, sl
	ldr r0, [r1]
	adds r0, #0xa8
	movs r1, #0x16
	bl InitText
	bl func_fe6_0808C4A8
	mov r2, sl
	ldr r0, [r2]
	adds r0, #0x68
	movs r1, #9
	bl InitText
	mov r3, sl
	ldr r0, [r3]
	adds r0, #0xa0
	movs r1, #0xe
	bl InitText
	movs r4, #0
	mov r8, sl
	movs r7, #0x70
	movs r6, #0x38
	movs r5, #4
.L0808C8FA:
	adds r0, r4, #0
	movs r1, #4
	bl DrawGameOptionIcon
	mov r1, r8
	ldr r0, [r1]
	adds r0, r0, r6
	movs r1, #9
	bl InitText
	mov r2, r8
	ldr r0, [r2]
	adds r0, r0, r7
	movs r1, #0xe
	bl InitText
	adds r0, r4, #0
	adds r1, r4, #0
	adds r2, r5, #0
	bl DrawGameOptionText
	adds r0, r4, #0
	adds r1, r4, #0
	adds r2, r5, #0
	bl DrawOptionValueTexts
	adds r7, #8
	adds r6, #8
	adds r5, #2
	adds r4, #1
	cmp r4, #5
	ble .L0808C8FA
	movs r2, #1
	rsbs r2, r2, #0
	mov r0, sb
	movs r1, #0
	bl StartMuralBackgroundExt
	ldr r0, .L0808C9A8 @ =ProcScr_DrawConfigUiSprites
	mov r1, sb
	bl SpawnProc
	movs r0, #0xf
	bl EnableBgSync
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0808C964: .4byte gpUiConfigSt
.L0808C968: .4byte gUnk_0868AAE4
.L0808C96C: .4byte gDispIo
.L0808C970: .4byte gBg0Tm
.L0808C974: .4byte gBg1Tm
.L0808C978: .4byte gBg2Tm
.L0808C97C: .4byte gBg3Tm
.L0808C980: .4byte gUnk_0833C03C
.L0808C984: .4byte gUnk_0833B958
.L0808C988: .4byte 0x06011800
.L0808C98C: .4byte gUnk_0833BB28
.L0808C990: .4byte 0x06004000
.L0808C994: .4byte gUnk_0833BB14
.L0808C998: .4byte 0x06005000
.L0808C99C: .4byte gUnk_0833BE84
.L0808C9A0: .4byte 0x00000404
.L0808C9A4: .4byte gUnk_0833BF08
.L0808C9A8: .4byte ProcScr_DrawConfigUiSprites

	thumb_func_start WindowColorOptionChangeHandler
WindowColorOptionChangeHandler: @ 0x0808C9AC
	push {lr}
	bl GenericOptionChangeHandler
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L0808C9C0
	movs r0, #1
	rsbs r0, r0, #0
	bl UnpackUiWindowFrameGraphics2
.L0808C9C0:
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start MusicOptionChangeHandler
MusicOptionChangeHandler: @ 0x0808C9C8
	push {lr}
	bl GenericOptionChangeHandler
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L0808CA0C
	ldr r1, .L0808CA00 @ =gUnk_0868AAE4
	ldr r0, .L0808CA04 @ =gpUiConfigSt
	ldr r2, [r0]
	movs r3, #0x32
	ldrsh r0, [r2, r3]
	lsls r0, r0, #3
	adds r1, #4
	adds r0, r0, r1
	movs r3, #0x2a
	ldrsh r1, [r2, r3]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	bl GetGameOption
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L0808CA08
	movs r0, #1
	bl FadeBgmOut
	b .L0808CA0C
	.align 2, 0
.L0808CA00: .4byte gUnk_0868AAE4
.L0808CA04: .4byte gpUiConfigSt
.L0808CA08:
	bl StartMapSongBgm
.L0808CA0C:
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start GenericOptionChangeHandler
GenericOptionChangeHandler: @ 0x0808CA14
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	movs r7, #0
	ldr r0, .L0808CA70 @ =gpUiConfigSt
	ldr r0, [r0]
	movs r1, #0x2a
	ldrsh r5, [r0, r1]
	ldr r1, .L0808CA74 @ =gUnk_0868AAE4
	movs r2, #0x32
	ldrsh r0, [r0, r2]
	lsls r0, r0, #3
	adds r1, #4
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r4, [r0]
	adds r6, r4, #0
	bl GetSelectedOptionValue
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	ldr r0, .L0808CA78 @ =gKeySt
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0x30
	ands r0, r1
	cmp r0, #0
	beq .L0808CAD8
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq .L0808CA7C
	cmp r3, #0
	beq .L0808CAA2
	subs r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	adds r0, r4, #0
	adds r1, r3, #0
	bl SetGameOption
	movs r7, #1
	b .L0808CAA6
	.align 2, 0
.L0808CA70: .4byte gpUiConfigSt
.L0808CA74: .4byte gUnk_0868AAE4
.L0808CA78: .4byte gKeySt
.L0808CA7C:
	ldr r2, .L0808CAE4 @ =gUnk_0868AB3C
	adds r4, r3, #1
	lsls r0, r4, #3
	movs r1, #0x2c
	muls r1, r6, r1
	adds r0, r0, r1
	adds r0, r0, r2
	ldrh r0, [r0, #6]
	cmp r0, #0
	beq .L0808CAA2
	cmp r3, #2
	bhi .L0808CAA2
	lsls r0, r4, #0x18
	lsrs r3, r0, #0x18
	adds r0, r6, #0
	adds r1, r3, #0
	bl SetGameOption
	movs r7, #1
.L0808CAA2:
	cmp r7, #0
	beq .L0808CAD8
.L0808CAA6:
	ldr r0, .L0808CAE8 @ =ProcScr_RedrawConfigHelpText
	mov r1, r8
	bl SpawnProc
	adds r0, r5, #0
	movs r1, #7
	bl __modsi3
	adds r1, r0, #0
	lsls r2, r5, #1
	adds r2, #4
	adds r0, r5, #0
	bl DrawOptionValueTexts
	movs r0, #5
	bl EnableBgSync
	ldr r0, .L0808CAEC @ =gPlaySt
	ldrb r0, [r0, #0x1d]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L0808CAD8
	movs r0, #0x67
	bl m4aSongNumStart
.L0808CAD8:
	adds r0, r7, #0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
.L0808CAE4: .4byte gUnk_0868AB3C
.L0808CAE8: .4byte ProcScr_RedrawConfigHelpText
.L0808CAEC: .4byte gPlaySt

	thumb_func_start GetGameOption
GetGameOption: @ 0x0808CAF0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r2, #0
	cmp r0, #0xd
	bls .L0808CAFC
	b .L0808CC10
.L0808CAFC:
	lsls r0, r0, #2
	ldr r1, .L0808CB08 @ =.L0808CB0C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
.L0808CB08: .4byte .L0808CB0C
.L0808CB0C: @ jump table
	.4byte .L0808CB44 @ case 0
	.4byte .L0808CB7A @ case 1
	.4byte .L0808CB88 @ case 2
	.4byte .L0808CB94 @ case 3
	.4byte .L0808CBA0 @ case 4
	.4byte .L0808CBB0 @ case 5
	.4byte .L0808CBBC @ case 6
	.4byte .L0808CBC8 @ case 7
	.4byte .L0808CBD4 @ case 8
	.4byte .L0808CC10 @ case 9
	.4byte .L0808CBE0 @ case 10
	.4byte .L0808CBF0 @ case 11
	.4byte .L0808CBFC @ case 12
	.4byte .L0808CC08 @ case 13
.L0808CB44:
	ldr r0, .L0808CB5C @ =gPlaySt
	ldrb r0, [r0, #0x1e]
	lsls r0, r0, #0x1e
	lsrs r0, r0, #0x1e
	cmp r0, #1
	beq .L0808CB72
	cmp r0, #1
	bgt .L0808CB60
	cmp r0, #0
	beq .L0808CB6A
	b .L0808CB7A
	.align 2, 0
.L0808CB5C: .4byte gPlaySt
.L0808CB60:
	cmp r0, #2
	beq .L0808CB76
	cmp r0, #3
	beq .L0808CB6E
	b .L0808CB7A
.L0808CB6A:
	movs r0, #0
	b .L0808CC12
.L0808CB6E:
	movs r0, #1
	b .L0808CC12
.L0808CB72:
	movs r0, #2
	b .L0808CC12
.L0808CB76:
	movs r0, #3
	b .L0808CC12
.L0808CB7A:
	ldr r0, .L0808CB84 @ =gPlaySt
	ldrb r0, [r0, #0x1c]
	lsls r0, r0, #0x1e
	b .L0808CC0E
	.align 2, 0
.L0808CB84: .4byte gPlaySt
.L0808CB88:
	ldr r0, .L0808CB90 @ =gPlaySt
	ldrb r0, [r0, #0x1c]
	b .L0808CBE4
	.align 2, 0
.L0808CB90: .4byte gPlaySt
.L0808CB94:
	ldr r0, .L0808CB9C @ =gPlaySt
	ldrb r0, [r0, #0x1c]
	lsls r0, r0, #0x1b
	b .L0808CC0E
	.align 2, 0
.L0808CB9C: .4byte gPlaySt
.L0808CBA0:
	ldr r0, .L0808CBAC @ =gPlaySt
	ldrb r0, [r0, #0x1c]
	lsls r0, r0, #0x19
	lsrs r2, r0, #0x1e
	b .L0808CC10
	.align 2, 0
.L0808CBAC: .4byte gPlaySt
.L0808CBB0:
	ldr r0, .L0808CBB8 @ =gPlaySt
	ldrb r0, [r0, #0x1c]
	lsrs r2, r0, #7
	b .L0808CC10
	.align 2, 0
.L0808CBB8: .4byte gPlaySt
.L0808CBBC:
	ldr r0, .L0808CBC4 @ =gPlaySt
	ldrb r0, [r0, #0x1d]
	b .L0808CC0C
	.align 2, 0
.L0808CBC4: .4byte gPlaySt
.L0808CBC8:
	ldr r0, .L0808CBD0 @ =gPlaySt
	ldrb r0, [r0, #0x1d]
	lsls r0, r0, #0x1e
	b .L0808CC0E
	.align 2, 0
.L0808CBD0: .4byte gPlaySt
.L0808CBD4:
	ldr r0, .L0808CBDC @ =gPlaySt
	ldrb r0, [r0, #0x1d]
	b .L0808CBE4
	.align 2, 0
.L0808CBDC: .4byte gPlaySt
.L0808CBE0:
	ldr r0, .L0808CBEC @ =gPlaySt
	ldrb r0, [r0, #0x1e]
.L0808CBE4:
	lsls r0, r0, #0x1c
	lsrs r2, r0, #0x1e
	b .L0808CC10
	.align 2, 0
.L0808CBEC: .4byte gPlaySt
.L0808CBF0:
	ldr r0, .L0808CBF8 @ =gPlaySt
	ldrb r0, [r0, #0x1d]
	lsrs r2, r0, #7
	b .L0808CC10
	.align 2, 0
.L0808CBF8: .4byte gPlaySt
.L0808CBFC:
	ldr r0, .L0808CC04 @ =gPlaySt
	ldrb r0, [r0, #0x1d]
	lsls r0, r0, #0x19
	b .L0808CC0E
	.align 2, 0
.L0808CC04: .4byte gPlaySt
.L0808CC08:
	ldr r0, .L0808CC14 @ =gPlaySt
	ldrb r0, [r0, #0x1c]
.L0808CC0C:
	lsls r0, r0, #0x1f
.L0808CC0E:
	lsrs r2, r0, #0x1f
.L0808CC10:
	adds r0, r2, #0
.L0808CC12:
	bx lr
	.align 2, 0
.L0808CC14: .4byte gPlaySt

	thumb_func_start SetGameOption
SetGameOption: @ 0x0808CC18
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r3, r1, #0x18
	cmp r0, #0xd
	bls .L0808CC26
	b .L0808CDC4
.L0808CC26:
	lsls r0, r0, #2
	ldr r1, .L0808CC30 @ =.L0808CC34
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
.L0808CC30: .4byte .L0808CC34
.L0808CC34: @ jump table
	.4byte .L0808CC6C @ case 0
	.4byte .L0808CCD4 @ case 1
	.4byte .L0808CCE8 @ case 2
	.4byte .L0808CCFC @ case 3
	.4byte .L0808CD10 @ case 4
	.4byte .L0808CD24 @ case 5
	.4byte .L0808CD30 @ case 6
	.4byte .L0808CD44 @ case 7
	.4byte .L0808CD58 @ case 8
	.4byte .L0808CDC4 @ case 9
	.4byte .L0808CD6C @ case 10
	.4byte .L0808CD88 @ case 11
	.4byte .L0808CD94 @ case 12
	.4byte .L0808CDB0 @ case 13
.L0808CC6C:
	cmp r3, #1
	beq .L0808CC98
	cmp r3, #1
	bgt .L0808CC7A
	cmp r3, #0
	beq .L0808CC84
	b .L0808CCD4
.L0808CC7A:
	cmp r3, #2
	beq .L0808CCA8
	cmp r3, #3
	beq .L0808CCBC
	b .L0808CCD4
.L0808CC84:
	ldr r1, .L0808CC94 @ =gPlaySt
	movs r0, #4
	rsbs r0, r0, #0
	ldrb r2, [r1, #0x1e]
	ands r0, r2
	strb r0, [r1, #0x1e]
	b .L0808CDC4
	.align 2, 0
.L0808CC94: .4byte gPlaySt
.L0808CC98:
	ldr r1, .L0808CCA4 @ =gPlaySt
	movs r0, #3
	ldrb r3, [r1, #0x1e]
	orrs r0, r3
	strb r0, [r1, #0x1e]
	b .L0808CDC4
	.align 2, 0
.L0808CCA4: .4byte gPlaySt
.L0808CCA8:
	ldr r0, .L0808CCB8 @ =gPlaySt
	movs r1, #4
	rsbs r1, r1, #0
	ldrb r2, [r0, #0x1e]
	ands r1, r2
	movs r2, #1
	b .L0808CCC8
	.align 2, 0
.L0808CCB8: .4byte gPlaySt
.L0808CCBC:
	ldr r0, .L0808CCD0 @ =gPlaySt
	movs r1, #4
	rsbs r1, r1, #0
	ldrb r3, [r0, #0x1e]
	ands r1, r3
	movs r2, #2
.L0808CCC8:
	orrs r1, r2
	strb r1, [r0, #0x1e]
	b .L0808CDC4
	.align 2, 0
.L0808CCD0: .4byte gPlaySt
.L0808CCD4:
	ldr r2, .L0808CCE4 @ =gPlaySt
	movs r0, #1
	adds r1, r3, #0
	ands r1, r0
	lsls r1, r1, #1
	movs r0, #3
	rsbs r0, r0, #0
	b .L0808CDBC
	.align 2, 0
.L0808CCE4: .4byte gPlaySt
.L0808CCE8:
	ldr r2, .L0808CCF8 @ =gPlaySt
	movs r0, #3
	adds r1, r3, #0
	ands r1, r0
	lsls r1, r1, #2
	movs r0, #0xd
	rsbs r0, r0, #0
	b .L0808CDBC
	.align 2, 0
.L0808CCF8: .4byte gPlaySt
.L0808CCFC:
	ldr r2, .L0808CD0C @ =gPlaySt
	movs r0, #1
	adds r1, r3, #0
	ands r1, r0
	lsls r1, r1, #4
	movs r0, #0x11
	rsbs r0, r0, #0
	b .L0808CDBC
	.align 2, 0
.L0808CD0C: .4byte gPlaySt
.L0808CD10:
	ldr r2, .L0808CD20 @ =gPlaySt
	movs r0, #3
	adds r1, r3, #0
	ands r1, r0
	lsls r1, r1, #5
	movs r0, #0x61
	rsbs r0, r0, #0
	b .L0808CDBC
	.align 2, 0
.L0808CD20: .4byte gPlaySt
.L0808CD24:
	ldr r2, .L0808CD2C @ =gPlaySt
	lsls r1, r3, #7
	movs r0, #0x7f
	b .L0808CDBC
	.align 2, 0
.L0808CD2C: .4byte gPlaySt
.L0808CD30:
	ldr r2, .L0808CD40 @ =gPlaySt
	movs r0, #1
	adds r1, r3, #0
	ands r1, r0
	movs r0, #2
	rsbs r0, r0, #0
	b .L0808CDA2
	.align 2, 0
.L0808CD40: .4byte gPlaySt
.L0808CD44:
	ldr r2, .L0808CD54 @ =gPlaySt
	movs r0, #1
	adds r1, r3, #0
	ands r1, r0
	lsls r1, r1, #1
	movs r0, #3
	rsbs r0, r0, #0
	b .L0808CDA2
	.align 2, 0
.L0808CD54: .4byte gPlaySt
.L0808CD58:
	ldr r2, .L0808CD68 @ =gPlaySt
	movs r0, #3
	adds r1, r3, #0
	ands r1, r0
	lsls r1, r1, #2
	movs r0, #0xd
	rsbs r0, r0, #0
	b .L0808CDA2
	.align 2, 0
.L0808CD68: .4byte gPlaySt
.L0808CD6C:
	ldr r2, .L0808CD84 @ =gPlaySt
	movs r0, #3
	adds r1, r3, #0
	ands r1, r0
	lsls r1, r1, #2
	movs r0, #0xd
	rsbs r0, r0, #0
	ldrb r3, [r2, #0x1e]
	ands r0, r3
	orrs r0, r1
	strb r0, [r2, #0x1e]
	b .L0808CDC4
	.align 2, 0
.L0808CD84: .4byte gPlaySt
.L0808CD88:
	ldr r2, .L0808CD90 @ =gPlaySt
	lsls r1, r3, #7
	movs r0, #0x7f
	b .L0808CDA2
	.align 2, 0
.L0808CD90: .4byte gPlaySt
.L0808CD94:
	ldr r2, .L0808CDAC @ =gPlaySt
	movs r0, #1
	adds r1, r3, #0
	ands r1, r0
	lsls r1, r1, #6
	movs r0, #0x41
	rsbs r0, r0, #0
.L0808CDA2:
	ldrb r3, [r2, #0x1d]
	ands r0, r3
	orrs r0, r1
	strb r0, [r2, #0x1d]
	b .L0808CDC4
	.align 2, 0
.L0808CDAC: .4byte gPlaySt
.L0808CDB0:
	ldr r2, .L0808CDC8 @ =gPlaySt
	movs r0, #1
	adds r1, r3, #0
	ands r1, r0
	movs r0, #2
	rsbs r0, r0, #0
.L0808CDBC:
	ldrb r3, [r2, #0x1c]
	ands r0, r3
	orrs r0, r1
	strb r0, [r2, #0x1c]
.L0808CDC4:
	bx lr
	.align 2, 0
.L0808CDC8: .4byte gPlaySt

	thumb_func_start func_fe6_0808CDCC
func_fe6_0808CDCC: @ 0x0808CDCC
	push {r4, r5, r6, r7, lr}
	adds r5, r1, #0
	adds r7, r2, #0
	lsls r0, r5, #1
	adds r6, r0, #4
	lsls r0, r6, #5
	ldr r2, .L0808CE44 @ =gBg2Tm
	movs r4, #0
	adds r1, r0, #0
	adds r1, #0x22
	adds r0, #2
	movs r3, #0x1a
	lsls r0, r0, #1
	adds r0, r0, r2
	lsls r1, r1, #1
	adds r1, r1, r2
.L0808CDEC:
	strh r4, [r0]
	strh r4, [r1]
	adds r1, #2
	adds r0, #2
	subs r3, #1
	cmp r3, #0
	bge .L0808CDEC
	adds r0, r5, #0
	movs r1, #7
	bl __modsi3
	adds r4, r0, #0
	adds r0, r5, #0
	movs r1, #4
	bl DrawGameOptionIcon
	adds r0, r5, #0
	adds r1, r4, #0
	adds r2, r6, #0
	bl DrawGameOptionText
	adds r0, r5, #0
	adds r1, r4, #0
	adds r2, r6, #0
	bl DrawOptionValueTexts
	ldr r1, .L0808CE48 @ =gBg0Tm
	movs r2, #0
	adds r0, r7, #0
	adds r0, #0x62
	movs r3, #0x1a
	lsls r0, r0, #1
	adds r0, r0, r1
.L0808CE2E:
	strh r2, [r0]
	adds r0, #2
	subs r3, #1
	cmp r3, #0
	bge .L0808CE2E
	movs r0, #5
	bl EnableBgSync
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0808CE44: .4byte gBg2Tm
.L0808CE48: .4byte gBg0Tm

	thumb_func_start Config_Loop
Config_Loop: @ 0x0808CE4C
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	movs r3, #0
	movs r1, #0x30
	ldrsh r0, [r4, r1]
	cmp r0, #6
	bls .L0808CE5C
	b .L0808D06C
.L0808CE5C:
	lsls r0, r0, #2
	ldr r1, .L0808CE68 @ =.L0808CE6C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
.L0808CE68: .4byte .L0808CE6C
.L0808CE6C: @ jump table
	.4byte .L0808CE88 @ case 0
	.4byte .L0808D048 @ case 1
	.4byte .L0808D048 @ case 2
	.4byte .L0808D048 @ case 3
	.4byte .L0808D058 @ case 4
	.4byte .L0808D058 @ case 5
	.4byte .L0808D058 @ case 6
.L0808CE88:
	ldr r0, .L0808CEA8 @ =gKeySt
	ldr r2, [r0]
	ldrh r1, [r2, #8]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq .L0808CEB0
	ldr r0, .L0808CEAC @ =gPlaySt
	ldrb r0, [r0, #0x1d]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L0808CF02
	movs r0, #0x6b
	bl m4aSongNumStart
	b .L0808CF02
	.align 2, 0
.L0808CEA8: .4byte gKeySt
.L0808CEAC: .4byte gPlaySt
.L0808CEB0:
	movs r5, #1
	adds r0, r5, #0
	ands r0, r1
	cmp r0, #0
	beq .L0808CF18
	ldr r1, .L0808CF0C @ =gUnk_0868AAE4
	ldr r0, .L0808CF10 @ =gpUiConfigSt
	ldr r2, [r0]
	movs r3, #0x32
	ldrsh r0, [r2, r3]
	lsls r0, r0, #3
	adds r1, #4
	adds r0, r0, r1
	movs r5, #0x2a
	ldrsh r1, [r2, r5]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq .L0808CEDA
	b .L0808D06C
.L0808CEDA:
	movs r0, #0
	bl GetGameOption
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #3
	beq .L0808CEEA
	b .L0808D06C
.L0808CEEA:
	ldr r0, .L0808CF14 @ =gPlaySt
	ldrb r0, [r0, #0x1d]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L0808CEFA
	movs r0, #0x6a
	bl m4aSongNumStart
.L0808CEFA:
	adds r1, r4, #0
	adds r1, #0x36
	movs r0, #1
	strb r0, [r1]
.L0808CF02:
	adds r0, r4, #0
	bl Proc_Break
	b .L0808D06C
	.align 2, 0
.L0808CF0C: .4byte gUnk_0868AAE4
.L0808CF10: .4byte gpUiConfigSt
.L0808CF14: .4byte gPlaySt
.L0808CF18:
	ldrh r1, [r2, #6]
	movs r0, #0xc0
	ands r0, r1
	cmp r0, #0
	beq .L0808CFF8
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq .L0808CF78
	ldr r0, .L0808CF74 @ =gpUiConfigSt
	ldr r2, [r0]
	ldrh r1, [r2, #0x2a]
	movs r6, #0x2a
	ldrsh r0, [r2, r6]
	cmp r0, #0
	beq .L0808CFC6
	subs r0, r1, #1
	strh r0, [r2, #0x2a]
	movs r1, #0x2a
	ldrsh r0, [r2, r1]
	movs r3, #0x2c
	ldrsh r1, [r2, r3]
	subs r0, r0, r1
	cmp r0, #0
	bgt .L0808CF6E
	ldrh r1, [r2, #0x2c]
	movs r6, #0x2c
	ldrsh r0, [r2, r6]
	cmp r0, #0
	beq .L0808CF6E
	subs r0, r1, #1
	strh r0, [r2, #0x2c]
	movs r0, #0x2a
	ldrsh r1, [r2, r0]
	subs r1, #1
	adds r0, r4, #0
	movs r2, #0
	bl func_fe6_0808CDCC
	ldrh r0, [r4, #0x2e]
	subs r0, #4
	strh r0, [r4, #0x2e]
	strh r5, [r4, #0x30]
.L0808CF6E:
	movs r3, #1
	b .L0808CFCA
	.align 2, 0
.L0808CF74: .4byte gpUiConfigSt
.L0808CF78:
	ldr r0, .L0808CFEC @ =gpUiConfigSt
	ldr r2, [r0]
	movs r5, #0x2a
	ldrsh r1, [r2, r5]
	movs r6, #0x34
	ldrsh r0, [r2, r6]
	subs r0, #1
	cmp r1, r0
	bge .L0808CFC6
	ldrh r0, [r2, #0x2a]
	adds r0, #1
	strh r0, [r2, #0x2a]
	movs r0, #0x2a
	ldrsh r1, [r2, r0]
	movs r3, #0x2c
	ldrsh r0, [r2, r3]
	subs r0, r1, r0
	cmp r0, #4
	ble .L0808CFC4
	movs r5, #0x34
	ldrsh r0, [r2, r5]
	subs r0, #1
	cmp r1, r0
	bge .L0808CFC4
	ldrh r0, [r2, #0x2c]
	adds r0, #1
	strh r0, [r2, #0x2c]
	adds r1, #1
	movs r2, #0xa0
	lsls r2, r2, #1
	adds r0, r4, #0
	bl func_fe6_0808CDCC
	ldrh r0, [r4, #0x2e]
	adds r0, #4
	strh r0, [r4, #0x2e]
	movs r0, #4
	strh r0, [r4, #0x30]
.L0808CFC4:
	movs r3, #1
.L0808CFC6:
	cmp r3, #0
	beq .L0808CFF8
.L0808CFCA:
	ldr r0, .L0808CFF0 @ =ProcScr_RedrawConfigHelpText
	adds r1, r4, #0
	bl SpawnProc
	movs r0, #5
	bl EnableBgSync
	ldr r0, .L0808CFF4 @ =gPlaySt
	ldrb r0, [r0, #0x1d]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L0808D06C
	movs r0, #0x66
	bl m4aSongNumStart
	b .L0808D06C
	.align 2, 0
.L0808CFEC: .4byte gpUiConfigSt
.L0808CFF0: .4byte ProcScr_RedrawConfigHelpText
.L0808CFF4: .4byte gPlaySt
.L0808CFF8:
	ldr r0, .L0808D038 @ =gKeySt
	ldr r1, [r0]
	movs r0, #0x30
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq .L0808D06C
	ldr r3, .L0808D03C @ =gUnk_0868AB3C
	ldr r1, .L0808D040 @ =gUnk_0868AAE4
	ldr r0, .L0808D044 @ =gpUiConfigSt
	ldr r2, [r0]
	movs r5, #0x32
	ldrsh r0, [r2, r5]
	lsls r0, r0, #3
	adds r1, #4
	adds r0, r0, r1
	movs r6, #0x2a
	ldrsh r1, [r2, r6]
	ldr r0, [r0]
	adds r0, r0, r1
	movs r1, #0x2c
	ldrb r0, [r0]
	muls r0, r1, r0
	adds r3, #0x28
	adds r0, r0, r3
	ldr r1, [r0]
	cmp r1, #0
	beq .L0808D06C
	adds r0, r4, #0
	bl _call_via_r1
	b .L0808D06C
	.align 2, 0
.L0808D038: .4byte gKeySt
.L0808D03C: .4byte gUnk_0868AB3C
.L0808D040: .4byte gUnk_0868AAE4
.L0808D044: .4byte gpUiConfigSt
.L0808D048:
	ldrh r0, [r4, #0x2e]
	subs r0, #4
	strh r0, [r4, #0x2e]
	ldrh r0, [r4, #0x30]
	cmp r0, #3
	bne .L0808D068
	movs r0, #0
	b .L0808D06A
.L0808D058:
	ldrh r0, [r4, #0x2e]
	adds r0, #4
	strh r0, [r4, #0x2e]
	ldrh r0, [r4, #0x30]
	cmp r0, #6
	bne .L0808D068
	movs r0, #0
	b .L0808D06A
.L0808D068:
	adds r0, #1
.L0808D06A:
	strh r0, [r4, #0x30]
.L0808D06C:
	ldrh r2, [r4, #0x2e]
	movs r0, #2
	movs r1, #0
	bl SetBgOffset
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start Config_End
Config_End: @ 0x0808D07C
	push {r4, lr}
	adds r4, r0, #0
	bl EndMuralBackground
	ldr r0, .L0808D0A0 @ =ProcScr_DrawConfigUiSprites
	bl Proc_EndEach
	ldr r0, .L0808D0A4 @ =ProcScr_RedrawConfigHelpText
	bl Proc_EndEach
	adds r0, r4, #0
	adds r0, #0x36
	ldrb r0, [r0]
	cmp r0, #0
	bne .L0808D0A8
	movs r0, #1
	b .L0808D0B8
	.align 2, 0
.L0808D0A0: .4byte ProcScr_DrawConfigUiSprites
.L0808D0A4: .4byte ProcScr_RedrawConfigHelpText
.L0808D0A8:
	adds r0, r4, #0
	bl StartUnitListScreenForSoloAnim
	adds r0, r4, #0
	movs r1, #0
	bl Proc_Goto
	movs r0, #0
.L0808D0B8:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
