	.include "macro.inc"

	.syntax unified

	thumb_func_start PostGameOverHandler
PostGameOverHandler: @ 0x080987B8
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	movs r0, #0
	bl SetNextGameAction
	ldr r0, [r7]
	bl EventEndBattleMap
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start func_fe6_080987D4
func_fe6_080987D4: @ 0x080987D4
	push {lr}
	ldr r0, .L080987E4 @ =ProcScr_OpeningSequence
	movs r1, #3
	bl SpawnProc
	pop {r0}
	bx r0
	.align 2, 0
.L080987E4: .4byte ProcScr_OpeningSequence

	thumb_func_start func_fe6_080987E8
func_fe6_080987E8: @ 0x080987E8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, .L08098824 @ =gKeySt
	ldr r1, [r0]
	movs r0, #0xb
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq .L0809881C
	movs r0, #2
	bl SetNextGameAction
	ldr r1, .L08098828 @ =gUnk_03005284
	movs r0, #1
	strb r0, [r1]
	movs r0, #9
	bl Proc_EndEachMarked
	bl func_fe6_0809882C
	movs r0, #1
	bl FadeBgmOut
	adds r0, r4, #0
	bl Proc_Break
.L0809881C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08098824: .4byte gKeySt
.L08098828: .4byte gUnk_03005284

	thumb_func_start func_fe6_0809882C
func_fe6_0809882C: @ 0x0809882C
	push {r4, lr}
	ldr r1, .L0809885C @ =gPal
	movs r2, #0
	movs r0, #0
	strh r0, [r1]
	ldr r3, .L08098860 @ =gDispIo
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
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0809885C: .4byte gPal
.L08098860: .4byte gDispIo

	thumb_func_start func_fe6_08098864
func_fe6_08098864: @ 0x08098864
	bx lr
	.align 2, 0

	thumb_func_start func_fe6_08098868
func_fe6_08098868: @ 0x08098868
	push {lr}
	ldr r0, .L080988B0 @ =gUnk_08691604
	bl InitBgs
	ldr r2, .L080988B4 @ =gDispIo
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
	bl SetAllBlackPals
	bl EnablePalSync
	movs r0, #0
	bl func_fe6_08098AD8
	ldr r1, .L080988B8 @ =gUnk_03005284
	movs r0, #0
	strb r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
.L080988B0: .4byte gUnk_08691604
.L080988B4: .4byte gDispIo
.L080988B8: .4byte gUnk_03005284

	thumb_func_start func_fe6_080988BC
func_fe6_080988BC: @ 0x080988BC
	bx lr
	.align 2, 0

	thumb_func_start func_fe6_080988C0
func_fe6_080988C0: @ 0x080988C0
	push {lr}
	ldr r0, .L08098924 @ =gUnk_0869161C
	bl InitBgs
	bl func_fe6_08015344
	ldr r3, .L08098928 @ =gDispIo
	movs r0, #8
	rsbs r0, r0, #0
	ldrb r1, [r3]
	ands r0, r1
	strb r0, [r3]
	movs r0, #1
	ldrb r2, [r3, #1]
	orrs r0, r2
	movs r1, #2
	orrs r0, r1
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
	strb r0, [r3, #1]
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
.L08098924: .4byte gUnk_0869161C
.L08098928: .4byte gDispIo

	thumb_func_start func_fe6_0809892C
func_fe6_0809892C: @ 0x0809892C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	str r3, [sp]
	ldr r7, .L080989F4 @ =gDispIo
	movs r3, #0x20
	mov ip, r3
	mov r4, ip
	ldrb r5, [r7, #1]
	orrs r4, r5
	movs r5, #0x41
	rsbs r5, r5, #0
	ands r4, r5
	movs r5, #0x7f
	ands r4, r5
	strb r4, [r7, #1]
	adds r5, r7, #0
	adds r5, #0x2d
	movs r4, #0
	strb r4, [r5]
	adds r5, #4
	movs r4, #0x10
	strb r4, [r5]
	subs r5, #5
	movs r4, #0xf0
	strb r4, [r5]
	adds r5, #4
	movs r4, #0x90
	strb r4, [r5]
	movs r3, #0x34
	adds r3, r3, r7
	mov sl, r3
	movs r6, #1
	ands r0, r6
	subs r4, #0x92
	ldrb r5, [r3]
	ands r4, r5
	orrs r4, r0
	ands r1, r6
	lsls r1, r1, #1
	movs r0, #3
	rsbs r0, r0, #0
	mov sb, r0
	ands r4, r0
	orrs r4, r1
	ands r2, r6
	lsls r2, r2, #2
	movs r3, #5
	rsbs r3, r3, #0
	mov r8, r3
	ands r4, r3
	orrs r4, r2
	ldr r5, [sp]
	ands r5, r6
	lsls r3, r5, #3
	movs r2, #9
	rsbs r2, r2, #0
	ands r4, r2
	orrs r4, r3
	ldr r0, [sp, #0x24]
	ands r0, r6
	lsls r1, r0, #4
	movs r0, #0x11
	rsbs r0, r0, #0
	ands r4, r0
	orrs r4, r1
	adds r1, r7, #0
	adds r1, #0x36
	movs r5, #2
	rsbs r5, r5, #0
	ldrb r3, [r1]
	ands r5, r3
	mov r3, sb
	ands r5, r3
	mov r3, r8
	ands r5, r3
	ands r5, r2
	ands r5, r0
	mov r0, ip
	orrs r4, r0
	mov r3, sl
	strb r4, [r3]
	movs r0, #0x21
	rsbs r0, r0, #0
	ands r5, r0
	strb r5, [r1]
	bl EnablePalSync
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L080989F4: .4byte gDispIo

	thumb_func_start func_fe6_080989F8
func_fe6_080989F8: @ 0x080989F8
	push {lr}
	ldr r0, .L08098A14 @ =gUnk_03005284
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne .L08098A0E
	movs r0, #0x42
	movs r1, #0
	bl StartBgmCore
.L08098A0E:
	pop {r0}
	bx r0
	.align 2, 0
.L08098A14: .4byte gUnk_03005284

	thumb_func_start func_fe6_08098A18
func_fe6_08098A18: @ 0x08098A18
	push {r4, lr}
	adds r1, r0, #0
	ldr r4, .L08098A3C @ =gUnk_08691634
	ldr r3, .L08098A40 @ =gUnk_03005290
	movs r0, #0
	adds r2, r3, #0
	adds r2, #0x1c
.L08098A26:
	str r0, [r2]
	subs r2, #4
	cmp r2, r3
	bge .L08098A26
	adds r0, r4, #0
	bl SpawnProc
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08098A3C: .4byte gUnk_08691634
.L08098A40: .4byte gUnk_03005290

	thumb_func_start func_fe6_08098A44
func_fe6_08098A44: @ 0x08098A44
	movs r1, #0
	str r1, [r0, #0x54]
	bx lr
	.align 2, 0

	thumb_func_start func_fe6_08098A4C
func_fe6_08098A4C: @ 0x08098A4C
	ldr r1, [r0, #0x54]
	adds r1, #1
	str r1, [r0, #0x54]
	bx lr

	thumb_func_start func_fe6_08098A54
func_fe6_08098A54: @ 0x08098A54
	push {lr}
	ldr r0, .L08098A70 @ =gUnk_08691634
	bl FindProc
	ldr r2, .L08098A74 @ =gUnk_03005290
	ldr r1, [r2]
	adds r1, #1
	str r1, [r2]
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r0, [r0, #0x54]
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
.L08098A70: .4byte gUnk_08691634
.L08098A74: .4byte gUnk_03005290

	thumb_func_start func_fe6_08098A78
func_fe6_08098A78: @ 0x08098A78
	push {lr}
	movs r0, #0
	bl func_fe6_08098AFC
	pop {r0}
	bx r0

	thumb_func_start func_fe6_08098A84
func_fe6_08098A84: @ 0x08098A84
	push {lr}
	movs r0, #1
	bl func_fe6_08098AFC
	pop {r0}
	bx r0

	thumb_func_start func_fe6_08098A90
func_fe6_08098A90: @ 0x08098A90
	push {lr}
	movs r0, #2
	bl func_fe6_08098AFC
	pop {r0}
	bx r0

	thumb_func_start func_fe6_08098A9C
func_fe6_08098A9C: @ 0x08098A9C
	push {lr}
	movs r0, #3
	bl func_fe6_08098AFC
	pop {r0}
	bx r0

	thumb_func_start func_fe6_08098AA8
func_fe6_08098AA8: @ 0x08098AA8
	push {lr}
	movs r0, #4
	bl func_fe6_08098AFC
	pop {r0}
	bx r0

	thumb_func_start func_fe6_08098AB4
func_fe6_08098AB4: @ 0x08098AB4
	push {lr}
	movs r0, #5
	bl func_fe6_08098AFC
	pop {r0}
	bx r0

	thumb_func_start func_fe6_08098AC0
func_fe6_08098AC0: @ 0x08098AC0
	push {lr}
	movs r0, #6
	bl func_fe6_08098AFC
	pop {r0}
	bx r0

	thumb_func_start func_fe6_08098ACC
func_fe6_08098ACC: @ 0x08098ACC
	push {lr}
	movs r0, #7
	bl func_fe6_08098AFC
	pop {r0}
	bx r0

	thumb_func_start func_fe6_08098AD8
func_fe6_08098AD8: @ 0x08098AD8
	push {lr}
	lsls r0, r0, #5
	ldr r1, .L08098AF8 @ =gUnk_08380ECC
	adds r0, r0, r1
	movs r1, #0xf8
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	bl func_fe6_0809937C
	bl func_fe6_08099404
	pop {r0}
	bx r0
	.align 2, 0
.L08098AF8: .4byte gUnk_08380ECC

	thumb_func_start func_fe6_08098AFC
func_fe6_08098AFC: @ 0x08098AFC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r7, r0, #0
	ldr r1, .L08098B74 @ =gUnk_08691738
	lsls r0, r7, #2
	adds r0, r0, r1
	ldr r0, [r0]
	bl DecodeMsg
	adds r4, r0, #0
	ldr r2, .L08098B78 @ =gUnk_08691778
	lsls r1, r7, #1
	adds r1, r1, r7
	lsls r1, r1, #2
	adds r0, r2, #0
	adds r0, #8
	adds r0, r1, r0
	ldr r6, [r0]
	adds r1, r1, r2
	ldrh r5, [r1]
	movs r0, #0
	mov r8, r0
	cmp r4, #0
	beq .L08098B66
	mov sb, r1
	ldr r1, .L08098B7C @ =gUnk_08691498
	mov sl, r1
.L08098B38:
	adds r0, r7, #0
	adds r1, r5, #0
	mov r2, r8
	adds r3, r4, #0
	bl func_fe6_08098B80
	adds r0, r4, #0
	bl func_fe6_08099358
	adds r4, r0, #0
	adds r5, #0x14
	mov r1, sb
	ldrh r0, [r1, #2]
	cmp r0, #0
	beq .L08098B62
	mov r1, sl
	ldr r0, [r1]
	ldrh r1, [r6]
	adds r0, r1, r0
	add r8, r0
	adds r6, #2
.L08098B62:
	cmp r4, #0
	bne .L08098B38
.L08098B66:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08098B74: .4byte gUnk_08691738
.L08098B78: .4byte gUnk_08691778
.L08098B7C: .4byte gUnk_08691498

	thumb_func_start func_fe6_08098B80
func_fe6_08098B80: @ 0x08098B80
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	mov r8, r0
	adds r6, r1, #0
	adds r4, r2, #0
	adds r5, r3, #0
	ldr r0, .L08098BB0 @ =gUnk_086917D8
	movs r1, #3
	bl SpawnProc
	adds r1, r0, #0
	adds r1, #0x44
	strh r4, [r1]
	str r5, [r0, #0x4c]
	str r6, [r0, #0x30]
	mov r1, r8
	str r1, [r0, #0x54]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08098BB0: .4byte gUnk_086917D8

	thumb_func_start func_fe6_08098BB4
func_fe6_08098BB4: @ 0x08098BB4
	adds r0, #0x44
	movs r1, #0
	strh r1, [r0]
	bx lr

	thumb_func_start func_fe6_08098BBC
func_fe6_08098BBC: @ 0x08098BBC
	push {lr}
	adds r2, r0, #0
	adds r1, r2, #0
	adds r1, #0x44
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	cmp r0, #0
	bgt .L08098BD6
	adds r0, r2, #0
	bl Proc_Break
.L08098BD6:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_fe6_08098BDC
func_fe6_08098BDC: @ 0x08098BDC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x4c]
	bl func_fe6_08099328
	movs r1, #0xf0
	subs r1, r1, r0
	lsrs r0, r1, #0x1f
	adds r1, r1, r0
	asrs r1, r1, #1
	str r1, [r4, #0x2c]
	adds r4, #0x64
	movs r0, #0
	strh r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_fe6_08098C00
func_fe6_08098C00: @ 0x08098C00
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r6, [r5, #0x4c]
	ldr r1, [r5, #0x54]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, .L08098C38 @ =gUnk_08691778
	adds r7, r0, r1
	adds r1, r5, #0
	adds r1, #0x64
	movs r0, #1
	ldrh r2, [r1]
	subs r0, r0, r2
	strh r0, [r1]
	lsls r0, r0, #0x10
	cmp r0, #0
	beq .L08098C88
.L08098C24:
	ldrb r0, [r6]
	cmp r0, #0
	blt .L08098C3C
	cmp r0, #1
	ble .L08098C78
	cmp r0, #4
	bne .L08098C3C
	adds r6, #1
	b .L08098C80
	.align 2, 0
.L08098C38: .4byte gUnk_08691778
.L08098C3C:
	ldr r0, .L08098C74 @ =gUnk_08691858
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	ldr r0, [r5, #0x54]
	str r0, [r4, #0x54]
	ldr r0, [r5, #0x2c]
	str r0, [r4, #0x2c]
	ldr r0, [r5, #0x30]
	movs r1, #0xff
	ands r0, r1
	ldrh r1, [r7, #4]
	adds r0, r1, r0
	str r0, [r4, #0x30]
	adds r0, r6, #0
	bl func_fe6_080992DC
	adds r4, #0x4a
	strh r0, [r4]
	adds r0, r6, #0
	bl func_fe6_08099314
	ldr r1, [r5, #0x2c]
	adds r1, r1, r0
	str r1, [r5, #0x2c]
	adds r6, #2
	b .L08098C80
	.align 2, 0
.L08098C74: .4byte gUnk_08691858
.L08098C78:
	adds r0, r5, #0
	bl Proc_Break
	b .L08098C88
.L08098C80:
	str r6, [r5, #0x4c]
	ldrh r0, [r7, #2]
	cmp r0, #0
	beq .L08098C24
.L08098C88:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_fe6_08098C90
func_fe6_08098C90: @ 0x08098C90
	bx lr
	.align 2, 0

	thumb_func_start func_fe6_08098C94
func_fe6_08098C94: @ 0x08098C94
	push {lr}
	ldr r0, .L08098CA0 @ =gUnk_08691858
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
.L08098CA0: .4byte gUnk_08691858

	thumb_func_start func_fe6_08098CA4
func_fe6_08098CA4: @ 0x08098CA4
	push {lr}
	ldr r0, .L08098CB8 @ =0x02002800
	movs r1, #0
	str r1, [r0]
	ldr r0, .L08098CBC @ =gUnk_08691858
	bl Proc_BreakEach
	pop {r0}
	bx r0
	.align 2, 0
.L08098CB8: .4byte 0x02002800
.L08098CBC: .4byte gUnk_08691858

	thumb_func_start func_fe6_08098CC0
func_fe6_08098CC0: @ 0x08098CC0
	push {r4, r5, lr}
	adds r0, #0x64
	movs r4, #0
	movs r1, #0
	strh r1, [r0]
	ldr r2, .L08098D04 @ =gDispIo+0x3C
	ldr r0, .L08098D08 @ =0x0000FFE0
	ldrh r1, [r2]
	ands r0, r1
	movs r3, #0x10
	orrs r0, r3
	ldr r1, .L08098D0C @ =0x0000E0FF
	ands r0, r1
	movs r5, #0xe0
	lsls r5, r5, #3
	adds r1, r5, #0
	orrs r0, r1
	strh r0, [r2]
	movs r0, #0x20
	ldrb r1, [r2, #1]
	orrs r0, r1
	strb r0, [r2, #1]
	movs r0, #0x3f
	ldrb r5, [r2]
	ands r0, r5
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	strb r3, [r2, #8]
	strb r4, [r2, #9]
	strb r4, [r2, #0xa]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08098D04: .4byte gDispIo+0x3C
.L08098D08: .4byte 0x0000FFE0
.L08098D0C: .4byte 0x0000E0FF

	thumb_func_start func_fe6_08098D10
func_fe6_08098D10: @ 0x08098D10
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r6, r4, #0
	adds r6, #0x64
	ldrh r1, [r6]
	movs r2, #0
	ldrsh r0, [r6, r2]
	cmp r0, #0x1f
	bgt .L08098D78
	adds r0, r1, #1
	movs r5, #0
	strh r0, [r6]
	ldr r7, .L08098D74 @ =gDispIo
	adds r2, r7, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	movs r2, #0
	ldrsh r3, [r6, r2]
	movs r4, #0x20
	str r4, [sp]
	movs r0, #0
	movs r1, #0x10
	movs r2, #0
	bl Interpolate
	adds r1, r7, #0
	adds r1, #0x44
	strb r0, [r1]
	movs r0, #0
	ldrsh r3, [r6, r0]
	str r4, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0x10
	bl Interpolate
	adds r1, r7, #0
	adds r1, #0x45
	strb r0, [r1]
	adds r0, r7, #0
	adds r0, #0x46
	strb r5, [r0]
	b .L08098DA2
	.align 2, 0
.L08098D74: .4byte gDispIo
.L08098D78:
	ldr r3, .L08098DAC @ =gDispIo
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
	bl func_fe6_08098C94
	adds r0, r4, #0
	bl Proc_Break
.L08098DA2:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08098DAC: .4byte gDispIo

	thumb_func_start func_fe6_08098DB0
func_fe6_08098DB0: @ 0x08098DB0
	adds r0, #0x64
	movs r3, #0
	movs r1, #0
	strh r1, [r0]
	ldr r1, .L08098DE0 @ =gDispIo+0x3C
	ldr r0, .L08098DE4 @ =0x0000FFE0
	ldrh r2, [r1]
	ands r0, r2
	ldr r2, .L08098DE8 @ =0x0000E0FF
	ands r0, r2
	strh r0, [r1]
	movs r0, #0x20
	ldrb r2, [r1, #1]
	orrs r0, r2
	strb r0, [r1, #1]
	movs r0, #0x3f
	ldrb r2, [r1]
	ands r0, r2
	strb r0, [r1]
	movs r0, #0x10
	strb r0, [r1, #8]
	strb r3, [r1, #9]
	strb r3, [r1, #0xa]
	bx lr
	.align 2, 0
.L08098DE0: .4byte gDispIo+0x3C
.L08098DE4: .4byte 0x0000FFE0
.L08098DE8: .4byte 0x0000E0FF

	thumb_func_start func_fe6_08098DEC
func_fe6_08098DEC: @ 0x08098DEC
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r2, r4, #0
	adds r2, #0x64
	ldrh r1, [r2]
	movs r3, #0
	ldrsh r0, [r2, r3]
	cmp r0, #0x1f
	bgt .L08098E3C
	adds r0, r1, #1
	movs r4, #0
	strh r0, [r2]
	ldr r5, .L08098E38 @ =gDispIo
	adds r1, r5, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r3, [r1]
	ands r0, r3
	strb r0, [r1]
	movs r0, #0
	ldrsh r3, [r2, r0]
	movs r0, #0x20
	str r0, [sp]
	movs r0, #0
	movs r1, #0x10
	movs r2, #0
	bl Interpolate
	adds r1, r5, #0
	adds r1, #0x44
	strb r0, [r1]
	adds r0, r5, #0
	adds r0, #0x45
	strb r4, [r0]
	adds r0, #1
	strb r4, [r0]
	b .L08098E66
	.align 2, 0
.L08098E38: .4byte gDispIo
.L08098E3C:
	ldr r3, .L08098E70 @ =gDispIo
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
	bl func_fe6_08098C94
	adds r0, r4, #0
	bl Proc_Break
.L08098E66:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08098E70: .4byte gDispIo

	thumb_func_start func_fe6_08098E74
func_fe6_08098E74: @ 0x08098E74
	push {r4, lr}
	adds r0, #0x64
	movs r3, #0
	movs r1, #0
	strh r1, [r0]
	ldr r2, .L08098EBC @ =gDispIo+0x3C
	ldr r0, .L08098EC0 @ =0x0000FFE0
	ldrh r1, [r2]
	ands r0, r1
	movs r1, #4
	orrs r0, r1
	ldr r1, .L08098EC4 @ =0x0000E0FF
	ands r0, r1
	movs r4, #0x80
	lsls r4, r4, #5
	adds r1, r4, #0
	orrs r0, r1
	strh r0, [r2]
	movs r0, #0x21
	rsbs r0, r0, #0
	ldrb r1, [r2, #1]
	ands r0, r1
	strb r0, [r2, #1]
	movs r0, #0x3f
	ldrb r4, [r2]
	ands r0, r4
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	strb r3, [r2, #8]
	movs r0, #0x10
	strb r0, [r2, #9]
	strb r3, [r2, #0xa]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08098EBC: .4byte gDispIo+0x3C
.L08098EC0: .4byte 0x0000FFE0
.L08098EC4: .4byte 0x0000E0FF

	thumb_func_start func_fe6_08098EC8
func_fe6_08098EC8: @ 0x08098EC8
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r6, r4, #0
	adds r6, #0x64
	ldrh r1, [r6]
	movs r2, #0
	ldrsh r0, [r6, r2]
	cmp r0, #0x1f
	bgt .L08098F30
	adds r0, r1, #1
	movs r5, #0
	strh r0, [r6]
	ldr r7, .L08098F2C @ =gDispIo
	adds r2, r7, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	movs r2, #0
	ldrsh r3, [r6, r2]
	movs r4, #0x20
	str r4, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0x10
	bl Interpolate
	adds r1, r7, #0
	adds r1, #0x44
	strb r0, [r1]
	movs r0, #0
	ldrsh r3, [r6, r0]
	str r4, [sp]
	movs r0, #0
	movs r1, #0x10
	movs r2, #0
	bl Interpolate
	adds r1, r7, #0
	adds r1, #0x45
	strb r0, [r1]
	adds r0, r7, #0
	adds r0, #0x46
	strb r5, [r0]
	b .L08098F5A
	.align 2, 0
.L08098F2C: .4byte gDispIo
.L08098F30:
	ldr r3, .L08098F64 @ =gDispIo
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
	bl func_fe6_08098C94
	adds r0, r4, #0
	bl Proc_Break
.L08098F5A:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08098F64: .4byte gDispIo

	thumb_func_start func_fe6_08098F68
func_fe6_08098F68: @ 0x08098F68
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x64
	movs r0, #0
	strh r0, [r1]
	adds r5, r4, #0
	adds r5, #0x4a
	ldrh r0, [r5]
	bl func_fe6_08099424
	ldrh r0, [r5]
	ldr r3, .L08098FA0 @ =gUnk_08691778
	ldr r2, [r4, #0x54]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r3
	ldrh r1, [r1, #2]
	adds r2, r4, #0
	bl func_fe6_0809947C
	ldr r1, .L08098FA4 @ =0xFFFFF000
	adds r0, r0, r1
	strh r0, [r5]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08098FA0: .4byte gUnk_08691778
.L08098FA4: .4byte 0xFFFFF000

	thumb_func_start func_fe6_08098FA8
func_fe6_08098FA8: @ 0x08098FA8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r7, r0, #0
	ldr r3, [r7, #0x58]
	ldr r1, .L08098FD8 @ =gUnk_08691494
	ldr r0, [r1]
	cmp r3, r0
	blt .L08098FDC
	movs r0, #0
	str r0, [r7, #0x58]
	ldr r0, [r7, #0x54]
	bl func_fe6_080993E8
	adds r0, r7, #0
	bl Proc_Break
	adds r0, r7, #0
	bl func_fe6_080990B8
	b .L0809909C
	.align 2, 0
.L08098FD8: .4byte gUnk_08691494
.L08098FDC:
	adds r3, #1
	str r3, [r7, #0x58]
	ldr r2, [r7, #0x30]
	adds r1, r2, #0
	adds r1, #8
	str r0, [sp]
	movs r0, #4
	bl Interpolate
	adds r2, r0, #0
	movs r0, #0x80
	lsls r0, r0, #1
	mov sb, r0
	add r2, sb
	ldr r0, [r7, #0x54]
	lsls r0, r0, #9
	ldr r1, [r7, #0x2c]
	adds r1, r1, r0
	ldr r3, .L080990AC @ =Sprite_16x16
	adds r0, r7, #0
	adds r0, #0x4a
	ldrh r0, [r0]
	str r0, [sp]
	movs r0, #0
	bl PutSpriteExt
	ldr r5, .L080990B0 @ =gSinLut
	movs r1, #0x80
	adds r1, r1, r5
	mov sl, r1
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #4
	mov r1, sb
	bl Div
	mov r8, r0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	mov r8, r0
	movs r1, #0
	ldrsh r4, [r5, r1]
	rsbs r4, r4, #0
	lsls r4, r4, #4
	ldr r3, [r7, #0x58]
	ldr r2, .L080990B4 @ =gUnk_08691494
	ldr r0, [r2]
	str r0, [sp]
	movs r0, #4
	movs r1, #1
	mov r2, sb
	bl Interpolate
	adds r1, r0, #0
	adds r0, r4, #0
	bl Div
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	movs r1, #0
	ldrsh r0, [r5, r1]
	lsls r0, r0, #4
	mov r1, sb
	bl Div
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	mov r2, sl
	movs r0, #0
	ldrsh r4, [r2, r0]
	lsls r4, r4, #4
	ldr r3, [r7, #0x58]
	ldr r1, .L080990B4 @ =gUnk_08691494
	ldr r0, [r1]
	str r0, [sp]
	movs r0, #4
	movs r1, #1
	mov r2, sb
	bl Interpolate
	adds r1, r0, #0
	adds r0, r4, #0
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r1, [r7, #0x54]
	str r0, [sp]
	adds r0, r1, #0
	mov r1, r8
	adds r2, r6, #0
	adds r3, r5, #0
	bl SetObjAffine
.L0809909C:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L080990AC: .4byte Sprite_16x16
.L080990B0: .4byte gSinLut
.L080990B4: .4byte gUnk_08691494

	thumb_func_start func_fe6_080990B8
func_fe6_080990B8: @ 0x080990B8
	push {r4, r5, lr}
	sub sp, #4
	ldr r1, [r0, #0x2c]
	ldr r2, [r0, #0x30]
	ldr r3, .L080990E0 @ =Sprite_16x16
	movs r4, #0x4a
	adds r4, r4, r0
	adds r0, #0x64
	movs r5, #0
	ldrsh r0, [r0, r5]
	ldrh r4, [r4]
	adds r0, r4, r0
	str r0, [sp]
	movs r0, #0
	bl PutSpriteExt
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L080990E0: .4byte Sprite_16x16

	thumb_func_start func_fe6_080990E4
func_fe6_080990E4: @ 0x080990E4
	push {lr}
	bl func_fe6_08099520
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_fe6_080990F0
func_fe6_080990F0: @ 0x080990F0
	push {lr}
	bl func_fe6_080990B8
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_fe6_080990FC
func_fe6_080990FC: @ 0x080990FC
	push {r4, r5, r6, lr}
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6}
	sub sp, #4
	mov r8, r0
	bl func_fe6_080993AC
	mov r1, r8
	str r0, [r1, #0x54]
	movs r0, #1
	str r0, [r1, #0x58]
	ldr r4, .L08099190 @ =gSinLut
	movs r2, #0x80
	adds r2, r2, r4
	mov sl, r2
	movs r1, #0
	ldrsh r0, [r2, r1]
	lsls r0, r0, #4
	movs r1, #1
	bl Div
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	movs r2, #0
	ldrsh r0, [r4, r2]
	rsbs r0, r0, #0
	lsls r0, r0, #4
	movs r1, #0x80
	lsls r1, r1, #1
	mov sb, r1
	bl Div
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	movs r2, #0
	ldrsh r0, [r4, r2]
	lsls r0, r0, #4
	movs r1, #1
	bl Div
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	mov r1, sl
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #4
	mov r1, sb
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	mov r2, r8
	ldr r1, [r2, #0x54]
	str r0, [sp]
	adds r0, r1, #0
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl SetObjAffine
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08099190: .4byte gSinLut

	thumb_func_start func_fe6_08099194
func_fe6_08099194: @ 0x08099194
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r7, r0, #0
	ldr r0, .L080991C0 @ =gUnk_08691494
	mov sl, r0
	ldr r3, [r7, #0x58]
	ldr r0, [r0]
	cmp r3, r0
	blt .L080991C4
	movs r0, #0
	str r0, [r7, #0x58]
	ldr r0, [r7, #0x54]
	bl func_fe6_080993E8
	adds r0, r7, #0
	bl Proc_Break
	b .L0809929A
	.align 2, 0
.L080991C0: .4byte gUnk_08691494
.L080991C4:
	adds r3, #1
	str r3, [r7, #0x58]
	ldr r1, [r7, #0x2c]
	adds r2, r1, #0
	adds r2, #0x10
	str r0, [sp]
	movs r0, #4
	bl Interpolate
	adds r4, r0, #0
	ldr r0, [r7, #0x54]
	lsls r0, r0, #9
	adds r4, r4, r0
	ldr r1, [r7, #0x30]
	adds r2, r1, #0
	adds r2, #0x10
	ldr r3, [r7, #0x58]
	mov r5, sl
	ldr r0, [r5]
	str r0, [sp]
	movs r0, #4
	bl Interpolate
	adds r2, r0, #0
	movs r0, #0x80
	lsls r0, r0, #1
	mov sb, r0
	add r2, sb
	ldr r3, .L080992AC @ =Sprite_16x16
	adds r0, r7, #0
	adds r0, #0x4a
	ldrh r0, [r0]
	str r0, [sp]
	movs r0, #0
	adds r1, r4, #0
	bl PutSpriteExt
	ldr r1, .L080992B0 @ =gSinLut
	mov r8, r1
	ldr r2, .L080992B4 @ =gSinLut+0x80
	movs r5, #0
	ldrsh r4, [r2, r5]
	lsls r4, r4, #4
	ldr r3, [r7, #0x58]
	mov r1, sl
	ldr r0, [r1]
	str r0, [sp]
	movs r0, #0
	mov r1, sb
	movs r2, #2
	bl Interpolate
	adds r1, r0, #0
	adds r0, r4, #0
	bl Div
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	mov r2, r8
	movs r5, #0
	ldrsh r0, [r2, r5]
	rsbs r0, r0, #0
	lsls r0, r0, #4
	mov r1, sb
	bl Div
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	mov r0, r8
	movs r1, #0
	ldrsh r4, [r0, r1]
	lsls r4, r4, #4
	ldr r3, [r7, #0x58]
	mov r2, sl
	ldr r0, [r2]
	str r0, [sp]
	movs r0, #0
	mov r1, sb
	movs r2, #2
	bl Interpolate
	adds r1, r0, #0
	adds r0, r4, #0
	bl Div
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	ldr r1, .L080992B4 @ =gSinLut+0x80
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #4
	mov r1, sb
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r1, [r7, #0x54]
	str r0, [sp]
	adds r0, r1, #0
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl SetObjAffine
.L0809929A:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L080992AC: .4byte Sprite_16x16
.L080992B0: .4byte gSinLut
.L080992B4: .4byte gSinLut+0x80

	thumb_func_start func_fe6_080992B8
func_fe6_080992B8: @ 0x080992B8
	push {lr}
	ldr r0, .L080992C8 @ =gUnk_08691858
	ldr r1, .L080992CC @ =func_fe6_080992D0
	bl Proc_ForEach
	pop {r0}
	bx r0
	.align 2, 0
.L080992C8: .4byte gUnk_08691858
.L080992CC: .4byte func_fe6_080992D0

	thumb_func_start func_fe6_080992D0
func_fe6_080992D0: @ 0x080992D0
	adds r0, #0x64
	movs r1, #0x80
	lsls r1, r1, #4
	strh r1, [r0]
	bx lr
	.align 2, 0

	thumb_func_start func_fe6_080992DC
func_fe6_080992DC: @ 0x080992DC
	push {r4, r5, lr}
	ldr r2, .L080992FC @ =gUnk_08691644
	movs r3, #0
	ldrb r1, [r2]
	cmp r1, #0
	beq .L0809930A
	ldrb r4, [r0]
.L080992EA:
	cmp r1, r4
	bne .L08099300
	ldrb r1, [r2, #1]
	ldrb r5, [r0, #1]
	cmp r1, r5
	bne .L08099300
	adds r0, r3, #0
	b .L0809930C
	.align 2, 0
.L080992FC: .4byte gUnk_08691644
.L08099300:
	adds r3, #1
	adds r2, #2
	ldrb r1, [r2]
	cmp r1, #0
	bne .L080992EA
.L0809930A:
	movs r0, #0x40
.L0809930C:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start func_fe6_08099314
func_fe6_08099314: @ 0x08099314
	push {lr}
	bl func_fe6_080992DC
	ldr r1, .L08099324 @ =gUnk_086916E5
	adds r0, r0, r1
	ldrb r0, [r0]
	pop {r1}
	bx r1
	.align 2, 0
.L08099324: .4byte gUnk_086916E5

	thumb_func_start func_fe6_08099328
func_fe6_08099328: @ 0x08099328
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r5, #0
	b .L08099348
.L08099330:
	ldrb r0, [r4]
	cmp r0, #1
	beq .L0809934E
	cmp r0, #4
	bne .L0809933E
	adds r4, #1
	b .L08099348
.L0809933E:
	adds r0, r4, #0
	bl func_fe6_08099314
	adds r5, r5, r0
	adds r4, #2
.L08099348:
	ldrb r0, [r4]
	cmp r0, #0
	bne .L08099330
.L0809934E:
	adds r0, r5, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start func_fe6_08099358
func_fe6_08099358: @ 0x08099358
	adds r1, r0, #0
	b .L08099370
.L0809935C:
	ldrb r0, [r1]
	cmp r0, #1
	beq .L0809936A
	cmp r0, #4
	bne .L0809936E
	adds r1, #1
	b .L08099370
.L0809936A:
	adds r0, r1, #1
	b .L08099378
.L0809936E:
	adds r1, #2
.L08099370:
	ldrb r0, [r1]
	cmp r0, #0
	bne .L0809935C
	movs r0, #0
.L08099378:
	bx lr
	.align 2, 0

	thumb_func_start func_fe6_0809937C
func_fe6_0809937C: @ 0x0809937C
	push {r4, r5, r6, lr}
	movs r3, #0
	ldr r6, .L080993A8 @ =gUnk_03005280
	movs r4, #7
	movs r5, #1
.L08099386:
	asrs r2, r3, #3
	adds r2, r2, r6
	adds r1, r3, #0
	ands r1, r4
	adds r0, r5, #0
	lsls r0, r1
	ldrb r1, [r2]
	bics r1, r0
	adds r0, r1, #0
	strb r0, [r2]
	adds r3, #1
	cmp r3, #0x1f
	ble .L08099386
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L080993A8: .4byte gUnk_03005280

	thumb_func_start func_fe6_080993AC
func_fe6_080993AC: @ 0x080993AC
	push {r4, r5, r6, r7, lr}
	movs r4, #0
	ldr r7, .L080993D8 @ =gUnk_03005280
	movs r6, #7
	movs r5, #1
.L080993B6:
	asrs r0, r4, #3
	adds r3, r0, r7
	ldrb r2, [r3]
	adds r1, r4, #0
	ands r1, r6
	adds r0, r2, #0
	asrs r0, r1
	ands r0, r5
	cmp r0, #0
	bne .L080993DC
	adds r0, r5, #0
	lsls r0, r1
	orrs r2, r0
	strb r2, [r3]
	adds r0, r4, #0
	b .L080993E2
	.align 2, 0
.L080993D8: .4byte gUnk_03005280
.L080993DC:
	adds r4, #1
	cmp r4, #0x1f
	ble .L080993B6
.L080993E2:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start func_fe6_080993E8
func_fe6_080993E8: @ 0x080993E8
	ldr r1, .L08099400 @ =gUnk_03005280
	asrs r2, r0, #3
	adds r2, r2, r1
	movs r1, #7
	ands r1, r0
	movs r0, #1
	lsls r0, r1
	ldrb r1, [r2]
	bics r1, r0
	adds r0, r1, #0
	strb r0, [r2]
	bx lr
	.align 2, 0
.L08099400: .4byte gUnk_03005280

	thumb_func_start func_fe6_08099404
func_fe6_08099404: @ 0x08099404
	push {lr}
	ldr r0, .L08099418 @ =gUnk_0837F478
	ldr r1, .L0809941C @ =0x02000000
	bl Decompress
	ldr r1, .L08099420 @ =0x02002800
	movs r0, #0
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
.L08099418: .4byte gUnk_0837F478
.L0809941C: .4byte 0x02000000
.L08099420: .4byte 0x02002800

	thumb_func_start func_fe6_08099424
func_fe6_08099424: @ 0x08099424
	push {r4, r5, lr}
	adds r2, r0, #0
	ldr r0, .L0809946C @ =0x02002800
	ldr r0, [r0]
	movs r5, #0xf
	adds r1, r0, #0
	ands r1, r5
	lsls r1, r1, #1
	movs r4, #0xf0
	ands r0, r4
	lsls r0, r0, #2
	adds r1, r1, r0
	movs r0, #0x80
	lsls r0, r0, #2
	adds r1, r1, r0
	ldr r3, .L08099470 @ =0x000003FF
	ands r1, r3
	lsls r1, r1, #5
	ldr r0, .L08099474 @ =0x06010000
	adds r1, r1, r0
	adds r0, r2, #0
	ands r0, r5
	lsls r0, r0, #1
	ands r2, r4
	lsls r2, r2, #2
	adds r0, r0, r2
	ands r0, r3
	lsls r0, r0, #5
	ldr r2, .L08099478 @ =0x02000000
	adds r0, r0, r2
	movs r2, #0
	bl func_fe6_080995B0
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0809946C: .4byte 0x02002800
.L08099470: .4byte 0x000003FF
.L08099474: .4byte 0x06010000
.L08099478: .4byte 0x02000000

	thumb_func_start func_fe6_0809947C
func_fe6_0809947C: @ 0x0809947C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	mov sb, r1
	mov sl, r2
	ldr r1, .L080994EC @ =0x02002800
	mov r8, r1
	ldr r3, [r1]
	movs r2, #0xf
	mov ip, r2
	adds r2, r3, #0
	mov r1, ip
	ands r2, r1
	lsls r2, r2, #1
	movs r5, #0xf0
	adds r1, r3, #0
	ands r1, r5
	lsls r1, r1, #2
	adds r2, r2, r1
	movs r1, #0x80
	lsls r1, r1, #2
	adds r6, r2, r1
	ldr r4, .L080994F0 @ =0x000003FF
	adds r1, r6, #0
	ands r1, r4
	lsls r1, r1, #5
	ldr r2, .L080994F4 @ =0x06010000
	adds r7, r1, r2
	adds r1, r0, #0
	mov r2, ip
	ands r1, r2
	lsls r1, r1, #1
	ands r0, r5
	lsls r0, r0, #2
	adds r1, r1, r0
	ands r1, r4
	lsls r1, r1, #5
	ldr r0, .L080994F8 @ =0x02000000
	adds r4, r1, r0
	adds r3, #1
	mov r0, r8
	str r3, [r0]
	mov r1, sb
	cmp r1, #0
	beq .L08099500
	ldr r0, .L080994FC @ =gUnk_08691890
	mov r1, sl
	bl SpawnProc
	str r7, [r0, #0x30]
	str r4, [r0, #0x2c]
	mov r2, sb
	strh r2, [r0, #0x3c]
	b .L0809950A
	.align 2, 0
.L080994EC: .4byte 0x02002800
.L080994F0: .4byte 0x000003FF
.L080994F4: .4byte 0x06010000
.L080994F8: .4byte 0x02000000
.L080994FC: .4byte gUnk_08691890
.L08099500:
	ldr r2, .L0809951C @ =0x0000FFFF
	adds r0, r4, #0
	adds r1, r7, #0
	bl func_fe6_080995B0
.L0809950A:
	adds r0, r6, #0
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
.L0809951C: .4byte 0x0000FFFF

	thumb_func_start func_fe6_08099520
func_fe6_08099520: @ 0x08099520
	push {lr}
	adds r2, r0, #0
	movs r1, #0xc0
	lsls r1, r1, #1
	movs r0, #0x1f
	bl func_fe6_0809947C
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start func_fe6_08099534
func_fe6_08099534: @ 0x08099534
	movs r1, #0
	str r1, [r0, #0x34]
	strh r1, [r0, #0x38]
	ldrh r1, [r0, #0x3c]
	strh r1, [r0, #0x3a]
	bx lr

	thumb_func_start func_fe6_08099540
func_fe6_08099540: @ 0x08099540
	push {r4, lr}
	adds r4, r0, #0
	ldrh r1, [r4, #0x38]
	ldrh r2, [r4, #0x3a]
	b .L0809955C
.L0809954A:
	ldr r0, [r4, #0x2c]
	ldr r1, [r4, #0x30]
	ldr r2, [r4, #0x34]
	adds r2, #1
	str r2, [r4, #0x34]
	bl func_fe6_080995B0
	ldrh r1, [r4, #0x38]
	ldr r2, .L0809957C @ =0xFFFFFF00
.L0809955C:
	adds r0, r1, r2
	strh r0, [r4, #0x38]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xff
	bgt .L0809954A
	ldr r0, [r4, #0x34]
	cmp r0, #0x3f
	ble .L08099574
	adds r0, r4, #0
	bl Proc_Break
.L08099574:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0809957C: .4byte 0xFFFFFF00

	thumb_func_start func_fe6_08099580
func_fe6_08099580: @ 0x08099580
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #7
	ands r0, r2
	lsls r0, r0, #2
	movs r3, #0xf
	lsls r3, r0
	asrs r2, r2, #3
	cmp r2, #0xf
	ble .L08099596
	adds r2, #0xf0
.L08099596:
	lsls r0, r2, #2
	adds r2, r0, r1
	ldr r1, [r2]
	bics r1, r3
	adds r0, r0, r4
	ldr r0, [r0]
	ands r0, r3
	adds r1, r1, r0
	str r1, [r2]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_fe6_080995B0
func_fe6_080995B0: @ 0x080995B0
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r7, r0, #0
	adds r6, r1, #0
	adds r5, r2, #0
	cmp r5, #0
	beq .L08099604
	ldr r0, .L080995FC @ =0x0000FFFF
	cmp r5, r0
	beq .L08099624
	subs r5, #1
	ldr r0, .L08099600 @ =gUnk_086918B0
	lsls r4, r5, #1
	adds r4, r4, r0
	ldrh r2, [r4]
	adds r0, r7, #0
	bl func_fe6_08099580
	ldrh r2, [r4]
	adds r2, #0x40
	adds r0, r7, #0
	adds r1, r6, #0
	bl func_fe6_08099580
	ldrh r2, [r4]
	adds r2, #0x80
	adds r0, r7, #0
	adds r1, r6, #0
	bl func_fe6_08099580
	ldrh r2, [r4]
	adds r2, #0xc0
	adds r0, r7, #0
	adds r1, r6, #0
	bl func_fe6_08099580
	b .L0809963C
	.align 2, 0
.L080995FC: .4byte 0x0000FFFF
.L08099600: .4byte gUnk_086918B0
.L08099604:
	str r5, [sp]
	ldr r4, .L08099620 @ =0x01000010
	mov r0, sp
	adds r1, r6, #0
	adds r2, r4, #0
	bl CpuFastSet
	str r5, [sp, #4]
	add r0, sp, #4
	movs r2, #0x80
	lsls r2, r2, #3
	adds r1, r6, r2
	adds r2, r4, #0
	b .L08099638
	.align 2, 0
.L08099620: .4byte 0x01000010
.L08099624:
	adds r0, r7, #0
	adds r1, r6, #0
	movs r2, #0x10
	bl CpuFastSet
	movs r1, #0x80
	lsls r1, r1, #3
	adds r0, r7, r1
	adds r1, r6, r1
	movs r2, #0x10
.L08099638:
	bl CpuFastSet
.L0809963C:
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start func_fe6_08099644
func_fe6_08099644: @ 0x08099644
	push {lr}
	movs r0, #0x1f
	movs r1, #1
	bl func_fe6_08014ACC
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_fe6_08099654
func_fe6_08099654: @ 0x08099654
	push {r4, r5, lr}
	sub sp, #4
	adds r1, r0, #0
	ldr r0, .L0809966C @ =gUnk_03005284
	movs r5, #0
	ldrsb r5, [r0, r5]
	cmp r5, #0
	beq .L08099670
	adds r0, r1, #0
	bl Proc_End
	b .L08099700
	.align 2, 0
.L0809966C: .4byte gUnk_03005284
.L08099670:
	bl func_fe6_08099BE4
	ldr r0, .L08099708 @ =gUnk_0836A494
	ldr r1, .L0809970C @ =gBg0Tm
	movs r4, #0xa0
	lsls r4, r4, #1
	adds r2, r4, #0
	movs r3, #0
	bl func_fe6_080998D4
	ldr r0, .L08099710 @ =gUnk_083674BC
	ldr r1, .L08099714 @ =gBg1Tm
	movs r2, #0
	movs r3, #1
	bl func_fe6_080998D4
	ldr r0, .L08099718 @ =gUnk_0836A094
	ldr r1, .L0809971C @ =gBg3Tm
	adds r2, r4, #0
	movs r3, #3
	bl func_fe6_080998D4
	ldr r0, .L08099720 @ =gUnk_0836A888
	ldr r4, .L08099724 @ =gBuf
	adds r1, r4, #0
	bl Decompress
	movs r2, #0x80
	lsls r2, r2, #2
	adds r0, r4, #0
	movs r1, #0
	bl ApplyPaletteExt
	ldr r0, .L08099728 @ =gPal
	strh r5, [r0]
	movs r0, #6
	bl SetBlackPal
	ldr r4, .L0809972C @ =gUnk_08367B30
	movs r0, #0
	bl GetBgChrOffset
	adds r1, r0, #0
	ldr r0, .L08099730 @ =0x06002800
	adds r1, r1, r0
	adds r0, r4, #0
	bl Decompress
	ldr r4, .L08099734 @ =gUnk_08364AB4
	movs r0, #1
	bl GetBgChrOffset
	adds r1, r0, #0
	movs r0, #0xc0
	lsls r0, r0, #0x13
	adds r1, r1, r0
	adds r0, r4, #0
	bl Decompress
	movs r0, #0xf
	bl EnableBgSync
	movs r0, #1
	bl func_fe6_08098AD8
	movs r0, #1
	str r0, [sp]
	movs r1, #1
	movs r2, #0
	movs r3, #1
	bl func_fe6_0809892C
.L08099700:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08099708: .4byte gUnk_0836A494
.L0809970C: .4byte gBg0Tm
.L08099710: .4byte gUnk_083674BC
.L08099714: .4byte gBg1Tm
.L08099718: .4byte gUnk_0836A094
.L0809971C: .4byte gBg3Tm
.L08099720: .4byte gUnk_0836A888
.L08099724: .4byte gBuf
.L08099728: .4byte gPal
.L0809972C: .4byte gUnk_08367B30
.L08099730: .4byte 0x06002800
.L08099734: .4byte gUnk_08364AB4

	thumb_func_start func_fe6_08099738
func_fe6_08099738: @ 0x08099738
	push {lr}
	adds r3, r0, #0
	ldr r0, .L0809974C @ =gBuf+0x1E0
	movs r1, #0xe
	movs r2, #0x64
	bl StartPalFade
	pop {r0}
	bx r0
	.align 2, 0
.L0809974C: .4byte gBuf+0x1E0

	thumb_func_start func_fe6_08099750
func_fe6_08099750: @ 0x08099750
	push {lr}
	adds r3, r0, #0
	ldr r0, .L08099764 @ =gBuf+0xC0
	movs r1, #6
	movs r2, #0xb4
	bl StartPalFade
	pop {r0}
	bx r0
	.align 2, 0
.L08099764: .4byte gBuf+0xC0

	thumb_func_start func_fe6_08099768
func_fe6_08099768: @ 0x08099768
	push {lr}
	adds r3, r0, #0
	ldr r0, .L08099780 @ =Pal_AllBlack
	movs r1, #6
	movs r2, #0x64
	bl StartPalFade
	movs r1, #0x2c
	bl SetPalFadeStop
	pop {r0}
	bx r0
	.align 2, 0
.L08099780: .4byte Pal_AllBlack

	thumb_func_start func_fe6_08099784
func_fe6_08099784: @ 0x08099784
	push {lr}
	movs r0, #6
	movs r1, #1
	bl func_fe6_08014ACC
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_fe6_08099794
func_fe6_08099794: @ 0x08099794
	adds r0, #0x64
	movs r1, #0
	strh r1, [r0]
	bx lr

	thumb_func_start func_fe6_0809979C
func_fe6_0809979C: @ 0x0809979C
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	adds r1, r5, #0
	adds r1, #0x64
	ldrh r2, [r1]
	movs r3, #0
	ldrsh r0, [r1, r3]
	cmp r0, #0xc7
	bgt .L080997B6
	adds r0, r2, #1
	strh r0, [r1]
	b .L080997BC
.L080997B6:
	adds r0, r5, #0
	bl Proc_Break
.L080997BC:
	ldr r4, .L08099804 @ =gDispIo
	adds r2, r4, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	ldr r0, .L08099808 @ =gUnk_0869149C
	ldr r2, [r0]
	adds r0, r5, #0
	adds r0, #0x64
	movs r1, #0
	ldrsh r3, [r0, r1]
	movs r0, #0xc8
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	bl Interpolate
	adds r1, r4, #0
	adds r1, #0x44
	movs r2, #0
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x46
	strb r2, [r0]
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08099804: .4byte gDispIo
.L08099808: .4byte gUnk_0869149C

	thumb_func_start func_fe6_0809980C
func_fe6_0809980C: @ 0x0809980C
	adds r2, r0, #0
	movs r3, #0
	movs r1, #3
	adds r0, #0x30
.L08099814:
	strh r3, [r0]
	subs r0, #2
	subs r1, #1
	cmp r1, #0
	bge .L08099814
	movs r0, #0
	strh r0, [r2, #0x34]
	bx lr

	thumb_func_start func_fe6_08099824
func_fe6_08099824: @ 0x08099824
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	movs r5, #0
.L0809982A:
	lsls r1, r5, #1
	adds r4, r6, #0
	adds r4, #0x2a
	adds r4, r4, r1
	ldr r0, .L08099864 @ =gUnk_08380F4C
	adds r1, r1, r0
	ldrh r0, [r4]
	ldrh r1, [r1]
	adds r1, r0, r1
	strh r1, [r4]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x18
	adds r0, r5, #0
	bl func_fe6_0809992C
	lsls r0, r5, #0x10
	lsrs r0, r0, #0x10
	ldrh r4, [r4]
	lsrs r1, r4, #8
	movs r2, #0
	bl SetBgOffset
	adds r5, #1
	cmp r5, #3
	ble .L0809982A
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08099864: .4byte gUnk_08380F4C

	thumb_func_start func_fe6_08099868
func_fe6_08099868: @ 0x08099868
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r7, r0, #0
	ldrh r0, [r7, #0x34]
	adds r1, r0, #1
	strh r1, [r7, #0x34]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	mov r8, r0
	movs r6, #0
.L08099880:
	ldr r0, .L080998D0 @ =gUnk_08380F4C
	lsls r5, r6, #1
	adds r0, r5, r0
	ldrh r1, [r0]
	movs r0, #0x3c
	str r0, [sp]
	movs r0, #0
	movs r2, #0x80
	lsls r2, r2, #2
	mov r3, r8
	bl Interpolate
	adds r1, r0, #0
	adds r4, r7, #0
	adds r4, #0x2a
	adds r4, r4, r5
	ldrh r0, [r4]
	adds r1, r0, r1
	strh r1, [r4]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x18
	adds r0, r6, #0
	bl func_fe6_0809992C
	lsls r0, r6, #0x10
	lsrs r0, r0, #0x10
	ldrh r4, [r4]
	lsrs r1, r4, #8
	movs r2, #0
	bl SetBgOffset
	adds r6, #1
	cmp r6, #3
	ble .L08099880
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L080998D0: .4byte gUnk_08380F4C

	thumb_func_start func_fe6_080998D4
func_fe6_080998D4: @ 0x080998D4
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	mov sb, r1
	adds r5, r2, #0
	adds r6, r3, #0
	ldr r4, .L08099924 @ =gBuf
	adds r1, r4, #0
	bl Decompress
	movs r0, #0x80
	lsls r0, r0, #4
	mov r8, r0
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	adds r0, r4, #0
	mov r1, sb
	mov r2, r8
	adds r3, r5, #0
	bl PutTmLinear
	movs r0, #0x80
	lsls r0, r0, #4
	adds r4, r4, r0
	lsls r6, r6, #0xb
	ldr r0, .L08099928 @ =0x02002804
	adds r6, r6, r0
	adds r0, r4, #0
	adds r1, r6, #0
	mov r2, r8
	adds r3, r5, #0
	bl PutTmLinear
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08099924: .4byte gBuf
.L08099928: .4byte 0x02002804

	thumb_func_start func_fe6_0809992C
func_fe6_0809992C: @ 0x0809992C
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r0, r1, #0
	cmp r1, #0
	bge .L08099938
	adds r0, r1, #7
.L08099938:
	asrs r0, r0, #3
	subs r4, r0, #1
	movs r0, #0x1f
	ands r4, r0
	cmp r1, #8
	ble .L08099970
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #0
	bl GetTmOffsetById
	adds r2, r0, #0
	lsls r0, r5, #0xb
	lsls r1, r4, #1
	adds r0, r0, r1
	ldr r1, .L08099978 @ =0x02002804
	adds r1, r0, r1
	movs r3, #0x1f
.L0809995C:
	ldrh r0, [r1]
	strh r0, [r2]
	adds r2, #0x40
	adds r1, #0x40
	subs r3, #1
	cmp r3, #0
	bge .L0809995C
	adds r0, r5, #0
	bl EnableBgSyncById
.L08099970:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08099978: .4byte 0x02002804

	thumb_func_start func_fe6_0809997C
func_fe6_0809997C: @ 0x0809997C
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r1, r0, #0
	ldr r0, .L08099994 @ =gUnk_03005284
	movs r6, #0
	ldrsb r6, [r0, r6]
	cmp r6, #0
	beq .L08099998
	adds r0, r1, #0
	bl Proc_End
	b .L080999FE
	.align 2, 0
.L08099994: .4byte gUnk_03005284
.L08099998:
	bl func_fe6_08099CCC
	ldr r4, .L08099A08 @ =gUnk_0836A9AC
	movs r0, #0
	bl GetBgChrOffset
	adds r1, r0, #0
	movs r0, #0xc0
	lsls r0, r0, #0x13
	adds r1, r1, r0
	adds r0, r4, #0
	bl Decompress
	ldr r0, .L08099A0C @ =gUnk_0836EEFC
	ldr r1, .L08099A10 @ =gBg0Tm
	bl Decompress
	ldr r0, .L08099A14 @ =gUnk_0836F610
	ldr r4, .L08099A18 @ =gBuf
	adds r1, r4, #0
	bl Decompress
	movs r5, #0x80
	lsls r5, r5, #2
	adds r0, r4, #0
	movs r1, #0
	adds r2, r5, #0
	bl ApplyPaletteExt
	ldr r4, .L08099A1C @ =gPal
	strh r6, [r4]
	ldr r0, .L08099A20 @ =gUnk_083747A4
	ldr r1, .L08099A24 @ =0x06010000
	bl Decompress
	ldr r0, .L08099A28 @ =gUnk_08375888
	adds r1, r5, #0
	movs r2, #0x20
	bl ApplyPaletteExt
	strh r6, [r4]
	movs r0, #0xf
	bl EnableBgSync
	movs r0, #1
	str r0, [sp]
	movs r1, #0
	movs r2, #1
	movs r3, #0
	bl func_fe6_0809892C
.L080999FE:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08099A08: .4byte gUnk_0836A9AC
.L08099A0C: .4byte gUnk_0836EEFC
.L08099A10: .4byte gBg0Tm
.L08099A14: .4byte gUnk_0836F610
.L08099A18: .4byte gBuf
.L08099A1C: .4byte gPal
.L08099A20: .4byte gUnk_083747A4
.L08099A24: .4byte 0x06010000
.L08099A28: .4byte gUnk_08375888

	thumb_func_start func_fe6_08099A2C
func_fe6_08099A2C: @ 0x08099A2C
	push {lr}
	ldr r3, .L08099A78 @ =gDispIo
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
	movs r0, #0x10
	strb r0, [r1]
	adds r1, #1
	movs r0, #6
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x46
	strb r2, [r0]
	ldr r0, .L08099A7C @ =0x0000FFE0
	ldrh r2, [r3, #0x3c]
	ands r0, r2
	movs r1, #3
	orrs r0, r1
	ldr r1, .L08099A80 @ =0x0000E0FF
	ands r0, r1
	movs r2, #0x80
	lsls r2, r2, #5
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r3, #0x3c]
	movs r0, #2
	bl func_fe6_08098AD8
	pop {r0}
	bx r0
	.align 2, 0
.L08099A78: .4byte gDispIo
.L08099A7C: .4byte 0x0000FFE0
.L08099A80: .4byte 0x0000E0FF

	thumb_func_start func_fe6_08099A84
func_fe6_08099A84: @ 0x08099A84
	push {lr}
	ldr r0, [r0, #0x50]
	bl EndSpriteAnim
	pop {r0}
	bx r0

	thumb_func_start func_fe6_08099A90
func_fe6_08099A90: @ 0x08099A90
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x10
	bl SetBlackPal
	movs r0, #0x11
	bl SetBlackPal
	movs r0, #0x12
	bl SetBlackPal
	movs r0, #0x13
	bl SetBlackPal
	adds r1, r4, #0
	adds r1, #0x64
	movs r0, #0
	strh r0, [r1]
	ldr r0, .L08099ACC @ =gUnk_08375908
	movs r1, #0xd
	bl StartSpriteAnim
	str r0, [r4, #0x50]
	movs r1, #0xc0
	lsls r1, r1, #4
	strh r1, [r0, #0x22]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08099ACC: .4byte gUnk_08375908

	thumb_func_start func_fe6_08099AD0
func_fe6_08099AD0: @ 0x08099AD0
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0x64
	ldrh r0, [r4]
	cmp r0, #2
	bne .L08099AEC
	ldr r0, .L08099B0C @ =gUnk_083758A8
	ldr r1, .L08099B10 @ =gUnk_086914A0
	ldr r2, [r1]
	movs r1, #0x11
	adds r3, r5, #0
	bl StartPalFade
.L08099AEC:
	ldr r0, .L08099B14 @ =gUnk_08375888
	movs r2, #0
	ldrsh r1, [r4, r2]
	adds r1, #0x10
	ldr r2, .L08099B10 @ =gUnk_086914A0
	ldr r2, [r2]
	adds r3, r5, #0
	bl StartPalFade
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08099B0C: .4byte gUnk_083758A8
.L08099B10: .4byte gUnk_086914A0
.L08099B14: .4byte gUnk_08375888

	thumb_func_start func_fe6_08099B18
func_fe6_08099B18: @ 0x08099B18
	push {r4, lr}
	ldr r4, [r0, #0x50]
	bl func_fe6_08099BCC
	movs r1, #0xb4
	subs r1, r1, r0
	adds r0, r4, #0
	movs r2, #0x10
	bl DisplaySpriteAnim
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_fe6_08099B34
func_fe6_08099B34: @ 0x08099B34
	adds r1, r0, #0
	adds r1, #0x64
	movs r2, #0
	strh r2, [r1]
	adds r0, #0x66
	strh r2, [r0]
	bx lr
	.align 2, 0

	thumb_func_start func_fe6_08099B44
func_fe6_08099B44: @ 0x08099B44
	push {lr}
	adds r1, r0, #0
	adds r1, #0x64
	ldrh r0, [r1]
	adds r0, #0x18
	strh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	bl func_fe6_08099BA8
	pop {r0}
	bx r0

	thumb_func_start func_fe6_08099B5C
func_fe6_08099B5C: @ 0x08099B5C
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	movs r1, #0x80
	lsls r1, r1, #1
	adds r4, r5, #0
	adds r4, #0x66
	ldrh r3, [r4]
	adds r0, r3, #1
	strh r0, [r4]
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	movs r0, #0x1e
	str r0, [sp]
	movs r0, #0
	movs r2, #0x18
	bl Interpolate
	adds r1, r5, #0
	adds r1, #0x64
	ldrh r2, [r1]
	adds r0, r2, r0
	strh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	bl func_fe6_08099BA8
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, #0x1d
	ble .L08099BA0
	adds r0, r5, #0
	bl Proc_Break
.L08099BA0:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start func_fe6_08099BA8
func_fe6_08099BA8: @ 0x08099BA8
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	movs r0, #0
	adds r1, r4, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #2
	adds r1, r4, #0
	movs r2, #0
	bl SetBgOffset
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_fe6_08099BCC
func_fe6_08099BCC: @ 0x08099BCC
	push {lr}
	ldr r0, .L08099BE0 @ =gUnk_08691B20
	bl FindProc
	adds r0, #0x64
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	pop {r1}
	bx r1
	.align 2, 0
.L08099BE0: .4byte gUnk_08691B20

	thumb_func_start func_fe6_08099BE4
func_fe6_08099BE4: @ 0x08099BE4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r0, .L08099CB8 @ =gUnk_08691B38
	bl InitBgs
	movs r0, #0xf
	bl DisableBgSync
	ldr r0, .L08099CBC @ =gDispIo
	mov ip, r0
	movs r0, #8
	rsbs r0, r0, #0
	mov r1, ip
	ldrb r1, [r1]
	ands r0, r1
	mov r2, ip
	strb r0, [r2]
	movs r5, #1
	ldrb r0, [r2, #1]
	orrs r0, r5
	movs r6, #2
	orrs r0, r6
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
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
	mov r4, ip
	adds r4, #0x3c
	movs r2, #0x3f
	ldrb r7, [r4]
	ands r2, r7
	movs r0, #0x44
	add r0, ip
	mov r8, r0
	movs r1, #0
	mov sb, r1
	movs r3, #0x10
	movs r6, #0x46
	add r6, ip
	mov sl, r6
	subs r1, #4
	adds r0, r1, #0
	mov r7, ip
	ldrb r7, [r7, #0xc]
	ands r0, r7
	mov r6, ip
	strb r0, [r6, #0xc]
	adds r0, r1, #0
	ldrb r7, [r6, #0x10]
	ands r0, r7
	orrs r0, r5
	strb r0, [r6, #0x10]
	ldrb r0, [r6, #0x14]
	ands r1, r0
	movs r5, #2
	orrs r1, r5
	strb r1, [r6, #0x14]
	movs r0, #3
	ldrb r6, [r6, #0x18]
	orrs r0, r6
	mov r7, ip
	strb r0, [r7, #0x18]
	movs r0, #0x40
	orrs r2, r0
	strb r2, [r4]
	mov r0, r8
	strb r3, [r0]
	ldr r1, .L08099CC0 @ =gDispIo+0x45
	strb r3, [r1]
	mov r5, sb
	mov r2, sl
	strb r5, [r2]
	ldr r0, .L08099CC4 @ =0x0000FFE0
	ldrh r6, [r7, #0x3c]
	ands r0, r6
	movs r1, #1
	orrs r0, r1
	ldr r1, .L08099CC8 @ =0x0000E0FF
	ands r0, r1
	movs r7, #0xe0
	lsls r7, r7, #4
	adds r1, r7, #0
	orrs r0, r1
	mov r1, ip
	strh r0, [r1, #0x3c]
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08099CB8: .4byte gUnk_08691B38
.L08099CBC: .4byte gDispIo
.L08099CC0: .4byte gDispIo+0x45
.L08099CC4: .4byte 0x0000FFE0
.L08099CC8: .4byte 0x0000E0FF

	thumb_func_start func_fe6_08099CCC
func_fe6_08099CCC: @ 0x08099CCC
	push {lr}
	ldr r0, .L08099D34 @ =gUnk_08691B50
	bl InitBgs
	movs r0, #0xf
	bl DisableBgSync
	ldr r3, .L08099D38 @ =gDispIo
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
.L08099D34: .4byte gUnk_08691B50
.L08099D38: .4byte gDispIo

	thumb_func_start func_fe6_08099D3C
func_fe6_08099D3C: @ 0x08099D3C
	push {lr}
	adds r1, r0, #0
	ldr r0, .L08099D54 @ =gUnk_03005284
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq .L08099D58
	adds r0, r1, #0
	bl Proc_End
	b .L08099D9C
	.align 2, 0
.L08099D54: .4byte gUnk_03005284
.L08099D58:
	bl func_fe6_080988C0
	ldr r2, .L08099DA0 @ =gDispIo
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r3, [r2, #0xc]
	ands r0, r3
	strb r0, [r2, #0xc]
	movs r0, #3
	ldrb r3, [r2, #0x10]
	orrs r0, r3
	strb r0, [r2, #0x10]
	adds r0, r1, #0
	ldrb r3, [r2, #0x14]
	ands r0, r3
	strb r0, [r2, #0x14]
	ldrb r0, [r2, #0x18]
	ands r1, r0
	strb r1, [r2, #0x18]
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
.L08099D9C:
	pop {r0}
	bx r0
	.align 2, 0
.L08099DA0: .4byte gDispIo

	thumb_func_start func_fe6_08099DA4
func_fe6_08099DA4: @ 0x08099DA4
	push {r4, lr}
	sub sp, #0x10
	bl func_fe6_080988C0
	ldr r2, .L08099E38 @ =gDispIo
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r3, [r2, #0xc]
	ands r0, r3
	strb r0, [r2, #0xc]
	movs r0, #3
	ldrb r3, [r2, #0x10]
	orrs r0, r3
	strb r0, [r2, #0x10]
	adds r0, r1, #0
	ldrb r3, [r2, #0x14]
	ands r0, r3
	strb r0, [r2, #0x14]
	ldrb r0, [r2, #0x18]
	ands r1, r0
	strb r1, [r2, #0x18]
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
	ldr r4, .L08099E3C @ =gUnk_08141320
	movs r0, #1
	bl GetBgChrOffset
	adds r1, r0, #0
	ldr r3, .L08099E40 @ =0x06000020
	adds r1, r1, r3
	adds r0, r4, #0
	bl Decompress
	ldr r0, .L08099E44 @ =gUnk_08143AB8
	ldr r4, .L08099E48 @ =gBuf
	adds r1, r4, #0
	bl Decompress
	ldr r0, .L08099E4C @ =gBg1Tm
	movs r1, #0x20
	str r1, [sp]
	movs r1, #0x13
	str r1, [sp, #4]
	str r4, [sp, #8]
	movs r1, #0
	str r1, [sp, #0xc]
	movs r2, #1
	movs r3, #1
	bl func_fe6_08014F70
	movs r0, #1
	str r0, [sp]
	movs r1, #1
	movs r2, #0
	movs r3, #0
	bl func_fe6_0809892C
	add sp, #0x10
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08099E38: .4byte gDispIo
.L08099E3C: .4byte gUnk_08141320
.L08099E40: .4byte 0x06000020
.L08099E44: .4byte gUnk_08143AB8
.L08099E48: .4byte gBuf
.L08099E4C: .4byte gBg1Tm

	thumb_func_start func_fe6_08099E50
func_fe6_08099E50: @ 0x08099E50
	push {r4, lr}
	adds r1, r0, #0
	ldr r0, .L08099E68 @ =gUnk_03005284
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq .L08099E6C
	adds r0, r1, #0
	bl Proc_End
	b .L08099E9C
	.align 2, 0
.L08099E68: .4byte gUnk_03005284
.L08099E6C:
	ldr r4, .L08099EA4 @ =gUnk_08378F54
	movs r0, #0
	bl GetBgChrOffset
	adds r1, r0, #0
	ldr r0, .L08099EA8 @ =0x06000020
	adds r1, r1, r0
	adds r0, r4, #0
	bl Decompress
	ldr r0, .L08099EAC @ =gUnk_08379DCC
	ldr r4, .L08099EB0 @ =gBuf
	adds r1, r4, #0
	bl Decompress
	ldr r0, .L08099EB4 @ =gBg0Tm
	adds r1, r4, #0
	movs r2, #1
	bl TmApplyTsa_thm
	ldr r0, .L08099EB8 @ =gUnk_08379F8C
	ldr r1, .L08099EBC @ =0x06010800
	bl Decompress
.L08099E9C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08099EA4: .4byte gUnk_08378F54
.L08099EA8: .4byte 0x06000020
.L08099EAC: .4byte gUnk_08379DCC
.L08099EB0: .4byte gBuf
.L08099EB4: .4byte gBg0Tm
.L08099EB8: .4byte gUnk_08379F8C
.L08099EBC: .4byte 0x06010800

	thumb_func_start func_fe6_08099EC0
func_fe6_08099EC0: @ 0x08099EC0
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	mov r8, r0
	ldr r3, .L08099F7C @ =gDispIo
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
	movs r6, #0
	movs r0, #0xe
	strb r0, [r1]
	adds r1, #1
	movs r2, #0x10
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x46
	strb r6, [r0]
	ldr r0, .L08099F80 @ =0x0000FFE0
	ldrh r4, [r3, #0x3c]
	ands r0, r4
	movs r1, #1
	orrs r0, r1
	ldr r1, .L08099F84 @ =0x0000E0FF
	ands r0, r1
	movs r4, #0x90
	lsls r4, r4, #5
	adds r1, r4, #0
	orrs r0, r1
	strh r0, [r3, #0x3c]
	adds r1, r3, #0
	adds r1, #0x3d
	movs r0, #0x20
	ldrb r4, [r1]
	orrs r0, r4
	strb r0, [r1]
	movs r0, #1
	ldrb r1, [r3, #1]
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #4
	ands r0, r1
	orrs r0, r2
	strb r0, [r3, #1]
	movs r0, #1
	bl func_fe6_08098AD8
	movs r0, #0xf
	bl EnableBgSync
	ldr r4, .L08099F88 @ =gUnk_08379D2C
	adds r0, r4, #0
	movs r1, #0x20
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r5, .L08099F8C @ =gPal
	strh r6, [r5]
	subs r4, #0x20
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0x20
	bl ApplyPaletteExt
	strh r6, [r5]
	movs r0, #0x10
	bl SetBlackPal
	bl InitScanlineEffect
	ldr r0, .L08099F90 @ =OnHBlank_0806A040
	bl SetOnHBlankA
	ldr r0, .L08099F94 @ =gUnk_08691CC0
	mov r1, r8
	bl SpawnProc
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08099F7C: .4byte gDispIo
.L08099F80: .4byte 0x0000FFE0
.L08099F84: .4byte 0x0000E0FF
.L08099F88: .4byte gUnk_08379D2C
.L08099F8C: .4byte gPal
.L08099F90: .4byte OnHBlank_0806A040
.L08099F94: .4byte gUnk_08691CC0

	thumb_func_start func_fe6_08099F98
func_fe6_08099F98: @ 0x08099F98
	bx lr
	.align 2, 0

	thumb_func_start func_fe6_08099F9C
func_fe6_08099F9C: @ 0x08099F9C
	push {lr}
	ldr r0, [r0, #0x50]
	bl EndSpriteAnim
	pop {r0}
	bx r0

	thumb_func_start func_fe6_08099FA8
func_fe6_08099FA8: @ 0x08099FA8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, .L08099FCC @ =gUnk_0837AAE8
	movs r1, #2
	bl StartSpriteAnim
	str r0, [r4, #0x50]
	movs r2, #0
	movs r1, #0x88
	lsls r1, r1, #3
	strh r1, [r0, #0x22]
	movs r0, #0xc8
	str r0, [r4, #0x30]
	adds r4, #0x44
	strh r2, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08099FCC: .4byte gUnk_0837AAE8

	thumb_func_start func_fe6_08099FD0
func_fe6_08099FD0: @ 0x08099FD0
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r2, r4, #0
	adds r2, #0x44
	movs r0, #0
	ldrsh r1, [r2, r0]
	ldr r0, .L0809A010 @ =gUnk_086914E0
	ldr r5, [r0]
	cmp r1, r5
	bgt .L08099FFE
	ldrh r3, [r2]
	adds r0, r3, #1
	strh r0, [r2]
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	str r5, [sp]
	movs r0, #0
	movs r1, #0xc8
	movs r2, #0x80
	bl Interpolate
	str r0, [r4, #0x30]
.L08099FFE:
	ldr r0, [r4, #0x50]
	ldr r2, [r4, #0x30]
	movs r1, #0x78
	bl DisplaySpriteAnim
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0809A010: .4byte gUnk_086914E0

	thumb_func_start func_fe6_0809A014
func_fe6_0809A014: @ 0x0809A014
	push {lr}
	adds r3, r0, #0
	adds r1, r3, #0
	adds r1, #0x64
	movs r0, #0
	strh r0, [r1]
	ldr r0, .L0809A030 @ =gUnk_0837AAC8
	movs r2, #0x82
	lsls r2, r2, #1
	movs r1, #0x10
	bl StartPalFade
	pop {r0}
	bx r0
	.align 2, 0
.L0809A030: .4byte gUnk_0837AAC8

	thumb_func_start func_fe6_0809A034
func_fe6_0809A034: @ 0x0809A034
	push {lr}
	adds r2, r0, #0
	adds r2, #0x64
	ldrh r1, [r2]
	adds r1, #1
	strh r1, [r2]
	bl func_fe6_0809A0A8
	pop {r0}
	bx r0

	thumb_func_start func_fe6_0809A048
func_fe6_0809A048: @ 0x0809A048
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x64
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	adds r0, r4, #0
	bl func_fe6_0809A068
	adds r0, r4, #0
	bl func_fe6_0809A0A8
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start func_fe6_0809A068
func_fe6_0809A068: @ 0x0809A068
	push {lr}
	adds r0, #0x64
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x12
	movs r1, #6
	bl __modsi3
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r1, .L0809A09C @ =gUnk_08380F54
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #5
	ldr r1, .L0809A0A0 @ =gUnk_0837AA68
	adds r0, r0, r1
	movs r1, #0x80
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r1, .L0809A0A4 @ =gPal
	movs r0, #0
	strh r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
.L0809A09C: .4byte gUnk_08380F54
.L0809A0A0: .4byte gUnk_0837AA68
.L0809A0A4: .4byte gPal

	thumb_func_start func_fe6_0809A0A8
func_fe6_0809A0A8: @ 0x0809A0A8
	push {lr}
	adds r0, #0x64
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x13
	movs r1, #7
	ands r0, r1
	ldr r1, .L0809A0D4 @ =gUnk_08691C78
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #5
	ldr r1, .L0809A0D8 @ =gUnk_08379D0C
	adds r0, r0, r1
	movs r1, #0
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r1, .L0809A0DC @ =gPal
	movs r0, #0
	strh r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
.L0809A0D4: .4byte gUnk_08691C78
.L0809A0D8: .4byte gUnk_08379D0C
.L0809A0DC: .4byte gPal

	thumb_func_start func_fe6_0809A0E0
func_fe6_0809A0E0: @ 0x0809A0E0
	push {r4, lr}
	adds r4, r0, #0
	bl func_fe6_0809A114
	adds r4, #0x64
	movs r0, #0
	strh r0, [r4]
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start func_fe6_0809A0F4
func_fe6_0809A0F4: @ 0x0809A0F4
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

	thumb_func_start func_fe6_0809A114
func_fe6_0809A114: @ 0x0809A114
	push {lr}
	ldr r0, .L0809A130 @ =gUnk_0837AB18
	ldr r1, .L0809A134 @ =0x06010000
	bl Decompress
	ldr r0, .L0809A138 @ =gUnk_0837ACB0
	movs r1, #0x88
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	pop {r0}
	bx r0
	.align 2, 0
.L0809A130: .4byte gUnk_0837AB18
.L0809A134: .4byte 0x06010000
.L0809A138: .4byte gUnk_0837ACB0

	thumb_func_start func_fe6_0809A13C
func_fe6_0809A13C: @ 0x0809A13C
	push {r4, lr}
	adds r1, r0, #0
	ldr r0, .L0809A1AC @ =gUnk_08691CA8
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
.L0809A1AC: .4byte gUnk_08691CA8
.L0809A1B0: .4byte gUnk_08380F5A
.L0809A1B4: .4byte 0x00000101

	thumb_func_start func_fe6_0809A1B8
func_fe6_0809A1B8: @ 0x0809A1B8
	movs r1, #0
	strh r1, [r0, #0x32]
	bx lr
	.align 2, 0

	thumb_func_start func_fe6_0809A1C0
func_fe6_0809A1C0: @ 0x0809A1C0
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
	ldr r0, .L0809A2E4 @ =gUnk_03005284
	movs r6, #0
	ldrsb r6, [r0, r6]
	cmp r6, #0
	beq .L0809A2E8
	adds r0, r7, #0
	bl Proc_End
	b .L0809A36E
	.align 2, 0
.L0809A2E4: .4byte gUnk_03005284
.L0809A2E8:
	bl func_fe6_0809A900
	bl SetAllBlackPals
	ldr r4, .L0809A378 @ =gUnk_08376FDC
	movs r0, #0
	bl GetBgChrOffset
	adds r1, r0, #0
	movs r5, #0xc0
	lsls r5, r5, #0x13
	adds r1, r1, r5
	adds r0, r4, #0
	bl Decompress
	ldr r4, .L0809A37C @ =gUnk_08378C60
	ldr r1, .L0809A380 @ =gBg0Tm
	adds r0, r4, #0
	bl Decompress
	ldr r1, .L0809A384 @ =gBg1Tm
	adds r0, r4, #0
	bl Decompress
	ldr r4, .L0809A388 @ =gUnk_08375B84
	movs r0, #2
	bl GetBgChrOffset
	adds r1, r0, #0
	adds r1, r1, r5
	adds r0, r4, #0
	bl Decompress
	ldr r0, .L0809A38C @ =gUnk_08376B70
	ldr r1, .L0809A390 @ =gBg2Tm
	bl Decompress
	ldr r0, .L0809A394 @ =gUnk_08376DF4
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
	ldr r0, .L0809A3A0 @ =gUnk_08691DE8
	adds r1, r7, #0
	bl SpawnProc
	movs r0, #3
	bl func_fe6_08098AD8
	movs r0, #1
	str r0, [sp]
	movs r1, #1
	movs r2, #1
	movs r3, #0
	bl func_fe6_0809892C
.L0809A36E:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0809A378: .4byte gUnk_08376FDC
.L0809A37C: .4byte gUnk_08378C60
.L0809A380: .4byte gBg0Tm
.L0809A384: .4byte gBg1Tm
.L0809A388: .4byte gUnk_08375B84
.L0809A38C: .4byte gUnk_08376B70
.L0809A390: .4byte gBg2Tm
.L0809A394: .4byte gUnk_08376DF4
.L0809A398: .4byte gBuf
.L0809A39C: .4byte gPal
.L0809A3A0: .4byte gUnk_08691DE8

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
	ldr r3, .L0809A7F8 @ =gUnk_08353328
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
.L0809A7F8: .4byte gUnk_08353328
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
	bl func_fe6_08092EB0
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
	ldr r0, .L0809A9DC @ =gUnk_08691DF8
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
.L0809A9DC: .4byte gUnk_08691DF8
.L0809A9E0: .4byte gDispIo
.L0809A9E4: .4byte 0x0000FFE0
.L0809A9E8: .4byte 0x0000E0FF

	thumb_func_start func_fe6_0809A9EC
func_fe6_0809A9EC: @ 0x0809A9EC
	push {r4, lr}
	ldr r4, .L0809AA14 @ =gUnk_0837ACD0
	movs r0, #0
	bl GetBgChrOffset
	adds r1, r0, #0
	movs r0, #0xc0
	lsls r0, r0, #0x13
	adds r1, r1, r0
	adds r0, r4, #0
	bl Decompress
	ldr r0, .L0809AA18 @ =gUnk_0837C844
	ldr r1, .L0809AA1C @ =gBuf
	bl Decompress
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0809AA14: .4byte gUnk_0837ACD0
.L0809AA18: .4byte gUnk_0837C844
.L0809AA1C: .4byte gBuf

	thumb_func_start func_fe6_0809AA20
func_fe6_0809AA20: @ 0x0809AA20
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r4, r0, #0
	adds r6, r1, #0
	ldr r5, .L0809AA6C @ =gBg0Tm
	adds r0, r5, #0
	movs r1, #0xff
	bl TmFill
	ldr r0, .L0809AA70 @ =gUnk_08691E10
	lsls r4, r4, #2
	adds r4, r4, r0
	ldrb r0, [r4, #1]
	str r0, [sp]
	movs r0, #0x14
	str r0, [sp, #4]
	ldrb r1, [r4]
	lsls r0, r1, #1
	ldr r1, .L0809AA74 @ =gBuf
	adds r0, r0, r1
	str r0, [sp, #8]
	movs r0, #2
	ldrsb r0, [r4, r0]
	str r0, [sp, #0xc]
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #0
	movs r3, #0
	bl func_fe6_08014E98
	movs r0, #1
	bl EnableBgSync
	add sp, #0x10
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L0809AA6C: .4byte gBg0Tm
.L0809AA70: .4byte gUnk_08691E10
.L0809AA74: .4byte gBuf

	thumb_func_start func_fe6_0809AA78
func_fe6_0809AA78: @ 0x0809AA78
	push {lr}
	ldr r0, .L0809AA94 @ =gUnk_03005284
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne .L0809AA8E
	movs r0, #0x44
	movs r1, #0
	bl StartBgmCore
.L0809AA8E:
	pop {r0}
	bx r0
	.align 2, 0
.L0809AA94: .4byte gUnk_03005284

	thumb_func_start func_fe6_0809AA98
func_fe6_0809AA98: @ 0x0809AA98
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, .L0809AAB0 @ =gUnk_03005284
	movs r4, #0
	ldrsb r4, [r0, r4]
	cmp r4, #0
	beq .L0809AAB4
	adds r0, r5, #0
	bl Proc_End
	b .L0809AAE6
	.align 2, 0
.L0809AAB0: .4byte gUnk_03005284
.L0809AAB4:
	bl func_fe6_080988C0
	bl SetAllBlackPals
	ldr r2, .L0809AAEC @ =gDispIo
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
	bl func_fe6_0809A9EC
	adds r0, r5, #0
	adds r0, #0x64
	strh r4, [r0]
	subs r0, #0x20
	strh r4, [r0]
.L0809AAE6:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0809AAEC: .4byte gDispIo

	thumb_func_start func_fe6_0809AAF0
func_fe6_0809AAF0: @ 0x0809AAF0
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r7, r6, #0
	adds r7, #0x64
	movs r1, #0
	ldrsh r0, [r7, r1]
	lsls r0, r0, #2
	ldr r1, .L0809AB10 @ =gUnk_08691E30
	adds r5, r0, r1
	ldrh r0, [r5, #2]
	cmp r0, #0
	bne .L0809AB14
	adds r0, r6, #0
	bl Proc_Break
	b .L0809AB42
	.align 2, 0
.L0809AB10: .4byte gUnk_08691E30
.L0809AB14:
	adds r4, r6, #0
	adds r4, #0x44
	ldrh r1, [r4]
	movs r2, #0
	ldrsh r0, [r4, r2]
	cmp r0, #0
	beq .L0809AB28
	subs r0, r1, #1
	strh r0, [r4]
	b .L0809AB42
.L0809AB28:
	ldrb r0, [r5]
	ldrb r1, [r5, #1]
	bl func_fe6_0809AA20
	ldr r0, .L0809AB48 @ =gUnk_08691EB8
	adds r1, r6, #0
	bl SpawnProc
	ldrh r0, [r5, #2]
	strh r0, [r4]
	ldrh r0, [r7]
	adds r0, #1
	strh r0, [r7]
.L0809AB42:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0809AB48: .4byte gUnk_08691EB8

	thumb_func_start func_fe6_0809AB4C
func_fe6_0809AB4C: @ 0x0809AB4C
	push {lr}
	ldr r0, .L0809AB9C @ =gPlaySt
	ldrb r0, [r0, #0x1d]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L0809AB5E
	movs r0, #0x93
	bl m4aSongNumStart
.L0809AB5E:
	ldr r3, .L0809ABA0 @ =gDispIo
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x80
	orrs r0, r1
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x44
	movs r1, #0
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r1, r3, #0
	adds r1, #0x46
	movs r0, #0x10
	strb r0, [r1]
	ldr r0, .L0809ABA4 @ =0x0000FFE0
	ldrh r1, [r3, #0x3c]
	ands r0, r1
	movs r1, #0x1f
	orrs r0, r1
	strh r0, [r3, #0x3c]
	movs r0, #0x20
	ldrb r1, [r2]
	orrs r0, r1
	strb r0, [r2]
	pop {r0}
	bx r0
	.align 2, 0
.L0809AB9C: .4byte gPlaySt
.L0809ABA0: .4byte gDispIo
.L0809ABA4: .4byte 0x0000FFE0

	thumb_func_start func_fe6_0809ABA8
func_fe6_0809ABA8: @ 0x0809ABA8
	push {r4, lr}
	ldr r3, .L0809ABE4 @ =gDispIo
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x80
	orrs r0, r1
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x44
	movs r4, #0
	strb r4, [r0]
	adds r0, #1
	strb r4, [r0]
	adds r1, r3, #0
	adds r1, #0x46
	movs r0, #8
	strb r0, [r1]
	ldr r0, .L0809ABE8 @ =gUnk_0837CB0C
	movs r1, #0
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, .L0809ABEC @ =gPal
	strh r4, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0809ABE4: .4byte gDispIo
.L0809ABE8: .4byte gUnk_0837CB0C
.L0809ABEC: .4byte gPal

	thumb_func_start func_fe6_0809ABF0
func_fe6_0809ABF0: @ 0x0809ABF0
	push {r4, lr}
	ldr r2, .L0809AC28 @ =gDispIo
	adds r1, r2, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r3, [r1]
	ands r0, r3
	strb r0, [r1]
	adds r1, #8
	movs r4, #0
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x45
	strb r4, [r0]
	adds r0, #1
	strb r4, [r0]
	ldr r0, .L0809AC2C @ =gUnk_0837CB2C
	movs r1, #0
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, .L0809AC30 @ =gPal
	strh r4, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0809AC28: .4byte gDispIo
.L0809AC2C: .4byte gUnk_0837CB2C
.L0809AC30: .4byte gPal

	thumb_func_start func_fe6_0809AC34
func_fe6_0809AC34: @ 0x0809AC34
	push {lr}
	ldr r0, .L0809AC4C @ =gUnk_0837CB4C
	movs r1, #0
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r1, .L0809AC50 @ =gPal
	movs r0, #0
	strh r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
.L0809AC4C: .4byte gUnk_0837CB4C
.L0809AC50: .4byte gPal

	thumb_func_start func_fe6_0809AC54
func_fe6_0809AC54: @ 0x0809AC54
	push {lr}
	ldr r0, .L0809AC6C @ =gUnk_0837CB6C
	movs r1, #0
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r1, .L0809AC70 @ =gPal
	movs r0, #0
	strh r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
.L0809AC6C: .4byte gUnk_0837CB6C
.L0809AC70: .4byte gPal

	thumb_func_start func_fe6_0809AC74
func_fe6_0809AC74: @ 0x0809AC74
	push {lr}
	ldr r0, .L0809AC8C @ =Pal_AllBlack
	movs r1, #0
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r1, .L0809AC90 @ =gPal
	movs r0, #0
	strh r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
.L0809AC8C: .4byte Pal_AllBlack
.L0809AC90: .4byte gPal

	thumb_func_start func_fe6_0809AC94
func_fe6_0809AC94: @ 0x0809AC94
	push {r4, r5, lr}
	ldr r0, .L0809AD20 @ =gPlaySt
	ldrb r0, [r0, #0x1d]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L0809ACA6
	movs r0, #0x94
	bl m4aSongNumStart
.L0809ACA6:
	ldr r5, .L0809AD24 @ =gBg0Tm
	adds r0, r5, #0
	movs r1, #0
	bl TmFill
	ldr r4, .L0809AD28 @ =gUnk_0837CB8C
	movs r0, #0
	bl GetBgChrOffset
	adds r1, r0, #0
	movs r0, #0xc0
	lsls r0, r0, #0x13
	adds r1, r1, r0
	adds r0, r4, #0
	bl Decompress
	ldr r0, .L0809AD2C @ =gUnk_0837EEB4
	adds r1, r5, #0
	bl Decompress
	ldr r0, .L0809AD30 @ =gUnk_0837F418
	movs r1, #0
	movs r2, #0x60
	bl ApplyPaletteExt
	movs r0, #1
	bl EnableBgSync
	ldr r3, .L0809AD34 @ =gDispIo
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x80
	orrs r0, r1
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x44
	movs r1, #0
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r1, r3, #0
	adds r1, #0x46
	movs r0, #0x10
	strb r0, [r1]
	ldr r0, .L0809AD38 @ =0x0000FFE0
	ldrh r1, [r3, #0x3c]
	ands r0, r1
	movs r1, #0x1e
	orrs r0, r1
	strh r0, [r3, #0x3c]
	movs r0, #0x20
	ldrb r1, [r2]
	orrs r0, r1
	strb r0, [r2]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0809AD20: .4byte gPlaySt
.L0809AD24: .4byte gBg0Tm
.L0809AD28: .4byte gUnk_0837CB8C
.L0809AD2C: .4byte gUnk_0837EEB4
.L0809AD30: .4byte gUnk_0837F418
.L0809AD34: .4byte gDispIo
.L0809AD38: .4byte 0x0000FFE0

	thumb_func_start func_fe6_0809AD3C
func_fe6_0809AD3C: @ 0x0809AD3C
	ldr r3, .L0809AD60 @ =gDispIo
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
	bx lr
	.align 2, 0
.L0809AD60: .4byte gDispIo

	thumb_func_start func_fe6_0809AD64
func_fe6_0809AD64: @ 0x0809AD64
	ldr r2, .L0809AD84 @ =gDispIo
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
	subs r1, #8
	ands r0, r1
	strb r0, [r2, #1]
	bx lr
	.align 2, 0
.L0809AD84: .4byte gDispIo

	thumb_func_start func_fe6_0809AD88
func_fe6_0809AD88: @ 0x0809AD88
	push {lr}
	adds r1, r0, #0
	ldr r0, .L0809ADA0 @ =gUnk_03005284
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq .L0809ADA4
	adds r0, r1, #0
	bl Proc_End
	b .L0809ADC2
	.align 2, 0
.L0809ADA0: .4byte gUnk_03005284
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
	ldr r4, .L0809AE4C @ =gUnk_0836F6D4
	movs r0, #2
	bl GetBgChrOffset
	adds r1, r0, #0
	movs r5, #0xc0
	lsls r5, r5, #0x13
	adds r1, r1, r5
	adds r0, r4, #0
	bl Decompress
	ldr r4, .L0809AE50 @ =gUnk_08373F80
	movs r0, #2
	bl GetBgTilemapOffset
	adds r1, r0, #0
	adds r1, r1, r5
	adds r0, r4, #0
	bl Decompress
	ldr r0, .L0809AE54 @ =gUnk_08374670
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
	bl func_fe6_0809892C
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0809AE44: .4byte gUnk_08375ADC
.L0809AE48: .4byte 0x06000020
.L0809AE4C: .4byte gUnk_0836F6D4
.L0809AE50: .4byte gUnk_08373F80
.L0809AE54: .4byte gUnk_08374670
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
	ldr r0, .L0809AF4C @ =gUnk_03005284
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq .L0809AF50
	adds r0, r1, #0
	bl Proc_End
	b .L0809AF6E
	.align 2, 0
.L0809AF4C: .4byte gUnk_03005284
.L0809AF50:
	bl func_fe6_0809B188
	movs r0, #0xd
	bl EnableBgSync
	movs r0, #2
	bl func_fe6_08098AD8
	movs r0, #1
	str r0, [sp]
	movs r1, #0
	movs r2, #1
	movs r3, #0
	bl func_fe6_0809892C
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
	ldr r0, .L0809B180 @ =gUnk_086920A0
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
.L0809B180: .4byte gUnk_086920A0
.L0809B184: .4byte gDispIo

	thumb_func_start func_fe6_0809B188
func_fe6_0809B188: @ 0x0809B188
	push {lr}
	ldr r0, .L0809B210 @ =gUnk_086920B8
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
.L0809B210: .4byte gUnk_086920B8
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
	ldr r0, .L0809B298 @ =gUnk_03005284
	movs r4, #0
	ldrsb r4, [r0, r4]
	cmp r4, #0
	beq .L0809B29C
	adds r0, r1, #0
	bl Proc_End
	b .L0809B2E8
	.align 2, 0
.L0809B298: .4byte gUnk_03005284
.L0809B29C:
	bl func_fe6_080988C0
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
	bl func_fe6_08098AD8
	bl func_fe6_08098AC0
.L0809B2E8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0809B2F0: .4byte gDispIo

	thumb_func_start func_fe6_0809B2F4
func_fe6_0809B2F4: @ 0x0809B2F4
	adds r0, #0x64
	movs r1, #0
	strh r1, [r0]
	bx lr

	thumb_func_start func_fe6_0809B2FC
func_fe6_0809B2FC: @ 0x0809B2FC
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x64
	ldrh r1, [r0]
	adds r1, #1
	strh r1, [r0]
	movs r2, #0
	ldrsh r1, [r0, r2]
	ldr r0, .L0809B328 @ =gUnk_08692118
	ldr r0, [r0]
	cmp r1, r0
	blt .L0809B32C
	movs r0, #1
	bl SetNextGameAction
	adds r0, r4, #0
	bl FadeInBlackWithCallBack_Speed10
	adds r0, r4, #0
	bl Proc_Break
	b .L0809B35C
	.align 2, 0
.L0809B328: .4byte gUnk_08692118
.L0809B32C:
	ldr r0, .L0809B364 @ =gKeySt
	ldr r1, [r0]
	movs r0, #9
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq .L0809B35C
	ldr r0, .L0809B368 @ =gPlaySt
	ldrb r0, [r0, #0x1d]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L0809B34A
	movs r0, #0x6d
	bl m4aSongNumStart
.L0809B34A:
	movs r0, #0
	bl SetNextGameAction
	adds r0, r4, #0
	bl FadeInBlackWithCallBack_Speed20
	adds r0, r4, #0
	bl Proc_Break
.L0809B35C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0809B364: .4byte gKeySt
.L0809B368: .4byte gPlaySt

	thumb_func_start func_fe6_0809B36C
func_fe6_0809B36C: @ 0x0809B36C
	push {lr}
	bl EndEachSpriteAnimProc
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_fe6_0809B378
func_fe6_0809B378: @ 0x0809B378
	push {lr}
	adds r1, r0, #0
	ldr r0, .L0809B394 @ =gUnk_03005284
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq .L0809B38E
	adds r0, r1, #0
	bl Proc_End
.L0809B38E:
	pop {r0}
	bx r0
	.align 2, 0
.L0809B394: .4byte gUnk_03005284

	thumb_func_start func_fe6_0809B398
func_fe6_0809B398: @ 0x0809B398
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r0, .L0809B478 @ =gUnk_08692240
	bl InitBgs
	movs r0, #0xf
	bl DisableBgSync
	ldr r2, .L0809B47C @ =gDispIo
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r1, [r2, #1]
	ands r0, r1
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #2
	ands r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #1]
	movs r0, #2
	bl GetBgTilemapOffset
	movs r5, #0xc0
	lsls r5, r5, #0x13
	adds r0, r0, r5
	movs r1, #0x80
	lsls r1, r1, #5
	movs r2, #0
	bl func_fe6_08015208
	ldr r4, .L0809B480 @ =gUnk_0835CC90
	movs r0, #0
	bl GetBgChrOffset
	adds r1, r0, #0
	adds r1, r1, r5
	adds r0, r4, #0
	bl Decompress
	ldr r4, .L0809B484 @ =gUnk_0835F780
	movs r0, #0
	bl GetBgTilemapOffset
	adds r1, r0, #0
	adds r1, r1, r5
	adds r0, r4, #0
	bl Decompress
	ldr r4, .L0809B488 @ =gUnk_0835F9EC
	movs r0, #1
	bl GetBgTilemapOffset
	adds r1, r0, #0
	adds r1, r1, r5
	adds r0, r4, #0
	bl Decompress
	ldr r4, .L0809B48C @ =gUnk_0835F3A8
	movs r0, #2
	bl GetBgTilemapOffset
	adds r1, r0, #0
	adds r1, r1, r5
	adds r0, r4, #0
	bl Decompress
	ldr r0, .L0809B490 @ =gUnk_0835CB90
	movs r2, #0x80
	lsls r2, r2, #1
	movs r1, #0
	bl ApplyPaletteExt
	ldr r4, .L0809B494 @ =gUnk_0835FC3C
	movs r0, #3
	bl GetBgChrOffset
	adds r1, r0, #0
	adds r1, r1, r5
	adds r0, r4, #0
	bl Decompress
	ldr r0, .L0809B498 @ =gUnk_08364418
	movs r1, #0xf0
	lsls r1, r1, #1
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r2, .L0809B49C @ =gBg3Tm
	movs r1, #0
	ldr r4, .L0809B4A0 @ =0x0000027F
	ldr r0, .L0809B4A4 @ =0xFFFFF000
	adds r3, r0, #0
.L0809B458:
	adds r0, r1, r3
	strh r0, [r2]
	adds r2, #2
	adds r1, #1
	cmp r1, r4
	ble .L0809B458
	movs r0, #8
	bl EnableBgSync
	adds r1, r6, #0
	adds r1, #0x64
	movs r0, #0
	strh r0, [r1]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L0809B478: .4byte gUnk_08692240
.L0809B47C: .4byte gDispIo
.L0809B480: .4byte gUnk_0835CC90
.L0809B484: .4byte gUnk_0835F780
.L0809B488: .4byte gUnk_0835F9EC
.L0809B48C: .4byte gUnk_0835F3A8
.L0809B490: .4byte gUnk_0835CB90
.L0809B494: .4byte gUnk_0835FC3C
.L0809B498: .4byte gUnk_08364418
.L0809B49C: .4byte gBg3Tm
.L0809B4A0: .4byte 0x0000027F
.L0809B4A4: .4byte 0xFFFFF000

	thumb_func_start func_fe6_0809B4A8
func_fe6_0809B4A8: @ 0x0809B4A8
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r6, r0, #0
	ldr r0, .L0809B524 @ =gUnk_0835E6DC
	ldr r1, .L0809B528 @ =0x06010000
	bl Decompress
	ldr r0, .L0809B52C @ =gUnk_0835CB90
	movs r1, #0x80
	lsls r1, r1, #2
	movs r2, #0xa0
	bl ApplyPaletteExt
	ldr r5, .L0809B530 @ =gUnk_0835F2C8
	movs r0, #3
	str r0, [sp]
	movs r4, #0
	str r4, [sp, #4]
	adds r0, r5, #0
	movs r1, #0xa3
	movs r2, #0x1b
	movs r3, #0
	bl StartSpriteAnimProc
	str r4, [sp]
	str r4, [sp, #4]
	adds r0, r5, #0
	movs r1, #0x78
	movs r2, #0x55
	movs r3, #0
	bl StartSpriteAnimProc
	movs r0, #1
	str r0, [sp]
	str r4, [sp, #4]
	adds r0, r5, #0
	movs r1, #0x78
	movs r2, #0x78
	movs r3, #0
	bl StartSpriteAnimProc
	movs r0, #2
	str r0, [sp]
	str r4, [sp, #4]
	adds r0, r5, #0
	movs r1, #0x78
	movs r2, #0x98
	movs r3, #0
	bl StartSpriteAnimProc
	ldr r0, .L0809B534 @ =gUnk_08692258
	adds r1, r6, #0
	bl SpawnProc
	ldr r0, .L0809B538 @ =gUnk_08692298
	adds r1, r6, #0
	bl SpawnProc
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L0809B524: .4byte gUnk_0835E6DC
.L0809B528: .4byte 0x06010000
.L0809B52C: .4byte gUnk_0835CB90
.L0809B530: .4byte gUnk_0835F2C8
.L0809B534: .4byte gUnk_08692258
.L0809B538: .4byte gUnk_08692298

	thumb_func_start func_fe6_0809B53C
func_fe6_0809B53C: @ 0x0809B53C
	adds r1, r0, #0
	adds r1, #0x64
	movs r2, #0
	strh r2, [r1]
	adds r0, #0x66
	strh r2, [r0]
	bx lr
	.align 2, 0

	thumb_func_start func_fe6_0809B54C
func_fe6_0809B54C: @ 0x0809B54C
	push {lr}
	adds r2, r0, #0
	adds r3, r2, #0
	adds r3, #0x64
	ldrh r0, [r3]
	adds r1, r0, #1
	strh r1, [r3]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #3
	ble .L0809B586
	movs r0, #0
	strh r0, [r3]
	adds r2, #0x66
	ldrh r0, [r2]
	adds r0, #1
	movs r1, #0xf
	ands r0, r1
	strh r0, [r2]
	movs r1, #0
	ldrsh r0, [r2, r1]
	lsls r0, r0, #1
	ldr r1, .L0809B58C @ =gUnk_0835F388
	adds r0, r0, r1
	movs r1, #0x8c
	lsls r1, r1, #2
	movs r2, #2
	bl ApplyPaletteExt
.L0809B586:
	pop {r0}
	bx r0
	.align 2, 0
.L0809B58C: .4byte gUnk_0835F388

	thumb_func_start func_fe6_0809B590
func_fe6_0809B590: @ 0x0809B590
	push {r4, lr}
	ldr r1, .L0809B5FC @ =gDispIo
	mov ip, r1
	movs r1, #1
	mov r2, ip
	ldrb r2, [r2, #1]
	orrs r1, r2
	movs r2, #3
	rsbs r2, r2, #0
	ands r1, r2
	subs r2, #2
	ands r1, r2
	movs r2, #8
	orrs r1, r2
	movs r2, #0x10
	orrs r1, r2
	mov r3, ip
	strb r1, [r3, #1]
	adds r3, #0x3c
	ldr r1, .L0809B600 @ =0x0000FFE0
	mov r4, ip
	ldrh r4, [r4, #0x3c]
	ands r1, r4
	movs r2, #1
	orrs r1, r2
	ldr r2, .L0809B604 @ =0x0000E0FF
	ands r1, r2
	movs r4, #0x80
	lsls r4, r4, #4
	adds r2, r4, #0
	orrs r1, r2
	mov r2, ip
	strh r1, [r2, #0x3c]
	movs r1, #0x3f
	ldrb r4, [r3]
	ands r1, r4
	movs r2, #0x40
	orrs r1, r2
	strb r1, [r3]
	mov r1, ip
	adds r1, #0x44
	movs r2, #0
	strb r2, [r1]
	adds r3, #9
	movs r1, #0x10
	strb r1, [r3]
	mov r1, ip
	adds r1, #0x46
	strb r2, [r1]
	adds r0, #0x64
	strh r2, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0809B5FC: .4byte gDispIo
.L0809B600: .4byte 0x0000FFE0
.L0809B604: .4byte 0x0000E0FF

	thumb_func_start func_fe6_0809B608
func_fe6_0809B608: @ 0x0809B608
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r7, r0, #0
	adds r6, r7, #0
	adds r6, #0x64
	ldrh r0, [r6]
	adds r0, #1
	movs r5, #0
	strh r0, [r6]
	movs r0, #0
	ldrsh r3, [r6, r0]
	ldr r4, .L0809B694 @ =gUnk_08692120
	ldr r0, [r4]
	str r0, [sp]
	movs r0, #5
	movs r1, #0
	movs r2, #0x10
	bl Interpolate
	ldr r1, .L0809B698 @ =gDispIo
	mov ip, r1
	mov r3, ip
	adds r3, #0x3c
	movs r1, #0x3f
	ldrb r2, [r3]
	ands r1, r2
	movs r2, #0x40
	orrs r1, r2
	strb r1, [r3]
	mov r1, ip
	adds r1, #0x44
	strb r0, [r1]
	movs r1, #0x10
	subs r1, r1, r0
	mov r0, ip
	adds r0, #0x45
	strb r1, [r0]
	adds r0, #1
	strb r5, [r0]
	movs r1, #0x10
	rsbs r1, r1, #0
	movs r0, #0
	ldrsh r3, [r6, r0]
	ldr r0, [r4]
	str r0, [sp]
	movs r0, #5
	movs r2, #0
	bl Interpolate
	adds r2, r0, #0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #0
	movs r1, #0
	bl SetBgOffset
	movs r2, #0
	ldrsh r1, [r6, r2]
	ldr r0, [r4]
	cmp r1, r0
	blt .L0809B68C
	adds r0, r7, #0
	bl Proc_Break
	movs r0, #0
	strh r0, [r6]
.L0809B68C:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0809B694: .4byte gUnk_08692120
.L0809B698: .4byte gDispIo

	thumb_func_start func_fe6_0809B69C
func_fe6_0809B69C: @ 0x0809B69C
	adds r0, #0x64
	movs r1, #0
	strh r1, [r0]
	bx lr

	thumb_func_start func_fe6_0809B6A4
func_fe6_0809B6A4: @ 0x0809B6A4
	push {lr}
	adds r3, r0, #0
	adds r2, r3, #0
	adds r2, #0x64
	ldrh r0, [r2]
	adds r1, r0, #1
	strh r1, [r2]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r1, .L0809B6C8 @ =gUnk_0869212C
	ldr r1, [r1]
	cmp r0, r1
	blt .L0809B6C4
	adds r0, r3, #0
	bl Proc_Break
.L0809B6C4:
	pop {r0}
	bx r0
	.align 2, 0
.L0809B6C8: .4byte gUnk_0869212C

	thumb_func_start func_fe6_0809B6CC
func_fe6_0809B6CC: @ 0x0809B6CC
	ldr r3, .L0809B6F0 @ =gDispIo
	movs r1, #1
	ldrb r2, [r3, #1]
	orrs r1, r2
	movs r2, #3
	rsbs r2, r2, #0
	ands r1, r2
	movs r2, #4
	orrs r1, r2
	movs r2, #8
	orrs r1, r2
	movs r2, #0x10
	orrs r1, r2
	strb r1, [r3, #1]
	adds r0, #0x64
	movs r1, #0
	strh r1, [r0]
	bx lr
	.align 2, 0
.L0809B6F0: .4byte gDispIo

	thumb_func_start func_fe6_0809B6F4
func_fe6_0809B6F4: @ 0x0809B6F4
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r7, r0, #0
	adds r5, r7, #0
	adds r5, #0x64
	ldrh r0, [r5]
	adds r0, #1
	strh r0, [r5]
	movs r0, #0
	ldrsh r3, [r5, r0]
	ldr r6, .L0809B758 @ =gUnk_0869211C
	ldr r0, [r6]
	str r0, [sp]
	movs r0, #4
	movs r1, #0xf0
	movs r2, #0
	bl Interpolate
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	movs r0, #0
	ldrsh r3, [r5, r0]
	ldr r0, [r6]
	str r0, [sp]
	movs r0, #4
	movs r1, #0x69
	movs r2, #0
	bl Interpolate
	adds r2, r0, #0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	adds r1, r4, #0
	bl SetBgOffset
	movs r0, #0
	ldrsh r1, [r5, r0]
	ldr r0, [r6]
	cmp r1, r0
	blt .L0809B74E
	adds r0, r7, #0
	bl Proc_Break
.L0809B74E:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0809B758: .4byte gUnk_0869211C

	thumb_func_start func_fe6_0809B75C
func_fe6_0809B75C: @ 0x0809B75C
	push {r4, lr}
	ldr r1, .L0809B7C8 @ =gDispIo
	mov ip, r1
	movs r1, #1
	mov r2, ip
	ldrb r2, [r2, #1]
	orrs r1, r2
	movs r2, #2
	orrs r1, r2
	movs r2, #4
	orrs r1, r2
	movs r2, #8
	orrs r1, r2
	movs r2, #0x10
	orrs r1, r2
	mov r3, ip
	strb r1, [r3, #1]
	adds r3, #0x3c
	ldr r1, .L0809B7CC @ =0x0000FFE0
	mov r4, ip
	ldrh r4, [r4, #0x3c]
	ands r1, r4
	movs r2, #2
	orrs r1, r2
	ldr r2, .L0809B7D0 @ =0x0000E0FF
	ands r1, r2
	movs r4, #0xc0
	lsls r4, r4, #4
	adds r2, r4, #0
	orrs r1, r2
	mov r2, ip
	strh r1, [r2, #0x3c]
	movs r1, #0x3f
	ldrb r4, [r3]
	ands r1, r4
	movs r2, #0x40
	orrs r1, r2
	strb r1, [r3]
	mov r1, ip
	adds r1, #0x44
	movs r2, #0
	strb r2, [r1]
	adds r3, #9
	movs r1, #0x10
	strb r1, [r3]
	mov r1, ip
	adds r1, #0x46
	strb r2, [r1]
	adds r0, #0x64
	strh r2, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0809B7C8: .4byte gDispIo
.L0809B7CC: .4byte 0x0000FFE0
.L0809B7D0: .4byte 0x0000E0FF

	thumb_func_start func_fe6_0809B7D4
func_fe6_0809B7D4: @ 0x0809B7D4
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r7, r0, #0
	adds r4, r7, #0
	adds r4, #0x64
	ldrh r0, [r4]
	adds r0, #1
	movs r6, #0
	strh r0, [r4]
	movs r0, #0
	ldrsh r3, [r4, r0]
	ldr r5, .L0809B85C @ =gUnk_08692124
	ldr r0, [r5]
	str r0, [sp]
	movs r0, #4
	movs r1, #8
	movs r2, #0
	bl Interpolate
	adds r2, r0, #0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #1
	movs r1, #0
	bl SetBgOffset
	movs r1, #0
	ldrsh r3, [r4, r1]
	ldr r0, [r5]
	str r0, [sp]
	movs r0, #4
	movs r1, #0
	movs r2, #8
	bl Interpolate
	ldr r2, .L0809B860 @ =gDispIo
	mov ip, r2
	mov r3, ip
	adds r3, #0x3c
	movs r1, #0x3f
	ldrb r2, [r3]
	ands r1, r2
	movs r2, #0x40
	orrs r1, r2
	strb r1, [r3]
	mov r1, ip
	adds r1, #0x44
	strb r0, [r1]
	movs r1, #0x10
	subs r1, r1, r0
	mov r0, ip
	adds r0, #0x45
	strb r1, [r0]
	adds r0, #1
	strb r6, [r0]
	movs r0, #0
	ldrsh r1, [r4, r0]
	ldr r0, [r5]
	cmp r1, r0
	blt .L0809B852
	adds r0, r7, #0
	bl Proc_Break
.L0809B852:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0809B85C: .4byte gUnk_08692124
.L0809B860: .4byte gDispIo

	thumb_func_start func_fe6_0809B864
func_fe6_0809B864: @ 0x0809B864
	ldr r1, .L0809B894 @ =gDispIo
	mov ip, r1
	mov r3, ip
	adds r3, #0x3c
	movs r1, #0x3f
	ldrb r2, [r3]
	ands r1, r2
	movs r2, #0x40
	orrs r1, r2
	strb r1, [r3]
	mov r1, ip
	adds r1, #0x44
	movs r2, #0
	strb r2, [r1]
	adds r3, #9
	movs r1, #0x10
	strb r1, [r3]
	mov r1, ip
	adds r1, #0x46
	strb r2, [r1]
	adds r0, #0x64
	strh r2, [r0]
	bx lr
	.align 2, 0
.L0809B894: .4byte gDispIo

	thumb_func_start func_fe6_0809B898
func_fe6_0809B898: @ 0x0809B898
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	ldr r5, .L0809B8F8 @ =gDispIo
	adds r2, r5, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r4, r6, #0
	adds r4, #0x64
	movs r0, #0
	ldrsh r3, [r4, r0]
	movs r0, #0x18
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0x10
	bl Interpolate
	adds r1, r5, #0
	adds r1, #0x44
	movs r2, #0
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r5, #0
	adds r0, #0x46
	strb r2, [r0]
	ldrh r0, [r4]
	adds r1, r0, #1
	strh r1, [r4]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x17
	ble .L0809B8EE
	adds r0, r6, #0
	bl Proc_Break
.L0809B8EE:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L0809B8F8: .4byte gDispIo

	thumb_func_start func_fe6_0809B8FC
func_fe6_0809B8FC: @ 0x0809B8FC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, .L0809B954 @ =gUnk_08364438
	ldr r1, .L0809B958 @ =0x06014000
	bl Decompress
	ldr r0, .L0809B95C @ =gUnk_08364A94
	movs r1, #0x80
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r2, .L0809B960 @ =gDispIo
	movs r0, #1
	ldrb r1, [r2, #1]
	orrs r0, r1
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #2
	ands r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #1]
	ldr r0, .L0809B964 @ =0x0000FFE0
	ldrh r3, [r2, #0x3c]
	ands r0, r3
	movs r1, #0x10
	orrs r0, r1
	ldr r1, .L0809B968 @ =0x0000E0FF
	ands r0, r1
	movs r3, #0xf0
	lsls r3, r3, #4
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2, #0x3c]
	adds r4, #0x64
	movs r0, #0
	strh r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0809B954: .4byte gUnk_08364438
.L0809B958: .4byte 0x06014000
.L0809B95C: .4byte gUnk_08364A94
.L0809B960: .4byte gDispIo
.L0809B964: .4byte 0x0000FFE0
.L0809B968: .4byte 0x0000E0FF

	thumb_func_start func_fe6_0809B96C
func_fe6_0809B96C: @ 0x0809B96C
	push {r4, lr}
	adds r4, r0, #0
	bl func_fe6_0809B99C
	adds r2, r4, #0
	adds r2, #0x64
	movs r1, #0
	ldrsh r0, [r2, r1]
	ldr r1, .L0809B98C @ =gUnk_08692128
	ldr r1, [r1]
	cmp r0, r1
	bne .L0809B990
	adds r0, r4, #0
	bl Proc_Break
	b .L0809B996
	.align 2, 0
.L0809B98C: .4byte gUnk_08692128
.L0809B990:
	ldrh r0, [r2]
	adds r0, #1
	strh r0, [r2]
.L0809B996:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start func_fe6_0809B99C
func_fe6_0809B99C: @ 0x0809B99C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r4, r0, #0
	adds r4, #0x64
	movs r0, #0
	ldrsh r3, [r4, r0]
	ldr r5, .L0809BAD8 @ =gUnk_08692128
	ldr r0, [r5]
	str r0, [sp]
	movs r0, #4
	movs r1, #0x96
	movs r2, #0
	bl Interpolate
	adds r7, r0, #0
	movs r1, #0
	ldrsh r3, [r4, r1]
	ldr r0, [r5]
	str r0, [sp]
	movs r0, #4
	movs r1, #0x64
	movs r2, #0
	bl Interpolate
	adds r6, r0, #0
	movs r2, #0
	ldrsh r3, [r4, r2]
	ldr r0, [r5]
	str r0, [sp]
	movs r0, #4
	movs r1, #0x80
	movs r2, #0x80
	lsls r2, r2, #2
	bl Interpolate
	mov sb, r0
	movs r0, #0x8f
	lsls r0, r0, #2
	mov r8, r0
	adds r0, r7, r0
	ldr r5, .L0809BADC @ =0x000001FF
	ands r0, r5
	movs r2, #0x90
	lsls r2, r2, #1
	adds r1, r6, r2
	movs r2, #0xff
	mov sl, r2
	ands r1, r2
	ldr r2, .L0809BAE0 @ =gUnk_08692300
	movs r3, #0x80
	lsls r3, r3, #2
	bl PutOamHiRam
	lsls r0, r7, #1
	adds r0, r0, r7
	cmp r0, #0
	bge .L0809BA18
	adds r0, #7
.L0809BA18:
	asrs r0, r0, #3
	add r0, r8
	ands r0, r5
	lsrs r1, r6, #0x1f
	adds r1, r6, r1
	asrs r1, r1, #1
	movs r2, #0x90
	lsls r2, r2, #1
	adds r1, r1, r2
	mov r2, sl
	ands r1, r2
	ldr r2, .L0809BAE4 @ =gUnk_086922F8
	movs r3, #0x80
	lsls r3, r3, #2
	bl PutOamHiRam
	adds r0, r7, #0
	cmp r0, #0
	bge .L0809BA40
	adds r0, #7
.L0809BA40:
	asrs r4, r0, #3
	add r4, r8
	ands r4, r5
	adds r0, r6, #0
	movs r1, #6
	bl __divsi3
	adds r1, r0, #0
	movs r0, #0x90
	lsls r0, r0, #1
	adds r1, r1, r0
	mov r2, sl
	ands r1, r2
	ldr r2, .L0809BAE8 @ =gUnk_086922F0
	adds r0, r4, #0
	movs r3, #0x80
	lsls r3, r3, #2
	bl PutOamHiRam
	ldr r4, .L0809BAEC @ =gSinLut
	movs r0, #0x80
	adds r0, r0, r4
	mov r8, r0
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r0, r0, #4
	mov r1, sb
	bl Div
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	movs r2, #0
	ldrsh r0, [r4, r2]
	rsbs r0, r0, #0
	lsls r0, r0, #4
	mov r1, sb
	bl Div
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	movs r1, #0
	ldrsh r0, [r4, r1]
	lsls r0, r0, #4
	mov r1, sb
	bl Div
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	mov r2, r8
	movs r1, #0
	ldrsh r0, [r2, r1]
	lsls r0, r0, #4
	mov r1, sb
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	movs r0, #0
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl SetObjAffine
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0809BAD8: .4byte gUnk_08692128
.L0809BADC: .4byte 0x000001FF
.L0809BAE0: .4byte gUnk_08692300
.L0809BAE4: .4byte gUnk_086922F8
.L0809BAE8: .4byte gUnk_086922F0
.L0809BAEC: .4byte gSinLut

	thumb_func_start func_fe6_0809BAF0
func_fe6_0809BAF0: @ 0x0809BAF0
	push {lr}
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl StartBgmExt
	pop {r0}
	bx r0

	thumb_func_start func_fe6_0809BB00
func_fe6_0809BB00: @ 0x0809BB00
	push {lr}
	ldr r0, .L0809BB18 @ =gPlaySt
	ldrb r0, [r0, #0x1d]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L0809BB12
	movs r0, #0x92
	bl m4aSongNumStart
.L0809BB12:
	pop {r0}
	bx r0
	.align 2, 0
.L0809BB18: .4byte gPlaySt
