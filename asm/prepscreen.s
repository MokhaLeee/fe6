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
	ldr r6, .L0807D45C @ =gPrepMenuScrollPos
	ldrh r0, [r6]
	cmp r0, #0
	beq .L0807D3D8
	ldr r2, .L0807D460 @ =gPrepItemListData
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
	ldr r6, .L0807D460 @ =gPrepItemListData
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
	ldr r0, .L0807D45C @ =gPrepMenuScrollPos
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
.L0807D45C: .4byte gPrepMenuScrollPos
.L0807D460: .4byte gPrepItemListData
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
	ldr r0, .L0807D4FC @ =gPrepMenuScrollPos
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
.L0807D4FC: .4byte gPrepMenuScrollPos
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
	bl IsItemDisplayUsable
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
	ldr r1, .L0807D8A8 @ =gPrepMenuScrollPos
	movs r0, #0
	strh r0, [r1]
	movs r4, #0
	ldr r0, .L0807D8AC @ =gPrepAllItemsCount
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
	ldr r1, .L0807D8B8 @ =gPrepItemListData
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
	ldr r0, .L0807D8AC @ =gPrepAllItemsCount
	ldrh r0, [r0]
	cmp r4, r0
	blt .L0807D866
.L0807D8A2:
	movs r2, #1
	b .L0807D8C2
	.align 2, 0
.L0807D8A8: .4byte gPrepMenuScrollPos
.L0807D8AC: .4byte gPrepAllItemsCount
.L0807D8B0: .4byte gUnk_08679354
.L0807D8B4: .4byte gPrepTexts4
.L0807D8B8: .4byte gPrepItemListData
.L0807D8BC:
	lsls r0, r2, #1
	adds r0, r0, r2
	adds r2, r0, #1
.L0807D8C2:
	ldr r1, .L0807D8E0 @ =gPrepMenuScrollPos
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
.L0807D8E0: .4byte gPrepMenuScrollPos
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
	ldr r0, .L0807D9D4 @ =gPrepMenuScrollPos
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
	ldr r0, .L0807D9D8 @ =gPrepAllItemsCount
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
	ldr r1, .L0807D9E0 @ =gPrepItemListData
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
	ldr r0, .L0807D9D4 @ =gPrepMenuScrollPos
	ldrh r0, [r0]
	adds r0, r0, r7
	lsls r0, r0, #2
	add r0, sb
	ldr r1, [r5]
	str r1, [r0]
	adds r7, #1
.L0807D9A8:
	adds r4, #1
	ldr r0, .L0807D9D8 @ =gPrepAllItemsCount
	ldrh r0, [r0]
	cmp r4, r0
	blt .L0807D976
.L0807D9B2:
	ldr r0, .L0807D9E0 @ =gPrepItemListData
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
.L0807D9D4: .4byte gPrepMenuScrollPos
.L0807D9D8: .4byte gPrepAllItemsCount
.L0807D9DC: .4byte gUnk_08679354
.L0807D9E0: .4byte gPrepItemListData
