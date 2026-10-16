	.include "macro.inc"

	.syntax unified

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
	beq .switch_menu_pos
	ldr r0, .Lpool_gKeySt_close @ =gKeySt
	ldr r1, [r0]
	movs r0, #0x81
	lsls r0, r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq .switch_menu_pos
	cmp r2, #1
	beq .clear_empty_helpbox
	bl CloseHelpBox
	movs r0, #0
	strb r0, [r4]
	bl .end
	.align 2, 0
.Lpool_gKeySt_close: .4byte gKeySt
.clear_empty_helpbox:
	movs r0, #0
	strb r0, [r4]
.switch_menu_pos:
	adds r4, r6, #0
	adds r4, #0x2c
	ldrb r0, [r4]
	str r4, [sp, #0xc]
	cmp r0, #7
	bne .switch_le7
	bl .case_page_right_end
.switch_le7:
	cmp r0, #7
	bgt .switch_gt7
	cmp r0, #2
	bne .switch_le2
	bl .case_scroll_down
.switch_le2:
	cmp r0, #2
	bgt .switch_gt2
	cmp r0, #0
	bne .switch_if_case1
	b .case_main
.switch_if_case1:
	cmp r0, #1
	bne .switch_default_le2
	bl .case_scroll_up
.switch_default_le2:
	adds r7, r6, #0
	adds r7, #0x2e
	movs r0, #0x50
	adds r0, r0, r6
	mov r8, r0
	movs r1, #0x45
	adds r1, r1, r6
	mov sb, r1
	bl .setup_timer_ptr_tail
.switch_gt2:
	cmp r0, #5
	bne .switch_if_case6
	bl .case_page_right_anim
.switch_if_case6:
	cmp r0, #6
	bne .switch_default_le7
	bl .case_page_right_swap
.switch_default_le7:
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
	bl .tail
.switch_gt7:
	cmp r0, #0xc
	bne .switch_le12
	bl .case_page_left_end
.switch_le12:
	cmp r0, #0xc
	bgt .switch_gt12
	cmp r0, #0xa
	bne .switch_if_case11
	bl .case_page_left_anim
.switch_if_case11:
	cmp r0, #0xb
	bne .switch_default_le12
	bl .case_page_left_swap
.switch_default_le12:
	adds r7, r6, #0
	adds r7, #0x2e
	movs r0, #0x50
	adds r0, r0, r6
	mov r8, r0
	movs r1, #0x45
	adds r1, r1, r6
	mov sb, r1
	bl .setup_timer_ptr_tail
.switch_gt12:
	cmp r0, #0x14
	bne .switch_check_exit
	b .case_confirm
.switch_check_exit:
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
	beq .case_exit
	bl .tail
.case_exit:
	adds r0, r6, #0
	adds r0, #0x31
	ldrb r1, [r0]
	str r0, [sp, #0x10]
	cmp r1, #0
	bne .exit_save_list_cursor
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
	b .exit_check_restore_face
.exit_save_list_cursor:
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
.exit_check_restore_face:
	ldr r0, [sp, #0x10]
	ldrb r0, [r0]
	cmp r0, #2
	bne .exit_save_parent_page
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
	ldr r5, .Lpool_gBg0Tm_exit @ =gBg0Tm
	adds r0, r5, #0
	movs r1, #0xf
	movs r2, #0x13
	movs r3, #0
	bl TmFillRect_thm
	ldr r0, .Lpool_gBg1Tm_exit @ =gBg1Tm
	movs r1, #0xf
	movs r2, #0x13
	movs r3, #0
	bl TmFillRect_thm
	ldr r0, .Lpool_gBg2Tm_exit @ =gBg2Tm
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
	bl PrepSubItem_ResetIcon
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
	ldr r1, .Lpool_gPrepTexts3_exit @ =gPrepTexts3
	str r0, [sp]
	adds r0, r1, #0
	adds r1, r5, #0
	movs r2, #0
	adds r3, r4, #0
	bl PrepPutText
	ldr r1, [r6, #0x54]
	movs r0, #0
	bl func_fe6_0807D6C0
.exit_save_parent_page:
	adds r0, r6, #0
	adds r0, #0x2d
	ldrb r0, [r0]
	cmp r0, #3
	bhi .exit_goto_convoy
	ldr r0, [r6, #0x14]
	adds r1, r6, #0
	adds r1, #0x46
	ldrb r1, [r1]
	adds r0, #0x3a
	strb r1, [r0]
.exit_goto_convoy:
	adds r0, r6, #0
	movs r1, #4
	bl Proc_Goto
	movs r1, #0x45
	adds r1, r1, r6
	mov sb, r1
	bl .setup_timer_ptr_tail
	.align 2, 0
.Lpool_gBg0Tm_exit: .4byte gBg0Tm
.Lpool_gBg1Tm_exit: .4byte gBg1Tm
.Lpool_gBg2Tm_exit: .4byte gBg2Tm
.Lpool_gPrepTexts3_exit: .4byte gPrepTexts3
.case_confirm:
	ldr r0, .Lpool_gKeySt_confirm @ =gKeySt
	ldr r1, [r0]
	movs r0, #0x20
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq .confirm_check_right
	adds r1, r6, #0
	adds r1, #0x30
	ldrb r0, [r1]
	cmp r0, #0
	beq .confirm_check_right
	movs r0, #0
	strb r0, [r1]
	ldr r0, .Lpool_gPlaySt_confirm @ =gPlaySt
	ldrb r0, [r0, #0x1d]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .confirm_check_right
	movs r0, #0x66
	bl m4aSongNumStart
.confirm_check_right:
	ldr r0, .Lpool_gKeySt_confirm @ =gKeySt
	ldr r1, [r0]
	movs r0, #0x10
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq .confirm_check_a
	adds r1, r6, #0
	adds r1, #0x30
	ldrb r3, [r1]
	cmp r3, #1
	beq .confirm_check_a
	movs r0, #1
	strb r0, [r1]
	ldr r0, .Lpool_gPlaySt_confirm @ =gPlaySt
	ldrb r0, [r0, #0x1d]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .confirm_check_a
	movs r0, #0x66
	bl m4aSongNumStart
.confirm_check_a:
	ldr r0, .Lpool_gKeySt_confirm @ =gKeySt
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r4, #1
	ands r4, r1
	cmp r4, #0
	beq .confirm_check_b
	ldr r0, .Lpool_gPlaySt_confirm @ =gPlaySt
	ldrb r0, [r0, #0x1d]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .confirm_after_se
	movs r0, #0x6a
	bl m4aSongNumStart
.confirm_after_se:
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
	bne .confirm_set_pos0
	ldrh r2, [r4]
	lsrs r0, r2, #4
	ldrb r3, [r7]
	adds r0, r3, r0
	lsls r1, r0, #0x10
	ldr r4, .Lpool_gPrepAllItemsCount_confirm @ =gPrepAllItemsCount
	adds r5, r4, #0
	ldr r2, .Lpool_gPrepMenuScrollPos_confirm @ =gPrepMenuScrollPos
	mov ip, r2
	adds r3, r6, #0
	adds r3, #0x4b
	str r3, [sp, #0x14]
	ldrh r2, [r4]
	cmp r0, r2
	bge .confirm_yes_after_shift
	ldr r3, .Lpool_gPrepItemListData_confirm @ =gPrepItemListData
.confirm_yes_shift_loop:
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
	blt .confirm_yes_shift_loop
.confirm_yes_after_shift:
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
	ldr r0, .Lpool_gPrepTexts1_confirm @ =gPrepTexts1 + 0x50
	ldr r2, [r6, #0x54]
	mov r4, r8
	ldrh r4, [r4]
	lsrs r3, r4, #4
	movs r1, #0
	str r1, [sp]
	movs r1, #1
	bl func_fe6_0807D9E4
	bl PrepAllItems_Update
	ldr r1, .Lpool_gAction_confirm @ =gAction
	movs r0, #0x19
	strb r0, [r1, #0x11]
	ldr r5, [sp, #0x14]
	ldrb r0, [r5]
	cmp r0, #0
	beq .confirm_set_pos0
	adds r0, r6, #0
	movs r1, #6
	bl Proc_Goto
.confirm_set_pos0:
	movs r0, #0
	ldr r1, [sp, #0xc]
	strb r0, [r1]
	b .confirm_check_done
	.align 2, 0
.Lpool_gKeySt_confirm: .4byte gKeySt
.Lpool_gPlaySt_confirm: .4byte gPlaySt
.Lpool_gPrepAllItemsCount_confirm: .4byte gPrepAllItemsCount
.Lpool_gPrepMenuScrollPos_confirm: .4byte gPrepMenuScrollPos
.Lpool_gPrepItemListData_confirm: .4byte gPrepItemListData
.Lpool_gPrepTexts1_confirm: .4byte gPrepTexts1 + 0x50
.Lpool_gAction_confirm: .4byte gAction
.confirm_check_b:
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
	beq .confirm_check_done
	ldr r0, .Lpool_gPlaySt_confirm_b @ =gPlaySt
	ldrb r0, [r0, #0x1d]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .confirm_b_after_se
	movs r0, #0x6b
	bl m4aSongNumStart
.confirm_b_after_se:
	ldr r0, [sp, #0xc]
	strb r4, [r0]
.confirm_check_done:
	ldr r1, [sp, #0xc]
	ldrb r0, [r1]
	cmp r0, #0
	beq .confirm_restore_ui
	bl .tail
.confirm_restore_ui:
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
	ldr r0, .Lpool_gBg0Tm_confirm @ =gBg0Tm
	movs r1, #0xe
	movs r2, #0x13
	movs r3, #0
	bl TmFillRect_thm
	ldr r0, .Lpool_gBg1Tm_confirm @ =gBg1Tm
	movs r1, #0xe
	movs r2, #0x13
	movs r3, #0
	bl TmFillRect_thm
	ldr r1, .Lpool_gPrepItemListData_confirm_ui @ =gPrepItemListData
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
	bl PrepItem_PutItemDesc
	movs r0, #3
	bl EnableBgSync
	ldr r0, .Lpool_gPrepAllItemsCount_confirm_ui @ =gPrepAllItemsCount
	ldrh r0, [r0]
	cmp r0, #0
	beq .confirm_list_empty_exit
	bl .tail
.confirm_list_empty_exit:
	movs r0, #0xff
	ldr r1, [sp, #0xc]
	strb r0, [r1]
	bl .tail
	.align 2, 0
.Lpool_gPlaySt_confirm_b: .4byte gPlaySt
.Lpool_gBg0Tm_confirm: .4byte gBg0Tm
.Lpool_gBg1Tm_confirm: .4byte gBg1Tm
.Lpool_gPrepItemListData_confirm_ui: .4byte gPrepItemListData
.Lpool_gPrepAllItemsCount_confirm_ui: .4byte gPrepAllItemsCount
.case_main:
	ldr r1, .Lpool_gKeySt_main @ =gKeySt
	ldr r0, [r1]
	ldrh r2, [r0, #8]
	movs r0, #2
	ands r0, r2
	adds r3, r1, #0
	cmp r0, #0
	beq .main_check_a
	adds r0, r6, #0
	adds r0, #0x4b
	ldrb r0, [r0]
	cmp r0, #0
	beq .main_b_exit
	ldr r0, .Lpool_gPlaySt_main_b_locked @ =gPlaySt
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
	bge .main_b_locked_play_se
	bl .tail
.main_b_locked_play_se:
	movs r0, #0x6c
	bl m4aSongNumStart
	bl .tail
	.align 2, 0
.Lpool_gKeySt_main: .4byte gKeySt
.Lpool_gPlaySt_main_b_locked: .4byte gPlaySt
.main_b_exit:
	ldr r0, .Lpool_gPlaySt_main_b @ =gPlaySt
	ldrb r0, [r0, #0x1d]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .main_b_set_exit
	movs r0, #0x6b
	bl m4aSongNumStart
.main_b_set_exit:
	movs r0, #0xff
	strb r0, [r4]
	adds r7, r6, #0
	adds r7, #0x2e
	b .main_setup_regs_tail
	.align 2, 0
.Lpool_gPlaySt_main_b: .4byte gPlaySt
.main_check_a:
	movs r0, #1
	ands r0, r2
	cmp r0, #0
	bne .main_a_check_helpbox
	b .main_check_r
.main_a_check_helpbox:
	adds r0, r6, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #0
	beq .main_a_do
	b .main_check_r
.main_a_do:
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
	beq .main_a_give
	b .main_a_not_give
.main_a_give:
	bl GetTotalSupplyItemCount
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x64
	bne .main_give_not_full
	ldr r0, .Lpool_gPlaySt_give_full @ =gPlaySt
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
	bge .main_give_full_play_se
	b .main_a_after_give_take
.main_give_full_play_se:
	movs r0, #0x6c
	bl m4aSongNumStart
	b .main_a_after_give_take
	.align 2, 0
.Lpool_gPlaySt_give_full: .4byte gPlaySt
.main_give_not_full:
	adds r0, r6, #0
	adds r0, #0x4c
	ldrb r0, [r0]
	cmp r0, #0
	beq .main_give_ok
	ldr r0, [r6, #0x54]
	ldrb r1, [r7]
	bl PrepCanUnitPutItemToSupply
	lsls r0, r0, #0x18
	cmp r0, #0
	bne .main_give_ok
	ldrb r3, [r7]
	lsls r1, r3, #4
	adds r1, #0x48
	ldr r2, .Lpool_MSG_6C2 @ =0x000006C2
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
	b .main_a_after_give_take
	.align 2, 0
.Lpool_MSG_6C2: .4byte 0x000006C2
.main_give_ok:
	ldr r0, .Lpool_gPlaySt_give @ =gPlaySt
	ldrb r0, [r0, #0x1d]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .main_give_after_se
	movs r0, #0x6a
	bl m4aSongNumStart
.main_give_after_se:
	ldr r0, [r6, #0x54]
	ldrb r2, [r7]
	lsls r1, r2, #1
	adds r0, #0x1c
	adds r0, r0, r1
	ldrh r1, [r0]
	adds r0, r6, #0
	bl func_fe6_0807DEC8
	ldr r0, .Lpool_gPrepAllItemsCount_give @ =gPrepAllItemsCount
	ldrh r0, [r0]
	lsls r2, r0, #0x10
	asrs r1, r2, #0x10
	adds r3, r6, #0
	adds r3, #0x50
	ldrh r4, [r3]
	lsrs r0, r4, #4
	mov r8, r3
	cmp r1, r0
	blt .main_give_insert
	ldr r0, .Lpool_gPrepItemListData_give @ =gPrepItemListData
	mov sl, r0
	movs r1, #0
	mov sb, r1
.main_give_shift_loop:
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
	bge .main_give_shift_loop
.main_give_insert:
	ldr r3, .Lpool_gPrepItemListData_give @ =gPrepItemListData
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
	ldr r1, .Lpool_gPrepAllItemsCount_give @ =gPrepAllItemsCount
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	ldr r1, .Lpool_gPrepMenuScrollPos_give @ =gPrepMenuScrollPos
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
	ldr r1, .Lpool_gAction_give @ =gAction
	movs r0, #0x19
	strb r0, [r1, #0x11]
	ldr r0, [r6, #0x54]
	bl GetUnitItemCount
	cmp r0, #0
	bne .main_give_remaining
	adds r0, r6, #0
	bl func_fe6_0807D358
	adds r0, r6, #0
	adds r0, #0x2d
	ldrb r0, [r0]
	cmp r0, #3
	bhi .main_give_empty_goto
	ldr r0, [r6, #0x14]
	adds r1, r6, #0
	adds r1, #0x46
	ldrb r1, [r1]
	adds r0, #0x3a
	strb r1, [r0]
.main_give_empty_goto:
	adds r0, r6, #0
	movs r1, #4
	bl Proc_Goto
	bl .end
	.align 2, 0
.Lpool_gPlaySt_give: .4byte gPlaySt
.Lpool_gPrepAllItemsCount_give: .4byte gPrepAllItemsCount
.Lpool_gPrepItemListData_give: .4byte gPrepItemListData
.Lpool_gPrepMenuScrollPos_give: .4byte gPrepMenuScrollPos
.Lpool_gAction_give: .4byte gAction
.main_give_remaining:
	ldr r0, .Lpool_gPrepTexts1_give @ =gPrepTexts1 + 0x50
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
	blt .main_give_dec_hand_y
	b .main_a_after_give_take
.main_give_dec_hand_y:
	subs r0, r2, #1
	strb r0, [r7]
	b .main_a_after_give_take
	.align 2, 0
.Lpool_gPrepTexts1_give: .4byte gPrepTexts1 + 0x50
.main_a_not_give:
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
	beq .main_a_take
	b .main_a_after_give_take
.main_a_take:
	ldr r0, .Lpool_gPrepMenuScrollPos_take @ =gPrepMenuScrollPos
	ldrh r0, [r0]
	cmp r0, #0
	beq .main_take_fail
	ldr r0, [r6, #0x54]
	bl GetUnitItemCount
	cmp r0, #4
	bgt .main_take_fail
	ldr r0, .Lpool_gPlaySt_take @ =gPlaySt
	ldrb r0, [r0, #0x1d]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .main_take_after_se
	movs r0, #0x6a
	bl m4aSongNumStart
.main_take_after_se:
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
	ldr r3, .Lpool_gPrepItemListData_take @ =gPrepItemListData
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
	ldr r4, .Lpool_gPrepAllItemsCount_take @ =gPrepAllItemsCount
	ldrh r2, [r4]
	cmp r0, r2
	bge .main_take_after_shift
	ldr r3, .Lpool_gPrepItemListData_take @ =gPrepItemListData
.main_take_shift_loop:
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
	blt .main_take_shift_loop
.main_take_after_shift:
	ldr r4, .Lpool_gPrepAllItemsCount_take @ =gPrepAllItemsCount
	ldrh r0, [r4]
	subs r0, #1
	strh r0, [r4]
	ldr r1, .Lpool_gPrepMenuScrollPos_take @ =gPrepMenuScrollPos
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	adds r0, r7, #0
	mov r1, r8
	bl func_fe6_080823A0
	ldr r0, .Lpool_gPrepTexts1_take @ =gPrepTexts1 + 0x50
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
	ldr r1, .Lpool_gAction_take @ =gAction
	movs r0, #0x19
	strb r0, [r1, #0x11]
	ldr r0, [r6, #0x54]
	bl GetUnitItemCount
	cmp r0, #5
	beq .main_take_set_exit
	ldrh r0, [r4]
	cmp r0, #0
	bne .main_a_after_give_take
.main_take_set_exit:
	movs r0, #0xff
	ldr r2, [sp, #0xc]
	strb r0, [r2]
	b .main_a_after_give_take
	.align 2, 0
.Lpool_gPrepMenuScrollPos_take: .4byte gPrepMenuScrollPos
.Lpool_gPlaySt_take: .4byte gPlaySt
.Lpool_gPrepItemListData_take: .4byte gPrepItemListData
.Lpool_gPrepAllItemsCount_take: .4byte gPrepAllItemsCount
.Lpool_gPrepTexts1_take: .4byte gPrepTexts1 + 0x50
.Lpool_gAction_take: .4byte gAction
.main_take_fail:
	ldr r0, .Lpool_gPlaySt_take_fail @ =gPlaySt
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
	blt .main_a_after_give_take
	movs r0, #0x6c
	bl m4aSongNumStart
.main_a_after_give_take:
	ldr r2, [sp, #0x10]
	ldrb r2, [r2]
	cmp r2, #2
	beq .main_a_discard
	b .main_a_not_discard
.main_a_discard:
	ldr r0, .Lpool_gPrepMenuScrollPos_discard @ =gPrepMenuScrollPos
	ldrh r0, [r0]
	cmp r0, #0
	beq .main_discard_empty
	ldr r1, .Lpool_gPrepItemListData_discard @ =gPrepItemListData
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
	beq .main_discard_open_confirm
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
	ldr r2, .Lpool_MSG_C33 @ =0x00000C33
	adds r3, r6, #0
	bl StartPrepErrorHelpbox
	b .main_put_hover
	.align 2, 0
.Lpool_gPlaySt_take_fail: .4byte gPlaySt
.Lpool_gPrepMenuScrollPos_discard: .4byte gPrepMenuScrollPos
.Lpool_gPrepItemListData_discard: .4byte gPrepItemListData
.Lpool_MSG_C33: .4byte 0x00000C33
.main_discard_open_confirm:
	ldr r0, .Lpool_gPlaySt_discard @ =gPlaySt
	ldrb r0, [r0, #0x1d]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .main_discard_after_se
	movs r0, #0x6a
	bl m4aSongNumStart
.main_discard_after_se:
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
	ldr r4, .Lpool_gPrepTexts1_discard @ =gPrepTexts1
	ldr r5, .Lpool_gBg0Tm_discard @ =gBg0Tm+0x148
	ldr r0, .Lpool_str_really @ =String_Prep_083272CC
	str r0, [sp]
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0
	movs r3, #0
	bl PrepPutText
	adds r0, r4, #0
	adds r0, #8
	adds r1, r5, #6
	ldr r2, .Lpool_str_discard_q @ =String_Prep_083272D4
	str r2, [sp]
	movs r2, #0
	movs r3, #0
	bl PrepPutText
	adds r0, r4, #0
	adds r0, #0x10
	adds r1, r5, #0
	adds r1, #0xc2
	ldr r2, .Lpool_str_yes @ =String_Prep_Yes
	str r2, [sp]
	movs r2, #0
	movs r3, #0
	bl PrepPutText
	adds r4, #0x18
	adds r5, #0xca
	ldr r0, .Lpool_str_no @ =String_Prep_No
	str r0, [sp]
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0
	movs r3, #0
	bl PrepPutText
	bl .tail
	.align 2, 0
.Lpool_gPlaySt_discard: .4byte gPlaySt
.Lpool_gPrepTexts1_discard: .4byte gPrepTexts1
.Lpool_gBg0Tm_discard: .4byte gBg0Tm+0x148
.Lpool_str_really: .4byte String_Prep_083272CC
.Lpool_str_discard_q: .4byte String_Prep_083272D4
.Lpool_str_yes: .4byte String_Prep_Yes
.Lpool_str_no: .4byte String_Prep_No
.main_discard_empty:
	ldr r0, .Lpool_gPlaySt_discard_empty @ =gPlaySt
	ldrb r0, [r0, #0x1d]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .main_discard_empty_put_hover
	movs r0, #0x6c
	bl m4aSongNumStart
.main_discard_empty_put_hover:
	ldrb r2, [r5]
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #1
	adds r0, #2
	ldrb r3, [r7]
	lsls r1, r3, #1
	b .main_put_hover_y
	.align 2, 0
.Lpool_gPlaySt_discard_empty: .4byte gPlaySt
.main_a_not_discard:
	adds r0, r6, #0
	bl func_fe6_0807D358
	b .main_put_hover
.main_check_r:
	ldr r1, [r3]
	movs r0, #0x80
	lsls r0, r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq .main_check_hand_x
	adds r1, r6, #0
	adds r1, #0x29
	ldrb r0, [r1]
	cmp r0, #0
	bne .main_check_hand_x
	adds r0, r6, #0
	adds r0, #0x31
	ldrb r2, [r0]
	cmp r2, #0
	bne .main_r_list
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
.main_setup_regs_tail:
	movs r5, #0x50
	adds r5, r5, r6
	mov r8, r5
	movs r0, #0x45
	adds r0, r0, r6
	mov sb, r0
	movs r1, #0x52
	adds r1, r1, r6
	mov sl, r1
	b .tail
.main_r_list:
	ldr r0, .Lpool_gPrepMenuScrollPos_r @ =gPrepMenuScrollPos
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
	bne .main_r_list_check_sel
	b .tail
.main_r_list_check_sel:
	subs r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bls .main_r_list_open_helpbox
	b .tail
.main_r_list_open_helpbox:
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
	ldr r2, .Lpool_gPrepItemListData_r @ =gPrepItemListData
	mov ip, r2
	ldrh r3, [r3]
	lsrs r2, r3, #4
	adds r2, r2, r4
	lsls r2, r2, #2
	add r2, ip
	ldrh r2, [r2, #2]
	bl StartItemHelpBox
	b .tail
	.align 2, 0
.Lpool_gPrepMenuScrollPos_r: .4byte gPrepMenuScrollPos
.Lpool_gPrepItemListData_r: .4byte gPrepItemListData
.main_check_hand_x:
	adds r0, r6, #0
	adds r0, #0x2f
	ldrb r2, [r0]
	adds r5, r0, #0
	cmp r2, #1
	beq .main_list_nav
	b .main_unit_nav
.main_list_nav:
	ldr r1, [r3]
	movs r0, #0x80
	lsls r0, r0, #2
	ldrh r1, [r1, #4]
	ands r0, r1
	cmp r0, #0
	beq .main_list_no_l
	adds r1, r6, #0
	adds r1, #0x4a
	movs r0, #2
	strb r0, [r1]
	adds r4, r1, #0
	b .main_list_check_up
.main_list_no_l:
	adds r0, r6, #0
	adds r0, #0x4a
	strb r2, [r0]
	adds r4, r0, #0
.main_list_check_up:
	ldr r1, [r3]
	movs r2, #0x40
	adds r0, r2, #0
	ldrh r7, [r1, #6]
	ands r0, r7
	cmp r0, #0
	bne .main_list_up
	adds r0, r2, #0
	ldrh r1, [r1, #0x10]
	ands r0, r1
	cmp r0, #0
	beq .main_list_check_down
	ldrb r0, [r4]
	cmp r0, #2
	bne .main_list_check_down
.main_list_up:
	adds r0, r6, #0
	adds r0, #0x2e
	ldrb r1, [r0]
	mov sb, r1
	adds r7, r0, #0
	movs r2, #0x50
	adds r2, r2, r6
	mov r8, r2
	cmp r1, #1
	bne .main_list_up_move_y
	ldrh r0, [r2]
	cmp r0, #0
	beq .main_list_up_move_y
	ldr r0, .Lpool_gPlaySt_list_up @ =gPlaySt
	ldrb r0, [r0, #0x1d]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .main_list_scroll_up_after_se
	movs r0, #0x66
	bl m4aSongNumStart
.main_list_scroll_up_after_se:
	ldr r0, .Lpool_gPrepTexts1_list_up @ =gPrepTexts1 + 0x50
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
	b .main_list_scroll_setup_tail
	.align 2, 0
.Lpool_gPlaySt_list_up: .4byte gPlaySt
.Lpool_gPrepTexts1_list_up: .4byte gPrepTexts1 + 0x50
.main_list_up_move_y:
	ldrb r0, [r7]
	movs r4, #0x45
	adds r4, r4, r6
	mov sb, r4
	movs r1, #0x52
	adds r1, r1, r6
	mov sl, r1
	cmp r0, #0
	bne .main_list_up_dec_y
	b .tail
.main_list_up_dec_y:
	ldr r0, .Lpool_gPlaySt_list_up_y @ =gPlaySt
	ldrb r0, [r0, #0x1d]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .main_list_up_after_se
	movs r0, #0x66
	bl m4aSongNumStart
.main_list_up_after_se:
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
	b .main_commit_hand_y
	.align 2, 0
.Lpool_gPlaySt_list_up_y: .4byte gPlaySt
.main_list_check_down:
	ldr r1, [r3]
	movs r2, #0x80
	adds r0, r2, #0
	ldrh r7, [r1, #6]
	ands r0, r7
	cmp r0, #0
	bne .main_list_down
	adds r0, r2, #0
	ldrh r1, [r1, #0x10]
	ands r0, r1
	adds r7, r6, #0
	adds r7, #0x2e
	cmp r0, #0
	bne .main_list_down_check_turbo
	b .main_check_page_lr
.main_list_down_check_turbo:
	ldrb r0, [r4]
	cmp r0, #2
	beq .main_list_down
	b .main_check_page_lr
.main_list_down:
	adds r0, r6, #0
	adds r0, #0x2e
	ldrb r1, [r0]
	adds r7, r0, #0
	cmp r1, #5
	bls .main_list_down_check_scroll
	b .main_check_page_lr
.main_list_down_check_scroll:
	movs r2, #0x50
	adds r2, r2, r6
	mov r8, r2
	ldr r3, .Lpool_gPrepMenuScrollPos_list_down @ =gPrepMenuScrollPos
	mov ip, r3
	cmp r1, #5
	bne .main_list_down_move_y
	ldrh r1, [r2]
	lsrs r0, r1, #4
	adds r0, #7
	ldrh r1, [r3]
	cmp r0, r1
	bge .main_list_down_move_y
	ldr r0, .Lpool_gPlaySt_list_down @ =gPlaySt
	ldrb r0, [r0, #0x1d]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .main_list_scroll_down_after_se
	movs r0, #0x66
	bl m4aSongNumStart
.main_list_scroll_down_after_se:
	ldr r0, .Lpool_gPrepTexts1_list_down @ =gPrepTexts1 + 0x50
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
.main_list_scroll_setup_tail:
	movs r2, #0x45
	adds r2, r2, r6
	mov sb, r2
	movs r3, #0x52
	adds r3, r3, r6
	mov sl, r3
	b .tail
	.align 2, 0
.Lpool_gPrepMenuScrollPos_list_down: .4byte gPrepMenuScrollPos
.Lpool_gPlaySt_list_down: .4byte gPlaySt
.Lpool_gPrepTexts1_list_down: .4byte gPrepTexts1 + 0x50
.main_list_down_move_y:
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
	blt .main_list_down_inc_y
	b .tail
.main_list_down_inc_y:
	ldr r0, .Lpool_gPlaySt_list_down_y @ =gPlaySt
	ldrb r0, [r0, #0x1d]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .main_list_down_after_se
	movs r0, #0x66
	bl m4aSongNumStart
.main_list_down_after_se:
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
.main_commit_hand_y:
	strb r0, [r7]
.main_put_hover:
	ldrb r2, [r5]
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #1
	adds r0, #2
	ldrb r4, [r7]
	lsls r1, r4, #1
.main_put_hover_y:
	lsls r2, r2, #2
	subs r2, #9
	subs r1, r1, r2
	movs r2, #0xc
	bl PutUiEntryHover
	b .tail
	.align 2, 0
.Lpool_gPlaySt_list_down_y: .4byte gPlaySt
.main_unit_nav:
	ldr r0, [r3]
	ldrh r1, [r0, #6]
	movs r7, #0x40
	mov r8, r7
	mov r0, r8
	ands r0, r1
	cmp r0, #0
	beq .main_unit_check_down
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
	beq .main_unit_try_wrap_up
	ldr r0, .Lpool_gPlaySt_unit_up @ =gPlaySt
	ldrb r0, [r0, #0x1d]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .main_unit_up_after_se
	movs r0, #0x66
	bl m4aSongNumStart
.main_unit_up_after_se:
	ldrb r0, [r7]
	b .main_unit_set_y_from_count
	.align 2, 0
.Lpool_gPlaySt_unit_up: .4byte gPlaySt
.main_unit_try_wrap_up:
	ldr r1, [r3]
	mov r0, r8
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq .main_unit_up_put_hover
	ldr r0, .Lpool_gPlaySt_unit_wrap_up @ =gPlaySt
	ldrb r0, [r0, #0x1d]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .main_unit_wrap_up_after_se
	movs r0, #0x66
	bl m4aSongNumStart
.main_unit_wrap_up_after_se:
	ldrb r0, [r5]
	lsls r1, r0, #2
	adds r0, r6, #0
	adds r0, #0x54
	adds r0, r0, r1
	ldr r0, [r0]
	bl GetUnitItemCount
.main_unit_set_y_from_count:
	subs r0, #1
	strb r0, [r7]
.main_unit_up_put_hover:
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
	b .main_check_page_lr
	.align 2, 0
.Lpool_gPlaySt_unit_wrap_up: .4byte gPlaySt
.main_unit_check_down:
	movs r0, #0x80
	ands r0, r1
	adds r7, r6, #0
	adds r7, #0x2e
	cmp r0, #0
	beq .main_check_page_lr
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
	bge .main_unit_try_wrap_down
	ldrb r0, [r7]
	cmp r0, #3
	bhi .main_unit_try_wrap_down
	ldr r0, .Lpool_gPlaySt_unit_down @ =gPlaySt
	ldrb r0, [r0, #0x1d]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .main_unit_down_after_se
	movs r0, #0x66
	bl m4aSongNumStart
.main_unit_down_after_se:
	ldrb r0, [r7]
	adds r0, #1
	b .main_unit_set_y
	.align 2, 0
.Lpool_gPlaySt_unit_down: .4byte gPlaySt
.main_unit_try_wrap_down:
	ldr r0, .Lpool_gKeySt_page @ =gKeySt
	ldr r1, [r0]
	movs r0, #0x80
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq .main_unit_down_put_hover
	ldr r0, .Lpool_gPlaySt_page @ =gPlaySt
	ldrb r0, [r0, #0x1d]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .main_unit_wrap_down_after_se
	movs r0, #0x66
	bl m4aSongNumStart
.main_unit_wrap_down_after_se:
	movs r0, #0
.main_unit_set_y:
	strb r0, [r7]
.main_unit_down_put_hover:
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
.main_check_page_lr:
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
	beq .main_page_right
	b .tail
.main_page_right:
	ldr r0, .Lpool_gKeySt_page @ =gKeySt
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq .main_check_page_left
	ldr r0, .Lpool_gPlaySt_page @ =gPlaySt
	ldrb r0, [r0, #0x1d]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .main_page_right_after_se
	movs r0, #0x67
	bl m4aSongNumStart
.main_page_right_after_se:
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
	b .tail
	.align 2, 0
.Lpool_gKeySt_page: .4byte gKeySt
.Lpool_gPlaySt_page: .4byte gPlaySt
.main_check_page_left:
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	bne .main_page_left
	b .tail
.main_page_left:
	ldr r0, .Lpool_gPlaySt_page_left @ =gPlaySt
	ldrb r0, [r0, #0x1d]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .main_page_left_after_se
	movs r0, #0x67
	bl m4aSongNumStart
.main_page_left_after_se:
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
	b .tail
	.align 2, 0
.Lpool_gPlaySt_page_left: .4byte gPlaySt
.case_scroll_up:
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
	beq .scroll_up_aligned
	b .tail
.scroll_up_aligned:
	lsrs r0, r2, #4
	adds r0, #7
	lsls r0, r0, #1
	movs r1, #0x1f
	ands r0, r1
	lsls r0, r0, #6
	ldr r1, .Lpool_gBg2Tm_scroll_up @ =gBg2Tm+0x1E
	adds r0, r0, r1
	movs r1, #0xf
	movs r2, #1
	movs r3, #0
	bl TmFillRect_thm
	movs r0, #4
	bl EnableBgSync
	movs r0, #0
	b .store_menu_pos
	.align 2, 0
.Lpool_gBg2Tm_scroll_up: .4byte gBg2Tm+0x1E
.case_scroll_down:
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
	beq .scroll_down_aligned
	b .tail
.scroll_down_aligned:
	lsrs r0, r2, #4
	subs r0, #1
	lsls r0, r0, #1
	movs r1, #0x1f
	ands r0, r1
	lsls r0, r0, #6
	ldr r1, .Lpool_gBg2Tm_scroll_down @ =gBg2Tm+0x1E
	adds r0, r0, r1
	movs r1, #0xf
	movs r2, #1
	movs r3, #0
	bl TmFillRect_thm
	movs r0, #4
	bl EnableBgSync
	movs r0, #0
	b .store_menu_pos
	.align 2, 0
.Lpool_gBg2Tm_scroll_down: .4byte gBg2Tm+0x1E
.case_page_right_anim:
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
	beq .page_right_anim_done
	b .tail
.page_right_anim_done:
	movs r0, #6
	b .store_menu_pos
.case_page_right_swap:
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
	bne .page_right_inc
	movs r0, #0
	b .page_right_set_page
.page_right_inc:
	adds r0, r1, #1
.page_right_set_page:
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
	ldr r0, .Lpool_gPrepTexts1_page_right @ =gPrepTexts1 + 0x50
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
	b .page_swap_set_pos
	.align 2, 0
.Lpool_gPrepTexts1_page_right: .4byte gPrepTexts1 + 0x50
.case_page_right_end:
	adds r1, r6, #0
	adds r1, #0x45
	ldrb r0, [r1]
	adds r0, #0xe
	b .page_end_store_xoff
.case_page_left_anim:
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
	bne .tail
	movs r0, #0xb
	b .store_menu_pos
.case_page_left_swap:
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
	bne .page_left_dec
	movs r0, #8
	b .page_left_set_page
.page_left_dec:
	subs r0, r1, #1
.page_left_set_page:
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
	ldr r0, .Lpool_gPrepTexts1_page_left @ =gPrepTexts1 + 0x50
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
.page_swap_set_pos:
	ldr r1, [sp, #0xc]
	strb r0, [r1]
	mov r8, r4
.setup_timer_ptr_tail:
	movs r2, #0x52
	adds r2, r2, r6
	mov sl, r2
	b .tail
	.align 2, 0
.Lpool_gPrepTexts1_page_left: .4byte gPrepTexts1 + 0x50
.case_page_left_end:
	adds r1, r6, #0
	adds r1, #0x45
	ldrb r0, [r1]
	subs r0, #0xe
.page_end_store_xoff:
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
	bne .tail
.store_menu_pos:
	strb r0, [r4]
.tail:
	mov r1, r8
	ldrh r1, [r1]
	lsrs r0, r1, #4
	ldrb r3, [r7]
	adds r5, r0, r3
	ldr r2, [sp, #4]
	cmp r2, r5
	bne .tail_sel_changed
	adds r0, r6, #0
	adds r0, #0x46
	ldr r4, [sp, #8]
	ldrb r0, [r0]
	cmp r4, r0
	beq .tail_set_bg_offset
.tail_sel_changed:
	adds r4, r6, #0
	adds r4, #0x29
	ldrb r1, [r4]
	adds r0, r6, #0
	adds r0, #0x31
	str r0, [sp, #0x10]
	cmp r1, #0
	beq .tail_check_discard_desc
	ldrb r0, [r0]
	cmp r0, #0
	bne .tail_helpbox_list
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
	b .tail_check_discard_desc
.tail_helpbox_list:
	ldr r0, .Lpool_gPrepMenuScrollPos_tail @ =gPrepMenuScrollPos
	ldrh r0, [r0]
	cmp r0, #0
	bne .tail_helpbox_list_item
	cmp r1, #1
	beq .tail_helpbox_empty_skip_close
	bl CloseHelpBox
.tail_helpbox_empty_skip_close:
	movs r0, #1
	b .tail_set_unk29
	.align 2, 0
.Lpool_gPrepMenuScrollPos_tail: .4byte gPrepMenuScrollPos
.tail_helpbox_list_item:
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
	ldr r3, .Lpool_gPrepItemListData_tail @ =gPrepItemListData
	lsls r2, r5, #2
	adds r2, r2, r3
	ldrh r2, [r2, #2]
	bl StartItemHelpBox
	movs r0, #2
.tail_set_unk29:
	strb r0, [r4]
.tail_check_discard_desc:
	ldr r1, [sp, #0x10]
	ldrb r1, [r1]
	cmp r1, #2
	bne .tail_set_bg_offset
	ldr r1, .Lpool_gPrepItemListData_tail @ =gPrepItemListData
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
	bl PrepItem_PutItemDesc
.tail_set_bg_offset:
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
.end:
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.Lpool_gPrepItemListData_tail: .4byte gPrepItemListData
