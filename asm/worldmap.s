	.include "macro.inc"

	.syntax unified

	@ https://decomp.me/scratch/WjMel
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

	thumb_func_start GetUnkStruct_030048E0
GetUnkStruct_030048E0: @ 0x08092854
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
	bl NewProc_0868C37C
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
