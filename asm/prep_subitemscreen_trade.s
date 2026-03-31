	.include "macro.inc"

	.syntax unified

	thumb_func_start PrepSubItem_Trade_Loop
PrepSubItem_Trade_Loop: @ 0x0807E5A8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	adds r6, r0, #0

	adds r0, #0x2f
	ldrb r0, [r0]
	str r0, [sp]

	adds r0, r6, #0
	adds r0, #0x2e
	ldrb r0, [r0]
	str r0, [sp, #4]

	adds r0, r6, #0
	bl func_fe6_0807E544

	adds r4, r6, #0
	adds r4, #0x29
	ldrb r0, [r4]
	cmp r0, #2
	bne .L0807E5F4
	ldr r0, .L0807E5F0 @ =gKeySt
	ldr r1, [r0]
	movs r0, #0x81
	lsls r0, r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq .L0807E5F4
	bl CloseHelpBox
	movs r0, #0
	strb r0, [r4]
	b .L0807EB60
	.align 2, 0
.L0807E5F0: .4byte gKeySt

.L0807E5F4:
	ldr r2, .L0807E674 @ =gKeySt
	ldr r1, [r2]
	movs r0, #0x20
	ldrh r1, [r1, #6]
	ands r0, r1
	mov r8, r2
	cmp r0, #0
	beq .L0807E67C
	adds r0, r6, #0
	adds r0, #0x2f
	adds r5, r0, #0
	ldrb r1, [r5]
	cmp r1, #1
	bne .L0807E67C
	adds r7, r6, #0
	adds r7, #0x3b
	ldrb r0, [r7]
	adds r2, r6, #0
	adds r2, #0x29
	str r2, [sp, #8]
	cmp r0, #0
	bne .L0807E622
	b .L0807EB1A
.L0807E622:
	ldr r0, .L0807E678 @ =gPlaySt
	ldrb r0, [r0, #0x1d]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L0807E632
	movs r0, #0x67
	bl m4aSongNumStart
.L0807E632:
	ldrb r3, [r5]
	lsls r0, r3, #3
	subs r0, r0, r3
	lsls r0, r0, #1
	adds r0, #2
	adds r4, r6, #0
	adds r4, #0x2e
	ldrb r2, [r4]
	lsls r1, r2, #1
	adds r1, #9
	movs r2, #0xc
	bl RemoveUiEntryHover
	ldrb r0, [r5]
	subs r0, #1
	strb r0, [r5]
	adds r0, r0, r7
	ldrb r0, [r0]
	ldrb r3, [r4]
	cmp r3, r0
	blo .L0807E660
	subs r0, #1
	strb r0, [r4]
.L0807E660:
	ldrb r7, [r5]
	lsls r0, r7, #3
	adds r5, r7, #0
	subs r0, r0, r5
	lsls r0, r0, #1
	adds r0, #2
	ldrb r4, [r4]
	lsls r1, r4, #1
	b .L0807EAB2
	.align 2, 0
.L0807E674: .4byte gKeySt
.L0807E678: .4byte gPlaySt


.L0807E67C:
	mov r0, r8
	ldr r1, [r0]
	movs r0, #0x10
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq .L0807E700
	adds r0, r6, #0
	adds r0, #0x2f
	ldrb r1, [r0]
	adds r5, r0, #0
	cmp r1, #0
	bne .L0807E700
	adds r0, #0xd
	ldrb r0, [r0]
	adds r1, r6, #0
	adds r1, #0x29
	str r1, [sp, #8]
	cmp r0, #0
	bne .L0807E6A6
	b .L0807EB1A
.L0807E6A6:
	ldr r0, .L0807E6FC @ =gPlaySt
	ldrb r0, [r0, #0x1d]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L0807E6B6
	movs r0, #0x67
	bl m4aSongNumStart
.L0807E6B6:
	ldrb r2, [r5]
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #1
	adds r0, #2
	adds r4, r6, #0
	adds r4, #0x2e
	ldrb r3, [r4]
	lsls r1, r3, #1
	adds r1, #9
	movs r2, #0xc
	bl RemoveUiEntryHover
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	adds r0, r6, #0
	adds r0, #0x3b
	ldrb r7, [r5]
	adds r0, r7, r0
	ldrb r0, [r0]
	ldrb r1, [r4]
	cmp r1, r0
	blo .L0807E6EA
	subs r0, #1
	strb r0, [r4]
.L0807E6EA:
	ldrb r2, [r5]
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #1
	adds r0, #2
	ldrb r4, [r4]
	lsls r1, r4, #1
	b .L0807EAB2
	.align 2, 0
.L0807E6FC: .4byte gPlaySt

@ KEY_DPAD_UP
.L0807E700:
	mov r3, r8
	ldr r1, [r3]
	movs r4, #0x40
	mov sb, r4
	mov r0, sb
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq .L0807E7AC
	adds r0, r6, #0
	adds r0, #0x2f
	ldrb r2, [r0]
	adds r7, r6, #0
	adds r7, #0x3b
	adds r1, r7, r2
	ldrb r1, [r1]
	adds r5, r0, #0
	cmp r1, #0
	beq .L0807E7AC
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #1
	adds r0, #2
	adds r4, r6, #0
	adds r4, #0x2e
	ldrb r2, [r4]
	lsls r1, r2, #1
	adds r1, #9
	movs r2, #0xc
	bl RemoveUiEntryHover
	ldrb r0, [r4]
	cmp r0, #0
	beq .L0807E760
	subs r0, #1
	strb r0, [r4]
	ldr r0, .L0807E75C @ =gPlaySt
	ldrb r0, [r0, #0x1d]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L0807E788
	movs r0, #0x66
	bl m4aSongNumStart
	b .L0807E788
	.align 2, 0
.L0807E75C: .4byte gPlaySt
.L0807E760:
	mov r3, r8
	ldr r1, [r3]
	mov r0, sb
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq .L0807E788
	ldrb r1, [r5]
	adds r0, r1, r7
	ldrb r0, [r0]
	subs r0, #1
	strb r0, [r4]
	ldr r0, .L0807E7A8 @ =gPlaySt
	ldrb r0, [r0, #0x1d]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L0807E788
	movs r0, #0x66
	bl m4aSongNumStart
.L0807E788:
	ldrb r2, [r5]
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #1
	adds r0, #2
	ldrb r4, [r4]
	lsls r1, r4, #1
	adds r1, #9
	movs r2, #0xc
	bl PutUiEntryHover
	adds r3, r6, #0
	adds r3, #0x29
	str r3, [sp, #8]
	b .L0807EB1A
	.align 2, 0
.L0807E7A8: .4byte gPlaySt

@ KEY_DPAD_DOWN
.L0807E7AC:
	mov r4, r8
	ldr r1, [r4]
	movs r7, #0x80
	mov sb, r7
	mov r0, sb
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq .L0807E858
	adds r0, r6, #0
	adds r0, #0x2f
	ldrb r2, [r0]
	adds r7, r6, #0
	adds r7, #0x3b
	adds r1, r7, r2
	ldrb r1, [r1]
	adds r5, r0, #0
	cmp r1, #0
	beq .L0807E858
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #1
	adds r0, #2
	adds r4, r6, #0
	adds r4, #0x2e
	ldrb r2, [r4]
	lsls r1, r2, #1
	adds r1, #9
	movs r2, #0xc
	bl RemoveUiEntryHover
	ldrb r1, [r4]
	ldrb r3, [r5]
	adds r0, r3, r7
	ldrb r0, [r0]
	subs r0, #1
	cmp r1, r0
	bge .L0807E814
	adds r0, r1, #1
	strb r0, [r4]
	ldr r0, .L0807E810 @ =gPlaySt
	ldrb r0, [r0, #0x1d]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L0807E836
	movs r0, #0x66
	bl m4aSongNumStart
	b .L0807E836
	.align 2, 0
.L0807E810: .4byte gPlaySt
.L0807E814:
	mov r7, r8
	ldr r1, [r7]
	mov r0, sb
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq .L0807E836
	movs r0, #0
	strb r0, [r4]
	ldr r0, .L0807E854 @ =gPlaySt
	ldrb r0, [r0, #0x1d]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L0807E836
	movs r0, #0x66
	bl m4aSongNumStart
.L0807E836:
	ldrb r1, [r5]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #1
	adds r0, #2
	ldrb r4, [r4]
	lsls r1, r4, #1
	adds r1, #9
	movs r2, #0xc
	bl PutUiEntryHover
	adds r2, r6, #0
	adds r2, #0x29
	str r2, [sp, #8]
	b .L0807EB1A
	.align 2, 0
.L0807E854: .4byte gPlaySt

@ KEY_BUTTON_A
.L0807E858:
	mov r3, r8
	ldr r1, [r3]
	movs r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	adds r4, r6, #0
	adds r4, #0x29
	str r4, [sp, #8]
	cmp r0, #0
	bne .L0807E86E
	b .L0807EA22
.L0807E86E:
	ldrb r0, [r4]
	cmp r0, #0
	beq .L0807E876
	b .L0807EA22
.L0807E876:
	ldr r0, .L0807E8F8 @ =gPlaySt
	ldrb r0, [r0, #0x1d]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L0807E886
	movs r0, #0x6a
	bl m4aSongNumStart
.L0807E886:
	adds r0, r6, #0
	adds r0, #0x30
	ldrb r1, [r0]
	mov sb, r0
	cmp r1, #0xff
	bne .L0807E8FC

	adds r5, r6, #0
	adds r5, #0x2f
	ldrb r0, [r5]
	mov r7, sb
	strb r0, [r7]

	adds r4, r6, #0
	adds r4, #0x2e
	ldrb r0, [r4]
	adds r1, r6, #0
	adds r1, #0x31
	strb r0, [r1]

	ldrb r1, [r5]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #1
	adds r0, #2
	ldrb r2, [r4]
	lsls r1, r2, #1
	adds r1, #9
	movs r2, #0xc
	bl RemoveUiEntryHover

	ldrb r0, [r5]
	adds r0, #1
	movs r1, #1
	ands r0, r1
	strb r0, [r5]

	lsls r1, r0, #2
	adds r0, r6, #0
	adds r0, #0x54
	adds r0, r0, r1
	ldr r0, [r0]
	bl GetUnitItemCount
	cmp r0, #4
	bgt .L0807E8E6
	adds r0, r6, #0
	adds r0, #0x3b
	ldrb r3, [r5]
	adds r0, r3, r0
	ldrb r0, [r0]
	strb r0, [r4]
.L0807E8E6:
	ldrb r7, [r5]
	lsls r0, r7, #3
	adds r5, r7, #0
	subs r0, r0, r5
	lsls r0, r0, #1
	adds r0, #2
	ldrb r4, [r4]
	lsls r1, r4, #1
	b .L0807EAB2
	.align 2, 0
.L0807E8F8: .4byte gPlaySt
.L0807E8FC:
	adds r0, r6, #0
	adds r0, #0x4c
	ldrb r0, [r0]
	adds r5, r6, #0
	adds r5, #0x2f
	adds r4, r6, #0
	adds r4, #0x2e
	movs r1, #0x31
	adds r1, r1, r6
	mov sl, r1
	adds r7, r6, #0
	adds r7, #0x54
	cmp r0, #0
	beq .L0807E958
	mov r2, sb
	ldrb r2, [r2]
	lsls r0, r2, #2
	adds r0, r7, r0
	ldr r0, [r0]
	ldrb r1, [r1]
	ldrb r3, [r5]
	lsls r2, r3, #2
	adds r2, r7, r2
	ldr r2, [r2]
	ldrb r3, [r4]
	bl CheckValidLinkArenaItemSwap
	lsls r0, r0, #0x18
	cmp r0, #0
	bne .L0807E958
	ldrb r7, [r5]
	lsls r0, r7, #3
	adds r5, r7, #0
	subs r0, r0, r5
	lsls r0, r0, #4
	adds r0, #0x10
	ldrb r4, [r4]
	lsls r1, r4, #4
	adds r1, #0x48
	ldr r2, .L0807E954 @ =0x000006C2
	adds r3, r6, #0
	bl StartPrepErrorHelpbox
	b .L0807EB1A
	.align 2, 0
.L0807E954: .4byte 0x000006C2
.L0807E958:
	mov r1, sb @ unk30
	ldrb r1, [r1]
	lsls r0, r1, #2
	adds r0, r7, r0
	ldr r1, [r0]

	mov r8, sl
	mov r2, r8
	ldrb r2, [r2]
	lsls r0, r2, #1
	adds r1, #0x1c
	adds r1, r1, r0
	ldrh r3, [r1]
	mov ip, r3

	ldrb r2, [r5]
	lsls r0, r2, #2
	adds r0, r7, r0
	ldr r0, [r0]
	ldrb r3, [r4]
	lsls r2, r3, #1
	adds r0, #0x1c
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]

	ldrb r1, [r5]
	lsls r0, r1, #2
	adds r0, r7, r0
	ldr r0, [r0]
	ldrb r2, [r4]
	lsls r1, r2, #1
	adds r0, #0x1c
	adds r0, r0, r1
	mov r3, ip
	strh r3, [r0]

	ldrb r1, [r5]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #1
	adds r0, #2
	ldrb r2, [r4]
	lsls r1, r2, #1
	adds r1, #9
	movs r2, #0xc
	bl RemoveUiEntryHover
	ldr r0, [r6, #0x54]
	bl UnitRemoveInvalidItems
	ldr r0, [r6, #0x58]
	bl UnitRemoveInvalidItems
	ldr r1, [r6, #0x54]
	movs r0, #0
	bl func_fe6_0807D6C0
	ldr r1, [r6, #0x58]
	movs r0, #1
	bl func_fe6_0807D6C0
	mov r0, sb
	ldrb r3, [r0]
	lsls r0, r3, #2
	adds r0, r7, r0
	ldr r2, [r0]
	mov r7, r8
	ldrb r7, [r7]
	lsls r1, r7, #1
	adds r0, r2, #0
	adds r0, #0x1c
	adds r0, r0, r1
	ldrh r0, [r0]
	cmp r0, #0
	beq .L0807E9F0
	strb r3, [r5]
	mov r1, r8
	ldrb r0, [r1]
	b .L0807EA0A
.L0807E9F0:
	adds r0, r2, #0
	bl GetUnitItemCount
	cmp r0, #0
	ble .L0807EA08
	mov r2, sb @ unk30
	ldrb r0, [r2]
	strb r0, [r5] @ hand_disp_x
	mov r3, sl @ sel_action
	ldrb r0, [r3]
	subs r0, #1
	b .L0807EA0A
.L0807EA08:
	movs r0, #0
.L0807EA0A:
	strb r0, [r4]
	movs r0, #0xff
	mov r7, sb
	strb r0, [r7]
	ldrb r1, [r5]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #1
	adds r0, #2
	ldrb r4, [r4]
	lsls r1, r4, #1
	b .L0807EAB2
.L0807EA22:
	mov r2, r8
	ldr r0, [r2]
	ldrh r1, [r0, #8]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq .L0807EABC
	ldr r0, .L0807EA60 @ =gPlaySt
	ldrb r0, [r0, #0x1d]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L0807EA40
	movs r0, #0x6b
	bl m4aSongNumStart
.L0807EA40:
	adds r7, r6, #0
	adds r7, #0x30
	ldrb r0, [r7]
	cmp r0, #0xff
	bne .L0807EA76
	adds r0, r6, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	cmp r0, #0
	bne .L0807EA64
	adds r0, r6, #0
	movs r1, #7
	bl Proc_Goto
	b .L0807EB1A
	.align 2, 0
.L0807EA60: .4byte gPlaySt
.L0807EA64:
	adds r0, r6, #0
	movs r1, #1
	bl NewSallyCir2
	adds r0, r6, #0
	movs r1, #6
	bl Proc_Goto
	b .L0807EB1A
.L0807EA76:
	adds r4, r6, #0
	adds r4, #0x2f
	ldrb r3, [r4]
	lsls r0, r3, #3
	subs r0, r0, r3
	lsls r0, r0, #1
	adds r0, #2
	adds r5, r6, #0
	adds r5, #0x2e
	ldrb r2, [r5]
	lsls r1, r2, #1
	adds r1, #9
	movs r2, #0xc
	bl RemoveUiEntryHover
	ldrb r0, [r7]
	strb r0, [r4]

	adds r0, r6, #0
	adds r0, #0x31
	ldrb r0, [r0]
	strb r0, [r5]

	movs r0, #0xff
	strb r0, [r7]

	ldrb r3, [r4]
	lsls r0, r3, #3
	subs r0, r0, r3
	lsls r0, r0, #1
	adds r0, #2
	ldrb r5, [r5]
	lsls r1, r5, #1
.L0807EAB2:
	adds r1, #9
	movs r2, #0xc
	bl PutUiEntryHover
	b .L0807EB1A
.L0807EABC:
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq .L0807EB1A
	ldr r4, [sp, #8]
	ldrb r0, [r4]
	cmp r0, #0
	bne .L0807EB1A

	adds r3, r6, #0
	adds r3, #0x2f
	ldrb r7, [r3]
	lsls r0, r7, #2
	adds r5, r6, #0
	adds r5, #0x54
	adds r0, r5, r0
	ldr r0, [r0]
	adds r2, r6, #0
	adds r2, #0x2e
	ldrb r4, [r2]
	lsls r1, r4, #1
	adds r0, #0x1c
	adds r0, r0, r1
	ldrh r0, [r0]
	adds r4, r2, #0
	cmp r0, #0
	beq .L0807EB1A
	movs r0, #2
	ldr r7, [sp, #8]
	strb r0, [r7]

	ldrb r2, [r3]
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #4
	adds r0, #0x10
	ldrb r3, [r4]
	lsls r1, r3, #4
	adds r1, #0x48
	lsls r2, r2, #2
	adds r2, r5, r2
	ldr r2, [r2]
	lsls r3, r3, #1
	adds r2, #0x1c
	adds r2, r2, r3
	ldrh r2, [r2]
	bl StartItemHelpBox
.L0807EB1A:
	ldr r0, [sp, #8]
	ldrb r0, [r0]
	cmp r0, #2
	bne .L0807EB60
	adds r0, r6, #0
	adds r0, #0x2f
	adds r4, r6, #0
	adds r4, #0x2e
	ldr r1, [sp]
	ldrb r2, [r0]
	cmp r1, r2
	bne .L0807EB3A
	ldr r3, [sp, #4]
	ldrb r7, [r4]
	cmp r3, r7
	beq .L0807EB60
.L0807EB3A:
	ldrb r3, [r0]
	lsls r0, r3, #3
	subs r0, r0, r3
	lsls r0, r0, #4
	adds r0, #0x10
	ldrb r4, [r4]
	lsls r1, r4, #4
	adds r1, #0x48
	lsls r3, r3, #2
	adds r2, r6, #0
	adds r2, #0x54
	adds r2, r2, r3
	ldr r2, [r2]
	lsls r4, r4, #1
	adds r2, #0x1c
	adds r2, r2, r4
	ldrh r2, [r2]
	bl StartItemHelpBox
.L0807EB60:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
