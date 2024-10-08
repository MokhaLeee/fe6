	.include "macro.inc"

	.syntax unified

	thumb_func_start func_fe6_080922D8
func_fe6_080922D8: @ 0x080922D8
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	mov ip, r0

	ldr r3, .L080923C0 @ =gDispIo
	movs r4, #8
	rsbs r4, r4, #0
	ldrb r0, [r3]
	ands r4, r0
	movs r2, #4
	orrs r4, r2

    @ SetDispEnable
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r1, [r3, #1]
	ands r0, r1
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	orrs r0, r2
	subs r1, #6
	ands r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r3, #1]

    @ gDispIo.bg0_ct.priority
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r2, [r3, #0xc]
	ands r0, r2
	strb r0, [r3, #0xc]
	adds r0, r1, #0
	ldrb r5, [r3, #0x10]
	ands r0, r5
	movs r2, #1
	orrs r0, r2
	strb r0, [r3, #0x10]
	ldrb r7, [r3, #0x14]
	ands r1, r7
	movs r0, #2
	orrs r1, r0
	strb r1, [r3, #0x14]
	movs r0, #3
	ldrb r1, [r3, #0x18]
	orrs r0, r1
	strb r0, [r3, #0x18]

    @ gDispIo.disp_ct.bitmap_frame = 0;
	movs r0, #0x11
	rsbs r0, r0, #0
	ands r4, r0
	strb r4, [r3]

	movs r1, #0
	mov r2, ip
	str r1, [r2, #0x2c]
	str r1, [r2, #0x30]
	movs r0, #0xf0
	lsls r0, r0, #6
	str r0, [r2, #0x34]
	movs r0, #0xa0
	lsls r0, r0, #6
	str r0, [r2, #0x38]
	str r1, [r2, #0x44]

	mov r5, ip
	adds r5, #0x48
	movs r2, #0
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r5]
	mov r6, ip
	adds r6, #0x4a
	strh r0, [r6]
	mov r0, ip
	adds r0, #0x4c
	strh r1, [r0]

	adds r0, #6
	strb r2, [r0]
	subs r0, #4
	strh r1, [r0]

	adds r0, #5
	strb r2, [r0]
	subs r0, #3
	strh r1, [r0]

	adds r0, #4
	strb r2, [r0]

	mov r3, ip
	ldr r0, [r3, #0x2c]
	ldr r1, [r3, #0x30]
	ldr r2, [r3, #0x34]
	ldr r3, [r3, #0x38]
	mov r7, ip
	ldr r4, [r7, #0x44]
	str r4, [sp]
	movs r7, #0
	ldrsh r4, [r5, r7]
	str r4, [sp, #4]
	movs r5, #0
	ldrsh r4, [r6, r5]
	str r4, [sp, #8]
	bl func_fe6_08092EB0
	movs r0, #0
	movs r1, #1
	bl ApplyCompressedWmPalette
	movs r0, #0
	movs r1, #0
	bl GetCompressedWmPalette
	movs r1, #0xc0
	lsls r1, r1, #0x13
	bl Decompress
	bl func_fe6_08092838
	add sp, #0xc
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L080923C0: .4byte gDispIo

	thumb_func_start func_fe6_080923C4
func_fe6_080923C4: @ 0x080923C4
	bx lr
	.align 2, 0

	thumb_func_start func_fe6_080923C8
func_fe6_080923C8: @ 0x080923C8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	adds r6, r1, #0
	adds r7, r2, #0
	mov r8, r3
	ldr r0, .L080923F4 @ =ProcScr_0868C37C
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	bl func_fe6_08092854
	adds r1, r0, #0
	str r1, [r4, #0x58]
	cmp r1, #0
	bne .L080923F8
	adds r0, r4, #0
	bl Proc_End
	b .L0809241A
	.align 2, 0
.L080923F4: .4byte ProcScr_0868C37C
.L080923F8:
	movs r0, #1
	strb r0, [r1]
	ldr r0, [r4, #0x58]
	strb r5, [r0, #1]
	ldr r0, [r4, #0x58]
	strb r6, [r0, #5]
	ldr r1, [r4, #0x58]
	adds r0, r1, #0
	adds r0, #0xd4
	str r7, [r0]
	adds r0, #4
	mov r2, r8
	str r2, [r0]
	ldr r0, [sp, #0x18]
	str r0, [r1, #0xc]
	ldr r0, [sp, #0x1c]
	str r0, [r1, #8]
.L0809241A:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start func_fe6_08092424
func_fe6_08092424: @ 0x08092424
	push {lr}
	ldr r0, .L08092430 @ =ProcScr_0868C37C
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
.L08092430: .4byte ProcScr_0868C37C

	thumb_func_start func_fe6_08092434
func_fe6_08092434: @ 0x08092434
	push {lr}
	ldr r0, .L08092444 @ =ProcScr_0868C37C
	bl FindProc
	cmp r0, #0
	bne .L08092448
	movs r0, #0
	b .L0809244A
	.align 2, 0
.L08092444: .4byte ProcScr_0868C37C
.L08092448:
	movs r0, #1
.L0809244A:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start func_fe6_08092450
func_fe6_08092450: @ 0x08092450
	ldr r1, [r0, #0x58]
	movs r0, #0
	strb r0, [r1]
	bx lr

	thumb_func_start func_fe6_08092458
func_fe6_08092458: @ 0x08092458
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	ldr r7, [r0, #0x58]
	ldrb r0, [r7, #1]
	bl func_fe6_0809325C
	bl func_fe6_08093284
	movs r1, #0
	strb r0, [r7, #4]
	str r1, [r7, #0x14]
	movs r3, #0
	cmp r3, r0
	bge .L080924CE
.L0809247C:
	ldrb r0, [r7, #1]
	str r3, [sp]
	bl func_fe6_0809325C
	ldr r3, [sp]
	adds r1, r3, #0
	bl func_fe6_08093288
	ldr r3, [sp]
	lsls r4, r3, #2
	adds r2, r7, #0
	adds r2, #0x74
	adds r2, r2, r4
	adds r1, r7, #0
	adds r1, #0xd4
	ldr r1, [r1]
	adds r0, r0, r1
	lsls r0, r0, #8
	str r0, [r2]
	ldrb r0, [r7, #1]
	str r3, [sp]
	bl func_fe6_0809325C
	ldr r3, [sp]
	adds r1, r3, #0
	bl func_fe6_080932D8
	adds r2, r7, #0
	adds r2, #0xa4
	adds r2, r2, r4
	adds r1, r7, #0
	adds r1, #0xd8
	ldr r1, [r1]
	adds r0, r0, r1
	lsls r0, r0, #8
	str r0, [r2]
	ldr r3, [sp]
	adds r3, #1
	ldrb r1, [r7, #4]
	cmp r3, r1
	blt .L0809247C
.L080924CE:
	movs r3, #1
	movs r0, #0x14
	adds r0, r0, r7
	mov sb, r0
	ldrb r1, [r7, #4]
	cmp r3, r1
	bge .L08092556
	movs r0, #0x74
	adds r0, r0, r7
	mov sl, r0
	movs r1, #0
	mov r8, r1
.L080924E6:
	lsls r6, r3, #2
	mov r0, sl
	ldr r5, [r0, #4]
	adds r1, r0, #0
	adds r1, #4
	mov sl, r1
	subs r1, #4
	ldm r1!, {r0}
	subs r5, r5, r0
	adds r0, r7, #0
	adds r0, #0xa4
	adds r1, r0, r6
	add r0, r8
	ldr r4, [r1]
	ldr r0, [r0]
	subs r4, r4, r0
	adds r0, r5, #0
	muls r0, r5, r0
	adds r1, r4, #0
	muls r1, r4, r1
	adds r0, r0, r1
	str r3, [sp]
	bl Sqrt
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r1, sb
	adds r2, r1, r6
	add r1, r8
	ldr r1, [r1]
	adds r1, r1, r0
	str r1, [r2]
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	adds r0, r5, #0
	adds r1, r4, #0
	bl ArcTan2
	adds r4, r7, #0
	adds r4, #0x44
	adds r4, r4, r6
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0x3f
	bl __divsi3
	str r0, [r4]
	movs r0, #4
	add r8, r0
	ldr r3, [sp]
	adds r3, #1
	ldrb r1, [r7, #4]
	cmp r3, r1
	blt .L080924E6
.L08092556:
	ldrb r0, [r7, #4]
	subs r0, #1
	lsls r0, r0, #2
	add r0, sb
	ldr r0, [r0]
	str r0, [r7, #0x10]
	ldr r1, [r7, #8]
	bl __divsi3
	adds r0, #1
	strb r0, [r7, #3]
	movs r3, #0
	ldrb r1, [r7, #3]
	cmp r3, r1
	bge .L080925B2
	movs r6, #0
.L08092576:
	lsls r5, r3, #2
	movs r0, #0x91
	lsls r0, r0, #2
	adds r4, r7, r0
	adds r4, r4, r5
	ldr r0, [r7, #0xc]
	muls r0, r3, r0
	subs r1, #1
	str r3, [sp]
	bl __divsi3
	str r0, [r4]
	adds r0, r7, #0
	adds r0, #0xdc
	ldr r3, [sp]
	adds r0, r0, r3
	strb r6, [r0]
	movs r1, #0xb9
	lsls r1, r1, #2
	adds r0, r7, r1
	adds r0, r0, r5
	str r6, [r0]
	adds r0, r7, #0
	adds r0, #0xf0
	adds r0, r0, r3
	strb r6, [r0]
	adds r3, #1
	ldrb r1, [r7, #3]
	cmp r3, r1
	blt .L08092576
.L080925B2:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_fe6_080925C4
func_fe6_080925C4: @ 0x080925C4
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r5, r0, #0
	lsls r7, r1, #2
	movs r2, #0xa5
	lsls r2, r2, #2
	adds r0, r5, r2
	adds r0, r0, r7
	ldr r0, [r0]
	adds r0, #0x20
	ldr r2, .L08092640 @ =0x000003FF
	ands r0, r2
	asrs r2, r0, #6
	asrs r0, r0, #8
	lsls r3, r0, #8
	movs r0, #3
	ands r2, r0
	lsls r6, r2, #1
	ldrb r0, [r5, #3]
	subs r0, #1
	cmp r1, r0
	bne .L08092648
	ldrb r0, [r5, #2]
	movs r4, #0x80
	lsls r4, r4, #1
	adds r1, r4, #0
	adds r2, r4, #0
	bl func_fe6_08093064
	movs r0, #0xf
	ldrb r1, [r5, #5]
	ands r0, r1
	lsls r0, r0, #0xc
	movs r1, #0xc4
	lsls r1, r1, #2
	adds r0, r0, r1
	adds r6, r6, r0
	movs r2, #0x82
	lsls r2, r2, #1
	adds r0, r5, r2
	adds r0, r0, r7
	ldr r1, [r0]
	lsls r1, r1, #0xf
	lsrs r1, r1, #0x17
	ldrb r2, [r5, #2]
	lsls r0, r2, #9
	orrs r1, r0
	movs r2, #0xaa
	lsls r2, r2, #1
	adds r0, r5, r2
	adds r0, r0, r7
	ldr r2, [r0]
	asrs r2, r2, #8
	movs r0, #0xff
	ands r2, r0
	orrs r2, r4
	ldr r3, .L08092644 @ =Sprite_0868C2D4
	str r6, [sp]
	movs r0, #0xc
	bl PutSpriteExt
	b .L0809267A
	.align 2, 0
.L08092640: .4byte 0x000003FF
.L08092644: .4byte Sprite_0868C2D4
.L08092648:
	movs r0, #0xf
	ldrb r1, [r5, #5]
	ands r0, r1
	lsls r0, r0, #0xc
	ldr r1, .L08092684 @ =0x00000323
	adds r6, r0, r1
	movs r2, #0x82
	lsls r2, r2, #1
	adds r0, r5, r2
	adds r0, r0, r7
	ldr r1, [r0]
	lsls r1, r1, #0xf
	lsrs r1, r1, #0x17
	adds r2, #0x50
	adds r0, r5, r2
	adds r0, r0, r7
	ldr r2, [r0]
	asrs r2, r2, #8
	movs r0, #0xff
	ands r2, r0
	ldr r3, .L08092688 @ =Sprite_0868C2CC
	str r6, [sp]
	movs r0, #0xc
	bl PutSpriteExt
.L0809267A:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08092684: .4byte 0x00000323
.L08092688: .4byte Sprite_0868C2CC

	thumb_func_start func_fe6_0809268C
func_fe6_0809268C: @ 0x0809268C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r4, [r0, #0x58]
	movs r0, #0
	mov sl, r0
	ldrb r1, [r4, #3]
	cmp sl, r1
	blt .L080926A4
	b .L08092828
.L080926A4:
	movs r2, #0xf0
	adds r2, r2, r4
	mov sb, r2
	mov r8, r0
.L080926AC:
	mov r1, sb
	ldrb r0, [r1]
	cmp r0, #1
	beq .L0809276E
	cmp r0, #1
	bgt .L080926BE
	cmp r0, #0
	beq .L080926C6
	b .L08092816
.L080926BE:
	cmp r0, #0x63
	bne .L080926C4
	b .L0809280E
.L080926C4:
	b .L08092816
.L080926C6:
	adds r0, r4, #0
	adds r0, #0xdc
	add r0, sl
	ldrb r6, [r0]
	movs r2, #0x82
	lsls r2, r2, #1
	adds r1, r4, r2
	add r1, r8
	lsls r2, r6, #2
	adds r0, r4, #0
	adds r0, #0x74
	adds r0, r0, r2
	ldr r0, [r0]
	str r0, [r1]
	movs r0, #0xaa
	lsls r0, r0, #1
	adds r1, r4, r0
	add r1, r8
	adds r0, r4, #0
	adds r0, #0xa4
	adds r0, r0, r2
	ldr r0, [r0]
	str r0, [r1]
	movs r1, #0xa5
	lsls r1, r1, #2
	adds r0, r4, r1
	mov r2, r8
	adds r7, r0, r2
	adds r1, r6, #1
	lsls r1, r1, #2
	adds r0, r4, #0
	adds r0, #0x44
	adds r0, r0, r1
	ldr r1, [r0]
	str r1, [r7]
	movs r2, #0xd2
	lsls r2, r2, #1
	adds r0, r4, r2
	mov r2, r8
	adds r5, r0, r2
	movs r2, #0x91
	lsls r2, r2, #2
	adds r0, r4, r2
	mov r2, r8
	adds r3, r0, r2
	ldr r0, .L080927E4 @ =gUnk_08353328
	mov ip, r0
	movs r2, #0x80
	lsls r2, r2, #1
	adds r1, r1, r2
	ldr r6, .L080927E8 @ =0x000003FF
	ands r1, r6
	lsls r1, r1, #2
	add r1, ip
	ldr r2, [r3]
	ldr r0, [r1]
	muls r0, r2, r0
	cmp r0, #0
	bge .L08092740
	ldr r1, .L080927EC @ =0x00007FFF
	adds r0, r0, r1
.L08092740:
	asrs r0, r0, #0xf
	str r0, [r5]
	movs r2, #0xfa
	lsls r2, r2, #1
	adds r0, r4, r2
	mov r1, r8
	adds r2, r0, r1
	ldr r0, [r7]
	ands r0, r6
	lsls r0, r0, #2
	add r0, ip
	ldr r1, [r3]
	ldr r0, [r0]
	muls r0, r1, r0
	cmp r0, #0
	bge .L08092764
	ldr r1, .L080927EC @ =0x00007FFF
	adds r0, r0, r1
.L08092764:
	asrs r0, r0, #0xf
	str r0, [r2]
	movs r0, #1
	mov r2, sb
	strb r0, [r2]
.L0809276E:
	adds r0, r4, #0
	mov r1, sl
	bl func_fe6_080925C4
	adds r0, r4, #0
	adds r0, #0xdc
	mov r1, sl
	adds r7, r0, r1
	ldrb r6, [r7]
	movs r0, #0x82
	lsls r0, r0, #1
	adds r2, r4, r0
	add r2, r8
	movs r1, #0xd2
	lsls r1, r1, #1
	adds r0, r4, r1
	add r0, r8
	ldr r1, [r2]
	ldr r0, [r0]
	adds r1, r1, r0
	str r1, [r2]
	movs r0, #0xaa
	lsls r0, r0, #1
	adds r2, r4, r0
	add r2, r8
	movs r1, #0xfa
	lsls r1, r1, #1
	adds r0, r4, r1
	add r0, r8
	ldr r1, [r2]
	ldr r0, [r0]
	adds r1, r1, r0
	str r1, [r2]
	movs r2, #0xb9
	lsls r2, r2, #2
	adds r1, r4, r2
	add r1, r8
	subs r2, #0xa0
	adds r0, r4, r2
	add r0, r8
	ldr r2, [r1]
	ldr r0, [r0]
	adds r5, r2, r0
	str r5, [r1]
	ldr r0, [r4, #0x10]
	mov r1, sl
	muls r1, r0, r1
	adds r0, r1, #0
	ldrb r1, [r4, #3]
	subs r1, #1
	bl __divsi3
	cmp r5, r0
	blt .L080927F0
	movs r0, #0x63
	mov r2, sb
	strb r0, [r2]
	b .L08092816
	.align 2, 0
.L080927E4: .4byte gUnk_08353328
.L080927E8: .4byte 0x000003FF
.L080927EC: .4byte 0x00007FFF
.L080927F0:
	adds r0, r6, #1
	lsls r0, r0, #2
	adds r1, r4, #0
	adds r1, #0x14
	adds r1, r1, r0
	ldr r0, [r1]
	cmp r5, r0
	blt .L08092816
	ldrb r0, [r7]
	adds r0, #1
	movs r1, #0
	strb r0, [r7]
	mov r0, sb
	strb r1, [r0]
	b .L08092816
.L0809280E:
	adds r0, r4, #0
	mov r1, sl
	bl func_fe6_080925C4
.L08092816:
	movs r1, #1
	add sb, r1
	movs r2, #4
	add r8, r2
	add sl, r1
	ldrb r0, [r4, #3]
	cmp sl, r0
	bge .L08092828
	b .L080926AC
.L08092828:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_fe6_08092838
func_fe6_08092838: @ 0x08092838
	movs r1, #0
	movs r3, #0
	ldr r0, .L08092850 @ =gUnk_030048E0
	movs r2, #0xcd
	lsls r2, r2, #2
.L08092842:
	strb r3, [r0]
	strb r1, [r0, #2]
	adds r0, r0, r2
	adds r1, #1
	cmp r1, #2
	ble .L08092842
	bx lr
	.align 2, 0
.L08092850: .4byte gUnk_030048E0

	thumb_func_start func_fe6_08092854
func_fe6_08092854: @ 0x08092854
	ldr r1, .L0809286C @ =gUnk_030048E0
	movs r0, #0xcd
	lsls r0, r0, #3
	adds r3, r1, r0
	movs r2, #0xcd
	lsls r2, r2, #2
.L08092860:
	ldrb r0, [r1]
	cmp r0, #0
	bne .L08092870
	adds r0, r1, #0
	b .L08092878
	.align 2, 0
.L0809286C: .4byte gUnk_030048E0
.L08092870:
	adds r1, r1, r2
	cmp r1, r3
	ble .L08092860
	movs r0, #0
.L08092878:
	bx lr
	.align 2, 0

	thumb_func_start func_fe6_0809287C
func_fe6_0809287C: @ 0x0809287C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, .L08092898 @ =ProcScr_0868C3AC
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x2c]
	adds r0, #0x66
	movs r1, #0
	strh r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08092898: .4byte ProcScr_0868C3AC

	thumb_func_start func_fe6_0809289C
func_fe6_0809289C: @ 0x0809289C
	push {lr}
	adds r2, r0, #0
	adds r1, r2, #0
	adds r1, #0x66
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	movs r0, #0
	ldrsh r1, [r1, r0]
	ldr r0, [r2, #0x2c]
	cmp r1, r0
	bne .L080928BA
	adds r0, r2, #0
	bl Proc_Break
.L080928BA:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_fe6_080928C0
func_fe6_080928C0: @ 0x080928C0
	push {lr}
	ldr r0, .L080928D0 @ =ProcScr_0868C3AC
	bl FindProc
	cmp r0, #0
	bne .L080928D4
	movs r0, #0
	b .L080928D6
	.align 2, 0
.L080928D0: .4byte ProcScr_0868C3AC
.L080928D4:
	movs r0, #1
.L080928D6:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start func_fe6_080928DC
func_fe6_080928DC: @ 0x080928DC
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	adds r1, r2, #0
	ldr r0, .L08092904 @ =ProcScr_0868C3C4
	bl SpawnProc
	adds r4, r0, #0
	ldr r0, .L08092908 @ =ProcScr_WorldMap
	bl FindProc
	str r0, [r4, #0x4c]
	lsls r5, r5, #8
	str r5, [r4, #0x2c]
	lsls r6, r6, #8
	str r6, [r4, #0x30]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08092904: .4byte ProcScr_0868C3C4
.L08092908: .4byte ProcScr_WorldMap

	thumb_func_start func_fe6_0809290C
func_fe6_0809290C: @ 0x0809290C
	adds r2, r0, #0
	adds r2, #0x66
	movs r1, #0
	strh r1, [r2]
	adds r0, #0x68
	strh r1, [r0]
	bx lr
	.align 2, 0

	thumb_func_start func_fe6_0809291C
func_fe6_0809291C: @ 0x0809291C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0xc
	adds r7, r0, #0
	ldr r4, [r7, #0x4c]
	ldr r0, [r7, #0x2c]
	str r0, [r4, #0x3c]
	ldr r1, [r7, #0x30]
	str r1, [r4, #0x40]
	movs r2, #0x66
	adds r2, r2, r7
	mov r8, r2
	movs r3, #0
	ldrsh r5, [r2, r3]
	cmp r5, #1
	beq .L0809296A
	cmp r5, #1
	bgt .L08092948
	cmp r5, #0
	beq .L0809294E
	b .L08092960
.L08092948:
	cmp r5, #2
	beq .L080929C8
	b .L08092960
.L0809294E:
	bl func_fe6_08092A9C
	mov r1, r8
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	adds r0, r7, #0
	adds r0, #0x68
	strh r5, [r0]
.L08092960:
	adds r6, r4, #0
	adds r6, #0x4a
	adds r5, r4, #0
	adds r5, #0x48
	b .L08092A68
.L0809296A:
	movs r1, #0x80
	lsls r1, r1, #1
	movs r2, #0x80
	lsls r2, r2, #2
	adds r7, #0x68
	movs r5, #0
	ldrsh r3, [r7, r5]
	movs r0, #0x20
	str r0, [sp]
	movs r0, #5
	bl Interpolate
	adds r2, r4, #0
	adds r2, #0x4a
	strh r0, [r2]
	adds r1, r4, #0
	adds r1, #0x48
	strh r0, [r1]
	ldr r0, [r4, #0x3c]
	ldr r3, .L080929C0 @ =0xFFFF8800
	adds r0, r0, r3
	str r0, [r4, #0x34]
	ldr r0, [r4, #0x40]
	ldr r5, .L080929C4 @ =0xFFFFB000
	adds r0, r0, r5
	str r0, [r4, #0x38]
	ldrh r0, [r7]
	adds r0, #1
	strh r0, [r7]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	adds r6, r2, #0
	adds r5, r1, #0
	cmp r0, #0x21
	bne .L08092A68
	mov r1, r8
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	movs r0, #0
	strh r0, [r7]
	b .L08092A68
	.align 2, 0
.L080929C0: .4byte 0xFFFF8800
.L080929C4: .4byte 0xFFFFB000
.L080929C8:
	adds r0, r7, #0
	adds r0, #0x68
	movs r5, #1
	ldrh r2, [r0]
	ands r5, r2
	mov r8, r0
	cmp r5, #0
	beq .L08092A14
	movs r0, #1
	movs r1, #1
	bl ApplyCompressedWmPalette
	movs r1, #0
	str r1, [r4, #0x2c]
	str r1, [r4, #0x30]
	movs r0, #0xf0
	lsls r0, r0, #7
	str r0, [r4, #0x34]
	movs r0, #0xa0
	lsls r0, r0, #7
	str r0, [r4, #0x38]
	str r1, [r4, #0x44]
	adds r3, r4, #0
	adds r3, #0x48
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r3]
	adds r2, r4, #0
	adds r2, #0x4a
	strh r0, [r2]
	ldr r1, .L08092A10 @ =gDispIo
	movs r0, #0x10
	ldrb r5, [r1]
	orrs r0, r5
	b .L08092A4C
	.align 2, 0
.L08092A10: .4byte gDispIo
.L08092A14:
	movs r0, #0
	movs r1, #1
	bl ApplyCompressedWmPalette
	str r5, [r4, #0x2c]
	str r5, [r4, #0x30]
	ldr r0, [r4, #0x3c]
	ldr r1, .L08092A90 @ =0xFFFF8800
	adds r0, r0, r1
	str r0, [r4, #0x34]
	ldr r0, [r4, #0x40]
	ldr r2, .L08092A94 @ =0xFFFFB000
	adds r0, r0, r2
	str r0, [r4, #0x38]
	str r5, [r4, #0x44]
	adds r3, r4, #0
	adds r3, #0x48
	movs r0, #0x80
	lsls r0, r0, #2
	strh r0, [r3]
	adds r2, r4, #0
	adds r2, #0x4a
	strh r0, [r2]
	ldr r1, .L08092A98 @ =gDispIo
	movs r0, #0x11
	rsbs r0, r0, #0
	ldrb r5, [r1]
	ands r0, r5
.L08092A4C:
	strb r0, [r1]
	adds r6, r2, #0
	adds r5, r3, #0
	mov r1, r8
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #8
	bne .L08092A68
	adds r0, r7, #0
	bl Proc_Break
.L08092A68:
	ldr r0, [r4, #0x2c]
	ldr r1, [r4, #0x30]
	ldr r2, [r4, #0x34]
	ldr r3, [r4, #0x38]
	ldr r4, [r4, #0x44]
	str r4, [sp]
	movs r7, #0
	ldrsh r4, [r5, r7]
	str r4, [sp, #4]
	movs r5, #0
	ldrsh r4, [r6, r5]
	str r4, [sp, #8]
	bl func_fe6_08092EB0
	add sp, #0xc
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08092A90: .4byte 0xFFFF8800
.L08092A94: .4byte 0xFFFFB000
.L08092A98: .4byte gDispIo

	thumb_func_start func_fe6_08092A9C
func_fe6_08092A9C: @ 0x08092A9C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	adds r2, r0, #0
	adds r3, r1, #0
	asrs r0, r2, #8
	adds r2, r0, #0
	subs r2, #0x78
	asrs r0, r3, #8
	adds r3, r0, #0
	subs r3, #0x50
	movs r1, #0xf0
	subs r0, r1, r2
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	mov sb, r4
	asrs r0, r0, #0x10
	subs r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	str r1, [sp, #0x14]
	movs r1, #0xa0
	subs r4, r1, r3
	lsls r4, r4, #0x10
	lsrs r5, r4, #0x10
	asrs r4, r4, #0x10
	subs r1, r1, r4
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov r8, r1
	adds r0, r0, r2
	subs r0, #0xf0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sl, r0
	mov r0, r8
	str r0, [sp, #8]
	ldr r1, [sp, #0x14]
	str r1, [sp]
	adds r0, r4, r3
	subs r0, #0xa0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0xc]
	mov r2, sl
	str r2, [sp, #4]
	str r0, [sp, #0x10]
	movs r0, #1
	movs r1, #0
	bl GetCompressedWmPalette
	ldr r1, .L08092CD0 @ =0x02000000
	bl Decompress
	movs r2, #0
	cmp r2, r4
	bge .L08092B66
	ldr r4, [sp, #8]
	lsls r0, r4, #0x10
	asrs r7, r0, #0x10
	ldr r1, [sp, #0x14]
	lsls r0, r1, #0x10
	asrs r6, r0, #0x10
.L08092B20:
	lsls r0, r2, #0x10
	asrs r4, r0, #0x10
	lsls r0, r4, #4
	subs r0, r0, r4
	lsls r0, r0, #4
	ldr r2, .L08092CD4 @ =0x0600A000
	adds r3, r0, r2
	adds r1, r7, r4
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #4
	adds r0, r0, r6
	ldr r1, .L08092CD0 @ =0x02000000
	adds r1, r0, r1
	mov r2, sb
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0
	bge .L08092B48
	adds r0, #3
.L08092B48:
	lsls r2, r0, #9
	lsrs r2, r2, #0xb
	movs r0, #0x80
	lsls r0, r0, #0x13
	orrs r2, r0
	adds r0, r1, #0
	adds r1, r3, #0
	bl CpuSet
	adds r1, r4, #1
	lsls r1, r1, #0x10
	lsrs r2, r1, #0x10
	lsls r0, r5, #0x10
	cmp r1, r0
	blt .L08092B20
.L08092B66:
	movs r0, #2
	movs r1, #0
	bl GetCompressedWmPalette
	ldr r1, .L08092CD0 @ =0x02000000
	bl Decompress
	lsls r0, r5, #0x10
	movs r2, #0
	adds r5, r0, #0
	mov r4, r8
	lsls r6, r4, #0x10
	cmp r5, #0
	ble .L08092BDE
	mov r1, sb
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	ldr r4, .L08092CD4 @ =0x0600A000
	adds r4, r4, r0
	mov r8, r4
	ldr r1, [sp, #8]
	lsls r0, r1, #0x10
	asrs r7, r0, #0x10
.L08092B94:
	lsls r0, r2, #0x10
	asrs r4, r0, #0x10
	lsls r0, r4, #4
	subs r0, r0, r4
	lsls r0, r0, #4
	mov r2, r8
	adds r3, r0, r2
	adds r0, r7, r4
	lsls r1, r0, #4
	subs r1, r1, r0
	lsls r1, r1, #4
	mov r2, sl
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	adds r1, r1, r0
	ldr r0, .L08092CD0 @ =0x02000000
	adds r1, r1, r0
	ldr r2, [sp, #0x14]
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0
	bge .L08092BC2
	adds r0, #3
.L08092BC2:
	lsls r2, r0, #9
	lsrs r2, r2, #0xb
	movs r0, #0x80
	lsls r0, r0, #0x13
	orrs r2, r0
	adds r0, r1, #0
	adds r1, r3, #0
	bl CpuSet
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r0, r5
	blt .L08092B94
.L08092BDE:
	movs r0, #3
	movs r1, #0
	bl GetCompressedWmPalette
	ldr r1, .L08092CD0 @ =0x02000000
	bl Decompress
	movs r2, #0
	cmp r6, #0
	ble .L08092C4A
	ldr r4, [sp, #0xc]
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	mov r8, r0
	ldr r1, [sp]
	lsls r0, r1, #0x10
	asrs r7, r0, #0x10
.L08092C00:
	asrs r1, r5, #0x10
	lsls r0, r2, #0x10
	asrs r4, r0, #0x10
	adds r1, r1, r4
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #4
	ldr r2, .L08092CD4 @ =0x0600A000
	adds r3, r0, r2
	mov r0, r8
	adds r1, r0, r4
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #4
	adds r0, r0, r7
	ldr r1, .L08092CD0 @ =0x02000000
	adds r1, r0, r1
	mov r2, sb
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0
	bge .L08092C2E
	adds r0, #3
.L08092C2E:
	lsls r2, r0, #9
	lsrs r2, r2, #0xb
	movs r0, #0x80
	lsls r0, r0, #0x13
	orrs r2, r0
	adds r0, r1, #0
	adds r1, r3, #0
	bl CpuSet
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r0, r6
	blt .L08092C00
.L08092C4A:
	movs r0, #4
	movs r1, #0
	bl GetCompressedWmPalette
	ldr r1, .L08092CD0 @ =0x02000000
	bl Decompress
	movs r2, #0
	cmp r6, #0
	ble .L08092CBE
	mov r4, sb
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	ldr r1, .L08092CD4 @ =0x0600A000
	adds r1, r1, r0
	mov r8, r1
	ldr r4, [sp, #0x10]
	lsls r0, r4, #0x10
	asrs r7, r0, #0x10
.L08092C70:
	asrs r1, r5, #0x10
	lsls r0, r2, #0x10
	asrs r4, r0, #0x10
	adds r1, r1, r4
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #4
	mov r1, r8
	adds r3, r0, r1
	adds r0, r7, r4
	lsls r1, r0, #4
	subs r1, r1, r0
	lsls r1, r1, #4
	ldr r2, [sp, #4]
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	adds r1, r1, r0
	ldr r0, .L08092CD0 @ =0x02000000
	adds r1, r1, r0
	ldr r2, [sp, #0x14]
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0
	bge .L08092CA2
	adds r0, #3
.L08092CA2:
	lsls r2, r0, #9
	lsrs r2, r2, #0xb
	movs r0, #0x80
	lsls r0, r0, #0x13
	orrs r2, r0
	adds r0, r1, #0
	adds r1, r3, #0
	bl CpuSet
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r0, r6
	blt .L08092C70
.L08092CBE:
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08092CD0: .4byte 0x02000000
.L08092CD4: .4byte 0x0600A000

	thumb_func_start func_fe6_08092CD8
func_fe6_08092CD8: @ 0x08092CD8
	push {r4, lr}
	adds r1, r0, #0
	ldr r0, .L08092CF4 @ =ProcScr_0868C3EC
	bl SpawnProc
	adds r4, r0, #0
	ldr r0, .L08092CF8 @ =ProcScr_WorldMap
	bl FindProc
	str r0, [r4, #0x4c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08092CF4: .4byte ProcScr_0868C3EC
.L08092CF8: .4byte ProcScr_WorldMap

	thumb_func_start func_fe6_08092CFC
func_fe6_08092CFC: @ 0x08092CFC
	adds r2, r0, #0
	adds r2, #0x66
	movs r1, #0
	strh r1, [r2]
	adds r0, #0x68
	strh r1, [r0]
	bx lr
	.align 2, 0

	thumb_func_start func_fe6_08092D0C
func_fe6_08092D0C: @ 0x08092D0C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0xc
	mov r8, r0
	ldr r5, [r0, #0x4c]
	adds r0, #0x66
	movs r1, #0
	ldrsh r4, [r0, r1]
	cmp r4, #0
	beq .L08092D32
	cmp r4, #1
	beq .L08092DE8
	adds r7, r5, #0
	adds r7, #0x48
	adds r6, r5, #0
	adds r6, #0x4a
	b .L08092E36
.L08092D32:
	mov r0, r8
	adds r0, #0x68
	movs r6, #1
	ldrh r3, [r0]
	ands r6, r3
	mov sb, r0
	cmp r6, #0
	beq .L08092D7C
	movs r0, #1
	movs r1, #1
	bl ApplyCompressedWmPalette
	str r4, [r5, #0x2c]
	str r4, [r5, #0x30]
	movs r0, #0xf0
	lsls r0, r0, #7
	str r0, [r5, #0x34]
	movs r0, #0xa0
	lsls r0, r0, #7
	str r0, [r5, #0x38]
	str r4, [r5, #0x44]
	adds r3, r5, #0
	adds r3, #0x48
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r3]
	adds r2, r5, #0
	adds r2, #0x4a
	strh r0, [r2]
	ldr r1, .L08092D78 @ =gDispIo
	movs r0, #0x10
	ldrb r4, [r1]
	orrs r0, r4
	b .L08092DB4
	.align 2, 0
.L08092D78: .4byte gDispIo
.L08092D7C:
	movs r0, #0
	movs r1, #1
	bl ApplyCompressedWmPalette
	str r6, [r5, #0x2c]
	str r6, [r5, #0x30]
	ldr r0, [r5, #0x3c]
	ldr r1, .L08092DDC @ =0xFFFF8800
	adds r0, r0, r1
	str r0, [r5, #0x34]
	ldr r0, [r5, #0x40]
	ldr r3, .L08092DE0 @ =0xFFFFB000
	adds r0, r0, r3
	str r0, [r5, #0x38]
	str r6, [r5, #0x44]
	adds r3, r5, #0
	adds r3, #0x48
	movs r0, #0x80
	lsls r0, r0, #2
	strh r0, [r3]
	adds r2, r5, #0
	adds r2, #0x4a
	strh r0, [r2]
	ldr r1, .L08092DE4 @ =gDispIo
	movs r0, #0x11
	rsbs r0, r0, #0
	ldrb r4, [r1]
	ands r0, r4
.L08092DB4:
	strb r0, [r1]
	adds r7, r3, #0
	adds r6, r2, #0
	mov r1, sb
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #7
	bne .L08092E36
	mov r0, r8
	adds r0, #0x66
	ldrh r1, [r0]
	adds r1, #1
	strh r1, [r0]
	movs r0, #0
	mov r3, sb
	strh r0, [r3]
	b .L08092E36
	.align 2, 0
.L08092DDC: .4byte 0xFFFF8800
.L08092DE0: .4byte 0xFFFFB000
.L08092DE4: .4byte gDispIo
.L08092DE8:
	movs r1, #0x80
	lsls r1, r1, #2
	movs r2, #0x80
	lsls r2, r2, #1
	mov r4, r8
	adds r4, #0x68
	movs r0, #0
	ldrsh r3, [r4, r0]
	movs r0, #0x20
	str r0, [sp]
	movs r0, #5
	bl Interpolate
	adds r2, r5, #0
	adds r2, #0x4a
	strh r0, [r2]
	adds r1, r5, #0
	adds r1, #0x48
	strh r0, [r1]
	ldr r0, [r5, #0x3c]
	ldr r3, .L08092E60 @ =0xFFFF8800
	adds r0, r0, r3
	str r0, [r5, #0x34]
	ldr r0, [r5, #0x40]
	ldr r3, .L08092E64 @ =0xFFFFB000
	adds r0, r0, r3
	str r0, [r5, #0x38]
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	adds r7, r1, #0
	adds r6, r2, #0
	cmp r0, #0x21
	bne .L08092E36
	mov r0, r8
	bl Proc_Break
.L08092E36:
	ldr r0, [r5, #0x2c]
	ldr r1, [r5, #0x30]
	ldr r2, [r5, #0x34]
	ldr r3, [r5, #0x38]
	ldr r4, [r5, #0x44]
	str r4, [sp]
	movs r5, #0
	ldrsh r4, [r7, r5]
	str r4, [sp, #4]
	movs r5, #0
	ldrsh r4, [r6, r5]
	str r4, [sp, #8]
	bl func_fe6_08092EB0
	add sp, #0xc
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08092E60: .4byte 0xFFFF8800
.L08092E64: .4byte 0xFFFFB000

	thumb_func_start func_fe6_08092E68
func_fe6_08092E68: @ 0x08092E68
	push {lr}
	ldr r0, .L08092E84 @ =ProcScr_0868C3C4
	bl FindProc
	cmp r0, #0
	bne .L08092E8C
	ldr r0, .L08092E88 @ =ProcScr_0868C3EC
	bl FindProc
	cmp r0, #0
	bne .L08092E8C
	movs r0, #0
	b .L08092E8E
	.align 2, 0
.L08092E84: .4byte ProcScr_0868C3C4
.L08092E88: .4byte ProcScr_0868C3EC
.L08092E8C:
	movs r0, #1
.L08092E8E:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start func_fe6_08092E94
func_fe6_08092E94: @ 0x08092E94
	push {lr}
	ldr r0, .L08092EA8 @ =ProcScr_0868C3C4
	bl Proc_EndEach
	ldr r0, .L08092EAC @ =ProcScr_0868C3EC
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
.L08092EA8: .4byte ProcScr_0868C3C4
.L08092EAC: .4byte ProcScr_0868C3EC

	thumb_func_start func_fe6_08092EB0
func_fe6_08092EB0: @ 0x08092EB0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	mov sb, r0
	mov sl, r1
	adds r6, r2, #0
	mov r8, r3
	ldr r0, [sp, #0x28]
	ldr r1, [sp, #0x2c]
	ldr r2, [sp, #0x30]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	str r1, [sp]
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	str r2, [sp, #4]
	movs r1, #0x20
	bl Div
	adds r5, r0, #0
	movs r1, #2
	bl Div
	adds r4, r0, #0
	movs r0, #1
	ands r0, r5
	cmp r0, #0
	beq .L08092F18
	ldr r2, .L08092F10 @ =gUnk_08353328
	ldr r3, .L08092F14 @ =0x000003FF
	adds r1, r4, #0
	ands r1, r3
	lsls r1, r1, #2
	adds r1, r1, r2
	adds r0, r4, #1
	ands r0, r3
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r1, [r1]
	ldr r0, [r0]
	adds r1, r1, r0
	asrs r7, r1, #1
	adds r3, r2, #0
	b .L08092F26
	.align 2, 0
.L08092F10: .4byte gUnk_08353328
.L08092F14: .4byte 0x000003FF
.L08092F18:
	ldr r1, .L08092F50 @ =gUnk_08353328
	ldr r0, .L08092F54 @ =0x000003FF
	ands r0, r4
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r7, [r0]
	adds r3, r1, #0
.L08092F26:
	movs r0, #1
	ands r0, r5
	cmp r0, #0
	beq .L08092F5C
	movs r0, #0x80
	lsls r0, r0, #1
	adds r1, r4, r0
	ldr r2, .L08092F54 @ =0x000003FF
	ands r1, r2
	lsls r1, r1, #2
	adds r1, r1, r3
	ldr r5, .L08092F58 @ =0x00000101
	adds r0, r4, r5
	ands r0, r2
	lsls r0, r0, #2
	adds r0, r0, r3
	ldr r1, [r1]
	ldr r0, [r0]
	adds r1, r1, r0
	asrs r5, r1, #1
	b .L08092F6C
	.align 2, 0
.L08092F50: .4byte gUnk_08353328
.L08092F54: .4byte 0x000003FF
.L08092F58: .4byte 0x00000101
.L08092F5C:
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r4, r1
	ldr r1, .L08093050 @ =0x000003FF
	ands r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	ldr r5, [r0]
.L08092F6C:
	mov r0, sb
	cmp r0, #0
	bge .L08092F74
	adds r0, #0xff
.L08092F74:
	asrs r0, r0, #8
	mov sb, r0
	mov r0, sl
	cmp r0, #0
	bge .L08092F80
	adds r0, #0xff
.L08092F80:
	asrs r0, r0, #8
	mov sl, r0
	adds r0, r6, #0
	cmp r6, #0
	bge .L08092F8C
	adds r0, #0xff
.L08092F8C:
	asrs r6, r0, #8
	mov r0, r8
	cmp r0, #0
	bge .L08092F96
	adds r0, #0xff
.L08092F96:
	asrs r0, r0, #8
	mov r8, r0
	ldr r4, .L08093054 @ =gDispIo
	ldr r2, [sp]
	lsls r1, r2, #0x10
	asrs r1, r1, #0x10
	movs r0, #0x80
	lsls r0, r0, #9
	bl __divsi3
	adds r1, r0, #0
	adds r0, r1, #0
	muls r0, r5, r0
	cmp r0, #0
	bge .L08092FB6
	adds r0, #0xff
.L08092FB6:
	asrs r0, r0, #0xf
	ldr r3, .L08093058 @ =gDispIo+0x48
	strh r0, [r3]
	adds r0, r1, #0
	muls r0, r7, r0
	cmp r0, #0
	bge .L08092FC6
	adds r0, #0xff
.L08092FC6:
	asrs r0, r0, #0xf
	ldr r1, .L0809305C @ =gDispIo+0x4A
	strh r0, [r1]
	ldr r2, [sp, #4]
	lsls r1, r2, #0x10
	asrs r1, r1, #0x10
	movs r0, #0x80
	lsls r0, r0, #9
	bl __divsi3
	adds r1, r0, #0
	adds r0, r1, #0
	muls r0, r7, r0
	cmp r0, #0
	bge .L08092FE6
	adds r0, #0xff
.L08092FE6:
	asrs r0, r0, #0xf
	rsbs r0, r0, #0
	movs r3, #0x4c
	adds r3, r3, r4
	mov ip, r3
	strh r0, [r3]
	adds r0, r1, #0
	muls r0, r5, r0
	cmp r0, #0
	bge .L08092FFC
	adds r0, #0xff
.L08092FFC:
	asrs r0, r0, #0xf
	ldr r5, .L08093060 @ =gDispIo+0x4E
	strh r0, [r5]
	ldr r7, .L08093058 @ =gDispIo+0x48
	movs r1, #0
	ldrsh r0, [r7, r1]
	mov r2, sb
	subs r3, r2, r6
	adds r1, r0, #0
	muls r1, r3, r1
	ldr r5, .L0809305C @ =gDispIo+0x4A
	movs r7, #0
	ldrsh r0, [r5, r7]
	mov r5, sl
	mov r7, r8
	subs r2, r5, r7
	muls r0, r2, r0
	adds r1, r1, r0
	lsls r0, r6, #8
	adds r1, r1, r0
	str r1, [r4, #0x50]
	mov r1, ip
	movs r5, #0
	ldrsh r0, [r1, r5]
	muls r0, r3, r0
	ldr r7, .L08093060 @ =gDispIo+0x4E
	movs r3, #0
	ldrsh r1, [r7, r3]
	muls r1, r2, r1
	adds r0, r0, r1
	mov r5, r8
	lsls r1, r5, #8
	adds r0, r0, r1
	str r0, [r4, #0x54]
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08093050: .4byte 0x000003FF
.L08093054: .4byte gDispIo
.L08093058: .4byte gDispIo+0x48
.L0809305C: .4byte gDispIo+0x4A
.L08093060: .4byte gDispIo+0x4E

	thumb_func_start func_fe6_08093064
func_fe6_08093064: @ 0x08093064
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #4
	adds r4, r1, #0
	adds r5, r2, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	ldr r6, .L080930CC @ =gUnk_08353328
	movs r2, #0x80
	lsls r2, r2, #1
	adds r1, r3, r2
	ldr r2, .L080930D0 @ =0x000003FF
	ands r1, r2
	lsls r1, r1, #2
	adds r1, r1, r6
	ldr r1, [r1]
	mov r8, r1
	mov r1, r8
	muls r1, r4, r1
	lsls r1, r1, #1
	asrs r1, r1, #0x10
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	ands r3, r2
	lsls r3, r3, #2
	adds r3, r3, r6
	ldr r3, [r3]
	adds r2, r5, #0
	muls r2, r3, r2
	lsls r2, r2, #1
	asrs r2, r2, #0x10
	muls r3, r4, r3
	asrs r3, r3, #0xf
	rsbs r3, r3, #0
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	mov r4, r8
	muls r4, r5, r4
	lsls r4, r4, #1
	asrs r4, r4, #0x10
	str r4, [sp]
	bl PutSpriteAffine
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L080930CC: .4byte gUnk_08353328
.L080930D0: .4byte 0x000003FF

	thumb_func_start StartWorldMapIntroScen
StartWorldMapIntroScen: @ 0x080930D4
	push {r4, r5, lr}
	ldr r5, .L0809310C @ =ChapterAssets
	ldr r4, .L08093110 @ =gPlaySt
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl GetChapterInfo
	adds r0, #0x3b
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r0, [r0]
	cmp r0, #0
	beq .L08093106
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl GetChapterInfo
	adds r0, #0x3b
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r0, [r0]
	bl StartEvent
.L08093106:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0809310C: .4byte ChapterAssets
.L08093110: .4byte gPlaySt

	thumb_func_start func_fe6_08093114
func_fe6_08093114: @ 0x08093114
	push {lr}
	movs r0, #4
	bl FadeBgmOut
	pop {r0}
	bx r0

	thumb_func_start func_fe6_08093120
func_fe6_08093120: @ 0x08093120
	push {lr}
	movs r0, #1
	bl FadeBgmOut
	pop {r0}
	bx r0

	thumb_func_start SetWMFlag
SetWMFlag: @ 0x0809312C
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, .L0809314C @ =ProcScr_0868C648
	bl FindProc
	cmp r0, #0
	beq .L08093144
	lsls r1, r4, #2
	adds r0, #0x30
	adds r0, r0, r1
	str r5, [r0]
.L08093144:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0809314C: .4byte ProcScr_0868C648

	thumb_func_start GetWMFlag
GetWMFlag: @ 0x08093150
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, .L08093164 @ =ProcScr_0868C648
	bl FindProc
	adds r1, r0, #0
	cmp r1, #0
	bne .L08093168
	movs r0, #0
	b .L08093170
	.align 2, 0
.L08093164: .4byte ProcScr_0868C648
.L08093168:
	lsls r0, r4, #2
	adds r1, #0x30
	adds r1, r1, r0
	ldr r0, [r1]
.L08093170:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start SetWMDot
SetWMDot: @ 0x08093178
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, .L08093198 @ =ProcScr_0868C648
	bl FindProc
	cmp r0, #0
	beq .L08093190
	lsls r1, r4, #2
	adds r0, #0x40
	adds r0, r0, r1
	str r5, [r0]
.L08093190:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08093198: .4byte ProcScr_0868C648

	thumb_func_start GetWMDot
GetWMDot: @ 0x0809319C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, .L080931B0 @ =ProcScr_0868C648
	bl FindProc
	adds r1, r0, #0
	cmp r1, #0
	bne .L080931B4
	movs r0, #0
	b .L080931BC
	.align 2, 0
.L080931B0: .4byte ProcScr_0868C648
.L080931B4:
	lsls r0, r4, #2
	adds r1, #0x40
	adds r1, r1, r0
	ldr r0, [r1]
.L080931BC:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start SetWMHighlight
SetWMHighlight: @ 0x080931C4
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, .L080931E4 @ =ProcScr_0868C648
	bl FindProc
	cmp r0, #0
	beq .L080931DC
	lsls r1, r4, #2
	adds r0, #0x48
	adds r0, r0, r1
	str r5, [r0]
.L080931DC:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L080931E4: .4byte ProcScr_0868C648

	thumb_func_start GetWMHighlight
GetWMHighlight: @ 0x080931E8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, .L080931FC @ =ProcScr_0868C648
	bl FindProc
	adds r1, r0, #0
	cmp r1, #0
	bne .L08093200
	movs r0, #0
	b .L08093208
	.align 2, 0
.L080931FC: .4byte ProcScr_0868C648
.L08093200:
	lsls r0, r4, #2
	adds r1, #0x48
	adds r1, r1, r0
	ldr r0, [r1]
.L08093208:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start SetWMMapText
SetWMMapText: @ 0x08093210
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, .L08093230 @ =ProcScr_0868C648
	bl FindProc
	cmp r0, #0
	beq .L08093228
	lsls r1, r4, #2
	adds r0, #0x50
	adds r0, r0, r1
	str r5, [r0]
.L08093228:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08093230: .4byte ProcScr_0868C648

	thumb_func_start GetWMMapText
GetWMMapText: @ 0x08093234
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, .L08093248 @ =ProcScr_0868C648
	bl FindProc
	adds r1, r0, #0
	cmp r1, #0
	bne .L0809324C
	movs r0, #0
	b .L08093254
	.align 2, 0
.L08093248: .4byte ProcScr_0868C648
.L0809324C:
	lsls r0, r4, #2
	adds r1, #0x50
	adds r1, r1, r0
	ldr r0, [r1]
.L08093254:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start func_fe6_0809325C
func_fe6_0809325C: @ 0x0809325C
	ldr r1, .L08093280 @ =gUnk_0868C414
	lsls r2, r0, #1
	adds r2, r2, r0
	lsls r2, r2, #2
	adds r2, r2, r1
	ldr r0, [r2]
	ldrh r3, [r0]
	lsrs r1, r3, #1
	lsls r1, r1, #1
	adds r0, r0, r1
	ldrb r2, [r2, #8]
	lsls r1, r2, #1
	adds r1, r1, r0
	ldrh r1, [r1]
	lsrs r1, r1, #1
	lsls r1, r1, #1
	adds r0, r0, r1
	bx lr
	.align 2, 0
.L08093280: .4byte gUnk_0868C414

	thumb_func_start func_fe6_08093284
func_fe6_08093284: @ 0x08093284
	ldrh r0, [r0]
	bx lr

	thumb_func_start func_fe6_08093288
func_fe6_08093288: @ 0x08093288
	push {r4, lr}
	lsls r2, r1, #1
	adds r2, r2, r1
	lsls r2, r2, #1
	adds r2, r2, r0
	ldr r4, .L080932CC @ =0x000001FF
	ldrh r2, [r2, #4]
	ands r4, r2
	ldr r0, .L080932D0 @ =ProcScr_0868C648
	bl FindProc
	adds r1, r0, #0
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r4
	cmp r0, #0
	beq .L080932AE
	ldr r0, .L080932D4 @ =0xFFFFFE00
	orrs r4, r0
.L080932AE:
	adds r0, r1, #0
	adds r0, #0x2e
	ldrb r0, [r0]
	cmp r0, #0
	bne .L080932C2
	adds r0, r4, #0
	movs r1, #2
	bl Div
	adds r4, r0, #0
.L080932C2:
	adds r0, r4, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
.L080932CC: .4byte 0x000001FF
.L080932D0: .4byte ProcScr_0868C648
.L080932D4: .4byte 0xFFFFFE00

	thumb_func_start func_fe6_080932D8
func_fe6_080932D8: @ 0x080932D8
	push {r4, lr}
	lsls r2, r1, #1
	adds r2, r2, r1
	lsls r2, r2, #1
	adds r2, r2, r0
	ldrb r4, [r2, #2]
	ldr r0, .L08093314 @ =ProcScr_0868C648
	bl FindProc
	adds r1, r0, #0
	movs r0, #0x80
	ands r0, r4
	cmp r0, #0
	beq .L080932F8
	ldr r0, .L08093318 @ =0xFFFFFF00
	orrs r4, r0
.L080932F8:
	adds r0, r1, #0
	adds r0, #0x2e
	ldrb r0, [r0]
	cmp r0, #0
	bne .L0809330C
	adds r0, r4, #0
	movs r1, #2
	bl Div
	adds r4, r0, #0
.L0809330C:
	adds r0, r4, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
.L08093314: .4byte ProcScr_0868C648
.L08093318: .4byte 0xFFFFFF00

	thumb_func_start func_fe6_0809331C
func_fe6_0809331C: @ 0x0809331C
	push {r4, r5, r6, lr}
	adds r3, r0, #0
	movs r1, #0
	movs r0, #0
	strh r0, [r3, #0x2a]
	strh r0, [r3, #0x2c]
	adds r0, r3, #0
	adds r0, #0x2e
	strb r1, [r0]
	ldr r6, .L08093388 @ =ProcScr_0868C658
	movs r4, #0
	movs r2, #3
	adds r1, r3, #0
	adds r1, #0x3c
.L08093338:
	str r4, [r1]
	subs r1, #4
	subs r2, #1
	cmp r2, #0
	bge .L08093338
	adds r4, r3, #0
	adds r4, #0x50
	adds r5, r3, #0
	adds r5, #0x48
	adds r2, r3, #0
	adds r2, #0x40
	movs r0, #0
	adds r1, r3, #0
	adds r1, #0x44
.L08093354:
	str r0, [r1]
	subs r1, #4
	cmp r1, r2
	bge .L08093354
	adds r2, r4, #0
	movs r0, #0
	adds r1, r2, #4
.L08093362:
	str r0, [r1]
	subs r1, #4
	cmp r1, r2
	bge .L08093362
	adds r2, r5, #0
	movs r0, #0
	adds r1, r2, #4
.L08093370:
	str r0, [r1]
	subs r1, #4
	cmp r1, r2
	bge .L08093370
	adds r0, r6, #0
	adds r1, r3, #0
	bl SpawnProc
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08093388: .4byte ProcScr_0868C658

	thumb_func_start func_fe6_0809338C
func_fe6_0809338C: @ 0x0809338C
	adds r0, #0x64
	movs r1, #0
	strh r1, [r0]
	bx lr

	thumb_func_start func_fe6_08093394
func_fe6_08093394: @ 0x08093394
	push {r4, lr}
	sub sp, #0x38
	adds r4, r0, #0
	ldr r1, .L080933EC @ =gUnk_08354728
	mov r0, sp
	movs r2, #0x37
	bl memcpy
	adds r4, #0x64
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	movs r1, #0
	ldrsh r0, [r4, r1]
	add r0, sp
	ldrb r0, [r0]
	cmp r0, #0xff
	bne .L080933BC
	movs r0, #0
	strh r0, [r4]
.L080933BC:
	movs r1, #0
	ldrsh r0, [r4, r1]
	add r0, sp
	ldrb r0, [r0]
	lsls r4, r0, #5
	ldr r0, .L080933F0 @ =gUnk_082D37E4
	adds r0, r4, r0
	movs r1, #0x80
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, .L080933F4 @ =gUnk_082D3764
	adds r4, r4, r0
	movs r1, #0x88
	lsls r1, r1, #2
	adds r0, r4, #0
	movs r2, #0x20
	bl ApplyPaletteExt
	add sp, #0x38
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L080933EC: .4byte gUnk_08354728
.L080933F0: .4byte gUnk_082D37E4
.L080933F4: .4byte gUnk_082D3764

	thumb_func_start func_fe6_080933F8
func_fe6_080933F8: @ 0x080933F8
	push {lr}
	ldr r0, .L08093430 @ =gUnk_082D33B8
	ldr r1, .L08093434 @ =0x06016200
	bl Decompress
	ldr r0, .L08093438 @ =gUnk_082D36E4
	movs r1, #0x80
	lsls r1, r1, #2
	movs r2, #0x80
	bl ApplyPaletteExt
	ldr r0, .L0809343C @ =gUnk_082D3864
	movs r1, #0xa0
	lsls r1, r1, #2
	movs r2, #0x40
	bl ApplyPaletteExt
	bl func_fe6_08092838
	ldr r0, .L08093440 @ =ProcScr_0868C648
	movs r1, #3
	bl SpawnProc
	bl func_fe6_080934A0
	pop {r0}
	bx r0
	.align 2, 0
.L08093430: .4byte gUnk_082D33B8
.L08093434: .4byte 0x06016200
.L08093438: .4byte gUnk_082D36E4
.L0809343C: .4byte gUnk_082D3864
.L08093440: .4byte ProcScr_0868C648

	thumb_func_start func_fe6_08093444
func_fe6_08093444: @ 0x08093444
	push {lr}
	ldr r0, .L08093458 @ =ProcScr_0868C648
	bl FindProc
	cmp r0, #0
	beq .L08093452
	movs r0, #1
.L08093452:
	pop {r1}
	bx r1
	.align 2, 0
.L08093458: .4byte ProcScr_0868C648

	thumb_func_start func_fe6_0809345C
func_fe6_0809345C: @ 0x0809345C
	push {lr}
	movs r0, #8
	bl Proc_EndEachMarked
	bl EndEachSpriteAnimProc
	bl EndPutTalkSpriteText
	ldr r0, .L08093478 @ =ProcScr_0868C648
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
.L08093478: .4byte ProcScr_0868C648

	thumb_func_start func_fe6_0809347C
func_fe6_0809347C: @ 0x0809347C
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, .L0809349C @ =ProcScr_0868C648
	bl FindProc
	subs r4, #0x78
	strh r4, [r0, #0x2a]
	subs r5, #0x50
	strh r5, [r0, #0x2c]
	adds r0, #0x2e
	movs r1, #1
	strb r1, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0809349C: .4byte ProcScr_0868C648

	thumb_func_start func_fe6_080934A0
func_fe6_080934A0: @ 0x080934A0
	push {lr}
	ldr r0, .L080934B8 @ =ProcScr_0868C648
	bl FindProc
	movs r2, #0
	movs r1, #0
	strh r1, [r0, #0x2a]
	strh r1, [r0, #0x2c]
	adds r0, #0x2e
	strb r2, [r0]
	pop {r0}
	bx r0
	.align 2, 0
.L080934B8: .4byte ProcScr_0868C648

	thumb_func_start func_fe6_080934BC
func_fe6_080934BC: @ 0x080934BC
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r5, r0, #0
	adds r6, r1, #0
	ldr r0, .L08093510 @ =ProcScr_0868C648
	bl FindProc
	lsls r1, r5, #1
	adds r1, r1, r5
	lsls r1, r1, #2
	ldr r2, .L08093514 @ =gUnk_0868C414
	adds r2, r1, r2
	movs r3, #4
	ldrsh r1, [r2, r3]
	ldrh r7, [r0, #0x2a]
	subs r4, r1, r7
	movs r3, #6
	ldrsh r1, [r2, r3]
	ldrh r7, [r0, #0x2c]
	subs r3, r1, r7
	adds r0, #0x2e
	ldrb r0, [r0]
	cmp r0, #0
	bne .L080934F4
	asrs r4, r4, #1
	asrs r3, r3, #1
	subs r4, #2
	subs r3, #2
.L080934F4:
	ldrh r0, [r2, #0xa]
	str r0, [sp]
	ldrb r2, [r2, #9]
	lsls r0, r2, #8
	str r0, [sp, #4]
	adds r0, r5, #0
	adds r1, r6, #0
	adds r2, r4, #0
	bl func_fe6_080923C8
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08093510: .4byte ProcScr_0868C648
.L08093514: .4byte gUnk_0868C414

	thumb_func_start func_fe6_08093518
func_fe6_08093518: @ 0x08093518
	push {lr}
	ldr r0, .L08093554 @ =gUnk_082D33B8
	ldr r1, .L08093558 @ =0x06016200
	bl Decompress
	ldr r0, .L0809355C @ =gUnk_082D36E4
	movs r1, #0x80
	lsls r1, r1, #2
	movs r2, #0x80
	bl ApplyPaletteExt
	ldr r0, .L08093560 @ =Pal_SystemObjects
	movs r1, #0xd8
	lsls r1, r1, #2
	movs r2, #0x40
	bl ApplyPaletteExt
	ldr r0, .L08093564 @ =Img_WmDialogueBox
	ldr r1, .L08093568 @ =0x06016800
	bl Decompress
	ldr r0, .L0809356C @ =Pal_WmDialogueBox
	movs r1, #0xc8
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	pop {r0}
	bx r0
	.align 2, 0
.L08093554: .4byte gUnk_082D33B8
.L08093558: .4byte 0x06016200
.L0809355C: .4byte gUnk_082D36E4
.L08093560: .4byte Pal_SystemObjects
.L08093564: .4byte Img_WmDialogueBox
.L08093568: .4byte 0x06016800
.L0809356C: .4byte Pal_WmDialogueBox

	thumb_func_start StartWMIntroRotation
StartWMIntroRotation: @ 0x08093570
	push {lr}
	adds r1, r0, #0
	ldr r0, .L08093580 @ =ProcScr_0868C668
	bl SpawnProcLocking
	pop {r0}
	bx r0
	.align 2, 0
.L08093580: .4byte ProcScr_0868C668

	thumb_func_start func_fe6_08093584
func_fe6_08093584: @ 0x08093584
	adds r3, r0, #0
	adds r1, r3, #0
	adds r1, #0x44
	movs r2, #0
	movs r0, #0x80
	lsls r0, r0, #2
	strh r0, [r1]
	adds r1, #4
	movs r0, #0x80
	strh r0, [r1]
	adds r0, r3, #0
	adds r0, #0x64
	strh r2, [r0]
	bx lr

	thumb_func_start func_fe6_080935A0
func_fe6_080935A0: @ 0x080935A0
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r7, r0, #0
	movs r1, #0x80
	lsls r1, r1, #8
	adds r4, r7, #0
	adds r4, #0x64
	movs r0, #0
	ldrsh r3, [r4, r0]
	movs r5, #0x23
	str r5, [sp]
	movs r0, #5
	movs r2, #0
	bl Interpolate
	adds r6, r0, #0
	movs r1, #0x80
	lsls r1, r1, #3
	movs r2, #0x80
	lsls r2, r2, #1
	ldrh r3, [r4]
	adds r0, r3, #1
	strh r0, [r4]
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	str r5, [sp]
	movs r0, #5
	bl Interpolate
	movs r2, #0xf0
	lsls r2, r2, #7
	movs r3, #0xa0
	lsls r3, r3, #7
	str r6, [sp]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #0
	movs r1, #0
	bl func_fe6_08092EB0
	ldrh r4, [r4]
	cmp r4, #0x28
	bne .L08093600
	adds r0, r7, #0
	bl Proc_Break
.L08093600:
	add sp, #0xc
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start func_fe6_08093608
func_fe6_08093608: @ 0x08093608
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	mov sb, r0
	movs r0, #0x64
	add sb, r0
	movs r0, #0
	mov r1, sb
	strh r0, [r1]
	bl InitScanlineEffect
	bl func_fe6_08069C74
	ldr r2, .L080936E0 @ =gDispIo+0x3C
	mov ip, r2
	ldr r0, .L080936E4 @ =0x0000FFE0
	ldrh r3, [r2]
	ands r0, r3
	movs r1, #0x1f
	orrs r0, r1
	strh r0, [r2]
	subs r2, #0x3c
	movs r4, #0x20
	mov r6, ip
	ldrb r0, [r6]
	orrs r0, r4
	strb r0, [r6]
	ldrb r0, [r2, #1]
	orrs r0, r4
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r2, #1]
	movs r0, #8
	rsbs r0, r0, #0
	add r0, ip
	mov sl, r0
	ldrb r0, [r0]
	orrs r0, r4
	mov r1, sl
	strb r0, [r1]
	mov r7, ip
	subs r7, #6
	movs r2, #0x21
	rsbs r2, r2, #0
	adds r0, r2, #0
	ldrb r3, [r7]
	ands r0, r3
	strb r0, [r7]
	movs r1, #1
	mov r6, sl
	ldrb r0, [r6]
	orrs r0, r1
	movs r3, #2
	mov r8, r3
	mov r6, r8
	orrs r0, r6
	movs r3, #4
	orrs r0, r3
	movs r5, #8
	orrs r0, r5
	movs r3, #0x10
	orrs r0, r3
	mov r6, sl
	strb r0, [r6]
	ldrb r0, [r7]
	orrs r1, r0
	mov r6, r8
	orrs r1, r6
	movs r0, #4
	orrs r1, r0
	orrs r1, r5
	orrs r1, r3
	strb r1, [r7]
	mov r1, sl
	ldrb r1, [r1]
	orrs r4, r1
	mov r3, sl
	strb r4, [r3]
	ldrb r6, [r7]
	ands r2, r6
	strb r2, [r7]
	movs r0, #0x3f
	mov r1, ip
	ldrb r1, [r1]
	ands r0, r1
	movs r1, #0x80
	orrs r0, r1
	mov r2, ip
	strb r0, [r2]
	movs r3, #0
	strb r3, [r2, #8]
	strb r3, [r2, #9]
	mov r6, sb
	ldrh r0, [r6]
	strb r0, [r2, #0xa]
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L080936E0: .4byte gDispIo+0x3C
.L080936E4: .4byte 0x0000FFE0

	thumb_func_start func_fe6_080936E8
func_fe6_080936E8: @ 0x080936E8
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	adds r4, r6, #0
	adds r4, #0x64
	movs r0, #0
	ldrsh r3, [r4, r0]
	movs r0, #0x2d
	str r0, [sp]
	movs r0, #5
	movs r1, #1
	movs r2, #0xc8
	bl Interpolate
	adds r2, r0, #0
	movs r0, #0x78
	movs r1, #0x50
	bl func_fe6_08069DA4
	ldr r5, .L08093760 @ =gDispIo
	adds r2, r5, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x80
	orrs r0, r1
	strb r0, [r2]
	adds r0, r5, #0
	adds r0, #0x44
	movs r1, #0
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	movs r0, #0
	ldrsh r3, [r4, r0]
	movs r0, #0x28
	str r0, [sp]
	movs r0, #0
	movs r1, #0x10
	movs r2, #0
	bl Interpolate
	adds r1, r5, #0
	adds r1, #0x46
	strb r0, [r1]
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x28
	bne .L08093758
	adds r0, r6, #0
	bl Proc_Break
.L08093758:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08093760: .4byte gDispIo

	thumb_func_start func_fe6_08093764
func_fe6_08093764: @ 0x08093764
	push {r4, lr}
	ldr r4, .L080937A8 @ =gDispIo
	adds r1, r4, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r2, [r1]
	ands r0, r2
	strb r0, [r1]
	adds r1, #8
	movs r2, #0
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x45
	strb r2, [r0]
	adds r0, #1
	strb r2, [r0]
	movs r0, #0
	bl SetOnHBlankA
	movs r0, #0x21
	rsbs r0, r0, #0
	ldrb r1, [r4, #1]
	ands r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r4, #1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L080937A8: .4byte gDispIo

	thumb_func_start StartWMHighlight
StartWMHighlight: @ 0x080937AC
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r0, .L080937D0 @ =gUnk_0868C704
	movs r1, #3
	bl SpawnProc
	adds r1, r0, #0
	adds r0, #0x64
	strh r5, [r0]
	adds r0, #2
	strh r4, [r0]
	adds r0, r4, #0
	bl SetWMHighlight
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L080937D0: .4byte gUnk_0868C704

	thumb_func_start func_fe6_080937D4
func_fe6_080937D4: @ 0x080937D4
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r7, .L0809389C @ =gUnk_0868C6B0
	adds r4, r5, #0
	adds r4, #0x64
	movs r1, #0
	ldrsh r0, [r4, r1]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r7
	ldr r2, [r1]
	adds r6, r5, #0
	adds r6, #0x66
	movs r1, #0
	ldrsh r0, [r6, r1]
	ldr r1, .L080938A0 @ =0x06015100
	cmp r0, #0
	bne .L080937FC
	ldr r1, .L080938A4 @ =0x06014000
.L080937FC:
	adds r0, r2, #0
	bl Decompress
	ldr r0, .L080938A8 @ =gUnk_082D3398
	movs r1, #0xd0
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	movs r2, #0
	ldrsh r1, [r4, r2]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r1, r7, #4
	adds r0, r0, r1
	ldr r0, [r0]
	movs r1, #0xd
	bl StartSpriteAnim
	adds r1, r0, #0
	str r1, [r5, #0x50]
	movs r4, #0
	ldrsh r0, [r6, r4]
	ldr r2, .L080938AC @ =0x0000A288
	adds r4, r2, #0
	cmp r0, #0
	bne .L0809383A
	movs r0, #0xa2
	lsls r0, r0, #8
	adds r4, r0, #0
.L0809383A:
	movs r2, #0
	movs r3, #0
	strh r4, [r1, #0x22]
	ldr r1, .L080938B0 @ =gDispIo
	mov ip, r1
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r4, [r1]
	ands r0, r4
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x44
	strb r2, [r0]
	mov r1, ip
	adds r1, #0x45
	movs r0, #0x10
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x46
	strb r2, [r0]
	ldr r0, .L080938B4 @ =0x0000FFE0
	mov r1, ip
	ldrh r1, [r1, #0x3c]
	ands r0, r1
	movs r1, #0x10
	orrs r0, r1
	ldr r1, .L080938B8 @ =0x0000E0FF
	ands r0, r1
	movs r2, #0x80
	lsls r2, r2, #3
	adds r1, r2, #0
	orrs r0, r1
	mov r4, ip
	strh r0, [r4, #0x3c]
	mov r1, ip
	adds r1, #0x3d
	movs r0, #0x20
	ldrb r2, [r1]
	orrs r0, r2
	strb r0, [r1]
	str r3, [r5, #0x54]
	adds r1, r5, #0
	adds r1, #0x44
	movs r0, #0xc0
	strh r0, [r1]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0809389C: .4byte gUnk_0868C6B0
.L080938A0: .4byte 0x06015100
.L080938A4: .4byte 0x06014000
.L080938A8: .4byte gUnk_082D3398
.L080938AC: .4byte 0x0000A288
.L080938B0: .4byte gDispIo
.L080938B4: .4byte 0x0000FFE0
.L080938B8: .4byte 0x0000E0FF

	thumb_func_start func_fe6_080938BC
func_fe6_080938BC: @ 0x080938BC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	ldr r0, [r5, #0x50]
	ldr r2, .L08093954 @ =gUnk_0868C6B0
	adds r1, r5, #0
	adds r1, #0x64
	movs r3, #0
	ldrsh r1, [r1, r3]
	lsls r3, r1, #1
	adds r3, r3, r1
	lsls r3, r3, #2
	adds r3, r3, r2
	ldrb r1, [r3, #8]
	movs r2, #0x80
	lsls r2, r2, #3
	ldrb r3, [r3, #9]
	orrs r2, r3
	bl DisplaySpriteAnim
	ldr r1, .L08093958 @ =gSinLut
	adds r2, r5, #0
	adds r2, #0x44
	ldrb r7, [r2]
	lsls r0, r7, #1
	adds r0, r0, r1
	movs r3, #0
	ldrsh r1, [r0, r3]
	lsls r0, r1, #1
	adds r0, r0, r1
	asrs r0, r0, #0xb
	adds r3, r0, #0
	adds r3, #8
	ldrh r0, [r2]
	adds r0, #3
	movs r6, #0
	strh r0, [r2]
	ldr r1, .L0809395C @ =gDispIo
	adds r4, r1, #0
	adds r4, #0x3c
	movs r2, #0x3f
	ldrb r7, [r4]
	ands r2, r7
	strb r2, [r4]
	movs r0, #0x44
	adds r0, r0, r1
	mov r8, r0
	strb r3, [r0]
	movs r0, #0x10
	subs r0, r0, r3
	movs r7, #0x45
	adds r7, r7, r1
	strb r0, [r7]
	adds r1, #0x46
	strb r6, [r1]
	ldr r0, [r5, #0x54]
	cmp r0, #0
	beq .L08093948
	cmp r3, #2
	bne .L08093948
	strb r2, [r4]
	mov r0, r8
	strb r6, [r0]
	movs r0, #0x10
	strb r0, [r7]
	strb r6, [r1]
	adds r0, r5, #0
	bl Proc_End
.L08093948:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08093954: .4byte gUnk_0868C6B0
.L08093958: .4byte gSinLut
.L0809395C: .4byte gDispIo

	thumb_func_start func_fe6_08093960
func_fe6_08093960: @ 0x08093960
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x50]
	bl EndSpriteAnim
	adds r4, #0x66
	movs r1, #0
	ldrsh r0, [r4, r1]
	movs r1, #0
	bl SetWMHighlight
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start func_fe6_0809397C
func_fe6_0809397C: @ 0x0809397C
	push {lr}
	bl GetWMHighlight
	cmp r0, #0
	beq .L0809398A
	bl Proc_End
.L0809398A:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_fe6_08093990
func_fe6_08093990: @ 0x08093990
	push {r4, lr}
	movs r4, #0
.L08093994:
	adds r0, r4, #0
	bl func_fe6_0809397C
	adds r4, #1
	cmp r4, #1
	ble .L08093994
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_fe6_080939A8
func_fe6_080939A8: @ 0x080939A8
	push {lr}
	bl GetWMHighlight
	adds r1, r0, #0
	cmp r1, #0
	beq .L080939B8
	movs r0, #1
	str r0, [r1, #0x54]
.L080939B8:
	pop {r0}
	bx r0

	thumb_func_start WMHighlightExists
WMHighlightExists: @ 0x080939BC
	push {lr}
	bl GetWMHighlight
	cmp r0, #0
	bne .L080939CA
	movs r0, #0
	b .L080939CC
.L080939CA:
	movs r0, #1
.L080939CC:
	pop {r1}
	bx r1

	thumb_func_start func_fe6_080939D0
func_fe6_080939D0: @ 0x080939D0
	push {lr}
	movs r0, #0
	bl GetWMHighlight
	cmp r0, #0
	bne .L080939EA
	movs r0, #1
	bl GetWMHighlight
	cmp r0, #0
	bne .L080939EA
	movs r0, #0
	b .L080939EC
.L080939EA:
	movs r0, #1
.L080939EC:
	pop {r1}
	bx r1

	thumb_func_start func_fe6_080939F0
func_fe6_080939F0: @ 0x080939F0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0xc
	adds r4, r0, #0
	adds r5, r1, #0
	mov r8, r2
	adds r7, r3, #0
	adds r0, r7, #0
	bl GetWMDot
	adds r6, r0, #0
	lsls r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r4, r4, #0x10
	orrs r4, r5
	str r4, [sp, #8]
	add r4, sp, #8
	adds r0, r4, #0
	bl func_fe6_08093FD8
	cmp r6, #0
	beq .L08093A34
	add r0, sp, #8
	movs r2, #0
	ldrsh r1, [r0, r2]
	movs r3, #2
	ldrsh r2, [r4, r3]
	movs r3, #0xc4
	lsls r3, r3, #2
	adds r0, r6, #0
	bl SetSpriteAnimProcParameters
	b .L08093A62
.L08093A34:
	ldr r0, .L08093A70 @ =gUnk_082D3674
	add r1, sp, #8
	movs r2, #0
	ldrsh r1, [r1, r2]
	movs r3, #2
	ldrsh r2, [r4, r3]
	movs r3, #0xf
	mov r4, r8
	ands r3, r4
	lsls r3, r3, #0xc
	movs r4, #0xc4
	lsls r4, r4, #2
	orrs r3, r4
	movs r4, #1
	str r4, [sp]
	movs r4, #0xa
	str r4, [sp, #4]
	bl StartSpriteAnimProc
	adds r1, r0, #0
	adds r0, r7, #0
	bl SetWMDot
.L08093A62:
	add sp, #0xc
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08093A70: .4byte gUnk_082D3674

	thumb_func_start EndWMDot
EndWMDot: @ 0x08093A74
	push {r4, lr}
	adds r4, r0, #0
	bl GetWMDot
	cmp r0, #0
	beq .L08093A84
	bl EndSpriteAnimProc
.L08093A84:
	adds r0, r4, #0
	movs r1, #0
	bl SetWMDot
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start StartWMFlag
StartWMFlag: @ 0x08093A94
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0xc
	adds r4, r0, #0
	adds r5, r1, #0
	adds r7, r2, #0
	mov r8, r3
	mov r0, r8
	bl GetWMFlag
	adds r6, r0, #0
	lsls r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r4, r4, #0x10
	orrs r4, r5
	str r4, [sp, #8]
	add r4, sp, #8
	adds r0, r4, #0
	bl func_fe6_08093FD8
	cmp r6, #0
	beq .L08093AE0
	add r0, sp, #8
	movs r2, #0
	ldrsh r1, [r0, r2]
	movs r3, #2
	ldrsh r2, [r4, r3]
	movs r3, #0xf
	ands r3, r7
	lsls r3, r3, #0xc
	movs r0, #0xc4
	lsls r0, r0, #2
	orrs r3, r0
	adds r0, r6, #0
	bl SetSpriteAnimProcParameters
	b .L08093B0A
.L08093AE0:
	ldr r0, .L08093B18 @ =gUnk_082D3674
	add r1, sp, #8
	movs r2, #0
	ldrsh r1, [r1, r2]
	movs r3, #2
	ldrsh r2, [r4, r3]
	movs r3, #0xf
	ands r3, r7
	lsls r3, r3, #0xc
	movs r4, #0xc4
	lsls r4, r4, #2
	orrs r3, r4
	str r6, [sp]
	movs r4, #7
	str r4, [sp, #4]
	bl StartSpriteAnimProc
	adds r1, r0, #0
	mov r0, r8
	bl SetWMFlag
.L08093B0A:
	add sp, #0xc
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08093B18: .4byte gUnk_082D3674

	thumb_func_start EndWMFlag
EndWMFlag: @ 0x08093B1C
	push {r4, lr}
	adds r4, r0, #0
	bl GetWMFlag
	cmp r0, #0
	beq .L08093B2C
	bl EndSpriteAnimProc
.L08093B2C:
	adds r0, r4, #0
	movs r1, #0
	bl SetWMFlag
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start StartWMMapText
StartWMMapText: @ 0x08093B3C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r6, r2, #0
	mov r8, r3
	ldr r7, [sp, #0x1c]
	ldr r5, [sp, #0x20]
	lsls r0, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r0, r0, #0x10
	orrs r0, r1
	str r0, [sp]
	mov r4, sp
	mov r0, sp
	bl func_fe6_08093FD8
	ldr r0, .L08093B9C @ =gUnk_0868C8D8
	movs r1, #3
	bl SpawnProc
	adds r1, r0, #0
	mov r0, sp
	movs r2, #0
	ldrsh r0, [r0, r2]
	str r0, [r1, #0x2c]
	movs r2, #2
	ldrsh r0, [r4, r2]
	str r0, [r1, #0x30]
	adds r0, r1, #0
	adds r0, #0x64
	strh r6, [r0]
	adds r0, #2
	mov r2, r8
	strh r2, [r0]
	adds r0, #2
	strh r7, [r0]
	adds r0, #2
	strh r5, [r0]
	adds r0, r5, #0
	bl SetWMMapText
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08093B9C: .4byte gUnk_0868C8D8

	thumb_func_start func_fe6_08093BA0
func_fe6_08093BA0: @ 0x08093BA0
	push {lr}
	bl GetWMMapText
	cmp r0, #0
	beq .L08093BAE
	bl Proc_End
.L08093BAE:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_fe6_08093BB4
func_fe6_08093BB4: @ 0x08093BB4
	push {lr}
	bl GetWMMapText
	adds r1, r0, #0
	cmp r1, #0
	beq .L08093BC4
	movs r0, #1
	str r0, [r1, #0x54]
.L08093BC4:
	pop {r0}
	bx r0

	thumb_func_start func_fe6_08093BC8
func_fe6_08093BC8: @ 0x08093BC8
	push {r4, r5, lr}
	adds r5, r1, #0
	ldr r4, .L08093C14 @ =gBuf
	adds r1, r4, #0
	bl Decompress
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #8
	movs r3, #4
	bl func_fe6_08015298
	movs r1, #0x80
	lsls r1, r1, #3
	adds r0, r4, r1
	movs r2, #0x80
	lsls r2, r2, #1
	adds r1, r5, r2
	movs r2, #4
	movs r3, #4
	bl func_fe6_08015298
	movs r0, #0xc0
	lsls r0, r0, #3
	adds r4, r4, r0
	movs r1, #0xc0
	lsls r1, r1, #1
	adds r5, r5, r1
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #1
	movs r3, #4
	bl func_fe6_08015298
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08093C14: .4byte gBuf

	thumb_func_start func_fe6_08093C18
func_fe6_08093C18: @ 0x08093C18
	adds r2, r0, #0
	adds r2, #0x44
	movs r1, #0
	strh r1, [r2]
	str r1, [r0, #0x54]
	bx lr

	thumb_func_start func_fe6_08093C24
func_fe6_08093C24: @ 0x08093C24
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r0, .L08093C58 @ =gUnk_082D38A4
	movs r1, #0xb
	bl StartSpriteAnim
	str r0, [r4, #0x50]
	adds r2, r0, #0
	adds r0, r4, #0
	adds r0, #0x6a
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r1, #0xa2
	lsls r1, r1, #2
	cmp r0, #0
	bne .L08093C46
	subs r1, #0x88
.L08093C46:
	adds r0, r4, #0
	adds r0, #0x68
	movs r3, #0
	ldrsh r0, [r0, r3]
	cmp r0, #0
	bne .L08093C5C
	movs r0, #0xa0
	lsls r0, r0, #7
	b .L08093C60
	.align 2, 0
.L08093C58: .4byte gUnk_082D38A4
.L08093C5C:
	movs r0, #0x80
	lsls r0, r0, #7
.L08093C60:
	orrs r0, r1
	strh r0, [r2, #0x22]
	ldr r2, .L08093C8C @ =gUnk_0868C734
	adds r3, r4, #0
	adds r3, #0x64
	movs r0, #0
	ldrsh r1, [r3, r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r2, #8
	adds r0, r0, r2
	ldr r1, [r0]
	ldr r0, .L08093C90 @ =gUnk_082D5910
	adds r5, r3, #0
	cmp r1, r0
	bne .L08093C94
	ldr r0, [r4, #0x50]
	movs r1, #1
	bl SetSpriteAnimId
	b .L08093C9C
	.align 2, 0
.L08093C8C: .4byte gUnk_0868C734
.L08093C90: .4byte gUnk_082D5910
.L08093C94:
	ldr r0, [r4, #0x50]
	movs r1, #2
	bl SetSpriteAnimId
.L08093C9C:
	ldr r6, .L08093D34 @ =gUnk_0868C734
	movs r2, #0
	ldrsh r1, [r5, r2]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r1, r6, #4
	adds r0, r0, r1
	ldr r2, [r0]
	adds r4, #0x6a
	movs r3, #0
	ldrsh r0, [r4, r3]
	ldr r1, .L08093D38 @ =0x06015100
	cmp r0, #0
	bne .L08093CBC
	ldr r1, .L08093D3C @ =0x06014000
.L08093CBC:
	adds r0, r2, #0
	bl func_fe6_08093BC8
	movs r0, #0
	ldrsh r1, [r5, r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r1, r6, #0
	adds r1, #8
	adds r0, r0, r1
	ldr r3, [r0]
	movs r1, #0
	ldrsh r0, [r4, r1]
	ldr r1, .L08093D40 @ =0x06015300
	cmp r0, #0
	bne .L08093CE0
	ldr r1, .L08093D44 @ =0x06014200
.L08093CE0:
	adds r0, r3, #0
	bl func_fe6_08093BC8
	ldr r2, .L08093D48 @ =gDispIo
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
	adds r3, r2, #0
	adds r3, #0x45
	movs r0, #0x10
	strb r0, [r3]
	adds r0, r2, #0
	adds r0, #0x46
	strb r1, [r0]
	ldr r0, .L08093D4C @ =0x0000FFE0
	ldrh r1, [r2, #0x3c]
	ands r0, r1
	movs r1, #0x10
	orrs r0, r1
	ldr r1, .L08093D50 @ =0x0000E0FF
	ands r0, r1
	movs r3, #0x80
	lsls r3, r3, #3
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2, #0x3c]
	adds r1, r2, #0
	adds r1, #0x3d
	movs r0, #0x20
	ldrb r2, [r1]
	orrs r0, r2
	strb r0, [r1]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08093D34: .4byte gUnk_0868C734
.L08093D38: .4byte 0x06015100
.L08093D3C: .4byte 0x06014000
.L08093D40: .4byte 0x06015300
.L08093D44: .4byte 0x06014200
.L08093D48: .4byte gDispIo
.L08093D4C: .4byte 0x0000FFE0
.L08093D50: .4byte 0x0000E0FF

	thumb_func_start func_fe6_08093D54
func_fe6_08093D54: @ 0x08093D54
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r5, r0, #0
	ldr r0, [r5, #0x50]
	ldr r1, [r5, #0x2c]
	ldr r2, [r5, #0x30]
	movs r3, #0x80
	lsls r3, r3, #3
	orrs r2, r3
	adds r3, r5, #0
	adds r3, #0x64
	movs r4, #0
	ldrsh r3, [r3, r4]
	adds r4, r5, #0
	adds r4, #0x66
	movs r6, #0
	ldrsh r4, [r4, r6]
	str r4, [sp]
	adds r4, r5, #0
	adds r4, #0x68
	movs r6, #0
	ldrsh r4, [r4, r6]
	str r4, [sp, #4]
	bl func_fe6_08093EAC
	adds r0, r5, #0
	adds r0, #0x44
	ldrh r1, [r0]
	adds r1, #1
	movs r3, #0
	strh r1, [r0]
	ldr r4, .L08093DD0 @ =gDispIo
	adds r2, r4, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r6, [r2]
	ands r0, r6
	strb r0, [r2]
	adds r2, r1, #0
	adds r0, r4, #0
	adds r0, #0x44
	strb r2, [r0]
	movs r0, #0x10
	subs r0, r0, r2
	adds r2, r4, #0
	adds r2, #0x45
	strb r0, [r2]
	adds r0, r4, #0
	adds r0, #0x46
	strb r3, [r0]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	cmp r1, #0xf
	ble .L08093DC6
	adds r0, r5, #0
	bl Proc_Break
.L08093DC6:
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08093DD0: .4byte gDispIo

	thumb_func_start func_fe6_08093DD4
func_fe6_08093DD4: @ 0x08093DD4
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r5, r0, #0
	ldr r0, [r5, #0x50]
	ldr r1, [r5, #0x2c]
	ldr r2, [r5, #0x30]
	adds r3, r5, #0
	adds r3, #0x64
	movs r4, #0
	ldrsh r3, [r3, r4]
	adds r4, r5, #0
	adds r4, #0x66
	movs r6, #0
	ldrsh r4, [r4, r6]
	str r4, [sp]
	adds r4, r5, #0
	adds r4, #0x68
	movs r6, #0
	ldrsh r4, [r4, r6]
	str r4, [sp, #4]
	bl func_fe6_08093EAC
	ldr r0, [r5, #0x54]
	cmp r0, #0
	beq .L08093E0C
	adds r0, r5, #0
	bl Proc_Break
.L08093E0C:
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start func_fe6_08093E14
func_fe6_08093E14: @ 0x08093E14
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r5, r0, #0
	ldr r0, [r5, #0x50]
	ldr r1, [r5, #0x2c]
	ldr r2, [r5, #0x30]
	movs r3, #0x80
	lsls r3, r3, #3
	orrs r2, r3
	adds r3, r5, #0
	adds r3, #0x64
	movs r4, #0
	ldrsh r3, [r3, r4]
	adds r4, r5, #0
	adds r4, #0x66
	movs r6, #0
	ldrsh r4, [r4, r6]
	str r4, [sp]
	adds r4, r5, #0
	adds r4, #0x68
	movs r6, #0
	ldrsh r4, [r4, r6]
	str r4, [sp, #4]
	bl func_fe6_08093EAC
	adds r0, r5, #0
	adds r0, #0x44
	ldrh r2, [r0]
	subs r2, #1
	movs r3, #0
	strh r2, [r0]
	ldr r4, .L08093E8C @ =gDispIo
	adds r1, r4, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r6, [r1]
	ands r0, r6
	strb r0, [r1]
	adds r1, r2, #0
	adds r0, r4, #0
	adds r0, #0x44
	strb r1, [r0]
	movs r0, #0x10
	subs r0, r0, r1
	adds r1, r4, #0
	adds r1, #0x45
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x46
	strb r3, [r0]
	lsls r2, r2, #0x10
	cmp r2, #0
	bne .L08093E84
	adds r0, r5, #0
	bl Proc_Break
.L08093E84:
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08093E8C: .4byte gDispIo

	thumb_func_start func_fe6_08093E90
func_fe6_08093E90: @ 0x08093E90
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x6a
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r1, #0
	bl SetWMMapText
	ldr r0, [r4, #0x50]
	bl EndSpriteAnim
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start func_fe6_08093EAC
func_fe6_08093EAC: @ 0x08093EAC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	str r0, [sp, #4]
	adds r4, r1, #0
	adds r7, r2, #0
	str r3, [sp, #8]
	ldr r0, [sp, #0x30]
	mov r8, r0
	ldr r5, [sp, #0x34]
	ldr r1, .L08093EEC @ =0xFFFFFE00
	mov sb, r1
	mov r2, sb
	ands r2, r4
	mov sb, r2
	ldr r0, .L08093EF0 @ =0xFFFFFF00
	mov sl, r0
	mov r1, sl
	ands r1, r7
	mov sl, r1
	mov r2, r8
	cmp r2, #1
	beq .L08093F08
	cmp r2, #1
	bgt .L08093EF4
	cmp r2, #0
	beq .L08093F00
	b .L08093F0A
	.align 2, 0
.L08093EEC: .4byte 0xFFFFFE00
.L08093EF0: .4byte 0xFFFFFF00
.L08093EF4:
	mov r0, r8
	cmp r0, #2
	beq .L08093F04
	cmp r0, #3
	beq .L08093F08
	b .L08093F0A
.L08093F00:
	subs r4, #2
	b .L08093F0A
.L08093F04:
	subs r4, #3
	b .L08093F0A
.L08093F08:
	adds r4, #2
.L08093F0A:
	lsls r5, r5, #1
	subs r5, #1
	movs r0, #1
	rsbs r0, r0, #0
	mov r1, r8
	lsls r1, r1, #1
	str r1, [sp, #0xc]
	cmp r5, r0
	beq .L08093F54
	ldr r1, .L08093F64 @ =gUnk_0868C940
	ldr r0, [sp, #0xc]
	add r0, r8
	lsls r0, r0, #2
	adds r6, r0, r1
.L08093F26:
	ldr r1, .L08093F68 @ =0x000001FF
	ands r1, r4
	add r1, sb
	movs r2, #0xff
	ands r2, r7
	add r2, sl
	ldr r3, [r6]
	ldr r0, .L08093F6C @ =0x00004320
	str r0, [sp]
	movs r0, #0xb
	bl PutSpriteExt
	movs r2, #4
	ldrsh r0, [r6, r2]
	adds r4, r4, r0
	movs r1, #6
	ldrsh r0, [r6, r1]
	adds r7, r7, r0
	subs r5, #1
	movs r0, #1
	rsbs r0, r0, #0
	cmp r5, r0
	bne .L08093F26
.L08093F54:
	mov r2, r8
	cmp r2, #1
	beq .L08093F96
	cmp r2, #1
	bgt .L08093F70
	cmp r2, #0
	beq .L08093F7E
	b .L08093F96
	.align 2, 0
.L08093F64: .4byte gUnk_0868C940
.L08093F68: .4byte 0x000001FF
.L08093F6C: .4byte 0x00004320
.L08093F70:
	mov r0, r8
	cmp r0, #2
	beq .L08093F7C
	cmp r0, #3
	beq .L08093F94
	b .L08093F96
.L08093F7C:
	adds r4, #2
.L08093F7E:
	ldr r0, .L08093F90 @ =gUnk_0868C734
	ldr r2, [sp, #8]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r0, [r1]
	subs r4, r4, r0
	b .L08093F96
	.align 2, 0
.L08093F90: .4byte gUnk_0868C734
.L08093F94:
	subs r4, #2
.L08093F96:
	ldr r0, .L08093FD0 @ =gUnk_0868C940
	ldr r2, [sp, #0xc]
	add r2, r8
	lsls r2, r2, #2
	adds r2, r2, r0
	movs r0, #8
	ldrsh r1, [r2, r0]
	adds r1, r4, r1
	ldr r0, .L08093FD4 @ =0x000001FF
	ands r1, r0
	add r1, sb
	movs r0, #0xa
	ldrsh r2, [r2, r0]
	adds r2, r7, r2
	movs r0, #0xff
	ands r2, r0
	add r2, sl
	ldr r0, [sp, #4]
	bl DisplaySpriteAnim
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08093FD0: .4byte gUnk_0868C940
.L08093FD4: .4byte 0x000001FF

	thumb_func_start func_fe6_08093FD8
func_fe6_08093FD8: @ 0x08093FD8
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, .L0809400C @ =ProcScr_0868C648
	bl FindProc
	ldrh r1, [r4]
	ldrh r3, [r0, #0x2a]
	subs r2, r1, r3
	strh r2, [r4]
	ldrh r5, [r4, #2]
	ldrh r3, [r0, #0x2c]
	subs r1, r5, r3
	strh r1, [r4, #2]
	adds r0, #0x2e
	ldrb r0, [r0]
	cmp r0, #0
	bne .L08094006
	lsls r0, r2, #0x10
	asrs r0, r0, #0x11
	strh r0, [r4]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x11
	strh r0, [r4, #2]
.L08094006:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0809400C: .4byte ProcScr_0868C648

	thumb_func_start PlayWMIntroBGM
PlayWMIntroBGM: @ 0x08094010
	push {lr}
	ldr r0, .L0809402C @ =gPlaySt
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterInfo
	ldrb r0, [r0, #0x17]
	movs r1, #0
	bl StartBgm
	pop {r0}
	bx r0
	.align 2, 0
.L0809402C: .4byte gPlaySt

	thumb_func_start func_fe6_08094030
func_fe6_08094030: @ 0x08094030
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	adds r1, r3, #0
	ldr r0, .L08094058 @ =gUnk_0868C970
	bl SpawnProcLocking
	ldr r1, .L0809405C @ =0x000003FF
	ands r1, r4
	lsls r1, r1, #5
	ldr r2, .L08094060 @ =0x06010000
	adds r1, r1, r2
	str r1, [r0, #0x4c]
	str r5, [r0, #0x54]
	str r6, [r0, #0x58]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08094058: .4byte gUnk_0868C970
.L0809405C: .4byte 0x000003FF
.L08094060: .4byte 0x06010000

	thumb_func_start func_fe6_08094064
func_fe6_08094064: @ 0x08094064
	adds r0, #0x64
	movs r1, #0
	strh r1, [r0]
	bx lr

	thumb_func_start func_fe6_0809406C
func_fe6_0809406C: @ 0x0809406C
	push {r4, r5, r6, r7, lr}
	adds r3, r0, #0
	ldr r6, [r3, #0x4c]
	movs r1, #0
	b .L080940C8
.L08094076:
	movs r2, #0
	lsls r0, r1, #2
	adds r5, r1, #0
	adds r5, #8
	adds r4, r0, r6
.L08094080:
	lsls r0, r2, #2
	adds r1, r0, r4
	ldr r0, [r1, #4]
	str r0, [r1]
	ldr r0, [r1, #8]
	str r0, [r1, #4]
	ldr r0, [r1, #0xc]
	str r0, [r1, #8]
	ldr r0, [r1, #0x10]
	str r0, [r1, #0xc]
	ldr r0, [r1, #0x14]
	str r0, [r1, #0x10]
	ldr r0, [r1, #0x18]
	str r0, [r1, #0x14]
	ldr r0, [r1, #0x1c]
	str r0, [r1, #0x18]
	ldr r0, .L080940B0 @ =0x000002FF
	cmp r2, r0
	bgt .L080940B4
	movs r7, #0x80
	lsls r7, r7, #3
	adds r0, r1, r7
	ldr r0, [r0]
	b .L080940B6
	.align 2, 0
.L080940B0: .4byte 0x000002FF
.L080940B4:
	ldr r0, [r3, #0x58]
.L080940B6:
	str r0, [r1, #0x1c]
	movs r0, #0x80
	lsls r0, r0, #1
	adds r2, r2, r0
	movs r0, #0xc0
	lsls r0, r0, #2
	cmp r2, r0
	ble .L08094080
	adds r1, r5, #0
.L080940C8:
	ldr r0, [r3, #0x54]
	lsls r0, r0, #3
	cmp r1, r0
	blt .L08094076
	adds r1, r3, #0
	adds r1, #0x64
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xf
	ble .L080940E8
	adds r0, r3, #0
	bl Proc_Break
.L080940E8:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_fe6_080940F0
func_fe6_080940F0: @ 0x080940F0
	push {lr}
	bl EndMapUi
	ldr r0, .L08094104 @ =gUnk_0868C988
	movs r1, #3
	bl SpawnProc
	pop {r0}
	bx r0
	.align 2, 0
.L08094104: .4byte gUnk_0868C988

	thumb_func_start func_fe6_08094108
func_fe6_08094108: @ 0x08094108
	adds r0, #0x34
	movs r1, #1
	strb r1, [r0]
	bx lr

	thumb_func_start func_fe6_08094110
func_fe6_08094110: @ 0x08094110
	push {lr}
	movs r1, #0
	str r1, [r0, #0x2c]
	ldr r1, .L08094128 @ =gPlaySt
	ldrb r1, [r1, #0xe]
	adds r2, r0, #0
	adds r2, #0x35
	strb r1, [r2]
	bl func_fe6_08094108
	pop {r0}
	bx r0
	.align 2, 0
.L08094128: .4byte gPlaySt

	thumb_func_start func_fe6_0809412C
func_fe6_0809412C: @ 0x0809412C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r4, [r5, #0x2c]
	bl IsEventRunning
	lsls r0, r0, #0x18
	cmp r0, #0
	bne .L08094204
	adds r0, r5, #0
	adds r0, #0x34
	ldrb r1, [r0]
	adds r6, r0, #0
	cmp r1, #0
	bne .L08094158
	movs r0, #1
	rsbs r0, r0, #0
	movs r1, #9
	bl DebugInitObj
	adds r0, r5, #0
	bl func_fe6_08094108
.L08094158:
	movs r0, #0x70
	movs r1, #0x64
	adds r2, r4, #0
	movs r3, #4
	bl DebugPutObjNumber
	ldr r1, .L0809417C @ =gKeySt
	ldr r2, [r1]
	movs r0, #4
	ldrh r3, [r2, #8]
	ands r0, r3
	cmp r0, #0
	beq .L08094180
	adds r0, r5, #0
	bl Proc_Break
	b .L08094204
	.align 2, 0
.L0809417C: .4byte gKeySt
.L08094180:
	ldrh r2, [r2, #6]
	movs r0, #0x40
	ands r0, r2
	cmp r0, #0
	beq .L0809418C
	adds r4, #1
.L0809418C:
	movs r0, #0x80
	ands r0, r2
	cmp r0, #0
	beq .L08094196
	subs r4, #1
.L08094196:
	movs r0, #0x10
	ands r0, r2
	cmp r0, #0
	beq .L080941A0
	adds r4, #0xa
.L080941A0:
	movs r0, #0x20
	ands r0, r2
	cmp r0, #0
	beq .L080941AA
	subs r4, #0xa
.L080941AA:
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r2
	cmp r0, #0
	beq .L080941B6
	adds r4, #0x64
.L080941B6:
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r2
	cmp r0, #0
	beq .L080941C2
	subs r4, #0x64
.L080941C2:
	cmp r4, #0
	bge .L080941C8
	movs r4, #0
.L080941C8:
	cmp r4, #0x26
	ble .L080941CE
	movs r4, #0x26
.L080941CE:
	ldr r0, [r5, #0x2c]
	cmp r4, r0
	beq .L080941E2
	movs r0, #1
	rsbs r0, r0, #0
	movs r1, #9
	bl DebugInitObj
	str r4, [r5, #0x2c]
	b .L08094204
.L080941E2:
	ldr r1, [r1]
	movs r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq .L08094204
	movs r0, #0
	strb r0, [r6]
	ldr r1, .L0809420C @ =gPlaySt
	adds r0, r5, #0
	adds r0, #0x35
	ldrb r0, [r0]
	strb r0, [r1, #0xe]
	ldr r0, .L08094210 @ =ProcScr_WorldMapIntroEvent
	movs r1, #3
	bl SpawnProc
.L08094204:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L0809420C: .4byte gPlaySt
.L08094210: .4byte ProcScr_WorldMapIntroEvent

	thumb_func_start func_fe6_08094214
func_fe6_08094214: @ 0x08094214
	push {lr}
	adds r1, r0, #0
	ldr r0, .L08094224 @ =gUnk_0868FDB4
	bl SpawnProcLocking
	pop {r0}
	bx r0
	.align 2, 0
.L08094224: .4byte gUnk_0868FDB4

	thumb_func_start func_fe6_08094228
func_fe6_08094228: @ 0x08094228
	push {lr}
	movs r0, #0
	bl SetOnHBlankA
	pop {r0}
	bx r0

	thumb_func_start func_fe6_08094234
func_fe6_08094234: @ 0x08094234
	push {r4, r5, lr}
	ldr r0, .L080943BC @ =gUnk_0868FE0C
	bl InitBgs
	bl func_fe6_08015344
	bl ResetText
	ldr r3, .L080943C0 @ =gDispIo
	movs r0, #1
	ldrb r1, [r3, #1]
	orrs r0, r1
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #2
	ands r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x11
	rsbs r1, r1, #0
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
	movs r0, #0x10
	strb r0, [r1]
	adds r1, #1
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x46
	strb r2, [r0]
	ldr r0, .L080943C4 @ =0x0000FFE0
	ldrh r2, [r3, #0x3c]
	ands r0, r2
	movs r1, #1
	orrs r0, r1
	ldr r1, .L080943C8 @ =0x0000E0FF
	ands r0, r1
	movs r2, #0x80
	lsls r2, r2, #4
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r3, #0x3c]
	bl InitScanlineEffect
	ldr r0, .L080943CC @ =OnHBlank_08069FD8
	bl SetOnHBlankA
	bl func_fe6_0806A7AC
	ldr r4, .L080943D0 @ =gUnk_0831B0A8
	movs r0, #3
	bl GetBgChrOffset
	adds r1, r0, #0
	movs r0, #0xc0
	lsls r0, r0, #0x13
	adds r1, r1, r0
	adds r0, r4, #0
	bl Decompress
	ldr r4, .L080943D4 @ =gBuf
	ldr r1, .L080943D8 @ =gUnk_08320434
	movs r2, #0x80
	lsls r2, r2, #7
	adds r0, r4, #0
	bl TmApplyTsa_thm
	ldr r1, .L080943DC @ =gBg3Tm
	movs r2, #0x80
	lsls r2, r2, #4
	adds r0, r4, #0
	bl VramCopy
	ldr r0, .L080943E0 @ =gUnk_08320D98
	movs r1, #0x80
	movs r2, #0x80
	bl ApplyPaletteExt
	movs r0, #4
	bl func_fe6_080154AC
	movs r0, #5
	bl func_fe6_080154AC
	movs r0, #6
	bl func_fe6_080154AC
	movs r0, #7
	bl func_fe6_080154AC
	ldr r4, .L080943E4 @ =gBg0Tm
	adds r0, r4, #0
	movs r1, #0
	bl TmFill
	ldr r0, .L080943E8 @ =gBg1Tm
	movs r1, #0
	bl TmFill
	ldr r0, .L080943EC @ =gUnk_08349A78
	movs r1, #0x60
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r5, .L080943F0 @ =gUnk_0834658C
	movs r0, #0
	bl GetBgChrOffset
	adds r1, r0, #0
	ldr r2, .L080943F4 @ =0x06000020
	adds r1, r1, r2
	adds r0, r5, #0
	bl Decompress
	adds r0, r4, #4
	ldr r1, .L080943F8 @ =0x00003001
	bl func_fe6_08094438
	adds r0, r4, #0
	adds r0, #0xc4
	ldr r1, .L080943FC @ =0x00003041
	bl func_fe6_08094438
	movs r1, #0xc2
	lsls r1, r1, #1
	adds r0, r4, r1
	ldr r1, .L08094400 @ =0x00003081
	bl func_fe6_08094438
	movs r2, #0xa1
	lsls r2, r2, #2
	adds r0, r4, r2
	ldr r1, .L08094404 @ =0x000030C1
	bl func_fe6_08094438
	movs r1, #0xd1
	lsls r1, r1, #2
	adds r0, r4, r1
	ldr r1, .L08094408 @ =0x00003101
	bl func_fe6_08094438
	ldr r2, .L0809440C @ =0x00000404
	adds r0, r4, r2
	ldr r1, .L08094410 @ =0x00003141
	bl func_fe6_08094438
	ldr r1, .L08094414 @ =0x000004C4
	adds r0, r4, r1
	ldr r1, .L08094418 @ =0x00003181
	bl func_fe6_08094438
	ldr r2, .L0809441C @ =0x00000584
	adds r0, r4, r2
	ldr r1, .L08094420 @ =0x000031C1
	bl func_fe6_08094438
	ldr r1, .L08094424 @ =0x00000644
	adds r0, r4, r1
	ldr r1, .L08094428 @ =0x00003201
	bl func_fe6_08094438
	ldr r2, .L0809442C @ =0x00000744
	adds r4, r4, r2
	ldr r1, .L08094430 @ =0x00003241
	adds r0, r4, #0
	bl func_fe6_08094438
	movs r0, #1
	bl EnableBgSync
	movs r0, #2
	bl EnableBgSync
	ldr r2, .L08094434 @ =0x0000FF60
	movs r0, #0
	movs r1, #0
	bl SetBgOffset
	movs r0, #0x47
	bl m4aSongNumStart
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L080943BC: .4byte gUnk_0868FE0C
.L080943C0: .4byte gDispIo
.L080943C4: .4byte 0x0000FFE0
.L080943C8: .4byte 0x0000E0FF
.L080943CC: .4byte OnHBlank_08069FD8
.L080943D0: .4byte gUnk_0831B0A8
.L080943D4: .4byte gBuf
.L080943D8: .4byte gUnk_08320434
.L080943DC: .4byte gBg3Tm
.L080943E0: .4byte gUnk_08320D98
.L080943E4: .4byte gBg0Tm
.L080943E8: .4byte gBg1Tm
.L080943EC: .4byte gUnk_08349A78
.L080943F0: .4byte gUnk_0834658C
.L080943F4: .4byte 0x06000020
.L080943F8: .4byte 0x00003001
.L080943FC: .4byte 0x00003041
.L08094400: .4byte 0x00003081
.L08094404: .4byte 0x000030C1
.L08094408: .4byte 0x00003101
.L0809440C: .4byte 0x00000404
.L08094410: .4byte 0x00003141
.L08094414: .4byte 0x000004C4
.L08094418: .4byte 0x00003181
.L0809441C: .4byte 0x00000584
.L08094420: .4byte 0x000031C1
.L08094424: .4byte 0x00000644
.L08094428: .4byte 0x00003201
.L0809442C: .4byte 0x00000744
.L08094430: .4byte 0x00003241
.L08094434: .4byte 0x0000FF60

	thumb_func_start func_fe6_08094438
func_fe6_08094438: @ 0x08094438
	push {r4, lr}
	adds r2, r0, #0
	adds r4, r1, #0
	movs r1, #0
	adds r3, r4, #0
	adds r3, #0x20
.L08094444:
	adds r0, r4, r1
	strh r0, [r2]
	adds r0, r2, #0
	adds r0, #0x40
	strh r3, [r0]
	adds r2, #2
	adds r3, #1
	adds r1, #1
	cmp r1, #0x1f
	ble .L08094444
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_fe6_08094460
func_fe6_08094460: @ 0x08094460
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r5, r6, #0
	adds r5, #0x64
	movs r0, #0xe4
	lsls r0, r0, #2
	ldrh r1, [r5]
	cmp r1, r0
	bne .L080944AA
	ldr r4, .L080944D8 @ =gBg1Tm+0x4
	ldr r1, .L080944DC @ =0x00003281
	adds r0, r4, #0
	bl func_fe6_08094438
	adds r0, r4, #0
	adds r0, #0xc0
	ldr r1, .L080944E0 @ =0x000032C1
	bl func_fe6_08094438
	movs r1, #0xc0
	lsls r1, r1, #1
	adds r0, r4, r1
	ldr r1, .L080944E4 @ =0x00003301
	bl func_fe6_08094438
	movs r1, #0xe0
	lsls r1, r1, #2
	adds r0, r4, r1
	ldr r1, .L080944E8 @ =0x00003341
	bl func_fe6_08094438
	movs r0, #1
	bl EnableBgSync
	movs r0, #2
	bl EnableBgSync
.L080944AA:
	ldr r0, .L080944EC @ =gKeySt
	ldr r1, [r0]
	movs r0, #8
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq .L080944BE
	adds r0, r6, #0
	bl Proc_Break
.L080944BE:
	ldrh r0, [r5]
	adds r1, r0, #1
	strh r1, [r5]
	lsls r0, r0, #0x10
	ldr r1, .L080944F0 @ =0x06C70000
	cmp r0, r1
	ble .L080944D2
	adds r0, r6, #0
	bl Proc_Break
.L080944D2:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L080944D8: .4byte gBg1Tm+0x4
.L080944DC: .4byte 0x00003281
.L080944E0: .4byte 0x000032C1
.L080944E4: .4byte 0x00003301
.L080944E8: .4byte 0x00003341
.L080944EC: .4byte gKeySt
.L080944F0: .4byte 0x06C70000

	thumb_func_start func_fe6_080944F4
func_fe6_080944F4: @ 0x080944F4
	adds r1, r0, #0
	adds r1, #0x64
	movs r2, #0
	strh r2, [r1]
	adds r0, #0x66
	strh r2, [r0]
	bx lr
	.align 2, 0

	thumb_func_start func_fe6_08094504
func_fe6_08094504: @ 0x08094504
	push {lr}
	adds r3, r0, #0
	adds r2, r3, #0
	adds r2, #0x64
	ldrh r0, [r2]
	adds r1, r0, #1
	strh r1, [r2]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #2
	ble .L08094528
	movs r0, #0
	strh r0, [r2]
	adds r1, r3, #0
	adds r1, #0x66
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
.L08094528:
	adds r0, r3, #0
	adds r0, #0x66
	ldrh r2, [r0]
	subs r2, #0x90
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #0
	movs r1, #0
	bl SetBgOffset
	pop {r0}
	bx r0

	thumb_func_start func_fe6_08094540
func_fe6_08094540: @ 0x08094540
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	ldr r4, .L080945EC @ =gDispIo
	movs r0, #8
	rsbs r0, r0, #0
	ldrb r1, [r4]
	ands r0, r1
	strb r0, [r4]
	movs r0, #0
	bl InitBgs
	bl NewEfxAnimeDrvProc
	bl func_fe6_08057EF4
	adds r0, r7, #0
	adds r0, #0x2e
	movs r5, #0
	strb r5, [r0]
	ldr r1, .L080945F0 @ =gUnk_0869056C
	subs r0, #1
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r0, [r0]
	adds r1, r7, #0
	adds r1, #0x30
	strb r0, [r1]
	movs r6, #0
	strh r5, [r7, #0x2a]
	str r5, [r7, #0x34]
	str r5, [r7, #0x38]
	ldrb r1, [r1]
	adds r0, r7, #0
	bl func_fe6_08094C80
	str r0, [r7, #0x34]
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r1, [r4, #1]
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
	strb r0, [r4, #1]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	bl GetGameTime
	str r0, [r7, #0x40]
	str r5, [r7, #0x3c]
	adds r1, r7, #0
	adds r1, #0x2c
	movs r0, #1
	strb r0, [r1]
	adds r0, r7, #0
	adds r0, #0x32
	strb r6, [r0]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L080945EC: .4byte gDispIo
.L080945F0: .4byte gUnk_0869056C

	thumb_func_start func_fe6_080945F4
func_fe6_080945F4: @ 0x080945F4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	bl GetGameTime
	ldr r1, [r4, #0x40]
	subs r0, r0, r1
	str r0, [r4, #0x3c]
	adds r5, r4, #0
	adds r5, #0x2c
	ldrb r0, [r5]
	cmp r0, #2
	beq .L08094644
	cmp r0, #2
	bgt .L0809461A
	cmp r0, #1
	beq .L08094620
	b .L080946C4
.L0809461A:
	cmp r0, #3
	beq .L080946B2
	b .L080946C4
.L08094620:
	ldr r0, .L08094640 @ =gKeySt
	ldr r1, [r0]
	movs r0, #0xb
	ldrh r1, [r1, #4]
	ands r0, r1
	cmp r0, #0
	beq .L080946C4
	movs r0, #0
	bl SetNextGameAction
	adds r0, r4, #0
	movs r1, #4
	bl Proc_Goto
	b .L080946C4
	.align 2, 0
.L08094640: .4byte gKeySt
.L08094644:
	adds r3, r4, #0
	adds r3, #0x30
	ldrb r5, [r3]
	ldr r0, .L0809469C @ =gUnk_0869056C
	mov r8, r0
	adds r1, r4, #0
	adds r1, #0x2e
	ldrb r2, [r1]
	movs r6, #0x2d
	adds r6, r6, r4
	ldrb r7, [r6]
	lsls r0, r7, #2
	adds r0, r2, r0
	add r0, r8
	ldrb r0, [r0]
	adds r0, #4
	cmp r5, r0
	blt .L080946A4
	adds r0, r2, #1
	strb r0, [r1]
	ldrb r2, [r1]
	ldrb r1, [r6]
	lsls r0, r1, #2
	adds r0, r2, r0
	add r0, r8
	ldrb r1, [r0]
	adds r0, r1, #0
	cmp r0, #0xff
	beq .L08094682
	cmp r2, #3
	bls .L080946A0
.L08094682:
	movs r0, #1
	bl SetNextGameAction
	adds r0, r4, #0
	movs r1, #5
	bl Proc_Goto
	movs r0, #1
	rsbs r0, r0, #0
	bl FadeBgmOut
	b .L080946C4
	.align 2, 0
.L0809469C: .4byte gUnk_0869056C
.L080946A0:
	strb r1, [r3]
	b .L080946A8
.L080946A4:
	adds r0, r5, #1
	strb r0, [r3]
.L080946A8:
	adds r0, r4, #0
	movs r1, #2
	bl Proc_Goto
	b .L080946C4
.L080946B2:
	adds r0, r4, #0
	adds r0, #0x30
	ldrb r1, [r0]
	adds r0, r4, #0
	bl func_fe6_08095AB8
	str r0, [r4, #0x38]
	movs r0, #1
	strb r0, [r5]
.L080946C4:
	movs r0, #0
	strh r0, [r4, #0x2a]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_fe6_080946D4
func_fe6_080946D4: @ 0x080946D4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x38]
	cmp r0, #0
	beq .L080946E4
	movs r1, #4
	bl Proc_Goto
.L080946E4:
	ldr r2, .L08094720 @ =gDispIo
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
	adds r0, r4, #0
	adds r0, #0x30
	ldrb r1, [r0]
	adds r0, r4, #0
	bl func_fe6_08094C80
	str r0, [r4, #0x34]
	adds r1, r4, #0
	adds r1, #0x2c
	movs r0, #1
	strb r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08094720: .4byte gDispIo

	thumb_func_start func_fe6_08094724
func_fe6_08094724: @ 0x08094724
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, .L08094794 @ =gKeySt
	ldr r1, [r0]
	movs r0, #0xb
	ldrh r1, [r1, #4]
	ands r0, r1
	cmp r0, #0
	beq .L08094752
	adds r4, r5, #0
	adds r4, #0x32
	ldrb r0, [r4]
	cmp r0, #0
	bne .L08094752
	movs r0, #0
	bl SetNextGameAction
	movs r0, #1
	strb r0, [r4]
	adds r0, r5, #0
	movs r1, #4
	bl Proc_Goto
.L08094752:
	ldrh r0, [r5, #0x2a]
	cmp r0, #0
	bne .L0809475C
	bl func_fe6_08057F24
.L0809475C:
	ldrh r0, [r5, #0x2a]
	adds r0, #1
	adds r1, r0, #0
	strh r0, [r5, #0x2a]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x11
	cmp r0, #0xd
	bls .L0809479C
	ldr r2, .L08094798 @ =gDispIo
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
	adds r0, r5, #0
	bl Proc_Break
	b .L080947A4
	.align 2, 0
.L08094794: .4byte gKeySt
.L08094798: .4byte gDispIo
.L0809479C:
	lsls r0, r1, #0x18
	lsrs r0, r0, #0x18
	bl func_fe6_0809485C
.L080947A4:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_fe6_080947AC
func_fe6_080947AC: @ 0x080947AC
	push {lr}
	movs r0, #1
	bl FadeBgmOut
	pop {r0}
	bx r0

	thumb_func_start func_fe6_080947B8
func_fe6_080947B8: @ 0x080947B8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x34]
	cmp r0, #0
	beq .L080947C8
	movs r1, #4
	bl Proc_Goto
.L080947C8:
	ldr r0, [r4, #0x38]
	cmp r0, #0
	beq .L080947D4
	movs r1, #4
	bl Proc_Goto
.L080947D4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_fe6_080947DC
func_fe6_080947DC: @ 0x080947DC
	push {r4, lr}
	adds r4, r0, #0
	bl EndEfxAnimeDrvProc
	adds r0, r4, #0
	bl CleanupGame
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start StartClassDemo
StartClassDemo: @ 0x080947F0
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, .L08094808 @ =ProcScr_ClassDemo
	bl SpawnProcLocking
	adds r0, #0x2d
	strb r4, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08094808: .4byte ProcScr_ClassDemo

	thumb_func_start func_fe6_0809480C
func_fe6_0809480C: @ 0x0809480C
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r3, .L08094854 @ =gPal
	ldr r2, .L08094858 @ =0x02000000
	movs r1, #0x80
	lsls r1, r1, #2
.L08094818:
	ldrh r0, [r3]
	strh r0, [r2]
	adds r3, #2
	adds r2, #2
	subs r1, #1
	cmp r1, #0
	bne .L08094818
	ldr r4, .L08094858 @ =0x02000000
	ldrh r5, [r5, #0x2a]
	lsrs r3, r5, #1
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0x20
	bl EfxPalBlackInOut
	ldr r2, .L08094854 @ =gPal
	movs r1, #0x80
	lsls r1, r1, #2
.L0809483C:
	ldrh r0, [r4]
	strh r0, [r2]
	adds r4, #2
	adds r2, #2
	subs r1, #1
	cmp r1, #0
	bne .L0809483C
	bl EnablePalSync
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08094854: .4byte gPal
.L08094858: .4byte 0x02000000

	thumb_func_start func_fe6_0809485C
func_fe6_0809485C: @ 0x0809485C
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, .L08094874 @ =gUnk_0868FEDC
	movs r1, #4
	bl SpawnProc
	strh r4, [r0, #0x2a]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08094874: .4byte gUnk_0868FEDC

	thumb_func_start func_fe6_08094878
func_fe6_08094878: @ 0x08094878
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	str r2, [sp, #8]
	str r3, [sp, #0xc]
	ldr r2, [sp, #0x30]
	ldr r3, [sp, #0x34]
	ldr r4, [sp, #0x38]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #4]
	lsls r1, r1, #0x18
	lsrs r7, r1, #0x18
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov sl, r2
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	mov r8, r3
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	movs r5, #1
	ldr r2, .L080948D4 @ =gPal
	movs r0, #0x80
	lsls r0, r0, #1
	ldr r1, .L080948D8 @ =0x0000021E
	adds r6, r2, r1
	adds r0, r4, r0
	lsls r1, r7, #5
	lsls r0, r0, #1
	adds r0, r0, r2
	adds r3, r0, #2
	ldr r0, .L080948DC @ =0x00000222
	adds r1, r1, r0
	adds r1, r1, r2
.L080948C4:
	adds r0, r5, r4
	cmp r0, #0xf
	ble .L080948E0
	ldrh r0, [r6]
	strh r0, [r1]
	adds r2, r7, #1
	mov sb, r2
	b .L080948E8
	.align 2, 0
.L080948D4: .4byte gPal
.L080948D8: .4byte 0x0000021E
.L080948DC: .4byte 0x00000222
.L080948E0:
	ldrh r0, [r3]
	strh r0, [r1]
	adds r0, r7, #1
	mov sb, r0
.L080948E8:
	adds r1, #2
	adds r3, #2
	adds r5, #1
	cmp r5, #0xf
	ble .L080948C4
	bl EnablePalSync
	mov r1, sl
	cmp r1, #7
	bhi .L08094900
	movs r2, #8
	mov sl, r2
.L08094900:
	mov r3, r8
	cmp r3, #7
	bhi .L0809490A
	movs r0, #8
	mov r8, r0
.L0809490A:
	ldr r4, .L080949A8 @ =gSinLut
	ldr r1, .L080949AC @ =gSinLut+0x80
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #4
	mov r1, sl
	bl Div
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	movs r3, #0
	ldrsh r0, [r4, r3]
	rsbs r0, r0, #0
	lsls r0, r0, #4
	mov r1, r8
	bl Div
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	movs r1, #0
	ldrsh r0, [r4, r1]
	lsls r0, r0, #4
	mov r1, sl
	bl Div
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	ldr r2, .L080949AC @ =gSinLut+0x80
	movs r3, #0
	ldrsh r0, [r2, r3]
	lsls r0, r0, #4
	mov r1, r8
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	adds r0, r7, #0
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl SetObjAffine
	ldr r0, .L080949B0 @ =0x000001FF
	ldr r1, [sp, #8]
	ands r1, r0
	str r1, [sp, #8]
	lsls r1, r7, #9
	ldr r2, [sp, #8]
	adds r1, r2, r1
	ldr r3, [sp, #0xc]
	ands r3, r0
	str r3, [sp, #0xc]
	ldr r2, .L080949B4 @ =gUnk_08690288
	ldr r3, [sp, #4]
	adds r0, r3, r7
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r3, [r0]
	movs r0, #0xf
	mov r2, sb
	ands r2, r0
	lsls r0, r2, #0xc
	str r0, [sp]
	movs r0, #4
	ldr r2, [sp, #0xc]
	bl PutSpriteExt
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L080949A8: .4byte gSinLut
.L080949AC: .4byte gSinLut+0x80
.L080949B0: .4byte 0x000001FF
.L080949B4: .4byte gUnk_08690288

	thumb_func_start func_fe6_080949B8
func_fe6_080949B8: @ 0x080949B8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r5, r0, #0
	ldr r2, .L08094A04 @ =gDispIo
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
	strh r0, [r5, #0x2a]
	adds r2, r5, #0
	adds r2, #0x30
	ldrb r0, [r2]
	cmp r0, #0
	bne .L08094A0C
	adds r1, r5, #0
	adds r1, #0x2f
	movs r0, #0
	strb r0, [r1]
	mov sb, r2
	ldr r2, .L08094A08 @ =gUnk_08690288
	mov ip, r2
	movs r0, #0x2e
	adds r0, r0, r5
	mov r8, r0
	movs r2, #0x34
	adds r2, r2, r5
	mov sl, r2
	b .L08094A42
	.align 2, 0
.L08094A04: .4byte gDispIo
.L08094A08: .4byte gUnk_08690288
.L08094A0C:
	movs r4, #0
	movs r3, #0
	mov sb, r2
	adds r1, r5, #0
	adds r1, #0x2f
	ldr r0, .L08094A78 @ =gUnk_08690288
	mov ip, r0
	movs r2, #0x2e
	adds r2, r2, r5
	mov r8, r2
	movs r0, #0x34
	adds r0, r0, r5
	mov sl, r0
	mov r6, sb
	adds r7, r1, #0
	mov r2, ip
.L08094A2C:
	adds r2, #4
	adds r4, #1
	ldr r0, [r2]
	cmp r0, #0
	bne .L08094A2C
	adds r3, #1
	ldrb r0, [r6]
	cmp r3, r0
	bne .L08094A2C
	adds r0, r4, #1
	strb r0, [r7]
.L08094A42:
	movs r0, #0
	mov r2, r8
	strb r0, [r2]
	ldrb r1, [r1]
	lsls r0, r1, #2
	mov r2, ip
	adds r1, r0, r2
	ldr r0, [r1]
	cmp r0, #0
	beq .L08094A66
	mov r2, r8
.L08094A58:
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	adds r1, #4
	ldr r0, [r1]
	cmp r0, #0
	bne .L08094A58
.L08094A66:
	mov r0, sb
	ldrb r0, [r0]
	cmp r0, #0x13
	bls .L08094A84
	ldr r0, .L08094A7C @ =gUnk_08357140
	ldr r1, .L08094A80 @ =0x06010000
	bl Decompress
	b .L08094A8C
	.align 2, 0
.L08094A78: .4byte gUnk_08690288
.L08094A7C: .4byte gUnk_08357140
.L08094A80: .4byte 0x06010000
.L08094A84:
	ldr r0, .L08094B0C @ =gUnk_08354780
	ldr r1, .L08094B10 @ =0x06010000
	bl Decompress
.L08094A8C:
	ldr r0, .L08094B14 @ =gUnk_08354760
	movs r1, #0x80
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r4, .L08094B18 @ =gUnk_0835A368
	movs r1, #0xf0
	lsls r1, r1, #2
	adds r0, r4, #0
	movs r2, #0x20
	bl ApplyPaletteExt
	movs r1, #0xf8
	lsls r1, r1, #2
	adds r0, r4, #0
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, .L08094B1C @ =gUnk_083599AC
	ldr r1, .L08094B20 @ =0x06016000
	bl Decompress
	mov r1, sl
	movs r2, #0
	adds r0, r1, #0
	adds r0, #0x24
.L08094AC2:
	str r2, [r0]
	subs r0, #4
	cmp r0, r1
	bge .L08094AC2
	mov r2, r8
	ldrb r2, [r2]
	lsls r1, r2, #3
	mov r0, r8
	ldrb r0, [r0]
	subs r1, r1, r0
	lsls r1, r1, #2
	movs r0, #0xf0
	subs r0, r0, r1
	asrs r0, r0, #1
	subs r0, #0x10
	ldr r2, .L08094B24 @ =0x000001FF
	adds r1, r2, #0
	ands r0, r1
	strh r0, [r5, #0x2c]
	adds r0, r5, #0
	movs r1, #0
	bl func_fe6_08094EE8
	str r0, [r5, #0x34]
	mov r0, sb
	ldrb r1, [r0]
	adds r0, r5, #0
	bl func_fe6_080951DC
	str r0, [r5, #0x5c]
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08094B0C: .4byte gUnk_08354780
.L08094B10: .4byte 0x06010000
.L08094B14: .4byte gUnk_08354760
.L08094B18: .4byte gUnk_0835A368
.L08094B1C: .4byte gUnk_083599AC
.L08094B20: .4byte 0x06016000
.L08094B24: .4byte 0x000001FF

	thumb_func_start func_fe6_08094B28
func_fe6_08094B28: @ 0x08094B28
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, .L08094B7C @ =gDispIo
	mov ip, r0
	mov r3, ip
	adds r3, #0x3c
	movs r2, #0x3f
	ldrb r0, [r3]
	ands r2, r0
	movs r0, #0x80
	orrs r2, r0
	mov r0, ip
	adds r0, #0x44
	movs r5, #0
	strb r5, [r0]
	adds r0, #1
	strb r5, [r0]
	ldrh r0, [r4, #0x2a]
	lsrs r1, r0, #1
	movs r0, #0x10
	subs r0, r0, r1
	mov r1, ip
	adds r1, #0x46
	strb r0, [r1]
	movs r0, #0x20
	orrs r2, r0
	strb r2, [r3]
	ldrh r0, [r4, #0x2a]
	adds r0, #1
	strh r0, [r4, #0x2a]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x20
	bne .L08094B74
	strh r5, [r4, #0x2a]
	adds r0, r4, #0
	bl Proc_Break
.L08094B74:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08094B7C: .4byte gDispIo

	thumb_func_start func_fe6_08094B80
func_fe6_08094B80: @ 0x08094B80
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2a]
	cmp r0, #0x5f
	bls .L08094B94
	adds r0, r4, #0
	bl Proc_Break
	movs r0, #0
	b .L08094BD8
.L08094B94:
	cmp r0, #0xf
	bls .L08094BD4
	ldrh r1, [r4, #0x2a]
	adds r6, r1, #0
	subs r6, #0x10
	movs r0, #3
	ands r0, r6
	cmp r0, #0
	bne .L08094BD4
	adds r0, r6, #0
	cmp r6, #0
	bge .L08094BB0
	adds r0, r1, #0
	subs r0, #0xd
.L08094BB0:
	asrs r0, r0, #2
	adds r5, r0, #1
	adds r0, r4, #0
	adds r0, #0x2e
	ldrb r0, [r0]
	cmp r5, r0
	bge .L08094BD4
	lsls r1, r5, #0x18
	lsrs r1, r1, #0x18
	adds r0, r4, #0
	bl func_fe6_08094EE8
	adds r2, r0, #0
	lsls r1, r5, #2
	adds r0, r4, #0
	adds r0, #0x34
	adds r0, r0, r1
	str r2, [r0]
.L08094BD4:
	ldrh r0, [r4, #0x2a]
	adds r0, #1
.L08094BD8:
	strh r0, [r4, #0x2a]
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start func_fe6_08094BE0
func_fe6_08094BE0: @ 0x08094BE0
	push {r4, r5, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2a]
	cmp r0, #0x14
	bne .L08094BF2
	ldr r0, [r4, #0x5c]
	movs r1, #4
	bl Proc_Goto
.L08094BF2:
	ldrh r0, [r4, #0x2a]
	cmp r0, #0x4f
	bls .L08094C0E
	adds r0, r4, #0
	bl Proc_Break
	movs r0, #0
	strh r0, [r4, #0x2a]
	adds r1, r4, #0
	adds r1, #0x30
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	b .L08094C48
.L08094C0E:
	ldrh r5, [r4, #0x2a]
	adds r0, r5, #0
	movs r1, #6
	bl __umodsi3
	lsls r0, r0, #0x10
	cmp r0, #0
	bne .L08094C42
	adds r0, r5, #0
	movs r1, #6
	bl __udivsi3
	adds r1, r4, #0
	adds r1, #0x2e
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrb r1, [r1]
	cmp r0, r1
	bhs .L08094C42
	lsls r0, r0, #2
	adds r1, r4, #0
	adds r1, #0x34
	adds r1, r1, r0
	ldr r0, [r1]
	bl Proc_Break
.L08094C42:
	ldrh r0, [r4, #0x2a]
	adds r0, #1
	strh r0, [r4, #0x2a]
.L08094C48:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_fe6_08094C50
func_fe6_08094C50: @ 0x08094C50
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r4, r6, #0
	adds r4, #0x34
	movs r5, #7
.L08094C5A:
	ldr r0, [r4]
	cmp r0, #0
	beq .L08094C64
	bl Proc_End
.L08094C64:
	adds r4, #4
	subs r5, #1
	cmp r5, #0
	bge .L08094C5A
	ldr r0, [r6, #0x60]
	movs r1, #0
	str r1, [r0, #0x34]
	adds r0, #0x2c
	movs r1, #3
	strb r1, [r0]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_fe6_08094C80
func_fe6_08094C80: @ 0x08094C80
	push {r4, r5, lr}
	adds r5, r0, #0
	lsls r4, r1, #0x18
	lsrs r4, r4, #0x18
	ldr r0, .L08094CB4 @ =gUnk_0868FEFC
	adds r1, r5, #0
	bl SpawnProc
	adds r2, r0, #0
	str r5, [r2, #0x60]
	adds r0, #0x30
	strb r4, [r0]
	movs r3, #0
	movs r1, #9
	adds r0, #0x28
.L08094C9E:
	str r3, [r0]
	subs r0, #4
	subs r1, #1
	cmp r1, #0
	bge .L08094C9E
	movs r0, #0
	str r0, [r2, #0x5c]
	adds r0, r2, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
.L08094CB4: .4byte gUnk_0868FEFC

	thumb_func_start func_fe6_08094CB8
func_fe6_08094CB8: @ 0x08094CB8
	push {r4, lr}
	movs r1, #0
	strh r1, [r0, #0x2a]
	ldr r2, [r0, #0x14]
	adds r1, r2, #0
	adds r1, #0x2f
	ldrb r1, [r1]
	strh r1, [r0, #0x2c]
	adds r3, r0, #0
	adds r3, #0x2e
	ldrb r4, [r3]
	lsls r1, r4, #3
	subs r1, r1, r4
	lsls r1, r1, #2
	ldrh r2, [r2, #0x2c]
	adds r1, r2, r1
	ldr r3, .L08094CE8 @ =0x000001FF
	adds r2, r3, #0
	ands r1, r2
	strh r1, [r0, #0x30]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08094CE8: .4byte 0x000001FF

	thumb_func_start func_fe6_08094CEC
func_fe6_08094CEC: @ 0x08094CEC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	adds r7, r0, #0
	movs r0, #0x2e
	adds r0, r0, r7
	mov sb, r0
	ldrb r1, [r0]
	mov sl, r1
	cmp r1, #0
	bne .L08094DC0
	ldr r3, .L08094DB8 @ =gSinLut
	movs r2, #0xa0
	lsls r2, r2, #1
	adds r0, r3, r2
	movs r5, #0
	ldrsh r6, [r0, r5]
	asrs r6, r6, #6
	adds r0, r3, #0
	adds r0, #0xc0
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r4, r0, #1
	adds r4, r4, r0
	asrs r4, r4, #9
	ldrh r0, [r7, #0x2a]
	movs r2, #0xc0
	subs r2, r2, r0
	movs r1, #0xff
	ands r2, r1
	adds r1, r2, #0
	adds r1, #0x40
	lsls r1, r1, #1
	adds r1, r1, r3
	movs r5, #0
	ldrsh r1, [r1, r5]
	asrs r5, r1, #6
	lsls r2, r2, #1
	adds r2, r2, r3
	movs r1, #0
	ldrsh r2, [r2, r1]
	lsls r1, r2, #1
	adds r1, r1, r2
	asrs r3, r1, #9
	lsls r0, r0, #8
	movs r1, #0x60
	str r3, [sp, #0xc]
	bl __divsi3
	movs r2, #0x80
	lsls r2, r2, #2
	adds r1, r2, #0
	subs r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldrh r0, [r7, #0x2c]
	mov r8, r0
	mov r2, sb
	ldrb r2, [r2]
	mov sb, r2
	ldrh r0, [r7, #0x30]
	adds r5, r0, r5
	subs r5, r5, r6
	ldr r0, .L08094DBC @ =0x000001FF
	ands r5, r0
	subs r4, #0x18
	ldr r3, [sp, #0xc]
	subs r4, r3, r4
	ands r4, r0
	str r1, [sp]
	str r1, [sp, #4]
	ldrh r0, [r7, #0x2a]
	movs r1, #0xc
	bl __divsi3
	movs r1, #8
	subs r1, r1, r0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	str r1, [sp, #8]
	mov r0, r8
	mov r1, sb
	adds r2, r5, #0
	adds r3, r4, #0
	bl func_fe6_08094878
	ldrh r0, [r7, #0x2a]
	adds r0, #4
	strh r0, [r7, #0x2a]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x60
	bne .L08094E10
	mov r1, sl
	strh r1, [r7, #0x2a]
	adds r0, r7, #0
	bl Proc_Break
	b .L08094E10
	.align 2, 0
.L08094DB8: .4byte gSinLut
.L08094DBC: .4byte 0x000001FF
.L08094DC0:
	ldrh r1, [r7, #0x2a]
	adds r0, r1, #0
	adds r2, r1, #0
	asrs r6, r0, #4
	movs r0, #0x10
	subs r5, r0, r6
	adds r3, r5, #0
	ldrh r4, [r7, #0x2c]
	mov r2, sb
	ldrb r5, [r2]
	ldrh r0, [r7, #0x30]
	subs r2, r0, r3
	movs r0, #0x18
	subs r3, r0, r3
	str r1, [sp]
	movs r1, #0x80
	lsls r1, r1, #1
	mov r8, r1
	str r1, [sp, #4]
	movs r0, #0x10
	subs r0, r0, r6
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #8]
	adds r0, r4, #0
	adds r1, r5, #0
	bl func_fe6_08094878
	ldrh r0, [r7, #0x2a]
	adds r0, #0x10
	strh r0, [r7, #0x2a]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, r8
	bne .L08094E10
	movs r0, #0
	strh r0, [r7, #0x2a]
	adds r0, r7, #0
	bl Proc_Break
.L08094E10:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start func_fe6_08094E20
func_fe6_08094E20: @ 0x08094E20
	push {r4, r5, lr}
	sub sp, #0xc
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r1, r4, #0
	adds r1, #0x2e
	ldrb r1, [r1]
	ldrh r2, [r4, #0x30]
	movs r3, #0x80
	lsls r3, r3, #1
	str r3, [sp]
	str r3, [sp, #4]
	movs r5, #0
	str r5, [sp, #8]
	movs r3, #0x18
	bl func_fe6_08094878
	strh r5, [r4, #0x2a]
	add sp, #0xc
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start func_fe6_08094E4C
func_fe6_08094E4C: @ 0x08094E4C
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r4, r0, #0
	ldrh r2, [r4, #0x2a]
	movs r0, #0x80
	lsls r0, r0, #1
	adds r6, r2, r0
	subs r0, r0, r2
	mov ip, r0
	ldrh r0, [r4, #0x30]
	cmp r0, #0xff
	bls .L08094E78
	adds r1, r2, #0
	muls r1, r2, r1
	asrs r1, r1, #7
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	subs r0, r0, r1
	lsls r0, r0, #3
	rsbs r0, r0, #0
	b .L08094E86
.L08094E78:
	movs r1, #0xff
	ands r1, r0
	subs r1, #0x58
	adds r0, r2, #0
	muls r0, r2, r0
	asrs r0, r0, #7
	muls r0, r1, r0
.L08094E86:
	cmp r0, #0
	bge .L08094E8C
	adds r0, #0xff
.L08094E8C:
	asrs r0, r0, #8
	ldrh r3, [r4, #0x2c]
	adds r5, r4, #0
	adds r5, #0x2e
	ldrb r1, [r5]
	ldrh r7, [r4, #0x30]
	adds r2, r7, r0
	lsls r0, r6, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp]
	mov r6, ip
	lsls r0, r6, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #4]
	ldrh r0, [r4, #0x2a]
	asrs r0, r0, #4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #8]
	adds r0, r3, #0
	movs r3, #0x18
	bl func_fe6_08094878
	movs r0, #0x80
	lsls r0, r0, #1
	ldrh r7, [r4, #0x2a]
	cmp r7, r0
	bne .L08094ED8
	ldr r0, [r4, #0x14]
	ldrb r5, [r5]
	lsls r1, r5, #2
	adds r0, #0x34
	adds r0, r0, r1
	movs r1, #0
	str r1, [r0]
	adds r0, r4, #0
	bl Proc_Break
.L08094ED8:
	ldrh r0, [r4, #0x2a]
	adds r0, #8
	strh r0, [r4, #0x2a]
	add sp, #0xc
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_fe6_08094EE8
func_fe6_08094EE8: @ 0x08094EE8
	push {r4, lr}
	adds r2, r0, #0
	lsls r4, r1, #0x18
	lsrs r4, r4, #0x18
	ldr r0, .L08094F04 @ =gUnk_0868FF4C
	adds r1, r2, #0
	bl SpawnProc
	adds r1, r0, #0
	adds r1, #0x2e
	strb r4, [r1]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
.L08094F04: .4byte gUnk_0868FF4C

	thumb_func_start func_fe6_08094F08
func_fe6_08094F08: @ 0x08094F08
	push {lr}
	bl EnablePalSync
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_fe6_08094F14
func_fe6_08094F14: @ 0x08094F14
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r3, r0, #0
	movs r0, #0
	strh r0, [r3, #0x2a]
	ldr r0, .L08094F88 @ =gPal
	movs r1, #0
	movs r4, #0xf
	ldr r2, .L08094F8C @ =0x000003FE
	adds r0, r0, r2
.L08094F2A:
	strh r1, [r0]
	subs r0, #2
	subs r4, #1
	cmp r4, #0
	bge .L08094F2A
	adds r0, r3, #0
	adds r0, #0x2e
	movs r1, #0
	strb r1, [r0]
	adds r2, r3, #0
	adds r2, #0x2d
	strb r1, [r2]
	movs r4, #0
	adds r7, r3, #0
	adds r7, #0x2c
	ldr r1, .L08094F90 @ =gUnk_08690A99
	mov r8, r1
	adds r6, r0, #0
	adds r5, r2, #0
.L08094F50:
	ldrb r0, [r7]
	add r0, r8
	ldrb r0, [r0]
	bl GetJInfo
	adds r0, #0x28
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0
	beq .L08094F74
	movs r0, #1
	lsls r0, r4
	ldrb r2, [r6]
	orrs r0, r2
	strb r0, [r6]
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
.L08094F74:
	adds r4, #1
	cmp r4, #7
	ble .L08094F50
	bl EnablePalSync
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08094F88: .4byte gPal
.L08094F8C: .4byte 0x000003FE
.L08094F90: .4byte gUnk_08690A99

	thumb_func_start func_fe6_08094F94
func_fe6_08094F94: @ 0x08094F94
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	lsls r1, r1, #0x18
	movs r7, #0xe0
	lsls r7, r7, #8
	cmp r1, #0
	beq .L08094FB2
	movs r7, #0xf0
	lsls r7, r7, #8
.L08094FB2:
	ldr r4, .L08094FF4 @ =gUnk_086900F8
	str r7, [sp]
	movs r0, #4
	movs r1, #0x74
	movs r2, #0x48
	adds r3, r4, #0
	bl PutSpriteExt
	movs r5, #0
	cmp r5, r8
	bge .L0809501E
	mov sb, r4
	movs r6, #0x74
	movs r4, #0x74
.L08094FCE:
	mov r0, r8
	subs r0, #1
	cmp r5, r0
	bge .L08094FF8
	str r7, [sp]
	movs r0, #4
	adds r1, r4, #0
	movs r2, #0x48
	mov r3, sb
	bl PutSpriteExt
	str r7, [sp]
	movs r0, #4
	adds r1, r6, #0
	movs r2, #0x48
	mov r3, sb
	bl PutSpriteExt
	b .L08095014
	.align 2, 0
.L08094FF4: .4byte gUnk_086900F8
.L08094FF8:
	str r7, [sp]
	movs r0, #4
	adds r1, r4, #0
	movs r2, #0x48
	ldr r3, .L0809502C @ =gUnk_086900F0
	bl PutSpriteExt
	str r7, [sp]
	movs r0, #4
	adds r1, r6, #0
	movs r2, #0x48
	ldr r3, .L08095030 @ =gUnk_08690100
	bl PutSpriteExt
.L08095014:
	adds r6, #8
	subs r4, #8
	adds r5, #1
	cmp r5, r8
	blt .L08094FCE
.L0809501E:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0809502C: .4byte gUnk_086900F0
.L08095030: .4byte gUnk_08690100

	thumb_func_start func_fe6_08095034
func_fe6_08095034: @ 0x08095034
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov r8, r1
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	mov sb, r2
	movs r0, #0xe0
	lsls r0, r0, #8
	mov sl, r0
	cmp r5, #0
	beq .L08095060
	movs r1, #0xf0
	lsls r1, r1, #8
	mov sl, r1
.L08095060:
	movs r4, #0
	ldr r6, .L080950F0 @ =gPal
	movs r7, #0xf8
	lsls r7, r7, #2
	adds r3, r6, r7
	lsls r2, r5, #0x10
	movs r0, #0xf0
	lsls r0, r0, #1
	mov ip, r0
.L08095072:
	adds r0, r5, r4
	movs r1, #0xf
	cmp r0, #0xf
	bgt .L0809507C
	lsrs r1, r2, #0x10
.L0809507C:
	mov r7, ip
	adds r0, r1, r7
	lsls r0, r0, #1
	adds r0, r0, r6
	ldrh r0, [r0]
	strh r0, [r3]
	adds r3, #2
	movs r0, #0x80
	lsls r0, r0, #9
	adds r2, r2, r0
	adds r4, #1
	cmp r4, #0xf
	ble .L08095072
	bl EnablePalSync
	movs r4, #0
	mov r1, r8
	lsls r0, r1, #5
	subs r0, #0x88
	ldr r6, .L080950F4 @ =gUnk_086900BC
	rsbs r5, r0, #0
.L080950A6:
	mov r0, sb
	asrs r0, r4
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq .L080950C8
	ldr r1, .L080950F8 @ =0x000001FF
	ands r1, r5
	ldr r3, [r6]
	movs r0, #0xf0
	lsls r0, r0, #8
	str r0, [sp]
	movs r0, #4
	movs r2, #0x50
	bl PutSpriteExt
	adds r5, #0x20
.L080950C8:
	adds r6, #4
	adds r4, #1
	cmp r4, #7
	ble .L080950A6
	ldr r3, .L080950FC @ =gUnk_086900DC
	mov r7, sl
	str r7, [sp]
	movs r0, #4
	movs r1, #0x90
	movs r2, #0x50
	bl PutSpriteExt
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L080950F0: .4byte gPal
.L080950F4: .4byte gUnk_086900BC
.L080950F8: .4byte 0x000001FF
.L080950FC: .4byte gUnk_086900DC

	thumb_func_start func_fe6_08095100
func_fe6_08095100: @ 0x08095100
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2a]
	adds r0, #1
	adds r1, r0, #0
	strh r0, [r4, #0x2a]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xd
	bhi .L08095120
	lsls r0, r1, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0
	bl func_fe6_08094F94
	b .L08095132
.L08095120:
	movs r0, #0xe
	movs r1, #0
	bl func_fe6_08094F94
	movs r0, #0
	strh r0, [r4, #0x2a]
	adds r0, r4, #0
	bl Proc_Break
.L08095132:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start func_fe6_08095138
func_fe6_08095138: @ 0x08095138
	push {r4, r5, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2a]
	adds r0, #1
	adds r1, r0, #0
	strh r0, [r4, #0x2a]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x10
	bls .L08095156
	movs r5, #0
	adds r0, r4, #0
	bl Proc_Break
	b .L0809515E
.L08095156:
	movs r0, #0x10
	subs r0, r0, r1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
.L0809515E:
	movs r0, #0xe
	movs r1, #0
	bl func_fe6_08094F94
	adds r0, r4, #0
	adds r0, #0x2d
	ldrb r1, [r0]
	adds r0, #1
	ldrb r2, [r0]
	adds r0, r5, #0
	bl func_fe6_08095034
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start func_fe6_0809517C
func_fe6_0809517C: @ 0x0809517C
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0xe
	movs r1, #0
	bl func_fe6_08094F94
	adds r0, r4, #0
	adds r0, #0x2d
	ldrb r1, [r0]
	adds r0, #1
	ldrb r2, [r0]
	movs r0, #0
	bl func_fe6_08095034
	movs r0, #0
	strh r0, [r4, #0x2a]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_fe6_080951A4
func_fe6_080951A4: @ 0x080951A4
	push {lr}
	adds r2, r0, #0
	ldrh r0, [r2, #0x2a]
	adds r0, #1
	strh r0, [r2, #0x2a]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x11
	cmp r0, #0x10
	bls .L080951BE
	adds r0, r2, #0
	bl Proc_Break
	b .L080951D8
.L080951BE:
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, r2, #0
	adds r1, #0x2d
	ldrb r1, [r1]
	adds r2, #0x2e
	ldrb r2, [r2]
	bl func_fe6_08095034
	movs r0, #0xe
	movs r1, #1
	bl func_fe6_08094F94
.L080951D8:
	pop {r0}
	bx r0

	thumb_func_start func_fe6_080951DC
func_fe6_080951DC: @ 0x080951DC
	push {r4, lr}
	adds r2, r0, #0
	lsls r4, r1, #0x18
	lsrs r4, r4, #0x18
	ldr r0, .L080951F8 @ =gUnk_0868FF84
	adds r1, r2, #0
	bl SpawnProc
	adds r1, r0, #0
	adds r1, #0x2c
	strb r4, [r1]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
.L080951F8: .4byte gUnk_0868FF84

	thumb_func_start func_fe6_080951FC
func_fe6_080951FC: @ 0x080951FC
	ldr r0, .L08095224 @ =0x04000006
	ldrh r0, [r0]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x6d
	bhi .L08095234
	ldr r3, .L08095228 @ =0x04000008
	ldrh r2, [r3]
	ldr r1, .L0809522C @ =0x0000FFFC
	adds r0, r1, #0
	ands r0, r2
	adds r0, #2
	strh r0, [r3]
	ldr r2, .L08095230 @ =0x0400000C
	ldrh r0, [r2]
	ands r1, r0
	adds r1, #2
	b .L0809524A
	.align 2, 0
.L08095224: .4byte 0x04000006
.L08095228: .4byte 0x04000008
.L0809522C: .4byte 0x0000FFFC
.L08095230: .4byte 0x0400000C
.L08095234:
	ldr r3, .L08095250 @ =0x04000008
	ldrh r2, [r3]
	ldr r1, .L08095254 @ =0x0000FFFC
	adds r0, r1, #0
	ands r0, r2
	adds r0, #1
	strh r0, [r3]
	ldr r2, .L08095258 @ =0x0400000C
	ldrh r0, [r2]
	ands r1, r0
	adds r1, #1
.L0809524A:
	strh r1, [r2]
	bx lr
	.align 2, 0
.L08095250: .4byte 0x04000008
.L08095254: .4byte 0x0000FFFC
.L08095258: .4byte 0x0400000C

	thumb_func_start func_fe6_0809525C
func_fe6_0809525C: @ 0x0809525C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r0, .L08095328 @ =gDispIo
	mov ip, r0
	mov r2, ip
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	mov r1, ip
	adds r1, #0x44
	movs r2, #0
	movs r3, #0x10
	mov r8, r3
	movs r0, #0x10
	strb r0, [r1]
	adds r1, #1
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x46
	strb r2, [r0]
	ldr r0, .L0809532C @ =0x0000FFE0
	mov r1, ip
	ldrh r1, [r1, #0x3c]
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	ldr r1, .L08095330 @ =0x0000E0FF
	ands r0, r1
	movs r3, #0xe0
	lsls r3, r3, #5
	adds r1, r3, #0
	orrs r0, r1
	mov r1, ip
	strh r0, [r1, #0x3c]
	movs r5, #0x20
	ldrb r0, [r1, #1]
	orrs r0, r5
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	mov r3, ip
	strb r0, [r3, #1]
	mov r0, ip
	adds r0, #0x2d
	strb r2, [r0]
	adds r0, #4
	strb r2, [r0]
	mov r1, ip
	adds r1, #0x2c
	movs r0, #0xf0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0xa0
	strb r0, [r1]
	mov r6, ip
	adds r6, #0x34
	movs r0, #1
	ldrb r1, [r6]
	orrs r1, r0
	movs r2, #2
	orrs r1, r2
	movs r4, #4
	orrs r1, r4
	movs r3, #8
	orrs r1, r3
	mov r2, r8
	orrs r1, r2
	mov r7, ip
	adds r7, #0x36
	ldrb r2, [r7]
	orrs r0, r2
	movs r2, #3
	rsbs r2, r2, #0
	ands r0, r2
	orrs r0, r4
	orrs r0, r3
	mov r3, r8
	orrs r0, r3
	orrs r1, r5
	strb r1, [r6]
	movs r1, #0x21
	rsbs r1, r1, #0
	ands r0, r1
	strb r0, [r7]
	mov r0, ip
	adds r0, #0x3d
	ldrb r1, [r0]
	orrs r5, r1
	strb r5, [r0]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08095328: .4byte gDispIo
.L0809532C: .4byte 0x0000FFE0
.L08095330: .4byte 0x0000E0FF

	thumb_func_start func_fe6_08095334
func_fe6_08095334: @ 0x08095334
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x38
	adds r7, r0, #0
	movs r0, #0
	str r0, [sp, #0x1c]
	add r1, sp, #4
	ldr r0, .L08095358 @ =gUnk_0835C80C
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldm r0!, {r2, r3, r6}
	stm r1!, {r2, r3, r6}
	movs r6, #4
	ldr r4, .L0809535C @ =gUnk_08690A99
	b .L08095362
	.align 2, 0
.L08095358: .4byte gUnk_0835C80C
.L0809535C: .4byte gUnk_08690A99
.L08095360:
	adds r6, #1
.L08095362:
	movs r0, #0x31
	adds r0, r0, r7
	mov sl, r0
	cmp r6, #7
	bgt .L08095384
	ldrb r1, [r0]
	adds r0, r1, r4
	ldrb r0, [r0]
	bl GetJInfo
	adds r0, #0x28
	adds r0, r0, r6
	ldrb r0, [r0]
	cmp r0, #0
	beq .L08095360
	movs r2, #1
	str r2, [sp, #0x1c]
.L08095384:
	movs r0, #0
	strh r0, [r7, #0x2a]
	strh r0, [r7, #0x2c]
	strh r0, [r7, #0x2e]
	adds r1, r7, #0
	adds r1, #0x3e
	movs r0, #1
	strb r0, [r1]
	adds r1, #6
	movs r0, #0xfa
	strb r0, [r1]
	ldr r0, .L080953EC @ =gBg0Tm
	movs r1, #0
	bl TmFill
	ldr r0, .L080953F0 @ =gBg1Tm
	movs r1, #0
	bl TmFill
	ldr r0, .L080953F4 @ =gBg2Tm
	movs r1, #0
	bl TmFill
	mov r3, sl
	ldrb r0, [r3]
	cmp r0, #0
	bne .L08095400
	strh r0, [r7, #0x2e]
	ldr r4, .L080953F8 @ =gUnk_086905F8
	mov r8, r4
	adds r5, r7, #0
	adds r5, #0x30
	ldr r4, .L080953FC @ =gDispIo
	adds r6, r7, #0
	adds r6, #0x38
	str r6, [sp, #0x24]
	movs r0, #0x39
	adds r0, r0, r7
	mov sb, r0
	adds r1, r7, #0
	adds r1, #0x3a
	str r1, [sp, #0x28]
	adds r2, r7, #0
	adds r2, #0x3b
	str r2, [sp, #0x2c]
	adds r3, r7, #0
	adds r3, #0x3c
	str r3, [sp, #0x30]
	adds r6, #5
	str r6, [sp, #0x34]
	b .L08095448
	.align 2, 0
.L080953EC: .4byte gBg0Tm
.L080953F0: .4byte gBg1Tm
.L080953F4: .4byte gBg2Tm
.L080953F8: .4byte gUnk_086905F8
.L080953FC: .4byte gDispIo
.L08095400:
	movs r6, #0
	movs r2, #0
	ldr r0, .L080955E8 @ =gUnk_086905F8
	mov r8, r0
	adds r5, r7, #0
	adds r5, #0x30
	ldr r4, .L080955EC @ =gDispIo
	adds r1, r7, #0
	adds r1, #0x38
	str r1, [sp, #0x24]
	movs r3, #0x39
	adds r3, r3, r7
	mov sb, r3
	adds r0, r7, #0
	adds r0, #0x3a
	str r0, [sp, #0x28]
	adds r1, #3
	str r1, [sp, #0x2c]
	adds r3, r7, #0
	adds r3, #0x3c
	str r3, [sp, #0x30]
	adds r0, #3
	str r0, [sp, #0x34]
	mov r3, sl
	mov r1, r8
.L08095432:
	adds r1, #4
	adds r6, #1
	ldrb r0, [r1, #1]
	cmp r0, #0
	bne .L08095432
	adds r2, #1
	ldrb r0, [r3]
	cmp r2, r0
	bne .L08095432
	adds r0, r6, #1
	strh r0, [r7, #0x2e]
.L08095448:
	ldrh r1, [r7, #0x2e]
	lsls r0, r1, #2
	add r0, r8
	ldrb r0, [r0]
	strb r0, [r5]
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r2, [r4, #1]
	ands r0, r2
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #2
	ands r0, r1
	subs r1, #4
	ands r0, r1
	subs r1, #8
	ands r0, r1
	strb r0, [r4, #1]
	bl ResetTextFont
	bl ResetText
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r3, [r4, #0xc]
	ands r0, r3
	movs r2, #2
	orrs r0, r2
	strb r0, [r4, #0xc]
	adds r0, r1, #0
	ldrb r6, [r4, #0x10]
	ands r0, r6
	orrs r0, r2
	strb r0, [r4, #0x10]
	ldrb r0, [r4, #0x14]
	ands r1, r0
	orrs r1, r2
	strb r1, [r4, #0x14]
	movs r0, #3
	ldrb r1, [r4, #0x18]
	orrs r0, r1
	strb r0, [r4, #0x18]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r4, .L080955F0 @ =gUnk_0831B0A8
	movs r0, #3
	bl GetBgChrOffset
	adds r1, r0, #0
	movs r5, #0xc0
	lsls r5, r5, #0x13
	adds r1, r1, r5
	adds r0, r4, #0
	bl Decompress
	ldr r0, .L080955F4 @ =gUnk_0835AB08
	movs r1, #0xa0
	lsls r1, r1, #1
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, .L080955F8 @ =gBg3Tm
	ldr r1, .L080955FC @ =gUnk_0835AB28
	movs r2, #0xa0
	lsls r2, r2, #8
	bl TmApplyTsa_thm
	ldr r4, .L08095600 @ =gUnk_0835A3E8
	movs r0, #2
	bl GetBgChrOffset
	adds r1, r0, #0
	adds r1, r1, r5
	adds r0, r4, #0
	bl Decompress
	ldr r0, .L08095604 @ =gUnk_0835A5D0
	movs r1, #0x90
	lsls r1, r1, #1
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, .L08095608 @ =gBg2Tm
	ldr r1, .L0809560C @ =gUnk_0835A5F0
	movs r2, #0x90
	lsls r2, r2, #8
	bl TmApplyTsa_thm
	movs r0, #0xf
	bl EnableBgSync
	ldr r5, .L08095610 @ =gBg0Tm
	adds r0, r5, #0
	movs r1, #0
	bl TmFill
	ldr r4, .L08095614 @ =gUnk_08690A99
	mov r2, sl
	ldrb r2, [r2]
	adds r0, r2, r4
	ldrb r0, [r0]
	bl GetJInfo
	ldrb r0, [r0, #0xb]
	ldr r3, [sp, #0x24]
	strb r0, [r3]
	mov r6, sl
	ldrb r6, [r6]
	adds r0, r6, r4
	ldrb r0, [r0]
	bl GetJInfo
	ldrb r0, [r0, #0xc]
	mov r1, sb
	strb r0, [r1]
	mov r2, sl
	ldrb r2, [r2]
	adds r0, r2, r4
	ldrb r0, [r0]
	bl GetJInfo
	ldrb r0, [r0, #0xd]
	ldr r3, [sp, #0x28]
	strb r0, [r3]
	mov r6, sl
	ldrb r6, [r6]
	adds r0, r6, r4
	ldrb r0, [r0]
	bl GetJInfo
	ldrb r0, [r0, #0xe]
	ldr r1, [sp, #0x2c]
	strb r0, [r1]
	mov r2, sl
	ldrb r2, [r2]
	adds r0, r2, r4
	ldrb r0, [r0]
	bl GetJInfo
	ldrb r0, [r0, #0xf]
	ldr r3, [sp, #0x30]
	strb r0, [r3]
	mov r6, sl
	ldrb r6, [r6]
	adds r4, r6, r4
	ldrb r0, [r4]
	bl GetJInfo
	ldrb r0, [r0, #0x10]
	ldr r1, [sp, #0x34]
	strb r0, [r1]
	movs r6, #0
	ldr r2, .L08095618 @ =0x0200FF24
	str r2, [sp, #0x20]
	movs r3, #0x4a
	adds r3, r3, r5
	mov sb, r3
	adds r5, #0x42
	mov r8, r5
	adds r4, r2, #0
	add r5, sp, #4
.L080955B2:
	adds r0, r4, #0
	movs r1, #3
	bl InitText
	adds r0, r4, #0
	bl ClearText
	adds r0, r4, #0
	movs r1, #3
	bl Text_SetColor
	adds r0, r4, #0
	movs r1, #0
	bl Text_SetCursor
	ldr r0, [sp, #0x1c]
	cmp r0, #0
	beq .L08095620
	cmp r6, #1
	bne .L08095620
	ldr r0, [sp, #0x20]
	adds r0, #8
	ldr r1, .L0809561C @ =gUnk_0835C824
	bl Text_DrawString
	b .L08095628
	.align 2, 0
.L080955E8: .4byte gUnk_086905F8
.L080955EC: .4byte gDispIo
.L080955F0: .4byte gUnk_0831B0A8
.L080955F4: .4byte gUnk_0835AB08
.L080955F8: .4byte gBg3Tm
.L080955FC: .4byte gUnk_0835AB28
.L08095600: .4byte gUnk_0835A3E8
.L08095604: .4byte gUnk_0835A5D0
.L08095608: .4byte gBg2Tm
.L0809560C: .4byte gUnk_0835A5F0
.L08095610: .4byte gBg0Tm
.L08095614: .4byte gUnk_08690A99
.L08095618: .4byte 0x0200FF24
.L0809561C: .4byte gUnk_0835C824
.L08095620:
	ldr r1, [r5]
	adds r0, r4, #0
	bl Text_DrawString
.L08095628:
	adds r0, r4, #0
	mov r1, r8
	bl PutText
	ldr r1, [sp, #0x24]
	adds r0, r1, r6
	ldrb r2, [r0]
	mov r0, sb
	movs r1, #0
	bl PutNumber
	movs r2, #0x80
	add sb, r2
	add r8, r2
	adds r4, #8
	adds r5, #4
	adds r6, #1
	cmp r6, #5
	ble .L080955B2
	movs r5, #0
	adds r0, r7, #0
	bl func_fe6_08095D2C
	str r0, [r7, #0x40]
	movs r0, #0x80
	lsls r0, r0, #1
	movs r1, #2
	movs r2, #0
	bl InitTalk
	bl SetInitTalkTextFont
	bl ClearTalkText
	bl EndTalk
	ldr r1, .L08095800 @ =gUnk_086905B0
	mov r3, sl
	ldrb r3, [r3]
	lsls r0, r3, #1
	adds r0, r0, r1
	ldrh r2, [r0]
	movs r0, #2
	movs r1, #0xf
	bl StartTalkMsg
	movs r0, #0
	bl SetTalkPrintColor
	movs r0, #1
	bl SetTalkFlag
	movs r0, #2
	bl SetTalkFlag
	movs r0, #4
	bl SetTalkFlag
	movs r0, #8
	bl SetTalkFlag
	movs r0, #0x40
	bl SetTalkFlag
	movs r0, #4
	bl SetTalkPrintDelay
	ldr r0, .L08095804 @ =0x02000400
	movs r2, #0
	movs r1, #0x82
	lsls r1, r1, #1
	strh r1, [r0, #2]
	movs r1, #0x58
	strh r1, [r0, #4]
	ldr r1, .L08095808 @ =gUnk_0869058C
	mov r4, sl
	ldrb r4, [r4]
	adds r1, r4, r1
	ldrb r1, [r1]
	strh r1, [r0, #6]
	movs r1, #6
	strh r1, [r0, #8]
	strb r2, [r0, #1]
	movs r4, #1
	strh r4, [r0, #0xa]
	movs r1, #0xc0
	lsls r1, r1, #1
	strh r1, [r0, #0xc]
	movs r1, #2
	strh r1, [r0, #0xe]
	ldr r1, .L0809580C @ =0x02000434
	str r1, [r0, #0x18]
	ldr r1, .L08095810 @ =0x02002434
	str r1, [r0, #0x20]
	ldr r1, .L08095814 @ =0x02007C34
	str r1, [r0, #0x1c]
	ldr r1, .L08095818 @ =0x02007CD4
	str r1, [r0, #0x24]
	ldr r2, .L0809581C @ =0x0200A6D4
	str r2, [r0, #0x2c]
	ldr r3, .L08095820 @ =gUnk_086909A4
	mov r6, sl
	ldrb r6, [r6]
	lsls r1, r6, #2
	mov r7, sl
	ldrb r7, [r7]
	adds r1, r1, r7
	adds r1, r1, r3
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	strh r1, [r2]
	mov r6, sl
	ldrb r6, [r6]
	lsls r1, r6, #2
	mov r7, sl
	ldrb r7, [r7]
	adds r1, r1, r7
	adds r1, #1
	adds r1, r1, r3
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	strh r1, [r2, #2]
	mov r6, sl
	ldrb r6, [r6]
	lsls r1, r6, #2
	mov r7, sl
	ldrb r7, [r7]
	adds r1, r1, r7
	adds r1, #2
	adds r1, r1, r3
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	strh r1, [r2, #4]
	mov r6, sl
	ldrb r6, [r6]
	lsls r1, r6, #2
	mov r7, sl
	ldrb r7, [r7]
	adds r1, r1, r7
	adds r1, #3
	adds r1, r1, r3
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	strh r1, [r2, #6]
	mov r6, sl
	ldrb r6, [r6]
	lsls r1, r6, #2
	mov r7, sl
	ldrb r7, [r7]
	adds r1, r1, r7
	adds r1, #4
	adds r1, r1, r3
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	strh r1, [r2, #8]
	movs r1, #0xa0
	lsls r1, r1, #2
	strh r1, [r2, #0xe]
	movs r3, #0xf
	strh r3, [r2, #0x10]
	subs r1, #0x80
	strh r1, [r2, #0xa]
	strh r3, [r2, #0xc]
	strh r4, [r2, #0x12]
	ldr r1, .L08095824 @ =gBg1Tm
	str r1, [r2, #0x14]
	ldr r1, .L08095828 @ =0x0200A6FC
	str r1, [r2, #0x18]
	ldr r1, .L0809582C @ =0x0200C6FC
	str r1, [r2, #0x1c]
	ldr r1, .L08095830 @ =0x0200CEFC
	str r1, [r2, #0x20]
	ldr r1, .L08095834 @ =func_fe6_0809525C
	str r1, [r2, #0x24]
	bl NewEkrUnitMainMini
	ldr r4, .L08095838 @ =0x0200DEFC
	ldr r1, .L0809583C @ =gUnk_08690A53
	mov r2, sl
	ldrb r2, [r2]
	lsls r0, r2, #1
	adds r0, r0, r1
	ldrb r0, [r0]
	strh r0, [r4]
	movs r0, #0xa
	strh r0, [r4, #2]
	movs r0, #0xe0
	lsls r0, r0, #2
	strh r0, [r4, #4]
	mov r3, sl
	ldrb r3, [r3]
	lsls r0, r3, #1
	adds r1, #1
	adds r0, r0, r1
	ldrb r0, [r0]
	strh r0, [r4, #6]
	movs r0, #0xb
	strh r0, [r4, #8]
	movs r0, #0xf0
	lsls r0, r0, #2
	strh r0, [r4, #0xa]
	strh r5, [r4, #0xc]
	ldr r0, .L08095840 @ =0x0000FFFF
	strh r0, [r4, #0xe]
	ldr r0, .L08095844 @ =0x06010000
	str r0, [r4, #0x1c]
	ldr r0, .L08095848 @ =0x0200DF24
	str r0, [r4, #0x20]
	adds r0, r4, #0
	bl func_fe6_0804BF40
	movs r3, #0x98
	lsls r3, r3, #1
	movs r0, #0x68
	str r0, [sp]
	adds r0, r4, #0
	movs r1, #0xd0
	movs r2, #0x68
	bl func_fe6_0804C318
	ldr r0, .L0809584C @ =func_fe6_080951FC
	bl SetOnHBlankA
	add sp, #0x38
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08095800: .4byte gUnk_086905B0
.L08095804: .4byte 0x02000400
.L08095808: .4byte gUnk_0869058C
.L0809580C: .4byte 0x02000434
.L08095810: .4byte 0x02002434
.L08095814: .4byte 0x02007C34
.L08095818: .4byte 0x02007CD4
.L0809581C: .4byte 0x0200A6D4
.L08095820: .4byte gUnk_086909A4
.L08095824: .4byte gBg1Tm
.L08095828: .4byte 0x0200A6FC
.L0809582C: .4byte 0x0200C6FC
.L08095830: .4byte 0x0200CEFC
.L08095834: .4byte func_fe6_0809525C
.L08095838: .4byte 0x0200DEFC
.L0809583C: .4byte gUnk_08690A53
.L08095840: .4byte 0x0000FFFF
.L08095844: .4byte 0x06010000
.L08095848: .4byte 0x0200DF24
.L0809584C: .4byte func_fe6_080951FC

	thumb_func_start func_fe6_08095850
func_fe6_08095850: @ 0x08095850
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r7, r0, #0
	adds r5, r7, #0
	adds r5, #0x44
	movs r0, #0x50
	ldrh r1, [r7, #0x2a]
	subs r0, r0, r1
	movs r1, #0xe
	bl __divsi3
	adds r0, #1
	ldrb r1, [r5]
	subs r0, r1, r0
	strb r0, [r5]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xb3
	bhi .L08095882
	movs r0, #0xb4
	strb r0, [r5]
.L08095882:
	ldr r0, .L08095934 @ =gDispIo
	mov ip, r0
	movs r2, #1
	ldrb r0, [r0, #1]
	orrs r0, r2
	movs r1, #2
	mov r8, r1
	mov r1, r8
	orrs r0, r1
	movs r1, #4
	mov sl, r1
	mov r1, sl
	orrs r0, r1
	movs r1, #8
	mov sb, r1
	mov r1, sb
	orrs r0, r1
	movs r4, #0x10
	orrs r0, r4
	movs r1, #0x20
	orrs r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	mov r1, ip
	strb r0, [r1, #1]
	mov r0, ip
	adds r0, #0x2d
	movs r1, #0
	strb r1, [r0]
	ldrh r6, [r7, #0x2a]
	adds r1, r6, #0
	movs r0, #0x50
	subs r0, r0, r1
	mov r3, ip
	adds r3, #0x31
	strb r0, [r3]
	subs r3, #5
	movs r0, #0xf0
	strb r0, [r3]
	adds r1, #0x50
	mov r0, ip
	adds r0, #0x30
	strb r1, [r0]
	adds r0, #4
	ldrb r1, [r0]
	orrs r2, r1
	mov r1, r8
	orrs r2, r1
	mov r1, sl
	orrs r2, r1
	mov r1, sb
	orrs r2, r1
	orrs r2, r4
	strb r2, [r0]
	mov r2, ip
	adds r2, #0x36
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r1, [r2]
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
	strb r0, [r2]
	lsls r0, r6, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x50
	bne .L08095938
	movs r0, #0xb4
	strb r0, [r5]
	movs r0, #0
	strh r0, [r7, #0x2a]
	adds r0, r7, #0
	bl Proc_Break
	ldr r0, [r7, #0x40]
	bl func_fe6_08095D48
	b .L0809593C
	.align 2, 0
.L08095934: .4byte gDispIo
.L08095938:
	adds r0, r6, #4
	strh r0, [r7, #0x2a]
.L0809593C:
	ldr r0, .L08095974 @ =0x02000400
	adds r4, r7, #0
	adds r4, #0x44
	ldrb r1, [r4]
	movs r2, #0x58
	bl func_fe6_0804BE20
	ldr r0, .L08095978 @ =0x0200DEFC
	ldrb r3, [r4]
	adds r1, r3, #0
	subs r1, #0x30
	adds r3, #0x30
	movs r2, #0x68
	str r2, [sp]
	bl func_fe6_0804C318
	ldr r0, [r7, #0x40]
	movs r1, #0x78
	bl func_fe6_08095D40
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08095974: .4byte 0x02000400
.L08095978: .4byte 0x0200DEFC

	thumb_func_start func_fe6_0809597C
func_fe6_0809597C: @ 0x0809597C
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	movs r6, #0
	ldrh r1, [r4, #0x2c]
	ldr r0, .L08095994 @ =0x0000018F
	cmp r1, r0
	bls .L08095998
	ldr r0, [r4, #0x34]
	adds r0, #0x2c
	movs r1, #2
	strb r1, [r0]
	b .L080959E8
	.align 2, 0
.L08095994: .4byte 0x0000018F
.L08095998:
	ldrh r2, [r4, #0x2a]
	adds r2, #1
	strh r2, [r4, #0x2a]
	adds r0, r1, #1
	strh r0, [r4, #0x2c]
	ldr r1, .L08095A18 @ =gUnk_086905F8
	ldrh r3, [r4, #0x2e]
	lsls r0, r3, #2
	adds r1, r0, r1
	ldrb r0, [r1, #1]
	cmp r0, #0
	beq .L080959E8
	adds r1, r0, #0
	lsls r0, r2, #0x10
	lsrs r0, r0, #0x10
	cmp r0, r1
	bhi .L080959EC
	cmp r1, #0xff
	bne .L080959E8
	adds r5, r4, #0
	adds r5, #0x3e
	ldrb r0, [r5]
	cmp r0, #0
	beq .L080959DA
	ldr r0, .L08095A1C @ =0x02000400
	bl func_fe6_0804BE4C
	lsls r0, r0, #0x18
	cmp r0, #0
	bne .L080959EC
	ldrb r0, [r5]
	cmp r0, #0
	bne .L080959E8
.L080959DA:
	ldr r0, .L08095A1C @ =0x02000400
	bl func_fe6_0804BE80
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L080959E8
	movs r6, #1
.L080959E8:
	cmp r6, #0
	beq .L08095A62
.L080959EC:
	ldrh r0, [r4, #0x2e]
	adds r0, #1
	strh r0, [r4, #0x2e]
	ldr r7, .L08095A18 @ =gUnk_086905F8
	lsls r0, r0, #2
	adds r1, r0, r7
	ldrb r0, [r1, #1]
	cmp r0, #0
	beq .L08095A62
	ldrb r2, [r1]
	cmp r2, #0xff
	bne .L08095A20
	ldr r0, .L08095A1C @ =0x02000400
	bl func_fe6_0804BE6C
	adds r1, r4, #0
	adds r1, #0x3e
	movs r0, #0
	strb r0, [r1]
	adds r6, r4, #0
	adds r6, #0x30
	b .L08095A52
	.align 2, 0
.L08095A18: .4byte gUnk_086905F8
.L08095A1C: .4byte 0x02000400
.L08095A20:
	adds r0, r4, #0
	adds r0, #0x30
	adds r6, r0, #0
	ldrb r0, [r6]
	cmp r0, r2
	beq .L08095A52
	ldr r5, .L08095A68 @ =0x02000400
	ldrb r0, [r1]
	strh r0, [r5, #8]
	adds r0, r5, #0
	bl func_fe6_0804BCC8
	ldrh r1, [r4, #0x2e]
	lsls r0, r1, #2
	adds r0, r0, r7
	ldrb r0, [r0]
	cmp r0, #4
	bne .L08095A4A
	adds r0, r5, #0
	bl func_fe6_0804BE6C
.L08095A4A:
	adds r1, r4, #0
	adds r1, #0x3e
	movs r0, #1
	strb r0, [r1]
.L08095A52:
	ldr r1, .L08095A6C @ =gUnk_086905F8
	ldrh r2, [r4, #0x2e]
	lsls r0, r2, #2
	adds r0, r0, r1
	ldrb r0, [r0]
	movs r1, #0
	strb r0, [r6]
	strh r1, [r4, #0x2a]
.L08095A62:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08095A68: .4byte 0x02000400
.L08095A6C: .4byte gUnk_086905F8

	thumb_func_start func_fe6_08095A70
func_fe6_08095A70: @ 0x08095A70
	bx lr
	.align 2, 0

	thumb_func_start func_fe6_08095A74
func_fe6_08095A74: @ 0x08095A74
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0
	bl SetOnHBlankA
	bl EndTalk
	bl func_fe6_08057F24
	ldr r0, .L08095AB0 @ =0x0200DEFC
	bl func_fe6_0804C2EC
	bl func_fe6_08057F08
	ldr r0, .L08095AB4 @ =0x02000400
	bl func_fe6_0804BF00
	ldr r0, [r4, #0x40]
	cmp r0, #0
	beq .L08095AA2
	movs r1, #4
	bl Proc_Goto
.L08095AA2:
	ldr r1, [r4, #0x34]
	movs r0, #0
	str r0, [r1, #0x38]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08095AB0: .4byte 0x0200DEFC
.L08095AB4: .4byte 0x02000400

	thumb_func_start func_fe6_08095AB8
func_fe6_08095AB8: @ 0x08095AB8
	push {r4, r5, lr}
	adds r5, r0, #0
	lsls r4, r1, #0x18
	lsrs r4, r4, #0x18
	ldr r0, .L08095ADC @ =gUnk_0868FFCC
	adds r1, r5, #0
	bl SpawnProc
	adds r2, r0, #0
	adds r2, #0x31
	movs r1, #0
	strb r4, [r2]
	str r5, [r0, #0x34]
	str r1, [r0, #0x40]
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
.L08095ADC: .4byte gUnk_0868FFCC

	thumb_func_start func_fe6_08095AE0
func_fe6_08095AE0: @ 0x08095AE0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	mov ip, r0
	ldr r0, [r0, #0x14]
	mov r1, ip
	str r0, [r1, #0x30]
	movs r1, #0
	movs r0, #0
	mov r2, ip
	strh r0, [r2, #0x2a]
	adds r2, #0x42
	strb r1, [r2]
	mov r1, ip
	adds r1, #0x43
	movs r0, #0xfa
	strb r0, [r1]
	movs r4, #0
	ldr r0, .L08095B48 @ =gUnk_08690D44
	mov sb, r0
	movs r1, #0x34
	add r1, ip
	mov r8, r1
	adds r7, r2, #0
	mov sl, sb
.L08095B16:
	lsls r0, r4, #2
	ldr r2, .L08095B4C @ =0x0200FF54
	adds r0, r0, r2
	movs r1, #0
	strb r1, [r0]
	strb r1, [r0, #1]
	mov r1, ip
	ldr r0, [r1, #0x30]
	adds r0, #0x31
	ldrb r0, [r0]
	lsls r3, r0, #2
	mov r2, sb
	adds r0, r3, r2
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne .L08095B64
	mov r0, r8
	adds r1, r0, r4
	movs r0, #0xff
	strb r0, [r1]
	b .L08095B98
	.align 2, 0
.L08095B48: .4byte gUnk_08690D44
.L08095B4C: .4byte 0x0200FF54
.L08095B50:
	mov r1, r8
	adds r0, r1, r4
	strb r5, [r0]
	ldrb r2, [r3, #6]
	ldrb r1, [r3, #5]
	subs r0, r2, r1
	ldrb r2, [r7]
	adds r0, r2, r0
	strb r0, [r7]
	b .L08095B92
.L08095B64:
	movs r5, #0
	ldr r1, .L08095BBC @ =gUnk_08690C14
	ldr r0, [r1]
	adds r6, r4, #1
	cmp r0, #0
	beq .L08095B92
	mov r2, sl
	adds r0, r3, r2
	ldr r0, [r0]
	adds r0, r0, r4
	movs r2, #0
	ldrsb r2, [r0, r2]
	adds r3, r1, #0
.L08095B7E:
	movs r0, #4
	ldrsb r0, [r3, r0]
	cmp r0, r2
	beq .L08095B50
	adds r1, #8
	adds r3, #8
	adds r5, #1
	ldr r0, [r1]
	cmp r0, #0
	bne .L08095B7E
.L08095B92:
	adds r4, r6, #0
	cmp r4, #0xd
	ble .L08095B16
.L08095B98:
	ldr r1, .L08095BC0 @ =0x06010000
	ldr r0, .L08095BC4 @ =gUnk_0835B040
	bl Decompress
	ldr r0, .L08095BC8 @ =gUnk_0835C034
	movs r1, #0xa0
	lsls r1, r1, #2
	movs r2, #0x40
	bl ApplyPaletteExt
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08095BBC: .4byte gUnk_08690C14
.L08095BC0: .4byte 0x06010000
.L08095BC4: .4byte gUnk_0835B040
.L08095BC8: .4byte gUnk_0835C034

	thumb_func_start func_fe6_08095BCC
func_fe6_08095BCC: @ 0x08095BCC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x20
	str r0, [sp, #0x10]
	ldr r1, .L08095D1C @ =gUnk_0835C829
	add r0, sp, #4
	movs r2, #0xc
	bl memcpy
	movs r0, #0
	mov sb, r0
	ldr r1, [sp, #0x10]
	adds r1, #0x42
	str r1, [sp, #0x18]
	ldr r2, [sp, #0x10]
	adds r2, #0x43
	str r2, [sp, #0x1c]
	ldr r3, [sp, #0x10]
	adds r3, #0x34
	str r3, [sp, #0x14]
.L08095BFA:
	ldr r1, [sp, #0x10]
	ldr r0, [r1, #0x30]
	adds r0, #0x38
	add r0, sb
	ldrb r0, [r0]
	mov r8, r0
	movs r7, #0
	lsrs r0, r0, #2
	movs r2, #1
	add r2, sb
	mov sl, r2
	cmp r7, r0
	bge .L08095C3E
	adds r6, r0, #0
	movs r4, #0x30
	mov r3, sb
	lsls r5, r3, #4
	adds r7, r6, #0
.L08095C1E:
	ldr r0, .L08095D20 @ =gUnk_0869006C
	ldr r3, [r0, #0xc]
	movs r0, #0xa0
	lsls r0, r0, #7
	str r0, [sp]
	movs r0, #0xd
	adds r1, r4, #0
	adds r2, r5, #0
	adds r2, #0x10
	bl PutSpriteExt
	adds r4, #8
	subs r7, #1
	cmp r7, #0
	bne .L08095C1E
	adds r7, r6, #0
.L08095C3E:
	movs r0, #3
	mov r1, r8
	ands r0, r1
	cmp r0, #0
	beq .L08095C68
	lsls r1, r7, #3
	adds r1, #0x30
	mov r3, sb
	lsls r2, r3, #4
	adds r2, #0x10
	subs r0, #1
	lsls r0, r0, #2
	ldr r3, .L08095D20 @ =gUnk_0869006C
	adds r0, r0, r3
	ldr r3, [r0]
	movs r0, #0xa0
	lsls r0, r0, #7
	str r0, [sp]
	movs r0, #0xd
	bl PutSpriteExt
.L08095C68:
	mov sb, sl
	mov r0, sb
	cmp r0, #5
	ble .L08095BFA
	movs r0, #0x78
	ldr r1, [sp, #0x18]
	ldrb r1, [r1]
	subs r0, r0, r1
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	ldr r2, [sp, #0x1c]
	ldrb r2, [r2]
	adds r7, r2, r0
	movs r3, #0
	mov sb, r3
	ldr r1, [sp, #0x14]
	ldrb r0, [r1]
	cmp r0, #0xff
	beq .L08095D00
	ldr r5, .L08095D24 @ =gUnk_08690C14
	adds r4, r1, #0
.L08095C94:
	ldrb r2, [r4]
	lsls r0, r2, #3
	adds r0, r0, r5
	movs r1, #5
	ldrsb r1, [r0, r1]
	subs r1, r7, r1
	movs r3, #7
	ldrsb r3, [r0, r3]
	movs r2, #8
	subs r2, r2, r3
	ldr r3, [r0]
	movs r0, #0xa0
	lsls r0, r0, #7
	str r0, [sp]
	movs r0, #4
	bl PutSpriteExt
	ldrb r3, [r4]
	lsls r0, r3, #3
	adds r0, r0, r5
	movs r1, #5
	ldrsb r1, [r0, r1]
	subs r1, r7, r1
	subs r1, #2
	movs r3, #7
	ldrsb r3, [r0, r3]
	movs r2, #6
	subs r2, r2, r3
	ldr r3, [r0]
	movs r0, #0x80
	lsls r0, r0, #7
	str r0, [sp]
	movs r0, #4
	bl PutSpriteExt
	ldrb r1, [r4]
	lsls r0, r1, #3
	adds r0, r0, r5
	movs r1, #6
	ldrsb r1, [r0, r1]
	ldrb r0, [r0, #5]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r1, r1, r0
	adds r7, r7, r1
	adds r4, #1
	movs r2, #1
	add sb, r2
	mov r3, sb
	cmp r3, #0xd
	bgt .L08095D00
	ldrb r0, [r4]
	cmp r0, #0xff
	bne .L08095C94
.L08095D00:
	ldr r1, [sp, #0x10]
	ldrh r0, [r1, #0x2a]
	cmp r0, #0xfe
	bhi .L08095D0C
	adds r0, #1
	strh r0, [r1, #0x2a]
.L08095D0C:
	add sp, #0x20
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08095D1C: .4byte gUnk_0835C829
.L08095D20: .4byte gUnk_0869006C
.L08095D24: .4byte gUnk_08690C14

	thumb_func_start func_fe6_08095D28
func_fe6_08095D28: @ 0x08095D28
	bx lr
	.align 2, 0

	thumb_func_start func_fe6_08095D2C
func_fe6_08095D2C: @ 0x08095D2C
	push {lr}
	adds r1, r0, #0
	ldr r0, .L08095D3C @ =gUnk_08690014
	bl SpawnProc
	pop {r1}
	bx r1
	.align 2, 0
.L08095D3C: .4byte gUnk_08690014

	thumb_func_start func_fe6_08095D40
func_fe6_08095D40: @ 0x08095D40
	adds r0, #0x43
	strb r1, [r0]
	bx lr
	.align 2, 0

	thumb_func_start func_fe6_08095D48
func_fe6_08095D48: @ 0x08095D48
	ldr r0, .L08095D54 @ =0x0200FF54
	movs r1, #0x80
	strb r1, [r0]
	movs r1, #2
	strb r1, [r0, #1]
	bx lr
	.align 2, 0
.L08095D54: .4byte 0x0200FF54

	thumb_func_start func_fe6_08095D58
func_fe6_08095D58: @ 0x08095D58
	bx lr
	.align 2, 0
