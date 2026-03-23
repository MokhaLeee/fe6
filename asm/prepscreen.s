	.include "macro.inc"

	.syntax unified

	thumb_func_start func_fe6_0807D358
func_fe6_0807D358: @ 0x0807D358
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0x50
	mov r8, r0
	adds r0, #0x50
	ldrh r0, [r0]
	lsrs r0, r0, #4
	mov sb, r0
	mov r0, r8
	ldr r7, [r0, #0x54]
	adds r0, r7, #0
	bl GetUnitItemCount
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	movs r5, #0
	movs r4, #0
	cmp r4, r6
	bhs .L0807D3A6
.L0807D382:
	lsls r1, r4, #1
	adds r0, r7, #0
	adds r0, #0x1c
	adds r0, r0, r1
	ldrh r0, [r0]
	bl GetItemIcon
	lsls r1, r5, #2
	add r1, sp
	str r0, [r1]
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, r6
	blo .L0807D382
.L0807D3A6:
	ldr r6, .L0807D45C @ =gPrep_Unk_0201636A
	ldrh r0, [r6]
	cmp r0, #0
	beq .L0807D3D8
	ldr r2, .L0807D460 @ =gPrepItemlData
	mov r0, r8
	adds r0, #0x50
	ldrh r0, [r0]
	lsrs r0, r0, #4
	mov r1, r8
	adds r1, #0x2e
	ldrb r1, [r1]
	adds r0, r1, r0
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrh r0, [r0, #2]
	bl GetItemKind
	lsls r1, r5, #2
	add r1, sp
	adds r0, #0x70
	str r0, [r1]
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
.L0807D3D8:
	mov r0, sb
	cmp r0, #0
	beq .L0807D3E6
	subs r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sb, r0
.L0807D3E6:
	mov r4, sb
	adds r0, r4, #0
	adds r0, #9
	cmp r4, r0
	bge .L0807D424
	ldrh r6, [r6]
	cmp r4, r6
	bhs .L0807D424
	ldr r6, .L0807D460 @ =gPrepItemlData
.L0807D3F8:
	lsls r0, r4, #2
	adds r0, r0, r6
	ldrh r0, [r0, #2]
	bl GetItemIcon
	lsls r1, r5, #2
	add r1, sp
	str r0, [r1]
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	mov r0, sb
	adds r0, #9
	cmp r4, r0
	bge .L0807D424
	ldr r0, .L0807D45C @ =gPrep_Unk_0201636A
	ldrh r0, [r0]
	cmp r4, r0
	blo .L0807D3F8
.L0807D424:
	cmp r5, #0x13
	bhi .L0807D43A
	movs r1, #0xff
.L0807D42A:
	lsls r0, r5, #2
	add r0, sp
	str r1, [r0]
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0x13
	bls .L0807D42A
.L0807D43A:
	movs r4, #0
	ldr r7, .L0807D464 @ =gPrepSubMenuIcons
.L0807D43E:
	ldr r0, .L0807D464 @ =gPrepSubMenuIcons
	lsls r1, r4, #2
	adds r0, r1, r0
	ldr r3, [r0]
	adds r6, r4, #1
	adds r5, r1, #0
	cmp r3, #0xff
	beq .L0807D492
	movs r4, #0
	movs r2, #0
	ldr r0, [sp]
	cmp r3, r0
	bne .L0807D468
	movs r4, #1
	b .L0807D492
	.align 2, 0
.L0807D45C: .4byte gPrep_Unk_0201636A
.L0807D460: .4byte gPrepItemlData
.L0807D464: .4byte gPrepSubMenuIcons
.L0807D468:
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0x13
	bhi .L0807D482
	adds r1, r5, r7
	lsls r0, r2, #2
	add r0, sp
	ldr r1, [r1]
	ldr r0, [r0]
	cmp r1, r0
	bne .L0807D468
	movs r4, #1
.L0807D482:
	cmp r4, #0
	bne .L0807D492
	adds r4, r5, r7
	ldr r0, [r4]
	bl ClearIcon
	movs r0, #0xff
	str r0, [r4]
.L0807D492:
	lsls r0, r6, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0x13
	bls .L0807D43E
	add sp, #0x50
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start func_fe6_0807D4A8
func_fe6_0807D4A8: @ 0x0807D4A8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	str r2, [sp, #8]
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	str r1, [sp, #4]
	ldr r6, [r3, #0x2c]
	adds r0, r6, #0
	adds r0, #0x34
	bl ClearText
	adds r0, r6, #0
	adds r0, #0x3c
	bl ClearText
	adds r0, r6, #0
	adds r0, #0x44
	bl ClearText
	ldr r0, .L0807D4FC @ =gPrep_Unk_0201636A
	ldrh r0, [r0]
	cmp r0, #0
	bne .L0807D508
	ldr r0, .L0807D500 @ =gBg0Tm
	movs r1, #0xe
	movs r2, #0x13
	movs r3, #0
	bl TmFillRect_thm
	ldr r0, .L0807D504 @ =gBg1Tm
	movs r1, #0xe
	movs r2, #0x13
	movs r3, #0
	bl TmFillRect_thm
	b .L0807D692
	.align 2, 0
.L0807D4FC: .4byte gPrep_Unk_0201636A
.L0807D500: .4byte gBg0Tm
.L0807D504: .4byte gBg1Tm
.L0807D508:
	movs r0, #0
	str r0, [sp]
	adds r0, r7, #0
	ldr r1, [sp, #4]
	movs r2, #0xe
	movs r3, #8
	bl PutUiWindowFrame
	ldr r0, [sp, #8]
	bl GetItemKind
	cmp r0, #9
	beq .L0807D530
	cmp r0, #9
	bgt .L0807D52C
	cmp r0, #4
	beq .L0807D530
	b .L0807D578
.L0807D52C:
	cmp r0, #0xb
	bne .L0807D578
.L0807D530:
	ldr r0, [sp, #8]
	bl GetItemUseDescMsg
	bl DecodeMsg
	adds r4, r0, #0
	ldr r0, [sp, #4]
	adds r0, #1
	adds r6, #0x34
	lsls r0, r0, #5
	adds r0, #1
	adds r5, r0, r7
	b .L0807D550
.L0807D54A:
	adds r4, #1
	adds r5, #0x40
	adds r6, #8
.L0807D550:
	lsls r1, r5, #1
	ldr r0, .L0807D574 @ =gBg0Tm
	adds r1, r1, r0
	str r4, [sp]
	adds r0, r6, #0
	movs r2, #0
	movs r3, #0
	bl PrepPutText
	adds r0, r4, #0
	bl GetStringLineEnd
	adds r4, r0, #0
	ldrb r0, [r4]
	cmp r0, #0
	bne .L0807D54A
	b .L0807D692
	.align 2, 0
.L0807D574: .4byte gBg0Tm
.L0807D578:
	adds r5, r6, #0
	adds r5, #0x44
	ldr r3, .L0807D6A8 @ =gUnk_0832726C
	adds r0, r5, #0
	movs r1, #0
	movs r2, #0
	bl Text_InsertDrawString
	adds r4, r6, #0
	adds r4, #0x34
	ldr r3, .L0807D6AC @ =gUnk_08327274
	adds r0, r4, #0
	movs r1, #2
	movs r2, #0
	bl Text_InsertDrawString
	adds r6, #0x3c
	mov sl, r6
	ldr r3, .L0807D6B0 @ =gUnk_0832727C
	mov r0, sl
	movs r1, #2
	movs r2, #0
	bl Text_InsertDrawString
	ldr r3, .L0807D6B4 @ =gUnk_08327284
	adds r0, r4, #0
	movs r1, #0x32
	movs r2, #0
	bl Text_InsertDrawString
	ldr r3, .L0807D6B8 @ =gUnk_0832728C
	mov r0, sl
	movs r1, #0x32
	movs r2, #0
	bl Text_InsertDrawString
	ldr r6, [sp, #4]
	adds r6, #3
	lsls r6, r6, #5
	adds r1, r6, #1
	adds r1, r1, r7
	lsls r1, r1, #1
	ldr r0, .L0807D6BC @ =gBg0Tm
	mov sb, r0
	add r1, sb
	adds r0, r4, #0
	bl PutText
	ldr r0, [sp, #4]
	adds r0, #1
	lsls r0, r0, #5
	mov r8, r0
	mov r1, r8
	adds r1, #5
	adds r1, r1, r7
	lsls r1, r1, #1
	add r1, sb
	adds r0, r5, #0
	bl PutText
	ldr r5, [sp, #4]
	adds r5, #5
	lsls r5, r5, #5
	adds r1, r5, #1
	adds r1, r1, r7
	lsls r1, r1, #1
	add r1, sb
	mov r0, sl
	bl PutText
	adds r4, r6, #5
	adds r4, r4, r7
	lsls r4, r4, #1
	add r4, sb
	ldr r0, [sp, #8]
	bl GetItemMight
	adds r2, r0, #0
	adds r0, r4, #0
	movs r1, #2
	bl PutNumber
	adds r4, r5, #5
	adds r4, r4, r7
	lsls r4, r4, #1
	add r4, sb
	ldr r0, [sp, #8]
	bl GetItemHit
	adds r2, r0, #0
	adds r0, r4, #0
	movs r1, #2
	bl PutNumber
	adds r6, #0xb
	adds r6, r6, r7
	lsls r6, r6, #1
	add r6, sb
	ldr r0, [sp, #8]
	bl GetItemCrit
	adds r2, r0, #0
	adds r0, r6, #0
	movs r1, #2
	bl PutNumber
	adds r5, #0xb
	adds r5, r5, r7
	lsls r5, r5, #1
	add r5, sb
	ldr r0, [sp, #8]
	bl GetItemWeight
	adds r2, r0, #0
	adds r0, r5, #0
	movs r1, #2
	bl PutNumber
	movs r0, #7
	add r8, r0
	add r8, r7
	mov r0, r8
	lsls r0, r0, #1
	mov r8, r0
	add r8, sb
	ldr r0, [sp, #8]
	bl GetItemKind
	adds r1, r0, #0
	adds r1, #0x70
	movs r2, #0xa0
	lsls r2, r2, #7
	mov r0, r8
	bl PutIcon
	ldr r0, [sp, #8]
	bl GetItemKind
	adds r0, #0x70
	bl func_fe6_0807D2F4
.L0807D692:
	movs r0, #3
	bl EnableBgSync
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0807D6A8: .4byte gUnk_0832726C
.L0807D6AC: .4byte gUnk_08327274
.L0807D6B0: .4byte gUnk_0832727C
.L0807D6B4: .4byte gUnk_08327284
.L0807D6B8: .4byte gUnk_0832728C
.L0807D6BC: .4byte gBg0Tm

	thumb_func_start func_fe6_0807D6C0
func_fe6_0807D6C0: @ 0x0807D6C0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	str r1, [sp, #4]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	adds r0, r1, #0
	bl GetUnitItemCount
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #8]
	movs r0, #0
	mov sl, r0
	ldr r2, [sp]
	lsls r1, r2, #2
	adds r0, r1, r2
	lsls r5, r0, #4
	adds r6, r1, #0
	lsls r3, r2, #3
	str r3, [sp, #0x14]
	subs r0, r3, r2
	lsls r4, r0, #1
.L0807D6F6:
	mov r1, sl
	lsls r0, r1, #3
	ldr r1, .L0807D82C @ =gPrepTexts1
	adds r0, r0, r1
	adds r0, r5, r0
	bl ClearText
	mov r2, sl
	lsls r0, r2, #6
	movs r3, #0x91
	lsls r3, r3, #1
	adds r0, r0, r3
	adds r0, r0, r4
	lsls r0, r0, #1
	ldr r1, .L0807D830 @ =gBg0Tm
	adds r0, r0, r1
	movs r1, #0xb
	movs r2, #1
	movs r3, #0
	bl TmFillRect_thm
	mov r0, sl
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sl, r0
	cmp r0, #4
	bls .L0807D6F6
	movs r0, #0
	mov sl, r0
	ldr r1, [sp, #8]
	cmp sl, r1
	bhs .L0807D816
	ldr r2, [sp]
	adds r0, r6, r2
	lsls r0, r0, #4
	str r0, [sp, #0xc]
.L0807D740:
	mov r3, sl
	lsls r5, r3, #1
	ldr r0, [sp, #4]
	adds r0, #0x1c
	adds r0, r0, r5
	mov r8, r0
	ldrh r1, [r0]
	ldr r0, [sp, #4]
	bl IsItemDisplayUseable
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	rsbs r2, r0, #0
	orrs r2, r0
	mov r1, sl
	lsls r0, r1, #3
	ldr r1, .L0807D82C @ =gPrepTexts1
	adds r0, r0, r1
	ldr r3, [sp, #0xc]
	adds r4, r3, r0
	movs r1, #0
	lsrs r2, r2, #0x1f
	str r2, [sp, #0x10]
	cmp r2, #0
	bne .L0807D774
	movs r1, #1
.L0807D774:
	adds r0, r4, #0
	bl Text_SetColor
	adds r0, r4, #0
	movs r1, #0
	bl Text_SetCursor
	mov r1, r8
	ldrh r0, [r1]
	bl GetItemName
	adds r1, r0, #0
	adds r0, r4, #0
	bl Text_DrawString
	adds r0, r5, #0
	adds r0, #9
	lsls r6, r0, #5
	adds r1, r6, #4
	ldr r2, [sp, #0x14]
	ldr r3, [sp]
	subs r0, r2, r3
	lsls r5, r0, #1
	adds r1, r1, r5
	lsls r1, r1, #1
	ldr r0, .L0807D830 @ =gBg0Tm
	mov sb, r0
	add r1, sb
	adds r0, r4, #0
	bl PutText
	adds r0, r6, #0
	adds r0, #0xd
	adds r0, r0, r5
	lsls r0, r0, #1
	mov r1, sb
	adds r4, r0, r1
	movs r7, #1
	ldr r2, [sp, #0x10]
	cmp r2, #0
	beq .L0807D7C8
	movs r7, #2
.L0807D7C8:
	mov r3, r8
	ldrh r0, [r3]
	bl GetItemUses
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r7, #0
	bl PutNumberOrBlank
	adds r4, r6, #2
	adds r4, r4, r5
	lsls r4, r4, #1
	add r4, sb
	mov r1, r8
	ldrh r0, [r1]
	bl GetItemIcon
	adds r1, r0, #0
	adds r0, r4, #0
	movs r2, #0x80
	lsls r2, r2, #7
	bl PutIcon
	mov r2, r8
	ldrh r0, [r2]
	bl GetItemIcon
	bl func_fe6_0807D2F4
	mov r0, sl
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sl, r0
	cmp r0, #4
	bhi .L0807D816
	ldr r3, [sp, #8]
	cmp sl, r3
	blo .L0807D740
.L0807D816:
	movs r0, #1
	bl EnableBgSync
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0807D82C: .4byte gPrepTexts1
.L0807D830: .4byte gBg0Tm

	thumb_func_start func_fe6_0807D834
func_fe6_0807D834: @ 0x0807D834
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x18
	mov sl, r0
	ldr r1, .L0807D8A8 @ =gPrep_Unk_0201636A
	movs r0, #0
	strh r0, [r1]
	movs r4, #0
	ldr r0, .L0807D8AC @ =gPrep_Unk_02016368
	ldrh r0, [r0]
	cmp r4, r0
	bge .L0807D8A2
	ldr r7, .L0807D8B0 @ =gUnk_08679354
	mov r0, sl
	adds r0, #1
	adds r0, r0, r7
	mov r8, r0
	ldr r0, .L0807D8B4 @ =gPrepTexts4
	mov sb, r0
	adds r6, r1, #0
.L0807D866:
	ldr r1, .L0807D8B8 @ =gPrepItemlData
	lsls r0, r4, #2
	adds r5, r0, r1
	ldrh r0, [r5, #2]
	bl GetItemKind
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	mov r2, sl
	adds r0, r2, r7
	ldrb r0, [r0]
	cmp r1, r0
	blo .L0807D898
	mov r0, r8
	ldrb r0, [r0]
	cmp r1, r0
	bhi .L0807D898
	ldrh r1, [r6]
	lsls r0, r1, #2
	add r0, sb
	ldr r1, [r5]
	str r1, [r0]
	ldrh r0, [r6]
	adds r0, #1
	strh r0, [r6]
.L0807D898:
	adds r4, #1
	ldr r0, .L0807D8AC @ =gPrep_Unk_02016368
	ldrh r0, [r0]
	cmp r4, r0
	blt .L0807D866
.L0807D8A2:
	movs r2, #1
	b .L0807D8C2
	.align 2, 0
.L0807D8A8: .4byte gPrep_Unk_0201636A
.L0807D8AC: .4byte gPrep_Unk_02016368
.L0807D8B0: .4byte gUnk_08679354
.L0807D8B4: .4byte gPrepTexts4
.L0807D8B8: .4byte gPrepItemlData
.L0807D8BC:
	lsls r0, r2, #1
	adds r0, r0, r2
	adds r2, r0, #1
.L0807D8C2:
	ldr r1, .L0807D8E0 @ =gPrep_Unk_0201636A
	ldrh r0, [r1]
	movs r1, #3
	str r2, [sp]
	bl __udivsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r2, [sp]
	cmp r2, r0
	blt .L0807D8BC
	cmp r2, #0
	ble .L0807D95C
.L0807D8DC:
	adds r4, r2, #0
	b .L0807D946
	.align 2, 0
.L0807D8E0: .4byte gPrep_Unk_0201636A
.L0807D8E4:
	subs r7, r4, r2
	adds r4, #1
	mov sb, r4
	cmp r7, #0
	blt .L0807D944
	ldr r1, .L0807D9D0 @ =gPrepTexts4
	mov r8, r1
.L0807D8F2:
	lsls r0, r7, #2
	mov r1, r8
	adds r6, r0, r1
	ldrh r0, [r6, #2]
	str r2, [sp]
	bl GetItemIid
	adds r4, r0, #0
	ldr r2, [sp]
	adds r0, r7, r2
	lsls r0, r0, #2
	mov r1, r8
	adds r5, r0, r1
	ldrh r0, [r5, #2]
	bl GetItemIid
	ldr r2, [sp]
	cmp r4, r0
	bgt .L0807D936
	ldrh r0, [r6, #2]
	str r2, [sp]
	bl GetItemIid
	adds r4, r0, #0
	ldrh r0, [r5, #2]
	bl GetItemIid
	ldr r2, [sp]
	cmp r4, r0
	bne .L0807D944
	ldrh r0, [r6, #2]
	ldrh r1, [r5, #2]
	cmp r0, r1
	bls .L0807D93E
.L0807D936:
	ldr r1, [r6]
	ldr r0, [r5]
	str r0, [r6]
	str r1, [r5]
.L0807D93E:
	subs r7, r7, r2
	cmp r7, #0
	bge .L0807D8F2
.L0807D944:
	mov r4, sb
.L0807D946:
	ldr r0, .L0807D9D4 @ =gPrep_Unk_0201636A
	ldrh r0, [r0]
	cmp r4, r0
	blt .L0807D8E4
	adds r0, r2, #0
	movs r1, #3
	bl __divsi3
	adds r2, r0, #0
	cmp r2, #0
	bgt .L0807D8DC
.L0807D95C:
	movs r7, #0
	movs r4, #0
	ldr r0, .L0807D9D8 @ =gPrep_Unk_02016368
	ldrh r0, [r0]
	cmp r4, r0
	bge .L0807D9B2
	ldr r6, .L0807D9DC @ =gUnk_08679354
	mov r0, sl
	adds r0, #1
	adds r0, r0, r6
	mov r8, r0
	ldr r2, .L0807D9D0 @ =gPrepTexts4
	mov sb, r2
.L0807D976:
	ldr r1, .L0807D9E0 @ =gPrepItemlData
	lsls r0, r4, #2
	adds r5, r0, r1
	ldrh r0, [r5, #2]
	bl GetItemKind
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	mov r2, sl
	adds r0, r2, r6
	ldrb r0, [r0]
	cmp r1, r0
	blo .L0807D998
	mov r0, r8
	ldrb r0, [r0]
	cmp r1, r0
	bls .L0807D9A8
.L0807D998:
	ldr r0, .L0807D9D4 @ =gPrep_Unk_0201636A
	ldrh r0, [r0]
	adds r0, r0, r7
	lsls r0, r0, #2
	add r0, sb
	ldr r1, [r5]
	str r1, [r0]
	adds r7, #1
.L0807D9A8:
	adds r4, #1
	ldr r0, .L0807D9D8 @ =gPrep_Unk_02016368
	ldrh r0, [r0]
	cmp r4, r0
	blt .L0807D976
.L0807D9B2:
	ldr r0, .L0807D9E0 @ =gPrepItemlData
	ldr r1, .L0807D9D0 @ =gPrepTexts4
	movs r2, #0xc8
	lsls r2, r2, #3
	bl memcpy
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0807D9D0: .4byte gPrepTexts4
.L0807D9D4: .4byte gPrep_Unk_0201636A
.L0807D9D8: .4byte gPrep_Unk_02016368
.L0807D9DC: .4byte gUnk_08679354
.L0807D9E0: .4byte gPrepItemlData

	thumb_func_start func_fe6_0807D9E4
func_fe6_0807D9E4: @ 0x0807D9E4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	mov sl, r0
	str r2, [sp]
	lsls r1, r1, #0x18
	lsrs r4, r1, #0x18
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	str r3, [sp, #4]
	ldr r5, .L0807DAC4 @ =gBg2Tm
	adds r0, r5, #0
	movs r1, #0
	bl TmFill
	ldr r6, .L0807DAC8 @ =gPrep_Unk_0201636A
	ldrh r0, [r6]
	cmp r0, #0
	bne .L0807DA40
	mov r0, sl
	bl ClearText
	mov r0, sl
	movs r1, #0
	bl Text_SetCursor
	mov r0, sl
	movs r1, #1
	bl Text_SetColor
	ldr r1, .L0807DACC @ =gUnk_08327294
	mov r0, sl
	bl Text_DrawString
	lsls r1, r4, #3
	subs r1, r1, r4
	lsls r1, r1, #2
	adds r0, r5, #0
	adds r0, #8
	adds r1, r1, r0
	mov r0, sl
	bl PutText
.L0807DA40:
	ldr r0, [sp, #4]
	mov r8, r0
	adds r0, #7
	cmp r8, r0
	blt .L0807DA4C
	b .L0807DB5E
.L0807DA4C:
	ldrh r6, [r6]
	cmp r8, r6
	blo .L0807DA54
	b .L0807DB5E
.L0807DA54:
	lsls r0, r4, #3
	subs r0, r0, r4
	lsls r0, r0, #1
	str r0, [sp, #8]
.L0807DA5C:
	movs r4, #7
	mov r1, r8
	ands r4, r1
	lsls r4, r4, #3
	add r4, sl
	adds r0, r4, #0
	bl ClearText
	adds r0, r4, #0
	movs r1, #0
	bl Text_SetCursor
	mov r0, r8
	lsls r6, r0, #1
	movs r4, #0x1f
	ands r4, r6
	lsls r4, r4, #5
	adds r4, #2
	ldr r1, [sp, #8]
	adds r4, r4, r1
	lsls r4, r4, #1
	ldr r0, .L0807DAC4 @ =gBg2Tm
	adds r4, r4, r0
	ldr r0, .L0807DAD0 @ =gPrepItemlData
	mov r1, r8
	lsls r5, r1, #2
	adds r7, r5, r0
	ldrh r0, [r7, #2]
	bl GetItemIcon
	adds r1, r0, #0
	adds r0, r4, #0
	movs r2, #0x80
	lsls r2, r2, #7
	bl PutIcon
	ldrh r0, [r7, #2]
	bl GetItemIcon
	bl func_fe6_0807D2F4
	ldr r0, [sp]
	cmp r0, #0
	beq .L0807DAC0
	ldrh r1, [r7, #2]
	bl IsItemDisplayUseable
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L0807DAD4
.L0807DAC0:
	movs r2, #1
	b .L0807DAD6
	.align 2, 0
.L0807DAC4: .4byte gBg2Tm
.L0807DAC8: .4byte gPrep_Unk_0201636A
.L0807DACC: .4byte gUnk_08327294
.L0807DAD0: .4byte gPrepItemlData
.L0807DAD4:
	movs r2, #0
.L0807DAD6:
	movs r0, #7
	mov r1, r8
	ands r0, r1
	lsls r0, r0, #3
	mov r1, sl
	adds r7, r1, r0
	movs r1, #0
	mov sb, r2
	cmp r2, #0
	bne .L0807DAEC
	movs r1, #1
.L0807DAEC:
	adds r0, r7, #0
	bl Text_SetColor
	ldr r0, .L0807DB74 @ =gPrepItemlData
	adds r5, r5, r0
	ldrh r0, [r5, #2]
	bl GetItemName
	adds r1, r0, #0
	adds r0, r7, #0
	bl Text_DrawString
	movs r4, #0x1f
	ands r4, r6
	lsls r4, r4, #5
	adds r1, r4, #4
	ldr r0, [sp, #8]
	adds r1, r1, r0
	lsls r1, r1, #1
	ldr r0, .L0807DB78 @ =gBg2Tm
	adds r1, r1, r0
	adds r0, r7, #0
	bl PutText
	adds r4, #0xd
	ldr r1, [sp, #8]
	adds r4, r4, r1
	lsls r4, r4, #1
	ldr r0, .L0807DB78 @ =gBg2Tm
	adds r4, r4, r0
	movs r6, #1
	mov r1, sb
	cmp r1, #0
	beq .L0807DB32
	movs r6, #2
.L0807DB32:
	ldrh r0, [r5, #2]
	bl GetItemUses
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r6, #0
	bl PutNumberOrBlank
	mov r0, r8
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	ldr r0, [sp, #4]
	adds r0, #7
	cmp r8, r0
	bge .L0807DB5E
	ldr r0, .L0807DB7C @ =gPrep_Unk_0201636A
	ldrh r0, [r0]
	cmp r8, r0
	bhs .L0807DB5E
	b .L0807DA5C
.L0807DB5E:
	movs r0, #4
	bl EnableBgSync
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0807DB74: .4byte gPrepItemlData
.L0807DB78: .4byte gBg2Tm
.L0807DB7C: .4byte gPrep_Unk_0201636A

	thumb_func_start func_fe6_0807DB80
func_fe6_0807DB80: @ 0x0807DB80
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	str r0, [sp]
	adds r7, r3, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov sl, r1
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov r8, r2
	movs r0, #0xf
	mov sb, r8
	mov r1, sb
	ands r1, r0
	mov sb, r1
	lsls r4, r1, #6
	mov r2, sl
	lsls r5, r2, #3
	subs r5, r5, r2
	lsls r5, r5, #1
	adds r0, r4, r5
	lsls r0, r0, #1
	ldr r6, .L0807DC14 @ =gBg2Tm
	adds r0, r0, r6
	movs r1, #0x10
	movs r2, #1
	movs r3, #0
	bl TmFillRect_thm
	movs r0, #7
	mov r1, r8
	ands r0, r1
	lsls r0, r0, #3
	ldr r2, [sp]
	adds r0, r2, r0
	bl ClearText
	adds r4, #2
	adds r4, r4, r5
	lsls r4, r4, #1
	adds r4, r4, r6
	ldr r1, .L0807DC18 @ =gPrepItemlData
	mov r2, r8
	lsls r0, r2, #2
	adds r5, r0, r1
	ldrh r0, [r5, #2]
	bl GetItemIcon
	adds r1, r0, #0
	movs r2, #0x80
	lsls r2, r2, #7
	adds r0, r4, #0
	bl PutIcon
	ldrh r0, [r5, #2]
	bl GetItemIcon
	bl func_fe6_0807D2F4
	cmp r7, #0
	beq .L0807DC10
	ldrh r1, [r5, #2]
	adds r0, r7, #0
	bl IsItemDisplayUseable
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L0807DC1C
.L0807DC10:
	movs r2, #1
	b .L0807DC1E
	.align 2, 0
.L0807DC14: .4byte gBg2Tm
.L0807DC18: .4byte gPrepItemlData
.L0807DC1C:
	movs r2, #0
.L0807DC1E:
	movs r0, #7
	mov r1, r8
	ands r0, r1
	lsls r0, r0, #3
	ldr r1, [sp]
	adds r7, r1, r0
	movs r1, #0
	str r2, [sp, #4]
	cmp r2, #0
	bne .L0807DC34
	movs r1, #1
.L0807DC34:
	adds r0, r7, #0
	bl Text_SetColor
	adds r0, r7, #0
	movs r1, #0
	bl Text_SetCursor
	ldr r1, .L0807DCB0 @ =gPrepItemlData
	mov r2, r8
	lsls r0, r2, #2
	adds r0, r0, r1
	mov r8, r0
	ldrh r0, [r0, #2]
	bl GetItemName
	adds r1, r0, #0
	adds r0, r7, #0
	bl Text_DrawString
	mov r0, sb
	lsls r4, r0, #6
	adds r1, r4, #4
	mov r2, sl
	lsls r5, r2, #3
	subs r5, r5, r2
	lsls r5, r5, #1
	adds r1, r1, r5
	lsls r1, r1, #1
	ldr r6, .L0807DCB4 @ =gBg2Tm
	adds r1, r1, r6
	adds r0, r7, #0
	bl PutText
	adds r4, #0xd
	adds r4, r4, r5
	lsls r4, r4, #1
	adds r4, r4, r6
	movs r5, #1
	ldr r0, [sp, #4]
	cmp r0, #0
	beq .L0807DC88
	movs r5, #2
.L0807DC88:
	mov r1, r8
	ldrh r0, [r1, #2]
	bl GetItemUses
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	bl PutNumberOrBlank
	movs r0, #4
	bl EnableBgSync
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0807DCB0: .4byte gPrepItemlData
.L0807DCB4: .4byte gBg2Tm

	thumb_func_start func_fe6_0807DCB8
func_fe6_0807DCB8: @ 0x0807DCB8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r5, r0, #0
	lsls r1, r1, #0x18
	lsrs r4, r1, #0x18
	adds r6, r4, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	mov r8, r2
	mov r0, r8
	str r0, [sp]
	lsls r3, r3, #0x18
	lsrs r7, r3, #0x18
	mov sl, r7
	ldr r0, .L0807DD04 @ =gBg0Tm+0x1E
	mov sb, r0
	movs r1, #0xf
	movs r2, #1
	movs r3, #0
	bl TmFillRect_thm
	ldr r0, .L0807DD08 @ =gPrep_Unk_0201636A
	ldrh r0, [r0]
	cmp r0, #0
	bne .L0807DD0C
	mov r0, sb
	adds r0, #0xa
	movs r1, #9
	movs r2, #1
	movs r3, #0
	bl TmFillRect_thm
	b .L0807DDB0
	.align 2, 0
.L0807DD04: .4byte gBg0Tm+0x1E
.L0807DD08: .4byte gPrep_Unk_0201636A
.L0807DD0C:
	cmp r4, #0
	bne .L0807DD58
	adds r0, r5, #0
	bl ClearText
	adds r0, r5, #0
	movs r1, #0
	bl Text_SetColor
	ldr r4, .L0807DD54 @ =gUnk_083272A4
	adds r0, r4, #0
	bl GetStringTextLen
	movs r1, #0x28
	subs r1, r1, r0
	lsrs r0, r1, #0x1f
	adds r1, r1, r0
	asrs r1, r1, #1
	adds r0, r5, #0
	bl Text_SetCursor
	adds r0, r5, #0
	adds r1, r4, #0
	bl Text_DrawString
	lsls r1, r7, #5
	add r1, r8
	lsls r1, r1, #1
	mov r0, sb
	subs r0, #0x1e
	adds r1, r1, r0
	adds r0, r5, #0
	bl PutText
	b .L0807DDB0
	.align 2, 0
.L0807DD54: .4byte gUnk_083272A4
.L0807DD58:
	adds r0, r6, #0
	bl GetUnitByPid
	adds r4, r0, #0
	adds r0, r5, #0
	bl ClearText
	adds r0, r5, #0
	movs r1, #0
	bl Text_SetColor
	ldr r0, [r4]
	ldrh r0, [r0]
	bl DecodeMsg
	bl GetStringTextLen
	movs r1, #0x28
	subs r1, r1, r0
	lsrs r0, r1, #0x1f
	adds r1, r1, r0
	asrs r1, r1, #1
	adds r0, r5, #0
	bl Text_SetCursor
	ldr r0, [r4]
	ldrh r0, [r0]
	bl DecodeMsg
	adds r1, r0, #0
	adds r0, r5, #0
	bl Text_DrawString
	mov r0, sl
	lsls r1, r0, #5
	ldr r0, [sp]
	adds r1, r1, r0
	lsls r1, r1, #1
	mov r0, sb
	subs r0, #0x1e
	adds r1, r1, r0
	adds r0, r5, #0
	bl PutText
.L0807DDB0:
	movs r0, #1
	bl EnableBgSync
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_fe6_0807DDC8
func_fe6_0807DDC8: @ 0x0807DDC8
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #4
	adds r5, r0, #0
	adds r4, r1, #0
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	bl GetTotalSupplyItemCount
	adds r6, r0, #0
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	lsls r4, r4, #5
	subs r0, r4, #3
	adds r0, r0, r5
	lsls r0, r0, #1
	ldr r1, .L0807DE54 @ =gBg0Tm
	mov r8, r1
	add r0, r8
	movs r1, #6
	movs r2, #1
	movs r3, #0
	bl TmFillRect_thm
	ldr r0, .L0807DE58 @ =gPrepTexts3 + 0x8
	mov r1, r8
	adds r1, #0x24
	ldr r2, .L0807DE5C @ =gUnk_083272A4
	str r2, [sp]
	movs r2, #0
	movs r3, #4
	bl PrepPutText
	adds r0, r4, r5
	lsls r0, r0, #1
	add r0, r8
	movs r1, #2
	adds r2, r6, #0
	bl PutNumber
	adds r0, r4, #4
	adds r0, r0, r5
	lsls r0, r0, #1
	add r0, r8
	movs r1, #2
	movs r2, #0x64
	bl PutNumber
	adds r4, #1
	adds r4, r4, r5
	lsls r4, r4, #1
	add r4, r8
	adds r0, r4, #0
	movs r1, #2
	movs r2, #0x16
	bl PutSpecialChar
	movs r0, #1
	bl EnableBgSync
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L0807DE54: .4byte gBg0Tm
.L0807DE58: .4byte gPrepTexts3 + 0x8
.L0807DE5C: .4byte gUnk_083272A4

	thumb_func_start func_fe6_0807DE60
func_fe6_0807DE60: @ 0x0807DE60
	push {r4, r5, r6, lr}
	bl GetSupplyItems
	adds r4, r0, #0
	movs r2, #0
	movs r3, #0
	ldr r0, .L0807DEC0 @ =gPrep_Unk_02016368
	ldrh r1, [r0]
	cmp r2, r1
	bhs .L0807DE9C
	ldr r6, .L0807DEC4 @ =gPrepItemlData
	adds r5, r0, #0
.L0807DE78:
	lsls r0, r3, #2
	adds r1, r0, r6
	ldrb r0, [r1]
	cmp r0, #0
	bne .L0807DE90
	lsls r0, r2, #1
	adds r0, r0, r4
	ldrh r1, [r1, #2]
	strh r1, [r0]
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
.L0807DE90:
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	ldrh r0, [r5]
	cmp r3, r0
	blo .L0807DE78
.L0807DE9C:
	cmp r2, #0x63
	bhi .L0807DEB2
	movs r1, #0
.L0807DEA2:
	lsls r0, r2, #1
	adds r0, r0, r4
	strh r1, [r0]
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0x63
	bls .L0807DEA2
.L0807DEB2:
	movs r0, #0x18
	movs r1, #0
	bl func_fe6_0807DDC8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L0807DEC0: .4byte gPrep_Unk_02016368
.L0807DEC4: .4byte gPrepItemlData

	thumb_func_start func_fe6_0807DEC8
func_fe6_0807DEC8: @ 0x0807DEC8
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	lsls r0, r1, #0x10
	lsrs r0, r0, #0x10
	bl GetItemKind
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	movs r2, #0
	ldr r0, .L0807DF58 @ =gUnk_08679354
	ldrb r1, [r0]
	cmp r3, r1
	beq .L0807DF0A
	ldrb r1, [r0, #1]
	cmp r3, r1
	beq .L0807DF0A
	adds r4, r0, #0
.L0807DEEC:
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #8
	bhi .L0807DF0A
	lsls r1, r2, #1
	adds r0, r1, r4
	ldrb r0, [r0]
	cmp r3, r0
	beq .L0807DF0A
	adds r0, r1, #1
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r3, r0
	bne .L0807DEEC
.L0807DF0A:
	adds r5, r6, #0
	adds r5, #0x46
	ldrb r0, [r5]
	cmp r0, r2
	beq .L0807DF4E
	strb r2, [r5]
	adds r0, r6, #0
	adds r0, #0x32
	adds r0, r2, r0
	ldrb r0, [r0]
	lsls r0, r0, #4
	adds r4, r6, #0
	adds r4, #0x50
	strh r0, [r4]
	ldrb r0, [r5]
	bl func_fe6_0807D834
	ldrb r0, [r5]
	adds r0, #0x3b
	adds r0, r6, r0
	adds r1, r4, #0
	bl func_fe6_080823A0
	ldr r0, .L0807DF5C @ =gPrepTexts2
	ldr r2, [r6, #0x54]
	ldrh r4, [r4]
	lsrs r3, r4, #4
	movs r1, #1
	str r1, [sp]
	bl func_fe6_0807D9E4
	adds r0, r6, #0
	bl func_fe6_0807D358
.L0807DF4E:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L0807DF58: .4byte gUnk_08679354
.L0807DF5C: .4byte gPrepTexts2

	thumb_func_start func_fe6_0807DF60
func_fe6_0807DF60: @ 0x0807DF60
	push {r4, r5, r6, r7, lr}
	lsls r1, r1, #0x18
	lsls r2, r2, #0x10
	lsrs r5, r2, #0x10
	ldr r6, .L0807DFD4 @ =gPrepItemlData
	lsls r4, r5, #2
	adds r4, r4, r6
	ldr r3, [r4]
	lsrs r1, r1, #0x17
	adds r2, r0, #0
	adds r2, #0x1c
	adds r2, r2, r1
	ldrh r1, [r2]
	strh r1, [r4, #2]
	lsrs r3, r3, #0x10
	strh r3, [r2]
	bl UnitRemoveInvalidItems
	ldrh r0, [r4, #2]
	cmp r0, #0
	bne .L0807DFE0
	adds r2, r5, #0
	ldr r0, .L0807DFD8 @ =gPrep_Unk_02016368
	adds r4, r0, #0
	ldr r7, .L0807DFDC @ =gPrep_Unk_0201636A
	ldrh r0, [r4]
	cmp r2, r0
	bhs .L0807DFC0
	adds r3, r6, #0
	adds r5, r4, #0
.L0807DF9C:
	lsls r0, r2, #2
	adds r1, r0, r3
	adds r2, #1
	lsls r0, r2, #2
	adds r0, r0, r3
	ldr r0, [r0]
	str r0, [r1]
	ldrb r0, [r1]
	cmp r0, #0
	bne .L0807DFB6
	ldrb r0, [r1, #1]
	subs r0, #1
	strb r0, [r1, #1]
.L0807DFB6:
	lsls r0, r2, #0x10
	lsrs r2, r0, #0x10
	ldrh r0, [r5]
	cmp r2, r0
	blo .L0807DF9C
.L0807DFC0:
	ldrh r0, [r7]
	subs r0, #1
	strh r0, [r7]
	ldrh r0, [r4]
	subs r0, #1
	strh r0, [r4]
	bl func_fe6_0807DE60
	movs r0, #1
	b .L0807DFE6
	.align 2, 0
.L0807DFD4: .4byte gPrepItemlData
.L0807DFD8: .4byte gPrep_Unk_02016368
.L0807DFDC: .4byte gPrep_Unk_0201636A
.L0807DFE0:
	bl func_fe6_0807DE60
	movs r0, #0
.L0807DFE6:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start func_fe6_0807DFEC
func_fe6_0807DFEC: @ 0x0807DFEC
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r2, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r1, r1, #0x18
	ldr r3, .L0807E058 @ =gUnk_0831B068
	ldr r2, .L0807E05C @ =gPal
	lsrs r1, r1, #0x1a
	movs r0, #0xf
	ands r1, r0
	lsls r1, r1, #1
	adds r1, r1, r3
	ldrh r0, [r1]
	ldr r1, .L0807E060 @ =0x0000025A
	adds r2, r2, r1
	strh r0, [r2]
	bl EnablePalSync
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #2
	adds r6, r0, #0
	adds r6, #0x7c
	ldr r0, .L0807E064 @ =Sprites_08679330
	lsls r4, r4, #2
	adds r4, r4, r0
	ldr r3, [r4]
	adds r0, r5, #0
	cmp r5, #0
	bge .L0807E02E
	adds r0, #0x1f
.L0807E02E:
	asrs r0, r0, #5
	movs r1, #0x80
	lsls r1, r1, #6
	adds r4, r0, r1
	str r4, [sp]
	movs r0, #4
	adds r1, r6, #0
	movs r2, #0x18
	bl PutSprite
	ldr r3, .L0807E068 @ =Sprite_08679326
	str r4, [sp]
	movs r0, #4
	adds r1, r6, #0
	movs r2, #0x18
	bl PutSprite
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L0807E058: .4byte gUnk_0831B068
.L0807E05C: .4byte gPal
.L0807E060: .4byte 0x0000025A
.L0807E064: .4byte Sprites_08679330
.L0807E068: .4byte Sprite_08679326
