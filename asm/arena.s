	.include "macro.inc"

	.syntax unified

	thumb_func_start func_fe6_08097E2C
func_fe6_08097E2C: @ 0x08097E2C
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	ldr r0, .L08097E6C @ =gMusicPlayerTable
	ldr r2, .L08097E70 @ =gSongTable
	adds r1, r2, #0
	movs r1, #0xe6
	lsls r1, r1, #1
	adds r2, r2, r1
	ldrh r1, [r2]
	adds r3, r1, #0
	lsls r2, r3, #1
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
	str r1, [r7, #4]
	ldr r0, [r7, #4]
	ldr r1, [r0, #4]
	lsls r2, r1, #0x10
	lsrs r0, r2, #0x10
	cmp r0, #0
	bne .L08097E76
	ldr r0, [r7, #4]
	ldr r1, [r0, #4]
	lsrs r2, r1, #0x1f
	lsls r0, r2, #0x1f
	cmp r0, #0
	bne .L08097E76
	movs r0, #0
	b .L08097E7A
	.align 2, 0
.L08097E6C: .4byte gMusicPlayerTable
.L08097E70: .4byte gSongTable
.L08097E74:
	.byte 0x01, 0xE0
.L08097E76:
	movs r0, #1
	b .L08097E7A
.L08097E7A:
	add sp, #8
	pop {r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start StartArenaScreen
StartArenaScreen: @ 0x08097E84
	push {r7, lr}
	mov r7, sp
	ldr r0, .L08097EA4 @ =gActiveUnit
	ldr r1, [r0]
	adds r0, r1, #0
	bl ArenaBegin
	ldr r1, .L08097EA8 @ =ProcScr_ArenaUiMain
	adds r0, r1, #0
	movs r1, #3
	bl SpawnProc
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08097EA4: .4byte gActiveUnit
.L08097EA8: .4byte ProcScr_ArenaUiMain

	thumb_func_start StartArenaResultsScreen
StartArenaResultsScreen: @ 0x08097EAC
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	ldr r1, .L08097EC8 @ =ProcScr_ArenaUiResults
	adds r0, r1, #0
	movs r1, #3
	bl SpawnProc
	str r0, [r7]
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08097EC8: .4byte ProcScr_ArenaUiResults

	thumb_func_start ArenaUi_Init
ArenaUi_Init: @ 0x08097ECC
	push {r4, r7, lr}
	sub sp, #8
	add r7, sp, #4
	str r0, [r7]
	ldr r0, .L08098220 @ =ProcScr_Mu
	ldr r1, .L08098224 @ =HideMu
	bl Proc_ForEach
	bl InitShopScreenConfig
	ldr r0, .L08098228 @ =gDispIo
	ldrb r1, [r0, #0xc]
	movs r2, #0xfc
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #0xc]
	ldr r0, .L08098228 @ =gDispIo
	ldrb r1, [r0, #0x10]
	movs r2, #0xfc
	ands r1, r2
	adds r2, r1, #0
	movs r3, #2
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0, #0x10]
	ldr r0, .L08098228 @ =gDispIo
	ldrb r1, [r0, #0x14]
	movs r2, #0xfc
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #0x14]
	ldr r0, .L08098228 @ =gDispIo
	ldrb r1, [r0, #0x18]
	movs r2, #3
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0, #0x18]
	movs r1, #0x80
	lsls r1, r1, #2
	adds r0, r1, #0
	movs r1, #2
	movs r2, #0
	bl InitTalk
	bl InitFaces
	movs r0, #1
	str r0, [sp]
	movs r0, #0xba
	movs r1, #0x20
	movs r2, #8
	movs r3, #3
	bl StartTalkFace
	ldr r0, .L0809822C @ =gUnk_082DC944
	ldr r1, .L08098230 @ =gBuf
	bl Decompress
	ldr r0, .L08098234 @ =gBg1Tm
	ldr r1, .L08098230 @ =gBuf
	movs r2, #0x80
	lsls r2, r2, #5
	bl TmApplyTsa_thm
	ldr r1, .L08098238 @ =gBg1Tm+0x200
	adds r0, r1, #0
	movs r1, #0x1e
	movs r2, #0xc
	movs r3, #0
	bl TmFillRect_thm
	movs r0, #2
	bl EnableBgSync
	ldr r0, [r7]
	bl StartUiGoldBox
	ldr r0, .L08098228 @ =gDispIo
	ldrb r1, [r0, #1]
	movs r2, #0x20
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0, #1]
	ldr r0, .L08098228 @ =gDispIo
	ldrb r1, [r0, #1]
	movs r2, #0x40
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0, #1]
	ldr r0, .L08098228 @ =gDispIo
	ldrb r1, [r0, #1]
	movs r2, #0x7f
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #1]
	ldr r0, .L08098228 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r2, #1
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, .L08098228 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r2, #2
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, .L08098228 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, .L08098228 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r2, #8
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, .L08098228 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r2, #0x10
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, .L08098228 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x35
	ldrb r1, [r0]
	movs r2, #1
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, .L08098228 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x35
	ldrb r1, [r0]
	movs r2, #2
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, .L08098228 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x35
	ldrb r1, [r0]
	movs r2, #0xfb
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, .L08098228 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x35
	ldrb r1, [r0]
	movs r2, #8
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, .L08098228 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x35
	ldrb r1, [r0]
	movs r2, #0x10
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, .L08098228 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x36
	ldrb r1, [r0]
	movs r2, #1
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, .L08098228 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x36
	ldrb r1, [r0]
	movs r2, #2
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, .L08098228 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x36
	ldrb r1, [r0]
	movs r2, #0xfb
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, .L08098228 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x36
	ldrb r1, [r0]
	movs r2, #8
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, .L08098228 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x36
	ldrb r1, [r0]
	movs r2, #0x10
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, .L08098228 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x2d
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x58
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, .L08098228 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x31
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x48
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, .L08098228 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x2c
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0xf0
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, .L08098228 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x30
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x98
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, .L08098228 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x2f
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, .L08098228 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x33
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #8
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, .L08098228 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x2e
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0xf0
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, .L08098228 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x32
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x38
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, .L08098228 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r2, #0xdf
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, .L08098228 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x35
	ldrb r1, [r0]
	movs r2, #0x20
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, .L08098228 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x36
	ldrb r1, [r0]
	movs r2, #0xdf
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, .L08098228 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x3c
	ldrb r1, [r0]
	movs r2, #0xc0
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, .L08098228 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x44
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, .L08098228 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x45
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, .L08098228 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x46
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #8
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, .L0809823C @ =gDispIo+0x3C
	ldr r1, .L0809823C @ =gDispIo+0x3C
	ldrh r2, [r1]
	ldr r3, .L08098240 @ =0x0000FFE0
	adds r1, r2, #0
	ands r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, .L0809823C @ =gDispIo+0x3C
	ldr r1, .L0809823C @ =gDispIo+0x3C
	ldrh r2, [r1]
	movs r3, #8
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, .L0809823C @ =gDispIo+0x3C
	ldr r1, .L0809823C @ =gDispIo+0x3C
	ldrh r2, [r1]
	ldr r3, .L08098244 @ =0x0000E0FF
	adds r1, r2, #0
	ands r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, .L0809823C @ =gDispIo+0x3C
	ldr r1, .L0809823C @ =gDispIo+0x3C
	ldrh r2, [r1]
	strh r2, [r0]
	ldr r4, .L08098248 @ =Img_Background_082D80B0
	movs r0, #3
	bl GetBgChrOffset
	movs r2, #0xc0
	lsls r2, r2, #0x13
	adds r1, r0, r2
	adds r0, r4, #0
	bl Decompress
	ldr r0, .L0809824C @ =gBg3Tm
	ldr r1, .L08098250 @ =Tsa_Background_082DAC8C
	movs r2, #0xc0
	lsls r2, r2, #8
	bl TmApplyTsa_thm
	ldr r0, .L08098254 @ =Pal_Background_082DB140
	movs r1, #0xc0
	lsls r1, r1, #1
	movs r2, #0x80
	bl ApplyPaletteExt
	movs r0, #8
	bl EnableBgSync
	add sp, #8
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08098220: .4byte ProcScr_Mu
.L08098224: .4byte HideMu
.L08098228: .4byte gDispIo
.L0809822C: .4byte gUnk_082DC944
.L08098230: .4byte gBuf
.L08098234: .4byte gBg1Tm
.L08098238: .4byte gBg1Tm+0x200
.L0809823C: .4byte gDispIo+0x3C
.L08098240: .4byte 0x0000FFE0
.L08098244: .4byte 0x0000E0FF
.L08098248: .4byte Img_Background_082D80B0
.L0809824C: .4byte gBg3Tm
.L08098250: .4byte Tsa_Background_082DAC8C
.L08098254: .4byte Pal_Background_082DB140

	thumb_func_start func_fe6_08098258
func_fe6_08098258: @ 0x08098258
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, .L08098284 @ =gArenaSt
	ldr r1, [r0]
	ldr r2, .L08098288 @ =gBattleUnitA
	adds r0, r1, #0
	adds r1, r2, #0
	bl UpdateUnitFromBattle
	ldr r0, .L0809828C @ =gActiveUnit
	ldr r1, [r0]
	adds r0, r1, #0
	bl StartMu
	bl SetAutoMuDefaultFacing
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08098284: .4byte gArenaSt
.L08098288: .4byte gBattleUnitA
.L0809828C: .4byte gActiveUnit

	thumb_func_start func_fe6_08098290
func_fe6_08098290: @ 0x08098290
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r1, .L080982AC @ =0x000002F3
	adds r0, r1, #0
	ldr r1, [r7]
	bl func_fe6_080985D8
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
.L080982AC: .4byte 0x000002F3

	thumb_func_start func_fe6_080982B0
func_fe6_080982B0: @ 0x080982B0
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	bl ArenaGetMatchupGoldValue
	adds r1, r0, #0
	adds r0, r1, #0
	bl SetTalkNumber
	movs r1, #0xbd
	lsls r1, r1, #2
	adds r0, r1, #0
	ldr r1, [r7]
	bl func_fe6_080985D8
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start func_fe6_080982D8
func_fe6_080982D8: @ 0x080982D8
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
	bl func_fe6_080985D8
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
	bl func_fe6_080985D8
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
	bl func_fe6_080985D8
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
	bl func_fe6_080985D8
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
	bl func_fe6_080985D8
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
	bl func_fe6_080985D8
	b .L08098548
	.align 2, 0
.L08098510: .4byte 0x000002F9
.L08098514:
	ldr r1, .L08098534 @ =0x000002FB
	adds r0, r1, #0
	ldr r1, [r7]
	bl func_fe6_080985D8
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
	bl func_fe6_080985D8
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

	thumb_func_start Shop_OnExit
Shop_OnExit: @ 0x080985AC
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

	thumb_func_start func_fe6_080985D8
func_fe6_080985D8: @ 0x080985D8
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
