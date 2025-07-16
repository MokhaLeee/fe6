	.include "macro.inc"

	.syntax unified

	thumb_func_start func_fe6_0808EA74
func_fe6_0808EA74: @ 0x0808EA74
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0xc
	adds r7, r0, #0
	bl PlayRankGetter_Tactics
	ldr r6, .L0808EB84 @ =gPlayRanks
	ldr r4, .L0808EB88 @ =gpPlayRankSt
	ldr r1, [r4]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, #0x6c
	strh r0, [r1]
	strh r0, [r6]
	bl PlayRankGetter_Combat
	ldr r1, [r4]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, #0x6e
	strh r0, [r1]
	strh r0, [r6, #2]
	bl PlayRankGetter_Survival
	ldr r1, [r4]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, #0x70
	strh r0, [r1]
	strh r0, [r6, #4]
	bl PlayRankGetter_Experience
	ldr r1, [r4]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, #0x72
	strh r0, [r1]
	strh r0, [r6, #6]
	bl PlayRankGetter_Asset
	ldr r1, [r4]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, #0x74
	strh r0, [r1]
	strh r0, [r6, #8]
	bl PlayRankGetter_Power
	ldr r1, [r4]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, #0x76
	strh r0, [r1]
	strh r0, [r6, #0xa]
	movs r6, #0
.L0808EAE6:
	adds r0, r6, #0
	movs r1, #0
	bl func_fe6_0808DF78
	adds r6, #1
	cmp r6, #5
	ble .L0808EAE6
	bl func_fe6_0808F6E0
	ldr r4, .L0808EB88 @ =gpPlayRankSt
	ldr r1, [r4]
	adds r1, #0x78
	strh r0, [r1]
	movs r0, #6
	movs r1, #0
	bl func_fe6_0808DF78
	movs r6, #0
	subs r7, #6
	mov sb, r7
	mov r8, r4
	ldr r5, .L0808EB8C @ =gTotalPlayRankConf1
	movs r7, #0xe8
.L0808EB14:
	mov r1, r8
	ldr r0, [r1]
	adds r0, r0, r7
	movs r1, #6
	bl InitText
	mov r2, r8
	ldr r0, [r2]
	adds r0, r0, r7
	bl ClearText
	ldrh r0, [r5]
	bl DecodeMsg
	str r0, [sp, #8]
	mov r4, r8
	ldr r3, [r4]
	adds r0, r3, r7
	lsls r4, r6, #1
	adds r1, r3, #0
	adds r1, #0x50
	adds r1, r1, r4
	movs r2, #0
	ldrsh r1, [r1, r2]
	add r1, sb
	movs r2, #0x1f
	ands r1, r2
	lsls r1, r1, #5
	adds r3, #0x42
	adds r3, r3, r4
	movs r4, #0
	ldrsh r2, [r3, r4]
	adds r1, r1, r2
	lsls r1, r1, #1
	ldr r2, .L0808EB90 @ =gBg0Tm
	adds r1, r1, r2
	ldr r2, [r5, #4]
	movs r3, #6
	str r3, [sp]
	ldr r3, [sp, #8]
	str r3, [sp, #4]
	movs r3, #0
	bl PutDrawText
	adds r5, #0x10
	adds r7, #8
	adds r6, #1
	cmp r6, #6
	ble .L0808EB14
	add sp, #0xc
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0808EB84: .4byte gPlayRanks
.L0808EB88: .4byte gpPlayRankSt
.L0808EB8C: .4byte gTotalPlayRankConf1
.L0808EB90: .4byte gBg0Tm

	thumb_func_start func_fe6_0808EB94
func_fe6_0808EB94: @ 0x0808EB94
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	sub sp, #8
	adds r6, r0, #0
	movs r0, #6
	mov sb, r0
	adds r6, #0x16
	ldr r4, .L0808EC10 @ =gpPlayRankSt
	movs r5, #0x8c
	lsls r5, r5, #1
	ldr r0, [r4]
	adds r0, r0, r5
	movs r1, #6
	bl InitText
	ldr r0, [r4]
	adds r0, r0, r5
	bl ClearText
	ldr r2, .L0808EC14 @ =gTotalPlayRankConf1
	mov r8, r2
	mov r0, r8
	adds r0, #0x60
	ldrh r0, [r0]
	bl DecodeMsg
	ldr r3, [r4]
	adds r5, r3, r5
	adds r1, r3, #0
	adds r1, #0x5c
	movs r4, #0
	ldrsh r1, [r1, r4]
	adds r1, r1, r6
	movs r2, #0x1f
	ands r1, r2
	lsls r1, r1, #5
	adds r3, #0x4e
	movs r4, #0
	ldrsh r2, [r3, r4]
	adds r1, r1, r2
	lsls r1, r1, #1
	ldr r2, .L0808EC18 @ =gBg0Tm
	adds r1, r1, r2
	mov r3, r8
	ldr r2, [r3, #0x64]
	mov r4, sb
	str r4, [sp]
	str r0, [sp, #4]
	adds r0, r5, #0
	movs r3, #0
	bl PutDrawText
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L0808EC10: .4byte gpPlayRankSt
.L0808EC14: .4byte gTotalPlayRankConf1
.L0808EC18: .4byte gBg0Tm

	thumb_func_start func_fe6_0808EC1C
func_fe6_0808EC1C: @ 0x0808EC1C
	push {r4, r5, r6, r7, lr}
	movs r6, #0
	bl GetNextChapterStatsSlot
	adds r5, r0, #0
	movs r4, #0
	cmp r6, r5
	bge .L0808EC40
	movs r7, #0xb4
.L0808EC2E:
	adds r0, r4, #0
	bl GetChapterStats
	ldrh r0, [r0, #2]
	muls r0, r7, r0
	adds r6, r6, r0
	adds r4, #1
	cmp r4, r5
	blt .L0808EC2E
.L0808EC40:
	adds r0, r6, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start func_fe6_0808EC48
func_fe6_0808EC48: @ 0x0808EC48
	push {r4, lr}
	adds r4, r0, #0
	bl func_fe6_0808EC1C
	adds r2, r0, #0
	adds r4, #3
	movs r0, #0x1f
	ands r4, r0
	lsls r4, r4, #6
	ldr r0, .L0808EC74 @ =gBg0Tm+0x28
	adds r4, r4, r0
	adds r0, r4, #0
	movs r1, #2
	movs r3, #1
	bl PutTime
	movs r0, #1
	bl EnableBgSync
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0808EC74: .4byte gBg0Tm+0x28

	thumb_func_start func_fe6_0808EC78
func_fe6_0808EC78: @ 0x0808EC78
	push {r4, r5, r6, lr}
	subs r0, #0x50
	lsls r0, r0, #2
	movs r2, #0xf0
	lsls r2, r2, #2
	ands r0, r2
	adds r1, r0, #0
	adds r1, #0x40
	ands r1, r2
	ldr r2, .L0808ECCC @ =gBg0Tm
	movs r5, #0
	adds r3, r1, #0
	adds r3, #0x20
	lsls r1, r1, #1
	adds r4, r1, r2
	adds r1, r0, #0
	adds r1, #0x20
	lsls r0, r0, #1
	adds r0, r0, r2
	movs r6, #0x1f
	lsls r1, r1, #1
	adds r1, r1, r2
	lsls r3, r3, #1
	adds r3, r3, r2
.L0808ECA8:
	strh r5, [r0]
	strh r5, [r1]
	strh r5, [r4]
	strh r5, [r3]
	adds r3, #2
	adds r4, #2
	adds r1, #2
	adds r0, #2
	subs r6, #1
	cmp r6, #0
	bge .L0808ECA8
	movs r0, #1
	bl EnableBgSync
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L0808ECCC: .4byte gBg0Tm

	thumb_func_start func_fe6_0808ECD0
func_fe6_0808ECD0: @ 0x0808ECD0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x28
	str r0, [sp]
	lsls r2, r2, #0x10
	movs r3, #0
	lsrs r2, r2, #4
	mov ip, r2
.L0808ECE6:
	movs r2, #0
	lsls r0, r3, #8
	str r0, [sp, #0x10]
	adds r3, #1
	str r3, [sp, #8]
.L0808ECF0:
	lsls r0, r2, #3
	ldr r3, [sp, #0x10]
	adds r0, r3, r0
	movs r6, #0
	str r6, [sp, #4]
	adds r2, #1
	str r2, [sp, #0xc]
	lsls r2, r0, #1
	adds r0, r2, #0
	adds r0, #0xc0
	ldr r7, [sp]
	adds r0, r0, r7
	str r0, [sp, #0x14]
	adds r0, r2, #0
	adds r0, #0x80
	adds r0, r0, r7
	str r0, [sp, #0x18]
	adds r0, r2, #0
	adds r0, #0x40
	adds r0, r0, r7
	str r0, [sp, #0x1c]
	adds r2, r2, r7
	mov r0, ip
	adds r0, #0xe0
	adds r0, r0, r1
	mov sl, r0
	mov r0, ip
	adds r0, #0xc0
	adds r0, r0, r1
	mov sb, r0
	mov r0, ip
	adds r0, #0xa0
	adds r0, r0, r1
	mov r8, r0
	mov r0, ip
	adds r0, #0x80
	adds r0, r1, r0
	str r0, [sp, #0x20]
	mov r0, ip
	adds r0, #0x60
	adds r0, r1, r0
	str r0, [sp, #0x24]
	mov r0, ip
	adds r0, #0x40
	adds r5, r1, r0
	subs r0, #0x20
	adds r4, r1, r0
	mov r0, ip
	adds r3, r1, r0
.L0808ED52:
	strh r3, [r2]
	ldr r6, [sp, #0x1c]
	strh r4, [r6]
	ldr r7, [sp, #0x18]
	strh r5, [r7]
	mov r0, sp
	ldrh r6, [r0, #0x24]
	ldr r0, [sp, #0x14]
	strh r6, [r0]
	movs r7, #0x80
	lsls r7, r7, #1
	adds r0, r2, r7
	mov r6, sp
	ldrh r6, [r6, #0x20]
	strh r6, [r0]
	adds r7, #0x40
	adds r0, r2, r7
	mov r6, r8
	strh r6, [r0]
	adds r7, #0x40
	adds r0, r2, r7
	mov r6, sb
	strh r6, [r0]
	adds r7, #0x40
	adds r0, r2, r7
	mov r6, sl
	strh r6, [r0]
	ldr r7, [sp, #0x14]
	adds r7, #2
	str r7, [sp, #0x14]
	ldr r0, [sp, #0x18]
	adds r0, #2
	str r0, [sp, #0x18]
	ldr r6, [sp, #0x1c]
	adds r6, #2
	str r6, [sp, #0x1c]
	adds r2, #2
	movs r7, #1
	add sl, r7
	movs r0, #1
	add sb, r0
	add r8, r0
	ldr r6, [sp, #0x20]
	adds r6, #1
	str r6, [sp, #0x20]
	ldr r7, [sp, #0x24]
	adds r7, #1
	str r7, [sp, #0x24]
	adds r5, #1
	adds r4, #1
	adds r3, #1
	ldr r0, [sp, #4]
	adds r0, #1
	str r0, [sp, #4]
	cmp r0, #7
	ble .L0808ED52
	ldr r2, [sp, #0xc]
	cmp r2, #3
	ble .L0808ECF0
	ldr r3, [sp, #8]
	cmp r3, #3
	ble .L0808ECE6
	add sp, #0x28
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start PlayRank_InitDisplay
PlayRank_InitDisplay: @ 0x0808EDE0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	bl ResetText
	bl UnpackUiWindowFrameGraphics
	bl ResetTextFont
	bl PlayRank_InitTexts
	ldr r7, .L0808EFE8 @ =gDispIo
	movs r4, #1
	ldrb r0, [r7, #1]
	orrs r0, r4
	movs r1, #2
	mov sb, r1
	mov r2, sb
	orrs r0, r2
	movs r5, #4
	mov sl, r5
	mov r1, sl
	orrs r0, r1
	movs r2, #8
	orrs r0, r2
	movs r5, #0x10
	mov r8, r5
	mov r1, r8
	orrs r0, r1
	strb r0, [r7, #1]
	ldr r0, .L0808EFEC @ =gPlayRankCurChapter
	movs r6, #0
	strh r6, [r0]
	ldr r0, .L0808EFF0 @ =unk_02016A26
	strh r6, [r0]
	ldr r0, .L0808EFF4 @ =unk_02016A2C
	strb r6, [r0]
	ldr r1, .L0808EFF8 @ =unk_02016A1C
	movs r0, #0x80
	strh r0, [r1]
	ldr r5, .L0808EFFC @ =unk_02016A1E
	movs r0, #0xe0
	strh r0, [r5]
	ldr r1, .L0808F000 @ =unk_02016A20
	movs r0, #0xff
	strh r0, [r1]
	movs r0, #0
	movs r1, #0
	movs r2, #0x80
	bl SetBgOffset
	ldrh r2, [r5]
	movs r0, #1
	movs r1, #0
	bl SetBgOffset
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r2, #0x20
	ldrb r0, [r7, #1]
	orrs r0, r2
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r7, #1]
	adds r0, r7, #0
	adds r0, #0x2d
	strb r6, [r0]
	adds r1, r7, #0
	adds r1, #0x31
	movs r0, #0x18
	strb r0, [r1]
	subs r1, #5
	movs r0, #0xf0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x88
	strb r0, [r1]
	adds r1, #4
	ldrb r5, [r1]
	orrs r4, r5
	mov r0, sb
	orrs r4, r0
	mov r5, sl
	orrs r4, r5
	movs r0, #8
	orrs r4, r0
	mov r5, r8
	orrs r4, r5
	adds r3, r7, #0
	adds r3, #0x36
	subs r0, #0xa
	ldrb r5, [r3]
	ands r0, r5
	mov r5, sb
	orrs r0, r5
	mov r5, sl
	orrs r0, r5
	movs r5, #8
	orrs r0, r5
	mov r5, r8
	orrs r0, r5
	orrs r4, r2
	strb r4, [r1]
	orrs r0, r2
	strb r0, [r3]
	ldr r0, .L0808F004 @ =gBg0Tm
	movs r1, #0
	bl TmFill
	ldr r5, .L0808F008 @ =gBg1Tm
	adds r0, r5, #0
	movs r1, #0
	bl TmFill
	ldr r0, .L0808F00C @ =gBg2Tm
	mov r8, r0
	movs r1, #0
	bl TmFill
	ldr r1, .L0808F010 @ =gBg3Tm
	mov sl, r1
	mov r0, sl
	movs r1, #0
	bl TmFill
	adds r2, r7, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r1, r7, #0
	adds r1, #0x44
	movs r0, #6
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r7, #0
	adds r0, #0x46
	strb r6, [r0]
	ldr r0, .L0808F014 @ =0x0000FFE0
	ldrh r2, [r7, #0x3c]
	ands r0, r2
	movs r1, #4
	orrs r0, r1
	ldr r1, .L0808F018 @ =0x0000E0FF
	ands r0, r1
	movs r2, #0x80
	lsls r2, r2, #4
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r7, #0x3c]
	bl func_fe6_0808DD40
	ldr r0, .L0808F01C @ =gUnk_0834138C
	movs r1, #0x80
	movs r2, #0x40
	bl ApplyPaletteExt
	ldr r0, .L0808F020 @ =gUnk_08341DA0
	movs r1, #0xc0
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, .L0808F024 @ =Pal_0833C03C
	movs r1, #0x90
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r4, .L0808F028 @ =gUnk_08342A98
	movs r1, #0x98
	lsls r1, r1, #2
	adds r0, r4, #0
	movs r2, #0x20
	bl ApplyPaletteExt
	movs r1, #0xd8
	lsls r1, r1, #2
	adds r0, r4, #0
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, .L0808F02C @ =Img_Unk_083092CC
	ldr r1, .L0808F030 @ =0x06011000
	bl Decompress
	ldr r0, .L0808F034 @ =Img_PlayRankCharacters
	ldr r1, .L0808F038 @ =0x06011800
	bl Decompress
	ldr r0, .L0808F03C @ =Img_PlayRank
	ldr r1, .L0808F040 @ =0x06013000
	bl Decompress
	ldr r0, .L0808F044 @ =Img_PlayRank_083413CC
	ldr r1, .L0808F048 @ =0x0600D000
	bl Decompress
	ldr r4, .L0808F04C @ =Img_WorldMap_PlayRank
	movs r0, #3
	bl GetBgChrOffset
	adds r1, r0, #0
	movs r0, #0xc0
	lsls r0, r0, #0x13
	adds r1, r1, r0
	adds r0, r4, #0
	bl Decompress
	ldr r1, .L0808F050 @ =0x00000426
	adds r5, r5, r1
	ldr r1, .L0808F054 @ =Tsa_08342AF8
	movs r2, #0x80
	lsls r2, r2, #5
	adds r0, r5, #0
	bl TmApplyTsa_thm
	movs r1, #0xa0
	lsls r1, r1, #2
	mov r0, r8
	movs r2, #6
	bl func_fe6_0808ECD0
	ldr r1, .L0808F058 @ =Tsa_08340ED8
	movs r2, #0x80
	lsls r2, r2, #7
	mov r0, sl
	bl TmApplyTsa_thm
	ldr r0, .L0808F05C @ =ProcScr_0868B768
	movs r1, #3
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
.L0808EFE8: .4byte gDispIo
.L0808EFEC: .4byte gPlayRankCurChapter
.L0808EFF0: .4byte unk_02016A26
.L0808EFF4: .4byte unk_02016A2C
.L0808EFF8: .4byte unk_02016A1C
.L0808EFFC: .4byte unk_02016A1E
.L0808F000: .4byte unk_02016A20
.L0808F004: .4byte gBg0Tm
.L0808F008: .4byte gBg1Tm
.L0808F00C: .4byte gBg2Tm
.L0808F010: .4byte gBg3Tm
.L0808F014: .4byte 0x0000FFE0
.L0808F018: .4byte 0x0000E0FF
.L0808F01C: .4byte gUnk_0834138C
.L0808F020: .4byte gUnk_08341DA0
.L0808F024: .4byte Pal_0833C03C
.L0808F028: .4byte gUnk_08342A98
.L0808F02C: .4byte Img_Unk_083092CC
.L0808F030: .4byte 0x06011000
.L0808F034: .4byte Img_PlayRankCharacters
.L0808F038: .4byte 0x06011800
.L0808F03C: .4byte Img_PlayRank
.L0808F040: .4byte 0x06013000
.L0808F044: .4byte Img_PlayRank_083413CC
.L0808F048: .4byte 0x0600D000
.L0808F04C: .4byte Img_WorldMap_PlayRank
.L0808F050: .4byte 0x00000426
.L0808F054: .4byte Tsa_08342AF8
.L0808F058: .4byte Tsa_08340ED8
.L0808F05C: .4byte ProcScr_0868B768

	thumb_func_start func_fe6_0808F060
func_fe6_0808F060: @ 0x0808F060
	push {r4, lr}
	movs r4, #0
	movs r1, #4
	strh r1, [r0, #0x2e]
	strh r4, [r0, #0x30]
	ldr r2, .L0808F08C @ =unk_02016A1C
	ldr r1, .L0808F090 @ =unk_02016A22
	movs r0, #0x7a
	strh r0, [r1]
	strh r0, [r2]
	movs r0, #0
	bl PlayRank_ChapterTurns_DrawTurn
	ldr r0, .L0808F094 @ =gPlayRankCurChapter
	strh r4, [r0]
	movs r0, #1
	bl EnableBgSync
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0808F08C: .4byte unk_02016A1C
.L0808F090: .4byte unk_02016A22
.L0808F094: .4byte gPlayRankCurChapter

	thumb_func_start PlayRank_Loop
PlayRank_Loop: @ 0x0808F098
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	movs r1, #0x30
	ldrsh r0, [r4, r1]
	cmp r0, #0
	beq .L0808F0B0
	ldr r0, .L0808F12C @ =unk_02016A1C
	ldrh r0, [r0]
	bl func_fe6_0808EC78
	movs r0, #0
	strh r0, [r4, #0x30]
.L0808F0B0:
	ldr r7, .L0808F130 @ =unk_02016A26
	ldrh r0, [r7]
	cmp r0, #8
	bhi .L0808F0CC
	ldrh r0, [r4, #0x2e]
	adds r1, r0, #1
	strh r1, [r4, #0x2e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #3
	bgt .L0808F0C8
	b .L0808F220
.L0808F0C8:
	movs r0, #0
	strh r0, [r4, #0x2e]
.L0808F0CC:
	ldr r5, .L0808F12C @ =unk_02016A1C
	ldrh r2, [r5]
	adds r2, #1
	strh r2, [r5]
	movs r6, #0xff
	ands r2, r6
	movs r0, #0
	movs r1, #0
	bl SetBgOffset
	ldrh r1, [r7]
	cmp r1, #0xc
	bls .L0808F0F8
	ldr r0, .L0808F134 @ =unk_02016A1E
	ldrh r2, [r0]
	adds r2, #1
	strh r2, [r0]
	ands r2, r6
	movs r0, #1
	movs r1, #0
	bl SetBgOffset
.L0808F0F8:
	ldr r2, .L0808F138 @ =unk_02016A22
	ldrh r5, [r5]
	ldrh r1, [r2]
	subs r0, r5, r1
	movs r1, #0xf0
	ands r0, r1
	asrs r1, r0, #3
	ldr r0, .L0808F13C @ =unk_02016A20
	adds r3, r0, #0
	ldrh r0, [r3]
	cmp r1, r0
	bne .L0808F112
	b .L0808F220
.L0808F112:
	strh r1, [r3]
	movs r0, #1
	strh r0, [r4, #0x30]
	ldrh r0, [r7]
	cmp r0, #0xe
	bls .L0808F120
	b .L0808F218
.L0808F120:
	lsls r0, r0, #2
	ldr r1, .L0808F140 @ =.L0808F144
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
.L0808F12C: .4byte unk_02016A1C
.L0808F130: .4byte unk_02016A26
.L0808F134: .4byte unk_02016A1E
.L0808F138: .4byte unk_02016A22
.L0808F13C: .4byte unk_02016A20
.L0808F140: .4byte .L0808F144
.L0808F144: @ jump table
	.4byte .L0808F180 @ case 0
	.4byte .L0808F218 @ case 1
	.4byte .L0808F218 @ case 2
	.4byte .L0808F218 @ case 3
	.4byte .L0808F218 @ case 4
	.4byte .L0808F218 @ case 5
	.4byte .L0808F218 @ case 6
	.4byte .L0808F218 @ case 7
	.4byte .L0808F18E @ case 8
	.4byte .L0808F1A4 @ case 9
	.4byte .L0808F218 @ case 10
	.4byte .L0808F1BC @ case 11
	.4byte .L0808F218 @ case 12
	.4byte .L0808F1C4 @ case 13
	.4byte .L0808F1EC @ case 14
.L0808F180:
	ldrh r0, [r3]
	bl PlayRank_ChapterTurns_DrawTurn
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L0808F220
	b .L0808F218
.L0808F18E:
	ldr r0, .L0808F1A0 @ =gBg0Tm
	movs r1, #0
	bl TmFill
	movs r0, #1
	bl EnableBgSync
	b .L0808F218
	.align 2, 0
.L0808F1A0: .4byte gBg0Tm
.L0808F1A4:
	movs r1, #0x80
	strh r1, [r2]
	ldr r0, .L0808F1B8 @ =unk_02016A1C
	strh r1, [r0]
	movs r0, #0
	strh r0, [r3]
	bl func_fe6_0808EA74
	b .L0808F218
	.align 2, 0
.L0808F1B8: .4byte unk_02016A1C
.L0808F1BC:
	ldrh r0, [r3]
	bl func_fe6_0808EB94
	b .L0808F218
.L0808F1C4:
	ldrh r0, [r3]
	bl func_fe6_0808EC48
	ldr r2, .L0808F1E8 @ =gDispIo
	adds r2, #0x36
	movs r0, #1
	ldrb r1, [r2]
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2]
	b .L0808F218
	.align 2, 0
.L0808F1E8: .4byte gDispIo
.L0808F1EC:
	ldr r1, .L0808F20C @ =unk_02016A2A
	movs r0, #0
	strh r0, [r1]
	ldr r0, .L0808F210 @ =ProcScr_0868B730
	movs r1, #3
	bl SpawnProc
	ldr r0, .L0808F214 @ =ProcScr_0868B6D8
	movs r1, #3
	bl SpawnProc
	adds r0, r4, #0
	bl Proc_Break
	b .L0808F220
	.align 2, 0
.L0808F20C: .4byte unk_02016A2A
.L0808F210: .4byte ProcScr_0868B730
.L0808F214: .4byte ProcScr_0868B6D8
.L0808F218:
	ldr r1, .L0808F228 @ =unk_02016A26
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
.L0808F220:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0808F228: .4byte unk_02016A26

	thumb_func_start PlayRank_Idle
PlayRank_Idle: @ 0x0808F22C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, .L0808F254 @ =gKeySt
	ldr r1, [r0]
	movs r0, #3
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq .L0808F25C
	ldr r0, .L0808F258 @ =gpPlayRankSt
	ldr r0, [r0]
	adds r0, #0x9f
	ldrb r0, [r0]
	cmp r0, #6
	bne .L0808F25C
	adds r0, r4, #0
	bl Proc_Break
	b .L0808F270
	.align 2, 0
.L0808F254: .4byte gKeySt
.L0808F258: .4byte gpPlayRankSt
.L0808F25C:
	bl func_fe6_08036DEC
	cmp r0, #0
	beq .L0808F270
	ldr r1, .L0808F278 @ =unk_02016A2C
	movs r0, #1
	strb r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
.L0808F270:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0808F278: .4byte unk_02016A2C

	thumb_func_start PlayRank_End1
PlayRank_End1: @ 0x0808F27C
	push {lr}
	ldr r0, .L0808F298 @ =ProcScr_0868B5E8
	bl Proc_EndEach
	ldr r0, .L0808F29C @ =ProcScr_0868B88C
	bl Proc_EndEach
	ldr r0, .L0808F2A0 @ =ProcScr_0868B610
	bl Proc_EndEach
	bl EndGreenText
	pop {r0}
	bx r0
	.align 2, 0
.L0808F298: .4byte ProcScr_0868B5E8
.L0808F29C: .4byte ProcScr_0868B88C
.L0808F2A0: .4byte ProcScr_0868B610

	thumb_func_start PlayRank_End2
PlayRank_End2: @ 0x0808F2A4
	push {lr}
	ldr r0, .L0808F2D4 @ =ProcScr_0868B648
	bl Proc_EndEach
	ldr r0, .L0808F2D8 @ =ProcScr_0868B768
	bl Proc_EndEach
	ldr r0, .L0808F2DC @ =ProcScr_0868B730
	bl Proc_EndEach
	ldr r0, .L0808F2E0 @ =ProcScr_0868B6D8
	bl Proc_EndEach
	ldr r0, .L0808F2E4 @ =ProcScr_0868B80C
	bl Proc_EndEach
	ldr r0, .L0808F2E8 @ =ProcScr_0868B8AC
	bl Proc_EndEach
	ldr r0, .L0808F2EC @ =ProcScr_0868B750
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
.L0808F2D4: .4byte ProcScr_0868B648
.L0808F2D8: .4byte ProcScr_0868B768
.L0808F2DC: .4byte ProcScr_0868B730
.L0808F2E0: .4byte ProcScr_0868B6D8
.L0808F2E4: .4byte ProcScr_0868B80C
.L0808F2E8: .4byte ProcScr_0868B8AC
.L0808F2EC: .4byte ProcScr_0868B750

	thumb_func_start PlayRank_End3
PlayRank_End3: @ 0x0808F2F0
	push {lr}
	adds r1, r0, #0
	ldr r0, .L0808F308 @ =unk_02016A2C
	ldrb r0, [r0]
	cmp r0, #0
	bne .L0808F304
	adds r0, r1, #0
	movs r1, #1
	bl Proc_Goto
.L0808F304:
	pop {r0}
	bx r0
	.align 2, 0
.L0808F308: .4byte unk_02016A2C
