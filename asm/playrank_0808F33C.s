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
