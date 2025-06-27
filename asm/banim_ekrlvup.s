	.include "macro.inc"

	.syntax unified

	.section .data

	.global gUnk_08606254
gUnk_08606254: @ 08606254
	.incbin "fe6-base.gba", 0x606254, (0x60626C - 0x606254) @ length: 0018

	.global gUnk_0860626C
gUnk_0860626C: @ 0860626C
	.incbin "fe6-base.gba", 0x60626C, (0x60628C - 0x60626C) @ length: 0020

	.global gUnk_0860628C
gUnk_0860628C: @ 0860628C
	.incbin "fe6-base.gba", 0x60628C, (0x6062AC - 0x60628C) @ length: 0020

	.global gUnk_086062AC
gUnk_086062AC: @ 086062AC
	.incbin "fe6-base.gba", 0x6062AC, (0x6062EC - 0x6062AC) @ length: 0040

	.global gUnk_086062EC
gUnk_086062EC: @ 086062EC
	.incbin "fe6-base.gba", 0x6062EC, (0x606314 - 0x6062EC) @ length: 0028

	.section .text

	thumb_func_start func_fe6_0805D4E0
func_fe6_0805D4E0: @ 0x0805D4E0
	push {r4, r5, lr}
	adds r4, r1, #0
	lsls r5, r4, #3
	ldr r0, .L0805D528 @ =gBanimText + 0x40
	adds r5, r5, r0
	adds r0, r5, #0
	bl ClearText
	adds r0, r5, #0
	movs r1, #8
	bl Text_SetCursor
	adds r0, r5, #0
	movs r1, #2
	bl Text_SetColor
	ldr r0, .L0805D52C @ =gEkrLvupBaseStatus
	lsls r4, r4, #1
	adds r0, r4, r0
	ldrh r1, [r0]
	adds r0, r5, #0
	bl Text_DrawNumber
	ldr r0, .L0805D530 @ =sEfxLvupPartsPos
	adds r4, r4, r0
	ldrh r4, [r4]
	lsls r1, r4, #1
	ldr r0, .L0805D534 @ =gBg2Tm+0x6
	adds r1, r1, r0
	adds r0, r5, #0
	bl PutText
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0805D528: .4byte gBanimText + 0x40
.L0805D52C: .4byte gEkrLvupBaseStatus
.L0805D530: .4byte sEfxLvupPartsPos
.L0805D534: .4byte gBg2Tm+0x6

	thumb_func_start func_fe6_0805D538
func_fe6_0805D538: @ 0x0805D538
	push {r4, lr}
	ldr r4, .L0805D564 @ =gBanimText + 0x80
	adds r0, r4, #0
	bl ClearText
	ldr r0, .L0805D568 @ =gpEkrLvupUnit
	ldr r0, [r0]
	ldr r0, [r0, #4]
	ldrh r0, [r0]
	bl DecodeMsg
	adds r1, r0, #0
	adds r0, r4, #0
	bl Text_DrawString
	ldr r1, .L0805D56C @ =gBg2Tm+0x1C4
	adds r0, r4, #0
	bl PutText
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0805D564: .4byte gBanimText + 0x80
.L0805D568: .4byte gpEkrLvupUnit
.L0805D56C: .4byte gBg2Tm+0x1C4

	thumb_func_start func_fe6_0805D570
func_fe6_0805D570: @ 0x0805D570
	push {r4, lr}
	ldr r4, .L0805D5A4 @ =gBanimText + 0x90
	adds r0, r4, #0
	bl ClearText
	adds r0, r4, #0
	movs r1, #8
	bl Text_SetCursor
	adds r0, r4, #0
	movs r1, #2
	bl Text_SetColor
	ldr r0, .L0805D5A8 @ =gEkrLvupPreLevel
	ldrh r1, [r0]
	adds r0, r4, #0
	bl Text_DrawNumber
	ldr r1, .L0805D5AC @ =gBg2Tm+0x1DA
	adds r0, r4, #0
	bl PutText
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0805D5A4: .4byte gBanimText + 0x90
.L0805D5A8: .4byte gEkrLvupPreLevel
.L0805D5AC: .4byte gBg2Tm+0x1DA

	thumb_func_start NewEkrLevelup
NewEkrLevelup: @ 0x0805D5B0
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r5, .L0805D5E8 @ =gpProcEkrLevelup
	ldr r0, .L0805D5EC @ =ProcScr_EkrLevelup
	movs r1, #3
	bl SpawnProc
	adds r6, r0, #0
	str r6, [r5]
	str r4, [r6, #0x5c]
	adds r0, r4, #0
	bl GetAnimAnotherSide
	str r0, [r6, #0x60]
	movs r1, #0
	movs r0, #0
	strh r0, [r6, #0x2c]
	adds r0, r6, #0
	adds r0, #0x29
	strb r1, [r0]
	ldr r0, .L0805D5F0 @ =gEkrDistanceType
	ldrh r0, [r0]
	cmp r0, #4
	beq .L0805D5F4
	adds r0, r6, #0
	adds r0, #0x2a
	strb r1, [r0]
	b .L0805D5FC
	.align 2, 0
.L0805D5E8: .4byte gpProcEkrLevelup
.L0805D5EC: .4byte ProcScr_EkrLevelup
.L0805D5F0: .4byte gEkrDistanceType
.L0805D5F4:
	adds r1, r6, #0
	adds r1, #0x2a
	movs r0, #1
	strb r0, [r1]
.L0805D5FC:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start EkrLvup_Init
EkrLvup_Init: @ 0x0805D604
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	mov sb, r0
	ldr r7, .L0805D6B4 @ =gUnk_Banim_0201F084
	movs r4, #0
	str r4, [sp]
	ldr r5, .L0805D6B8 @ =gBg1Tm
	ldr r0, .L0805D6BC @ =0x01000200
	mov r8, r0
	mov r0, sp
	adds r1, r5, #0
	mov r2, r8
	bl CpuFastSet
	str r4, [sp, #4]
	add r0, sp, #4
	ldr r6, .L0805D6C0 @ =gBg2Tm
	adds r1, r6, #0
	mov r2, r8
	bl CpuFastSet
	ldr r1, .L0805D6C4 @ =0x06006800
	movs r4, #0x80
	lsls r4, r4, #4
	adds r0, r5, #0
	adds r2, r4, #0
	bl RegisterDataMove
	ldr r1, .L0805D6C8 @ =0x06007000
	adds r0, r5, #0
	adds r2, r4, #0
	bl RegisterDataMove
	ldr r1, .L0805D6CC @ =0x06005000
	adds r0, r6, #0
	adds r2, r4, #0
	bl RegisterDataMove
	ldr r1, .L0805D6D0 @ =0x06005800
	adds r0, r6, #0
	adds r2, r4, #0
	bl RegisterDataMove
	ldr r1, .L0805D6D4 @ =gBanimFloorfx
	ldrh r4, [r1]
	strh r4, [r7]
	movs r0, #3
	strh r0, [r7, #2]
	adds r0, #0xfd
	strh r0, [r7, #4]
	ldrh r3, [r1, #2]
	strh r3, [r7, #6]
	movs r0, #4
	strh r0, [r7, #8]
	movs r0, #0xa0
	lsls r0, r0, #1
	strh r0, [r7, #0xa]
	ldr r0, .L0805D6D8 @ =gEkrDistanceType
	ldrh r1, [r0]
	strh r1, [r7, #0xc]
	ldr r0, .L0805D6DC @ =0x0000FFFF
	adds r2, r0, #0
	ldrh r0, [r7, #0xe]
	orrs r0, r2
	strh r0, [r7, #0xe]
	ldr r0, .L0805D6E0 @ =0x06010000
	str r0, [r7, #0x1c]
	ldr r0, .L0805D6E4 @ =gUnk_Banim_020145C0
	str r0, [r7, #0x20]
	ldr r0, .L0805D6E8 @ =gEkrSnowWeather
	ldrh r0, [r0]
	strh r0, [r7, #0x10]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	cmp r1, #2
	bne .L0805D6F6
	ldr r0, .L0805D6EC @ =gEkrInitPosReal
	ldr r0, [r0]
	cmp r0, #0
	bne .L0805D6F0
	adds r0, r3, #0
	orrs r0, r2
	strh r0, [r7, #6]
	b .L0805D6F6
	.align 2, 0
.L0805D6B4: .4byte gUnk_Banim_0201F084
.L0805D6B8: .4byte gBg1Tm
.L0805D6BC: .4byte 0x01000200
.L0805D6C0: .4byte gBg2Tm
.L0805D6C4: .4byte 0x06006800
.L0805D6C8: .4byte 0x06007000
.L0805D6CC: .4byte 0x06005000
.L0805D6D0: .4byte 0x06005800
.L0805D6D4: .4byte gBanimFloorfx
.L0805D6D8: .4byte gEkrDistanceType
.L0805D6DC: .4byte 0x0000FFFF
.L0805D6E0: .4byte 0x06010000
.L0805D6E4: .4byte gUnk_Banim_020145C0
.L0805D6E8: .4byte gEkrSnowWeather
.L0805D6EC: .4byte gEkrInitPosReal
.L0805D6F0:
	adds r0, r4, #0
	orrs r0, r2
	strh r0, [r7]
.L0805D6F6:
	bl GetBattleAnimArenaFlag
	cmp r0, #0
	bne .L0805D71E
	adds r0, r7, #0
	bl func_fe6_0804BF40
	ldr r3, [r7, #0x14]
	ldr r0, [r3, #0x4c]
	ldr r2, .L0805D89C @ =0x0000F3FF
	ands r0, r2
	movs r1, #0xc0
	lsls r1, r1, #4
	orrs r0, r1
	str r0, [r3, #0x4c]
	ldr r3, [r7, #0x18]
	ldr r0, [r3, #0x4c]
	ands r0, r2
	orrs r0, r1
	str r0, [r3, #0x4c]
.L0805D71E:
	mov r2, sb
	ldr r1, [r2, #0x5c]
	ldr r7, .L0805D89C @ =0x0000F3FF
	adds r0, r7, #0
	ldrh r3, [r1, #8]
	ands r0, r3
	strh r0, [r1, #8]
	ldr r1, [r2, #0x5c]
	movs r0, #0xc0
	lsls r0, r0, #4
	adds r2, r0, #0
	ldrh r0, [r1, #8]
	orrs r0, r2
	strh r0, [r1, #8]
	mov r3, sb
	ldr r1, [r3, #0x60]
	adds r0, r7, #0
	ldrh r3, [r1, #8]
	ands r0, r3
	strh r0, [r1, #8]
	mov r0, sb
	ldr r1, [r0, #0x60]
	movs r3, #0
	mov sl, r3
	ldrh r0, [r1, #8]
	orrs r0, r2
	strh r0, [r1, #8]
	ldr r4, .L0805D8A0 @ =gDispIo
	movs r5, #4
	rsbs r5, r5, #0
	adds r0, r5, #0
	ldrb r1, [r4, #0x14]
	ands r0, r1
	strb r0, [r4, #0x14]
	adds r0, r5, #0
	ldrb r2, [r4, #0x10]
	ands r0, r2
	movs r3, #1
	mov r8, r3
	mov r1, r8
	orrs r0, r1
	strb r0, [r4, #0x10]
	adds r0, r5, #0
	ldrb r2, [r4, #0xc]
	ands r0, r2
	movs r6, #2
	orrs r0, r6
	strb r0, [r4, #0xc]
	movs r0, #3
	ldrb r3, [r4, #0x18]
	orrs r0, r3
	strb r0, [r4, #0x18]
	movs r0, #0
	bl GetEkrDragonWeapon
	ldrh r0, [r0]
	cmp r0, #0x53
	bne .L0805D7D6
	mov r0, sb
	ldr r1, [r0, #0x60]
	adds r0, r7, #0
	ldrh r2, [r1, #8]
	ands r0, r2
	strh r0, [r1, #8]
	mov r3, sb
	ldr r1, [r3, #0x60]
	movs r2, #0x80
	lsls r2, r2, #4
	adds r0, r2, #0
	ldrh r3, [r1, #8]
	orrs r0, r3
	strh r0, [r1, #8]
	adds r0, r5, #0
	ldrb r1, [r4, #0xc]
	ands r0, r1
	orrs r0, r6
	strb r0, [r4, #0xc]
	adds r0, r5, #0
	ldrb r2, [r4, #0x10]
	ands r0, r2
	mov r3, r8
	orrs r0, r3
	strb r0, [r4, #0x10]
	adds r0, r5, #0
	ldrb r1, [r4, #0x14]
	ands r0, r1
	strb r0, [r4, #0x14]
	adds r0, r5, #0
	ldrb r2, [r4, #0x18]
	ands r0, r2
	orrs r0, r6
	strb r0, [r4, #0x18]
.L0805D7D6:
	ldr r0, .L0805D8A4 @ =gUnk_Banim_0201F0D8
	movs r1, #0x90
	strh r1, [r0]
	ldr r0, .L0805D8A8 @ =gUnk_Banim_0201F0DA
	strh r1, [r0]
	movs r0, #2
	movs r1, #0
	movs r2, #8
	bl SetBgOffset
	movs r0, #1
	movs r1, #0
	movs r2, #8
	bl SetBgOffset
	movs r1, #0xc0
	lsls r1, r1, #7
	movs r0, #0
	bl SetBgTilemapOffset
	movs r1, #0xd0
	lsls r1, r1, #7
	movs r0, #1
	bl SetBgTilemapOffset
	movs r1, #0xa0
	lsls r1, r1, #7
	movs r0, #2
	bl SetBgTilemapOffset
	movs r0, #1
	movs r1, #1
	bl SetBgScreenSize
	movs r0, #2
	movs r1, #1
	bl SetBgScreenSize
	bl func_fe6_0805E230
	ldr r1, .L0805D8AC @ =gUnk_Banim_0201F07C
	str r0, [r1]
	bl func_fe6_0805E370
	ldr r1, .L0805D8B0 @ =gUnk_Banim_0201F080
	str r0, [r1]
	bl func_fe6_0805E248
	movs r0, #2
	bl EkrGauge_Setup44
	mov r3, sb
	ldr r0, [r3, #0x5c]
	bl DisableEfxStatusUnits
	mov r1, sb
	ldr r0, [r1, #0x60]
	bl DisableEfxStatusUnits
	bl DisableEfxWeaponIcon
	bl DisableEfxHpBarColorChange
	movs r0, #0x21
	rsbs r0, r0, #0
	ldrb r2, [r4, #1]
	ands r0, r2
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r4, #1]
	adds r1, r4, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r3, [r1]
	ands r0, r3
	strb r0, [r1]
	adds r1, #8
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x45
	mov r1, sl
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	mov r0, sb
	bl Proc_Break
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0805D89C: .4byte 0x0000F3FF
.L0805D8A0: .4byte gDispIo
.L0805D8A4: .4byte gUnk_Banim_0201F0D8
.L0805D8A8: .4byte gUnk_Banim_0201F0DA
.L0805D8AC: .4byte gUnk_Banim_0201F07C
.L0805D8B0: .4byte gUnk_Banim_0201F080

	thumb_func_start EkrLvup_InitLevelUpBox
EkrLvup_InitLevelUpBox: @ 0x0805D8B4
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0xc
	adds r6, r0, #0
	ldr r0, .L0805D95C @ =gpEkrBattleUnitLeft
	ldr r0, [r0]
	mov sb, r0
	ldr r0, .L0805D960 @ =gpEkrBattleUnitRight
	ldr r0, [r0]
	mov r8, r0
	ldr r7, [r6, #0x5c]
	ldr r0, .L0805D964 @ =Img_LevelUpFrame
	ldr r5, .L0805D968 @ =gSpellAnimBgfx
	adds r1, r5, #0
	bl LZ77UnCompWram
	ldr r0, .L0805D96C @ =Tm_LevelUpFrame
	ldr r4, .L0805D970 @ =gEkrTsaBuffer
	adds r1, r4, #0
	bl LZ77UnCompWram
	ldr r1, .L0805D974 @ =gBg1Tm+0x180
	movs r0, #1
	str r0, [sp]
	adds r0, #0xff
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r2, #0x20
	movs r3, #0x14
	bl EfxTmCpyBG
	ldr r1, .L0805D978 @ =0x06002000
	movs r2, #0x80
	lsls r2, r2, #3
	adds r0, r5, #0
	bl RegisterDataMove
	ldr r0, .L0805D97C @ =Pal_LevelUpFrame
	ldr r4, .L0805D980 @ =gPal+0x20
	adds r1, r4, #0
	movs r2, #8
	bl CpuFastSet
	ldr r0, .L0805D984 @ =gUnk_081150E8
	ldr r5, .L0805D988 @ =gBuf_Banim
	adds r1, r5, #0
	bl LZ77UnCompWram
	ldr r1, .L0805D98C @ =0x06011400
	movs r2, #0xc0
	lsls r2, r2, #4
	adds r0, r5, #0
	bl RegisterDataMove
	ldr r0, .L0805D990 @ =gUnk_081152FC
	movs r1, #0x80
	lsls r1, r1, #2
	adds r4, r4, r1
	adds r1, r4, #0
	movs r2, #8
	bl CpuFastSet
	bl EnablePalSync
	adds r0, r6, #0
	adds r0, #0x2a
	ldrb r4, [r0]
	cmp r4, #0
	bne .L0805D998
	movs r1, #2
	ldrsh r0, [r7, r1]
	ldr r2, .L0805D994 @ =gUnk_085CCC40
	movs r1, #0x30
	movs r3, #0
	bl func_fe6_0805E140
	movs r1, #0x85
	lsls r1, r1, #5
	str r1, [r0, #0x4c]
	strh r4, [r6, #0x2c]
	b .L0805D99C
	.align 2, 0
.L0805D95C: .4byte gpEkrBattleUnitLeft
.L0805D960: .4byte gpEkrBattleUnitRight
.L0805D964: .4byte Img_LevelUpFrame
.L0805D968: .4byte gSpellAnimBgfx
.L0805D96C: .4byte Tm_LevelUpFrame
.L0805D970: .4byte gEkrTsaBuffer
.L0805D974: .4byte gBg1Tm+0x180
.L0805D978: .4byte 0x06002000
.L0805D97C: .4byte Pal_LevelUpFrame
.L0805D980: .4byte gPal+0x20
.L0805D984: .4byte gUnk_081150E8
.L0805D988: .4byte gBuf_Banim
.L0805D98C: .4byte 0x06011400
.L0805D990: .4byte gUnk_081152FC
.L0805D994: .4byte gUnk_085CCC40
.L0805D998:
	movs r0, #0x50
	strh r0, [r6, #0x2c]
.L0805D99C:
	adds r0, r7, #0
	bl GetAnimPosition
	cmp r0, #0
	bne .L0805D9AA
	mov r1, sb
	b .L0805D9AC
.L0805D9AA:
	mov r1, r8
.L0805D9AC:
	ldr r0, [r1]
	ldrh r4, [r0, #6]
	ldr r0, .L0805D9F8 @ =FaceConfig_EkrLevelup
	bl SetFaceConfig
	movs r0, #0x42
	str r0, [sp]
	movs r0, #0
	adds r1, r4, #0
	movs r2, #0xbc
	movs r3, #0x50
	bl StartFace
	ldr r0, .L0805D9FC @ =gFaces
	ldr r1, [r0]
	movs r2, #0
	movs r0, #0xa0
	strh r0, [r1, #0x30]
	str r2, [sp, #8]
	ldr r1, .L0805DA00 @ =gBg2Tm
	ldr r2, .L0805DA04 @ =0x01000200
	add r0, sp, #8
	bl CpuFastSet
	adds r0, r6, #0
	bl EkrLvup_InitStatusText
	adds r0, r6, #0
	bl Proc_Break
	add sp, #0xc
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0805D9F8: .4byte FaceConfig_EkrLevelup
.L0805D9FC: .4byte gFaces
.L0805DA00: .4byte gBg2Tm
.L0805DA04: .4byte 0x01000200

	thumb_func_start func_fe6_0805DA08
func_fe6_0805DA08: @ 0x0805DA08
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, .L0805DA34 @ =func_fe6_0805E4D4
	bl SetOnHBlankA
	movs r0, #1
	bl EnableBgSync
	movs r0, #4
	bl EnableBgSync
	movs r0, #2
	bl EnableBgSync
	bl EnablePalSync
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0805DA34: .4byte func_fe6_0805E4D4

	thumb_func_start func_fe6_0805DA38
func_fe6_0805DA38: @ 0x0805DA38
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	movs r1, #0
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x50
	ble .L0805DA6E
	strh r1, [r4, #0x2c]
	str r1, [r4, #0x44]
	str r1, [r4, #0x48]
	movs r0, #2
	rsbs r0, r0, #0
	str r0, [r4, #0x4c]
	subs r0, #2
	str r0, [r4, #0x50]
	ldr r0, .L0805DA74 @ =gPal
	ldr r1, .L0805DA78 @ =gEfxPal
	movs r2, #0x80
	lsls r2, r2, #1
	bl CpuFastSet
	adds r0, r4, #0
	bl Proc_Break
.L0805DA6E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0805DA74: .4byte gPal
.L0805DA78: .4byte gEfxPal

	thumb_func_start func_fe6_0805DA7C
func_fe6_0805DA7C: @ 0x0805DA7C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r7, r0, #0
	ldr r3, [r7, #0x44]
	ldr r5, [r7, #0x48]
	ldr r6, [r7, #0x4c]
	ldr r0, [r7, #0x50]
	mov sb, r0
	cmp r3, #0
	bge .L0805DA9C
	movs r3, #0
	b .L0805DAA2
.L0805DA9C:
	cmp r3, #8
	ble .L0805DAA2
	movs r3, #8
.L0805DAA2:
	cmp r5, #0
	bge .L0805DAAA
	movs r5, #0
	b .L0805DAB0
.L0805DAAA:
	cmp r5, #8
	ble .L0805DAB0
	movs r5, #8
.L0805DAB0:
	cmp r6, #0
	bge .L0805DAB8
	movs r6, #0
	b .L0805DABE
.L0805DAB8:
	cmp r6, #8
	ble .L0805DABE
	movs r6, #8
.L0805DABE:
	mov r2, sb
	cmp r2, #0
	bge .L0805DAC8
	movs r0, #0
	b .L0805DAD0
.L0805DAC8:
	mov r2, sb
	cmp r2, #8
	ble .L0805DAD2
	movs r0, #8
.L0805DAD0:
	mov sb, r0
.L0805DAD2:
	ldr r0, [r7, #0x44]
	adds r0, #1
	str r0, [r7, #0x44]
	ldr r0, [r7, #0x48]
	adds r0, #1
	str r0, [r7, #0x48]
	ldr r0, [r7, #0x4c]
	adds r0, #1
	str r0, [r7, #0x4c]
	ldr r0, [r7, #0x50]
	adds r0, #1
	str r0, [r7, #0x50]
	movs r1, #0x50
	rsbs r1, r1, #0
	movs r4, #8
	str r4, [sp]
	movs r0, #0
	movs r2, #0
	bl Interpolate
	mov r8, r0
	str r4, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #8
	adds r3, r5, #0
	bl Interpolate
	mov sl, r0
	ldr r5, .L0805DB90 @ =gUnk_Banim_0201F0D8
	str r4, [sp]
	movs r0, #0
	movs r1, #0x90
	movs r2, #0
	adds r3, r6, #0
	bl Interpolate
	strh r0, [r5]
	ldr r5, .L0805DB94 @ =gUnk_Banim_0201F0DA
	str r4, [sp]
	movs r0, #0
	movs r1, #0x90
	movs r2, #0
	mov r3, sb
	bl Interpolate
	strh r0, [r5]
	ldr r0, .L0805DB98 @ =gFaces
	ldr r1, [r0]
	movs r0, #0x50
	mov r2, r8
	subs r0, r0, r2
	strh r0, [r1, #0x30]
	ldr r0, .L0805DB9C @ =gEfxPal
	ldr r4, .L0805DBA0 @ =gPal
	movs r2, #0x80
	lsls r2, r2, #1
	adds r1, r4, #0
	bl CpuFastSet
	adds r0, r4, #0
	movs r1, #2
	movs r2, #4
	mov r3, sl
	bl EfxPalBlackInOut
	adds r0, r4, #0
	movs r1, #0x13
	movs r2, #0xc
	mov r3, sl
	bl EfxPalBlackInOut
	bl EnablePalSync
	ldrh r0, [r7, #0x2c]
	adds r0, #1
	strh r0, [r7, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x14
	ble .L0805DB7E
	movs r0, #0
	strh r0, [r7, #0x2c]
	adds r0, r7, #0
	bl Proc_Break
.L0805DB7E:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0805DB90: .4byte gUnk_Banim_0201F0D8
.L0805DB94: .4byte gUnk_Banim_0201F0DA
.L0805DB98: .4byte gFaces
.L0805DB9C: .4byte gEfxPal
.L0805DBA0: .4byte gPal

	thumb_func_start func_fe6_0805DBA4
func_fe6_0805DBA4: @ 0x0805DBA4
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0xa0
	movs r1, #1
	movs r2, #1
	movs r3, #3
	bl StartManimLevelUpStatGainLabels
	adds r0, r4, #0
	bl Proc_Break
	ldr r1, .L0805DBD0 @ =gUnk_Banim_0201F05C
	movs r2, #0
	adds r0, r1, #0
	adds r0, #0x1c
.L0805DBC2:
	str r2, [r0]
	subs r0, #4
	cmp r0, r1
	bge .L0805DBC2
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0805DBD0: .4byte gUnk_Banim_0201F05C

	thumb_func_start func_fe6_0805DBD4
func_fe6_0805DBD4: @ 0x0805DBD4
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	cmp r0, #0
	bne .L0805DBE8
	adds r0, r5, #0
	bl Proc_Break
	b .L0805DC1E
.L0805DBE8:
	ldr r0, .L0805DC24 @ =func_fe6_0805E510
	bl SetOnHBlankA
	ldr r4, .L0805DC28 @ =gUnk_Banim_0201F07C
	ldr r0, [r4]
	bl Proc_End
	bl func_fe6_0805E2CC
	str r0, [r4]
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0x76
	bl EfxPlaySE
	movs r0, #0x76
	movs r1, #0x38
	movs r2, #0
	bl M4aPlayWithPostionCtrl
	movs r0, #0
	strh r0, [r5, #0x2c]
	movs r0, #8
	strh r0, [r5, #0x2e]
	adds r0, r5, #0
	bl Proc_Break
.L0805DC1E:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0805DC24: .4byte func_fe6_0805E510
.L0805DC28: .4byte gUnk_Banim_0201F07C

	thumb_func_start func_fe6_0805DC2C
func_fe6_0805DC2C: @ 0x0805DC2C
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	cmp r0, #0
	bne .L0805DC42
	adds r0, r5, #0
	bl Proc_Break
	b .L0805DC96
.L0805DC42:
	ldr r4, .L0805DCA0 @ =gUnk_Banim_0201F0D8
	movs r2, #0x80
	lsls r2, r2, #5
	movs r0, #0x2c
	ldrsh r3, [r5, r0]
	movs r1, #0x2e
	ldrsh r0, [r5, r1]
	str r0, [sp]
	movs r0, #1
	movs r1, #0
	bl Interpolate
	strh r0, [r4]
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r5, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	ble .L0805DC96
	ldr r1, .L0805DCA4 @ =gpEkrLvupUnit
	ldr r0, .L0805DCA8 @ =gpEkrLvupBattleUnit
	ldr r0, [r0]
	str r0, [r1]
	adds r0, r5, #0
	bl func_fe6_0805D538
	ldr r1, .L0805DCAC @ =gEkrLvupPreLevel
	ldr r0, .L0805DCB0 @ =gEkrLvupPostLevel
	ldrh r0, [r0]
	strh r0, [r1]
	adds r0, r5, #0
	bl func_fe6_0805D570
	movs r0, #0
	strh r0, [r5, #0x2c]
	movs r0, #8
	strh r0, [r5, #0x2e]
	adds r0, r5, #0
	bl Proc_Break
.L0805DC96:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0805DCA0: .4byte gUnk_Banim_0201F0D8
.L0805DCA4: .4byte gpEkrLvupUnit
.L0805DCA8: .4byte gpEkrLvupBattleUnit
.L0805DCAC: .4byte gEkrLvupPreLevel
.L0805DCB0: .4byte gEkrLvupPostLevel

	thumb_func_start func_fe6_0805DCB4
func_fe6_0805DCB4: @ 0x0805DCB4
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	cmp r0, #0
	bne .L0805DCCA
	adds r0, r5, #0
	bl Proc_Break
	b .L0805DCFA
.L0805DCCA:
	ldr r4, .L0805DD04 @ =gUnk_Banim_0201F0D8
	movs r1, #0x80
	lsls r1, r1, #5
	movs r0, #0x2c
	ldrsh r3, [r5, r0]
	movs r2, #0x2e
	ldrsh r0, [r5, r2]
	str r0, [sp]
	movs r0, #4
	movs r2, #0
	bl Interpolate
	strh r0, [r4]
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r5, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	ble .L0805DCFA
	adds r0, r5, #0
	bl Proc_Break
.L0805DCFA:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0805DD04: .4byte gUnk_Banim_0201F0D8

	thumb_func_start func_fe6_0805DD08
func_fe6_0805DD08: @ 0x0805DD08
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	cmp r0, #0
	bne .L0805DD54
	strh r0, [r5, #0x2c]
	movs r0, #0x84
	movs r1, #0x3c
	movs r2, #0
	movs r3, #0
	bl StartManimLevelUpStatGainLabelAnim
	ldr r1, .L0805DD4C @ =gEkrLvupPreLevel
	ldr r0, .L0805DD50 @ =gEkrLvupPostLevel
	ldrh r0, [r0]
	strh r0, [r1]
	adds r0, r5, #0
	bl func_fe6_0805D570
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0x76
	bl EfxPlaySE
	movs r0, #0x76
	movs r1, #0x38
	movs r2, #0
	bl M4aPlayWithPostionCtrl
	adds r0, r5, #0
	bl Proc_Break
	b .L0805DD6E
	.align 2, 0
.L0805DD4C: .4byte gEkrLvupPreLevel
.L0805DD50: .4byte gEkrLvupPostLevel
.L0805DD54:
	ldr r4, .L0805DD74 @ =gUnk_Banim_0201F07C
	ldr r0, [r4]
	bl Proc_End
	bl func_fe6_0805E230
	str r0, [r4]
	movs r0, #0
	strh r0, [r5, #0x2c]
	strh r0, [r5, #0x2e]
	adds r0, r5, #0
	bl Proc_Break
.L0805DD6E:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0805DD74: .4byte gUnk_Banim_0201F07C

	thumb_func_start func_fe6_0805DD78
func_fe6_0805DD78: @ 0x0805DD78
	push {lr}
	adds r1, r0, #0
	adds r0, #0x2a
	ldrb r2, [r0]
	cmp r2, #0
	beq .L0805DD8C
	adds r0, r1, #0
	bl Proc_Break
	b .L0805DDA4
.L0805DD8C:
	ldrh r0, [r1, #0x2c]
	adds r0, #1
	strh r0, [r1, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x1d
	bgt .L0805DDA4
	strh r2, [r1, #0x2c]
	strh r2, [r1, #0x2e]
	adds r0, r1, #0
	bl Proc_Break
.L0805DDA4:
	pop {r0}
	bx r0

	thumb_func_start func_fe6_0805DDA8
func_fe6_0805DDA8: @ 0x0805DDA8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x14
	bne .L0805DE72
	movs r0, #0
	strh r0, [r4, #0x2c]
	ldrh r0, [r4, #0x2e]
	cmp r0, #8
	beq .L0805DE78
	ldr r6, .L0805DE4C @ =gEkrLvupBaseStatus
.L0805DDCA:
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	lsls r0, r0, #1
	adds r2, r0, r6
	ldr r1, .L0805DE50 @ =gEkrLvupPostStatus
	adds r0, r0, r1
	ldrh r0, [r0]
	ldrh r7, [r2]
	subs r5, r0, r7
	cmp r5, #0
	beq .L0805DE64
	movs r1, #0
	mov r8, r1
	strh r0, [r2]
	movs r2, #0x2e
	ldrsh r1, [r4, r2]
	adds r0, r4, #0
	bl func_fe6_0805D4E0
	movs r0, #0x76
	movs r1, #0x80
	lsls r1, r1, #1
	bl EfxPlaySE
	movs r0, #0x76
	movs r1, #0x38
	movs r2, #0
	bl M4aPlayWithPostionCtrl
	ldr r1, .L0805DE54 @ =sEfxLvupPartsPos
	movs r7, #0x2e
	ldrsh r2, [r4, r7]
	lsls r0, r2, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r0, #0x1f
	ands r0, r1
	lsls r0, r0, #3
	adds r0, #0x35
	movs r7, #0xfc
	lsls r7, r7, #3
	adds r3, r7, #0
	ands r1, r3
	lsrs r1, r1, #2
	adds r1, #6
	adds r2, #1
	adds r3, r5, #0
	bl StartManimLevelUpStatGainLabelAnim
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne .L0805DE44
	ldr r1, .L0805DE58 @ =gBanimMaxHP
	lsls r0, r0, #1
	adds r0, r0, r6
	ldrh r0, [r0]
	strh r0, [r1, #2]
	ldr r1, .L0805DE5C @ =gEkrGaugeHpBak
	ldr r0, .L0805DE60 @ =0x0000FFFF
	strh r0, [r1, #2]
.L0805DE44:
	mov r7, r8
	strh r7, [r4, #0x2c]
	b .L0805DE72
	.align 2, 0
.L0805DE4C: .4byte gEkrLvupBaseStatus
.L0805DE50: .4byte gEkrLvupPostStatus
.L0805DE54: .4byte sEfxLvupPartsPos
.L0805DE58: .4byte gBanimMaxHP
.L0805DE5C: .4byte gEkrGaugeHpBak
.L0805DE60: .4byte 0x0000FFFF
.L0805DE64:
	ldrh r0, [r4, #0x2e]
	adds r0, #1
	strh r0, [r4, #0x2e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #8
	bne .L0805DDCA
.L0805DE72:
	ldrh r0, [r4, #0x2e]
	cmp r0, #8
	bne .L0805DE82
.L0805DE78:
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r4, #0
	bl Proc_Break
.L0805DE82:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start func_fe6_0805DE8C
func_fe6_0805DE8C: @ 0x0805DE8C
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x3b
	ble .L0805DEB2
	movs r0, #0
	strh r0, [r4, #0x2c]
	bl EndManimLevelUpStatGainLabels
	ldr r0, .L0805DEB8 @ =func_fe6_0805E4D4
	bl SetOnHBlankA
	adds r0, r4, #0
	bl Proc_Break
.L0805DEB2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0805DEB8: .4byte func_fe6_0805E4D4

	thumb_func_start func_fe6_0805DEBC
func_fe6_0805DEBC: @ 0x0805DEBC
	push {lr}
	bl Proc_Break
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_fe6_0805DEC8
func_fe6_0805DEC8: @ 0x0805DEC8
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r7, r0, #0
	ldr r5, .L0805DF7C @ =gUnk_Banim_0201F0D8
	movs r0, #0x2c
	ldrsh r3, [r7, r0]
	movs r4, #8
	str r4, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0x90
	bl Interpolate
	strh r0, [r5]
	ldr r5, .L0805DF80 @ =gUnk_Banim_0201F0DA
	movs r0, #0x2c
	ldrsh r3, [r7, r0]
	str r4, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0x90
	bl Interpolate
	strh r0, [r5]
	movs r2, #0x50
	rsbs r2, r2, #0
	movs r0, #0x2c
	ldrsh r3, [r7, r0]
	str r4, [sp]
	movs r0, #0
	movs r1, #0
	bl Interpolate
	adds r5, r0, #0
	movs r0, #0x2c
	ldrsh r3, [r7, r0]
	str r4, [sp]
	movs r0, #0
	movs r1, #8
	movs r2, #0
	bl Interpolate
	adds r6, r0, #0
	ldr r0, .L0805DF84 @ =gFaces
	ldr r1, [r0]
	movs r0, #0x50
	subs r0, r0, r5
	strh r0, [r1, #0x30]
	ldr r0, .L0805DF88 @ =gEfxPal
	ldr r4, .L0805DF8C @ =gPal
	movs r2, #0x80
	lsls r2, r2, #1
	adds r1, r4, #0
	bl CpuFastSet
	adds r0, r4, #0
	movs r1, #2
	movs r2, #4
	adds r3, r6, #0
	bl EfxPalBlackInOut
	adds r0, r4, #0
	movs r1, #0x13
	movs r2, #0xc
	adds r3, r6, #0
	bl EfxPalBlackInOut
	bl EnablePalSync
	movs r0, #7
.L0805DF54:
	subs r0, #1
	cmp r0, #0
	bge .L0805DF54
	ldrh r0, [r7, #0x2c]
	adds r0, #1
	strh r0, [r7, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #8
	ble .L0805DF72
	movs r0, #0
	strh r0, [r7, #0x2c]
	adds r0, r7, #0
	bl Proc_Break
.L0805DF72:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0805DF7C: .4byte gUnk_Banim_0201F0D8
.L0805DF80: .4byte gUnk_Banim_0201F0DA
.L0805DF84: .4byte gFaces
.L0805DF88: .4byte gEfxPal
.L0805DF8C: .4byte gPal

	thumb_func_start func_fe6_0805DF90
func_fe6_0805DF90: @ 0x0805DF90
	push {r4, r5, r6, lr}
	sub sp, #0x2c
	adds r5, r0, #0
	ldr r4, .L0805E09C @ =gUnk_Banim_0201F084
	bl GetBattleAnimArenaFlag
	cmp r0, #0
	bne .L0805DFA6
	adds r0, r4, #0
	bl func_fe6_0804C2EC
.L0805DFA6:
	movs r1, #0xc0
	lsls r1, r1, #7
	movs r0, #0
	bl SetBgTilemapOffset
	movs r1, #0xd0
	lsls r1, r1, #7
	movs r0, #1
	bl SetBgTilemapOffset
	movs r1, #0xe0
	lsls r1, r1, #7
	movs r0, #2
	bl SetBgTilemapOffset
	movs r0, #1
	movs r1, #0
	bl SetBgScreenSize
	movs r0, #2
	movs r1, #0
	bl SetBgScreenSize
	mov r4, sp
	ldr r2, .L0805E0A0 @ =gBanimFloorfx
	ldrh r0, [r2]
	movs r6, #0
	strh r0, [r4]
	movs r0, #4
	strh r0, [r4, #2]
	movs r1, #0xa0
	lsls r1, r1, #2
	strh r1, [r4, #4]
	ldrh r0, [r2, #2]
	strh r0, [r4, #6]
	movs r0, #5
	strh r0, [r4, #8]
	strh r1, [r4, #0xa]
	ldr r0, .L0805E0A4 @ =gEkrDistanceType
	ldrh r0, [r0]
	strh r0, [r4, #0xc]
	movs r0, #2
	strh r0, [r4, #0xe]
	str r6, [sp, #0x1c]
	ldr r0, .L0805E0A8 @ =gUnk_Banim_020145C0
	str r0, [sp, #0x20]
	ldr r0, .L0805E0AC @ =gEkrSnowWeather
	ldrh r0, [r0]
	strh r0, [r4, #0x10]
	bl GetBattleAnimArenaFlag
	cmp r0, #0
	bne .L0805E020
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	mov r0, sp
	bl func_fe6_0804BF40
.L0805E020:
	ldr r2, [r5, #0x5c]
	ldr r1, .L0805E0B0 @ =0x0000F3FF
	adds r0, r1, #0
	ldrh r3, [r2, #8]
	ands r0, r3
	strh r0, [r2, #8]
	ldr r3, [r5, #0x5c]
	movs r0, #0x80
	lsls r0, r0, #4
	adds r2, r0, #0
	ldrh r0, [r3, #8]
	orrs r0, r2
	strh r0, [r3, #8]
	ldr r0, [r5, #0x60]
	ldrh r3, [r0, #8]
	ands r1, r3
	strh r1, [r0, #8]
	ldr r0, [r5, #0x60]
	ldrh r1, [r0, #8]
	orrs r2, r1
	strh r2, [r0, #8]
	str r6, [sp, #0x28]
	add r0, sp, #0x28
	ldr r1, .L0805E0B4 @ =gBg1Tm
	ldr r2, .L0805E0B8 @ =0x01000200
	bl CpuFastSet
	movs r0, #2
	bl EnableBgSync
	movs r0, #0
	bl EkrGauge_Setup44
	movs r0, #0
	bl GetEkrDragonWeapon
	ldrh r0, [r0]
	cmp r0, #0x53
	bne .L0805E0C0
	ldr r3, .L0805E0BC @ =gDispIo
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r2, [r3, #0xc]
	ands r0, r2
	strb r0, [r3, #0xc]
	adds r0, r1, #0
	ldrb r2, [r3, #0x10]
	ands r0, r2
	movs r2, #1
	orrs r0, r2
	strb r0, [r3, #0x10]
	ldrb r0, [r3, #0x18]
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	strb r1, [r3, #0x18]
	movs r0, #3
	ldrb r1, [r3, #0x14]
	orrs r0, r1
	strb r0, [r3, #0x14]
	b .L0805E0EC
	.align 2, 0
.L0805E09C: .4byte gUnk_Banim_0201F084
.L0805E0A0: .4byte gBanimFloorfx
.L0805E0A4: .4byte gEkrDistanceType
.L0805E0A8: .4byte gUnk_Banim_020145C0
.L0805E0AC: .4byte gEkrSnowWeather
.L0805E0B0: .4byte 0x0000F3FF
.L0805E0B4: .4byte gBg1Tm
.L0805E0B8: .4byte 0x01000200
.L0805E0BC: .4byte gDispIo
.L0805E0C0:
	ldr r3, .L0805E100 @ =gDispIo
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r2, [r3, #0xc]
	ands r0, r2
	strb r0, [r3, #0xc]
	adds r0, r1, #0
	ldrb r2, [r3, #0x10]
	ands r0, r2
	movs r2, #1
	orrs r0, r2
	strb r0, [r3, #0x10]
	ldrb r0, [r3, #0x14]
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	strb r1, [r3, #0x14]
	movs r0, #3
	ldrb r1, [r3, #0x18]
	orrs r0, r1
	strb r0, [r3, #0x18]
.L0805E0EC:
	movs r0, #0
	bl EndFaceById
	adds r0, r5, #0
	bl Proc_Break
	add sp, #0x2c
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L0805E100: .4byte gDispIo

	thumb_func_start func_fe6_0805E104
func_fe6_0805E104: @ 0x0805E104
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, .L0805E138 @ =gUnk_Banim_0201F07C
	ldr r0, [r0]
	bl Proc_End
	ldr r0, .L0805E13C @ =gUnk_Banim_0201F080
	ldr r0, [r0]
	bl Proc_End
	ldr r0, [r4, #0x5c]
	bl EnableEfxStatusUnits
	ldr r0, [r4, #0x60]
	bl EnableEfxStatusUnits
	bl EnableEfxWeaponIcon
	bl EnableEfxHpBarColorChange
	adds r4, #0x29
	movs r0, #1
	strb r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0805E138: .4byte gUnk_Banim_0201F07C
.L0805E13C: .4byte gUnk_Banim_0201F080

	thumb_func_start func_fe6_0805E140
func_fe6_0805E140: @ 0x0805E140
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r5, r0, #0
	adds r6, r1, #0
	mov r8, r2
	adds r4, r3, #0
	ldr r0, .L0805E17C @ =gUnk_08606254
	movs r1, #3
	bl SpawnProc
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x2e]
	adds r2, r0, #0
	adds r2, #0x29
	strb r4, [r2]
	strh r5, [r0, #0x32]
	strh r6, [r0, #0x3a]
	strh r1, [r0, #0x34]
	strh r1, [r0, #0x3c]
	mov r2, r8
	str r2, [r0, #0x44]
	str r1, [r0, #0x4c]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
.L0805E17C: .4byte gUnk_08606254

	thumb_func_start func_fe6_0805E180
func_fe6_0805E180: @ 0x0805E180
	push {r4, r5, lr}
	sub sp, #0x48
	adds r3, r0, #0
	ldr r1, [r3, #0x44]
	movs r2, #0x2c
	ldrsh r0, [r3, r2]
	cmp r0, #0
	bne .L0805E1F8
	movs r4, #0x2e
	ldrsh r0, [r3, r4]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r2, [r0]
	movs r1, #0x3f
	ldrb r0, [r0, #3]
	ands r1, r0
	cmp r1, #0
	bne .L0805E1D6
	adds r0, r3, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #1
	beq .L0805E1C6
	cmp r0, #1
	bgt .L0805E1B8
	cmp r0, #0
	beq .L0805E1BE
	b .L0805E1F8
.L0805E1B8:
	cmp r0, #2
	beq .L0805E1CC
	b .L0805E1F8
.L0805E1BE:
	adds r0, r3, #0
	bl Proc_Break
	b .L0805E224
.L0805E1C6:
	strh r0, [r3, #0x2c]
	strh r1, [r3, #0x2e]
	b .L0805E1F8
.L0805E1CC:
	movs r0, #1
	strh r0, [r3, #0x2c]
	ldrh r0, [r3, #0x2e]
	subs r0, #1
	b .L0805E1F6
.L0805E1D6:
	cmp r1, #4
	bne .L0805E1DE
	strh r2, [r3, #0x2c]
	b .L0805E1F2
.L0805E1DE:
	ldr r0, .L0805E22C @ =0x0FFFFFFC
	ands r0, r2
	str r0, [r3, #0x48]
	lsrs r0, r2, #0x1a
	movs r1, #0x1c
	ands r0, r1
	movs r1, #3
	ands r2, r1
	adds r0, r0, r2
	strh r0, [r3, #0x2c]
.L0805E1F2:
	ldrh r0, [r3, #0x2e]
	adds r0, #1
.L0805E1F6:
	strh r0, [r3, #0x2e]
.L0805E1F8:
	ldrh r0, [r3, #0x2c]
	subs r0, #1
	movs r2, #0
	strh r0, [r3, #0x2c]
	str r2, [sp, #0x1c]
	ldr r0, [r3, #0x48]
	str r0, [sp, #0x3c]
	mov r1, sp
	ldr r0, [r3, #0x4c]
	strh r0, [r1, #8]
	ldrh r5, [r3, #0x32]
	ldrh r4, [r3, #0x34]
	adds r0, r5, r4
	strh r0, [r1, #2]
	ldrh r5, [r3, #0x3a]
	ldrh r4, [r3, #0x3c]
	adds r0, r5, r4
	strh r0, [r1, #4]
	mov r0, sp
	strh r2, [r0, #0xc]
	bl BasPutOam
.L0805E224:
	add sp, #0x48
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0805E22C: .4byte 0x0FFFFFFC

	thumb_func_start func_fe6_0805E230
func_fe6_0805E230: @ 0x0805E230
	push {lr}
	ldr r0, .L0805E244 @ =gUnk_0860626C
	movs r1, #3
	bl SpawnProc
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x2e]
	pop {r1}
	bx r1
	.align 2, 0
.L0805E244: .4byte gUnk_0860626C

	thumb_func_start func_fe6_0805E248
func_fe6_0805E248: @ 0x0805E248
	push {r4, r5, r6, lr}
	ldr r0, .L0805E274 @ =gEkrBg1ScrollFlip
	ldr r0, [r0]
	ldr r2, .L0805E278 @ =gpBg2ScrollOffsetTable1
	cmp r0, #0
	bne .L0805E256
	ldr r2, .L0805E27C @ =gpBg2ScrollOffsetTable2
.L0805E256:
	ldr r1, .L0805E280 @ =gpBg1ScrollOffsetList1
	cmp r0, #0
	bne .L0805E25E
	ldr r1, .L0805E284 @ =gpBg1ScrollOffsetList2
.L0805E25E:
	movs r3, #0
	movs r6, #0
	ldr r5, .L0805E288 @ =gUnk_Banim_0201F0D8
	ldr r4, .L0805E28C @ =gUnk_Banim_0201F0DA
.L0805E266:
	cmp r3, #0x27
	bhi .L0805E290
	strh r6, [r2]
	adds r2, #2
	strh r6, [r1]
	b .L0805E2AC
	.align 2, 0
.L0805E274: .4byte gEkrBg1ScrollFlip
.L0805E278: .4byte gpBg2ScrollOffsetTable1
.L0805E27C: .4byte gpBg2ScrollOffsetTable2
.L0805E280: .4byte gpBg1ScrollOffsetList1
.L0805E284: .4byte gpBg1ScrollOffsetList2
.L0805E288: .4byte gUnk_Banim_0201F0D8
.L0805E28C: .4byte gUnk_Banim_0201F0DA
.L0805E290:
	cmp r3, #0x47
	bhi .L0805E29E
	ldrh r0, [r5]
	strh r0, [r2]
	adds r2, #2
	ldrh r0, [r5]
	b .L0805E2AA
.L0805E29E:
	cmp r3, #0x9f
	bhi .L0805E2AE
	ldrh r0, [r4]
	strh r0, [r2]
	adds r2, #2
	ldrh r0, [r4]
.L0805E2AA:
	strh r0, [r1]
.L0805E2AC:
	adds r1, #2
.L0805E2AE:
	adds r3, #1
	cmp r3, #0x9f
	bls .L0805E266
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_fe6_0805E2BC
func_fe6_0805E2BC: @ 0x0805E2BC
	bx lr
	.align 2, 0

	thumb_func_start func_fe6_0805E2C0
func_fe6_0805E2C0: @ 0x0805E2C0
	push {lr}
	bl func_fe6_0805E248
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_fe6_0805E2CC
func_fe6_0805E2CC: @ 0x0805E2CC
	push {lr}
	ldr r0, .L0805E2E0 @ =gUnk_0860628C
	movs r1, #3
	bl SpawnProc
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x2e]
	pop {r1}
	bx r1
	.align 2, 0
.L0805E2E0: .4byte gUnk_0860628C

	thumb_func_start func_fe6_0805E2E4
func_fe6_0805E2E4: @ 0x0805E2E4
	bx lr
	.align 2, 0

	thumb_func_start func_fe6_0805E2E8
func_fe6_0805E2E8: @ 0x0805E2E8
	push {r4, r5, r6, lr}
	ldr r0, .L0805E334 @ =gEkrBg1ScrollFlip
	ldr r0, [r0]
	ldr r3, .L0805E338 @ =gpBg2ScrollOffsetTable1
	cmp r0, #0
	bne .L0805E2F6
	ldr r3, .L0805E33C @ =gpBg2ScrollOffsetTable2
.L0805E2F6:
	ldr r2, .L0805E340 @ =gpBg1ScrollOffsetList1
	cmp r0, #0
	bne .L0805E2FE
	ldr r2, .L0805E344 @ =gpBg1ScrollOffsetList2
.L0805E2FE:
	movs r4, #0
	movs r5, #0
	ldr r0, .L0805E348 @ =gUnk_086062AC
	adds r6, r0, #0
	subs r6, #0x50
.L0805E308:
	cmp r4, #0x27
	bls .L0805E358
	cmp r4, #0x47
	bhi .L0805E354
	movs r0, #0
	ldrsh r1, [r6, r0]
	ldr r0, .L0805E34C @ =gUnk_Banim_0201F0D8
	ldrh r0, [r0]
	muls r0, r1, r0
	lsls r0, r0, #4
	lsrs r1, r0, #0x10
	asrs r0, r0, #0x10
	adds r0, r4, r0
	cmp r0, #0x2e
	bls .L0805E32A
	cmp r0, #0x51
	bls .L0805E32C
.L0805E32A:
	ldr r1, .L0805E350 @ =0x0000FFE0
.L0805E32C:
	strh r1, [r3]
	adds r3, #2
	strh r1, [r2]
	b .L0805E35E
	.align 2, 0
.L0805E334: .4byte gEkrBg1ScrollFlip
.L0805E338: .4byte gpBg2ScrollOffsetTable1
.L0805E33C: .4byte gpBg2ScrollOffsetTable2
.L0805E340: .4byte gpBg1ScrollOffsetList1
.L0805E344: .4byte gpBg1ScrollOffsetList2
.L0805E348: .4byte gUnk_086062AC
.L0805E34C: .4byte gUnk_Banim_0201F0D8
.L0805E350: .4byte 0x0000FFE0
.L0805E354:
	cmp r4, #0x9f
	bhi .L0805E360
.L0805E358:
	strh r5, [r3]
	adds r3, #2
	strh r5, [r2]
.L0805E35E:
	adds r2, #2
.L0805E360:
	adds r6, #2
	adds r4, #1
	cmp r4, #0x9f
	bls .L0805E308
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_fe6_0805E370
func_fe6_0805E370: @ 0x0805E370
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r1, .L0805E40C @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r2, .L0805E410 @ =gpBg2ScrollOffsetTable1
	movs r1, #0
	adds r6, r2, #0
	ldr r4, .L0805E414 @ =gpBg2ScrollOffsetTable2
	ldr r0, .L0805E418 @ =gpBg1ScrollOffsetList1
	ldr r5, .L0805E41C @ =gpBg1ScrollOffsetList2
	ldr r7, .L0805E420 @ =gEkrBg2ScrollFlip
	ldr r3, .L0805E424 @ =gEkrBg1ScrollFlip
	mov ip, r3
	ldr r3, .L0805E428 @ =gpBg2ScrollOffsetStart
	mov r8, r3
	ldr r3, .L0805E42C @ =gpBg1ScrollOffsetStart
	mov sb, r3
	ldr r3, .L0805E430 @ =gpBg2ScrollOffset
	mov sl, r3
	movs r3, #0
.L0805E3A2:
	strh r3, [r2]
	adds r2, #2
	adds r1, #1
	cmp r1, #0x9f
	bls .L0805E3A2
	adds r2, r4, #0
	movs r1, #0
	movs r3, #0
.L0805E3B2:
	strh r3, [r2]
	adds r2, #2
	adds r1, #1
	cmp r1, #0x9f
	bls .L0805E3B2
	adds r2, r0, #0
	movs r1, #0
	movs r3, #0
.L0805E3C2:
	strh r3, [r2]
	adds r2, #2
	adds r1, #1
	cmp r1, #0x9f
	bls .L0805E3C2
	adds r2, r5, #0
	movs r1, #0
	movs r3, #0
.L0805E3D2:
	strh r3, [r2]
	adds r2, #2
	adds r1, #1
	cmp r1, #0x9f
	bls .L0805E3D2
	movs r4, #0
	str r4, [r7]
	mov r1, ip
	str r4, [r1]
	mov r3, r8
	str r6, [r3]
	mov r1, sb
	str r0, [r1]
	mov r3, sl
	str r6, [r3]
	ldr r1, .L0805E434 @ =gpBg1ScrollOffset
	str r0, [r1]
	ldr r0, .L0805E438 @ =gUnk_086062EC
	movs r1, #0
	bl SpawnProc
	strh r4, [r0, #0x2c]
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
.L0805E40C: .4byte gEfxBgSemaphore
.L0805E410: .4byte gpBg2ScrollOffsetTable1
.L0805E414: .4byte gpBg2ScrollOffsetTable2
.L0805E418: .4byte gpBg1ScrollOffsetList1
.L0805E41C: .4byte gpBg1ScrollOffsetList2
.L0805E420: .4byte gEkrBg2ScrollFlip
.L0805E424: .4byte gEkrBg1ScrollFlip
.L0805E428: .4byte gpBg2ScrollOffsetStart
.L0805E42C: .4byte gpBg1ScrollOffsetStart
.L0805E430: .4byte gpBg2ScrollOffset
.L0805E434: .4byte gpBg1ScrollOffset
.L0805E438: .4byte gUnk_086062EC

	thumb_func_start func_fe6_0805E43C
func_fe6_0805E43C: @ 0x0805E43C
	push {lr}
	movs r0, #0
	bl SetOnHBlankA
	pop {r0}
	bx r0

	thumb_func_start func_fe6_0805E448
func_fe6_0805E448: @ 0x0805E448
	push {lr}
	bl Proc_Break
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_fe6_0805E454
func_fe6_0805E454: @ 0x0805E454
	ldr r1, .L0805E468 @ =gEkrBg2ScrollFlip
	ldr r0, [r1]
	cmp r0, #1
	bne .L0805E474
	movs r0, #0
	str r0, [r1]
	ldr r1, .L0805E46C @ =gpBg2ScrollOffsetStart
	ldr r0, .L0805E470 @ =gpBg2ScrollOffsetTable1
	b .L0805E47C
	.align 2, 0
.L0805E468: .4byte gEkrBg2ScrollFlip
.L0805E46C: .4byte gpBg2ScrollOffsetStart
.L0805E470: .4byte gpBg2ScrollOffsetTable1
.L0805E474:
	movs r0, #1
	str r0, [r1]
	ldr r1, .L0805E494 @ =gpBg2ScrollOffsetStart
	ldr r0, .L0805E498 @ =gpBg2ScrollOffsetTable2
.L0805E47C:
	str r0, [r1]
	adds r3, r1, #0
	ldr r1, .L0805E49C @ =gEkrBg1ScrollFlip
	ldr r0, [r1]
	cmp r0, #1
	bne .L0805E4A8
	movs r0, #0
	str r0, [r1]
	ldr r1, .L0805E4A0 @ =gpBg1ScrollOffsetStart
	ldr r0, .L0805E4A4 @ =gpBg1ScrollOffsetList1
	b .L0805E4B0
	.align 2, 0
.L0805E494: .4byte gpBg2ScrollOffsetStart
.L0805E498: .4byte gpBg2ScrollOffsetTable2
.L0805E49C: .4byte gEkrBg1ScrollFlip
.L0805E4A0: .4byte gpBg1ScrollOffsetStart
.L0805E4A4: .4byte gpBg1ScrollOffsetList1
.L0805E4A8:
	movs r0, #1
	str r0, [r1]
	ldr r1, .L0805E4C4 @ =gpBg1ScrollOffsetStart
	ldr r0, .L0805E4C8 @ =gpBg1ScrollOffsetList2
.L0805E4B0:
	str r0, [r1]
	adds r2, r1, #0
	ldr r1, .L0805E4CC @ =gpBg2ScrollOffset
	ldr r0, [r3]
	str r0, [r1]
	ldr r1, .L0805E4D0 @ =gpBg1ScrollOffset
	ldr r0, [r2]
	str r0, [r1]
	bx lr
	.align 2, 0
.L0805E4C4: .4byte gpBg1ScrollOffsetStart
.L0805E4C8: .4byte gpBg1ScrollOffsetList2
.L0805E4CC: .4byte gpBg2ScrollOffset
.L0805E4D0: .4byte gpBg1ScrollOffset

	thumb_func_start func_fe6_0805E4D4
func_fe6_0805E4D4: @ 0x0805E4D4
	ldr r0, .L0805E500 @ =0x04000004
	ldrh r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne .L0805E4FC
	ldr r3, .L0805E504 @ =0x04000018
	ldr r2, .L0805E508 @ =gpBg2ScrollOffset
	ldr r0, [r2]
	ldrh r1, [r0]
	strh r1, [r3]
	adds r0, #2
	str r0, [r2]
	subs r3, #4
	ldr r2, .L0805E50C @ =gpBg1ScrollOffset
	ldr r0, [r2]
	ldrh r1, [r0]
	strh r1, [r3]
	adds r0, #2
	str r0, [r2]
.L0805E4FC:
	bx lr
	.align 2, 0
.L0805E500: .4byte 0x04000004
.L0805E504: .4byte 0x04000018
.L0805E508: .4byte gpBg2ScrollOffset
.L0805E50C: .4byte gpBg1ScrollOffset

	thumb_func_start func_fe6_0805E510
func_fe6_0805E510: @ 0x0805E510
	push {r4, r5, r6, lr}
	ldr r0, .L0805E54C @ =0x04000004
	ldrh r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne .L0805E544
	ldr r3, .L0805E550 @ =0x0400001A
	ldr r4, .L0805E554 @ =gDispIo
	ldr r2, .L0805E558 @ =gpBg2ScrollOffset
	ldr r0, [r2]
	ldrh r5, [r4, #0x26]
	ldrh r6, [r0]
	adds r1, r5, r6
	strh r1, [r3]
	adds r0, #2
	str r0, [r2]
	subs r3, #4
	ldr r2, .L0805E55C @ =gpBg1ScrollOffset
	ldr r0, [r2]
	ldrh r4, [r4, #0x22]
	ldrh r5, [r0]
	adds r1, r4, r5
	strh r1, [r3]
	adds r0, #2
	str r0, [r2]
.L0805E544:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L0805E54C: .4byte 0x04000004
.L0805E550: .4byte 0x0400001A
.L0805E554: .4byte gDispIo
.L0805E558: .4byte gpBg2ScrollOffset
.L0805E55C: .4byte gpBg1ScrollOffset
