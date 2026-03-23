	.include "macro.inc"

	.syntax unified

	thumb_func_start PrepSubItem_0807E5A8
PrepSubItem_0807E5A8: @ 0x0807E5A8
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

	thumb_func_start PrepSubItem_StartViewAllScreen
PrepSubItem_StartViewAllScreen: @ 0x0807EB70
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x34
	adds r6, r0, #0
	bl GetSupplyItems
	mov sl, r0
	movs r4, #0
	str r4, [sp]
	movs r0, #0xf
	movs r1, #4
	movs r2, #0xf
	movs r3, #0x10
	bl PutUiWindowFrame
	ldr r0, .L0807ED78 @ =gPrep_Unk_02016368
	strh r4, [r0]
	movs r4, #1
.L0807EB9A:
	adds r0, r4, #0
	bl GetUnit
	adds r5, r0, #0
	adds r4, #1
	mov sb, r4
	adds r0, r6, #0
	adds r0, #0x46
	str r0, [sp, #0x28]
	adds r1, r6, #0
	adds r1, #0x4e
	str r1, [sp, #0x30]
	movs r2, #0x50
	adds r2, r2, r6
	mov r8, r2
	adds r3, r6, #0
	adds r3, #0x47
	str r3, [sp, #0x2c]
	adds r4, r6, #0
	adds r4, #0x2e
	str r4, [sp, #0x14]
	adds r7, r6, #0
	adds r7, #0x45
	str r7, [sp, #0x24]
	subs r0, #0x17
	str r0, [sp, #0x18]
	subs r1, #0x1e
	str r1, [sp, #0x1c]
	adds r2, r6, #0
	adds r2, #0x31
	str r2, [sp, #0x20]
	subs r3, #0x1b
	str r3, [sp, #0xc]
	subs r4, #1
	str r4, [sp, #0x10]
	cmp r5, #0
	beq .L0807EC46
	ldr r0, [r5]
	cmp r0, #0
	beq .L0807EC46
	movs r0, #4
	ldrh r7, [r5, #0xc]
	ands r0, r7
	cmp r0, #0
	bne .L0807EC46
	ldr r0, [r6, #0x54]
	cmp r5, r0
	beq .L0807EC46
	adds r0, r5, #0
	bl GetUnitItemCount
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	movs r3, #0
	cmp r3, r2
	bhs .L0807EC46
	ldr r7, .L0807ED7C @ =gPrepItemlData
	ldr r4, .L0807ED78 @ =gPrep_Unk_02016368
	movs r0, #0x1c
	adds r0, r0, r5
	mov ip, r0
.L0807EC14:
	ldrh r0, [r4]
	lsls r1, r0, #2
	adds r1, r1, r7
	ldr r0, [r5]
	ldrb r0, [r0, #4]
	strb r0, [r1]
	ldrh r0, [r4]
	lsls r1, r0, #2
	adds r1, r1, r7
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1, #2]
	ldrh r1, [r4]
	lsls r0, r1, #2
	adds r0, r0, r7
	strb r3, [r0, #1]
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, r2
	blo .L0807EC14
.L0807EC46:
	mov r4, sb
	cmp r4, #0x3f
	ble .L0807EB9A
	ldr r1, .L0807ED78 @ =gPrep_Unk_02016368
	ldrh r4, [r1]
	movs r2, #0
	mov r3, sl
	ldrh r0, [r3]
	cmp r0, #0
	beq .L0807EC8C
	ldr r7, .L0807ED7C @ =gPrepItemlData
	movs r5, #0
	adds r3, r1, #0
.L0807EC60:
	adds r1, r2, r4
	lsls r1, r1, #2
	adds r1, r1, r7
	lsls r0, r2, #1
	add r0, sl
	ldrh r0, [r0]
	strh r0, [r1, #2]
	strb r5, [r1]
	strb r2, [r1, #1]
	ldrh r0, [r3]
	adds r0, #1
	strh r0, [r3]
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0x63
	bhi .L0807EC8C
	lsls r0, r2, #1
	add r0, sl
	ldrh r0, [r0]
	cmp r0, #0
	bne .L0807EC60
.L0807EC8C:
	ldr r0, [r6, #0x14]
	adds r0, #0x39
	ldrb r0, [r0]
	movs r4, #0
	ldr r7, [sp, #0x28]
	strb r0, [r7]
	ldrb r0, [r7]
	bl func_fe6_0807D834
	ldr r1, [sp, #0x30]
	ldrh r0, [r1]
	movs r5, #0
	mov r2, r8
	strh r0, [r2]
	ldr r3, [sp, #0x2c]
	ldrb r0, [r3]
	ldr r7, [sp, #0x14]
	strb r0, [r7]
	ldr r0, [sp, #0x14]
	mov r1, r8
	bl func_fe6_080823A0
	ldr r0, .L0807ED80 @ =gPrepTexts2
	ldr r2, [r6, #0x54]
	mov r1, r8
	ldrh r1, [r1]
	lsrs r3, r1, #4
	str r4, [sp]
	movs r1, #1
	bl func_fe6_0807D9E4
	adds r0, r6, #0
	bl func_fe6_0807D358
	ldr r2, [sp, #0x24]
	strb r5, [r2]
	movs r0, #1
	ldr r3, [sp, #0x18]
	strb r0, [r3]
	movs r0, #0xff
	ldr r4, [sp, #0x1c]
	ldrb r1, [r4]
	orrs r1, r0
	strb r1, [r4]
	ldr r7, [sp, #0x20]
	ldrb r7, [r7]
	orrs r0, r7
	ldr r1, [sp, #0x20]
	strb r0, [r1]
	ldr r0, .L0807ED84 @ =gPrepTexts3 + 0x8
	ldr r2, .L0807ED7C @ =gPrepItemlData
	mov r3, r8
	ldrh r3, [r3]
	lsrs r1, r3, #4
	ldr r4, [sp, #0x14]
	ldrb r4, [r4]
	adds r1, r4, r1
	lsls r1, r1, #2
	adds r1, r1, r2
	ldrb r1, [r1]
	movs r2, #0x18
	movs r3, #0
	bl func_fe6_0807DCB8
	ldr r7, [sp, #0x18]
	ldrb r2, [r7]
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #1
	adds r0, #2
	ldr r3, [sp, #0x14]
	ldrb r3, [r3]
	lsls r1, r3, #1
	lsls r2, r2, #2
	subs r2, #9
	subs r1, r1, r2
	movs r2, #0xc
	bl PutUiEntryHover
	ldr r4, [sp, #0x24]
	ldrb r1, [r4]
	mov r7, r8
	ldrh r2, [r7]
	subs r2, #0x28
	movs r0, #0xff
	ands r2, r0
	movs r0, #2
	bl SetBgOffset
	ldr r0, [r6, #0x60]
	ldrh r1, [r7]
	str r1, [sp]
	ldr r1, .L0807ED88 @ =gPrep_Unk_0201636A
	ldrh r1, [r1]
	str r1, [sp, #4]
	movs r1, #7
	str r1, [sp, #8]
	movs r1, #0xe0
	movs r2, #0x34
	movs r3, #0xb
	bl SetPrepMenuScrollBarBaseInfo
	movs r0, #0xf
	bl EnableBgSync
	ldr r0, [sp, #0xc]
	strb r5, [r0]
	ldr r1, [sp, #0x10]
	ldrb r0, [r1]
	cmp r0, #0
	bne .L0807ED8C
	movs r1, #1
	rsbs r1, r1, #0
	adds r0, r6, #0
	bl NewSallyCir2
	b .L0807ED96
	.align 2, 0
.L0807ED78: .4byte gPrep_Unk_02016368
.L0807ED7C: .4byte gPrepItemlData
.L0807ED80: .4byte gPrepTexts2
.L0807ED84: .4byte gPrepTexts3 + 0x8
.L0807ED88: .4byte gPrep_Unk_0201636A
.L0807ED8C:
	cmp r0, #1
	bne .L0807ED96
	ldr r0, [r6, #0x5c]
	bl Proc_End
.L0807ED96:
	adds r0, r6, #0
	bl func_fe6_0807D16C
	str r0, [r6, #0x5c]
	movs r0, #1
	bl func_fe6_0807E06C
	movs r0, #3
	ldr r2, [sp, #0x10]
	strb r0, [r2]
	add sp, #0x34
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_fe6_0807EDBC
func_fe6_0807EDBC: @ 0x0807EDBC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	mov r8, r0
	adds r0, #0x46
	ldrb r0, [r0]
	str r0, [sp, #4]
	mov r1, r8
	adds r1, #0x2e
	mov r0, r8
	adds r0, #0x50
	ldrh r0, [r0]
	lsrs r0, r0, #4
	ldrb r1, [r1]
	adds r1, r1, r0
	str r1, [sp, #8]
	mov r4, r8
	adds r4, #0x29
	ldrb r2, [r4]
	cmp r2, #0
	beq .L0807EE14
	ldr r0, .L0807EE0C @ =gKeySt
	ldr r1, [r0]
	movs r0, #0x81
	lsls r0, r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq .L0807EE14
	cmp r2, #1
	beq .L0807EE10
	bl CloseHelpBox
	movs r0, #0
	strb r0, [r4]
	bl .L0807FBD8
	.align 2, 0
.L0807EE0C: .4byte gKeySt
.L0807EE10:
	movs r0, #0
	strb r0, [r4]
.L0807EE14:
	mov r0, r8
	adds r0, #0x2c
	ldrb r1, [r0]
	mov sb, r0
	cmp r1, #0x64
	bls .L0807EE24
	bl .L0807FA9A
.L0807EE24:
	lsls r0, r1, #2
	ldr r1, .L0807EE30 @ =.L0807EE34
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
.L0807EE30: .4byte .L0807EE34
.L0807EE34: @ jump table
	.4byte .L0807F2FE @ case 0
	.4byte .L0807F7FC @ case 1
	.4byte .L0807F844 @ case 2
	.4byte .L0807FA9A @ case 3
	.4byte .L0807FA9A @ case 4
	.4byte .L0807F88C @ case 5
	.4byte .L0807F8A4 @ case 6
	.4byte .L0807F970 @ case 7
	.4byte .L0807FA9A @ case 8
	.4byte .L0807FA9A @ case 9
	.4byte .L0807F97A @ case 10
	.4byte .L0807F996 @ case 11
	.4byte .L0807FA84 @ case 12
	.4byte .L0807FA9A @ case 13
	.4byte .L0807FA9A @ case 14
	.4byte .L0807FA9A @ case 15
	.4byte .L0807FA9A @ case 16
	.4byte .L0807FA9A @ case 17
	.4byte .L0807FA9A @ case 18
	.4byte .L0807FA9A @ case 19
	.4byte .L0807FA9A @ case 20
	.4byte .L0807FA9A @ case 21
	.4byte .L0807FA9A @ case 22
	.4byte .L0807FA9A @ case 23
	.4byte .L0807FA9A @ case 24
	.4byte .L0807FA9A @ case 25
	.4byte .L0807FA9A @ case 26
	.4byte .L0807FA9A @ case 27
	.4byte .L0807FA9A @ case 28
	.4byte .L0807FA9A @ case 29
	.4byte .L0807FA9A @ case 30
	.4byte .L0807FA9A @ case 31
	.4byte .L0807FA9A @ case 32
	.4byte .L0807FA9A @ case 33
	.4byte .L0807FA9A @ case 34
	.4byte .L0807FA9A @ case 35
	.4byte .L0807FA9A @ case 36
	.4byte .L0807FA9A @ case 37
	.4byte .L0807FA9A @ case 38
	.4byte .L0807FA9A @ case 39
	.4byte .L0807FA9A @ case 40
	.4byte .L0807FA9A @ case 41
	.4byte .L0807FA9A @ case 42
	.4byte .L0807FA9A @ case 43
	.4byte .L0807FA9A @ case 44
	.4byte .L0807FA9A @ case 45
	.4byte .L0807FA9A @ case 46
	.4byte .L0807FA9A @ case 47
	.4byte .L0807FA9A @ case 48
	.4byte .L0807FA9A @ case 49
	.4byte .L0807FA9A @ case 50
	.4byte .L0807FA9A @ case 51
	.4byte .L0807FA9A @ case 52
	.4byte .L0807FA9A @ case 53
	.4byte .L0807FA9A @ case 54
	.4byte .L0807FA9A @ case 55
	.4byte .L0807FA9A @ case 56
	.4byte .L0807FA9A @ case 57
	.4byte .L0807FA9A @ case 58
	.4byte .L0807FA9A @ case 59
	.4byte .L0807FA9A @ case 60
	.4byte .L0807FA9A @ case 61
	.4byte .L0807FA9A @ case 62
	.4byte .L0807FA9A @ case 63
	.4byte .L0807FA9A @ case 64
	.4byte .L0807FA9A @ case 65
	.4byte .L0807FA9A @ case 66
	.4byte .L0807FA9A @ case 67
	.4byte .L0807FA9A @ case 68
	.4byte .L0807FA9A @ case 69
	.4byte .L0807FA9A @ case 70
	.4byte .L0807FA9A @ case 71
	.4byte .L0807FA9A @ case 72
	.4byte .L0807FA9A @ case 73
	.4byte .L0807FA9A @ case 74
	.4byte .L0807FA9A @ case 75
	.4byte .L0807FA9A @ case 76
	.4byte .L0807FA9A @ case 77
	.4byte .L0807FA9A @ case 78
	.4byte .L0807FA9A @ case 79
	.4byte .L0807FA9A @ case 80
	.4byte .L0807FA9A @ case 81
	.4byte .L0807FA9A @ case 82
	.4byte .L0807FA9A @ case 83
	.4byte .L0807FA9A @ case 84
	.4byte .L0807FA9A @ case 85
	.4byte .L0807FA9A @ case 86
	.4byte .L0807FA9A @ case 87
	.4byte .L0807FA9A @ case 88
	.4byte .L0807FA9A @ case 89
	.4byte .L0807FA9A @ case 90
	.4byte .L0807FA9A @ case 91
	.4byte .L0807FA9A @ case 92
	.4byte .L0807FA9A @ case 93
	.4byte .L0807FA9A @ case 94
	.4byte .L0807FA9A @ case 95
	.4byte .L0807FA9A @ case 96
	.4byte .L0807FA9A @ case 97
	.4byte .L0807FA9A @ case 98
	.4byte .L0807FA9A @ case 99
	.4byte .L0807EFC8 @ case 100
.L0807EFC8:
	mov r1, r8
	ldr r0, [r1, #0x54]
	bl GetUnitItemCount
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	mov r0, r8
	adds r0, #0x29
	ldrb r1, [r0]
	adds r3, r0, #0
	cmp r1, #0
	bne .L0807EFEA
	cmp r7, #4
	bhi .L0807EFEA
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
.L0807EFEA:
	ldr r2, .L0807F054 @ =gKeySt
	ldr r1, [r2]
	movs r4, #0x40
	mov sl, r4
	mov r0, sl
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq .L0807F078
	cmp r7, #1
	bls .L0807F078
	mov r5, r8
	adds r5, #0x2f
	ldrb r2, [r5]
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #1
	adds r0, #2
	mov r4, r8
	adds r4, #0x2e
	ldrb r3, [r4]
	lsls r1, r3, #1
	lsls r2, r2, #2
	subs r2, #9
	subs r1, r1, r2
	movs r2, #0xc
	bl RemoveUiEntryHover
	ldrb r0, [r4]
	adds r6, r4, #0
	adds r4, r5, #0
	cmp r0, #0
	bne .L0807F05C
	ldr r0, .L0807F054 @ =gKeySt
	ldr r1, [r0]
	mov r0, sl
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	bne .L0807F03C
	b .L0807F5A6
.L0807F03C:
	subs r0, r7, #1
.L0807F03E:
	strb r0, [r6]
	ldr r0, .L0807F058 @ =gPlaySt
	ldrb r0, [r0, #0x1d]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge .L0807F04C
	b .L0807F5A6
.L0807F04C:
	movs r0, #0x66
	bl m4aSongNumStart
	b .L0807F5A6
	.align 2, 0
.L0807F054: .4byte gKeySt
.L0807F058: .4byte gPlaySt
.L0807F05C:
	subs r0, #1
	strb r0, [r6]
	ldr r0, .L0807F074 @ =gPlaySt
	ldrb r0, [r0, #0x1d]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge .L0807F06C
	b .L0807F5A6
.L0807F06C:
	movs r0, #0x66
	bl m4aSongNumStart
	b .L0807F5A6
	.align 2, 0
.L0807F074: .4byte gPlaySt
.L0807F078:
	ldr r2, .L0807F0C0 @ =gKeySt
	ldr r1, [r2]
	movs r4, #0x80
	mov sl, r4
	mov r0, sl
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq .L0807F0F4
	cmp r7, #1
	bls .L0807F0F4
	mov r5, r8
	adds r5, #0x2f
	ldrb r2, [r5]
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #1
	adds r0, #2
	mov r4, r8
	adds r4, #0x2e
	ldrb r3, [r4]
	lsls r1, r3, #1
	lsls r2, r2, #2
	subs r2, #9
	subs r1, r1, r2
	movs r2, #0xc
	bl RemoveUiEntryHover
	ldrb r1, [r4]
	subs r0, r7, #1
	adds r6, r4, #0
	adds r4, r5, #0
	cmp r1, r0
	bge .L0807F0C4
	adds r0, r1, #1
	b .L0807F03E
	.align 2, 0
.L0807F0C0: .4byte gKeySt
.L0807F0C4:
	ldr r0, .L0807F0EC @ =gKeySt
	ldr r1, [r0]
	mov r0, sl
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	bne .L0807F0D4
	b .L0807F5A6
.L0807F0D4:
	movs r0, #0
	strb r0, [r6]
	ldr r0, .L0807F0F0 @ =gPlaySt
	ldrb r0, [r0, #0x1d]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge .L0807F0E4
	b .L0807F5A6
.L0807F0E4:
	movs r0, #0x66
	bl m4aSongNumStart
	b .L0807F5A6
	.align 2, 0
.L0807F0EC: .4byte gKeySt
.L0807F0F0: .4byte gPlaySt
.L0807F0F4:
	ldr r2, .L0807F164 @ =gKeySt
	ldr r1, [r2]
	movs r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	bne .L0807F104
	b .L0807F230
.L0807F104:
	ldrb r0, [r3]
	cmp r0, #0
	beq .L0807F10C
	b .L0807F230
.L0807F10C:
	mov r0, r8
	adds r0, #0x4c
	ldrb r0, [r0]
	mov r6, r8
	adds r6, #0x2e
	mov r5, r8
	adds r5, #0x31
	cmp r0, #0
	beq .L0807F170
	mov r3, r8
	ldr r0, [r3, #0x54]
	ldrb r1, [r6]
	ldr r3, .L0807F168 @ =gPrepItemlData
	mov r2, r8
	adds r2, #0x50
	ldrh r2, [r2]
	lsrs r2, r2, #4
	ldrb r4, [r5]
	adds r2, r4, r2
	lsls r2, r2, #2
	adds r2, r2, r3
	ldrh r2, [r2, #2]
	bl CheckValidLinkArenaItemSupply
	lsls r0, r0, #0x18
	cmp r0, #0
	bne .L0807F170
	mov r1, r8
	adds r1, #0x2f
	ldrb r2, [r1]
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #4
	adds r0, #0x10
	ldrb r6, [r6]
	lsls r1, r6, #4
	adds r1, #0x48
	ldr r2, .L0807F16C @ =0x000006C2
	mov r3, r8
	bl StartPrepErrorHelpbox
	bl .L0807FA9A
	.align 2, 0
.L0807F164: .4byte gKeySt
.L0807F168: .4byte gPrepItemlData
.L0807F16C: .4byte 0x000006C2
.L0807F170:
	ldr r0, .L0807F220 @ =gPlaySt
	ldrb r0, [r0, #0x1d]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L0807F180
	movs r0, #0x6a
	bl m4aSongNumStart
.L0807F180:
	mov r3, r8
	ldr r0, [r3, #0x54]
	ldrb r1, [r6]
	mov r4, r8
	adds r4, #0x50
	ldrh r3, [r4]
	lsrs r2, r3, #4
	ldrb r3, [r5]
	adds r2, r3, r2
	bl func_fe6_0807DF60
	mov r7, r8
	adds r7, #0x2f
	ldrb r2, [r7]
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #1
	adds r0, #2
	ldrb r3, [r6]
	lsls r1, r3, #1
	lsls r2, r2, #2
	subs r2, #9
	subs r1, r1, r2
	movs r2, #0xc
	bl RemoveUiEntryHover
	ldrb r0, [r5]
	movs r5, #0
	strb r0, [r6]
	movs r0, #1
	strb r0, [r7]
	adds r0, r6, #0
	adds r1, r4, #0
	bl func_fe6_080823A0
	mov r0, r8
	ldr r1, [r0, #0x54]
	movs r0, #0
	bl func_fe6_0807D6C0
	ldr r0, .L0807F224 @ =gPrepTexts2
	mov r1, r8
	ldr r2, [r1, #0x54]
	ldrh r1, [r4]
	lsrs r3, r1, #4
	str r5, [sp]
	movs r1, #1
	bl func_fe6_0807D9E4
	ldr r0, .L0807F228 @ =gPrepTexts3 + 0x8
	ldr r2, .L0807F22C @ =gPrepItemlData
	ldrh r4, [r4]
	lsrs r1, r4, #4
	ldrb r3, [r6]
	adds r1, r3, r1
	lsls r1, r1, #2
	adds r1, r1, r2
	ldrb r1, [r1]
	movs r2, #0x18
	movs r3, #0
	bl func_fe6_0807DCB8
	ldrb r2, [r7]
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #1
	adds r0, #2
	ldrb r6, [r6]
	lsls r1, r6, #1
	lsls r2, r2, #2
	subs r2, #9
	subs r1, r1, r2
	movs r2, #0xc
	bl PutUiEntryHover
	mov r4, sb
	strb r5, [r4]
	bl .L0807FA9A
	.align 2, 0
.L0807F220: .4byte gPlaySt
.L0807F224: .4byte gPrepTexts2
.L0807F228: .4byte gPrepTexts3 + 0x8
.L0807F22C: .4byte gPrepItemlData
.L0807F230:
	ldr r1, .L0807F294 @ =gKeySt
	ldr r0, [r1]
	ldrh r1, [r0, #8]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq .L0807F29C
	ldr r0, .L0807F298 @ =gPlaySt
	ldrb r0, [r0, #0x1d]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L0807F24E
	movs r0, #0x6b
	bl m4aSongNumStart
.L0807F24E:
	mov r5, r8
	adds r5, #0x2f
	ldrb r2, [r5]
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #1
	adds r0, #2
	mov r4, r8
	adds r4, #0x2e
	ldrb r3, [r4]
	lsls r1, r3, #1
	lsls r2, r2, #2
	subs r2, #9
	subs r1, r1, r2
	movs r2, #0xc
	bl RemoveUiEntryHover
	mov r0, r8
	adds r0, #0x31
	ldrb r0, [r0]
	movs r1, #0
	strb r0, [r4]
	movs r0, #1
	strb r0, [r5]
	mov r0, sb
	strb r1, [r0]
	ldrb r2, [r5]
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #1
	adds r0, #2
	ldrb r4, [r4]
	lsls r1, r4, #1
	b .L0807F5B4
	.align 2, 0
.L0807F294: .4byte gKeySt
.L0807F298: .4byte gPlaySt
.L0807F29C:
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	bne .L0807F2AA
	bl .L0807FA9A
.L0807F2AA:
	mov r2, r8
	adds r2, #0x29
	ldrb r0, [r2]
	cmp r0, #0
	beq .L0807F2B8
	bl .L0807FA9A
.L0807F2B8:
	mov r1, r8
	ldr r0, [r1, #0x54]
	mov r3, r8
	adds r3, #0x2e
	ldrb r4, [r3]
	lsls r1, r4, #1
	adds r0, #0x1c
	adds r0, r0, r1
	ldrh r0, [r0]
	cmp r0, #0
	bne .L0807F2D0
	b .L0807FA9A
.L0807F2D0:
	movs r0, #2
	strb r0, [r2]
	mov r0, r8
	adds r0, #0x2f
	ldrb r2, [r0]
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #4
	adds r0, #0x10
	ldrb r3, [r3]
	lsls r1, r3, #4
	lsls r2, r2, #5
	subs r2, #0x48
	subs r1, r1, r2
	mov r4, r8
	ldr r2, [r4, #0x54]
	lsls r3, r3, #1
	adds r2, #0x1c
	adds r2, r2, r3
	ldrh r2, [r2]
	bl StartItemHelpBox
	b .L0807FA9A
.L0807F2FE:
	ldr r2, .L0807F318 @ =gKeySt
	ldr r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #2
	ldrh r1, [r1, #4]
	ands r0, r1
	cmp r0, #0
	beq .L0807F31C
	mov r1, r8
	adds r1, #0x4a
	movs r0, #2
	b .L0807F322
	.align 2, 0
.L0807F318: .4byte gKeySt
.L0807F31C:
	mov r1, r8
	adds r1, #0x4a
	movs r0, #1
.L0807F322:
	strb r0, [r1]
	adds r7, r1, #0
	ldr r0, .L0807F358 @ =gKeySt
	ldr r1, [r0]
	movs r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq .L0807F410
	mov r0, r8
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #0
	bne .L0807F410
	ldr r0, .L0807F35C @ =gPrep_Unk_0201636A
	ldrh r0, [r0]
	cmp r0, #0
	bne .L0807F364
	ldr r0, .L0807F360 @ =gPlaySt
	ldrb r0, [r0, #0x1d]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L0807F410
	movs r0, #0x6c
	bl m4aSongNumStart
	b .L0807F410
	.align 2, 0
.L0807F358: .4byte gKeySt
.L0807F35C: .4byte gPrep_Unk_0201636A
.L0807F360: .4byte gPlaySt
.L0807F364:
	ldr r2, .L0807F3D8 @ =gPrepItemlData
	mov r1, r8
	adds r1, #0x2e
	mov r0, r8
	adds r0, #0x50
	ldrh r0, [r0]
	lsrs r0, r0, #4
	ldrb r3, [r1]
	adds r0, r3, r0
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r5, [r0]
	adds r6, r1, #0
	cmp r5, #0
	bne .L0807F3F0
	ldr r0, .L0807F3DC @ =gPlaySt
	ldrb r0, [r0, #0x1d]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L0807F392
	movs r0, #0x6a
	bl m4aSongNumStart
.L0807F392:
	movs r0, #0x64
	mov r4, sb
	strb r0, [r4]
	ldrb r0, [r6]
	mov r1, r8
	adds r1, #0x31
	strb r0, [r1]
	mov r4, r8
	adds r4, #0x2f
	ldrb r2, [r4]
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #1
	adds r0, #2
	ldrb r3, [r6]
	lsls r1, r3, #1
	lsls r2, r2, #2
	subs r2, #9
	subs r1, r1, r2
	movs r2, #0xc
	bl RemoveUiEntryHover
	mov r1, r8
	ldr r0, [r1, #0x54]
	bl GetUnitItemCount
	cmp r0, #4
	bgt .L0807F3E0
	mov r2, r8
	ldr r0, [r2, #0x54]
	bl GetUnitItemCount
	strb r0, [r6]
	b .L0807F3E2
	.align 2, 0
.L0807F3D8: .4byte gPrepItemlData
.L0807F3DC: .4byte gPlaySt
.L0807F3E0:
	strb r5, [r6]
.L0807F3E2:
	movs r0, #0
	strb r0, [r4]
	ldrb r6, [r6]
	lsls r1, r6, #1
	adds r1, #9
	movs r0, #2
	b .L0807F5BA
.L0807F3F0:
	ldr r0, .L0807F40C @ =gPlaySt
	ldrb r0, [r0, #0x1d]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L0807F400
	movs r0, #0x6a
	bl m4aSongNumStart
.L0807F400:
	mov r0, r8
	movs r1, #7
	bl Proc_Goto
	b .L0807FA9A
	.align 2, 0
.L0807F40C: .4byte gPlaySt
.L0807F410:
	ldr r1, .L0807F440 @ =gKeySt
	ldr r0, [r1]
	ldrh r3, [r0, #8]
	movs r0, #2
	ands r0, r3
	cmp r0, #0
	beq .L0807F448
	ldr r0, .L0807F444 @ =gPlaySt
	ldrb r0, [r0, #0x1d]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L0807F42E
	movs r0, #0x6b
	bl m4aSongNumStart
.L0807F42E:
	mov r0, r8
	movs r1, #1
	bl NewSallyCir2
	mov r0, r8
	movs r1, #6
	bl Proc_Goto
	b .L0807FBD8
	.align 2, 0
.L0807F440: .4byte gKeySt
.L0807F444: .4byte gPlaySt
.L0807F448:
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r3
	cmp r0, #0
	beq .L0807F4A4
	mov r1, r8
	adds r1, #0x29
	ldrb r0, [r1]
	cmp r0, #0
	bne .L0807F4A4
	ldr r0, .L0807F49C @ =gPrep_Unk_0201636A
	ldrh r0, [r0]
	cmp r0, #0
	bne .L0807F466
	b .L0807FA9A
.L0807F466:
	movs r0, #2
	strb r0, [r1]
	mov r0, r8
	adds r0, #0x2f
	ldrb r3, [r0]
	lsls r0, r3, #3
	subs r0, r0, r3
	lsls r0, r0, #4
	adds r0, #0x10
	adds r1, #5
	ldrb r2, [r1]
	lsls r1, r2, #4
	lsls r3, r3, #5
	subs r3, #0x48
	subs r1, r1, r3
	ldr r4, .L0807F4A0 @ =gPrepItemlData
	mov r3, r8
	adds r3, #0x50
	ldrh r3, [r3]
	lsrs r3, r3, #4
	adds r2, r2, r3
	lsls r2, r2, #2
	adds r2, r2, r4
	ldrh r2, [r2, #2]
	bl StartItemHelpBox
	b .L0807FA9A
	.align 2, 0
.L0807F49C: .4byte gPrep_Unk_0201636A
.L0807F4A0: .4byte gPrepItemlData
.L0807F4A4:
	ldr r3, .L0807F548 @ =gKeySt
	ldr r1, [r3]
	movs r2, #0x40
	adds r0, r2, #0
	ldrh r4, [r1, #6]
	ands r0, r4
	cmp r0, #0
	bne .L0807F4C8
	adds r0, r2, #0
	ldrh r1, [r1, #0x10]
	ands r0, r1
	cmp r0, #0
	bne .L0807F4C0
	b .L0807F5CC
.L0807F4C0:
	ldrb r0, [r7]
	cmp r0, #2
	beq .L0807F4C8
	b .L0807F5CC
.L0807F4C8:
	mov r0, r8
	adds r0, #0x2e
	ldrb r1, [r0]
	adds r6, r0, #0
	cmp r1, #0
	beq .L0807F5CC
	ldr r0, .L0807F54C @ =gPlaySt
	ldrb r0, [r0, #0x1d]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L0807F4E4
	movs r0, #0x66
	bl m4aSongNumStart
.L0807F4E4:
	ldrb r4, [r6]
	cmp r4, #1
	bne .L0807F55C
	mov r5, r8
	adds r5, #0x50
	ldrh r0, [r5]
	cmp r0, #0
	beq .L0807F55C
	ldr r0, .L0807F550 @ =gPrepTexts2
	ldrh r1, [r5]
	lsrs r2, r1, #4
	subs r2, #1
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov r1, r8
	ldr r3, [r1, #0x54]
	movs r1, #0
	str r1, [sp]
	movs r1, #1
	bl func_fe6_0807DB80
	mov r0, r8
	bl func_fe6_0807D358
	ldr r1, .L0807F554 @ =gPrepItemlData
	ldrh r2, [r5]
	lsrs r0, r2, #4
	ldrb r6, [r6]
	adds r0, r6, r0
	subs r0, #1
	lsls r0, r0, #2
	adds r1, r0, r1
	movs r3, #0xff
	ldrb r0, [r1]
	cmp r3, r0
	beq .L0807F538
	ldr r0, .L0807F558 @ =gPrepTexts3 + 0x8
	ldrb r1, [r1]
	movs r2, #0x18
	movs r3, #0
	bl func_fe6_0807DCB8
.L0807F538:
	ldrb r7, [r7]
	lsls r0, r7, #2
	ldrh r1, [r5]
	subs r0, r1, r0
	strh r0, [r5]
	mov r2, sb
	strb r4, [r2]
	b .L0807FA9A
	.align 2, 0
.L0807F548: .4byte gKeySt
.L0807F54C: .4byte gPlaySt
.L0807F550: .4byte gPrepTexts2
.L0807F554: .4byte gPrepItemlData
.L0807F558: .4byte gPrepTexts3 + 0x8
.L0807F55C:
	mov r4, r8
	adds r4, #0x2f
	ldrb r2, [r4]
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #1
	adds r0, #2
	ldrb r3, [r6]
	lsls r1, r3, #1
	lsls r2, r2, #2
	subs r2, #9
	subs r1, r1, r2
	movs r2, #0xc
	bl RemoveUiEntryHover
	ldrb r0, [r6]
	subs r0, #1
	strb r0, [r6]
	ldr r1, .L0807F5C4 @ =gPrepItemlData
	mov r0, r8
	adds r0, #0x50
	ldrh r0, [r0]
	lsrs r0, r0, #4
	ldrb r2, [r6]
	adds r0, r2, r0
	lsls r0, r0, #2
	adds r1, r0, r1
	movs r3, #0xff
	ldrb r0, [r1]
	cmp r3, r0
	beq .L0807F5A6
	ldr r0, .L0807F5C8 @ =gPrepTexts3 + 0x8
	ldrb r1, [r1]
	movs r2, #0x18
	movs r3, #0
	bl func_fe6_0807DCB8
.L0807F5A6:
	ldrb r2, [r4]
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #1
	adds r0, #2
	ldrb r6, [r6]
	lsls r1, r6, #1
.L0807F5B4:
	lsls r2, r2, #2
	subs r2, #9
	subs r1, r1, r2
.L0807F5BA:
	movs r2, #0xc
	bl PutUiEntryHover
	b .L0807FA9A
	.align 2, 0
.L0807F5C4: .4byte gPrepItemlData
.L0807F5C8: .4byte gPrepTexts3 + 0x8
.L0807F5CC:
	ldr r2, .L0807F664 @ =gKeySt
	ldr r1, [r2]
	movs r2, #0x80
	adds r0, r2, #0
	ldrh r3, [r1, #6]
	ands r0, r3
	cmp r0, #0
	bne .L0807F5F0
	adds r0, r2, #0
	ldrh r1, [r1, #0x10]
	ands r0, r1
	cmp r0, #0
	bne .L0807F5E8
	b .L0807F710
.L0807F5E8:
	ldrb r4, [r7]
	cmp r4, #2
	beq .L0807F5F0
	b .L0807F710
.L0807F5F0:
	mov r0, r8
	adds r0, #0x2e
	ldrb r1, [r0]
	adds r6, r0, #0
	cmp r1, #5
	bls .L0807F5FE
	b .L0807F710
.L0807F5FE:
	ldr r3, .L0807F668 @ =gPrep_Unk_0201636A
	cmp r1, #5
	bne .L0807F678
	mov r5, r8
	adds r5, #0x50
	ldrh r0, [r5]
	lsrs r2, r0, #4
	adds r1, r2, #7
	ldrh r0, [r3]
	cmp r1, r0
	bge .L0807F678
	ldr r0, .L0807F66C @ =gPrepTexts2
	adds r2, r1, #0
	mov r1, r8
	ldr r3, [r1, #0x54]
	movs r1, #0
	str r1, [sp]
	movs r1, #1
	bl func_fe6_0807DB80
	mov r0, r8
	bl func_fe6_0807D358
	ldr r1, .L0807F670 @ =gPrepItemlData
	ldrh r2, [r5]
	lsrs r0, r2, #4
	ldrb r6, [r6]
	adds r0, r6, r0
	adds r0, #1
	lsls r0, r0, #2
	adds r1, r0, r1
	movs r3, #0xff
	ldrb r4, [r1]
	cmp r3, r4
	beq .L0807F650
	ldr r0, .L0807F674 @ =gPrepTexts3 + 0x8
	ldrb r1, [r1]
	movs r2, #0x18
	movs r3, #0
	bl func_fe6_0807DCB8
.L0807F650:
	ldrb r7, [r7]
	lsls r0, r7, #2
	ldrh r1, [r5]
	adds r0, r1, r0
	strh r0, [r5]
	movs r0, #2
	mov r2, sb
	strb r0, [r2]
	b .L0807F6EE
	.align 2, 0
.L0807F664: .4byte gKeySt
.L0807F668: .4byte gPrep_Unk_0201636A
.L0807F66C: .4byte gPrepTexts2
.L0807F670: .4byte gPrepItemlData
.L0807F674: .4byte gPrepTexts3 + 0x8
.L0807F678:
	mov r5, r8
	adds r5, #0x50
	ldrh r4, [r5]
	lsrs r0, r4, #4
	adds r4, r6, #0
	ldrb r1, [r4]
	adds r0, r0, r1
	adds r0, #1
	ldrh r3, [r3]
	cmp r0, r3
	blt .L0807F690
	b .L0807FA9A
.L0807F690:
	mov r7, r8
	adds r7, #0x2f
	ldrb r2, [r7]
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #1
	adds r0, #2
	lsls r1, r1, #1
	lsls r2, r2, #2
	subs r2, #9
	subs r1, r1, r2
	movs r2, #0xc
	bl RemoveUiEntryHover
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	ldr r1, .L0807F704 @ =gPrepItemlData
	ldrh r5, [r5]
	lsrs r0, r5, #4
	ldrb r4, [r4]
	adds r0, r4, r0
	lsls r0, r0, #2
	adds r1, r0, r1
	movs r0, #0xff
	ldrb r2, [r1]
	cmp r0, r2
	beq .L0807F6D4
	ldr r0, .L0807F708 @ =gPrepTexts3 + 0x8
	ldrb r1, [r1]
	movs r2, #0x18
	movs r3, #0
	bl func_fe6_0807DCB8
.L0807F6D4:
	ldrb r2, [r7]
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #1
	adds r0, #2
	ldrb r6, [r6]
	lsls r1, r6, #1
	lsls r2, r2, #2
	subs r2, #9
	subs r1, r1, r2
	movs r2, #0xc
	bl PutUiEntryHover
.L0807F6EE:
	ldr r0, .L0807F70C @ =gPlaySt
	ldrb r0, [r0, #0x1d]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge .L0807F6FA
	b .L0807FA9A
.L0807F6FA:
	movs r0, #0x66
	bl m4aSongNumStart
	b .L0807FA9A
	.align 2, 0
.L0807F704: .4byte gPrepItemlData
.L0807F708: .4byte gPrepTexts3 + 0x8
.L0807F70C: .4byte gPlaySt
.L0807F710:
	ldr r3, .L0807F780 @ =gKeySt
	ldr r0, [r3]
	ldrh r1, [r0, #6]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq .L0807F788
	ldr r0, .L0807F784 @ =gPlaySt
	ldrb r0, [r0, #0x1d]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L0807F72E
	movs r0, #0x67
	bl m4aSongNumStart
.L0807F72E:
	mov r2, r8
	adds r2, #0x46
	mov r0, r8
	adds r0, #0x32
	ldrb r4, [r2]
	adds r0, r4, r0
	mov r1, r8
	adds r1, #0x50
	ldrh r1, [r1]
	lsrs r1, r1, #4
	strb r1, [r0]
	mov r0, r8
	adds r0, #0x3b
	ldrb r2, [r2]
	adds r0, r2, r0
	mov r3, r8
	adds r3, #0x2e
	ldrb r1, [r3]
	strb r1, [r0]
	mov r0, r8
	adds r0, #0x2f
	ldrb r2, [r0]
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #1
	adds r0, #2
	ldrb r3, [r3]
	lsls r1, r3, #1
	lsls r2, r2, #2
	subs r2, #9
	subs r1, r1, r2
	movs r2, #0xc
	bl RemoveUiEntryHover
	mov r1, r8
	adds r1, #0x45
	movs r0, #0x38
	strb r0, [r1]
	movs r0, #5
	b .L0807FA6E
	.align 2, 0
.L0807F780: .4byte gKeySt
.L0807F784: .4byte gPlaySt
.L0807F788:
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	bne .L0807F792
	b .L0807FA9A
.L0807F792:
	ldr r0, .L0807F7F8 @ =gPlaySt
	ldrb r0, [r0, #0x1d]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L0807F7A2
	movs r0, #0x67
	bl m4aSongNumStart
.L0807F7A2:
	mov r2, r8
	adds r2, #0x46
	mov r0, r8
	adds r0, #0x32
	ldrb r3, [r2]
	adds r0, r3, r0
	mov r1, r8
	adds r1, #0x50
	ldrh r1, [r1]
	lsrs r1, r1, #4
	strb r1, [r0]
	mov r0, r8
	adds r0, #0x3b
	ldrb r2, [r2]
	adds r0, r2, r0
	mov r3, r8
	adds r3, #0x2e
	ldrb r1, [r3]
	strb r1, [r0]
	mov r0, r8
	adds r0, #0x2f
	ldrb r2, [r0]
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #1
	adds r0, #2
	ldrb r3, [r3]
	lsls r1, r3, #1
	lsls r2, r2, #2
	subs r2, #9
	subs r1, r1, r2
	movs r2, #0xc
	bl RemoveUiEntryHover
	mov r1, r8
	adds r1, #0x45
	movs r0, #0xc8
	strb r0, [r1]
	movs r0, #0xa
	mov r4, sb
	strb r0, [r4]
	b .L0807FA9A
	.align 2, 0
.L0807F7F8: .4byte gPlaySt
.L0807F7FC:
	mov r0, r8
	adds r0, #0x50
	mov r1, r8
	adds r1, #0x4a
	ldrb r1, [r1]
	lsls r1, r1, #2
	ldrh r2, [r0]
	subs r1, r2, r1
	strh r1, [r0]
	ldrh r1, [r0]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0
	beq .L0807F81A
	b .L0807FA9A
.L0807F81A:
	lsrs r0, r1, #4
	adds r0, #7
	lsls r0, r0, #1
	movs r1, #0x1f
	ands r0, r1
	lsls r0, r0, #6
	ldr r1, .L0807F840 @ =gBg2Tm+0x1E
	adds r0, r0, r1
	movs r1, #0xf
	movs r2, #1
	movs r3, #0
	bl TmFillRect_thm
	movs r0, #4
	bl EnableBgSync
	movs r0, #0
	b .L0807F990
	.align 2, 0
.L0807F840: .4byte gBg2Tm+0x1E
.L0807F844:
	mov r0, r8
	adds r0, #0x50
	mov r1, r8
	adds r1, #0x4a
	ldrb r1, [r1]
	lsls r1, r1, #2
	ldrh r4, [r0]
	adds r1, r4, r1
	strh r1, [r0]
	ldrh r1, [r0]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0
	beq .L0807F862
	b .L0807FA9A
.L0807F862:
	lsrs r0, r1, #4
	subs r0, #1
	lsls r0, r0, #1
	movs r1, #0x1f
	ands r0, r1
	lsls r0, r0, #6
	ldr r1, .L0807F888 @ =gBg2Tm+0x1E
	adds r0, r0, r1
	movs r1, #0xf
	movs r2, #1
	movs r3, #0
	bl TmFillRect_thm
	movs r0, #4
	bl EnableBgSync
	movs r0, #0
	b .L0807FA6E
	.align 2, 0
.L0807F888: .4byte gBg2Tm+0x1E
.L0807F88C:
	mov r1, r8
	adds r1, #0x45
	ldrb r0, [r1]
	adds r0, #0x38
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x70
	beq .L0807F8A0
	b .L0807FA9A
.L0807F8A0:
	movs r0, #6
	b .L0807FA96
.L0807F8A4:
	mov r1, r8
	adds r1, #0x45
	movs r0, #0x90
	strb r0, [r1]
	mov r0, r8
	adds r0, #0x46
	ldrb r1, [r0]
	adds r7, r0, #0
	cmp r1, #8
	bne .L0807F8BC
	movs r0, #0
	b .L0807F8BE
.L0807F8BC:
	adds r0, r1, #1
.L0807F8BE:
	strb r0, [r7]
	mov r0, r8
	adds r0, #0x32
	ldrb r3, [r7]
	adds r0, r3, r0
	ldrb r0, [r0]
	lsls r0, r0, #4
	mov r5, r8
	adds r5, #0x50
	movs r6, #0
	strh r0, [r5]
	mov r0, r8
	adds r0, #0x3b
	ldrb r4, [r7]
	adds r0, r4, r0
	ldrb r0, [r0]
	mov r4, r8
	adds r4, #0x2e
	strb r0, [r4]
	ldrb r0, [r7]
	bl func_fe6_0807D834
	adds r0, r4, #0
	adds r1, r5, #0
	bl func_fe6_080823A0
	ldr r0, .L0807F960 @ =gPrepTexts2
	mov r1, r8
	ldr r2, [r1, #0x54]
	ldrh r1, [r5]
	lsrs r3, r1, #4
	str r6, [sp]
	movs r1, #1
	bl func_fe6_0807D9E4
	mov r0, r8
	adds r0, #0x2f
	ldrb r2, [r0]
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #1
	adds r0, #2
	ldrb r3, [r4]
	lsls r1, r3, #1
	lsls r2, r2, #2
	subs r2, #9
	subs r1, r1, r2
	movs r2, #0xc
	bl PutUiEntryHover
	ldr r1, .L0807F964 @ =gPrepItemlData
	ldrh r5, [r5]
	lsrs r0, r5, #4
	ldrb r4, [r4]
	adds r0, r4, r0
	lsls r0, r0, #2
	adds r1, r0, r1
	movs r4, #0xff
	ldrb r0, [r1]
	cmp r4, r0
	bne .L0807F940
	ldr r0, .L0807F968 @ =gPrep_Unk_0201636A
	ldrh r0, [r0]
	cmp r0, #0
	bne .L0807F94C
.L0807F940:
	ldr r0, .L0807F96C @ =gPrepTexts3 + 0x8
	ldrb r1, [r1]
	movs r2, #0x18
	movs r3, #0
	bl func_fe6_0807DCB8
.L0807F94C:
	mov r0, r8
	bl func_fe6_0807D358
	mov r1, r8
	adds r1, #0x45
	ldrb r0, [r1]
	adds r0, #0xe
	strb r0, [r1]
	movs r0, #7
	b .L0807FA6E
	.align 2, 0
.L0807F960: .4byte gPrepTexts2
.L0807F964: .4byte gPrepItemlData
.L0807F968: .4byte gPrep_Unk_0201636A
.L0807F96C: .4byte gPrepTexts3 + 0x8
.L0807F970:
	mov r1, r8
	adds r1, #0x45
	ldrb r0, [r1]
	adds r0, #0xe
	b .L0807FA8C
.L0807F97A:
	mov r1, r8
	adds r1, #0x45
	ldrb r0, [r1]
	subs r0, #0x38
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x90
	beq .L0807F98E
	b .L0807FA9A
.L0807F98E:
	movs r0, #0xb
.L0807F990:
	mov r3, sb
	strb r0, [r3]
	b .L0807FA9A
.L0807F996:
	mov r1, r8
	adds r1, #0x45
	movs r0, #0x70
	strb r0, [r1]
	mov r0, r8
	adds r0, #0x46
	ldrb r1, [r0]
	adds r7, r0, #0
	cmp r1, #0
	bne .L0807F9AE
	movs r0, #8
	b .L0807F9B0
.L0807F9AE:
	subs r0, r1, #1
.L0807F9B0:
	strb r0, [r7]
	movs r4, #0x2f
	add r4, r8
	mov sl, r4
	ldrb r2, [r4]
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #1
	adds r0, #2
	mov r5, r8
	adds r5, #0x2e
	ldrb r3, [r5]
	lsls r1, r3, #1
	lsls r2, r2, #2
	subs r2, #9
	subs r1, r1, r2
	movs r2, #0xc
	bl RemoveUiEntryHover
	mov r0, r8
	adds r0, #0x32
	ldrb r4, [r7]
	adds r0, r4, r0
	ldrb r0, [r0]
	lsls r0, r0, #4
	mov r4, r8
	adds r4, #0x50
	movs r6, #0
	strh r0, [r4]
	mov r0, r8
	adds r0, #0x3b
	ldrb r1, [r7]
	adds r0, r1, r0
	ldrb r0, [r0]
	strb r0, [r5]
	ldrb r0, [r7]
	bl func_fe6_0807D834
	adds r0, r5, #0
	adds r1, r4, #0
	bl func_fe6_080823A0
	ldr r0, .L0807FA74 @ =gPrepTexts2
	mov r3, r8
	ldr r2, [r3, #0x54]
	ldrh r1, [r4]
	lsrs r3, r1, #4
	str r6, [sp]
	movs r1, #1
	bl func_fe6_0807D9E4
	mov r3, sl
	ldrb r2, [r3]
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #1
	adds r0, #2
	ldrb r3, [r5]
	lsls r1, r3, #1
	lsls r2, r2, #2
	subs r2, #9
	subs r1, r1, r2
	movs r2, #0xc
	bl PutUiEntryHover
	ldr r1, .L0807FA78 @ =gPrepItemlData
	ldrh r4, [r4]
	lsrs r0, r4, #4
	ldrb r5, [r5]
	adds r0, r5, r0
	lsls r0, r0, #2
	adds r1, r0, r1
	movs r4, #0xff
	ldrb r0, [r1]
	cmp r4, r0
	bne .L0807FA50
	ldr r0, .L0807FA7C @ =gPrep_Unk_0201636A
	ldrh r0, [r0]
	cmp r0, #0
	bne .L0807FA5C
.L0807FA50:
	ldr r0, .L0807FA80 @ =gPrepTexts3 + 0x8
	ldrb r1, [r1]
	movs r2, #0x18
	movs r3, #0
	bl func_fe6_0807DCB8
.L0807FA5C:
	mov r0, r8
	bl func_fe6_0807D358
	mov r1, r8
	adds r1, #0x45
	ldrb r0, [r1]
	subs r0, #0xe
	strb r0, [r1]
	movs r0, #0xc
.L0807FA6E:
	mov r1, sb
	strb r0, [r1]
	b .L0807FA9A
	.align 2, 0
.L0807FA74: .4byte gPrepTexts2
.L0807FA78: .4byte gPrepItemlData
.L0807FA7C: .4byte gPrep_Unk_0201636A
.L0807FA80: .4byte gPrepTexts3 + 0x8
.L0807FA84:
	mov r1, r8
	adds r1, #0x45
	ldrb r0, [r1]
	subs r0, #0xe
.L0807FA8C:
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0
	bne .L0807FA9A
.L0807FA96:
	mov r2, sb
	strb r0, [r2]
.L0807FA9A:
	mov r0, r8
	adds r0, #0x45
	ldrb r1, [r0]
	mov r5, r8
	adds r5, #0x50
	ldrh r2, [r5]
	subs r2, #0x28
	movs r0, #0xff
	ands r2, r0
	movs r0, #2
	bl SetBgOffset
	mov r6, r8
	adds r6, #0x29
	ldrb r2, [r6]
	cmp r2, #0
	beq .L0807FB52
	mov r0, r8
	adds r0, #0x46
	ldr r3, [sp, #4]
	ldrb r0, [r0]
	cmp r3, r0
	bne .L0807FADA
	mov r1, r8
	adds r1, #0x2e
	ldrh r4, [r5]
	lsrs r0, r4, #4
	ldrb r1, [r1]
	adds r0, r1, r0
	ldr r1, [sp, #8]
	cmp r1, r0
	beq .L0807FB52
.L0807FADA:
	mov r1, r8
	adds r1, #0x2f
	ldrb r0, [r1]
	cmp r0, #0
	bne .L0807FB0C
	adds r2, r0, #0
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #4
	adds r0, #0x10
	subs r1, #1
	ldrb r3, [r1]
	lsls r1, r3, #4
	lsls r2, r2, #5
	subs r2, #0x48
	subs r1, r1, r2
	mov r4, r8
	ldr r2, [r4, #0x54]
	lsls r3, r3, #1
	adds r2, #0x1c
	adds r2, r2, r3
	ldrh r2, [r2]
	bl StartItemHelpBox
	b .L0807FB52
.L0807FB0C:
	ldr r0, .L0807FB20 @ =gPrep_Unk_0201636A
	ldrh r0, [r0]
	cmp r0, #0
	bne .L0807FB24
	cmp r2, #1
	beq .L0807FB1C
	bl CloseHelpBox
.L0807FB1C:
	movs r0, #1
	b .L0807FB50
	.align 2, 0
.L0807FB20: .4byte gPrep_Unk_0201636A
.L0807FB24:
	ldrb r3, [r1]
	lsls r0, r3, #3
	subs r0, r0, r3
	lsls r0, r0, #4
	adds r0, #0x10
	mov r1, r8
	adds r1, #0x2e
	ldrb r2, [r1]
	lsls r1, r2, #4
	lsls r3, r3, #5
	subs r3, #0x48
	subs r1, r1, r3
	ldr r4, .L0807FBC8 @ =gPrepItemlData
	ldrh r5, [r5]
	lsrs r3, r5, #4
	adds r2, r2, r3
	lsls r2, r2, #2
	adds r2, r2, r4
	ldrh r2, [r2, #2]
	bl StartItemHelpBox
	movs r0, #2
.L0807FB50:
	strb r0, [r6]
.L0807FB52:
	mov r7, r8
	adds r7, #0x52
	ldrh r0, [r7]
	adds r1, r0, #0
	cmp r1, #1
	bne .L0807FBD0
	ldr r0, .L0807FBCC @ =gDispIo
	mov ip, r0
	movs r0, #0x20
	mov r1, ip
	ldrb r1, [r1, #1]
	orrs r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	mov r2, ip
	strb r0, [r2, #1]
	mov r1, ip
	adds r1, #0x2d
	movs r0, #0x80
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x28
	strb r0, [r1]
	subs r1, #5
	movs r0, #0xe0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x98
	strb r0, [r1]
	mov r5, ip
	adds r5, #0x34
	movs r1, #1
	ldrb r0, [r5]
	orrs r0, r1
	movs r6, #2
	orrs r0, r6
	movs r2, #4
	orrs r0, r2
	movs r4, #8
	orrs r0, r4
	movs r3, #0x10
	orrs r0, r3
	strb r0, [r5]
	mov r2, ip
	adds r2, #0x36
	ldrb r0, [r2]
	orrs r1, r0
	orrs r1, r6
	movs r0, #5
	rsbs r0, r0, #0
	ands r1, r0
	orrs r1, r4
	orrs r1, r3
	strb r1, [r2]
	movs r0, #2
	b .L0807FBD6
	.align 2, 0
.L0807FBC8: .4byte gPrepItemlData
.L0807FBCC: .4byte gDispIo
.L0807FBD0:
	cmp r1, #1
	bhi .L0807FBD8
	adds r0, #1
.L0807FBD6:
	strh r0, [r7]
.L0807FBD8:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start func_fe6_0807FBE8
func_fe6_0807FBE8: @ 0x0807FBE8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0xc
	adds r7, r0, #0
	ldr r0, .L0807FCF0 @ =gDispIo
	mov ip, r0
	movs r0, #0x20
	mov r1, ip
	ldrb r1, [r1, #1]
	orrs r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	mov r2, ip
	strb r0, [r2, #1]
	mov r1, ip
	adds r1, #0x2d
	movs r0, #0
	mov r8, r0
	movs r0, #0x80
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x28
	strb r0, [r1]
	subs r1, #5
	movs r0, #0xe0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x98
	strb r0, [r1]
	mov r5, ip
	adds r5, #0x34
	movs r1, #1
	ldrb r0, [r5]
	orrs r0, r1
	movs r6, #2
	orrs r0, r6
	movs r2, #4
	orrs r0, r2
	movs r4, #8
	orrs r0, r4
	movs r3, #0x10
	orrs r0, r3
	strb r0, [r5]
	mov r2, ip
	adds r2, #0x36
	ldrb r0, [r2]
	orrs r1, r0
	orrs r1, r6
	movs r0, #5
	rsbs r0, r0, #0
	ands r1, r0
	orrs r1, r4
	orrs r1, r3
	strb r1, [r2]
	mov r1, r8
	str r1, [sp]
	movs r0, #0xf
	movs r1, #4
	movs r2, #0xf
	movs r3, #0x10
	bl PutUiWindowFrame
	ldr r0, .L0807FCF4 @ =gPrepTexts2
	ldr r2, [r7, #0x54]
	adds r4, r7, #0
	adds r4, #0x50
	ldrh r1, [r4]
	lsrs r3, r1, #4
	movs r5, #1
	str r5, [sp]
	movs r1, #1
	bl func_fe6_0807D9E4
	movs r0, #7
	bl EnableBgSync
	adds r0, r7, #0
	adds r0, #0x45
	ldrb r1, [r0]
	ldrh r2, [r4]
	subs r2, #0x28
	movs r0, #0xff
	ands r2, r0
	movs r0, #2
	bl SetBgOffset
	ldr r0, [r7, #0x60]
	ldrh r1, [r4]
	str r1, [sp]
	ldr r1, .L0807FCF8 @ =gPrep_Unk_0201636A
	ldrh r1, [r1]
	str r1, [sp, #4]
	movs r1, #7
	str r1, [sp, #8]
	movs r1, #0xe0
	movs r2, #0x30
	movs r3, #0xc
	bl SetPrepMenuScrollBarBaseInfo
	adds r0, r7, #0
	adds r0, #0x2f
	ldrb r2, [r0]
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #1
	adds r0, #2
	adds r1, r7, #0
	adds r1, #0x2e
	ldrb r1, [r1]
	lsls r1, r1, #1
	lsls r2, r2, #2
	subs r2, #9
	subs r1, r1, r2
	movs r2, #0xc
	bl PutUiEntryHover
	movs r0, #1
	bl func_fe6_0807E06C
	adds r0, r7, #0
	adds r0, #0x2b
	strb r5, [r0]
	add sp, #0xc
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0807FCF0: .4byte gDispIo
.L0807FCF4: .4byte gPrepTexts2
.L0807FCF8: .4byte gPrep_Unk_0201636A

	thumb_func_start PrepSubItem_StartSupplyScreen
PrepSubItem_StartSupplyScreen: @ 0x0807FCFC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	adds r6, r0, #0
	ldr r0, .L0807FDB0 @ =gBg0Tm+0x1E
	movs r1, #0xf
	movs r2, #0x13
	movs r3, #0
	bl TmFillRect_thm
	ldr r0, .L0807FDB4 @ =gBg1Tm+0x1E
	movs r1, #0xf
	movs r2, #0x13
	movs r3, #0
	bl TmFillRect_thm
	ldr r0, .L0807FDB8 @ =gBg2Tm+0x1E
	movs r1, #0xf
	movs r2, #0x1f
	movs r3, #0
	bl TmFillRect_thm
	ldr r0, [r6, #0x60]
	movs r5, #0
	str r5, [sp]
	str r5, [sp, #4]
	str r5, [sp, #8]
	movs r1, #0
	movs r2, #0
	movs r3, #0xd
	bl SetPrepMenuScrollBarBaseInfo
	adds r4, r6, #0
	adds r4, #0x30
	ldrb r0, [r4]
	cmp r0, #0xff
	bne .L0807FDD2
	bl GetSupplyItems
	adds r3, r0, #0
	strb r5, [r4]
	adds r0, r6, #0
	adds r0, #0x31
	strb r5, [r0]
	ldr r1, .L0807FDBC @ =gPrep_Unk_02016368
	strh r5, [r1]
	movs r2, #0
	ldrh r0, [r3]
	adds r5, r6, #0
	adds r5, #0x46
	cmp r0, #0
	beq .L0807FD9C
	ldr r0, .L0807FDC0 @ =gPrepItemlData
	mov ip, r0
	movs r7, #0
	adds r4, r1, #0
.L0807FD72:
	lsls r1, r2, #2
	add r1, ip
	lsls r0, r2, #1
	adds r0, r0, r3
	ldrh r0, [r0]
	strh r0, [r1, #2]
	strb r7, [r1]
	strb r2, [r1, #1]
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0x63
	bhi .L0807FD9C
	lsls r0, r2, #1
	adds r0, r0, r3
	ldrh r0, [r0]
	cmp r0, #0
	bne .L0807FD72
.L0807FD9C:
	adds r0, r6, #0
	adds r0, #0x2d
	ldrb r0, [r0]
	cmp r0, #3
	bhi .L0807FDC4
	ldr r0, [r6, #0x14]
	adds r0, #0x3a
	ldrb r0, [r0]
	b .L0807FDC6
	.align 2, 0
.L0807FDB0: .4byte gBg0Tm+0x1E
.L0807FDB4: .4byte gBg1Tm+0x1E
.L0807FDB8: .4byte gBg2Tm+0x1E
.L0807FDBC: .4byte gPrep_Unk_02016368
.L0807FDC0: .4byte gPrepItemlData
.L0807FDC4:
	movs r0, #0
.L0807FDC6:
	strb r0, [r5]
	adds r0, r6, #0
	adds r0, #0x46
	ldrb r0, [r0]
	bl func_fe6_0807D834
.L0807FDD2:
	adds r2, r6, #0
	adds r2, #0x46
	adds r0, r6, #0
	adds r0, #0x32
	ldrb r1, [r2]
	adds r0, r1, r0
	ldrb r0, [r0]
	lsls r0, r0, #4
	adds r5, r6, #0
	adds r5, #0x50
	strh r0, [r5]
	adds r1, r6, #0
	adds r1, #0x2f
	movs r0, #1
	strb r0, [r1]
	adds r0, r6, #0
	adds r0, #0x3b
	ldrb r2, [r2]
	adds r0, r2, r0
	ldrb r0, [r0]
	adds r4, r6, #0
	adds r4, #0x2e
	strb r0, [r4]
	adds r0, r4, #0
	adds r1, r5, #0
	bl func_fe6_080823A0
	adds r0, r6, #0
	adds r0, #0x4b
	ldrb r1, [r0]
	mov sb, r5
	mov sl, r4
	mov r8, r0
	cmp r1, #0
	bne .L0807FEA8
	ldr r0, [r6, #0x54]
	bl GetUnitItemCount
	movs r2, #0
	cmp r0, #0
	bne .L0807FE26
	movs r2, #1
.L0807FE26:
	ldr r4, .L0807FE6C @ =gPrepTexts2
	ldr r5, .L0807FE70 @ =gBg2Tm+0x12A
	ldr r0, .L0807FE74 @ =gUnk_083272AC
	str r0, [sp]
	adds r0, r4, #0
	adds r1, r5, #0
	movs r3, #0
	bl PrepPutText
	adds r3, r4, #0
	adds r3, #8
	adds r1, r5, #0
	adds r1, #0x80
	movs r2, #0
	ldr r7, .L0807FE78 @ =gPrep_Unk_02016368
	ldrh r0, [r7]
	cmp r0, #0
	bne .L0807FE4C
	movs r2, #1
.L0807FE4C:
	ldr r0, .L0807FE7C @ =gUnk_083272B8
	str r0, [sp]
	adds r0, r3, #0
	movs r3, #0
	bl PrepPutText
	adds r0, r6, #0
	adds r0, #0x4c
	ldrb r0, [r0]
	cmp r0, #0
	beq .L0807FE80
	adds r1, r6, #0
	adds r1, #0x49
	movs r0, #2
	b .L0807FEA6
	.align 2, 0
.L0807FE6C: .4byte gPrepTexts2
.L0807FE70: .4byte gBg2Tm+0x12A
.L0807FE74: .4byte gUnk_083272AC
.L0807FE78: .4byte gPrep_Unk_02016368
.L0807FE7C: .4byte gUnk_083272B8
.L0807FE80:
	adds r3, r4, #0
	adds r3, #0x10
	movs r2, #0x80
	lsls r2, r2, #1
	adds r1, r5, r2
	movs r2, #0
	ldrh r0, [r7]
	cmp r0, #0
	bne .L0807FE94
	movs r2, #1
.L0807FE94:
	ldr r0, .L0807FF44 @ =gUnk_083272C4
	str r0, [sp]
	adds r0, r3, #0
	movs r3, #0
	bl PrepPutText
	adds r1, r6, #0
	adds r1, #0x49
	movs r0, #3
.L0807FEA6:
	strb r0, [r1]
.L0807FEA8:
	movs r0, #2
	movs r1, #0
	movs r2, #0xd8
	bl SetBgOffset
	adds r0, r6, #0
	adds r0, #0x2c
	movs r5, #0
	strb r5, [r0]
	subs r0, #1
	strb r5, [r0]
	movs r0, #7
	bl EnableBgSync
	adds r4, r6, #0
	adds r4, #0x2d
	ldrb r0, [r4]
	cmp r0, #0
	bne .L0807FEE0
	movs r1, #1
	rsbs r1, r1, #0
	adds r0, r6, #0
	bl NewSallyCir2
	adds r0, r6, #0
	bl func_fe6_0807D2E0
	str r0, [r6, #0x5c]
.L0807FEE0:
	movs r0, #0x18
	movs r1, #0
	bl func_fe6_0807DDC8
	ldrb r0, [r4]
	cmp r0, #4
	bne .L0807FF50
	adds r0, r6, #0
	bl func_fe6_0807D2E0
	str r0, [r6, #0x5c]
	movs r0, #5
	strb r0, [r4]
	mov r3, r8
	ldrb r0, [r3]
	cmp r0, #0
	beq .L0807FF5C
	adds r1, r6, #0
	adds r1, #0x31
	movs r0, #2
	strb r0, [r1]
	adds r0, r6, #0
	bl func_fe6_0807FBE8
	adds r0, r6, #0
	movs r1, #7
	bl Proc_Goto
	ldr r1, .L0807FF48 @ =gPrepItemlData
	mov r2, sb
	ldrh r2, [r2]
	lsrs r0, r2, #4
	mov r3, sl
	ldrb r3, [r3]
	adds r0, r3, r0
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrh r2, [r0, #2]
	ldr r3, [r6, #0x5c]
	movs r0, #1
	movs r1, #0xb
	bl func_fe6_0807D4A8
	ldr r2, .L0807FF4C @ =0x00000C47
	movs r0, #0x10
	movs r1, #0x10
	adds r3, r6, #0
	bl func_fe6_08071B80
	b .L0807FF86
	.align 2, 0
.L0807FF44: .4byte gUnk_083272C4
.L0807FF48: .4byte gPrepItemlData
.L0807FF4C: .4byte 0x00000C47
.L0807FF50:
	cmp r0, #3
	bhi .L0807FF5C
	movs r0, #2
	strb r0, [r4]
	mov r0, r8
	strb r5, [r0]
.L0807FF5C:
	adds r0, r6, #0
	adds r0, #0x49
	ldrb r0, [r0]
	lsls r3, r0, #1
	adds r3, #2
	movs r0, #0
	str r0, [sp]
	movs r0, #0x12
	movs r1, #8
	movs r2, #0xa
	bl PutUiWindowFrame
	adds r0, r6, #0
	adds r0, #0x31
	ldrb r0, [r0]
	lsls r1, r0, #1
	adds r1, #9
	movs r0, #0x13
	movs r2, #7
	bl PutUiEntryHover
.L0807FF86:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

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
	ldr r0, .L08080170 @ =gPrep_Unk_02016368
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
.L08080170: .4byte gPrep_Unk_02016368
.L08080174: .4byte gPlaySt
.L08080178:
	cmp r4, #2
	bne .L080801FC
	ldr r0, .L08080198 @ =gPrep_Unk_02016368
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
.L08080198: .4byte gPrep_Unk_02016368
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
	ldr r1, .L0808021C @ =gPrepItemlData
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
.L0808021C: .4byte gPrepItemlData
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
	ldr r4, .L080805DC @ =gPrep_Unk_02016368
	adds r5, r4, #0
	ldr r2, .L080805E0 @ =gPrep_Unk_0201636A
	mov ip, r2
	adds r3, r6, #0
	adds r3, #0x4b
	str r3, [sp, #0x14]
	ldrh r2, [r4]
	cmp r0, r2
	bge .L08080588
	ldr r3, .L080805E4 @ =gPrepItemlData
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
	bl func_fe6_0807DE60
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
.L080805DC: .4byte gPrep_Unk_02016368
.L080805E0: .4byte gPrep_Unk_0201636A
.L080805E4: .4byte gPrepItemlData
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
	ldr r1, .L080806A8 @ =gPrepItemlData
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
	ldr r0, .L080806AC @ =gPrep_Unk_02016368
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
.L080806A8: .4byte gPrepItemlData
.L080806AC: .4byte gPrep_Unk_02016368
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
	ldr r0, .L080808CC @ =gPrep_Unk_02016368
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
	ldr r0, .L080808D0 @ =gPrepItemlData
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
	ldr r3, .L080808D0 @ =gPrepItemlData
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
	ldr r1, .L080808CC @ =gPrep_Unk_02016368
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	ldr r1, .L080808D4 @ =gPrep_Unk_0201636A
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	ldr r0, [r6, #0x54]
	ldrb r1, [r7]
	bl UnitRemoveItem
	ldr r1, [r6, #0x54]
	movs r0, #0
	bl func_fe6_0807D6C0
	bl func_fe6_0807DE60
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
.L080808CC: .4byte gPrep_Unk_02016368
.L080808D0: .4byte gPrepItemlData
.L080808D4: .4byte gPrep_Unk_0201636A
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
	ldr r0, .L08080A04 @ =gPrep_Unk_0201636A
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
	ldr r3, .L08080A0C @ =gPrepItemlData
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
	ldr r4, .L08080A10 @ =gPrep_Unk_02016368
	ldrh r2, [r4]
	cmp r0, r2
	bge .L080809AA
	ldr r3, .L08080A0C @ =gPrepItemlData
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
	ldr r4, .L08080A10 @ =gPrep_Unk_02016368
	ldrh r0, [r4]
	subs r0, #1
	strh r0, [r4]
	ldr r1, .L08080A04 @ =gPrep_Unk_0201636A
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
	bl func_fe6_0807DE60
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
.L08080A04: .4byte gPrep_Unk_0201636A
.L08080A08: .4byte gPlaySt
.L08080A0C: .4byte gPrepItemlData
.L08080A10: .4byte gPrep_Unk_02016368
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
	ldr r0, .L08080A94 @ =gPrep_Unk_0201636A
	ldrh r0, [r0]
	cmp r0, #0
	beq .L08080B3C
	ldr r1, .L08080A98 @ =gPrepItemlData
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
.L08080A94: .4byte gPrep_Unk_0201636A
.L08080A98: .4byte gPrepItemlData
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
	ldr r0, .L08080C2C @ =gPrep_Unk_0201636A
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
	ldr r2, .L08080C30 @ =gPrepItemlData
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
.L08080C2C: .4byte gPrep_Unk_0201636A
.L08080C30: .4byte gPrepItemlData
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
	ldr r3, .L08080DD0 @ =gPrep_Unk_0201636A
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
.L08080DD0: .4byte gPrep_Unk_0201636A
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
	ldr r0, .L08081368 @ =gPrep_Unk_0201636A
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
.L08081368: .4byte gPrep_Unk_0201636A
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
	ldr r3, .L080813E4 @ =gPrepItemlData
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
	ldr r1, .L080813E4 @ =gPrepItemlData
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
.L080813E4: .4byte gPrepItemlData
