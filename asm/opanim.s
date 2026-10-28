	.include "macro.inc"

	.syntax unified

	thumb_func_start OpAnimSparksOBJ_Init
OpAnimSparksOBJ_Init: @ 0x0809A0E0
	push {r4, lr}
	adds r4, r0, #0
	bl PutOpAnimSparksObjGfx
	adds r4, #0x64
	movs r0, #0
	strh r0, [r4]
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start OpAnimSparksOBJ_Loop
OpAnimSparksOBJ_Loop: @ 0x0809A0F4
	push {lr}
	adds r2, r0, #0
	adds r0, #0x64
	ldrh r1, [r0]
	adds r1, #1
	strh r1, [r0]
	movs r0, #7
	ands r1, r0
	cmp r1, #0
	bne .L0809A10E
	adds r0, r2, #0
	bl func_fe6_0809A13C
.L0809A10E:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start PutOpAnimSparksObjGfx
PutOpAnimSparksObjGfx: @ 0x0809A114
	push {lr}
	ldr r0, .L0809A130 @ =Img_OpAnimSparksOBJ
	ldr r1, .L0809A134 @ =0x06010000
	bl Decompress
	ldr r0, .L0809A138 @ =Pal_OpAnimSparksOBJ
	movs r1, #0x88
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	pop {r0}
	bx r0
	.align 2, 0
.L0809A130: .4byte Img_OpAnimSparksOBJ
.L0809A134: .4byte 0x06010000
.L0809A138: .4byte Pal_OpAnimSparksOBJ

	thumb_func_start func_fe6_0809A13C
func_fe6_0809A13C: @ 0x0809A13C
	push {r4, lr}
	adds r1, r0, #0
	ldr r0, .L0809A1AC @ =ProcScr_OpAnimSparksOBJFALL
	bl SpawnProc
	adds r4, r0, #0
	bl RandNextB
	movs r1, #0xf1
	bl DivRem
	adds r0, #0x28
	strh r0, [r4, #0x2a]
	movs r0, #0xa0
	strh r0, [r4, #0x2c]
	bl RandNextB
	movs r1, #8
	bl DivRem
	ldr r1, .L0809A1B0 @ =gUnk_08380F5A
	adds r0, r0, r1
	ldrb r1, [r0]
	adds r0, r4, #0
	adds r0, #0x30
	strb r1, [r0]
	bl RandNextB
	movs r1, #4
	bl DivRem
	adds r0, #2
	adds r1, r4, #0
	adds r1, #0x2e
	strb r0, [r1]
	bl RandNextB
	movs r1, #4
	bl DivRem
	adds r0, #3
	adds r1, r4, #0
	adds r1, #0x2f
	strb r0, [r1]
	bl RandNextB
	ldr r1, .L0809A1B4 @ =0x00000101
	bl DivRem
	adds r1, r4, #0
	adds r1, #0x31
	strb r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0809A1AC: .4byte ProcScr_OpAnimSparksOBJFALL
.L0809A1B0: .4byte gUnk_08380F5A
.L0809A1B4: .4byte 0x00000101

	thumb_func_start OpAnimSparksOBJFALL_Init
OpAnimSparksOBJFALL_Init: @ 0x0809A1B8
	movs r1, #0
	strh r1, [r0, #0x32]
	bx lr
	.align 2, 0

	thumb_func_start OpAnimSparksOBJFALL_Loop
OpAnimSparksOBJFALL_Loop: @ 0x0809A1C0
	push {r4, r5, lr}
	sub sp, #4
	mov ip, r0
	ldr r3, .L0809A238 @ =gSinLut
	mov r1, ip
	adds r1, #0x31
	ldrh r2, [r0, #0x32]
	lsls r0, r2, #2
	ldrb r1, [r1]
	adds r0, r1, r0
	movs r1, #0xff
	ands r0, r1
	lsls r0, r0, #1
	adds r0, r0, r3
	movs r1, #0
	ldrsh r0, [r0, r1]
	asrs r3, r0, #8
	lsrs r2, r2, #4
	cmp r2, #7
	ble .L0809A1EA
	movs r2, #7
.L0809A1EA:
	ldr r1, .L0809A23C @ =gUnk_08380F62
	mov r0, ip
	adds r0, #0x30
	ldrb r0, [r0]
	lsls r0, r0, #3
	adds r0, r0, r2
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r4, r0, #1
	mov r0, ip
	adds r0, #0x2e
	mov r2, ip
	ldrh r2, [r2, #0x2a]
	ldrb r0, [r0]
	subs r0, r2, r0
	mov r5, ip
	strh r0, [r5, #0x2a]
	mov r0, ip
	adds r0, #0x2f
	ldrh r1, [r5, #0x2c]
	ldrb r0, [r0]
	subs r2, r1, r0
	strh r2, [r5, #0x2c]
	ldrh r0, [r5, #0x32]
	adds r0, #1
	strh r0, [r5, #0x32]
	movs r1, #0x2a
	ldrsh r0, [r5, r1]
	adds r1, r0, r3
	cmp r1, #0
	blt .L0809A22E
	lsls r0, r2, #0x10
	cmp r0, #0
	bge .L0809A240
.L0809A22E:
	mov r0, ip
	bl Proc_Break
	b .L0809A256
	.align 2, 0
.L0809A238: .4byte gSinLut
.L0809A23C: .4byte gUnk_08380F62
.L0809A240:
	mov r3, ip
	movs r5, #0x2c
	ldrsh r2, [r3, r5]
	ldr r3, .L0809A260 @ =Sprite_16x16
	movs r0, #0xa0
	lsls r0, r0, #5
	adds r0, r4, r0
	str r0, [sp]
	movs r0, #2
	bl PutSpriteExt
.L0809A256:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0809A260: .4byte Sprite_16x16

	thumb_func_start func_fe6_0809A264
func_fe6_0809A264: @ 0x0809A264
	adds r0, #0x64
	movs r1, #0
	strh r1, [r0]
	bx lr

	thumb_func_start func_fe6_0809A26C
func_fe6_0809A26C: @ 0x0809A26C
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r0, #1
	movs r1, #0
	bl func_fe6_0806A87C
	adds r4, #0x64
	movs r2, #0
	ldrsh r1, [r4, r2]
	ldr r2, .L0809A2BC @ =gUnk_086914D4
	movs r3, #0
	ldrsh r2, [r2, r3]
	ldr r3, .L0809A2C0 @ =gUnk_086914D0
	movs r5, #0
	ldrsh r3, [r3, r5]
	bl PrepareSineWaveScanlineBuf
	movs r0, #1
	movs r1, #0xa0
	bl func_fe6_0806A87C
	movs r2, #0
	ldrsh r1, [r4, r2]
	ldr r2, .L0809A2C4 @ =gUnk_086914DC
	movs r3, #0
	ldrsh r2, [r2, r3]
	ldr r3, .L0809A2C8 @ =gUnk_086914D8
	movs r5, #0
	ldrsh r3, [r3, r5]
	bl PrepareSineWaveScanlineBuf
	bl SwapScanlineBufs
	ldrh r0, [r4]
	adds r0, #2
	strh r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0809A2BC: .4byte gUnk_086914D4
.L0809A2C0: .4byte gUnk_086914D0
.L0809A2C4: .4byte gUnk_086914DC
.L0809A2C8: .4byte gUnk_086914D8

	thumb_func_start func_fe6_0809A2CC
func_fe6_0809A2CC: @ 0x0809A2CC
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r7, r0, #0
	ldr r0, .L0809A2E4 @ =bool_opanim_03005284
	movs r6, #0
	ldrsb r6, [r0, r6]
	cmp r6, #0
	beq .L0809A2E8
	adds r0, r7, #0
	bl Proc_End
	b .L0809A36E
	.align 2, 0
.L0809A2E4: .4byte bool_opanim_03005284
.L0809A2E8:
	bl func_fe6_0809A900
	bl SetAllBlackPals
	ldr r4, .L0809A378 @ =Img_OpAnim_Fog
	movs r0, #0
	bl GetBgChrOffset
	adds r1, r0, #0
	movs r5, #0xc0
	lsls r5, r5, #0x13
	adds r1, r1, r5
	adds r0, r4, #0
	bl Decompress
	ldr r4, .L0809A37C @ =Tsa_OpAnim_Fog
	ldr r1, .L0809A380 @ =gBg0Tm
	adds r0, r4, #0
	bl Decompress
	ldr r1, .L0809A384 @ =gBg1Tm
	adds r0, r4, #0
	bl Decompress
	ldr r4, .L0809A388 @ =Tsa_OpAnim_08375B84
	movs r0, #2
	bl GetBgChrOffset
	adds r1, r0, #0
	adds r1, r1, r5
	adds r0, r4, #0
	bl Decompress
	ldr r0, .L0809A38C @ =gUnk_08376B70
	ldr r1, .L0809A390 @ =gBg2Tm
	bl Decompress
	ldr r0, .L0809A394 @ =Pal_Lz_OpAnim_Fog
	ldr r4, .L0809A398 @ =gBuf
	adds r1, r4, #0
	bl Decompress
	movs r2, #0x80
	lsls r2, r2, #2
	adds r0, r4, #0
	movs r1, #0
	bl ApplyPaletteExt
	ldr r0, .L0809A39C @ =gPal
	strh r6, [r0]
	movs r0, #0xf
	bl EnableBgSync
	ldr r0, .L0809A3A0 @ =ProcScr_OpAnim_08691DE8
	adds r1, r7, #0
	bl SpawnProc
	movs r0, #3
	bl OpAnim_SetupGlyph
	movs r0, #1
	str r0, [sp]
	movs r1, #1
	movs r2, #1
	movs r3, #0
	bl OpAnim_SetWin0Layers
.L0809A36E:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0809A378: .4byte Img_OpAnim_Fog
.L0809A37C: .4byte Tsa_OpAnim_Fog
.L0809A380: .4byte gBg0Tm
.L0809A384: .4byte gBg1Tm
.L0809A388: .4byte Tsa_OpAnim_08375B84
.L0809A38C: .4byte gUnk_08376B70
.L0809A390: .4byte gBg2Tm
.L0809A394: .4byte Pal_Lz_OpAnim_Fog
.L0809A398: .4byte gBuf
.L0809A39C: .4byte gPal
.L0809A3A0: .4byte ProcScr_OpAnim_08691DE8

	thumb_func_start func_fe6_0809A3A4
func_fe6_0809A3A4: @ 0x0809A3A4
	adds r0, #0x64
	movs r3, #0
	movs r1, #0
	strh r1, [r0]
	ldr r1, .L0809A3CC @ =gDispIo+0x3C
	ldr r0, .L0809A3D0 @ =0x0000FFE0
	ldrh r2, [r1]
	ands r0, r2
	movs r2, #1
	orrs r0, r2
	strh r0, [r1]
	movs r0, #0xc0
	ldrb r2, [r1]
	orrs r0, r2
	strb r0, [r1]
	strb r3, [r1, #8]
	strb r3, [r1, #9]
	strb r3, [r1, #0xa]
	bx lr
	.align 2, 0
.L0809A3CC: .4byte gDispIo+0x3C
.L0809A3D0: .4byte 0x0000FFE0

	thumb_func_start func_fe6_0809A3D4
func_fe6_0809A3D4: @ 0x0809A3D4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov r8, r0
	mov r4, r8
	adds r4, #0x64
	ldrh r0, [r4]
	adds r0, #1
	movs r7, #0
	strh r0, [r4]
	ldr r5, .L0809A474 @ =gDispIo
	adds r6, r5, #0
	adds r6, #0x3c
	movs r0, #0xc0
	ldrb r1, [r6]
	orrs r0, r1
	strb r0, [r6]
	ldr r0, .L0809A478 @ =gDispIo+0x44
	strb r7, [r0]
	movs r1, #0x45
	adds r1, r1, r5
	mov sl, r1
	strb r7, [r1]
	ldr r0, .L0809A47C @ =gUnk_086914CC
	ldr r2, [r0]
	movs r0, #0
	ldrsh r3, [r4, r0]
	ldr r0, .L0809A480 @ =gUnk_086914C8
	ldr r0, [r0]
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	bl Interpolate
	movs r1, #0x46
	adds r1, r1, r5
	mov sb, r1
	strb r0, [r1]
	ldrh r4, [r4]
	cmp r4, #0x20
	bne .L0809A464
	mov r0, r8
	bl Proc_Break
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r1, [r5, #1]
	ands r0, r1
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #2
	ands r0, r1
	subs r1, #4
	ands r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r5, #1]
	movs r0, #0x3f
	ldrb r1, [r6]
	ands r0, r1
	strb r0, [r6]
	movs r0, #0x10
	ldr r1, .L0809A478 @ =gDispIo+0x44
	strb r0, [r1]
	mov r0, sl
	strb r7, [r0]
	mov r1, sb
	strb r7, [r1]
.L0809A464:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0809A474: .4byte gDispIo
.L0809A478: .4byte gDispIo+0x44
.L0809A47C: .4byte gUnk_086914CC
.L0809A480: .4byte gUnk_086914C8

	thumb_func_start func_fe6_0809A484
func_fe6_0809A484: @ 0x0809A484
	push {r4, r5, lr}
	adds r2, r0, #0
	adds r2, #0x64
	movs r4, #0
	movs r3, #0
	movs r5, #0x10
	movs r1, #0x10
	strh r1, [r2]
	adds r0, #0x44
	strh r3, [r0]
	ldr r3, .L0809A4C0 @ =gDispIo
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x44
	strb r4, [r0]
	adds r0, #1
	strb r5, [r0]
	adds r0, #1
	strb r4, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0809A4C0: .4byte gDispIo

	thumb_func_start func_fe6_0809A4C4
func_fe6_0809A4C4: @ 0x0809A4C4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r6, r0, #0
	adds r4, r6, #0
	adds r4, #0x64
	ldrh r0, [r4]
	adds r0, #1
	movs r1, #0
	mov r8, r1
	strh r0, [r4]
	ldr r7, .L0809A534 @ =gDispIo
	adds r2, r7, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	movs r0, #0
	ldrsh r3, [r4, r0]
	ldr r5, .L0809A538 @ =gUnk_086914BC
	ldr r0, [r5]
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0x10
	bl Interpolate
	adds r1, r7, #0
	adds r1, #0x44
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r7, #0
	adds r0, #0x46
	mov r1, r8
	strb r1, [r0]
	movs r0, #0
	ldrsh r1, [r4, r0]
	ldr r0, [r5]
	cmp r1, r0
	bne .L0809A526
	adds r0, r6, #0
	bl Proc_Break
.L0809A526:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0809A534: .4byte gDispIo
.L0809A538: .4byte gUnk_086914BC

	thumb_func_start func_fe6_0809A53C
func_fe6_0809A53C: @ 0x0809A53C
	push {lr}
	adds r3, r0, #0
	adds r2, r3, #0
	adds r2, #0x44
	ldrh r0, [r2]
	adds r1, r0, #1
	strh r1, [r2]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r1, .L0809A560 @ =gUnk_086914C4
	ldr r1, [r1]
	cmp r0, r1
	blt .L0809A55C
	adds r0, r3, #0
	bl Proc_Break
.L0809A55C:
	pop {r0}
	bx r0
	.align 2, 0
.L0809A560: .4byte gUnk_086914C4

	thumb_func_start func_fe6_0809A564
func_fe6_0809A564: @ 0x0809A564
	adds r0, #0x64
	movs r1, #0
	strh r1, [r0]
	ldr r2, .L0809A580 @ =gDispIo+0x3C
	ldr r0, .L0809A584 @ =0x0000E0FF
	ldrh r1, [r2]
	ands r0, r1
	movs r3, #0xc0
	lsls r3, r3, #3
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2]
	bx lr
	.align 2, 0
.L0809A580: .4byte gDispIo+0x3C
.L0809A584: .4byte 0x0000E0FF

	thumb_func_start func_fe6_0809A588
func_fe6_0809A588: @ 0x0809A588
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r6, r0, #0
	adds r4, r6, #0
	adds r4, #0x64
	ldrh r0, [r4]
	adds r0, #1
	movs r1, #0
	mov r8, r1
	strh r0, [r4]
	ldr r7, .L0809A5F8 @ =gDispIo
	adds r2, r7, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r1, r7, #0
	adds r1, #0x44
	movs r0, #0x10
	strb r0, [r1]
	movs r0, #0
	ldrsh r3, [r4, r0]
	ldr r5, .L0809A5FC @ =gUnk_086914C0
	ldr r0, [r5]
	str r0, [sp]
	movs r0, #0
	movs r1, #0x10
	movs r2, #0
	bl Interpolate
	adds r1, r7, #0
	adds r1, #0x45
	strb r0, [r1]
	adds r0, r7, #0
	adds r0, #0x46
	mov r1, r8
	strb r1, [r0]
	movs r0, #0
	ldrsh r1, [r4, r0]
	ldr r0, [r5]
	cmp r1, r0
	bne .L0809A5EC
	adds r0, r6, #0
	bl Proc_Break
.L0809A5EC:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0809A5F8: .4byte gDispIo
.L0809A5FC: .4byte gUnk_086914C0

	thumb_func_start func_fe6_0809A600
func_fe6_0809A600: @ 0x0809A600
	adds r0, #0x64
	movs r1, #0
	strh r1, [r0]
	ldr r2, .L0809A630 @ =gDispIo
	movs r0, #1
	ldrb r1, [r2, #1]
	orrs r0, r1
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #2
	ands r0, r1
	subs r1, #4
	ands r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #1]
	ldr r0, .L0809A634 @ =0x0000FFE0
	ldrh r1, [r2, #0x3c]
	ands r0, r1
	movs r1, #1
	orrs r0, r1
	strh r0, [r2, #0x3c]
	bx lr
	.align 2, 0
.L0809A630: .4byte gDispIo
.L0809A634: .4byte 0x0000FFE0

	thumb_func_start func_fe6_0809A638
func_fe6_0809A638: @ 0x0809A638
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov r8, r0
	ldr r5, .L0809A6D8 @ =gDispIo
	adds r7, r5, #0
	adds r7, #0x3c
	movs r0, #0xc0
	ldrb r1, [r7]
	orrs r0, r1
	strb r0, [r7]
	movs r2, #0x44
	adds r2, r2, r5
	mov sl, r2
	movs r6, #0
	strb r6, [r2]
	movs r3, #0x45
	adds r3, r3, r5
	mov sb, r3
	strb r6, [r3]
	mov r4, r8
	adds r4, #0x64
	ldrh r3, [r4]
	adds r0, r3, #1
	strh r0, [r4]
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	movs r0, #0x20
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0x10
	bl Interpolate
	adds r1, r5, #0
	adds r1, #0x46
	strb r0, [r1]
	movs r2, #0
	ldrsh r0, [r4, r2]
	cmp r0, #0x1f
	ble .L0809A6C6
	movs r0, #0x3f
	ldrb r3, [r7]
	ands r0, r3
	strb r0, [r7]
	movs r2, #0x10
	movs r0, #0x10
	mov r3, sl
	strb r0, [r3]
	mov r0, sb
	strb r6, [r0]
	strb r6, [r1]
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r1, [r5, #1]
	ands r0, r1
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #2
	ands r0, r1
	subs r1, #4
	ands r0, r1
	orrs r0, r2
	strb r0, [r5, #1]
	mov r0, r8
	bl Proc_Break
.L0809A6C6:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0809A6D8: .4byte gDispIo

	thumb_func_start func_fe6_0809A6DC
func_fe6_0809A6DC: @ 0x0809A6DC
	adds r0, #0x64
	movs r1, #0
	strh r1, [r0]
	bx lr

	thumb_func_start func_fe6_0809A6E4
func_fe6_0809A6E4: @ 0x0809A6E4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r7, r0, #0
	ldr r2, .L0809A728 @ =gDispIo
	movs r0, #1
	ldrb r1, [r2, #1]
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #9
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #1]
	adds r2, r7, #0
	adds r2, #0x64
	movs r6, #0
	ldrsh r1, [r2, r6]
	ldr r0, .L0809A72C @ =gUnk_086914B8
	ldr r0, [r0]
	cmp r1, r0
	bge .L0809A730
	ldrh r0, [r2]
	adds r0, #1
	strh r0, [r2]
	b .L0809A736
	.align 2, 0
.L0809A728: .4byte gDispIo
.L0809A72C: .4byte gUnk_086914B8
.L0809A730:
	adds r0, r7, #0
	bl Proc_Break
.L0809A736:
	movs r0, #0x80
	lsls r0, r0, #1
	mov sl, r0
	movs r2, #0xa0
	lsls r2, r2, #3
	movs r1, #0x64
	adds r1, r1, r7
	mov sb, r1
	movs r6, #0
	ldrsh r3, [r1, r6]
	ldr r5, .L0809A7F0 @ =gUnk_086914B8
	ldr r0, [r5]
	str r0, [sp]
	movs r0, #4
	mov r1, sl
	bl Interpolate
	adds r4, r0, #0
	ldr r0, .L0809A7F4 @ =gUnk_086914A8
	ldr r1, [r0]
	mov r0, sb
	movs r2, #0
	ldrsh r3, [r0, r2]
	ldr r0, [r5]
	str r0, [sp]
	movs r0, #4
	movs r2, #0
	bl Interpolate
	ldr r3, .L0809A7F8 @ =gSinLut_u32
	mov r6, sl
	adds r1, r4, r6
	ldr r2, .L0809A7FC @ =0x000003FF
	ands r1, r2
	lsls r1, r1, #2
	adds r1, r1, r3
	ldr r1, [r1]
	adds r6, r1, #0
	muls r6, r0, r6
	asrs r6, r6, #7
	mov r8, r6
	ands r4, r2
	lsls r4, r4, #2
	adds r4, r4, r3
	ldr r1, [r4]
	adds r6, r1, #0
	muls r6, r0, r6
	asrs r6, r6, #7
	movs r2, #0x80
	lsls r2, r2, #7
	mov r0, sb
	movs r1, #0
	ldrsh r3, [r0, r1]
	ldr r0, [r5]
	str r0, [sp]
	movs r0, #4
	movs r1, #0
	bl Interpolate
	adds r4, r0, #0
	lsls r4, r4, #2
	ldr r0, .L0809A800 @ =gUnk_086914A4
	ldr r1, [r0]
	lsls r1, r1, #8
	mov r2, sb
	movs r0, #0
	ldrsh r3, [r2, r0]
	ldr r0, [r5]
	str r0, [sp]
	movs r0, #4
	mov r2, sl
	bl Interpolate
	adds r5, r0, #0
	mov r0, r8
	adds r1, r6, #0
	adds r2, r4, #0
	adds r3, r5, #0
	bl func_fe6_0809A868
	mov r1, r8
	str r1, [r7, #0x2c]
	str r6, [r7, #0x30]
	str r4, [r7, #0x54]
	str r5, [r7, #0x58]
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0809A7F0: .4byte gUnk_086914B8
.L0809A7F4: .4byte gUnk_086914A8
.L0809A7F8: .4byte gSinLut_u32
.L0809A7FC: .4byte 0x000003FF
.L0809A800: .4byte gUnk_086914A4

	thumb_func_start func_fe6_0809A804
func_fe6_0809A804: @ 0x0809A804
	adds r0, #0x44
	movs r1, #0
	strh r1, [r0]
	bx lr

	thumb_func_start func_fe6_0809A80C
func_fe6_0809A80C: @ 0x0809A80C
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, [r5, #0x30]
	ldr r0, .L0809A850 @ =gUnk_086914B4
	ldr r2, [r0]
	lsls r2, r2, #8
	subs r2, r1, r2
	adds r6, r5, #0
	adds r6, #0x44
	movs r0, #0
	ldrsh r3, [r6, r0]
	ldr r4, .L0809A854 @ =gUnk_086914B0
	ldr r0, [r4]
	str r0, [sp]
	movs r0, #0
	bl Interpolate
	adds r1, r0, #0
	ldr r0, [r5, #0x2c]
	ldr r2, [r5, #0x54]
	ldr r3, [r5, #0x58]
	bl func_fe6_0809A868
	movs r0, #0
	ldrsh r1, [r6, r0]
	ldr r0, [r4]
	cmp r1, r0
	bge .L0809A858
	ldrh r0, [r6]
	adds r0, #1
	strh r0, [r6]
	b .L0809A85E
	.align 2, 0
.L0809A850: .4byte gUnk_086914B4
.L0809A854: .4byte gUnk_086914B0
.L0809A858:
	adds r0, r5, #0
	bl Proc_Break
.L0809A85E:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_fe6_0809A868
func_fe6_0809A868: @ 0x0809A868
	push {r4, r5, lr}
	sub sp, #0xc
	adds r5, r2, #0
	ldr r2, .L0809A89C @ =0xFFFFF000
	adds r0, r0, r2
	ldr r2, .L0809A8A0 @ =gUnk_086914AC
	ldr r4, [r2]
	adds r2, r4, #0
	subs r2, #0x50
	lsls r2, r2, #8
	adds r1, r1, r2
	movs r2, #0xd0
	lsls r2, r2, #7
	lsls r4, r4, #8
	str r5, [sp]
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	str r3, [sp, #4]
	str r3, [sp, #8]
	adds r3, r4, #0
	bl WmZoomCore
	add sp, #0xc
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0809A89C: .4byte 0xFFFFF000
.L0809A8A0: .4byte gUnk_086914AC

	thumb_func_start func_fe6_0809A8A4
func_fe6_0809A8A4: @ 0x0809A8A4
	adds r1, r0, #0
	adds r1, #0x64
	movs r2, #0
	strh r2, [r1]
	adds r0, #0x66
	strh r2, [r0]
	bx lr
	.align 2, 0

	thumb_func_start func_fe6_0809A8B4
func_fe6_0809A8B4: @ 0x0809A8B4
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x64
	ldrh r0, [r1]
	adds r0, #2
	strh r0, [r1]
	adds r4, #0x66
	ldrh r0, [r4]
	adds r0, #3
	strh r0, [r4]
	ldrh r1, [r1]
	lsls r2, r1, #0x10
	asrs r1, r2, #0x14
	adds r1, #0x10
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	asrs r2, r2, #0x13
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #0
	bl SetBgOffset
	ldrh r4, [r4]
	lsls r2, r4, #0x10
	asrs r1, r2, #0x14
	rsbs r1, r1, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	asrs r2, r2, #0x13
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #1
	bl SetBgOffset
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start func_fe6_0809A900
func_fe6_0809A900: @ 0x0809A900
	push {r4, r5, lr}
	ldr r0, .L0809A9DC @ =BgConf_OpAnim_08691DF8
	bl InitBgs
	movs r0, #0xf
	bl DisableBgSync
	ldr r0, .L0809A9E0 @ =gDispIo
	mov ip, r0
	movs r0, #8
	rsbs r0, r0, #0
	mov r1, ip
	ldrb r1, [r1]
	ands r0, r1
	movs r2, #1
	orrs r0, r2
	mov r3, ip
	strb r0, [r3]
	ldrb r0, [r3, #1]
	orrs r0, r2
	movs r3, #2
	orrs r0, r3
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #4
	ands r0, r1
	movs r1, #0x10
	orrs r0, r1
	movs r1, #0x21
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #0x20
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	mov r4, ip
	strb r0, [r4, #1]
	subs r1, #0x83
	adds r0, r1, #0
	ldrb r5, [r4, #0xc]
	ands r0, r5
	strb r0, [r4, #0xc]
	adds r0, r1, #0
	ldrb r4, [r4, #0x10]
	ands r0, r4
	orrs r0, r3
	mov r5, ip
	strb r0, [r5, #0x10]
	adds r0, r1, #0
	ldrb r3, [r5, #0x14]
	ands r0, r3
	orrs r0, r2
	strb r0, [r5, #0x14]
	ldrb r4, [r5, #0x18]
	ands r1, r4
	strb r1, [r5, #0x18]
	mov r2, ip
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r5, [r2]
	ands r0, r5
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	mov r0, ip
	adds r0, #0x44
	movs r1, #0
	strb r1, [r0]
	adds r2, #9
	movs r0, #0x10
	strb r0, [r2]
	mov r0, ip
	adds r0, #0x46
	strb r1, [r0]
	ldr r0, .L0809A9E4 @ =0x0000FFE0
	mov r1, ip
	ldrh r1, [r1, #0x3c]
	ands r0, r1
	movs r1, #1
	orrs r0, r1
	ldr r1, .L0809A9E8 @ =0x0000E0FF
	ands r0, r1
	movs r2, #0xc0
	lsls r2, r2, #3
	adds r1, r2, #0
	orrs r0, r1
	mov r3, ip
	strh r0, [r3, #0x3c]
	mov r1, ip
	adds r1, #0x3d
	movs r0, #0x20
	ldrb r4, [r1]
	orrs r0, r4
	strb r0, [r1]
	movs r0, #0
	movs r1, #4
	bl SetBgBpp
	movs r0, #1
	movs r1, #4
	bl SetBgBpp
	movs r0, #2
	movs r1, #8
	bl SetBgBpp
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0809A9DC: .4byte BgConf_OpAnim_08691DF8
.L0809A9E0: .4byte gDispIo
.L0809A9E4: .4byte 0x0000FFE0
.L0809A9E8: .4byte 0x0000E0FF
