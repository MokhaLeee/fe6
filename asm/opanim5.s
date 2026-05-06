	.include "macro.inc"

	.syntax unified


	thumb_func_start func_fe6_0809AD88
func_fe6_0809AD88: @ 0x0809AD88
	push {lr}
	adds r1, r0, #0
	ldr r0, .L0809ADA0 @ =bool_opanim_03005284
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq .L0809ADA4
	adds r0, r1, #0
	bl Proc_End
	b .L0809ADC2
	.align 2, 0
.L0809ADA0: .4byte bool_opanim_03005284
.L0809ADA4:
	ldr r2, .L0809ADC8 @ =gDispIo
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r1, [r2, #1]
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
	strb r0, [r2, #1]
.L0809ADC2:
	pop {r0}
	bx r0
	.align 2, 0
.L0809ADC8: .4byte gDispIo

	thumb_func_start func_fe6_0809ADCC
func_fe6_0809ADCC: @ 0x0809ADCC
	push {r4, r5, lr}
	sub sp, #4
	bl func_fe6_0809B0E8
	ldr r4, .L0809AE44 @ =gUnk_08375ADC
	movs r0, #0
	bl GetBgChrOffset
	adds r1, r0, #0
	ldr r0, .L0809AE48 @ =0x06000020
	adds r1, r1, r0
	adds r0, r4, #0
	bl Decompress
	bl func_fe6_0809AED4
	ldr r4, .L0809AE4C @ =Img_EndingMonologue
	movs r0, #2
	bl GetBgChrOffset
	adds r1, r0, #0
	movs r5, #0xc0
	lsls r5, r5, #0x13
	adds r1, r1, r5
	adds r0, r4, #0
	bl Decompress
	ldr r4, .L0809AE50 @ =Tsa_EndingMonologue
	movs r0, #2
	bl GetBgTilemapOffset
	adds r1, r0, #0
	adds r1, r1, r5
	adds r0, r4, #0
	bl Decompress
	ldr r0, .L0809AE54 @ =Zpal_EndingMonologue
	ldr r4, .L0809AE58 @ =gBuf
	adds r1, r4, #0
	bl Decompress
	ldr r0, .L0809AE5C @ =gUnk_08375B64
	movs r1, #0xd0
	lsls r1, r1, #1
	adds r4, r4, r1
	adds r1, r4, #0
	movs r2, #0x20
	bl VramCopy
	movs r0, #1
	str r0, [sp]
	movs r1, #1
	movs r2, #1
	movs r3, #0
	bl OpAnim_SetWin0Layers
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0809AE44: .4byte gUnk_08375ADC
.L0809AE48: .4byte 0x06000020
.L0809AE4C: .4byte Img_EndingMonologue
.L0809AE50: .4byte Tsa_EndingMonologue
.L0809AE54: .4byte Zpal_EndingMonologue
.L0809AE58: .4byte gBuf
.L0809AE5C: .4byte gUnk_08375B64

	thumb_func_start func_fe6_0809AE60
func_fe6_0809AE60: @ 0x0809AE60
	push {lr}
	ldr r2, .L0809AE94 @ =gDispIo
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
	ldr r0, .L0809AE98 @ =gBuf
	movs r2, #0x80
	lsls r2, r2, #2
	movs r1, #0
	bl ApplyPaletteExt
	ldr r1, .L0809AE9C @ =gPal
	movs r0, #0
	strh r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
.L0809AE94: .4byte gDispIo
.L0809AE98: .4byte gBuf
.L0809AE9C: .4byte gPal

	thumb_func_start func_fe6_0809AEA0
func_fe6_0809AEA0: @ 0x0809AEA0
	ldr r2, .L0809AEC0 @ =gDispIo
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r1, [r2, #1]
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
	strb r0, [r2, #1]
	bx lr
	.align 2, 0
.L0809AEC0: .4byte gDispIo

	thumb_func_start func_fe6_0809AEC4
func_fe6_0809AEC4: @ 0x0809AEC4
	push {lr}
	movs r0, #0xd
	movs r1, #1
	bl func_fe6_08014ACC
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_fe6_0809AED4
func_fe6_0809AED4: @ 0x0809AED4
	push {r4, r5, r6, lr}
	sub sp, #8
	movs r5, #0
	ldr r0, .L0809AF24 @ =gUnk_086914F8
	ldr r0, [r0]
	cmp r5, r0
	bge .L0809AF14
	movs r6, #4
.L0809AEE4:
	bl RandNextB
	movs r1, #0x1d
	bl DivRem
	adds r4, r0, #0
	bl RandNextB
	movs r1, #0x1d
	bl DivRem
	adds r2, r0, #0
	str r6, [sp]
	str r6, [sp, #4]
	ldr r0, .L0809AF28 @ =gBg0Tm
	adds r1, r4, #0
	ldr r3, .L0809AF2C @ =0x0000D001
	bl func_fe6_08014E30
	adds r5, #1
	ldr r0, .L0809AF24 @ =gUnk_086914F8
	ldr r0, [r0]
	cmp r5, r0
	blt .L0809AEE4
.L0809AF14:
	movs r0, #1
	bl EnableBgSync
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L0809AF24: .4byte gUnk_086914F8
.L0809AF28: .4byte gBg0Tm
.L0809AF2C: .4byte 0x0000D001

	thumb_func_start func_fe6_0809AF30
func_fe6_0809AF30: @ 0x0809AF30
	push {lr}
	sub sp, #4
	adds r1, r0, #0
	ldr r0, .L0809AF4C @ =bool_opanim_03005284
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq .L0809AF50
	adds r0, r1, #0
	bl Proc_End
	b .L0809AF6E
	.align 2, 0
.L0809AF4C: .4byte bool_opanim_03005284
.L0809AF50:
	bl func_fe6_0809B188
	movs r0, #0xd
	bl EnableBgSync
	movs r0, #2
	bl OpAnim_SetupGlyph
	movs r0, #1
	str r0, [sp]
	movs r1, #0
	movs r2, #1
	movs r3, #0
	bl OpAnim_SetWin0Layers
.L0809AF6E:
	add sp, #4
	pop {r0}
	bx r0

	thumb_func_start func_fe6_0809AF74
func_fe6_0809AF74: @ 0x0809AF74
	adds r1, r0, #0
	adds r1, #0x64
	movs r2, #0
	strh r2, [r1]
	adds r0, #0x66
	strh r2, [r0]
	bx lr
	.align 2, 0

	thumb_func_start func_fe6_0809AF84
func_fe6_0809AF84: @ 0x0809AF84
	push {r4, r5, lr}
	adds r0, #0x64
	ldrh r1, [r0]
	adds r1, #1
	strh r1, [r0]
	movs r3, #0
	ldrsh r2, [r0, r3]
	ldr r0, .L0809AFDC @ =gUnk_086914F0
	ldr r0, [r0]
	adds r3, r2, #0
	muls r3, r0, r3
	ldr r0, .L0809AFE0 @ =gUnk_086914F4
	ldr r0, [r0]
	adds r5, r2, #0
	muls r5, r0, r5
	movs r0, #1
	ands r1, r0
	movs r4, #0x30
	cmp r1, #0
	beq .L0809AFAE
	movs r4, #0
.L0809AFAE:
	adds r1, r3, r4
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	adds r2, r4, #0
	subs r2, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #0
	bl SetBgOffset
	adds r1, r5, #0
	adds r1, #0x18
	adds r1, r1, r4
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	adds r2, r4, #0
	adds r2, #8
	movs r0, #1
	bl SetBgOffset
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0809AFDC: .4byte gUnk_086914F0
.L0809AFE0: .4byte gUnk_086914F4

	thumb_func_start func_fe6_0809AFE4
func_fe6_0809AFE4: @ 0x0809AFE4
	push {r4, lr}
	adds r4, r0, #0
	bl func_fe6_0809AF84
	adds r4, #0x66
	ldrh r1, [r4]
	adds r1, #1
	strh r1, [r4]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x13
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #2
	movs r2, #0
	bl SetBgOffset
	ldrh r4, [r4]
	lsls r1, r4, #0x10
	asrs r1, r1, #0x13
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #3
	movs r2, #0
	bl SetBgOffset
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start func_fe6_0809B01C
func_fe6_0809B01C: @ 0x0809B01C
	adds r0, #0x64
	movs r1, #0
	strh r1, [r0]
	bx lr

	thumb_func_start func_fe6_0809B024
func_fe6_0809B024: @ 0x0809B024
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r1, r0, #0
	adds r6, r1, #0
	adds r6, #0x64
	ldrh r0, [r6]
	adds r0, #1
	strh r0, [r6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x1f
	ble .L0809B042
	adds r0, r1, #0
	bl Proc_Break
.L0809B042:
	ldr r5, .L0809B090 @ =gDispIo
	adds r2, r5, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	movs r0, #0
	ldrsh r3, [r6, r0]
	movs r4, #0x20
	str r4, [sp]
	movs r0, #0
	movs r1, #6
	movs r2, #4
	bl Interpolate
	adds r1, r5, #0
	adds r1, #0x44
	strb r0, [r1]
	movs r1, #0
	ldrsh r3, [r6, r1]
	str r4, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0x10
	bl Interpolate
	adds r1, r5, #0
	adds r1, #0x45
	strb r0, [r1]
	adds r1, #1
	movs r0, #0
	strb r0, [r1]
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L0809B090: .4byte gDispIo

	thumb_func_start func_fe6_0809B094
func_fe6_0809B094: @ 0x0809B094
	adds r1, r0, #0
	adds r1, #0x64
	movs r2, #0
	strh r2, [r1]
	adds r0, #0x66
	strh r2, [r0]
	bx lr
	.align 2, 0

	thumb_func_start func_fe6_0809B0A4
func_fe6_0809B0A4: @ 0x0809B0A4
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x64
	ldrh r0, [r1]
	adds r0, #0xa0
	strh r0, [r1]
	adds r4, #0x66
	ldrh r0, [r4]
	adds r0, #0x40
	strh r0, [r4]
	ldrh r1, [r1]
	lsls r2, r1, #0x10
	asrs r2, r2, #0x18
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #0
	movs r1, #0
	bl SetBgOffset
	ldrh r4, [r4]
	lsls r0, r4, #0x10
	asrs r0, r0, #0x18
	movs r2, #0xb4
	subs r2, r2, r0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	movs r1, #0
	bl SetBgOffset
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start func_fe6_0809B0E8
func_fe6_0809B0E8: @ 0x0809B0E8
	push {r4, r5, lr}
	ldr r0, .L0809B180 @ =BgConf_OpAnim_086920A0
	bl InitBgs
	movs r0, #0xf
	bl DisableBgSync
	ldr r0, .L0809B184 @ =gDispIo
	mov ip, r0
	movs r0, #8
	rsbs r0, r0, #0
	mov r1, ip
	ldrb r1, [r1]
	ands r0, r1
	mov r2, ip
	strb r0, [r2]
	movs r3, #1
	ldrb r1, [r2, #1]
	orrs r1, r3
	movs r0, #2
	orrs r1, r0
	movs r0, #5
	rsbs r0, r0, #0
	ands r1, r0
	subs r0, #4
	ands r1, r0
	movs r0, #0x10
	orrs r1, r0
	movs r2, #4
	rsbs r2, r2, #0
	adds r0, r2, #0
	mov r4, ip
	ldrb r4, [r4, #0xc]
	ands r0, r4
	mov r5, ip
	strb r0, [r5, #0xc]
	adds r0, r2, #0
	ldrb r4, [r5, #0x10]
	ands r0, r4
	strb r0, [r5, #0x10]
	adds r0, r2, #0
	ldrb r5, [r5, #0x14]
	ands r0, r5
	orrs r0, r3
	mov r3, ip
	strb r0, [r3, #0x14]
	ldrb r4, [r3, #0x18]
	ands r2, r4
	strb r2, [r3, #0x18]
	movs r0, #0x21
	rsbs r0, r0, #0
	ands r1, r0
	subs r0, #0x20
	ands r1, r0
	movs r0, #0x7f
	ands r1, r0
	strb r1, [r3, #1]
	mov r1, ip
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r5, [r1]
	ands r0, r5
	strb r0, [r1]
	adds r1, #8
	movs r2, #0
	movs r0, #0x10
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x45
	strb r2, [r0]
	adds r0, #1
	strb r2, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0809B180: .4byte BgConf_OpAnim_086920A0
.L0809B184: .4byte gDispIo

	thumb_func_start func_fe6_0809B188
func_fe6_0809B188: @ 0x0809B188
	push {lr}
	ldr r0, .L0809B210 @ =BgConf_OpAnim_086920B8
	bl InitBgs
	movs r0, #0xf
	bl DisableBgSync
	ldr r3, .L0809B214 @ =gDispIo
	movs r0, #8
	rsbs r0, r0, #0
	ldrb r1, [r3]
	ands r0, r1
	strb r0, [r3]
	movs r0, #1
	ldrb r2, [r3, #1]
	orrs r0, r2
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #9
	rsbs r1, r1, #0
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
	strb r0, [r3, #1]
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
	movs r0, #6
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x45
	strb r2, [r0]
	adds r0, #1
	strb r2, [r0]
	ldr r0, .L0809B218 @ =0x0000FFE0
	ldrh r2, [r3, #0x3c]
	ands r0, r2
	movs r1, #1
	orrs r0, r1
	ldr r1, .L0809B21C @ =0x0000E0FF
	ands r0, r1
	movs r2, #0x80
	lsls r2, r2, #3
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r3, #0x3c]
	bl SetAllBlackPals
	pop {r0}
	bx r0
	.align 2, 0
.L0809B210: .4byte BgConf_OpAnim_086920B8
.L0809B214: .4byte gDispIo
.L0809B218: .4byte 0x0000FFE0
.L0809B21C: .4byte 0x0000E0FF

	thumb_func_start func_fe6_0809B220
func_fe6_0809B220: @ 0x0809B220
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r4, r0, #0
	adds r5, r2, #0
	adds r7, r3, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov r8, r1
	movs r2, #0
.L0809B236:
	movs r0, #0
	adds r2, r2, r7
	mov sb, r2
	cmp r0, r7
	bge .L0809B26C
.L0809B240:
	movs r2, #0
	adds r1, r0, #1
	mov ip, r1
	lsls r6, r0, #5
.L0809B248:
	movs r1, #0
	adds r3, r2, r5
	cmp r1, r5
	bge .L0809B260
	mov r0, r8
	adds r2, r0, r6
.L0809B254:
	adds r0, r2, r1
	strh r0, [r4]
	adds r4, #2
	adds r1, #1
	cmp r1, r5
	blt .L0809B254
.L0809B260:
	adds r2, r3, #0
	cmp r2, #0x1f
	ble .L0809B248
	mov r0, ip
	cmp r0, r7
	blt .L0809B240
.L0809B26C:
	mov r2, sb
	cmp r2, #0x1f
	ble .L0809B236
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_fe6_0809B280
func_fe6_0809B280: @ 0x0809B280
	push {r4, lr}
	adds r1, r0, #0
	ldr r0, .L0809B298 @ =bool_opanim_03005284
	movs r4, #0
	ldrsb r4, [r0, r4]
	cmp r4, #0
	beq .L0809B29C
	adds r0, r1, #0
	bl Proc_End
	b .L0809B2E8
	.align 2, 0
.L0809B298: .4byte bool_opanim_03005284
.L0809B29C:
	bl OpAnim6_ResetBG
	bl SetAllBlackPals
	ldr r2, .L0809B2F0 @ =gDispIo
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r1, [r2, #1]
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
	strb r0, [r2, #1]
	adds r1, r2, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r3, [r1]
	ands r0, r3
	strb r0, [r1]
	adds r1, #8
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x45
	strb r4, [r0]
	adds r0, #1
	strb r4, [r0]
	movs r0, #0
	bl OpAnim_SetupGlyph
	bl PutOpAnimSubtitle6
.L0809B2E8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0809B2F0: .4byte gDispIo
