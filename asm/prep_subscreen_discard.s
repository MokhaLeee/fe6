	.include "macro.inc"

	.syntax unified

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
	bl PrepDiscardUpdateInfoWindow
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
	bl PrepDiscardUpdateInfoWindow
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
	ldr r0, .L08081BEC @ =gPrepTexts1 + 0x50
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
.L08081BEC: .4byte gPrepTexts1 + 0x50
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
	bl PrepDiscardUpdateInfoWindow
	ldr r0, .L08081D50 @ =gPrepTexts1 + 0x50
	movs r1, #0
	bl func_fe6_0808166C
	mov r0, r8
	b .L08081D5E
	.align 2, 0
.L08081D50: .4byte gPrepTexts1 + 0x50
.L08081D54:
	ldr r0, .L08081DEC @ =gPrepTexts1 + 0x50
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
	ldr r0, .L08081DEC @ =gPrepTexts1 + 0x50
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
.L08081DEC: .4byte gPrepTexts1 + 0x50
.L08081DF0: .4byte gKeySt
.L08081DF4: .4byte gPlaySt
