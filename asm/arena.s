	.include "macro.inc"

	.syntax unified

	thumb_func_start ArenaUi_CheckConfirmation
ArenaUi_CheckConfirmation: @ 0x080982D8
	push {r4, r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	bl GetTalkChoiceResult
	cmp r0, #1
	beq .L08098310
	cmp r0, #1
	bgt .L080982F2
	cmp r0, #0
	beq .L080982F8
	b .L080982F8
.L080982F2:
	cmp r0, #2
	beq .L080982F8
	b .L080982F8
.L080982F8:
	ldr r1, .L0809830C @ =0x000002F6
	adds r0, r1, #0
	ldr r1, [r7]
	bl StartArenaDialogue
	ldr r0, [r7]
	movs r1, #2
	bl Proc_Goto
	b .L08098338
	.align 2, 0
.L0809830C: .4byte 0x000002F6
.L08098310:
	bl ArenaGetMatchupGoldValue
	adds r4, r0, #0
	bl GetGold
	cmp r4, r0
	bgt .L08098322
	b .L08098338
.L08098320:
	.byte 0x09, 0xE0
.L08098322:
	movs r1, #0xbf
	lsls r1, r1, #2
	adds r0, r1, #0
	ldr r1, [r7]
	bl StartArenaDialogue
	ldr r0, [r7]
	movs r1, #2
	bl Proc_Goto
	b .L08098338
.L08098338:
	add sp, #4
	pop {r4, r7}
	pop {r0}
	bx r0

	thumb_func_start func_fe6_08098340
func_fe6_08098340: @ 0x08098340
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	bl GetGold
	str r0, [r7, #4]
	bl ArenaGetMatchupGoldValue
	ldr r1, [r7, #4]
	subs r0, r1, r0
	str r0, [r7, #4]
	ldr r1, [r7, #4]
	adds r0, r1, #0
	bl SetGold
	ldr r0, .L08098388 @ =gPlaySt
	ldrb r1, [r0, #0x1d]
	lsls r2, r1, #0x1e
	lsrs r0, r2, #0x1f
	cmp r0, #0
	bne .L08098372
	movs r0, #0xb9
	bl m4aSongNumStart
.L08098372:
	ldr r1, .L0809838C @ =gBg0Tm+0x1B6
	adds r0, r1, #0
	bl DisplayGoldBoxText
	ldr r0, [r7]
	bl func_fe6_08098624
	add sp, #8
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08098388: .4byte gPlaySt
.L0809838C: .4byte gBg0Tm+0x1B6

	thumb_func_start func_fe6_08098390
func_fe6_08098390: @ 0x08098390
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r1, .L080983AC @ =0x000002F7
	adds r0, r1, #0
	ldr r1, [r7]
	bl StartArenaDialogue
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
.L080983AC: .4byte 0x000002F7

	thumb_func_start func_fe6_080983B0
func_fe6_080983B0: @ 0x080983B0
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r1, .L080983CC @ =0x000002F5
	adds r0, r1, #0
	ldr r1, [r7]
	bl StartArenaDialogue
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
.L080983CC: .4byte 0x000002F5

	thumb_func_start func_fe6_080983D0
func_fe6_080983D0: @ 0x080983D0
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	movs r1, #1
	rsbs r1, r1, #0
	adds r0, r1, #0
	bl FadeBgmOut
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_fe6_080983EC
func_fe6_080983EC: @ 0x080983EC
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	movs r1, #7
	bl Proc_Mark
	bl ClearTalk
	ldr r1, .L0809846C @ =ProcScr_GoldBox
	adds r0, r1, #0
	bl Proc_EndEach
	ldr r0, .L08098470 @ =gAction
	ldrb r1, [r0, #0x11]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x16
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0, #0x11]
	ldr r1, .L08098474 @ =gActiveUnit
	ldr r0, [r1]
	ldr r2, .L08098474 @ =gActiveUnit
	ldr r1, [r2]
	ldrh r2, [r1, #0xc]
	movs r3, #0x40
	adds r1, r2, #0
	orrs r1, r3
	ldrh r2, [r0, #0xc]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #0xc]
	ldr r0, .L08098474 @ =gActiveUnit
	ldr r1, [r0]
	adds r0, r1, #0
	bl PidStatsAddBattle
	bl EndAllMus
	ldr r0, .L08098470 @ =gAction
	ldrb r1, [r0, #0x15]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #0x15]
	ldr r0, .L08098474 @ =gActiveUnit
	ldr r1, [r0]
	adds r0, r1, #0
	bl BattleGenerateArena
	bl BeginBattleAnimations
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0809846C: .4byte ProcScr_GoldBox
.L08098470: .4byte gAction
.L08098474: .4byte gActiveUnit

	thumb_func_start func_fe6_08098478
func_fe6_08098478: @ 0x08098478
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	bl StartPartialGameLock
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_fe6_08098490
func_fe6_08098490: @ 0x08098490
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	bl ArenaUi_Init
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_fe6_080984A8
func_fe6_080984A8: @ 0x080984A8
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	bl GetGold
	str r0, [r7, #4]
	bl ArenaGetResult
	cmp r0, #2
	beq .L08098504
	cmp r0, #2
	bgt .L080984C8
	cmp r0, #1
	beq .L080984D2
	b .L08098548
.L080984C8:
	cmp r0, #3
	beq .L08098514
	cmp r0, #4
	beq .L08098538
	b .L08098548
.L080984D2:
	bl ArenaGetMatchupGoldValue
	adds r1, r0, #0
	lsls r2, r1, #1
	adds r0, r2, #0
	bl SetTalkNumber
	movs r1, #0xbe
	lsls r1, r1, #2
	adds r0, r1, #0
	ldr r1, [r7]
	bl StartArenaDialogue
	bl ArenaGetMatchupGoldValue
	adds r1, r0, #0
	lsls r0, r1, #1
	ldr r1, [r7, #4]
	adds r0, r1, r0
	str r0, [r7, #4]
	ldr r1, [r7, #4]
	adds r0, r1, #0
	bl SetGold
	b .L08098548
.L08098504:
	ldr r1, .L08098510 @ =0x000002F9
	adds r0, r1, #0
	ldr r1, [r7]
	bl StartArenaDialogue
	b .L08098548
	.align 2, 0
.L08098510: .4byte 0x000002F9
.L08098514:
	ldr r1, .L08098534 @ =0x000002FB
	adds r0, r1, #0
	ldr r1, [r7]
	bl StartArenaDialogue
	bl ArenaGetMatchupGoldValue
	ldr r1, [r7, #4]
	adds r0, r1, r0
	str r0, [r7, #4]
	ldr r1, [r7, #4]
	adds r0, r1, #0
	bl SetGold
	b .L08098548
	.align 2, 0
.L08098534: .4byte 0x000002FB
.L08098538:
	ldr r1, .L08098544 @ =0x000002FA
	adds r0, r1, #0
	ldr r1, [r7]
	bl StartArenaDialogue
	b .L08098548
	.align 2, 0
.L08098544: .4byte 0x000002FA
.L08098548:
	add sp, #8
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start func_fe6_08098550
func_fe6_08098550: @ 0x08098550
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	bl ArenaGetResult
	cmp r0, #2
	beq .L080985A0
	cmp r0, #2
	bgt .L0809856A
	cmp r0, #1
	beq .L08098574
	b .L080985A4
.L0809856A:
	cmp r0, #3
	beq .L08098574
	cmp r0, #4
	beq .L080985A2
	b .L080985A4
.L08098574:
	ldr r1, .L08098598 @ =gBg0Tm+0x1B6
	adds r0, r1, #0
	bl DisplayGoldBoxText
	ldr r0, .L0809859C @ =gPlaySt
	ldrb r1, [r0, #0x1d]
	lsls r2, r1, #0x1e
	lsrs r0, r2, #0x1f
	cmp r0, #0
	bne .L0809858E
	movs r0, #0xb9
	bl m4aSongNumStart
.L0809858E:
	ldr r0, [r7]
	movs r1, #0x3c
	bl StartTemporaryLock
	b .L080985A4
	.align 2, 0
.L08098598: .4byte gBg0Tm+0x1B6
.L0809859C: .4byte gPlaySt
.L080985A0:
	b .L080985A4
.L080985A2:
	b .L080985A4
.L080985A4:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start func_fe6_080985AC
func_fe6_080985AC: @ 0x080985AC
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r1, .L080985CC @ =ProcScr_GoldBox
	adds r0, r1, #0
	bl Proc_EndEach
	ldr r0, .L080985D0 @ =ProcScr_Mu
	ldr r1, .L080985D4 @ =ShowMu
	bl Proc_ForEach
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
.L080985CC: .4byte ProcScr_GoldBox
.L080985D0: .4byte ProcScr_Mu
.L080985D4: .4byte ShowMu

	thumb_func_start StartArenaDialogue
StartArenaDialogue: @ 0x080985D8
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	bl SetInitTalkTextFont
	bl ClearTalkText
	ldr r0, [r7]
	bl DecodeMsg
	adds r2, r0, #0
	ldr r3, [r7, #4]
	movs r0, #8
	movs r1, #2
	bl StartTalkExt
	movs r0, #0
	bl SetTalkPrintColor
	movs r0, #1
	bl SetTalkFlag
	movs r0, #2
	bl SetTalkFlag
	movs r0, #4
	bl SetTalkFlag
	movs r0, #1
	bl SetActiveTalkFace
	add sp, #8
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_fe6_08098624
func_fe6_08098624: @ 0x08098624
	push {r4, r5, r7, lr}
	sub sp, #8
	add r7, sp, #4
	str r0, [r7]
	movs r0, #0
	str r0, [sp]
	movs r0, #7
	movs r1, #9
	movs r2, #0x10
	movs r3, #6
	bl PutUiWindowFrame
	movs r0, #0
	bl SetTextFont
	bl InitSystemTextFont
	ldr r4, .L080986C0 @ =gBg0Tm+0x290
	ldr r5, .L080986C4 @ =SystemLabel_Level
	bl GetLang
	adds r1, r0, #0
	lsls r0, r1, #2
	adds r1, r5, r0
	ldr r2, [r1]
	adds r0, r4, #0
	movs r1, #0
	bl PutString
	ldr r0, .L080986C8 @ =gBg0Tm+0x298
	ldr r1, .L080986CC @ =gArenaSt
	ldr r3, [r1, #4]
	movs r2, #8
	ldrsb r2, [r3, r2]
	movs r1, #2
	bl PutNumber
	ldr r4, .L080986D0 @ =gBg0Tm+0x310
	ldr r0, .L080986CC @ =gArenaSt
	ldr r1, [r0, #4]
	ldr r0, [r1]
	ldrh r1, [r0]
	adds r0, r1, #0
	bl DecodeMsg
	adds r2, r0, #0
	adds r0, r4, #0
	movs r1, #0
	bl PutString
	ldr r4, .L080986D4 @ =gBg0Tm+0x29E
	ldr r0, .L080986CC @ =gArenaSt
	ldr r1, [r0, #4]
	ldr r0, [r1, #4]
	ldrh r1, [r0]
	adds r0, r1, #0
	bl DecodeMsg
	adds r2, r0, #0
	adds r0, r4, #0
	movs r1, #0
	bl PutString
	ldr r4, .L080986D8 @ =gBg0Tm+0x31E
	ldr r0, .L080986CC @ =gArenaSt
	ldrh r1, [r0, #0x1c]
	adds r0, r1, #0
	bl GetItemName
	adds r2, r0, #0
	adds r0, r4, #0
	movs r1, #0
	bl PutString
	add sp, #8
	pop {r4, r5, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L080986C0: .4byte gBg0Tm+0x290
.L080986C4: .4byte SystemLabel_Level
.L080986C8: .4byte gBg0Tm+0x298
.L080986CC: .4byte gArenaSt
.L080986D0: .4byte gBg0Tm+0x310
.L080986D4: .4byte gBg0Tm+0x29E
.L080986D8: .4byte gBg0Tm+0x31E

	thumb_func_start Arena_PlayResultSong
Arena_PlayResultSong: @ 0x080986DC
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	bl ArenaGetResult
	cmp r0, #1
	beq .L080986EE
	b .L08098708
.L080986EE:
	ldr r0, .L08098704 @ =gPlaySt
	ldrb r1, [r0, #0x1d]
	lsls r2, r1, #0x1f
	lsrs r0, r2, #0x1f
	cmp r0, #0
	bne .L08098702
	movs r0, #0x46
	movs r1, #0
	bl StartBgmCore
.L08098702:
	b .L08098728
	.align 2, 0
.L08098704: .4byte gPlaySt
.L08098708:
	ldr r0, .L08098724 @ =gPlaySt
	ldrb r1, [r0, #0x1d]
	lsls r2, r1, #0x1f
	lsrs r0, r2, #0x1f
	cmp r0, #0
	bne .L0809871C
	movs r0, #0x39
	movs r1, #0
	bl StartBgmCore
.L0809871C:
	ldr r0, [r7]
	bl Proc_End
	b .L08098728
	.align 2, 0
.L08098724: .4byte gPlaySt
.L08098728:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start Arena_PlayArenaSong
Arena_PlayArenaSong: @ 0x08098730
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	movs r0, #0x39
	movs r1, #0
	movs r2, #0
	bl StartBgmExt
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_fe6_0809874C
func_fe6_0809874C: @ 0x0809874C
	push {r7, lr}
	mov r7, sp
	ldr r1, .L08098760 @ =EventScr_SuspendPrompt
	adds r0, r1, #0
	bl StartEvent
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08098760: .4byte EventScr_SuspendPrompt

	thumb_func_start func_fe6_08098764
func_fe6_08098764: @ 0x08098764
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	bl GetTalkChoiceResult
	cmp r0, #1
	beq .L08098784
	cmp r0, #1
	bgt .L0809877E
	cmp r0, #0
	beq .L0809878C
	b .L0809878C
.L0809877E:
	cmp r0, #2
	beq .L08098788
	b .L0809878C
.L08098784:
	movs r0, #1
	b .L08098790
.L08098788:
	movs r0, #0
	b .L08098790
.L0809878C:
	movs r0, #0
	b .L08098790
.L08098790:
	add sp, #4
	pop {r7}
	pop {r1}
	bx r1

	thumb_func_start WriteSuspandPlaterIdle
WriteSuspandPlaterIdle: @ 0x08098798
	push {r7, lr}
	mov r7, sp
	ldr r0, .L080987B4 @ =gAction
	ldrb r1, [r0, #0x16]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #0x16]
	movs r0, #3
	bl WriteSuspendSave
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
.L080987B4: .4byte gAction
