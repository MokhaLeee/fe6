	.include "macro.inc"

	.syntax unified

	thumb_func_start PrepSubItem_ViewAll_Loop
PrepSubItem_ViewAll_Loop: @ 0x0807EDBC
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
	ldr r3, .L0807F168 @ =gPrepItemListData
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
.L0807F168: .4byte gPrepItemListData
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
	bl PrepAllItems_SwapItems
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
	ldr r0, .L0807F224 @ =gPrepTexts1 + 0x50
	mov r1, r8
	ldr r2, [r1, #0x54]
	ldrh r1, [r4]
	lsrs r3, r1, #4
	str r5, [sp]
	movs r1, #1
	bl func_fe6_0807D9E4
	ldr r0, .L0807F228 @ =gPrepTexts3 + 0x8
	ldr r2, .L0807F22C @ =gPrepItemListData
	ldrh r4, [r4]
	lsrs r1, r4, #4
	ldrb r3, [r6]
	adds r1, r3, r1
	lsls r1, r1, #2
	adds r1, r1, r2
	ldrb r1, [r1]
	movs r2, #0x18
	movs r3, #0
	bl PrepAllItems_PutPName
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
.L0807F224: .4byte gPrepTexts1 + 0x50
.L0807F228: .4byte gPrepTexts3 + 0x8
.L0807F22C: .4byte gPrepItemListData
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
	ldr r0, .L0807F35C @ =gPrepMenuScrollPos
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
.L0807F35C: .4byte gPrepMenuScrollPos
.L0807F360: .4byte gPlaySt
.L0807F364:
	ldr r2, .L0807F3D8 @ =gPrepItemListData
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
.L0807F3D8: .4byte gPrepItemListData
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
	ldr r0, .L0807F49C @ =gPrepMenuScrollPos
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
	ldr r4, .L0807F4A0 @ =gPrepItemListData
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
.L0807F49C: .4byte gPrepMenuScrollPos
.L0807F4A0: .4byte gPrepItemListData
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
	ldr r0, .L0807F550 @ =gPrepTexts1 + 0x50
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
	ldr r1, .L0807F554 @ =gPrepItemListData
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
	bl PrepAllItems_PutPName
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
.L0807F550: .4byte gPrepTexts1 + 0x50
.L0807F554: .4byte gPrepItemListData
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
	ldr r1, .L0807F5C4 @ =gPrepItemListData
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
	bl PrepAllItems_PutPName
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
.L0807F5C4: .4byte gPrepItemListData
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
	ldr r3, .L0807F668 @ =gPrepMenuScrollPos
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
	ldr r0, .L0807F66C @ =gPrepTexts1 + 0x50
	adds r2, r1, #0
	mov r1, r8
	ldr r3, [r1, #0x54]
	movs r1, #0
	str r1, [sp]
	movs r1, #1
	bl func_fe6_0807DB80
	mov r0, r8
	bl func_fe6_0807D358
	ldr r1, .L0807F670 @ =gPrepItemListData
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
	bl PrepAllItems_PutPName
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
.L0807F668: .4byte gPrepMenuScrollPos
.L0807F66C: .4byte gPrepTexts1 + 0x50
.L0807F670: .4byte gPrepItemListData
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
	ldr r1, .L0807F704 @ =gPrepItemListData
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
	bl PrepAllItems_PutPName
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
.L0807F704: .4byte gPrepItemListData
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
	ldr r0, .L0807F960 @ =gPrepTexts1 + 0x50
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
	ldr r1, .L0807F964 @ =gPrepItemListData
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
	ldr r0, .L0807F968 @ =gPrepMenuScrollPos
	ldrh r0, [r0]
	cmp r0, #0
	bne .L0807F94C
.L0807F940:
	ldr r0, .L0807F96C @ =gPrepTexts3 + 0x8
	ldrb r1, [r1]
	movs r2, #0x18
	movs r3, #0
	bl PrepAllItems_PutPName
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
.L0807F960: .4byte gPrepTexts1 + 0x50
.L0807F964: .4byte gPrepItemListData
.L0807F968: .4byte gPrepMenuScrollPos
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
	ldr r0, .L0807FA74 @ =gPrepTexts1 + 0x50
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
	ldr r1, .L0807FA78 @ =gPrepItemListData
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
	ldr r0, .L0807FA7C @ =gPrepMenuScrollPos
	ldrh r0, [r0]
	cmp r0, #0
	bne .L0807FA5C
.L0807FA50:
	ldr r0, .L0807FA80 @ =gPrepTexts3 + 0x8
	ldrb r1, [r1]
	movs r2, #0x18
	movs r3, #0
	bl PrepAllItems_PutPName
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
.L0807FA74: .4byte gPrepTexts1 + 0x50
.L0807FA78: .4byte gPrepItemListData
.L0807FA7C: .4byte gPrepMenuScrollPos
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
	ldr r0, .L0807FB20 @ =gPrepMenuScrollPos
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
.L0807FB20: .4byte gPrepMenuScrollPos
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
	ldr r4, .L0807FBC8 @ =gPrepItemListData
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
.L0807FBC8: .4byte gPrepItemListData
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
