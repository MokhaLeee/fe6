	.include "macro.inc"

	.syntax unified

	thumb_func_start func_fe6_0808165C
func_fe6_0808165C: @ 0x0808165C
	push {lr}
	adds r0, #0x2e
	ldrb r0, [r0]
	bl UpdateEquipInfoWindow
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_fe6_0808166C
func_fe6_0808166C: @ 0x0808166C
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	cmp r1, #1
	bne .L080816EC
	movs r0, #0
	str r0, [sp]
	movs r0, #0x11
	movs r1, #4
	movs r2, #0xc
	movs r3, #7
	bl PutUiWindowFrame
	ldr r4, .L080816D8 @ =gBg0Tm+0x166
	ldr r0, .L080816DC @ =gUnk_083272F0
	str r0, [sp]
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #0
	movs r3, #0
	bl func_fe6_08082360
	adds r0, r5, #0
	adds r0, #8
	adds r1, r4, #6
	ldr r2, .L080816E0 @ =gUnk_083272F8
	str r2, [sp]
	movs r2, #0
	movs r3, #0
	bl func_fe6_08082360
	adds r0, r5, #0
	adds r0, #0x10
	adds r1, r4, #0
	adds r1, #0xc2
	ldr r2, .L080816E4 @ =gUnk_08327304
	str r2, [sp]
	movs r2, #0
	movs r3, #0
	bl func_fe6_08082360
	adds r0, r5, #0
	adds r0, #0x18
	adds r4, #0xca
	ldr r1, .L080816E8 @ =gUnk_0832730C
	str r1, [sp]
	adds r1, r4, #0
	movs r2, #0
	movs r3, #0
	bl func_fe6_08082360
	b .L08081704
	.align 2, 0
.L080816D8: .4byte gBg0Tm+0x166
.L080816DC: .4byte gUnk_083272F0
.L080816E0: .4byte gUnk_083272F8
.L080816E4: .4byte gUnk_08327304
.L080816E8: .4byte gUnk_0832730C
.L080816EC:
	ldr r0, .L08081714 @ =gBg0Tm+0x164
	movs r1, #0xd
	movs r2, #5
	movs r3, #0
	bl TmFillRect_thm
	ldr r0, .L08081718 @ =gBg1Tm+0x122
	movs r1, #0xc
	movs r2, #6
	movs r3, #0
	bl TmFillRect_thm
.L08081704:
	movs r0, #3
	bl EnableBgSync
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08081714: .4byte gBg0Tm+0x164
.L08081718: .4byte gBg1Tm+0x122

	thumb_func_start PrepDiscard_Init
PrepDiscard_Init: @ 0x0808171C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	adds r5, r0, #0
	bl ResetTextFont
	bl ClearIcons
	ldr r3, .L0808193C @ =gDispIo
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
	strb r1, [r3, #0x14]
	movs r0, #3
	ldrb r1, [r3, #0x18]
	orrs r0, r1
	strb r0, [r3, #0x18]
	ldr r0, .L08081940 @ =gBg0Tm
	movs r1, #0
	bl TmFill
	ldr r0, .L08081944 @ =gBg1Tm
	movs r1, #0
	bl TmFill
	ldr r0, .L08081948 @ =gBg2Tm
	movs r1, #0
	bl TmFill
	bl ApplySystemObjectsGraphics
	bl InitIcons
	movs r0, #4
	bl ApplyIconPalettes
	ldr r0, .L0808194C @ =0x02015688
	movs r1, #6
	bl InitText
	movs r4, #0
	ldr r6, .L08081950 @ =0x020155E8
.L0808178C:
	lsls r0, r4, #3
	adds r0, r0, r6
	movs r1, #7
	bl InitTextDb
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #7
	bls .L0808178C
	movs r4, #0
	adds r7, r5, #0
	adds r7, #0x2f
	adds r2, r5, #0
	adds r2, #0x2e
	str r2, [sp, #0x18]
	movs r3, #0x30
	adds r3, r3, r5
	mov sl, r3
	movs r0, #0x31
	adds r0, r0, r5
	mov r8, r0
	movs r1, #0x45
	adds r1, r1, r5
	mov sb, r1
	adds r2, #0x22
	str r2, [sp, #4]
	adds r3, r5, #0
	adds r3, #0x2c
	str r3, [sp, #0x10]
	adds r0, r5, #0
	adds r0, #0x52
	str r0, [sp, #8]
	adds r1, r5, #0
	adds r1, #0x29
	str r1, [sp, #0xc]
	subs r2, #0x23
	str r2, [sp, #0x14]
	ldr r6, .L08081954 @ =0x02015638
.L080817DA:
	lsls r0, r4, #3
	adds r0, r0, r6
	movs r1, #7
	bl InitText
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #3
	bls .L080817DA
	ldr r0, [r5, #0x14]
	ldr r1, [r0, #0x48]
	str r1, [r5, #0x54]
	ldr r0, [r0, #0x4c]
	str r0, [r5, #0x58]
	adds r0, r5, #0
	movs r2, #0x10
	movs r3, #0xb
	bl StartEquipInfoWindow
	movs r4, #0
	strb r4, [r7]
	ldr r3, [sp, #0x18]
	strb r4, [r3]
	mov r0, sl
	strb r4, [r0]
	mov r1, r8
	strb r4, [r1]
	mov r2, sb
	strb r4, [r2]
	movs r0, #0
	ldr r3, [sp, #4]
	strh r4, [r3]
	ldr r1, [sp, #0x10]
	strb r0, [r1]
	ldr r2, [sp, #8]
	strh r4, [r2]
	ldr r3, [sp, #0xc]
	strb r0, [r3]
	ldr r1, [sp, #0x14]
	strb r0, [r1]
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
	bl UnpackUiWindowFrameGraphics
	str r4, [sp]
	movs r0, #0x10
	movs r1, #0xb
	movs r2, #0xe
	movs r3, #8
	bl PutUiWindowFrame
	adds r0, r5, #0
	bl func_fe6_0808165C
	str r4, [sp]
	movs r0, #1
	movs r1, #8
	movs r2, #0xe
	movs r3, #0xc
	bl PutUiWindowFrame
	ldr r0, [r5, #0x54]
	bl GetUnitFid
	adds r1, r0, #0
	movs r3, #4
	rsbs r3, r3, #0
	movs r0, #3
	str r0, [sp]
	movs r0, #0
	movs r2, #0x40
	bl StartFace
	ldr r1, [r5, #0x54]
	movs r0, #0
	bl func_fe6_0807D6C0
	ldrb r2, [r7]
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #1
	adds r0, #2
	ldr r3, [sp, #0x18]
	ldrb r3, [r3]
	lsls r1, r3, #1
	adds r1, #9
	movs r2, #0xc
	bl PutUiEntryHover
	ldr r0, [r5, #0x54]
	ldr r0, [r0]
	ldrh r0, [r0]
	bl DecodeMsg
	bl GetStringTextLen
	movs r4, #0x30
	subs r4, r4, r0
	lsrs r0, r4, #0x1f
	adds r4, r4, r0
	asrs r4, r4, #1
	ldr r0, [r5, #0x54]
	ldr r0, [r0]
	ldrh r0, [r0]
	bl DecodeMsg
	ldr r2, .L0808194C @ =0x02015688
	ldr r1, .L08081940 @ =gBg0Tm
	str r0, [sp]
	adds r0, r2, #0
	movs r2, #0
	adds r3, r4, #0
	bl func_fe6_08082360
	ldr r0, .L08081958 @ =gUnk_083198CC
	ldr r1, .L0808195C @ =0x06017200
	bl Decompress
	ldr r0, .L08081960 @ =Pal_SpinningArrow
	movs r1, #0x90
	lsls r1, r1, #2
	movs r2, #0x60
	bl ApplyPaletteExt
	ldr r0, .L08081964 @ =gUnk_0831AB1C
	ldr r1, .L08081968 @ =0x06011000
	bl Decompress
	ldr r0, .L0808196C @ =Pal_Sio_0831AABC
	movs r1, #0xc0
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	movs r0, #7
	bl EnableBgSync
	adds r0, r5, #0
	bl NewPrepDiscardHand
	movs r4, #1
	rsbs r4, r4, #0
	movs r0, #0
	adds r1, r4, #0
	bl LoadHelpBoxGfx
	adds r0, r5, #0
	adds r1, r4, #0
	bl NewSallyCir2
	adds r0, r5, #0
	movs r1, #0
	bl Proc_Goto
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0808193C: .4byte gDispIo
.L08081940: .4byte gBg0Tm
.L08081944: .4byte gBg1Tm
.L08081948: .4byte gBg2Tm
.L0808194C: .4byte 0x02015688
.L08081950: .4byte 0x020155E8
.L08081954: .4byte 0x02015638
.L08081958: .4byte gUnk_083198CC
.L0808195C: .4byte 0x06017200
.L08081960: .4byte Pal_SpinningArrow
.L08081964: .4byte gUnk_0831AB1C
.L08081968: .4byte 0x06011000
.L0808196C: .4byte Pal_Sio_0831AABC

	thumb_func_start PrepDiscard_Loop
PrepDiscard_Loop: @ 0x08081970
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r7, r0, #0
	adds r0, #0x2e
	ldrb r0, [r0]
	str r0, [sp]
	adds r4, r7, #0
	adds r4, #0x29
	ldrb r0, [r4]
	cmp r0, #0
	beq .L080819AC
	ldr r0, .L080819A8 @ =gKeySt
	ldr r1, [r0]
	movs r0, #0x81
	lsls r0, r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq .L080819AC
	bl CloseHelpBox
	movs r0, #0
	strb r0, [r4]
	b .L08081DDC
	.align 2, 0
.L080819A8: .4byte gKeySt
.L080819AC:
	adds r0, r7, #0
	adds r0, #0x2c
	ldrb r4, [r0]
	adds r6, r0, #0
	cmp r4, #0
	beq .L080819C0
	cmp r4, #1
	bne .L080819BE
	b .L08081C20
.L080819BE:
	b .L08081C84
.L080819C0:
	ldr r2, .L08081A00 @ =gKeySt
	ldr r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	movs r1, #0x29
	adds r1, r1, r7
	mov sb, r1
	mov sl, r2
	cmp r0, #0
	beq .L08081A04
	ldrb r0, [r1]
	cmp r0, #0
	bne .L08081A04
	movs r0, #1
	strb r0, [r1]
	adds r0, r7, #0
	adds r0, #0x2e
	ldrb r2, [r0]
	lsls r1, r2, #4
	adds r1, #0x48
	ldr r0, [r7, #0x54]
	lsls r2, r2, #1
	adds r0, #0x1c
	adds r0, r0, r2
	ldrh r2, [r0]
	movs r0, #0x10
	bl StartItemHelpBox
	b .L08081DB2
	.align 2, 0
.L08081A00: .4byte gKeySt
.L08081A04:
	mov r2, sl
	ldr r1, [r2]
	movs r0, #0x40
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq .L08081A8C
	ldr r0, [r7, #0x54]
	bl GetUnitItemCount
	cmp r0, #1
	ble .L08081A8C
	adds r5, r7, #0
	adds r5, #0x2f
	ldrb r3, [r5]
	lsls r0, r3, #3
	subs r0, r0, r3
	lsls r0, r0, #1
	adds r0, #2
	adds r4, r7, #0
	adds r4, #0x2e
	ldrb r2, [r4]
	lsls r1, r2, #1
	adds r1, #9
	movs r2, #0xc
	bl RemoveUiEntryHover
	ldrb r0, [r4]
	mov r8, r4
	cmp r0, #0
	beq .L08081A60
	ldr r0, .L08081A5C @ =gPlaySt
	ldrb r0, [r0, #0x1d]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L08081A52
	movs r0, #0x66
	bl m4aSongNumStart
.L08081A52:
	mov r3, r8
	ldrb r0, [r3]
	subs r0, #1
	b .L08081AFE
	.align 2, 0
.L08081A5C: .4byte gPlaySt
.L08081A60:
	mov r0, sl
	ldr r1, [r0]
	movs r0, #0x40
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq .L08081B3A
	ldr r0, .L08081A88 @ =gPlaySt
	ldrb r0, [r0, #0x1d]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L08081A7E
	movs r0, #0x66
	bl m4aSongNumStart
.L08081A7E:
	ldr r0, [r7, #0x54]
	bl GetUnitItemCount
	subs r0, #1
	b .L08081B30
	.align 2, 0
.L08081A88: .4byte gPlaySt
.L08081A8C:
	ldr r0, .L08081B08 @ =gKeySt
	ldr r1, [r0]
	movs r0, #0x80
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq .L08081B5C
	ldr r0, [r7, #0x54]
	bl GetUnitItemCount
	cmp r0, #1
	ble .L08081B5C
	adds r6, r7, #0
	adds r6, #0x2f
	ldrb r0, [r6]
	lsls r1, r0, #2
	adds r0, r7, #0
	adds r0, #0x54
	adds r0, r0, r1
	ldr r0, [r0]
	bl GetUnitItemCount
	adds r4, r0, #0
	subs r4, #1
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldrb r1, [r6]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #1
	adds r0, #2
	adds r5, r7, #0
	adds r5, #0x2e
	ldrb r2, [r5]
	lsls r1, r2, #1
	adds r1, #9
	movs r2, #0xc
	bl RemoveUiEntryHover
	ldrb r0, [r5]
	mov r8, r5
	adds r5, r6, #0
	cmp r0, r4
	bhs .L08081B10
	cmp r0, #3
	bhi .L08081B10
	ldr r0, .L08081B0C @ =gPlaySt
	ldrb r0, [r0, #0x1d]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L08081AF8
	movs r0, #0x66
	bl m4aSongNumStart
.L08081AF8:
	mov r3, r8
	ldrb r0, [r3]
	adds r0, #1
.L08081AFE:
	strb r0, [r3]
	adds r0, r7, #0
	bl func_fe6_0808165C
	b .L08081B3A
	.align 2, 0
.L08081B08: .4byte gKeySt
.L08081B0C: .4byte gPlaySt
.L08081B10:
	ldr r0, .L08081B54 @ =gKeySt
	ldr r1, [r0]
	movs r0, #0x80
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq .L08081B3A
	ldr r0, .L08081B58 @ =gPlaySt
	ldrb r0, [r0, #0x1d]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L08081B2E
	movs r0, #0x66
	bl m4aSongNumStart
.L08081B2E:
	movs r0, #0
.L08081B30:
	mov r1, r8
	strb r0, [r1]
	adds r0, r7, #0
	bl func_fe6_0808165C
.L08081B3A:
	ldrb r2, [r5]
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #1
	adds r0, #2
	mov r3, r8
	ldrb r3, [r3]
	lsls r1, r3, #1
	adds r1, #9
	movs r2, #0xc
	bl PutUiEntryHover
	b .L08081DB2
	.align 2, 0
.L08081B54: .4byte gKeySt
.L08081B58: .4byte gPlaySt
.L08081B5C:
	ldr r0, .L08081BA4 @ =gKeySt
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r5, #1
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq .L08081BF0
	mov r1, sb
	ldrb r0, [r1]
	cmp r0, #0
	beq .L08081B76
	b .L08081DBA
.L08081B76:
	ldr r0, [r7, #0x54]
	adds r4, r7, #0
	adds r4, #0x2e
	ldrb r2, [r4]
	lsls r1, r2, #1
	adds r0, #0x1c
	adds r0, r0, r1
	ldrh r0, [r0]
	bl GetItemAttributes
	movs r1, #0x10
	ands r1, r0
	cmp r1, #0
	beq .L08081BAC
	ldrb r4, [r4]
	lsls r1, r4, #4
	adds r1, #0x48
	ldr r2, .L08081BA8 @ =0x00000C33
	movs r0, #0x10
	adds r3, r7, #0
	bl StartPrepErrorHelpbox
	b .L08081DB2
	.align 2, 0
.L08081BA4: .4byte gKeySt
.L08081BA8: .4byte 0x00000C33
.L08081BAC:
	ldr r0, .L08081BE8 @ =gPlaySt
	ldrb r0, [r0, #0x1d]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L08081BBC
	movs r0, #0x6a
	bl m4aSongNumStart
.L08081BBC:
	ldr r0, .L08081BEC @ =0x02015638
	movs r1, #1
	bl func_fe6_0808166C
	adds r1, r7, #0
	adds r1, #0x2f
	ldrb r3, [r1]
	lsls r0, r3, #3
	subs r0, r0, r3
	lsls r0, r0, #1
	adds r0, #2
	ldrb r4, [r4]
	lsls r1, r4, #1
	adds r1, #9
	movs r2, #0xc
	bl RemoveUiEntryHover
	adds r0, r7, #0
	adds r0, #0x30
	strb r5, [r0]
	strb r5, [r6]
	b .L08081DB2
	.align 2, 0
.L08081BE8: .4byte gPlaySt
.L08081BEC: .4byte 0x02015638
.L08081BF0:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne .L08081BFA
	b .L08081DB2
.L08081BFA:
	ldr r0, .L08081C1C @ =gPlaySt
	ldrb r0, [r0, #0x1d]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L08081C0A
	movs r0, #0x6b
	bl m4aSongNumStart
.L08081C0A:
	adds r0, r7, #0
	movs r1, #1
	bl NewSallyCir2
	adds r0, r7, #0
	movs r1, #1
	bl Proc_Goto
	b .L08081DB2
	.align 2, 0
.L08081C1C: .4byte gPlaySt
.L08081C20:
	ldr r2, .L08081C50 @ =gKeySt
	ldr r1, [r2]
	movs r0, #0x10
	ldrh r1, [r1, #6]
	ands r0, r1
	mov sl, r2
	cmp r0, #0
	beq .L08081C58
	adds r5, r7, #0
	adds r5, #0x30
	ldrb r0, [r5]
	cmp r0, #0
	bne .L08081C58
	ldr r0, .L08081C54 @ =gPlaySt
	ldrb r0, [r0, #0x1d]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L08081C4A
	movs r0, #0x66
	bl m4aSongNumStart
.L08081C4A:
	strb r4, [r5]
	b .L08081C84
	.align 2, 0
.L08081C50: .4byte gKeySt
.L08081C54: .4byte gPlaySt
.L08081C58:
	mov r2, sl
	ldr r1, [r2]
	movs r0, #0x20
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq .L08081C90
	adds r4, r7, #0
	adds r4, #0x30
	ldrb r3, [r4]
	cmp r3, #1
	bne .L08081C90
	ldr r0, .L08081C8C @ =gPlaySt
	ldrb r0, [r0, #0x1d]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L08081C80
	movs r0, #0x66
	bl m4aSongNumStart
.L08081C80:
	movs r0, #0
	strb r0, [r4]
.L08081C84:
	movs r0, #0x29
	adds r0, r0, r7
	mov sb, r0
	b .L08081DB2
	.align 2, 0
.L08081C8C: .4byte gPlaySt
.L08081C90:
	mov r2, sl
	ldr r1, [r2]
	movs r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq .L08081D60
	ldr r0, .L08081CF8 @ =gPlaySt
	ldrb r0, [r0, #0x1d]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L08081CAE
	movs r0, #0x6a
	bl m4aSongNumStart
.L08081CAE:
	adds r0, r7, #0
	adds r0, #0x30
	ldrb r0, [r0]
	mov r8, r0
	cmp r0, #0
	bne .L08081D54
	ldr r0, [r7, #0x54]
	adds r5, r7, #0
	adds r5, #0x2e
	ldrb r1, [r5]
	bl UnitRemoveItem
	ldr r0, [r7, #0x54]
	bl UnitRemoveInvalidItems
	ldr r1, [r7, #0x54]
	movs r0, #0
	bl func_fe6_0807D6C0
	ldr r0, [r7, #0x54]
	bl GetUnitItemCount
	cmp r0, #0
	bne .L08081CFC
	adds r0, r7, #0
	movs r1, #1
	bl NewSallyCir2
	adds r0, r7, #0
	movs r1, #1
	bl Proc_Goto
	movs r3, #0x29
	adds r3, r3, r7
	mov sb, r3
	b .L08081DB2
	.align 2, 0
.L08081CF8: .4byte gPlaySt
.L08081CFC:
	ldrb r4, [r5]
	ldr r0, [r7, #0x54]
	bl GetUnitItemCount
	cmp r4, r0
	blt .L08081D3E
	adds r4, r7, #0
	adds r4, #0x2f
	ldrb r1, [r4]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #1
	adds r0, #2
	ldrb r2, [r5]
	lsls r1, r2, #1
	adds r1, #9
	movs r2, #0xc
	bl RemoveUiEntryHover
	ldrb r0, [r5]
	subs r0, #1
	strb r0, [r5]
	ldrb r3, [r4]
	lsls r0, r3, #3
	subs r0, r0, r3
	lsls r0, r0, #1
	adds r0, #2
	ldrb r5, [r5]
	lsls r1, r5, #1
	adds r1, #9
	movs r2, #0xc
	bl PutUiEntryHover
.L08081D3E:
	adds r0, r7, #0
	bl func_fe6_0808165C
	ldr r0, .L08081D50 @ =0x02015638
	movs r1, #0
	bl func_fe6_0808166C
	mov r0, r8
	b .L08081D5E
	.align 2, 0
.L08081D50: .4byte 0x02015638
.L08081D54:
	ldr r0, .L08081DEC @ =0x02015638
	movs r1, #0
	bl func_fe6_0808166C
	movs r0, #0
.L08081D5E:
	strb r0, [r6]
.L08081D60:
	ldr r0, .L08081DF0 @ =gKeySt
	ldr r1, [r0]
	movs r0, #2
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq .L08081D8A
	ldr r0, .L08081DF4 @ =gPlaySt
	ldrb r0, [r0, #0x1d]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L08081D7E
	movs r0, #0x6b
	bl m4aSongNumStart
.L08081D7E:
	ldr r0, .L08081DEC @ =0x02015638
	movs r1, #0
	bl func_fe6_0808166C
	movs r0, #0
	strb r0, [r6]
.L08081D8A:
	ldrb r0, [r6]
	movs r1, #0x29
	adds r1, r1, r7
	mov sb, r1
	cmp r0, #0
	bne .L08081DB2
	adds r1, r7, #0
	adds r1, #0x2f
	ldrb r2, [r1]
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #1
	adds r0, #2
	subs r1, #1
	ldrb r1, [r1]
	lsls r1, r1, #1
	adds r1, #9
	movs r2, #0xc
	bl PutUiEntryHover
.L08081DB2:
	mov r3, sb
	ldrb r0, [r3]
	cmp r0, #0
	beq .L08081DDC
.L08081DBA:
	adds r0, r7, #0
	adds r0, #0x2e
	ldr r1, [sp]
	ldrb r2, [r0]
	cmp r1, r2
	beq .L08081DDC
	ldrb r2, [r0]
	lsls r1, r2, #4
	adds r1, #0x48
	ldr r0, [r7, #0x54]
	lsls r2, r2, #1
	adds r0, #0x1c
	adds r0, r0, r2
	ldrh r2, [r0]
	movs r0, #0x10
	bl StartItemHelpBox
.L08081DDC:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08081DEC: .4byte 0x02015638
.L08081DF0: .4byte gKeySt
.L08081DF4: .4byte gPlaySt
