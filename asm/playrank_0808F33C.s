	.include "macro.inc"

	.syntax unified

	thumb_func_start func_fe6_0808FFE0
func_fe6_0808FFE0: @ 0x0808FFE0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	str r0, [sp]
	mov r8, r1
	ldr r2, .L08090050 @ =gCreditInfo
	lsls r0, r1, #1
	add r0, r8
	lsls r4, r0, #2
	adds r1, r4, r2
	ldrb r3, [r1, #8]
	lsls r0, r3, #3
	adds r5, r0, #0
	adds r5, #0x16
	ldrb r0, [r1, #9]
	adds r0, #2
	lsls r7, r0, #3
	movs r6, #0
	str r6, [sp, #8]
	movs r3, #0
	mov ip, r3
	ldr r1, .L08090054 @ =gCreditInfoDispStep
	ldrb r6, [r1]
	lsls r0, r6, #1
	adds r0, r0, r6
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r0, [r0]
	subs r0, #1
	cmp r0, #1
	bhi .L08090026
	b .L080902D0
.L08090026:
	ldr r0, [sp]
	adds r0, #0x4c
	mov r1, sp
	ldrh r1, [r1, #8]
	strh r1, [r0]
	ldr r0, .L08090058 @ =unk_02016A3F
	ldrb r0, [r0]
	cmp r0, #0
	bne .L0809003A
	b .L080902D0
.L0809003A:
	movs r6, #0
	str r6, [sp, #4]
	cmp r0, #1
	bne .L08090048
	movs r0, #0x80
	lsls r0, r0, #3
	str r0, [sp, #4]
.L08090048:
	adds r0, r2, #4
	adds r0, r4, r0
	ldr r0, [r0]
	b .L080902BA
	.align 2, 0
.L08090050: .4byte gCreditInfo
.L08090054: .4byte gCreditInfoDispStep
.L08090058: .4byte unk_02016A3F
.L0809005C:
	mov r0, sl
	subs r0, #0xa
	cmp r0, #0x24
	bls .L08090066
	b .L0809017C
.L08090066:
	lsls r0, r0, #2
	ldr r1, .L08090070 @ =.L08090074
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
.L08090070: .4byte .L08090074
.L08090074: @ jump table
	.4byte .L08090108 @ case 0
	.4byte .L0809017C @ case 1
	.4byte .L0809017C @ case 2
	.4byte .L0809017C @ case 3
	.4byte .L0809017C @ case 4
	.4byte .L0809017C @ case 5
	.4byte .L0809017C @ case 6
	.4byte .L0809017C @ case 7
	.4byte .L0809017C @ case 8
	.4byte .L0809017C @ case 9
	.4byte .L0809017C @ case 10
	.4byte .L0809017C @ case 11
	.4byte .L0809017C @ case 12
	.4byte .L0809017C @ case 13
	.4byte .L0809017C @ case 14
	.4byte .L0809017C @ case 15
	.4byte .L0809017C @ case 16
	.4byte .L0809017C @ case 17
	.4byte .L0809017C @ case 18
	.4byte .L0809017C @ case 19
	.4byte .L0809017C @ case 20
	.4byte .L0809017C @ case 21
	.4byte .L08090128 @ case 22
	.4byte .L0809017C @ case 23
	.4byte .L0809017C @ case 24
	.4byte .L0809017C @ case 25
	.4byte .L0809017C @ case 26
	.4byte .L0809017C @ case 27
	.4byte .L0809012C @ case 28
	.4byte .L0809017C @ case 29
	.4byte .L0809017C @ case 30
	.4byte .L0809017C @ case 31
	.4byte .L0809017C @ case 32
	.4byte .L0809017C @ case 33
	.4byte .L08090130 @ case 34
	.4byte .L0809017C @ case 35
	.4byte .L08090134 @ case 36
.L08090108:
	adds r7, #0x10
	ldr r1, .L08090124 @ =gCreditInfo
	mov r3, r8
	lsls r2, r3, #1
	adds r0, r2, r3
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r0, [r0, #8]
	lsls r0, r0, #3
	adds r5, r0, #0
	adds r5, #0x16
	movs r3, #0
	b .L080902A2
	.align 2, 0
.L08090124: .4byte gCreditInfo
.L08090128:
	adds r5, #7
	b .L0809029E
.L0809012C:
	movs r4, #0x1c
	b .L08090136
.L08090130:
	movs r4, #0x1a
	b .L08090136
.L08090134:
	movs r4, #0x1b
.L08090136:
	ldr r0, [sp]
	adds r1, r5, #0
	adds r2, r7, #0
	bl func_fe6_0808FF04
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, r7, #0
	ldr r6, [sp, #4]
	orrs r1, r6
	ldr r2, .L08090174 @ =Sprite_16x16
	lsls r3, r4, #1
	movs r4, #0xa8
	lsls r4, r4, #2
	adds r3, r3, r4
	movs r4, #0x80
	lsls r4, r4, #7
	orrs r3, r4
	bl PutOamHiRam
	adds r2, r5, #1
	ldr r1, .L08090178 @ =gUnk_0868BA3C
	adds r0, r1, #0
	adds r0, #0xd0
	ldrb r0, [r0]
	adds r5, r0, r2
	adds r1, #0xd2
	ldrb r3, [r1]
	mov r6, r8
	lsls r2, r6, #1
	b .L080902A2
	.align 2, 0
.L08090174: .4byte Sprite_16x16
.L08090178: .4byte gUnk_0868BA3C
.L0809017C:
	cmp r4, #0x60
	bgt .L08090214
	subs r4, #0x41
	movs r0, #0
	mov sb, r0
	cmp r4, #0xf
	ble .L0809018E
	movs r1, #0x20
	mov sb, r1
.L0809018E:
	cmp r3, #0
	beq .L080901B4
	ldr r0, .L080901B0 @ =gUnk_0868BA3C
	lsls r1, r4, #3
	adds r0, r1, r0
	ldrb r0, [r0, #1]
	adds r2, r0, r3
	movs r0, #0xff
	ands r2, r0
	adds r6, r1, #0
	cmp r2, #0x7f
	bgt .L080901C8
	movs r0, #0xf
	ands r2, r0
	asrs r0, r2, #1
	subs r5, r5, r0
	b .L080901C8
	.align 2, 0
.L080901B0: .4byte gUnk_0868BA3C
.L080901B4:
	ldr r0, .L0809020C @ =gUnk_0868BA3C
	lsls r2, r4, #3
	adds r0, r2, r0
	movs r1, #0x40
	ldrb r0, [r0, #1]
	ands r1, r0
	adds r6, r2, #0
	cmp r1, #0
	beq .L080901C8
	subs r5, #2
.L080901C8:
	adds r0, r5, #0
	mov r1, ip
	mov r2, sl
	bl func_fe6_0808FF9C
	adds r5, r0, #0
	ldr r0, [sp]
	adds r1, r5, #0
	adds r2, r7, #0
	bl func_fe6_0808FF04
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, r7, #0
	ldr r2, [sp, #4]
	orrs r1, r2
	ldr r2, .L08090210 @ =Sprite_16x16
	lsls r3, r4, #1
	movs r4, #0xa0
	lsls r4, r4, #2
	add r4, sb
	adds r3, r3, r4
	movs r4, #0x80
	lsls r4, r4, #7
	orrs r3, r4
	bl PutOamHiRam
	adds r1, r5, #1
	ldr r0, .L0809020C @ =gUnk_0868BA3C
	adds r0, r6, r0
	ldrb r3, [r0]
	adds r5, r3, r1
	ldrb r3, [r0, #2]
	b .L0809029E
	.align 2, 0
.L0809020C: .4byte gUnk_0868BA3C
.L08090210: .4byte Sprite_16x16
.L08090214:
	subs r4, #0x61
	movs r6, #0
	mov sb, r6
	cmp r4, #0xf
	ble .L08090222
	movs r0, #0x20
	mov sb, r0
.L08090222:
	cmp r3, #0
	beq .L08090248
	ldr r0, .L08090244 @ =gUnk_0868BA3C
	lsls r1, r4, #3
	adds r0, r1, r0
	ldrb r0, [r0, #4]
	adds r2, r0, r3
	movs r0, #0xff
	ands r2, r0
	adds r6, r1, #0
	cmp r2, #0x7f
	bgt .L0809025C
	movs r0, #0xf
	ands r2, r0
	asrs r0, r2, #1
	subs r5, r5, r0
	b .L0809025C
	.align 2, 0
.L08090244: .4byte gUnk_0868BA3C
.L08090248:
	ldr r0, .L080902E0 @ =gUnk_0868BA3C
	lsls r2, r4, #3
	adds r0, r2, r0
	movs r1, #0x40
	ldrb r0, [r0, #4]
	ands r1, r0
	adds r6, r2, #0
	cmp r1, #0
	beq .L0809025C
	subs r5, #2
.L0809025C:
	adds r0, r5, #0
	mov r1, ip
	mov r2, sl
	bl func_fe6_0808FF9C
	adds r5, r0, #0
	ldr r0, [sp]
	adds r1, r5, #0
	adds r2, r7, #0
	bl func_fe6_0808FF04
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, r7, #1
	ldr r2, [sp, #4]
	orrs r1, r2
	ldr r2, .L080902E4 @ =Sprite_16x16
	lsls r3, r4, #1
	movs r4, #0x80
	lsls r4, r4, #2
	add r4, sb
	adds r3, r3, r4
	movs r4, #0x80
	lsls r4, r4, #7
	orrs r3, r4
	bl PutOamHiRam
	adds r1, r5, #1
	ldr r0, .L080902E0 @ =gUnk_0868BA3C
	adds r0, r6, r0
	ldrb r3, [r0, #3]
	adds r5, r3, r1
	ldrb r3, [r0, #5]
.L0809029E:
	mov r4, r8
	lsls r2, r4, #1
.L080902A2:
	mov ip, sl
	ldr r6, [sp, #8]
	adds r6, #1
	str r6, [sp, #8]
	ldr r1, .L080902E8 @ =gCreditInfo
	mov r4, r8
	adds r0, r2, r4
	lsls r0, r0, #2
	adds r1, #4
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r6
.L080902BA:
	ldrb r4, [r0]
	mov sl, r4
	cmp r4, #0
	beq .L080902C4
	b .L0809005C
.L080902C4:
	ldr r1, .L080902EC @ =unk_02016A42
	ldrb r0, [r1]
	cmp r0, #0x13
	bhi .L080902D0
	adds r0, #1
	strb r0, [r1]
.L080902D0:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L080902E0: .4byte gUnk_0868BA3C
.L080902E4: .4byte Sprite_16x16
.L080902E8: .4byte gCreditInfo
.L080902EC: .4byte unk_02016A42

	thumb_func_start func_fe6_080902F0
func_fe6_080902F0: @ 0x080902F0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r5, r0, #0
	ldr r4, .L08090374 @ =gCreditInfo
	lsls r0, r5, #1
	adds r0, r0, r5
	lsls r0, r0, #2
	adds r0, r0, r4
	mov r8, r0
	ldrb r6, [r0, #8]
	adds r6, #1
	ldrb r1, [r0, #9]
	lsls r1, r1, #5
	mov sl, r1
	movs r0, #0
	mov sb, r0
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r0, .L08090378 @ =unk_02016A42
	mov r1, sb
	strb r1, [r0]
	cmp r5, #0
	beq .L0809035E
	subs r1, r5, #1
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	ldrb r0, [r0, #9]
	lsls r4, r0, #6
	ldr r0, .L0809037C @ =gBg0Tm
	adds r0, r4, r0
	movs r1, #0x1e
	movs r2, #2
	movs r3, #0
	bl TmFillRect_thm
	ldr r0, .L08090380 @ =gBg1Tm
	adds r4, r4, r0
	adds r0, r4, #0
	movs r1, #0x1e
	movs r2, #2
	movs r3, #0
	bl TmFillRect_thm
.L0809035E:
	movs r7, #0x81
	lsls r7, r7, #7
	mov r1, r8
	ldr r0, [r1]
	cmp r0, #0
	bne .L0809036C
	b .L080904D6
.L0809036C:
	ldr r1, .L0809037C @ =gBg0Tm
	mov r8, r1
	b .L080904CE
	.align 2, 0
.L08090374: .4byte gCreditInfo
.L08090378: .4byte unk_02016A42
.L0809037C: .4byte gBg0Tm
.L08090380: .4byte gBg1Tm
.L08090384:
	adds r0, r4, #0
	subs r0, #0xa
	cmp r0, #0x24
	bls .L0809038E
	b .L0809049C
.L0809038E:
	lsls r0, r0, #2
	ldr r1, .L0809039C @ =.L080903A0
	adds r0, r0, r1
	ldr r0, [r0]
	lsls r2, r5, #1
	mov pc, r0
	.align 2, 0
.L0809039C: .4byte .L080903A0
.L080903A0: @ jump table
	.4byte .L08090434 @ case 0
	.4byte .L0809049C @ case 1
	.4byte .L0809049C @ case 2
	.4byte .L0809049C @ case 3
	.4byte .L0809049C @ case 4
	.4byte .L0809049C @ case 5
	.4byte .L0809049C @ case 6
	.4byte .L0809049C @ case 7
	.4byte .L0809049C @ case 8
	.4byte .L0809049C @ case 9
	.4byte .L0809049C @ case 10
	.4byte .L0809049C @ case 11
	.4byte .L0809049C @ case 12
	.4byte .L0809049C @ case 13
	.4byte .L0809049C @ case 14
	.4byte .L0809049C @ case 15
	.4byte .L0809049C @ case 16
	.4byte .L0809049C @ case 17
	.4byte .L0809049C @ case 18
	.4byte .L0809049C @ case 19
	.4byte .L0809049C @ case 20
	.4byte .L0809049C @ case 21
	.4byte .L080904B4 @ case 22
	.4byte .L0809049C @ case 23
	.4byte .L0809049C @ case 24
	.4byte .L0809049C @ case 25
	.4byte .L0809049C @ case 26
	.4byte .L0809049C @ case 27
	.4byte .L08090468 @ case 28
	.4byte .L0809049C @ case 29
	.4byte .L0809049C @ case 30
	.4byte .L0809049C @ case 31
	.4byte .L0809049C @ case 32
	.4byte .L0809049C @ case 33
	.4byte .L08090494 @ case 34
	.4byte .L0809049C @ case 35
	.4byte .L08090498 @ case 36
.L08090434:
	ldr r0, .L08090460 @ =gCreditInfo
	lsls r4, r5, #1
	adds r1, r4, r5
	lsls r1, r1, #2
	adds r1, r1, r0
	ldrb r6, [r1, #8]
	adds r6, #1
	movs r0, #0
	movs r1, #0
	movs r2, #0xa
	bl SetBgOffset
	movs r0, #1
	movs r1, #0
	movs r2, #0xfe
	bl SetBgOffset
	ldr r0, .L08090464 @ =gBg1Tm
	mov r8, r0
	adds r2, r4, #0
	b .L080904B4
	.align 2, 0
.L08090460: .4byte gCreditInfo
.L08090464: .4byte gBg1Tm
.L08090468:
	lsls r2, r6, #0x10
	asrs r2, r2, #0x10
	mov r0, sl
	adds r1, r0, r2
	lsls r1, r1, #1
	add r1, r8
	adds r0, r7, #0
	adds r0, #0x1c
	strh r0, [r1]
	adds r0, #1
	strh r0, [r1, #2]
	adds r3, r1, #0
	adds r3, #0x40
	adds r0, #0x1f
	strh r0, [r3]
	adds r1, #0x42
	adds r0, #1
	strh r0, [r1]
	adds r2, #1
	lsls r2, r2, #0x10
	lsrs r6, r2, #0x10
	b .L080904B2
.L08090494:
	movs r4, #0x1a
	b .L0809049E
.L08090498:
	movs r4, #0x1b
	b .L0809049E
.L0809049C:
	subs r4, #0x41
.L0809049E:
	lsls r0, r6, #0x10
	asrs r0, r0, #0x10
	add r0, sl
	lsls r0, r0, #1
	add r0, r8
	adds r1, r7, r4
	strh r1, [r0]
	adds r0, #0x40
	adds r1, #0x20
	strh r1, [r0]
.L080904B2:
	lsls r2, r5, #1
.L080904B4:
	lsls r0, r6, #0x10
	movs r1, #0x80
	lsls r1, r1, #9
	adds r0, r0, r1
	lsrs r6, r0, #0x10
	movs r0, #1
	add sb, r0
	ldr r1, .L080904EC @ =gCreditInfo
	adds r0, r2, r5
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	add r0, sb
.L080904CE:
	ldrb r4, [r0]
	cmp r4, #0
	beq .L080904D6
	b .L08090384
.L080904D6:
	movs r0, #3
	bl EnableBgSync
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L080904EC: .4byte gCreditInfo

	thumb_func_start func_fe6_080904F0
func_fe6_080904F0: @ 0x080904F0
	adds r1, r0, #0
	adds r1, #0x64
	movs r2, #0
	strh r2, [r1]
	adds r0, #0x66
	strh r2, [r0]
	ldr r1, .L08090504 @ =unk_02016A3F
	movs r0, #1
	strb r0, [r1]
	bx lr
	.align 2, 0
.L08090504: .4byte unk_02016A3F

	thumb_func_start func_fe6_08090508
func_fe6_08090508: @ 0x08090508
	push {r4, lr}
	adds r2, r0, #0
	adds r1, r2, #0
	adds r1, #0x66
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	movs r1, #7
	ands r0, r1
	cmp r0, #0
	bne .L08090578
	adds r4, r2, #0
	adds r4, #0x64
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xf
	ble .L08090536
	adds r0, r2, #0
	bl Proc_Break
.L08090536:
	ldr r3, .L08090580 @ =gDispIo
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	ldrh r1, [r4]
	adds r0, r3, #0
	adds r0, #0x44
	strb r1, [r0]
	movs r0, #0x10
	subs r0, r0, r1
	adds r1, r3, #0
	adds r1, #0x45
	strb r0, [r1]
	adds r1, #1
	movs r0, #0
	strb r0, [r1]
	ldr r0, .L08090584 @ =0x0000FFE0
	ldrh r2, [r3, #0x3c]
	ands r0, r2
	movs r1, #3
	orrs r0, r1
	ldr r1, .L08090588 @ =0x0000E0FF
	ands r0, r1
	movs r2, #0xc0
	lsls r2, r2, #4
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r3, #0x3c]
.L08090578:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08090580: .4byte gDispIo
.L08090584: .4byte 0x0000FFE0
.L08090588: .4byte 0x0000E0FF

	thumb_func_start func_fe6_0809058C
func_fe6_0809058C: @ 0x0809058C
	push {lr}
	ldr r0, .L0809059C @ =ProcScr_0868BB3C
	movs r1, #3
	bl SpawnProc
	pop {r0}
	bx r0
	.align 2, 0
.L0809059C: .4byte ProcScr_0868BB3C

	thumb_func_start func_fe6_080905A0
func_fe6_080905A0: @ 0x080905A0
	push {r4, r5, lr}
	adds r2, r0, #0
	adds r1, r2, #0
	adds r1, #0x66
	ldrh r0, [r1]
	adds r0, #1
	movs r5, #0
	strh r0, [r1]
	movs r1, #3
	ands r0, r1
	cmp r0, #0
	bne .L080905FC
	adds r4, r2, #0
	adds r4, #0x64
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xf
	ble .L080905D4
	adds r0, r2, #0
	bl Proc_Break
	ldr r0, .L08090604 @ =unk_02016A3F
	strb r5, [r0]
.L080905D4:
	ldr r3, .L08090608 @ =gDispIo
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	ldrh r2, [r4]
	movs r0, #0x10
	subs r0, r0, r2
	adds r1, r3, #0
	adds r1, #0x44
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x45
	strb r2, [r0]
	adds r0, #1
	strb r5, [r0]
.L080905FC:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08090604: .4byte unk_02016A3F
.L08090608: .4byte gDispIo

	thumb_func_start func_fe6_0809060C
func_fe6_0809060C: @ 0x0809060C
	push {lr}
	ldr r0, .L0809061C @ =ProcScr_0868BB5C
	movs r1, #3
	bl SpawnProc
	pop {r0}
	bx r0
	.align 2, 0
.L0809061C: .4byte ProcScr_0868BB5C

	thumb_func_start EndingStepAdvance
EndingStepAdvance: @ 0x08090620
	ldr r1, .L0809062C @ =gEndingStep
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	bx lr
	.align 2, 0
.L0809062C: .4byte gEndingStep

	thumb_func_start func_fe6_08090630
func_fe6_08090630: @ 0x08090630
	movs r1, #0
	ldr r0, .L08090640 @ =gCreditInfoDispStep
	ldrb r0, [r0]
	cmp r0, #0x31
	bls .L0809063C
	movs r1, #1
.L0809063C:
	adds r0, r1, #0
	bx lr
	.align 2, 0
.L08090640: .4byte gCreditInfoDispStep

	thumb_func_start func_fe6_08090644
func_fe6_08090644: @ 0x08090644
	push {lr}
	ldr r1, .L08090658 @ =unk_02016A3F
	movs r0, #0xff
	strb r0, [r1]
	ldr r0, .L0809065C @ =gCreditInfoDispStep
	ldrb r0, [r0]
	bl func_fe6_080902F0
	pop {r0}
	bx r0
	.align 2, 0
.L08090658: .4byte unk_02016A3F
.L0809065C: .4byte gCreditInfoDispStep

	thumb_func_start func_fe6_08090660
func_fe6_08090660: @ 0x08090660
	push {lr}
	ldr r1, .L08090670 @ =gCreditInfoDispStep
	ldrb r1, [r1]
	bl func_fe6_0808FFE0
	pop {r0}
	bx r0
	.align 2, 0
.L08090670: .4byte gCreditInfoDispStep

	thumb_func_start EndingCredit_Init
EndingCredit_Init: @ 0x08090674
	push {r4, lr}
	adds r0, #0x64
	movs r4, #0
	movs r1, #0
	strh r1, [r0]
	ldr r0, .L08090704 @ =BgConf_0868BA24
	bl InitBgs
	ldr r2, .L08090708 @ =gDispIo
	movs r0, #1
	ldrb r1, [r2, #1]
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #5
	rsbs r1, r1, #0
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
	adds r0, r2, #0
	adds r0, #0x44
	strb r4, [r0]
	adds r0, #1
	strb r4, [r0]
	adds r0, #1
	strb r4, [r0]
	ldr r0, .L0809070C @ =0x0000FFE0
	ldrh r1, [r2, #0x3c]
	ands r0, r1
	ldr r1, .L08090710 @ =0x0000E0FF
	ands r0, r1
	strh r0, [r2, #0x3c]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r0, .L08090714 @ =gBg0Tm
	movs r1, #0
	bl TmFill
	ldr r0, .L08090718 @ =gBg1Tm
	movs r1, #0
	bl TmFill
	bl SetupCreditCharacterGlyphs
	ldr r0, .L0809071C @ =ProcScr_0868BB7C
	movs r1, #3
	bl SpawnProc
	movs r0, #3
	bl EnableBgSync
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08090704: .4byte BgConf_0868BA24
.L08090708: .4byte gDispIo
.L0809070C: .4byte 0x0000FFE0
.L08090710: .4byte 0x0000E0FF
.L08090714: .4byte gBg0Tm
.L08090718: .4byte gBg1Tm
.L0809071C: .4byte ProcScr_0868BB7C

	thumb_func_start EndingCredit_WaitingDisp
EndingCredit_WaitingDisp: @ 0x08090720
	push {lr}
	adds r2, r0, #0
	adds r0, #0x64
	ldrh r1, [r0]
	adds r1, #1
	strh r1, [r0]
	lsls r1, r1, #0x10
	movs r0, #0x96
	lsls r0, r0, #0x11
	cmp r1, r0
	ble .L0809073C
	adds r0, r2, #0
	bl Proc_Break
.L0809073C:
	pop {r0}
	bx r0

	thumb_func_start EndingCredit_Ending
EndingCredit_Ending: @ 0x08090740
	push {lr}
	ldr r1, .L08090760 @ =unk_02016A3F
	movs r0, #0
	strb r0, [r1]
	ldr r0, .L08090764 @ =gBg0Tm
	movs r1, #0
	bl TmFill
	movs r0, #1
	bl EnableBgSync
	ldr r0, .L08090768 @ =ProcScr_0868BB7C
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
.L08090760: .4byte unk_02016A3F
.L08090764: .4byte gBg0Tm
.L08090768: .4byte ProcScr_0868BB7C

	thumb_func_start EndingCopyRight_Init
EndingCopyRight_Init: @ 0x0809076C
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, .L08090814 @ =BgConf_0868BA24
	bl InitBgs
	adds r4, #0x4e
	movs r2, #0
	movs r0, #0x8c
	lsls r0, r0, #2
	strh r0, [r4]
	ldr r3, .L08090818 @ =gDispIo
	movs r0, #1
	ldrb r1, [r3, #1]
	orrs r0, r1
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #2
	ands r0, r1
	subs r1, #4
	ands r0, r1
	subs r1, #8
	ands r0, r1
	strb r0, [r3, #1]
	adds r1, r3, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r4, [r1]
	ands r0, r4
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x44
	strb r2, [r0]
	adds r0, #1
	strb r2, [r0]
	adds r0, #1
	strb r2, [r0]
	ldr r0, .L0809081C @ =0x0000FFE0
	ldrh r1, [r3, #0x3c]
	ands r0, r1
	ldr r1, .L08090820 @ =0x0000E0FF
	ands r0, r1
	strh r0, [r3, #0x3c]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r4, .L08090824 @ =gBg0Tm
	adds r0, r4, #0
	movs r1, #0
	bl TmFill
	ldr r0, .L08090828 @ =Pal_Ending_CopyRight
	movs r1, #0x40
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r5, .L0809082C @ =Img_Ending_CopyRight
	movs r0, #0
	bl GetBgChrOffset
	adds r1, r0, #0
	movs r0, #0xc0
	lsls r0, r0, #0x13
	adds r1, r1, r0
	adds r0, r5, #0
	bl Decompress
	movs r1, #0xa3
	lsls r1, r1, #1
	adds r4, r4, r1
	ldr r1, .L08090830 @ =Tsa_Ending_CopyRight
	movs r2, #0x80
	lsls r2, r2, #6
	adds r0, r4, #0
	bl TmApplyTsa_thm
	movs r0, #1
	bl EnableBgSync
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08090814: .4byte BgConf_0868BA24
.L08090818: .4byte gDispIo
.L0809081C: .4byte 0x0000FFE0
.L08090820: .4byte 0x0000E0FF
.L08090824: .4byte gBg0Tm
.L08090828: .4byte Pal_Ending_CopyRight
.L0809082C: .4byte Img_Ending_CopyRight
.L08090830: .4byte Tsa_Ending_CopyRight

	thumb_func_start EndingCopyRight_Loop
EndingCopyRight_Loop: @ 0x08090834
	push {lr}
	adds r2, r0, #0
	adds r1, r2, #0
	adds r1, #0x4e
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne .L0809084E
	adds r0, r2, #0
	bl Proc_Break
.L0809084E:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_fe6_08090854
func_fe6_08090854: @ 0x08090854
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r5, r1, #0
	movs r0, #0
.L0809085C:
	movs r3, #0
	adds r4, r0, #1
	lsls r1, r0, #5
	lsls r0, r0, #6
	adds r2, r0, r6
.L08090866:
	adds r0, r1, r3
	orrs r0, r5
	strh r0, [r2]
	adds r2, #2
	adds r3, #1
	cmp r3, #0x1f
	ble .L08090866
	adds r0, r4, #0
	cmp r0, #0x13
	ble .L0809085C
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start EndingStep1_End
EndingStep1_End: @ 0x08090880
	push {lr}
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r1, .L080908A0 @ =gDispIo
	adds r1, #0x3d
	movs r0, #0x21
	rsbs r0, r0, #0
	ldrb r2, [r1]
	ands r0, r2
	strb r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
.L080908A0: .4byte gDispIo

	thumb_func_start EndingStep1_Init
EndingStep1_Init: @ 0x080908A4
	push {r4, r5, r6, lr}
	adds r0, #0x64
	movs r4, #0
	movs r1, #0
	strh r1, [r0]
	ldr r0, .L080909DC @ =BgConf_0868BA24
	bl InitBgs
	ldr r3, .L080909E0 @ =gDispIo
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
	movs r0, #0xa
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x45
	strb r4, [r0]
	adds r0, #1
	strb r4, [r0]
	ldr r0, .L080909E4 @ =0x0000FFE0
	ldrh r2, [r3, #0x3c]
	ands r0, r2
	movs r1, #0x18
	orrs r0, r1
	ldr r1, .L080909E8 @ =0x0000E0FF
	ands r0, r1
	strh r0, [r3, #0x3c]
	adds r1, r3, #0
	adds r1, #0x3d
	movs r0, #0x20
	ldrb r2, [r1]
	orrs r0, r2
	strb r0, [r1]
	movs r0, #0
	movs r1, #4
	movs r2, #4
	bl SetBgOffset
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r6, .L080909EC @ =gBg0Tm
	adds r0, r6, #0
	movs r1, #0
	bl TmFill
	ldr r5, .L080909F0 @ =gBg3Tm
	adds r0, r5, #0
	movs r1, #0
	bl TmFill
	ldr r0, .L080909F4 @ =Pal_Fin
	movs r1, #0xc0
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, .L080909F8 @ =Pal_MonologueBG
	movs r1, #0x80
	movs r2, #0x40
	bl ApplyPaletteExt
	ldr r0, .L080909FC @ =gUnk_08344304
	ldr r1, .L08090A00 @ =0x06001000
	bl Decompress
	ldr r4, .L08090A04 @ =Img_MonologueBG
	movs r0, #3
	bl GetBgChrOffset
	adds r1, r0, #0
	movs r0, #0xc0
	lsls r0, r0, #0x13
	adds r1, r1, r0
	adds r0, r4, #0
	bl Decompress
	ldr r1, .L08090A08 @ =Tsa_EndingPInfoBG
	movs r2, #0x80
	lsls r2, r2, #7
	adds r0, r5, #0
	bl TmApplyTsa_thm
	movs r3, #0xc1
	lsls r3, r3, #7
	movs r2, #0
.L0809097C:
	ldr r1, .L08090A0C @ =0x00000107
	adds r0, r2, r1
	lsls r0, r0, #1
	adds r0, r0, r6
	adds r1, r3, r2
	strh r1, [r0]
	ldr r0, .L08090A10 @ =0x00000127
	adds r1, r2, r0
	lsls r1, r1, #1
	adds r1, r1, r6
	adds r0, r3, #0
	adds r0, #0x20
	adds r0, r0, r2
	strh r0, [r1]
	ldr r0, .L08090A14 @ =0x00000147
	adds r1, r2, r0
	lsls r1, r1, #1
	adds r1, r1, r6
	adds r0, r3, #0
	adds r0, #0x40
	adds r0, r0, r2
	strh r0, [r1]
	ldr r0, .L08090A18 @ =0x00000167
	adds r1, r2, r0
	lsls r1, r1, #1
	adds r1, r1, r6
	adds r0, r3, #0
	adds r0, #0x60
	adds r0, r0, r2
	strh r0, [r1]
	ldr r0, .L08090A1C @ =0x00000187
	adds r1, r2, r0
	lsls r1, r1, #1
	adds r1, r1, r6
	adds r0, r3, #0
	adds r0, #0x80
	adds r0, r0, r2
	strh r0, [r1]
	adds r2, #1
	cmp r2, #0x10
	ble .L0809097C
	movs r0, #9
	bl EnableBgSync
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L080909DC: .4byte BgConf_0868BA24
.L080909E0: .4byte gDispIo
.L080909E4: .4byte 0x0000FFE0
.L080909E8: .4byte 0x0000E0FF
.L080909EC: .4byte gBg0Tm
.L080909F0: .4byte gBg3Tm
.L080909F4: .4byte Pal_Fin
.L080909F8: .4byte Pal_MonologueBG
.L080909FC: .4byte gUnk_08344304
.L08090A00: .4byte 0x06001000
.L08090A04: .4byte Img_MonologueBG
.L08090A08: .4byte Tsa_EndingPInfoBG
.L08090A0C: .4byte 0x00000107
.L08090A10: .4byte 0x00000127
.L08090A14: .4byte 0x00000147
.L08090A18: .4byte 0x00000167
.L08090A1C: .4byte 0x00000187

	thumb_func_start EndingStep1_Loop
EndingStep1_Loop: @ 0x08090A20
	push {lr}
	adds r2, r0, #0
	adds r1, r2, #0
	adds r1, #0x64
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xf0
	ble .L08090A3C
	adds r0, r2, #0
	bl Proc_Break
.L08090A3C:
	pop {r0}
	bx r0

	thumb_func_start Fin_Init
Fin_Init: @ 0x08090A40
	push {r4, r5, r6, lr}
	adds r0, #0x64
	movs r4, #0
	movs r1, #0
	strh r1, [r0]
	ldr r0, .L08090B54 @ =BgConf_0868BA24
	bl InitBgs
	ldr r2, .L08090B58 @ =gDispIo
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
	subs r1, #8
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
	strb r4, [r0]
	adds r0, #1
	strb r4, [r0]
	adds r0, #1
	strb r4, [r0]
	ldr r0, .L08090B5C @ =0x0000FFE0
	ldrh r1, [r2, #0x3c]
	ands r0, r1
	ldr r1, .L08090B60 @ =0x0000E0FF
	ands r0, r1
	strh r0, [r2, #0x3c]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r6, .L08090B64 @ =gBg0Tm
	adds r0, r6, #0
	movs r1, #0
	bl TmFill
	ldr r5, .L08090B68 @ =gBg3Tm
	adds r0, r5, #0
	movs r1, #0
	bl TmFill
	ldr r0, .L08090B6C @ =Pal_MuralBackground
	movs r1, #0x80
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, .L08090B70 @ =Pal_Fin
	movs r1, #0xc0
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, .L08090B74 @ =Img_Fin
	ldr r1, .L08090B78 @ =0x06001000
	bl Decompress
	ldr r4, .L08090B7C @ =Img_MuralBackground
	movs r0, #3
	bl GetBgChrOffset
	adds r1, r0, #0
	movs r3, #0xc0
	lsls r3, r3, #0x13
	adds r1, r1, r3
	adds r0, r4, #0
	bl Decompress
	movs r1, #0x80
	lsls r1, r1, #7
	adds r0, r5, #0
	bl func_fe6_08090854
	movs r3, #0xc1
	lsls r3, r3, #7
	movs r2, #0
.L08090AFC:
	movs r1, #0x86
	lsls r1, r1, #1
	adds r0, r2, r1
	lsls r0, r0, #1
	adds r0, r0, r6
	adds r1, r3, r2
	strh r1, [r0]
	movs r0, #0x96
	lsls r0, r0, #1
	adds r1, r2, r0
	lsls r1, r1, #1
	adds r1, r1, r6
	adds r0, r3, #0
	adds r0, #0x20
	adds r0, r0, r2
	strh r0, [r1]
	movs r0, #0xa6
	lsls r0, r0, #1
	adds r1, r2, r0
	lsls r1, r1, #1
	adds r1, r1, r6
	adds r0, r3, #0
	adds r0, #0x40
	adds r0, r0, r2
	strh r0, [r1]
	movs r0, #0xb6
	lsls r0, r0, #1
	adds r1, r2, r0
	lsls r1, r1, #1
	adds r1, r1, r6
	adds r0, r3, #0
	adds r0, #0x60
	adds r0, r0, r2
	strh r0, [r1]
	adds r2, #1
	cmp r2, #5
	ble .L08090AFC
	movs r0, #9
	bl EnableBgSync
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08090B54: .4byte BgConf_0868BA24
.L08090B58: .4byte gDispIo
.L08090B5C: .4byte 0x0000FFE0
.L08090B60: .4byte 0x0000E0FF
.L08090B64: .4byte gBg0Tm
.L08090B68: .4byte gBg3Tm
.L08090B6C: .4byte Pal_MuralBackground
.L08090B70: .4byte Pal_Fin
.L08090B74: .4byte Img_Fin
.L08090B78: .4byte 0x06001000
.L08090B7C: .4byte Img_MuralBackground

	thumb_func_start Fin_Loop
Fin_Loop: @ 0x08090B80
	push {lr}
	adds r2, r0, #0
	adds r1, r2, #0
	adds r1, #0x64
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xf0
	ble .L08090B9C
	adds r0, r2, #0
	bl Proc_Break
.L08090B9C:
	pop {r0}
	bx r0

	thumb_func_start func_fe6_08090BA0
func_fe6_08090BA0: @ 0x08090BA0
	ldr r1, .L08090BBC @ =unk_02016A3D
	ldrb r0, [r1]
	cmp r0, #0xc
	bhi .L08090BC4
	ldr r0, .L08090BC0 @ =gUnk_0868BCE4
	ldrb r1, [r1]
	lsls r1, r1, #4
	adds r1, r1, r0
	ldr r0, [r1]
	cmp r0, #0
	beq .L08090BC4
	movs r0, #1
	b .L08090BC6
	.align 2, 0
.L08090BBC: .4byte unk_02016A3D
.L08090BC0: .4byte gUnk_0868BCE4
.L08090BC4:
	movs r0, #0
.L08090BC6:
	bx lr

	thumb_func_start func_fe6_08090BC8
func_fe6_08090BC8: @ 0x08090BC8
	push {r4, r5, lr}
	movs r5, #0
	adds r0, #0x64
	movs r4, #0
	strh r5, [r0]
	ldr r0, .L08090C48 @ =BgConf_0868BA24
	bl InitBgs
	ldr r2, .L08090C4C @ =gDispIo
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r1, [r2, #1]
	ands r0, r1
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #9
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #8
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
	strb r4, [r0]
	adds r0, #1
	strb r4, [r0]
	adds r0, #1
	strb r4, [r0]
	ldr r0, .L08090C50 @ =0x0000FFE0
	ldrh r1, [r2, #0x3c]
	ands r0, r1
	ldr r1, .L08090C54 @ =0x0000E0FF
	ands r0, r1
	strh r0, [r2, #0x3c]
	ldr r2, .L08090C58 @ =0x0000FFFC
	movs r0, #2
	movs r1, #0
	bl SetBgOffset
	ldr r0, .L08090C5C @ =gBg2Tm
	movs r1, #0
	bl TmFill
	ldr r0, .L08090C60 @ =unk_02016A3D
	ldrb r0, [r0]
	cmp r0, #0xa
	beq .L08090C64
	cmp r0, #0xa
	blt .L08090C96
	cmp r0, #0xb
	beq .L08090C74
	cmp r0, #0xc
	beq .L08090C88
	b .L08090C96
	.align 2, 0
.L08090C48: .4byte BgConf_0868BA24
.L08090C4C: .4byte gDispIo
.L08090C50: .4byte 0x0000FFE0
.L08090C54: .4byte 0x0000E0FF
.L08090C58: .4byte 0x0000FFFC
.L08090C5C: .4byte gBg2Tm
.L08090C60: .4byte unk_02016A3D
.L08090C64:
	movs r0, #0x6b
	bl CheckFlag
	movs r1, #0
	lsls r0, r0, #0x18
	cmp r0, #0
	bne .L08090C84
	b .L08090C82
.L08090C74:
	bl GetEndingId
	movs r1, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #2
	bne .L08090C84
.L08090C82:
	movs r1, #1
.L08090C84:
	adds r5, r1, #0
	b .L08090C96
.L08090C88:
	bl GetEndingId
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	rsbs r1, r0, #0
	orrs r1, r0
	lsrs r5, r1, #0x1f
.L08090C96:
	lsls r0, r5, #0x18
	adds r5, r0, #0
	cmp r5, #0
	beq .L08090CB8
	ldr r0, .L08090CB0 @ =gUnk_0868BCE4
	ldr r1, .L08090CB4 @ =unk_02016A3D
	ldrb r1, [r1]
	lsls r1, r1, #4
	adds r0, #8
	adds r1, r1, r0
	ldr r4, [r1]
	b .L08090CC4
	.align 2, 0
.L08090CB0: .4byte gUnk_0868BCE4
.L08090CB4: .4byte unk_02016A3D
.L08090CB8:
	ldr r1, .L08090CE8 @ =gUnk_0868BCE4
	ldr r0, .L08090CEC @ =unk_02016A3D
	ldrb r0, [r0]
	lsls r0, r0, #4
	adds r0, r0, r1
	ldr r4, [r0]
.L08090CC4:
	movs r0, #2
	bl GetBgChrOffset
	adds r1, r0, #0
	ldr r3, .L08090CF0 @ =0x06002800
	adds r1, r1, r3
	adds r0, r4, #0
	bl Decompress
	cmp r5, #0
	beq .L08090CF4
	ldr r0, .L08090CE8 @ =gUnk_0868BCE4
	ldr r1, .L08090CEC @ =unk_02016A3D
	ldrb r1, [r1]
	lsls r1, r1, #4
	adds r0, #0xc
	b .L08090CFE
	.align 2, 0
.L08090CE8: .4byte gUnk_0868BCE4
.L08090CEC: .4byte unk_02016A3D
.L08090CF0: .4byte 0x06002800
.L08090CF4:
	ldr r0, .L08090D24 @ =gUnk_0868BCE4
	ldr r1, .L08090D28 @ =unk_02016A3D
	ldrb r1, [r1]
	lsls r1, r1, #4
	adds r0, #4
.L08090CFE:
	adds r1, r1, r0
	ldr r0, [r1]
	movs r1, #0xc0
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, .L08090D2C @ =gBg2Tm+0x14E
	ldr r1, .L08090D30 @ =0x00006140
	movs r2, #0xf
	movs r3, #0xa
	bl PutEndingCreditTm
	movs r0, #4
	bl EnableBgSync
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08090D24: .4byte gUnk_0868BCE4
.L08090D28: .4byte unk_02016A3D
.L08090D2C: .4byte gBg2Tm+0x14E
.L08090D30: .4byte 0x00006140

	thumb_func_start func_fe6_08090D34
func_fe6_08090D34: @ 0x08090D34
	push {lr}
	adds r2, r0, #0
	adds r1, r2, #0
	adds r1, #0x64
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xf0
	ble .L08090D50
	adds r0, r2, #0
	bl Proc_Break
.L08090D50:
	pop {r0}
	bx r0

	thumb_func_start func_fe6_08090D54
func_fe6_08090D54: @ 0x08090D54
	ldr r0, .L08090D60 @ =gEndingStep
	ldrb r0, [r0]
	cmp r0, #1
	bls .L08090D64
	movs r0, #0
	b .L08090D66
	.align 2, 0
.L08090D60: .4byte gEndingStep
.L08090D64:
	movs r0, #1
.L08090D66:
	bx lr

	thumb_func_start Ending_Init
Ending_Init: @ 0x08090D68
	push {lr}
	adds r0, #0x64
	movs r1, #0
	strh r1, [r0]
	bl EndAllMus
	pop {r0}
	bx r0

	thumb_func_start Ending_Loop
Ending_Loop: @ 0x08090D78
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x64
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #7
	bls .L08090D88
	b .L08090F2A
.L08090D88:
	lsls r0, r0, #2
	ldr r1, .L08090D94 @ =.L08090D98
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
.L08090D94: .4byte .L08090D98
.L08090D98: @ jump table
	.4byte .L08090DB8 @ case 0
	.4byte .L08090E84 @ case 1
	.4byte .L08090EC0 @ case 2
	.4byte .L08090ED0 @ case 3
	.4byte .L08090EDC @ case 4
	.4byte .L08090EF2 @ case 5
	.4byte .L08090F1C @ case 6
	.4byte .L08090F24 @ case 7
.L08090DB8:
	ldr r0, .L08090DD0 @ =unk_02016A3E
	movs r1, #0
	strb r1, [r0]
	bl func_fe6_08090630
	cmp r0, #1
	bne .L08090DD4
	adds r1, r4, #0
	adds r1, #0x64
	movs r0, #2
	strh r0, [r1]
	b .L08090F2A
	.align 2, 0
.L08090DD0: .4byte unk_02016A3E
.L08090DD4:
	ldr r2, .L08090DFC @ =gCreditInfo
	ldr r1, .L08090E00 @ =gCreditInfoDispStep
	ldrb r3, [r1]
	lsls r0, r3, #1
	adds r0, r0, r3
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r0, [r0]
	cmp r0, #1
	bne .L08090E0C
	ldr r0, .L08090E04 @ =gEndingDispType
	ldrb r0, [r0]
	cmp r0, #0
	beq .L08090E68
	ldr r0, .L08090E08 @ =ProcScr_EndingStep1_PutaMonologue
	adds r1, r4, #0
	bl SpawnProcLocking
	b .L08090E68
	.align 2, 0
.L08090DFC: .4byte gCreditInfo
.L08090E00: .4byte gCreditInfoDispStep
.L08090E04: .4byte gEndingDispType
.L08090E08: .4byte ProcScr_EndingStep1_PutaMonologue
.L08090E0C:
	cmp r0, #2
	bne .L08090E60
	bl PopNextEndingPerson
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x3f
	bhi .L08090E38
	ldr r0, .L08090E30 @ =gEndingDispType
	ldrb r0, [r0]
	cmp r0, #0
	beq .L08090E38
	ldr r0, .L08090E34 @ =ProcScr_EndingPInfo_x1
	adds r1, r4, #0
	bl SpawnProcLocking
	b .L08090E4A
	.align 2, 0
.L08090E30: .4byte gEndingDispType
.L08090E34: .4byte ProcScr_EndingPInfo_x1
.L08090E38:
	bl func_fe6_08090BA0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L08090E4A
	ldr r0, .L08090E58 @ =ProcScr_0868BDB4
	adds r1, r4, #0
	bl SpawnProcLocking
.L08090E4A:
	ldr r1, .L08090E5C @ =unk_02016A3E
	movs r0, #2
	ldrb r2, [r1]
	orrs r0, r2
	strb r0, [r1]
	b .L08090E68
	.align 2, 0
.L08090E58: .4byte ProcScr_0868BDB4
.L08090E5C: .4byte unk_02016A3E
.L08090E60:
	ldr r0, .L08090E7C @ =ProcScr_EndingCredit
	adds r1, r4, #0
	bl SpawnProcLocking
.L08090E68:
	ldr r1, .L08090E80 @ =unk_02016A3E
	movs r0, #1
	ldrb r3, [r1]
	orrs r0, r3
	strb r0, [r1]
	adds r1, r4, #0
	adds r1, #0x64
	movs r0, #1
	strh r0, [r1]
	b .L08090F2A
	.align 2, 0
.L08090E7C: .4byte ProcScr_EndingCredit
.L08090E80: .4byte unk_02016A3E
.L08090E84:
	ldr r2, .L08090EB4 @ =unk_02016A3E
	movs r0, #1
	ldrb r1, [r2]
	ands r0, r1
	cmp r0, #0
	beq .L08090E98
	ldr r1, .L08090EB8 @ =gCreditInfoDispStep
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
.L08090E98:
	movs r0, #2
	ldrb r2, [r2]
	ands r0, r2
	cmp r0, #0
	beq .L08090EAA
	ldr r1, .L08090EBC @ =unk_02016A3D
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
.L08090EAA:
	adds r1, r4, #0
	adds r1, #0x64
	movs r0, #0
	strh r0, [r1]
	b .L08090F2A
	.align 2, 0
.L08090EB4: .4byte unk_02016A3E
.L08090EB8: .4byte gCreditInfoDispStep
.L08090EBC: .4byte unk_02016A3D
.L08090EC0:
	ldr r0, .L08090ECC @ =ProcScr_EndingCopyRight
.L08090EC2:
	adds r1, r4, #0
	bl SpawnProcLocking
	b .L08090F10
	.align 2, 0
.L08090ECC: .4byte ProcScr_EndingCopyRight
.L08090ED0:
	bl EndEndingBgmLooper
	ldr r0, .L08090ED8 @ =ProcScr_PlayRank
	b .L08090EC2
	.align 2, 0
.L08090ED8: .4byte ProcScr_PlayRank
.L08090EDC:
	movs r0, #0x36
	movs r1, #0
	bl StartBgm
	bl SetupEndingPInfo2Uids
	adds r1, r4, #0
	adds r1, #0x64
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
.L08090EF2:
	movs r0, #0
	bl PopNextEnding2Person
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x3f
	bhi .L08090F10
	ldr r0, .L08090F0C @ =ProcScr_EndingPInfo_x2
	adds r1, r4, #0
	bl SpawnProcLocking
	b .L08090F2A
	.align 2, 0
.L08090F0C: .4byte ProcScr_EndingPInfo_x2
.L08090F10:
	adds r1, r4, #0
	adds r1, #0x64
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	b .L08090F2A
.L08090F1C:
	ldr r0, .L08090F30 @ =ProcScr_Fin
	adds r1, r4, #0
	bl SpawnProcLocking
.L08090F24:
	adds r0, r4, #0
	bl Proc_Break
.L08090F2A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08090F30: .4byte ProcScr_Fin

	thumb_func_start StartCharacterEndings
StartCharacterEndings: @ 0x08090F34
	push {lr}
	adds r1, r0, #0
	ldr r0, .L08090F44 @ =ProcScr_Ending
	bl SpawnProcLocking
	pop {r0}
	bx r0
	.align 2, 0
.L08090F44: .4byte ProcScr_Ending

	thumb_func_start GameCredit_Loop
GameCredit_Loop: @ 0x08090F48
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, .L08090F68 @ =gCreditInfo
	ldr r3, .L08090F6C @ =gCreditInfoDispStep
	ldrb r2, [r3]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r0, [r1]
	subs r0, #1
	cmp r0, #1
	bhi .L08090F70
	adds r0, r2, #1
	strb r0, [r3]
	b .L08090FFC
	.align 2, 0
.L08090F68: .4byte gCreditInfo
.L08090F6C: .4byte gCreditInfoDispStep
.L08090F70:
	adds r0, r5, #0
	adds r0, #0x64
	movs r4, #0
	ldrsh r1, [r0, r4]
	adds r4, r0, #0
	cmp r1, #0xb4
	beq .L08090FEC
	cmp r1, #0xb4
	bgt .L08090F88
	cmp r1, #0x3c
	beq .L08090F98
	b .L08090FEC
.L08090F88:
	movs r0, #0xd2
	lsls r0, r0, #1
	cmp r1, r0
	beq .L08090FA4
	adds r0, #0x78
	cmp r1, r0
	beq .L08090FAA
	b .L08090FEC
.L08090F98:
	adds r0, r2, #0
	bl func_fe6_080902F0
	bl func_fe6_0809058C
	b .L08090FEC
.L08090FA4:
	bl func_fe6_0809060C
	b .L08090FEC
.L08090FAA:
	movs r0, #0
	strh r0, [r4]
	ldrb r0, [r3]
	adds r0, #1
	strb r0, [r3]
	ldr r0, .L08090FE0 @ =gEndingStep
	ldrb r0, [r0]
	cmp r0, #0
	beq .L08090FF2
	ldr r0, .L08090FE4 @ =gBg0Tm
	movs r1, #0
	bl TmFill
	ldr r0, .L08090FE8 @ =gBg1Tm
	movs r1, #0
	bl TmFill
	movs r0, #3
	bl EnableBgSync
	adds r0, r5, #0
	bl Proc_Break
	bl EndingStepAdvance
	b .L08090FF2
	.align 2, 0
.L08090FE0: .4byte gEndingStep
.L08090FE4: .4byte gBg0Tm
.L08090FE8: .4byte gBg1Tm
.L08090FEC:
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
.L08090FF2:
	ldr r0, .L08091004 @ =gCreditInfoDispStep
	ldrb r1, [r0]
	adds r0, r5, #0
	bl func_fe6_0808FFE0
.L08090FFC:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08091004: .4byte gCreditInfoDispStep

	thumb_func_start StartGameCredit
StartGameCredit: @ 0x08091008
	push {lr}
	ldr r0, .L08091018 @ =ProcScr_GameCredit
	movs r1, #3
	bl SpawnProc
	pop {r0}
	bx r0
	.align 2, 0
.L08091018: .4byte ProcScr_GameCredit

	thumb_func_start PersonEndingHasSupporter
PersonEndingHasSupporter: @ 0x0809101C
	push {r4, r5, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	movs r0, #1
	bl GetUnitByPid
	adds r5, r0, #0
	adds r1, r4, #0
	bl GetUnitSupportNumByPid
	adds r1, r0, #0
	adds r0, r5, #0
	bl GetUnitSupportLevel
	cmp r0, #2
	bgt .L08091042
	movs r0, #0
	b .L08091044
.L08091042:
	movs r0, #1
.L08091044:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start EndingFacePosCtrlExt
EndingFacePosCtrlExt: @ 0x0809104C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	movs r4, #1
	ldr r3, .L080910B8 @ =unk_02016B94
	ldr r2, .L080910BC @ =gPal
.L0809105A:
	lsls r1, r4, #1
	adds r1, r1, r3
	adds r0, r4, #0
	adds r0, #0x20
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r1, [r1]
	ldrh r0, [r0]
	cmp r1, r0
	beq .L080910C8
	movs r4, #0
	ldr r7, .L080910C0 @ =gPal+0x40
	ldr r0, .L080910B8 @ =unk_02016B94
	mov r8, r0
	ldr r5, .L080910C4 @ =unk_02016C94
	mov sb, r5
	mov r6, r8
.L0809107C:
	adds r0, r7, #0
	adds r1, r6, #0
	movs r2, #8
	bl CpuFastSet
	mov r0, r8
	adds r1, r4, #0
	movs r2, #1
	adds r3, r4, #0
	bl EfxPalBlackInOut
	adds r0, r7, #0
	adds r0, #0x20
	adds r1, r5, #0
	movs r2, #8
	bl CpuFastSet
	mov r0, sb
	adds r1, r4, #0
	movs r2, #1
	adds r3, r4, #0
	bl EfxPalBlackInOut
	adds r5, #0x20
	adds r6, #0x20
	adds r4, #1
	cmp r4, #7
	ble .L0809107C
	b .L080910CE
	.align 2, 0
.L080910B8: .4byte unk_02016B94
.L080910BC: .4byte gPal
.L080910C0: .4byte gPal+0x40
.L080910C4: .4byte unk_02016C94
.L080910C8:
	adds r4, #1
	cmp r4, #0xf
	ble .L0809105A
.L080910CE:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

