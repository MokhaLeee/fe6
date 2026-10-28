
	.include "macro.inc"

	.syntax unified

	thumb_func_start DrawLinkArenaPointsBox
DrawLinkArenaPointsBox: @ 0x0803C144
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r6, r1, #0
	lsls r0, r2, #5
	adds r0, r0, r6
	lsls r0, r0, #1
	ldr r1, .L0803C19C @ =gBg1Tm
	adds r0, r0, r1
	movs r1, #0
	adds r5, r2, #1
.L0803C158:
	adds r2, r1, #1
	movs r1, #5
.L0803C15C:
	strh r3, [r0]
	adds r0, #2
	adds r3, #1
	subs r1, #1
	cmp r1, #0
	bge .L0803C15C
	adds r0, #0x34
	adds r1, r2, #0
	cmp r1, #3
	ble .L0803C158
	adds r0, r4, #0
	bl ClearText
	adds r0, r4, #0
	movs r1, #0x18
	movs r2, #2
	ldr r3, [sp, #0x10]
	bl Text_InsertDrawNumberOrBlank
	lsls r1, r5, #5
	adds r1, #1
	adds r1, r1, r6
	lsls r1, r1, #1
	ldr r0, .L0803C1A0 @ =gBg0Tm
	adds r1, r1, r0
	adds r0, r4, #0
	bl PutText
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L0803C19C: .4byte gBg1Tm
.L0803C1A0: .4byte gBg0Tm

	thumb_func_start LAPointsBox_LoadBoxes
LAPointsBox_LoadBoxes: @ 0x0803C1A4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, .L0803C264 @ =Img_LAPointsBox
	ldr r1, .L0803C268 @ =0x06002000
	bl Decompress
	ldr r0, .L0803C26C @ =Pal_TacticianSelObj
	movs r1, #0x40
	movs r2, #0x80
	bl ApplyPaletteExt
	movs r0, #0
	bl SetTextFont
	bl ResetTextFont
	movs r0, #0
	mov sb, r0
	ldr r0, .L0803C270 @ =gUnk_Sio_0810F390
	mov sl, r0
	adds r6, r4, #0
	adds r6, #0x2c
	ldr r7, .L0803C274 @ =gUnk_Sio_0810F400
.L0803C1DC:
	ldr r0, .L0803C278 @ =gSioSt
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #2
	add r0, sb
	add r0, sl
	ldrb r5, [r0]
	adds r0, r5, #0
	bl func_fe6_08035CB0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L0803C23E
	ldr r0, .L0803C27C @ =gSioBmSt
	mov r8, r0
	adds r0, #0xa
	adds r0, r5, r0
	ldrb r0, [r0]
	adds r4, r5, #2
	cmp r0, #0
	bne .L0803C214
	lsls r1, r4, #5
	ldr r0, .L0803C280 @ =gUnk_08109C60
	movs r2, #0x20
	bl ApplyPaletteExt
.L0803C214:
	movs r0, #0xf
	ands r4, r0
	lsls r4, r4, #0xc
	adds r0, #0xf1
	adds r4, r4, r0
	adds r0, r6, #0
	movs r1, #4
	bl InitTextDb
	ldrb r1, [r7]
	ldrb r2, [r7, #1]
	lsls r0, r5, #2
	mov r3, r8
	adds r3, #0x14
	adds r0, r0, r3
	ldr r0, [r0]
	str r0, [sp]
	adds r0, r6, #0
	adds r3, r4, #0
	bl DrawLinkArenaPointsBox
.L0803C23E:
	adds r6, #8
	adds r7, #2
	movs r0, #1
	add sb, r0
	mov r0, sb
	cmp r0, #3
	ble .L0803C1DC
	movs r0, #3
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
.L0803C264: .4byte Img_LAPointsBox
.L0803C268: .4byte 0x06002000
.L0803C26C: .4byte Pal_TacticianSelObj
.L0803C270: .4byte gUnk_Sio_0810F390
.L0803C274: .4byte gUnk_Sio_0810F400
.L0803C278: .4byte gSioSt
.L0803C27C: .4byte gSioBmSt
.L0803C280: .4byte gUnk_08109C60

	thumb_func_start LAPointsBox_Dummy
LAPointsBox_Dummy: @ 0x0803C284
	bx lr
	.align 2, 0

	thumb_func_start StartLinkArenaPointsBox
StartLinkArenaPointsBox: @ 0x0803C288
	push {lr}
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r0, .L0803C2AC @ =ProcScr_LinkArenaPointsBox
	movs r1, #3
	bl SpawnProc
	pop {r0}
	bx r0
	.align 2, 0
.L0803C2AC: .4byte ProcScr_LinkArenaPointsBox

	thumb_func_start EndLinkArenaPointsBox
EndLinkArenaPointsBox: @ 0x0803C2B0
	push {lr}
	ldr r0, .L0803C2C0 @ =ProcScr_LinkArenaPointsBox
	bl Proc_EndEach
	bl ClearUi
	pop {r0}
	bx r0
	.align 2, 0
.L0803C2C0: .4byte ProcScr_LinkArenaPointsBox

	thumb_func_start PointsNumberMover_Init
PointsNumberMover_Init: @ 0x0803C2C4
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r0, #0x33
	ldrb r0, [r0]
	bl GetUnit
	adds r4, r0, #0
	ldr r1, .L0803C314 @ =gUnk_Sio_0810F3A0
	adds r2, r5, #0
	adds r2, #0x32
	ldr r0, .L0803C318 @ =gSioSt
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #2
	ldrb r2, [r2]
	adds r0, r2, r0
	adds r0, r0, r1
	ldrb r2, [r0]
	adds r0, r5, #0
	adds r0, #0x40
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq .L0803C31C
	ldrb r0, [r4, #0xe]
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	lsls r0, r0, #4
	subs r0, #0x10
	strh r0, [r5, #0x2a]
	movs r0, #0xf
	ldrsb r0, [r4, r0]
	lsls r0, r0, #4
	strh r0, [r5, #0x2c]
	lsls r2, r2, #1
	b .L0803C344
	.align 2, 0
.L0803C314: .4byte gUnk_Sio_0810F3A0
.L0803C318: .4byte gSioSt
.L0803C31C:
	movs r1, #0xe
	ldrsb r1, [r4, r1]
	lsls r1, r1, #4
	ldr r3, .L0803C380 @ =gUnk_Sio_085CA70C
	lsls r0, r2, #3
	adds r0, r0, r3
	ldr r0, [r0]
	adds r0, r0, r1
	subs r0, #0xc
	strh r0, [r5, #0x2a]
	movs r1, #0xf
	ldrsb r1, [r4, r1]
	lsls r1, r1, #4
	lsls r2, r2, #1
	adds r0, r2, #1
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrh r0, [r0]
	adds r1, r0, r1
	strh r1, [r5, #0x2c]
.L0803C344:
	ldr r1, .L0803C384 @ =gUnk_Sio_0810F400
	adds r0, r2, r1
	ldrb r0, [r0]
	lsls r0, r0, #3
	adds r0, #8
	movs r4, #0
	strh r0, [r5, #0x2e]
	adds r0, r2, #1
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #3
	adds r0, #8
	strh r0, [r5, #0x30]
	ldr r0, .L0803C388 @ =gFont_Unk_Sio_02001000
	bl SetTextFont
	ldr r0, .L0803C38C @ =gText_Unk_Sio_02001018
	adds r1, r5, #0
	adds r1, #0x32
	ldrb r1, [r1]
	lsls r1, r1, #5
	adds r1, #0x18
	ldr r3, [r5, #0x34]
	movs r2, #2
	bl Text_InsertDrawNumberOrBlank
	str r4, [r5, #0x3c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0803C380: .4byte gUnk_Sio_085CA70C
.L0803C384: .4byte gUnk_Sio_0810F400
.L0803C388: .4byte gFont_Unk_Sio_02001000
.L0803C38C: .4byte gText_Unk_Sio_02001018

	thumb_func_start PointsNumberMover_LoopNumberEmerge
PointsNumberMover_LoopNumberEmerge: @ 0x0803C390
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r7, r0, #0
	adds r0, #0x33
	ldrb r0, [r0]
	bl GetUnit
	str r0, [sp, #4]
	ldr r3, [r7, #0x3c]
	cmp r3, #0x10
	bhi .L0803C424
	movs r0, #0x80
	lsls r0, r0, #1
	mov r8, r0
	movs r0, #0x10
	str r0, [sp]
	movs r0, #1
	movs r1, #0x10
	mov r2, r8
	bl Interpolate
	mov sl, r0
	ldr r4, .L0803C454 @ =gSinLut
	movs r1, #0x80
	adds r1, r1, r4
	mov sb, r1
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #4
	mov r1, r8
	bl Div
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	movs r1, #0
	ldrsh r0, [r4, r1]
	rsbs r0, r0, #0
	lsls r0, r0, #4
	mov r1, sl
	bl Div
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	movs r2, #0
	ldrsh r0, [r4, r2]
	lsls r0, r0, #4
	mov r1, r8
	bl Div
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	mov r1, sb
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #4
	mov r1, sl
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	movs r0, #0
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl SetObjAffine
.L0803C424:
	adds r0, r7, #0
	adds r0, #0x40
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq .L0803C476
	ldr r1, [r7, #0x3c]
	cmp r1, #3
	bls .L0803C476
	cmp r1, #0x16
	bhi .L0803C476
	subs r1, #4
	ldr r4, [sp, #4]
	ldrb r4, [r4, #0xe]
	cmp r4, #8
	bne .L0803C45C
	ldr r0, .L0803C458 @ =gUnk_Sio_085CA72C
	lsls r1, r1, #1
	adds r0, r1, r0
	ldrh r2, [r7, #0x2a]
	ldrh r0, [r0]
	adds r0, r2, r0
	b .L0803C468
	.align 2, 0
.L0803C454: .4byte gSinLut
.L0803C458: .4byte gUnk_Sio_085CA72C
.L0803C45C:
	ldr r0, .L0803C4BC @ =gUnk_Sio_085CA72C
	lsls r1, r1, #1
	adds r0, r1, r0
	ldrh r4, [r7, #0x2a]
	ldrh r0, [r0]
	subs r0, r4, r0
.L0803C468:
	strh r0, [r7, #0x2a]
	ldr r0, .L0803C4C0 @ =gUnk_Sio_085CA752
	adds r0, r1, r0
	ldrh r1, [r7, #0x2c]
	ldrh r0, [r0]
	subs r0, r1, r0
	strh r0, [r7, #0x2c]
.L0803C476:
	movs r2, #0x2a
	ldrsh r0, [r7, r2]
	movs r4, #0x2c
	ldrsh r1, [r7, r4]
	movs r2, #0x80
	lsls r2, r2, #1
	adds r1, r1, r2
	ldr r2, .L0803C4C4 @ =Sprite_32x16
	adds r3, r7, #0
	adds r3, #0x32
	ldrb r3, [r3]
	lsls r3, r3, #2
	ldr r4, .L0803C4C8 @ =0x00009340
	adds r3, r3, r4
	bl PutOamHiRam
	ldr r0, [r7, #0x3c]
	adds r0, #1
	str r0, [r7, #0x3c]
	cmp r0, #0x40
	bls .L0803C4AA
	movs r0, #0
	str r0, [r7, #0x3c]
	adds r0, r7, #0
	bl Proc_Break
.L0803C4AA:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0803C4BC: .4byte gUnk_Sio_085CA72C
.L0803C4C0: .4byte gUnk_Sio_085CA752
.L0803C4C4: .4byte Sprite_32x16
.L0803C4C8: .4byte 0x00009340

	thumb_func_start PointsNumberMover_LoopMoveToPointsBox
PointsNumberMover_LoopMoveToPointsBox: @ 0x0803C4CC
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	movs r0, #0x2a
	ldrsh r1, [r6, r0]
	movs r0, #0x2e
	ldrsh r2, [r6, r0]
	ldr r3, [r6, #0x3c]
	movs r4, #0x30
	str r4, [sp]
	movs r0, #5
	bl Interpolate
	adds r5, r0, #0
	movs r0, #0x2c
	ldrsh r1, [r6, r0]
	movs r0, #0x30
	ldrsh r2, [r6, r0]
	ldr r3, [r6, #0x3c]
	str r4, [sp]
	movs r0, #5
	bl Interpolate
	adds r1, r0, #0
	ldr r2, .L0803C528 @ =Sprite_32x16
	adds r0, r6, #0
	adds r0, #0x32
	ldrb r0, [r0]
	lsls r3, r0, #2
	ldr r0, .L0803C52C @ =0x00009340
	adds r3, r3, r0
	adds r0, r5, #0
	bl PutOamHiRam
	ldr r0, [r6, #0x3c]
	adds r0, #1
	str r0, [r6, #0x3c]
	cmp r0, #0x20
	bls .L0803C520
	adds r0, r6, #0
	bl Proc_Break
.L0803C520:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L0803C528: .4byte Sprite_32x16
.L0803C52C: .4byte 0x00009340

	thumb_func_start DrawLinkArenaScoreNumber
DrawLinkArenaScoreNumber: @ 0x0803C530
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r5, r0, #0
	mov r8, r1
	adds r4, r2, #0
	adds r6, r3, #0
	bl ClearText
	adds r0, r5, #0
	movs r1, #0x18
	movs r2, #2
	adds r3, r6, #0
	bl Text_InsertDrawNumberOrBlank
	adds r4, #1
	lsls r4, r4, #5
	adds r4, #1
	add r4, r8
	lsls r4, r4, #1
	ldr r0, .L0803C574 @ =gBg0Tm
	adds r4, r4, r0
	adds r0, r5, #0
	adds r1, r4, #0
	bl PutText
	movs r0, #1
	bl EnableBgSync
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L0803C574: .4byte gBg0Tm

	thumb_func_start PointsNumberMover_InitScoreChange
PointsNumberMover_InitScoreChange: @ 0x0803C578
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r1, .L0803C5D8 @ =gUnk_Sio_0810F3A0
	adds r2, r6, #0
	adds r2, #0x32
	ldr r0, .L0803C5DC @ =gSioSt
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #2
	ldrb r2, [r2]
	adds r0, r2, r0
	adds r0, r0, r1
	ldr r2, .L0803C5E0 @ =gUnk_Sio_0810F400
	ldrb r0, [r0]
	lsls r0, r0, #1
	adds r1, r0, r2
	ldrb r1, [r1]
	movs r5, #0
	strh r1, [r6, #0x2a]
	adds r0, #1
	adds r0, r0, r2
	ldrb r0, [r0]
	strh r0, [r6, #0x2c]
	movs r0, #0
	bl SetTextFont
	adds r0, r6, #0
	adds r0, #0x48
	movs r2, #0x2a
	ldrsh r1, [r6, r2]
	movs r3, #0x2c
	ldrsh r2, [r6, r3]
	ldr r3, [r6, #0x38]
	ldr r4, [r6, #0x34]
	subs r3, r3, r4
	bl DrawLinkArenaScoreNumber
	str r5, [r6, #0x3c]
	ldr r0, [r6, #0x38]
	ldr r1, [r6, #0x34]
	subs r0, r0, r1
	str r0, [r6, #0x44]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L0803C5D8: .4byte gUnk_Sio_0810F3A0
.L0803C5DC: .4byte gSioSt
.L0803C5E0: .4byte gUnk_Sio_0810F400

	thumb_func_start PointsNumberMover_TickScore
PointsNumberMover_TickScore: @ 0x0803C5E4
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r2, [r4, #0x38]
	ldr r1, [r4, #0x34]
	subs r1, r2, r1
	ldr r3, [r4, #0x3c]
	movs r0, #0xa
	str r0, [sp]
	movs r0, #0
	bl Interpolate
	adds r5, r0, #0
	movs r0, #0
	bl SetTextFont
	adds r0, r4, #0
	adds r0, #0x48
	movs r2, #0x2a
	ldrsh r1, [r4, r2]
	movs r3, #0x2c
	ldrsh r2, [r4, r3]
	adds r3, r5, #0
	bl DrawLinkArenaScoreNumber
	ldr r0, [r4, #0x44]
	cmp r0, r5
	beq .L0803C63C
	adds r1, r4, #0
	adds r1, #0x32
	ldr r0, .L0803C66C @ =gSioSt
	ldr r0, [r0]
	ldrb r1, [r1]
	ldrb r0, [r0, #6]
	cmp r1, r0
	bne .L0803C63C
	ldr r0, .L0803C670 @ =gPlaySt
	ldrb r0, [r0, #0x1d]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L0803C63C
	movs r0, #0x80
	bl m4aSongNumStart
.L0803C63C:
	str r5, [r4, #0x44]
	ldr r0, [r4, #0x3c]
	adds r0, #1
	str r0, [r4, #0x3c]
	cmp r0, #0xa
	bls .L0803C664
	movs r0, #0
	str r0, [r4, #0x3c]
	ldr r0, .L0803C674 @ =gSioBmSt
	adds r1, r4, #0
	adds r1, #0x32
	ldrb r1, [r1]
	lsls r1, r1, #2
	adds r0, #0x14
	adds r1, r1, r0
	ldr r0, [r4, #0x38]
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
.L0803C664:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0803C66C: .4byte gSioSt
.L0803C670: .4byte gPlaySt
.L0803C674: .4byte gSioBmSt

	thumb_func_start PointsNumberMover_AwaitEnd
PointsNumberMover_AwaitEnd: @ 0x0803C678
	push {lr}
	adds r1, r0, #0
	ldr r0, [r1, #0x3c]
	adds r0, #1
	str r0, [r1, #0x3c]
	cmp r0, #0x14
	bls .L0803C68C
	adds r0, r1, #0
	bl Proc_Break
.L0803C68C:
	pop {r0}
	bx r0

	thumb_func_start PointsSpriteText_Init
PointsSpriteText_Init: @ 0x0803C690
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, .L0803C6B4 @ =gFont_Unk_Sio_02001000
	bl SetTextFont
	ldr r0, .L0803C6B8 @ =gText_Unk_Sio_02001018
	ldr r3, [r4, #0x54]
	movs r1, #0x80
	movs r2, #0
	bl Text_InsertDrawString
	adds r4, #0x4c
	movs r0, #0
	strh r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0803C6B4: .4byte gFont_Unk_Sio_02001000
.L0803C6B8: .4byte gText_Unk_Sio_02001018

	thumb_func_start PointsSpriteText_LoopIn
PointsSpriteText_LoopIn: @ 0x0803C6BC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r7, r0, #0
	movs r0, #0x4c
	adds r0, r0, r7
	mov sb, r0
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0x10
	bgt .L0803C74E
	movs r2, #0x80
	lsls r2, r2, #1
	mov r8, r2
	mov r0, sb
	movs r1, #0
	ldrsh r3, [r0, r1]
	movs r0, #0x10
	str r0, [sp]
	movs r0, #1
	movs r1, #0x10
	bl Interpolate
	mov sl, r0
	ldr r4, .L0803C7BC @ =gSinLut
	ldr r2, .L0803C7C0 @ =gSinLut+0x80
	movs r1, #0
	ldrsh r0, [r2, r1]
	lsls r0, r0, #4
	mov r1, r8
	bl Div
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	movs r2, #0
	ldrsh r0, [r4, r2]
	rsbs r0, r0, #0
	lsls r0, r0, #4
	mov r1, sl
	bl Div
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	movs r1, #0
	ldrsh r0, [r4, r1]
	lsls r0, r0, #4
	mov r1, r8
	bl Div
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	ldr r2, .L0803C7C0 @ =gSinLut+0x80
	movs r1, #0
	ldrsh r0, [r2, r1]
	lsls r0, r0, #4
	mov r1, sl
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	movs r0, #1
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl SetObjAffine
.L0803C74E:
	ldr r0, [r7, #0x2c]
	movs r2, #0x80
	lsls r2, r2, #2
	adds r0, r0, r2
	ldr r1, [r7, #0x30]
	movs r4, #0x80
	lsls r4, r4, #1
	adds r1, r1, r4
	ldr r5, .L0803C7C4 @ =Sprite_32x16
	ldr r3, .L0803C7C8 @ =0x00009350
	adds r2, r5, #0
	bl PutOamHiRam
	ldr r0, [r7, #0x2c]
	movs r1, #0x88
	lsls r1, r1, #2
	adds r0, r0, r1
	ldr r1, [r7, #0x30]
	adds r1, r1, r4
	ldr r3, .L0803C7CC @ =0x00009354
	adds r2, r5, #0
	bl PutOamHiRam
	ldr r0, [r7, #0x2c]
	movs r2, #0x90
	lsls r2, r2, #2
	adds r0, r0, r2
	ldr r1, [r7, #0x30]
	adds r1, r1, r4
	ldr r2, .L0803C7D0 @ =Sprite_16x16
	ldr r3, .L0803C7D4 @ =0x00009358
	bl PutOamHiRam
	mov r1, sb
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x40
	ble .L0803C7AA
	movs r0, #0
	strh r0, [r1]
	adds r0, r7, #0
	bl Proc_Break
.L0803C7AA:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0803C7BC: .4byte gSinLut
.L0803C7C0: .4byte gSinLut+0x80
.L0803C7C4: .4byte Sprite_32x16
.L0803C7C8: .4byte 0x00009350
.L0803C7CC: .4byte 0x00009354
.L0803C7D0: .4byte Sprite_16x16
.L0803C7D4: .4byte 0x00009358

	thumb_func_start PointsSpriteText_LoopOut
PointsSpriteText_LoopOut: @ 0x0803C7D8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r7, r0, #0
	adds r0, #0x4c
	str r0, [sp, #4]
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0x10
	bgt .L0803C86E
	movs r2, #0x80
	lsls r2, r2, #1
	mov r8, r2
	ldr r0, [sp, #4]
	movs r1, #0
	ldrsh r3, [r0, r1]
	movs r0, #0x10
	str r0, [sp]
	movs r0, #4
	mov r1, r8
	movs r2, #0x10
	bl Interpolate
	mov sl, r0
	ldr r4, .L0803C8D8 @ =gSinLut
	movs r2, #0x80
	adds r2, r2, r4
	mov sb, r2
	movs r1, #0
	ldrsh r0, [r2, r1]
	lsls r0, r0, #4
	mov r1, r8
	bl Div
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	movs r2, #0
	ldrsh r0, [r4, r2]
	rsbs r0, r0, #0
	lsls r0, r0, #4
	mov r1, sl
	bl Div
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	movs r1, #0
	ldrsh r0, [r4, r1]
	lsls r0, r0, #4
	mov r1, r8
	bl Div
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	mov r2, sb
	movs r1, #0
	ldrsh r0, [r2, r1]
	lsls r0, r0, #4
	mov r1, sl
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	movs r0, #1
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl SetObjAffine
.L0803C86E:
	ldr r0, [r7, #0x2c]
	movs r2, #0x80
	lsls r2, r2, #2
	adds r0, r0, r2
	ldr r1, [r7, #0x30]
	movs r4, #0x80
	lsls r4, r4, #1
	adds r1, r1, r4
	ldr r5, .L0803C8DC @ =Sprite_32x16
	ldr r3, .L0803C8E0 @ =0x00009350
	adds r2, r5, #0
	bl PutOamHiRam
	ldr r0, [r7, #0x2c]
	movs r1, #0x88
	lsls r1, r1, #2
	adds r0, r0, r1
	ldr r1, [r7, #0x30]
	adds r1, r1, r4
	ldr r3, .L0803C8E4 @ =0x00009354
	adds r2, r5, #0
	bl PutOamHiRam
	ldr r0, [r7, #0x2c]
	movs r2, #0x90
	lsls r2, r2, #2
	adds r0, r0, r2
	ldr r1, [r7, #0x30]
	adds r1, r1, r4
	ldr r2, .L0803C8E8 @ =Sprite_16x16
	ldr r3, .L0803C8EC @ =0x00009358
	bl PutOamHiRam
	ldr r1, [sp, #4]
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x10
	ble .L0803C8C6
	adds r0, r7, #0
	bl Proc_Break
.L0803C8C6:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0803C8D8: .4byte gSinLut
.L0803C8DC: .4byte Sprite_32x16
.L0803C8E0: .4byte 0x00009350
.L0803C8E4: .4byte 0x00009354
.L0803C8E8: .4byte Sprite_16x16
.L0803C8EC: .4byte 0x00009358

	thumb_func_start NewSioPointsSpriteText
NewSioPointsSpriteText: @ 0x0803C8F0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	str r2, [sp, #0x10]
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	mov sb, r3
	movs r0, #0
	mov sl, r0
	ldr r0, .L0803C9C8 @ =Pal_Text
	movs r1, #0xc8
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, .L0803C9CC @ =gFont_Unk_Sio_02001000
	ldr r1, .L0803C9D0 @ =0x06016800
	movs r2, #3
	bl InitSpriteTextFont
	movs r0, #0
	bl SetTextFontGlyphs
	bl ResetTextFont
	ldr r4, .L0803C9D4 @ =gText_Unk_Sio_02001018
	adds r0, r4, #0
	bl InitSpriteText
	adds r0, r4, #0
	movs r1, #0
	bl SpriteText_DrawBackgroundExt
	movs r0, #0
	bl SetTextFont
	movs r1, #0
	mov r8, r1
.L0803C946:
	ldr r0, .L0803C9D8 @ =gSioSt
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #2
	add r0, r8
	ldr r1, .L0803C9DC @ =gUnk_Sio_0810F3A0
	adds r0, r0, r1
	ldrb r4, [r0]
	adds r0, r4, #0
	bl func_fe6_08035CB0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L0803C9F4
	ldr r6, .L0803C9E0 @ =gSioBmSt
	lsls r5, r4, #3
	adds r0, r6, #0
	adds r0, #0x30
	adds r7, r5, r0
	ldr r0, [r7]
	cmp r0, #0
	beq .L0803C9EC
	ldr r0, .L0803C9E4 @ =ProcScr_LinkArena_PointsNumberMover
	ldr r1, [sp, #0x34]
	bl SpawnProcLocking
	adds r2, r0, #0
	adds r0, #0x32
	strb r4, [r0]
	adds r0, r5, r6
	adds r0, #0x2c
	ldrb r0, [r0]
	adds r1, r2, #0
	adds r1, #0x33
	strb r0, [r1]
	lsls r1, r4, #2
	adds r0, r6, #0
	adds r0, #0x14
	adds r3, r1, r0
	ldr r1, [r3]
	ldr r0, [r7]
	adds r1, r1, r0
	str r1, [r2, #0x38]
	ldr r0, .L0803C9E8 @ =9999
	cmp r1, r0
	bls .L0803C9A8
	str r0, [r2, #0x38]
.L0803C9A8:
	ldr r0, [r2, #0x38]
	ldr r1, [r3]
	subs r0, r0, r1
	str r0, [r2, #0x34]
	adds r0, r2, #0
	adds r0, #0x40
	mov r1, sb
	strb r1, [r0]
	adds r0, #8
	movs r1, #4
	bl InitTextDb
	movs r0, #1
	add sl, r0
	b .L0803C9F4
	.align 2, 0
.L0803C9C8: .4byte Pal_Text
.L0803C9CC: .4byte gFont_Unk_Sio_02001000
.L0803C9D0: .4byte 0x06016800
.L0803C9D4: .4byte gText_Unk_Sio_02001018
.L0803C9D8: .4byte gSioSt
.L0803C9DC: .4byte gUnk_Sio_0810F3A0
.L0803C9E0: .4byte gSioBmSt
.L0803C9E4: .4byte ProcScr_LinkArena_PointsNumberMover
.L0803C9E8: .4byte 9999
.L0803C9EC:
	mov r0, sp
	movs r1, #4
	bl InitTextDb
.L0803C9F4:
	movs r1, #1
	add r8, r1
	mov r0, r8
	cmp r0, #3
	ble .L0803C946
	mov r1, sl
	cmp r1, #0
	beq .L0803CA28
	mov r0, sb
	cmp r0, #0
	beq .L0803CA1E
	ldr r0, .L0803CA24 @ =ProcScr_LinkArena_PointsSpriteText
	ldr r1, [sp, #0x34]
	bl SpawnProcLocking
	ldr r1, [sp, #8]
	str r1, [r0, #0x2c]
	ldr r1, [sp, #0xc]
	str r1, [r0, #0x30]
	ldr r1, [sp, #0x10]
	str r1, [r0, #0x54]
.L0803CA1E:
	movs r0, #1
	b .L0803CA2A
	.align 2, 0
.L0803CA24: .4byte ProcScr_LinkArena_PointsSpriteText
.L0803CA28:
	movs r0, #0
.L0803CA2A:
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start StartSioPoints1
StartSioPoints1: @ 0x0803CA3C
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	bl StartLinkArenaPointsBox
	ldr r2, .L0803CA68 @ =gUnk_Sio_0810F408
	str r4, [sp]
	movs r0, #0x58
	movs r1, #0x3c
	movs r3, #1
	bl NewSioPointsSpriteText
	lsls r0, r0, #0x18
	cmp r0, #0
	bne .L0803CA5E
	bl EndLinkArenaPointsBox
.L0803CA5E:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0803CA68: .4byte gUnk_Sio_0810F408

	thumb_func_start StartSioPoints2
StartSioPoints2: @ 0x0803CA6C
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	bl StartLinkArenaPointsBox
	ldr r2, .L0803CA8C @ =gUnk_Sio_0810F408
	str r4, [sp]
	movs r0, #0x58
	movs r1, #0x3c
	movs r3, #0
	bl NewSioPointsSpriteText
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0803CA8C: .4byte gUnk_Sio_0810F408

	thumb_func_start func_fe6_0803CA90
func_fe6_0803CA90: @ 0x0803CA90
	adds r1, r0, #0
	adds r1, #0x1c
	ldr r3, .L0803CAA8 @ =gUnk_03001418
	movs r2, #4
.L0803CA98:
	ldrh r0, [r1]
	strh r0, [r3]
	adds r1, #2
	adds r3, #2
	subs r2, #1
	cmp r2, #0
	bge .L0803CA98
	bx lr
	.align 2, 0
.L0803CAA8: .4byte gUnk_03001418

	thumb_func_start func_fe6_0803CAAC
func_fe6_0803CAAC: @ 0x0803CAAC
	ldr r3, .L0803CAC4 @ =gUnk_03001418
	adds r1, r0, #0
	adds r1, #0x1c
	movs r2, #4
.L0803CAB4:
	ldrh r0, [r3]
	strh r0, [r1]
	adds r3, #2
	adds r1, #2
	subs r2, #1
	cmp r2, #0
	bge .L0803CAB4
	bx lr
	.align 2, 0
.L0803CAC4: .4byte gUnk_03001418

	thumb_func_start func_fe6_0803CAC8
func_fe6_0803CAC8: @ 0x0803CAC8
	push {lr}
	bl func_fe6_0803CD74
	bl RefreshUnitSprites
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_fe6_0803CAD8
func_fe6_0803CAD8: @ 0x0803CAD8
	movs r1, #0
	ldr r3, .L0803CAF4 @ =gSioBmSt
	adds r2, r3, #0
	adds r2, #0xa
.L0803CAE0:
	cmp r0, #2
	beq .L0803CB0A
	cmp r0, #2
	bgt .L0803CAF8
	cmp r0, #0
	beq .L0803CB02
	cmp r0, #1
	beq .L0803CB06
	b .L0803CB14
	.align 2, 0
.L0803CAF4: .4byte gSioBmSt
.L0803CAF8:
	cmp r0, #3
	beq .L0803CB0E
	cmp r0, #0xff
	beq .L0803CB12
	b .L0803CB14
.L0803CB02:
	movs r1, #2
	b .L0803CB14
.L0803CB06:
	movs r1, #3
	b .L0803CB14
.L0803CB0A:
	movs r1, #1
	b .L0803CB14
.L0803CB0E:
	movs r1, #0
	b .L0803CB14
.L0803CB12:
	movs r1, #0xff
.L0803CB14:
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, #0
	bne .L0803CB24
	cmp r1, #0xff
	beq .L0803CB24
	adds r0, r1, #0
	b .L0803CAE0
.L0803CB24:
	strb r1, [r3, #1]
	bx lr

	thumb_func_start func_fe6_0803CB28
func_fe6_0803CB28: @ 0x0803CB28
	ldr r1, .L0803CB38 @ =gUnk_0300140C
	movs r0, #0
	strb r0, [r1]
	strb r0, [r1, #1]
	strb r0, [r1, #3]
	strb r0, [r1, #2]
	bx lr
	.align 2, 0
.L0803CB38: .4byte gUnk_0300140C

	thumb_func_start func_fe6_0803CB3C
func_fe6_0803CB3C: @ 0x0803CB3C
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	adds r0, r3, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	bl func_fe6_0803CB28
	ldr r1, .L0803CB78 @ =gUnk_0300140C
	strb r4, [r1]
	strb r5, [r1, #1]
	strb r6, [r1, #2]
	ldr r0, [sp]
	strb r0, [r1, #3]
	ldr r0, .L0803CB7C @ =gLinkArenaSt
	ldrb r0, [r0]
	cmp r0, #2
	beq .L0803CB80
	movs r0, #0
	b .L0803CB8C
	.align 2, 0
.L0803CB78: .4byte gUnk_0300140C
.L0803CB7C: .4byte gLinkArenaSt
.L0803CB80:
	adds r0, r1, #0
	movs r1, #4
	bl SioEmitData
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
.L0803CB8C:
	add sp, #4
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start func_fe6_0803CB94
func_fe6_0803CB94: @ 0x0803CB94
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	movs r1, #0
	ldr r3, .L0803CBA8 @ =gUnk_030013F0
.L0803CB9C:
	adds r0, r1, r3
	ldrb r0, [r0]
	cmp r0, r2
	bne .L0803CBAC
	adds r0, r1, #0
	b .L0803CBB2
	.align 2, 0
.L0803CBA8: .4byte gUnk_030013F0
.L0803CBAC:
	adds r1, #1
	cmp r1, #0x13
	ble .L0803CB9C
.L0803CBB2:
	bx lr

	thumb_func_start func_fe6_0803CBB4
func_fe6_0803CBB4: @ 0x0803CBB4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	adds r4, r0, #0
	str r1, [sp, #0x10]
	adds r5, r2, #0
	mov r8, r3
	ldr r0, [sp, #0x34]
	mov sb, r0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r1, .L0803CCAC @ =gUnk_Sio_0810F41B
	mov r0, sp
	movs r2, #8
	bl memcpy
	add r7, sp, #8
	ldr r1, .L0803CCB0 @ =gUnk_Sio_0810F423
	adds r0, r7, #0
	movs r2, #8
	bl memcpy
	adds r0, r4, #0
	bl func_fe6_0803CB94
	adds r4, r0, #0
	movs r1, #5
	bl Div
	lsls r6, r0, #1
	strb r4, [r5]
	ldr r0, .L0803CCB4 @ =gUnk_030013F0
	adds r4, r4, r0
	ldrb r0, [r4]
	bl GetUnit
	adds r5, r0, #0
	movs r1, #0x80
	lsls r1, r1, #2
	mov sl, r1
	mov r0, sl
	ldrh r2, [r5, #0xc]
	ands r0, r2
	cmp r0, #0
	bne .L0803CC32
	adds r0, r5, #0
	bl StartMu
	ldr r1, .L0803CCB8 @ =gUnk_03001410
	ldr r3, [sp, #0x10]
	lsls r4, r3, #2
	adds r4, r4, r1
	str r0, [r4]
	bl DisableMuCamera
	ldr r0, [r4]
	mov r2, sp
	adds r1, r2, r6
	bl SetMuMoveScript
.L0803CC32:
	movs r0, #1
	ldrh r3, [r5, #0xc]
	orrs r0, r3
	strh r0, [r5, #0xc]
	bl RefreshUnitSprites
	movs r0, #0xe
	ldrsb r0, [r5, r0]
	adds r3, r7, r6
	movs r1, #0
	ldrsb r1, [r3, r1]
	adds r0, r0, r1
	mov r1, r8
	str r0, [r1]
	movs r1, #0xf
	ldrsb r1, [r5, r1]
	adds r0, r6, #1
	adds r2, r7, r0
	movs r0, #0
	ldrsb r0, [r2, r0]
	adds r1, r1, r0
	mov r0, sb
	str r1, [r0]
	mov r0, sl
	ldrh r1, [r5, #0xc]
	ands r0, r1
	cmp r0, #0
	beq .L0803CC9A
	mov r1, r8
	ldr r0, [r1]
	strb r0, [r5, #0xe]
	mov r1, sb
	ldr r0, [r1]
	strb r0, [r5, #0xf]
	movs r1, #0
	ldrsb r1, [r3, r1]
	mov r3, r8
	ldr r0, [r3]
	subs r0, r0, r1
	str r0, [r3]
	movs r1, #0
	ldrsb r1, [r2, r1]
	mov r2, sb
	ldr r0, [r2]
	subs r0, r0, r1
	str r0, [r2]
	ldr r1, .L0803CCB8 @ =gUnk_03001410
	ldr r3, [sp, #0x10]
	lsls r0, r3, #2
	adds r0, r0, r1
	movs r1, #0
	str r1, [r0]
.L0803CC9A:
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0803CCAC: .4byte gUnk_Sio_0810F41B
.L0803CCB0: .4byte gUnk_Sio_0810F423
.L0803CCB4: .4byte gUnk_030013F0
.L0803CCB8: .4byte gUnk_03001410

	thumb_func_start func_fe6_0803CCBC
func_fe6_0803CCBC: @ 0x0803CCBC
	ldr r1, .L0803CCD0 @ =gUnk_030013F0
	movs r2, #0
	adds r0, r1, #0
	adds r0, #0x13
.L0803CCC4:
	strb r2, [r0]
	subs r0, #1
	cmp r0, r1
	bge .L0803CCC4
	bx lr
	.align 2, 0
.L0803CCD0: .4byte gUnk_030013F0

	thumb_func_start func_fe6_0803CCD4
func_fe6_0803CCD4: @ 0x0803CCD4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	movs r7, #0
.L0803CCE2:
	ldr r0, .L0803CD60 @ =gSioSt
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #2
	adds r0, r7, r0
	ldr r1, .L0803CD64 @ =gUnk_Sio_0810F390
	adds r0, r0, r1
	ldrb r4, [r0]
	adds r0, r4, #0
	bl func_fe6_08035CB0
	lsls r0, r0, #0x18
	adds r1, r7, #1
	mov sb, r1
	cmp r0, #0
	beq .L0803CD4A
	lsls r0, r4, #6
	adds r0, #1
	mov r8, r0
	movs r6, #0
	lsls r3, r7, #2
	ldr r0, .L0803CD68 @ =gUnk_Sio_0810F3B0
	mov sl, r0
.L0803CD14:
	adds r0, r3, r7
	adds r5, r0, r6
	ldr r0, .L0803CD6C @ =gUnk_Sio_0810F42B
	adds r0, r6, r0
	ldrb r4, [r0]
	add r4, r8
	adds r0, r4, #0
	str r3, [sp]
	bl GetUnit
	adds r2, r0, #0
	ldr r0, [r2]
	ldr r3, [sp]
	cmp r0, #0
	beq .L0803CD44
	ldr r0, .L0803CD70 @ =gUnk_030013F0
	adds r0, r5, r0
	strb r4, [r0]
	lsls r1, r5, #2
	add r1, sl
	ldrh r0, [r1]
	strb r0, [r2, #0xe]
	ldrh r0, [r1, #2]
	strb r0, [r2, #0xf]
.L0803CD44:
	adds r6, #1
	cmp r6, #4
	ble .L0803CD14
.L0803CD4A:
	mov r7, sb
	cmp r7, #3
	ble .L0803CCE2
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0803CD60: .4byte gSioSt
.L0803CD64: .4byte gUnk_Sio_0810F390
.L0803CD68: .4byte gUnk_Sio_0810F3B0
.L0803CD6C: .4byte gUnk_Sio_0810F42B
.L0803CD70: .4byte gUnk_030013F0

	thumb_func_start func_fe6_0803CD74
func_fe6_0803CD74: @ 0x0803CD74
	push {r4, lr}
	ldr r0, .L0803CDCC @ =gMapUnit
	ldr r0, [r0]
	movs r1, #0
	bl MapFill
	ldr r0, .L0803CDD0 @ =gMapFog
	ldr r0, [r0]
	movs r1, #1
	bl MapFill
	movs r4, #1
.L0803CD8C:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq .L0803CDC0
	ldr r0, [r2]
	cmp r0, #0
	beq .L0803CDC0
	movs r0, #1
	ldrh r1, [r2, #0xc]
	ands r0, r1
	cmp r0, #0
	bne .L0803CDC0
	movs r1, #0xf
	ldrsb r1, [r2, r1]
	ldr r0, .L0803CDCC @ =gMapUnit
	ldr r0, [r0]
	lsls r1, r1, #2
	adds r1, r1, r0
	ldrb r2, [r2, #0xe]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	ldr r0, [r1]
	adds r0, r0, r2
	strb r4, [r0]
.L0803CDC0:
	adds r4, #1
	cmp r4, #0xc5
	ble .L0803CD8C
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0803CDCC: .4byte gMapUnit
.L0803CDD0: .4byte gMapFog

	thumb_func_start func_fe6_0803CDD4
func_fe6_0803CDD4: @ 0x0803CDD4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	movs r2, #0
	ldr r0, .L0803CE4C @ =gUnk_Sio_0810F390
	mov sl, r0
.L0803CDE6:
	ldr r0, .L0803CE50 @ =gSioSt
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #2
	adds r0, r2, r0
	add r0, sl
	ldrb r4, [r0]
	adds r0, r4, #0
	str r2, [sp]
	bl func_fe6_08035CB0
	lsls r0, r0, #0x18
	ldr r2, [sp]
	adds r1, r2, #1
	mov sb, r1
	cmp r0, #0
	beq .L0803CE66
	lsls r0, r4, #6
	adds r0, #1
	mov r8, r0
	movs r6, #0
	lsls r3, r2, #2
	ldr r7, .L0803CE54 @ =gUnk_030013F0
.L0803CE18:
	adds r0, r3, r2
	adds r5, r0, r6
	ldr r0, .L0803CE58 @ =gUnk_Sio_0810F42B
	adds r0, r6, r0
	ldrb r4, [r0]
	add r4, r8
	adds r0, r4, #0
	str r2, [sp]
	str r3, [sp, #4]
	bl GetUnit
	adds r1, r0, #0
	ldr r0, [r1]
	ldr r2, [sp]
	ldr r3, [sp, #4]
	cmp r0, #0
	beq .L0803CE44
	movs r0, #5
	ldrh r1, [r1, #0xc]
	ands r0, r1
	cmp r0, #0
	beq .L0803CE5C
.L0803CE44:
	adds r1, r5, r7
	movs r0, #0
	strb r0, [r1]
	b .L0803CE60
	.align 2, 0
.L0803CE4C: .4byte gUnk_Sio_0810F390
.L0803CE50: .4byte gSioSt
.L0803CE54: .4byte gUnk_030013F0
.L0803CE58: .4byte gUnk_Sio_0810F42B
.L0803CE5C:
	adds r0, r5, r7
	strb r4, [r0]
.L0803CE60:
	adds r6, #1
	cmp r6, #4
	ble .L0803CE18
.L0803CE66:
	mov r2, sb
	cmp r2, #3
	ble .L0803CDE6
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start func_fe6_0803CE7C
func_fe6_0803CE7C: @ 0x0803CE7C
	push {r4, r5, lr}
	sub sp, #4
	mov r1, sp
	movs r0, #0
	strh r0, [r1]
	ldr r4, .L0803CED0 @ =gBmSt
	ldr r2, .L0803CED4 @ =0x01000020
	mov r0, sp
	adds r1, r4, #0
	bl CpuSet
	movs r0, #0x40
	movs r5, #0
	ldrb r1, [r4, #4]
	orrs r0, r1
	strb r0, [r4, #4]
	bl InitTraps
	ldr r4, .L0803CED8 @ =gPlaySt
	movs r0, #0x27
	strb r0, [r4, #0xe]
	strh r5, [r4, #0x10]
	bl GetChapterInfo
	ldrb r0, [r0, #0xc]
	strb r0, [r4, #0xd]
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl GetChapterInfo
	ldrb r0, [r0, #0x11]
	strb r0, [r4, #0x15]
	movs r0, #0x27
	bl InitMapForChapter
	bl GetGameTime
	str r0, [r4, #4]
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0803CED0: .4byte gBmSt
.L0803CED4: .4byte 0x01000020
.L0803CED8: .4byte gPlaySt

	thumb_func_start func_fe6_0803CEDC
func_fe6_0803CEDC: @ 0x0803CEDC
	push {lr}
	bl func_fe6_0803CE7C
	bl func_fe6_0803CCBC
	bl func_fe6_0803CCD4
	ldr r0, .L0803CF0C @ =gMapFog
	ldr r2, [r0]
	movs r1, #0
	ldr r0, .L0803CF10 @ =gPlaySt
	ldrb r0, [r0, #0xd]
	cmp r0, #0
	bne .L0803CEFA
	movs r1, #1
.L0803CEFA:
	adds r0, r2, #0
	bl MapFill
	bl func_fe6_0803CD74
	bl RenderMap
	pop {r0}
	bx r0
	.align 2, 0
.L0803CF0C: .4byte gMapFog
.L0803CF10: .4byte gPlaySt

	thumb_func_start func_fe6_0803CF14
func_fe6_0803CF14: @ 0x0803CF14
	push {r4, lr}
	ldr r0, .L0803CF4C @ =gSioBmSt
	movs r1, #0
	movs r2, #3
	adds r0, #0xd
.L0803CF1E:
	strb r1, [r0]
	subs r0, #1
	subs r2, #1
	cmp r2, #0
	bge .L0803CF1E
	movs r2, #0
	ldr r4, .L0803CF50 @ =gUnk_030013F0
	ldr r3, .L0803CF54 @ =0x0203C98E
.L0803CF2E:
	adds r0, r2, r4
	ldrb r0, [r0]
	cmp r0, #0
	beq .L0803CF40
	lsrs r0, r0, #6
	adds r0, r0, r3
	ldrb r1, [r0]
	adds r1, #1
	strb r1, [r0]
.L0803CF40:
	adds r2, #1
	cmp r2, #0x13
	ble .L0803CF2E
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0803CF4C: .4byte gSioBmSt
.L0803CF50: .4byte gUnk_030013F0
.L0803CF54: .4byte 0x0203C98E

	thumb_func_start func_fe6_0803CF58
func_fe6_0803CF58: @ 0x0803CF58
	push {lr}
	ldr r0, .L0803CF68 @ =gUnk_08109854
	ldr r1, .L0803CF6C @ =0x06014800
	bl Decompress
	pop {r0}
	bx r0
	.align 2, 0
.L0803CF68: .4byte gUnk_08109854
.L0803CF6C: .4byte 0x06014800

	thumb_func_start func_fe6_0803CF70
func_fe6_0803CF70: @ 0x0803CF70
	push {lr}
	movs r0, #0
	bl InitBgs
	bl ApplySystemGraphics
	bl ApplyUnitSpritePalettes
	bl ForceSyncUnitSpriteSheet
	bl func_fe6_0803CF58
	bl InitSystemTextFont
	ldr r1, .L0803CF98 @ =gSioBmSt
	movs r0, #0xff
	strb r0, [r1, #3]
	pop {r0}
	bx r0
	.align 2, 0
.L0803CF98: .4byte gSioBmSt

	thumb_func_start func_fe6_0803CF9C
func_fe6_0803CF9C: @ 0x0803CF9C
	push {r4, lr}
	ldr r4, .L0803CFE0 @ =gPlaySt
	movs r3, #4
	rsbs r3, r3, #0
	ldrb r0, [r4, #0x1e]
	ands r3, r0
	movs r2, #0x10
	ldrb r1, [r4, #0x1c]
	orrs r2, r1
	movs r0, #0x61
	rsbs r0, r0, #0
	ands r2, r0
	movs r0, #0x40
	orrs r2, r0
	movs r0, #0x7f
	ands r2, r0
	subs r0, #0x81
	ldrb r1, [r4, #0x1d]
	ands r0, r1
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #0xa
	ands r0, r1
	strb r0, [r4, #0x1d]
	ands r3, r1
	strb r3, [r4, #0x1e]
	movs r0, #1
	orrs r2, r0
	strb r2, [r4, #0x1c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0803CFE0: .4byte gPlaySt

	thumb_func_start func_fe6_0803CFE4
func_fe6_0803CFE4: @ 0x0803CFE4
	push {r4, r5, lr}
	movs r0, #0
	bl InitBgs
	bl ClearSioBG
	bl func_fe6_0803CEDC
	bl func_fe6_0803CF14
	ldr r4, .L0803D084 @ =gSioBmSt
	movs r5, #0
	strb r5, [r4, #9]
	ldr r0, .L0803D088 @ =gLinkArenaSt
	strb r5, [r0, #0xb]
	ldr r0, .L0803D08C @ =gUnk_Sio_085CA7E0
	ldrb r1, [r4]
	adds r0, r1, r0
	ldrb r0, [r0]
	bl func_fe6_0803CAD8
	movs r0, #1
	strb r0, [r4, #0xe]
	strb r5, [r4, #2]
	strb r0, [r4, #3]
	movs r1, #0
	movs r0, #3
	adds r4, #0x20
.L0803D01C:
	str r1, [r4]
	subs r4, #4
	subs r0, #1
	cmp r0, #0
	bge .L0803D01C
	movs r4, #0
	ldr r0, .L0803D090 @ =gUnk_030013F0
	ldrb r0, [r0, #3]
	bl GetUnit
	ldr r2, .L0803D094 @ =gUnk_03001404
	movs r1, #0xe
	ldrsb r1, [r0, r1]
	lsls r1, r1, #4
	strh r1, [r2]
	movs r1, #0xf
	ldrsb r1, [r0, r1]
	lsls r1, r1, #4
	strh r1, [r2, #2]
	movs r2, #0xe
	ldrsb r2, [r0, r2]
	movs r1, #0xf
	ldrsb r1, [r0, r1]
	adds r0, r2, #0
	bl SetMapCursorPosition
	ldr r0, .L0803D098 @ =gBmSt
	strh r4, [r0, #0xc]
	strh r4, [r0, #0xe]
	bl ApplySystemGraphics
	bl ApplyUnitSpritePalettes
	bl ResetUnitSprites
	bl RefreshUnitSprites
	bl func_fe6_0803CF58
	bl func_fe6_0803EA30
	ldr r0, .L0803D09C @ =ProcScr_MapTask
	movs r1, #4
	bl SpawnProc
	bl StartBmVSync
	bl func_fe6_0803CF9C
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0803D084: .4byte gSioBmSt
.L0803D088: .4byte gLinkArenaSt
.L0803D08C: .4byte gUnk_Sio_085CA7E0
.L0803D090: .4byte gUnk_030013F0
.L0803D094: .4byte gUnk_03001404
.L0803D098: .4byte gBmSt
.L0803D09C: .4byte ProcScr_MapTask

	thumb_func_start func_fe6_0803D0A0
func_fe6_0803D0A0: @ 0x0803D0A0
	push {r4, r5, lr}
	ldr r0, .L0803D0E0 @ =gUnk_030013F0
	ldr r1, .L0803D0E4 @ =gSioBmSt
	ldrb r1, [r1, #4]
	adds r0, r1, r0
	ldrb r0, [r0]
	bl GetUnit
	adds r4, r0, #0
	bl StartMu
	ldr r5, .L0803D0E8 @ =gUnk_03001410
	str r0, [r5]
	movs r1, #0xe
	ldrsb r1, [r4, r1]
	lsls r1, r1, #4
	movs r2, #0xf
	ldrsb r2, [r4, r2]
	subs r2, #1
	lsls r2, r2, #4
	bl SetMuScreenPosition
	ldr r0, [r5]
	bl DisableMuCamera
	ldr r0, [r5]
	movs r1, #3
	bl SetMuFacing
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0803D0E0: .4byte gUnk_030013F0
.L0803D0E4: .4byte gSioBmSt
.L0803D0E8: .4byte gUnk_03001410

	thumb_func_start func_fe6_0803D0EC
func_fe6_0803D0EC: @ 0x0803D0EC
	push {lr}
	adds r2, r0, #0
	ldr r0, .L0803D10C @ =gKeySt
	ldr r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #2
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq .L0803D106
	adds r0, r2, #0
	bl Proc_Break
.L0803D106:
	pop {r0}
	bx r0
	.align 2, 0
.L0803D10C: .4byte gKeySt

	thumb_func_start func_fe6_0803D110
func_fe6_0803D110: @ 0x0803D110
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, .L0803D124 @ =gLinkArenaSt
	ldrb r0, [r0]
	cmp r0, #1
	beq .L0803D128
	cmp r0, #2
	beq .L0803D13C
	b .L0803D168
	.align 2, 0
.L0803D124: .4byte gLinkArenaSt
.L0803D128:
	ldr r0, .L0803D134 @ =gPlaySt
	ldrb r0, [r0, #0xf]
	cmp r0, #0
	beq .L0803D14A
	ldr r0, .L0803D138 @ =gUnk_Sio_085CAC14
	b .L0803D14C
	.align 2, 0
.L0803D134: .4byte gPlaySt
.L0803D138: .4byte gUnk_Sio_085CAC14
.L0803D13C:
	ldr r0, .L0803D154 @ =gPlaySt
	ldr r1, .L0803D158 @ =gSioSt
	ldr r1, [r1]
	ldrb r0, [r0, #0xf]
	ldrb r1, [r1, #6]
	cmp r0, r1
	bne .L0803D160
.L0803D14A:
	ldr r0, .L0803D15C @ =gUnk_Sio_085CA974
.L0803D14C:
	adds r1, r4, #0
	bl SpawnProcLocking
	b .L0803D168
	.align 2, 0
.L0803D154: .4byte gPlaySt
.L0803D158: .4byte gSioSt
.L0803D15C: .4byte gUnk_Sio_085CA974
.L0803D160:
	ldr r0, .L0803D174 @ =gUnk_Sio_085CAB24
	adds r1, r4, #0
	bl SpawnProcLocking
.L0803D168:
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0803D174: .4byte gUnk_Sio_085CAB24

	thumb_func_start func_fe6_0803D178
func_fe6_0803D178: @ 0x0803D178
	push {r4, lr}
	adds r3, r0, #0
	movs r1, #0
	ldr r0, .L0803D190 @ =gLinkArenaSt
	ldrb r2, [r0]
	cmp r2, #1
	bne .L0803D194
	ldrb r0, [r0, #0xb]
	cmp r0, #1
	bne .L0803D1A4
	b .L0803D19A
	.align 2, 0
.L0803D190: .4byte gLinkArenaSt
.L0803D194:
	ldrb r0, [r0, #0xb]
	cmp r0, #2
	bne .L0803D1A4
.L0803D19A:
	adds r0, r3, #0
	movs r1, #3
	bl Proc_Goto
	b .L0803D1FE
.L0803D1A4:
	ldr r0, .L0803D1B8 @ =gSioBmSt
	ldrb r2, [r0, #1]
	adds r0, r2, #0
	cmp r0, #0xff
	bne .L0803D1BC
	adds r0, r3, #0
	movs r1, #2
	bl Proc_Goto
	b .L0803D1FE
	.align 2, 0
.L0803D1B8: .4byte gSioBmSt
.L0803D1BC:
	ldr r0, .L0803D1C4 @ =gPlaySt
	strb r2, [r0, #0xf]
	ldr r2, .L0803D1C8 @ =gUnk_030013F0
	b .L0803D1CE
	.align 2, 0
.L0803D1C4: .4byte gPlaySt
.L0803D1C8: .4byte gUnk_030013F0
.L0803D1CC:
	adds r1, #1
.L0803D1CE:
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, #0
	beq .L0803D1CC
	ldr r4, .L0803D204 @ =gSioBmSt
	strb r1, [r4, #2]
	adds r0, r1, #1
	strb r0, [r4, #3]
	bl ApplySystemObjectsGraphics
	movs r0, #0
	adds r4, #0x2c
	movs r1, #3
.L0803D1E8:
	str r0, [r4, #4]
	strb r0, [r4]
	adds r4, #8
	subs r1, #1
	cmp r1, #0
	bge .L0803D1E8
	movs r0, #1
	rsbs r0, r0, #0
	movs r1, #9
	bl DebugInitObj
.L0803D1FE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0803D204: .4byte gSioBmSt

	thumb_func_start func_fe6_0803D208
func_fe6_0803D208: @ 0x0803D208
	push {r4, r5, r6, r7, lr}
	movs r5, #4
	ldr r3, .L0803D260 @ =gSioBmSt
	ldr r0, .L0803D264 @ =gSioSt
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #2
	adds r2, r3, #0
	adds r2, #0x14
	adds r0, r0, r2
	ldr r7, [r0]
	ldr r1, .L0803D268 @ =gLinkArenaSt
	adds r1, #0xec
	movs r0, #2
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq .L0803D270
	movs r4, #0
	adds r5, r3, #0
	adds r5, #0xf
.L0803D236:
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	bl func_fe6_08035CB0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L0803D254
	ldr r0, .L0803D264 @ =gSioSt
	ldr r0, [r0]
	movs r1, #6
	ldrsb r1, [r0, r1]
	adds r0, r4, r5
	ldrb r0, [r0]
	cmp r1, r0
	beq .L0803D26C
.L0803D254:
	adds r4, #1
	cmp r4, #3
	ble .L0803D236
	movs r5, #3
	b .L0803D2A0
	.align 2, 0
.L0803D260: .4byte gSioBmSt
.L0803D264: .4byte gSioSt
.L0803D268: .4byte gLinkArenaSt
.L0803D26C:
	adds r0, r4, #0
	b .L0803D2A2
.L0803D270:
	movs r4, #0
	adds r6, r2, #0
.L0803D274:
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	bl func_fe6_08035CB0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L0803D296
	ldr r0, .L0803D2A8 @ =gSioSt
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, r4
	beq .L0803D296
	ldr r0, [r6]
	cmp r7, r0
	bls .L0803D298
.L0803D296:
	subs r5, #1
.L0803D298:
	adds r6, #4
	adds r4, #1
	cmp r4, #3
	ble .L0803D274
.L0803D2A0:
	adds r0, r5, #0
.L0803D2A2:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
.L0803D2A8: .4byte gSioSt

	thumb_func_start func_fe6_0803D2AC
func_fe6_0803D2AC: @ 0x0803D2AC
	push {lr}
	ldr r0, .L0803D2C8 @ =ProcScr_MapTask
	bl Proc_EndEach
	bl func_fe6_0803EA44
	bl EndBmVSync
	movs r0, #1
	bl FadeBgmOut
	pop {r0}
	bx r0
	.align 2, 0
.L0803D2C8: .4byte ProcScr_MapTask

	thumb_func_start func_fe6_0803D2CC
func_fe6_0803D2CC: @ 0x0803D2CC
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov ip, r1
	ldr r1, .L0803D2FC @ =gSioBmSt
	ldrb r2, [r1, #2]
	adds r5, r2, #0
	strb r2, [r1, #3]
	movs r0, #0xf0
	ands r0, r3
	adds r7, r1, #0
	cmp r0, #0
	beq .L0803D3BA
	lsls r4, r2, #2
	movs r0, #0x40
	ands r0, r3
	cmp r0, #0
	beq .L0803D304
	ldr r0, .L0803D300 @ =gUnk_Sio_085CA7E4
	adds r0, r4, r0
	b .L0803D33A
	.align 2, 0
.L0803D2FC: .4byte gSioBmSt
.L0803D300: .4byte gUnk_Sio_085CA7E4
.L0803D304:
	movs r0, #0x80
	ands r0, r3
	cmp r0, #0
	beq .L0803D318
	ldr r1, .L0803D314 @ =gUnk_Sio_085CA7E4
	adds r0, r4, #1
	b .L0803D338
	.align 2, 0
.L0803D314: .4byte gUnk_Sio_085CA7E4
.L0803D318:
	movs r0, #0x20
	ands r0, r3
	cmp r0, #0
	beq .L0803D32C
	ldr r1, .L0803D328 @ =gUnk_Sio_085CA7E4
	adds r0, r4, #2
	b .L0803D338
	.align 2, 0
.L0803D328: .4byte gUnk_Sio_085CA7E4
.L0803D32C:
	movs r0, #0x10
	ands r0, r3
	cmp r0, #0
	beq .L0803D33C
	ldr r1, .L0803D398 @ =gUnk_Sio_085CA7E4
	adds r0, r4, #3
.L0803D338:
	adds r0, r0, r1
.L0803D33A:
	ldrb r2, [r0]
.L0803D33C:
	subs r5, r2, r5
	ldrb r0, [r7, #3]
	cmp r0, #0
	bne .L0803D350
	movs r0, #0x20
	ands r0, r3
	cmp r0, #0
	beq .L0803D350
	movs r5, #1
	rsbs r5, r5, #0
.L0803D350:
	ldrb r0, [r7, #3]
	cmp r0, #0x13
	bne .L0803D360
	movs r0, #0x80
	ands r0, r3
	cmp r0, #0
	beq .L0803D360
	movs r5, #1
.L0803D360:
	ldr r6, .L0803D39C @ =gUnk_030013F0
	mov r0, ip
	lsls r4, r0, #0x18
.L0803D366:
	adds r0, r2, r6
	ldrb r0, [r0]
	lsls r1, r0, #0x18
	cmp r1, #0
	beq .L0803D384
	cmp r4, #0
	beq .L0803D3B8
	lsrs r1, r1, #0x1e
	ldr r0, .L0803D3A0 @ =gSioSt
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r1, r0
	bne .L0803D3B8
.L0803D384:
	cmp r5, #0
	bge .L0803D3A4
	subs r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0xff
	bne .L0803D366
	movs r2, #0x13
	b .L0803D366
	.align 2, 0
.L0803D398: .4byte gUnk_Sio_085CA7E4
.L0803D39C: .4byte gUnk_030013F0
.L0803D3A0: .4byte gSioSt
.L0803D3A4:
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	adds r0, r2, #0
	movs r1, #0x14
	bl __umodsi3
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	b .L0803D366
.L0803D3B8:
	strb r2, [r7, #2]
.L0803D3BA:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start func_fe6_0803D3C0
func_fe6_0803D3C0: @ 0x0803D3C0
	push {r4, r5, r6, r7, lr}
	ldr r6, .L0803D42C @ =gSioBmSt
	ldrb r0, [r6, #2]
	ldrb r1, [r6, #3]
	cmp r0, r1
	beq .L0803D426
	ldr r7, .L0803D430 @ =gUnk_030013F0
	adds r0, r1, r7
	ldrb r0, [r0]
	bl GetUnit
	adds r5, r0, #0
	ldrb r1, [r6, #2]
	adds r0, r1, r7
	ldrb r0, [r0]
	bl GetUnit
	adds r4, r0, #0
	cmp r5, #0
	beq .L0803D3F2
	bl EndAllMus
	adds r0, r5, #0
	bl ShowUnitSprite
.L0803D3F2:
	cmp r4, #0
	beq .L0803D426
	movs r0, #2
	ldrh r1, [r4, #0xc]
	ands r0, r1
	cmp r0, #0
	bne .L0803D426
	ldrb r6, [r6, #2]
	adds r0, r6, r7
	ldrb r0, [r0]
	lsrs r1, r0, #6
	ldr r0, .L0803D434 @ =gSioSt
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r1, r0
	bne .L0803D426
	adds r0, r4, #0
	bl StartMu
	bl DisableMuCamera
	adds r0, r4, #0
	bl HideUnitSprite
.L0803D426:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0803D42C: .4byte gSioBmSt
.L0803D430: .4byte gUnk_030013F0
.L0803D434: .4byte gSioSt

	thumb_func_start func_fe6_0803D438
func_fe6_0803D438: @ 0x0803D438
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	movs r5, #0
.L0803D43E:
	lsls r1, r5, #1
	adds r0, r6, #0
	adds r0, #0x1c
	adds r0, r0, r1
	ldrh r4, [r0]
	adds r0, r4, #0
	bl GetItemAttributes
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	beq .L0803D46A
	adds r0, r6, #0
	adds r1, r4, #0
	bl CanUnitUseWeapon
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne .L0803D46A
	movs r0, #1
	b .L0803D472
.L0803D46A:
	adds r5, #1
	cmp r5, #4
	ble .L0803D43E
	movs r0, #0
.L0803D472:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start func_fe6_0803D478
func_fe6_0803D478: @ 0x0803D478
	push {r4, lr}
	adds r4, r0, #0
	ldr r2, .L0803D4AC @ =gSioBmSt
	ldr r1, .L0803D4B0 @ =gLinkArenaSt
	adds r1, #0xa0
	ldrb r3, [r1]
	lsls r0, r3, #1
	adds r0, r0, r3
	ldrb r2, [r2, #9]
	cmp r2, r0
	blt .L0803D4A0
	bl EndLinkArenaPointsBox
	ldr r0, .L0803D4B4 @ =gUnk_Sio_085CA958
	bl StartEvent
	adds r0, r4, #0
	movs r1, #3
	bl Proc_Goto
.L0803D4A0:
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0803D4AC: .4byte gSioBmSt
.L0803D4B0: .4byte gLinkArenaSt
.L0803D4B4: .4byte gUnk_Sio_085CA958

	thumb_func_start func_fe6_0803D4B8
func_fe6_0803D4B8: @ 0x0803D4B8
	push {r4, lr}
	adds r4, r0, #0
	bl func_fe6_08035D4C
	cmp r0, #7
	bgt .L0803D4CA
	adds r0, r4, #0
	bl Proc_Break
.L0803D4CA:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start func_fe6_0803D4D0
func_fe6_0803D4D0: @ 0x0803D4D0
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, .L0803D5B0 @ =gUnk_Sio_0810F430
	mov r0, sp
	movs r2, #2
	bl memcpy
	ldr r0, .L0803D5B4 @ =gSioBmSt
	mov r8, r0
	ldrb r1, [r0, #2]
	mov sb, r1
	bl func_fe6_0803D3C0
	ldr r4, .L0803D5B8 @ =gKeySt
	ldr r0, [r4]
	ldrh r0, [r0, #6]
	movs r1, #0
	bl func_fe6_0803D2CC
	ldr r7, .L0803D5BC @ =gActiveUnitId
	ldr r0, .L0803D5C0 @ =gUnk_030013F0
	mov r2, r8
	ldrb r2, [r2, #2]
	adds r0, r2, r0
	ldrb r0, [r0]
	strb r0, [r7]
	ldrb r0, [r7]
	bl GetUnit
	adds r2, r0, #0
	ldr r6, .L0803D5C4 @ =gActiveUnit
	str r2, [r6]
	ldr r1, [r4]
	movs r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq .L0803D5E4
	ldrb r0, [r7]
	lsrs r1, r0, #6
	ldr r0, .L0803D5C8 @ =gSioSt
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r1, r0
	bne .L0803D5D4
	adds r0, r2, #0
	bl func_fe6_0803D438
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne .L0803D5D4
	ldr r0, .L0803D5CC @ =gPlaySt
	ldrb r0, [r0, #0x1d]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L0803D554
	movs r0, #0x69
	bl m4aSongNumStart
.L0803D554:
	bl EndAllMus
	ldr r0, [r6]
	bl StartMu
	ldr r4, .L0803D5D0 @ =gUnk_03001410
	str r0, [r4]
	bl DisableMuCamera
	ldr r0, [r4]
	mov r1, sp
	bl SetMuMoveScript
	ldr r1, [r6]
	movs r0, #0xe
	ldrsb r0, [r1, r0]
	str r0, [r5, #0x2c]
	movs r0, #0xf
	ldrsb r0, [r1, r0]
	subs r0, #1
	str r0, [r5, #0x30]
	movs r0, #1
	ldrh r2, [r1, #0xc]
	orrs r0, r2
	strh r0, [r1, #0xc]
	bl func_fe6_0803CAC8
	mov r1, r8
	ldrb r0, [r1, #2]
	strb r0, [r1, #4]
	movs r0, #0x40
	movs r1, #1
	bl func_fe6_0803D2CC
	ldrb r1, [r7]
	movs r0, #1
	movs r2, #0
	movs r3, #0
	bl func_fe6_0803CB3C
	adds r0, r5, #0
	movs r1, #5
	bl Proc_Goto
	b .L0803D6BC
	.align 2, 0
.L0803D5B0: .4byte gUnk_Sio_0810F430
.L0803D5B4: .4byte gSioBmSt
.L0803D5B8: .4byte gKeySt
.L0803D5BC: .4byte gActiveUnitId
.L0803D5C0: .4byte gUnk_030013F0
.L0803D5C4: .4byte gActiveUnit
.L0803D5C8: .4byte gSioSt
.L0803D5CC: .4byte gPlaySt
.L0803D5D0: .4byte gUnk_03001410
.L0803D5D4:
	ldr r0, .L0803D614 @ =gPlaySt
	ldrb r0, [r0, #0x1d]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L0803D5E4
	movs r0, #0x6c
	bl m4aSongNumStart
.L0803D5E4:
	ldr r2, .L0803D618 @ =gKeySt
	ldr r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq .L0803D620
	ldr r0, .L0803D61C @ =gActiveUnit
	ldr r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #2
	ldrh r1, [r1, #0xc]
	ands r0, r1
	cmp r0, #0
	bne .L0803D620
	bl EndAllMus
	adds r0, r5, #0
	movs r1, #4
	bl Proc_Goto
	b .L0803D6BC
	.align 2, 0
.L0803D614: .4byte gPlaySt
.L0803D618: .4byte gKeySt
.L0803D61C: .4byte gActiveUnit
.L0803D620:
	ldr r1, [r2]
	movs r0, #8
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq .L0803D658
	bl EndLinkArenaPointsBox
	ldr r0, .L0803D650 @ =gPlaySt
	ldrb r0, [r0, #0x1d]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L0803D646
	movs r0, #0x68
	bl m4aSongNumStart
	ldr r0, .L0803D654 @ =gUnk_Sio_085CA93C
	bl StartEvent
.L0803D646:
	adds r0, r5, #0
	movs r1, #2
	bl Proc_Goto
	b .L0803D6BC
	.align 2, 0
.L0803D650: .4byte gPlaySt
.L0803D654: .4byte gUnk_Sio_085CA93C
.L0803D658:
	ldr r0, .L0803D6CC @ =gActiveUnit
	ldr r1, [r0]
	movs r0, #0xe
	ldrsb r0, [r1, r0]
	lsls r5, r0, #4
	ldrb r1, [r1, #0xf]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	lsls r4, r1, #4
	bl SetMapCursorPosition
	bl GetGameTime
	subs r0, #1
	ldr r6, .L0803D6D0 @ =gUnk_03001408
	ldr r1, [r6]
	cmp r0, r1
	bne .L0803D68E
	ldr r0, .L0803D6D4 @ =gUnk_03001404
	movs r2, #0
	ldrsh r1, [r0, r2]
	adds r1, r5, r1
	asrs r5, r1, #1
	movs r1, #2
	ldrsh r0, [r0, r1]
	adds r0, r4, r0
	asrs r4, r0, #1
.L0803D68E:
	ldr r0, .L0803D6D4 @ =gUnk_03001404
	strh r5, [r0]
	strh r4, [r0, #2]
	bl GetGameTime
	str r0, [r6]
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #0
	bl PutMapCursor
	ldr r0, .L0803D6D8 @ =gSioBmSt
	ldrb r0, [r0, #2]
	cmp sb, r0
	beq .L0803D6BC
	ldr r0, .L0803D6DC @ =gPlaySt
	ldrb r0, [r0, #0x1d]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L0803D6BC
	movs r0, #0x65
	bl m4aSongNumStart
.L0803D6BC:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0803D6CC: .4byte gActiveUnit
.L0803D6D0: .4byte gUnk_03001408
.L0803D6D4: .4byte gUnk_03001404
.L0803D6D8: .4byte gSioBmSt
.L0803D6DC: .4byte gPlaySt

	thumb_func_start func_fe6_0803D6E0
func_fe6_0803D6E0: @ 0x0803D6E0
	push {lr}
	bl StartLinkArenaPointsBox
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_fe6_0803D6EC
func_fe6_0803D6EC: @ 0x0803D6EC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	mov r8, r0
	ldr r6, .L0803D7C4 @ =gSioBmSt
	ldrb r0, [r6, #2]
	str r0, [sp, #4]
	ldr r1, .L0803D7C8 @ =gKeySt
	ldr r0, [r1]
	ldrh r0, [r0, #6]
	movs r1, #1
	bl func_fe6_0803D2CC
	ldr r2, .L0803D7CC @ =gActiveUnitId
	mov sl, r2
	ldr r0, .L0803D7D0 @ =gUnk_030013F0
	mov sb, r0
	ldrb r0, [r6, #2]
	add r0, sb
	ldrb r0, [r0]
	strb r0, [r2]
	ldrb r0, [r2]
	bl GetUnit
	ldr r1, .L0803D7D4 @ =gActiveUnit
	str r0, [r1]
	movs r2, #0xe
	ldrsb r2, [r0, r2]
	lsls r5, r2, #4
	movs r1, #0xf
	ldrsb r1, [r0, r1]
	lsls r4, r1, #4
	adds r0, r2, #0
	bl SetMapCursorPosition
	bl GetGameTime
	subs r0, #1
	ldr r7, .L0803D7D8 @ =gUnk_03001408
	ldr r1, [r7]
	cmp r0, r1
	bne .L0803D758
	ldr r0, .L0803D7DC @ =gUnk_03001404
	movs r2, #0
	ldrsh r1, [r0, r2]
	adds r1, r5, r1
	asrs r5, r1, #1
	movs r1, #2
	ldrsh r0, [r0, r1]
	adds r0, r4, r0
	asrs r4, r0, #1
.L0803D758:
	ldr r0, .L0803D7DC @ =gUnk_03001404
	strh r5, [r0]
	strh r4, [r0, #2]
	bl GetGameTime
	str r0, [r7]
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #0
	bl PutMapCursor
	ldr r2, .L0803D7C8 @ =gKeySt
	ldr r0, [r2]
	ldrh r1, [r0, #8]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq .L0803D7E4
	ldr r0, .L0803D7E0 @ =gPlaySt
	ldrb r0, [r0, #0x1d]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L0803D78C
	movs r0, #0x69
	bl m4aSongNumStart
.L0803D78C:
	ldrb r0, [r6, #2]
	add r0, sb
	ldrb r0, [r0]
	adds r2, r6, #5
	mov r3, r8
	adds r3, #0x34
	mov r1, r8
	adds r1, #0x38
	str r1, [sp]
	movs r1, #1
	bl func_fe6_0803CBB4
	ldrb r0, [r6, #5]
	add r0, sb
	ldrb r1, [r0]
	mov r0, sl
	ldrb r2, [r0]
	movs r0, #3
	movs r3, #0
	bl func_fe6_0803CB3C
	bl EndLinkArenaPointsBox
	mov r0, r8
	movs r1, #7
	bl Proc_Goto
	b .L0803D892
	.align 2, 0
.L0803D7C4: .4byte gSioBmSt
.L0803D7C8: .4byte gKeySt
.L0803D7CC: .4byte gActiveUnitId
.L0803D7D0: .4byte gUnk_030013F0
.L0803D7D4: .4byte gActiveUnit
.L0803D7D8: .4byte gUnk_03001408
.L0803D7DC: .4byte gUnk_03001404
.L0803D7E0: .4byte gPlaySt
.L0803D7E4:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq .L0803D84C
	ldr r0, .L0803D840 @ =gPlaySt
	ldrb r0, [r0, #0x1d]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L0803D7FC
	movs r0, #0x6b
	bl m4aSongNumStart
.L0803D7FC:
	ldr r0, .L0803D844 @ =gUnk_03001410
	ldr r0, [r0]
	bl EndMu
	ldrb r0, [r6, #4]
	add r0, sb
	ldrb r0, [r0]
	bl GetUnit
	ldr r1, .L0803D848 @ =0x0000FFFE
	ldrh r2, [r0, #0xc]
	ands r1, r2
	strh r1, [r0, #0xc]
	bl func_fe6_0803CAC8
	ldrb r0, [r6, #4]
	strb r0, [r6, #2]
	adds r0, #1
	strb r0, [r6, #3]
	mov r0, sl
	ldrb r1, [r0]
	ldrb r0, [r6, #4]
	add r0, sb
	ldrb r2, [r0]
	movs r0, #2
	movs r3, #0
	bl func_fe6_0803CB3C
	mov r0, r8
	movs r1, #1
	bl Proc_Goto
	b .L0803D892
	.align 2, 0
.L0803D840: .4byte gPlaySt
.L0803D844: .4byte gUnk_03001410
.L0803D848: .4byte 0x0000FFFE
.L0803D84C:
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq .L0803D878
	ldr r2, .L0803D874 @ =gActiveUnit
	ldr r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #2
	ldrh r1, [r1, #0xc]
	ands r0, r1
	cmp r0, #0
	bne .L0803D878
	bl EndAllMus
	mov r0, r8
	movs r1, #6
	bl Proc_Goto
	b .L0803D892
	.align 2, 0
.L0803D874: .4byte gActiveUnit
.L0803D878:
	ldr r0, .L0803D8A4 @ =gSioBmSt
	ldr r1, [sp, #4]
	ldrb r0, [r0, #2]
	cmp r1, r0
	beq .L0803D892
	ldr r0, .L0803D8A8 @ =gPlaySt
	ldrb r0, [r0, #0x1d]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L0803D892
	movs r0, #0x65
	bl m4aSongNumStart
.L0803D892:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0803D8A4: .4byte gSioBmSt
.L0803D8A8: .4byte gPlaySt

	thumb_func_start func_fe6_0803D8AC
func_fe6_0803D8AC: @ 0x0803D8AC
	push {r4, lr}
	adds r4, r0, #0
	bl ResetTextFont
	ldr r1, .L0803D8EC @ =gSioBmSt
	movs r0, #0xff
	strb r0, [r1, #6]
	ldr r0, .L0803D8F0 @ =gUnk_030013F0
	ldrb r1, [r1, #4]
	adds r0, r1, r0
	ldrb r0, [r0]
	bl GetUnit
	ldr r1, .L0803D8F4 @ =gActiveUnit
	str r0, [r1]
	bl func_fe6_0803CA90
	bl GetGameLock
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r4, #0x64
	strh r0, [r4]
	movs r0, #4
	bl ApplyIconPalettes
	ldr r0, .L0803D8F8 @ =gUnk_Sio_085CB384
	bl StartMenu
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0803D8EC: .4byte gSioBmSt
.L0803D8F0: .4byte gUnk_030013F0
.L0803D8F4: .4byte gActiveUnit
.L0803D8F8: .4byte gUnk_Sio_085CB384

	thumb_func_start func_fe6_0803D8FC
func_fe6_0803D8FC: @ 0x0803D8FC
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r0, #0x64
	movs r1, #0
	ldrsh r4, [r0, r1]
	bl GetGameLock
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r4, r0
	bne .L0803D92E
	ldr r0, .L0803D934 @ =gSioBmSt
	ldrb r0, [r0, #6]
	cmp r0, #0
	bne .L0803D928
	ldr r0, .L0803D938 @ =gActiveUnit
	ldr r0, [r0]
	bl func_fe6_0803CAAC
	adds r0, r5, #0
	bl Proc_End
.L0803D928:
	adds r0, r5, #0
	bl Proc_Break
.L0803D92E:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0803D934: .4byte gSioBmSt
.L0803D938: .4byte gActiveUnit

	thumb_func_start func_fe6_0803D93C
func_fe6_0803D93C: @ 0x0803D93C
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r0, .L0803D974 @ =gActiveUnit
	ldr r0, [r0]
	ldr r6, .L0803D978 @ =gSioBmSt
	ldrb r2, [r6, #7]
	lsls r1, r2, #1
	adds r0, #0x1c
	adds r0, r0, r1
	ldrh r5, [r0]
	bl GetGameLock
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r4, #0x64
	strh r0, [r4]
	adds r0, r5, #0
	bl GetItemMinRange
	cmp r0, #1
	bne .L0803D97C
	adds r0, r5, #0
	bl GetItemMaxRange
	cmp r0, #1
	bne .L0803D97C
	strb r0, [r6, #6]
	b .L0803D9FE
	.align 2, 0
.L0803D974: .4byte gActiveUnit
.L0803D978: .4byte gSioBmSt
.L0803D97C:
	adds r0, r5, #0
	bl GetItemMinRange
	cmp r0, #2
	bne .L0803D99C
	adds r0, r5, #0
	bl GetItemMaxRange
	adds r1, r0, #0
	cmp r1, #2
	bne .L0803D99C
	ldr r0, .L0803D998 @ =gSioBmSt
	strb r1, [r0, #6]
	b .L0803D9FE
	.align 2, 0
.L0803D998: .4byte gSioBmSt
.L0803D99C:
	adds r0, r5, #0
	bl GetItemMinRange
	adds r4, r0, #0
	cmp r4, #2
	bne .L0803D9BC
	adds r0, r5, #0
	bl GetItemMaxRange
	cmp r0, #3
	bne .L0803D9BC
	ldr r0, .L0803D9B8 @ =gSioBmSt
	strb r4, [r0, #6]
	b .L0803D9FE
	.align 2, 0
.L0803D9B8: .4byte gSioBmSt
.L0803D9BC:
	ldr r0, .L0803D9DC @ =gUnk_030013F0
	ldr r4, .L0803D9E0 @ =gSioBmSt
	ldrb r1, [r4, #5]
	adds r0, r1, r0
	ldrb r0, [r0]
	bl GetUnit
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0
	bne .L0803D9E4
	movs r0, #1
	strb r0, [r4, #6]
	b .L0803D9FE
	.align 2, 0
.L0803D9DC: .4byte gUnk_030013F0
.L0803D9E0: .4byte gSioBmSt
.L0803D9E4:
	adds r0, r5, #0
	bl GetItemMinRange
	cmp r0, #1
	ble .L0803D9F4
	movs r0, #2
	strb r0, [r4, #6]
	b .L0803D9FE
.L0803D9F4:
	movs r0, #1
	strb r0, [r4, #6]
	movs r0, #4
	bl ApplyIconPalettes
.L0803D9FE:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start func_fe6_0803DA04
func_fe6_0803DA04: @ 0x0803DA04
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r6, r0, #0
	movs r0, #0
	mov sl, r0
	ldr r4, .L0803DA60 @ =gUnk_030013F0
	ldr r7, .L0803DA64 @ =gSioBmSt
	ldrb r1, [r7, #4]
	adds r0, r1, r4
	ldrb r0, [r0]
	bl GetUnit
	mov sb, r0
	ldrb r0, [r7, #5]
	adds r4, r0, r4
	ldrb r0, [r4]
	bl GetUnit
	adds r5, r0, #0
	adds r0, r6, #0
	adds r0, #0x64
	movs r1, #0
	ldrsh r4, [r0, r1]
	bl GetGameLock
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r4, r0
	bne .L0803DAD8
	ldrb r0, [r7, #6]
	cmp r0, #0
	bne .L0803DA6C
	ldr r0, .L0803DA68 @ =gActiveUnit
	ldr r0, [r0]
	bl func_fe6_0803CAAC
	adds r0, r6, #0
	movs r1, #0
	bl Proc_Goto
	b .L0803DAD8
	.align 2, 0
.L0803DA60: .4byte gUnk_030013F0
.L0803DA64: .4byte gSioBmSt
.L0803DA68: .4byte gActiveUnit
.L0803DA6C:
	ldr r0, .L0803DAC4 @ =gActiveUnit
	mov r8, r0
	ldr r0, [r0]
	ldrb r1, [r7, #7]
	bl UnitEquipItemSlot
	movs r0, #0x80
	lsls r0, r0, #2
	ldrh r1, [r5, #0xc]
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0
	bne .L0803DAC8
	adds r0, r6, #0
	bl StartBattlePreview
	ldrb r7, [r7, #6]
	cmp r7, #2
	bne .L0803DA98
	movs r0, #1
	mov sl, r0
.L0803DA98:
	movs r2, #0xe
	ldrsb r2, [r5, r2]
	add r2, sl
	movs r3, #0xf
	ldrsb r3, [r5, r3]
	adds r3, #1
	str r4, [sp]
	mov r0, sb
	adds r1, r5, #0
	bl BattleGenerateSimulation
	bl UpdateBattlePreviewContents
	mov r1, r8
	ldr r0, [r1]
	bl func_fe6_0803CAAC
	adds r0, r6, #0
	bl Proc_Break
	b .L0803DAD8
	.align 2, 0
.L0803DAC4: .4byte gActiveUnit
.L0803DAC8:
	mov r1, r8
	ldr r0, [r1]
	bl func_fe6_0803CAAC
	adds r0, r6, #0
	movs r1, #1
	bl Proc_Goto
.L0803DAD8:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start func_fe6_0803DAE8
func_fe6_0803DAE8: @ 0x0803DAE8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, .L0803DB18 @ =gKeySt
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq .L0803DB20
	ldr r0, .L0803DB1C @ =gPlaySt
	ldrb r0, [r0, #0x1d]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L0803DB0A
	movs r0, #0x6a
	bl m4aSongNumStart
.L0803DB0A:
	bl CloseBattlePreview
	adds r0, r4, #0
	bl Proc_Break
	b .L0803DB44
	.align 2, 0
.L0803DB18: .4byte gKeySt
.L0803DB1C: .4byte gPlaySt
.L0803DB20:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq .L0803DB44
	ldr r0, .L0803DB4C @ =gPlaySt
	ldrb r0, [r0, #0x1d]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L0803DB38
	movs r0, #0x6b
	bl m4aSongNumStart
.L0803DB38:
	bl CloseBattlePreview
	adds r0, r4, #0
	movs r1, #0
	bl Proc_Goto
.L0803DB44:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0803DB4C: .4byte gPlaySt

	thumb_func_start func_fe6_0803DB50
func_fe6_0803DB50: @ 0x0803DB50
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, .L0803DB68 @ =gUnk_Sio_085CA834
	adds r1, r4, #0
	bl SpawnProcLocking
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0803DB68: .4byte gUnk_Sio_085CA834

	thumb_func_start func_fe6_0803DB6C
func_fe6_0803DB6C: @ 0x0803DB6C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, .L0803DBA0 @ =gUnk_030013F0
	ldr r6, .L0803DBA4 @ =gSioBmSt
	ldrb r1, [r6, #5]
	adds r0, r1, r0
	ldrb r0, [r0]
	bl GetUnit
	adds r4, r0, #0
	bl ClearUi
	ldrb r0, [r6, #6]
	cmp r0, #0
	bne .L0803DBF8
	movs r0, #0x80
	lsls r0, r0, #2
	ldrh r1, [r4, #0xc]
	ands r0, r1
	cmp r0, #0
	bne .L0803DBAC
	ldr r0, .L0803DBA8 @ =gUnk_03001410
	ldr r0, [r0, #4]
	bl EndMu
	b .L0803DBB4
	.align 2, 0
.L0803DBA0: .4byte gUnk_030013F0
.L0803DBA4: .4byte gSioBmSt
.L0803DBA8: .4byte gUnk_03001410
.L0803DBAC:
	ldr r0, [r5, #0x34]
	strb r0, [r4, #0xe]
	ldr r0, [r5, #0x38]
	strb r0, [r4, #0xf]
.L0803DBB4:
	ldr r0, .L0803DBEC @ =0x0000FFFE
	ldrh r1, [r4, #0xc]
	ands r0, r1
	strh r0, [r4, #0xc]
	bl RefreshUnitSprites
	ldr r1, .L0803DBF0 @ =gSioBmSt
	ldrb r0, [r1, #5]
	strb r0, [r1, #2]
	adds r0, #1
	strb r0, [r1, #3]
	ldr r0, .L0803DBF4 @ =gUnk_030013F0
	ldrb r1, [r1, #5]
	adds r0, r1, r0
	ldrb r2, [r0]
	movs r0, #4
	movs r1, #0
	movs r3, #0
	bl func_fe6_0803CB3C
	adds r0, r5, #0
	bl func_fe6_0803D6E0
	adds r0, r5, #0
	movs r1, #5
	bl Proc_Goto
	b .L0803DC2E
	.align 2, 0
.L0803DBEC: .4byte 0x0000FFFE
.L0803DBF0: .4byte gSioBmSt
.L0803DBF4: .4byte gUnk_030013F0
.L0803DBF8:
	movs r0, #0x80
	lsls r0, r0, #2
	ldrh r1, [r4, #0xc]
	ands r0, r1
	cmp r0, #0
	beq .L0803DC22
	adds r0, r4, #0
	bl StartMu
	ldr r1, .L0803DC34 @ =gUnk_03001410
	str r0, [r1, #4]
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	str r0, [r5, #0x34]
	movs r0, #0xf
	ldrsb r0, [r4, r0]
	str r0, [r5, #0x38]
	ldr r0, .L0803DC38 @ =0x0000FDFF
	ldrh r1, [r4, #0xc]
	ands r0, r1
	strh r0, [r4, #0xc]
.L0803DC22:
	ldrb r2, [r6, #6]
	ldrb r3, [r6, #7]
	movs r0, #5
	movs r1, #0
	bl func_fe6_0803CB3C
.L0803DC2E:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L0803DC34: .4byte gUnk_03001410
.L0803DC38: .4byte 0x0000FDFF

	thumb_func_start func_fe6_0803DC3C
func_fe6_0803DC3C: @ 0x0803DC3C
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	sub sp, #0xc
	adds r6, r0, #0
	ldr r4, .L0803DCB4 @ =gUnk_030013F0
	ldr r5, .L0803DCB8 @ =gSioBmSt
	ldrb r1, [r5, #4]
	adds r0, r1, r4
	ldrb r0, [r0]
	bl GetUnit
	mov r8, r0
	ldrb r5, [r5, #5]
	adds r4, r5, r4
	ldrb r0, [r4]
	bl GetUnit
	adds r4, r0, #0
	ldr r0, [r6, #0x2c]
	movs r1, #0
	mov sb, r1
	mov r1, r8
	strb r0, [r1, #0xe]
	ldr r0, [r6, #0x30]
	strb r0, [r1, #0xf]
	ldr r0, [r6, #0x34]
	strb r0, [r4, #0xe]
	ldr r0, [r6, #0x38]
	strb r0, [r4, #0xf]
	ldr r5, .L0803DCBC @ =gUnk_03001410
	ldr r1, [r5]
	movs r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	str r6, [sp, #8]
	mov r0, r8
	movs r2, #6
	movs r3, #5
	bl NewSioWarpFx
	ldr r1, [r5, #4]
	mov r0, sb
	str r0, [sp]
	str r0, [sp, #4]
	str r6, [sp, #8]
	adds r0, r4, #0
	movs r2, #8
	movs r3, #5
	bl NewSioWarpFx
	add sp, #0xc
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L0803DCB4: .4byte gUnk_030013F0
.L0803DCB8: .4byte gSioBmSt
.L0803DCBC: .4byte gUnk_03001410

	thumb_func_start func_fe6_0803DCC0
func_fe6_0803DCC0: @ 0x0803DCC0
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	ldr r4, .L0803DD18 @ =gUnk_030013F0
	ldr r5, .L0803DD1C @ =gSioBmSt
	ldrb r1, [r5, #4]
	adds r0, r1, r4
	ldrb r0, [r0]
	bl GetUnit
	adds r7, r0, #0
	ldr r1, .L0803DD20 @ =gUnk_Sio_0810F432
	mov r0, sp
	movs r2, #2
	bl memcpy
	ldr r6, .L0803DD24 @ =gUnk_03001410
	ldr r0, [r6, #4]
	bl EndMu
	ldrb r5, [r5, #5]
	adds r4, r5, r4
	ldrb r0, [r4]
	bl GetUnit
	ldr r1, .L0803DD28 @ =0x0000FFFE
	ldrh r2, [r0, #0xc]
	ands r1, r2
	strh r1, [r0, #0xc]
	ldr r0, .L0803DD2C @ =gUnk_0300140C
	ldrb r0, [r0, #2]
	cmp r0, #1
	bne .L0803DD0C
	ldr r0, [r6]
	mov r1, sp
	bl SetMuMoveScript
	movs r0, #7
	strb r0, [r7, #0xe]
.L0803DD0C:
	bl func_fe6_0803CAC8
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0803DD18: .4byte gUnk_030013F0
.L0803DD1C: .4byte gSioBmSt
.L0803DD20: .4byte gUnk_Sio_0810F432
.L0803DD24: .4byte gUnk_03001410
.L0803DD28: .4byte 0x0000FFFE
.L0803DD2C: .4byte gUnk_0300140C

	thumb_func_start func_fe6_0803DD30
func_fe6_0803DD30: @ 0x0803DD30
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	bl MuExistsActive
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq .L0803DD9E
	ldr r4, .L0803DDA8 @ =gUnk_030013F0
	ldr r5, .L0803DDAC @ =gSioBmSt
	ldrb r1, [r5, #4]
	adds r0, r1, r4
	ldrb r0, [r0]
	bl GetUnit
	adds r6, r0, #0
	ldrb r2, [r5, #5]
	adds r0, r2, r4
	ldrb r0, [r0]
	bl GetUnit
	mov r8, r0
	adds r0, r6, #0
	bl HideUnitSprite
	ldr r1, .L0803DDB0 @ =gAction
	movs r0, #2
	strb r0, [r1, #0x11]
	ldrb r5, [r5, #5]
	adds r4, r5, r4
	ldrb r0, [r4]
	strb r0, [r1, #0xd]
	ldr r0, .L0803DDB4 @ =gUnk_0300140C
	ldrb r1, [r0, #3]
	adds r0, r6, #0
	bl UnitEquipItemSlot
	adds r0, r6, #0
	mov r1, r8
	bl BattleGenerateReal
	ldr r1, .L0803DDB8 @ =gBmSt
	movs r0, #0x40
	ldrb r2, [r1, #4]
	orrs r0, r2
	strb r0, [r1, #4]
	ldr r0, .L0803DDBC @ =gUnk_Sio_085CADA4
	adds r1, r7, #0
	bl SpawnProcLocking
	adds r0, r7, #0
	bl Proc_Break
.L0803DD9E:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0803DDA8: .4byte gUnk_030013F0
.L0803DDAC: .4byte gSioBmSt
.L0803DDB0: .4byte gAction
.L0803DDB4: .4byte gUnk_0300140C
.L0803DDB8: .4byte gBmSt
.L0803DDBC: .4byte gUnk_Sio_085CADA4

	thumb_func_start func_fe6_0803DDC0
func_fe6_0803DDC0: @ 0x0803DDC0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	mov sl, r0
	ldr r0, .L0803DEAC @ =gUnk_030013F0
	ldr r1, .L0803DEB0 @ =gSioBmSt
	mov r8, r1
	ldrb r2, [r1, #4]
	adds r1, r2, r0
	ldrb r4, [r1]
	mov r3, r8
	ldrb r3, [r3, #5]
	adds r0, r3, r0
	ldrb r5, [r0]
	adds r0, r4, #0
	bl GetUnit
	adds r6, r0, #0
	adds r0, r5, #0
	bl GetUnit
	adds r7, r0, #0
	bl func_fe6_0803CF58
	lsrs r0, r4, #6
	lsls r0, r0, #3
	mov r2, r8
	adds r2, #0x30
	adds r3, r0, r2
	ldr r1, .L0803DEB4 @ =gBattleUnitA
	mov sb, r1
	adds r1, #0x6a
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	str r1, [r3]
	add r0, r8
	adds r0, #0x2c
	movs r3, #0
	strb r4, [r0]
	strb r3, [r6, #9]
	lsrs r0, r5, #6
	lsls r0, r0, #3
	adds r2, r0, r2
	ldr r4, .L0803DEB8 @ =gBattleUnitB
	adds r1, r4, #0
	adds r1, #0x6a
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	str r1, [r2]
	add r0, r8
	adds r0, #0x2c
	strb r5, [r0]
	strb r3, [r7, #9]
	adds r0, r6, #0
	bl SioSetUniqueWeapons
	adds r0, r7, #0
	bl SioSetUniqueWeapons
	adds r0, r6, #0
	movs r1, #0
	bl SetUnitStatus
	adds r0, r7, #0
	movs r1, #0
	bl SetUnitStatus
	bl EndAllMus
	adds r0, r6, #0
	bl GetUnitCurrentHp
	cmp r0, #0
	beq .L0803DE6A
	adds r0, r6, #0
	bl ShowUnitSprite
	ldr r0, .L0803DEBC @ =0x0000FFFE
	ldrh r2, [r6, #0xc]
	ands r0, r2
	strh r0, [r6, #0xc]
.L0803DE6A:
	bl func_fe6_0803CAC8
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	adds r0, r6, #0
	bl GetUnitCurrentHp
	mov r1, sb
	adds r1, #0x6e
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	cmp r0, r1
	bne .L0803DEC0
	adds r0, r7, #0
	bl GetUnitCurrentHp
	adds r1, r4, #0
	adds r1, #0x6e
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	cmp r0, r1
	bne .L0803DEC0
	mov r3, r8
	ldrb r0, [r3, #9]
	adds r0, #1
	strb r0, [r3, #9]
	b .L0803DEC6
	.align 2, 0
.L0803DEAC: .4byte gUnk_030013F0
.L0803DEB0: .4byte gSioBmSt
.L0803DEB4: .4byte gBattleUnitA
.L0803DEB8: .4byte gBattleUnitB
.L0803DEBC: .4byte 0x0000FFFE
.L0803DEC0:
	ldr r1, .L0803DEDC @ =gSioBmSt
	movs r0, #0
	strb r0, [r1, #9]
.L0803DEC6:
	mov r0, sl
	bl Proc_Break
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0803DEDC: .4byte gSioBmSt

	thumb_func_start func_fe6_0803DEE0
func_fe6_0803DEE0: @ 0x0803DEE0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	str r0, [sp, #0xc]
	ldr r1, .L0803DF4C @ =gUnk_030013F0
	ldr r0, .L0803DF50 @ =gSioBmSt
	mov sb, r0
	ldrb r2, [r0, #4]
	adds r0, r2, r1
	ldrb r0, [r0]
	adds r5, r0, #0
	mov r3, sb
	ldrb r3, [r3, #5]
	adds r1, r3, r1
	ldrb r1, [r1]
	mov sl, r1
	bl GetUnit
	adds r4, r0, #0
	mov r0, sl
	bl GetUnit
	mov r8, r0
	movs r7, #0
	adds r0, r5, #0
	bl func_fe6_0803CB94
	str r0, [sp, #0x10]
	mov r0, sl
	bl func_fe6_0803CB94
	str r0, [sp, #0x14]
	ldr r6, .L0803DF54 @ =gUnk_03001410
	str r7, [r6, #4]
	str r7, [r6]
	movs r0, #4
	ldrh r1, [r4, #0xc]
	ands r0, r1
	cmp r0, #0
	bne .L0803DF3C
	ldr r0, [r4]
	cmp r0, #0
	bne .L0803DF58
.L0803DF3C:
	lsrs r0, r5, #6
	mov r1, sb
	adds r1, #0xa
	adds r0, r0, r1
	ldrb r1, [r0]
	subs r1, #1
	strb r1, [r0]
	b .L0803DF90
	.align 2, 0
.L0803DF4C: .4byte gUnk_030013F0
.L0803DF50: .4byte gSioBmSt
.L0803DF54: .4byte gUnk_03001410
.L0803DF58:
	adds r0, r4, #0
	bl StartMu
	str r0, [r6]
	bl DisableMuCamera
	movs r0, #1
	ldrh r2, [r4, #0xc]
	orrs r0, r2
	strh r0, [r4, #0xc]
	movs r7, #1
	ldr r1, [r6]
	ldr r2, .L0803DFB8 @ =gUnk_Sio_0810F3B0
	ldr r3, [sp, #0x10]
	lsls r0, r3, #2
	adds r0, r0, r2
	movs r5, #0
	ldrsh r2, [r0, r5]
	movs r5, #2
	ldrsh r3, [r0, r5]
	movs r0, #2
	str r0, [sp]
	str r7, [sp, #4]
	ldr r0, [sp, #0xc]
	str r0, [sp, #8]
	adds r0, r4, #0
	bl NewSioWarpFx
.L0803DF90:
	movs r0, #4
	mov r1, r8
	ldrh r1, [r1, #0xc]
	ands r0, r1
	cmp r0, #0
	bne .L0803DFA4
	mov r2, r8
	ldr r0, [r2]
	cmp r0, #0
	bne .L0803DFC0
.L0803DFA4:
	ldr r0, .L0803DFBC @ =gSioBmSt
	mov r3, sl
	lsrs r1, r3, #6
	adds r0, #0xa
	adds r1, r1, r0
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	b .L0803E006
	.align 2, 0
.L0803DFB8: .4byte gUnk_Sio_0810F3B0
.L0803DFBC: .4byte gSioBmSt
.L0803DFC0:
	mov r0, r8
	bl StartMu
	ldr r4, .L0803E020 @ =gUnk_03001410
	str r0, [r4, #4]
	bl DisableMuCamera
	movs r0, #1
	mov r5, r8
	ldrh r5, [r5, #0xc]
	orrs r0, r5
	mov r1, r8
	strh r0, [r1, #0xc]
	adds r0, r7, #0
	movs r7, #0
	cmp r0, #0
	bne .L0803DFE4
	movs r7, #1
.L0803DFE4:
	ldr r1, [r4, #4]
	ldr r2, .L0803E024 @ =gUnk_Sio_0810F3B0
	ldr r3, [sp, #0x14]
	lsls r0, r3, #2
	adds r0, r0, r2
	movs r4, #0
	ldrsh r2, [r0, r4]
	movs r5, #2
	ldrsh r3, [r0, r5]
	movs r0, #2
	str r0, [sp]
	str r7, [sp, #4]
	ldr r0, [sp, #0xc]
	str r0, [sp, #8]
	mov r0, r8
	bl NewSioWarpFx
.L0803E006:
	bl func_fe6_0803CAC8
	ldr r0, [sp, #0xc]
	bl Proc_Break
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0803E020: .4byte gUnk_03001410
.L0803E024: .4byte gUnk_Sio_0810F3B0

	thumb_func_start func_fe6_0803E028
func_fe6_0803E028: @ 0x0803E028
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	movs r2, #0
.L0803E032:
	lsls r0, r2, #0x18
	lsrs r0, r0, #0x18
	str r2, [sp]
	bl func_fe6_08035CB0
	lsls r0, r0, #0x18
	ldr r2, [sp]
	adds r1, r2, #1
	mov r8, r1
	cmp r0, #0
	beq .L0803E098
	movs r6, #0
	movs r7, #0
	ldr r0, .L0803E0AC @ =gUnk_030013F0
	adds r4, r2, r0
	movs r5, #4
.L0803E052:
	ldrb r0, [r4]
	cmp r0, #0
	beq .L0803E080
	adds r7, #1
	str r2, [sp]
	bl GetUnit
	adds r1, r0, #0
	movs r0, #4
	ldrh r3, [r1, #0xc]
	ands r0, r3
	ldr r2, [sp]
	cmp r0, #0
	bne .L0803E080
	adds r0, r1, #0
	bl func_fe6_0803D438
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldr r2, [sp]
	cmp r0, #1
	bne .L0803E080
	adds r6, #1
.L0803E080:
	adds r4, #5
	subs r5, #1
	cmp r5, #0
	bge .L0803E052
	cmp r6, #0
	bne .L0803E098
	cmp r7, #0
	beq .L0803E098
	ldr r0, .L0803E0B0 @ =gSioBmSt
	adds r0, #0xa
	adds r0, r2, r0
	strb r6, [r0]
.L0803E098:
	mov r2, r8
	cmp r2, #3
	ble .L0803E032
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0803E0AC: .4byte gUnk_030013F0
.L0803E0B0: .4byte gSioBmSt

	thumb_func_start func_fe6_0803E0B4
func_fe6_0803E0B4: @ 0x0803E0B4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	ldr r0, .L0803E154 @ =gUnk_030013F0
	ldr r5, .L0803E158 @ =gSioBmSt
	ldrb r2, [r5, #4]
	adds r1, r2, r0
	ldrb r7, [r1]
	ldrb r1, [r5, #5]
	adds r0, r1, r0
	ldrb r6, [r0]
	adds r0, r7, #0
	bl GetUnit
	adds r4, r0, #0
	adds r0, r6, #0
	bl GetUnit
	adds r2, r0, #0
	ldrh r1, [r4, #0xc]
	movs r3, #4
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	bne .L0803E0EE
	ldr r0, .L0803E15C @ =0x0000FFFE
	ands r0, r1
	strh r0, [r4, #0xc]
.L0803E0EE:
	ldrh r1, [r2, #0xc]
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	bne .L0803E0FE
	ldr r0, .L0803E15C @ =0x0000FFFE
	ands r0, r1
	strh r0, [r2, #0xc]
.L0803E0FE:
	lsrs r0, r7, #6
	adds r1, r0, #0
	adds r2, r5, #0
	adds r2, #0xa
	adds r0, r1, r2
	ldrb r0, [r0]
	adds r5, r1, #0
	cmp r0, #0
	beq .L0803E11A
	lsrs r1, r6, #6
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, #0
	bne .L0803E176
.L0803E11A:
	adds r4, r1, #0
	ldr r2, .L0803E158 @ =gSioBmSt
	ldr r3, .L0803E160 @ =gLinkArenaSt
	adds r3, #0xa0
	ldrb r7, [r3]
	ldrb r1, [r2, #0xe]
	subs r0, r7, r1
	adds r1, r2, #0
	adds r1, #0xf
	adds r0, r0, r1
	strb r4, [r0]
	ldrb r0, [r2, #0xe]
	adds r0, #1
	strb r0, [r2, #0xe]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrb r3, [r3]
	cmp r0, r3
	bne .L0803E176
	adds r1, r5, #0
	adds r0, r2, #0
	adds r0, #0xa
	adds r0, r1, r0
	ldrb r0, [r0]
	cmp r0, #0
	beq .L0803E164
	adds r4, r1, #0
	b .L0803E166
	.align 2, 0
.L0803E154: .4byte gUnk_030013F0
.L0803E158: .4byte gSioBmSt
.L0803E15C: .4byte 0x0000FFFE
.L0803E160: .4byte gLinkArenaSt
.L0803E164:
	lsrs r4, r6, #6
.L0803E166:
	strb r4, [r2, #0xf]
	movs r0, #0xff
	bl func_fe6_0803CAD8
	mov r0, r8
	bl Proc_Break
	b .L0803E184
.L0803E176:
	ldr r0, .L0803E190 @ =gPlaySt
	ldrb r0, [r0, #0xf]
	bl func_fe6_0803CAD8
	mov r0, r8
	bl Proc_Break
.L0803E184:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0803E190: .4byte gPlaySt

	thumb_func_start func_fe6_0803E194
func_fe6_0803E194: @ 0x0803E194
	push {lr}
	bl EndAllMus
	bl EndAllMus
	bl func_fe6_0803CD74
	bl func_fe6_0803CDD4
	bl RefreshUnitSprites
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_fe6_0803E1B0
func_fe6_0803E1B0: @ 0x0803E1B0
	push {lr}
	ldr r0, .L0803E1DC @ =gKeySt
	ldr r1, [r0]
	movs r0, #2
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq .L0803E1D8
	ldr r0, .L0803E1E0 @ =gSioMsgBuf
	movs r2, #0
	movs r1, #0x14
	strb r1, [r0]
	ldr r1, .L0803E1E4 @ =gSioSt
	ldr r1, [r1]
	ldrb r1, [r1, #6]
	strb r1, [r0, #1]
	strh r2, [r0, #2]
	movs r1, #4
	bl SioSend
.L0803E1D8:
	pop {r0}
	bx r0
	.align 2, 0
.L0803E1DC: .4byte gKeySt
.L0803E1E0: .4byte gSioMsgBuf
.L0803E1E4: .4byte gSioSt

	thumb_func_start func_fe6_0803E1E8
func_fe6_0803E1E8: @ 0x0803E1E8
	ldrb r0, [r0]
	cmp r0, #1
	beq .L0803E1FA
	cmp r0, #1
	blt .L0803E1FE
	cmp r0, #7
	bgt .L0803E1FE
	cmp r0, #6
	blt .L0803E1FE
.L0803E1FA:
	movs r0, #1
	b .L0803E200
.L0803E1FE:
	movs r0, #0
.L0803E200:
	bx lr
	.align 2, 0

	thumb_func_start func_fe6_0803E204
func_fe6_0803E204: @ 0x0803E204
	push {r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	ldr r4, .L0803E22C @ =gUnk_0300140C
	ldr r2, .L0803E230 @ =func_fe6_0803E1E8
	adds r0, r4, #0
	add r1, sp, #4
	bl SioReceiveData
	lsls r0, r0, #0x10
	cmp r0, #0
	beq .L0803E2AC
	ldrb r0, [r4]
	cmp r0, #6
	beq .L0803E25C
	cmp r0, #6
	bgt .L0803E234
	cmp r0, #1
	beq .L0803E23A
	b .L0803E2AC
	.align 2, 0
.L0803E22C: .4byte gUnk_0300140C
.L0803E230: .4byte func_fe6_0803E1E8
.L0803E234:
	cmp r0, #7
	beq .L0803E294
	b .L0803E2AC
.L0803E23A:
	ldrb r0, [r4, #1]
	ldr r2, .L0803E258 @ =0x0203C988
	adds r3, r5, #0
	adds r3, #0x2c
	adds r1, r5, #0
	adds r1, #0x30
	str r1, [sp]
	movs r1, #0
	bl func_fe6_0803CBB4
	adds r0, r5, #0
	movs r1, #1
	bl Proc_Goto
	b .L0803E2AC
	.align 2, 0
.L0803E258: .4byte 0x0203C988
.L0803E25C:
	bl EndLinkArenaPointsBox
	add r1, sp, #4
	ldrb r2, [r1]
	lsls r0, r2, #4
	subs r0, r0, r2
	ldr r1, .L0803E288 @ =0x0203C6B9
	adds r0, r0, r1
	ldr r1, .L0803E28C @ =gUnk_03001428
	bl SioStrCpy
	ldr r0, .L0803E290 @ =gUnk_Sio_085CA884
	movs r1, #0x60
	movs r2, #0
	movs r3, #0
	bl StartPopup
	adds r0, r5, #0
	movs r1, #3
	bl Proc_Goto
	b .L0803E2AC
	.align 2, 0
.L0803E288: .4byte 0x0203C6B9
.L0803E28C: .4byte gUnk_03001428
.L0803E290: .4byte gUnk_Sio_085CA884
.L0803E294:
	bl EndLinkArenaPointsBox
	ldr r0, .L0803E2B8 @ =gUnk_Sio_085CA8A4
	movs r1, #0x60
	movs r2, #0
	movs r3, #0
	bl StartPopup
	adds r0, r5, #0
	movs r1, #4
	bl Proc_Goto
.L0803E2AC:
	bl func_fe6_0803E1B0
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0803E2B8: .4byte gUnk_Sio_085CA8A4

	thumb_func_start func_fe6_0803E2BC
func_fe6_0803E2BC: @ 0x0803E2BC
	ldrb r0, [r0]
	cmp r0, #3
	bgt .L0803E2CA
	cmp r0, #2
	blt .L0803E2CA
	movs r0, #1
	b .L0803E2CC
.L0803E2CA:
	movs r0, #0
.L0803E2CC:
	bx lr
	.align 2, 0

	thumb_func_start func_fe6_0803E2D0
func_fe6_0803E2D0: @ 0x0803E2D0
	push {r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	ldr r4, .L0803E2F4 @ =gUnk_0300140C
	ldr r2, .L0803E2F8 @ =func_fe6_0803E2BC
	adds r0, r4, #0
	add r1, sp, #4
	bl SioReceiveData
	lsls r0, r0, #0x10
	cmp r0, #0
	beq .L0803E360
	ldrb r0, [r4]
	cmp r0, #2
	beq .L0803E2FC
	cmp r0, #3
	beq .L0803E344
	b .L0803E360
	.align 2, 0
.L0803E2F4: .4byte gUnk_0300140C
.L0803E2F8: .4byte func_fe6_0803E2BC
.L0803E2FC:
	ldrb r0, [r4, #2]
	bl GetUnit
	adds r4, r0, #0
	movs r0, #0x80
	lsls r0, r0, #2
	ldrh r1, [r4, #0xc]
	ands r0, r1
	cmp r0, #0
	bne .L0803E320
	ldr r0, .L0803E31C @ =gUnk_03001410
	ldr r0, [r0]
	bl EndMu
	b .L0803E328
	.align 2, 0
.L0803E31C: .4byte gUnk_03001410
.L0803E320:
	ldr r0, [r5, #0x2c]
	strb r0, [r4, #0xe]
	ldr r0, [r5, #0x30]
	strb r0, [r4, #0xf]
.L0803E328:
	ldr r0, .L0803E340 @ =0x0000FFFE
	ldrh r1, [r4, #0xc]
	ands r0, r1
	strh r0, [r4, #0xc]
	bl RefreshUnitSprites
	adds r0, r5, #0
	movs r1, #0
	bl Proc_Goto
	b .L0803E360
	.align 2, 0
.L0803E340: .4byte 0x0000FFFE
.L0803E344:
	ldrb r0, [r4, #1]
	ldr r2, .L0803E36C @ =0x0203C989
	adds r3, r5, #0
	adds r3, #0x34
	adds r1, r5, #0
	adds r1, #0x38
	str r1, [sp]
	movs r1, #1
	bl func_fe6_0803CBB4
	adds r0, r5, #0
	movs r1, #2
	bl Proc_Goto
.L0803E360:
	bl func_fe6_0803E1B0
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0803E36C: .4byte 0x0203C989

	thumb_func_start func_fe6_0803E370
func_fe6_0803E370: @ 0x0803E370
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r6, r2, #0
	mov r8, r3
	bl StartMu
	ldr r1, .L0803E3AC @ =gUnk_03001410
	lsls r4, r4, #2
	adds r4, r4, r1
	str r0, [r4]
	movs r0, #0xe
	ldrsb r0, [r5, r0]
	str r0, [r6]
	movs r0, #0xf
	ldrsb r0, [r5, r0]
	mov r1, r8
	str r0, [r1]
	ldr r0, .L0803E3B0 @ =0x0000FDFF
	ldrh r1, [r5, #0xc]
	ands r0, r1
	strh r0, [r5, #0xc]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L0803E3AC: .4byte gUnk_03001410
.L0803E3B0: .4byte 0x0000FDFF

	thumb_func_start func_fe6_0803E3B4
func_fe6_0803E3B4: @ 0x0803E3B4
	ldrb r0, [r0]
	cmp r0, #5
	bgt .L0803E3C2
	cmp r0, #4
	blt .L0803E3C2
	movs r0, #1
	b .L0803E3C4
.L0803E3C2:
	movs r0, #0
.L0803E3C4:
	bx lr
	.align 2, 0

	thumb_func_start func_fe6_0803E3C8
func_fe6_0803E3C8: @ 0x0803E3C8
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r7, r0, #0
	ldr r4, .L0803E3EC @ =gUnk_0300140C
	ldr r2, .L0803E3F0 @ =func_fe6_0803E3B4
	adds r0, r4, #0
	mov r1, sp
	bl SioReceiveData
	lsls r0, r0, #0x10
	cmp r0, #0
	beq .L0803E496
	ldrb r0, [r4]
	cmp r0, #4
	beq .L0803E3F4
	cmp r0, #5
	beq .L0803E43C
	b .L0803E496
	.align 2, 0
.L0803E3EC: .4byte gUnk_0300140C
.L0803E3F0: .4byte func_fe6_0803E3B4
.L0803E3F4:
	ldrb r0, [r4, #2]
	bl GetUnit
	adds r6, r0, #0
	movs r0, #0x80
	lsls r0, r0, #2
	ldrh r1, [r6, #0xc]
	ands r0, r1
	cmp r0, #0
	bne .L0803E418
	ldr r0, .L0803E414 @ =gUnk_03001410
	ldr r0, [r0, #4]
	bl EndMu
	b .L0803E420
	.align 2, 0
.L0803E414: .4byte gUnk_03001410
.L0803E418:
	ldr r0, [r7, #0x34]
	strb r0, [r6, #0xe]
	ldr r0, [r7, #0x38]
	strb r0, [r6, #0xf]
.L0803E420:
	ldr r0, .L0803E438 @ =0x0000FFFE
	ldrh r1, [r6, #0xc]
	ands r0, r1
	strh r0, [r6, #0xc]
	bl RefreshUnitSprites
	adds r0, r7, #0
	movs r1, #1
	bl Proc_Goto
	b .L0803E496
	.align 2, 0
.L0803E438: .4byte 0x0000FFFE
.L0803E43C:
	ldr r4, .L0803E4A4 @ =gUnk_030013F0
	ldr r5, .L0803E4A8 @ =gSioBmSt
	ldrb r1, [r5, #4]
	adds r0, r1, r4
	ldrb r0, [r0]
	bl GetUnit
	adds r6, r0, #0
	ldrb r5, [r5, #5]
	adds r4, r5, r4
	ldrb r0, [r4]
	bl GetUnit
	adds r4, r0, #0
	movs r5, #0x80
	lsls r5, r5, #2
	adds r0, r5, #0
	ldrh r1, [r6, #0xc]
	ands r0, r1
	cmp r0, #0
	beq .L0803E476
	adds r2, r7, #0
	adds r2, #0x2c
	adds r3, r7, #0
	adds r3, #0x30
	adds r0, r6, #0
	movs r1, #0
	bl func_fe6_0803E370
.L0803E476:
	adds r0, r5, #0
	ldrh r1, [r4, #0xc]
	ands r0, r1
	cmp r0, #0
	beq .L0803E490
	adds r2, r7, #0
	adds r2, #0x34
	adds r3, r7, #0
	adds r3, #0x38
	adds r0, r4, #0
	movs r1, #1
	bl func_fe6_0803E370
.L0803E490:
	adds r0, r7, #0
	bl Proc_Break
.L0803E496:
	bl func_fe6_0803E1B0
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0803E4A4: .4byte gUnk_030013F0
.L0803E4A8: .4byte gSioBmSt

	thumb_func_start func_fe6_0803E4AC
func_fe6_0803E4AC: @ 0x0803E4AC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	movs r7, #0
	movs r0, #0
	mov r8, r0
	movs r5, #0
	ldrh r4, [r6, #0x1c]
	cmp r4, #0
	beq .L0803E4F8
.L0803E4C2:
	adds r0, r6, #0
	adds r1, r4, #0
	bl CanUnitUseWeapon
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L0803E4E4
	adds r0, r4, #0
	bl GetItemMight
	cmp r0, r8
	bls .L0803E4E4
	adds r7, r4, #0
	adds r0, r7, #0
	bl GetItemMight
	mov r8, r0
.L0803E4E4:
	adds r5, #1
	cmp r5, #4
	bgt .L0803E4F8
	lsls r1, r5, #1
	adds r0, r6, #0
	adds r0, #0x1c
	adds r0, r0, r1
	ldrh r4, [r0]
	cmp r4, #0
	bne .L0803E4C2
.L0803E4F8:
	cmp r7, #0
	beq .L0803E506
	adds r0, r6, #0
	bl GetUnitPower
	add r0, r8
	b .L0803E508
.L0803E506:
	movs r0, #0
.L0803E508:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start func_fe6_0803E514
func_fe6_0803E514: @ 0x0803E514
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	movs r0, #0
	mov r8, r0
	movs r6, #0
	adds r5, r7, #0
	adds r0, r7, #5
	cmp r7, r0
	bge .L0803E55E
.L0803E52A:
	adds r0, r5, #0
	bl GetUnit
	adds r4, r0, #0
	movs r0, #4
	ldrh r1, [r4, #0xc]
	ands r0, r1
	cmp r0, #0
	bne .L0803E556
	ldr r0, [r4]
	cmp r0, #0
	beq .L0803E556
	movs r0, #1
	add r8, r0
	adds r0, r4, #0
	bl func_fe6_0803E4AC
	adds r6, r6, r0
	adds r0, r4, #0
	bl GetUnitCurrentHp
	adds r6, r6, r0
.L0803E556:
	adds r5, #1
	adds r0, r7, #5
	cmp r5, r0
	blt .L0803E52A
.L0803E55E:
	ldr r0, .L0803E580 @ =gSioBmSt
	asrs r1, r7, #6
	lsls r1, r1, #2
	adds r0, #0x14
	adds r1, r1, r0
	ldr r0, [r1]
	adds r6, r6, r0
	adds r0, r6, #0
	mov r1, r8
	bl Div
	adds r6, r0, #0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
.L0803E580: .4byte gSioBmSt

	thumb_func_start func_fe6_0803E584
func_fe6_0803E584: @ 0x0803E584
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r0, .L0803E5C4 @ =gKeySt
	ldr r1, [r0]
	movs r0, #8
	ldrh r1, [r1, #4]
	ands r0, r1
	cmp r0, #0
	beq .L0803E5BC
	bl EndLinkArenaPointsBox
	str r4, [r5, #0x58]
	ldr r0, .L0803E5C8 @ =gPlaySt
	ldrb r0, [r0, #0x1d]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L0803E5B4
	movs r0, #0x68
	bl m4aSongNumStart
	ldr r0, .L0803E5CC @ =gUnk_Sio_085CA93C
	bl StartEvent
.L0803E5B4:
	adds r0, r5, #0
	movs r1, #3
	bl Proc_Goto
.L0803E5BC:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0803E5C4: .4byte gKeySt
.L0803E5C8: .4byte gPlaySt
.L0803E5CC: .4byte gUnk_Sio_085CA93C

	thumb_func_start func_fe6_0803E5D0
func_fe6_0803E5D0: @ 0x0803E5D0
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	movs r6, #1
	rsbs r6, r6, #0
	movs r1, #0
	bl func_fe6_0803E584
	movs r4, #0
.L0803E5E0:
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	bl func_fe6_08035CB0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L0803E614
	ldr r5, .L0803E628 @ =gSioBmSt
	adds r0, r5, #0
	adds r0, #0xa
	adds r0, r4, r0
	ldrb r0, [r0]
	cmp r0, #0
	beq .L0803E614
	ldr r0, .L0803E62C @ =gPlaySt
	ldrb r0, [r0, #0xf]
	cmp r0, r4
	beq .L0803E614
	lsls r0, r4, #6
	adds r0, #1
	bl func_fe6_0803E514
	cmp r6, r0
	bls .L0803E614
	adds r6, r0, #0
	strb r4, [r5, #2]
.L0803E614:
	adds r4, #1
	cmp r4, #3
	ble .L0803E5E0
	adds r0, r7, #0
	bl Proc_Break
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0803E628: .4byte gSioBmSt
.L0803E62C: .4byte gPlaySt

	thumb_func_start func_fe6_0803E630
func_fe6_0803E630: @ 0x0803E630
	push {r4, lr}
	adds r0, r1, #0
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r4, r0, #0
	cmp r0, #0
	beq .L0803E654
	bl GetItemMaxRange
	cmp r0, #1
	beq .L0803E654
	adds r0, r4, #0
	bl GetItemMinRange
	cmp r0, #1
	bgt .L0803E658
.L0803E654:
	movs r0, #1
	b .L0803E65A
.L0803E658:
	movs r0, #2
.L0803E65A:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start func_fe6_0803E660
func_fe6_0803E660: @ 0x0803E660
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x34
	str r0, [sp, #0x10]
	movs r0, #0
	str r0, [sp, #0x18]
	movs r1, #0
	str r1, [sp, #0x1c]
	movs r2, #0
	str r2, [sp, #0x20]
	ldr r0, [sp, #0x10]
	movs r1, #1
	bl func_fe6_0803E584
	ldr r0, .L0803E7B8 @ =gAiSt
	adds r0, #0x7d
	movs r1, #0xe
	strb r1, [r0]
	ldr r0, .L0803E7BC @ =gPlaySt
	ldrb r0, [r0, #0xf]
	lsls r0, r0, #6
	str r0, [sp, #0x14]
	adds r4, r0, #0
	adds r4, #1
	adds r0, #6
	cmp r4, r0
	blt .L0803E69E
	b .L0803E844
.L0803E69E:
	ldr r0, .L0803E7C0 @ =gActiveUnitId
	strb r4, [r0]
	ldrb r0, [r0]
	bl GetUnit
	adds r1, r0, #0
	ldr r0, .L0803E7C4 @ =gActiveUnit
	str r1, [r0]
	movs r0, #4
	ldrh r2, [r1, #0xc]
	ands r0, r2
	ldr r2, [sp, #0x14]
	adds r2, #6
	str r2, [sp, #0x28]
	adds r4, #1
	str r4, [sp, #0x2c]
	cmp r0, #0
	beq .L0803E6C4
	b .L0803E83A
.L0803E6C4:
	ldr r0, [r1]
	cmp r0, #0
	bne .L0803E6CC
	b .L0803E83A
.L0803E6CC:
	movs r5, #0
.L0803E6CE:
	ldr r0, .L0803E7C4 @ =gActiveUnit
	ldr r2, [r0]
	lsls r1, r5, #1
	adds r0, r2, #0
	adds r0, #0x1c
	adds r0, r0, r1
	ldrh r4, [r0]
	adds r6, r4, #0
	adds r0, r5, #1
	str r0, [sp, #0x30]
	cmp r4, #0
	bne .L0803E6E8
	b .L0803E832
.L0803E6E8:
	adds r0, r2, #0
	adds r1, r4, #0
	bl CanUnitUseWeapon
	lsls r0, r0, #0x18
	cmp r0, #0
	bne .L0803E6F8
	b .L0803E832
.L0803E6F8:
	mov sl, r5
	movs r1, #0
	mov r8, r1
	adds r0, r4, #0
	bl GetItemMinRange
	cmp r0, #2
	ble .L0803E70A
	b .L0803E832
.L0803E70A:
	adds r0, r4, #0
	bl GetItemAttributes
	movs r1, #0x80
	ands r1, r0
	cmp r1, #0
	beq .L0803E71A
	b .L0803E832
.L0803E71A:
	adds r0, r4, #0
	bl GetItemMinRange
	cmp r0, #1
	bne .L0803E728
	movs r2, #2
	mov r8, r2
.L0803E728:
	adds r0, r6, #0
	bl GetItemMaxRange
	cmp r0, #1
	ble .L0803E73A
	movs r0, #1
	mov r1, r8
	orrs r1, r0
	mov r8, r1
.L0803E73A:
	add r0, sp, #4
	strh r5, [r0, #4]
	ldr r0, .L0803E7C8 @ =gSioBmSt
	ldrb r0, [r0, #2]
	lsls r0, r0, #6
	mov sb, r0
	mov r5, sb
	adds r5, #1
	adds r0, #6
	cmp r5, r0
	bge .L0803E832
	add r6, sp, #4
	ldr r7, .L0803E7CC @ =gUnk_0300140C
	mov r0, r8
	movs r2, #2
	ands r0, r2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x24]
.L0803E760:
	adds r0, r5, #0
	bl GetUnit
	adds r4, r0, #0
	movs r0, #4
	ldrh r1, [r4, #0xc]
	ands r0, r1
	cmp r0, #0
	bne .L0803E828
	ldr r0, [r4]
	cmp r0, #0
	beq .L0803E828
	strb r5, [r6, #2]
	ldr r2, [sp, #0x24]
	cmp r2, #0
	beq .L0803E7D8
	ldrb r0, [r4, #0xe]
	adds r0, #1
	strb r0, [r6]
	ldrb r0, [r4, #0xf]
	strb r0, [r6, #1]
	add r0, sp, #4
	bl AiSimulateBattleAgainstTargetAtPosition
	ldr r0, [sp, #0xc]
	ldr r1, [sp, #0x18]
	cmp r1, r0
	bhi .L0803E7D8
	str r0, [sp, #0x18]
	ldr r0, .L0803E7C0 @ =gActiveUnitId
	ldrb r0, [r0]
	str r0, [sp, #0x1c]
	lsls r0, r5, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x20]
	mov r2, r8
	cmp r2, #3
	bne .L0803E7D0
	movs r0, #3
	adds r1, r4, #0
	bl func_fe6_0803E630
	b .L0803E7D2
	.align 2, 0
.L0803E7B8: .4byte gAiSt
.L0803E7BC: .4byte gPlaySt
.L0803E7C0: .4byte gActiveUnitId
.L0803E7C4: .4byte gActiveUnit
.L0803E7C8: .4byte gSioBmSt
.L0803E7CC: .4byte gUnk_0300140C
.L0803E7D0:
	movs r0, #1
.L0803E7D2:
	strb r0, [r7, #2]
	mov r0, sl
	strb r0, [r7, #3]
.L0803E7D8:
	movs r0, #1
	mov r1, r8
	ands r0, r1
	cmp r0, #0
	beq .L0803E828
	ldrb r0, [r4, #0xe]
	adds r0, #1
	strb r0, [r6]
	ldrb r0, [r4, #0xf]
	subs r0, #1
	strb r0, [r6, #1]
	add r0, sp, #4
	bl AiSimulateBattleAgainstTargetAtPosition
	ldr r0, [sp, #0xc]
	ldr r2, [sp, #0x18]
	cmp r2, r0
	bhi .L0803E828
	str r0, [sp, #0x18]
	ldr r0, .L0803E81C @ =gActiveUnitId
	ldrb r0, [r0]
	str r0, [sp, #0x1c]
	lsls r0, r5, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x20]
	mov r0, r8
	cmp r0, #3
	bne .L0803E820
	movs r0, #3
	adds r1, r4, #0
	bl func_fe6_0803E630
	strb r0, [r7, #2]
	b .L0803E824
	.align 2, 0
.L0803E81C: .4byte gActiveUnitId
.L0803E820:
	movs r1, #2
	strb r1, [r7, #2]
.L0803E824:
	mov r2, sl
	strb r2, [r7, #3]
.L0803E828:
	adds r5, #1
	mov r0, sb
	adds r0, #6
	cmp r5, r0
	blt .L0803E760
.L0803E832:
	ldr r5, [sp, #0x30]
	cmp r5, #4
	bgt .L0803E83A
	b .L0803E6CE
.L0803E83A:
	ldr r4, [sp, #0x2c]
	ldr r0, [sp, #0x28]
	cmp r4, r0
	bge .L0803E844
	b .L0803E69E
.L0803E844:
	ldr r2, .L0803E878 @ =0x0203C988
	ldr r3, [sp, #0x10]
	adds r3, #0x2c
	ldr r0, [sp, #0x10]
	adds r0, #0x30
	str r0, [sp]
	ldr r0, [sp, #0x1c]
	movs r1, #0
	bl func_fe6_0803CBB4
	ldr r0, .L0803E87C @ =gUnk_0300140C
	add r1, sp, #0x20
	ldrb r1, [r1]
	strb r1, [r0, #1]
	ldr r0, [sp, #0x10]
	bl Proc_Break
	add sp, #0x34
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0803E878: .4byte 0x0203C988
.L0803E87C: .4byte gUnk_0300140C

	thumb_func_start func_fe6_0803E880
func_fe6_0803E880: @ 0x0803E880
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, .L0803E8AC @ =gUnk_0300140C
	ldrb r0, [r0, #1]
	bl GetUnit
	adds r1, r0, #0
	movs r0, #0xe
	ldrsb r0, [r1, r0]
	lsls r0, r0, #4
	ldrb r1, [r1, #0xf]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	lsls r1, r1, #4
	movs r2, #2
	adds r3, r4, #0
	bl AiStartActionCursor
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0803E8AC: .4byte gUnk_0300140C

	thumb_func_start func_fe6_0803E8B0
func_fe6_0803E8B0: @ 0x0803E8B0
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r6, r0, #0
	ldr r0, .L0803E938 @ =gUnk_0300140C
	ldrb r0, [r0, #1]
	ldr r5, .L0803E93C @ =0x0203C989
	movs r1, #0x34
	adds r1, r1, r6
	mov r8, r1
	movs r1, #0x38
	adds r1, r1, r6
	mov sb, r1
	str r1, [sp]
	movs r1, #1
	adds r2, r5, #0
	mov r3, r8
	bl func_fe6_0803CBB4
	ldr r4, .L0803E940 @ =gUnk_030013F0
	subs r5, #5
	ldrb r1, [r5, #4]
	adds r0, r1, r4
	ldrb r0, [r0]
	bl GetUnit
	adds r7, r0, #0
	ldrb r5, [r5, #5]
	adds r4, r5, r4
	ldrb r0, [r4]
	bl GetUnit
	adds r4, r0, #0
	movs r5, #0x80
	lsls r5, r5, #2
	adds r0, r5, #0
	ldrh r1, [r7, #0xc]
	ands r0, r1
	cmp r0, #0
	beq .L0803E914
	adds r2, r6, #0
	adds r2, #0x2c
	adds r3, r6, #0
	adds r3, #0x30
	adds r0, r7, #0
	movs r1, #0
	bl func_fe6_0803E370
.L0803E914:
	adds r0, r5, #0
	ldrh r1, [r4, #0xc]
	ands r0, r1
	cmp r0, #0
	beq .L0803E92A
	adds r0, r4, #0
	movs r1, #1
	mov r2, r8
	mov r3, sb
	bl func_fe6_0803E370
.L0803E92A:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0803E938: .4byte gUnk_0300140C
.L0803E93C: .4byte 0x0203C989
.L0803E940: .4byte gUnk_030013F0

	thumb_func_start func_fe6_0803E944
func_fe6_0803E944: @ 0x0803E944
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #2
	bl func_fe6_0803E584
	bl MuExistsActive
	lsls r0, r0, #0x18
	cmp r0, #0
	bne .L0803E95E
	adds r0, r4, #0
	bl Proc_Break
.L0803E95E:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start func_fe6_0803E964
func_fe6_0803E964: @ 0x0803E964
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	bl GetGameTime
	ldr r2, .L0803EA1C @ =gUnk_Sio_085CA8B4
	movs r1, #0x1f
	ands r1, r0
	adds r1, r1, r2
	ldrb r0, [r1]
	adds r0, #4
	asrs r0, r0, #1
	mov sl, r0
	movs r7, #0
.L0803E984:
	ldr r0, .L0803EA20 @ =gSioSt
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #2
	adds r0, r7, r0
	ldr r1, .L0803EA24 @ =gUnk_Sio_0810F390
	adds r0, r0, r1
	ldrb r0, [r0]
	bl func_fe6_08035CB0
	lsls r0, r0, #0x18
	adds r2, r7, #1
	mov sb, r2
	cmp r0, #0
	beq .L0803EA08
	movs r6, #0
	lsls r0, r7, #2
	mov r8, r0
.L0803E9AC:
	mov r1, r8
	adds r0, r1, r7
	adds r0, r0, r6
	ldr r2, .L0803EA28 @ =gUnk_030013F0
	adds r0, r0, r2
	ldrb r0, [r0]
	bl GetUnit
	adds r1, r0, #0
	cmp r1, #0
	beq .L0803EA02
	ldr r0, [r1]
	cmp r0, #0
	beq .L0803EA02
	movs r2, #0x80
	lsls r2, r2, #2
	adds r0, r2, #0
	ldrh r2, [r1, #0xc]
	ands r0, r2
	cmp r0, #0
	beq .L0803EA02
	movs r5, #0xe
	ldrsb r5, [r1, r5]
	lsls r5, r5, #4
	movs r4, #0xf
	ldrsb r4, [r1, r4]
	lsls r4, r4, #4
	mov r0, sl
	subs r4, r4, r0
	adds r0, r1, #0
	bl GetUnitDisplayedSpritePalette
	movs r3, #0xf
	ands r3, r0
	lsls r3, r3, #0xc
	movs r1, #0xa4
	lsls r1, r1, #4
	adds r3, r3, r1
	adds r0, r5, #0
	adds r1, r4, #0
	ldr r2, .L0803EA2C @ =Sprite_16x16
	bl PutOamHiRam
.L0803EA02:
	adds r6, #1
	cmp r6, #4
	ble .L0803E9AC
.L0803EA08:
	mov r7, sb
	cmp r7, #3
	ble .L0803E984
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0803EA1C: .4byte gUnk_Sio_085CA8B4
.L0803EA20: .4byte gSioSt
.L0803EA24: .4byte gUnk_Sio_0810F390
.L0803EA28: .4byte gUnk_030013F0
.L0803EA2C: .4byte Sprite_16x16

	thumb_func_start func_fe6_0803EA30
func_fe6_0803EA30: @ 0x0803EA30
	push {lr}
	ldr r0, .L0803EA40 @ =gUnk_Sio_085CA8D4
	movs r1, #4
	bl SpawnProc
	pop {r0}
	bx r0
	.align 2, 0
.L0803EA40: .4byte gUnk_Sio_085CA8D4

	thumb_func_start func_fe6_0803EA44
func_fe6_0803EA44: @ 0x0803EA44
	push {lr}
	ldr r0, .L0803EA50 @ =gUnk_Sio_085CA8D4
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
.L0803EA50: .4byte gUnk_Sio_085CA8D4

	thumb_func_start func_fe6_0803EA54
func_fe6_0803EA54: @ 0x0803EA54
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0xa3
	lsls r0, r0, #2
	bl SetStatScreenExcludedUnitFlags
	ldr r0, .L0803EA70 @ =gActiveUnit
	ldr r0, [r0]
	adds r1, r4, #0
	bl StartStatScreen
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0803EA70: .4byte gActiveUnit

	thumb_func_start func_fe6_0803EA74
func_fe6_0803EA74: @ 0x0803EA74
	push {lr}
	adds r1, r0, #0
	ldr r0, .L0803EA8C @ =gSioBmSt
	ldrb r0, [r0, #8]
	cmp r0, #0
	bne .L0803EA90
	adds r0, r1, #0
	movs r1, #0
	bl Proc_Goto
	b .L0803EAA2
	.align 2, 0
.L0803EA8C: .4byte gSioBmSt
.L0803EA90:
	bl EndAllMus
	ldr r0, .L0803EAA8 @ =gPlaySt
	ldrb r1, [r0, #0xf]
	movs r0, #6
	movs r2, #0
	movs r3, #0
	bl func_fe6_0803CB3C
.L0803EAA2:
	pop {r0}
	bx r0
	.align 2, 0
.L0803EAA8: .4byte gPlaySt

	thumb_func_start func_fe6_0803EAAC
func_fe6_0803EAAC: @ 0x0803EAAC
	push {lr}
	ldr r2, .L0803EAC0 @ =gSioBmSt
	ldrb r1, [r2, #8]
	cmp r1, #0
	bne .L0803EAC4
	strb r1, [r2, #9]
	movs r1, #0
	bl Proc_Goto
	b .L0803EAD6
	.align 2, 0
.L0803EAC0: .4byte gSioBmSt
.L0803EAC4:
	bl EndAllMus
	ldr r0, .L0803EADC @ =gPlaySt
	ldrb r1, [r0, #0xf]
	movs r0, #7
	movs r2, #0
	movs r3, #0
	bl func_fe6_0803CB3C
.L0803EAD6:
	pop {r0}
	bx r0
	.align 2, 0
.L0803EADC: .4byte gPlaySt

	thumb_func_start func_fe6_0803EAE0
func_fe6_0803EAE0: @ 0x0803EAE0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, .L0803EAF8 @ =gSioBmSt
	ldrb r0, [r0, #8]
	cmp r0, #0
	bne .L0803EAFC
	ldr r1, [r4, #0x58]
	adds r0, r4, #0
	bl Proc_Goto
	b .L0803EB18
	.align 2, 0
.L0803EAF8: .4byte gSioBmSt
.L0803EAFC:
	bl EndAllMus
	bl EndAllMus
	ldr r1, .L0803EB20 @ =gLinkArenaSt
	movs r0, #1
	strb r0, [r1, #0xb]
	movs r0, #0xff
	bl func_fe6_0803CAD8
	adds r0, r4, #0
	movs r1, #5
	bl Proc_Goto
.L0803EB18:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0803EB20: .4byte gLinkArenaSt

	thumb_func_start func_fe6_0803EB24
func_fe6_0803EB24: @ 0x0803EB24
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	movs r6, #0
	ldr r1, .L0803EB38 @ =gLinkArenaSt
	ldrb r0, [r1]
	cmp r0, #1
	bne .L0803EB3C
	strb r0, [r1, #0xb]
	b .L0803EB8E
	.align 2, 0
.L0803EB38: .4byte gLinkArenaSt
.L0803EB3C:
	ldr r2, .L0803EBA0 @ =gSioBmSt
	adds r4, r1, #0
	adds r4, #0xa0
	ldrb r0, [r4]
	ldrb r3, [r2, #0xe]
	subs r1, r0, r3
	adds r0, r2, #0
	adds r0, #0xf
	adds r1, r1, r0
	ldr r3, .L0803EBA4 @ =gPlaySt
	ldrb r0, [r3, #0xf]
	strb r0, [r1]
	ldrb r0, [r2, #0xe]
	adds r0, #1
	strb r0, [r2, #0xe]
	ldrb r1, [r3, #0xf]
	lsls r0, r1, #2
	adds r1, r2, #0
	adds r1, #0x14
	adds r0, r0, r1
	str r6, [r0]
	ldrb r0, [r2, #0xe]
	ldrb r1, [r4]
	cmp r0, r1
	bne .L0803EBA8
	movs r1, #0
	ldrb r0, [r4]
	cmp r6, r0
	bge .L0803EB8C
	adds r4, r2, #0
	adds r4, #0xa
	adds r3, r0, #0
.L0803EB7C:
	adds r0, r1, r4
	ldrb r0, [r0]
	cmp r0, #0
	beq .L0803EB86
	adds r6, r1, #0
.L0803EB86:
	adds r1, #1
	cmp r1, r3
	blt .L0803EB7C
.L0803EB8C:
	strb r6, [r2, #0xf]
.L0803EB8E:
	movs r0, #0xff
	bl func_fe6_0803CAD8
	adds r0, r5, #0
	movs r1, #8
	bl Proc_Goto
	b .L0803EBB6
	.align 2, 0
.L0803EBA0: .4byte gSioBmSt
.L0803EBA4: .4byte gPlaySt
.L0803EBA8:
	ldrb r0, [r3, #0xf]
	bl func_fe6_0803CAD8
	adds r0, r5, #0
	movs r1, #8
	bl Proc_Goto
.L0803EBB6:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start func_fe6_0803EBBC
func_fe6_0803EBBC: @ 0x0803EBBC
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, .L0803EBDC @ =gLinkArenaSt
	ldrb r0, [r1]
	cmp r0, #1
	bne .L0803EBE0
	strb r0, [r1, #0xb]
	movs r0, #0xff
	bl func_fe6_0803CAD8
	adds r0, r4, #0
	movs r1, #8
	bl Proc_Goto
	b .L0803EBF2
	.align 2, 0
.L0803EBDC: .4byte gLinkArenaSt
.L0803EBE0:
	movs r0, #2
	strb r0, [r1, #0xb]
	movs r0, #0xff
	bl func_fe6_0803CAD8
	adds r0, r4, #0
	movs r1, #8
	bl Proc_Goto
.L0803EBF2:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start func_fe6_0803EBF8
func_fe6_0803EBF8: @ 0x0803EBF8
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	movs r5, #0
	ldr r2, .L0803EC64 @ =gSioBmSt
	ldr r0, .L0803EC68 @ =gLinkArenaSt
	adds r4, r0, #0
	adds r4, #0xa0
	ldrb r0, [r4]
	ldrb r3, [r2, #0xe]
	subs r1, r0, r3
	adds r0, r2, #0
	adds r0, #0xf
	adds r1, r1, r0
	ldr r3, .L0803EC6C @ =gPlaySt
	ldrb r0, [r3, #0xf]
	strb r0, [r1]
	ldrb r0, [r2, #0xe]
	adds r0, #1
	strb r0, [r2, #0xe]
	ldrb r1, [r3, #0xf]
	lsls r0, r1, #2
	adds r1, r2, #0
	adds r1, #0x14
	adds r0, r0, r1
	str r5, [r0]
	ldrb r0, [r2, #0xe]
	ldrb r1, [r4]
	cmp r0, r1
	bne .L0803EC70
	movs r1, #0
	ldrb r0, [r4]
	cmp r5, r0
	bge .L0803EC50
	adds r4, r2, #0
	adds r4, #0xa
	adds r3, r0, #0
.L0803EC40:
	adds r0, r1, r4
	ldrb r0, [r0]
	cmp r0, #0
	beq .L0803EC4A
	adds r5, r1, #0
.L0803EC4A:
	adds r1, #1
	cmp r1, r3
	blt .L0803EC40
.L0803EC50:
	strb r5, [r2, #0xf]
	movs r0, #0xff
	bl func_fe6_0803CAD8
	adds r0, r6, #0
	movs r1, #5
	bl Proc_Goto
	b .L0803EC7E
	.align 2, 0
.L0803EC64: .4byte gSioBmSt
.L0803EC68: .4byte gLinkArenaSt
.L0803EC6C: .4byte gPlaySt
.L0803EC70:
	ldrb r0, [r3, #0xf]
	bl func_fe6_0803CAD8
	adds r0, r6, #0
	movs r1, #5
	bl Proc_Goto
.L0803EC7E:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start func_fe6_0803EC84
func_fe6_0803EC84: @ 0x0803EC84
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, .L0803ECA4 @ =gLinkArenaSt
	movs r0, #2
	strb r0, [r1, #0xb]
	movs r0, #0xff
	bl func_fe6_0803CAD8
	adds r0, r4, #0
	movs r1, #5
	bl Proc_Goto
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0803ECA4: .4byte gLinkArenaSt

	thumb_func_start func_fe6_0803ECA8
func_fe6_0803ECA8: @ 0x0803ECA8
	push {r4, lr}
	movs r3, #0
	str r3, [r0, #0x58]
	ldr r2, .L0803ECC8 @ =gPlaySt
	ldrb r4, [r2, #0xf]
	lsls r1, r4, #6
	str r1, [r0, #0x5c]
	ldr r0, .L0803ECCC @ =gSioBmSt
	adds r0, #0xa
	ldrb r2, [r2, #0xf]
	adds r0, r2, r0
	strb r3, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0803ECC8: .4byte gPlaySt
.L0803ECCC: .4byte gSioBmSt

	thumb_func_start func_fe6_0803ECD0
func_fe6_0803ECD0: @ 0x0803ECD0
	push {r4, r5, r6, lr}
	adds r5, r0, #0
.L0803ECD4:
	ldr r1, [r5, #0x58]
	cmp r1, #5
	bne .L0803ECE4
	adds r0, r5, #0
	movs r1, #1
	bl Proc_Goto
	b .L0803ED44
.L0803ECE4:
	ldr r0, [r5, #0x5c]
	adds r0, r0, r1
	adds r0, #1
	bl GetUnit
	adds r6, r0, #0
	movs r0, #4
	ldrh r1, [r6, #0xc]
	ands r0, r1
	cmp r0, #0
	bne .L0803ED00
	ldr r0, [r6]
	cmp r0, #0
	bne .L0803ED08
.L0803ED00:
	ldr r0, [r5, #0x58]
	adds r0, #1
	str r0, [r5, #0x58]
	b .L0803ECD4
.L0803ED08:
	bl RefreshUnitSprites
	adds r0, r6, #0
	bl HideUnitSprite
	adds r0, r6, #0
	bl StartMu
	adds r4, r0, #0
	ldr r1, .L0803ED4C @ =gWorkingMoveScr
	movs r0, #2
	strb r0, [r1]
	movs r0, #4
	strb r0, [r1, #1]
	adds r0, r4, #0
	bl SetMuMoveScript
	adds r0, r4, #0
	bl func_fe6_0803F5C8
	str r4, [r5, #0x54]
	ldr r0, [r5, #0x58]
	adds r0, #1
	str r0, [r5, #0x58]
	ldr r0, .L0803ED50 @ =0x0000FDFF
	ldrh r1, [r6, #0xc]
	ands r0, r1
	movs r1, #5
	orrs r0, r1
	strh r0, [r6, #0xc]
.L0803ED44:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L0803ED4C: .4byte gWorkingMoveScr
.L0803ED50: .4byte 0x0000FDFF

	thumb_func_start func_fe6_0803ED54
func_fe6_0803ED54: @ 0x0803ED54
	push {lr}
	ldr r0, [r0, #0x54]
	bl EndMu
	pop {r0}
	bx r0

	thumb_func_start func_fe6_0803ED60
func_fe6_0803ED60: @ 0x0803ED60
	push {lr}
	bl func_fe6_0803CD74
	bl func_fe6_0803CDD4
	bl RefreshUnitSprites
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_fe6_0803ED74
func_fe6_0803ED74: @ 0x0803ED74
	push {lr}
	bl GetTalkChoiceResult
	adds r1, r0, #0
	cmp r1, #1
	bne .L0803ED8C
	ldr r0, .L0803ED88 @ =gSioBmSt
	strb r1, [r0, #8]
	b .L0803ED92
	.align 2, 0
.L0803ED88: .4byte gSioBmSt
.L0803ED8C:
	ldr r1, .L0803ED98 @ =gSioBmSt
	movs r0, #0
	strb r0, [r1, #8]
.L0803ED92:
	pop {r0}
	bx r0
	.align 2, 0
.L0803ED98: .4byte gSioBmSt

	thumb_func_start func_fe6_0803ED9C
func_fe6_0803ED9C: @ 0x0803ED9C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, .L0803EDE0 @ =0x06015000
	movs r1, #6
	bl LoadHelpBoxGfx
	ldr r2, .L0803EDE4 @ =0x000006E5
	movs r0, #0x40
	movs r1, #0x38
	bl StartHelpBox_08070804
	movs r4, #0
	ldr r6, .L0803EDE8 @ =0x0203C98E
.L0803EDB6:
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	bl func_fe6_08035CB0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L0803EDCE
	adds r0, r4, r6
	ldrb r0, [r0]
	cmp r0, #0
	beq .L0803EDCE
	str r4, [r5, #0x58]
.L0803EDCE:
	adds r4, #1
	cmp r4, #3
	ble .L0803EDB6
	movs r0, #0
	str r0, [r5, #0x5c]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L0803EDE0: .4byte 0x06015000
.L0803EDE4: .4byte 0x000006E5
.L0803EDE8: .4byte 0x0203C98E

	thumb_func_start func_fe6_0803EDEC
func_fe6_0803EDEC: @ 0x0803EDEC
	push {r4, lr}
	adds r4, r0, #0
.L0803EDF0:
	ldr r1, [r4, #0x5c]
	cmp r1, #4
	ble .L0803EE02
	bl CloseHelpBox
	adds r0, r4, #0
	bl Proc_Break
	b .L0803EE56
.L0803EE02:
	ldr r0, [r4, #0x58]
	lsls r0, r0, #6
	adds r0, r0, r1
	adds r0, #1
	bl GetUnit
	adds r1, r0, #0
	movs r0, #4
	ldrh r2, [r1, #0xc]
	ands r0, r2
	cmp r0, #0
	bne .L0803EE20
	ldr r0, [r1]
	cmp r0, #0
	bne .L0803EE28
.L0803EE20:
	ldr r0, [r4, #0x5c]
	adds r0, #1
	str r0, [r4, #0x5c]
	b .L0803EDF0
.L0803EE28:
	ldr r3, .L0803EE5C @ =gSioBmSt
	ldr r0, [r4, #0x58]
	lsls r0, r0, #3
	adds r1, r3, #0
	adds r1, #0x30
	adds r0, r0, r1
	movs r1, #0x1e
	str r1, [r0]
	ldr r1, [r4, #0x58]
	lsls r2, r1, #3
	adds r2, r2, r3
	lsls r1, r1, #6
	ldr r0, [r4, #0x5c]
	adds r0, r0, r1
	adds r0, #1
	adds r2, #0x2c
	strb r0, [r2]
	adds r0, r4, #0
	bl StartSioPoints2
	ldr r0, [r4, #0x5c]
	adds r0, #1
	str r0, [r4, #0x5c]
.L0803EE56:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0803EE5C: .4byte gSioBmSt

	thumb_func_start func_fe6_0803EE60
func_fe6_0803EE60: @ 0x0803EE60
	push {lr}
	adds r1, r0, #0
	ldr r0, .L0803EE78 @ =gLinkArenaSt
	ldrb r0, [r0]
	cmp r0, #1
	bne .L0803EE74
	adds r0, r1, #0
	movs r1, #1
	bl Proc_Goto
.L0803EE74:
	pop {r0}
	bx r0
	.align 2, 0
.L0803EE78: .4byte gLinkArenaSt

	thumb_func_start func_fe6_0803EE7C
func_fe6_0803EE7C: @ 0x0803EE7C
	push {lr}
	ldr r0, .L0803EEA8 @ =gBg2Tm
	movs r1, #0
	bl TmFill
	movs r0, #4
	bl EnableBgSync
	bl RenderMap
	bl SetupBanim
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L0803EEAC
	movs r0, #1
	bl SetBanimLinkArenaFlag
	bl BeginAnimsOnBattleAnimations
	b .L0803EEC2
	.align 2, 0
.L0803EEA8: .4byte gBg2Tm
.L0803EEAC:
	bl EndAllMus
	bl RenderMap
	bl StartBattleManim
	ldr r0, .L0803EEC8 @ =gBattleSt
	movs r1, #0x80
	ldrb r2, [r0, #1]
	orrs r1, r2
	strb r1, [r0, #1]
.L0803EEC2:
	pop {r0}
	bx r0
	.align 2, 0
.L0803EEC8: .4byte gBattleSt

	thumb_func_start func_fe6_0803EECC
func_fe6_0803EECC: @ 0x0803EECC
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	ldr r6, .L0803EF3C @ =gBattleUnitA
	movs r0, #0x11
	ldrsb r0, [r6, r0]
	cmp r0, #0
	bne .L0803EEE8
	ldr r0, .L0803EF40 @ =ProcScr_Mu
	bl FindProc
	adds r4, r0, #0
	bl func_fe6_0803F5C8
	str r4, [r7, #0x54]
.L0803EEE8:
	ldr r5, .L0803EF44 @ =gBattleUnitB
	movs r0, #0x11
	ldrsb r0, [r5, r0]
	cmp r0, #0
	bne .L0803EF34
	bl RefreshUnitSprites
	movs r0, #0xb
	ldrsb r0, [r5, r0]
	bl GetUnit
	bl HideUnitSprite
	adds r0, r5, #0
	bl StartMu
	adds r4, r0, #0
	movs r0, #0xe
	ldrsb r0, [r6, r0]
	movs r1, #0xf
	ldrsb r1, [r6, r1]
	movs r2, #0xe
	ldrsb r2, [r5, r2]
	movs r3, #0xf
	ldrsb r3, [r5, r3]
	bl GetFacingFromTo
	ldr r1, .L0803EF48 @ =gWorkingMoveScr
	strb r0, [r1]
	movs r0, #4
	strb r0, [r1, #1]
	adds r0, r4, #0
	bl SetMuMoveScript
	adds r0, r4, #0
	bl func_fe6_0803F5C8
	str r4, [r7, #0x54]
.L0803EF34:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0803EF3C: .4byte gBattleUnitA
.L0803EF40: .4byte ProcScr_Mu
.L0803EF44: .4byte gBattleUnitB
.L0803EF48: .4byte gWorkingMoveScr

	thumb_func_start func_fe6_0803EF4C
func_fe6_0803EF4C: @ 0x0803EF4C
	push {r4, r5, lr}
	ldr r0, .L0803EF94 @ =gBattleUnitA
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetUnit
	adds r4, r0, #0
	ldr r0, .L0803EF98 @ =gBattleUnitB
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetUnit
	adds r5, r0, #0
	adds r0, r4, #0
	bl GetUnitCurrentHp
	cmp r0, #0
	bne .L0803EF7C
	movs r0, #5
	ldrh r1, [r4, #0xc]
	orrs r0, r1
	strh r0, [r4, #0xc]
.L0803EF7C:
	adds r0, r5, #0
	bl GetUnitCurrentHp
	cmp r0, #0
	bne .L0803EF8E
	movs r0, #5
	ldrh r1, [r5, #0xc]
	orrs r0, r1
	strh r0, [r5, #0xc]
.L0803EF8E:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0803EF94: .4byte gBattleUnitA
.L0803EF98: .4byte gBattleUnitB

	thumb_func_start func_fe6_0803EF9C
func_fe6_0803EF9C: @ 0x0803EF9C
	ldr r1, .L0803EFA4 @ =Unk_Sio_0203C9D0
	movs r0, #1
	strb r0, [r1]
	bx lr
	.align 2, 0
.L0803EFA4: .4byte Unk_Sio_0203C9D0

	thumb_func_start func_fe6_0803EFA8
func_fe6_0803EFA8: @ 0x0803EFA8
	ldr r1, .L0803EFB0 @ =Unk_Sio_0203C9D0
	movs r0, #0
	strb r0, [r1]
	bx lr
	.align 2, 0
.L0803EFB0: .4byte Unk_Sio_0203C9D0

	thumb_func_start func_fe6_0803EFB4
func_fe6_0803EFB4: @ 0x0803EFB4
	ldr r2, .L0803EFE8 @ =gDispIo
	movs r0, #0x21
	rsbs r0, r0, #0
	ldrb r1, [r2, #1]
	ands r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r2, #1]
	adds r1, r2, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r3, [r1]
	ands r0, r3
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x44
	movs r1, #0
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	bx lr
	.align 2, 0
.L0803EFE8: .4byte gDispIo

	thumb_func_start func_fe6_0803EFEC
func_fe6_0803EFEC: @ 0x0803EFEC
	ldr r0, .L0803F018 @ =0x04000006
	ldrh r0, [r0]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	ldr r3, .L0803F01C @ =gUnk_Sio_02001528
	cmp r1, #0xa0
	bls .L0803F004
	ldr r0, .L0803F020 @ =gUnk_Sio_02001520
	ldr r0, [r0]
	str r0, [r3]
	movs r1, #0
.L0803F004:
	ldr r2, .L0803F024 @ =0x04000042
	ldr r0, [r3]
	lsls r1, r1, #2
	adds r1, r1, r0
	ldrh r3, [r1]
	lsls r0, r3, #8
	ldrh r1, [r1, #2]
	adds r0, r1, r0
	strh r0, [r2]
	bx lr
	.align 2, 0
.L0803F018: .4byte 0x04000006
.L0803F01C: .4byte gUnk_Sio_02001528
.L0803F020: .4byte gUnk_Sio_02001520
.L0803F024: .4byte 0x04000042

	thumb_func_start func_fe6_0803F028
func_fe6_0803F028: @ 0x0803F028
	ldr r2, .L0803F038 @ =gUnk_Sio_02001520
	ldr r3, [r2]
	ldr r1, .L0803F03C @ =gUnk_Sio_02001524
	ldr r0, [r1]
	str r0, [r2]
	str r3, [r1]
	bx lr
	.align 2, 0
.L0803F038: .4byte gUnk_Sio_02001520
.L0803F03C: .4byte gUnk_Sio_02001524

	thumb_func_start func_fe6_0803F040
func_fe6_0803F040: @ 0x0803F040
	push {lr}
	ldr r2, .L0803F064 @ =gDispIo
	movs r0, #0x21
	rsbs r0, r0, #0
	ldrb r1, [r2, #1]
	ands r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r2, #1]
	movs r0, #0
	bl SetOnHBlankA
	pop {r0}
	bx r0
	.align 2, 0
.L0803F064: .4byte gDispIo

	thumb_func_start func_fe6_0803F068
func_fe6_0803F068: @ 0x0803F068
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	str r0, [sp, #4]
	ldr r7, [sp, #0x34]
	ldr r0, [sp, #0x48]
	ldr r6, [sp, #0x4c]
	lsls r6, r6, #0x10
	lsrs r6, r6, #0x10
	subs r1, #0x78
	subs r2, #0x50
	subs r3, #0x78
	subs r7, #0x50
	ldr r4, [sp, #0x38]
	subs r4, #0x78
	str r4, [sp, #0x38]
	ldr r4, [sp, #0x3c]
	subs r4, #0x50
	str r4, [sp, #0x3c]
	ldr r4, [sp, #0x40]
	subs r4, #0x78
	str r4, [sp, #0x40]
	ldr r4, [sp, #0x44]
	subs r4, #0x50
	str r4, [sp, #0x44]
	ldr r4, .L0803F1D4 @ =gSinLut
	mov sb, r4
	lsls r0, r0, #0x10
	movs r4, #0xff
	lsls r4, r4, #0x10
	ands r4, r0
	asrs r4, r4, #0x10
	mov ip, r4
	lsls r0, r4, #1
	add r0, sb
	movs r4, #0
	ldrsh r5, [r0, r4]
	adds r0, r1, #0
	muls r0, r5, r0
	mov r8, r0
	mov r4, ip
	adds r4, #0x40
	lsls r4, r4, #1
	add r4, sb
	movs r0, #0
	ldrsh r4, [r4, r0]
	adds r0, r2, #0
	muls r0, r4, r0
	add r0, r8
	str r0, [sp, #8]
	muls r1, r4, r1
	adds r0, r2, #0
	muls r0, r5, r0
	subs r1, r1, r0
	str r1, [sp, #0xc]
	adds r1, r3, #0
	muls r1, r5, r1
	adds r0, r7, #0
	muls r0, r4, r0
	adds r1, r1, r0
	mov sb, r1
	adds r1, r3, #0
	muls r1, r4, r1
	adds r0, r7, #0
	muls r0, r5, r0
	subs r7, r1, r0
	ldr r2, [sp, #0x38]
	adds r1, r2, #0
	muls r1, r5, r1
	ldr r2, [sp, #0x3c]
	adds r0, r2, #0
	muls r0, r4, r0
	adds r1, r1, r0
	mov sl, r1
	ldr r0, [sp, #0x38]
	adds r1, r0, #0
	muls r1, r4, r1
	adds r0, r2, #0
	muls r0, r5, r0
	subs r1, r1, r0
	mov r8, r1
	ldr r2, [sp, #0x40]
	adds r1, r2, #0
	muls r1, r5, r1
	ldr r2, [sp, #0x44]
	adds r0, r2, #0
	muls r0, r4, r0
	adds r1, r1, r0
	str r1, [sp, #0x10]
	ldr r0, [sp, #0x40]
	adds r1, r0, #0
	muls r1, r4, r1
	adds r0, r2, #0
	muls r0, r5, r0
	subs r4, r1, r0
	ldr r1, [sp, #8]
	asrs r0, r1, #0xc
	muls r0, r6, r0
	asrs r0, r0, #8
	adds r0, #0x78
	str r0, [sp, #8]
	ldr r2, [sp, #0xc]
	asrs r0, r2, #0xc
	muls r0, r6, r0
	asrs r0, r0, #8
	adds r0, #0x50
	str r0, [sp, #0xc]
	mov r1, sb
	asrs r0, r1, #0xc
	muls r0, r6, r0
	asrs r0, r0, #8
	adds r0, #0x78
	mov sb, r0
	asrs r0, r7, #0xc
	muls r0, r6, r0
	asrs r0, r0, #8
	adds r7, r0, #0
	adds r7, #0x50
	mov r2, sl
	asrs r0, r2, #0xc
	muls r0, r6, r0
	asrs r0, r0, #8
	adds r0, #0x78
	mov sl, r0
	mov r1, r8
	asrs r0, r1, #0xc
	muls r0, r6, r0
	asrs r0, r0, #8
	adds r0, #0x50
	mov r8, r0
	ldr r2, [sp, #0x10]
	asrs r0, r2, #0xc
	muls r0, r6, r0
	asrs r0, r0, #8
	adds r0, #0x78
	str r0, [sp, #0x10]
	asrs r0, r4, #0xc
	muls r0, r6, r0
	asrs r0, r0, #8
	adds r4, r0, #0
	adds r4, #0x50
	str r7, [sp]
	ldr r0, [sp, #4]
	ldr r1, [sp, #8]
	ldr r2, [sp, #0xc]
	mov r3, sb
	bl func_fe6_08013F04
	mov r0, r8
	str r0, [sp]
	ldr r0, [sp, #4]
	mov r1, sb
	adds r2, r7, #0
	mov r3, sl
	bl func_fe6_08013F04
	str r4, [sp]
	ldr r0, [sp, #4]
	mov r1, sl
	mov r2, r8
	ldr r3, [sp, #0x10]
	bl func_fe6_08013F04
	ldr r1, [sp, #0xc]
	str r1, [sp]
	ldr r0, [sp, #4]
	ldr r1, [sp, #0x10]
	adds r2, r4, #0
	ldr r3, [sp, #8]
	bl func_fe6_08013F04
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0803F1D4: .4byte gSinLut

	thumb_func_start func_fe6_0803F1D8
func_fe6_0803F1D8: @ 0x0803F1D8
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, .L0803F20C @ =gUnk_Sio_02001520
	ldr r0, .L0803F210 @ =gUnk_Sio_020012A0
	str r0, [r1]
	ldr r5, .L0803F214 @ =gUnk_Sio_02001524
	ldr r2, .L0803F218 @ =0xFFFFFD80
	adds r1, r0, r2
	str r1, [r5]
	ldr r1, .L0803F21C @ =gUnk_Sio_02001528
	str r0, [r1]
	bl func_fe6_08013EE4
	ldr r0, [r5]
	bl func_fe6_08013EE4
	adds r4, #0x4c
	movs r0, #0
	strh r0, [r4]
	ldr r0, .L0803F220 @ =func_fe6_0803EFEC
	bl SetOnHBlankA
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0803F20C: .4byte gUnk_Sio_02001520
.L0803F210: .4byte gUnk_Sio_020012A0
.L0803F214: .4byte gUnk_Sio_02001524
.L0803F218: .4byte 0xFFFFFD80
.L0803F21C: .4byte gUnk_Sio_02001528
.L0803F220: .4byte func_fe6_0803EFEC

	thumb_func_start func_fe6_0803F224
func_fe6_0803F224: @ 0x0803F224
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	adds r4, r0, #0
	adds r7, r4, #0
	adds r7, #0x4c
	adds r5, r4, #0
	adds r5, #0x64
	ldrh r0, [r7]
	ldrh r1, [r5]
	cmp r0, r1
	bne .L0803F248
	movs r0, #0
	bl SetOnHBlankA
	adds r0, r4, #0
	bl Proc_Break
	b .L0803F2AE
.L0803F248:
	movs r0, #0
	ldrsh r3, [r7, r0]
	movs r1, #0
	ldrsh r0, [r5, r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #0xa0
	movs r2, #0xc0
	bl Interpolate
	adds r6, r0, #0
	movs r2, #0x88
	lsls r2, r2, #1
	movs r0, #0
	ldrsh r3, [r7, r0]
	movs r1, #0
	ldrsh r0, [r5, r1]
	str r0, [sp]
	movs r0, #1
	movs r1, #0x10
	bl Interpolate
	adds r5, r0, #0
	ldr r4, .L0803F2B8 @ =gUnk_Sio_02001524
	ldr r0, [r4]
	bl func_fe6_08013EE4
	ldr r0, [r4]
	movs r2, #0
	str r2, [sp]
	movs r1, #0xf0
	str r1, [sp, #4]
	movs r1, #0xa0
	str r1, [sp, #8]
	str r2, [sp, #0xc]
	str r1, [sp, #0x10]
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	str r6, [sp, #0x14]
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	str r5, [sp, #0x18]
	movs r1, #0
	movs r3, #0xf0
	bl func_fe6_0803F068
	bl func_fe6_0803F028
	ldrh r0, [r7]
	adds r0, #1
	strh r0, [r7]
.L0803F2AE:
	add sp, #0x1c
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0803F2B8: .4byte gUnk_Sio_02001524

	thumb_func_start func_fe6_0803F2BC
func_fe6_0803F2BC: @ 0x0803F2BC
	ldr r2, .L0803F300 @ =gDispIo
	movs r0, #1
	ldrb r1, [r2, #1]
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	movs r1, #0x21
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #0x20
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r2, #1]
	adds r1, r2, #0
	adds r1, #0x2f
	movs r0, #0
	strb r0, [r1]
	adds r1, #4
	strb r0, [r1]
	subs r1, #5
	movs r0, #0xf0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0xa0
	strb r0, [r1]
	bx lr
	.align 2, 0
.L0803F300: .4byte gDispIo

	thumb_func_start func_fe6_0803F304
func_fe6_0803F304: @ 0x0803F304
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	ldr r0, .L0803F3A4 @ =gUnk_Sio_085CADFC
	bl SpawnProcLocking
	adds r0, #0x64
	movs r3, #0
	strh r4, [r0]
	ldr r0, .L0803F3A8 @ =gDispIo
	mov ip, r0
	movs r2, #1
	ldrb r0, [r0, #1]
	orrs r0, r2
	movs r1, #2
	mov r8, r1
	mov r1, r8
	orrs r0, r1
	movs r6, #4
	orrs r0, r6
	movs r5, #8
	orrs r0, r5
	movs r4, #0x10
	orrs r0, r4
	movs r1, #0x21
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	movs r1, #0x7f
	ands r0, r1
	mov r1, ip
	strb r0, [r1, #1]
	mov r0, ip
	adds r0, #0x2f
	strb r3, [r0]
	adds r0, #4
	strb r3, [r0]
	adds r1, #0x2e
	movs r0, #0xf0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0xa0
	strb r0, [r1]
	mov r7, ip
	adds r7, #0x35
	ldrb r0, [r7]
	orrs r2, r0
	mov r1, r8
	orrs r2, r1
	orrs r2, r6
	orrs r2, r5
	orrs r2, r4
	mov r3, ip
	adds r3, #0x36
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r1, [r3]
	ands r0, r1
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #2
	ands r0, r1
	subs r1, #4
	ands r0, r1
	subs r1, #8
	ands r0, r1
	strb r0, [r3]
	movs r0, #0x20
	orrs r2, r0
	strb r2, [r7]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0803F3A4: .4byte gUnk_Sio_085CADFC
.L0803F3A8: .4byte gDispIo

	thumb_func_start func_fe6_0803F3AC
func_fe6_0803F3AC: @ 0x0803F3AC
	push {lr}
	adds r1, r0, #0
	movs r0, #0x40
	bl func_fe6_0803F304
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_fe6_0803F3BC
func_fe6_0803F3BC: @ 0x0803F3BC
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	adds r4, r0, #0
	adds r7, r4, #0
	adds r7, #0x4c
	adds r5, r4, #0
	adds r5, #0x64
	ldrh r0, [r7]
	ldrh r1, [r5]
	cmp r0, r1
	bne .L0803F3E0
	movs r0, #0
	bl SetOnHBlankA
	adds r0, r4, #0
	bl Proc_Break
	b .L0803F446
.L0803F3E0:
	movs r2, #0
	ldrsh r3, [r7, r2]
	movs r1, #0
	ldrsh r0, [r5, r1]
	str r0, [sp]
	movs r0, #4
	movs r1, #0xc0
	movs r2, #0xa0
	bl Interpolate
	adds r6, r0, #0
	movs r1, #0x88
	lsls r1, r1, #1
	movs r2, #0
	ldrsh r3, [r7, r2]
	movs r2, #0
	ldrsh r0, [r5, r2]
	str r0, [sp]
	movs r0, #5
	movs r2, #0x10
	bl Interpolate
	adds r5, r0, #0
	ldr r4, .L0803F450 @ =gUnk_Sio_02001524
	ldr r0, [r4]
	bl func_fe6_08013EE4
	ldr r0, [r4]
	movs r2, #0
	str r2, [sp]
	movs r1, #0xf0
	str r1, [sp, #4]
	movs r1, #0xa0
	str r1, [sp, #8]
	str r2, [sp, #0xc]
	str r1, [sp, #0x10]
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	str r6, [sp, #0x14]
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	str r5, [sp, #0x18]
	movs r1, #0
	movs r3, #0xf0
	bl func_fe6_0803F068
	bl func_fe6_0803F028
	ldrh r0, [r7]
	adds r0, #1
	strh r0, [r7]
.L0803F446:
	add sp, #0x1c
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0803F450: .4byte gUnk_Sio_02001524

	thumb_func_start func_fe6_0803F454
func_fe6_0803F454: @ 0x0803F454
	ldr r2, .L0803F474 @ =gDispIo
	movs r0, #0
	strb r0, [r2, #1]
	adds r1, r2, #0
	adds r1, #0x2f
	strb r0, [r1]
	adds r1, #4
	strb r0, [r1]
	subs r1, #5
	movs r0, #0xf0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0xa0
	strb r0, [r1]
	bx lr
	.align 2, 0
.L0803F474: .4byte gDispIo

	thumb_func_start func_fe6_0803F478
func_fe6_0803F478: @ 0x0803F478
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	ldr r0, .L0803F4FC @ =gUnk_Sio_085CAE34
	bl SpawnProcLocking
	adds r0, #0x64
	movs r2, #0
	strh r4, [r0]
	ldr r3, .L0803F500 @ =gDispIo
	movs r0, #0x21
	rsbs r0, r0, #0
	ldrb r1, [r3, #1]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r3, #1]
	adds r0, r3, #0
	adds r0, #0x2f
	strb r2, [r0]
	adds r0, #4
	strb r2, [r0]
	adds r1, r3, #0
	adds r1, #0x2e
	movs r0, #0xf0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0xa0
	strb r0, [r1]
	adds r4, r3, #0
	adds r4, #0x35
	movs r2, #1
	ldrb r0, [r4]
	orrs r2, r0
	movs r0, #2
	orrs r2, r0
	movs r0, #4
	orrs r2, r0
	movs r0, #8
	orrs r2, r0
	movs r0, #0x10
	orrs r2, r0
	adds r3, #0x36
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r1, [r3]
	ands r0, r1
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #2
	ands r0, r1
	subs r1, #4
	ands r0, r1
	subs r1, #8
	ands r0, r1
	strb r0, [r3]
	movs r0, #0x20
	orrs r2, r0
	strb r2, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0803F4FC: .4byte gUnk_Sio_085CAE34
.L0803F500: .4byte gDispIo

	thumb_func_start func_fe6_0803F504
func_fe6_0803F504: @ 0x0803F504
	push {lr}
	adds r1, r0, #0
	movs r0, #0x40
	bl func_fe6_0803F478
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_fe6_0803F514
func_fe6_0803F514: @ 0x0803F514
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, .L0803F530 @ =gUnk_Sio_085CADFC
	bl FindProc
	cmp r0, #0
	bne .L0803F528
	adds r0, r4, #0
	bl Proc_Break
.L0803F528:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0803F530: .4byte gUnk_Sio_085CADFC

	thumb_func_start func_fe6_0803F534
func_fe6_0803F534: @ 0x0803F534
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, .L0803F550 @ =gUnk_Sio_085CAE34
	bl FindProc
	cmp r0, #0
	bne .L0803F548
	adds r0, r4, #0
	bl Proc_Break
.L0803F548:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0803F550: .4byte gUnk_Sio_085CAE34

	thumb_func_start func_fe6_0803F554
func_fe6_0803F554: @ 0x0803F554
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, .L0803F5A0 @ =gUnk_Sio_085CAE6C
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r0, [r1]
	movs r1, #0xb0
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r1, [r4, #0x30]
	ldr r0, [r4, #0x34]
	ldrh r0, [r0, #2]
	movs r2, #0xd0
	lsls r2, r2, #7
	adds r0, r0, r2
	strh r0, [r1, #0x22]
	ldr r0, [r4, #0x34]
	ldrb r0, [r0, #1]
	adds r0, #0x10
	lsls r0, r0, #5
	ldr r1, .L0803F5A4 @ =gPal
	adds r0, r0, r1
	movs r1, #0x16
	movs r2, #0x14
	adds r3, r4, #0
	bl StartPalFade
	ldr r0, .L0803F5A8 @ =gUnk_Sio_085CAE84
	adds r1, r4, #0
	bl SpawnProc
	str r4, [r0, #0x2c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0803F5A0: .4byte gUnk_Sio_085CAE6C
.L0803F5A4: .4byte gPal
.L0803F5A8: .4byte gUnk_Sio_085CAE84

	thumb_func_start func_fe6_0803F5AC
func_fe6_0803F5AC: @ 0x0803F5AC
	ldr r0, [r0, #0x2c]
	ldr r2, [r0, #0x30]
	ldr r1, [r0, #0x34]
	movs r0, #0xf
	ldrb r3, [r1, #1]
	ands r0, r3
	lsls r0, r0, #0xc
	ldrh r1, [r1, #2]
	adds r0, r1, r0
	movs r1, #0x80
	lsls r1, r1, #4
	adds r0, r0, r1
	strh r0, [r2, #0x22]
	bx lr

	thumb_func_start func_fe6_0803F5C8
func_fe6_0803F5C8: @ 0x0803F5C8
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x39
	movs r5, #0
	movs r0, #7
	strb r0, [r1]
	ldr r0, .L0803F63C @ =ProcScr_MuDeathFade
	adds r1, r4, #0
	bl SpawnProc
	str r4, [r0, #0x54]
	adds r0, #0x64
	movs r3, #0
	movs r1, #0x20
	strh r1, [r0]
	ldr r1, .L0803F640 @ =gDispIo
	mov ip, r1
	mov r2, ip
	adds r2, #0x3c
	movs r1, #0x3f
	ldrb r6, [r2]
	ands r1, r6
	strb r1, [r2]
	ldrh r0, [r0]
	lsrs r1, r0, #1
	mov r0, ip
	adds r0, #0x44
	strb r1, [r0]
	mov r1, ip
	adds r1, #0x45
	movs r0, #0x10
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x46
	strb r3, [r0]
	ldr r0, [r4, #0x30]
	strh r5, [r0, #0x18]
	ldr r0, [r4, #0x30]
	strh r5, [r0, #0x1a]
	adds r0, r4, #0
	movs r1, #0
	bl func_fe6_0803F554
	ldr r1, [r4, #0x30]
	movs r0, #0xd
	strh r0, [r1, #0x1e]
	ldr r0, .L0803F644 @ =gPlaySt
	ldrb r0, [r0, #0x1d]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L0803F636
	movs r0, #0xd6
	bl m4aSongNumStart
.L0803F636:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L0803F63C: .4byte ProcScr_MuDeathFade
.L0803F640: .4byte gDispIo
.L0803F644: .4byte gPlaySt

	thumb_func_start func_fe6_0803F648
func_fe6_0803F648: @ 0x0803F648
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r1, [r5, #0x30]
	ldr r0, [r5, #0x34]
	ldrh r0, [r0, #2]
	movs r2, #0xd0
	lsls r2, r2, #7
	adds r0, r0, r2
	strh r0, [r1, #0x22]
	ldr r0, [r5, #0x34]
	ldrb r0, [r0, #1]
	adds r0, #0x10
	lsls r0, r0, #5
	ldr r1, .L0803F68C @ =gPal
	adds r0, r0, r1
	movs r1, #0xb0
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, .L0803F690 @ =gUnk_Sio_085CAE6C
	lsls r4, r4, #2
	adds r4, r4, r0
	ldr r0, [r4]
	movs r1, #0x16
	movs r2, #8
	adds r3, r5, #0
	bl StartPalFade
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0803F68C: .4byte gPal
.L0803F690: .4byte gUnk_Sio_085CAE6C

	thumb_func_start func_fe6_0803F694
func_fe6_0803F694: @ 0x0803F694
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x34]
	ldrb r0, [r0, #1]
	adds r0, #0x10
	lsls r0, r0, #5
	ldr r1, .L0803F6C0 @ =gPal
	adds r0, r0, r1
	movs r1, #0x16
	movs r2, #8
	adds r3, r4, #0
	bl StartPalFade
	ldr r0, .L0803F6C4 @ =ProcScr_MuRestorePalInfo
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x54]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0803F6C0: .4byte gPal
.L0803F6C4: .4byte ProcScr_MuRestorePalInfo

	thumb_func_start func_fe6_0803F6C8
func_fe6_0803F6C8: @ 0x0803F6C8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, .L0803F708 @ =Img_ManimWarp
	ldr r1, .L0803F70C @ =0x06004400
	bl Decompress
	ldr r0, .L0803F710 @ =Pal_ManimWarp
	movs r1, #0x60
	movs r2, #0x20
	bl ApplyPaletteExt
	adds r1, r4, #0
	adds r1, #0x40
	movs r0, #0
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq .L0803F700
	ldr r2, [r4, #0x34]
	lsls r2, r2, #3
	movs r0, #0x7f
	movs r1, #2
	bl StartPlayMuStepSe
.L0803F700:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0803F708: .4byte Img_ManimWarp
.L0803F70C: .4byte 0x06004400
.L0803F710: .4byte Pal_ManimWarp

	thumb_func_start func_fe6_0803F714
func_fe6_0803F714: @ 0x0803F714
	push {r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r7, r0, #0
	ldr r0, .L0803F7C8 @ =gBg2Tm
	ldr r1, [r7, #0x34]
	subs r1, #1
	ldr r2, [r7, #0x38]
	subs r2, #3
	ldr r3, .L0803F7CC @ =0x00003220
	movs r4, #4
	str r4, [sp]
	movs r4, #6
	str r4, [sp, #4]
	ldr r4, .L0803F7D0 @ =TsaRef_ManimWarp
	str r4, [sp, #8]
	ldr r6, .L0803F7D4 @ =gUnk_Sio_085CAE9C
	adds r5, r7, #0
	adds r5, #0x40
	ldrb r4, [r5]
	adds r4, r4, r6
	ldrb r4, [r4]
	str r4, [sp, #0xc]
	bl func_fe6_08014F70
	movs r0, #4
	bl EnableBgSync
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	adds r6, r0, r6
	ldrb r0, [r6]
	cmp r0, #0xff
	bne .L0803F75E
	adds r0, r7, #0
	bl Proc_Break
.L0803F75E:
	ldr r3, .L0803F7D8 @ =gDispIo
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r2, [r3, #0xc]
	ands r0, r2
	strb r0, [r3, #0xc]
	adds r0, r1, #0
	ldrb r4, [r3, #0x10]
	ands r0, r4
	strb r0, [r3, #0x10]
	ldrb r0, [r3, #0x14]
	ands r1, r0
	strb r1, [r3, #0x14]
	movs r0, #3
	ldrb r1, [r3, #0x18]
	orrs r0, r1
	strb r0, [r3, #0x18]
	adds r2, r3, #0
	adds r2, #0x3c
	ldr r0, .L0803F7DC @ =0x0000FFE0
	ldrh r4, [r3, #0x3c]
	ands r0, r4
	movs r1, #4
	orrs r0, r1
	ldr r1, .L0803F7E0 @ =0x0000E0FF
	ands r0, r1
	movs r4, #0xd8
	lsls r4, r4, #5
	adds r1, r4, #0
	orrs r0, r1
	strh r0, [r3, #0x3c]
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x44
	movs r1, #0xc
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r1, r3, #0
	adds r1, #0x46
	movs r0, #0
	strb r0, [r1]
	add sp, #0x10
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0803F7C8: .4byte gBg2Tm
.L0803F7CC: .4byte 0x00003220
.L0803F7D0: .4byte TsaRef_ManimWarp
.L0803F7D4: .4byte gUnk_Sio_085CAE9C
.L0803F7D8: .4byte gDispIo
.L0803F7DC: .4byte 0x0000FFE0
.L0803F7E0: .4byte 0x0000E0FF

	thumb_func_start func_fe6_0803F7E4
func_fe6_0803F7E4: @ 0x0803F7E4
	push {lr}
	ldr r0, .L0803F818 @ =gBg2Tm
	movs r1, #0
	bl TmFill
	movs r0, #4
	bl EnableBgSync
	ldr r3, .L0803F81C @ =gDispIo
	adds r1, r3, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r2, [r1]
	ands r0, r2
	strb r0, [r1]
	adds r1, #8
	movs r2, #0
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x45
	strb r2, [r0]
	adds r0, #1
	strb r2, [r0]
	pop {r0}
	bx r0
	.align 2, 0
.L0803F818: .4byte gBg2Tm
.L0803F81C: .4byte gDispIo

	thumb_func_start NewSioWarp
NewSioWarp: @ 0x0803F820
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, .L0803F84C @ =ProcScr_SIOWARP
	movs r1, #2
	bl SpawnProc
	ldr r2, [r4, #0x2c]
	movs r1, #0xe
	ldrsb r1, [r2, r1]
	lsls r1, r1, #1
	str r1, [r0, #0x34]
	movs r1, #0xf
	ldrsb r1, [r2, r1]
	lsls r1, r1, #1
	str r1, [r0, #0x38]
	adds r4, #0x41
	ldrb r1, [r4]
	adds r0, #0x41
	strb r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0803F84C: .4byte ProcScr_SIOWARP

	thumb_func_start SioWarpFx_0803F850
SioWarpFx_0803F850: @ 0x0803F850
	push {lr}
	ldr r0, [r0, #0x30]
	movs r1, #0
	bl func_fe6_0803F648
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start SioWarpFx_HideMoveUnit
SioWarpFx_HideMoveUnit: @ 0x0803F860
	push {lr}
	ldr r0, [r0, #0x30]
	bl HideMu
	pop {r0}
	bx r0

	thumb_func_start SioWarpFx_SetMUPosition
SioWarpFx_SetMUPosition: @ 0x0803F86C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x30]
	ldr r1, [r4, #0x34]
	lsls r1, r1, #4
	ldr r2, [r4, #0x38]
	lsls r2, r2, #4
	bl SetMuScreenPosition
	ldr r1, [r4, #0x2c]
	ldr r0, [r4, #0x34]
	strb r0, [r1, #0xe]
	ldr r1, [r4, #0x2c]
	ldr r0, [r4, #0x38]
	strb r0, [r1, #0xf]
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start SioWarpFx_ShowMoveUnit
SioWarpFx_ShowMoveUnit: @ 0x0803F890
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x3c]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq .L0803F8A4
	ldr r0, [r4, #0x30]
	bl SetMuFacing
.L0803F8A4:
	ldr r0, [r4, #0x30]
	bl ShowMu
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start SioWarpFx_0803F8B0
SioWarpFx_0803F8B0: @ 0x0803F8B0
	push {lr}
	ldr r0, [r0, #0x30]
	bl func_fe6_0803F694
	pop {r0}
	bx r0

	thumb_func_start SioWarpFx_AwaitSioWarp
SioWarpFx_AwaitSioWarp: @ 0x0803F8BC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, .L0803F8DC @ =ProcScr_SIOWARP
	bl FindProc
	rsbs r1, r0, #0
	orrs r1, r0
	cmp r1, #0
	blt .L0803F8D4
	adds r0, r4, #0
	bl Proc_Break
.L0803F8D4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0803F8DC: .4byte ProcScr_SIOWARP

	thumb_func_start NewSioWarpFx
NewSioWarpFx: @ 0x0803F8E0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	adds r6, r1, #0
	adds r7, r2, #0
	mov r8, r3
	ldr r0, [sp, #0x1c]
	ldr r1, [sp, #0x20]
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r1, #0
	beq .L0803F908
	ldr r0, .L0803F904 @ =ProcScr_SIOWARPFX
	bl SpawnProcLocking
	b .L0803F910
	.align 2, 0
.L0803F904: .4byte ProcScr_SIOWARPFX
.L0803F908:
	ldr r0, .L0803F934 @ =ProcScr_SIOWARPFX
	movs r1, #2
	bl SpawnProc
.L0803F910:
	adds r1, r0, #0
	str r5, [r1, #0x2c]
	str r6, [r1, #0x30]
	str r7, [r1, #0x34]
	mov r0, r8
	str r0, [r1, #0x38]
	ldr r0, [sp, #0x18]
	str r0, [r1, #0x3c]
	adds r0, r1, #0
	adds r0, #0x41
	strb r4, [r0]
	adds r0, r1, #0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
.L0803F934: .4byte ProcScr_SIOWARPFX

	thumb_func_start NewSioWarpFxPartial
NewSioWarpFxPartial: @ 0x0803F938
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	adds r6, r1, #0
	adds r7, r2, #0
	mov r8, r3
	ldr r0, [sp, #0x1c]
	ldr r1, [sp, #0x20]
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r1, #0
	beq .L0803F960
	ldr r0, .L0803F95C @ =ProcScr_SioWarpFxPartial
	bl SpawnProcLocking
	b .L0803F968
	.align 2, 0
.L0803F95C: .4byte ProcScr_SioWarpFxPartial
.L0803F960:
	ldr r0, .L0803F98C @ =ProcScr_SioWarpFxPartial
	movs r1, #2
	bl SpawnProc
.L0803F968:
	adds r1, r0, #0
	str r5, [r1, #0x2c]
	str r6, [r1, #0x30]
	str r7, [r1, #0x34]
	mov r0, r8
	str r0, [r1, #0x38]
	ldr r0, [sp, #0x18]
	str r0, [r1, #0x3c]
	adds r0, r1, #0
	adds r0, #0x41
	strb r4, [r0]
	adds r0, r1, #0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
.L0803F98C: .4byte ProcScr_SioWarpFxPartial

	thumb_func_start PutLinkArenaButtonSpriteAt
PutLinkArenaButtonSpriteAt: @ 0x0803F990
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r2, r1, #0
	ldr r3, .L0803F9B0 @ =Sprite_LinkArenaBButton
	movs r0, #0
	str r0, [sp]
	movs r0, #4
	adds r1, r4, #0
	bl PutSprite
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0803F9B0: .4byte Sprite_LinkArenaBButton

	thumb_func_start LAButtonSprites_Loop
LAButtonSprites_Loop: @ 0x0803F9B4
	push {lr}
	ldr r2, [r0, #0x2c]
	ldr r1, [r0, #0x30]
	adds r0, r2, #0
	bl PutLinkArenaButtonSpriteAt
	pop {r0}
	bx r0

	thumb_func_start StartLinkArenaButtonSpriteDraw
StartLinkArenaButtonSpriteDraw: @ 0x0803F9C4
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r6, r0, #0
	mov r8, r1
	adds r5, r2, #0
	ldr r4, .L0803F9F0 @ =ProcScr_LAButtonSpriteDraw
	adds r0, r4, #0
	bl Proc_EndEach
	adds r0, r4, #0
	adds r1, r5, #0
	bl SpawnProc
	str r6, [r0, #0x2c]
	mov r1, r8
	str r1, [r0, #0x30]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L0803F9F0: .4byte ProcScr_LAButtonSpriteDraw

	thumb_func_start EndLinkArenaButtonSpriteDraw
EndLinkArenaButtonSpriteDraw: @ 0x0803F9F4
	push {r4, lr}
	ldr r4, .L0803FA10 @ =ProcScr_LAButtonSpriteDraw
	adds r0, r4, #0
	bl FindProc
	cmp r0, #0
	beq .L0803FA08
	adds r0, r4, #0
	bl Proc_EndEach
.L0803FA08:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0803FA10: .4byte ProcScr_LAButtonSpriteDraw

	thumb_func_start InitSioBG
InitSioBG: @ 0x0803FA14
	push {r4, lr}
	sub sp, #0x18
	ldr r1, .L0803FA90 @ =gUnk_Sio_0810F442
	mov r0, sp
	movs r2, #0x18
	bl memcpy
	mov r0, sp
	bl InitBgs
	ldr r3, .L0803FA94 @ =gDispIo
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r2, [r3, #0xc]
	ands r0, r2
	strb r0, [r3, #0xc]
	adds r0, r1, #0
	ldrb r2, [r3, #0x10]
	ands r0, r2
	movs r2, #1
	orrs r0, r2
	strb r0, [r3, #0x10]
	ldrb r0, [r3, #0x14]
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	strb r1, [r3, #0x14]
	movs r0, #3
	ldrb r1, [r3, #0x18]
	orrs r0, r1
	strb r0, [r3, #0x18]
	bl ApplySystemGraphics
	ldr r0, .L0803FA98 @ =Pal_LinkArenaRankIcons
	movs r1, #0xc0
	lsls r1, r1, #2
	movs r2, #0x40
	bl ApplyPaletteExt
	ldr r4, .L0803FA9C @ =Img_MuralBackground
	movs r0, #3
	bl GetBgChrOffset
	adds r1, r0, #0
	movs r2, #0xc0
	lsls r2, r2, #0x13
	adds r1, r1, r2
	adds r0, r4, #0
	bl Decompress
	ldr r0, .L0803FAA0 @ =Pal_LinkArenaMuralBackground
	movs r1, #0xe0
	lsls r1, r1, #1
	movs r2, #0x40
	bl ApplyPaletteExt
	add sp, #0x18
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0803FA90: .4byte gUnk_Sio_0810F442
.L0803FA94: .4byte gDispIo
.L0803FA98: .4byte Pal_LinkArenaRankIcons
.L0803FA9C: .4byte Img_MuralBackground
.L0803FAA0: .4byte Pal_LinkArenaMuralBackground

	thumb_func_start Sio_RestartBgSlide
Sio_RestartBgSlide: @ 0x0803FAA4
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r5, r1, #0
	ldr r4, .L0803FAF8 @ =gBg3Tm
	ldr r0, .L0803FAFC @ =ProcScr_BackgroundSlide
	bl Proc_EndEach
	movs r2, #0
	movs r0, #0x14
	subs r0, r0, r5
	lsls r0, r0, #5
	cmp r2, r0
	bge .L0803FAD0
	ldr r1, .L0803FB00 @ =0xFFFFE000
	adds r3, r1, #0
	adds r1, r0, #0
.L0803FAC4:
	adds r0, r2, r3
	strh r0, [r4]
	adds r4, #2
	adds r2, #1
	cmp r2, r1
	blt .L0803FAC4
.L0803FAD0:
	movs r2, #0
	lsls r1, r5, #5
	ldr r5, .L0803FAFC @ =ProcScr_BackgroundSlide
	cmp r2, r1
	bge .L0803FAEA
	ldr r0, .L0803FB04 @ =0xFFFFF000
	adds r3, r0, #0
.L0803FADE:
	adds r0, r2, r3
	strh r0, [r4]
	adds r4, #2
	adds r2, #1
	cmp r2, r1
	blt .L0803FADE
.L0803FAEA:
	adds r0, r5, #0
	adds r1, r6, #0
	bl SpawnProc
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L0803FAF8: .4byte gBg3Tm
.L0803FAFC: .4byte ProcScr_BackgroundSlide
.L0803FB00: .4byte 0xFFFFE000
.L0803FB04: .4byte 0xFFFFF000

	thumb_func_start func_fe6_0803FB08
func_fe6_0803FB08: @ 0x0803FB08
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x28
	mov r8, r0
	ldr r1, .L0803FB64 @ =gUnk_Sio_0810F45A
	mov r0, sp
	movs r2, #0x28
	bl memcpy
	ldr r4, .L0803FB68 @ =gBg3Tm
	ldr r0, .L0803FB6C @ =ProcScr_BackgroundSlide
	bl Proc_EndEach
	movs r2, #0
	movs r6, #0xf
	ldr r5, .L0803FB70 @ =0x0000027F
.L0803FB2A:
	adds r0, r2, #0
	adds r3, r4, #0
	adds r4, r3, #2
	cmp r2, #0
	bge .L0803FB36
	adds r0, #0x1f
.L0803FB36:
	asrs r0, r0, #5
	lsls r0, r0, #1
	mov r7, sp
	adds r1, r7, r0
	adds r0, r6, #0
	ldrh r1, [r1]
	ands r0, r1
	lsls r0, r0, #0xc
	adds r0, r2, r0
	strh r0, [r3]
	adds r2, #1
	cmp r2, r5
	ble .L0803FB2A
	ldr r0, .L0803FB6C @ =ProcScr_BackgroundSlide
	mov r1, r8
	bl SpawnProc
	add sp, #0x28
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0803FB64: .4byte gUnk_Sio_0810F45A
.L0803FB68: .4byte gBg3Tm
.L0803FB6C: .4byte ProcScr_BackgroundSlide
.L0803FB70: .4byte 0x0000027F

	thumb_func_start Sio_EndBackgroundSlide
Sio_EndBackgroundSlide: @ 0x0803FB74
	push {lr}
	ldr r0, .L0803FB80 @ =ProcScr_BackgroundSlide
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
.L0803FB80: .4byte ProcScr_BackgroundSlide

	thumb_func_start SioCopyVRAM
SioCopyVRAM: @ 0x0803FB84
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	adds r5, r1, #0
	lsls r2, r2, #5
	mov r8, r2
	cmp r3, #0
	ble .L0803FBBA
	movs r7, #0x80
	lsls r7, r7, #3
	adds r4, r3, #0
.L0803FB9C:
	mov r2, r8
	cmp r2, #0
	bge .L0803FBA4
	adds r2, #3
.L0803FBA4:
	lsls r2, r2, #9
	lsrs r2, r2, #0xb
	adds r0, r6, #0
	adds r1, r5, #0
	bl CpuFastSet
	adds r6, r6, r7
	adds r5, r5, r7
	subs r4, #1
	cmp r4, #0
	bne .L0803FB9C
.L0803FBBA:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start func_fe6_0803FBC4
func_fe6_0803FBC4: @ 0x0803FBC4
	push {r4, r5, r6, lr}
	ldr r0, [r0, #0x58]
	movs r6, #3
	ands r6, r0
	cmp r0, #0
	bge .L0803FBD2
	adds r0, #3
.L0803FBD2:
	asrs r4, r0, #2
	ldr r0, .L0803FC08 @ =gUnk_08106784
	ldr r5, .L0803FC0C @ =gBuf
	adds r1, r5, #0
	bl Decompress
	lsls r0, r6, #8
	lsls r4, r4, #0xb
	adds r0, r0, r4
	adds r0, r0, r5
	ldr r1, .L0803FC10 @ =0x06014000
	movs r2, #8
	movs r3, #2
	bl SioCopyVRAM
	ldr r0, .L0803FC14 @ =gBg2Tm
	ldr r1, .L0803FC18 @ =gUnk_08109D78
	movs r2, #0x80
	lsls r2, r2, #5
	bl TmApplyTsa_thm
	movs r0, #4
	bl EnableBgSync
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L0803FC08: .4byte gUnk_08106784
.L0803FC0C: .4byte gBuf
.L0803FC10: .4byte 0x06014000
.L0803FC14: .4byte gBg2Tm
.L0803FC18: .4byte gUnk_08109D78

	thumb_func_start func_fe6_0803FC1C
func_fe6_0803FC1C: @ 0x0803FC1C
	push {lr}
	sub sp, #4
	ldr r3, .L0803FC38 @ =gUnk_Sio_085CAFB4
	movs r0, #0
	str r0, [sp]
	movs r0, #4
	movs r1, #0x28
	movs r2, #8
	bl PutSpriteExt
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
.L0803FC38: .4byte gUnk_Sio_085CAFB4

	thumb_func_start StartLinkArenaTitleBanner
StartLinkArenaTitleBanner: @ 0x0803FC3C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	ldr r4, .L0803FC5C @ =gUnk_Sio_085CAFC4
	adds r0, r4, #0
	bl Proc_EndEach
	adds r0, r4, #0
	adds r1, r5, #0
	bl SpawnProc
	str r6, [r0, #0x58]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L0803FC5C: .4byte gUnk_Sio_085CAFC4

	thumb_func_start func_fe6_0803FC60
func_fe6_0803FC60: @ 0x0803FC60
	push {lr}
	ldr r0, .L0803FC6C @ =gUnk_Sio_085CAFC4
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
.L0803FC6C: .4byte gUnk_Sio_085CAFC4

	thumb_func_start func_fe6_0803FC70
func_fe6_0803FC70: @ 0x0803FC70
	ldr r3, .L0803FCB0 @ =gDispIo
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r1, r3, #0
	adds r1, #0x44
	movs r2, #0
	movs r0, #8
	strb r0, [r1]
	adds r1, #1
	movs r0, #0xf
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x46
	strb r2, [r0]
	ldr r0, .L0803FCB4 @ =0x0000FFE0
	ldrh r2, [r3, #0x3c]
	ands r0, r2
	ldr r1, .L0803FCB8 @ =0x0000E0FF
	ands r0, r1
	movs r2, #0x80
	lsls r2, r2, #4
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r3, #0x3c]
	bx lr
	.align 2, 0
.L0803FCB0: .4byte gDispIo
.L0803FCB4: .4byte 0x0000FFE0
.L0803FCB8: .4byte 0x0000E0FF

	thumb_func_start func_fe6_0803FCBC
func_fe6_0803FCBC: @ 0x0803FCBC
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r5, r0, #0
	ldr r0, .L0803FD38 @ =0x00007E08
	mov sb, r0
	ldr r2, [r5, #0x2c]
	ldr r0, [r5, #0x34]
	adds r2, r2, r0
	asrs r2, r2, #1
	ldr r0, [r5, #0x30]
	ldr r1, [r5, #0x38]
	adds r0, r0, r1
	asrs r0, r0, #1
	mov r8, r0
	str r2, [r5, #0x34]
	str r0, [r5, #0x38]
	movs r7, #0
	adds r6, r2, #0
.L0803FCE6:
	ldr r4, [r5, #0x40]
	adds r0, r4, #0
	cmp r4, #0
	bge .L0803FCF0
	adds r0, r4, #7
.L0803FCF0:
	asrs r0, r0, #3
	adds r0, r0, r7
	ldr r1, [r5, #0x3c]
	bl __modsi3
	movs r1, #7
	ands r4, r1
	subs r1, r6, r4
	add r0, sb
	str r0, [sp]
	movs r0, #0xc
	mov r2, r8
	ldr r3, .L0803FD3C @ =gUnk_Sio_085CAFE4
	bl PutSprite
	adds r6, #8
	adds r7, #1
	cmp r7, #0x1f
	ble .L0803FCE6
	ldr r1, [r5, #0x40]
	adds r1, #1
	str r1, [r5, #0x40]
	ldr r0, [r5, #0x3c]
	lsls r0, r0, #3
	cmp r1, r0
	bne .L0803FD28
	movs r0, #0
	str r0, [r5, #0x40]
.L0803FD28:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0803FD38: .4byte 0x00007E08
.L0803FD3C: .4byte gUnk_Sio_085CAFE4

	thumb_func_start func_fe6_0803FD40
func_fe6_0803FD40: @ 0x0803FD40
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r7, r0, #0
	adds r6, r1, #0
	mov r8, r2
	mov sb, r3
	ldr r0, .L0803FDC4 @ =gUnk_081065C8
	ldr r1, .L0803FDC8 @ =gBuf
	bl Decompress
	movs r4, #0
	cmp r4, r6
	bge .L0803FD84
	ldr r5, .L0803FDCC @ =0x06014100
.L0803FD60:
	adds r0, r4, #0
	adds r1, r6, #0
	bl __modsi3
	adds r0, r7, r0
	ldrb r0, [r0]
	lsls r0, r0, #5
	ldr r1, .L0803FDC8 @ =gBuf
	adds r0, r0, r1
	adds r1, r5, #0
	movs r2, #1
	movs r3, #2
	bl SioCopyVRAM
	adds r5, #0x20
	adds r4, #1
	cmp r4, r6
	blt .L0803FD60
.L0803FD84:
	ldr r0, [sp, #0x1c]
	lsls r0, r0, #5
	ldr r1, .L0803FDD0 @ =gUnk_08109B00
	adds r0, r0, r1
	movs r1, #0xb8
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r4, .L0803FDD4 @ =gUnk_Sio_085CAFEC
	adds r0, r4, #0
	bl Proc_EndEach
	adds r0, r4, #0
	ldr r1, [sp, #0x20]
	bl SpawnProc
	mov r1, r8
	str r1, [r0, #0x2c]
	str r1, [r0, #0x34]
	mov r1, sb
	str r1, [r0, #0x30]
	str r1, [r0, #0x38]
	str r6, [r0, #0x3c]
	movs r1, #0
	str r1, [r0, #0x40]
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0803FDC4: .4byte gUnk_081065C8
.L0803FDC8: .4byte gBuf
.L0803FDCC: .4byte 0x06014100
.L0803FDD0: .4byte gUnk_08109B00
.L0803FDD4: .4byte gUnk_Sio_085CAFEC

	thumb_func_start func_fe6_0803FDD8
func_fe6_0803FDD8: @ 0x0803FDD8
	push {lr}
	ldr r2, .L0803FE04 @ =gDispIo
	adds r1, r2, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r3, [r1]
	ands r0, r3
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x44
	movs r1, #0
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	ldr r0, .L0803FE08 @ =gUnk_Sio_085CAFEC
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
.L0803FE04: .4byte gDispIo
.L0803FE08: .4byte gUnk_Sio_085CAFEC

	thumb_func_start func_fe6_0803FE0C
func_fe6_0803FE0C: @ 0x0803FE0C
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, .L0803FE24 @ =gUnk_Sio_085CAFEC
	bl FindProc
	str r4, [r0, #0x2c]
	str r5, [r0, #0x30]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0803FE24: .4byte gUnk_Sio_085CAFEC

	thumb_func_start func_fe6_0803FE28
func_fe6_0803FE28: @ 0x0803FE28
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, .L0803FE44 @ =gUnk_Sio_085CAFEC
	bl FindProc
	str r4, [r0, #0x34]
	str r4, [r0, #0x2c]
	str r5, [r0, #0x38]
	str r5, [r0, #0x30]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0803FE44: .4byte gUnk_Sio_085CAFEC

	thumb_func_start func_fe6_0803FE48
func_fe6_0803FE48: @ 0x0803FE48
	push {lr}
	lsls r0, r0, #5
	ldr r1, .L0803FE60 @ =gUnk_08109B00
	adds r0, r0, r1
	movs r1, #0xb8
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	pop {r0}
	bx r0
	.align 2, 0
.L0803FE60: .4byte gUnk_08109B00

	thumb_func_start func_fe6_0803FE64
func_fe6_0803FE64: @ 0x0803FE64
	push {r4, lr}
	sub sp, #0x20
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r1, .L0803FEA8 @ =gUnk_Sio_0810F50A
	mov r0, sp
	movs r2, #0x20
	bl memcpy
	ldr r0, .L0803FEAC @ =Unk_Sio_0203C9D0
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne .L0803FEA0
	mov r1, sp
	adds r0, r1, r4
	ldrb r2, [r0]
	adds r2, #0x10
	ldr r3, .L0803FEB0 @ =gPal
	lsls r0, r2, #0xa
	lsls r1, r2, #5
	adds r0, r0, r1
	adds r0, r0, r2
	movs r1, #0x9f
	lsls r1, r1, #2
	adds r3, r3, r1
	strh r0, [r3]
	bl EnablePalSync
.L0803FEA0:
	add sp, #0x20
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0803FEA8: .4byte gUnk_Sio_0810F50A
.L0803FEAC: .4byte Unk_Sio_0203C9D0
.L0803FEB0: .4byte gPal

	thumb_func_start func_fe6_0803FEB4
func_fe6_0803FEB4: @ 0x0803FEB4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r7, r0, #0
	ldr r0, .L0803FFF8 @ =0x000082DA
	mov r8, r0
	movs r2, #0x2a
	ldrsh r1, [r7, r2]
	movs r3, #0x2c
	ldrsh r2, [r7, r3]
	ldr r3, .L0803FFFC @ =gUnk_Sio_085CB00C
	adds r0, r7, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r3
	ldr r3, [r0]
	ldr r4, .L08040000 @ =gUnk_Sio_0810F4C8
	adds r5, r7, #0
	adds r5, #0x2e
	ldrb r6, [r5]
	lsls r0, r6, #1
	adds r0, r0, r4
	ldrh r0, [r0]
	str r0, [sp]
	movs r0, #4
	bl PutSprite
	ldrb r5, [r5]
	cmp r5, #2
	bne .L0803FEFE
	adds r0, r7, #0
	adds r0, #0x30
	ldrb r0, [r0]
	bl func_fe6_0803FE64
.L0803FEFE:
	adds r2, r7, #0
	adds r2, #0x30
	ldrb r0, [r2]
	adds r0, #1
	movs r1, #0x1f
	ands r0, r1
	strb r0, [r2]
	movs r0, #0x81
	lsls r0, r0, #1
	ldrh r1, [r7, #0x2e]
	cmp r1, r0
	bne .L0803FFEC
	ldrh r1, [r7, #0x3a]
	ldrh r2, [r7, #0x36]
	adds r0, r1, r2
	strh r0, [r7, #0x36]
	ldrh r2, [r7, #0x3c]
	ldrh r3, [r7, #0x38]
	adds r0, r2, r3
	strh r0, [r7, #0x38]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	cmp r0, #4
	ble .L0803FF32
	subs r0, r1, #1
	strh r0, [r7, #0x3a]
.L0803FF32:
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	cmp r0, #4
	ble .L0803FF3E
	subs r0, r2, #1
	strh r0, [r7, #0x3c]
.L0803FF3E:
	bl GetGameTime
	movs r1, #3
	ands r1, r0
	cmp r1, #0
	bne .L0803FF66
	ldrh r1, [r7, #0x32]
	movs r6, #0x32
	ldrsh r0, [r7, r6]
	cmp r0, #0
	bge .L0803FF58
	adds r0, r1, #1
	strh r0, [r7, #0x32]
.L0803FF58:
	ldrh r1, [r7, #0x34]
	movs r2, #0x34
	ldrsh r0, [r7, r2]
	cmp r0, #0x34
	ble .L0803FF66
	subs r0, r1, #1
	strh r0, [r7, #0x34]
.L0803FF66:
	movs r3, #0x2a
	ldrsh r5, [r7, r3]
	movs r6, #0x32
	ldrsh r0, [r7, r6]
	adds r0, #0x3b
	adds r5, r5, r0
	movs r0, #0x2c
	ldrsh r4, [r7, r0]
	adds r4, #8
	ldr r6, .L08040004 @ =Sprite_8x16
	ldrh r1, [r7, #0x36]
	lsrs r0, r1, #5
	movs r1, #6
	bl __umodsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	add r0, r8
	str r0, [sp]
	movs r0, #4
	adds r1, r5, #0
	adds r2, r4, #0
	adds r3, r6, #0
	bl PutSprite
	movs r2, #0x2a
	ldrsh r5, [r7, r2]
	movs r3, #0x34
	ldrsh r0, [r7, r3]
	adds r0, #0x3b
	adds r5, r5, r0
	movs r6, #0x2c
	ldrsh r4, [r7, r6]
	adds r4, #8
	ldr r6, .L08040008 @ =Sprite_8x16_HFlipped
	ldrh r1, [r7, #0x38]
	lsrs r0, r1, #5
	movs r1, #6
	bl __umodsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	add r0, r8
	str r0, [sp]
	movs r0, #4
	adds r1, r5, #0
	adds r2, r4, #0
	adds r3, r6, #0
	bl PutSprite
	movs r2, #0x2a
	ldrsh r1, [r7, r2]
	adds r1, #0x40
	movs r3, #0x2c
	ldrsh r2, [r7, r3]
	adds r2, #8
	ldr r3, .L0804000C @ =gUnk_Sio_085CB020
	ldr r0, .L08040010 @ =gLinkArenaSt
	ldrb r0, [r0, #5]
	lsls r0, r0, #2
	adds r0, r0, r3
	ldr r3, [r0]
	movs r0, #0
	str r0, [sp]
	movs r0, #4
	bl PutSpriteExt
.L0803FFEC:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0803FFF8: .4byte 0x000082DA
.L0803FFFC: .4byte gUnk_Sio_085CB00C
.L08040000: .4byte gUnk_Sio_0810F4C8
.L08040004: .4byte Sprite_8x16
.L08040008: .4byte Sprite_8x16_HFlipped
.L0804000C: .4byte gUnk_Sio_085CB020
.L08040010: .4byte gLinkArenaSt

	thumb_func_start func_fe6_08040014
func_fe6_08040014: @ 0x08040014
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #4
	mov r8, r0
	adds r4, r1, #0
	adds r5, r2, #0
	adds r2, r3, #0
	ldr r6, [sp, #0x18]
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	ldr r0, .L08040080 @ =gUnk_Sio_085CB02C
	mov r1, r8
	str r2, [sp]
	bl SpawnProc
	mov r8, r0
	movs r3, #0
	movs r1, #0
	strh r4, [r0, #0x2a]
	strh r5, [r0, #0x2c]
	adds r0, #0x2e
	strb r6, [r0]
	adds r0, #1
	ldr r2, [sp]
	strb r2, [r0]
	mov r0, r8
	strh r1, [r0, #0x32]
	movs r0, #0x34
	mov r2, r8
	strh r0, [r2, #0x34]
	strh r1, [r2, #0x38]
	strh r1, [r2, #0x36]
	movs r0, #4
	strh r0, [r2, #0x3c]
	strh r0, [r2, #0x3a]
	mov r0, r8
	adds r0, #0x3e
	strb r3, [r0]
	subs r0, #0xe
	strb r3, [r0]
	mov r0, r8
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
.L08040080: .4byte gUnk_Sio_085CB02C

	thumb_func_start func_fe6_08040084
func_fe6_08040084: @ 0x08040084
	push {r4, lr}
	ldr r4, [sp, #8]
	strh r1, [r0, #0x32]
	strh r2, [r0, #0x34]
	strh r3, [r0, #0x3a]
	strh r4, [r0, #0x3c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_fe6_08040098
func_fe6_08040098: @ 0x08040098
	strh r1, [r0, #0x2a]
	strh r2, [r0, #0x2c]
	bx lr
	.align 2, 0

	thumb_func_start func_fe6_080400A0
func_fe6_080400A0: @ 0x080400A0
	push {r4, lr}
	sub sp, #0x20
	ldr r4, .L080400E8 @ =gUnk_08109BC0
	ldr r1, .L080400EC @ =gUnk_Sio_0810F50A
	mov r0, sp
	movs r2, #0x20
	bl memcpy
	ldr r0, .L080400F0 @ =Unk_Sio_0203C9D0
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne .L080400DE
	bl GetGameTime
	movs r1, #0x3f
	ands r1, r0
	asrs r1, r1, #1
	mov r2, sp
	adds r0, r2, r1
	ldr r1, .L080400F4 @ =gPal
	ldrb r0, [r0]
	lsls r0, r0, #1
	adds r0, r0, r4
	ldrh r0, [r0]
	ldr r2, .L080400F8 @ =0x0000033E
	adds r1, r1, r2
	strh r0, [r1]
	bl EnablePalSync
.L080400DE:
	add sp, #0x20
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L080400E8: .4byte gUnk_08109BC0
.L080400EC: .4byte gUnk_Sio_0810F50A
.L080400F0: .4byte Unk_Sio_0203C9D0
.L080400F4: .4byte gPal
.L080400F8: .4byte 0x0000033E

	thumb_func_start func_fe6_080400FC
func_fe6_080400FC: @ 0x080400FC
	push {r4, lr}
	sub sp, #0x20
	ldr r4, .L08040144 @ =gUnk_08109C20
	ldr r1, .L08040148 @ =gUnk_Sio_0810F50A
	mov r0, sp
	movs r2, #0x20
	bl memcpy
	ldr r0, .L0804014C @ =Unk_Sio_0203C9D0
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne .L0804013C
	bl GetGameTime
	movs r1, #0x3f
	ands r1, r0
	asrs r1, r1, #1
	mov r2, sp
	adds r0, r2, r1
	ldr r1, .L08040150 @ =gPal
	ldrb r0, [r0]
	lsls r0, r0, #1
	adds r0, r0, r4
	ldrh r0, [r0]
	movs r2, #0x9f
	lsls r2, r2, #2
	adds r1, r1, r2
	strh r0, [r1]
	bl EnablePalSync
.L0804013C:
	add sp, #0x20
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08040144: .4byte gUnk_08109C20
.L08040148: .4byte gUnk_Sio_0810F50A
.L0804014C: .4byte Unk_Sio_0203C9D0
.L08040150: .4byte gPal

	thumb_func_start func_fe6_08040154
func_fe6_08040154: @ 0x08040154
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r7, r0, #0
	ldr r0, .L08040194 @ =gLinkArenaSt
	ldrb r0, [r0]
	cmp r0, #1
	beq .L0804016C
	b .L080402DC
.L0804016C:
	adds r0, r7, #0
	adds r0, #0x44
	movs r1, #0
	ldrsb r1, [r0, r1]
	movs r2, #0xc0
	lsls r2, r2, #4
	mov r8, r2
	str r0, [sp, #4]
	cmp r1, #0
	beq .L08040186
	movs r0, #0x80
	lsls r0, r0, #3
	mov r8, r0
.L08040186:
	ldr r3, .L08040198 @ =gUnk_Sio_085CB044
	cmp r1, #0
	beq .L0804019C
	movs r0, #0x80
	lsls r0, r0, #4
	b .L080401A0
	.align 2, 0
.L08040194: .4byte gLinkArenaSt
.L08040198: .4byte gUnk_Sio_085CB044
.L0804019C:
	movs r0, #0x80
	lsls r0, r0, #3
.L080401A0:
	str r0, [sp]
	movs r0, #0xb
	movs r1, #0x50
	movs r2, #0x20
	bl PutSprite
	movs r6, #0
	ldr r0, [r7, #0x2c]
	cmp r6, r0
	bge .L08040202
	movs r5, #0x20
.L080401B6:
	lsls r1, r6, #1
	adds r0, r7, #0
	adds r0, #0x30
	adds r4, r0, r1
	movs r2, #0
	ldrsh r1, [r4, r2]
	adds r1, #8
	movs r0, #0xf
	ands r0, r6
	lsls r0, r0, #0xc
	add r0, r8
	str r0, [sp]
	movs r0, #4
	adds r2, r5, #0
	ldr r3, .L080402BC @ =Sprite_LinkArena_NAMEBANNER
	bl PutSprite
	adds r0, r7, #0
	adds r0, #0x3a
	adds r0, r0, r6
	ldrb r0, [r0]
	cmp r0, #0
	beq .L080401F8
	movs r0, #0
	ldrsh r1, [r4, r0]
	adds r1, #8
	mov r2, r8
	str r2, [sp]
	movs r0, #4
	adds r2, r5, #0
	ldr r3, .L080402C0 @ =gUnk_Sio_0810F544
	bl PutSprite
.L080401F8:
	adds r5, #0x18
	adds r6, #1
	ldr r0, [r7, #0x2c]
	cmp r6, r0
	blt .L080401B6
.L08040202:
	ldr r0, [r7, #0x40]
	cmp r0, #0
	beq .L080402B4
	ldr r0, .L080402C4 @ =Unk_Sio_0203C9D0
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne .L08040232
	bl GetGameTime
	ldr r2, .L080402C8 @ =gPal
	movs r1, #0x3f
	ands r1, r0
	lsrs r1, r1, #2
	lsls r1, r1, #1
	ldr r0, .L080402CC @ =Pal_0831AAFC
	adds r1, r1, r0
	ldrh r0, [r1]
	ldr r1, .L080402D0 @ =0x0000031A
	adds r2, r2, r1
	strh r0, [r2]
	bl EnablePalSync
.L08040232:
	ldr r0, [r7, #0x40]
	cmp r0, #0xff
	bgt .L0804023C
	adds r0, #0x10
	str r0, [r7, #0x40]
.L0804023C:
	ldr r4, .L080402D4 @ =gSinLut
	movs r2, #0x80
	adds r2, r2, r4
	mov sb, r2
	movs r1, #0
	ldrsh r0, [r2, r1]
	lsls r0, r0, #4
	movs r2, #0x80
	lsls r2, r2, #1
	mov r8, r2
	mov r1, r8
	bl Div
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	movs r1, #0
	ldrsh r0, [r4, r1]
	rsbs r0, r0, #0
	lsls r0, r0, #4
	ldr r1, [r7, #0x40]
	bl Div
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	movs r2, #0
	ldrsh r0, [r4, r2]
	lsls r0, r0, #4
	mov r1, r8
	bl Div
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	mov r1, sb
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #4
	ldr r1, [r7, #0x40]
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	movs r0, #0
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl SetObjAffine
	ldr r3, .L080402D8 @ =gUnk_Sio_0810F55E
	movs r0, #0x80
	lsls r0, r0, #8
	str r0, [sp]
	movs r0, #4
	movs r1, #0x78
	movs r2, #0
	bl PutSprite
.L080402B4:
	bl func_fe6_080400FC
	b .L0804036A
	.align 2, 0
.L080402BC: .4byte Sprite_LinkArena_NAMEBANNER
.L080402C0: .4byte gUnk_Sio_0810F544
.L080402C4: .4byte Unk_Sio_0203C9D0
.L080402C8: .4byte gPal
.L080402CC: .4byte Pal_0831AAFC
.L080402D0: .4byte 0x0000031A
.L080402D4: .4byte gSinLut
.L080402D8: .4byte gUnk_Sio_0810F55E
.L080402DC:
	ldr r3, .L08040344 @ =gUnk_Sio_085CB044
	movs r0, #0
	str r0, [sp]
	movs r0, #0xb
	movs r1, #0x50
	movs r2, #0x20
	bl PutSprite
	movs r6, #0
	ldr r0, [r7, #0x2c]
	adds r1, r7, #0
	adds r1, #0x44
	str r1, [sp, #4]
	cmp r6, r0
	bge .L08040366
	ldr r2, .L08040348 @ =gUnk_Sio_085CB0B4
	mov sl, r2
	movs r0, #8
	rsbs r0, r0, #0
	mov sb, r0
	movs r1, #0x28
	mov r8, r1
.L08040308:
	lsls r1, r6, #1
	adds r0, r7, #0
	adds r0, #0x30
	adds r5, r0, r1
	movs r2, #0
	ldrsh r1, [r5, r2]
	adds r4, r7, #0
	adds r4, #0x3a
	adds r4, r4, r6
	ldrb r2, [r4]
	lsls r0, r2, #2
	add r0, sl
	ldr r3, [r0]
	movs r0, #0
	str r0, [sp]
	movs r0, #2
	mov r2, r8
	bl PutSprite
	ldrb r0, [r4]
	cmp r0, #0
	beq .L0804034C
	ldrh r1, [r5]
	movs r2, #0
	ldrsh r0, [r5, r2]
	cmp r0, #0
	bge .L0804035A
	adds r0, r1, #1
	b .L08040358
	.align 2, 0
.L08040344: .4byte gUnk_Sio_085CB044
.L08040348: .4byte gUnk_Sio_085CB0B4
.L0804034C:
	ldrh r1, [r5]
	movs r2, #0
	ldrsh r0, [r5, r2]
	cmp r0, sb
	ble .L0804035A
	subs r0, r1, #1
.L08040358:
	strh r0, [r5]
.L0804035A:
	movs r0, #0x10
	add r8, r0
	adds r6, #1
	ldr r0, [r7, #0x2c]
	cmp r6, r0
	blt .L08040308
.L08040366:
	bl func_fe6_080400A0
.L0804036A:
	ldr r0, .L080403B8 @ =gLinkArenaSt
	movs r1, #0x80
	lsls r1, r1, #4
	mov r8, r1
	ldrb r0, [r0]
	cmp r0, #1
	bne .L0804037E
	movs r2, #0x80
	lsls r2, r2, #3
	mov r8, r2
.L0804037E:
	ldr r1, [sp, #4]
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	beq .L08040390
	movs r0, #0xc0
	movs r1, #0x10
	bl PutLinkArenaButtonSpriteAt
.L08040390:
	ldr r0, [r7, #0x48]
	cmp r0, #0
	blt .L080403A8
	adds r2, r0, #0
	adds r2, #8
	ldr r3, .L080403BC @ =gUnk_Sio_085CB07A
	mov r0, r8
	str r0, [sp]
	movs r0, #4
	movs r1, #0x50
	bl PutSprite
.L080403A8:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L080403B8: .4byte gLinkArenaSt
.L080403BC: .4byte gUnk_Sio_085CB07A

	thumb_func_start func_fe6_080403C0
func_fe6_080403C0: @ 0x080403C0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	adds r6, r0, #0
	adds r5, r1, #0
	mov r8, r2
	ldr r4, .L08040460 @ =gUnk_Sio_085CB0BC
	adds r0, r4, #0
	bl Proc_EndEach
	adds r0, r4, #0
	adds r1, r6, #0
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x2c]
	adds r1, r4, #0
	adds r1, #0x44
	movs r2, #0
	movs r0, #1
	strb r0, [r1]
	str r2, [r4, #0x40]
	subs r0, #2
	str r0, [r4, #0x48]
	movs r3, #0
	adds r5, r4, #0
	adds r5, #0x3a
	ldr r0, .L08040464 @ =0x0000FFF8
	mov ip, r0
	adds r2, r4, #0
	adds r2, #0x30
.L08040400:
	adds r0, r5, r3
	mov r7, r8
	adds r1, r7, r3
	ldrb r1, [r1]
	strb r1, [r0]
	mov r0, ip
	strh r0, [r2]
	adds r2, #2
	adds r3, #1
	cmp r3, #4
	ble .L08040400
	ldr r2, [r6, #0x38]
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	adds r0, r6, #0
	adds r0, #0x4a
	ldrb r0, [r0]
	adds r0, #0x28
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	str r4, [sp, #4]
	movs r0, #0xe0
	movs r1, #0x28
	movs r3, #6
	bl func_fe6_08040A80
	adds r0, r6, #0
	adds r0, #0x48
	ldrb r0, [r0]
	lsls r0, r0, #4
	movs r1, #0x28
	subs r1, r1, r0
	ldr r0, [r6, #0x38]
	str r0, [sp]
	str r4, [sp, #4]
	movs r0, #0x98
	movs r2, #0x88
	movs r3, #0x27
	bl func_fe6_080404E8
	adds r0, r4, #0
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
.L08040460: .4byte gUnk_Sio_085CB0BC
.L08040464: .4byte 0x0000FFF8

	thumb_func_start func_fe6_08040468
func_fe6_08040468: @ 0x08040468
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r4, r0, #0
	movs r0, #0
	mov r8, r0
	b .L080404D0
.L0804047C:
	mov r1, r8
	lsls r0, r1, #4
	ldr r1, [r4, #0x30]
	adds r5, r1, r0
	ldr r0, [r4, #0x38]
	movs r1, #1
	add r1, r8
	mov sl, r1
	cmp r5, r0
	bge .L080404CE
	ldr r0, [r4, #0x34]
	cmp r5, r0
	ble .L080404CE
	movs r6, #0
	mov r0, r8
	lsls r0, r0, #2
	mov sb, r0
	movs r7, #0
.L080404A0:
	mov r0, sb
	add r0, r8
	adds r0, r0, r6
	adds r0, #1
	bl GetUnit
	adds r2, r0, #0
	ldr r0, [r2]
	cmp r0, #0
	beq .L080404C6
	ldr r1, [r4, #0x2c]
	adds r1, r1, r7
	str r2, [sp]
	movs r0, #4
	adds r2, r5, #0
	movs r3, #0x80
	lsls r3, r3, #3
	bl PutUnitSpriteExt
.L080404C6:
	adds r7, #0xe
	adds r6, #1
	cmp r6, #4
	ble .L080404A0
.L080404CE:
	mov r8, sl
.L080404D0:
	ldr r0, [r4, #0x3c]
	cmp r8, r0
	blt .L0804047C
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_fe6_080404E8
func_fe6_080404E8: @ 0x080404E8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	mov sb, r0
	mov sl, r1
	adds r7, r2, #0
	mov r8, r3
	ldr r6, [sp, #0x20]
	ldr r5, [sp, #0x24]
	ldr r4, .L0804052C @ =gUnk_Sio_085CB0D4
	adds r0, r4, #0
	bl Proc_EndEach
	adds r0, r4, #0
	adds r1, r5, #0
	bl SpawnProc
	str r6, [r0, #0x3c]
	mov r1, sb
	str r1, [r0, #0x2c]
	mov r1, sl
	str r1, [r0, #0x30]
	mov r1, r8
	str r1, [r0, #0x34]
	str r7, [r0, #0x38]
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0804052C: .4byte gUnk_Sio_085CB0D4

	thumb_func_start ScrollMultiArenaTeamSprites
ScrollMultiArenaTeamSprites: @ 0x08040530
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, .L08040548 @ =gUnk_Sio_085CB0D4
	bl FindProc
	ldr r1, [r0, #0x30]
	adds r1, r1, r4
	str r1, [r0, #0x30]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08040548: .4byte gUnk_Sio_085CB0D4

	thumb_func_start func_fe6_0804054C
func_fe6_0804054C: @ 0x0804054C
	push {r4, r5, r6, lr}
	ldr r5, .L08040590 @ =gUnk_08109C00
	ldr r0, .L08040594 @ =Unk_Sio_0203C9D0
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne .L0804058A
	bl GetGameTime
	adds r2, r0, #0
	movs r0, #0x1f
	ands r2, r0
	asrs r2, r2, #1
	movs r1, #0
	ldr r0, .L08040598 @ =gPal
	movs r4, #0xf
	ldr r6, .L0804059C @ =0x00000336
	adds r3, r0, r6
.L08040572:
	adds r0, r2, r1
	ands r0, r4
	lsls r0, r0, #1
	adds r0, r0, r5
	ldrh r0, [r0]
	strh r0, [r3]
	adds r3, #2
	adds r1, #1
	cmp r1, #4
	ble .L08040572
	bl EnablePalSync
.L0804058A:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08040590: .4byte gUnk_08109C00
.L08040594: .4byte Unk_Sio_0203C9D0
.L08040598: .4byte gPal
.L0804059C: .4byte 0x00000336

	thumb_func_start func_fe6_080405A0
func_fe6_080405A0: @ 0x080405A0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r5, r0, #0
	ldr r0, [r5, #0x14]
	mov r8, r0
	ldr r1, [r5, #0x34]
	ldr r0, [r5, #0x2c]
	adds r1, r1, r0
	asrs r1, r1, #1
	ldr r2, [r5, #0x38]
	ldr r0, [r5, #0x30]
	adds r2, r2, r0
	asrs r2, r2, #1
	str r1, [r5, #0x2c]
	str r2, [r5, #0x30]
	ldr r3, .L08040628 @ =gUnk_Sio_085CB0EC
	ldr r0, [r5, #0x3c]
	lsls r0, r0, #2
	adds r0, r0, r3
	ldr r3, [r0]
	movs r4, #0
	str r4, [sp]
	movs r0, #2
	bl PutSprite
	ldr r1, [r5, #0x40]
	adds r1, #0x60
	ldr r3, .L0804062C @ =gUnk_Sio_0810F57C
	str r4, [sp]
	movs r0, #2
	movs r2, #0x30
	bl PutSprite
	ldr r3, .L08040630 @ =gUnk_Sio_085CB044
	str r4, [sp]
	movs r0, #2
	movs r1, #0x60
	movs r2, #0x20
	bl PutSprite
	ldr r3, .L08040634 @ =Sprite_LinkArena_NAMEBANNER
	movs r0, #0x80
	lsls r0, r0, #4
	str r0, [sp]
	movs r0, #4
	movs r1, #0x50
	movs r2, #0x20
	bl PutSprite
	ldr r7, .L08040638 @ =gUnk_Sio_085CB0F4
	movs r6, #0x48
.L0804060A:
	ldr r0, [r5, #0x44]
	cmp r0, r4
	beq .L08040614
	cmp r4, #2
	ble .L0804063C
.L08040614:
	ldr r3, [r7]
	movs r0, #0x80
	lsls r0, r0, #8
	str r0, [sp]
	movs r0, #4
	movs r1, #0xc4
	adds r2, r6, #0
	bl PutSprite
	b .L0804064E
	.align 2, 0
.L08040628: .4byte gUnk_Sio_085CB0EC
.L0804062C: .4byte gUnk_Sio_0810F57C
.L08040630: .4byte gUnk_Sio_085CB044
.L08040634: .4byte Sprite_LinkArena_NAMEBANNER
.L08040638: .4byte gUnk_Sio_085CB0F4
.L0804063C:
	ldr r3, [r7]
	movs r0, #0x80
	lsls r0, r0, #7
	str r0, [sp]
	movs r0, #4
	movs r1, #0xc4
	adds r2, r6, #0
	bl PutSprite
.L0804064E:
	adds r7, #4
	adds r6, #0x10
	adds r4, #1
	cmp r4, #4
	ble .L0804060A
	mov r0, r8
	adds r0, #0x36
	ldrb r0, [r0]
	cmp r0, #0
	bne .L0804066A
	movs r0, #0xc0
	movs r1, #0x10
	bl PutLinkArenaButtonSpriteAt
.L0804066A:
	bl func_fe6_0804054C
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_fe6_0804067C
func_fe6_0804067C: @ 0x0804067C
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r6, r0, #0
	adds r5, r1, #0
	mov r8, r2
	ldr r4, .L080406B4 @ =gUnk_Sio_085CB108
	adds r0, r4, #0
	bl Proc_EndEach
	adds r0, r4, #0
	adds r1, r6, #0
	bl SpawnProc
	str r5, [r0, #0x34]
	str r5, [r0, #0x2c]
	mov r1, r8
	str r1, [r0, #0x38]
	str r1, [r0, #0x30]
	movs r1, #0
	str r1, [r0, #0x3c]
	str r1, [r0, #0x40]
	str r1, [r0, #0x44]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
.L080406B4: .4byte gUnk_Sio_085CB108

	thumb_func_start UpdateNameEntrySpriteDraw
UpdateNameEntrySpriteDraw: @ 0x080406B8
	push {r4, r5, lr}
	ldr r4, [sp, #0xc]
	ldr r5, [sp, #0x10]
	str r1, [r0, #0x34]
	str r2, [r0, #0x38]
	str r4, [r0, #0x3c]
	str r3, [r0, #0x40]
	str r5, [r0, #0x44]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_fe6_080406D0
func_fe6_080406D0: @ 0x080406D0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r5, r0, #0
	movs r0, #0x2c
	ldrsh r1, [r5, r0]
	movs r2, #0x2a
	ldrsh r0, [r5, r2]
	adds r1, r1, r0
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r7, r0, #2
	ldrh r0, [r5, #0x2c]
	strh r0, [r5, #0x2a]
	ldr r0, .L08040740 @ =gUnk_Sio_085CB120
	mov r8, r0
	movs r6, #0x30
	movs r4, #2
.L080406F6:
	mov r1, r8
	adds r1, #4
	mov r8, r1
	subs r1, #4
	ldm r1!, {r3}
	movs r0, #0
	str r0, [sp]
	movs r0, #2
	movs r1, #0x20
	adds r2, r6, #0
	bl PutSprite
	adds r6, #0x18
	subs r4, #1
	cmp r4, #0
	bge .L080406F6
	adds r1, r7, #0
	adds r1, #0x30
	movs r0, #0x20
	bl PutFrozenUiHand
	movs r2, #0x2e
	ldrsh r0, [r5, r2]
	movs r2, #0x30
	ldrsh r1, [r5, r2]
	bl PutUiHand
	movs r0, #0xc0
	movs r1, #0x10
	bl PutLinkArenaButtonSpriteAt
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08040740: .4byte gUnk_Sio_085CB120

	thumb_func_start func_fe6_08040744
func_fe6_08040744: @ 0x08040744
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, .L08040764 @ =gUnk_Sio_085CB12C
	adds r0, r4, #0
	bl Proc_EndEach
	adds r0, r4, #0
	adds r1, r5, #0
	bl SpawnProc
	movs r1, #0
	strh r1, [r0, #0x2a]
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
.L08040764: .4byte gUnk_Sio_085CB12C

	thumb_func_start func_fe6_08040768
func_fe6_08040768: @ 0x08040768
	strh r1, [r0, #0x2c]
	strh r2, [r0, #0x2e]
	strh r3, [r0, #0x30]
	bx lr

	thumb_func_start func_fe6_08040770
func_fe6_08040770: @ 0x08040770
	push {lr}
	adds r1, r0, #0
	ldr r2, .L0804079C @ =gUnk_08109C00
	ldr r0, .L080407A0 @ =Unk_Sio_0203C9D0
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne .L08040796
	ldr r0, .L080407A4 @ =gPal
	lsls r1, r1, #1
	adds r1, r1, r2
	ldrh r1, [r1]
	movs r2, #0xb7
	lsls r2, r2, #2
	adds r0, r0, r2
	strh r1, [r0]
	bl EnablePalSync
.L08040796:
	pop {r0}
	bx r0
	.align 2, 0
.L0804079C: .4byte gUnk_08109C00
.L080407A0: .4byte Unk_Sio_0203C9D0
.L080407A4: .4byte gPal

	thumb_func_start func_fe6_080407A8
func_fe6_080407A8: @ 0x080407A8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r7, r0, #0
	movs r0, #0x4c
	adds r0, r0, r7
	mov r8, r0
	movs r1, #0
	ldrsh r5, [r0, r1]
	lsls r4, r5, #1
	adds r0, r5, #0
	bl func_fe6_08040770
	ldr r0, .L08040848 @ =gUnk_Sio_0810F5FC
	adds r4, #1
	lsls r4, r4, #1
	adds r4, r4, r0
	movs r1, #0
	ldrsh r6, [r4, r1]
	ldr r1, [r7, #0x2c]
	subs r1, r1, r6
	lsls r5, r5, #2
	adds r5, r5, r0
	movs r0, #0
	ldrsh r5, [r5, r0]
	ldr r2, [r7, #0x30]
	subs r2, r2, r5
	ldr r3, .L0804084C @ =gUnk_Sio_0810F5C4
	movs r4, #0
	str r4, [sp]
	movs r0, #2
	bl PutSprite
	ldr r1, [r7, #0x2c]
	adds r1, r1, r6
	adds r1, #0x10
	ldr r2, [r7, #0x30]
	subs r2, r2, r5
	ldr r3, .L08040850 @ =gUnk_Sio_0810F5D2
	str r4, [sp]
	movs r0, #2
	bl PutSprite
	ldr r1, [r7, #0x2c]
	subs r1, r1, r6
	ldr r2, [r7, #0x30]
	adds r2, r2, r5
	ldr r3, .L08040854 @ =gUnk_Sio_0810F5E0
	str r4, [sp]
	movs r0, #2
	bl PutSprite
	ldr r1, [r7, #0x2c]
	adds r1, r1, r6
	adds r1, #0x10
	ldr r2, [r7, #0x30]
	adds r2, r2, r5
	ldr r3, .L08040858 @ =gUnk_Sio_0810F5EE
	str r4, [sp]
	movs r0, #2
	bl PutSprite
	mov r1, r8
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xf
	bne .L0804083C
	adds r0, r7, #0
	bl Proc_Break
.L0804083C:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08040848: .4byte gUnk_Sio_0810F5FC
.L0804084C: .4byte gUnk_Sio_0810F5C4
.L08040850: .4byte gUnk_Sio_0810F5D2
.L08040854: .4byte gUnk_Sio_0810F5E0
.L08040858: .4byte gUnk_Sio_0810F5EE

	thumb_func_start func_fe6_0804085C
func_fe6_0804085C: @ 0x0804085C
	push {r4, r5, lr}
	adds r3, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	ldr r0, .L0804087C @ =gUnk_Sio_085CB144
	adds r1, r3, #0
	bl SpawnProc
	str r4, [r0, #0x2c]
	str r5, [r0, #0x30]
	adds r0, #0x4c
	movs r1, #0
	strh r1, [r0]
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
.L0804087C: .4byte gUnk_Sio_085CB144

	thumb_func_start func_fe6_08040880
func_fe6_08040880: @ 0x08040880
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r0, #0x45
	movs r1, #0
	strb r1, [r0]
	subs r0, #1
	strb r1, [r0]
	subs r0, #7
	ldr r4, [r6, #0x34]
	ldrb r0, [r0]
	muls r0, r4, r0
	lsls r0, r0, #3
	adds r5, r6, #0
	adds r5, #0x3c
	ldrb r1, [r5]
	bl __divsi3
	str r0, [r6, #0x38]
	lsls r4, r4, #0xb
	ldrb r5, [r5]
	lsls r1, r5, #4
	adds r0, r4, #0
	bl __divsi3
	adds r1, r6, #0
	adds r1, #0x42
	strh r0, [r1]
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start func_fe6_080408BC
func_fe6_080408BC: @ 0x080408BC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x30
	adds r7, r0, #0
	ldr r0, [r7, #0x2c]
	mov r8, r0
	ldr r1, [r7, #0x30]
	str r1, [sp, #0xc]
	adds r1, #8
	mov sl, r1
	ldr r0, [r7, #0x38]
	asrs r2, r0, #3
	str r2, [sp, #0x10]
	movs r1, #7
	ands r0, r1
	movs r1, #8
	subs r0, r1, r0
	str r0, [sp, #0x14]
	movs r3, #0x3e
	ldrsh r0, [r7, r3]
	adds r1, r7, #0
	adds r1, #0x42
	ldrh r1, [r1]
	muls r0, r1, r0
	asrs r0, r0, #8
	str r0, [sp, #0x18]
	movs r0, #0x3c
	adds r0, r0, r7
	mov ip, r0
	movs r1, #0x3d
	adds r1, r1, r7
	mov sb, r1
	ldrb r2, [r0]
	ldrb r3, [r1]
	cmp r2, r3
	bhi .L0804090C
	b .L08040A64
.L0804090C:
	adds r5, r7, #0
	adds r5, #0x44
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	adds r4, r7, #0
	adds r4, #0x45
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	adds r0, r7, #0
	adds r0, #0x40
	movs r1, #0x3e
	ldrsh r2, [r7, r1]
	movs r3, #0
	ldrsh r1, [r0, r3]
	adds r3, r5, #0
	str r0, [sp, #0x2c]
	cmp r2, r1
	bge .L0804093A
	ldrb r0, [r3]
	adds r0, #2
	strb r0, [r3]
.L0804093A:
	movs r0, #0x3e
	ldrsh r1, [r7, r0]
	ldr r2, [sp, #0x2c]
	movs r3, #0
	ldrsh r0, [r2, r3]
	cmp r1, r0
	ble .L0804094E
	ldrb r0, [r4]
	adds r0, #2
	strb r0, [r4]
.L0804094E:
	movs r6, #0
	mov r0, ip
	str r0, [sp, #0x28]
	ldr r1, [sp, #0x18]
	add r1, sl
	str r1, [sp, #0x1c]
	ldr r2, [sp, #0x10]
	lsls r2, r2, #3
	str r2, [sp, #0x24]
	ldr r3, [sp, #0xc]
	str r3, [sp, #0x20]
.L08040964:
	ldrb r0, [r5]
	cmp r0, #0x30
	bls .L0804096E
	movs r0, #0
	strb r0, [r5]
.L0804096E:
	lsls r4, r6, #2
	add r4, sp
	adds r4, #4
	ldrb r1, [r5]
	lsrs r0, r1, #3
	movs r1, #6
	bl __umodsi3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [r4]
	adds r5, #1
	adds r6, #1
	cmp r6, #1
	ble .L08040964
	movs r2, #0x3e
	ldrsh r0, [r7, r2]
	cmp r0, #0
	beq .L080409A6
	mov r2, sl
	subs r2, #9
	ldr r3, .L08040A74 @ =gUnk_Sio_085CB164
	ldr r0, [sp, #4]
	str r0, [sp]
	movs r0, #3
	mov r1, r8
	bl PutSprite
.L080409A6:
	movs r3, #0x3e
	ldrsh r0, [r7, r3]
	cmp r0, #0
	bge .L080409B0
	adds r0, #0xf
.L080409B0:
	asrs r0, r0, #4
	mov r1, sb
	ldrb r1, [r1]
	adds r0, r1, r0
	ldr r2, [sp, #0x28]
	ldrb r2, [r2]
	cmp r0, r2
	bge .L080409D6
	ldr r2, [r7, #0x34]
	lsls r2, r2, #3
	add r2, sl
	adds r2, #1
	ldr r3, .L08040A78 @ =gUnk_Sio_085CB15C
	ldr r0, [sp, #8]
	str r0, [sp]
	movs r0, #3
	mov r1, r8
	bl PutSprite
.L080409D6:
	movs r6, #0
	ldr r0, [r7, #0x34]
	cmp r6, r0
	bge .L080409FA
	mov r4, sl
	movs r5, #1
.L080409E2:
	str r5, [sp]
	movs r0, #2
	mov r1, r8
	adds r2, r4, #0
	ldr r3, .L08040A7C @ =gUnk_Sio_085CB16C
	bl PutSprite
	adds r4, #8
	adds r6, #1
	ldr r0, [r7, #0x34]
	cmp r6, r0
	blt .L080409E2
.L080409FA:
	ldr r3, [sp, #0x10]
	cmp r3, #0
	ble .L08040A1C
	ldr r4, [sp, #0x1c]
	movs r5, #0
	adds r6, r3, #0
.L08040A06:
	str r5, [sp]
	movs r0, #2
	mov r1, r8
	adds r2, r4, #0
	ldr r3, .L08040A7C @ =gUnk_Sio_085CB16C
	bl PutSprite
	adds r4, #8
	subs r6, #1
	cmp r6, #0
	bne .L08040A06
.L08040A1C:
	ldr r0, [sp, #0x1c]
	ldr r1, [sp, #0x24]
	adds r2, r0, r1
	ldr r3, [sp, #0x14]
	subs r2, r2, r3
	ldr r4, .L08040A7C @ =gUnk_Sio_085CB16C
	movs r0, #0
	str r0, [sp]
	movs r0, #2
	mov r1, r8
	adds r3, r4, #0
	bl PutSprite
	movs r5, #2
	str r5, [sp]
	movs r0, #2
	mov r1, r8
	ldr r2, [sp, #0x20]
	adds r3, r4, #0
	bl PutSprite
	movs r1, #0x80
	lsls r1, r1, #6
	add r1, r8
	ldr r2, [r7, #0x34]
	lsls r2, r2, #3
	add r2, sl
	subs r2, #7
	str r5, [sp]
	movs r0, #2
	adds r3, r4, #0
	bl PutSprite
	ldrh r0, [r7, #0x3e]
	ldr r1, [sp, #0x2c]
	strh r0, [r1]
.L08040A64:
	add sp, #0x30
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08040A74: .4byte gUnk_Sio_085CB164
.L08040A78: .4byte gUnk_Sio_085CB15C
.L08040A7C: .4byte gUnk_Sio_085CB16C

	thumb_func_start func_fe6_08040A80
func_fe6_08040A80: @ 0x08040A80
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	mov sb, r0
	mov sl, r1
	mov r8, r2
	adds r5, r3, #0
	ldr r6, [sp, #0x20]
	ldr r7, [sp, #0x24]
	mov r0, r8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	ldr r4, .L08040AE8 @ =gUnk_Sio_085CB174
	adds r0, r4, #0
	bl Proc_EndEach
	adds r0, r4, #0
	adds r1, r7, #0
	bl SpawnProc
	adds r1, r0, #0
	mov r2, sb
	str r2, [r1, #0x2c]
	mov r0, sl
	str r0, [r1, #0x30]
	lsls r0, r5, #1
	subs r0, #2
	str r0, [r1, #0x34]
	adds r0, r1, #0
	adds r0, #0x3c
	mov r2, r8
	strb r2, [r0]
	adds r0, #1
	strb r5, [r0]
	strh r6, [r1, #0x3e]
	adds r0, #3
	strh r6, [r0]
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08040AE8: .4byte gUnk_Sio_085CB174

	thumb_func_start UpdateLinkArenaMenuScrollBar
UpdateLinkArenaMenuScrollBar: @ 0x08040AEC
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	lsls r1, r1, #0x10
	lsrs r4, r1, #0x10
	ldr r0, .L08040B40 @ =gUnk_Sio_085CB174
	bl FindProc
	adds r6, r0, #0
	cmp r6, #0
	beq .L08040B38
	adds r5, r6, #0
	adds r5, #0x3c
	strb r7, [r5]
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	movs r1, #0xff
	ands r0, r1
	strh r0, [r6, #0x3e]
	adds r0, r6, #0
	adds r0, #0x3d
	ldr r4, [r6, #0x34]
	ldrb r0, [r0]
	muls r0, r4, r0
	lsls r0, r0, #3
	ldrb r1, [r5]
	bl __divsi3
	str r0, [r6, #0x38]
	lsls r4, r4, #0xb
	ldrb r5, [r5]
	lsls r1, r5, #4
	adds r0, r4, #0
	bl __divsi3
	adds r1, r6, #0
	adds r1, #0x42
	strh r0, [r1]
.L08040B38:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08040B40: .4byte gUnk_Sio_085CB174

	thumb_func_start func_fe6_08040B44
func_fe6_08040B44: @ 0x08040B44
	push {lr}
	ldr r0, .L08040B60 @ =gUnk_0810B900
	ldr r1, .L08040B64 @ =0x06002000
	bl Decompress
	ldr r0, .L08040B68 @ =gPlaySt
	ldrb r0, [r0, #0xf]
	cmp r0, #1
	beq .L08040B90
	cmp r0, #1
	bgt .L08040B6C
	cmp r0, #0
	beq .L08040B76
	b .L08040BDA
	.align 2, 0
.L08040B60: .4byte gUnk_0810B900
.L08040B64: .4byte 0x06002000
.L08040B68: .4byte gPlaySt
.L08040B6C:
	cmp r0, #2
	beq .L08040BA8
	cmp r0, #3
	beq .L08040BC8
	b .L08040BDA
.L08040B76:
	ldr r0, .L08040B84 @ =gUnk_0810A62C
	ldr r1, .L08040B88 @ =0x06002800
	bl Decompress
	ldr r0, .L08040B8C @ =gUnk_0810BA60
	b .L08040BB2
	.align 2, 0
.L08040B84: .4byte gUnk_0810A62C
.L08040B88: .4byte 0x06002800
.L08040B8C: .4byte gUnk_0810BA60
.L08040B90:
	ldr r0, .L08040B9C @ =gUnk_0810AADC
	ldr r1, .L08040BA0 @ =0x06002800
	bl Decompress
	ldr r0, .L08040BA4 @ =gUnk_0810BAA0
	b .L08040BB2
	.align 2, 0
.L08040B9C: .4byte gUnk_0810AADC
.L08040BA0: .4byte 0x06002800
.L08040BA4: .4byte gUnk_0810BAA0
.L08040BA8:
	ldr r0, .L08040BBC @ =gUnk_0810AF9C
	ldr r1, .L08040BC0 @ =0x06002800
	bl Decompress
	ldr r0, .L08040BC4 @ =gUnk_0810BA80
.L08040BB2:
	movs r1, #0xa0
	movs r2, #0x20
	bl ApplyPaletteExt
	b .L08040BDA
	.align 2, 0
.L08040BBC: .4byte gUnk_0810AF9C
.L08040BC0: .4byte 0x06002800
.L08040BC4: .4byte gUnk_0810BA80
.L08040BC8:
	ldr r0, .L08040BEC @ =gUnk_0810B44C
	ldr r1, .L08040BF0 @ =0x06002800
	bl Decompress
	ldr r0, .L08040BF4 @ =gUnk_0810BAC0
	movs r1, #0xa0
	movs r2, #0x20
	bl ApplyPaletteExt
.L08040BDA:
	ldr r2, .L08040BF8 @ =gUnk_03001438
	ldr r1, .L08040BFC @ =gPlaySt
	ldrb r0, [r1, #0xf]
	str r0, [r2]
	movs r0, #0
	strb r0, [r1, #0xf]
	pop {r0}
	bx r0
	.align 2, 0
.L08040BEC: .4byte gUnk_0810B44C
.L08040BF0: .4byte 0x06002800
.L08040BF4: .4byte gUnk_0810BAC0
.L08040BF8: .4byte gUnk_03001438
.L08040BFC: .4byte gPlaySt

	thumb_func_start func_fe6_08040C00
func_fe6_08040C00: @ 0x08040C00
	push {r4, lr}
	ldr r1, .L08040C70 @ =gPlaySt
	ldr r0, .L08040C74 @ =gUnk_03001438
	ldr r0, [r0]
	movs r2, #0
	strb r0, [r1, #0xf]
	ldr r3, .L08040C78 @ =gDispIo
	movs r0, #0x21
	rsbs r0, r0, #0
	ldrb r1, [r3, #1]
	ands r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r3, #1]
	adds r1, r3, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r4, [r1]
	ands r0, r4
	strb r0, [r1]
	adds r1, #8
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x45
	strb r2, [r0]
	adds r0, #1
	strb r2, [r0]
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r2, [r3, #0xc]
	ands r0, r2
	strb r0, [r3, #0xc]
	adds r0, r1, #0
	ldrb r4, [r3, #0x10]
	ands r0, r4
	movs r2, #1
	orrs r0, r2
	strb r0, [r3, #0x10]
	ldrb r0, [r3, #0x14]
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	strb r1, [r3, #0x14]
	movs r0, #3
	ldrb r1, [r3, #0x18]
	orrs r0, r1
	strb r0, [r3, #0x18]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08040C70: .4byte gPlaySt
.L08040C74: .4byte gUnk_03001438
.L08040C78: .4byte gDispIo

	thumb_func_start func_fe6_08040C7C
func_fe6_08040C7C: @ 0x08040C7C
	push {lr}
	ldr r1, .L08040C8C @ =gMusicPlayer_MainBgm
	movs r0, #0x22
	bl StartBgm
	pop {r0}
	bx r0
	.align 2, 0
.L08040C8C: .4byte gMusicPlayer_MainBgm

	thumb_func_start SioSetUniqueWeaponUnbreakable
SioSetUniqueWeaponUnbreakable: @ 0x08040C90
	lsls r1, r1, #1
	adds r0, #0x1c
	adds r2, r0, r1
	ldrh r1, [r2]
	cmp r1, #0
	beq .L08040CA6
	movs r3, #0xff
	lsls r3, r3, #8
	adds r0, r3, #0
	orrs r1, r0
	strh r1, [r2]
.L08040CA6:
	bx lr

	thumb_func_start SioSetUniqueWeapons
SioSetUniqueWeapons: @ 0x08040CA8
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r4, #0
.L08040CAE:
	adds r0, r5, #0
	adds r1, r4, #0
	bl SioSetUniqueWeaponUnbreakable
	adds r4, #1
	cmp r4, #4
	ble .L08040CAE
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start LAVersusSpriteDraw_Flashing
LAVersusSpriteDraw_Flashing: @ 0x08040CC4
	push {r4, r5, r6, lr}
	ldr r5, .L08040D08 @ =Pal_LinkArenaActiveBannerFx
	ldr r0, .L08040D0C @ =Unk_Sio_0203C9D0
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne .L08040D02
	bl GetGameTime
	adds r2, r0, #0
	movs r0, #0x1f
	ands r2, r0
	asrs r2, r2, #1
	movs r1, #0
	ldr r0, .L08040D10 @ =gPal
	movs r4, #0xf
	ldr r6, .L08040D14 @ =0x00000322
	adds r3, r0, r6
.L08040CEA:
	adds r0, r2, r1
	ands r0, r4
	lsls r0, r0, #1
	adds r0, r0, r5
	ldrh r0, [r0]
	strh r0, [r3]
	adds r3, #2
	adds r1, #1
	cmp r1, #0xe
	ble .L08040CEA
	bl EnablePalSync
.L08040D02:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08040D08: .4byte Pal_LinkArenaActiveBannerFx
.L08040D0C: .4byte Unk_Sio_0203C9D0
.L08040D10: .4byte gPal
.L08040D14: .4byte 0x00000322

	thumb_func_start LAVersusSpriteDraw_Loop
LAVersusSpriteDraw_Loop: @ 0x08040D18
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r7, r0, #0
	movs r0, #0
	mov sb, r0
	movs r1, #0
	str r1, [sp, #4]
	mov sl, r1
.L08040D30:
	ldr r1, [r7, #0x2c]
	ldr r2, [r7, #0x30]
	ldr r3, [sp, #4]
	adds r2, r2, r3
	movs r0, #0xf
	mov r4, sb
	ands r0, r4
	lsls r0, r0, #0xc
	movs r3, #0x80
	lsls r3, r3, #4
	adds r0, r0, r3
	str r0, [sp]
	movs r0, #4
	ldr r3, .L08040EE4 @ =Sprite_LinkArena_NAMEBANNER
	bl PutSprite
	ldr r4, .L08040EE8 @ =gSinLut+0x80
	movs r1, #0
	ldrsh r0, [r4, r1]
	lsls r0, r0, #4
	movs r1, #0x80
	lsls r1, r1, #1
	bl Div
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	ldr r2, .L08040EEC @ =gSinLut
	movs r3, #0
	ldrsh r0, [r2, r3]
	rsbs r0, r0, #0
	lsls r0, r0, #4
	movs r1, #0x80
	lsls r1, r1, #1
	bl Div
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	ldr r4, .L08040EEC @ =gSinLut
	movs r1, #0
	ldrsh r0, [r4, r1]
	lsls r0, r0, #4
	movs r1, #0x80
	lsls r1, r1, #1
	bl Div
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	ldr r2, .L08040EE8 @ =gSinLut+0x80
	movs r3, #0
	ldrsh r0, [r2, r3]
	lsls r0, r0, #4
	movs r1, #0x80
	lsls r1, r1, #1
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	mov r0, sb
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl SetObjAffine
	ldr r1, [r7, #0x38]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq .L08040E5A
	adds r3, r7, #0
	adds r3, #0x3c
	cmp r1, sb
	beq .L08040DE0
	mov r4, sl
	adds r1, r3, r4
	ldrh r0, [r1]
	movs r2, #0x80
	lsls r2, r2, #1
	cmp r0, r2
	bls .L08040DDA
	subs r0, #8
	strh r0, [r1]
.L08040DDA:
	ldr r0, [r7, #0x38]
	cmp r0, sb
	bne .L08040DF2
.L08040DE0:
	mov r4, sl
	adds r2, r3, r4
	ldrh r1, [r2]
	ldr r0, .L08040EF0 @ =0x0000014F
	cmp r1, r0
	bhi .L08040DF2
	adds r0, r1, #0
	adds r0, #8
	strh r0, [r2]
.L08040DF2:
	ldr r1, .L08040EE8 @ =gSinLut+0x80
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #4
	add r3, sl
	mov r8, r3
	ldrh r1, [r3]
	bl Div
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	ldr r3, .L08040EEC @ =gSinLut
	movs r4, #0
	ldrsh r0, [r3, r4]
	rsbs r0, r0, #0
	lsls r0, r0, #4
	mov r2, r8
	ldrh r1, [r2]
	bl Div
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	ldr r3, .L08040EEC @ =gSinLut
	movs r4, #0
	ldrsh r0, [r3, r4]
	lsls r0, r0, #4
	mov r2, r8
	ldrh r1, [r2]
	bl Div
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	ldr r3, .L08040EE8 @ =gSinLut+0x80
	movs r1, #0
	ldrsh r0, [r3, r1]
	lsls r0, r0, #4
	mov r2, r8
	ldrh r1, [r2]
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	mov r0, sb
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl SetObjAffine
.L08040E5A:
	ldr r1, [r7, #0x2c]
	subs r1, #0x30
	ldr r2, [r7, #0x30]
	ldr r3, [sp, #4]
	adds r2, r2, r3
	ldr r3, .L08040EF4 @ =SpriteArray_LAVersusPlayerNumbers
	mov r4, sb
	lsls r0, r4, #2
	adds r0, r0, r3
	ldr r3, [r0]
	movs r4, #0
	str r4, [sp]
	movs r0, #4
	bl PutSprite
	ldr r0, [sp, #4]
	adds r0, #0x18
	str r0, [sp, #4]
	movs r1, #2
	add sl, r1
	movs r2, #1
	add sb, r2
	mov r3, sb
	cmp r3, #3
	bgt .L08040E8E
	b .L08040D30
.L08040E8E:
	ldr r2, [r7, #0x34]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r2, r0
	beq .L08040ED2
	ldr r1, [r7, #0x2c]
	subs r1, #0x40
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #3
	ldr r2, [r7, #0x30]
	adds r2, r2, r0
	adds r2, #8
	ldr r3, .L08040EF8 @ =gUnk_Sio_0810F65C
	str r4, [sp]
	movs r0, #4
	bl PutSprite
	ldr r1, [r7, #0x2c]
	subs r1, #0x40
	ldr r2, [r7, #0x34]
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #3
	ldr r2, [r7, #0x30]
	adds r2, r2, r0
	adds r2, #0x12
	ldr r3, .L08040EFC @ =Sprite_Sio_0810F664
	str r4, [sp]
	movs r0, #4
	bl PutSprite
	bl LAVersusSpriteDraw_Flashing
.L08040ED2:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08040EE4: .4byte Sprite_LinkArena_NAMEBANNER
.L08040EE8: .4byte gSinLut+0x80
.L08040EEC: .4byte gSinLut
.L08040EF0: .4byte 0x0000014F
.L08040EF4: .4byte SpriteArray_LAVersusPlayerNumbers
.L08040EF8: .4byte gUnk_Sio_0810F65C
.L08040EFC: .4byte Sprite_Sio_0810F664

	thumb_func_start StartLinkArenaVersusSpriteDraw
StartLinkArenaVersusSpriteDraw: @ 0x08040F00
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r6, r0, #0
	mov r8, r1
	adds r5, r2, #0
	ldr r4, .L08040F4C @ =ProcScr_LAVersusSpriteDraw
	adds r0, r4, #0
	bl Proc_EndEach
	adds r0, r4, #0
	adds r1, r5, #0
	bl SpawnProc
	adds r1, r0, #0
	str r6, [r1, #0x2c]
	mov r0, r8
	str r0, [r1, #0x30]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r1, #0x34]
	str r0, [r1, #0x38]
	movs r3, #0x80
	lsls r3, r3, #1
	movs r2, #3
	adds r0, r1, #0
	adds r0, #0x42
.L08040F36:
	strh r3, [r0]
	subs r0, #2
	subs r2, #1
	cmp r2, #0
	bge .L08040F36
	adds r0, r1, #0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
.L08040F4C: .4byte ProcScr_LAVersusSpriteDraw

	thumb_func_start EndLinkArenaVersusSpriteDraw
EndLinkArenaVersusSpriteDraw: @ 0x08040F50
	push {lr}
	ldr r0, .L08040F5C @ =ProcScr_LAVersusSpriteDraw
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
.L08040F5C: .4byte ProcScr_LAVersusSpriteDraw

	thumb_func_start GetLinkArenaVersusSpriteDraw
GetLinkArenaVersusSpriteDraw: @ 0x08040F60
	push {lr}
	ldr r0, .L08040F6C @ =ProcScr_LAVersusSpriteDraw
	bl FindProc
	pop {r1}
	bx r1
	.align 2, 0
.L08040F6C: .4byte ProcScr_LAVersusSpriteDraw

	thumb_func_start func_fe6_08040F70
func_fe6_08040F70: @ 0x08040F70
	push {r4, r5, lr}
	ldr r5, .L08040FB4 @ =Pal_LinkArenaActiveBannerFx
	ldr r0, .L08040FB8 @ =Unk_Sio_0203C9D0
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne .L08040FAE
	bl GetGameTime
	adds r2, r0, #0
	movs r0, #0x1f
	ands r2, r0
	asrs r2, r2, #1
	movs r1, #0
	ldr r0, .L08040FBC @ =gPal
	movs r4, #0xf
	adds r3, r0, #0
	adds r3, #0x42
.L08040F96:
	adds r0, r2, r1
	ands r0, r4
	lsls r0, r0, #1
	adds r0, r0, r5
	ldrh r0, [r0]
	strh r0, [r3]
	adds r3, #2
	adds r1, #1
	cmp r1, #0xe
	ble .L08040F96
	bl EnablePalSync
.L08040FAE:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08040FB4: .4byte Pal_LinkArenaActiveBannerFx
.L08040FB8: .4byte Unk_Sio_0203C9D0
.L08040FBC: .4byte gPal

	thumb_func_start func_fe6_08040FC0
func_fe6_08040FC0: @ 0x08040FC0
	push {r4, r5, r6, lr}
	ldr r5, .L08041004 @ =Pal_LinkArenaActiveBannerFx
	ldr r0, .L08041008 @ =Unk_Sio_0203C9D0
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne .L08040FFE
	bl GetGameTime
	adds r2, r0, #0
	movs r0, #0x1f
	ands r2, r0
	asrs r2, r2, #1
	movs r1, #0
	ldr r0, .L0804100C @ =gPal
	movs r4, #0xf
	ldr r6, .L08041010 @ =0x00000262
	adds r3, r0, r6
.L08040FE6:
	adds r0, r2, r1
	ands r0, r4
	lsls r0, r0, #1
	adds r0, r0, r5
	ldrh r0, [r0]
	strh r0, [r3]
	adds r3, #2
	adds r1, #1
	cmp r1, #0xe
	ble .L08040FE6
	bl EnablePalSync
.L08040FFE:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08041004: .4byte Pal_LinkArenaActiveBannerFx
.L08041008: .4byte Unk_Sio_0203C9D0
.L0804100C: .4byte gPal
.L08041010: .4byte 0x00000262

	thumb_func_start func_fe6_08041014
func_fe6_08041014: @ 0x08041014
	ldr r3, .L08041054 @ =gDispIo
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r1, r3, #0
	adds r1, #0x44
	movs r2, #0
	movs r0, #8
	strb r0, [r1]
	adds r1, #1
	movs r0, #0xc
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x46
	strb r2, [r0]
	ldr r0, .L08041058 @ =0x0000FFE0
	ldrh r2, [r3, #0x3c]
	ands r0, r2
	ldr r1, .L0804105C @ =0x0000E0FF
	ands r0, r1
	movs r2, #0xe0
	lsls r2, r2, #4
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r3, #0x3c]
	bx lr
	.align 2, 0
.L08041054: .4byte gDispIo
.L08041058: .4byte 0x0000FFE0
.L0804105C: .4byte 0x0000E0FF

	thumb_func_start func_fe6_08041060
func_fe6_08041060: @ 0x08041060
	push {lr}
	sub sp, #4
	adds r1, r0, #0
	ldr r2, [r1, #0x30]
	adds r0, r2, #0
	subs r0, #0x1f
	cmp r0, #0x79
	bhi .L08041082
	ldr r1, [r1, #0x2c]
	ldr r3, .L08041088 @ =Sprite_Sio_0810F672
	movs r0, #0
	str r0, [sp]
	movs r0, #4
	bl PutSprite
	bl func_fe6_08040FC0
.L08041082:
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
.L08041088: .4byte Sprite_Sio_0810F672

	thumb_func_start func_fe6_0804108C
func_fe6_0804108C: @ 0x0804108C
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r6, r0, #0
	mov r8, r1
	adds r5, r2, #0
	ldr r4, .L080410B8 @ =ProcScr_Sio_085CB204
	adds r0, r4, #0
	bl Proc_EndEach
	adds r0, r4, #0
	adds r1, r5, #0
	bl SpawnProc
	str r6, [r0, #0x2c]
	mov r1, r8
	str r1, [r0, #0x30]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
.L080410B8: .4byte ProcScr_Sio_085CB204

	thumb_func_start SioPutSupportMenuImage
SioPutSupportMenuImage: @ 0x080410BC
	push {r4, lr}
	ldr r0, .L080410E8 @ =Img_SupportMenu
	ldr r4, .L080410EC @ =gSioImgBuf
	adds r1, r4, #0
	bl Decompress
	ldr r1, .L080410F0 @ =0x06016800
	adds r0, r4, #0
	movs r2, #6
	movs r3, #4
	bl SioCopyVRAM
	ldr r0, .L080410F4 @ =Pal_SupportMenu
	movs r1, #0x90
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L080410E8: .4byte Img_SupportMenu
.L080410EC: .4byte gSioImgBuf
.L080410F0: .4byte 0x06016800
.L080410F4: .4byte Pal_SupportMenu

	thumb_func_start PutLinkArenaChoiceBannerSprite
PutLinkArenaChoiceBannerSprite: @ 0x080410F8
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r2, r1, #0
	ldr r3, .L08041118 @ =Sprite_LinkArena_ChoiceBanner
	movs r0, #0
	str r0, [sp]
	movs r0, #1
	adds r1, r4, #0
	bl PutSprite
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08041118: .4byte Sprite_LinkArena_ChoiceBanner

	thumb_func_start SioAttackItemMenu_Usability
SioAttackItemMenu_Usability: @ 0x0804111C
	push {r4, r5, lr}
	ldr r5, .L08041148 @ =gActiveUnit
	ldr r0, [r5]
	lsls r1, r1, #1
	adds r0, #0x1c
	adds r0, r0, r1
	ldrh r4, [r0]
	adds r0, r4, #0
	bl GetItemAttributes
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	beq .L0804115E
	adds r0, r4, #0
	bl GetItemMinRange
	cmp r0, #2
	ble .L0804114C
	movs r0, #1
	b .L08041160
	.align 2, 0
.L08041148: .4byte gActiveUnit
.L0804114C:
	ldr r0, [r5]
	adds r1, r4, #0
	bl CanUnitUseWeapon
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L0804115E
	movs r0, #0
	b .L08041160
.L0804115E:
	movs r0, #2
.L08041160:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start SioAttackItemMenu_Effect
SioAttackItemMenu_Effect: @ 0x08041168
	adds r0, r1, #0
	adds r0, #0x3d
	ldrb r0, [r0]
	cmp r0, #1
	beq .L08041184
	ldr r0, .L08041180 @ =gSioBmSt
	adds r1, #0x3c
	ldrb r1, [r1]
	strb r1, [r0, #7]
	movs r0, #0x84
	b .L08041186
	.align 2, 0
.L08041180: .4byte gSioBmSt
.L08041184:
	movs r0, #8
.L08041186:
	bx lr

	thumb_func_start func_fe6_08041188
func_fe6_08041188: @ 0x08041188
	ldr r2, .L08041198 @ =gSioBmSt
	adds r1, #0x3c
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r2, #6]
	movs r0, #0x17
	bx lr
	.align 2, 0
.L08041198: .4byte gSioBmSt

	thumb_func_start SioAttackItemMenu_OnDraw
SioAttackItemMenu_OnDraw: @ 0x0804119C
	push {r4, r5, r6, lr}
	adds r4, r1, #0
	ldr r0, .L080411F8 @ =gActiveUnit
	ldr r0, [r0]
	adds r1, #0x3c
	movs r2, #0
	ldrsb r2, [r1, r2]
	lsls r2, r2, #1
	adds r1, r0, #0
	adds r1, #0x1c
	adds r1, r1, r2
	ldrh r6, [r1]
	adds r1, r6, #0
	bl CanUnitUseWeapon
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r0, r6, #0
	bl GetItemMinRange
	cmp r0, #2
	ble .L080411CA
	movs r5, #0
.L080411CA:
	adds r0, r4, #0
	adds r0, #0x34
	lsls r2, r5, #0x18
	asrs r2, r2, #0x18
	movs r1, #0x2c
	ldrsh r3, [r4, r1]
	lsls r3, r3, #5
	movs r5, #0x2a
	ldrsh r1, [r4, r5]
	adds r3, r3, r1
	lsls r3, r3, #1
	ldr r1, .L080411FC @ =gBg0Tm
	adds r3, r3, r1
	adds r1, r6, #0
	bl DrawItemMenuLine
	movs r0, #1
	bl EnableBgSync
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
.L080411F8: .4byte gActiveUnit
.L080411FC: .4byte gBg0Tm

	thumb_func_start func_fe6_08041200
func_fe6_08041200: @ 0x08041200
	ldr r1, .L0804120C @ =gSioBmSt
	movs r0, #0
	strb r0, [r1, #6]
	movs r0, #0x1b
	bx lr
	.align 2, 0
.L0804120C: .4byte gSioBmSt

	thumb_func_start func_fe6_08041210
func_fe6_08041210: @ 0x08041210
	push {r4, r5, r6, r7, lr}
	adds r2, r0, #0
	ldr r1, .L08041278 @ =gSioBmSt
	movs r0, #0
	strb r0, [r1, #6]
	adds r7, r2, #0
	adds r7, #0x2d
	movs r0, #0
	ldrsb r0, [r7, r0]
	lsls r0, r0, #5
	adds r5, r2, #0
	adds r5, #0x2c
	movs r1, #0
	ldrsb r1, [r5, r1]
	adds r0, r0, r1
	lsls r0, r0, #1
	ldr r1, .L0804127C @ =gBg0Tm
	adds r0, r0, r1
	adds r6, r2, #0
	adds r6, #0x2e
	movs r1, #0
	ldrsb r1, [r6, r1]
	adds r4, r2, #0
	adds r4, #0x2f
	movs r2, #0
	ldrsb r2, [r4, r2]
	movs r3, #0
	bl TmFillRect_thm
	movs r0, #0
	ldrsb r0, [r7, r0]
	lsls r0, r0, #5
	movs r1, #0
	ldrsb r1, [r5, r1]
	adds r0, r0, r1
	lsls r0, r0, #1
	ldr r1, .L08041280 @ =gBg1Tm
	adds r0, r0, r1
	movs r1, #0
	ldrsb r1, [r6, r1]
	movs r2, #0
	ldrsb r2, [r4, r2]
	movs r3, #0
	bl TmFillRect_thm
	movs r0, #3
	bl EnableBgSync
	movs r0, #0xb
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
.L08041278: .4byte gSioBmSt
.L0804127C: .4byte gBg0Tm
.L08041280: .4byte gBg1Tm
