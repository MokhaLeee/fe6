	.include "macro.inc"

	.syntax unified

	thumb_func_start Xmap_Init
Xmap_Init: @ 0x0808ABD4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	adds r7, r0, #0
	movs r0, #0
	bl InitBgs
	bl ResetTextFont
	bl ResetText
	bl ApplySystemObjectsGraphics
	bl UnpackUiWindowFrameGraphics
	bl InitSystemTextFont

	ldr r0, .L0808AD70 @ =gDispIo
	mov ip, r0
	movs r3, #1
	ldrb r2, [r0, #1]
	orrs r2, r3
	movs r4, #2
	orrs r2, r4
	movs r1, #4
	mov r8, r1
	mov r5, r8
	orrs r2, r5
	movs r6, #8
	mov sl, r6
	mov r0, sl
	orrs r2, r0
	movs r1, #0x10
	mov sb, r1
	mov r5, sb
	orrs r2, r5

	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	mov r6, ip
	ldrb r6, [r6, #0xc]
	ands r0, r6
	mov r5, ip
	strb r0, [r5, #0xc]
	adds r0, r1, #0
	ldrb r6, [r5, #0x10]
	ands r0, r6
	orrs r0, r4
	strb r0, [r5, #0x10]
	ldrb r0, [r5, #0x14]
	ands r1, r0
	orrs r1, r3
	strb r1, [r5, #0x14]
	movs r0, #3
	ldrb r1, [r5, #0x18]
	orrs r0, r1
	strb r0, [r5, #0x18]

	movs r0, #0x20
	orrs r2, r0
	movs r0, #0x41
	rsbs r0, r0, #0
	ands r2, r0
	movs r0, #0x7f
	ands r2, r0
	strb r2, [r5, #1]

	mov r1, ip
	adds r1, #0x34
	ldrb r0, [r1]
	orrs r0, r3
	orrs r0, r4
	mov r2, r8
	orrs r0, r2
	mov r5, sl
	orrs r0, r5
	mov r6, sb
	orrs r0, r6
	strb r0, [r1]

	subs r1, #7
	movs r0, #0
	strb r0, [r1]
	adds r1, #4
	strb r0, [r1]
	subs r1, #5
	movs r0, #0xf0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0xa0
	strb r0, [r1]

	mov r0, ip
	adds r0, #0x36
	ldrb r1, [r0]
	orrs r3, r1
	orrs r3, r4
	orrs r3, r2
	orrs r3, r5
	orrs r3, r6
	strb r3, [r0]

	movs r0, #0
	bl SetBlankChr
	ldr r0, .L0808AD74 @ =gBg0Tm
	movs r1, #0
	bl TmFill
	ldr r0, .L0808AD78 @ =gBg1Tm
	movs r1, #0
	bl TmFill
	ldr r0, .L0808AD7C @ =gBg2Tm
	movs r1, #0
	bl TmFill
	ldr r0, .L0808AD80 @ =Img_XmapObj
	ldr r1, .L0808AD84 @ =0x06011000
	bl Decompress
	ldr r0, .L0808AD88 @ =Pal_XmapObj
	movs r1, #0xa0
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	movs r0, #0xf
	bl EnableBgSync
	ldr r4, .L0808AD8C @ =gXmapTexts
	movs r6, #5
.L0808ACD8:
	adds r0, r4, #0
	movs r1, #0xa
	bl InitText
	adds r0, r4, #0
	bl ClearText
	adds r4, #8
	subs r6, #1
	cmp r6, #0
	bge .L0808ACD8

	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r1, .L0808AD90 @ =0x0000FFF8
	movs r0, #2
	movs r2, #0
	bl SetBgOffset
	adds r4, r7, #0
	adds r4, #0x38
	adds r0, r4, #0
	bl ListAvailableTrialChapters

	adds r1, r7, #0
	adds r1, #0x2b
	movs r0, #0
	strb r0, [r1]

	movs r6, #0
	movs r0, #0
	ldrsb r0, [r4, r0]
	mov sb, r4
	mov r8, r1
	adds r5, r7, #0
	adds r5, #0x2a
	movs r2, #0x2c
	adds r2, r2, r7
	mov sl, r2
	adds r1, #2
	str r1, [sp, #8]
	adds r2, r7, #0
	adds r2, #0x2e
	str r2, [sp, #0xc]
	adds r1, #0x11
	str r1, [sp, #0x10]
	adds r2, #0x11
	str r2, [sp, #0x14]
	adds r1, #8
	str r1, [sp, #0x18]
	cmp r0, #0
	beq .L0808AD94
	movs r0, #1
	mov r2, r8
	strb r0, [r2]
	mov r2, sb
	mov r1, r8
.L0808AD56:
	adds r6, #1
	cmp r6, #5
	bgt .L0808AD94
	adds r0, r2, r6
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq .L0808AD94
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	b .L0808AD56
	.align 2, 0
.L0808AD70: .4byte gDispIo
.L0808AD74: .4byte gBg0Tm
.L0808AD78: .4byte gBg1Tm
.L0808AD7C: .4byte gBg2Tm
.L0808AD80: .4byte Img_XmapObj
.L0808AD84: .4byte 0x06011000
.L0808AD88: .4byte Pal_XmapObj
.L0808AD8C: .4byte gXmapTexts
.L0808AD90: .4byte 0x0000FFF8
.L0808AD94:
	mov r6, r8
	ldrb r6, [r6]
	lsls r3, r6, #1
	adds r3, #2
	movs r0, #1
	str r0, [sp]
	movs r0, #0
	movs r1, #5
	movs r2, #0xc
	bl PutUiWindowFrame
	ldr r4, .L0808AED4 @ =gBg1Tm
	ldr r1, .L0808AED8 @ =gBg2Tm
	adds r0, r4, #0
	movs r2, #0xc
	movs r3, #0x13
	bl TmCopyRect_thm
	adds r0, r4, #0
	movs r1, #0xc
	movs r2, #0x13
	movs r3, #0
	bl TmFillRect_thm
	movs r0, #1
	movs r1, #0x26
	movs r2, #0xa
	bl PutUiEntryHover
	mov r1, sb
	movs r0, #0
	ldrsb r0, [r1, r0]
	ldr r1, .L0808AEDC @ =0x06002000
	movs r2, #0xa
	bl DrawMinimap
	ldr r2, .L0808AEE0 @ =gMapSize
	movs r6, #0
	ldrsh r1, [r2, r6]
	lsls r1, r1, #1
	adds r0, r1, #0
	subs r0, #0x40
	str r0, [r7, #0x30]
	movs r0, #2
	ldrsh r2, [r2, r0]
	lsls r2, r2, #1
	adds r0, r2, #0
	subs r0, #0x40
	str r0, [r7, #0x34]
	subs r1, #0xac
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	subs r2, #0x5c
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #1
	bl SetBgOffset
	movs r0, #0
	strb r0, [r5]
	movs r6, #0
	mov r1, r8
	ldrb r1, [r1]
	cmp r6, r1
	bge .L0808AE60
	movs r5, #0xc0
	lsls r5, r5, #1
.L0808AE1A:
	lsls r4, r6, #3
	ldr r0, .L0808AEE4 @ =gXmapTexts
	adds r4, r4, r0
	mov r2, sb
	adds r2, r2, r6
	str r2, [sp, #4]
	ldrb r0, [r2]
	lsls r2, r0, #0x18
	asrs r2, r2, #0x1f
	movs r0, #4
	ands r2, r0
	adds r0, r4, #0
	movs r1, #0
	bl Text_SetParams
	ldr r1, [sp, #4]
	movs r0, #0
	ldrsb r0, [r1, r0]
	bl func_fe6_080867F0
	adds r1, r0, #0
	adds r0, r4, #0
	bl Text_DrawString
	ldr r1, .L0808AEE8 @ =gBg0Tm+0x4
	adds r1, r5, r1
	adds r0, r4, #0
	bl PutText
	adds r5, #0x80
	adds r6, #1
	mov r2, r8
	ldrb r2, [r2]
	cmp r6, r2
	blt .L0808AE1A
.L0808AE60:
	movs r4, #0
	mov r5, sl
	strb r4, [r5]
	ldr r6, [sp, #8]
	strb r4, [r6]
	ldr r0, [sp, #0xc]
	strb r4, [r0]
	ldr r1, [sp, #0x10]
	strb r4, [r1]
	movs r0, #1
	ldr r2, [sp, #0x14]
	strb r0, [r2]
	movs r0, #4
	ldr r5, [sp, #0x18]
	strb r0, [r5]
	adds r0, r7, #0
	bl func_fe6_0808B7A0
	ldr r6, .L0808AEEC @ =Img_MonologueBG
	movs r0, #3
	bl GetBgChrOffset
	adds r1, r0, #0
	movs r0, #0xc0
	lsls r0, r0, #0x13
	adds r1, r1, r0
	adds r0, r6, #0
	bl Decompress
	ldr r0, .L0808AEF0 @ =Pal_MonologueBG
	movs r1, #0xf0
	lsls r1, r1, #1
	movs r2, #0x20
	bl ApplyPaletteExt
	adds r0, r7, #0
	bl func_fe6_0808B928
	str r0, [r7, #0x4c]
	ldr r0, .L0808AEF4 @ =0x0203DC6C
	strb r4, [r0]
	ldr r0, .L0808AEF8 @ =0x0203DC6D
	strb r4, [r0]
	adds r0, r7, #0
	bl func_fe6_0808AEFC
	adds r0, r7, #0
	bl StartGreenText
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0808AED4: .4byte gBg1Tm
.L0808AED8: .4byte gBg2Tm
.L0808AEDC: .4byte 0x06002000
.L0808AEE0: .4byte gMapSize
.L0808AEE4: .4byte gXmapTexts
.L0808AEE8: .4byte gBg0Tm+0x4
.L0808AEEC: .4byte Img_MonologueBG
.L0808AEF0: .4byte Pal_MonologueBG
.L0808AEF4: .4byte 0x0203DC6C
.L0808AEF8: .4byte 0x0203DC6D

	thumb_func_start func_fe6_0808AEFC
func_fe6_0808AEFC: @ 0x0808AEFC
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, .L0808AF48 @ =0x0203DBE8
	adds r0, r5, #0
	bl SetTextFont
	movs r0, #0
	bl SetTextFontGlyphs
	adds r5, #0x18
	adds r0, r5, #0
	movs r1, #0
	bl SpriteText_DrawBackgroundExt
	adds r0, r5, #0
	movs r1, #2
	bl Text_SetColor
	adds r0, r4, #0
	adds r0, #0x2a
	adds r4, #0x38
	ldrb r0, [r0]
	adds r4, r0, r4
	movs r0, #0
	ldrsb r0, [r4, r0]
	bl func_fe6_080867F0
	adds r1, r0, #0
	adds r0, r5, #0
	bl Text_DrawString
	movs r0, #0
	bl SetTextFont
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0808AF48: .4byte 0x0203DBE8

	thumb_func_start func_fe6_0808AF4C
func_fe6_0808AF4C: @ 0x0808AF4C
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	ldr r4, .L0808B010 @ =0x0203DBE8
	adds r0, r4, #0
	bl SetTextFont
	movs r0, #0
	bl SetTextFontGlyphs
	adds r5, r4, #0
	adds r5, #0x18
	movs r4, #6
.L0808AF64:
	adds r0, r5, #0
	movs r1, #0
	bl SpriteText_DrawBackgroundExt
	adds r5, #8
	subs r4, #1
	cmp r4, #0
	bge .L0808AF64
	ldr r4, .L0808B014 @ =0x0203DC08
	ldr r1, .L0808B018 @ =gUnk_08336CD0
	adds r0, r4, #0
	bl Text_DrawString
	adds r0, r4, #0
	movs r1, #0x80
	bl Text_SetCursor
	ldr r1, .L0808B01C @ =gUnk_08336CF0
	adds r0, r4, #0
	bl Text_DrawString
	adds r0, r4, #0
	movs r1, #0xa0
	bl Text_SetCursor
	ldr r1, .L0808B020 @ =gUnk_08336CF8
	adds r0, r4, #0
	bl Text_DrawString
	subs r4, #8
	adds r0, r4, #0
	movs r1, #2
	bl Text_SetColor
	adds r6, r7, #0
	adds r6, #0x2a
	adds r5, r7, #0
	adds r5, #0x38
	ldrb r1, [r6]
	adds r0, r1, r5
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl func_fe6_080867F0
	adds r1, r0, #0
	adds r0, r4, #0
	bl Text_DrawString
	adds r0, r4, #0
	movs r1, #0x58
	bl Text_SetCursor
	adds r0, r4, #0
	movs r1, #0
	bl Text_SetColor
	ldr r1, .L0808B024 @ =gUnk_08336D00
	adds r0, r4, #0
	bl Text_DrawString
	adds r0, r4, #0
	movs r1, #0x70
	bl Text_SetCursor
	adds r0, r4, #0
	movs r1, #2
	bl Text_SetColor
	ldrb r6, [r6]
	adds r5, r6, r5
	movs r0, #0
	ldrsb r0, [r5, r0]
	bl DecodeExtraMapGoalMsg
	adds r1, r0, #0
	adds r0, r4, #0
	bl Text_DrawString
	movs r0, #0
	bl SetTextFont
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0808B010: .4byte 0x0203DBE8
.L0808B014: .4byte 0x0203DC08
.L0808B018: .4byte gUnk_08336CD0
.L0808B01C: .4byte gUnk_08336CF0
.L0808B020: .4byte gUnk_08336CF8
.L0808B024: .4byte gUnk_08336D00

	thumb_func_start func_fe6_0808B028
func_fe6_0808B028: @ 0x0808B028
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r4, r0, #0
	adds r5, r4, #0
	adds r5, #0x2a
	ldrb r7, [r5]
	ldr r0, .L0808B0C8 @ =gKeySt
	ldr r1, [r0]
	ldrh r2, [r1, #8]
	movs r6, #1
	movs r0, #1
	ands r0, r2
	cmp r0, #0
	beq .L0808B0D4
	movs r0, #1
	bl SetTextFontGlyphs
	adds r0, r4, #0
	bl func_fe6_0808AF4C
	adds r0, r4, #0
	adds r0, #0x38
	ldrb r5, [r5]
	adds r0, r5, r0
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl DecodeExtraMapInfoMsg
	str r0, [r4, #0x40]
	add r2, sp, #4
	mov r1, sp
	bl func_fe6_08071C00
	ldr r1, [sp]
	movs r0, #0xf0
	subs r0, r0, r1
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	adds r1, r4, #0
	adds r1, #0x47
	movs r5, #0
	strb r0, [r1]
	ldr r1, [sp, #4]
	movs r0, #0x58
	subs r0, r0, r1
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	adds r1, r4, #0
	adds r1, #0x48
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x44
	strb r5, [r0]
	adds r0, #1
	strb r6, [r0]
	ldr r0, .L0808B0CC @ =gPlaySt
	ldrb r0, [r0, #0x1d]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L0808B0AC
	movs r0, #0x6a
	bl m4aSongNumStart
.L0808B0AC:
	adds r0, r4, #0
	adds r0, #0x3e
	strb r6, [r0]
	adds r0, #1
	strb r5, [r0]
	ldr r0, .L0808B0D0 @ =func_fe6_0808AB44
	bl SetOnHBlankA
	adds r0, r4, #0
	movs r1, #1
	bl Proc_Goto
	b .L0808B156
	.align 2, 0
.L0808B0C8: .4byte gKeySt
.L0808B0CC: .4byte gPlaySt
.L0808B0D0: .4byte func_fe6_0808AB44
.L0808B0D4:
	ldrh r1, [r1, #6]
	movs r6, #0x40
	adds r0, r6, #0
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #0
	beq .L0808B108
	cmp r7, #0
	beq .L0808B0EC
	subs r0, r7, #1
	b .L0808B0FC
.L0808B0EC:
	adds r0, r6, #0
	ands r0, r2
	cmp r0, #0
	beq .L0808B0FE
	adds r0, r4, #0
	adds r0, #0x2b
	ldrb r0, [r0]
	subs r0, #1
.L0808B0FC:
	strb r0, [r5]
.L0808B0FE:
	adds r1, r4, #0
	adds r1, #0x2e
	movs r0, #0xff
	strb r0, [r1]
	b .L0808B156
.L0808B108:
	movs r6, #0x80
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	beq .L0808B136
	adds r1, r7, #1
	adds r0, r4, #0
	adds r0, #0x2b
	ldrb r0, [r0]
	cmp r1, r0
	bge .L0808B122
	strb r1, [r5]
	b .L0808B12C
.L0808B122:
	adds r0, r6, #0
	ands r0, r2
	cmp r0, #0
	beq .L0808B12C
	strb r3, [r5]
.L0808B12C:
	adds r1, r4, #0
	adds r1, #0x2e
	movs r0, #1
	strb r0, [r1]
	b .L0808B156
.L0808B136:
	movs r0, #2
	ands r0, r2
	cmp r0, #0
	beq .L0808B156
	ldr r0, .L0808B190 @ =gPlaySt
	ldrb r0, [r0, #0x1d]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L0808B14E
	movs r0, #0x6b
	bl m4aSongNumStart
.L0808B14E:
	adds r0, r4, #0
	movs r1, #3
	bl Proc_Goto
.L0808B156:
	adds r5, r4, #0
	adds r5, #0x2a
	ldrb r0, [r5]
	cmp r0, r7
	beq .L0808B186
	lsls r1, r7, #1
	adds r1, #0x26
	movs r0, #1
	movs r2, #0xa
	bl RemoveUiEntryHover
	ldrb r5, [r5]
	lsls r1, r5, #1
	adds r1, #0x26
	movs r0, #1
	movs r2, #0xa
	bl PutUiEntryHover
	movs r0, #4
	bl EnableBgSync
	adds r0, r4, #0
	bl Proc_Break
.L0808B186:
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0808B190: .4byte gPlaySt

	thumb_func_start func_fe6_0808B194
func_fe6_0808B194: @ 0x0808B194
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	adds r0, #0x2c
	ldrb r0, [r0]
	cmp r0, #0
	bne .L0808B1B4
	ldr r0, .L0808B2A4 @ =gPlaySt
	ldrb r0, [r0, #0x1d]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L0808B1B4
	movs r0, #0x66
	bl m4aSongNumStart
.L0808B1B4:
	adds r5, r4, #0
	adds r5, #0x2c
	ldrb r0, [r5]
	adds r0, #2
	movs r1, #0
	mov r8, r1
	strb r0, [r5]
	adds r7, r4, #0
	adds r7, #0x2d
	ldrb r0, [r7]
	adds r0, #1
	strb r0, [r7]
	ldr r0, [r4, #0x30]
	subs r0, #0x6c
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov ip, r0
	ldr r0, [r4, #0x34]
	adds r6, r0, #0
	subs r6, #0x1c
	adds r0, r4, #0
	adds r0, #0x2e
	movs r3, #0
	ldrsb r3, [r0, r3]
	ldrb r0, [r7]
	lsls r2, r0, #7
	lsls r1, r0, #3
	muls r0, r1, r0
	subs r0, r2, r0
	cmp r0, #0
	bge .L0808B1F4
	adds r0, #7
.L0808B1F4:
	asrs r0, r0, #3
	adds r2, r3, #0
	muls r2, r0, r2
	adds r2, r6, r2
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #1
	mov r1, ip
	bl SetBgOffset
	ldr r3, .L0808B2A8 @ =gDispIo
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	ldrb r2, [r5]
	movs r0, #0x10
	subs r0, r0, r2
	adds r1, r3, #0
	adds r1, #0x44
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x45
	strb r2, [r0]
	adds r0, #1
	mov r5, r8
	strb r5, [r0]
	ldr r0, .L0808B2AC @ =0x0000FFE0
	ldrh r1, [r3, #0x3c]
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	ldr r1, .L0808B2B0 @ =0x0000E0FF
	ands r0, r1
	movs r5, #0x80
	lsls r5, r5, #4
	adds r1, r5, #0
	orrs r0, r1
	strh r0, [r3, #0x3c]
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	cmp r2, #0x10
	bne .L0808B298
	adds r0, r4, #0
	bl Proc_Break
	adds r1, r4, #0
	adds r1, #0x2a
	adds r0, r4, #0
	adds r0, #0x38
	ldrb r1, [r1]
	adds r0, r1, r0
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldr r1, .L0808B2B4 @ =0x06002000
	movs r2, #0xa
	bl DrawMinimap
	ldr r1, .L0808B2B8 @ =gMapSize
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #1
	subs r0, #0x40
	str r0, [r4, #0x30]
	movs r5, #2
	ldrsh r0, [r1, r5]
	lsls r0, r0, #1
	subs r0, #0x40
	str r0, [r4, #0x34]
	adds r0, r4, #0
	bl func_fe6_0808AEFC
	movs r0, #2
	bl EnableBgSync
	mov r0, r8
	strb r0, [r7]
.L0808B298:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0808B2A4: .4byte gPlaySt
.L0808B2A8: .4byte gDispIo
.L0808B2AC: .4byte 0x0000FFE0
.L0808B2B0: .4byte 0x0000E0FF
.L0808B2B4: .4byte 0x06002000
.L0808B2B8: .4byte gMapSize

	thumb_func_start func_fe6_0808B2BC
func_fe6_0808B2BC: @ 0x0808B2BC
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0x2c
	ldrb r0, [r4]
	subs r0, #2
	strb r0, [r4]
	adds r7, r5, #0
	adds r7, #0x2d
	ldrb r0, [r7]
	adds r0, #1
	strb r0, [r7]
	ldr r0, [r5, #0x30]
	subs r0, #0x6c
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov ip, r0
	ldr r1, [r5, #0x34]
	adds r0, r5, #0
	adds r0, #0x2e
	movs r3, #0
	ldrsb r3, [r0, r3]
	lsls r0, r3, #6
	rsbs r0, r0, #0
	subs r0, #0x1c
	adds r6, r1, r0
	ldrb r0, [r7]
	lsls r2, r0, #7
	lsls r1, r0, #3
	muls r0, r1, r0
	subs r0, r2, r0
	cmp r0, #0
	bge .L0808B300
	adds r0, #7
.L0808B300:
	asrs r0, r0, #3
	adds r2, r3, #0
	muls r2, r0, r2
	adds r2, r6, r2
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #1
	mov r1, ip
	bl SetBgOffset
	ldr r3, .L0808B36C @ =gDispIo
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	ldrb r2, [r4]
	movs r0, #0x10
	subs r0, r0, r2
	adds r1, r3, #0
	adds r1, #0x44
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x45
	strb r2, [r0]
	adds r1, #2
	movs r0, #0
	strb r0, [r1]
	ldr r0, .L0808B370 @ =0x0000FFE0
	ldrh r4, [r3, #0x3c]
	ands r0, r4
	movs r1, #2
	orrs r0, r1
	ldr r1, .L0808B374 @ =0x0000E0FF
	ands r0, r1
	movs r4, #0x80
	lsls r4, r4, #4
	adds r1, r4, #0
	orrs r0, r1
	strh r0, [r3, #0x3c]
	lsls r2, r2, #0x18
	lsrs r4, r2, #0x18
	cmp r4, #0
	bne .L0808B366
	adds r0, r5, #0
	bl Proc_Break
	strb r4, [r7]
.L0808B366:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0808B36C: .4byte gDispIo
.L0808B370: .4byte 0x0000FFE0
.L0808B374: .4byte 0x0000E0FF

	thumb_func_start func_fe6_0808B378
func_fe6_0808B378: @ 0x0808B378
	push {lr}
	adds r3, r0, #0
	ldr r2, .L0808B3B0 @ =0x0203DC6C
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	ldr r0, .L0808B3B4 @ =gKeySt
	ldr r1, [r0]
	movs r0, #3
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq .L0808B39E
	adds r1, r3, #0
	adds r1, #0x45
	movs r0, #0xff
	strb r0, [r1]
	movs r0, #0x14
	strb r0, [r2]
.L0808B39E:
	ldrb r2, [r2]
	cmp r2, #0x13
	bls .L0808B3AA
	adds r0, r3, #0
	bl Proc_Break
.L0808B3AA:
	pop {r0}
	bx r0
	.align 2, 0
.L0808B3B0: .4byte 0x0203DC6C
.L0808B3B4: .4byte gKeySt

	thumb_func_start func_fe6_0808B3B8
func_fe6_0808B3B8: @ 0x0808B3B8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, .L0808B404 @ =gKeySt
	ldr r1, [r0]
	movs r0, #3
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq .L0808B3D2
	adds r1, r4, #0
	adds r1, #0x45
	movs r0, #0xff
	strb r0, [r1]
.L0808B3D2:
	adds r0, r4, #0
	bl func_fe6_0808AA84
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L0808B3FC
	ldr r0, .L0808B408 @ =gPlaySt
	ldrb r0, [r0, #0x1d]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L0808B3EE
	movs r0, #0x6a
	bl m4aSongNumStart
.L0808B3EE:
	adds r1, r4, #0
	adds r1, #0x3e
	movs r0, #2
	strb r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
.L0808B3FC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0808B404: .4byte gKeySt
.L0808B408: .4byte gPlaySt

	thumb_func_start func_fe6_0808B40C
func_fe6_0808B40C: @ 0x0808B40C
	push {lr}
	adds r2, r0, #0
	ldr r1, .L0808B42C @ =0x0203DC6D
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xa
	bne .L0808B426
	adds r0, r2, #0
	bl Proc_Break
.L0808B426:
	pop {r0}
	bx r0
	.align 2, 0
.L0808B42C: .4byte 0x0203DC6D

	thumb_func_start func_fe6_0808B430
func_fe6_0808B430: @ 0x0808B430
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r7, r4, #0
	adds r7, #0x3f
	ldrb r2, [r7]
	ldr r0, .L0808B464 @ =gKeySt
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r6, #0x30
	ands r6, r1
	cmp r6, #0
	beq .L0808B46C
	adds r0, r2, #1
	movs r1, #1
	ands r0, r1
	strb r0, [r7]
	ldr r0, .L0808B468 @ =gPlaySt
	ldrb r0, [r0, #0x1d]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L0808B520
	movs r0, #0x67
	bl m4aSongNumStart
	b .L0808B520
	.align 2, 0
.L0808B464: .4byte gKeySt
.L0808B468: .4byte gPlaySt
.L0808B46C:
	movs r0, #2
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0
	beq .L0808B4B4
	ldr r0, .L0808B4A8 @ =gPlaySt
	ldrb r0, [r0, #0x1d]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L0808B488
	movs r0, #0x6b
	bl m4aSongNumStart
.L0808B488:
	adds r0, r4, #0
	adds r0, #0x3e
	strb r6, [r0]
	movs r0, #0
	bl SetOnHBlankA
	ldr r0, .L0808B4AC @ =0x0203DC6C
	strb r6, [r0]
	ldr r0, .L0808B4B0 @ =0x0203DC6D
	strb r6, [r0]
	adds r0, r4, #0
	bl Proc_Break
	movs r0, #1
	strb r0, [r7]
	b .L0808B520
	.align 2, 0
.L0808B4A8: .4byte gPlaySt
.L0808B4AC: .4byte 0x0203DC6C
.L0808B4B0: .4byte 0x0203DC6D
.L0808B4B4:
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq .L0808B520
	cmp r2, #0
	beq .L0808B4F8
	ldr r0, .L0808B4EC @ =gPlaySt
	ldrb r0, [r0, #0x1d]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L0808B4D0
	movs r0, #0x6b
	bl m4aSongNumStart
.L0808B4D0:
	adds r0, r4, #0
	adds r0, #0x3e
	strb r5, [r0]
	movs r0, #0
	bl SetOnHBlankA
	ldr r0, .L0808B4F0 @ =0x0203DC6C
	strb r5, [r0]
	ldr r0, .L0808B4F4 @ =0x0203DC6D
	strb r5, [r0]
	adds r0, r4, #0
	bl Proc_Break
	b .L0808B520
	.align 2, 0
.L0808B4EC: .4byte gPlaySt
.L0808B4F0: .4byte 0x0203DC6C
.L0808B4F4: .4byte 0x0203DC6D
.L0808B4F8:
	ldr r1, .L0808B528 @ =gPlaySt
	adds r2, r4, #0
	adds r2, #0x2a
	adds r0, r4, #0
	adds r0, #0x38
	ldrb r2, [r2]
	adds r0, r2, r0
	ldrb r0, [r0]
	strb r0, [r1, #0xe]
	ldrb r1, [r1, #0x1d]
	lsls r0, r1, #0x1e
	cmp r0, #0
	blt .L0808B518
	movs r0, #0x6a
	bl m4aSongNumStart
.L0808B518:
	adds r0, r4, #0
	movs r1, #3
	bl Proc_Goto
.L0808B520:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0808B528: .4byte gPlaySt

	thumb_func_start Xmap_End
Xmap_End: @ 0x0808B52C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x4c]
	bl Proc_End
	adds r0, r4, #0
	adds r0, #0x3f
	ldrb r0, [r0]
	cmp r0, #0
	bne .L0808B560
	movs r0, #0x80
	movs r1, #0
	movs r2, #0x10
	movs r3, #0
	bl StartBgmVolumeChange
	movs r0, #6
	bl SetNextGameAction
	ldr r0, [r4, #0x14]
	bl Proc_End
	movs r0, #0
	bl SetOnHBlankA
	b .L0808B564
.L0808B560:
	bl ForceEnableSounds
.L0808B564:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start Xmap_TextEnd
Xmap_TextEnd: @ 0x0808B56C
	push {lr}
	bl EndGreenText
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start SaveMenu_ExecXmap
SaveMenu_ExecXmap: @ 0x0808B578
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, .L0808B594 @ =ProcScr_Xmap
	bl SpawnProcLocking
	adds r1, r0, #0
	adds r0, #0x29
	strb r4, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0808B594: .4byte ProcScr_Xmap

	thumb_func_start func_fe6_0808B598
func_fe6_0808B598: @ 0x0808B598
	push {r4, r5, r6, r7, lr}
	ldr r7, .L0808B60C @ =0x06012000
	ldr r5, .L0808B610 @ =0x0203DBE8
	adds r0, r5, #0
	adds r1, r7, #0
	movs r2, #5
	bl InitSpriteTextFont
	ldr r0, .L0808B614 @ =Pal_Text
	movs r4, #0xa8
	lsls r4, r4, #2
	adds r1, r4, #0
	movs r2, #0x40
	bl ApplyPaletteExt
	ldr r0, .L0808B618 @ =gPal
	adds r0, r0, r4
	movs r1, #0
	strh r1, [r0]
	adds r0, r5, #0
	bl SetTextFont
	movs r5, #0
.L0808B5C6:
	lsls r4, r5, #3
	ldr r6, .L0808B61C @ =0x0203DC00
	adds r4, r4, r6
	adds r0, r4, #0
	bl InitSpriteText
	adds r0, r4, #0
	movs r1, #0
	bl SpriteText_DrawBackgroundExt
	adds r0, r4, #0
	movs r1, #0
	bl Text_SetColor
	adds r5, #1
	cmp r5, #6
	ble .L0808B5C6
	movs r0, #0
	bl SetTextFont
	ldr r0, .L0808B620 @ =0x0001FFFF
	ands r0, r7
	lsrs r0, r0, #5
	ldr r2, .L0808B624 @ =0x000003FF
	adds r1, r2, #0
	ands r0, r1
	movs r2, #0xa0
	lsls r2, r2, #7
	adds r1, r2, #0
	adds r0, r0, r1
	strh r0, [r6, #0x38]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0808B60C: .4byte 0x06012000
.L0808B610: .4byte 0x0203DBE8
.L0808B614: .4byte Pal_Text
.L0808B618: .4byte gPal
.L0808B61C: .4byte 0x0203DC00
.L0808B620: .4byte 0x0001FFFF
.L0808B624: .4byte 0x000003FF

	thumb_func_start func_fe6_0808B628
func_fe6_0808B628: @ 0x0808B628
	push {lr}
	ldr r1, [r0, #0x14]
	str r1, [r0, #0x2c]
	adds r1, #0x2a
	ldrb r2, [r1]
	adds r1, r0, #0
	adds r1, #0x30
	strb r2, [r1]
	bl func_fe6_0808B598
	pop {r0}
	bx r0

	thumb_func_start func_fe6_0808B640
func_fe6_0808B640: @ 0x0808B640
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov sb, r0
	movs r4, #0
	movs r5, #0x80
	lsls r5, r5, #7
.L0808B654:
	lsls r1, r4, #5
	str r5, [sp]
	movs r0, #0xb
	movs r2, #0
	ldr r3, .L0808B680 @ =Sprite_0868A568
	bl PutSprite
	adds r4, #1
	cmp r4, #7
	ble .L0808B654
	mov r1, sb
	ldr r0, [r1, #0x2c]
	adds r1, r0, #0
	adds r1, #0x3e
	ldrb r1, [r1]
	cmp r1, #1
	beq .L0808B712
	cmp r1, #1
	bgt .L0808B684
	cmp r1, #0
	beq .L0808B68A
	b .L0808B786
	.align 2, 0
.L0808B680: .4byte Sprite_0868A568
.L0808B684:
	cmp r1, #2
	beq .L0808B6E0
	b .L0808B786
.L0808B68A:
	ldr r3, .L0808B6D4 @ =Sprite_0868A570
	movs r0, #0x80
	lsls r0, r0, #7
	str r0, [sp]
	movs r0, #0xb
	movs r1, #4
	movs r2, #4
	bl PutSprite
	mov r3, sb
	ldr r0, [r3, #0x2c]
	adds r0, #0x2a
	ldrb r0, [r0]
	lsls r1, r0, #4
	adds r1, #0x30
	movs r0, #0xe
	bl PutUiHand
	movs r4, #0
	ldr r6, .L0808B6D8 @ =0x0203DC38
	movs r5, #0x98
.L0808B6B4:
	lsls r0, r4, #2
	ldrh r7, [r6]
	adds r0, r7, r0
	str r0, [sp]
	movs r0, #4
	adds r1, r5, #0
	movs r2, #4
	ldr r3, .L0808B6DC @ =Sprite_32x16
	bl PutSpriteExt
	adds r5, #0x20
	adds r4, #1
	cmp r4, #6
	ble .L0808B6B4
	b .L0808B786
	.align 2, 0
.L0808B6D4: .4byte Sprite_0868A570
.L0808B6D8: .4byte 0x0203DC38
.L0808B6DC: .4byte Sprite_32x16
.L0808B6E0:
	adds r0, #0x3f
	ldrb r0, [r0]
	lsls r0, r0, #5
	adds r0, #0x94
	movs r1, #0x86
	bl PutUiHand
	movs r4, #0
	ldr r6, .L0808B798 @ =0x0203DC38
	movs r5, #0x18
.L0808B6F4:
	lsls r0, r4, #2
	ldrh r1, [r6]
	adds r0, r1, r0
	adds r0, #0x40
	str r0, [sp]
	movs r0, #4
	adds r1, r5, #0
	movs r2, #0x86
	ldr r3, .L0808B79C @ =Sprite_32x16
	bl PutSprite
	adds r5, #0x20
	adds r4, #1
	cmp r4, #5
	ble .L0808B6F4
.L0808B712:
	movs r4, #0
	ldr r6, .L0808B798 @ =0x0203DC38
	movs r5, #0x10
.L0808B718:
	lsls r0, r4, #2
	ldrh r3, [r6]
	adds r0, r3, r0
	str r0, [sp]
	movs r0, #4
	adds r1, r5, #0
	movs r2, #4
	ldr r3, .L0808B79C @ =Sprite_32x16
	bl PutSpriteExt
	adds r5, #0x20
	adds r4, #1
	cmp r4, #6
	ble .L0808B718
	movs r0, #0
	ldr r7, .L0808B798 @ =0x0203DC38
	mov r8, r7
.L0808B73A:
	movs r4, #0
	lsls r6, r0, #4
	adds r5, r0, #2
	adds r0, #1
	mov sl, r0
.L0808B744:
	mov r1, sb
	ldr r0, [r1, #0x2c]
	adds r2, r0, #0
	adds r2, #0x47
	lsls r1, r4, #5
	ldrb r2, [r2]
	adds r1, r2, r1
	adds r0, #0x48
	ldrb r0, [r0]
	adds r2, r0, r6
	movs r3, #0x84
	lsls r3, r3, #3
	adds r2, r2, r3
	lsls r0, r4, #2
	mov r7, r8
	ldrh r7, [r7]
	adds r0, r7, r0
	lsls r3, r5, #6
	adds r0, r0, r3
	movs r3, #0x80
	lsls r3, r3, #5
	adds r0, r0, r3
	str r0, [sp]
	movs r0, #4
	ldr r3, .L0808B79C @ =Sprite_32x16
	bl PutSprite
	adds r4, #1
	cmp r4, #5
	ble .L0808B744
	mov r0, sl
	cmp r0, #4
	ble .L0808B73A
.L0808B786:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0808B798: .4byte 0x0203DC38
.L0808B79C: .4byte Sprite_32x16

	thumb_func_start func_fe6_0808B7A0
func_fe6_0808B7A0: @ 0x0808B7A0
	push {lr}
	adds r1, r0, #0
	ldr r0, .L0808B7B0 @ =ProcScr_0868A634
	bl SpawnProc
	pop {r0}
	bx r0
	.align 2, 0
.L0808B7B0: .4byte ProcScr_0868A634

	thumb_func_start func_fe6_0808B7B4
func_fe6_0808B7B4: @ 0x0808B7B4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	mov r8, r0
	ldr r4, .L0808B848 @ =gBg3Tm
	adds r0, r4, #0
	movs r1, #0
	bl TmFill
	movs r0, #0
	movs r1, #0x2c
	add r1, r8
	mov sb, r1
	movs r3, #0x1d
	mov ip, r3
	movs r1, #0x27
	mov sl, r1
	adds r7, r4, #0
	movs r3, #0xf4
	lsls r3, r3, #8
	adds r6, r3, #0
.L0808B7E2:
	movs r2, #0
	adds r5, r0, #1
	lsls r4, r0, #6
	mov r3, sl
	subs r1, r3, r0
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	ldr r1, .L0808B84C @ =gUnk_08320436
	adds r3, r0, r1
.L0808B7F6:
	mov r0, ip
	subs r1, r0, r2
	lsls r1, r1, #1
	adds r1, r4, r1
	adds r1, r1, r7
	lsls r0, r2, #1
	adds r0, r0, r3
	ldrh r0, [r0]
	adds r0, r6, r0
	strh r0, [r1]
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0x1d
	bls .L0808B7F6
	lsls r0, r5, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x1f
	bls .L0808B7E2
	movs r0, #8
	bl EnableBgSync
	movs r4, #0
	mov r1, sb
	strb r4, [r1]
	mov r3, r8
	strh r4, [r3, #0x2a]
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r0, .L0808B850 @ =0x0400001E
	strh r4, [r0]
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0808B848: .4byte gBg3Tm
.L0808B84C: .4byte gUnk_08320436
.L0808B850: .4byte 0x0400001E

	thumb_func_start func_fe6_0808B854
func_fe6_0808B854: @ 0x0808B854
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	adds r6, r5, #0
	adds r6, #0x2c
	ldrb r0, [r6]
	cmp r0, #3
	bne .L0808B896
	ldrh r0, [r5, #0x2a]
	adds r0, #1
	strh r0, [r5, #0x2a]
	lsls r0, r0, #0x10
	movs r1, #0xa0
	lsls r1, r1, #0x13
	cmp r0, r1
	bne .L0808B87A
	movs r0, #0
	strh r0, [r5, #0x2a]
.L0808B87A:
	movs r4, #0xff
	adds r2, r4, #0
	ldrh r1, [r5, #0x2a]
	ands r2, r1
	movs r0, #3
	movs r1, #0
	bl SetBgOffset
	ldr r0, .L0808B918 @ =0x0400001E
	ldrh r1, [r5, #0x2a]
	ands r4, r1
	strh r4, [r0]
	movs r0, #0
	strb r0, [r6]
.L0808B896:
	adds r1, r5, #0
	adds r1, #0x2c
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldrh r1, [r5, #0x2a]
	movs r0, #7
	ands r0, r1
	cmp r0, #0
	bne .L0808B90E
	ldr r5, .L0808B91C @ =gUnk_08320436
	lsrs r0, r1, #3
	subs r4, r0, #1
	movs r1, #0x1f
	ands r4, r1
	adds r0, #0x1e
	movs r1, #0x28
	bl __modsi3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r2, #0
	ldr r1, .L0808B920 @ =gBg3Tm
	mov r8, r1
	movs r1, #0x1d
	mov ip, r1
	lsls r4, r4, #6
	movs r1, #0x27
	subs r1, r1, r0
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r3, r0, r5
	mov r7, r8
	movs r0, #0xf4
	lsls r0, r0, #8
	adds r6, r0, #0
	adds r5, r4, #0
.L0808B8E2:
	mov r0, ip
	subs r1, r0, r2
	lsls r1, r1, #1
	adds r1, r4, r1
	adds r1, r1, r7
	lsls r0, r2, #1
	adds r0, r0, r3
	ldrh r0, [r0]
	adds r0, r6, r0
	strh r0, [r1]
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0x1d
	bls .L0808B8E2
	mov r1, r8
	adds r0, r5, r1
	ldr r1, .L0808B924 @ =0x06007800
	adds r1, r5, r1
	movs r2, #0xf
	bl CpuFastSet
.L0808B90E:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0808B918: .4byte 0x0400001E
.L0808B91C: .4byte gUnk_08320436
.L0808B920: .4byte gBg3Tm
.L0808B924: .4byte 0x06007800

	thumb_func_start func_fe6_0808B928
func_fe6_0808B928: @ 0x0808B928
	push {lr}
	ldr r0, .L0808B938 @ =ProcScr_0868A644
	movs r1, #0
	bl SpawnProc
	pop {r1}
	bx r1
	.align 2, 0
.L0808B938: .4byte ProcScr_0868A644

	thumb_func_start func_fe6_0808B93C
func_fe6_0808B93C: @ 0x0808B93C
	push {r4, r5, r6, lr}
	adds r1, r0, #0
	movs r1, #0xa
	bl __modsi3
	adds r1, r0, #0
	movs r4, #0
	ldr r5, .L0808B9A8 @ =0x020004AC
	ldr r6, .L0808B9AC @ =Imgs_0868A998
.L0808B94E:
	lsrs r0, r4, #0x1f
	adds r0, r4, r0
	asrs r0, r0, #1
	lsls r0, r0, #1
	subs r0, r4, r0
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, r1
	bne .L0808B96A
	adds r0, r1, #1
	movs r1, #0xa
	bl __modsi3
	adds r1, r0, #0
.L0808B96A:
	adds r4, #1
	cmp r4, #2
	ble .L0808B94E
	ldrb r0, [r5]
	strb r0, [r5, #1]
	strb r1, [r5]
	lsls r0, r1, #3
	adds r0, r0, r6
	ldr r4, [r0]
	movs r0, #2
	bl GetBgChrOffset
	adds r1, r0, #0
	ldr r0, .L0808B9B0 @ =0x06002800
	adds r1, r1, r0
	adds r0, r4, #0
	bl Decompress
	ldrb r5, [r5]
	lsls r0, r5, #3
	adds r1, r6, #4
	adds r0, r0, r1
	ldr r0, [r0]
	movs r1, #0xc0
	movs r2, #0x20
	bl ApplyPaletteExt
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L0808B9A8: .4byte 0x020004AC
.L0808B9AC: .4byte Imgs_0868A998
.L0808B9B0: .4byte 0x06002800

	thumb_func_start func_fe6_0808B9B4
func_fe6_0808B9B4: @ 0x0808B9B4
	movs r2, #0
	ldr r1, .L0808B9C4 @ =gUnk_0868A664
.L0808B9B8:
	ldr r0, [r1]
	cmp r0, #0
	blt .L0808B9C8
	adds r1, #0xc
	adds r2, #1
	b .L0808B9B8
	.align 2, 0
.L0808B9C4: .4byte gUnk_0868A664
.L0808B9C8:
	adds r0, r2, #0
	bx lr

	thumb_func_start func_fe6_0808B9CC
func_fe6_0808B9CC: @ 0x0808B9CC
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r7, r0, #0
	movs r0, #0
	bl InitBgs
	bl ResetTextFont
	bl ResetText
	bl ApplySystemObjectsGraphics
	bl InitSystemTextFont
	ldr r3, .L0808BB78 @ =gDispIo
	movs r5, #1
	ldrb r2, [r3, #1]
	orrs r2, r5
	movs r4, #2
	orrs r2, r4
	movs r0, #4
	orrs r2, r0
	movs r0, #8
	orrs r2, r0
	movs r0, #0x10
	orrs r2, r0
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r6, [r3, #0xc]
	ands r0, r6
	strb r0, [r3, #0xc]
	adds r0, r1, #0
	ldrb r6, [r3, #0x10]
	ands r0, r6
	orrs r0, r4
	strb r0, [r3, #0x10]
	ldrb r0, [r3, #0x14]
	ands r1, r0
	orrs r1, r5
	strb r1, [r3, #0x14]
	movs r0, #3
	ldrb r1, [r3, #0x18]
	orrs r0, r1
	strb r0, [r3, #0x18]
	movs r0, #0x21
	rsbs r0, r0, #0
	ands r2, r0
	subs r0, #0x20
	ands r2, r0
	movs r0, #0x7f
	ands r2, r0
	strb r2, [r3, #1]
	movs r0, #0
	bl SetBlankChr
	ldr r0, .L0808BB7C @ =gBg0Tm
	movs r1, #0
	bl TmFill
	ldr r6, .L0808BB80 @ =gBg1Tm
	adds r0, r6, #0
	movs r1, #0
	bl TmFill
	ldr r2, .L0808BB84 @ =gBg2Tm
	mov r8, r2
	mov r0, r8
	movs r1, #0
	bl TmFill
	ldr r0, .L0808BB88 @ =gBg3Tm
	mov sb, r0
	movs r1, #0
	bl TmFill
	movs r0, #0xf
	bl EnableBgSync
	movs r3, #0
	str r3, [r7, #0x34]
	str r3, [r7, #0x30]
	ldr r1, .L0808BB8C @ =0x020004AC
	movs r0, #0xff
	ldrb r2, [r1, #1]
	orrs r2, r0
	strb r2, [r1, #1]
	ldrb r2, [r1]
	orrs r0, r2
	strb r0, [r1]
	adds r1, r7, #0
	adds r1, #0x29
	movs r0, #1
	strb r0, [r1]
	movs r1, #0
	strh r3, [r7, #0x2c]
	adds r0, r7, #0
	adds r0, #0x38
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #7
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	bl func_fe6_0808BE70
	adds r0, r7, #0
	bl func_fe6_0808BF00
	bl func_fe6_0808BFF0
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r4, .L0808BB90 @ =gUnk_08345934
	movs r0, #1
	bl GetBgChrOffset
	adds r1, r0, #0
	movs r5, #0xc0
	lsls r5, r5, #0x13
	adds r1, r1, r5
	adds r0, r4, #0
	bl Decompress
	ldr r0, .L0808BB94 @ =gUnk_08346184
	movs r1, #0x80
	movs r2, #0x40
	bl ApplyPaletteExt
	ldr r1, .L0808BB98 @ =gUnk_0832C5E8
	movs r2, #0x80
	lsls r2, r2, #7
	adds r0, r6, #0
	bl TmApplyTsa_thm
	ldr r1, .L0808BB9C @ =0x0000FF98
	ldr r2, .L0808BBA0 @ =0x0000FFC0
	movs r0, #2
	bl SetBgOffset
	bl GetGameTime
	bl func_fe6_0808B93C
	ldr r1, .L0808BBA4 @ =0x00006140
	mov r0, r8
	movs r2, #0xf
	movs r3, #0xa
	bl func_fe6_0808FDE8
	ldr r4, .L0808BBA8 @ =Img_MonologueBG
	movs r0, #3
	bl GetBgChrOffset
	adds r1, r0, #0
	adds r1, r1, r5
	adds r0, r4, #0
	bl Decompress
	ldr r0, .L0808BBAC @ =gUnk_0832CA9C
	movs r1, #0xe0
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r1, .L0808BBB0 @ =gUnk_08345440
	movs r2, #0xe0
	lsls r2, r2, #7
	mov r0, sb
	bl TmApplyTsa_thm
	ldr r0, .L0808BBB4 @ =gUnk_0832CAFC
	ldr r1, .L0808BBB8 @ =0x06012000
	bl Decompress
	ldr r0, .L0808BBBC @ =gUnk_0832CC90
	movs r1, #0xa0
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, .L0808BBC0 @ =gUnk_08320EEC
	ldr r1, .L0808BBC4 @ =0x06017000
	bl Decompress
	ldr r0, .L0808BBC8 @ =Pal_SpinningArrow
	movs r1, #0xa8
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r7, #0x2e]
	adds r0, r7, #0
	bl NewProc_0868AAA8
	str r0, [r7, #0x3c]
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0808BB78: .4byte gDispIo
.L0808BB7C: .4byte gBg0Tm
.L0808BB80: .4byte gBg1Tm
.L0808BB84: .4byte gBg2Tm
.L0808BB88: .4byte gBg3Tm
.L0808BB8C: .4byte 0x020004AC
.L0808BB90: .4byte gUnk_08345934
.L0808BB94: .4byte gUnk_08346184
.L0808BB98: .4byte gUnk_0832C5E8
.L0808BB9C: .4byte 0x0000FF98
.L0808BBA0: .4byte 0x0000FFC0
.L0808BBA4: .4byte 0x00006140
.L0808BBA8: .4byte Img_MonologueBG
.L0808BBAC: .4byte gUnk_0832CA9C
.L0808BBB0: .4byte gUnk_08345440
.L0808BBB4: .4byte gUnk_0832CAFC
.L0808BBB8: .4byte 0x06012000
.L0808BBBC: .4byte gUnk_0832CC90
.L0808BBC0: .4byte gUnk_08320EEC
.L0808BBC4: .4byte 0x06017000
.L0808BBC8: .4byte Pal_SpinningArrow

	thumb_func_start func_fe6_0808BBCC
func_fe6_0808BBCC: @ 0x0808BBCC
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, .L0808BC10 @ =gKeySt
	ldr r2, [r0]
	ldrh r1, [r2, #6]
	movs r0, #0x20
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	cmp r6, #0
	beq .L0808BC18
	adds r0, r5, #0
	movs r1, #2
	bl Proc_Goto
	ldr r0, .L0808BC14 @ =gPlaySt
	ldrb r0, [r0, #0x1d]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L0808BBFA
	movs r0, #0x67
	bl m4aSongNumStart
.L0808BBFA:
	ldr r0, [r5, #0x30]
	cmp r0, #0
	bgt .L0808BC04
	bl func_fe6_0808B9B4
.L0808BC04:
	subs r0, #1
	str r0, [r5, #0x30]
	adds r1, r5, #0
	adds r1, #0x38
	b .L0808BC78
	.align 2, 0
.L0808BC10: .4byte gKeySt
.L0808BC14: .4byte gPlaySt
.L0808BC18:
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq .L0808BC58
	adds r0, r5, #0
	movs r1, #2
	bl Proc_Goto
	ldr r0, .L0808BC48 @ =gPlaySt
	ldrb r0, [r0, #0x1d]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L0808BC38
	movs r0, #0x67
	bl m4aSongNumStart
.L0808BC38:
	ldr r4, [r5, #0x30]
	adds r4, #1
	bl func_fe6_0808B9B4
	cmp r4, r0
	bne .L0808BC4C
	str r6, [r5, #0x30]
	b .L0808BC52
	.align 2, 0
.L0808BC48: .4byte gPlaySt
.L0808BC4C:
	ldr r0, [r5, #0x30]
	adds r0, #1
	str r0, [r5, #0x30]
.L0808BC52:
	adds r1, r5, #0
	adds r1, #0x39
	b .L0808BC78
.L0808BC58:
	adds r4, r5, #0
	adds r4, #0x40
	ldrb r0, [r4]
	cmp r0, #0
	bne .L0808BCB4
	ldrh r1, [r2, #8]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq .L0808BC7E
	movs r0, #1
	rsbs r0, r0, #0
	bl FadeBgmOut
	adds r1, r5, #0
	adds r1, #0x29
.L0808BC78:
	movs r0, #1
	strb r0, [r1]
	b .L0808BCB4
.L0808BC7E:
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq .L0808BC92
	adds r0, r5, #0
	bl NewProc_0868AA80
	movs r0, #1
	strb r0, [r4]
	b .L0808BCB4
.L0808BC92:
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq .L0808BCB4
	adds r0, r5, #0
	movs r1, #3
	bl Proc_Goto
	bl IsBgmPlaying
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L0808BCB4
	movs r0, #1
	rsbs r0, r0, #0
	bl FadeBgmOut
.L0808BCB4:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_fe6_0808BCBC
func_fe6_0808BCBC: @ 0x0808BCBC
	push {r4, r5, lr}
	adds r5, r0, #0
	ldrh r4, [r5, #0x2c]
	adds r4, #1
	strh r4, [r5, #0x2c]
	movs r0, #6
	subs r0, r0, r4
	lsls r0, r0, #8
	movs r1, #6
	bl __divsi3
	strh r0, [r5, #0x2e]
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	cmp r4, #6
	bne .L0808BCE8
	adds r0, r5, #0
	bl func_fe6_0808BF00
	adds r0, r5, #0
	bl Proc_Break
.L0808BCE8:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_fe6_0808BCF0
func_fe6_0808BCF0: @ 0x0808BCF0
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldrh r4, [r5, #0x2c]
	subs r4, #1
	movs r6, #0
	strh r4, [r5, #0x2c]
	movs r0, #6
	subs r0, r0, r4
	lsls r0, r0, #8
	movs r1, #6
	bl __divsi3
	strh r0, [r5, #0x2e]
	lsls r4, r4, #0x10
	cmp r4, #0
	bne .L0808BD20
	adds r0, r5, #0
	bl Proc_Break
	adds r0, r5, #0
	adds r0, #0x38
	strb r6, [r0]
	adds r0, #1
	strb r6, [r0]
.L0808BD20:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_fe6_0808BD28
func_fe6_0808BD28: @ 0x0808BD28
	push {lr}
	ldr r3, .L0808BD54 @ =gDispIo
	movs r1, #2
	rsbs r1, r1, #0
	ldrb r2, [r3, #1]
	ands r1, r2
	movs r2, #3
	rsbs r2, r2, #0
	ands r1, r2
	subs r2, #2
	ands r1, r2
	subs r2, #4
	ands r1, r2
	subs r2, #8
	ands r1, r2
	strb r1, [r3, #1]
	ldr r0, [r0, #0x3c]
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
.L0808BD54: .4byte gDispIo

	thumb_func_start SaveMenu_ExecSoundroom
SaveMenu_ExecSoundroom: @ 0x0808BD58
	push {lr}
	adds r1, r0, #0
	ldr r0, .L0808BD68 @ =ProcScr_SoundRoom
	bl SpawnProcLocking
	pop {r1}
	bx r1
	.align 2, 0
.L0808BD68: .4byte ProcScr_SoundRoom

	thumb_func_start func_fe6_0808BD6C
func_fe6_0808BD6C: @ 0x0808BD6C
	movs r1, #0
	strh r1, [r0, #0x2c]
	ldr r1, [r0, #0x14]
	ldr r1, [r1, #0x30]
	str r1, [r0, #0x30]
	bx lr

	thumb_func_start func_fe6_0808BD78
func_fe6_0808BD78: @ 0x0808BD78
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldrh r4, [r6, #0x2c]
	adds r4, #1
	movs r3, #0
	strh r4, [r6, #0x2c]
	ldr r5, .L0808BDEC @ =gDispIo
	adds r2, r5, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x80
	orrs r0, r1
	strb r0, [r2]
	adds r0, r5, #0
	adds r0, #0x44
	strb r3, [r0]
	adds r0, #1
	strb r3, [r0]
	ldrh r0, [r6, #0x2c]
	movs r1, #3
	bl __udivsi3
	adds r1, r5, #0
	adds r1, #0x46
	strb r0, [r1]
	ldr r0, .L0808BDF0 @ =0x0000FFE0
	ldrh r1, [r5, #0x3c]
	ands r0, r1
	movs r1, #4
	orrs r0, r1
	strh r0, [r5, #0x3c]
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	cmp r4, #0x30
	bne .L0808BDE4
	ldr r2, .L0808BDF4 @ =gUnk_0868A664
	ldr r1, [r6, #0x30]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r0, [r0]
	movs r1, #0
	bl StartBgm
	bl GetGameTime
	bl func_fe6_0808B93C
	adds r0, r6, #0
	bl Proc_Break
.L0808BDE4:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L0808BDEC: .4byte gDispIo
.L0808BDF0: .4byte 0x0000FFE0
.L0808BDF4: .4byte gUnk_0868A664

	thumb_func_start func_fe6_0808BDF8
func_fe6_0808BDF8: @ 0x0808BDF8
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	ldrh r4, [r6, #0x2c]
	subs r4, #1
	movs r7, #0
	strh r4, [r6, #0x2c]
	ldr r5, .L0808BE54 @ =gDispIo
	adds r2, r5, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x80
	orrs r0, r1
	strb r0, [r2]
	adds r0, r5, #0
	adds r0, #0x44
	strb r7, [r0]
	adds r0, #1
	strb r7, [r0]
	ldrh r0, [r6, #0x2c]
	movs r1, #3
	bl __udivsi3
	adds r1, r5, #0
	adds r1, #0x46
	strb r0, [r1]
	ldr r0, .L0808BE58 @ =0x0000FFE0
	ldrh r1, [r5, #0x3c]
	ands r0, r1
	movs r1, #4
	orrs r0, r1
	strh r0, [r5, #0x3c]
	lsls r4, r4, #0x10
	cmp r4, #0
	bne .L0808BE4C
	adds r0, r6, #0
	bl Proc_Break
	ldr r0, [r6, #0x14]
	adds r0, #0x40
	strb r7, [r0]
.L0808BE4C:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0808BE54: .4byte gDispIo
.L0808BE58: .4byte 0x0000FFE0

	thumb_func_start NewProc_0868AA80
NewProc_0868AA80: @ 0x0808BE5C
	push {lr}
	adds r1, r0, #0
	ldr r0, .L0808BE6C @ =ProcScr_0868AA80
	bl SpawnProc
	pop {r1}
	bx r1
	.align 2, 0
.L0808BE6C: .4byte ProcScr_0868AA80

	thumb_func_start func_fe6_0808BE70
func_fe6_0808BE70: @ 0x0808BE70
	push {r4, r5, r6, lr}
	ldr r6, .L0808BEE8 @ =0x06014000
	ldr r4, .L0808BEEC @ =0x02000468
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #5
	bl InitSpriteTextFont
	ldr r0, .L0808BEF0 @ =Pal_Text
	movs r5, #0xd0
	lsls r5, r5, #2
	adds r1, r5, #0
	movs r2, #0x40
	bl ApplyPaletteExt
	ldr r0, .L0808BEF4 @ =gPal
	adds r0, r0, r5
	movs r1, #0
	strh r1, [r0]
	bl EnablePalSync
	adds r0, r4, #0
	bl SetTextFont
	adds r0, r4, #0
	adds r0, #0x18
	bl InitSpriteText
	adds r0, r4, #0
	adds r0, #0x20
	bl InitSpriteText
	adds r4, #0x28
	movs r5, #2
.L0808BEB4:
	adds r0, r4, #0
	bl InitSpriteText
	adds r4, #8
	subs r5, #1
	cmp r5, #0
	bge .L0808BEB4
	movs r0, #0
	bl SetTextFont
	ldr r2, .L0808BEEC @ =0x02000468
	ldr r0, .L0808BEF8 @ =0x0001FFFF
	ands r0, r6
	lsrs r0, r0, #5
	ldr r3, .L0808BEFC @ =0x000003FF
	adds r1, r3, #0
	ands r0, r1
	movs r3, #0xa0
	lsls r3, r3, #8
	adds r1, r3, #0
	adds r0, r0, r1
	adds r2, #0x40
	strh r0, [r2]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L0808BEE8: .4byte 0x06014000
.L0808BEEC: .4byte 0x02000468
.L0808BEF0: .4byte Pal_Text
.L0808BEF4: .4byte gPal
.L0808BEF8: .4byte 0x0001FFFF
.L0808BEFC: .4byte 0x000003FF

	thumb_func_start func_fe6_0808BF00
func_fe6_0808BF00: @ 0x0808BF00
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r7, r0, #0
	ldr r0, [r7, #0x30]
	mov r8, r0
	ldr r6, .L0808BF90 @ =0x02000468
	adds r0, r6, #0
	bl SetTextFont
	movs r0, #1
	bl SetTextFontGlyphs
	mov r1, r8
	lsls r0, r1, #1
	add r0, r8
	lsls r0, r0, #2
	mov sb, r0
	ldr r5, .L0808BF94 @ =gUnk_0868A664
	adds r5, #4
	add r5, sb
	ldr r0, [r5]
	bl DecodeMsg
	add r1, sp, #4
	mov sl, r1
	mov r1, sp
	mov r2, sl
	bl func_fe6_08071C00
	adds r4, r6, #0
	adds r4, #0x18
	adds r0, r4, #0
	movs r1, #0
	bl SpriteText_DrawBackgroundExt
	ldr r0, [sp]
	movs r1, #0xb0
	subs r1, r1, r0
	lsrs r0, r1, #0x1f
	adds r1, r1, r0
	asrs r1, r1, #1
	adds r0, r4, #0
	bl Text_SetCursor
	adds r0, r4, #0
	movs r1, #0
	bl Text_SetColor
	ldr r0, [r5]
	bl DecodeMsg
	adds r1, r0, #0
	adds r0, r4, #0
	bl Text_DrawString
	adds r6, #0x20
	adds r0, r6, #0
	movs r1, #0
	bl SpriteText_DrawBackgroundExt
	mov r0, r8
	cmp r0, #0
	bne .L0808BF98
	adds r1, r7, #0
	adds r1, #0x41
	movs r0, #1
	strb r0, [r1]
	b .L0808BFD6
	.align 2, 0
.L0808BF90: .4byte 0x02000468
.L0808BF94: .4byte gUnk_0868A664
.L0808BF98:
	adds r1, r7, #0
	adds r1, #0x41
	movs r0, #0
	strb r0, [r1]
	ldr r4, .L0808BFEC @ =gUnk_0868A664
	adds r4, #8
	add r4, sb
	ldr r0, [r4]
	bl DecodeMsg
	mov r1, sp
	mov r2, sl
	bl func_fe6_08071C00
	ldr r0, [sp]
	movs r1, #0xa8
	subs r1, r1, r0
	adds r0, r6, #0
	bl Text_SetCursor
	adds r0, r6, #0
	movs r1, #0
	bl Text_SetColor
	ldr r0, [r4]
	bl DecodeMsg
	adds r1, r0, #0
	adds r0, r6, #0
	bl Text_DrawString
.L0808BFD6:
	movs r0, #0
	bl SetTextFont
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0808BFEC: .4byte gUnk_0868A664

	thumb_func_start func_fe6_0808BFF0
func_fe6_0808BFF0: @ 0x0808BFF0
	push {r4, r5, lr}
	ldr r5, .L0808C074 @ =0x02000468
	adds r0, r5, #0
	bl SetTextFont
	movs r0, #0
	bl SetTextFontGlyphs
	adds r4, r5, #0
	adds r4, #0x28
	adds r0, r4, #0
	movs r1, #0
	bl SpriteText_DrawBackgroundExt
	adds r0, r4, #0
	movs r1, #0
	bl Text_SetCursor
	adds r0, r4, #0
	movs r1, #0
	bl Text_SetColor
	ldr r1, .L0808C078 @ =gUnk_08336D3C
	adds r0, r4, #0
	bl Text_DrawString
	adds r4, #8
	adds r0, r4, #0
	movs r1, #0
	bl SpriteText_DrawBackgroundExt
	adds r0, r4, #0
	movs r1, #0
	bl Text_SetCursor
	adds r0, r4, #0
	movs r1, #0
	bl Text_SetColor
	ldr r1, .L0808C07C @ =gUnk_08336D48
	adds r0, r4, #0
	bl Text_DrawString
	adds r5, #0x38
	adds r0, r5, #0
	movs r1, #0
	bl SpriteText_DrawBackgroundExt
	adds r0, r5, #0
	movs r1, #0
	bl Text_SetCursor
	adds r0, r5, #0
	movs r1, #0
	bl Text_SetColor
	ldr r1, .L0808C080 @ =gUnk_08336D54
	adds r0, r5, #0
	bl Text_DrawString
	movs r0, #0
	bl SetTextFont
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0808C074: .4byte 0x02000468
.L0808C078: .4byte gUnk_08336D3C
.L0808C07C: .4byte gUnk_08336D48
.L0808C080: .4byte gUnk_08336D54

	thumb_func_start func_fe6_0808C084
func_fe6_0808C084: @ 0x0808C084
	ldr r1, [r0, #0x14]
	str r1, [r0, #0x2c]
	adds r1, r0, #0
	adds r1, #0x30
	movs r2, #0
	strb r2, [r1]
	adds r0, #0x31
	strb r2, [r0]
	bx lr
	.align 2, 0

	thumb_func_start func_fe6_0808C098
func_fe6_0808C098: @ 0x0808C098
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	str r0, [sp, #4]
	ldr r3, .L0808C300 @ =Sprite_0868A9E8
	movs r4, #0x80
	lsls r4, r4, #7
	str r4, [sp]
	movs r0, #0xb
	movs r1, #0x14
	movs r2, #0x4d
	bl PutSprite
	ldr r3, .L0808C304 @ =Sprite_0868A9F0
	str r4, [sp]
	movs r0, #0xb
	movs r1, #0x14
	movs r2, #0x61
	bl PutSprite
	ldr r3, .L0808C308 @ =Sprite_0868A9F8
	str r4, [sp]
	movs r0, #0xb
	movs r1, #0x14
	movs r2, #0x75
	bl PutSprite
	ldr r6, .L0808C30C @ =Sprite_0868A988
	ldr r0, [sp, #4]
	adds r0, #0x30
	ldrb r0, [r0]
	lsrs r0, r0, #3
	movs r1, #6
	bl __umodsi3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r4, #0xa0
	lsls r4, r4, #7
	adds r0, r0, r4
	str r0, [sp]
	movs r0, #0xb
	movs r1, #0x1a
	movs r2, #0x1a
	adds r3, r6, #0
	bl PutSpriteExt
	ldr r5, .L0808C310 @ =0x000010CE
	ldr r0, [sp, #4]
	adds r0, #0x31
	ldrb r0, [r0]
	lsrs r0, r0, #3
	movs r1, #6
	bl __umodsi3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r0, r0, r4
	str r0, [sp]
	movs r0, #0xb
	adds r1, r5, #0
	movs r2, #0x1a
	adds r3, r6, #0
	bl PutSpriteExt
	ldr r1, [sp, #4]
	ldr r0, [r1, #0x2c]
	ldrh r0, [r0, #0x2e]
	cmp r0, #0x30
	bhi .L0808C12C
	b .L0808C246
.L0808C12C:
	ldr r4, .L0808C314 @ =gSinLut
	movs r2, #0x80
	adds r2, r2, r4
	mov sb, r2
	movs r3, #0
	ldrsh r0, [r2, r3]
	lsls r0, r0, #4
	movs r1, #0x80
	lsls r1, r1, #1
	mov r8, r1
	bl Div
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	movs r2, #0
	ldrsh r0, [r4, r2]
	rsbs r0, r0, #0
	lsls r0, r0, #4
	ldr r3, [sp, #4]
	ldr r1, [r3, #0x2c]
	ldrh r1, [r1, #0x2e]
	bl Div
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	movs r1, #0
	ldrsh r0, [r4, r1]
	lsls r0, r0, #4
	mov r1, r8
	bl Div
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	mov r2, sb
	movs r3, #0
	ldrsh r0, [r2, r3]
	lsls r0, r0, #4
	ldr r2, [sp, #4]
	ldr r1, [r2, #0x2c]
	ldrh r1, [r1, #0x2e]
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	movs r0, #0
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl SetObjAffine
	ldr r3, [sp, #4]
	ldr r0, [r3, #0x2c]
	adds r0, #0x41
	ldrb r0, [r0]
	movs r4, #0x18
	cmp r0, #0
	bne .L0808C1F6
	movs r4, #0x10
	ldr r0, .L0808C318 @ =0x020004A8
	mov r8, r0
	movs r7, #0x40
	movs r6, #0x20
	movs r5, #4
.L0808C1B2:
	mov r1, r8
	ldrh r1, [r1]
	adds r0, r1, r7
	movs r2, #0x80
	lsls r2, r2, #5
	adds r0, r0, r2
	str r0, [sp]
	movs r0, #4
	adds r1, r6, #0
	movs r3, #0x88
	lsls r3, r3, #1
	adds r2, r4, r3
	ldr r3, .L0808C31C @ =Sprite_32x16
	bl PutSpriteExt
	adds r7, #4
	adds r6, #0x20
	subs r5, #1
	cmp r5, #0
	bge .L0808C1B2
	movs r0, #0x88
	lsls r0, r0, #1
	adds r2, r4, r0
	ldr r3, .L0808C320 @ =Sprite_16x16
	ldr r0, .L0808C324 @ =0x02000468
	adds r0, #0x40
	ldrh r0, [r0]
	ldr r1, .L0808C328 @ =0x00001054
	adds r0, r0, r1
	str r0, [sp]
	movs r0, #4
	movs r1, #0xc0
	bl PutSpriteExt
.L0808C1F6:
	movs r5, #0
	ldr r7, .L0808C318 @ =0x020004A8
	movs r6, #0x20
.L0808C1FC:
	lsls r0, r5, #2
	ldrh r2, [r7]
	adds r0, r2, r0
	movs r3, #0x80
	lsls r3, r3, #5
	adds r0, r0, r3
	str r0, [sp]
	movs r0, #4
	adds r1, r6, #0
	movs r3, #0x80
	lsls r3, r3, #1
	adds r2, r4, r3
	ldr r3, .L0808C31C @ =Sprite_32x16
	bl PutSpriteExt
	adds r6, #0x20
	adds r5, #1
	cmp r5, #4
	ble .L0808C1FC
	lsls r1, r5, #5
	adds r1, #0x20
	movs r0, #0x80
	lsls r0, r0, #1
	adds r2, r4, r0
	ldr r3, .L0808C320 @ =Sprite_16x16
	ldr r4, .L0808C324 @ =0x02000468
	adds r4, #0x40
	lsls r0, r5, #2
	ldrh r4, [r4]
	adds r0, r4, r0
	movs r4, #0x80
	lsls r4, r4, #5
	adds r0, r0, r4
	str r0, [sp]
	movs r0, #4
	bl PutSpriteExt
.L0808C246:
	movs r4, #0
	ldr r0, [sp, #4]
	adds r0, #0x30
	str r0, [sp, #8]
	ldr r1, [sp, #4]
	adds r1, #0x31
	str r1, [sp, #0xc]
	ldr r2, .L0808C318 @ =0x020004A8
	mov sl, r2
.L0808C258:
	asrs r1, r4, #1
	lsls r0, r4, #2
	lsls r7, r4, #6
	adds r3, r4, #1
	mov sb, r3
	adds r0, r0, r4
	lsls r0, r0, #2
	mov r8, r0
	movs r6, #0x80
	lsls r1, r1, #4
	adds r4, r1, #0
	adds r4, #0x28
	movs r5, #1
.L0808C272:
	mov r1, sl
	ldrh r1, [r1]
	adds r0, r1, r6
	adds r0, r0, r7
	str r0, [sp]
	movs r0, #4
	adds r1, r4, #0
	mov r2, r8
	adds r2, #0x4c
	ldr r3, .L0808C31C @ =Sprite_32x16
	bl PutSpriteExt
	adds r6, #4
	adds r4, #0x20
	subs r5, #1
	cmp r5, #0
	bge .L0808C272
	mov r4, sb
	cmp r4, #2
	ble .L0808C258
	ldr r1, [sp, #8]
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldr r2, [sp, #0xc]
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	ldr r3, [sp, #4]
	ldr r0, [r3, #0x2c]
	adds r0, #0x38
	ldrb r0, [r0]
	cmp r0, #0
	beq .L0808C2BC
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
.L0808C2BC:
	ldr r4, [sp, #4]
	ldr r0, [r4, #0x2c]
	adds r0, #0x39
	ldrb r0, [r0]
	cmp r0, #0
	beq .L0808C2CE
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
.L0808C2CE:
	ldr r0, [sp, #8]
	ldrb r1, [r0]
	lsrs r0, r1, #3
	cmp r0, #5
	bls .L0808C2E0
	adds r0, r1, #0
	subs r0, #0x30
	ldr r1, [sp, #8]
	strb r0, [r1]
.L0808C2E0:
	ldr r2, [sp, #0xc]
	ldrb r1, [r2]
	lsrs r0, r1, #3
	cmp r0, #5
	bls .L0808C2F0
	adds r0, r1, #0
	subs r0, #0x30
	strb r0, [r2]
.L0808C2F0:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0808C300: .4byte Sprite_0868A9E8
.L0808C304: .4byte Sprite_0868A9F0
.L0808C308: .4byte Sprite_0868A9F8
.L0808C30C: .4byte Sprite_0868A988
.L0808C310: .4byte 0x000010CE
.L0808C314: .4byte gSinLut
.L0808C318: .4byte 0x020004A8
.L0808C31C: .4byte Sprite_32x16
.L0808C320: .4byte Sprite_16x16
.L0808C324: .4byte 0x02000468
.L0808C328: .4byte 0x00001054

	thumb_func_start NewProc_0868AAA8
NewProc_0868AAA8: @ 0x0808C32C
	push {lr}
	adds r1, r0, #0
	ldr r0, .L0808C33C @ =ProcScr_0868AAA8
	bl SpawnProc
	pop {r1}
	bx r1
	.align 2, 0
.L0808C33C: .4byte ProcScr_0868AAA8
