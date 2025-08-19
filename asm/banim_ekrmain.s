	.include "macro.inc"
	.syntax unified

	.section .text


	thumb_func_start InitLeftAnim
InitLeftAnim: @ 0x0804B37C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r7, r0, #0
	ldr r2, .L0804B484 @ =BanimDefaultModeConfig
	lsls r1, r7, #2
	adds r0, r1, r2
	ldrb r5, [r0]
	adds r0, r1, #1
	adds r0, r0, r2
	ldrb r6, [r0]
	adds r0, r1, #2
	adds r0, r0, r2
	ldrb r0, [r0]
	mov r8, r0
	adds r1, #3
	adds r1, r1, r2
	ldrb r1, [r1]
	mov sb, r1
	ldr r0, .L0804B488 @ =BanimTypesPosLeft
	ldr r1, .L0804B48C @ =gEkrDistanceType
	movs r2, #0
	ldrsh r1, [r1, r2]
	adds r0, r1, r0
	ldrb r4, [r0]
	ldr r3, .L0804B490 @ =gEkrXPosBase
	ldr r0, .L0804B494 @ =BanimLeftDefaultPos
	lsls r1, r1, #1
	adds r1, r1, r0
	ldrh r1, [r1]
	rsbs r1, r1, #0
	movs r2, #0
	strh r1, [r3]
	ldr r0, .L0804B498 @ =gEkrYPosBase
	strh r2, [r0]
	ldr r0, .L0804B49C @ =gEkrXPosReal
	adds r1, r1, r4
	strh r1, [r0]
	ldr r1, .L0804B4A0 @ =gEkrYPosReal
	movs r0, #0x58
	strh r0, [r1]
	ldr r0, .L0804B4A4 @ =gpBanimModesLeft
	ldr r1, [r0]
	lsls r0, r5, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldr r0, .L0804B4A8 @ =gBanimScrs
	adds r0, r1, r0
	cmp r5, #0xff
	bne .L0804B3E4
	ldr r0, .L0804B4AC @ =AnimScr_DefaultAnim
.L0804B3E4:
	adds r1, r6, #0
	bl BasCreate
	adds r2, r0, #0
	ldr r1, .L0804B49C @ =gEkrXPosReal
	ldr r0, .L0804B4B0 @ =gEkrBgPosition
	ldrh r1, [r1]
	ldrh r0, [r0]
	subs r0, r1, r0
	movs r1, #0
	strh r0, [r2, #2]
	ldr r0, .L0804B4A0 @ =gEkrYPosReal
	ldrh r0, [r0]
	strh r0, [r2, #4]
	movs r0, #0xf4
	lsls r0, r0, #7
	strh r0, [r2, #8]
	movs r3, #0x80
	lsls r3, r3, #3
	adds r0, r3, #0
	ldrh r3, [r2, #0xc]
	orrs r0, r3
	strh r0, [r2, #0xc]
	strh r1, [r2, #0xe]
	strb r7, [r2, #0x12]
	ldr r0, .L0804B4B4 @ =gBanimImgSheetBufs
	str r0, [r2, #0x2c]
	ldr r0, .L0804B4B8 @ =gBanimOamBufs
	str r0, [r2, #0x30]
	ldr r0, .L0804B4BC @ =gAnims
	str r2, [r0]
	ldr r0, .L0804B4A4 @ =gpBanimModesLeft
	ldr r1, [r0]
	mov r2, r8
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldr r0, .L0804B4A8 @ =gBanimScrs
	adds r0, r1, r0
	cmp r2, #0xff
	bne .L0804B438
	ldr r0, .L0804B4AC @ =AnimScr_DefaultAnim
.L0804B438:
	mov r1, sb
	bl BasCreate
	adds r2, r0, #0
	ldr r1, .L0804B49C @ =gEkrXPosReal
	ldr r0, .L0804B4B0 @ =gEkrBgPosition
	ldrh r1, [r1]
	ldrh r0, [r0]
	subs r0, r1, r0
	movs r1, #0
	strh r0, [r2, #2]
	ldr r0, .L0804B4A0 @ =gEkrYPosReal
	ldrh r0, [r0]
	strh r0, [r2, #4]
	movs r0, #0xf4
	lsls r0, r0, #7
	strh r0, [r2, #8]
	movs r3, #0xa0
	lsls r3, r3, #3
	adds r0, r3, #0
	ldrh r3, [r2, #0xc]
	orrs r0, r3
	strh r0, [r2, #0xc]
	strh r1, [r2, #0xe]
	strb r7, [r2, #0x12]
	ldr r0, .L0804B4B4 @ =gBanimImgSheetBufs
	str r0, [r2, #0x2c]
	ldr r0, .L0804B4B8 @ =gBanimOamBufs
	str r0, [r2, #0x30]
	ldr r0, .L0804B4BC @ =gAnims
	str r2, [r0, #4]
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0804B484: .4byte BanimDefaultModeConfig
.L0804B488: .4byte BanimTypesPosLeft
.L0804B48C: .4byte gEkrDistanceType
.L0804B490: .4byte gEkrXPosBase
.L0804B494: .4byte BanimLeftDefaultPos
.L0804B498: .4byte gEkrYPosBase
.L0804B49C: .4byte gEkrXPosReal
.L0804B4A0: .4byte gEkrYPosReal
.L0804B4A4: .4byte gpBanimModesLeft
.L0804B4A8: .4byte gBanimScrs
.L0804B4AC: .4byte AnimScr_DefaultAnim
.L0804B4B0: .4byte gEkrBgPosition
.L0804B4B4: .4byte gBanimImgSheetBufs
.L0804B4B8: .4byte gBanimOamBufs
.L0804B4BC: .4byte gAnims

	thumb_func_start InitRightAnim
InitRightAnim: @ 0x0804B4C0
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r2, .L0804B5A8 @ =BanimDefaultModeConfig
	lsls r1, r5, #2
	adds r0, r1, r2
	ldrb r3, [r0]
	adds r0, r1, #1
	adds r0, r0, r2
	ldrb r4, [r0]
	adds r0, r1, #2
	adds r0, r0, r2
	ldrb r6, [r0]
	adds r1, #3
	adds r1, r1, r2
	ldrb r7, [r1]
	ldr r1, .L0804B5AC @ =BanimTypesPosRight
	ldr r0, .L0804B5B0 @ =gEkrDistanceType
	movs r2, #0
	ldrsh r0, [r0, r2]
	adds r0, r0, r1
	ldrb r2, [r0]
	ldr r0, .L0804B5B4 @ =gEkrXPosBase
	movs r1, #0
	strh r1, [r0, #2]
	ldr r0, .L0804B5B8 @ =gEkrYPosBase
	strh r1, [r0, #2]
	ldr r0, .L0804B5BC @ =gEkrXPosReal
	strh r2, [r0, #2]
	ldr r1, .L0804B5C0 @ =gEkrYPosReal
	movs r0, #0x58
	strh r0, [r1, #2]
	ldr r0, .L0804B5C4 @ =gpBanimModesRight
	ldr r1, [r0]
	lsls r0, r3, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldr r0, .L0804B5C8 @ =gBanimScrs + 0x2A00
	adds r0, r1, r0
	cmp r3, #0xff
	bne .L0804B512
	ldr r0, .L0804B5CC @ =AnimScr_DefaultAnim
.L0804B512:
	adds r1, r4, #0
	bl BasCreate
	adds r2, r0, #0
	ldr r1, .L0804B5BC @ =gEkrXPosReal
	ldr r0, .L0804B5D0 @ =gEkrBgPosition
	ldrh r1, [r1, #2]
	ldrh r0, [r0]
	subs r0, r1, r0
	movs r1, #0
	strh r0, [r2, #2]
	ldr r0, .L0804B5C0 @ =gEkrYPosReal
	ldrh r0, [r0, #2]
	strh r0, [r2, #4]
	movs r0, #0x9b
	lsls r0, r0, #8
	strh r0, [r2, #8]
	movs r3, #0xc0
	lsls r3, r3, #3
	adds r0, r3, #0
	ldrh r3, [r2, #0xc]
	orrs r0, r3
	strh r0, [r2, #0xc]
	strh r1, [r2, #0xe]
	strb r5, [r2, #0x12]
	ldr r0, .L0804B5D4 @ =gUnk_Banim_02002080
	str r0, [r2, #0x2c]
	ldr r0, .L0804B5D8 @ =gBanimOamBufs + 0x5800
	str r0, [r2, #0x30]
	ldr r0, .L0804B5DC @ =gAnims
	str r2, [r0, #8]
	ldr r0, .L0804B5C4 @ =gpBanimModesRight
	ldr r1, [r0]
	lsls r0, r6, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldr r0, .L0804B5C8 @ =gBanimScrs + 0x2A00
	adds r0, r1, r0
	cmp r6, #0xff
	bne .L0804B564
	ldr r0, .L0804B5CC @ =AnimScr_DefaultAnim
.L0804B564:
	adds r1, r7, #0
	bl BasCreate
	adds r2, r0, #0
	ldr r1, .L0804B5BC @ =gEkrXPosReal
	ldr r0, .L0804B5D0 @ =gEkrBgPosition
	ldrh r1, [r1, #2]
	ldrh r0, [r0]
	subs r0, r1, r0
	movs r1, #0
	strh r0, [r2, #2]
	ldr r0, .L0804B5C0 @ =gEkrYPosReal
	ldrh r0, [r0, #2]
	strh r0, [r2, #4]
	movs r0, #0x9b
	lsls r0, r0, #8
	strh r0, [r2, #8]
	movs r3, #0xe0
	lsls r3, r3, #3
	adds r0, r3, #0
	ldrh r3, [r2, #0xc]
	orrs r0, r3
	strh r0, [r2, #0xc]
	strh r1, [r2, #0xe]
	strb r5, [r2, #0x12]
	ldr r0, .L0804B5D4 @ =gUnk_Banim_02002080
	str r0, [r2, #0x2c]
	ldr r0, .L0804B5D8 @ =gBanimOamBufs + 0x5800
	str r0, [r2, #0x30]
	ldr r0, .L0804B5DC @ =gAnims
	str r2, [r0, #0xc]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0804B5A8: .4byte BanimDefaultModeConfig
.L0804B5AC: .4byte BanimTypesPosRight
.L0804B5B0: .4byte gEkrDistanceType
.L0804B5B4: .4byte gEkrXPosBase
.L0804B5B8: .4byte gEkrYPosBase
.L0804B5BC: .4byte gEkrXPosReal
.L0804B5C0: .4byte gEkrYPosReal
.L0804B5C4: .4byte gpBanimModesRight
.L0804B5C8: .4byte gBanimScrs + 0x2A00
.L0804B5CC: .4byte AnimScr_DefaultAnim
.L0804B5D0: .4byte gEkrBgPosition
.L0804B5D4: .4byte gUnk_Banim_02002080
.L0804B5D8: .4byte gBanimOamBufs + 0x5800
.L0804B5DC: .4byte gAnims
