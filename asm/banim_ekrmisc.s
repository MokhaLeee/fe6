	.include "macro.inc"

	.syntax unified


	.section .text

	thumb_func_start EfxClearScreenFx
EfxClearScreenFx: @ 0x08044390
	push {r4, r5, r6, lr}
	sub sp, #0x10
	ldr r4, .L08044484 @ =gDispIo
	movs r2, #8
	rsbs r2, r2, #0
	ldrb r0, [r4]
	ands r2, r0
	movs r5, #1
	ldrb r0, [r4, #1]
	orrs r0, r5
	movs r6, #2
	orrs r0, r6
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r4, #1]
	movs r0, #0x41
	rsbs r0, r0, #0
	ands r2, r0
	strb r2, [r4]
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
	movs r0, #0
	movs r1, #0
	bl SetBgChrOffset
	movs r0, #1
	movs r1, #0
	bl SetBgChrOffset
	movs r0, #2
	movs r1, #0
	bl SetBgChrOffset
	movs r1, #0x80
	lsls r1, r1, #8
	movs r0, #3
	bl SetBgChrOffset
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
	movs r1, #0xf0
	lsls r1, r1, #7
	movs r0, #3
	bl SetBgTilemapOffset
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r2, [r4, #0xc]
	ands r0, r2
	strb r0, [r4, #0xc]
	adds r0, r1, #0
	ldrb r2, [r4, #0x10]
	ands r0, r2
	orrs r0, r5
	strb r0, [r4, #0x10]
	ldrb r0, [r4, #0x14]
	ands r1, r0
	orrs r1, r6
	strb r1, [r4, #0x14]
	movs r0, #3
	ldrb r1, [r4, #0x18]
	orrs r0, r1
	strb r0, [r4, #0x18]
	movs r4, #0
	str r4, [sp]
	ldr r1, .L08044488 @ =gBg0Tm
	ldr r5, .L0804448C @ =0x01000200
	mov r0, sp
	adds r2, r5, #0
	bl CpuFastSet
	str r4, [sp, #4]
	add r0, sp, #4
	ldr r1, .L08044490 @ =gBg1Tm
	adds r2, r5, #0
	bl CpuFastSet
	str r4, [sp, #8]
	add r0, sp, #8
	ldr r6, .L08044494 @ =gBg2Tm
	adds r1, r6, #0
	adds r2, r5, #0
	bl CpuFastSet
	bl GetBattleAnimArenaFlag
	cmp r0, #0
	bne .L08044498
	bl EkrDispUp_PutTerrainfx
	b .L080444A4
	.align 2, 0
.L08044484: .4byte gDispIo
.L08044488: .4byte gBg0Tm
.L0804448C: .4byte 0x01000200
.L08044490: .4byte gBg1Tm
.L08044494: .4byte gBg2Tm
.L08044498:
	str r4, [sp, #0xc]
	add r0, sp, #0xc
	adds r1, r6, #0
	adds r2, r5, #0
	bl CpuFastSet
.L080444A4:
	bl EfxPrepareScreenFx
	bl EnablePalSync
	movs r0, #1
	bl EnableBgSync
	movs r0, #2
	bl EnableBgSync
	movs r0, #4
	bl EnableBgSync
	ldr r3, .L080444E8 @ =gDispIo
	adds r1, r3, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r2, [r1]
	ands r0, r2
	strb r0, [r1]
	adds r1, #8
	movs r2, #0
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x45
	strb r2, [r0]
	adds r0, #1
	strb r2, [r0]
	add sp, #0x10
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L080444E8: .4byte gDispIo

	thumb_func_start EkrDispUp_PutTerrainfx
EkrDispUp_PutTerrainfx: @ 0x080444EC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r4, .L0804452C @ =gEkrTerrainfxDesc
	ldr r2, .L08044530 @ =gBanimFloorfx
	movs r0, #0
	ldrsh r1, [r2, r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	ldr r3, .L08044534 @ =gBanimTerrainTable
	adds r5, r0, r3
	movs r6, #2
	ldrsh r1, [r2, r6]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r3, r0, r3
	ldr r0, .L08044538 @ =gEkrDistanceType
	movs r7, #0
	ldrsh r1, [r0, r7]
	mov r8, r2
	adds r6, r0, #0
	cmp r1, #3
	bgt .L08044540
	cmp r1, #1
	bge .L08044564
	cmp r1, #0
	beq .L08044548
	ldr r0, .L0804453C @ =gBanimBuf_20145C0
	b .L08044576
	.align 2, 0
.L0804452C: .4byte gEkrTerrainfxDesc
.L08044530: .4byte gBanimFloorfx
.L08044534: .4byte gBanimTerrainTable
.L08044538: .4byte gEkrDistanceType
.L0804453C: .4byte gBanimBuf_20145C0
.L08044540:
	ldr r7, .L0804455C @ =gBanimBuf_20145C0
	mov ip, r7
	cmp r1, #4
	bne .L08044578
.L08044548:
	ldr r0, .L08044560 @ =gpBanimTerrainfxBufs
	ldr r1, .L0804455C @ =gBanimBuf_20145C0
	str r1, [r0]
	movs r7, #0x80
	lsls r7, r7, #5
	adds r2, r1, r7
	str r2, [r0, #4]
	mov ip, r1
	b .L08044578
	.align 2, 0
.L0804455C: .4byte gBanimBuf_20145C0
.L08044560: .4byte gpBanimTerrainfxBufs
.L08044564:
	ldr r0, .L080445E8 @ =gpBanimTerrainfxBufs
	ldr r1, .L080445EC @ =gUnk_Banim_02014DC0
	str r1, [r0]
	movs r7, #0x80
	lsls r7, r7, #5
	adds r2, r1, r7
	str r2, [r0, #4]
	ldr r0, .L080445F0 @ =0xFFFFF800
	adds r0, r0, r1
.L08044576:
	mov ip, r0
.L08044578:
	ldr r0, .L080445F4 @ =gPlaySt
	ldrb r0, [r0, #0x15]
	ldr r0, .L080445F8 @ =gpBanimTerrainPalBufs
	ldr r1, [r5, #0x10]
	str r1, [r0]
	ldr r1, [r3, #0x10]
	str r1, [r0, #4]
	ldr r2, .L080445FC @ =gpBanimTerrainTsaBufs
	ldr r1, .L08044600 @ =TsaConfs_BanimTmA
	movs r3, #0
	ldrsh r0, [r6, r3]
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r0, [r0]
	str r0, [r2]
	movs r7, #0
	ldrsh r0, [r6, r7]
	lsls r0, r0, #1
	adds r0, #1
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	str r0, [r2, #4]
	mov r1, r8
	ldrh r0, [r1]
	movs r2, #0
	strh r0, [r4]
	movs r0, #4
	strh r0, [r4, #2]
	movs r1, #0xa0
	lsls r1, r1, #2
	strh r1, [r4, #4]
	mov r3, r8
	ldrh r0, [r3, #2]
	strh r0, [r4, #6]
	movs r0, #5
	strh r0, [r4, #8]
	strh r1, [r4, #0xa]
	ldrh r0, [r6]
	strh r0, [r4, #0xc]
	movs r0, #2
	strh r0, [r4, #0xe]
	str r2, [r4, #0x1c]
	mov r6, ip
	str r6, [r4, #0x20]
	ldr r0, .L08044604 @ =gEkrSnowWeather
	ldrh r0, [r0]
	strh r0, [r4, #0x10]
	adds r0, r4, #0
	bl NewEkrTerrainfx
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L080445E8: .4byte gpBanimTerrainfxBufs
.L080445EC: .4byte gUnk_Banim_02014DC0
.L080445F0: .4byte 0xFFFFF800
.L080445F4: .4byte gPlaySt
.L080445F8: .4byte gpBanimTerrainPalBufs
.L080445FC: .4byte gpBanimTerrainTsaBufs
.L08044600: .4byte TsaConfs_BanimTmA
.L08044604: .4byte gEkrSnowWeather

	thumb_func_start EfxPrepareScreenFx
EfxPrepareScreenFx: @ 0x08044608
	push {r4, r5, r6, lr}
	sub sp, #8
	ldr r4, .L08044648 @ =Pal_Text
	adds r0, r4, #0
	movs r1, #0x40
	movs r2, #0x20
	bl ApplyPaletteExt
	adds r0, r4, #0
	movs r1, #0x60
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, .L0804464C @ =gBanimFont
	ldr r1, .L08044650 @ =0x06001400
	movs r2, #0xa0
	movs r3, #2
	bl InitTextFont
	bl SetTextDrawNoClear
	ldr r0, .L08044654 @ =Img_081125E0
	ldr r1, .L08044658 @ =0x06001000
	bl LZ77UnCompVram
	ldr r0, .L0804465C @ =gBanimValid
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne .L08044664
	ldr r5, .L08044660 @ =gNopStr
	b .L08044672
	.align 2, 0
.L08044648: .4byte Pal_Text
.L0804464C: .4byte gBanimFont
.L08044650: .4byte 0x06001400
.L08044654: .4byte Img_081125E0
.L08044658: .4byte 0x06001000
.L0804465C: .4byte gBanimValid
.L08044660: .4byte gNopStr
.L08044664:
	ldr r0, .L080446AC @ =gpEkrBattleUnitLeft
	ldr r0, [r0]
	ldr r0, [r0]
	ldrh r0, [r0]
	bl DecodeMsg
	adds r5, r0, #0
.L08044672:
	ldr r4, .L080446B0 @ =gBanimText
	adds r0, r4, #0
	movs r1, #6
	bl InitText
	movs r0, #0x30
	adds r1, r5, #0
	bl GetStringTextCenteredPos
	adds r1, r0, #0
	adds r0, r4, #0
	bl Text_SetCursor
	ldr r0, .L080446B4 @ =Img_081127F0
	ldr r1, .L080446B8 @ =0x06001400
	bl LZ77UnCompVram
	adds r0, r4, #0
	adds r1, r5, #0
	bl Text_DrawString
	ldr r0, .L080446BC @ =gBanimValid
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne .L080446C4
	ldr r5, .L080446C0 @ =gNopStr
	b .L080446D2
	.align 2, 0
.L080446AC: .4byte gpEkrBattleUnitLeft
.L080446B0: .4byte gBanimText
.L080446B4: .4byte Img_081127F0
.L080446B8: .4byte 0x06001400
.L080446BC: .4byte gBanimValid
.L080446C0: .4byte gNopStr
.L080446C4:
	ldr r0, .L0804470C @ =gpEkrBattleUnitLeft
	ldr r0, [r0]
	adds r0, #0x4a
	ldrh r0, [r0]
	bl GetItemName
	adds r5, r0, #0
.L080446D2:
	ldr r4, .L08044710 @ =gBanimText + 0x10
	adds r0, r4, #0
	movs r1, #7
	bl InitText
	movs r0, #0x38
	adds r1, r5, #0
	bl GetStringTextCenteredPos
	adds r1, r0, #0
	adds r0, r4, #0
	bl Text_SetCursor
	ldr r0, .L08044714 @ =Img_08112840
	ldr r1, .L08044718 @ =0x06001580
	bl LZ77UnCompVram
	adds r0, r4, #0
	adds r1, r5, #0
	bl Text_DrawString
	ldr r0, .L0804471C @ =gBanimValid
	movs r1, #2
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne .L08044724
	ldr r5, .L08044720 @ =gNopStr
	b .L08044732
	.align 2, 0
.L0804470C: .4byte gpEkrBattleUnitLeft
.L08044710: .4byte gBanimText + 0x10
.L08044714: .4byte Img_08112840
.L08044718: .4byte 0x06001580
.L0804471C: .4byte gBanimValid
.L08044720: .4byte gNopStr
.L08044724:
	ldr r0, .L0804476C @ =gpEkrBattleUnitRight
	ldr r0, [r0]
	ldr r0, [r0]
	ldrh r0, [r0]
	bl DecodeMsg
	adds r5, r0, #0
.L08044732:
	ldr r4, .L08044770 @ =gBanimText + 0x18
	adds r0, r4, #0
	movs r1, #6
	bl InitText
	movs r0, #0x30
	adds r1, r5, #0
	bl GetStringTextCenteredPos
	adds r1, r0, #0
	adds r0, r4, #0
	bl Text_SetCursor
	ldr r0, .L08044774 @ =Img_081128AC
	ldr r1, .L08044778 @ =0x06001740
	bl LZ77UnCompVram
	adds r0, r4, #0
	adds r1, r5, #0
	bl Text_DrawString
	ldr r0, .L0804477C @ =gBanimValid
	movs r1, #2
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne .L08044784
	ldr r5, .L08044780 @ =gNopStr
	b .L08044792
	.align 2, 0
.L0804476C: .4byte gpEkrBattleUnitRight
.L08044770: .4byte gBanimText + 0x18
.L08044774: .4byte Img_081128AC
.L08044778: .4byte 0x06001740
.L0804477C: .4byte gBanimValid
.L08044780: .4byte gNopStr
.L08044784:
	ldr r0, .L08044848 @ =gpEkrBattleUnitRight
	ldr r0, [r0]
	adds r0, #0x4a
	ldrh r0, [r0]
	bl GetItemName
	adds r5, r0, #0
.L08044792:
	ldr r4, .L0804484C @ =gBanimText + 0x08
	adds r0, r4, #0
	movs r1, #7
	bl InitText
	movs r0, #0x38
	adds r1, r5, #0
	bl GetStringTextCenteredPos
	adds r1, r0, #0
	adds r0, r4, #0
	bl Text_SetCursor
	ldr r0, .L08044850 @ =Img_081128FC
	ldr r1, .L08044854 @ =0x060018C0
	bl LZ77UnCompVram
	adds r0, r4, #0
	adds r1, r5, #0
	bl Text_DrawString
	ldr r4, .L08044858 @ =gBg0Tm
	adds r0, r4, #0
	movs r1, #0x9f
	bl TmFill
	ldr r0, .L0804485C @ =Tsa_08112C84
	adds r6, r4, #0
	adds r6, #0x3c
	movs r1, #1
	rsbs r1, r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	adds r1, r6, #0
	movs r2, #2
	movs r3, #0x14
	bl EfxTmCpyBG
	adds r4, #0x3e
	movs r5, #0x80
	str r5, [sp]
	adds r0, r4, #0
	movs r1, #1
	movs r2, #0x14
	movs r3, #2
	bl FillBGSafelyRect
	str r5, [sp]
	adds r0, r6, #0
	movs r1, #1
	movs r2, #0x14
	movs r3, #3
	bl FillBGSafelyRect
	movs r0, #1
	bl EnableBgSync
	ldr r6, .L08044860 @ =gBanimFactionPal
	movs r1, #0
	ldrsh r0, [r6, r1]
	lsls r0, r0, #5
	ldr r5, .L08044864 @ =Pal_08112CD4
	adds r0, r0, r5
	ldr r4, .L08044868 @ =gPal+0x40
	adds r1, r4, #0
	movs r2, #8
	bl CpuFastSet
	movs r1, #2
	ldrsh r0, [r6, r1]
	lsls r0, r0, #5
	adds r0, r0, r5
	adds r4, #0x20
	adds r1, r4, #0
	movs r2, #8
	bl CpuFastSet
	bl EnablePalSync
	ldr r1, .L0804486C @ =gEkrBg0QuakeVec
	movs r0, #0
	strh r0, [r1]
	strh r0, [r1, #2]
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08044848: .4byte gpEkrBattleUnitRight
.L0804484C: .4byte gBanimText + 0x08
.L08044850: .4byte Img_081128FC
.L08044854: .4byte 0x060018C0
.L08044858: .4byte gBg0Tm
.L0804485C: .4byte Tsa_08112C84
.L08044860: .4byte gBanimFactionPal
.L08044864: .4byte Pal_08112CD4
.L08044868: .4byte gPal+0x40
.L0804486C: .4byte gEkrBg0QuakeVec
