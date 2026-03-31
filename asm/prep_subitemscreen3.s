	.include "macro.inc"

	.syntax unified

	thumb_func_start PrepSubItem_SelLoop1
PrepSubItem_SelLoop1: @ 0x0807FF98
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	adds r0, #0x31
	ldrb r0, [r0]
	mov r8, r0
	adds r4, r5, #0
	adds r4, #0x29
	ldrb r0, [r4]
	ldr r7, .L0807FFCC @ =gKeySt
	cmp r0, #0
	beq .L0807FFD0
	ldr r1, [r7]
	movs r0, #0x81
	lsls r0, r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq .L0807FFD0
	bl CloseHelpBox
	movs r0, #0
	strb r0, [r4]
	b .L08080274
	.align 2, 0
.L0807FFCC: .4byte gKeySt
.L0807FFD0:
	ldr r2, [r7]
	ldrh r1, [r2, #6]
	movs r6, #0x80
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	beq .L0808004C
	adds r4, r5, #0
	adds r4, #0x31
	ldrb r0, [r4]
	lsls r1, r0, #1
	adds r1, #9
	movs r0, #0x13
	movs r2, #7
	bl RemoveUiEntryHover
	ldrb r1, [r4]
	adds r0, r5, #0
	adds r0, #0x49
	ldrb r0, [r0]
	subs r0, #1
	cmp r1, r0
	bge .L08080018
	adds r0, r1, #1
	strb r0, [r4]
	ldr r0, .L08080014 @ =gPlaySt
	ldrb r0, [r0, #0x1d]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L08080038
	movs r0, #0x66
	bl m4aSongNumStart
	b .L08080038
	.align 2, 0
.L08080014: .4byte gPlaySt
.L08080018:
	ldr r1, [r7]
	adds r0, r6, #0
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq .L08080038
	movs r0, #0
	strb r0, [r4]
	ldr r0, .L08080048 @ =gPlaySt
	ldrb r0, [r0, #0x1d]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L08080038
	movs r0, #0x66
	bl m4aSongNumStart
.L08080038:
	ldrb r4, [r4]
	lsls r1, r4, #1
	adds r1, #9
	movs r0, #0x13
	movs r2, #7
	bl PutUiEntryHover
	b .L080800F8
	.align 2, 0
.L08080048: .4byte gPlaySt
.L0808004C:
	movs r6, #0x40
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	beq .L080800C4
	adds r4, r5, #0
	adds r4, #0x31
	ldrb r0, [r4]
	lsls r1, r0, #1
	adds r1, #9
	movs r0, #0x13
	movs r2, #7
	bl RemoveUiEntryHover
	ldrb r0, [r4]
	cmp r0, #0
	beq .L08080088
	subs r0, #1
	strb r0, [r4]
	ldr r0, .L08080084 @ =gPlaySt
	ldrb r0, [r0, #0x1d]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L080800AE
	movs r0, #0x66
	bl m4aSongNumStart
	b .L080800AE
	.align 2, 0
.L08080084: .4byte gPlaySt
.L08080088:
	ldr r1, [r7]
	adds r0, r6, #0
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq .L080800AE
	ldr r0, .L080800C0 @ =gPlaySt
	ldrb r0, [r0, #0x1d]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L080800A4
	movs r0, #0x66
	bl m4aSongNumStart
.L080800A4:
	adds r0, r5, #0
	adds r0, #0x49
	ldrb r0, [r0]
	subs r0, #1
	strb r0, [r4]
.L080800AE:
	ldrb r4, [r4]
	lsls r1, r4, #1
	adds r1, #9
	movs r0, #0x13
	movs r2, #7
	bl PutUiEntryHover
	b .L080800F8
	.align 2, 0
.L080800C0: .4byte gPlaySt
.L080800C4:
	ldrh r1, [r2, #8]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq .L08080104
	ldr r0, .L08080100 @ =gPlaySt
	ldrb r0, [r0, #0x1d]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L080800DE
	movs r0, #0x6b
	bl m4aSongNumStart
.L080800DE:
	adds r0, r5, #0
	adds r0, #0x2d
	ldrb r0, [r0]
	cmp r0, #3
	bhi .L080800F0
	adds r0, r5, #0
	movs r1, #1
	bl NewSallyCir2
.L080800F0:
	adds r0, r5, #0
	movs r1, #6
	bl Proc_Goto
.L080800F8:
	adds r6, r5, #0
	adds r6, #0x29
	b .L08080250
	.align 2, 0
.L08080100: .4byte gPlaySt
.L08080104:
	movs r0, #1
	ands r0, r1
	adds r6, r5, #0
	adds r6, #0x29
	cmp r0, #0
	bne .L08080112
	b .L08080220
.L08080112:
	ldrb r0, [r6]
	cmp r0, #0
	beq .L0808011A
	b .L08080220
.L0808011A:
	adds r0, r5, #0
	adds r0, #0x31
	ldrb r4, [r0]
	cmp r4, #0
	bne .L08080150
	ldr r0, [r5, #0x54]
	bl GetUnitItemCount
	cmp r0, #0
	beq .L08080184
	ldr r0, .L0808014C @ =gPlaySt
	ldrb r0, [r0, #0x1d]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L0808013E
	movs r0, #0x6a
	bl m4aSongNumStart
.L0808013E:
	adds r0, r5, #0
	adds r0, #0x2e
	strb r4, [r0]
	adds r0, #1
	strb r4, [r0]
	b .L080801FC
	.align 2, 0
.L0808014C: .4byte gPlaySt
.L08080150:
	cmp r4, #1
	bne .L08080178
	ldr r0, .L08080170 @ =gPrepAllItemsCount
	ldrh r0, [r0]
	cmp r0, #0
	beq .L08080184
	ldr r0, .L08080174 @ =gPlaySt
	ldrb r0, [r0, #0x1d]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L080801FC
	movs r0, #0x6a
	bl m4aSongNumStart
	b .L080801FC
	.align 2, 0
.L08080170: .4byte gPrepAllItemsCount
.L08080174: .4byte gPlaySt
.L08080178:
	cmp r4, #2
	bne .L080801FC
	ldr r0, .L08080198 @ =gPrepAllItemsCount
	ldrh r0, [r0]
	cmp r0, #0
	bne .L080801A0
.L08080184:
	ldr r0, .L0808019C @ =gPlaySt
	ldrb r0, [r0, #0x1d]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L08080274
	movs r0, #0x6c
	bl m4aSongNumStart
	b .L08080274
	.align 2, 0
.L08080198: .4byte gPrepAllItemsCount
.L0808019C: .4byte gPlaySt
.L080801A0:
	ldr r0, .L0808020C @ =gPlaySt
	ldrb r0, [r0, #0x1d]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L080801B0
	movs r0, #0x6a
	bl m4aSongNumStart
.L080801B0:
	movs r0, #0
	bl EndFaceById
	ldr r0, .L08080210 @ =gBg0Tm
	movs r1, #0xf
	movs r2, #0x13
	movs r3, #0
	bl TmFillRect_thm
	ldr r0, .L08080214 @ =gBg1Tm
	movs r1, #0xf
	movs r2, #0x13
	movs r3, #0
	bl TmFillRect_thm
	ldr r0, .L08080218 @ =gBg2Tm
	movs r1, #0xf
	movs r2, #0x1f
	movs r3, #0
	bl TmFillRect_thm
	ldr r1, .L0808021C @ =gPrepItemListData
	adds r0, r5, #0
	adds r0, #0x50
	ldrh r0, [r0]
	lsrs r0, r0, #4
	adds r2, r5, #0
	adds r2, #0x2e
	ldrb r2, [r2]
	adds r0, r2, r0
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrh r2, [r0, #2]
	ldr r3, [r5, #0x5c]
	movs r0, #1
	movs r1, #0xb
	bl func_fe6_0807D4A8
.L080801FC:
	adds r0, r5, #0
	bl func_fe6_0807FBE8
	adds r0, r5, #0
	bl Proc_Break
	b .L08080250
	.align 2, 0
.L0808020C: .4byte gPlaySt
.L08080210: .4byte gBg0Tm
.L08080214: .4byte gBg1Tm
.L08080218: .4byte gBg2Tm
.L0808021C: .4byte gPrepItemListData
.L08080220:
	ldr r1, [r7]
	movs r0, #0x80
	lsls r0, r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq .L08080250
	ldrb r0, [r6]
	cmp r0, #0
	bne .L08080250
	movs r0, #2
	strb r0, [r6]
	adds r0, r5, #0
	adds r0, #0x31
	ldrb r0, [r0]
	lsls r1, r0, #4
	adds r1, #0x48
	ldr r2, .L08080280 @ =HelpboxMsg_0867929C
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r2, [r0]
	movs r0, #0xa0
	bl StartHelpBox
.L08080250:
	ldrb r6, [r6]
	cmp r6, #2
	bne .L08080274
	adds r0, r5, #0
	adds r0, #0x31
	ldrb r1, [r0]
	cmp r1, r8
	beq .L08080274
	ldrb r0, [r0]
	lsls r1, r0, #4
	adds r1, #0x48
	ldr r2, .L08080280 @ =HelpboxMsg_0867929C
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r2, [r0]
	movs r0, #0xa0
	bl StartHelpBox
.L08080274:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08080280: .4byte HelpboxMsg_0867929C

	thumb_func_start PrepSubItem_SelLoop2
PrepSubItem_SelLoop2: @ 0x08080284
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	adds r6, r0, #0
	adds r1, r6, #0
	adds r1, #0x2e
	adds r0, #0x50
	ldrh r0, [r0]
	lsrs r0, r0, #4
	ldrb r1, [r1]
	adds r0, r1, r0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #4]
	adds r0, r6, #0
	adds r0, #0x46
	ldrb r0, [r0]
	str r0, [sp, #8]
	adds r4, r6, #0
	adds r4, #0x29
	ldrb r2, [r4]
	cmp r2, #0
	beq .L080802E0
	ldr r0, .L080802D8 @ =gKeySt
	ldr r1, [r0]
	movs r0, #0x81
	lsls r0, r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq .L080802E0
	cmp r2, #1
	beq .L080802DC
	bl CloseHelpBox
	movs r0, #0
	strb r0, [r4]
	bl .L080813D2
	.align 2, 0
.L080802D8: .4byte gKeySt
.L080802DC:
	movs r0, #0
	strb r0, [r4]
.L080802E0:
	adds r4, r6, #0
	adds r4, #0x2c
	ldrb r0, [r4]
	str r4, [sp, #0xc]
	cmp r0, #7
	bne .L080802F0
	bl .L080811E4
.L080802F0:
	cmp r0, #7
	bgt .L0808034C
	cmp r0, #2
	bne .L080802FC
	bl .L080810D0
.L080802FC:
	cmp r0, #2
	bgt .L08080322
	cmp r0, #0
	bne .L08080306
	b .L080806B0
.L08080306:
	cmp r0, #1
	bne .L0808030E
	bl .L08081078
.L0808030E:
	adds r7, r6, #0
	adds r7, #0x2e
	movs r0, #0x50
	adds r0, r0, r6
	mov r8, r0
	movs r1, #0x45
	adds r1, r1, r6
	mov sb, r1
	bl .L080812C6
.L08080322:
	cmp r0, #5
	bne .L0808032A
	bl .L08081128
.L0808032A:
	cmp r0, #6
	bne .L08080332
	bl .L08081152
.L08080332:
	adds r7, r6, #0
	adds r7, #0x2e
	movs r3, #0x50
	adds r3, r3, r6
	mov r8, r3
	movs r4, #0x45
	adds r4, r4, r6
	mov sb, r4
	movs r5, #0x52
	adds r5, r5, r6
	mov sl, r5
	bl .L080812FA
.L0808034C:
	cmp r0, #0xc
	bne .L08080354
	bl .L080812D4
.L08080354:
	cmp r0, #0xc
	bgt .L0808037C
	cmp r0, #0xa
	bne .L08080360
	bl .L080811EE
.L08080360:
	cmp r0, #0xb
	bne .L08080368
	bl .L08081216
.L08080368:
	adds r7, r6, #0
	adds r7, #0x2e
	movs r0, #0x50
	adds r0, r0, r6
	mov r8, r0
	movs r1, #0x45
	adds r1, r1, r6
	mov sb, r1
	bl .L080812C6
.L0808037C:
	cmp r0, #0x14
	bne .L08080382
	b .L080804B8
.L08080382:
	adds r7, r6, #0
	adds r7, #0x2e
	movs r3, #0x50
	adds r3, r3, r6
	mov r8, r3
	movs r4, #0x45
	adds r4, r4, r6
	mov sb, r4
	movs r5, #0x52
	adds r5, r5, r6
	mov sl, r5
	cmp r0, #0xff
	beq .L080803A0
	bl .L080812FA
.L080803A0:
	adds r0, r6, #0
	adds r0, #0x31
	ldrb r1, [r0]
	str r0, [sp, #0x10]
	cmp r1, #0
	bne .L080803CA
	subs r0, #2
	ldrb r2, [r0]
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #1
	adds r0, #2
	ldrb r3, [r7]
	lsls r1, r3, #1
	lsls r2, r2, #2
	subs r2, #9
	subs r1, r1, r2
	movs r2, #0xc
	bl RemoveUiEntryHover
	b .L080803EA
.L080803CA:
	adds r2, r6, #0
	adds r2, #0x46
	adds r0, r6, #0
	adds r0, #0x3b
	ldrb r4, [r2]
	adds r0, r4, r0
	ldrb r1, [r7]
	strb r1, [r0]
	adds r0, r6, #0
	adds r0, #0x32
	ldrb r2, [r2]
	adds r0, r2, r0
	mov r5, r8
	ldrh r5, [r5]
	lsrs r1, r5, #4
	strb r1, [r0]
.L080803EA:
	ldr r0, [sp, #0x10]
	ldrb r0, [r0]
	cmp r0, #2
	bne .L0808047E
	ldr r0, [r6, #0x54]
	bl GetUnitFid
	adds r1, r0, #0
	movs r3, #4
	rsbs r3, r3, #0
	movs r0, #3
	str r0, [sp]
	movs r0, #0
	movs r2, #0x40
	bl StartFace
	ldr r5, .L080804A8 @ =gBg0Tm
	adds r0, r5, #0
	movs r1, #0xf
	movs r2, #0x13
	movs r3, #0
	bl TmFillRect_thm
	ldr r0, .L080804AC @ =gBg1Tm
	movs r1, #0xf
	movs r2, #0x13
	movs r3, #0
	bl TmFillRect_thm
	ldr r0, .L080804B0 @ =gBg2Tm
	movs r1, #0xf
	movs r2, #0x1f
	movs r3, #0
	bl TmFillRect_thm
	movs r0, #0
	str r0, [sp]
	movs r0, #1
	movs r1, #8
	movs r2, #0xe
	movs r3, #0xc
	bl PutUiWindowFrame
	bl func_fe6_0807D338
	ldr r0, [r6, #0x54]
	ldr r0, [r0]
	ldrh r0, [r0]
	bl DecodeMsg
	bl GetStringTextLen
	movs r4, #0x30
	subs r4, r4, r0
	lsrs r0, r4, #0x1f
	adds r4, r4, r0
	asrs r4, r4, #1
	ldr r0, [r6, #0x54]
	ldr r0, [r0]
	ldrh r0, [r0]
	bl DecodeMsg
	ldr r1, .L080804B4 @ =gPrepTexts3
	str r0, [sp]
	adds r0, r1, #0
	adds r1, r5, #0
	movs r2, #0
	adds r3, r4, #0
	bl PrepPutText
	ldr r1, [r6, #0x54]
	movs r0, #0
	bl func_fe6_0807D6C0
.L0808047E:
	adds r0, r6, #0
	adds r0, #0x2d
	ldrb r0, [r0]
	cmp r0, #3
	bhi .L08080494
	ldr r0, [r6, #0x14]
	adds r1, r6, #0
	adds r1, #0x46
	ldrb r1, [r1]
	adds r0, #0x3a
	strb r1, [r0]
.L08080494:
	adds r0, r6, #0
	movs r1, #4
	bl Proc_Goto
	movs r1, #0x45
	adds r1, r1, r6
	mov sb, r1
	bl .L080812C6
	.align 2, 0
.L080804A8: .4byte gBg0Tm
.L080804AC: .4byte gBg1Tm
.L080804B0: .4byte gBg2Tm
.L080804B4: .4byte gPrepTexts3
.L080804B8:
	ldr r0, .L080805D4 @ =gKeySt
	ldr r1, [r0]
	movs r0, #0x20
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq .L080804E4
	adds r1, r6, #0
	adds r1, #0x30
	ldrb r0, [r1]
	cmp r0, #0
	beq .L080804E4
	movs r0, #0
	strb r0, [r1]
	ldr r0, .L080805D8 @ =gPlaySt
	ldrb r0, [r0, #0x1d]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L080804E4
	movs r0, #0x66
	bl m4aSongNumStart
.L080804E4:
	ldr r0, .L080805D4 @ =gKeySt
	ldr r1, [r0]
	movs r0, #0x10
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq .L08080510
	adds r1, r6, #0
	adds r1, #0x30
	ldrb r3, [r1]
	cmp r3, #1
	beq .L08080510
	movs r0, #1
	strb r0, [r1]
	ldr r0, .L080805D8 @ =gPlaySt
	ldrb r0, [r0, #0x1d]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L08080510
	movs r0, #0x66
	bl m4aSongNumStart
.L08080510:
	ldr r0, .L080805D4 @ =gKeySt
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r4, #1
	ands r4, r1
	cmp r4, #0
	beq .L080805F0
	ldr r0, .L080805D8 @ =gPlaySt
	ldrb r0, [r0, #0x1d]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L0808052E
	movs r0, #0x6a
	bl m4aSongNumStart
.L0808052E:
	adds r0, r6, #0
	adds r0, #0x30
	ldrb r0, [r0]
	adds r7, r6, #0
	adds r7, #0x2e
	movs r4, #0x50
	adds r4, r4, r6
	mov r8, r4
	movs r5, #0x45
	adds r5, r5, r6
	mov sb, r5
	movs r1, #0x52
	adds r1, r1, r6
	mov sl, r1
	cmp r0, #0
	bne .L080805CC
	ldrh r2, [r4]
	lsrs r0, r2, #4
	ldrb r3, [r7]
	adds r0, r3, r0
	lsls r1, r0, #0x10
	ldr r4, .L080805DC @ =gPrepAllItemsCount
	adds r5, r4, #0
	ldr r2, .L080805E0 @ =gPrepMenuScrollPos
	mov ip, r2
	adds r3, r6, #0
	adds r3, #0x4b
	str r3, [sp, #0x14]
	ldrh r2, [r4]
	cmp r0, r2
	bge .L08080588
	ldr r3, .L080805E4 @ =gPrepItemListData
.L0808056E:
	asrs r1, r1, #0x10
	lsls r2, r1, #2
	adds r2, r2, r3
	adds r1, #1
	lsls r0, r1, #2
	adds r0, r0, r3
	ldrh r0, [r0, #2]
	strh r0, [r2, #2]
	lsls r1, r1, #0x10
	asrs r0, r1, #0x10
	ldrh r2, [r4]
	cmp r0, r2
	blt .L0808056E
.L08080588:
	ldrh r0, [r5]
	subs r0, #1
	strh r0, [r5]
	mov r3, ip
	ldrh r0, [r3]
	subs r0, #1
	strh r0, [r3]
	adds r0, r7, #0
	mov r1, r8
	bl func_fe6_080823A0
	ldr r0, .L080805E8 @ =gPrepTexts2
	ldr r2, [r6, #0x54]
	mov r4, r8
	ldrh r4, [r4]
	lsrs r3, r4, #4
	movs r1, #0
	str r1, [sp]
	movs r1, #1
	bl func_fe6_0807D9E4
	bl PrepAllItems_Update
	ldr r1, .L080805EC @ =gAction
	movs r0, #0x19
	strb r0, [r1, #0x11]
	ldr r5, [sp, #0x14]
	ldrb r0, [r5]
	cmp r0, #0
	beq .L080805CC
	adds r0, r6, #0
	movs r1, #6
	bl Proc_Goto
.L080805CC:
	movs r0, #0
	ldr r1, [sp, #0xc]
	strb r0, [r1]
	b .L08080622
	.align 2, 0
.L080805D4: .4byte gKeySt
.L080805D8: .4byte gPlaySt
.L080805DC: .4byte gPrepAllItemsCount
.L080805E0: .4byte gPrepMenuScrollPos
.L080805E4: .4byte gPrepItemListData
.L080805E8: .4byte gPrepTexts2
.L080805EC: .4byte gAction
.L080805F0:
	movs r0, #2
	ands r0, r1
	adds r7, r6, #0
	adds r7, #0x2e
	movs r2, #0x50
	adds r2, r2, r6
	mov r8, r2
	movs r3, #0x45
	adds r3, r3, r6
	mov sb, r3
	movs r5, #0x52
	adds r5, r5, r6
	mov sl, r5
	cmp r0, #0
	beq .L08080622
	ldr r0, .L0808069C @ =gPlaySt
	ldrb r0, [r0, #0x1d]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L0808061E
	movs r0, #0x6b
	bl m4aSongNumStart
.L0808061E:
	ldr r0, [sp, #0xc]
	strb r4, [r0]
.L08080622:
	ldr r1, [sp, #0xc]
	ldrb r0, [r1]
	cmp r0, #0
	beq .L0808062E
	bl .L080812FA
.L0808062E:
	adds r0, r6, #0
	adds r0, #0x2f
	ldrb r2, [r0]
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #1
	adds r0, #2
	ldrb r3, [r7]
	lsls r1, r3, #1
	lsls r2, r2, #2
	subs r2, #9
	subs r1, r1, r2
	movs r2, #0xc
	bl PutUiEntryHover
	ldr r0, .L080806A0 @ =gBg0Tm
	movs r1, #0xe
	movs r2, #0x13
	movs r3, #0
	bl TmFillRect_thm
	ldr r0, .L080806A4 @ =gBg1Tm
	movs r1, #0xe
	movs r2, #0x13
	movs r3, #0
	bl TmFillRect_thm
	ldr r1, .L080806A8 @ =gPrepItemListData
	mov r4, r8
	ldrh r4, [r4]
	lsrs r0, r4, #4
	ldrb r5, [r7]
	adds r0, r5, r0
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrh r2, [r0, #2]
	ldr r3, [r6, #0x5c]
	movs r0, #1
	movs r1, #0xb
	bl func_fe6_0807D4A8
	movs r0, #3
	bl EnableBgSync
	ldr r0, .L080806AC @ =gPrepAllItemsCount
	ldrh r0, [r0]
	cmp r0, #0
	beq .L08080692
	bl .L080812FA
.L08080692:
	movs r0, #0xff
	ldr r1, [sp, #0xc]
	strb r0, [r1]
	bl .L080812FA
	.align 2, 0
.L0808069C: .4byte gPlaySt
.L080806A0: .4byte gBg0Tm
.L080806A4: .4byte gBg1Tm
.L080806A8: .4byte gPrepItemListData
.L080806AC: .4byte gPrepAllItemsCount
.L080806B0:
	ldr r1, .L080806F8 @ =gKeySt
	ldr r0, [r1]
	ldrh r2, [r0, #8]
	movs r0, #2
	ands r0, r2
	adds r3, r1, #0
	cmp r0, #0
	beq .L08080720
	adds r0, r6, #0
	adds r0, #0x4b
	ldrb r0, [r0]
	cmp r0, #0
	beq .L08080700
	ldr r0, .L080806FC @ =gPlaySt
	ldrb r0, [r0, #0x1d]
	lsls r0, r0, #0x1e
	adds r7, r6, #0
	adds r7, #0x2e
	movs r2, #0x50
	adds r2, r2, r6
	mov r8, r2
	movs r3, #0x45
	adds r3, r3, r6
	mov sb, r3
	movs r4, #0x52
	adds r4, r4, r6
	mov sl, r4
	cmp r0, #0
	bge .L080806EE
	bl .L080812FA
.L080806EE:
	movs r0, #0x6c
	bl m4aSongNumStart
	bl .L080812FA
	.align 2, 0
.L080806F8: .4byte gKeySt
.L080806FC: .4byte gPlaySt
.L08080700:
	ldr r0, .L0808071C @ =gPlaySt
	ldrb r0, [r0, #0x1d]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L08080710
	movs r0, #0x6b
	bl m4aSongNumStart
.L08080710:
	movs r0, #0xff
	strb r0, [r4]
	adds r7, r6, #0
	adds r7, #0x2e
	b .L08080BBA
	.align 2, 0
.L0808071C: .4byte gPlaySt
.L08080720:
	movs r0, #1
	ands r0, r2
	cmp r0, #0
	bne .L0808072A
	b .L08080B68
.L0808072A:
	adds r0, r6, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #0
	beq .L08080736
	b .L08080B68
.L08080736:
	adds r4, r6, #0
	adds r4, #0x2f
	ldrb r2, [r4]
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #1
	adds r0, #2
	adds r5, r6, #0
	adds r5, #0x2e
	ldrb r3, [r5]
	lsls r1, r3, #1
	lsls r2, r2, #2
	subs r2, #9
	subs r1, r1, r2
	movs r2, #0xc
	bl RemoveUiEntryHover
	adds r0, r6, #0
	adds r0, #0x31
	ldrb r1, [r0]
	adds r7, r5, #0
	str r0, [sp, #0x10]
	adds r5, r4, #0
	cmp r1, #0
	beq .L0808076A
	b .L08080918
.L0808076A:
	bl GetTotalSupplyItemCount
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x64
	bne .L080807A0
	ldr r0, .L0808079C @ =gPlaySt
	ldrb r0, [r0, #0x1d]
	lsls r0, r0, #0x1e
	movs r4, #0x50
	adds r4, r4, r6
	mov r8, r4
	movs r1, #0x45
	adds r1, r1, r6
	mov sb, r1
	movs r2, #0x52
	adds r2, r2, r6
	mov sl, r2
	cmp r0, #0
	bge .L08080794
	b .L08080A3E
.L08080794:
	movs r0, #0x6c
	bl m4aSongNumStart
	b .L08080A3E
	.align 2, 0
.L0808079C: .4byte gPlaySt
.L080807A0:
	adds r0, r6, #0
	adds r0, #0x4c
	ldrb r0, [r0]
	cmp r0, #0
	beq .L080807E0
	ldr r0, [r6, #0x54]
	ldrb r1, [r7]
	bl PrepCanUnitPutItemToSupply
	lsls r0, r0, #0x18
	cmp r0, #0
	bne .L080807E0
	ldrb r3, [r7]
	lsls r1, r3, #4
	adds r1, #0x48
	ldr r2, .L080807DC @ =0x000006C2
	movs r0, #0x10
	adds r3, r6, #0
	bl StartPrepErrorHelpbox
	movs r4, #0x50
	adds r4, r4, r6
	mov r8, r4
	movs r0, #0x45
	adds r0, r0, r6
	mov sb, r0
	movs r1, #0x52
	adds r1, r1, r6
	mov sl, r1
	b .L08080A3E
	.align 2, 0
.L080807DC: .4byte 0x000006C2
.L080807E0:
	ldr r0, .L080808C8 @ =gPlaySt
	ldrb r0, [r0, #0x1d]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L080807F0
	movs r0, #0x6a
	bl m4aSongNumStart
.L080807F0:
	ldr r0, [r6, #0x54]
	ldrb r2, [r7]
	lsls r1, r2, #1
	adds r0, #0x1c
	adds r0, r0, r1
	ldrh r1, [r0]
	adds r0, r6, #0
	bl func_fe6_0807DEC8
	ldr r0, .L080808CC @ =gPrepAllItemsCount
	ldrh r0, [r0]
	lsls r2, r0, #0x10
	asrs r1, r2, #0x10
	adds r3, r6, #0
	adds r3, #0x50
	ldrh r4, [r3]
	lsrs r0, r4, #4
	mov r8, r3
	cmp r1, r0
	blt .L08080842
	ldr r0, .L080808D0 @ =gPrepItemListData
	mov sl, r0
	movs r1, #0
	mov sb, r1
.L08080820:
	asrs r2, r2, #0x10
	adds r1, r2, #1
	lsls r1, r1, #2
	add r1, sl
	lsls r0, r2, #2
	add r0, sl
	ldrh r0, [r0, #2]
	strh r0, [r1, #2]
	mov r4, sb
	strb r4, [r1]
	subs r2, #1
	lsls r2, r2, #0x10
	asrs r1, r2, #0x10
	ldrh r4, [r3]
	lsrs r0, r4, #4
	cmp r1, r0
	bge .L08080820
.L08080842:
	ldr r3, .L080808D0 @ =gPrepItemListData
	mov r0, r8
	ldrh r0, [r0]
	lsrs r1, r0, #4
	lsls r1, r1, #2
	adds r1, r1, r3
	ldr r0, [r6, #0x54]
	ldrb r4, [r7]
	lsls r2, r4, #1
	adds r0, #0x1c
	adds r0, r0, r2
	ldrh r0, [r0]
	movs r2, #0
	strh r0, [r1, #2]
	mov r1, r8
	ldrh r1, [r1]
	lsrs r0, r1, #4
	lsls r0, r0, #2
	adds r0, r0, r3
	strb r2, [r0]
	ldr r1, .L080808CC @ =gPrepAllItemsCount
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	ldr r1, .L080808D4 @ =gPrepMenuScrollPos
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	ldr r0, [r6, #0x54]
	ldrb r1, [r7]
	bl UnitRemoveItem
	ldr r1, [r6, #0x54]
	movs r0, #0
	bl func_fe6_0807D6C0
	bl PrepAllItems_Update
	ldr r1, .L080808D8 @ =gAction
	movs r0, #0x19
	strb r0, [r1, #0x11]
	ldr r0, [r6, #0x54]
	bl GetUnitItemCount
	cmp r0, #0
	bne .L080808DC
	adds r0, r6, #0
	bl func_fe6_0807D358
	adds r0, r6, #0
	adds r0, #0x2d
	ldrb r0, [r0]
	cmp r0, #3
	bhi .L080808BA
	ldr r0, [r6, #0x14]
	adds r1, r6, #0
	adds r1, #0x46
	ldrb r1, [r1]
	adds r0, #0x3a
	strb r1, [r0]
.L080808BA:
	adds r0, r6, #0
	movs r1, #4
	bl Proc_Goto
	bl .L080813D2
	.align 2, 0
.L080808C8: .4byte gPlaySt
.L080808CC: .4byte gPrepAllItemsCount
.L080808D0: .4byte gPrepItemListData
.L080808D4: .4byte gPrepMenuScrollPos
.L080808D8: .4byte gAction
.L080808DC:
	ldr r0, .L08080914 @ =gPrepTexts2
	ldr r2, [r6, #0x54]
	mov r4, r8
	ldrh r4, [r4]
	lsrs r3, r4, #4
	movs r1, #0
	str r1, [sp]
	movs r1, #1
	bl func_fe6_0807D9E4
	ldr r0, [r6, #0x54]
	bl GetUnitItemCount
	ldrb r2, [r7]
	adds r1, r2, #1
	movs r3, #0x45
	adds r3, r3, r6
	mov sb, r3
	movs r4, #0x52
	adds r4, r4, r6
	mov sl, r4
	cmp r0, r1
	blt .L0808090C
	b .L08080A3E
.L0808090C:
	subs r0, r2, #1
	strb r0, [r7]
	b .L08080A3E
	.align 2, 0
.L08080914: .4byte gPrepTexts2
.L08080918:
	movs r0, #0x50
	adds r0, r0, r6
	mov r8, r0
	movs r2, #0x45
	adds r2, r2, r6
	mov sb, r2
	movs r3, #0x52
	adds r3, r3, r6
	mov sl, r3
	cmp r1, #1
	beq .L08080930
	b .L08080A3E
.L08080930:
	ldr r0, .L08080A04 @ =gPrepMenuScrollPos
	ldrh r0, [r0]
	cmp r0, #0
	beq .L08080A1C
	ldr r0, [r6, #0x54]
	bl GetUnitItemCount
	cmp r0, #4
	bgt .L08080A1C
	ldr r0, .L08080A08 @ =gPlaySt
	ldrb r0, [r0, #0x1d]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L08080952
	movs r0, #0x6a
	bl m4aSongNumStart
.L08080952:
	ldr r0, [r6, #0x54]
	bl GetUnitItemCount
	ldr r1, [r6, #0x54]
	lsls r0, r0, #1
	adds r1, #0x1c
	adds r1, r1, r0
	mov r4, r8
	ldrh r4, [r4]
	lsrs r0, r4, #4
	ldrb r2, [r7]
	adds r0, r2, r0
	lsls r0, r0, #2
	ldr r3, .L08080A0C @ =gPrepItemListData
	adds r0, r0, r3
	ldrh r0, [r0, #2]
	strh r0, [r1]
	ldr r0, [r6, #0x54]
	bl UnitRemoveInvalidItems
	mov r4, r8
	ldrh r4, [r4]
	lsrs r0, r4, #4
	ldrb r1, [r7]
	adds r0, r1, r0
	lsls r1, r0, #0x10
	ldr r4, .L08080A10 @ =gPrepAllItemsCount
	ldrh r2, [r4]
	cmp r0, r2
	bge .L080809AA
	ldr r3, .L08080A0C @ =gPrepItemListData
.L08080990:
	asrs r1, r1, #0x10
	lsls r2, r1, #2
	adds r2, r2, r3
	adds r1, #1
	lsls r0, r1, #2
	adds r0, r0, r3
	ldrh r0, [r0, #2]
	strh r0, [r2, #2]
	lsls r1, r1, #0x10
	asrs r0, r1, #0x10
	ldrh r2, [r4]
	cmp r0, r2
	blt .L08080990
.L080809AA:
	ldr r4, .L08080A10 @ =gPrepAllItemsCount
	ldrh r0, [r4]
	subs r0, #1
	strh r0, [r4]
	ldr r1, .L08080A04 @ =gPrepMenuScrollPos
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	adds r0, r7, #0
	mov r1, r8
	bl func_fe6_080823A0
	ldr r0, .L08080A14 @ =gPrepTexts2
	ldr r2, [r6, #0x54]
	mov r3, r8
	ldrh r1, [r3]
	lsrs r1, r1, #4
	mov ip, r1
	movs r1, #0
	str r1, [sp]
	movs r1, #1
	mov r3, ip
	bl func_fe6_0807D9E4
	ldr r1, [r6, #0x54]
	movs r0, #0
	bl func_fe6_0807D6C0
	bl PrepAllItems_Update
	ldr r1, .L08080A18 @ =gAction
	movs r0, #0x19
	strb r0, [r1, #0x11]
	ldr r0, [r6, #0x54]
	bl GetUnitItemCount
	cmp r0, #5
	beq .L080809FC
	ldrh r0, [r4]
	cmp r0, #0
	bne .L08080A3E
.L080809FC:
	movs r0, #0xff
	ldr r2, [sp, #0xc]
	strb r0, [r2]
	b .L08080A3E
	.align 2, 0
.L08080A04: .4byte gPrepMenuScrollPos
.L08080A08: .4byte gPlaySt
.L08080A0C: .4byte gPrepItemListData
.L08080A10: .4byte gPrepAllItemsCount
.L08080A14: .4byte gPrepTexts2
.L08080A18: .4byte gAction
.L08080A1C:
	ldr r0, .L08080A90 @ =gPlaySt
	ldrb r0, [r0, #0x1d]
	lsls r0, r0, #0x1e
	movs r3, #0x50
	adds r3, r3, r6
	mov r8, r3
	movs r4, #0x45
	adds r4, r4, r6
	mov sb, r4
	movs r1, #0x52
	adds r1, r1, r6
	mov sl, r1
	cmp r0, #0
	blt .L08080A3E
	movs r0, #0x6c
	bl m4aSongNumStart
.L08080A3E:
	ldr r2, [sp, #0x10]
	ldrb r2, [r2]
	cmp r2, #2
	beq .L08080A48
	b .L08080B60
.L08080A48:
	ldr r0, .L08080A94 @ =gPrepMenuScrollPos
	ldrh r0, [r0]
	cmp r0, #0
	beq .L08080B3C
	ldr r1, .L08080A98 @ =gPrepItemListData
	mov r3, r8
	ldrh r3, [r3]
	lsrs r0, r3, #4
	ldrb r4, [r7]
	adds r0, r4, r0
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrh r0, [r0, #2]
	bl GetItemAttributes
	adds r4, r0, #0
	movs r0, #0x10
	ands r4, r0
	cmp r4, #0
	beq .L08080AA0
	ldrb r2, [r5]
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #4
	adds r0, #0x10
	ldrb r3, [r7]
	lsls r1, r3, #4
	lsls r2, r2, #5
	subs r2, #0x48
	subs r1, r1, r2
	ldr r2, .L08080A9C @ =0x00000C33
	adds r3, r6, #0
	bl StartPrepErrorHelpbox
	b .L08080E2E
	.align 2, 0
.L08080A90: .4byte gPlaySt
.L08080A94: .4byte gPrepMenuScrollPos
.L08080A98: .4byte gPrepItemListData
.L08080A9C: .4byte 0x00000C33
.L08080AA0:
	ldr r0, .L08080B20 @ =gPlaySt
	ldrb r0, [r0, #0x1d]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L08080AB0
	movs r0, #0x6a
	bl m4aSongNumStart
.L08080AB0:
	adds r1, r6, #0
	adds r1, #0x30
	movs r0, #1
	strb r0, [r1]
	movs r0, #0x14
	ldr r5, [sp, #0xc]
	strb r0, [r5]
	str r4, [sp]
	movs r0, #2
	movs r1, #4
	movs r2, #0xc
	movs r3, #7
	bl PutUiWindowFrame
	ldr r4, .L08080B24 @ =gPrepTexts1
	ldr r5, .L08080B28 @ =gBg0Tm+0x148
	ldr r0, .L08080B2C @ =gUnk_083272CC
	str r0, [sp]
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0
	movs r3, #0
	bl PrepPutText
	adds r0, r4, #0
	adds r0, #8
	adds r1, r5, #6
	ldr r2, .L08080B30 @ =gUnk_083272D4
	str r2, [sp]
	movs r2, #0
	movs r3, #0
	bl PrepPutText
	adds r0, r4, #0
	adds r0, #0x10
	adds r1, r5, #0
	adds r1, #0xc2
	ldr r2, .L08080B34 @ =gUnk_083272E0
	str r2, [sp]
	movs r2, #0
	movs r3, #0
	bl PrepPutText
	adds r4, #0x18
	adds r5, #0xca
	ldr r0, .L08080B38 @ =gUnk_083272E8
	str r0, [sp]
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0
	movs r3, #0
	bl PrepPutText
	bl .L080812FA
	.align 2, 0
.L08080B20: .4byte gPlaySt
.L08080B24: .4byte gPrepTexts1
.L08080B28: .4byte gBg0Tm+0x148
.L08080B2C: .4byte gUnk_083272CC
.L08080B30: .4byte gUnk_083272D4
.L08080B34: .4byte gUnk_083272E0
.L08080B38: .4byte gUnk_083272E8
.L08080B3C:
	ldr r0, .L08080B5C @ =gPlaySt
	ldrb r0, [r0, #0x1d]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L08080B4C
	movs r0, #0x6c
	bl m4aSongNumStart
.L08080B4C:
	ldrb r2, [r5]
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #1
	adds r0, #2
	ldrb r3, [r7]
	lsls r1, r3, #1
	b .L08080E3C
	.align 2, 0
.L08080B5C: .4byte gPlaySt
.L08080B60:
	adds r0, r6, #0
	bl func_fe6_0807D358
	b .L08080E2E
.L08080B68:
	ldr r1, [r3]
	movs r0, #0x80
	lsls r0, r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq .L08080C34
	adds r1, r6, #0
	adds r1, #0x29
	ldrb r0, [r1]
	cmp r0, #0
	bne .L08080C34
	adds r0, r6, #0
	adds r0, #0x31
	ldrb r2, [r0]
	cmp r2, #0
	bne .L08080BCE
	movs r0, #2
	strb r0, [r1]
	adds r0, r6, #0
	adds r0, #0x2f
	ldrb r2, [r0]
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #4
	adds r0, #0x10
	adds r4, r6, #0
	adds r4, #0x2e
	ldrb r3, [r4]
	lsls r1, r3, #4
	lsls r2, r2, #5
	subs r2, #0x48
	subs r1, r1, r2
	ldr r2, [r6, #0x54]
	lsls r3, r3, #1
	adds r2, #0x1c
	adds r2, r2, r3
	ldrh r2, [r2]
	bl StartItemHelpBox
	adds r7, r4, #0
.L08080BBA:
	movs r5, #0x50
	adds r5, r5, r6
	mov r8, r5
	movs r0, #0x45
	adds r0, r0, r6
	mov sb, r0
	movs r1, #0x52
	adds r1, r1, r6
	mov sl, r1
	b .L080812FA
.L08080BCE:
	ldr r0, .L08080C2C @ =gPrepMenuScrollPos
	ldrh r0, [r0]
	adds r7, r6, #0
	adds r7, #0x2e
	movs r3, #0x50
	adds r3, r3, r6
	mov r8, r3
	movs r4, #0x45
	adds r4, r4, r6
	mov sb, r4
	movs r5, #0x52
	adds r5, r5, r6
	mov sl, r5
	cmp r0, #0
	bne .L08080BEE
	b .L080812FA
.L08080BEE:
	subs r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bls .L08080BFA
	b .L080812FA
.L08080BFA:
	movs r0, #2
	strb r0, [r1]
	adds r0, r6, #0
	adds r0, #0x2f
	ldrb r2, [r0]
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #4
	adds r0, #0x10
	ldrb r4, [r7]
	lsls r1, r4, #4
	lsls r2, r2, #5
	subs r2, #0x48
	subs r1, r1, r2
	ldr r2, .L08080C30 @ =gPrepItemListData
	mov ip, r2
	ldrh r3, [r3]
	lsrs r2, r3, #4
	adds r2, r2, r4
	lsls r2, r2, #2
	add r2, ip
	ldrh r2, [r2, #2]
	bl StartItemHelpBox
	b .L080812FA
	.align 2, 0
.L08080C2C: .4byte gPrepMenuScrollPos
.L08080C30: .4byte gPrepItemListData
.L08080C34:
	adds r0, r6, #0
	adds r0, #0x2f
	ldrb r2, [r0]
	adds r5, r0, #0
	cmp r2, #1
	beq .L08080C42
	b .L08080E50
.L08080C42:
	ldr r1, [r3]
	movs r0, #0x80
	lsls r0, r0, #2
	ldrh r1, [r1, #4]
	ands r0, r1
	cmp r0, #0
	beq .L08080C5C
	adds r1, r6, #0
	adds r1, #0x4a
	movs r0, #2
	strb r0, [r1]
	adds r4, r1, #0
	b .L08080C64
.L08080C5C:
	adds r0, r6, #0
	adds r0, #0x4a
	strb r2, [r0]
	adds r4, r0, #0
.L08080C64:
	ldr r1, [r3]
	movs r2, #0x40
	adds r0, r2, #0
	ldrh r7, [r1, #6]
	ands r0, r7
	cmp r0, #0
	bne .L08080C82
	adds r0, r2, #0
	ldrh r1, [r1, #0x10]
	ands r0, r1
	cmp r0, #0
	beq .L08080D34
	ldrb r0, [r4]
	cmp r0, #2
	bne .L08080D34
.L08080C82:
	adds r0, r6, #0
	adds r0, #0x2e
	ldrb r1, [r0]
	mov sb, r1
	adds r7, r0, #0
	movs r2, #0x50
	adds r2, r2, r6
	mov r8, r2
	cmp r1, #1
	bne .L08080CEC
	ldrh r0, [r2]
	cmp r0, #0
	beq .L08080CEC
	ldr r0, .L08080CE4 @ =gPlaySt
	ldrb r0, [r0, #0x1d]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L08080CAC
	movs r0, #0x66
	bl m4aSongNumStart
.L08080CAC:
	ldr r0, .L08080CE8 @ =gPrepTexts2
	mov r3, r8
	ldrh r3, [r3]
	lsrs r2, r3, #4
	subs r2, #1
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	ldr r3, [r6, #0x54]
	movs r1, #0
	str r1, [sp]
	movs r1, #1
	bl func_fe6_0807DB80
	adds r0, r6, #0
	bl func_fe6_0807D358
	ldrb r4, [r4]
	lsls r0, r4, #2
	mov r4, r8
	ldrh r4, [r4]
	subs r0, r4, r0
	mov r5, r8
	strh r0, [r5]
	mov r1, sb
	ldr r0, [sp, #0xc]
	strb r1, [r0]
	b .L08080DC2
	.align 2, 0
.L08080CE4: .4byte gPlaySt
.L08080CE8: .4byte gPrepTexts2
.L08080CEC:
	ldrb r0, [r7]
	movs r4, #0x45
	adds r4, r4, r6
	mov sb, r4
	movs r1, #0x52
	adds r1, r1, r6
	mov sl, r1
	cmp r0, #0
	bne .L08080D00
	b .L080812FA
.L08080D00:
	ldr r0, .L08080D30 @ =gPlaySt
	ldrb r0, [r0, #0x1d]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L08080D10
	movs r0, #0x66
	bl m4aSongNumStart
.L08080D10:
	ldrb r2, [r5]
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #1
	adds r0, #2
	ldrb r3, [r7]
	lsls r1, r3, #1
	lsls r2, r2, #2
	subs r2, #9
	subs r1, r1, r2
	movs r2, #0xc
	bl RemoveUiEntryHover
	ldrb r0, [r7]
	subs r0, #1
	b .L08080E2C
	.align 2, 0
.L08080D30: .4byte gPlaySt
.L08080D34:
	ldr r1, [r3]
	movs r2, #0x80
	adds r0, r2, #0
	ldrh r7, [r1, #6]
	ands r0, r7
	cmp r0, #0
	bne .L08080D5A
	adds r0, r2, #0
	ldrh r1, [r1, #0x10]
	ands r0, r1
	adds r7, r6, #0
	adds r7, #0x2e
	cmp r0, #0
	bne .L08080D52
	b .L08080F84
.L08080D52:
	ldrb r0, [r4]
	cmp r0, #2
	beq .L08080D5A
	b .L08080F84
.L08080D5A:
	adds r0, r6, #0
	adds r0, #0x2e
	ldrb r1, [r0]
	adds r7, r0, #0
	cmp r1, #5
	bls .L08080D68
	b .L08080F84
.L08080D68:
	movs r2, #0x50
	adds r2, r2, r6
	mov r8, r2
	ldr r3, .L08080DD0 @ =gPrepMenuScrollPos
	mov ip, r3
	cmp r1, #5
	bne .L08080DDC
	ldrh r1, [r2]
	lsrs r0, r1, #4
	adds r0, #7
	ldrh r1, [r3]
	cmp r0, r1
	bge .L08080DDC
	ldr r0, .L08080DD4 @ =gPlaySt
	ldrb r0, [r0, #0x1d]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L08080D92
	movs r0, #0x66
	bl m4aSongNumStart
.L08080D92:
	ldr r0, .L08080DD8 @ =gPrepTexts2
	mov r3, r8
	ldrh r3, [r3]
	lsrs r2, r3, #4
	adds r2, #7
	ldr r3, [r6, #0x54]
	movs r1, #0
	str r1, [sp]
	movs r1, #1
	bl func_fe6_0807DB80
	adds r0, r6, #0
	bl func_fe6_0807D358
	ldrb r4, [r4]
	lsls r0, r4, #2
	mov r4, r8
	ldrh r4, [r4]
	adds r0, r4, r0
	mov r5, r8
	strh r0, [r5]
	movs r0, #2
	ldr r1, [sp, #0xc]
	strb r0, [r1]
.L08080DC2:
	movs r2, #0x45
	adds r2, r2, r6
	mov sb, r2
	movs r3, #0x52
	adds r3, r3, r6
	mov sl, r3
	b .L080812FA
	.align 2, 0
.L08080DD0: .4byte gPrepMenuScrollPos
.L08080DD4: .4byte gPlaySt
.L08080DD8: .4byte gPrepTexts2
.L08080DDC:
	mov r4, r8
	ldrh r4, [r4]
	lsrs r0, r4, #4
	ldrb r1, [r7]
	adds r0, r1, r0
	adds r0, #1
	movs r2, #0x45
	adds r2, r2, r6
	mov sb, r2
	movs r3, #0x52
	adds r3, r3, r6
	mov sl, r3
	mov r4, ip
	ldrh r4, [r4]
	cmp r0, r4
	blt .L08080DFE
	b .L080812FA
.L08080DFE:
	ldr r0, .L08080E4C @ =gPlaySt
	ldrb r0, [r0, #0x1d]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L08080E0E
	movs r0, #0x66
	bl m4aSongNumStart
.L08080E0E:
	ldrb r2, [r5]
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #1
	adds r0, #2
	ldrb r3, [r7]
	lsls r1, r3, #1
	lsls r2, r2, #2
	subs r2, #9
	subs r1, r1, r2
	movs r2, #0xc
	bl RemoveUiEntryHover
	ldrb r0, [r7]
	adds r0, #1
.L08080E2C:
	strb r0, [r7]
.L08080E2E:
	ldrb r2, [r5]
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #1
	adds r0, #2
	ldrb r4, [r7]
	lsls r1, r4, #1
.L08080E3C:
	lsls r2, r2, #2
	subs r2, #9
	subs r1, r1, r2
	movs r2, #0xc
	bl PutUiEntryHover
	b .L080812FA
	.align 2, 0
.L08080E4C: .4byte gPlaySt
.L08080E50:
	ldr r0, [r3]
	ldrh r1, [r0, #6]
	movs r7, #0x40
	mov r8, r7
	mov r0, r8
	ands r0, r1
	cmp r0, #0
	beq .L08080EF4
	ldrb r2, [r5]
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #1
	adds r0, #2
	adds r4, r6, #0
	adds r4, #0x2e
	ldrb r7, [r4]
	lsls r1, r7, #1
	lsls r2, r2, #2
	subs r2, #9
	subs r1, r1, r2
	movs r2, #0xc
	str r3, [sp, #0x18]
	bl RemoveUiEntryHover
	ldrb r0, [r4]
	adds r7, r4, #0
	ldr r3, [sp, #0x18]
	cmp r0, #0
	beq .L08080EA4
	ldr r0, .L08080EA0 @ =gPlaySt
	ldrb r0, [r0, #0x1d]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L08080E9A
	movs r0, #0x66
	bl m4aSongNumStart
.L08080E9A:
	ldrb r0, [r7]
	b .L08080ED0
	.align 2, 0
.L08080EA0: .4byte gPlaySt
.L08080EA4:
	ldr r1, [r3]
	mov r0, r8
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq .L08080ED4
	ldr r0, .L08080EF0 @ =gPlaySt
	ldrb r0, [r0, #0x1d]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L08080EC0
	movs r0, #0x66
	bl m4aSongNumStart
.L08080EC0:
	ldrb r0, [r5]
	lsls r1, r0, #2
	adds r0, r6, #0
	adds r0, #0x54
	adds r0, r0, r1
	ldr r0, [r0]
	bl GetUnitItemCount
.L08080ED0:
	subs r0, #1
	strb r0, [r7]
.L08080ED4:
	ldrb r2, [r5]
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #1
	adds r0, #2
	ldrb r3, [r7]
	lsls r1, r3, #1
	lsls r2, r2, #2
	subs r2, #9
	subs r1, r1, r2
	movs r2, #0xc
	bl PutUiEntryHover
	b .L08080F84
	.align 2, 0
.L08080EF0: .4byte gPlaySt
.L08080EF4:
	movs r0, #0x80
	ands r0, r1
	adds r7, r6, #0
	adds r7, #0x2e
	cmp r0, #0
	beq .L08080F84
	ldrb r2, [r5]
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #1
	adds r0, #2
	ldrb r4, [r7]
	lsls r1, r4, #1
	lsls r2, r2, #2
	subs r2, #9
	subs r1, r1, r2
	movs r2, #0xc
	bl RemoveUiEntryHover
	ldrb r4, [r7]
	ldr r0, [r6, #0x54]
	bl GetUnitItemCount
	subs r0, #1
	cmp r4, r0
	bge .L08080F48
	ldrb r0, [r7]
	cmp r0, #3
	bhi .L08080F48
	ldr r0, .L08080F44 @ =gPlaySt
	ldrb r0, [r0, #0x1d]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L08080F3E
	movs r0, #0x66
	bl m4aSongNumStart
.L08080F3E:
	ldrb r0, [r7]
	adds r0, #1
	b .L08080F68
	.align 2, 0
.L08080F44: .4byte gPlaySt
.L08080F48:
	ldr r0, .L08081008 @ =gKeySt
	ldr r1, [r0]
	movs r0, #0x80
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq .L08080F6A
	ldr r0, .L0808100C @ =gPlaySt
	ldrb r0, [r0, #0x1d]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L08080F66
	movs r0, #0x66
	bl m4aSongNumStart
.L08080F66:
	movs r0, #0
.L08080F68:
	strb r0, [r7]
.L08080F6A:
	ldrb r2, [r5]
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #1
	adds r0, #2
	ldrb r3, [r7]
	lsls r1, r3, #1
	lsls r2, r2, #2
	subs r2, #9
	subs r1, r1, r2
	movs r2, #0xc
	bl PutUiEntryHover
.L08080F84:
	adds r4, r5, #0
	movs r0, #0x50
	adds r0, r0, r6
	mov r8, r0
	movs r1, #0x45
	adds r1, r1, r6
	mov sb, r1
	movs r2, #0x52
	adds r2, r2, r6
	mov sl, r2
	ldrb r3, [r4]
	cmp r3, #1
	beq .L08080FA0
	b .L080812FA
.L08080FA0:
	ldr r0, .L08081008 @ =gKeySt
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq .L08081010
	ldr r0, .L0808100C @ =gPlaySt
	ldrb r0, [r0, #0x1d]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L08080FBE
	movs r0, #0x67
	bl m4aSongNumStart
.L08080FBE:
	ldrb r2, [r4]
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #1
	adds r0, #2
	ldrb r4, [r7]
	lsls r1, r4, #1
	lsls r2, r2, #2
	subs r2, #9
	subs r1, r1, r2
	movs r2, #0xc
	bl RemoveUiEntryHover
	adds r2, r6, #0
	adds r2, #0x46
	adds r0, r6, #0
	adds r0, #0x32
	ldrb r5, [r2]
	adds r0, r5, r0
	mov r3, r8
	ldrh r3, [r3]
	lsrs r1, r3, #4
	strb r1, [r0]
	adds r0, r6, #0
	adds r0, #0x3b
	ldrb r2, [r2]
	adds r0, r2, r0
	ldrb r1, [r7]
	strb r1, [r0]
	movs r0, #0x38
	mov r4, sb
	strb r0, [r4]
	movs r0, #5
	ldr r5, [sp, #0xc]
	strb r0, [r5]
	b .L080812FA
	.align 2, 0
.L08081008: .4byte gKeySt
.L0808100C: .4byte gPlaySt
.L08081010:
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	bne .L0808101A
	b .L080812FA
.L0808101A:
	ldr r0, .L08081074 @ =gPlaySt
	ldrb r0, [r0, #0x1d]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L0808102A
	movs r0, #0x67
	bl m4aSongNumStart
.L0808102A:
	ldrb r2, [r5]
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #1
	adds r0, #2
	ldrb r3, [r7]
	lsls r1, r3, #1
	lsls r2, r2, #2
	subs r2, #9
	subs r1, r1, r2
	movs r2, #0xc
	bl RemoveUiEntryHover
	adds r2, r6, #0
	adds r2, #0x46
	adds r0, r6, #0
	adds r0, #0x32
	ldrb r4, [r2]
	adds r0, r4, r0
	mov r5, r8
	ldrh r5, [r5]
	lsrs r1, r5, #4
	strb r1, [r0]
	adds r0, r6, #0
	adds r0, #0x3b
	ldrb r2, [r2]
	adds r0, r2, r0
	ldrb r1, [r7]
	strb r1, [r0]
	movs r0, #0xc8
	mov r1, sb
	strb r0, [r1]
	movs r0, #0xa
	ldr r2, [sp, #0xc]
	strb r0, [r2]
	b .L080812FA
	.align 2, 0
.L08081074: .4byte gPlaySt
.L08081078:
	adds r0, r6, #0
	adds r0, #0x50
	adds r1, r6, #0
	adds r1, #0x4a
	ldrb r1, [r1]
	lsls r1, r1, #2
	ldrh r3, [r0]
	subs r1, r3, r1
	strh r1, [r0]
	ldrh r2, [r0]
	movs r1, #0xf
	ands r1, r2
	adds r7, r6, #0
	adds r7, #0x2e
	mov r8, r0
	movs r5, #0x45
	adds r5, r5, r6
	mov sb, r5
	movs r0, #0x52
	adds r0, r0, r6
	mov sl, r0
	cmp r1, #0
	beq .L080810A8
	b .L080812FA
.L080810A8:
	lsrs r0, r2, #4
	adds r0, #7
	lsls r0, r0, #1
	movs r1, #0x1f
	ands r0, r1
	lsls r0, r0, #6
	ldr r1, .L080810CC @ =gBg2Tm+0x1E
	adds r0, r0, r1
	movs r1, #0xf
	movs r2, #1
	movs r3, #0
	bl TmFillRect_thm
	movs r0, #4
	bl EnableBgSync
	movs r0, #0
	b .L080812F8
	.align 2, 0
.L080810CC: .4byte gBg2Tm+0x1E
.L080810D0:
	adds r0, r6, #0
	adds r0, #0x50
	adds r1, r6, #0
	adds r1, #0x4a
	ldrb r1, [r1]
	lsls r1, r1, #2
	ldrh r2, [r0]
	adds r1, r2, r1
	strh r1, [r0]
	ldrh r2, [r0]
	movs r1, #0xf
	ands r1, r2
	adds r7, r6, #0
	adds r7, #0x2e
	mov r8, r0
	movs r3, #0x45
	adds r3, r3, r6
	mov sb, r3
	movs r5, #0x52
	adds r5, r5, r6
	mov sl, r5
	cmp r1, #0
	beq .L08081100
	b .L080812FA
.L08081100:
	lsrs r0, r2, #4
	subs r0, #1
	lsls r0, r0, #1
	movs r1, #0x1f
	ands r0, r1
	lsls r0, r0, #6
	ldr r1, .L08081124 @ =gBg2Tm+0x1E
	adds r0, r0, r1
	movs r1, #0xf
	movs r2, #1
	movs r3, #0
	bl TmFillRect_thm
	movs r0, #4
	bl EnableBgSync
	movs r0, #0
	b .L080812F8
	.align 2, 0
.L08081124: .4byte gBg2Tm+0x1E
.L08081128:
	adds r1, r6, #0
	adds r1, #0x45
	ldrb r0, [r1]
	adds r0, #0x38
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r7, r6, #0
	adds r7, #0x2e
	movs r2, #0x50
	adds r2, r2, r6
	mov r8, r2
	mov sb, r1
	movs r3, #0x52
	adds r3, r3, r6
	mov sl, r3
	cmp r0, #0x70
	beq .L0808114E
	b .L080812FA
.L0808114E:
	movs r0, #6
	b .L080812F8
.L08081152:
	adds r2, r6, #0
	adds r2, #0x45
	movs r0, #0x90
	strb r0, [r2]
	adds r0, r6, #0
	adds r0, #0x46
	ldrb r1, [r0]
	adds r5, r0, #0
	mov sb, r2
	cmp r1, #8
	bne .L0808116C
	movs r0, #0
	b .L0808116E
.L0808116C:
	adds r0, r1, #1
.L0808116E:
	strb r0, [r5]
	adds r0, r6, #0
	adds r0, #0x32
	ldrb r4, [r5]
	adds r0, r4, r0
	ldrb r0, [r0]
	lsls r0, r0, #4
	adds r4, r6, #0
	adds r4, #0x50
	strh r0, [r4]
	adds r0, r6, #0
	adds r0, #0x3b
	ldrb r7, [r5]
	adds r0, r7, r0
	ldrb r0, [r0]
	adds r7, r6, #0
	adds r7, #0x2e
	strb r0, [r7]
	ldrb r0, [r5]
	bl func_fe6_0807D834
	adds r0, r7, #0
	adds r1, r4, #0
	bl func_fe6_080823A0
	ldr r0, .L080811E0 @ =gPrepTexts2
	ldr r2, [r6, #0x54]
	ldrh r1, [r4]
	lsrs r3, r1, #4
	movs r1, #1
	str r1, [sp]
	bl func_fe6_0807D9E4
	adds r0, r6, #0
	adds r0, #0x2f
	ldrb r2, [r0]
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #1
	adds r0, #2
	ldrb r3, [r7]
	lsls r1, r3, #1
	lsls r2, r2, #2
	subs r2, #9
	subs r1, r1, r2
	movs r2, #0xc
	bl PutUiEntryHover
	adds r0, r6, #0
	bl func_fe6_0807D358
	mov r5, sb
	ldrb r0, [r5]
	adds r0, #0xe
	strb r0, [r5]
	movs r0, #7
	b .L080812C0
	.align 2, 0
.L080811E0: .4byte gPrepTexts2
.L080811E4:
	adds r1, r6, #0
	adds r1, #0x45
	ldrb r0, [r1]
	adds r0, #0xe
	b .L080812DC
.L080811EE:
	adds r1, r6, #0
	adds r1, #0x45
	ldrb r0, [r1]
	subs r0, #0x38
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r7, r6, #0
	adds r7, #0x2e
	movs r2, #0x50
	adds r2, r2, r6
	mov r8, r2
	mov sb, r1
	movs r3, #0x52
	adds r3, r3, r6
	mov sl, r3
	cmp r0, #0x90
	bne .L080812FA
	movs r0, #0xb
	b .L080812F8
.L08081216:
	adds r2, r6, #0
	adds r2, #0x45
	movs r0, #0x70
	strb r0, [r2]
	adds r0, r6, #0
	adds r0, #0x46
	ldrb r1, [r0]
	adds r5, r0, #0
	mov sb, r2
	cmp r1, #0
	bne .L08081230
	movs r0, #8
	b .L08081232
.L08081230:
	subs r0, r1, #1
.L08081232:
	strb r0, [r5]
	movs r4, #0x2f
	adds r4, r4, r6
	mov r8, r4
	ldrb r2, [r4]
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #1
	adds r0, #2
	adds r7, r6, #0
	adds r7, #0x2e
	ldrb r3, [r7]
	lsls r1, r3, #1
	lsls r2, r2, #2
	subs r2, #9
	subs r1, r1, r2
	movs r2, #0xc
	bl RemoveUiEntryHover
	adds r0, r6, #0
	adds r0, #0x32
	ldrb r4, [r5]
	adds r0, r4, r0
	ldrb r0, [r0]
	lsls r0, r0, #4
	adds r4, r6, #0
	adds r4, #0x50
	strh r0, [r4]
	adds r0, r6, #0
	adds r0, #0x3b
	ldrb r1, [r5]
	adds r0, r1, r0
	ldrb r0, [r0]
	strb r0, [r7]
	ldrb r0, [r5]
	bl func_fe6_0807D834
	adds r0, r7, #0
	adds r1, r4, #0
	bl func_fe6_080823A0
	ldr r0, .L080812D0 @ =gPrepTexts2
	ldr r2, [r6, #0x54]
	ldrh r5, [r4]
	lsrs r3, r5, #4
	movs r1, #1
	str r1, [sp]
	bl func_fe6_0807D9E4
	mov r0, r8
	ldrb r2, [r0]
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #1
	adds r0, #2
	ldrb r3, [r7]
	lsls r1, r3, #1
	lsls r2, r2, #2
	subs r2, #9
	subs r1, r1, r2
	movs r2, #0xc
	bl PutUiEntryHover
	adds r0, r6, #0
	bl func_fe6_0807D358
	mov r5, sb
	ldrb r0, [r5]
	subs r0, #0xe
	strb r0, [r5]
	movs r0, #0xc
.L080812C0:
	ldr r1, [sp, #0xc]
	strb r0, [r1]
	mov r8, r4
.L080812C6:
	movs r2, #0x52
	adds r2, r2, r6
	mov sl, r2
	b .L080812FA
	.align 2, 0
.L080812D0: .4byte gPrepTexts2
.L080812D4:
	adds r1, r6, #0
	adds r1, #0x45
	ldrb r0, [r1]
	subs r0, #0xe
.L080812DC:
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r7, r6, #0
	adds r7, #0x2e
	movs r3, #0x50
	adds r3, r3, r6
	mov r8, r3
	mov sb, r1
	movs r5, #0x52
	adds r5, r5, r6
	mov sl, r5
	cmp r0, #0
	bne .L080812FA
.L080812F8:
	strb r0, [r4]
.L080812FA:
	mov r1, r8
	ldrh r1, [r1]
	lsrs r0, r1, #4
	ldrb r3, [r7]
	adds r5, r0, r3
	ldr r2, [sp, #4]
	cmp r2, r5
	bne .L08081316
	adds r0, r6, #0
	adds r0, #0x46
	ldr r4, [sp, #8]
	ldrb r0, [r0]
	cmp r4, r0
	beq .L080813B6
.L08081316:
	adds r4, r6, #0
	adds r4, #0x29
	ldrb r1, [r4]
	adds r0, r6, #0
	adds r0, #0x31
	str r0, [sp, #0x10]
	cmp r1, #0
	beq .L08081392
	ldrb r0, [r0]
	cmp r0, #0
	bne .L08081352
	adds r0, r6, #0
	adds r0, #0x2f
	ldrb r2, [r0]
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #4
	adds r0, #0x10
	lsls r1, r3, #4
	lsls r2, r2, #5
	subs r2, #0x48
	subs r1, r1, r2
	ldr r2, [r6, #0x54]
	lsls r3, r3, #1
	adds r2, #0x1c
	adds r2, r2, r3
	ldrh r2, [r2]
	bl StartItemHelpBox
	b .L08081392
.L08081352:
	ldr r0, .L08081368 @ =gPrepMenuScrollPos
	ldrh r0, [r0]
	cmp r0, #0
	bne .L0808136C
	cmp r1, #1
	beq .L08081362
	bl CloseHelpBox
.L08081362:
	movs r0, #1
	b .L08081390
	.align 2, 0
.L08081368: .4byte gPrepMenuScrollPos
.L0808136C:
	adds r0, r6, #0
	adds r0, #0x2f
	ldrb r2, [r0]
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #4
	adds r0, #0x10
	lsls r1, r3, #4
	lsls r2, r2, #5
	subs r2, #0x48
	subs r1, r1, r2
	ldr r3, .L080813E4 @ =gPrepItemListData
	lsls r2, r5, #2
	adds r2, r2, r3
	ldrh r2, [r2, #2]
	bl StartItemHelpBox
	movs r0, #2
.L08081390:
	strb r0, [r4]
.L08081392:
	ldr r1, [sp, #0x10]
	ldrb r1, [r1]
	cmp r1, #2
	bne .L080813B6
	ldr r1, .L080813E4 @ =gPrepItemListData
	mov r2, r8
	ldrh r2, [r2]
	lsrs r0, r2, #4
	ldrb r7, [r7]
	adds r0, r7, r0
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrh r2, [r0, #2]
	ldr r3, [r6, #0x5c]
	movs r0, #1
	movs r1, #0xb
	bl func_fe6_0807D4A8
.L080813B6:
	mov r3, sb
	ldrb r1, [r3]
	mov r4, r8
	ldrh r2, [r4]
	subs r2, #0x28
	movs r0, #0xff
	ands r2, r0
	movs r0, #2
	bl SetBgOffset
	mov r5, sl
	ldrh r0, [r5]
	adds r0, #1
	strh r0, [r5]
.L080813D2:
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L080813E4: .4byte gPrepItemListData
