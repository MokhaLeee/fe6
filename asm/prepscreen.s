	.include "macro.inc"

	.syntax unified

	thumb_func_start func_fe6_0807D6C0
func_fe6_0807D6C0: @ 0x0807D6C0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18

	str r1, [sp, #4]		@ unit

	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]			@ index

	adds r0, r1, #0
	bl GetUnitItemCount
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #8]		@ item_count

	movs r0, #0
	mov r10, r0				@ i

	ldr r2, [sp]
	lsls r1, r2, #2
	adds r0, r1, r2
	lsls r5, r0, #4			@ r5: index * 0x50

	adds r6, r1, #0			@ r6: index * 4

	lsls r3, r2, #3
	str r3, [sp, #0x14]		@ sp+0x14: index * 8
	subs r0, r3, r2
	lsls r4, r0, #1 		@ r4: index * 14
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
	adds r0, r0, r4 @ i * 0x40 + 0x122 + index * 14
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
	str r0, [sp, #0xc] @ index * 0x50
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
	adds r1, r6, #4 @ (i * 2 + 9) * 0x20 + 4

	ldr r2, [sp, #0x14]
	ldr r3, [sp]
	subs r0, r2, r3
	lsls r5, r0, #1 @ index * 14

	adds r1, r1, r5
	lsls r1, r1, #1
	ldr r0, .L0807D830 @ =gBg0Tm
	mov sb, r0
	add r1, sb
	adds r0, r4, #0
	bl PutText

	adds r0, r6, #0
	adds r0, #0xd @ (i * 2 + 9) * 0x20 + 0xD
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
	bl PrepSubItem_InsertIcon
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

	ldr r7, .L0807D8B0 @ =PrepItemKindRefTable
	mov r0, sl
	adds r0, #1
	adds r0, r0, r7
	mov r8, r0				@ &PrepItemKindRefTable[convoy_page * 2 + 1]

	ldr r0, .L0807D8B4 @ =gPrepPageItemTable
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
.L0807D8B0: .4byte PrepItemKindRefTable
.L0807D8B4: .4byte gPrepPageItemTable
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
	ldr r1, .L0807D9D0 @ =gPrepPageItemTable
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
	ldr r6, .L0807D9DC @ =PrepItemKindRefTable
	mov r0, sl
	adds r0, #1
	adds r0, r0, r6
	mov r8, r0
	ldr r2, .L0807D9D0 @ =gPrepPageItemTable
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
	ldr r1, .L0807D9D0 @ =gPrepPageItemTable
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
.L0807D9D0: .4byte gPrepPageItemTable
.L0807D9D4: .4byte gPrepMenuScrollPos
.L0807D9D8: .4byte gPrepAllItemsCount
.L0807D9DC: .4byte PrepItemKindRefTable
.L0807D9E0: .4byte gPrepItemListData
