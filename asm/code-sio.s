
	.include "macro.inc"

	.syntax unified

	thumb_func_start SioPollingMsg
SioPollingMsg: @ 0x080350C8
	push {r4, r5, lr}
	ldr r4, .L080350DC @ =gSioStateId
	ldr r3, [r4]
	cmp r3, #0
	beq .L080350E4
	cmp r3, #1
	beq .L08035150
	ldr r0, .L080350E0 @ =sSioId
	ldr r0, [r0]
	b .L080351DA
	.align 2, 0
.L080350DC: .4byte gSioStateId
.L080350E0: .4byte sSioId
.L080350E4:
	ldr r0, .L08035134 @ =0x04000134
	strh r3, [r0]
	ldr r2, .L08035138 @ =0x04000128
	ldr r0, .L0803513C @ =gSioSt
	ldr r0, [r0]
	ldr r1, .L08035140 @ =0x00001B78
	adds r0, r0, r1
	ldrh r0, [r0]
	mvns r0, r0
	strh r0, [r2, #2]
	ldr r1, .L08035144 @ =sSioCnt
	movs r5, #0xc0
	lsls r5, r5, #7
	adds r0, r5, #0
	ldrb r1, [r1]
	orrs r0, r1
	strh r0, [r2]
	ldrh r0, [r2]
	adds r2, r0, #0
	movs r0, #8
	ands r0, r2
	cmp r0, #0
	beq .L080351D6
	ldr r1, .L08035148 @ =sSioId
	movs r0, #4
	ands r2, r0
	lsls r0, r2, #0x10
	lsrs r0, r0, #0x10
	str r0, [r1]
	cmp r0, #0
	beq .L08035128
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r1]
.L08035128:
	ldr r0, .L0803514C @ =gUnk_030044D4
	str r3, [r0]
	movs r0, #1
	str r0, [r4]
	b .L080351D6
	.align 2, 0
.L08035134: .4byte 0x04000134
.L08035138: .4byte 0x04000128
.L0803513C: .4byte gSioSt
.L08035140: .4byte 0x00001B78
.L08035144: .4byte sSioCnt
.L08035148: .4byte sSioId
.L0803514C: .4byte gUnk_030044D4
.L08035150:
	ldr r0, .L08035184 @ =0x04000128
	ldrh r0, [r0]
	adds r2, r0, #0
	ldr r0, .L08035188 @ =gUnk_030044D4
	ldr r0, [r0]
	ldr r3, .L0803518C @ =gSioSt
	cmp r0, #0
	beq .L08035198
	movs r0, #0x40
	ands r0, r2
	cmp r0, #0
	bne .L08035198
	ldr r1, [r3]
	ldr r0, .L08035190 @ =0x0000FFFF
	ldrh r1, [r1, #0x14]
	cmp r1, r0
	beq .L08035198
	ldr r1, .L08035194 @ =sSioId
	movs r0, #0x30
	ands r2, r0
	lsrs r0, r2, #4
	str r0, [r1]
	movs r1, #2
	str r1, [r4]
	b .L080351DA
	.align 2, 0
.L08035184: .4byte 0x04000128
.L08035188: .4byte gUnk_030044D4
.L0803518C: .4byte gSioSt
.L08035190: .4byte 0x0000FFFF
.L08035194: .4byte sSioId
.L08035198:
	ldr r2, .L080351B8 @ =0x04000128
	ldr r0, [r3]
	ldr r1, .L080351BC @ =0x00001B78
	adds r0, r0, r1
	ldrh r0, [r0]
	mvns r0, r0
	strh r0, [r2, #2]
	ldr r0, .L080351C0 @ =sSioId
	ldr r0, [r0]
	cmp r0, #0
	beq .L080351C8
	ldr r1, .L080351C4 @ =sSioCnt
	movs r3, #0xc0
	lsls r3, r3, #7
	adds r0, r3, #0
	b .L080351D0
	.align 2, 0
.L080351B8: .4byte 0x04000128
.L080351BC: .4byte 0x00001B78
.L080351C0: .4byte sSioId
.L080351C4: .4byte sSioCnt
.L080351C8:
	ldr r1, .L080351E0 @ =sSioCnt
	movs r5, #0xc1
	lsls r5, r5, #7
	adds r0, r5, #0
.L080351D0:
	ldrb r1, [r1]
	orrs r0, r1
	strh r0, [r2]
.L080351D6:
	movs r0, #1
	rsbs r0, r0, #0
.L080351DA:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
.L080351E0: .4byte sSioCnt

	thumb_func_start GetSioIndex
GetSioIndex: @ 0x080351E4
	ldr r0, .L080351F0 @ =0x04000128
	ldrh r1, [r0]
	movs r0, #0x30
	ands r0, r1
	lsrs r0, r0, #4
	bx lr
	.align 2, 0
.L080351F0: .4byte 0x04000128

	thumb_func_start func_fe6_080351F4
func_fe6_080351F4: @ 0x080351F4
	push {r4, r5, lr}
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldr r3, .L0803521C @ =gSioSt
	ldr r3, [r3]
	ldr r5, .L08035220 @ =0x00001B78
	adds r4, r3, r5
	strh r0, [r4]
	ldr r4, .L08035224 @ =0x00001B7A
	adds r0, r3, r4
	strh r1, [r0]
	adds r5, #4
	adds r3, r3, r5
	strh r2, [r3]
	ldr r0, .L08035228 @ =sSioCnt
	strb r1, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0803521C: .4byte gSioSt
.L08035220: .4byte 0x00001B78
.L08035224: .4byte 0x00001B7A
.L08035228: .4byte sSioCnt

	thumb_func_start ResetSioSW
ResetSioSW: @ 0x0803522C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	ldr r0, .L0803537C @ =gUnk_030044D0
	movs r3, #0
	str r3, [r0]
	ldr r2, .L08035380 @ =gSioSt
	ldr r0, [r2]
	movs r1, #0
	strh r3, [r0, #0x22]
	strh r3, [r0, #0x24]
	ldr r4, .L08035384 @ =0x00001B74
	adds r0, r0, r4
	strb r1, [r0]
	ldr r0, [r2]
	adds r4, #1
	adds r0, r0, r4
	strb r1, [r0]
	ldr r0, [r2]
	adds r4, #1
	adds r0, r0, r4
	strb r1, [r0]
	ldr r0, [r2]
	adds r4, #1
	adds r0, r0, r4
	strb r1, [r0]
	ldr r0, [r2]
	strb r1, [r0, #0x1e]
	ldr r0, [r2]
	strb r1, [r0, #0x1f]
	ldr r0, [r2]
	adds r0, #0x20
	strb r1, [r0]
	ldr r0, [r2]
	strh r3, [r0, #0x30]
	ldr r0, .L08035388 @ =gUnk_030013C8
	mov sb, r0
	ldr r1, .L0803538C @ =gUnk_030013CA
	mov r8, r1
	adds r5, r2, #0
	movs r4, #0
.L08035280:
	ldr r0, [r5]
	adds r0, #0xb
	adds r0, r0, r3
	strb r4, [r0]
	ldr r1, [r5]
	lsls r2, r3, #1
	adds r0, r1, #0
	adds r0, #0x12
	adds r0, r0, r2
	strh r4, [r0]
	adds r1, #0x1a
	adds r1, r1, r3
	strb r4, [r1]
	ldr r0, [r5]
	adds r0, #0x26
	adds r0, r0, r2
	strh r4, [r0]
	adds r3, #1
	cmp r3, #3
	ble .L08035280
	movs r3, #0
	ldr r5, .L08035390 @ =gUnk_03004580
	movs r2, #0
	ldr r4, .L08035380 @ =gSioSt
.L080352B0:
	adds r0, r3, r5
	strb r2, [r0]
	ldr r0, [r4]
	lsls r1, r3, #1
	adds r0, #0x32
	adds r0, r0, r1
	strh r2, [r0]
	adds r3, #1
	cmp r3, #0x7f
	ble .L080352B0
	movs r4, #0
	ldr r5, .L08035380 @ =gSioSt
	movs r1, #0
	movs r2, #0x9a
	lsls r2, r2, #1
.L080352CE:
	ldr r0, [r5]
	adds r0, r0, r2
	strb r1, [r0]
	strb r1, [r0, #4]
	movs r3, #0x7f
	adds r0, #0x89
.L080352DA:
	strb r1, [r0]
	subs r0, #1
	subs r3, #1
	cmp r3, #0
	bge .L080352DA
	adds r2, #0x8c
	adds r4, #1
	cmp r4, #0x1f
	ble .L080352CE
	movs r4, #0
	ldr r2, .L08035380 @ =gSioSt
	mov ip, r2
	movs r5, #0
	movs r7, #0x8c
	ldr r6, .L08035394 @ =0x000012B4
.L080352F8:
	adds r0, r4, #0
	muls r0, r7, r0
	adds r0, r0, r6
	mov r2, ip
	ldr r1, [r2]
	adds r1, r1, r0
	strb r5, [r1]
	strb r5, [r1, #4]
	adds r2, r4, #1
	movs r3, #0x7f
	adds r1, #0x89
.L0803530E:
	strb r5, [r1]
	subs r1, #1
	subs r3, #1
	cmp r3, #0
	bge .L0803530E
	adds r4, r2, #0
	cmp r4, #0xf
	ble .L080352F8
	movs r0, #0
	mov r4, r8
	strh r0, [r4]
	mov r1, sb
	strh r0, [r1]
	movs r1, #0
	ldr r0, .L08035398 @ =gSioOutgoing
	movs r3, #0x80
	lsls r3, r3, #2
.L08035330:
	strh r1, [r0]
	adds r0, #2
	subs r3, #1
	cmp r3, #0
	bne .L08035330
	movs r4, #0
	ldr r2, .L0803539C @ =sReadCursor
	mov r8, r2
	movs r5, #0
	ldr r0, .L080353A0 @ =0x000001FF
	mov ip, r0
	ldr r7, .L080353A4 @ =gSioIncoming
	ldr r6, .L080353A8 @ =sRecvCursor
.L0803534A:
	lsls r0, r4, #1
	mov r1, r8
	adds r2, r0, r1
	adds r1, r0, r6
	strh r5, [r1]
	strh r5, [r2]
	adds r2, r4, #1
	adds r0, r0, r7
	mov r3, ip
	adds r3, #1
.L0803535E:
	strh r5, [r0]
	adds r0, #8
	subs r3, #1
	cmp r3, #0
	bne .L0803535E
	adds r4, r2, #0
	cmp r4, #3
	ble .L0803534A
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0803537C: .4byte gUnk_030044D0
.L08035380: .4byte gSioSt
.L08035384: .4byte 0x00001B74
.L08035388: .4byte gUnk_030013C8
.L0803538C: .4byte gUnk_030013CA
.L08035390: .4byte gUnk_03004580
.L08035394: .4byte 0x000012B4
.L08035398: .4byte gSioOutgoing
.L0803539C: .4byte sReadCursor
.L080353A0: .4byte 0x000001FF
.L080353A4: .4byte gSioIncoming
.L080353A8: .4byte sRecvCursor

	thumb_func_start SioInit_SW
SioInit_SW: @ 0x080353AC
	push {r4, lr}
	ldr r2, .L08035408 @ =gSioSt
	ldr r0, [r2]
	movs r4, #0
	strb r4, [r0]
	ldr r0, [r2]
	strb r4, [r0, #1]
	ldr r1, [r2]
	movs r3, #0
	strh r4, [r1, #2]
	strh r4, [r1, #4]
	movs r0, #0xff
	strb r0, [r1, #6]
	ldr r0, [r2]
	strb r3, [r0, #7]
	ldr r0, [r2]
	strb r3, [r0, #8]
	ldr r0, [r2]
	strb r3, [r0, #9]
	ldr r0, [r2]
	strb r3, [r0, #0xf]
	ldr r0, [r2]
	strb r3, [r0, #0x10]
	ldr r0, [r2]
	strb r3, [r0, #0x11]
	ldr r0, [r2]
	adds r0, #0x2e
	strb r3, [r0]
	ldr r0, [r2]
	strb r3, [r0, #0xa]
	ldr r0, .L0803540C @ =0x00004321
	movs r1, #3
	movs r2, #0x88
	bl func_fe6_080351F4
	movs r0, #0
	bl SetXmapTransferState
	bl ResetSioSW
	ldr r0, .L08035410 @ =gUnk_030013C4
	str r4, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08035408: .4byte gSioSt
.L0803540C: .4byte 0x00004321
.L08035410: .4byte gUnk_030013C4

	thumb_func_start SioInit_HW
SioInit_HW: @ 0x08035414
	push {r4, lr}
	ldr r0, .L08035464 @ =0x04000134
	movs r3, #0
	strh r3, [r0]
	ldr r2, .L08035468 @ =0x04000128
	ldr r1, .L0803546C @ =sSioCnt
	movs r4, #0x80
	lsls r4, r4, #6
	adds r0, r4, #0
	ldrb r1, [r1]
	orrs r0, r1
	strh r0, [r2]
	ldr r0, .L08035470 @ =0x0400010E
	strh r3, [r0]
	ldr r2, .L08035474 @ =gUnk_030044D4
	ldr r1, .L08035478 @ =gUnk_030044D0
	movs r0, #0
	str r0, [r1]
	str r0, [r2]
	ldr r1, .L0803547C @ =gSioStateId
	str r0, [r1]
	ldr r1, .L08035480 @ =sSioId
	subs r0, #1
	str r0, [r1]
	ldr r1, .L08035484 @ =func_fe6_080354F0
	movs r0, #7
	bl SetIrqFunc
	ldr r1, .L08035488 @ =func_fe6_08035880
	movs r0, #6
	bl SetIrqFunc
	ldr r2, .L0803548C @ =0x04000200
	ldrh r0, [r2]
	movs r1, #0xc0
	orrs r0, r1
	strh r0, [r2]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08035464: .4byte 0x04000134
.L08035468: .4byte 0x04000128
.L0803546C: .4byte sSioCnt
.L08035470: .4byte 0x0400010E
.L08035474: .4byte gUnk_030044D4
.L08035478: .4byte gUnk_030044D0
.L0803547C: .4byte gSioStateId
.L08035480: .4byte sSioId
.L08035484: .4byte func_fe6_080354F0
.L08035488: .4byte func_fe6_08035880
.L0803548C: .4byte 0x04000200

	thumb_func_start SioReleaseIrq
SioReleaseIrq: @ 0x08035490
	push {lr}
	ldr r1, .L080354D4 @ =0x04000134
	movs r2, #0x80
	lsls r2, r2, #8
	adds r0, r2, #0
	strh r0, [r1]
	subs r1, #0xc
	movs r0, #0
	strh r0, [r1]
	ldr r2, .L080354D8 @ =gUnk_030044D4
	ldr r1, .L080354DC @ =gUnk_030044D0
	movs r0, #0
	str r0, [r1]
	str r0, [r2]
	ldr r1, .L080354E0 @ =gSioStateId
	str r0, [r1]
	ldr r1, .L080354E4 @ =sSioId
	subs r0, #1
	str r0, [r1]
	movs r0, #7
	movs r1, #0
	bl SetIrqFunc
	movs r0, #6
	movs r1, #0
	bl SetIrqFunc
	ldr r2, .L080354E8 @ =0x04000200
	ldrh r1, [r2]
	ldr r0, .L080354EC @ =0x0000FF3F
	ands r0, r1
	strh r0, [r2]
	pop {r0}
	bx r0
	.align 2, 0
.L080354D4: .4byte 0x04000134
.L080354D8: .4byte gUnk_030044D4
.L080354DC: .4byte gUnk_030044D0
.L080354E0: .4byte gSioStateId
.L080354E4: .4byte sSioId
.L080354E8: .4byte 0x04000200
.L080354EC: .4byte 0x0000FF3F

	thumb_func_start func_fe6_080354F0
func_fe6_080354F0: @ 0x080354F0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	movs r0, #0
	mov sb, r0
	ldr r0, .L08035584 @ =gUnk_030044D4
	movs r2, #1
	str r2, [r0]
	ldr r1, .L08035588 @ =gSioSt
	ldr r0, [r1]
	mov r3, sb
	strb r3, [r0, #0x1e]
	ldr r0, .L0803558C @ =gUnk_030044D0
	str r2, [r0]
	ldr r0, [r1]
	strb r3, [r0, #8]
	ldr r0, .L08035590 @ =0x0400010E
	mov r5, sb
	strh r5, [r0]
	ldr r2, [r1]
	ldr r3, .L08035594 @ =0x04000128
	ldrh r0, [r3]
	lsls r1, r0, #0x10
	strh r0, [r2, #2]
	ldrh r0, [r2, #4]
	cmp r0, #6
	beq .L08035534
	lsrs r0, r1, #0x14
	movs r1, #3
	ands r0, r1
	strb r0, [r2, #6]
.L08035534:
	ldr r0, .L08035598 @ =0x04000120
	ldr r1, [r0, #4]
	ldr r0, [r0]
	str r0, [sp]
	str r1, [sp, #4]
	ldr r1, .L0803559C @ =sSioCnt
	movs r2, #0xc0
	lsls r2, r2, #7
	adds r0, r2, #0
	ldrb r1, [r1]
	orrs r0, r1
	strh r0, [r3]
	ldr r0, .L080355A0 @ =0x00007FFF
	strh r0, [r3, #2]
	movs r5, #0
	ldr r3, .L080355A4 @ =0x0000FFFF
	mov sl, r3
	mov r4, sp
	movs r7, #0
.L0803555A:
	ldrh r0, [r4]
	cmp r0, #0
	beq .L080355A8
	cmp r0, sl
	beq .L080355A8
	ldr r1, .L08035588 @ =gSioSt
	ldr r0, [r1]
	adds r0, #0xb
	adds r2, r0, r5
	ldrb r0, [r2]
	cmp r0, #0
	bne .L08035576
	movs r0, #1
	strb r0, [r2]
.L08035576:
	ldr r1, [r1]
	movs r0, #1
	lsls r0, r5
	ldrb r2, [r1, #8]
	orrs r0, r2
	strb r0, [r1, #8]
	b .L080355E2
	.align 2, 0
.L08035584: .4byte gUnk_030044D4
.L08035588: .4byte gSioSt
.L0803558C: .4byte gUnk_030044D0
.L08035590: .4byte 0x0400010E
.L08035594: .4byte 0x04000128
.L08035598: .4byte 0x04000120
.L0803559C: .4byte sSioCnt
.L080355A0: .4byte 0x00007FFF
.L080355A4: .4byte 0x0000FFFF
.L080355A8:
	lsls r0, r5, #0x18
	lsrs r0, r0, #0x18
	bl func_fe6_08035CB0
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne .L080355E2
	ldr r0, .L080355D4 @ =gSioSt
	ldr r1, [r0]
	adds r0, r1, #0
	adds r0, #0x12
	adds r0, r0, r7
	ldrh r0, [r0]
	cmp r0, sl
	bne .L080355D8
	adds r0, r1, #0
	adds r0, #0x1a
	adds r0, r0, r5
	ldrb r1, [r0]
	adds r1, #1
	b .L080355E0
	.align 2, 0
.L080355D4: .4byte gSioSt
.L080355D8:
	adds r0, r1, #0
	adds r0, #0x1a
	adds r0, r0, r5
	movs r1, #0
.L080355E0:
	strb r1, [r0]
.L080355E2:
	ldr r3, .L0803563C @ =gSioSt
	mov r8, r3
	ldr r6, [r3]
	adds r3, r6, #0
	adds r3, #0x12
	adds r3, r3, r7
	mov ip, r3
	ldr r1, .L08035640 @ =gSioIncoming
	ldr r2, .L08035644 @ =sRecvCursor
	adds r2, r7, r2
	ldrh r3, [r2]
	lsls r0, r3, #3
	adds r0, r7, r0
	adds r0, r0, r1
	ldrh r1, [r4]
	strh r1, [r0]
	ldr r0, .L08035648 @ =0x0000FFFF
	ldrh r1, [r4]
	ands r0, r1
	mov r3, ip
	strh r0, [r3]
	ldrh r0, [r2]
	adds r0, #1
	ldr r1, .L0803564C @ =0x000001FF
	mov ip, r1
	mov r3, ip
	ands r0, r3
	strh r0, [r2]
	adds r4, #2
	adds r7, #2
	adds r5, #1
	cmp r5, #3
	ble .L0803555A
	mov r4, r8
	adds r0, r6, #0
	ldrh r5, [r0, #4]
	cmp r5, #4
	bls .L08035708
	ldrb r0, [r0, #1]
	cmp r0, #1
	beq .L08035650
	cmp r0, #3
	beq .L080356B0
	b .L08035708
	.align 2, 0
.L0803563C: .4byte gSioSt
.L08035640: .4byte gSioIncoming
.L08035644: .4byte sRecvCursor
.L08035648: .4byte 0x0000FFFF
.L0803564C: .4byte 0x000001FF
.L08035650:
	ldr r0, .L0803569C @ =gUnk_030013CA
	ldr r2, .L080356A0 @ =gUnk_030013C8
	ldrh r3, [r2]
	ldrh r0, [r0]
	cmp r0, r3
	beq .L08035676
	ldr r1, .L080356A4 @ =gSioOutgoing
	lsls r0, r3, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	add r0, sp, #8
	strh r1, [r0]
	adds r1, r3, #1
	mov r3, ip
	ands r1, r3
	strh r1, [r2]
	movs r1, #1
	bl SioSend16
.L08035676:
	ldr r1, [r4]
	movs r0, #6
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bne .L08035708
	ldr r5, .L080356A8 @ =0x00001B7C
	adds r2, r1, r5
	ldrh r0, [r2]
	cmp r0, #0
	beq .L08035708
	ldr r1, .L080356AC @ =0x0400010C
	ldrh r2, [r2]
	rsbs r0, r2, #0
	str r0, [r1]
	adds r1, #2
	movs r0, #0xc3
	strh r0, [r1]
	b .L08035708
	.align 2, 0
.L0803569C: .4byte gUnk_030013CA
.L080356A0: .4byte gUnk_030013C8
.L080356A4: .4byte gSioOutgoing
.L080356A8: .4byte 0x00001B7C
.L080356AC: .4byte 0x0400010C
.L080356B0:
	movs r0, #6
	ldrsb r0, [r6, r0]
	cmp r0, #0
	beq .L080356CA
	adds r0, r6, #0
	adds r0, #0x30
	movs r1, #1
	bl SioSend16
	mov r0, r8
	ldr r1, [r0]
	ldr r0, .L08035720 @ =0x00005FFF
	strh r0, [r1, #0x30]
.L080356CA:
	movs r5, #0
	ldr r6, .L08035724 @ =0x00009ABC
	mov r4, sp
.L080356D0:
	lsls r0, r5, #0x18
	lsrs r0, r0, #0x18
	bl func_fe6_08035CB0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L080356EE
	ldrh r1, [r4]
	cmp r1, r6
	beq .L080356EE
	mov r0, sb
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sb, r0
.L080356EE:
	adds r4, #2
	adds r5, #1
	cmp r5, #3
	ble .L080356D0
	mov r2, sb
	cmp r2, #0
	bne .L08035708
	ldr r0, .L08035728 @ =gSioSt
	ldr r0, [r0]
	ldr r3, .L0803572C @ =0x00001B7E
	adds r0, r0, r3
	movs r1, #1
	strh r1, [r0]
.L08035708:
	ldr r1, .L08035730 @ =gUnk_030044D0
	movs r0, #0
	str r0, [r1]
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08035720: .4byte 0x00005FFF
.L08035724: .4byte 0x00009ABC
.L08035728: .4byte gSioSt
.L0803572C: .4byte 0x00001B7E
.L08035730: .4byte gUnk_030044D0

	thumb_func_start func_fe6_08035734
func_fe6_08035734: @ 0x08035734
	push {r4, r5, r6, lr}
	sub sp, #4
	ldr r0, .L08035770 @ =gSioSt
	ldr r2, [r0]
	adds r5, r0, #0
	ldrh r0, [r2, #4]
	cmp r0, #4
	bhi .L08035746
	b .L08035874
.L08035746:
	ldrb r0, [r2, #1]
	cmp r0, #0
	bne .L0803574E
	b .L08035874
.L0803574E:
	ldrb r0, [r2, #0x1e]
	adds r0, #1
	strb r0, [r2, #0x1e]
	ldr r1, [r5]
	ldrh r0, [r1, #4]
	cmp r0, #6
	bne .L080357DC
	adds r0, r1, #0
	adds r0, #0x21
	ldrb r0, [r0]
	cmp r0, #2
	beq .L0803578E
	cmp r0, #2
	bgt .L08035774
	cmp r0, #1
	beq .L080357B4
	b .L080357DC
	.align 2, 0
.L08035770: .4byte gSioSt
.L08035774:
	cmp r0, #3
	bne .L080357DC
	ldrb r0, [r1, #0x1e]
	cmp r0, #0x3c
	bls .L0803578E
	movs r0, #6
	ldrsb r0, [r1, r0]
	adds r1, #0xb
	adds r1, r1, r0
	movs r0, #0
	strb r0, [r1]
	bl StartSioErrorScreen
.L0803578E:
	ldr r4, .L08035800 @ =gSioSt
	ldr r0, [r4]
	ldrb r0, [r0, #1]
	cmp r0, #0
	beq .L080357B4
	bl func_fe6_08035CF8
	lsls r0, r0, #0x18
	asrs r2, r0, #0x18
	cmp r2, #0
	bne .L080357B4
	ldr r0, [r4]
	movs r1, #6
	ldrsb r1, [r0, r1]
	adds r0, #0xb
	adds r0, r0, r1
	strb r2, [r0]
	bl StartSioErrorScreen
.L080357B4:
	movs r4, #0
	ldr r5, .L08035800 @ =gSioSt
.L080357B8:
	ldr r0, .L08035800 @ =gSioSt
	ldr r1, [r0]
	adds r0, r1, #0
	adds r0, #0x1a
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x3c
	bls .L080357D6
	adds r0, r1, #0
	adds r0, #0xb
	adds r0, r0, r4
	movs r1, #0
	strb r1, [r0]
	bl StartSioErrorScreen
.L080357D6:
	adds r4, #1
	cmp r4, #3
	ble .L080357B8
.L080357DC:
	adds r4, r5, #0
	ldr r1, [r4]
	ldrb r0, [r1, #1]
	adds r6, r0, #0
	cmp r6, #1
	bne .L08035850
	ldrb r5, [r1, #0x10]
	cmp r5, #0
	bne .L08035832
	ldrb r1, [r1, #0x11]
	cmp r1, #0x3c
	bls .L08035804
	bl StartSioErrorScreen
	ldr r1, [r4]
	movs r0, #2
	strh r0, [r1, #4]
	b .L08035874
	.align 2, 0
.L08035800: .4byte gSioSt
.L08035804:
	mov r0, sp
	bl func_fe6_080361A4
	cmp r0, #0
	beq .L08035832
	ldr r1, [sp]
	adds r1, #6
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl SioSend
	lsls r0, r0, #0x10
	cmp r0, #0
	ble .L08035832
	ldr r0, [r4]
	strb r5, [r0, #0x10]
	ldr r1, [r4]
	ldrb r0, [r1, #0x11]
	adds r0, #1
	strb r0, [r1, #0x11]
	ldr r0, [r4]
	adds r0, #0x2e
	strb r6, [r0]
.L08035832:
	ldr r2, .L0803584C @ =gSioSt
	ldr r1, [r2]
	ldrb r0, [r1, #0x10]
	adds r0, #1
	strb r0, [r1, #0x10]
	ldr r4, [r2]
	ldrb r0, [r4, #0x10]
	movs r1, #0x26
	bl __umodsi3
	strb r0, [r4, #0x10]
	b .L08035874
	.align 2, 0
.L0803584C: .4byte gSioSt
.L08035850:
	subs r0, #2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi .L08035874
	movs r0, #6
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bne .L08035874
	adds r0, r1, #0
	adds r0, #0x30
	movs r1, #1
	rsbs r1, r1, #0
	bl SioSend16
	ldr r1, [r5]
	ldr r0, .L0803587C @ =0x00005FFF
	strh r0, [r1, #0x30]
.L08035874:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L0803587C: .4byte 0x00005FFF

	thumb_func_start func_fe6_08035880
func_fe6_08035880: @ 0x08035880
	ldr r1, .L08035898 @ =0x0400010E
	movs r0, #0
	strh r0, [r1]
	ldr r2, .L0803589C @ =0x04000128
	ldr r1, .L080358A0 @ =sSioCnt
	movs r3, #0xc1
	lsls r3, r3, #7
	adds r0, r3, #0
	ldrb r1, [r1]
	orrs r0, r1
	strh r0, [r2]
	bx lr
	.align 2, 0
.L08035898: .4byte 0x0400010E
.L0803589C: .4byte 0x04000128
.L080358A0: .4byte sSioCnt

	thumb_func_start func_fe6_080358A4
func_fe6_080358A4: @ 0x080358A4
	push {r4, r5, lr}
	sub sp, #0x10
	adds r2, r0, #0
	mov r1, sp
	ldr r0, .L080358D4 @ =gUnk_0810DBBC
	ldm r0!, {r3, r4, r5}
	stm r1!, {r3, r4, r5}
	ldr r0, [r0]
	str r0, [r1]
	ldr r0, .L080358D8 @ =gPlaySt
	ldrb r0, [r0, #0x1d]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L080358CA
	lsls r0, r2, #2
	add r0, sp
	ldrh r0, [r0]
	bl m4aSongNumStart
.L080358CA:
	add sp, #0x10
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L080358D4: .4byte gUnk_0810DBBC
.L080358D8: .4byte gPlaySt

	thumb_func_start func_fe6_080358DC
func_fe6_080358DC: @ 0x080358DC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r0, .L08035930 @ =gSioSt
	ldr r2, [r0]
	ldrb r1, [r2, #1]
	cmp r1, #1
	beq .L080358EE
	b .L08035C4A
.L080358EE:
	movs r0, #6
	ldrsb r0, [r2, r0]
	lsls r1, r0
	ldrb r0, [r2, #0xf]
	orrs r1, r0
	strb r1, [r2, #0xf]
	movs r7, #0
.L080358FC:
	lsls r4, r7, #0x18
	asrs r0, r4, #0x18
	ldr r5, .L08035930 @ =gSioSt
	ldr r1, [r5]
	adds r1, #0x32
	bl func_fe6_08035EC0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r1, r0, #0
	adds r2, r7, #1
	mov r8, r2
	cmp r0, #0
	bne .L0803591A
	b .L08035C42
.L0803591A:
	cmp r0, #0x16
	beq .L08035948
	cmp r0, #0x16
	bgt .L08035934
	cmp r0, #4
	bne .L08035928
	b .L08035A78
.L08035928:
	cmp r0, #0xa
	beq .L08035948
	b .L08035C42
	.align 2, 0
.L08035930: .4byte gSioSt
.L08035934:
	cmp r0, #0x2e
	beq .L08035948
	cmp r0, #0x2e
	bgt .L08035942
	cmp r0, #0x2a
	beq .L08035948
	b .L08035C42
.L08035942:
	cmp r1, #0x80
	beq .L08035948
	b .L08035C42
.L08035948:
	ldr r6, .L080359A0 @ =gSioSt
	ldr r3, [r6]
	adds r5, r3, #0
	adds r5, #0x32
	ldrb r0, [r5]
	cmp r0, #0x1c
	beq .L080359D4
	adds r4, r7, #1
	mov r8, r4
	cmp r0, #0x1f
	beq .L08035960
	b .L08035C42
.L08035960:
	ldrb r0, [r5, #1]
	ldrb r1, [r5, #1]
	ldrb r2, [r3, #6]
	cmp r1, r2
	bne .L0803596C
	b .L08035C42
.L0803596C:
	lsls r0, r0, #1
	adds r2, r3, #0
	adds r2, #0x26
	adds r0, r2, r0
	ldrh r4, [r5, #2]
	ldrh r0, [r0]
	cmp r4, r0
	beq .L080359A8
	ldr r0, .L080359A4 @ =gSioMsgBuf
	movs r1, #0x1e
	strb r1, [r0]
	ldrb r3, [r3, #6]
	lsls r1, r3, #4
	ldrb r3, [r5, #1]
	orrs r1, r3
	strb r1, [r0, #1]
	ldrb r5, [r5, #1]
	lsls r1, r5, #1
	adds r1, r2, r1
	ldrh r1, [r1]
	strh r1, [r0, #2]
	movs r1, #4
	bl SioSend
	b .L080358FC
	.align 2, 0
.L080359A0: .4byte gSioSt
.L080359A4: .4byte gSioMsgBuf
.L080359A8:
	adds r0, r5, #0
	bl func_fe6_08036130
	ldr r0, .L080359D0 @ =gSioMsgBuf
	movs r1, #0x1e
	strb r1, [r0]
	ldr r2, [r6]
	ldrb r4, [r2, #6]
	lsls r1, r4, #4
	ldrb r3, [r5, #1]
	orrs r1, r3
	strb r1, [r0, #1]
	ldrb r5, [r5, #1]
	lsls r1, r5, #1
	adds r2, #0x26
	adds r2, r2, r1
	ldrh r1, [r2]
	adds r1, #1
	strh r1, [r0, #2]
	b .L08035A68
	.align 2, 0
.L080359D0: .4byte gSioMsgBuf
.L080359D4:
	movs r2, #0
	lsls r1, r7, #4
	adds r0, r7, #1
	mov r8, r0
	ldr r0, .L08035A38 @ =gLinkArenaSt
	subs r1, r1, r7
	adds r3, #0x38
	adds r0, #0xa1
	adds r1, r1, r0
.L080359E6:
	adds r0, r3, r2
	ldrb r0, [r0]
	strb r0, [r1]
	adds r1, #1
	adds r2, #1
	cmp r2, #0xe
	ble .L080359E6
	lsrs r0, r4, #0x18
	bl func_fe6_08035CB0
	lsls r0, r0, #0x18
	cmp r0, #0
	bne .L08035A12
	ldr r0, .L08035A3C @ =gSioSt
	ldr r0, [r0]
	ldrb r1, [r0]
	ldrb r2, [r5, #2]
	cmp r1, r2
	bne .L08035A12
	ldrh r0, [r0, #4]
	cmp r0, #5
	bls .L08035A20
.L08035A12:
	lsrs r0, r4, #0x18
	bl func_fe6_08035CB0
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne .L08035A44
.L08035A20:
	ldr r0, .L08035A3C @ =gSioSt
	ldr r2, [r0]
	movs r0, #6
	ldrsb r0, [r2, r0]
	cmp r0, #0
	beq .L08035A2E
	b .L08035C42
.L08035A2E:
	ldr r0, .L08035A40 @ =gSioMsgBuf
	movs r1, #0x16
	strb r1, [r0]
	ldrb r1, [r2, #6]
	b .L08035A64
	.align 2, 0
.L08035A38: .4byte gLinkArenaSt
.L08035A3C: .4byte gSioSt
.L08035A40: .4byte gSioMsgBuf
.L08035A44:
	ldr r0, .L08035A70 @ =gSioSt
	ldr r1, [r0]
	movs r0, #6
	ldrsb r0, [r1, r0]
	cmp r0, #0
	beq .L08035A52
	b .L08035C42
.L08035A52:
	movs r2, #0x15
	ldrb r3, [r1]
	ldrb r5, [r5, #2]
	cmp r3, r5
	beq .L08035A5E
	movs r2, #0x17
.L08035A5E:
	ldr r0, .L08035A74 @ =gSioMsgBuf
	strb r2, [r0]
	ldrb r1, [r1, #6]
.L08035A64:
	strb r1, [r0, #1]
	strh r7, [r0, #2]
.L08035A68:
	movs r1, #4
	bl SioSend
	b .L08035C42
	.align 2, 0
.L08035A70: .4byte gSioSt
.L08035A74: .4byte gSioMsgBuf
.L08035A78:
	ldr r0, [r5]
	adds r5, r0, #0
	adds r5, #0x32
	ldrb r0, [r5]
	subs r0, #0x14
	cmp r0, #0xa
	bls .L08035A88
	b .L08035C42
.L08035A88:
	lsls r0, r0, #2
	ldr r1, .L08035A94 @ =.L08035A98
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
.L08035A94: .4byte .L08035A98
.L08035A98: @ jump table
	.4byte .L08035C38 @ case 0
	.4byte .L08035BD0 @ case 1
	.4byte .L08035BFC @ case 2
	.4byte .L08035B8C @ case 3
	.4byte .L08035C42 @ case 4
	.4byte .L08035AC4 @ case 5
	.4byte .L08035C42 @ case 6
	.4byte .L08035C42 @ case 7
	.4byte .L08035C42 @ case 8
	.4byte .L08035C42 @ case 9
	.4byte .L08035ADC @ case 10
.L08035AC4:
	ldr r0, .L08035AD8 @ =gSioSt
	ldr r1, [r0]
	movs r0, #1
	ldrb r5, [r5, #1]
	lsls r0, r5
	ldrb r4, [r1, #0xa]
	orrs r0, r4
	strb r0, [r1, #0xa]
	b .L08035C3E
	.align 2, 0
.L08035AD8: .4byte gSioSt
.L08035ADC:
	ldr r6, .L08035B80 @ =gSioSt
	ldr r3, [r6]
	adds r0, r3, #0
	adds r0, #0x2e
	ldrb r0, [r0]
	adds r7, #1
	mov r8, r7
	cmp r0, #0
	bne .L08035AF0
	b .L08035C42
.L08035AF0:
	ldrb r2, [r5, #1]
	lsrs r4, r2, #4
	movs r1, #6
	ldrsb r1, [r3, r1]
	cmp r4, r1
	bne .L08035AFE
	b .L08035C42
.L08035AFE:
	movs r0, #0xf
	ands r0, r2
	cmp r0, r1
	beq .L08035B08
	b .L08035C42
.L08035B08:
	ldrh r0, [r3, #0x24]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r5, [r5, #2]
	cmp r5, r0
	beq .L08035B18
	b .L08035C42
.L08035B18:
	movs r0, #1
	lsls r0, r4
	ldrb r1, [r3, #0xf]
	orrs r0, r1
	strb r0, [r3, #0xf]
	ldr r0, .L08035B84 @ =gUnk_030013C0
	ldr r1, [r0]
	ldr r0, [r6]
	ldrb r0, [r0, #0xf]
	strb r0, [r1]
	ldr r4, [r6]
	ldrb r0, [r4, #9]
	ldrb r2, [r4, #0xf]
	ands r0, r2
	ldrb r3, [r4, #9]
	cmp r0, r3
	beq .L08035B3C
	b .L08035C42
.L08035B3C:
	ldrh r0, [r4, #0x24]
	adds r0, #1
	movs r3, #0
	strh r0, [r4, #0x24]
	ldr r2, .L08035B88 @ =0x00001B74
	adds r1, r4, r2
	movs r0, #0x8c
	ldrb r1, [r1]
	muls r0, r1, r0
	adds r0, r4, r0
	movs r4, #0x9c
	lsls r4, r4, #1
	adds r0, r0, r4
	strb r3, [r0]
	ldr r0, [r6]
	adds r0, r0, r2
	ldrb r1, [r0]
	adds r1, #1
	strb r1, [r0]
	ldr r1, [r6]
	adds r1, r1, r2
	movs r0, #0x1f
	ldrb r2, [r1]
	ands r0, r2
	strb r0, [r1]
	ldr r0, [r6]
	adds r0, #0x2e
	strb r3, [r0]
	ldr r0, [r6]
	strb r3, [r0, #0xf]
	strb r3, [r0, #0x11]
	strb r3, [r0, #0x10]
	b .L08035C42
	.align 2, 0
.L08035B80: .4byte gSioSt
.L08035B84: .4byte gUnk_030013C0
.L08035B88: .4byte 0x00001B74
.L08035B8C:
	ldrb r0, [r5, #2]
	bl func_fe6_08035CB0
	lsls r0, r0, #0x18
	adds r7, #1
	mov r8, r7
	cmp r0, #0
	bne .L08035C42
	ldr r3, .L08035BCC @ =gSioSt
	ldr r0, [r3]
	movs r1, #6
	ldrsb r1, [r0, r1]
	adds r0, #0xb
	adds r0, r0, r1
	movs r2, #2
	strb r2, [r0]
	ldr r1, [r3]
	movs r0, #0x30
	ldrh r4, [r1, #2]
	ands r0, r4
	lsrs r0, r0, #4
	adds r1, #0xb
	adds r1, r1, r0
	strb r2, [r1]
	ldr r0, [r3]
	adds r0, #0xb
	ldrh r5, [r5, #2]
	adds r0, r5, r0
	strb r2, [r0]
	ldr r1, [r3]
	b .L08035BF0
	.align 2, 0
.L08035BCC: .4byte gSioSt
.L08035BD0:
	ldrb r0, [r5, #2]
	bl func_fe6_08035CB0
	lsls r0, r0, #0x18
	adds r7, #1
	mov r8, r7
	cmp r0, #0
	bne .L08035C42
	ldr r2, .L08035BF8 @ =gSioSt
	ldr r0, [r2]
	adds r0, #0xb
	ldrh r5, [r5, #2]
	adds r0, r5, r0
	movs r1, #2
	strb r1, [r0]
	ldr r1, [r2]
.L08035BF0:
	movs r0, #6
	strh r0, [r1, #4]
	b .L08035C42
	.align 2, 0
.L08035BF8: .4byte gSioSt
.L08035BFC:
	ldr r0, .L08035C30 @ =gLinkArenaSt
	adds r0, #0x9c
	ldrh r1, [r5, #2]
	adds r0, r1, r0
	movs r4, #0
	movs r2, #1
	strb r2, [r0]
	ldr r3, .L08035C34 @ =gSioSt
	ldr r0, [r3]
	adds r0, #0xb
	ldrh r1, [r5, #2]
	adds r0, r1, r0
	movs r1, #5
	strb r1, [r0]
	ldr r0, [r3]
	ldrh r1, [r5, #2]
	lsls r2, r1
	ldrb r1, [r0, #9]
	orrs r2, r1
	strb r2, [r0, #9]
	ldr r0, [r3]
	adds r0, #0x1a
	ldrh r5, [r5, #2]
	adds r0, r5, r0
	strb r4, [r0]
	b .L08035C3E
	.align 2, 0
.L08035C30: .4byte gLinkArenaSt
.L08035C34: .4byte gSioSt
.L08035C38:
	ldrb r0, [r5, #1]
	bl func_fe6_080358A4
.L08035C3E:
	adds r7, #1
	mov r8, r7
.L08035C42:
	mov r7, r8
	cmp r7, #3
	bgt .L08035C4A
	b .L080358FC
.L08035C4A:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start func_fe6_08035C54
func_fe6_08035C54: @ 0x08035C54
	bx lr
	.align 2, 0

	thumb_func_start func_fe6_08035C58
func_fe6_08035C58: @ 0x08035C58
	push {r4, r5, lr}
	movs r5, #0
	movs r4, #0
.L08035C5E:
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	bl func_fe6_08035CB0
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne .L08035C74
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
.L08035C74:
	adds r4, #1
	cmp r4, #3
	ble .L08035C5E
	adds r0, r5, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start func_fe6_08035C84
func_fe6_08035C84: @ 0x08035C84
	push {r4, r5, lr}
	movs r5, #0
	movs r4, #0
.L08035C8A:
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	bl func_fe6_08035CD4
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne .L08035CA0
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
.L08035CA0:
	adds r4, #1
	cmp r4, #3
	ble .L08035C8A
	adds r0, r5, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start func_fe6_08035CB0
func_fe6_08035CB0: @ 0x08035CB0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, .L08035CCC @ =gSioSt
	ldr r1, [r1]
	ldrb r1, [r1, #9]
	asrs r1, r0
	adds r0, r1, #0
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne .L08035CD0
	movs r0, #0
	b .L08035CD2
	.align 2, 0
.L08035CCC: .4byte gSioSt
.L08035CD0:
	movs r0, #1
.L08035CD2:
	bx lr

	thumb_func_start func_fe6_08035CD4
func_fe6_08035CD4: @ 0x08035CD4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, .L08035CF0 @ =gSioSt
	ldr r1, [r1]
	ldrb r1, [r1, #8]
	asrs r1, r0
	adds r0, r1, #0
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne .L08035CF4
	movs r0, #0
	b .L08035CF6
	.align 2, 0
.L08035CF0: .4byte gSioSt
.L08035CF4:
	movs r0, #1
.L08035CF6:
	bx lr

	thumb_func_start func_fe6_08035CF8
func_fe6_08035CF8: @ 0x08035CF8
	push {r4, lr}
	ldr r2, .L08035D24 @ =gSioSt
	ldr r3, [r2]
	ldrh r1, [r3, #2]
	movs r0, #0
	strh r0, [r3, #2]
	movs r4, #8
	ands r1, r4
	cmp r1, #0
	bne .L08035D2C
	ldr r0, .L08035D28 @ =0x04000128
	ldrh r1, [r0]
	adds r0, r4, #0
	ands r0, r1
	cmp r0, #0
	bne .L08035D2C
	adds r1, r3, #0
	adds r1, #0x20
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	b .L08035D34
	.align 2, 0
.L08035D24: .4byte gSioSt
.L08035D28: .4byte 0x04000128
.L08035D2C:
	ldr r0, [r2]
	adds r0, #0x20
	movs r1, #0
	strb r1, [r0]
.L08035D34:
	ldr r0, [r2]
	adds r0, #0x20
	ldrb r0, [r0]
	cmp r0, #0xa
	bhi .L08035D42
	movs r0, #1
	b .L08035D44
.L08035D42:
	movs r0, #0
.L08035D44:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start func_fe6_08035D4C
func_fe6_08035D4C: @ 0x08035D4C
	ldr r0, .L08035D68 @ =gSioSt
	ldr r0, [r0]
	ldr r2, .L08035D6C @ =0x00001B75
	adds r1, r0, r2
	ldr r3, .L08035D70 @ =0x00001B74
	adds r0, r0, r3
	ldrb r2, [r1]
	ldrb r3, [r0]
	cmp r2, r3
	bhs .L08035D74
	adds r0, r3, #0
	subs r0, #0x20
	subs r0, r2, r0
	b .L08035D7A
	.align 2, 0
.L08035D68: .4byte gSioSt
.L08035D6C: .4byte 0x00001B75
.L08035D70: .4byte 0x00001B74
.L08035D74:
	ldrb r1, [r1]
	ldrb r0, [r0]
	subs r0, r1, r0
.L08035D7A:
	bx lr

	thumb_func_start func_fe6_08035D7C
func_fe6_08035D7C: @ 0x08035D7C
	push {r4, lr}
	movs r2, #0
	movs r1, #0
	ldr r4, .L08035DBC @ =gSioSt
	ldr r0, [r4]
	adds r3, r0, #0
	adds r3, #0xb
.L08035D8A:
	adds r0, r3, r1
	ldrb r0, [r0]
	cmp r0, #5
	bne .L08035D94
	adds r2, #1
.L08035D94:
	adds r1, #1
	cmp r1, #3
	ble .L08035D8A
	ldr r0, [r4]
	ldrb r0, [r0, #9]
	cmp r0, #3
	bne .L08035DA6
	cmp r2, #2
	beq .L08035DB6
.L08035DA6:
	cmp r0, #7
	bne .L08035DAE
	cmp r2, #3
	beq .L08035DB6
.L08035DAE:
	cmp r0, #0xf
	bne .L08035DC0
	cmp r2, #4
	bne .L08035DC0
.L08035DB6:
	movs r0, #1
	b .L08035DC2
	.align 2, 0
.L08035DBC: .4byte gSioSt
.L08035DC0:
	movs r0, #0
.L08035DC2:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start SioSend
SioSend: @ 0x08035DC8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	mov sb, r0
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x10
	movs r0, #0
	mov r8, r0
	ldr r0, .L08035E68 @ =gUnk_030013CA
	ldrh r3, [r0]
	cmp r5, #0x80
	bhi .L08035E60
	lsrs r5, r1, #0x11
	ldr r1, .L08035E6C @ =0x00004FFF
	adds r4, r5, r1
	ldr r2, .L08035E70 @ =gSioOutgoing
	lsls r0, r3, #1
	adds r0, r0, r2
	strh r1, [r0]
	adds r3, #1
	ldr r6, .L08035E74 @ =0x000001FF
	ands r3, r6
	ldr r0, .L08035E78 @ =gUnk_030013C8
	ldrh r1, [r0]
	mov ip, r2
	mov sl, r0
	cmp r3, r1
	beq .L08035E60
	lsls r0, r3, #1
	add r0, ip
	strh r5, [r0]
	adds r3, #1
	ands r3, r6
	lsls r6, r3, #1
	adds r7, r3, #1
	cmp r3, r1
	beq .L08035E60
	movs r2, #0
	cmp r2, r5
	bge .L08035E3C
	mov r3, sb
.L08035E1E:
	adds r2, #1
	ldrh r0, [r3]
	adds r1, r0, #0
	muls r1, r2, r1
	adds r0, r4, r1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	mvns r1, r1
	add r1, r8
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov r8, r1
	adds r3, #2
	cmp r2, r5
	blt .L08035E1E
.L08035E3C:
	mov r1, ip
	adds r0, r6, r1
	strh r4, [r0]
	ldr r4, .L08035E74 @ =0x000001FF
	adds r3, r4, #0
	ands r3, r7
	mov r2, sl
	ldrh r1, [r2]
	cmp r3, r1
	beq .L08035E60
	lsls r0, r3, #1
	add r0, ip
	mov r2, r8
	strh r2, [r0]
	adds r3, #1
	ands r3, r4
	cmp r3, r1
	bne .L08035E7C
.L08035E60:
	movs r0, #1
	rsbs r0, r0, #0
	b .L08035EAC
	.align 2, 0
.L08035E68: .4byte gUnk_030013CA
.L08035E6C: .4byte 0x00004FFF
.L08035E70: .4byte gSioOutgoing
.L08035E74: .4byte 0x000001FF
.L08035E78: .4byte gUnk_030013C8
.L08035E7C:
	movs r2, #0
	cmp r2, r5
	bge .L08035EA4
	mov r8, ip
	adds r7, r4, #0
	mov r4, sb
	mov r6, sl
.L08035E8A:
	lsls r0, r3, #1
	add r0, r8
	ldrh r1, [r4]
	strh r1, [r0]
	adds r3, #1
	ands r3, r7
	ldrh r0, [r6]
	cmp r3, r0
	beq .L08035E60
	adds r4, #2
	adds r2, #1
	cmp r2, r5
	blt .L08035E8A
.L08035EA4:
	ldr r1, .L08035EBC @ =gUnk_030013CA
	strh r3, [r1]
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
.L08035EAC:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
.L08035EBC: .4byte gUnk_030013CA

	thumb_func_start func_fe6_08035EC0
func_fe6_08035EC0: @ 0x08035EC0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	str r1, [sp, #4]
	lsls r0, r0, #0x18
	movs r1, #0
	mov r8, r1
	movs r2, #0
	str r2, [sp, #0xc]
	ldr r1, .L08035F38 @ =sReadCursor
	lsrs r3, r0, #0x18
	str r3, [sp]
	asrs r2, r0, #0x17
	adds r3, r2, r1
	ldr r0, .L08035F3C @ =sRecvCursor
	adds r7, r2, r0
	ldrh r5, [r7]
	mov sl, r1
	ldrh r0, [r3]
	cmp r0, r5
	beq .L08035FC2
	ldr r1, .L08035F40 @ =gSioIncoming
	ldrh r4, [r3]
	lsls r0, r4, #3
	adds r0, r2, r0
	adds r0, r0, r1
	ldr r6, .L08035F44 @ =0x00004FFF
	mov sb, r1
	ldrh r0, [r0]
	cmp r0, r6
	beq .L08035F4C
	cmp r4, r5
	beq .L08035F7A
	adds r4, r2, #0
	adds r2, r3, #0
	mov ip, r6
	adds r3, r7, #0
	ldr r6, .L08035F48 @ =0x000001FF
	mov r5, sb
.L08035F14:
	ldrh r0, [r2]
	adds r0, #1
	ands r0, r6
	strh r0, [r2]
	ldrh r1, [r2]
	lsls r0, r1, #3
	adds r0, r4, r0
	adds r0, r0, r5
	ldrh r0, [r0]
	cmp r0, ip
	bne .L08035F30
	ldrh r7, [r3]
	cmp r1, r7
	bne .L08035F4C
.L08035F30:
	ldrh r0, [r3]
	cmp r1, r0
	bne .L08035F14
	b .L08035F7A
	.align 2, 0
.L08035F38: .4byte sReadCursor
.L08035F3C: .4byte sRecvCursor
.L08035F40: .4byte gSioIncoming
.L08035F44: .4byte 0x00004FFF
.L08035F48: .4byte 0x000001FF
.L08035F4C:
	ldr r1, [sp]
	lsls r0, r1, #0x18
	asrs r1, r0, #0x17
	ldr r3, .L08035F6C @ =sRecvCursor
	adds r2, r1, r3
	add r1, sl
	ldrh r2, [r2]
	ldrh r1, [r1]
	adds r4, r0, #0
	cmp r2, r1
	bhs .L08035F70
	movs r7, #0x80
	lsls r7, r7, #2
	adds r0, r2, r7
	subs r0, r0, r1
	b .L08035F72
	.align 2, 0
.L08035F6C: .4byte sRecvCursor
.L08035F70:
	subs r0, r2, r1
.L08035F72:
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #4
	bhi .L08035F80
.L08035F7A:
	movs r0, #4
	rsbs r0, r0, #0
	b .L08036068
.L08035F80:
	asrs r0, r4, #0x17
	add r0, sl
	ldrh r3, [r0]
	adds r3, #1
	ldr r0, .L08035F94 @ =0x000001FF
	cmp r3, r0
	bgt .L08035F98
	lsls r0, r3, #0x10
	lsrs r0, r0, #0x10
	b .L08035F9A
	.align 2, 0
.L08035F94: .4byte 0x000001FF
.L08035F98:
	movs r0, #0
.L08035F9A:
	asrs r4, r4, #0x17
	lsls r0, r0, #3
	adds r0, r4, r0
	add r0, sb
	ldrh r6, [r0]
	cmp r6, #0x80
	bls .L08035FBC
	mov r1, sl
	adds r0, r4, r1
	ldrh r1, [r0]
	adds r1, #1
	ldr r2, .L08035FB8 @ =0x000001FF
	ands r1, r2
	strh r1, [r0]
	b .L08035F7A
	.align 2, 0
.L08035FB8: .4byte 0x000001FF
.L08035FBC:
	adds r0, r6, #6
	cmp r0, r1
	ble .L08035FC8
.L08035FC2:
	movs r0, #2
	rsbs r0, r0, #0
	b .L08036068
.L08035FC8:
	mov r3, sl
	adds r2, r4, r3
	ldrh r0, [r2]
	adds r0, #2
	ldr r7, .L0803605C @ =0x000001FF
	ands r0, r7
	strh r0, [r2]
	ldrh r1, [r2]
	lsls r0, r1, #3
	adds r0, r4, r0
	add r0, sb
	ldrh r0, [r0]
	str r0, [sp, #8]
	adds r1, #1
	ands r1, r7
	strh r1, [r2]
	ldrh r1, [r2]
	lsls r0, r1, #3
	adds r0, r4, r0
	add r0, sb
	ldrh r0, [r0]
	mov sl, r0
	adds r1, #1
	ands r1, r7
	strh r1, [r2]
	ldr r0, .L08036060 @ =0x00004FFF
	add r0, r8
	adds r0, r6, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	movs r3, #0
	cmp r3, r6
	bge .L0803604A
	mov ip, r4
	adds r4, r2, #0
	ldr r5, [sp, #4]
.L08036012:
	ldrh r7, [r4]
	lsls r0, r7, #3
	add r0, ip
	add r0, sb
	ldrh r2, [r0]
	adds r3, #1
	adds r1, r2, #0
	muls r1, r3, r1
	mov r7, r8
	adds r0, r7, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	mvns r1, r1
	ldr r0, [sp, #0xc]
	adds r1, r0, r1
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	str r1, [sp, #0xc]
	strh r2, [r5]
	ldrh r0, [r4]
	adds r0, #1
	ldr r1, .L0803605C @ =0x000001FF
	ands r0, r1
	strh r0, [r4]
	adds r5, #2
	cmp r3, r6
	blt .L08036012
.L0803604A:
	ldr r2, [sp, #8]
	cmp r8, r2
	bne .L08036056
	ldr r3, [sp, #0xc]
	cmp r3, sl
	beq .L08036064
.L08036056:
	movs r0, #3
	rsbs r0, r0, #0
	b .L08036068
	.align 2, 0
.L0803605C: .4byte 0x000001FF
.L08036060: .4byte 0x00004FFF
.L08036064:
	lsls r0, r6, #0x11
	asrs r0, r0, #0x10
.L08036068:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start SioSend16
SioSend16: @ 0x08036078
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, .L08036090 @ =gSioSt
	ldr r3, [r0]
	movs r2, #6
	ldrsb r2, [r3, r2]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r2, r0
	bne .L08036094
	adds r0, r2, #0
	b .L080360B6
	.align 2, 0
.L08036090: .4byte gSioSt
.L08036094:
	ldr r2, .L080360BC @ =0x04000128
	ldrh r0, [r4]
	strh r0, [r2, #2]
	movs r0, #6
	ldrsb r0, [r3, r0]
	cmp r0, #0
	bne .L080360B4
	cmp r1, #0
	bge .L080360B4
	ldr r1, .L080360C0 @ =sSioCnt
	movs r3, #0xc1
	lsls r3, r3, #7
	adds r0, r3, #0
	ldrb r1, [r1]
	orrs r0, r1
	strh r0, [r2]
.L080360B4:
	movs r0, #0
.L080360B6:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
.L080360BC: .4byte 0x04000128
.L080360C0: .4byte sSioCnt

	thumb_func_start func_fe6_080360C4
func_fe6_080360C4: @ 0x080360C4
	push {r4, r5, r6, r7, lr}
	adds r2, r1, #0
	ldr r1, .L080360EC @ =sReadCursor
	ldr r0, .L080360F0 @ =sRecvCursor
	ldrh r3, [r1]
	ldrh r0, [r0]
	cmp r3, r0
	bne .L080360F8
	ldr r7, .L080360F4 @ =0x00007FFF
	adds r0, r7, #0
	strh r0, [r2]
	adds r2, #2
	strh r0, [r2]
	adds r2, #2
	strh r0, [r2]
	strh r0, [r2, #2]
	movs r0, #2
	rsbs r0, r0, #0
	b .L08036122
	.align 2, 0
.L080360EC: .4byte sReadCursor
.L080360F0: .4byte sRecvCursor
.L080360F4: .4byte 0x00007FFF
.L080360F8:
	movs r4, #0
	ldr r6, .L08036128 @ =gSioIncoming
	ldr r5, .L0803612C @ =0x000001FF
	adds r3, r1, #0
.L08036100:
	lsls r0, r4, #1
	ldrh r7, [r3]
	lsls r1, r7, #3
	adds r0, r0, r1
	adds r0, r0, r6
	ldrh r0, [r0]
	strh r0, [r2]
	adds r2, #2
	ldrh r0, [r3]
	adds r0, #1
	ands r0, r5
	strh r0, [r3]
	adds r3, #2
	adds r4, #1
	cmp r4, #3
	ble .L08036100
	movs r0, #0
.L08036122:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
.L08036128: .4byte gSioIncoming
.L0803612C: .4byte 0x000001FF

	thumb_func_start func_fe6_08036130
func_fe6_08036130: @ 0x08036130
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r3, .L08036198 @ =gSioSt
	ldr r2, [r3]
	ldr r0, .L0803619C @ =0x00001B77
	adds r1, r2, r0
	movs r0, #0x8c
	ldrb r1, [r1]
	muls r0, r1, r0
	ldr r1, .L080361A0 @ =0x000012B4
	adds r0, r0, r1
	adds r1, r2, r0
	ldrb r0, [r4]
	strb r0, [r1, #4]
	ldrb r0, [r4, #1]
	strb r0, [r1, #5]
	ldrh r0, [r4, #2]
	strh r0, [r1, #6]
	ldrh r0, [r4, #4]
	strh r0, [r1, #8]
	movs r2, #0
	adds r6, r3, #0
	ldrh r0, [r4, #4]
	cmp r2, r0
	bge .L08036178
	adds r5, r1, #0
	adds r5, #0xa
	adds r3, r4, #6
.L08036168:
	adds r0, r5, r2
	adds r1, r3, r2
	ldrb r1, [r1]
	strb r1, [r0]
	adds r2, #1
	ldrh r1, [r4, #4]
	cmp r2, r1
	blt .L08036168
.L08036178:
	ldr r0, [r6]
	ldr r2, .L0803619C @ =0x00001B77
	adds r0, r0, r2
	ldrb r1, [r0]
	adds r1, #1
	strb r1, [r0]
	ldr r1, [r6]
	adds r1, r1, r2
	movs r0, #0xf
	ldrb r2, [r1]
	ands r0, r2
	strb r0, [r1]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08036198: .4byte gSioSt
.L0803619C: .4byte 0x00001B77
.L080361A0: .4byte 0x000012B4

	thumb_func_start func_fe6_080361A4
func_fe6_080361A4: @ 0x080361A4
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	ldr r0, .L080361F4 @ =gSioSt
	ldr r3, [r0]
	ldr r0, .L080361F8 @ =0x00001B74
	adds r4, r3, r0
	movs r6, #0x8c
	ldrb r1, [r4]
	adds r5, r1, #0
	muls r5, r6, r5
	adds r0, r3, r5
	movs r1, #0x9c
	lsls r1, r1, #1
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0x1f
	bne .L08036200
	ldr r1, .L080361FC @ =gUnk_030013C0
	movs r2, #0x9a
	lsls r2, r2, #1
	adds r0, r5, r2
	adds r0, r3, r0
	str r0, [r1]
	ldrb r1, [r4]
	adds r0, r1, #0
	muls r0, r6, r0
	adds r0, r3, r0
	movs r1, #0x9e
	lsls r1, r1, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	str r0, [r7]
	ldrb r4, [r4]
	adds r0, r4, #0
	muls r0, r6, r0
	adds r0, r0, r2
	adds r0, r3, r0
	adds r0, #4
	b .L08036202
	.align 2, 0
.L080361F4: .4byte gSioSt
.L080361F8: .4byte 0x00001B74
.L080361FC: .4byte gUnk_030013C0
.L08036200:
	movs r0, #0
.L08036202:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start SioEmitData
SioEmitData: @ 0x08036208
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov ip, r0
	lsls r1, r1, #0x10
	lsrs r7, r1, #0x10
	ldr r6, .L080362A4 @ =gUnk_030013C4
	movs r0, #1
	str r0, [r6]
	ldr r4, .L080362A8 @ =gSioSt
	ldr r1, [r4]
	ldr r2, .L080362AC @ =0x00001B75
	adds r0, r1, r2
	movs r5, #0x8c
	ldrb r0, [r0]
	muls r0, r5, r0
	adds r1, r1, r0
	movs r3, #0x9a
	lsls r3, r3, #1
	adds r1, r1, r3
	movs r0, #0
	strb r0, [r1]
	ldr r1, [r4]
	adds r2, r1, r2
	ldrb r2, [r2]
	adds r0, r2, #0
	muls r0, r5, r0
	adds r0, r0, r3
	adds r5, r1, r0
	adds r2, r5, #4
	movs r0, #0x1f
	strb r0, [r5, #4]
	ldr r0, [r4]
	ldrb r0, [r0, #6]
	strb r0, [r2, #1]
	ldr r1, [r4]
	ldrh r0, [r1, #0x22]
	strh r0, [r2, #2]
	strh r7, [r2, #4]
	ldrh r0, [r1, #0x22]
	adds r0, #1
	strh r0, [r1, #0x22]
	movs r3, #0
	mov r8, r6
	adds r6, r4, #0
	cmp r3, r7
	bhs .L0803627C
	adds r2, #6
.L08036268:
	adds r1, r2, r3
	mov r4, ip
	adds r0, r4, r3
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, r7
	blo .L08036268
.L0803627C:
	ldr r1, [r6]
	ldr r3, .L080362AC @ =0x00001B75
	adds r1, r1, r3
	ldrb r0, [r1]
	adds r2, r0, #1
	movs r4, #0
	strb r2, [r1]
	ldr r2, [r6]
	adds r2, r2, r3
	movs r1, #0x1f
	ldrb r3, [r2]
	ands r1, r3
	strb r1, [r2]
	mov r1, r8
	str r4, [r1]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
.L080362A4: .4byte gUnk_030013C4
.L080362A8: .4byte gSioSt
.L080362AC: .4byte 0x00001B75

	thumb_func_start SioReceiveData
SioReceiveData: @ 0x080362B0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov sb, r0
	str r1, [sp]
	mov sl, r2
.L080362C2:
	ldr r0, .L080362F0 @ =gSioSt
	mov r8, r0
	ldr r2, [r0]
	ldr r7, .L080362F4 @ =0x00001B76
	adds r1, r2, r7
	movs r0, #0x8c
	ldrb r1, [r1]
	muls r0, r1, r0
	ldr r1, .L080362F8 @ =0x000012B4
	adds r0, r0, r1
	adds r5, r2, r0
	adds r6, r5, #4
	ldrb r3, [r5, #4]
	cmp r3, #0x1f
	bne .L080362EA
	ldrb r0, [r6, #1]
	ldrb r1, [r6, #1]
	ldrb r3, [r2, #6]
	cmp r1, r3
	bne .L080362FC
.L080362EA:
	movs r0, #0
	b .L08036424
	.align 2, 0
.L080362F0: .4byte gSioSt
.L080362F4: .4byte 0x00001B76
.L080362F8: .4byte 0x000012B4
.L080362FC:
	lsls r0, r0, #1
	adds r3, r2, #0
	adds r3, #0x26
	adds r0, r3, r0
	ldrh r1, [r6, #2]
	ldrh r0, [r0]
	cmp r1, r0
	beq .L08036348
	ldr r0, .L08036344 @ =gSioMsgBuf
	movs r1, #0x1e
	strb r1, [r0]
	ldrb r2, [r2, #6]
	lsls r1, r2, #4
	ldrb r2, [r6, #1]
	orrs r1, r2
	strb r1, [r0, #1]
	ldrb r6, [r6, #1]
	lsls r1, r6, #1
	adds r1, r3, r1
	ldrh r1, [r1]
	movs r4, #0
	strh r1, [r0, #2]
	movs r1, #4
	bl SioSend
	strb r4, [r5, #4]
	mov r3, r8
	ldr r0, [r3]
	adds r0, r0, r7
	ldrb r1, [r0]
	adds r1, #1
	strb r1, [r0]
	ldr r1, [r3]
	adds r1, r1, r7
	b .L080363B6
	.align 2, 0
.L08036344: .4byte gSioMsgBuf
.L08036348:
	movs r2, #0
	ldrh r3, [r6, #4]
	cmp r2, r3
	bhs .L0803636A
	adds r3, r5, #0
	adds r3, #0xa
.L08036354:
	mov r0, sb
	adds r1, r0, r2
	adds r0, r3, r2
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	ldrh r1, [r6, #4]
	cmp r2, r1
	blo .L08036354
.L0803636A:
	mov r2, sl
	cmp r2, #0
	beq .L080363CC
	mov r0, sb
	bl _call_via_sl
	lsls r0, r0, #0x18
	cmp r0, #0
	bne .L080363CC
	ldr r0, .L080363C0 @ =gSioMsgBuf
	movs r1, #0x1e
	strb r1, [r0]
	ldr r4, .L080363C4 @ =gSioSt
	ldr r2, [r4]
	ldrb r3, [r2, #6]
	lsls r1, r3, #4
	ldrb r3, [r6, #1]
	orrs r1, r3
	strb r1, [r0, #1]
	ldrb r3, [r6, #1]
	lsls r1, r3, #1
	adds r2, #0x26
	adds r2, r2, r1
	ldrh r1, [r2]
	movs r5, #0
	strh r1, [r0, #2]
	movs r1, #4
	bl SioSend
	strb r5, [r6]
	ldr r0, [r4]
	ldr r2, .L080363C8 @ =0x00001B76
	adds r0, r0, r2
	ldrb r1, [r0]
	adds r1, #1
	strb r1, [r0]
	ldr r1, [r4]
	adds r1, r1, r2
.L080363B6:
	movs r0, #0xf
	ldrb r2, [r1]
	ands r0, r2
	strb r0, [r1]
	b .L080362C2
	.align 2, 0
.L080363C0: .4byte gSioMsgBuf
.L080363C4: .4byte gSioSt
.L080363C8: .4byte 0x00001B76
.L080363CC:
	movs r0, #0
	strb r0, [r6]
	ldrb r5, [r6, #1]
	ldr r4, .L08036434 @ =gSioSt
	ldr r2, [r4]
	lsls r1, r5, #1
	adds r0, r2, #0
	adds r0, #0x26
	adds r0, r0, r1
	ldrh r1, [r0]
	adds r1, #1
	strh r1, [r0]
	ldr r3, .L08036438 @ =0x00001B76
	adds r2, r2, r3
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	ldr r1, [r4]
	adds r1, r1, r3
	movs r0, #0xf
	ldrb r3, [r1]
	ands r0, r3
	strb r0, [r1]
	ldr r0, [sp]
	strb r5, [r0]
	ldr r0, .L0803643C @ =gSioMsgBuf
	movs r1, #0x1e
	strb r1, [r0]
	ldr r2, [r4]
	ldrb r3, [r2, #6]
	lsls r1, r3, #4
	ldrb r3, [r6, #1]
	orrs r1, r3
	strb r1, [r0, #1]
	ldrb r3, [r6, #1]
	lsls r1, r3, #1
	adds r2, #0x26
	adds r2, r2, r1
	ldrh r1, [r2]
	strh r1, [r0, #2]
	movs r1, #4
	bl SioSend
	ldrh r0, [r6, #4]
.L08036424:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
.L08036434: .4byte gSioSt
.L08036438: .4byte 0x00001B76
.L0803643C: .4byte gSioMsgBuf

	thumb_func_start func_fe6_08036440
func_fe6_08036440: @ 0x08036440
	push {lr}
	sub sp, #4
	ldr r1, .L0803647C @ =0x00007FFF
	mov r0, sp
	strh r1, [r0]
	ldr r0, .L08036480 @ =gSioSt
	ldr r1, [r0]
	movs r0, #0
	strb r0, [r1, #1]
	mov r0, sp
	movs r1, #1
	bl SioSend16
	ldr r1, .L08036484 @ =gUnk_030013CA
	ldr r0, .L08036488 @ =gUnk_030013C8
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r3, .L0803648C @ =sReadCursor
	ldr r2, .L08036490 @ =sRecvCursor
	movs r1, #3
.L08036468:
	ldrh r0, [r3]
	strh r0, [r2]
	adds r3, #2
	adds r2, #2
	subs r1, #1
	cmp r1, #0
	bge .L08036468
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
.L0803647C: .4byte 0x00007FFF
.L08036480: .4byte gSioSt
.L08036484: .4byte gUnk_030013CA
.L08036488: .4byte gUnk_030013C8
.L0803648C: .4byte sReadCursor
.L08036490: .4byte sRecvCursor

	thumb_func_start SetXmapTransferState
SetXmapTransferState: @ 0x08036494
	ldr r1, .L080364A0 @ =gSioSt
	ldr r1, [r1]
	adds r1, #0x21
	strb r0, [r1]
	bx lr
	.align 2, 0
.L080364A0: .4byte gSioSt

	thumb_func_start func_fe6_080364A4
func_fe6_080364A4: @ 0x080364A4
	push {lr}
	sub sp, #4
	ldr r1, .L080364F8 @ =0x00007FFF
	mov r0, sp
	strh r1, [r0]
	ldr r1, .L080364FC @ =gSioSt
	ldr r0, [r1]
	movs r2, #0
	strb r2, [r0, #1]
	ldr r0, [r1]
	ldr r1, .L08036500 @ =0x00001B7C
	adds r0, r0, r1
	strh r2, [r0]
	mov r0, sp
	movs r1, #1
	bl SioSend16
	ldr r1, .L08036504 @ =gUnk_030013CA
	ldr r0, .L08036508 @ =gUnk_030013C8
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r3, .L0803650C @ =sReadCursor
	ldr r2, .L08036510 @ =sRecvCursor
	movs r1, #3
.L080364D4:
	ldrh r0, [r3]
	strh r0, [r2]
	adds r3, #2
	adds r2, #2
	subs r1, #1
	cmp r1, #0
	bge .L080364D4
	ldr r0, .L080364FC @ =gSioSt
	ldr r2, [r0]
	ldr r0, .L08036514 @ =0x00001B7E
	adds r1, r2, r0
	movs r0, #0
	strh r0, [r1]
	movs r0, #3
	strb r0, [r2, #1]
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
.L080364F8: .4byte 0x00007FFF
.L080364FC: .4byte gSioSt
.L08036500: .4byte 0x00001B7C
.L08036504: .4byte gUnk_030013CA
.L08036508: .4byte gUnk_030013C8
.L0803650C: .4byte sReadCursor
.L08036510: .4byte sRecvCursor
.L08036514: .4byte 0x00001B7E

	thumb_func_start func_fe6_08036518
func_fe6_08036518: @ 0x08036518
	push {r4, lr}
	sub sp, #4
	ldr r1, .L08036574 @ =0x00002586
	mov r0, sp
	strh r1, [r0]
	ldr r3, .L08036578 @ =gSioSt
	ldr r1, [r3]
	movs r2, #0
	movs r0, #0
	strh r0, [r1, #4]
	strb r2, [r1, #1]
	ldr r0, [r3]
	ldr r1, .L0803657C @ =0x00001B7C
	adds r0, r0, r1
	movs r1, #0x88
	strh r1, [r0]
	ldr r1, .L08036580 @ =gUnk_030013CA
	ldr r0, .L08036584 @ =gUnk_030013C8
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, r3, #0
	ldr r3, .L08036588 @ =sReadCursor
	ldr r2, .L0803658C @ =sRecvCursor
	movs r1, #3
.L08036548:
	ldrh r0, [r3]
	strh r0, [r2]
	adds r3, #2
	adds r2, #2
	subs r1, #1
	cmp r1, #0
	bge .L08036548
	ldr r1, [r4]
	movs r0, #1
	strb r0, [r1, #1]
	ldr r1, [r4]
	movs r0, #6
	strh r0, [r1, #4]
	movs r1, #1
	rsbs r1, r1, #0
	mov r0, sp
	bl SioSend16
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08036574: .4byte 0x00002586
.L08036578: .4byte gSioSt
.L0803657C: .4byte 0x00001B7C
.L08036580: .4byte gUnk_030013CA
.L08036584: .4byte gUnk_030013C8
.L08036588: .4byte sReadCursor
.L0803658C: .4byte sRecvCursor

	thumb_func_start XMapTransfer_08036590
XMapTransfer_08036590: @ 0x08036590
	push {r4, lr}
	sub sp, #4
	ldr r1, .L080365EC @ =0x00002586
	mov r0, sp
	strh r1, [r0]
	ldr r3, .L080365F0 @ =gSioSt
	ldr r1, [r3]
	movs r2, #0
	movs r0, #0
	strh r0, [r1, #4]
	strb r2, [r1, #1]
	ldr r0, [r3]
	ldr r1, .L080365F4 @ =0x00001B7C
	adds r0, r0, r1
	movs r1, #0x18
	strh r1, [r0]
	ldr r1, .L080365F8 @ =gUnk_030013CA
	ldr r0, .L080365FC @ =gUnk_030013C8
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, r3, #0
	ldr r3, .L08036600 @ =sReadCursor
	ldr r2, .L08036604 @ =sRecvCursor
	movs r1, #3
.L080365C0:
	ldrh r0, [r3]
	strh r0, [r2]
	adds r3, #2
	adds r2, #2
	subs r1, #1
	cmp r1, #0
	bge .L080365C0
	ldr r1, [r4]
	movs r0, #1
	strb r0, [r1, #1]
	ldr r1, [r4]
	movs r0, #6
	strh r0, [r1, #4]
	movs r1, #1
	rsbs r1, r1, #0
	mov r0, sp
	bl SioSend16
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L080365EC: .4byte 0x00002586
.L080365F0: .4byte gSioSt
.L080365F4: .4byte 0x00001B7C
.L080365F8: .4byte gUnk_030013CA
.L080365FC: .4byte gUnk_030013C8
.L08036600: .4byte sReadCursor
.L08036604: .4byte sRecvCursor

	thumb_func_start func_fe6_08036608
func_fe6_08036608: @ 0x08036608
	ldr r0, .L08036614 @ =gUnk_030013CA
	ldr r1, .L08036618 @ =gUnk_030013C8
	ldrh r1, [r1]
	strh r1, [r0]
	bx lr
	.align 2, 0
.L08036614: .4byte gUnk_030013CA
.L08036618: .4byte gUnk_030013C8

	thumb_func_start func_fe6_0803661C
func_fe6_0803661C: @ 0x0803661C
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r5, .L08036678 @ =gSioSt
	ldr r1, [r5]
	adds r2, r1, #0
	adds r2, #0x2e
	movs r0, #0
	strb r0, [r2]
	strh r0, [r1, #0x22]
	strh r0, [r1, #0x24]
	ldr r1, [r5]
	strh r0, [r1, #0x2c]
	strh r0, [r1, #0x2a]
	strh r0, [r1, #0x28]
	strh r0, [r1, #0x26]
	bl ResetSioSW
	mov r1, sp
	adds r0, r4, #0
	adds r0, #0x34
	ldrb r0, [r0]
	strb r0, [r1]
	mov r2, sp
	ldrh r1, [r4, #0x36]
	lsrs r0, r1, #8
	strb r0, [r2, #1]
	mov r0, sp
	strb r1, [r0, #2]
	mov r1, sp
	adds r4, #0x3a
	ldrb r0, [r4]
	strb r0, [r1, #3]
	mov r0, sp
	movs r1, #4
	bl SioEmitData
	ldr r0, [r5]
	adds r0, #0x2e
	movs r1, #1
	strb r1, [r0]
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08036678: .4byte gSioSt

	thumb_func_start func_fe6_0803667C
func_fe6_0803667C: @ 0x0803667C
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x2c]
	cmp r1, #0
	beq .L0803668A
	bl _call_via_r1
.L0803668A:
	ldr r5, .L080366E8 @ =gSioSt
	ldr r1, [r5]
	adds r0, r1, #0
	adds r0, #0x2e
	ldrb r6, [r0]
	cmp r6, #0
	bne .L080366E0
	ldrh r2, [r4, #0x38]
	ldrh r0, [r1, #0x24]
	subs r0, #1
	cmp r2, r0
	beq .L080366BE
	ldr r0, [r4, #0x30]
	adds r0, #0x7a
	str r0, [r4, #0x30]
	movs r0, #0x64
	muls r0, r2, r0
	ldrh r1, [r4, #0x36]
	bl __divsi3
	adds r1, r4, #0
	adds r1, #0x3b
	strb r0, [r1]
	ldrh r0, [r4, #0x38]
	adds r0, #1
	strh r0, [r4, #0x38]
.L080366BE:
	ldr r0, [r4, #0x30]
	movs r1, #0x7a
	bl SioEmitData
	ldr r0, [r5]
	adds r0, #0x2e
	movs r1, #1
	strb r1, [r0]
	ldr r0, [r5]
	strb r6, [r0, #0x10]
	ldrh r0, [r4, #0x38]
	ldrh r1, [r4, #0x36]
	cmp r0, r1
	blo .L080366E0
	adds r0, r4, #0
	bl Proc_Break
.L080366E0:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L080366E8: .4byte gSioSt

	thumb_func_start func_fe6_080366EC
func_fe6_080366EC: @ 0x080366EC
	push {lr}
	ldr r2, .L08036710 @ =gSioSt
	ldr r1, [r2]
	adds r3, r1, #0
	adds r3, #0x2e
	movs r0, #0
	strb r0, [r3]
	strh r0, [r1, #0x22]
	strh r0, [r1, #0x24]
	ldr r1, [r2]
	strh r0, [r1, #0x2c]
	strh r0, [r1, #0x2a]
	strh r0, [r1, #0x28]
	strh r0, [r1, #0x26]
	bl ResetSioSW
	pop {r0}
	bx r0
	.align 2, 0
.L08036710: .4byte gSioSt

	thumb_func_start func_fe6_08036714
func_fe6_08036714: @ 0x08036714
	push {r4, lr}
	sub sp, #8
	adds r4, r0, #0
	add r1, sp, #4
	mov r0, sp
	movs r2, #0
	bl SioReceiveData
	lsls r0, r0, #0x10
	cmp r0, #0
	beq .L08036750
	mov r0, sp
	ldrb r1, [r0]
	adds r0, r4, #0
	adds r0, #0x34
	strb r1, [r0]
	mov r0, sp
	ldrb r1, [r0, #1]
	lsls r1, r1, #8
	ldrb r0, [r0, #2]
	adds r0, r0, r1
	strh r0, [r4, #0x36]
	mov r0, sp
	ldrb r0, [r0, #3]
	adds r1, r4, #0
	adds r1, #0x3a
	strb r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
.L08036750:
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start func_fe6_08036758
func_fe6_08036758: @ 0x08036758
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r5, .L08036794 @ =gBuf
	ldrh r0, [r4, #0x36]
	subs r0, #1
	ldrh r1, [r4, #0x38]
	cmp r1, r0
	bge .L08036798
	ldr r0, [r4, #0x30]
	mov r1, sp
	movs r2, #0
	bl SioReceiveData
	lsls r0, r0, #0x10
	cmp r0, #0
	beq .L080367E2
	ldr r0, [r4, #0x30]
	adds r0, #0x7a
	str r0, [r4, #0x30]
	movs r0, #0x64
	ldrh r1, [r4, #0x38]
	muls r0, r1, r0
	ldrh r1, [r4, #0x36]
	bl __divsi3
	adds r1, r4, #0
	adds r1, #0x3b
	strb r0, [r1]
	b .L080367DC
	.align 2, 0
.L08036794: .4byte gBuf
.L08036798:
	adds r0, r5, #0
	mov r1, sp
	movs r2, #0
	bl SioReceiveData
	lsls r0, r0, #0x10
	cmp r0, #0
	beq .L080367E2
	movs r2, #0
	adds r3, r4, #0
	adds r3, #0x3a
	adds r6, r4, #0
	adds r6, #0x3b
	ldrb r0, [r3]
	cmp r2, r0
	bge .L080367CE
.L080367B8:
	ldr r1, [r4, #0x30]
	adds r0, r5, r2
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r0, [r4, #0x30]
	adds r0, #1
	str r0, [r4, #0x30]
	adds r2, #1
	ldrb r1, [r3]
	cmp r2, r1
	blt .L080367B8
.L080367CE:
	movs r0, #0x64
	ldrh r1, [r4, #0x38]
	muls r0, r1, r0
	ldrh r1, [r4, #0x36]
	bl __divsi3
	strb r0, [r6]
.L080367DC:
	ldrh r0, [r4, #0x38]
	adds r0, #1
	strh r0, [r4, #0x38]
.L080367E2:
	ldr r1, [r4, #0x2c]
	cmp r1, #0
	beq .L080367EE
	adds r0, r4, #0
	bl _call_via_r1
.L080367EE:
	ldrh r0, [r4, #0x38]
	ldrh r1, [r4, #0x36]
	cmp r0, r1
	blo .L080367FC
	adds r0, r4, #0
	bl Proc_Break
.L080367FC:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start StartSioBigSend
StartSioBigSend: @ 0x08036804
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	adds r4, r1, #0
	mov r8, r2
	lsls r3, r3, #0x18
	lsrs r6, r3, #0x18
	ldr r0, .L08036820 @ =0x0079FF86
	cmp r4, r0
	bls .L08036824
	movs r0, #1
	rsbs r0, r0, #0
	b .L08036876
	.align 2, 0
.L08036820: .4byte 0x0079FF86
.L08036824:
	adds r0, r4, #0
	movs r1, #0x7a
	bl __udivsi3
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	adds r0, r4, #0
	movs r1, #0x7a
	bl __umodsi3
	adds r4, r0, #0
	cmp r4, #0
	beq .L08036846
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
.L08036846:
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, .L08036880 @ =gUnk_Sio_085C98F8
	ldr r1, [sp, #0x18]
	bl SpawnProcLocking
	adds r3, r0, #0
	str r7, [r3, #0x30]
	adds r0, #0x34
	movs r2, #0
	strb r6, [r0]
	mov r0, r8
	str r0, [r3, #0x2c]
	movs r1, #0
	strh r5, [r3, #0x36]
	adds r0, r3, #0
	adds r0, #0x3a
	strb r4, [r0]
	adds r0, #1
	strb r1, [r0]
	strh r2, [r3, #0x38]
	adds r0, #1
	strb r1, [r0]
	movs r0, #0
.L08036876:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
.L08036880: .4byte gUnk_Sio_085C98F8

	thumb_func_start StartSioBigReceive
StartSioBigReceive: @ 0x08036884
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r1, r2, #0
	ldr r0, .L080368AC @ =gUnk_Sio_085C9918
	bl SpawnProcLocking
	str r4, [r0, #0x2c]
	str r5, [r0, #0x30]
	adds r2, r0, #0
	adds r2, #0x3b
	movs r1, #0
	strb r1, [r2]
	movs r2, #0
	strh r1, [r0, #0x38]
	adds r0, #0x3c
	strb r2, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L080368AC: .4byte gUnk_Sio_085C9918

	thumb_func_start IsSioBigTransferActive
IsSioBigTransferActive: @ 0x080368B0
	push {lr}
	ldr r0, .L080368CC @ =gUnk_Sio_085C98F8
	bl FindProc
	cmp r0, #0
	bne .L080368D4
	ldr r0, .L080368D0 @ =gUnk_Sio_085C9918
	bl FindProc
	cmp r0, #0
	bne .L080368D4
	movs r0, #0
	b .L080368D6
	.align 2, 0
.L080368CC: .4byte gUnk_Sio_085C98F8
.L080368D0: .4byte gUnk_Sio_085C9918
.L080368D4:
	movs r0, #1
.L080368D6:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start SioStrCpy
SioStrCpy: @ 0x080368DC
	movs r3, #0
	b .L080368E8
.L080368E0:
	strb r2, [r1]
	adds r0, #1
	adds r1, #1
	adds r3, #1
.L080368E8:
	ldrb r2, [r0]
	cmp r2, #0
	bne .L080368E0
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r3, #0
	bx lr
	.align 2, 0

	thumb_func_start SIOCON_Init
SIOCON_Init: @ 0x080368F8
	push {lr}
	bl SioInit_HW
	bl SioInit_SW
	ldr r2, .L08036914 @ =gSioSt
	ldr r1, [r2]
	movs r3, #0
	movs r0, #1
	strb r0, [r1, #1]
	ldr r0, [r2]
	strh r3, [r0, #4]
	pop {r0}
	bx r0
	.align 2, 0
.L08036914: .4byte gSioSt

	thumb_func_start SIOCON_Loop
SIOCON_Loop: @ 0x08036918
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	ldr r0, .L0803695C @ =0x00002586
	mov r1, sp
	strh r0, [r1]
	bl SioPollingMsg
	movs r5, #1
	rsbs r5, r5, #0
	cmp r0, r5
	beq .L08036954
	ldr r4, .L08036960 @ =gSioSt
	ldr r1, [r4]
	movs r0, #0
	strb r0, [r1, #0x11]
	ldr r1, [r4]
	movs r0, #5
	strh r0, [r1, #4]
	bl GetSioIndex
	ldr r1, [r4]
	strb r0, [r1, #6]
	mov r0, sp
	adds r1, r5, #0
	bl SioSend16
	adds r0, r6, #0
	bl Proc_Break
.L08036954:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L0803695C: .4byte 0x00002586
.L08036960: .4byte gSioSt

	thumb_func_start SetBmStLinkArenaFlag
SetBmStLinkArenaFlag: @ 0x08036964
	ldr r0, .L08036970 @ =gBmSt
	movs r1, #0x40
	ldrb r2, [r0, #4]
	orrs r1, r2
	strb r1, [r0, #4]
	bx lr
	.align 2, 0
.L08036970: .4byte gBmSt

	thumb_func_start UnsetBmStLinkArenaFlag
UnsetBmStLinkArenaFlag: @ 0x08036974
	ldr r1, .L08036980 @ =gBmSt
	movs r0, #0xbf
	ldrb r2, [r1, #4]
	ands r0, r2
	strb r0, [r1, #4]
	bx lr
	.align 2, 0
.L08036980: .4byte gBmSt

	thumb_func_start CheckInLinkArena
CheckInLinkArena: @ 0x08036984
	ldr r0, .L08036990 @ =gBmSt
	ldrb r0, [r0, #4]
	lsrs r0, r0, #6
	movs r1, #1
	ands r0, r1
	bx lr
	.align 2, 0
.L08036990: .4byte gBmSt

	thumb_func_start func_fe6_08036994
func_fe6_08036994: @ 0x08036994
	ldr r1, .L0803699C @ =gLinkArenaSt
	movs r0, #0xff
	strb r0, [r1, #4]
	bx lr
	.align 2, 0
.L0803699C: .4byte gLinkArenaSt

	thumb_func_start func_fe6_080369A0
func_fe6_080369A0: @ 0x080369A0
	push {r4, lr}
	ldr r3, .L080369D4 @ =gDispIo+0x3C
	ldr r1, .L080369D8 @ =0x0000FFE0
	ldrh r2, [r3]
	ands r1, r2
	movs r2, #4
	orrs r1, r2
	ldr r2, .L080369DC @ =0x0000E0FF
	ands r1, r2
	movs r4, #0xd8
	lsls r4, r4, #5
	adds r2, r4, #0
	orrs r1, r2
	strh r1, [r3]
	movs r1, #0x3f
	ldrb r2, [r3]
	ands r1, r2
	strb r1, [r3]
	movs r1, #0
	strb r1, [r3, #8]
	strb r1, [r3, #9]
	strb r1, [r3, #0xa]
	str r1, [r0, #0x58]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L080369D4: .4byte gDispIo+0x3C
.L080369D8: .4byte 0x0000FFE0
.L080369DC: .4byte 0x0000E0FF

	thumb_func_start func_fe6_080369E0
func_fe6_080369E0: @ 0x080369E0
	push {r4, r5, lr}
	ldr r1, [r0, #0x58]
	adds r1, #1
	str r1, [r0, #0x58]
	movs r4, #0x3f
	adds r3, r4, #0
	ands r3, r1
	cmp r3, #0x1f
	ble .L080369F6
	movs r0, #0x40
	subs r3, r0, r3
.L080369F6:
	cmp r3, #0x10
	ble .L080369FC
	movs r3, #0x10
.L080369FC:
	ldr r2, .L08036A34 @ =gDispIo+0x3C
	ldr r0, .L08036A38 @ =0x0000FFE0
	ldrh r1, [r2]
	ands r0, r1
	movs r1, #4
	orrs r0, r1
	ldr r1, .L08036A3C @ =0x0000E0FF
	ands r0, r1
	movs r5, #0xd8
	lsls r5, r5, #5
	adds r1, r5, #0
	orrs r0, r1
	strh r0, [r2]
	adds r0, r4, #0
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	movs r1, #0
	strb r3, [r2, #8]
	movs r0, #0x10
	subs r0, r0, r3
	strb r0, [r2, #9]
	strb r1, [r2, #0xa]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08036A34: .4byte gDispIo+0x3C
.L08036A38: .4byte 0x0000FFE0
.L08036A3C: .4byte 0x0000E0FF

	thumb_func_start func_fe6_08036A40
func_fe6_08036A40: @ 0x08036A40
	ldr r0, .L08036A50 @ =gDispIo
	ldrh r1, [r0, #0x20]
	adds r1, #1
	strh r1, [r0, #0x20]
	ldrh r1, [r0, #0x24]
	subs r1, #1
	strh r1, [r0, #0x24]
	bx lr
	.align 2, 0
.L08036A50: .4byte gDispIo

	thumb_func_start func_fe6_08036A54
func_fe6_08036A54: @ 0x08036A54
	push {lr}
	adds r2, r0, #0
	ldr r0, .L08036A74 @ =gSioSt
	ldr r0, [r0]
	ldr r1, .L08036A78 @ =0x00009ABC
	strh r1, [r0, #0x30]
	ldr r1, .L08036A7C @ =0x00001B7E
	adds r0, r0, r1
	ldrh r0, [r0]
	cmp r0, #0
	beq .L08036A70
	adds r0, r2, #0
	bl Proc_Break
.L08036A70:
	pop {r0}
	bx r0
	.align 2, 0
.L08036A74: .4byte gSioSt
.L08036A78: .4byte 0x00009ABC
.L08036A7C: .4byte 0x00001B7E

	thumb_func_start func_fe6_08036A80
func_fe6_08036A80: @ 0x08036A80
	ldr r0, .L08036A90 @ =gSioSt
	ldr r2, [r0]
	movs r1, #6
	ldrsb r1, [r2, r1]
	movs r0, #1
	lsls r0, r1
	strb r0, [r2, #0xa]
	bx lr
	.align 2, 0
.L08036A90: .4byte gSioSt

	thumb_func_start func_fe6_08036A94
func_fe6_08036A94: @ 0x08036A94
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, .L08036AD4 @ =gSioMsgBuf
	movs r2, #0
	movs r1, #0x19
	strb r1, [r0]
	ldr r4, .L08036AD8 @ =gSioSt
	ldr r1, [r4]
	ldrb r1, [r1, #6]
	strb r1, [r0, #1]
	strh r2, [r0, #2]
	movs r1, #4
	bl SioSend
	ldr r4, [r4]
	ldrb r0, [r4, #9]
	ldrb r1, [r4, #0xa]
	ands r0, r1
	ldrb r1, [r4, #9]
	cmp r0, r1
	bne .L08036ACE
	movs r1, #6
	ldrsb r1, [r4, r1]
	movs r0, #1
	lsls r0, r1
	strb r0, [r4, #0xa]
	adds r0, r5, #0
	bl Proc_Break
.L08036ACE:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08036AD4: .4byte gSioMsgBuf
.L08036AD8: .4byte gSioSt

	thumb_func_start SioHold_Loop
SioHold_Loop: @ 0x08036ADC
	push {lr}
	adds r2, r0, #0
	ldr r1, [r2, #0x30]
	ldr r0, [r2, #0x38]
	cmp r1, r0
	bge .L08036AF4
	ldr r0, [r2, #0x34]
	cmp r1, r0
	ble .L08036AF4
	ldr r0, [r2, #0x2c]
	bl PutFrozenUiHand
.L08036AF4:
	pop {r0}
	bx r0

	thumb_func_start StartSioHold
StartSioHold: @ 0x08036AF8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	mov r8, r3
	ldr r7, [sp, #0x18]
	ldr r0, .L08036B24 @ =ProcScr_SioHOLD
	adds r1, r4, #0
	bl SpawnProc
	str r5, [r0, #0x2c]
	str r6, [r0, #0x30]
	mov r1, r8
	str r1, [r0, #0x38]
	str r7, [r0, #0x34]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
.L08036B24: .4byte ProcScr_SioHOLD

	thumb_func_start EndSioHold
EndSioHold: @ 0x08036B28
	push {lr}
	ldr r0, .L08036B34 @ =ProcScr_SioHOLD
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
.L08036B34: .4byte ProcScr_SioHOLD

	thumb_func_start func_fe6_08036B38
func_fe6_08036B38: @ 0x08036B38
	ldr r2, [r0, #0x30]
	adds r2, r2, r1
	str r2, [r0, #0x30]
	bx lr

	thumb_func_start ClearSioBG
ClearSioBG: @ 0x08036B40
	push {lr}
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
	ldr r0, .L08036B8C @ =gBg0Tm
	movs r1, #0
	bl TmFill
	ldr r0, .L08036B90 @ =gBg1Tm
	movs r1, #0
	bl TmFill
	ldr r0, .L08036B94 @ =gBg2Tm
	movs r1, #0
	bl TmFill
	movs r0, #7
	bl EnableBgSync
	pop {r0}
	bx r0
	.align 2, 0
.L08036B8C: .4byte gBg0Tm
.L08036B90: .4byte gBg1Tm
.L08036B94: .4byte gBg2Tm

	thumb_func_start ClearSioAllBGs
ClearSioAllBGs: @ 0x08036B98
	push {lr}
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
	ldr r0, .L08036BEC @ =gBg0Tm
	movs r1, #0
	bl TmFill
	ldr r0, .L08036BF0 @ =gBg1Tm
	movs r1, #0
	bl TmFill
	ldr r0, .L08036BF4 @ =gBg2Tm
	movs r1, #0
	bl TmFill
	ldr r0, .L08036BF8 @ =gBg3Tm
	movs r1, #0
	bl TmFill
	movs r0, #0xf
	bl EnableBgSync
	pop {r0}
	bx r0
	.align 2, 0
.L08036BEC: .4byte gBg0Tm
.L08036BF0: .4byte gBg1Tm
.L08036BF4: .4byte gBg2Tm
.L08036BF8: .4byte gBg3Tm

	thumb_func_start SioPutText
SioPutText: @ 0x08036BFC
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r4, r1, #0
	lsls r1, r4, #3
	ldr r0, .L08036C28 @ =gSioTexts
	adds r5, r1, r0
	adds r0, r5, #0
	bl ClearText
	cmp r6, #0
	bge .L08036C30
	lsls r1, r4, #7
	movs r0, #0x80
	lsls r0, r0, #3
	adds r1, r1, r0
	ldr r0, .L08036C2C @ =gBg2Tm+0x2
	adds r1, r1, r0
	adds r0, r5, #0
	bl PutText
	b .L08036C56
	.align 2, 0
.L08036C28: .4byte gSioTexts
.L08036C2C: .4byte gBg2Tm+0x2
.L08036C30:
	adds r0, r6, #0
	bl DecodeMsg
	adds r1, r0, #0
	adds r0, r5, #0
	bl Text_DrawString
	lsls r1, r4, #7
	movs r0, #0x80
	lsls r0, r0, #3
	adds r1, r1, r0
	ldr r0, .L08036C5C @ =gBg2Tm+0x2
	adds r1, r1, r0
	adds r0, r5, #0
	bl PutText
	movs r0, #4
	bl EnableBgSync
.L08036C56:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08036C5C: .4byte gBg2Tm+0x2

	thumb_func_start func_fe6_08036C60
func_fe6_08036C60: @ 0x08036C60
	push {r4, r5, lr}
	ldr r5, .L08036CA4 @ =gSioText_0203C67C
	movs r4, #5
.L08036C66:
	adds r0, r5, #0
	movs r1, #0xc
	bl InitText
	adds r5, #8
	subs r4, #1
	cmp r4, #0
	bge .L08036C66
	ldr r5, .L08036CA8 @ =gLinkArenaSt + 0xC
	movs r4, #0xa
.L08036C7A:
	adds r0, r5, #0
	movs r1, #0xc
	bl InitText
	adds r5, #8
	subs r4, #1
	cmp r4, #0
	bge .L08036C7A
	ldr r5, .L08036CAC @ =gSioTexts
	movs r4, #1
.L08036C8E:
	adds r0, r5, #0
	movs r1, #0x18
	bl InitText
	adds r5, #8
	subs r4, #1
	cmp r4, #0
	bge .L08036C8E
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08036CA4: .4byte gSioText_0203C67C
.L08036CA8: .4byte gLinkArenaSt + 0xC
.L08036CAC: .4byte gSioTexts

	thumb_func_start SioSetNormalWeapons
SioSetNormalWeapons: @ 0x08036CB0
	push {r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	ldr r1, .L08036D04 @ =Sio_ItemLists_0810F151
	mov r0, sp
	movs r2, #8
	bl memcpy
	movs r1, #0
	movs r4, #4
	adds r0, r5, #0
	adds r0, #0x24
.L08036CC8:
	strh r1, [r0]
	subs r0, #2
	subs r4, #1
	cmp r4, #0
	bge .L08036CC8
	movs r4, #0
.L08036CD4:
	cmp r4, #4
	beq .L08036CF6
	adds r0, r5, #0
	adds r0, #0x26
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0
	beq .L08036CF6
	mov r1, sp
	adds r0, r1, r4
	movs r1, #0xff
	lsls r1, r1, #8
	ldrb r0, [r0]
	orrs r1, r0
	adds r0, r5, #0
	bl UnitAddItem
.L08036CF6:
	adds r4, #1
	cmp r4, #7
	ble .L08036CD4
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08036D04: .4byte Sio_ItemLists_0810F151

	thumb_func_start SioPlaySe
SioPlaySe: @ 0x08036D08
	push {r4, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r1, .L08036D34 @ =gUnk_Sio_0810F15A
	mov r0, sp
	movs r2, #8
	bl memcpy
	ldr r0, .L08036D38 @ =gPlaySt
	ldrb r0, [r0, #0x1d]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L08036D2C
	lsls r0, r4, #1
	add r0, sp
	ldrh r0, [r0]
	bl m4aSongNumStart
.L08036D2C:
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08036D34: .4byte gUnk_Sio_0810F15A
.L08036D38: .4byte gPlaySt

	thumb_func_start func_fe6_08036D3C
func_fe6_08036D3C: @ 0x08036D3C
	push {r4, lr}
	ldr r4, .L08036D5C @ =gSioSaveConfig
	adds r0, r4, #0
	bl ReadMultiArenaSaveConfig
	movs r0, #8
	ldrb r1, [r4]
	orrs r0, r1
	strb r0, [r4]
	adds r0, r4, #0
	bl WriteMultiArenaSaveConfig
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08036D5C: .4byte gSioSaveConfig

	thumb_func_start SioIsKeyInputSequenceComplete
SioIsKeyInputSequenceComplete: @ 0x08036D60
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, .L08036D84 @ =gKeySt
	ldr r0, [r0]
	ldrh r4, [r0, #8]
	adds r3, r4, #0
	cmp r3, #0
	bne .L08036D90
	ldr r1, .L08036D88 @ =gKeyInputSequenceTimer
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	cmp r0, #0x13
	ble .L08036DE4
	ldr r0, .L08036D8C @ =gTargetKeyInSeqIndex
	str r3, [r1]
	str r3, [r0]
	b .L08036DE4
	.align 2, 0
.L08036D84: .4byte gKeySt
.L08036D88: .4byte gKeyInputSequenceTimer
.L08036D8C: .4byte gTargetKeyInSeqIndex
.L08036D90:
	ldr r0, .L08036DC4 @ =gKeyInputSequenceTimer
	movs r6, #0
	str r6, [r0]
	ldr r1, .L08036DC8 @ =gKeyInputSequenceBuffer
	ldr r2, .L08036DCC @ =gCurrentKeyInSeqIndex
	ldr r0, [r2]
	lsls r0, r0, #1
	adds r0, r0, r1
	strh r4, [r0]
	ldr r1, .L08036DD0 @ =gTargetKeyInSeqIndex
	ldr r4, [r1]
	lsls r0, r4, #1
	adds r0, r0, r5
	ldrh r0, [r0]
	cmp r3, r0
	bne .L08036DD8
	adds r0, r4, #1
	str r0, [r1]
	lsls r0, r0, #1
	adds r0, r0, r5
	ldr r1, .L08036DD4 @ =0x0000FFFF
	ldrh r0, [r0]
	cmp r0, r1
	bne .L08036DDA
	movs r0, #1
	b .L08036DE6
	.align 2, 0
.L08036DC4: .4byte gKeyInputSequenceTimer
.L08036DC8: .4byte gKeyInputSequenceBuffer
.L08036DCC: .4byte gCurrentKeyInSeqIndex
.L08036DD0: .4byte gTargetKeyInSeqIndex
.L08036DD4: .4byte 0x0000FFFF
.L08036DD8:
	str r6, [r1]
.L08036DDA:
	ldr r0, [r2]
	adds r0, #1
	movs r1, #0xf
	ands r0, r1
	str r0, [r2]
.L08036DE4:
	movs r0, #0
.L08036DE6:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start func_fe6_08036DEC
func_fe6_08036DEC: @ 0x08036DEC
	push {lr}
	ldr r0, .L08036DFC @ =gSioKeyList_085C9A18
	bl SioIsKeyInputSequenceComplete
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1
	.align 2, 0
.L08036DFC: .4byte gSioKeyList_085C9A18

	thumb_func_start StartLinkArenaTeamList
StartLinkArenaTeamList: @ 0x08036E00
	push {lr}
	adds r1, r0, #0
	ldr r0, .L08036E10 @ =ProcScr_SioTeamList
	bl SpawnProcLocking
	pop {r0}
	bx r0
	.align 2, 0
.L08036E10: .4byte ProcScr_SioTeamList

	thumb_func_start SioTeamList_Init
SioTeamList_Init: @ 0x08036E14
	mov ip, r0
	mov r2, ip
	adds r2, #0x4a
	movs r3, #0
	movs r1, #0
	movs r0, #0xd8
	strh r0, [r2]
	mov r0, ip
	adds r0, #0x48
	strb r3, [r0]
	mov r0, ip
	str r1, [r0, #0x40]
	str r1, [r0, #0x3c]
	adds r0, #0x52
	strb r3, [r0]
	adds r2, #0xa
	movs r0, #0xff
	ldrb r1, [r2]
	orrs r1, r0
	strb r1, [r2]
	mov r1, ip
	adds r1, #0x53
	ldrb r2, [r1]
	orrs r0, r2
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x4c
	strb r3, [r0]
	bx lr
	.align 2, 0

	thumb_func_start CanBuildNewLinkArenaTeam
CanBuildNewLinkArenaTeam: @ 0x08036E50
	push {r4, lr}
	ldr r0, .L08036E5C @ =gLinkArenaSt
	ldrb r0, [r0, #0xa]
	cmp r0, #0
	bne .L08036E64
	b .L08036E7C
	.align 2, 0
.L08036E5C: .4byte gLinkArenaSt
.L08036E60:
	movs r0, #1
	b .L08036E7E
.L08036E64:
	movs r2, #0
	movs r3, #0x80
	ldr r1, .L08036E84 @ =gLinkArenaTeamList
.L08036E6A:
	adds r0, r3, #0
	ldrb r4, [r1, #0xf]
	ands r0, r4
	cmp r0, #0
	bne .L08036E60
	adds r1, #0x14
	adds r2, #1
	cmp r2, #9
	ble .L08036E6A
.L08036E7C:
	movs r0, #0
.L08036E7E:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
.L08036E84: .4byte gLinkArenaTeamList

	thumb_func_start CanDirectlyBuildNewLinkArenaTeam
CanDirectlyBuildNewLinkArenaTeam: @ 0x08036E88
	push {r4, lr}
	movs r2, #0
	movs r3, #0x80
	ldr r1, .L08036EA0 @ =gLinkArenaTeamList
.L08036E90:
	adds r0, r3, #0
	ldrb r4, [r1, #0xf]
	ands r0, r4
	cmp r0, #0
	bne .L08036EA4
	movs r0, #1
	b .L08036EAE
	.align 2, 0
.L08036EA0: .4byte gLinkArenaTeamList
.L08036EA4:
	adds r1, #0x14
	adds r2, #1
	cmp r2, #9
	ble .L08036E90
	movs r0, #0
.L08036EAE:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start GetSioTeams
GetSioTeams: @ 0x08036EB4
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0x10
	mov sb, r0
	lsls r1, r1, #0x18
	lsrs r4, r1, #0x18
	movs r7, #0
	ldr r1, .L08036EE4 @ =gSioTeamListConfigLut
	lsls r0, r4, #2
	adds r0, r0, r1
	ldr r0, [r0]
	mov r8, r0
	bl InitUnits
	cmp r4, #0
	beq .L08036EE8
	cmp r4, #0
	blt .L08036F92
	cmp r4, #2
	bgt .L08036F92
	movs r6, #0
	b .L08036F54
	.align 2, 0
.L08036EE4: .4byte gSioTeamListConfigLut
.L08036EE8:
	movs r6, #0
	mov r1, sb
	lsls r0, r1, #4
	mov r1, r8
	adds r5, r0, r1
	movs r0, #1
	mov r8, r0
	movs r7, #0
.L08036EF8:
	ldr r0, .L08036F14 @ =gLinkArenaTeamList
	adds r4, r7, r0
	adds r0, r6, #0
	adds r1, r4, #0
	bl ReadMultiArenaSaveTeamName
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne .L08036F18
	ldrb r0, [r5, #4]
	strb r0, [r4, #0x10]
	strb r6, [r4, #0xf]
	b .L08036F30
	.align 2, 0
.L08036F14: .4byte gLinkArenaTeamList
.L08036F18:
	ldr r0, .L08036F50 @ =SioText_NoData
	adds r1, r4, #0
	bl SioStrCpy
	ldrb r0, [r5, #5]
	strb r0, [r4, #0x10]
	movs r0, #0x80
	rsbs r0, r0, #0
	adds r1, r0, #0
	adds r0, r6, #0
	orrs r0, r1
	strb r0, [r4, #0xf]
.L08036F30:
	mov r0, r8
	bl GetUnit
	adds r1, r0, #0
	adds r0, r6, #0
	mov r2, sp
	bl ReadMultiArenaSaveTeam
	movs r1, #5
	add r8, r1
	adds r7, #0x14
	adds r6, #1
	cmp r6, #9
	ble .L08036EF8
	adds r7, r6, #0
	b .L08036F92
	.align 2, 0
.L08036F50: .4byte SioText_NoData
.L08036F54:
	lsls r0, r7, #2
	adds r5, r0, r7
	lsls r1, r5, #2
	ldr r0, .L08036FA4 @ =gLinkArenaTeamList
	adds r4, r1, r0
	adds r0, r6, #0
	adds r1, r4, #0
	bl ReadMultiArenaSaveTeamName
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne .L08036F8C
	mov r1, sb
	lsls r0, r1, #4
	add r0, r8
	ldrb r0, [r0, #4]
	strb r0, [r4, #0x10]
	strb r6, [r4, #0xf]
	adds r0, r5, #1
	bl GetUnit
	adds r1, r0, #0
	adds r0, r6, #0
	mov r2, sp
	bl ReadMultiArenaSaveTeam
	adds r7, #1
.L08036F8C:
	adds r6, #1
	cmp r6, #9
	ble .L08036F54
.L08036F92:
	adds r0, r7, #0
	add sp, #0x10
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
.L08036FA4: .4byte gLinkArenaTeamList

	thumb_func_start DrawLinkArenaTeamName
DrawLinkArenaTeamName: @ 0x08036FA8
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	adds r5, r0, #0
	lsls r0, r5, #3
	mov r8, r0
	ldr r6, .L08037010 @ =gLinkArenaSt + 0xC
	adds r0, r0, r6
	mov sb, r0
	bl ClearText
	mov r0, sb
	movs r1, #0
	bl Text_SetColor
	lsls r4, r5, #2
	adds r4, r4, r5
	lsls r4, r4, #2
	ldr r0, .L08037014 @ =gLinkArenaTeamList
	adds r4, r4, r0
	mov r0, sb
	adds r1, r4, #0
	bl Text_DrawString
	subs r6, #0xc
	add r8, r6
	ldr r1, .L08037018 @ =0x00000FFF
	mov r2, r8
	ldrh r2, [r2, #0xc]
	ands r1, r2
	movs r0, #0xf
	ldrb r4, [r4, #0x10]
	ands r0, r4
	lsls r0, r0, #0xc
	orrs r1, r0
	mov r0, r8
	strh r1, [r0, #0xc]
	lsls r5, r5, #7
	ldr r0, .L0803701C @ =gBg1Tm+0x16
	adds r5, r5, r0
	mov r0, sb
	adds r1, r5, #0
	bl PutText
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08037010: .4byte gLinkArenaSt + 0xC
.L08037014: .4byte gLinkArenaTeamList
.L08037018: .4byte 0x00000FFF
.L0803701C: .4byte gBg1Tm+0x16

	thumb_func_start DrawAllLinkArenaTeams
DrawAllLinkArenaTeams: @ 0x08037020
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r4, #0
	b .L08037030
.L08037028:
	adds r0, r4, #0
	bl DrawLinkArenaTeamName
	adds r4, #1
.L08037030:
	ldr r0, [r5, #0x38]
	cmp r4, r0
	blt .L08037028
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start func_fe6_0803703C
func_fe6_0803703C: @ 0x0803703C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	adds r4, r0, #0
	lsls r1, r1, #0x18
	ldr r0, .L0803707C @ =gSioTeamListConfigLut
	lsrs r1, r1, #0x16
	adds r1, r1, r0
	ldr r1, [r1]
	mov r8, r1
	movs r6, #0
	ldr r0, [r4, #0x38]
	cmp r6, r0
	bge .L080370C8
	ldr r0, .L08037080 @ =gLinkArenaSt
	adds r5, r0, #0
	adds r5, #0xc
	ldr r3, .L08037084 @ =gLinkArenaTeamList
	movs r2, #0
.L08037064:
	ldr r0, .L08037084 @ =gLinkArenaTeamList
	adds r1, r2, r0
	movs r0, #0x80
	ldrb r7, [r1, #0xf]
	ands r0, r7
	cmp r0, #0
	bne .L08037088
	ldr r0, [r4, #0x3c]
	lsls r0, r0, #4
	add r0, r8
	ldrb r0, [r0, #4]
	b .L08037090
	.align 2, 0
.L0803707C: .4byte gSioTeamListConfigLut
.L08037080: .4byte gLinkArenaSt
.L08037084: .4byte gLinkArenaTeamList
.L08037088:
	ldr r0, [r4, #0x3c]
	lsls r0, r0, #4
	add r0, r8
	ldrb r0, [r0, #5]
.L08037090:
	strb r0, [r1, #0x10]
	ldr r0, .L080370DC @ =0x00000FFF
	adds r1, r0, #0
	ldrh r7, [r5]
	ands r1, r7
	movs r0, #0xf
	ldrb r7, [r3, #0x10]
	ands r0, r7
	lsls r0, r0, #0xc
	orrs r1, r0
	strh r1, [r5]
	lsls r1, r6, #7
	ldr r0, .L080370E0 @ =gBg1Tm+0x16
	adds r1, r1, r0
	adds r0, r5, #0
	str r2, [sp]
	str r3, [sp, #4]
	bl PutText
	adds r5, #8
	ldr r3, [sp, #4]
	adds r3, #0x14
	ldr r2, [sp]
	adds r2, #0x14
	adds r6, #1
	ldr r0, [r4, #0x38]
	cmp r6, r0
	blt .L08037064
.L080370C8:
	movs r0, #2
	bl EnableBgSync
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L080370DC: .4byte 0x00000FFF
.L080370E0: .4byte gBg1Tm+0x16

	thumb_func_start SioTeamList_EraseTeam
SioTeamList_EraseTeam: @ 0x080370E4
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r7, r0, #0
	ldr r5, [r7, #0x40]
	ldr r1, .L08037168 @ =gSioTeamListConfigLut
	ldr r0, .L0803716C @ =gLinkArenaSt
	mov sb, r0
	ldrb r2, [r0]
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r0, [r0]
	mov r8, r0
	lsls r4, r5, #2
	adds r4, r4, r5
	adds r0, r4, #1
	bl GetUnit
	adds r6, r0, #0
	ldr r0, .L08037170 @ =gLinkArenaTeamList
	lsls r4, r4, #2
	adds r4, r4, r0
	movs r0, #0x7f
	ldrb r3, [r4, #0xf]
	ands r0, r3
	bl WipeMultiArenaSaveTeam
	adds r0, r5, #0
	adds r1, r6, #0
	adds r2, r4, #0
	bl ReadMultiArenaSaveTeam
	ldr r0, .L08037174 @ =SioText_NoData
	adds r1, r4, #0
	bl SioStrCpy
	ldr r0, [r7, #0x3c]
	lsls r0, r0, #4
	add r0, r8
	ldrb r0, [r0, #5]
	strb r0, [r4, #0x10]
	movs r0, #0x80
	rsbs r0, r0, #0
	adds r1, r0, #0
	adds r0, r5, #0
	orrs r0, r1
	strb r0, [r4, #0xf]
	adds r0, r5, #0
	bl DrawLinkArenaTeamName
	bl CanDirectlyBuildNewLinkArenaTeam
	lsls r0, r0, #0x18
	cmp r0, #0
	bne .L08037178
	mov r1, sb
	ldrb r0, [r1]
	adds r1, r7, #0
	bl func_fe6_080372B0
	adds r0, r7, #0
	movs r1, #2
	bl Proc_Goto
	b .L0803718C
	.align 2, 0
.L08037168: .4byte gSioTeamListConfigLut
.L0803716C: .4byte gLinkArenaSt
.L08037170: .4byte gLinkArenaTeamList
.L08037174: .4byte SioText_NoData
.L08037178:
	adds r0, r7, #0
	adds r0, #0x4d
	ldrb r0, [r0]
	cmp r0, #0
	bne .L0803718C
	mov r2, sb
	ldrb r0, [r2]
	adds r1, r7, #0
	bl func_fe6_080372B0
.L0803718C:
	ldr r0, [r7, #0x38]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, r7, #0
	adds r1, #0x4a
	ldrh r1, [r1]
	adds r1, #0x28
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl UpdateLinkArenaMenuScrollBar
	movs r0, #2
	bl EnableBgSync
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start SioTeamList_SwapTeams
SioTeamList_SwapTeams: @ 0x080371B4
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	mov sb, r0
	ldr r7, [r0, #0x40]
	adds r0, #0x53
	ldrb r0, [r0]
	mov r8, r0
	ldr r2, .L0803721C @ =gLinkArenaTeamList
	lsls r5, r0, #2
	add r5, r8
	lsls r0, r5, #2
	adds r6, r0, r2
	movs r1, #0x7f
	adds r0, r1, #0
	ldrb r3, [r6, #0xf]
	ands r0, r3
	lsls r4, r7, #2
	adds r4, r4, r7
	lsls r4, r4, #2
	adds r4, r4, r2
	ldrb r2, [r4, #0xf]
	ands r1, r2
	bl SwapMultiArenaSaveTeams
	ldrb r1, [r6, #0x10]
	ldrb r0, [r4, #0x10]
	strb r0, [r6, #0x10]
	strb r1, [r4, #0x10]
	adds r5, #1
	adds r0, r5, #0
	bl GetUnit
	adds r1, r0, #0
	mov r0, r8
	adds r2, r6, #0
	bl ReadMultiArenaSaveTeam
	lsls r0, r0, #0x18
	cmp r0, #0
	bne .L08037224
	ldr r0, .L08037220 @ =SioText_NoData
	adds r1, r6, #0
	bl SioStrCpy
	movs r3, #0x80
	rsbs r3, r3, #0
	adds r1, r3, #0
	mov r0, r8
	orrs r0, r1
	b .L08037226
	.align 2, 0
.L0803721C: .4byte gLinkArenaTeamList
.L08037220: .4byte SioText_NoData
.L08037224:
	mov r0, r8
.L08037226:
	strb r0, [r6, #0xf]
	lsls r4, r7, #2
	adds r4, r4, r7
	adds r0, r4, #1
	bl GetUnit
	adds r1, r0, #0
	lsls r4, r4, #2
	ldr r0, .L08037260 @ =gLinkArenaTeamList
	adds r4, r4, r0
	adds r0, r7, #0
	adds r2, r4, #0
	bl ReadMultiArenaSaveTeam
	lsls r0, r0, #0x18
	cmp r0, #0
	bne .L08037268
	ldr r0, .L08037264 @ =SioText_NoData
	adds r1, r4, #0
	bl SioStrCpy
	movs r2, #0x80
	rsbs r2, r2, #0
	adds r1, r2, #0
	adds r0, r7, #0
	orrs r0, r1
	strb r0, [r4, #0xf]
	b .L0803726A
	.align 2, 0
.L08037260: .4byte gLinkArenaTeamList
.L08037264: .4byte SioText_NoData
.L08037268:
	strb r7, [r4, #0xf]
.L0803726A:
	adds r0, r7, #0
	bl DrawLinkArenaTeamName
	mov r0, r8
	bl DrawLinkArenaTeamName
	mov r3, sb
	ldr r0, [r3, #0x38]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r1, sb
	adds r1, #0x4a
	ldrh r1, [r1]
	adds r1, #0x28
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl UpdateLinkArenaMenuScrollBar
	mov r1, sb
	ldr r0, [r1, #0x30]
	bl Proc_End
	mov r1, sb
	adds r1, #0x52
	movs r0, #4
	strb r0, [r1]
	movs r0, #2
	bl EnableBgSync
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start func_fe6_080372B0
func_fe6_080372B0: @ 0x080372B0
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	mov r8, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r6, #0
	ldr r2, .L08037324 @ =gSioTeamListConfigLut
	lsls r1, r0, #2
	adds r1, r1, r2
	ldr r7, [r1]
	cmp r0, #1
	bne .L08037334
	ldr r1, .L08037328 @ =gLinkArenaSt
	ldrb r0, [r1, #5]
	adds r0, #2
	cmp r6, r0
	bge .L0803731A
	mov sb, r1
	movs r0, #5
	mov r8, r0
	mov r5, sb
	adds r5, #0x64
	movs r7, #0
.L080372E4:
	ldr r4, .L0803732C @ =0x0203C944
	adds r4, r7, r4
	ldr r0, .L08037330 @ =gUnk_Sio_0810F170
	adds r1, r4, #0
	bl SioStrCpy
	adds r0, r5, #0
	bl ClearText
	movs r0, #0xa
	str r0, [sp]
	adds r0, r5, #0
	movs r1, #1
	mov r2, r8
	adds r3, r4, #0
	bl PutDrawTextCentered
	movs r1, #3
	add r8, r1
	adds r5, #8
	adds r7, #0xf
	adds r6, #1
	mov r1, sb
	ldrb r0, [r1, #5]
	adds r0, #2
	cmp r6, r0
	blt .L080372E4
.L0803731A:
	ldr r0, .L08037328 @ =gLinkArenaSt
	ldrb r0, [r0, #5]
	adds r0, #2
	b .L08037394
	.align 2, 0
.L08037324: .4byte gSioTeamListConfigLut
.L08037328: .4byte gLinkArenaSt
.L0803732C: .4byte 0x0203C944
.L08037330: .4byte gUnk_Sio_0810F170
.L08037334:
	lsls r0, r6, #4
	adds r1, r0, r7
	ldr r0, [r1, #8]
	cmp r0, #0
	bne .L08037342
	adds r0, r6, #0
	b .L08037394
.L08037342:
	mov r0, r8
	adds r0, #0x4d
	adds r4, r0, r6
	movs r0, #1
	strb r0, [r4]
	movs r5, #0
	ldr r0, [r1, #0xc]
	cmp r0, #0
	beq .L08037362
	bl _call_via_r0
	lsls r0, r0, #0x18
	cmp r0, #0
	bne .L08037362
	strb r5, [r4]
	movs r5, #1
.L08037362:
	lsls r4, r6, #3
	ldr r0, .L08037390 @ =gSioText_0203C67C
	adds r4, r4, r0
	adds r0, r4, #0
	bl ClearText
	adds r0, r4, #0
	adds r1, r5, #0
	bl Text_SetColor
	lsls r2, r6, #1
	adds r2, #5
	lsls r0, r6, #4
	adds r0, r0, r7
	ldr r3, [r0, #8]
	movs r0, #7
	str r0, [sp]
	adds r0, r4, #0
	movs r1, #1
	bl PutDrawTextCentered
	adds r6, #1
	b .L08037334
	.align 2, 0
.L08037390: .4byte gSioText_0203C67C
.L08037394:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start GetLATeamListHelpTextId
GetLATeamListHelpTextId: @ 0x080373A4
	adds r3, r0, #0
	ldr r2, .L080373C0 @ =gSioTeamListConfigLut
	ldr r0, .L080373C4 @ =gLinkArenaSt
	ldrb r1, [r0]
	lsls r0, r1, #2
	adds r0, r0, r2
	ldr r2, [r0]
	cmp r1, #1
	beq .L080373C8
	ldr r0, [r3, #0x3c]
	lsls r0, r0, #4
	adds r0, r0, r2
	ldrh r0, [r0, #2]
	b .L080373DA
	.align 2, 0
.L080373C0: .4byte gSioTeamListConfigLut
.L080373C4: .4byte gLinkArenaSt
.L080373C8:
	ldr r0, [r3, #0x3c]
	cmp r0, #0
	beq .L080373D8
	ldr r0, .L080373D4 @ =0x000006D2
	b .L080373DA
	.align 2, 0
.L080373D4: .4byte 0x000006D2
.L080373D8:
	ldr r0, .L080373DC @ =0x000006D1
.L080373DA:
	bx lr
	.align 2, 0
.L080373DC: .4byte 0x000006D1

	thumb_func_start SioTeamList_SetupGfx
SioTeamList_SetupGfx: @ 0x080373E0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x10
	adds r7, r0, #0
	ldr r4, .L080375C0 @ =Pal_Text
	bl ClearSioBG
	bl InitSioBG
	ldr r0, .L080375C4 @ =Img_TacticianSelObj
	ldr r1, .L080375C8 @ =0x06014800
	bl Decompress
	movs r0, #0
	movs r1, #2
	bl Sio_RestartBgSlide
	ldr r0, .L080375CC @ =gBg2Tm+0x112
	ldr r1, .L080375D0 @ =Tsa_Sio_08109DF4
	movs r2, #0x80
	lsls r2, r2, #5
	bl TmApplyTsa_thm
	ldr r0, .L080375D4 @ =Pal_TacticianSelObj
	movs r1, #0x98
	lsls r1, r1, #2
	movs r2, #0x80
	bl ApplyPaletteExt
	ldr r0, .L080375D8 @ =Img_Sio_081080D4
	ldr r1, .L080375DC @ =0x06016000
	bl Decompress
	ldr r0, .L080375E0 @ =Pal_Sio_0831AABC
	movs r1, #0x88
	lsls r1, r1, #2
	movs r2, #0x40
	bl ApplyPaletteExt
	ldr r2, .L080375E4 @ =gPal
	adds r1, r2, #0
	adds r1, #0x40
	movs r0, #0
	strh r0, [r1]
	adds r2, #0x42
	movs r3, #2
.L0803743E:
	ldrh r0, [r4, #8]
	strh r0, [r2]
	adds r4, #2
	adds r2, #2
	subs r3, #1
	cmp r3, #0
	bge .L0803743E
	bl EnablePalSync
	ldr r0, .L080375E8 @ =gSioFont_0203C758
	bl SetTextFont
	bl InitSystemTextFont
	bl ResetTextFont
	bl func_fe6_08036C60
	bl ApplyUnitSpritePalettes
	bl ResetUnitSprites
	bl ForceSyncUnitSpriteSheet
	ldr r0, [r7, #0x3c]
	ldr r1, .L080375EC @ =gLinkArenaSt
	ldrb r1, [r1]
	bl GetSioTeams
	str r0, [r7, #0x38]
	adds r6, r7, #0
	adds r6, #0x5c
	adds r5, r7, #0
	adds r5, #0x4a
	movs r1, #0
	add r0, sp, #0xc
.L08037486:
	strb r1, [r0]
	subs r0, #1
	add r2, sp, #8
	cmp r0, r2
	bge .L08037486
	ldr r0, [r7, #0x3c]
	mov r1, sp
	adds r1, r1, r0
	adds r1, #8
	movs r0, #1
	strb r0, [r1]
	ldr r4, .L080375EC @ =gLinkArenaSt
	ldrb r0, [r4]
	adds r1, r7, #0
	bl func_fe6_080372B0
	str r0, [r7, #0x34]
	adds r0, r7, #0
	bl DrawAllLinkArenaTeams
	ldr r1, [r7, #0x34]
	adds r0, r7, #0
	add r2, sp, #8
	bl func_fe6_080403C0
	str r0, [r7, #0x2c]
	movs r3, #0
	adds r4, #6
	movs r2, #0xff
.L080374C0:
	adds r1, r3, r4
	ldrb r0, [r1]
	orrs r0, r2
	strb r0, [r1]
	adds r3, #1
	cmp r3, #3
	ble .L080374C0
	movs r4, #0
	strb r4, [r6]
	ldrh r2, [r5]
	movs r0, #1
	movs r1, #0
	bl SetBgOffset
	ldr r0, .L080375F0 @ =gDispIo
	mov ip, r0
	movs r0, #0x20
	mov r1, ip
	ldrb r1, [r1, #1]
	orrs r0, r1
	movs r1, #0x40
	orrs r0, r1
	movs r1, #0x7f
	ands r0, r1
	mov r2, ip
	strb r0, [r2, #1]
	mov r0, ip
	adds r0, #0x2d
	strb r4, [r0]
	mov r1, ip
	adds r1, #0x31
	movs r0, #0x28
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x2c
	movs r2, #0xf0
	strb r2, [r0]
	adds r0, #4
	movs r1, #0x88
	strb r1, [r0]
	subs r0, #1
	strb r4, [r0]
	adds r0, #4
	strb r1, [r0]
	subs r0, #5
	strb r2, [r0]
	mov r1, ip
	adds r1, #0x32
	movs r0, #0xa0
	strb r0, [r1]
	mov r5, ip
	adds r5, #0x34
	movs r2, #1
	ldrb r0, [r5]
	orrs r0, r2
	movs r1, #2
	orrs r0, r1
	movs r4, #4
	orrs r0, r4
	movs r3, #8
	orrs r0, r3
	movs r6, #0x10
	orrs r0, r6
	strb r0, [r5]
	movs r0, #0x35
	add r0, ip
	mov r8, r0
	ldrb r0, [r0]
	orrs r0, r2
	movs r5, #3
	rsbs r5, r5, #0
	ands r0, r5
	orrs r0, r4
	orrs r0, r3
	movs r1, #0x11
	rsbs r1, r1, #0
	ands r0, r1
	mov r1, r8
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x36
	ldrb r1, [r0]
	orrs r2, r1
	ands r2, r5
	orrs r2, r4
	orrs r2, r3
	orrs r2, r6
	strb r2, [r0]
	ldr r0, [r7, #0x2c]
	ldr r1, .L080375F4 @ =gUnk_Sio_0810F19C
	ldr r4, .L080375EC @ =gLinkArenaSt
	ldrb r2, [r4]
	adds r1, r2, r1
	ldrb r1, [r1]
	bl StartLinkArenaTitleBanner
	ldr r0, .L080375F8 @ =gUnk_Sio_085C9AD4
	ldrb r3, [r4]
	lsls r1, r3, #2
	adds r0, r1, r0
	ldr r0, [r0]
	ldr r2, .L080375FC @ =gUnk_Sio_0810F190
	adds r1, r1, r2
	ldr r1, [r1]
	str r3, [sp]
	ldr r2, [r7, #0x2c]
	str r2, [sp, #4]
	movs r2, #0
	movs r3, #8
	bl func_fe6_0803FD40
	adds r0, r7, #0
	bl GetLATeamListHelpTextId
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #1
	bl SioPutText
	movs r0, #0xf
	bl EnableBgSync
	add sp, #0x10
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L080375C0: .4byte Pal_Text
.L080375C4: .4byte Img_TacticianSelObj
.L080375C8: .4byte 0x06014800
.L080375CC: .4byte gBg2Tm+0x112
.L080375D0: .4byte Tsa_Sio_08109DF4
.L080375D4: .4byte Pal_TacticianSelObj
.L080375D8: .4byte Img_Sio_081080D4
.L080375DC: .4byte 0x06016000
.L080375E0: .4byte Pal_Sio_0831AABC
.L080375E4: .4byte gPal
.L080375E8: .4byte gSioFont_0203C758
.L080375EC: .4byte gLinkArenaSt
.L080375F0: .4byte gDispIo
.L080375F4: .4byte gUnk_Sio_0810F19C
.L080375F8: .4byte gUnk_Sio_085C9AD4
.L080375FC: .4byte gUnk_Sio_0810F190

	thumb_func_start SioTeamList_Main_HandleDPadInput
SioTeamList_Main_HandleDPadInput: @ 0x08037600
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	lsls r1, r1, #0x18
	lsrs r7, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r5, r2, #0x18
	lsls r3, r3, #0x18
	lsrs r6, r3, #0x18
	ldr r1, .L08037660 @ =gKeySt
	ldr r2, [r1]
	ldrh r3, [r2, #6]
	movs r0, #0x40
	ands r0, r3
	cmp r0, #0
	beq .L08037636
	ldr r0, [r4]
	cmp r0, r5
	bgt .L0803762A
	ldrh r2, [r2, #8]
	cmp r3, r2
	bne .L08037636
.L0803762A:
	subs r0, #1
	str r0, [r4]
	cmp r0, #0
	bge .L08037636
	subs r0, r6, #1
	str r0, [r4]
.L08037636:
	ldr r1, [r1]
	ldrh r2, [r1, #6]
	movs r0, #0x80
	ands r0, r2
	cmp r0, #0
	beq .L0803765A
	ldr r0, [r4]
	cmp r0, r7
	blt .L0803764E
	ldrh r1, [r1, #8]
	cmp r2, r1
	bne .L0803765A
.L0803764E:
	adds r0, #1
	str r0, [r4]
	adds r1, r6, #0
	bl __modsi3
	str r0, [r4]
.L0803765A:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08037660: .4byte gKeySt

	thumb_func_start SioTeamList_Loop_MainKeyHandler
SioTeamList_Loop_MainKeyHandler: @ 0x08037664
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r4, r0, #0
	ldr r6, [r4, #0x3c]
	ldr r1, .L08037730 @ =gSioTeamListConfigLut
	ldr r0, .L08037734 @ =gLinkArenaSt
	mov r8, r0
	ldrb r2, [r0]
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r0, [r0]
	mov sb, r0
	ldr r5, [r4, #0x2c]
	adds r0, r5, #0
	adds r0, #0x44
	movs r3, #0
	mov sl, r3
	movs r7, #1
	strb r7, [r0]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r5, #0x48]
	adds r0, r4, #0
	adds r0, #0x3c
	ldr r3, [r4, #0x34]
	subs r1, r3, #1
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	movs r2, #0
	bl SioTeamList_Main_HandleDPadInput
	ldr r0, [r4, #0x3c]
	cmp r6, r0
	beq .L080376E2
	movs r0, #3
	bl SioPlaySe
	adds r0, r5, #0
	adds r0, #0x3a
	adds r1, r0, r6
	mov r2, sl
	strb r2, [r1]
	ldr r1, [r4, #0x3c]
	adds r0, r0, r1
	strb r7, [r0]
	mov r3, r8
	ldrb r1, [r3]
	adds r0, r4, #0
	bl func_fe6_0803703C
	adds r0, r4, #0
	bl GetLATeamListHelpTextId
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #1
	bl SioPutText
.L080376E2:
	ldr r0, .L08037738 @ =gKeySt
	ldr r1, [r0]
	adds r0, r7, #0
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq .L08037774
	mov r0, r8
	ldrb r0, [r0]
	cmp r0, #1
	beq .L08037752
	adds r0, r4, #0
	adds r0, #0x4d
	ldr r1, [r4, #0x3c]
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq .L0803774A
	lsls r0, r1, #4
	add r0, sb
	ldrb r0, [r0]
	adds r1, r4, #0
	adds r1, #0x52
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #7
	bne .L0803773C
	movs r0, #1
	bl SioPlaySe
	adds r0, r4, #0
	movs r1, #9
	bl Proc_Goto
	movs r0, #0xff
	mov r1, r8
	strb r0, [r1, #3]
	b .L080377CE
	.align 2, 0
.L08037730: .4byte gSioTeamListConfigLut
.L08037734: .4byte gLinkArenaSt
.L08037738: .4byte gKeySt
.L0803773C:
	movs r0, #2
	bl SioPlaySe
	adds r0, r4, #0
	bl Proc_Break
	b .L08037774
.L0803774A:
	movs r0, #0
	bl SioPlaySe
	b .L08037774
.L08037752:
	movs r0, #2
	bl SioPlaySe
	adds r1, r4, #0
	adds r1, #0x52
	movs r0, #8
	strb r0, [r1]
	ldr r0, [r4, #0x3c]
	adds r1, #1
	strb r0, [r1]
	mov r2, sl
	str r2, [r4, #0x44]
	adds r0, r4, #0
	movs r1, #5
	bl Proc_Goto
	b .L080377CE
.L08037774:
	ldr r5, .L080377DC @ =gKeySt
	ldr r1, [r5]
	movs r0, #2
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq .L08037796
	movs r0, #1
	bl SioPlaySe
	adds r0, r4, #0
	movs r1, #9
	bl Proc_Goto
	ldr r1, .L080377E0 @ =gLinkArenaSt
	movs r0, #0xff
	strb r0, [r1, #3]
.L08037796:
	ldr r1, [r5]
	movs r0, #8
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq .L080377CE
	adds r0, r4, #0
	adds r0, #0x5c
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq .L080377CE
	ldr r0, .L080377E4 @ =gPlaySt
	ldrb r0, [r0, #0x1d]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L080377C0
	movs r0, #0x6a
	bl m4aSongNumStart
.L080377C0:
	ldr r1, .L080377E0 @ =gLinkArenaSt
	movs r0, #0
	strb r0, [r1, #3]
	adds r0, r4, #0
	movs r1, #9
	bl Proc_Goto
.L080377CE:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L080377DC: .4byte gKeySt
.L080377E0: .4byte gLinkArenaSt
.L080377E4: .4byte gPlaySt

	thumb_func_start SioTeamList_StartUnitList
SioTeamList_StartUnitList: @ 0x080377E8
	push {r4, lr}
	sub sp, #0x10
	adds r4, r0, #0
	ldr r0, [r4, #0x2c]
	bl Proc_End
	bl Sio_EndBackgroundSlide
	bl InitUnits
	movs r0, #1
	bl GetUnit
	adds r1, r0, #0
	ldr r3, .L08037828 @ =gLinkArenaTeamList
	ldr r2, [r4, #0x40]
	lsls r0, r2, #2
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrb r0, [r0, #0xf]
	mov r2, sp
	bl ReadMultiArenaSaveTeam
	adds r0, r4, #0
	bl StartUnitListScreenUnk
	add sp, #0x10
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08037828: .4byte gLinkArenaTeamList

	thumb_func_start SioTeamList_WaitForUnitListScreen
SioTeamList_WaitForUnitListScreen: @ 0x0803782C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, .L08037848 @ =ProcScr_UnitListScreen_PrepMenu
	bl FindProc
	cmp r0, #0
	bne .L08037840
	adds r0, r4, #0
	bl Proc_Break
.L08037840:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08037848: .4byte ProcScr_UnitListScreen_PrepMenu

	thumb_func_start func_fe6_0803784C
func_fe6_0803784C: @ 0x0803784C
	movs r1, #0
	ldr r2, .L08037868 @ =gLinkArenaSt
	ldrb r0, [r2, #5]
	adds r0, #2
	cmp r1, r0
	bge .L08037872
	adds r3, r2, #6
	adds r2, r0, #0
.L0803785C:
	adds r0, r1, r3
	ldrb r0, [r0]
	cmp r0, #0xff
	bne .L0803786C
	movs r0, #0
	b .L08037874
	.align 2, 0
.L08037868: .4byte gLinkArenaSt
.L0803786C:
	adds r1, #1
	cmp r1, r2
	blt .L0803785C
.L08037872:
	movs r0, #1
.L08037874:
	bx lr
	.align 2, 0

	thumb_func_start SioTeamList_Loop_SubSel
SioTeamList_Loop_SubSel: @ 0x08037878
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	adds r7, r0, #0
	ldr r0, [r7, #0x40]
	mov sb, r0
	ldr r1, [r7, #0x2c]
	str r1, [sp, #4]
	ldr r0, .L080378BC @ =KeyList_SioSecretTeam
	bl SioIsKeyInputSequenceComplete
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L080378C4
	ldr r0, .L080378C0 @ =gLinkArenaTeamList
	mov r2, sb
	lsls r1, r2, #2
	add r1, sb
	lsls r1, r1, #2
	adds r1, r1, r0
	movs r0, #0x80
	ldrb r1, [r1, #0xf]
	ands r0, r1
	cmp r0, #0
	bne .L080378C4
	adds r0, r7, #0
	movs r1, #8
	bl Proc_Goto
	b .L08037D64
	.align 2, 0
.L080378BC: .4byte KeyList_SioSecretTeam
.L080378C0: .4byte gLinkArenaTeamList
.L080378C4:
	ldr r1, [sp, #4]
	adds r1, #0x44
	movs r0, #0
	strb r0, [r1]
	adds r1, r7, #0
	adds r1, #0x48
	ldr r0, [r7, #0x40]
	ldrb r3, [r1]
	subs r0, r0, r3
	lsls r0, r0, #4
	adds r0, #0x28
	ldr r2, [sp, #4]
	str r0, [r2, #0x48]
	adds r0, r7, #0
	adds r0, #0x4c
	movs r2, #0
	ldrsb r2, [r0, r2]
	mov sl, r1
	str r0, [sp, #8]
	cmp r2, #0
	ble .L08037926
	adds r4, r7, #0
	adds r4, #0x4a
	ldrh r0, [r4]
	subs r0, #4
	strh r0, [r4]
	ldr r3, [sp, #8]
	ldrb r0, [r3]
	subs r0, #1
	strb r0, [r3]
	ldrh r2, [r4]
	movs r0, #1
	movs r1, #0
	bl SetBgOffset
	ldr r0, [r7, #0x30]
	cmp r0, #0
	beq .L08037916
	movs r1, #4
	bl func_fe6_08036B38
.L08037916:
	movs r0, #4
	bl ScrollMultiArenaTeamSprites
	ldr r1, [r7, #0x40]
	mov r0, sl
	ldrb r0, [r0]
	subs r1, r1, r0
	b .L08037964
.L08037926:
	cmp r2, #0
	bge .L08037982
	adds r4, r7, #0
	adds r4, #0x4a
	ldrh r0, [r4]
	adds r0, #4
	strh r0, [r4]
	ldr r1, [sp, #8]
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldrh r2, [r4]
	movs r0, #1
	movs r1, #0
	bl SetBgOffset
	ldr r0, [r7, #0x30]
	cmp r0, #0
	beq .L08037954
	movs r1, #4
	rsbs r1, r1, #0
	bl func_fe6_08036B38
.L08037954:
	movs r0, #4
	rsbs r0, r0, #0
	bl ScrollMultiArenaTeamSprites
	ldr r1, [r7, #0x40]
	mov r2, sl
	ldrb r2, [r2]
	subs r1, r1, r2
.L08037964:
	lsls r1, r1, #4
	adds r1, #0x28
	movs r0, #0x50
	bl PutUiHand
	ldr r0, [r7, #0x38]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrh r1, [r4]
	adds r1, #0x28
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl UpdateLinkArenaMenuScrollBar
	b .L08037D64
.L08037982:
	ldr r1, [r7, #0x40]
	mov r3, sl
	ldrb r3, [r3]
	subs r1, r1, r3
	lsls r1, r1, #4
	adds r1, #0x28
	movs r0, #0x50
	bl PutUiHand
	ldr r0, .L080379C0 @ =gKeySt
	ldr r1, [r0]
	movs r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	bne .L080379A4
	b .L08037BBA
.L080379A4:
	adds r0, r7, #0
	adds r0, #0x52
	ldrb r1, [r0]
	subs r1, #1
	adds r4, r0, #0
	cmp r1, #7
	bls .L080379B4
	b .L08037BBA
.L080379B4:
	lsls r0, r1, #2
	ldr r1, .L080379C4 @ =.L080379C8
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
.L080379C0: .4byte gKeySt
.L080379C4: .4byte .L080379C8
.L080379C8: @ jump table
	.4byte .L080379E8 @ case 0
	.4byte .L08037A18 @ case 1
	.4byte .L08037A40 @ case 2
	.4byte .L08037A6C @ case 3
	.4byte .L08037AD0 @ case 4
	.4byte .L08037ADE @ case 5
	.4byte .L08037BBA @ case 6
	.4byte .L08037B2C @ case 7
.L080379E8:
	ldr r0, .L08037A10 @ =gLinkArenaTeamList
	mov r2, sb
	lsls r1, r2, #2
	add r1, sb
	lsls r1, r1, #2
	adds r1, r1, r0
	movs r0, #0x80
	ldrb r1, [r1, #0xf]
	ands r0, r1
	cmp r0, #0
	bne .L08037A00
	b .L08037B24
.L08037A00:
	movs r0, #2
	bl SioPlaySe
	ldr r1, .L08037A14 @ =gLinkArenaSt
	ldr r0, [r7, #0x40]
	strb r0, [r1, #3]
	b .L08037A30
	.align 2, 0
.L08037A10: .4byte gLinkArenaTeamList
.L08037A14: .4byte gLinkArenaSt
.L08037A18:
	movs r0, #2
	bl SioPlaySe
	ldr r2, .L08037A38 @ =gLinkArenaSt
	ldr r1, .L08037A3C @ =gLinkArenaTeamList
	mov r3, sb
	lsls r0, r3, #2
	add r0, sb
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r0, [r0, #0xf]
	strb r0, [r2, #3]
.L08037A30:
	adds r0, r7, #0
	bl Proc_Break
	b .L08037D64
	.align 2, 0
.L08037A38: .4byte gLinkArenaSt
.L08037A3C: .4byte gLinkArenaTeamList
.L08037A40:
	ldr r0, .L08037A68 @ =gLinkArenaTeamList
	mov r2, sb
	lsls r1, r2, #2
	add r1, sb
	lsls r1, r1, #2
	adds r1, r1, r0
	movs r0, #0x80
	ldrb r1, [r1, #0xf]
	ands r0, r1
	cmp r0, #0
	bne .L08037B24
	movs r0, #2
	bl SioPlaySe
	adds r0, r7, #0
	movs r1, #4
	bl Proc_Goto
	b .L08037D64
	.align 2, 0
.L08037A68: .4byte gLinkArenaTeamList
.L08037A6C:
	ldr r0, [r7, #0x38]
	cmp r0, #1
	bgt .L08037A74
	b .L08037BBA
.L08037A74:
	movs r0, #2
	bl SioPlaySe
	adds r0, r7, #0
	adds r0, #0x53
	mov r3, sb
	strb r3, [r0]
	mov r1, sl
	ldrb r1, [r1]
	subs r2, r3, r1
	lsls r2, r2, #4
	adds r2, #0x28
	movs r0, #0x27
	str r0, [sp]
	adds r0, r7, #0
	movs r1, #0x50
	movs r3, #0x88
	bl StartSioHold
	str r0, [r7, #0x30]
	mov r1, sb
	adds r1, #1
	ldr r0, [r7, #0x38]
	cmp r1, r0
	bge .L08037AB8
	ldr r0, .L08037AB4 @ =gKeySt
	ldr r1, [r0]
	movs r0, #0x80
	ldrh r2, [r1, #6]
	orrs r0, r2
	b .L08037AC2
	.align 2, 0
.L08037AB4: .4byte gKeySt
.L08037AB8:
	ldr r0, .L08037ACC @ =gKeySt
	ldr r1, [r0]
	movs r0, #0x40
	ldrh r3, [r1, #6]
	orrs r0, r3
.L08037AC2:
	strh r0, [r1, #6]
	movs r0, #5
	strb r0, [r4]
	b .L08037BBA
	.align 2, 0
.L08037ACC: .4byte gKeySt
.L08037AD0:
	movs r0, #2
	bl SioPlaySe
	adds r0, r7, #0
	bl SioTeamList_SwapTeams
	b .L08037BBA
.L08037ADE:
	ldr r0, .L08037B20 @ =gLinkArenaTeamList
	mov r2, sb
	lsls r1, r2, #2
	add r1, sb
	lsls r1, r1, #2
	adds r1, r1, r0
	movs r0, #0x80
	ldrb r1, [r1, #0xf]
	ands r0, r1
	cmp r0, #0
	bne .L08037B24
	movs r0, #2
	bl SioPlaySe
	mov r0, sb
	mov r3, sl
	ldrb r3, [r3]
	subs r2, r0, r3
	lsls r2, r2, #4
	adds r2, #0x28
	movs r0, #0x27
	str r0, [sp]
	adds r0, r7, #0
	movs r1, #0x50
	movs r3, #0x88
	bl StartSioHold
	str r0, [r7, #0x30]
	adds r0, r7, #0
	movs r1, #7
	bl Proc_Goto
	b .L08037BBA
	.align 2, 0
.L08037B20: .4byte gLinkArenaTeamList
.L08037B24:
	movs r0, #0
	bl SioPlaySe
	b .L08037BBA
.L08037B2C:
	movs r0, #2
	bl SioPlaySe
	mov r0, sb
	lsls r4, r0, #2
	add r4, sb
	lsls r4, r4, #2
	ldr r0, .L08037BE4 @ =gLinkArenaTeamList
	adds r4, r4, r0
	movs r1, #0x53
	adds r1, r1, r7
	mov r8, r1
	ldrb r2, [r1]
	lsls r1, r2, #4
	mov r3, r8
	ldrb r3, [r3]
	subs r1, r1, r3
	ldr r6, .L08037BE8 @ =0x0203C944
	adds r1, r1, r6
	adds r0, r4, #0
	bl SioStrCpy
	ldr r5, .L08037BEC @ =gLinkArenaSt
	adds r0, r5, #6
	mov r1, r8
	ldrb r1, [r1]
	adds r0, r1, r0
	ldrb r1, [r4, #0xf]
	strb r1, [r0]
	mov r2, r8
	ldrb r2, [r2]
	lsls r0, r2, #3
	adds r5, #0x64
	adds r0, r0, r5
	bl ClearText
	mov r3, r8
	ldrb r1, [r3]
	lsls r0, r1, #3
	adds r0, r0, r5
	lsls r2, r1, #1
	adds r2, r2, r1
	adds r2, #5
	lsls r3, r1, #4
	subs r3, r3, r1
	adds r3, r3, r6
	movs r1, #0xa
	str r1, [sp]
	movs r1, #1
	bl PutDrawTextCentered
	bl func_fe6_0803784C
	adds r1, r7, #0
	adds r1, #0x5c
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L08037BAE
	ldr r1, [sp, #4]
	ldr r0, [r1, #0x40]
	cmp r0, #0
	bne .L08037BAE
	movs r0, #8
	str r0, [r1, #0x40]
.L08037BAE:
	movs r0, #0
	str r0, [r7, #0x44]
	adds r0, r7, #0
	movs r1, #6
	bl Proc_Goto
.L08037BBA:
	ldr r0, .L08037BF0 @ =gKeySt
	ldr r1, [r0]
	movs r0, #2
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq .L08037C0E
	movs r0, #1
	bl SioPlaySe
	adds r1, r7, #0
	adds r1, #0x52
	ldrb r0, [r1]
	cmp r0, #5
	bne .L08037BF4
	movs r0, #4
	strb r0, [r1]
	ldr r0, [r7, #0x30]
	bl Proc_End
	b .L08037D64
	.align 2, 0
.L08037BE4: .4byte gLinkArenaTeamList
.L08037BE8: .4byte 0x0203C944
.L08037BEC: .4byte gLinkArenaSt
.L08037BF0: .4byte gKeySt
.L08037BF4:
	cmp r0, #8
	beq .L08037C02
	adds r0, r7, #0
	movs r1, #2
	bl Proc_Goto
	b .L08037C0E
.L08037C02:
	movs r0, #0
	str r0, [r7, #0x44]
	adds r0, r7, #0
	movs r1, #6
	bl Proc_Goto
.L08037C0E:
	ldr r0, .L08037CB8 @ =gKeySt
	ldr r1, [r0]
	movs r0, #8
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq .L08037C48
	adds r0, r7, #0
	adds r0, #0x5c
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq .L08037C48
	ldr r0, .L08037CBC @ =gPlaySt
	ldrb r0, [r0, #0x1d]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L08037C3A
	movs r0, #0x6a
	bl m4aSongNumStart
.L08037C3A:
	ldr r1, .L08037CC0 @ =gLinkArenaSt
	movs r0, #0
	strb r0, [r1, #3]
	adds r0, r7, #0
	movs r1, #9
	bl Proc_Goto
.L08037C48:
	ldr r0, .L08037CB8 @ =gKeySt
	ldr r1, [r0]
	movs r0, #0x40
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq .L08037CCE
	mov r2, sl
	ldrb r0, [r2]
	cmp r0, #0
	beq .L08037CC4
	ldr r0, [r7, #0x40]
	ldrb r3, [r2]
	subs r0, r0, r3
	cmp r0, #1
	bgt .L08037CC4
	adds r4, r7, #0
	adds r4, #0x4a
	ldrh r0, [r4]
	subs r0, #4
	strh r0, [r4]
	ldr r0, [r7, #0x30]
	cmp r0, #0
	beq .L08037C7E
	movs r1, #4
	bl func_fe6_08036B38
.L08037C7E:
	movs r0, #4
	bl ScrollMultiArenaTeamSprites
	mov r1, sl
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	movs r0, #3
	ldr r2, [sp, #8]
	strb r0, [r2]
	ldr r0, [r7, #0x40]
	subs r0, #1
	str r0, [r7, #0x40]
	ldrh r2, [r4]
	movs r0, #1
	movs r1, #0
	bl SetBgOffset
	ldr r0, [r7, #0x38]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrh r1, [r4]
	adds r1, #0x28
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl UpdateLinkArenaMenuScrollBar
	b .L08037CCE
	.align 2, 0
.L08037CB8: .4byte gKeySt
.L08037CBC: .4byte gPlaySt
.L08037CC0: .4byte gLinkArenaSt
.L08037CC4:
	ldr r0, [r7, #0x40]
	cmp r0, #0
	ble .L08037CCE
	subs r0, #1
	str r0, [r7, #0x40]
.L08037CCE:
	ldr r0, .L08037D48 @ =gKeySt
	ldr r1, [r0]
	movs r0, #0x80
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq .L08037D58
	ldr r1, [r7, #0x38]
	cmp r1, #6
	ble .L08037D4C
	mov r3, sl
	ldrb r2, [r3]
	adds r0, r2, #6
	cmp r0, r1
	bge .L08037D4C
	ldr r0, [r7, #0x40]
	subs r0, r0, r2
	cmp r0, #3
	ble .L08037D4C
	adds r4, r7, #0
	adds r4, #0x4a
	ldrh r0, [r4]
	adds r0, #4
	strh r0, [r4]
	ldr r0, [r7, #0x30]
	cmp r0, #0
	beq .L08037D0C
	movs r1, #4
	rsbs r1, r1, #0
	bl func_fe6_08036B38
.L08037D0C:
	movs r0, #4
	rsbs r0, r0, #0
	bl ScrollMultiArenaTeamSprites
	mov r1, sl
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	movs r0, #0xfd
	ldr r2, [sp, #8]
	strb r0, [r2]
	ldr r0, [r7, #0x40]
	adds r0, #1
	str r0, [r7, #0x40]
	ldrh r2, [r4]
	movs r0, #1
	movs r1, #0
	bl SetBgOffset
	ldr r0, [r7, #0x38]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrh r1, [r4]
	adds r1, #0x28
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl UpdateLinkArenaMenuScrollBar
	b .L08037D58
	.align 2, 0
.L08037D48: .4byte gKeySt
.L08037D4C:
	subs r0, r1, #1
	ldr r1, [r7, #0x40]
	cmp r1, r0
	bge .L08037D58
	adds r0, r1, #1
	str r0, [r7, #0x40]
.L08037D58:
	ldr r0, [r7, #0x40]
	cmp sb, r0
	beq .L08037D64
	movs r0, #3
	bl SioPlaySe
.L08037D64:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start func_fe6_08037D74
func_fe6_08037D74: @ 0x08037D74
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	rsbs r1, r1, #0
	subs r1, #8
	movs r2, #4
	adds r0, #0x38
.L08037D80:
	strh r1, [r0]
	subs r0, #2
	subs r2, #1
	cmp r2, #0
	bge .L08037D80
	bx lr

	thumb_func_start SioTeamList_SubSel_Switching
SioTeamList_SubSel_Switching: @ 0x08037D8C
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r6, [r4, #0x2c]
	ldr r0, .L08037DF0 @ =gXposArray_SioTeamListSwicthing
	ldr r1, [r4, #0x44]
	adds r1, r1, r0
	movs r5, #0
	ldrsb r5, [r1, r5]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r5, r0
	bne .L08037DAC
	adds r0, r4, #0
	movs r1, #3
	bl Proc_Goto
.L08037DAC:
	ldr r0, [r4, #0x44]
	adds r0, #1
	str r0, [r4, #0x44]
	movs r0, #2
	rsbs r0, r0, #0
	cmp r5, r0
	bne .L08037DF8
	ldr r3, .L08037DF4 @ =gDispIo
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r2, [r3, #0x10]
	ands r0, r2
	strb r0, [r3, #0x10]
	adds r0, r1, #0
	ldrb r2, [r3, #0x14]
	ands r0, r2
	movs r2, #1
	orrs r0, r2
	strb r0, [r3, #0x14]
	ldrb r0, [r3, #0xc]
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	strb r1, [r3, #0xc]
	movs r0, #3
	ldrb r1, [r3, #0x18]
	orrs r0, r1
	strb r0, [r3, #0x18]
	adds r1, r6, #0
	adds r1, #0x44
	movs r0, #0
	strb r0, [r1]
	b .L08037E0C
	.align 2, 0
.L08037DF0: .4byte gXposArray_SioTeamListSwicthing
.L08037DF4: .4byte gDispIo
.L08037DF8:
	lsls r1, r5, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0
	movs r2, #0
	bl SetBgOffset
	adds r0, r6, #0
	adds r1, r5, #0
	bl func_fe6_08037D74
.L08037E0C:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_fe6_08037E14
func_fe6_08037E14: @ 0x08037E14
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldr r6, [r4, #0x2c]
	ldr r1, .L08037E7C @ =gXposArray_SioTeamListSwicthing
	ldr r0, [r4, #0x44]
	adds r0, r0, r1
	movs r5, #0
	ldrsb r5, [r0, r5]
	movs r7, #1
	rsbs r7, r7, #0
	cmp r5, r7
	bne .L08037E34
	adds r0, r4, #0
	movs r1, #2
	bl Proc_Goto
.L08037E34:
	ldr r0, [r4, #0x44]
	adds r0, #1
	str r0, [r4, #0x44]
	movs r0, #2
	rsbs r0, r0, #0
	cmp r5, r0
	bne .L08037E84
	ldr r3, .L08037E80 @ =gDispIo
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
	adds r1, r6, #0
	adds r1, #0x44
	movs r0, #1
	strb r0, [r1]
	str r7, [r6, #0x48]
	b .L08037E98
	.align 2, 0
.L08037E7C: .4byte gXposArray_SioTeamListSwicthing
.L08037E80: .4byte gDispIo
.L08037E84:
	lsls r1, r5, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0
	movs r2, #0
	bl SetBgOffset
	adds r0, r6, #0
	adds r1, r5, #0
	bl func_fe6_08037D74
.L08037E98:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start SioTeamList_StartEraseTeamSubMenu
SioTeamList_StartEraseTeamSubMenu: @ 0x08037EA0
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r1, r5, #0
	adds r1, #0x55
	movs r0, #1
	strb r0, [r1]
	bl SioPutSupportMenuImage
	adds r1, r5, #0
	adds r1, #0x48
	ldr r0, [r5, #0x40]
	ldrb r1, [r1]
	subs r0, r0, r1
	cmp r0, #2
	ble .L08037EC4
	lsls r0, r0, #1
	subs r0, #2
	b .L08037EC8
.L08037EC4:
	lsls r0, r0, #1
	adds r0, #5
.L08037EC8:
	str r0, [r5, #0x58]
	ldr r4, .L08037EF8 @ =gSioText_0203C6A4
	adds r0, r4, #0
	bl ClearText
	ldr r1, .L08037EFC @ =gUnk_Sio_0810F1AC
	adds r0, r4, #0
	bl Text_DrawString
	ldr r1, [r5, #0x58]
	adds r1, #4
	lsls r1, r1, #6
	ldr r0, .L08037F00 @ =gBg0Tm+0x1E
	adds r1, r1, r0
	adds r0, r4, #0
	bl PutText
	movs r0, #1
	bl EnableBgSync
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08037EF8: .4byte gSioText_0203C6A4
.L08037EFC: .4byte gUnk_Sio_0810F1AC
.L08037F00: .4byte gBg0Tm+0x1E

	thumb_func_start SioTeamList_EraseTeam_KeyHandler
SioTeamList_EraseTeam_KeyHandler: @ 0x08037F04
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x58]
	lsls r1, r1, #3
	adds r1, #0x18
	movs r0, #0x60
	bl PutLinkArenaChoiceBannerSprite
	ldr r0, .L08037FA8 @ =gKeySt
	ldr r1, [r0]
	movs r0, #0x20
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq .L08037F36
	adds r1, r4, #0
	adds r1, #0x55
	ldrb r0, [r1]
	cmp r0, #1
	bne .L08037F36
	movs r0, #0
	strb r0, [r1]
	movs r0, #3
	bl SioPlaySe
.L08037F36:
	ldr r0, .L08037FA8 @ =gKeySt
	ldr r1, [r0]
	movs r0, #0x10
	ldrh r1, [r1, #8]
	ands r0, r1
	adds r5, r4, #0
	adds r5, #0x55
	cmp r0, #0
	beq .L08037F58
	ldrb r0, [r5]
	cmp r0, #0
	bne .L08037F58
	movs r0, #1
	strb r0, [r5]
	movs r0, #3
	bl SioPlaySe
.L08037F58:
	ldrb r1, [r5]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, #0x70
	ldr r1, [r4, #0x58]
	lsls r1, r1, #3
	adds r1, #0x20
	bl PutUiHand
	ldr r0, .L08037FA8 @ =gKeySt
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq .L08037FB0
	movs r0, #1
	bl SioPlaySe
	ldr r0, [r4, #0x30]
	bl Proc_End
	ldr r0, [r4, #0x58]
	adds r0, #4
	lsls r0, r0, #6
	ldr r1, .L08037FAC @ =gBg0Tm+0x1E
	adds r0, r0, r1
	movs r1, #0xc
	movs r2, #2
	movs r3, #0
	bl TmFillRect_thm
	movs r0, #1
	bl EnableBgSync
	adds r0, r4, #0
	bl Proc_Break
	b .L08037FF8
	.align 2, 0
.L08037FA8: .4byte gKeySt
.L08037FAC: .4byte gBg0Tm+0x1E
.L08037FB0:
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq .L08037FF8
	ldr r0, [r4, #0x30]
	bl Proc_End
	ldrb r0, [r5]
	cmp r0, #0
	bne .L08037FD2
	adds r0, r4, #0
	bl SioTeamList_EraseTeam
	movs r0, #2
	bl SioPlaySe
	b .L08037FD8
.L08037FD2:
	movs r0, #1
	bl SioPlaySe
.L08037FD8:
	ldr r0, [r4, #0x58]
	adds r0, #4
	lsls r0, r0, #6
	ldr r1, .L08038000 @ =gBg0Tm+0x1E
	adds r0, r0, r1
	movs r1, #0xc
	movs r2, #2
	movs r3, #0
	bl TmFillRect_thm
	movs r0, #1
	bl EnableBgSync
	adds r0, r4, #0
	bl Proc_Break
.L08037FF8:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08038000: .4byte gBg0Tm+0x1E

	thumb_func_start SioTeamList_LoadTeam_Dummy
SioTeamList_LoadTeam_Dummy: @ 0x08038004
	push {r4, r5, lr}
	sub sp, #0x10
	adds r5, r0, #0
	ldr r4, [r5, #0x40]
	movs r0, #1
	bl GetUnit
	adds r1, r0, #0
	adds r0, r4, #0
	mov r2, sp
	bl ReadMultiArenaSaveTeam
	adds r0, r5, #0
	bl NewGeneralSecretScreen
	add sp, #0x10
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start GetTacticianTextConf
GetTacticianTextConf: @ 0x0803802C
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #0x34
	muls r0, r1, r0
	ldr r1, .L0803803C @ =gTacticianTextConf
	adds r0, r0, r1
	bx lr
	.align 2, 0
.L0803803C: .4byte gTacticianTextConf

	thumb_func_start func_fe6_08038040
func_fe6_08038040: @ 0x08038040
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	movs r6, #0
	adds r5, r0, #0
	adds r5, #0x31
	ldr r1, .L0803811C @ =gSioText_0203C708
	mov r8, r1
	adds r7, r0, #0
	adds r7, #0x30
.L0803805A:
	ldrb r3, [r5]
	lsls r0, r3, #2
	adds r0, r0, r3
	adds r0, r6, r0
	lsls r0, r0, #3
	add r0, r8
	bl ClearText
	ldrb r1, [r5]
	lsls r0, r1, #2
	adds r0, r0, r1
	adds r0, r6, r0
	lsls r0, r0, #3
	add r0, r8
	movs r1, #0
	bl Text_SetColor
	movs r2, #0
	lsls r3, r6, #4
	mov sb, r3
	lsls r0, r6, #1
	mov sl, r0
	adds r1, r6, #1
	str r1, [sp]
.L0803808A:
	mov r3, sb
	subs r0, r3, r6
	adds r0, r0, r2
	lsls r0, r0, #1
	ldr r1, .L08038120 @ =gUnk_Sio_0810EFD2
	adds r0, r0, r1
	movs r3, #0
	ldrsh r1, [r0, r3]
	movs r0, #0x34
	muls r1, r0, r1
	ldr r0, .L08038124 @ =gTacticianTextConf
	adds r4, r1, r0
	ldrb r1, [r7]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r4, r0
	ldr r0, [r0]
	ldrb r0, [r0]
	cmp r0, #0
	beq .L080380E6
	ldrb r3, [r5]
	lsls r0, r3, #2
	adds r0, r0, r3
	adds r0, r6, r0
	lsls r0, r0, #3
	add r0, r8
	ldrh r1, [r4, #0x24]
	str r2, [sp, #4]
	bl Text_SetCursor
	ldrb r1, [r5]
	lsls r0, r1, #2
	adds r0, r0, r1
	adds r0, r6, r0
	lsls r0, r0, #3
	add r0, r8
	ldrb r3, [r7]
	lsls r1, r3, #1
	adds r1, r1, r3
	lsls r1, r1, #2
	adds r1, r4, r1
	ldr r1, [r1]
	bl Text_DrawString
	ldr r2, [sp, #4]
.L080380E6:
	adds r2, #1
	cmp r2, #0xe
	ble .L0803808A
	ldrb r1, [r5]
	lsls r0, r1, #2
	adds r0, r0, r1
	adds r0, r6, r0
	lsls r0, r0, #3
	add r0, r8
	mov r1, sl
	adds r1, #9
	lsls r1, r1, #6
	ldr r2, .L08038128 @ =gBg1Tm
	adds r1, r1, r2
	bl PutText
	ldr r6, [sp]
	cmp r6, #4
	ble .L0803805A
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0803811C: .4byte gSioText_0203C708
.L08038120: .4byte gUnk_Sio_0810EFD2
.L08038124: .4byte gTacticianTextConf
.L08038128: .4byte gBg1Tm

	thumb_func_start TacticianDrawCharacters
TacticianDrawCharacters: @ 0x0803812C
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, .L08038158 @ =0x0203C910
	adds r0, r5, #0
	bl ClearText
	adds r4, #0x3a
	adds r0, r5, #0
	adds r1, r4, #0
	bl Text_DrawString
	ldr r1, .L0803815C @ =gBg0Tm+0x158
	adds r0, r5, #0
	bl PutText
	movs r0, #1
	bl EnableBgSync
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08038158: .4byte 0x0203C910
.L0803815C: .4byte gBg0Tm+0x158

	thumb_func_start Tactician_InitScreen
Tactician_InitScreen: @ 0x08038160
	push {r4, r5, r6, lr}
	sub sp, #0x18
	adds r6, r0, #0
	ldr r1, .L0803826C @ =gUnk_Sio_0810F1BD
	add r0, sp, #8
	movs r2, #0xa
	bl memcpy
	bl ClearSioBG
	bl InitSioBG
	ldr r0, .L08038270 @ =Img_TacticianSelObj
	ldr r1, .L08038274 @ =0x06014800
	bl Decompress
	ldr r0, .L08038278 @ =Pal_TacticianSelObj
	movs r1, #0x98
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, .L0803827C @ =gUnk_08109C40
	movs r1, #0xa0
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	movs r0, #0
	movs r1, #0
	bl Sio_RestartBgSlide
	ldr r0, .L08038280 @ =gBg2Tm+0x200
	ldr r1, .L08038284 @ =gUnk_0810A044
	movs r2, #0x80
	lsls r2, r2, #5
	bl TmApplyTsa_thm
	ldr r0, .L08038288 @ =gSioFont_0203C758
	bl SetTextFont
	bl InitSystemTextFont
	bl ResetTextFont
	add r0, sp, #0x14
	movs r4, #0
	strh r4, [r0]
	adds r1, r6, #0
	adds r1, #0x3a
	ldr r5, .L0803828C @ =0x01000007
	adds r2, r5, #0
	bl CpuSet
	mov r0, sp
	adds r0, #0x16
	strh r4, [r0]
	adds r1, r6, #0
	adds r1, #0x4a
	adds r2, r5, #0
	bl CpuSet
	adds r0, r6, #0
	adds r0, #0x36
	strb r4, [r0]
	ldr r0, .L08038290 @ =0x0203C910
	movs r1, #8
	bl InitText
	adds r0, r6, #0
	adds r0, #0x30
	strb r4, [r0]
	movs r0, #6
	strh r0, [r6, #0x32]
	bl GetTacticianTextConf
	ldrh r1, [r0, #0x24]
	subs r1, #4
	ldrh r2, [r0, #0x26]
	adds r2, #1
	adds r0, r6, #0
	bl func_fe6_0804067C
	str r0, [r6, #0x2c]
	adds r0, r6, #0
	adds r0, #0x37
	strb r4, [r0]
	ldr r5, .L08038294 @ =gSioText_0203C708
	movs r4, #9
.L08038212:
	adds r0, r5, #0
	movs r1, #0x1a
	bl InitText
	adds r5, #8
	subs r4, #1
	cmp r4, #0
	bge .L08038212
	ldr r4, .L08038298 @ =gSioText_0203C6A4
	adds r0, r4, #0
	movs r1, #0xc
	bl InitText
	ldr r0, [r6, #0x2c]
	movs r1, #3
	bl StartLinkArenaTitleBanner
	subs r4, #0x8c
	ldrb r0, [r4]
	str r0, [sp]
	ldr r0, [r6, #0x2c]
	str r0, [sp, #4]
	add r0, sp, #8
	movs r1, #0xa
	movs r2, #0
	movs r3, #8
	bl func_fe6_0803FD40
	ldr r1, .L0803829C @ =0x0203C918
	movs r0, #0
	strb r0, [r1]
	adds r1, r6, #0
	adds r1, #0x31
	movs r0, #0
	strb r0, [r1]
	adds r0, r6, #0
	bl func_fe6_08038040
	movs r0, #0xf
	bl EnableBgSync
	add sp, #0x18
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L0803826C: .4byte gUnk_Sio_0810F1BD
.L08038270: .4byte Img_TacticianSelObj
.L08038274: .4byte 0x06014800
.L08038278: .4byte Pal_TacticianSelObj
.L0803827C: .4byte gUnk_08109C40
.L08038280: .4byte gBg2Tm+0x200
.L08038284: .4byte gUnk_0810A044
.L08038288: .4byte gSioFont_0203C758
.L0803828C: .4byte 0x01000007
.L08038290: .4byte 0x0203C910
.L08038294: .4byte gSioText_0203C708
.L08038298: .4byte gSioText_0203C6A4
.L0803829C: .4byte 0x0203C918

	thumb_func_start SioUpdateTeam
SioUpdateTeam: @ 0x080382A0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	mov sl, r0
	mov sb, r1
	movs r0, #0x81
	bl GetUnit
	mov r8, r0
	mov r4, r8
	movs r6, #4
.L080382BA:
	adds r0, r4, #0
	bl ClearUnit
	adds r4, #0x48
	subs r6, #1
	cmp r6, #0
	bge .L080382BA
	movs r6, #0
	mov r7, r8
.L080382CC:
	ldr r0, .L08038320 @ =SioPidPool
	adds r0, r6, r0
	ldrb r0, [r0]
	cmp r0, #0
	beq .L080382FE
	bl GetUnitByPid
	adds r4, r0, #0
	movs r0, #8
	ldrh r1, [r4, #0xc]
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0
	bne .L080382FE
	adds r0, r4, #0
	movs r1, #0
	bl SetUnitStatus
	strh r5, [r4, #0xc]
	adds r0, r4, #0
	adds r1, r7, #0
	movs r2, #0x48
	bl SioMemCpy
.L080382FE:
	adds r7, #0x48
	adds r6, #1
	cmp r6, #4
	ble .L080382CC
	mov r0, sb
	mov r1, r8
	mov r2, sl
	bl WriteMultiArenaSaveTeam
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08038320: .4byte SioPidPool

	thumb_func_start Tactician_MoveHand
Tactician_MoveHand: @ 0x08038324
	push {r4, r5, r6, r7, lr}
	mov ip, r0
	lsls r5, r1, #1
	adds r2, #0x2a
	adds r2, r2, r5
	ldrh r4, [r2]
	movs r0, #0
	ldrsh r1, [r2, r0]
	movs r0, #0x34
	muls r0, r1, r0
	ldr r7, .L0803837C @ =gTacticianTextConf
	adds r2, r0, r7
	mov r1, ip
	adds r1, #0x30
	ldrb r3, [r1]
	lsls r0, r3, #1
	adds r0, r0, r3
	lsls r3, r0, #2
	adds r0, r2, r3
	ldr r0, [r0]
	ldrb r0, [r0]
	cmp r0, #0
	bne .L08038372
	adds r1, r5, #0
	movs r6, #0x34
	adds r5, r7, #0
.L08038358:
	adds r0, r2, #0
	adds r0, #0x2a
	adds r0, r0, r1
	ldrh r4, [r0]
	movs r2, #0
	ldrsh r0, [r0, r2]
	muls r0, r6, r0
	adds r2, r0, r5
	adds r0, r2, r3
	ldr r0, [r0]
	ldrb r0, [r0]
	cmp r0, #0
	beq .L08038358
.L08038372:
	mov r3, ip
	strh r4, [r3, #0x32]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0803837C: .4byte gTacticianTextConf

	thumb_func_start TacticianTryAppendChar
TacticianTryAppendChar: @ 0x08038380
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r7, r1, #0
	adds r6, r5, #0
	adds r6, #0x36
	ldrb r0, [r6]
	cmp r0, #0xd
	bhi .L080383EC
	movs r0, #2
	bl SioPlaySe
	adds r4, r5, #0
	adds r4, #0x30
	ldrb r1, [r4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r7, r0
	ldr r0, [r0]
	ldrb r1, [r6]
	adds r1, #0x3a
	adds r1, r5, r1
	bl SioStrCpy
	ldrb r1, [r6]
	lsrs r0, r1, #1
	lsls r0, r0, #1
	adds r2, r5, #0
	adds r2, #0x4a
	adds r2, r2, r0
	ldr r1, .L080383E8 @ =0x00003FFF
	ldrh r0, [r5, #0x32]
	ands r1, r0
	movs r0, #3
	ldrb r4, [r4]
	ands r0, r4
	lsls r0, r0, #0xe
	orrs r1, r0
	strh r1, [r2]
	ldrb r0, [r6]
	adds r0, #2
	cmp r0, #0xd
	bgt .L080383D8
	strb r0, [r6]
.L080383D8:
	adds r0, r5, #0
	bl TacticianDrawCharacters
	adds r1, r5, #0
	adds r1, #0x37
	movs r0, #0
	strb r0, [r1]
	b .L080383F2
	.align 2, 0
.L080383E8: .4byte 0x00003FFF
.L080383EC:
	movs r0, #0
	bl SioPlaySe
.L080383F2:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start TacticianTryDeleteChar
TacticianTryDeleteChar: @ 0x080383F8
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0x36
	ldrb r0, [r4]
	cmp r0, #0
	beq .L08038448
	movs r0, #2
	bl SioPlaySe
	ldrb r1, [r4]
	lsrs r0, r1, #1
	lsls r0, r0, #1
	adds r2, r5, #0
	adds r2, #0x4a
	adds r0, r2, r0
	ldrh r0, [r0]
	cmp r0, #0
	bne .L08038422
	subs r0, r1, #2
	strb r0, [r4]
.L08038422:
	ldrb r1, [r4]
	adds r0, r1, r5
	adds r0, #0x3a
	movs r1, #0
	strb r1, [r0]
	ldrb r4, [r4]
	lsrs r0, r4, #1
	lsls r0, r0, #1
	adds r0, r2, r0
	movs r2, #0
	movs r1, #0
	strh r1, [r0]
	adds r0, r5, #0
	adds r0, #0x37
	strb r2, [r0]
	adds r0, r5, #0
	bl TacticianDrawCharacters
	b .L0803844E
.L08038448:
	movs r0, #0
	bl SioPlaySe
.L0803844E:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start SaveTactician
SaveTactician: @ 0x08038454
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0x3a
	ldrb r0, [r4]
	cmp r0, #0
	beq .L08038480
	movs r0, #2
	bl SioPlaySe
	ldr r0, .L0803847C @ =gLinkArenaSt
	ldrb r1, [r0, #3]
	adds r0, r4, #0
	bl SioUpdateTeam
	adds r0, r5, #0
	bl Proc_Break
	b .L08038486
	.align 2, 0
.L0803847C: .4byte gLinkArenaSt
.L08038480:
	movs r0, #0
	bl SioPlaySe
.L08038486:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start func_fe6_0803848C
func_fe6_0803848C: @ 0x0803848C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	str r2, [sp]
	mov r8, r3
	adds r0, #0x30
	ldrb r0, [r0]
	cmp r0, #2
	bne .L080384BC
	cmp r3, #0
	bne .L080384BC
	movs r0, #2
	bl SioPlaySe
	adds r0, r4, #0
	adds r1, r5, #0
	bl TacticianTryAppendChar
	b .L0803857A
.L080384BC:
	adds r7, r4, #0
	adds r7, #0x36
	ldrb r0, [r7]
	cmp r0, #0
	beq .L0803856E
	ldrb r0, [r7]
	lsrs r2, r0, #1
	lsls r1, r2, #1
	adds r5, r4, #0
	adds r5, #0x4a
	adds r1, r5, r1
	ldr r3, .L0803855C @ =0x00003FFF
	adds r0, r3, #0
	ldrh r1, [r1]
	ands r0, r1
	movs r1, #1
	mov sb, r1
	cmp r0, #0
	beq .L080384E6
	movs r0, #0
	mov sb, r0
.L080384E6:
	mov r0, sb
	subs r1, r2, r0
	lsls r1, r1, #1
	adds r1, r5, r1
	adds r0, r3, #0
	ldrh r1, [r1]
	ands r0, r1
	bl GetTacticianTextConf
	mov sl, r0
	ldrb r1, [r7]
	lsrs r0, r1, #1
	mov r2, sb
	subs r0, r0, r2
	lsls r0, r0, #1
	adds r0, r5, r0
	ldrh r0, [r0]
	lsrs r5, r0, #0xe
	ldr r3, [sp]
	lsls r6, r3, #2
	adds r1, r4, #0
	adds r1, #0x30
	ldrb r2, [r1]
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r0, r6, r0
	add r0, sl
	ldr r0, [r0]
	ldrb r0, [r0]
	cmp r0, #0
	beq .L08038560
	movs r0, #2
	bl SioPlaySe
	lsls r0, r5, #1
	adds r0, r0, r5
	lsls r0, r0, #2
	adds r0, r6, r0
	add r0, sl
	ldr r0, [r0]
	ldrb r1, [r7]
	adds r1, #0x3a
	adds r1, r4, r1
	mov r3, sb
	lsls r2, r3, #1
	subs r1, r1, r2
	bl SioStrCpy
	adds r0, r4, #0
	bl TacticianDrawCharacters
	adds r0, r4, #0
	adds r0, #0x37
	mov r1, sp
	ldrb r1, [r1]
	strb r1, [r0]
	movs r0, #1
	b .L0803857C
	.align 2, 0
.L0803855C: .4byte 0x00003FFF
.L08038560:
	mov r2, r8
	cmp r2, #0
	bne .L0803857A
	movs r0, #0
	bl SioPlaySe
	b .L0803857A
.L0803856E:
	mov r3, r8
	cmp r3, #0
	bne .L0803857A
	movs r0, #0
	bl SioPlaySe
.L0803857A:
	movs r0, #0
.L0803857C:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start Tactician_LoopCore
Tactician_LoopCore: @ 0x0803858C
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	ldr r4, .L0803860C @ =gKeySt
	ldr r1, [r4]
	movs r0, #0x40
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq .L080385AA
	adds r0, r5, #0
	movs r1, #0
	adds r2, r6, #0
	bl Tactician_MoveHand
.L080385AA:
	ldr r1, [r4]
	movs r0, #0x80
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq .L080385C0
	adds r0, r5, #0
	movs r1, #1
	adds r2, r6, #0
	bl Tactician_MoveHand
.L080385C0:
	ldr r1, [r4]
	movs r0, #0x20
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq .L080385D6
	adds r0, r5, #0
	movs r1, #2
	adds r2, r6, #0
	bl Tactician_MoveHand
.L080385D6:
	ldr r1, [r4]
	movs r0, #0x10
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq .L080385EC
	adds r0, r5, #0
	movs r1, #3
	adds r2, r6, #0
	bl Tactician_MoveHand
.L080385EC:
	ldr r1, [r4]
	movs r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq .L080386C6
	adds r0, r6, #0
	adds r0, #0x32
	ldrb r0, [r0]
	cmp r0, #7
	bhi .L080386C6
	lsls r0, r0, #2
	ldr r1, .L08038610 @ =.L08038614
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
.L0803860C: .4byte gKeySt
.L08038610: .4byte .L08038614
.L08038614: @ jump table
	.4byte .L08038634 @ case 0
	.4byte .L08038668 @ case 1
	.4byte .L08038684 @ case 2
	.4byte .L080386AA @ case 3
	.4byte .L0803863E @ case 4
	.4byte .L08038648 @ case 5
	.4byte .L08038652 @ case 6
	.4byte .L0803865A @ case 7
.L08038634:
	adds r0, r5, #0
	adds r1, r6, #0
	bl TacticianTryAppendChar
	b .L080386C6
.L0803863E:
	adds r0, r5, #0
	adds r1, r6, #0
	bl TacticianTryDeleteChar
	b .L080386C6
.L08038648:
	adds r0, r5, #0
	adds r1, r6, #0
	bl SaveTactician
	b .L080386C6
.L08038652:
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #1
	b .L08038660
.L0803865A:
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #2
.L08038660:
	movs r3, #0
	bl func_fe6_0803848C
	b .L080386C6
.L08038668:
	adds r4, r5, #0
	adds r4, #0x30
	ldrb r0, [r4]
	cmp r0, #0
	beq .L080386A2
	movs r0, #2
	bl SioPlaySe
	movs r0, #0
	strb r0, [r4]
	adds r1, r5, #0
	adds r1, #0x37
	strb r0, [r1]
	b .L0803877E
.L08038684:
	adds r4, r5, #0
	adds r4, #0x30
	ldrb r0, [r4]
	cmp r0, #1
	beq .L080386A2
	movs r0, #2
	bl SioPlaySe
	movs r1, #0
	movs r0, #1
.L08038698:
	strb r0, [r4]
	adds r0, r5, #0
	adds r0, #0x37
	strb r1, [r0]
	b .L0803877E
.L080386A2:
	movs r0, #0
	bl SioPlaySe
	b .L080386C6
.L080386AA:
	adds r4, r5, #0
	adds r4, #0x30
	ldrb r1, [r4]
	cmp r1, #2
	beq .L080386C0
	movs r0, #2
	bl SioPlaySe
	movs r1, #0
	movs r0, #2
	b .L08038698
.L080386C0:
	movs r0, #0
	bl SioPlaySe
.L080386C6:
	ldr r0, .L080386E0 @ =gKeySt
	ldr r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq .L0803870E
	adds r0, r5, #0
	adds r0, #0x37
	ldrb r7, [r0]
	adds r4, r0, #0
	b .L080386F6
	.align 2, 0
.L080386E0: .4byte gKeySt
.L080386E4:
	ldrb r2, [r4]
	adds r0, r5, #0
	adds r1, r6, #0
	movs r3, #1
	bl func_fe6_0803848C
	lsls r0, r0, #0x18
	cmp r0, #0
	bne .L0803870E
.L080386F6:
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	ldrb r0, [r4]
	movs r1, #3
	bl __umodsi3
	strb r0, [r4]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r7, r0
	bne .L080386E4
.L0803870E:
	ldr r4, .L08038788 @ =gKeySt
	ldr r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #2
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq .L08038726
	adds r0, r5, #0
	adds r1, r6, #0
	bl TacticianTryDeleteChar
.L08038726:
	ldr r1, [r4]
	movs r0, #8
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq .L0803873C
	movs r0, #3
	bl SioPlaySe
	movs r0, #5
	strh r0, [r5, #0x32]
.L0803873C:
	ldr r0, [r4]
	ldrh r1, [r0, #8]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq .L0803878C
	movs r0, #2
	bl SioPlaySe
	adds r4, r5, #0
	adds r4, #0x30
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	ldrb r0, [r4]
	movs r1, #3
	bl __umodsi3
	strb r0, [r4]
	lsls r0, r0, #1
	ldrb r4, [r4]
	adds r0, r0, r4
	lsls r0, r0, #2
	adds r0, r6, r0
	ldr r0, [r0]
	ldrb r0, [r0]
	cmp r0, #0
	bne .L0803877E
	adds r0, r5, #0
	movs r1, #0
	adds r2, r6, #0
	bl Tactician_MoveHand
.L0803877E:
	adds r0, r5, #0
	movs r1, #1
	bl Proc_Goto
	b .L080387B6
	.align 2, 0
.L08038788: .4byte gKeySt
.L0803878C:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq .L080387B6
	adds r0, r5, #0
	adds r0, #0x36
	ldrb r0, [r0]
	cmp r0, #0
	beq .L080387A8
	adds r0, r5, #0
	adds r1, r6, #0
	bl TacticianTryDeleteChar
	b .L080387B6
.L080387A8:
	movs r0, #1
	bl SioPlaySe
	adds r0, r5, #0
	movs r1, #3
	bl Proc_Goto
.L080387B6:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start Tactician_Loop
Tactician_Loop: @ 0x080387BC
	push {r4, r5, lr}
	sub sp, #0x18
	adds r5, r0, #0
	movs r1, #0x32
	ldrsh r0, [r5, r1]
	bl GetTacticianTextConf
	adds r4, r0, #0
	ldrh r0, [r5, #0x32]
	strh r0, [r5, #0x34]
	adds r0, r5, #0
	adds r1, r4, #0
	bl Tactician_LoopCore
	ldrh r0, [r5, #0x34]
	ldrh r1, [r5, #0x32]
	cmp r0, r1
	beq .L080387E6
	movs r0, #3
	bl SioPlaySe
.L080387E6:
	movs r1, #0x32
	ldrsh r0, [r5, r1]
	bl GetTacticianTextConf
	adds r4, r0, #0
	adds r0, r5, #0
	adds r0, #0x3a
	add r1, sp, #8
	bl SioStrCpy
	add r1, sp, #8
	movs r0, #0
	strb r0, [r1, #0xc]
	adds r0, r1, #0
	bl GetStringTextLen
	adds r3, r0, #0
	ldr r0, [r5, #0x2c]
	ldrh r1, [r4, #0x24]
	subs r1, #4
	ldrh r2, [r4, #0x26]
	adds r2, #1
	adds r4, #0x28
	ldrb r4, [r4]
	str r4, [sp]
	adds r4, r5, #0
	adds r4, #0x30
	ldrb r4, [r4]
	str r4, [sp, #4]
	bl UpdateNameEntrySpriteDraw
	add sp, #0x18
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start Tactician_VBlank
Tactician_VBlank: @ 0x0803882C
	ldr r0, .L08038854 @ =0x04000006
	ldrh r0, [r0]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xa0
	bhi .L08038878
	cmp r0, #0x27
	bhi .L08038860
	ldr r1, .L08038858 @ =0x04000050
	movs r2, #0x84
	lsls r2, r2, #4
	adds r0, r2, #0
	strh r0, [r1]
	adds r1, #2
	ldr r2, .L0803885C @ =0x00000F08
	adds r0, r2, #0
	strh r0, [r1]
	b .L08038878
	.align 2, 0
.L08038854: .4byte 0x04000006
.L08038858: .4byte 0x04000050
.L0803885C: .4byte 0x00000F08
.L08038860:
	ldr r1, .L0803887C @ =0x04000050
	ldr r2, .L08038880 @ =0x00000442
	adds r0, r2, #0
	strh r0, [r1]
	ldr r2, .L08038884 @ =0x04000052
	ldr r0, .L08038888 @ =gUnk_030013E8
	ldrb r1, [r0]
	movs r0, #0xf
	subs r0, r0, r1
	lsls r0, r0, #8
	adds r1, r1, r0
	strh r1, [r2]
.L08038878:
	bx lr
	.align 2, 0
.L0803887C: .4byte 0x04000050
.L08038880: .4byte 0x00000442
.L08038884: .4byte 0x04000052
.L08038888: .4byte gUnk_030013E8

	thumb_func_start Tactician_SetVBlank
Tactician_SetVBlank: @ 0x0803888C
	push {lr}
	adds r0, #0x38
	movs r1, #0
	strb r1, [r0]
	ldr r0, .L080388A0 @ =Tactician_VBlank
	bl SetOnHBlankA
	pop {r0}
	bx r0
	.align 2, 0
.L080388A0: .4byte Tactician_VBlank

	thumb_func_start func_fe6_080388A4
func_fe6_080388A4: @ 0x080388A4
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	ldr r5, .L080388E0 @ =gUnk_030013E8
	adds r4, r6, #0
	adds r4, #0x38
	ldrb r3, [r4]
	movs r0, #8
	str r0, [sp]
	movs r0, #0
	movs r1, #0xf
	movs r2, #0
	bl Interpolate
	strb r0, [r5]
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #8
	bls .L080388D6
	adds r0, r6, #0
	bl Proc_Break
.L080388D6:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L080388E0: .4byte gUnk_030013E8

	thumb_func_start func_fe6_080388E4
func_fe6_080388E4: @ 0x080388E4
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r2, r4, #0
	adds r2, #0x31
	ldrb r0, [r2]
	adds r0, #1
	movs r5, #0
	movs r1, #1
	ands r0, r1
	strb r0, [r2]
	adds r0, r4, #0
	bl func_fe6_08038040
	movs r0, #2
	bl EnableBgSync
	adds r4, #0x38
	strb r5, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_fe6_08038910
func_fe6_08038910: @ 0x08038910
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	ldr r5, .L08038950 @ =gUnk_030013E8
	adds r4, r6, #0
	adds r4, #0x38
	ldrb r3, [r4]
	movs r0, #8
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0xf
	bl Interpolate
	strb r0, [r5]
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #8
	bls .L08038948
	movs r0, #0
	bl SetOnHBlankA
	adds r0, r6, #0
	bl Proc_Break
.L08038948:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08038950: .4byte gUnk_030013E8

	thumb_func_start NameSelect_DrawName
NameSelect_DrawName: @ 0x08038954
	push {r4, lr}
	adds r0, #0x39
	movs r1, #1
	strb r1, [r0]
	bl SioPutSupportMenuImage
	ldr r4, .L08038984 @ =gSioText_0203C6A4
	adds r0, r4, #0
	bl ClearText
	ldr r1, .L08038988 @ =gUnk_Sio_0810F1C8
	adds r0, r4, #0
	bl Text_DrawString
	ldr r1, .L0803898C @ =gBg0Tm+0x316
	adds r0, r4, #0
	bl PutText
	movs r0, #1
	bl EnableBgSync
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08038984: .4byte gSioText_0203C6A4
.L08038988: .4byte gUnk_Sio_0810F1C8
.L0803898C: .4byte gBg0Tm+0x316

	thumb_func_start func_fe6_08038990
func_fe6_08038990: @ 0x08038990
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r0, #0x40
	movs r1, #0x58
	bl PutLinkArenaChoiceBannerSprite
	ldr r0, .L08038A20 @ =gKeySt
	ldr r1, [r0]
	movs r0, #0x20
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq .L080389BE
	adds r1, r5, #0
	adds r1, #0x39
	ldrb r0, [r1]
	cmp r0, #1
	bne .L080389BE
	movs r0, #0
	strb r0, [r1]
	movs r0, #3
	bl SioPlaySe
.L080389BE:
	ldr r0, .L08038A20 @ =gKeySt
	ldr r1, [r0]
	movs r0, #0x10
	ldrh r1, [r1, #8]
	ands r0, r1
	adds r4, r5, #0
	adds r4, #0x39
	cmp r0, #0
	beq .L080389E0
	ldrb r0, [r4]
	cmp r0, #0
	bne .L080389E0
	movs r0, #1
	strb r0, [r4]
	movs r0, #3
	bl SioPlaySe
.L080389E0:
	ldrb r1, [r4]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, #0x50
	movs r1, #0x60
	bl PutUiHand
	ldr r0, .L08038A20 @ =gKeySt
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq .L08038A28
	movs r0, #1
	bl SioPlaySe
	ldr r0, .L08038A24 @ =gBg0Tm+0x316
	movs r1, #0xc
	movs r2, #2
	movs r3, #0
	bl TmFillRect_thm
	movs r0, #1
	bl EnableBgSync
	adds r0, r5, #0
	bl Proc_Break
	b .L08038A6E
	.align 2, 0
.L08038A20: .4byte gKeySt
.L08038A24: .4byte gBg0Tm+0x316
.L08038A28:
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq .L08038A6E
	ldrb r0, [r4]
	cmp r0, #0
	bne .L08038A50
	movs r0, #2
	bl SioPlaySe
	ldr r1, .L08038A4C @ =0x0203C918
	movs r0, #1
	strb r0, [r1]
	adds r0, r5, #0
	movs r1, #2
	bl Proc_Goto
	b .L08038A56
	.align 2, 0
.L08038A4C: .4byte 0x0203C918
.L08038A50:
	movs r0, #1
	bl SioPlaySe
.L08038A56:
	ldr r0, .L08038A74 @ =gBg0Tm+0x316
	movs r1, #0xc
	movs r2, #2
	movs r3, #0
	bl TmFillRect_thm
	movs r0, #1
	bl EnableBgSync
	adds r0, r5, #0
	bl Proc_Break
.L08038A6E:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08038A74: .4byte gBg0Tm+0x316

	thumb_func_start SioPostBattleSprites_Init
SioPostBattleSprites_Init: @ 0x08038A78
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x40
	ldrh r0, [r0]
	adds r1, r4, #0
	adds r1, #0x42
	ldrb r2, [r1]
	lsls r1, r2, #3
	movs r3, #0xc0
	lsls r3, r3, #1
	adds r1, r1, r3
	adds r2, #0xa
	bl UnpackFaceChibiSprGraphics
	movs r0, #0
	str r0, [r4, #0x3c]
	subs r0, #0x26
	str r0, [r4, #0x34]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start SioPostBattleSprites_Loop_DrawSlideIn
SioPostBattleSprites_Loop_DrawSlideIn: @ 0x08038AA4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r6, r0, #0
	ldr r4, [r6, #0x2c]
	ldr r0, [r4, #0x64]
	cmp r0, #0
	bne .L08038AC8
	ldr r0, [r6, #0x3c]
	cmp r0, #0x20
	ble .L08038AC2
	adds r0, r6, #0
	bl Proc_Break
.L08038AC2:
	ldr r0, [r4, #0x64]
	cmp r0, #0
	beq .L08038ACE
.L08038AC8:
	ldr r0, [r6, #0x34]
	adds r0, #1
	str r0, [r6, #0x34]
.L08038ACE:
	ldr r0, [r6, #0x38]
	subs r0, #1
	str r0, [r6, #0x38]
	cmp r0, #0
	bge .L08038ADC
	movs r0, #0
	str r0, [r6, #0x38]
.L08038ADC:
	ldr r4, [r6, #0x38]
	cmp r4, #0
	beq .L08038AE4
	b .L08038BF4
.L08038AE4:
	ldr r3, [r6, #0x3c]
	cmp r3, #0x20
	bgt .L08038AFC
	movs r1, #0x50
	rsbs r1, r1, #0
	movs r0, #0x20
	str r0, [sp]
	movs r0, #4
	movs r2, #0
	bl Interpolate
	str r0, [r6, #0x30]
.L08038AFC:
	ldr r0, [r6, #0x3c]
	adds r0, #1
	str r0, [r6, #0x3c]
	ldr r1, [r6, #0x30]
	ldr r2, [r6, #0x34]
	subs r2, #0x10
	ldr r3, .L08038BA8 @ =SpriteArray_Sio_085C9D08
	movs r0, #0x43
	adds r0, r0, r6
	mov r8, r0
	ldrb r5, [r0]
	lsls r0, r5, #2
	adds r0, r0, r3
	ldr r3, [r0]
	str r4, [sp]
	movs r0, #4
	bl PutSprite
	ldr r1, [r6, #0x30]
	adds r1, #0x48
	ldr r2, [r6, #0x34]
	subs r2, #6
	ldr r3, .L08038BAC @ =SpriteArray_Sio_085C9CF8
	adds r5, r6, #0
	adds r5, #0x42
	ldrb r7, [r5]
	lsls r0, r7, #2
	adds r0, r0, r3
	ldr r3, [r0]
	str r4, [sp]
	movs r0, #4
	bl PutSprite
	ldr r1, [r6, #0x30]
	adds r1, #0x60
	ldr r2, [r6, #0x34]
	adds r2, #8
	ldr r3, .L08038BB0 @ =Sprite_Sio_0810F220
	str r4, [sp]
	movs r0, #4
	bl PutSprite
	ldr r1, [r6, #0x30]
	adds r1, #0x40
	ldr r2, [r6, #0x34]
	adds r2, #8
	ldr r3, .L08038BB4 @ =Sprite_Sio_0810F256
	mov r4, r8
	ldrb r4, [r4]
	lsls r0, r4, #2
	adds r0, #0x50
	str r0, [sp]
	movs r0, #4
	bl PutSprite
	ldr r1, [r6, #0x30]
	rsbs r1, r1, #0
	adds r1, #0x70
	ldr r2, [r6, #0x34]
	subs r2, #8
	ldr r3, .L08038BB8 @ =Sprite_Sio_0810F228
	movs r0, #0xf
	ldrb r7, [r5]
	ands r0, r7
	lsls r0, r0, #0xc
	movs r4, #0x80
	lsls r4, r4, #3
	adds r0, r0, r4
	str r0, [sp]
	movs r0, #4
	bl PutSprite
	ldr r0, [r6, #0x30]
	rsbs r0, r0, #0
	adds r1, r0, #0
	adds r1, #0x7c
	ldr r2, [r6, #0x34]
	ldr r3, .L08038BBC @ =Sprite_Sio_0810F242
	ldrb r0, [r5]
	cmp r0, #3
	beq .L08038BC0
	lsls r0, r0, #3
	ldrb r4, [r5]
	adds r0, r0, r4
	b .L08038BC2
	.align 2, 0
.L08038BA8: .4byte SpriteArray_Sio_085C9D08
.L08038BAC: .4byte SpriteArray_Sio_085C9CF8
.L08038BB0: .4byte Sprite_Sio_0810F220
.L08038BB4: .4byte Sprite_Sio_0810F256
.L08038BB8: .4byte Sprite_Sio_0810F228
.L08038BBC: .4byte Sprite_Sio_0810F242
.L08038BC0:
	movs r0, #0x40
.L08038BC2:
	str r0, [sp]
	movs r0, #4
	bl PutSprite
	ldr r1, [r6, #0x30]
	rsbs r1, r1, #0
	adds r1, #0xd0
	ldr r2, [r6, #0x34]
	subs r2, #8
	ldr r3, .L08038C00 @ =Sprite_Sio_0810F25E
	ldrb r4, [r5]
	adds r0, r4, #0
	adds r0, #0xa
	movs r5, #0xf
	ands r0, r5
	lsls r0, r0, #0xc
	lsls r4, r4, #3
	movs r5, #0xc0
	lsls r5, r5, #1
	adds r4, r4, r5
	adds r0, r0, r4
	str r0, [sp]
	movs r0, #5
	bl PutSprite
.L08038BF4:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08038C00: .4byte Sprite_Sio_0810F25E

	thumb_func_start SioPostBattleSprites_Loop_DrawStatic
SioPostBattleSprites_Loop_DrawStatic: @ 0x08038C04
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, [r5, #0x30]
	ldr r2, [r5, #0x34]
	subs r2, #0x10
	ldr r3, .L08038CB4 @ =SpriteArray_Sio_085C9D08
	movs r0, #0x43
	adds r0, r0, r5
	mov r8, r0
	ldrb r4, [r0]
	lsls r0, r4, #2
	adds r0, r0, r3
	ldr r3, [r0]
	movs r4, #0
	str r4, [sp]
	movs r0, #4
	bl PutSprite
	ldr r1, [r5, #0x30]
	adds r1, #0x48
	ldr r2, [r5, #0x34]
	subs r2, #6
	ldr r3, .L08038CB8 @ =SpriteArray_Sio_085C9CF8
	adds r6, r5, #0
	adds r6, #0x42
	ldrb r7, [r6]
	lsls r0, r7, #2
	adds r0, r0, r3
	ldr r3, [r0]
	str r4, [sp]
	movs r0, #4
	bl PutSprite
	ldr r1, [r5, #0x30]
	adds r1, #0x60
	ldr r2, [r5, #0x34]
	adds r2, #8
	ldr r3, .L08038CBC @ =Sprite_Sio_0810F220
	str r4, [sp]
	movs r0, #4
	bl PutSprite
	ldr r1, [r5, #0x30]
	adds r1, #0x40
	ldr r2, [r5, #0x34]
	adds r2, #8
	ldr r3, .L08038CC0 @ =Sprite_Sio_0810F256
	mov r4, r8
	ldrb r4, [r4]
	lsls r0, r4, #2
	adds r0, #0x50
	str r0, [sp]
	movs r0, #4
	bl PutSprite
	ldr r1, [r5, #0x30]
	rsbs r1, r1, #0
	adds r1, #0x70
	ldr r2, [r5, #0x34]
	subs r2, #8
	ldr r3, .L08038CC4 @ =Sprite_Sio_0810F228
	movs r0, #0xf
	ldrb r7, [r6]
	ands r0, r7
	lsls r0, r0, #0xc
	movs r4, #0x80
	lsls r4, r4, #3
	adds r0, r0, r4
	str r0, [sp]
	movs r0, #4
	bl PutSprite
	ldr r0, [r5, #0x30]
	rsbs r0, r0, #0
	adds r1, r0, #0
	adds r1, #0x7c
	ldr r2, [r5, #0x34]
	ldr r3, .L08038CC8 @ =Sprite_Sio_0810F242
	ldrb r0, [r6]
	cmp r0, #3
	beq .L08038CCC
	lsls r0, r0, #3
	ldrb r6, [r6]
	adds r0, r0, r6
	b .L08038CCE
	.align 2, 0
.L08038CB4: .4byte SpriteArray_Sio_085C9D08
.L08038CB8: .4byte SpriteArray_Sio_085C9CF8
.L08038CBC: .4byte Sprite_Sio_0810F220
.L08038CC0: .4byte Sprite_Sio_0810F256
.L08038CC4: .4byte Sprite_Sio_0810F228
.L08038CC8: .4byte Sprite_Sio_0810F242
.L08038CCC:
	movs r0, #0x40
.L08038CCE:
	str r0, [sp]
	movs r0, #4
	bl PutSprite
	ldr r1, [r5, #0x30]
	rsbs r1, r1, #0
	adds r1, #0xd0
	ldr r2, [r5, #0x34]
	subs r2, #8
	ldr r3, .L08038D10 @ =Sprite_Sio_0810F25E
	adds r0, r5, #0
	adds r0, #0x42
	ldrb r4, [r0]
	adds r0, r4, #0
	adds r0, #0xa
	movs r5, #0xf
	ands r0, r5
	lsls r0, r0, #0xc
	lsls r4, r4, #3
	movs r5, #0xc0
	lsls r5, r5, #1
	adds r4, r4, r5
	adds r0, r0, r4
	str r0, [sp]
	movs r0, #5
	bl PutSprite
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08038D10: .4byte Sprite_Sio_0810F25E

	thumb_func_start StartDrawLinkArenaRankSprites
StartDrawLinkArenaRankSprites: @ 0x08038D14
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	mov r8, r0
	mov sb, r1
	adds r4, r2, #0
	adds r6, r3, #0
	ldr r5, [sp, #0x18]
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	ldr r0, .L08038D60 @ =ProcScr_LinkArenaPostBattle_DrawSprites
	mov r1, r8
	bl SpawnProc
	adds r1, r0, #0
	mov r0, r8
	str r0, [r1, #0x2c]
	mov r0, sb
	str r0, [r1, #0x38]
	adds r0, r1, #0
	adds r0, #0x40
	strh r4, [r0]
	adds r0, #3
	strb r5, [r0]
	subs r0, #1
	strb r6, [r0]
	adds r0, r1, #0
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
.L08038D60: .4byte ProcScr_LinkArenaPostBattle_DrawSprites

	thumb_func_start func_fe6_08038D64
func_fe6_08038D64: @ 0x08038D64
	push {r4, r5, r6, r7, lr}
	adds r2, r0, #0
	adds r0, #0x40
	ldrb r5, [r0]
	ldr r6, .L08038DA4 @ =gBg2Tm
	adds r3, r2, #0
	adds r3, #0x42
	adds r4, r2, #0
	adds r4, #0x41
	ldrb r1, [r4]
	subs r1, #1
	lsls r0, r1, #3
	adds r0, r2, r0
	adds r0, #0x44
	ldrb r3, [r3]
	ldrb r0, [r0]
	cmp r3, r0
	bne .L08038DB4
	ldr r2, .L08038DA8 @ =gUnk_Sio_0810F26C
	lsls r0, r1, #1
	lsls r1, r5, #3
	adds r0, r0, r1
	adds r0, r0, r2
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r0, r0, #6
	adds r0, r0, r6
	ldr r1, .L08038DAC @ =gUnk_08109CC0
	ldr r2, .L08038DB0 @ =0x00002060
	bl TmApplyTsa_thm
	b .L08038DDE
	.align 2, 0
.L08038DA4: .4byte gBg2Tm
.L08038DA8: .4byte gUnk_Sio_0810F26C
.L08038DAC: .4byte gUnk_08109CC0
.L08038DB0: .4byte 0x00002060
.L08038DB4:
	movs r2, #0
	ldr r7, .L08038DE4 @ =gUnk_Sio_0810F26C
	adds r3, r4, #0
	lsls r1, r5, #3
	ldr r5, .L08038DE8 @ =0x00001034
	adds r4, r5, #0
.L08038DC0:
	ldrb r0, [r3]
	subs r0, #1
	lsls r0, r0, #1
	adds r0, r0, r1
	adds r0, r0, r7
	movs r5, #0
	ldrsh r0, [r0, r5]
	lsls r0, r0, #5
	adds r0, r0, r2
	lsls r0, r0, #1
	adds r0, r0, r6
	strh r4, [r0]
	adds r2, #1
	cmp r2, #0x5f
	ble .L08038DC0
.L08038DDE:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08038DE4: .4byte gUnk_Sio_0810F26C
.L08038DE8: .4byte 0x00001034

	thumb_func_start func_fe6_08038DEC
func_fe6_08038DEC: @ 0x08038DEC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	str r0, [sp]
	adds r0, #0x40
	ldrb r0, [r0]
	mov sb, r0
	ldr r0, .L08038E40 @ =gFont_Unk_Sio_02001000
	bl SetTextFont
	movs r5, #0
	cmp r5, sb
	bge .L08038E7A
	mov sl, r5
	movs r0, #0x98
	mov r8, r0
	movs r7, #0
	movs r6, #0
.L08038E16:
	ldr r0, .L08038E44 @ =0x0203C6B9
	adds r4, r6, r0
	adds r0, r4, #0
	bl GetStringTextLen
	adds r1, r0, #0
	movs r0, #0x48
	subs r0, r0, r1
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r1, r0, #1
	cmp r5, #2
	bgt .L08038E4C
	adds r1, r7, r1
	ldr r0, .L08038E48 @ =gSioText_0203C708
	movs r2, #0
	adds r3, r4, #0
	bl Text_InsertDrawString
	b .L08038E56
	.align 2, 0
.L08038E40: .4byte gFont_Unk_Sio_02001000
.L08038E44: .4byte 0x0203C6B9
.L08038E48: .4byte gSioText_0203C708
.L08038E4C:
	ldr r0, .L08038E8C @ =0x0203C710
	movs r2, #0
	adds r3, r4, #0
	bl Text_InsertDrawString
.L08038E56:
	ldr r0, [sp]
	adds r0, #0x48
	add r0, sl
	ldr r3, [r0]
	ldr r0, .L08038E8C @ =0x0203C710
	mov r1, r8
	movs r2, #2
	bl Text_InsertDrawNumberOrBlank
	movs r0, #8
	add sl, r0
	movs r0, #0x20
	add r8, r0
	adds r7, #0x48
	adds r6, #0xf
	adds r5, #1
	cmp r5, sb
	blt .L08038E16
.L08038E7A:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08038E8C: .4byte 0x0203C710

	thumb_func_start SioPostBattle_StartMusicProc
SioPostBattle_StartMusicProc: @ 0x08038E90
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, .L08038EB0 @ =ProcScr_SioPostBattle_PlayMusic
	adds r1, r4, #0
	bl SpawnProc
	adds r1, r0, #0
	adds r0, r4, #0
	adds r0, #0x42
	adds r4, #0x44
	ldrb r0, [r0]
	ldrb r4, [r4]
	cmp r0, r4
	bne .L08038EB4
	movs r0, #1
	b .L08038EB6
	.align 2, 0
.L08038EB0: .4byte ProcScr_SioPostBattle_PlayMusic
.L08038EB4:
	movs r0, #0
.L08038EB6:
	str r0, [r1, #0x58]
	adds r0, r1, #0
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start SioPostBattle_Init
SioPostBattle_Init: @ 0x08038EC0
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	bl ClearSioBG
	bl InitSioBG
	ldr r0, .L08039024 @ =Img_TacticianSelObj
	ldr r1, .L08039028 @ =0x06014800
	bl Decompress
	ldr r0, .L0803902C @ =Img_LinkArenaPlayerBanners
	ldr r1, .L08039030 @ =0x06016000
	bl Decompress
	ldr r0, .L08039034 @ =Img_LinkArenaPlacementRanks
	ldr r1, .L08039038 @ =0x06016800
	bl Decompress
	ldr r0, .L0803903C @ =Pal_TacticianSelObj
	movs r1, #0x98
	lsls r1, r1, #2
	movs r2, #0x80
	bl ApplyPaletteExt
	ldr r0, .L08039040 @ =Pal_LinkArenaPlacementRanks
	movs r1, #0xb8
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, .L08039044 @ =Img_LinkArenaActiveBannerFx
	ldr r1, .L08039048 @ =0x06000C00
	bl Decompress
	ldr r0, .L0803904C @ =Pal_LinkArenaActiveBannerFx
	movs r1, #0x40
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r4, .L08039050 @ =Img_LinkArenaPostBattleBg
	movs r0, #3
	bl GetBgChrOffset
	adds r1, r0, #0
	movs r0, #0xc0
	lsls r0, r0, #0x13
	adds r1, r1, r0
	adds r0, r4, #0
	bl Decompress
	ldr r0, .L08039054 @ =Pal_LinkArenaPostBattleBg
	movs r1, #0xa0
	lsls r1, r1, #1
	movs r2, #0x80
	bl ApplyPaletteExt
	ldr r0, .L08039058 @ =gBg3Tm
	ldr r1, .L0803905C @ =Tsa_LinkArenaPostBattleBg
	movs r2, #0
	bl TmApplyTsa_thm
	ldr r0, .L08039060 @ =gFont_Unk_Sio_02001000
	ldr r1, .L08039064 @ =0x06012000
	movs r2, #0xe
	bl InitSpriteTextFont
	ldr r0, .L08039068 @ =Pal_Text
	movs r1, #0xf0
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	movs r0, #0
	bl SetTextFontGlyphs
	bl ResetTextFont
	ldr r4, .L0803906C @ =gSioText_0203C708
	movs r5, #1
.L08038F60:
	adds r0, r4, #0
	bl InitSpriteText
	adds r0, r4, #0
	movs r1, #0
	bl SpriteText_DrawBackgroundExt
	adds r4, #8
	subs r5, #1
	cmp r5, #0
	bge .L08038F60
	ldr r0, .L08039070 @ =gSioSt
	ldr r0, [r0]
	ldrb r2, [r0, #7]
	adds r1, r6, #0
	adds r1, #0x40
	movs r3, #0
	strb r2, [r1]
	ldrb r1, [r0, #7]
	adds r2, r6, #0
	adds r2, #0x41
	strb r1, [r2]
	ldrb r0, [r0, #6]
	adds r1, r6, #0
	adds r1, #0x42
	strb r0, [r1]
	mov r0, sp
	movs r5, #0
	strh r3, [r0]
	adds r4, r6, #0
	adds r4, #0x44
	ldr r2, .L08039074 @ =0x01000010
	adds r1, r4, #0
	bl CpuSet
	adds r0, r4, #0
	bl func_fe6_0803C094
	adds r0, r6, #0
	bl func_fe6_08038DEC
	movs r0, #0xb0
	str r0, [r6, #0x64]
	movs r0, #2
	movs r1, #0
	movs r2, #0xb0
	bl SetBgOffset
	ldr r3, .L08039078 @ =gDispIo
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
	movs r1, #8
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r5, [r0]
	ldr r0, .L0803907C @ =0x0000FFE0
	ldrh r2, [r3, #0x3c]
	ands r0, r2
	movs r1, #4
	orrs r0, r1
	ldr r1, .L08039080 @ =0x0000E0FF
	ands r0, r1
	movs r2, #0x80
	lsls r2, r2, #4
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r3, #0x3c]
	adds r0, r6, #0
	bl SioPostBattle_StartMusicProc
	movs r0, #8
	bl EnableBgSync
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08039024: .4byte Img_TacticianSelObj
.L08039028: .4byte 0x06014800
.L0803902C: .4byte Img_LinkArenaPlayerBanners
.L08039030: .4byte 0x06016000
.L08039034: .4byte Img_LinkArenaPlacementRanks
.L08039038: .4byte 0x06016800
.L0803903C: .4byte Pal_TacticianSelObj
.L08039040: .4byte Pal_LinkArenaPlacementRanks
.L08039044: .4byte Img_LinkArenaActiveBannerFx
.L08039048: .4byte 0x06000C00
.L0803904C: .4byte Pal_LinkArenaActiveBannerFx
.L08039050: .4byte Img_LinkArenaPostBattleBg
.L08039054: .4byte Pal_LinkArenaPostBattleBg
.L08039058: .4byte gBg3Tm
.L0803905C: .4byte Tsa_LinkArenaPostBattleBg
.L08039060: .4byte gFont_Unk_Sio_02001000
.L08039064: .4byte 0x06012000
.L08039068: .4byte Pal_Text
.L0803906C: .4byte gSioText_0203C708
.L08039070: .4byte gSioSt
.L08039074: .4byte 0x01000010
.L08039078: .4byte gDispIo
.L0803907C: .4byte 0x0000FFE0
.L08039080: .4byte 0x0000E0FF

	thumb_func_start SioPostBattle_Loop_Main
SioPostBattle_Loop_Main: @ 0x08039084
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r0, #0x40
	ldrb r6, [r0]
	ldr r2, [r4, #0x64]
	subs r2, #1
	str r2, [r4, #0x64]
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	movs r1, #0
	bl SetBgOffset
	bl func_fe6_08040F70
	adds r5, r4, #0
	adds r5, #0x41
	ldrb r0, [r5]
	cmp r0, #0
	beq .L0803910E
	ldr r2, [r4, #0x64]
	asrs r2, r2, #3
	ldr r3, .L08039124 @ =gUnk_Sio_0810F26C
	ldrb r0, [r5]
	subs r0, #1
	lsls r0, r0, #1
	lsls r1, r6, #3
	adds r0, r0, r1
	adds r0, r0, r3
	movs r1, #0
	ldrsh r0, [r0, r1]
	adds r0, #4
	cmp r2, r0
	bne .L0803910E
	adds r0, r4, #0
	bl func_fe6_08038D64
	movs r0, #4
	bl EnableBgSync
	ldr r2, .L08039128 @ =gSioBmSt
	ldrb r1, [r5]
	subs r1, #1
	lsls r0, r1, #3
	adds r0, r4, r0
	adds r0, #0x44
	ldrb r3, [r0]
	lsls r0, r3, #1
	adds r2, #0x24
	adds r0, r0, r2
	ldrh r2, [r0]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	str r1, [sp]
	adds r0, r4, #0
	movs r1, #0x28
	bl StartDrawLinkArenaRankSprites
	ldrb r2, [r5]
	subs r2, #1
	lsls r2, r2, #2
	adds r1, r4, #0
	adds r1, #0x2c
	adds r1, r1, r2
	str r0, [r1]
	ldrb r0, [r5]
	subs r0, #1
	strb r0, [r5]
.L0803910E:
	ldr r0, [r4, #0x64]
	cmp r0, #0
	bne .L0803911A
	adds r0, r4, #0
	bl Proc_Break
.L0803911A:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08039124: .4byte gUnk_Sio_0810F26C
.L08039128: .4byte gSioBmSt

	thumb_func_start SioPostBattle_AwaitAPress
SioPostBattle_AwaitAPress: @ 0x0803912C
	push {r4, lr}
	adds r4, r0, #0
	bl func_fe6_08040F70
	ldr r0, .L08039168 @ =gKeySt
	ldr r1, [r0]
	movs r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq .L08039162
	ldr r2, .L0803916C @ =gMusicPlayerTable
	ldr r1, .L08039170 @ =gSongTable
	ldr r0, .L08039174 @ =0x0000040C
	adds r1, r1, r0
	ldrh r3, [r1]
	lsls r0, r3, #1
	adds r0, r0, r3
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r0, [r0]
	movs r1, #1
	bl m4aMPlayFadeOut
	adds r0, r4, #0
	bl Proc_Break
.L08039162:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08039168: .4byte gKeySt
.L0803916C: .4byte gMusicPlayerTable
.L08039170: .4byte gSongTable
.L08039174: .4byte 0x0000040C

	thumb_func_start SioPostBattleMusic_PlayFanfare
SioPostBattleMusic_PlayFanfare: @ 0x08039178
	push {lr}
	ldr r0, [r0, #0x58]
	cmp r0, #0
	beq .L0803918C
	movs r0, #0x46
	movs r1, #0
	movs r2, #0
	bl StartBgmExt
	b .L08039196
.L0803918C:
	movs r0, #0x4a
	movs r1, #0
	movs r2, #0
	bl StartBgmExt
.L08039196:
	ldr r0, .L080391AC @ =gPlaySt
	ldrb r0, [r0, #0x1d]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L080391A6
	movs r0, #0x81
	bl m4aSongNumStart
.L080391A6:
	pop {r0}
	bx r0
	.align 2, 0
.L080391AC: .4byte gPlaySt

	thumb_func_start SioPostBattleMusic_PlayStandardBgm
SioPostBattleMusic_PlayStandardBgm: @ 0x080391B0
	push {lr}
	movs r0, #0x4a
	movs r1, #0
	movs r2, #0
	bl StartBgmExt
	pop {r0}
	bx r0

	thumb_func_start func_fe6_080391C0
func_fe6_080391C0: @ 0x080391C0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	mov sb, r1
	mov sl, r2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	adds r4, r3, #0
	movs r2, #0
	ldr r1, .L080391F4 @ =0x0203C838
.L080391DC:
	ldr r0, [r1]
	lsrs r0, r0, #5
	cmp r0, r4
	bhs .L080391F8
	adds r7, r2, #0
	movs r2, #9
	lsls r3, r3, #5
	str r3, [sp, #4]
	cmp r2, r7
	ble .L08039274
	b .L08039206
	.align 2, 0
.L080391F4: .4byte 0x0203C838
.L080391F8:
	adds r1, #0x14
	adds r2, #1
	cmp r2, #9
	ble .L080391DC
	movs r0, #1
	rsbs r0, r0, #0
	b .L080392D8
.L08039206:
	ldr r6, .L080392E8 @ =0x0203C838
	lsls r1, r2, #2
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r5, r1, r6
	subs r2, #1
	mov r8, r2
	lsls r4, r2, #2
	add r4, r8
	lsls r4, r4, #2
	adds r4, r4, r6
	ldrb r0, [r4]
	lsls r2, r0, #0x1e
	lsrs r2, r2, #0x1e
	movs r0, #4
	rsbs r0, r0, #0
	ldrb r3, [r5]
	ands r0, r3
	orrs r0, r2
	strb r0, [r5]
	ldr r3, [r4]
	lsrs r3, r3, #5
	lsls r3, r3, #5
	ldr r0, [r5]
	movs r2, #0x1f
	ands r0, r2
	orrs r0, r3
	str r0, [r5]
	movs r2, #0xc
	ldrb r0, [r4]
	ands r2, r0
	movs r0, #0xd
	rsbs r0, r0, #0
	ldrb r3, [r5]
	ands r0, r3
	orrs r0, r2
	strb r0, [r5]
	movs r3, #0x10
	ldrb r4, [r4]
	ands r3, r4
	movs r2, #0x11
	rsbs r2, r2, #0
	ands r0, r2
	orrs r0, r3
	strb r0, [r5]
	adds r0, r6, #0
	subs r0, #0x10
	adds r0, r1, r0
	adds r6, #4
	adds r1, r1, r6
	bl SioStrCpy
	mov r2, r8
	cmp r2, r7
	bgt .L08039206
.L08039274:
	ldr r5, .L080392E8 @ =0x0203C838
	lsls r1, r7, #2
	adds r1, r1, r7
	lsls r1, r1, #2
	adds r4, r1, r5
	movs r3, #3
	ldr r2, [sp]
	ands r2, r3
	movs r0, #4
	rsbs r0, r0, #0
	ldrb r6, [r4]
	ands r0, r6
	orrs r0, r2
	strb r0, [r4]
	ldr r0, [r4]
	movs r2, #0x1f
	ands r0, r2
	ldr r2, [sp, #4]
	orrs r0, r2
	str r0, [r4]
	mov r6, sb
	ands r6, r3
	lsls r2, r6, #2
	movs r0, #0xd
	rsbs r0, r0, #0
	ldrb r3, [r4]
	ands r0, r3
	orrs r0, r2
	movs r2, #1
	mov r6, sl
	ands r6, r2
	lsls r3, r6, #4
	movs r2, #0x11
	rsbs r2, r2, #0
	ands r0, r2
	orrs r0, r3
	strb r0, [r4]
	ldr r0, .L080392EC @ =gSioSt
	ldr r0, [r0]
	movs r2, #6
	ldrsb r2, [r0, r2]
	lsls r0, r2, #4
	subs r0, r0, r2
	ldr r2, .L080392F0 @ =0x0203C6B9
	adds r0, r0, r2
	adds r5, #4
	adds r1, r1, r5
	bl SioStrCpy
	adds r0, r7, #0
.L080392D8:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
.L080392E8: .4byte 0x0203C838
.L080392EC: .4byte gSioSt
.L080392F0: .4byte 0x0203C6B9

	thumb_func_start func_fe6_080392F4
func_fe6_080392F4: @ 0x080392F4
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r7, r0, #0
	ldr r0, .L08039364 @ =gLinkArenaSt
	adds r1, r0, #0
	adds r1, #0xec
	ldrb r1, [r1]
	lsls r5, r1, #0x1e
	lsrs r5, r5, #0x1f
	adds r0, #0xa0
	ldrb r0, [r0]
	subs r0, #1
	mov sb, r0
	bl func_fe6_0803D208
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r1, .L08039368 @ =gSioBmSt
	ldr r0, .L0803936C @ =gSioSt
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #2
	adds r1, #0x14
	adds r0, r0, r1
	ldr r0, [r0]
	mov r8, r0
	ldr r6, .L08039370 @ =0x0203C838
	adds r0, r6, #0
	bl ReadMultiArenaSaveRankings
	adds r0, r4, #0
	mov r1, sb
	adds r2, r5, #0
	mov r3, r8
	bl func_fe6_080391C0
	str r0, [r7, #0x58]
	adds r0, r6, #0
	bl WriteMultiArenaSaveRankings
	ldr r1, [r7, #0x58]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq .L08039374
	adds r0, r1, #0
	adds r1, r7, #0
	bl StartSioResultNewHighScore
	b .L0803937A
	.align 2, 0
.L08039364: .4byte gLinkArenaSt
.L08039368: .4byte gSioBmSt
.L0803936C: .4byte gSioSt
.L08039370: .4byte 0x0203C838
.L08039374:
	movs r0, #1
	bl FadeBgmOut
.L0803937A:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_fe6_08039388
func_fe6_08039388: @ 0x08039388
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	ldr r1, .L0803940C @ =gUnk_Sio_0810F294
	mov r0, sp
	movs r2, #3
	bl memcpy
	bl InitUnits
	movs r6, #0
	ldr r1, .L08039410 @ =gLinkArenaSt
	ldrb r0, [r1, #5]
	adds r0, #2
	cmp r6, r0
	bge .L08039460
	mov sb, r1
.L080393B0:
	lsls r4, r6, #6
	adds r4, #1
	adds r0, r4, #0
	bl GetUnit
	adds r5, r0, #0
	mov r0, sb
	adds r0, #6
	adds r0, r6, r0
	ldrb r0, [r0]
	lsls r2, r6, #4
	subs r2, r2, r6
	ldr r1, .L08039414 @ =0x0203C6B9
	adds r2, r2, r1
	adds r1, r5, #0
	bl ReadMultiArenaSaveTeam
	movs r7, #0
	adds r2, r6, #1
	mov sl, r2
	lsls r0, r6, #1
	ldr r1, .L08039418 @ =0x0203C9A8
	adds r0, r0, r1
	mov r8, r0
.L080393E0:
	adds r0, r4, #0
	bl GetUnit
	adds r5, r0, #0
	movs r2, #0
	strb r2, [r5, #9]
	movs r1, #0
	bl SetUnitStatus
	movs r0, #0
	strb r0, [r5, #0x19]
	movs r0, #4
	ldr r1, .L0803941C @ =gSioSaveConfig
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne .L08039420
	adds r0, r5, #0
	bl SioSetNormalWeapons
	b .L08039426
	.align 2, 0
.L0803940C: .4byte gUnk_Sio_0810F294
.L08039410: .4byte gLinkArenaSt
.L08039414: .4byte 0x0203C6B9
.L08039418: .4byte 0x0203C9A8
.L0803941C: .4byte gSioSaveConfig
.L08039420:
	adds r0, r5, #0
	bl SioSetUniqueWeapons
.L08039426:
	cmp r7, #0
	bne .L08039434
	adds r0, r5, #0
	bl GetUnitChibiId
	mov r2, r8
	strh r0, [r2]
.L08039434:
	strb r4, [r5, #0xb]
	cmp r6, #0
	beq .L0803944C
	movs r0, #1
	ldr r1, .L08039498 @ =gSioSaveConfig
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne .L0803944C
	movs r0, #0x80
	lsls r0, r0, #2
	strh r0, [r5, #0xc]
.L0803944C:
	adds r4, #1
	adds r7, #1
	cmp r7, #4
	ble .L080393E0
	mov r6, sl
	mov r2, sb
	ldrb r0, [r2, #5]
	adds r0, #2
	cmp r6, r0
	blt .L080393B0
.L08039460:
	ldr r0, .L0803949C @ =gSioBmSt
	movs r1, #0
	strb r1, [r0]
	ldr r2, .L080394A0 @ =gSioSt
	ldr r0, [r2]
	strb r1, [r0, #6]
	ldr r3, [r2]
	ldr r1, .L080394A4 @ =gLinkArenaSt
	ldrb r0, [r1, #5]
	add r0, sp
	ldrb r0, [r0]
	strb r0, [r3, #9]
	ldr r2, [r2]
	ldrb r0, [r1, #5]
	adds r0, #2
	strb r0, [r2, #7]
	ldrb r0, [r1, #5]
	adds r0, #2
	adds r1, #0xa0
	strb r0, [r1]
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08039498: .4byte gSioSaveConfig
.L0803949C: .4byte gSioBmSt
.L080394A0: .4byte gSioSt
.L080394A4: .4byte gLinkArenaSt

	thumb_func_start NewSIOMAIN2
NewSIOMAIN2: @ 0x080394A8
	push {lr}
	ldr r0, .L080394B8 @ =ProcScr_SIOMAIN2
	movs r1, #2
	bl SpawnProc
	pop {r0}
	bx r0
	.align 2, 0
.L080394B8: .4byte ProcScr_SIOMAIN2

	thumb_func_start SIOPRA_BranchAfterMain2
SIOPRA_BranchAfterMain2: @ 0x080394BC
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, .L080394F4 @ =ProcScr_SIOMAIN2
	bl FindProc
	cmp r0, #0
	bne .L080394EE
	ldr r5, .L080394F8 @ =gLinkArenaSt
	ldrb r0, [r5, #0xb]
	cmp r0, #1
	bne .L080394DA
	adds r0, r4, #0
	movs r1, #1
	bl Proc_Goto
.L080394DA:
	ldrb r5, [r5, #0xb]
	cmp r5, #2
	bne .L080394E8
	adds r0, r4, #0
	movs r1, #4
	bl Proc_Goto
.L080394E8:
	adds r0, r4, #0
	bl Proc_Break
.L080394EE:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L080394F4: .4byte ProcScr_SIOMAIN2
.L080394F8: .4byte gLinkArenaSt

	thumb_func_start func_fe6_080394FC
func_fe6_080394FC: @ 0x080394FC
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	mov r8, r0
	adds r4, r1, #0
	adds r5, r2, #0
	adds r6, r3, #0
	bl SetInitTalkTextFont
	bl ClearTalkText
	bl ResetTextFont
	adds r0, r4, #0
	adds r1, r5, #0
	mov r2, r8
	adds r3, r6, #0
	bl StartTalkExt
	movs r0, #1
	bl SetTalkPrintColor
	movs r0, #1
	bl SetTalkFlag
	movs r0, #2
	bl SetTalkFlag
	movs r0, #4
	bl SetTalkFlag
	movs r0, #2
	bl SetTalkPrintDelay
	movs r0, #1
	bl SetActiveTalkFace
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start SioBat_EndHandler
SioBat_EndHandler: @ 0x08039550
	push {lr}
	ldr r0, .L08039568 @ =ProcScr_SIOVSYNC
	bl Proc_EndEach
	ldr r0, .L0803956C @ =ProcScr_SIOMAIN
	bl Proc_EndEach
	ldr r0, .L08039570 @ =ProcScr_SIOCON
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
.L08039568: .4byte ProcScr_SIOVSYNC
.L0803956C: .4byte ProcScr_SIOMAIN
.L08039570: .4byte ProcScr_SIOCON

	thumb_func_start SioBat_ReleaseIrq
SioBat_ReleaseIrq: @ 0x08039574
	push {lr}
	bl SioReleaseIrq
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_fe6_08039580
func_fe6_08039580: @ 0x08039580
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	movs r6, #0
	ldr r0, .L080395F8 @ =gLinkArenaSt
	mov sb, r0
	movs r1, #0x98
	lsls r1, r1, #2
	mov r8, r1
	movs r0, #0xa1
	add r0, sb
	mov sl, r0
	movs r7, #5
.L080395A0:
	mov r0, sb
	adds r0, #0x9c
	adds r5, r6, r0
	ldr r0, .L080395FC @ =gSioSt
	ldr r0, [r0]
	adds r0, #0xb
	adds r0, r0, r6
	ldrb r0, [r0]
	ldrb r1, [r5]
	cmp r1, r0
	beq .L0803962C
	strb r0, [r5]
	lsls r1, r6, #3
	mov r0, sb
	adds r0, #0xc
	adds r4, r1, r0
	adds r0, r4, #0
	bl ClearText
	adds r0, r4, #0
	movs r1, #0
	bl Text_SetColor
	ldrb r0, [r5]
	cmp r0, #4
	bhi .L08039608
	ldr r1, .L08039600 @ =gUnk_Sio_085C99B0
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r3, [r0]
	movs r0, #0xa
	str r0, [sp]
	adds r0, r4, #0
	movs r1, #0xa
	adds r2, r7, #0
	bl PutDrawTextCentered
	ldr r0, .L08039604 @ =gUnk_08109C60
	mov r1, r8
	movs r2, #0x20
	bl ApplyPaletteExt
	b .L08039626
	.align 2, 0
.L080395F8: .4byte gLinkArenaSt
.L080395FC: .4byte gSioSt
.L08039600: .4byte gUnk_Sio_085C99B0
.L08039604: .4byte gUnk_08109C60
.L08039608:
	movs r0, #0xa
	str r0, [sp]
	adds r0, r4, #0
	movs r1, #0xa
	adds r2, r7, #0
	mov r3, sl
	bl PutDrawTextCentered
	lsls r0, r6, #5
	ldr r1, .L0803964C @ =Pal_TacticianSelObj
	adds r0, r0, r1
	mov r1, r8
	movs r2, #0x20
	bl ApplyPaletteExt
.L08039626:
	movs r0, #1
	bl EnableBgSync
.L0803962C:
	movs r1, #0x20
	add r8, r1
	movs r0, #0xf
	add sl, r0
	adds r7, #3
	adds r6, #1
	cmp r6, #3
	ble .L080395A0
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0803964C: .4byte Pal_TacticianSelObj

	thumb_func_start func_fe6_08039650
func_fe6_08039650: @ 0x08039650
	push {r4, r5, r6, lr}
	sub sp, #0x18
	adds r6, r0, #0
	bl ClearSioBG
	bl InitSioBG
	ldr r0, .L0803976C @ =Img_TacticianSelObj
	ldr r1, .L08039770 @ =0x06014800
	bl Decompress
	ldr r0, .L08039774 @ =Img_LinkArenaPlayerBanners
	ldr r1, .L08039778 @ =0x06016000
	bl Decompress
	ldr r0, .L0803977C @ =Img_Sio_081080D4
	ldr r1, .L08039780 @ =0x06016800
	bl Decompress
	movs r4, #0x98
	lsls r4, r4, #2
	movs r5, #3
.L0803967C:
	ldr r0, .L08039784 @ =gUnk_08109C60
	adds r1, r4, #0
	movs r2, #0x20
	bl ApplyPaletteExt
	adds r4, #0x20
	subs r5, #1
	cmp r5, #0
	bge .L0803967C
	movs r0, #0
	movs r1, #2
	bl Sio_RestartBgSlide
	ldr r4, .L08039788 @ =gLinkArenaSt
	ldrb r0, [r4, #3]
	add r1, sp, #8
	bl ReadMultiArenaSaveTeamName
	ldr r0, .L0803978C @ =gSioFont_0203C758
	bl SetTextFont
	bl InitSystemTextFont
	bl ResetTextFont
	bl func_fe6_08036C60
	movs r5, #0
	adds r4, #0x9c
	movs r2, #0xff
.L080396B8:
	adds r1, r5, r4
	ldrb r0, [r1]
	orrs r0, r2
	strb r0, [r1]
	adds r5, #1
	cmp r5, #3
	ble .L080396B8
	bl func_fe6_08039580
	movs r5, #0
	ldr r2, .L08039790 @ =gUnk_030044E6
.L080396CE:
	adds r0, r5, r2
	mov r1, sp
	adds r1, r1, r5
	adds r1, #8
	ldrb r1, [r1]
	strb r1, [r0]
	adds r5, #1
	cmp r5, #0xe
	ble .L080396CE
	movs r0, #0
	str r0, [r6, #0x34]
	str r0, [r6, #0x30]
	movs r0, #0xc0
	movs r1, #0x10
	adds r2, r6, #0
	bl StartLinkArenaButtonSpriteDraw
	movs r0, #0x48
	movs r1, #0x20
	adds r2, r6, #0
	bl StartLinkArenaVersusSpriteDraw
	str r0, [r6, #0x2c]
	ldr r0, .L08039794 @ =gUnk_Sio_085C9E88
	bl SetFaceConfig
	movs r0, #2
	str r0, [sp]
	movs r0, #3
	movs r1, #0xc0
	movs r2, #0xd0
	movs r3, #0x50
	bl StartFace
	ldr r0, [r6, #0x2c]
	ldr r1, .L08039798 @ =gUnk_Sio_0810F19C
	ldr r4, .L08039788 @ =gLinkArenaSt
	ldrb r2, [r4]
	adds r1, r2, r1
	ldrb r1, [r1]
	bl StartLinkArenaTitleBanner
	ldr r0, .L0803979C @ =gUnk_Sio_085C9AD4
	ldrb r3, [r4]
	lsls r1, r3, #2
	adds r0, r1, r0
	ldr r0, [r0]
	ldr r2, .L080397A0 @ =gUnk_Sio_0810F190
	adds r1, r1, r2
	ldr r1, [r1]
	str r3, [sp]
	ldr r2, [r6, #0x2c]
	str r2, [sp, #4]
	movs r2, #0
	movs r3, #8
	bl func_fe6_0803FD40
	ldr r0, [r6, #0x30]
	ldr r1, .L080397A4 @ =0x000006D7
	adds r0, r0, r1
	movs r1, #1
	bl SioPutText
	ldr r2, .L080397A8 @ =gDispIo
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
	add sp, #0x18
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L0803976C: .4byte Img_TacticianSelObj
.L08039770: .4byte 0x06014800
.L08039774: .4byte Img_LinkArenaPlayerBanners
.L08039778: .4byte 0x06016000
.L0803977C: .4byte Img_Sio_081080D4
.L08039780: .4byte 0x06016800
.L08039784: .4byte gUnk_08109C60
.L08039788: .4byte gLinkArenaSt
.L0803978C: .4byte gSioFont_0203C758
.L08039790: .4byte gUnk_030044E6
.L08039794: .4byte gUnk_Sio_085C9E88
.L08039798: .4byte gUnk_Sio_0810F19C
.L0803979C: .4byte gUnk_Sio_085C9AD4
.L080397A0: .4byte gUnk_Sio_0810F190
.L080397A4: .4byte 0x000006D7
.L080397A8: .4byte gDispIo

	thumb_func_start func_fe6_080397AC
func_fe6_080397AC: @ 0x080397AC
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r1, .L080397E4 @ =0x00002586
	mov r0, sp
	strh r1, [r0]
	ldr r0, .L080397E8 @ =ProcScr_SIOVSYNC
	movs r1, #0
	bl SpawnProc
	ldr r0, .L080397EC @ =ProcScr_SIOMAIN
	adds r1, r4, #0
	bl SpawnProc
	ldr r0, .L080397F0 @ =ProcScr_SIOCON
	adds r1, r4, #0
	bl SpawnProc
	movs r1, #1
	rsbs r1, r1, #0
	mov r0, sp
	bl SioSend16
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L080397E4: .4byte 0x00002586
.L080397E8: .4byte ProcScr_SIOVSYNC
.L080397EC: .4byte ProcScr_SIOMAIN
.L080397F0: .4byte ProcScr_SIOCON

	thumb_func_start func_fe6_080397F4
func_fe6_080397F4: @ 0x080397F4
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r4, r0, #0
	movs r6, #0
	movs r1, #0
	ldr r5, [r4, #0x2c]
	ldr r0, .L08039834 @ =0x0203C91C
	str r1, [r0]
	mov r0, sp
	strb r1, [r0]
	bl func_fe6_08039580
	ldr r0, .L08039838 @ =ProcScr_SIOCON
	bl FindProc
	cmp r0, #0
	beq .L08039840
	ldr r0, .L0803983C @ =gKeySt
	ldr r1, [r0]
	movs r0, #2
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	bne .L08039826
	b .L08039A0A
.L08039826:
	movs r0, #1
	bl SioPlaySe
	bl EndLinkArenaButtonSpriteDraw
	b .L08039874
	.align 2, 0
.L08039834: .4byte 0x0203C91C
.L08039838: .4byte ProcScr_SIOCON
.L0803983C: .4byte gKeySt
.L08039840:
	bl EndLinkArenaButtonSpriteDraw
	ldr r2, .L08039888 @ =gSioSt
	ldr r1, [r2]
	movs r0, #6
	ldrsb r0, [r1, r0]
	str r0, [r5, #0x34]
	movs r3, #0
	adds r1, #0x1a
	adds r5, r2, #0
.L08039854:
	adds r0, r1, r3
	ldrb r0, [r0]
	cmp r0, #0x3c
	bls .L0803985E
	adds r6, #1
.L0803985E:
	adds r3, #1
	cmp r3, #3
	ble .L08039854
	ldr r0, [r5]
	movs r1, #6
	ldrsb r1, [r0, r1]
	adds r0, #0xb
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #2
	bne .L0803988C
.L08039874:
	bl SioBat_EndHandler
	bl SioBat_ReleaseIrq
	adds r0, r4, #0
	movs r1, #2
	bl Proc_Goto
	b .L08039A0A
	.align 2, 0
.L08039888: .4byte gSioSt
.L0803988C:
	bl func_fe6_08035CF8
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L080398A2
	ldr r0, [r5]
	ldrb r1, [r0, #0x1e]
	cmp r1, #0x3c
	bhi .L080398A2
	cmp r6, #0
	beq .L080398CC
.L080398A2:
	bl SioBat_EndHandler
	bl SioBat_ReleaseIrq
	adds r0, r4, #0
	bl func_fe6_080397AC
	movs r0, #0
	str r0, [r4, #0x30]
	ldr r0, .L080398C8 @ =0x000006D7
	movs r1, #1
	bl SioPutText
	movs r0, #0xc0
	movs r1, #0x10
	adds r2, r4, #0
	bl StartLinkArenaButtonSpriteDraw
	b .L08039A0A
	.align 2, 0
.L080398C8: .4byte 0x000006D7
.L080398CC:
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne .L08039960
	bl func_fe6_08035D7C
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne .L08039960
	ldr r0, [r4, #0x30]
	cmp r0, #2
	beq .L080398F4
	movs r0, #2
	str r0, [r4, #0x30]
	ldr r0, .L08039950 @ =0x000006D9
	movs r1, #1
	bl SioPutText
.L080398F4:
	ldr r0, .L08039954 @ =gKeySt
	ldr r1, [r0]
	movs r0, #8
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq .L08039974
	ldr r0, [r5]
	movs r2, #0
	movs r1, #6
	strh r1, [r0, #4]
	strb r2, [r0, #0x1e]
	movs r3, #0
	adds r2, r5, #0
	movs r1, #0
.L08039912:
	ldr r0, [r2]
	adds r0, #0x1a
	adds r0, r0, r3
	strb r1, [r0]
	adds r3, #1
	cmp r3, #3
	ble .L08039912
	movs r0, #2
	bl SioPlaySe
	bl func_fe6_08035C58
	ldr r2, .L08039958 @ =gSioSt
	ldr r1, [r2]
	strb r0, [r1, #7]
	ldr r0, .L0803995C @ =gLinkArenaSt
	ldr r1, [r2]
	ldrb r1, [r1, #7]
	adds r0, #0xa0
	strb r1, [r0]
	bl func_fe6_08036608
	mov r1, sp
	movs r0, #0x18
	strb r0, [r1]
	mov r0, sp
	movs r1, #4
	bl SioEmitData
	str r0, [r4, #0x34]
	b .L080399D2
	.align 2, 0
.L08039950: .4byte 0x000006D9
.L08039954: .4byte gKeySt
.L08039958: .4byte gSioSt
.L0803995C: .4byte gLinkArenaSt
.L08039960:
	ldr r0, [r4, #0x30]
	cmp r0, #1
	beq .L08039974
	movs r0, #1
	str r0, [r4, #0x30]
	movs r0, #0xdb
	lsls r0, r0, #3
	movs r1, #1
	bl SioPutText
.L08039974:
	ldr r5, .L080399DC @ =gSioSt
	ldr r1, [r5]
	movs r0, #6
	ldrsb r0, [r1, r0]
	cmp r0, #0
	beq .L080399E4
	ldrb r0, [r1, #6]
	bl func_fe6_08035CB0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L080399E4
	add r1, sp, #4
	mov r0, sp
	movs r2, #0
	bl SioReceiveData
	lsls r0, r0, #0x10
	cmp r0, #0
	beq .L080399E4
	ldr r0, [r5]
	movs r2, #0
	movs r1, #6
	strh r1, [r0, #4]
	strb r2, [r0, #0x1e]
	movs r3, #0
	adds r2, r5, #0
	movs r1, #0
.L080399AC:
	ldr r0, [r2]
	adds r0, #0x1a
	adds r0, r0, r3
	strb r1, [r0]
	adds r3, #1
	cmp r3, #3
	ble .L080399AC
	bl func_fe6_08035C58
	ldr r2, .L080399DC @ =gSioSt
	ldr r1, [r2]
	strb r0, [r1, #7]
	ldr r0, .L080399E0 @ =gLinkArenaSt
	ldr r1, [r2]
	ldrb r1, [r1, #7]
	adds r0, #0xa0
	strb r1, [r0]
	bl func_fe6_08036608
.L080399D2:
	adds r0, r4, #0
	bl Proc_Break
	b .L08039A0A
	.align 2, 0
.L080399DC: .4byte gSioSt
.L080399E0: .4byte gLinkArenaSt
.L080399E4:
	bl GetGameTime
	movs r1, #0x26
	bl __umodsi3
	cmp r0, #0
	bne .L08039A0A
	ldr r0, .L08039A14 @ =gUnk_030044E0
	movs r1, #0x1c
	strb r1, [r0]
	ldr r1, .L08039A18 @ =gSioSt
	ldr r2, [r1]
	ldrb r1, [r2, #6]
	strb r1, [r0, #1]
	ldrb r1, [r2]
	strh r1, [r0, #2]
	movs r1, #0x16
	bl SioSend
.L08039A0A:
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08039A14: .4byte gUnk_030044E0
.L08039A18: .4byte gSioSt

	thumb_func_start func_fe6_08039A1C
func_fe6_08039A1C: @ 0x08039A1C
	push {r4, lr}
	adds r4, r0, #0
	bl func_fe6_08039580
	ldr r1, .L08039A74 @ =0x0203C91C
	ldr r0, [r1]
	adds r3, r0, #1
	str r3, [r1]
	ldr r0, .L08039A78 @ =gLinkArenaSt
	adds r0, #0xa0
	ldr r1, .L08039A7C @ =gSioSt
	ldr r2, [r1]
	ldrb r0, [r0]
	ldrb r1, [r2, #7]
	cmp r0, r1
	bne .L08039A44
	movs r0, #0x96
	lsls r0, r0, #2
	cmp r3, r0
	ble .L08039A84
.L08039A44:
	bl SioBat_EndHandler
	bl SioBat_ReleaseIrq
	adds r0, r4, #0
	bl func_fe6_080397AC
	movs r0, #0
	str r0, [r4, #0x30]
	ldr r0, .L08039A80 @ =0x000006D7
	movs r1, #1
	bl SioPutText
	movs r0, #0xc0
	movs r1, #0x10
	adds r2, r4, #0
	bl StartLinkArenaButtonSpriteDraw
	adds r0, r4, #0
	movs r1, #3
	bl Proc_Goto
	b .L08039AA8
	.align 2, 0
.L08039A74: .4byte 0x0203C91C
.L08039A78: .4byte gLinkArenaSt
.L08039A7C: .4byte gSioSt
.L08039A80: .4byte 0x000006D7
.L08039A84:
	movs r0, #6
	ldrsb r0, [r2, r0]
	cmp r0, #0
	bne .L08039AB0
	ldr r1, [r4, #0x34]
	movs r0, #0x8c
	muls r0, r1, r0
	adds r0, r2, r0
	movs r1, #0x9a
	lsls r1, r1, #1
	adds r0, r0, r1
	ldrb r1, [r2, #9]
	ldrb r0, [r0]
	ands r1, r0
	adds r0, r1, #0
	ldrb r2, [r2, #9]
	cmp r0, r2
	bne .L08039AB6
.L08039AA8:
	adds r0, r4, #0
	bl Proc_Break
	b .L08039AB6
.L08039AB0:
	adds r0, r4, #0
	bl Proc_Break
.L08039AB6:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start func_fe6_08039ABC
func_fe6_08039ABC: @ 0x08039ABC
	push {r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r7, r0, #0
	movs r0, #0xdb
	lsls r0, r0, #3
	movs r1, #1
	bl SioPutText
	ldr r0, .L08039B54 @ =gSioSt
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne .L08039B3E
	bl GetGameTime
	ldr r4, .L08039B58 @ =gLinkArenaSt
	adds r5, r4, #0
	adds r5, #0xa0
	ldrb r1, [r5]
	bl __umodsi3
	adds r6, r7, #0
	adds r6, #0x3b
	strb r0, [r6]
	bl RandNextB
	movs r1, #3
	ands r1, r0
	adds r1, #4
	ldrb r5, [r5]
	adds r3, r5, #0
	muls r3, r1, r3
	ldrb r0, [r6]
	adds r3, r0, r3
	adds r0, r7, #0
	adds r0, #0x39
	strb r3, [r0]
	mov r2, sp
	adds r4, #0xec
	ldrb r1, [r4]
	lsls r0, r1, #0x1f
	lsrs r0, r0, #0x1f
	strb r0, [r2]
	lsls r0, r1, #0x1d
	lsrs r0, r0, #0x1f
	strb r0, [r2, #1]
	mov r0, sp
	lsls r1, r1, #0x1e
	lsrs r1, r1, #0x1f
	strb r1, [r0, #2]
	mov r1, sp
	ldrb r0, [r6]
	strb r0, [r1, #3]
	mov r0, sp
	strb r3, [r0, #4]
	adds r0, #6
	bl RandGetSt
	mov r0, sp
	movs r1, #0x10
	bl SioEmitData
	str r0, [r7, #0x34]
.L08039B3E:
	adds r0, r7, #0
	adds r0, #0x3a
	movs r1, #0
	strb r1, [r0]
	subs r0, #2
	strb r1, [r0]
	add sp, #0x10
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08039B54: .4byte gSioSt
.L08039B58: .4byte gLinkArenaSt

	thumb_func_start func_fe6_08039B5C
func_fe6_08039B5C: @ 0x08039B5C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	adds r5, r0, #0
	ldr r7, [r5, #0x2c]
	ldr r0, .L08039B98 @ =gSioSt
	ldr r2, [r0]
	movs r4, #6
	ldrsb r4, [r2, r4]
	cmp r4, #0
	bne .L08039BA0
	ldr r1, [r5, #0x34]
	movs r0, #0x8c
	muls r0, r1, r0
	adds r0, r2, r0
	movs r1, #0x9a
	lsls r1, r1, #1
	adds r0, r0, r1
	ldrb r0, [r0]
	ldrb r2, [r2, #9]
	cmp r0, r2
	bne .L08039C20
	ldr r0, .L08039B9C @ =0x000006DD
	movs r1, #1
	bl SioPutText
	str r4, [r7, #0x38]
	adds r0, r5, #0
	bl Proc_Break
	b .L08039C20
	.align 2, 0
.L08039B98: .4byte gSioSt
.L08039B9C: .4byte 0x000006DD
.L08039BA0:
	bl GetGameTime
	movs r1, #0x26
	bl __umodsi3
	adds r6, r0, #0
	cmp r6, #0
	bne .L08039C20
	add r1, sp, #0x10
	mov r0, sp
	movs r2, #0
	bl SioReceiveData
	lsls r0, r0, #0x10
	cmp r0, #0
	beq .L08039C20
	ldr r4, .L08039C28 @ =gLinkArenaSt
	mov r0, sp
	adds r4, #0xec
	movs r3, #1
	ldrb r1, [r0]
	ands r1, r3
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r2, [r4]
	ands r0, r2
	orrs r0, r1
	mov r1, sp
	ldrb r1, [r1, #1]
	ands r1, r3
	lsls r1, r1, #2
	movs r2, #5
	rsbs r2, r2, #0
	ands r0, r2
	orrs r0, r1
	mov r1, sp
	ldrb r1, [r1, #2]
	ands r1, r3
	lsls r1, r1, #1
	adds r2, #2
	ands r0, r2
	orrs r0, r1
	strb r0, [r4]
	mov r0, sp
	ldrb r0, [r0, #3]
	adds r1, r5, #0
	adds r1, #0x3b
	strb r0, [r1]
	mov r0, sp
	ldrb r0, [r0, #4]
	subs r1, #2
	strb r0, [r1]
	mov r0, sp
	adds r0, #6
	bl RandSetSt
	ldr r0, .L08039C2C @ =0x000006DD
	movs r1, #1
	bl SioPutText
	str r6, [r7, #0x38]
	adds r0, r5, #0
	bl Proc_Break
.L08039C20:
	add sp, #0x14
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08039C28: .4byte gLinkArenaSt
.L08039C2C: .4byte 0x000006DD

	thumb_func_start func_fe6_08039C30
func_fe6_08039C30: @ 0x08039C30
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	ldr r7, [r6, #0x2c]
	adds r1, r6, #0
	adds r1, #0x38
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x10
	bls .L08039CD0
	movs r0, #0
	strb r0, [r1]
	adds r4, r6, #0
	adds r4, #0x3a
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	ldr r1, .L08039CA8 @ =gLinkArenaSt
	adds r1, #0xa0
	ldrb r0, [r4]
	ldrb r1, [r1]
	bl __umodsi3
	strb r0, [r4]
	adds r5, r6, #0
	adds r5, #0x39
	ldrb r0, [r5]
	subs r0, #1
	strb r0, [r5]
	ldrb r0, [r4]
	str r0, [r7, #0x38]
	ldr r0, .L08039CAC @ =gPlaySt
	ldrb r0, [r0, #0x1d]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L08039C82
	movs r0, #0x7d
	bl m4aSongNumStart
.L08039C82:
	ldrb r0, [r5]
	cmp r0, #0
	bne .L08039CD0
	adds r0, r6, #0
	adds r0, #0x3b
	ldr r1, .L08039CB0 @ =gSioSt
	ldr r1, [r1]
	ldrb r2, [r0]
	adds r4, r0, #0
	ldrb r0, [r4]
	ldrb r1, [r1, #6]
	cmp r0, r1
	beq .L08039CB8
	ldr r1, .L08039CB4 @ =0x000006DF
	adds r0, r2, r1
	movs r1, #1
	bl SioPutText
	b .L08039CC0
	.align 2, 0
.L08039CA8: .4byte gLinkArenaSt
.L08039CAC: .4byte gPlaySt
.L08039CB0: .4byte gSioSt
.L08039CB4: .4byte 0x000006DF
.L08039CB8:
	ldr r0, .L08039CD8 @ =0x000006DE
	movs r1, #1
	bl SioPutText
.L08039CC0:
	ldrb r0, [r4]
	str r0, [r7, #0x38]
	ldr r1, .L08039CDC @ =gSioBmSt
	ldrb r0, [r4]
	strb r0, [r1]
	adds r0, r6, #0
	bl Proc_Break
.L08039CD0:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08039CD8: .4byte 0x000006DE
.L08039CDC: .4byte gSioBmSt

	thumb_func_start func_fe6_08039CE0
func_fe6_08039CE0: @ 0x08039CE0
	push {lr}
	ldr r0, .L08039CF8 @ =gPlaySt
	ldrb r0, [r0, #0x1d]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L08039CF2
	movs r0, #0x7e
	bl m4aSongNumStart
.L08039CF2:
	pop {r0}
	bx r0
	.align 2, 0
.L08039CF8: .4byte gPlaySt

	thumb_func_start func_fe6_08039CFC
func_fe6_08039CFC: @ 0x08039CFC
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r4, #0
	strb r4, [r5, #9]
	movs r1, #0
	bl SetUnitStatus
	strb r4, [r5, #0x19]
	ldr r1, .L08039D24 @ =gLinkArenaSt
	adds r1, #0xec
	movs r0, #4
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne .L08039D28
	adds r0, r5, #0
	bl SioSetNormalWeapons
	b .L08039D2E
	.align 2, 0
.L08039D24: .4byte gLinkArenaSt
.L08039D28:
	adds r0, r5, #0
	bl SioSetUniqueWeapons
.L08039D2E:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start func_fe6_08039D34
func_fe6_08039D34: @ 0x08039D34
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	mov sb, r0
	ldr r0, .L08039DF0 @ =gSioSt
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #6
	adds r0, #1
	mov r8, r0
	ldr r1, .L08039DF4 @ =0x0203C91C
	movs r0, #0
	str r0, [r1]
	bl InitUnits
	ldr r0, .L08039DF8 @ =gLinkArenaSt
	ldrb r0, [r0, #3]
	ldr r4, .L08039DFC @ =gUnk_Sio_085C9EA8
	ldr r1, [r4]
	bl ReadMultiArenaSaveTeamRaw
	movs r6, #0
	ldr r0, .L08039E00 @ =0x0203C9A8
	mov sl, r0
	movs r7, #0x10
.L08039D6E:
	mov r1, r8
	adds r4, r1, r6
	adds r0, r4, #0
	bl GetUnit
	adds r5, r0, #0
	bl ClearUnit
	ldr r1, .L08039DFC @ =gUnk_Sio_085C9EA8
	ldr r0, [r1]
	adds r0, r0, r7
	adds r1, r5, #0
	bl ReadGameSavePackedUnit
	adds r0, r5, #0
	bl func_fe6_08039CFC
	strb r4, [r5, #0xb]
	cmp r6, #0
	bne .L08039DAC
	adds r0, r5, #0
	bl GetUnitChibiId
	ldr r1, .L08039DF0 @ =gSioSt
	ldr r1, [r1]
	ldrb r1, [r1, #6]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	lsls r1, r1, #1
	add r1, sl
	strh r0, [r1]
.L08039DAC:
	adds r7, #0x28
	adds r6, #1
	cmp r6, #4
	ble .L08039D6E
	ldr r2, .L08039DF0 @ =gSioSt
	mov r3, sb
	adds r3, #0x64
	mov r4, sb
	adds r4, #0x4c
	ldr r0, .L08039DF8 @ =gLinkArenaSt
	movs r1, #0
	movs r6, #3
	adds r0, #0x9f
.L08039DC6:
	strb r1, [r0]
	subs r0, #1
	subs r6, #1
	cmp r6, #0
	bge .L08039DC6
	ldr r2, [r2]
	movs r1, #6
	ldrsb r1, [r2, r1]
	movs r0, #1
	lsls r0, r1
	movs r1, #0
	strb r0, [r2, #0xa]
	strh r1, [r3]
	strh r1, [r4]
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08039DF0: .4byte gSioSt
.L08039DF4: .4byte 0x0203C91C
.L08039DF8: .4byte gLinkArenaSt
.L08039DFC: .4byte gUnk_Sio_085C9EA8
.L08039E00: .4byte 0x0203C9A8

	thumb_func_start func_fe6_08039E04
func_fe6_08039E04: @ 0x08039E04
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x2c
	mov r8, r0
	movs r0, #0
	mov sl, r0
	mov r0, r8
	adds r0, #0x4c
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne .L08039E32
	ldr r0, .L08039F6C @ =gPlaySt
	ldrb r0, [r0, #0x1d]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L08039E32
	movs r0, #0x7c
	bl m4aSongNumStart
.L08039E32:
	mov r1, r8
	adds r1, #0x4c
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x17
	ble .L08039E48
	movs r0, #0
	strh r0, [r1]
.L08039E48:
	mov r4, r8
	adds r4, #0x64
	movs r3, #0
	ldrsh r0, [r4, r3]
	cmp r0, #4
	bgt .L08039E88
	ldr r2, .L08039F70 @ =gUnk_Sio_085C9EA8
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, #0x10
	ldr r0, [r2]
	adds r0, r0, r1
	movs r1, #0x28
	bl SioEmitData
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r3, r8
	str r0, [r3, #0x58]
	ldrh r2, [r4]
	adds r2, #1
	strh r2, [r4]
	ldr r1, .L08039F74 @ =gLinkArenaSt
	ldr r0, .L08039F78 @ =gSioSt
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, #0x9c
	adds r0, r0, r1
	strb r2, [r0]
.L08039E88:
	bl GetGameTime
	movs r1, #0x26
	bl __umodsi3
	cmp r0, #0
	bne .L08039F5C
	add r6, sp, #0x28
	mov r0, sp
	adds r1, r6, #0
	movs r2, #0
	bl SioReceiveData
	lsls r0, r0, #0x10
	cmp r0, #0
	beq .L08039F18
	ldrb r0, [r6]
	lsls r4, r0, #6
	adds r4, #1
	ldr r1, .L08039F74 @ =gLinkArenaSt
	mov sb, r1
	mov r7, sb
	adds r7, #0x9c
	adds r0, r0, r7
	ldrb r0, [r0]
	adds r0, r0, r4
	bl GetUnit
	adds r5, r0, #0
	bl ClearUnit
	mov r0, sp
	adds r1, r5, #0
	bl ReadGameSavePackedUnit
	adds r0, r5, #0
	bl func_fe6_08039CFC
	ldrb r3, [r6]
	adds r0, r3, r7
	ldrb r0, [r0]
	adds r4, r0, r4
	strb r4, [r5, #0xb]
	ldrb r1, [r6]
	adds r0, r1, r7
	ldrb r0, [r0]
	cmp r0, #0
	bne .L08039EFA
	adds r0, r5, #0
	bl GetUnitChibiId
	ldr r1, .L08039F7C @ =gSioBmSt
	ldrb r3, [r6]
	lsls r2, r3, #1
	adds r1, #0x24
	adds r2, r2, r1
	strh r0, [r2]
.L08039EFA:
	mov r1, sb
	adds r1, #0xec
	movs r0, #1
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne .L08039F0E
	movs r0, #0x80
	lsls r0, r0, #2
	strh r0, [r5, #0xc]
.L08039F0E:
	ldrb r6, [r6]
	adds r1, r6, r7
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
.L08039F18:
	movs r4, #0
	ldr r5, .L08039F80 @ =0x0203C6B4
.L08039F1C:
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	bl func_fe6_08035CB0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L08039F3C
	adds r0, r4, r5
	ldrb r0, [r0]
	cmp r0, #4
	bhi .L08039F3C
	mov r0, sl
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sl, r0
.L08039F3C:
	adds r4, #1
	cmp r4, #3
	ble .L08039F1C
	mov r0, sl
	cmp r0, #0
	bne .L08039F5C
	ldr r0, .L08039F78 @ =gSioSt
	ldr r2, [r0]
	movs r1, #6
	ldrsb r1, [r2, r1]
	movs r0, #1
	lsls r0, r1
	strb r0, [r2, #0xa]
	mov r0, r8
	bl Proc_Break
.L08039F5C:
	add sp, #0x2c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08039F6C: .4byte gPlaySt
.L08039F70: .4byte gUnk_Sio_085C9EA8
.L08039F74: .4byte gLinkArenaSt
.L08039F78: .4byte gSioSt
.L08039F7C: .4byte gSioBmSt
.L08039F80: .4byte 0x0203C6B4

	thumb_func_start func_fe6_08039F84
func_fe6_08039F84: @ 0x08039F84
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r0, #0x4c
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne .L08039FA2
	ldr r0, .L0803A014 @ =gPlaySt
	ldrb r0, [r0, #0x1d]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L08039FA2
	movs r0, #0x7c
	bl m4aSongNumStart
.L08039FA2:
	adds r1, r5, #0
	adds r1, #0x4c
	ldrh r0, [r1]
	adds r0, #1
	movs r6, #0
	strh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x17
	ble .L08039FB8
	strh r6, [r1]
.L08039FB8:
	ldr r0, .L0803A018 @ =0x0203C91C
	ldr r1, [r0]
	adds r1, #1
	str r1, [r0]
	movs r0, #0x96
	lsls r0, r0, #2
	cmp r1, r0
	ble .L08039FCC
	bl StartSioErrorScreen
.L08039FCC:
	ldr r0, .L0803A01C @ =gSioMsgBuf
	movs r1, #0x19
	strb r1, [r0]
	ldr r4, .L0803A020 @ =gSioSt
	ldr r1, [r4]
	ldrb r1, [r1, #6]
	strb r1, [r0, #1]
	strh r6, [r0, #2]
	movs r1, #4
	bl SioSend
	ldr r4, [r4]
	ldr r1, [r5, #0x58]
	movs r0, #0x8c
	muls r0, r1, r0
	adds r0, r4, r0
	movs r1, #0x9a
	lsls r1, r1, #1
	adds r0, r0, r1
	ldrb r1, [r4, #9]
	ldrb r2, [r0]
	cmp r2, r1
	bne .L0803A00E
	ldrb r0, [r4, #0xa]
	ands r0, r1
	cmp r0, r2
	bne .L0803A00E
	ldr r0, .L0803A024 @ =gUnk_Sio_085C99C8
	bl Proc_EndEach
	adds r0, r5, #0
	bl Proc_Break
.L0803A00E:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L0803A014: .4byte gPlaySt
.L0803A018: .4byte 0x0203C91C
.L0803A01C: .4byte gSioMsgBuf
.L0803A020: .4byte gSioSt
.L0803A024: .4byte gUnk_Sio_085C99C8

	thumb_func_start func_fe6_0803A028
func_fe6_0803A028: @ 0x0803A028
	push {r4, r5, lr}
	adds r5, r0, #0
	bl ClearSioBG
	bl InitSioBG
	bl EndLinkArenaVersusSpriteDraw
	movs r0, #3
	bl EndFaceById
	ldr r4, .L0803A07C @ =0x0203C66C
	adds r0, r4, #0
	bl ClearText
	adds r0, r4, #0
	movs r1, #0
	bl Text_SetColor
	ldr r1, .L0803A080 @ =gUnk_Sio_0810F0C0
	adds r0, r4, #0
	bl Text_DrawString
	ldr r1, .L0803A084 @ =gBg2Tm+0x312
	adds r0, r4, #0
	bl PutText
	ldr r0, .L0803A088 @ =gUnk_Sio_085C99C8
	adds r1, r5, #0
	bl SpawnProc
	movs r0, #0
	movs r1, #0
	bl Sio_RestartBgSlide
	movs r0, #0xf
	bl EnableBgSync
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0803A07C: .4byte 0x0203C66C
.L0803A080: .4byte gUnk_Sio_0810F0C0
.L0803A084: .4byte gBg2Tm+0x312
.L0803A088: .4byte gUnk_Sio_085C99C8

	thumb_func_start func_SioBat_0803A08C
func_SioBat_0803A08C: @ 0x0803A08C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0xc
	mov sb, r0
	bl ClearSioBG
	bl InitSioBG
	ldr r4, .L0803A1A8 @ =Img_LinkArenaRankIcons
	movs r0, #1
	bl GetBgChrOffset
	adds r1, r0, #0
	ldr r0, .L0803A1AC @ =0x06000C00
	adds r1, r1, r0
	adds r0, r4, #0
	bl Decompress
	ldr r0, .L0803A1B0 @ =Pal_LinkArenaRankIcons
	movs r1, #0xc0
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, .L0803A1B4 @ =Img_TacticianSelObj
	ldr r1, .L0803A1B8 @ =0x06014800
	bl Decompress
	ldr r0, .L0803A1BC @ =Pal_TacticianSelObj
	movs r1, #0x98
	lsls r1, r1, #2
	movs r2, #0x80
	bl ApplyPaletteExt
	movs r0, #0
	bl func_fe6_0803FB08
	ldr r0, .L0803A1C0 @ =gSioFont_0203C758
	bl SetTextFont
	bl ResetTextFont
	bl func_fe6_08036C60
	add r0, sp, #8
	bl LoadLinkArenaRuleSettings
	movs r0, #1
	movs r1, #0xfe
	movs r2, #0
	bl SetBgOffset
	movs r5, #0
	movs r7, #0xc0
	lsls r7, r7, #1
	ldr r6, .L0803A1C4 @ =gLinkArenaRuleData
.L0803A0FE:
	lsls r4, r5, #3
	ldr r1, .L0803A1C8 @ =gLinkArenaSt + 0xC
	mov r8, r1
	add r4, r8
	adds r0, r4, #0
	bl ClearText
	adds r0, r4, #0
	movs r1, #0
	bl Text_SetColor
	ldr r1, [r6]
	adds r0, r4, #0
	bl Text_DrawString
	ldr r1, .L0803A1CC @ =gBg0Tm+0xC
	adds r1, r7, r1
	adds r0, r4, #0
	bl PutText
	mov r0, sp
	adds r0, r0, r5
	adds r0, #8
	ldrb r1, [r0]
	adds r0, r5, #0
	bl func_fe6_0803AED0
	adds r7, #0xc0
	adds r6, #0x14
	adds r5, #1
	cmp r5, #2
	ble .L0803A0FE
	ldr r5, .L0803A1C4 @ =gLinkArenaRuleData
	ldr r0, [r5, #0x18]
	lsls r0, r0, #1
	ldr r4, .L0803A1D0 @ =gBg1Tm+0x23C
	adds r0, r0, r4
	movs r1, #0
	bl DrawLinkArenaModeIcon
	ldr r0, [r5, #0x1c]
	lsls r0, r0, #1
	adds r0, r0, r4
	movs r1, #1
	bl DrawLinkArenaModeIcon
	ldr r0, .L0803A1D4 @ =gUnk_Sio_0810F19C
	mov r4, r8
	subs r4, #0xc
	ldrb r2, [r4]
	adds r0, r2, r0
	ldrb r1, [r0]
	mov r0, sb
	bl StartLinkArenaTitleBanner
	ldr r0, .L0803A1D8 @ =gUnk_Sio_085C9AD4
	ldrb r3, [r4]
	lsls r1, r3, #2
	adds r0, r1, r0
	ldr r0, [r0]
	ldr r2, .L0803A1DC @ =gUnk_Sio_0810F190
	adds r1, r1, r2
	ldr r1, [r1]
	str r3, [sp]
	mov r2, sb
	str r2, [sp, #4]
	movs r2, #0
	movs r3, #8
	bl func_fe6_0803FD40
	ldr r0, .L0803A1E0 @ =0x000006DA
	movs r1, #1
	bl SioPutText
	movs r0, #0xf
	bl EnableBgSync
	add sp, #0xc
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0803A1A8: .4byte Img_LinkArenaRankIcons
.L0803A1AC: .4byte 0x06000C00
.L0803A1B0: .4byte Pal_LinkArenaRankIcons
.L0803A1B4: .4byte Img_TacticianSelObj
.L0803A1B8: .4byte 0x06014800
.L0803A1BC: .4byte Pal_TacticianSelObj
.L0803A1C0: .4byte gSioFont_0203C758
.L0803A1C4: .4byte gLinkArenaRuleData
.L0803A1C8: .4byte gLinkArenaSt + 0xC
.L0803A1CC: .4byte gBg0Tm+0xC
.L0803A1D0: .4byte gBg1Tm+0x23C
.L0803A1D4: .4byte gUnk_Sio_0810F19C
.L0803A1D8: .4byte gUnk_Sio_085C9AD4
.L0803A1DC: .4byte gUnk_Sio_0810F190
.L0803A1E0: .4byte 0x000006DA

	thumb_func_start XMapTransfer_0803A1E4
XMapTransfer_0803A1E4: @ 0x0803A1E4
	push {lr}
	movs r0, #3
	bl SetXmapTransferState
	pop {r0}
	bx r0

	thumb_func_start XmapTransfer_End
XmapTransfer_End: @ 0x0803A1F0
	push {lr}
	movs r0, #0
	bl SetXmapTransferState
	pop {r0}
	bx r0

	thumb_func_start SioTerm_Init
SioTerm_Init: @ 0x0803A1FC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x4c
	adds r7, r0, #0
	movs r0, #0
	str r0, [sp, #0x3c]
	add r5, sp, #0x28
	ldr r1, .L0803A2D8 @ =gUnk_Sio_0810F2D4
	adds r0, r5, #0
	movs r2, #6
	bl memcpy
	bl ClearSioBG
	bl InitSioBG
	ldr r0, .L0803A2DC @ =Img_TacticianSelObj
	ldr r1, .L0803A2E0 @ =0x06014800
	bl Decompress
	movs r0, #0
	movs r1, #4
	bl Sio_RestartBgSlide
	ldr r0, .L0803A2E4 @ =gSioFont_0203C758
	bl SetTextFont
	bl InitSystemTextFont
	bl ResetTextFont
	movs r0, #0xc0
	movs r1, #0x10
	adds r2, r7, #0
	bl StartLinkArenaButtonSpriteDraw
	ldr r4, .L0803A2E8 @ =gSioTexts
	adds r0, r4, #0
	movs r1, #0x18
	bl InitText
	adds r4, #8
	adds r0, r4, #0
	movs r1, #0x18
	bl InitText
	ldr r0, .L0803A2EC @ =0x000006DB
	movs r1, #0
	bl SioPutText
	ldr r0, .L0803A2F0 @ =0x000006DC
	movs r1, #1
	bl SioPutText
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r7, #0x4c]
	movs r1, #2
	mov r8, r1
	mov r2, sp
	adds r2, #0x30
	str r2, [sp, #0x40]
	adds r5, r7, #0
	adds r5, #0x40
	movs r0, #8
	mov sl, r0
	add r1, sp, #0x38
	mov sb, r1
.L0803A28A:
	movs r0, #0
	mov r2, sb
	str r0, [r2]
	mov r0, r8
	bl IsSaveValid
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L0803A322
	mov r0, r8
	add r1, sp, #8
	bl ReadGameSavePlaySt
	add r0, sp, #8
	bl GetChapterTitleExtra
	adds r2, r7, #0
	adds r2, #0x2c
	mov r1, sl
	adds r4, r2, r1
	str r0, [r4]
	add r1, sp, #8
	movs r0, #0x40
	ldrb r1, [r1, #0x14]
	ands r0, r1
	str r2, [sp, #0x44]
	cmp r0, #0
	beq .L0803A2C8
	movs r0, #2
	mov r2, sb
	str r0, [r2]
.L0803A2C8:
	mov r0, r8
	bl IsGameSavePastFirstChapter
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L0803A2F4
	ldr r0, [r4]
	b .L0803A2F8
	.align 2, 0
.L0803A2D8: .4byte gUnk_Sio_0810F2D4
.L0803A2DC: .4byte Img_TacticianSelObj
.L0803A2E0: .4byte 0x06014800
.L0803A2E4: .4byte gSioFont_0203C758
.L0803A2E8: .4byte gSioTexts
.L0803A2EC: .4byte 0x000006DB
.L0803A2F0: .4byte 0x000006DC
.L0803A2F4:
	movs r0, #1
	rsbs r0, r0, #0
.L0803A2F8:
	str r0, [r5]
	adds r6, r7, #0
	adds r6, #0x38
	mov r1, sl
	adds r0, r6, r1
	ldr r0, [r0]
	movs r2, #1
	rsbs r2, r2, #0
	cmp r0, r2
	beq .L0803A338
	ldr r0, [sp, #0x3c]
	cmp r0, #0
	bne .L0803A31C
	mov r1, r8
	str r1, [r7, #0x50]
	movs r2, #1
	str r2, [sp, #0x3c]
	b .L0803A338
.L0803A31C:
	mov r0, r8
	str r0, [r7, #0x4c]
	b .L0803A338
.L0803A322:
	adds r1, r7, #0
	adds r1, #0x2c
	mov r2, sl
	adds r0, r1, r2
	movs r2, #1
	rsbs r2, r2, #0
	str r2, [r5]
	str r2, [r0]
	str r1, [sp, #0x44]
	adds r6, r7, #0
	adds r6, #0x38
.L0803A338:
	subs r5, #4
	movs r0, #4
	rsbs r0, r0, #0
	add sl, r0
	add sb, r0
	movs r1, #1
	rsbs r1, r1, #0
	add r8, r1
	mov r2, r8
	cmp r2, #0
	bge .L0803A28A
	ldr r1, [r7, #0x4c]
	adds r0, #3
	cmp r1, r0
	bne .L0803A35E
	ldr r0, [r7, #0x50]
	str r0, [r7, #0x4c]
	str r0, [r7, #0x48]
	b .L0803A360
.L0803A35E:
	str r1, [r7, #0x48]
.L0803A360:
	movs r0, #1
	movs r1, #4
	bl PutChapterTitlePalettle
	movs r0, #3
	movs r1, #5
	bl PutChapterTitlePalettle
	movs r0, #5
	movs r1, #6
	bl PutChapterTitlePalettle
	movs r0, #0
	movs r1, #7
	bl PutChapterTitlePalettle
	movs r0, #2
	movs r1, #8
	bl PutChapterTitlePalettle
	movs r0, #4
	movs r1, #9
	bl PutChapterTitlePalettle
	movs r0, #0xd0
	lsls r0, r0, #1
	bl PutChapterTitleBG1
	movs r0, #0xa0
	lsls r0, r0, #1
	mov sl, r0
	ldr r1, [sp, #0x44]
	str r1, [sp, #0x48]
	movs r2, #0x88
	lsls r2, r2, #7
	mov sb, r2
	movs r5, #0x80
	lsls r5, r5, #1
	ldr r4, [sp, #0x40]
	movs r0, #2
	mov r8, r0
.L0803A3B2:
	ldr r1, [r6]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne .L0803A3C0
	movs r0, #1
	b .L0803A3C8
.L0803A3C0:
	ldr r0, [r4]
	cmp r0, #2
	beq .L0803A3CA
	movs r0, #0
.L0803A3C8:
	str r0, [r4]
.L0803A3CA:
	ldr r0, .L0803A458 @ =gBg1Tm+0x6
	adds r0, r5, r0
	ldr r1, [r4]
	adds r1, #4
	bl PutChapterTitleBgTSA
	mov r1, sb
	lsls r0, r1, #0xf
	lsrs r0, r0, #0x14
	ldr r2, [sp, #0x48]
	ldm r2!, {r1}
	str r2, [sp, #0x48]
	bl PutChapterTitleGfx
	ldr r0, .L0803A45C @ =gBg0Tm+0x6
	add r0, sl
	ldm r4!, {r1}
	adds r1, #7
	bl PutChapterTitleTextTSA
	movs r0, #0x80
	lsls r0, r0, #1
	add sl, r0
	movs r1, #0x80
	lsls r1, r1, #4
	add sb, r1
	adds r5, r5, r0
	adds r6, #4
	movs r2, #1
	rsbs r2, r2, #0
	add r8, r2
	mov r0, r8
	cmp r0, #0
	bge .L0803A3B2
	ldr r2, .L0803A460 @ =gDispIo
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
	adds r0, r7, #0
	movs r1, #1
	bl StartLinkArenaTitleBanner
	ldr r0, .L0803A464 @ =gLinkArenaSt
	ldrb r0, [r0]
	str r0, [sp]
	str r7, [sp, #4]
	add r0, sp, #0x28
	movs r1, #6
	movs r2, #0
	movs r3, #8
	bl func_fe6_0803FD40
	movs r0, #0xf
	bl EnableBgSync
	add sp, #0x4c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0803A458: .4byte gBg1Tm+0x6
.L0803A45C: .4byte gBg0Tm+0x6
.L0803A460: .4byte gDispIo
.L0803A464: .4byte gLinkArenaSt

	thumb_func_start func_fe6_0803A468
func_fe6_0803A468: @ 0x0803A468
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r5, r3, #0
	ldr r0, [sp, #0x14]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov ip, r1
	lsls r2, r2, #0x18
	lsrs r6, r2, #0x18
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldr r1, .L0803A4F0 @ =gKeySt
	ldr r3, [r1]
	ldrh r2, [r3, #6]
	movs r0, #0x40
	ands r0, r2
	cmp r0, #0
	beq .L0803A4B6
	ldr r0, [r4]
	cmp r0, r6
	bgt .L0803A498
	ldrh r3, [r3, #8]
	cmp r2, r3
	bne .L0803A4B6
.L0803A498:
	subs r2, r7, #1
	movs r3, #1
	rsbs r3, r3, #0
.L0803A49E:
	ldr r0, [r4]
	subs r0, #1
	str r0, [r4]
	cmp r0, #0
	bge .L0803A4AA
	str r2, [r4]
.L0803A4AA:
	ldr r0, [r4]
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r0, [r0]
	cmp r0, r3
	beq .L0803A49E
.L0803A4B6:
	ldr r1, [r1]
	ldrh r2, [r1, #6]
	movs r0, #0x80
	ands r0, r2
	cmp r0, #0
	beq .L0803A4EA
	ldr r0, [r4]
	cmp r0, ip
	blt .L0803A4CE
	ldrh r1, [r1, #8]
	cmp r2, r1
	bne .L0803A4EA
.L0803A4CE:
	ldr r0, [r4]
	adds r0, #1
	str r0, [r4]
	adds r1, r7, #0
	bl __modsi3
	str r0, [r4]
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r1, [r0]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq .L0803A4CE
.L0803A4EA:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0803A4F0: .4byte gKeySt

	thumb_func_start func_fe6_0803A4F4
func_fe6_0803A4F4: @ 0x0803A4F4
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	ldr r5, [r6, #0x48]
	adds r0, #0x48
	ldr r1, [r6, #0x50]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r2, [r6, #0x4c]
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	adds r3, r6, #0
	adds r3, #0x38
	movs r4, #3
	str r4, [sp]
	bl func_fe6_0803A468
	ldr r1, [r6, #0x48]
	lsls r1, r1, #5
	adds r1, #0x28
	movs r0, #0x18
	bl PutUiHand
	ldr r0, [r6, #0x48]
	cmp r5, r0
	beq .L0803A52E
	movs r0, #3
	bl SioPlaySe
.L0803A52E:
	ldr r4, .L0803A56C @ =gKeySt
	ldr r1, [r4]
	movs r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq .L0803A548
	movs r0, #2
	bl SioPlaySe
	adds r0, r6, #0
	bl Proc_Break
.L0803A548:
	ldr r1, [r4]
	movs r0, #2
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq .L0803A562
	movs r0, #1
	bl SioPlaySe
	adds r0, r6, #0
	movs r1, #4
	bl Proc_Goto
.L0803A562:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L0803A56C: .4byte gKeySt

	thumb_func_start func_fe6_0803A570
func_fe6_0803A570: @ 0x0803A570
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x48]
	bl ReadGameSave
	ldr r1, .L0803A5A4 @ =gPlaySt
	movs r0, #0xdf
	ldrb r2, [r1, #0x14]
	ands r0, r2
	strb r0, [r1, #0x14]
	movs r0, #0xd
	rsbs r0, r0, #0
	ldrb r2, [r1, #0x1d]
	ands r0, r2
	strb r0, [r1, #0x1d]
	ldr r1, .L0803A5A8 @ =gLinkArenaSt
	ldr r0, [r4, #0x48]
	strb r0, [r1, #4]
	bl ApplyUnitSpritePalettes
	bl func_fe6_0803CE7C
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0803A5A4: .4byte gPlaySt
.L0803A5A8: .4byte gLinkArenaSt

	thumb_func_start func_fe6_0803A5AC
func_fe6_0803A5AC: @ 0x0803A5AC
	push {lr}
	adds r1, r0, #0
	ldr r0, .L0803A5C4 @ =gLinkArenaSt
	ldrb r0, [r0, #3]
	cmp r0, #0xff
	bne .L0803A5C0
	adds r0, r1, #0
	movs r1, #1
	bl Proc_Goto
.L0803A5C0:
	pop {r0}
	bx r0
	.align 2, 0
.L0803A5C4: .4byte gLinkArenaSt

	thumb_func_start func_fe6_0803A5C8
func_fe6_0803A5C8: @ 0x0803A5C8
	push {lr}
	adds r1, r0, #0
	ldr r0, .L0803A5E0 @ =gLinkArenaSt
	ldrb r0, [r0, #4]
	cmp r0, #0xff
	bne .L0803A5DC
	adds r0, r1, #0
	movs r1, #2
	bl Proc_Goto
.L0803A5DC:
	pop {r0}
	bx r0
	.align 2, 0
.L0803A5E0: .4byte gLinkArenaSt

	thumb_func_start SioTerm_WaitAtMenu
SioTerm_WaitAtMenu: @ 0x0803A5E4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, .L0803A600 @ =ProcScr_AtMenu
	bl FindProc
	cmp r0, #0
	bne .L0803A5F8
	adds r0, r4, #0
	bl Proc_Break
.L0803A5F8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0803A600: .4byte ProcScr_AtMenu

	thumb_func_start func_fe6_0803A604
func_fe6_0803A604: @ 0x0803A604
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, .L0803A63C @ =0x0203C918
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq .L0803A634
	bl ClearSioAllBGs
	bl Sio_EndBackgroundSlide
	bl func_fe6_0803FC60
	bl func_fe6_0803FDD8
	bl EndLinkArenaButtonSpriteDraw
	bl StartPrepAtMenu
	adds r0, r4, #0
	movs r1, #5
	bl Proc_Goto
.L0803A634:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0803A63C: .4byte 0x0203C918

	thumb_func_start DrawLinkArenaRankIcon
DrawLinkArenaRankIcon: @ 0x0803A640
	adds r3, r0, #0
	lsls r0, r1, #1
	adds r0, r0, r1
	ldr r2, .L0803A67C @ =0x00004060
	adds r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r1, #2
	ble .L0803A65C
	movs r1, #0x80
	lsls r1, r1, #5
	adds r0, r2, r1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
.L0803A65C:
	strh r2, [r3]
	adds r0, r2, #1
	strh r0, [r3, #2]
	adds r0, r2, #2
	strh r0, [r3, #4]
	adds r1, r3, #0
	adds r1, #0x40
	adds r0, #0x1e
	strh r0, [r1]
	adds r1, #2
	adds r0, #1
	strh r0, [r1]
	adds r1, #2
	adds r0, #1
	strh r0, [r1]
	bx lr
	.align 2, 0
.L0803A67C: .4byte 0x00004060

	thumb_func_start DrawLinkArenaModeIcon
DrawLinkArenaModeIcon: @ 0x0803A680
	push {r4, lr}
	lsls r1, r1, #0x12
	movs r2, #0xa0
	lsls r2, r2, #0x10
	adds r1, r1, r2
	lsrs r1, r1, #0x10
	movs r3, #0xc0
	lsls r3, r3, #7
	adds r2, r1, r3
	strh r2, [r0]
	ldr r4, .L0803A6B4 @ =0x00006001
	adds r2, r1, r4
	strh r2, [r0, #2]
	adds r3, r0, #0
	adds r3, #0x40
	adds r4, #1
	adds r2, r1, r4
	strh r2, [r3]
	adds r0, #0x42
	ldr r2, .L0803A6B8 @ =0x00006003
	adds r1, r1, r2
	strh r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0803A6B4: .4byte 0x00006001
.L0803A6B8: .4byte 0x00006003

	thumb_func_start DrawLinkArenaRankingRow
DrawLinkArenaRankingRow: @ 0x0803A6BC
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	adds r5, r0, #0
	mov sb, r1
	adds r6, r2, #0
	adds r4, r3, #0
	ldr r0, [sp, #0x18]
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	adds r0, r5, #0
	movs r1, #8
	movs r2, #0
	mov r3, sb
	bl Text_InsertDrawString
	adds r0, r5, #0
	movs r1, #0x60
	movs r2, #2
	adds r3, r4, #0
	bl Text_InsertDrawNumberOrBlank
	ldr r3, .L0803A73C @ =gUnk_Sio_0810EDA4
	adds r0, r5, #0
	movs r1, #0x68
	movs r2, #0
	bl Text_InsertDrawString
	adds r0, r5, #0
	movs r1, #0x86
	movs r2, #2
	adds r3, r6, #0
	bl Text_InsertDrawNumberOrBlank
	ldr r3, .L0803A740 @ =gUnk_Sio_0810F2DC
	adds r0, r5, #0
	movs r1, #0x8e
	movs r2, #0
	bl Text_InsertDrawString
	adds r0, r5, #0
	movs r1, #0x9c
	movs r2, #2
	mov r3, r8
	bl Text_InsertDrawNumberOrBlank
	ldr r3, .L0803A744 @ =gUnk_Sio_0810F2E0
	adds r0, r5, #0
	movs r1, #0xa4
	movs r2, #0
	bl Text_InsertDrawString
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L0803A73C: .4byte gUnk_Sio_0810EDA4
.L0803A740: .4byte gUnk_Sio_0810F2DC
.L0803A744: .4byte gUnk_Sio_0810F2E0

	thumb_func_start DrawLinkArenaRankings
DrawLinkArenaRankings: @ 0x0803A748
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	movs r6, #0
	ldr r0, .L0803A7DC @ =gSioResultRankings
	ldr r1, .L0803A7E0 @ =gBg1Tm+0x4
	mov sl, r1
	subs r7, r0, #4
	movs r1, #0x24
	add r1, sl
	mov sb, r1
	mov r8, r0
.L0803A766:
	lsls r5, r6, #3
	ldr r0, .L0803A7E4 @ =gSioText_0203C708
	adds r5, r5, r0
	adds r0, r5, #0
	bl ClearText
	ldrb r0, [r7]
	lsls r2, r0, #0x1e
	lsrs r2, r2, #6
	movs r1, #0x80
	lsls r1, r1, #0x11
	adds r2, r2, r1
	lsrs r2, r2, #0x18
	ldr r3, [r7]
	lsls r3, r3, #0xb
	lsrs r3, r3, #0x10
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1e
	adds r0, #1
	str r0, [sp]
	adds r0, r5, #0
	mov r1, r8
	bl DrawLinkArenaRankingRow
	lsls r4, r6, #7
	mov r1, sl
	adds r0, r4, r1
	adds r1, r6, #0
	bl DrawLinkArenaRankIcon
	mov r0, sl
	adds r0, #6
	adds r4, r4, r0
	adds r0, r5, #0
	adds r1, r4, #0
	bl PutText
	ldrb r0, [r7]
	lsls r1, r0, #0x1b
	lsrs r1, r1, #0x1f
	mov r0, sb
	bl DrawLinkArenaModeIcon
	adds r7, #0x14
	movs r1, #0x80
	add sb, r1
	movs r0, #0x14
	add r8, r0
	adds r6, #1
	cmp r6, #9
	ble .L0803A766
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0803A7DC: .4byte gSioResultRankings
.L0803A7E0: .4byte gBg1Tm+0x4
.L0803A7E4: .4byte gSioText_0203C708

	thumb_func_start SioResult_Init
SioResult_Init: @ 0x0803A7E8
	push {r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r7, r0, #0
	ldr r1, .L0803A9A4 @ =gUnk_Sio_0810F2E3
	add r0, sp, #8
	movs r2, #8
	bl memcpy
	bl ClearSioBG
	bl InitSioBG
	ldr r4, .L0803A9A8 @ =Img_LinkArenaRankIcons
	movs r0, #1
	bl GetBgChrOffset
	adds r1, r0, #0
	ldr r0, .L0803A9AC @ =0x06000C00
	adds r1, r1, r0
	adds r0, r4, #0
	bl Decompress
	ldr r0, .L0803A9B0 @ =gUnk_08109AC0
	movs r1, #0x80
	movs r2, #0x40
	bl ApplyPaletteExt
	ldr r0, .L0803A9B4 @ =Pal_LinkArenaRankIcons
	movs r1, #0xc0
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, .L0803A9B8 @ =Img_TacticianSelObj
	ldr r1, .L0803A9BC @ =0x06014800
	bl Decompress
	ldr r0, .L0803A9C0 @ =Pal_TacticianSelObj
	movs r1, #0x98
	lsls r1, r1, #2
	movs r2, #0x80
	bl ApplyPaletteExt
	movs r0, #0
	movs r1, #2
	bl Sio_RestartBgSlide
	ldr r0, .L0803A9C4 @ =gBg2Tm+0x102
	ldr r1, .L0803A9C8 @ =gUnk_0810A318
	movs r2, #0x80
	lsls r2, r2, #5
	bl TmApplyTsa_thm
	ldr r0, .L0803A9CC @ =gSioFont_0203C758
	bl SetTextFont
	bl InitSystemTextFont
	bl ResetTextFont
	movs r1, #0
	movs r0, #0xc8
	strh r0, [r7, #0x36]
	adds r0, r7, #0
	adds r0, #0x39
	strb r1, [r0]
	subs r0, #1
	strb r1, [r0]
	subs r0, #4
	strb r1, [r0]
	ldrh r2, [r7, #0x36]
	movs r0, #1
	movs r1, #0
	bl SetBgOffset
	ldr r5, .L0803A9D0 @ =gSioText_0203C708
	movs r4, #9
.L0803A880:
	adds r0, r5, #0
	movs r1, #0x18
	bl InitText
	adds r5, #8
	subs r4, #1
	cmp r4, #0
	bge .L0803A880
	ldr r4, .L0803A9D4 @ =gSioTexts
	adds r0, r4, #0
	movs r1, #0x18
	bl InitText
	adds r0, r4, #0
	adds r0, #8
	movs r1, #0x18
	bl InitText
	adds r0, r4, #0
	bl ClearText
	ldr r3, .L0803A9D8 @ =gUnk_Sio_0810F2EC
	adds r0, r4, #0
	movs r1, #0x10
	movs r2, #0
	bl Text_InsertDrawString
	ldr r3, .L0803A9DC @ =gUnk_Sio_0810F2F8
	adds r0, r4, #0
	movs r1, #0x5e
	movs r2, #0
	bl Text_InsertDrawString
	ldr r3, .L0803A9E0 @ =gUnk_Sio_0810F300
	adds r0, r4, #0
	movs r1, #0x84
	movs r2, #0
	bl Text_InsertDrawString
	ldr r3, .L0803A9E4 @ =gUnk_Sio_0810F308
	adds r0, r4, #0
	movs r1, #0x9c
	movs r2, #0
	bl Text_InsertDrawString
	ldr r1, .L0803A9E8 @ =gBg0Tm+0x14A
	adds r0, r4, #0
	bl PutText
	ldr r0, .L0803A9EC @ =0x000006D3
	movs r1, #1
	bl SioPutText
	ldr r0, .L0803A9F0 @ =0x0203C838
	bl ReadMultiArenaSaveRankings
	bl DrawLinkArenaRankings
	ldr r1, .L0803A9F4 @ =gDispIo
	mov ip, r1
	movs r0, #0x20
	ldrb r2, [r1, #1]
	orrs r0, r2
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	mov r1, ip
	strb r0, [r1, #1]
	adds r1, #0x2d
	movs r0, #0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x38
	strb r0, [r1]
	subs r1, #5
	movs r0, #0xf0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x88
	strb r0, [r1]
	mov r5, ip
	adds r5, #0x34
	movs r1, #1
	ldrb r0, [r5]
	orrs r0, r1
	movs r2, #2
	orrs r0, r2
	movs r6, #4
	orrs r0, r6
	movs r4, #8
	orrs r0, r4
	movs r3, #0x10
	orrs r0, r3
	strb r0, [r5]
	mov r2, ip
	adds r2, #0x36
	ldrb r0, [r2]
	orrs r1, r0
	movs r0, #3
	rsbs r0, r0, #0
	ands r1, r0
	orrs r1, r6
	orrs r1, r4
	orrs r1, r3
	strb r1, [r2]
	ldrh r0, [r7, #0x36]
	adds r0, #0x38
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	str r7, [sp, #4]
	movs r0, #0xd8
	movs r1, #0x38
	movs r2, #0xa
	movs r3, #5
	bl func_fe6_08040A80
	adds r0, r7, #0
	movs r1, #5
	bl StartLinkArenaTitleBanner
	ldr r0, .L0803A9F8 @ =gLinkArenaSt
	ldrb r0, [r0]
	str r0, [sp]
	str r7, [sp, #4]
	add r0, sp, #8
	movs r1, #8
	movs r2, #0
	movs r3, #8
	bl func_fe6_0803FD40
	movs r0, #0xc0
	movs r1, #0x10
	adds r2, r7, #0
	bl StartLinkArenaButtonSpriteDraw
	movs r0, #0xf
	bl EnableBgSync
	add sp, #0x10
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0803A9A4: .4byte gUnk_Sio_0810F2E3
.L0803A9A8: .4byte Img_LinkArenaRankIcons
.L0803A9AC: .4byte 0x06000C00
.L0803A9B0: .4byte gUnk_08109AC0
.L0803A9B4: .4byte Pal_LinkArenaRankIcons
.L0803A9B8: .4byte Img_TacticianSelObj
.L0803A9BC: .4byte 0x06014800
.L0803A9C0: .4byte Pal_TacticianSelObj
.L0803A9C4: .4byte gBg2Tm+0x102
.L0803A9C8: .4byte gUnk_0810A318
.L0803A9CC: .4byte gSioFont_0203C758
.L0803A9D0: .4byte gSioText_0203C708
.L0803A9D4: .4byte gSioTexts
.L0803A9D8: .4byte gUnk_Sio_0810F2EC
.L0803A9DC: .4byte gUnk_Sio_0810F2F8
.L0803A9E0: .4byte gUnk_Sio_0810F300
.L0803A9E4: .4byte gUnk_Sio_0810F308
.L0803A9E8: .4byte gBg0Tm+0x14A
.L0803A9EC: .4byte 0x000006D3
.L0803A9F0: .4byte 0x0203C838
.L0803A9F4: .4byte gDispIo
.L0803A9F8: .4byte gLinkArenaSt

	thumb_func_start func_fe6_0803A9FC
func_fe6_0803A9FC: @ 0x0803A9FC
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r6, r4, #0
	adds r6, #0x38
	movs r0, #0
	ldrsb r0, [r6, r0]
	cmp r0, #0
	ble .L0803AA18
	ldrh r0, [r4, #0x36]
	subs r0, #4
	strh r0, [r4, #0x36]
	ldrb r0, [r6]
	subs r0, #1
	b .L0803AA26
.L0803AA18:
	cmp r0, #0
	bge .L0803AA42
	ldrh r0, [r4, #0x36]
	adds r0, #4
	strh r0, [r4, #0x36]
	ldrb r0, [r6]
	adds r0, #1
.L0803AA26:
	strb r0, [r6]
	ldrh r2, [r4, #0x36]
	movs r0, #1
	movs r1, #0
	bl SetBgOffset
	ldrh r1, [r4, #0x36]
	adds r1, #0x38
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r0, #0xa
	bl UpdateLinkArenaMenuScrollBar
	b .L0803AAEE
.L0803AA42:
	ldr r0, .L0803AAF4 @ =gKeySt
	ldr r1, [r0]
	movs r0, #0x40
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq .L0803AA88
	adds r5, r4, #0
	adds r5, #0x34
	ldrb r0, [r5]
	cmp r0, #0
	beq .L0803AA88
	movs r0, #3
	bl SioPlaySe
	ldrh r0, [r4, #0x36]
	subs r0, #4
	strh r0, [r4, #0x36]
	ldrb r0, [r5]
	subs r0, #1
	strb r0, [r5]
	movs r0, #3
	strb r0, [r6]
	ldrh r2, [r4, #0x36]
	movs r0, #1
	movs r1, #0
	bl SetBgOffset
	ldrh r1, [r4, #0x36]
	adds r1, #0x38
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r0, #0xa
	bl UpdateLinkArenaMenuScrollBar
.L0803AA88:
	ldr r0, .L0803AAF4 @ =gKeySt
	ldr r1, [r0]
	movs r0, #0x80
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq .L0803AAD4
	adds r5, r4, #0
	adds r5, #0x34
	ldrb r0, [r5]
	adds r0, #5
	cmp r0, #9
	bgt .L0803AAD4
	movs r0, #3
	bl SioPlaySe
	ldrh r0, [r4, #0x36]
	adds r0, #4
	strh r0, [r4, #0x36]
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	adds r1, r4, #0
	adds r1, #0x38
	movs r0, #0xfd
	strb r0, [r1]
	ldrh r2, [r4, #0x36]
	movs r0, #1
	movs r1, #0
	bl SetBgOffset
	ldrh r1, [r4, #0x36]
	adds r1, #0x38
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r0, #0xa
	bl UpdateLinkArenaMenuScrollBar
.L0803AAD4:
	ldr r0, .L0803AAF4 @ =gKeySt
	ldr r1, [r0]
	movs r0, #2
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq .L0803AAEE
	movs r0, #1
	bl SioPlaySe
	adds r0, r4, #0
	bl Proc_Break
.L0803AAEE:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L0803AAF4: .4byte gKeySt

	thumb_func_start func_fe6_0803AAF8
func_fe6_0803AAF8: @ 0x0803AAF8
	cmp r0, #6
	ble .L0803AB00
	movs r0, #5
	b .L0803AB0C
.L0803AB00:
	subs r0, #2
	cmp r0, #0
	bge .L0803AB08
	movs r0, #0
.L0803AB08:
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
.L0803AB0C:
	bx lr
	.align 2, 0

	thumb_func_start SioResult_NewHS_Init
SioResult_NewHS_Init: @ 0x0803AB10
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	adds r7, r0, #0
	ldr r1, .L0803AD18 @ =gUnk_Sio_0810F30D
	add r0, sp, #8
	movs r2, #7
	bl memcpy
	bl ClearSioBG
	bl InitSioBG
	ldr r4, .L0803AD1C @ =Img_LinkArenaRankIcons
	movs r0, #1
	bl GetBgChrOffset
	adds r1, r0, #0
	ldr r0, .L0803AD20 @ =0x06000C00
	adds r1, r1, r0
	adds r0, r4, #0
	bl Decompress
	ldr r0, .L0803AD24 @ =gUnk_08109AC0
	movs r1, #0x80
	movs r2, #0x40
	bl ApplyPaletteExt
	ldr r0, .L0803AD28 @ =Pal_LinkArenaRankIcons
	movs r1, #0xc0
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, .L0803AD2C @ =Img_TacticianSelObj
	ldr r1, .L0803AD30 @ =0x06014800
	bl Decompress
	ldr r0, .L0803AD34 @ =gUnk_08109648
	ldr r1, .L0803AD38 @ =0x06016000
	bl Decompress
	ldr r0, .L0803AD3C @ =Pal_LinkArenaActiveBannerFx
	movs r1, #0x98
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	movs r0, #0
	movs r1, #0
	bl Sio_RestartBgSlide
	ldr r0, .L0803AD40 @ =gBg2Tm+0x102
	ldr r1, .L0803AD44 @ =gUnk_0810A318
	movs r2, #0x80
	lsls r2, r2, #5
	bl TmApplyTsa_thm
	ldr r0, .L0803AD48 @ =gSioFont_0203C758
	bl SetTextFont
	bl InitSystemTextFont
	bl ResetTextFont
	adds r1, r7, #0
	adds r1, #0x34
	movs r4, #0
	movs r0, #5
	strb r0, [r1]
	movs r1, #0
	movs r0, #0x8c
	lsls r0, r0, #1
	strh r0, [r7, #0x36]
	adds r0, r7, #0
	adds r0, #0x39
	strb r1, [r0]
	subs r0, #1
	strb r1, [r0]
	ldr r0, [r7, #0x3c]
	bl func_fe6_0803AAF8
	adds r1, r7, #0
	adds r1, #0x35
	strb r0, [r1]
	str r4, [r7, #0x40]
	ldrh r2, [r7, #0x36]
	movs r0, #1
	movs r1, #0
	bl SetBgOffset
	ldr r5, .L0803AD4C @ =gSioText_0203C708
	movs r4, #9
.L0803ABCE:
	adds r0, r5, #0
	movs r1, #0x18
	bl InitText
	adds r5, #8
	subs r4, #1
	cmp r4, #0
	bge .L0803ABCE
	ldr r4, .L0803AD50 @ =gSioTexts
	adds r0, r4, #0
	movs r1, #0x18
	bl InitText
	adds r0, r4, #0
	adds r0, #8
	movs r1, #0x18
	bl InitText
	adds r0, r4, #0
	bl ClearText
	ldr r3, .L0803AD54 @ =gUnk_Sio_0810F2EC
	adds r0, r4, #0
	movs r1, #0x10
	movs r2, #0
	bl Text_InsertDrawString
	ldr r3, .L0803AD58 @ =gUnk_Sio_0810F2F8
	adds r0, r4, #0
	movs r1, #0x5e
	movs r2, #0
	bl Text_InsertDrawString
	ldr r3, .L0803AD5C @ =gUnk_Sio_0810F300
	adds r0, r4, #0
	movs r1, #0x84
	movs r2, #0
	bl Text_InsertDrawString
	ldr r3, .L0803AD60 @ =gUnk_Sio_0810F308
	adds r0, r4, #0
	movs r1, #0x9c
	movs r2, #0
	bl Text_InsertDrawString
	ldr r1, .L0803AD64 @ =gBg0Tm+0x14A
	adds r0, r4, #0
	bl PutText
	ldr r0, .L0803AD68 @ =0x0203C838
	bl ReadMultiArenaSaveRankings
	bl DrawLinkArenaRankings
	ldr r1, .L0803AD6C @ =gDispIo
	mov ip, r1
	movs r0, #0x20
	ldrb r2, [r1, #1]
	orrs r0, r2
	movs r1, #0x40
	orrs r0, r1
	movs r1, #0x7f
	ands r0, r1
	mov r1, ip
	strb r0, [r1, #1]
	mov r0, ip
	adds r0, #0x2d
	movs r2, #0
	mov r8, r2
	mov r1, r8
	strb r1, [r0]
	adds r0, #4
	movs r2, #0x38
	mov sl, r2
	mov r1, sl
	strb r1, [r0]
	subs r0, #5
	movs r6, #0xf0
	strb r6, [r0]
	mov r1, ip
	adds r1, #0x30
	movs r0, #0x88
	strb r0, [r1]
	mov r3, ip
	adds r3, #0x34
	movs r2, #1
	ldrb r0, [r3]
	orrs r0, r2
	movs r1, #2
	orrs r0, r1
	movs r5, #4
	orrs r0, r5
	movs r4, #8
	orrs r0, r4
	movs r1, #0x10
	mov sb, r1
	mov r1, sb
	orrs r0, r1
	strb r0, [r3]
	mov r0, ip
	adds r0, #0x2f
	mov r1, r8
	strb r1, [r0]
	mov r1, ip
	adds r1, #0x33
	movs r0, #0x18
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x2e
	strb r6, [r0]
	adds r0, #4
	mov r1, sl
	strb r1, [r0]
	mov r6, ip
	adds r6, #0x35
	ldrb r0, [r6]
	orrs r0, r2
	movs r3, #3
	rsbs r3, r3, #0
	ands r0, r3
	orrs r0, r5
	orrs r0, r4
	movs r1, #0x11
	rsbs r1, r1, #0
	ands r0, r1
	strb r0, [r6]
	mov r0, ip
	adds r0, #0x36
	ldrb r1, [r0]
	orrs r2, r1
	ands r2, r3
	orrs r2, r5
	orrs r2, r4
	mov r1, sb
	orrs r2, r1
	strb r2, [r0]
	ldr r0, .L0803AD70 @ =gLinkArenaSt
	ldrb r0, [r0]
	str r0, [sp]
	str r7, [sp, #4]
	add r0, sp, #8
	movs r1, #7
	movs r2, #0
	movs r3, #8
	bl func_fe6_0803FD40
	ldr r1, [r7, #0x3c]
	lsls r1, r1, #4
	subs r1, #0x18
	movs r0, #0xe
	adds r2, r7, #0
	bl func_fe6_0804108C
	str r0, [r7, #0x2c]
	movs r0, #0xf
	bl EnableBgSync
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0803AD18: .4byte gUnk_Sio_0810F30D
.L0803AD1C: .4byte Img_LinkArenaRankIcons
.L0803AD20: .4byte 0x06000C00
.L0803AD24: .4byte gUnk_08109AC0
.L0803AD28: .4byte Pal_LinkArenaRankIcons
.L0803AD2C: .4byte Img_TacticianSelObj
.L0803AD30: .4byte 0x06014800
.L0803AD34: .4byte gUnk_08109648
.L0803AD38: .4byte 0x06016000
.L0803AD3C: .4byte Pal_LinkArenaActiveBannerFx
.L0803AD40: .4byte gBg2Tm+0x102
.L0803AD44: .4byte gUnk_0810A318
.L0803AD48: .4byte gSioFont_0203C758
.L0803AD4C: .4byte gSioText_0203C708
.L0803AD50: .4byte gSioTexts
.L0803AD54: .4byte gUnk_Sio_0810F2EC
.L0803AD58: .4byte gUnk_Sio_0810F2F8
.L0803AD5C: .4byte gUnk_Sio_0810F300
.L0803AD60: .4byte gUnk_Sio_0810F308
.L0803AD64: .4byte gBg0Tm+0x14A
.L0803AD68: .4byte 0x0203C838
.L0803AD6C: .4byte gDispIo
.L0803AD70: .4byte gLinkArenaSt

	thumb_func_start SioResult_NewHS_LoopScroll
SioResult_NewHS_LoopScroll: @ 0x0803AD74
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	ldr r0, [r4, #0x2c]
	mov r8, r0
	ldr r0, [r4, #0x40]
	adds r0, #1
	str r0, [r4, #0x40]
	cmp r0, #0x3b
	ble .L0803AE26
	adds r7, r4, #0
	adds r7, #0x35
	ldrb r1, [r7]
	cmp r1, #5
	bne .L0803AD9A
	adds r0, r4, #0
	bl Proc_Break
.L0803AD9A:
	adds r5, r4, #0
	adds r5, #0x38
	movs r0, #0
	ldrsb r0, [r5, r0]
	cmp r0, #0
	ble .L0803ADD4
	ldrh r0, [r4, #0x36]
	subs r0, #2
	strh r0, [r4, #0x36]
	ldrb r0, [r5]
	subs r0, #1
	strb r0, [r5]
	ldrh r2, [r4, #0x36]
	movs r0, #1
	movs r1, #0
	bl SetBgOffset
	ldrh r1, [r4, #0x36]
	adds r1, #0x38
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r0, #0xa
	bl UpdateLinkArenaMenuScrollBar
	mov r1, r8
	ldr r0, [r1, #0x30]
	adds r0, #2
	str r0, [r1, #0x30]
	b .L0803AE26
.L0803ADD4:
	adds r6, r4, #0
	adds r6, #0x34
	ldrb r0, [r7]
	ldrb r1, [r6]
	cmp r0, r1
	beq .L0803AE10
	ldrh r0, [r4, #0x36]
	subs r0, #2
	strh r0, [r4, #0x36]
	ldrb r0, [r6]
	subs r0, #1
	strb r0, [r6]
	movs r0, #7
	strb r0, [r5]
	ldrh r2, [r4, #0x36]
	movs r0, #1
	movs r1, #0
	bl SetBgOffset
	ldrh r1, [r4, #0x36]
	adds r1, #0x38
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r0, #0xa
	bl UpdateLinkArenaMenuScrollBar
	mov r1, r8
	ldr r0, [r1, #0x30]
	adds r0, #2
	str r0, [r1, #0x30]
.L0803AE10:
	movs r0, #0
	ldrsb r0, [r5, r0]
	cmp r0, #0
	bne .L0803AE26
	ldrb r6, [r6]
	ldrb r7, [r7]
	cmp r6, r7
	bne .L0803AE26
	adds r0, r4, #0
	bl Proc_Break
.L0803AE26:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start SioResult_NewHS_AwaitAPress
SioResult_NewHS_AwaitAPress: @ 0x0803AE30
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, .L0803AE54 @ =gKeySt
	ldr r1, [r0]
	movs r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq .L0803AE4E
	movs r0, #0
	bl FadeBgmOut
	adds r0, r4, #0
	bl Proc_Break
.L0803AE4E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0803AE54: .4byte gKeySt

	thumb_func_start StartSioResultNewHighScore
StartSioResultNewHighScore: @ 0x0803AE58
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, .L0803AE6C @ =ProcScr_SIORESULT_NewHighScore
	bl SpawnProcLocking
	str r4, [r0, #0x3c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0803AE6C: .4byte ProcScr_SIORESULT_NewHighScore

	thumb_func_start LoadLinkArenaRuleSettings
LoadLinkArenaRuleSettings: @ 0x0803AE70
	ldr r1, .L0803AE8C @ =gLinkArenaSt
	adds r1, #0xec
	ldrb r2, [r1]
	lsls r1, r2, #0x1f
	lsrs r1, r1, #0x1f
	strb r1, [r0]
	lsls r1, r2, #0x1e
	lsrs r1, r1, #0x1f
	strb r1, [r0, #1]
	lsls r2, r2, #0x1d
	lsrs r2, r2, #0x1f
	strb r2, [r0, #2]
	bx lr
	.align 2, 0
.L0803AE8C: .4byte gLinkArenaSt

	thumb_func_start SaveLinkArenaRuleSettings
SaveLinkArenaRuleSettings: @ 0x0803AE90
	push {r4, r5, lr}
	ldr r5, .L0803AECC @ =gLinkArenaSt
	adds r5, #0xec
	movs r4, #1
	ldrb r2, [r0]
	ands r2, r4
	movs r1, #2
	rsbs r1, r1, #0
	ldrb r3, [r5]
	ands r1, r3
	orrs r1, r2
	ldrb r2, [r0, #1]
	ands r2, r4
	lsls r2, r2, #1
	movs r3, #3
	rsbs r3, r3, #0
	ands r1, r3
	orrs r1, r2
	ldrb r0, [r0, #2]
	ands r4, r0
	lsls r4, r4, #2
	movs r0, #5
	rsbs r0, r0, #0
	ands r1, r0
	orrs r1, r4
	strb r1, [r5]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0803AECC: .4byte gLinkArenaSt

	thumb_func_start func_fe6_0803AED0
func_fe6_0803AED0: @ 0x0803AED0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	str r1, [sp, #8]
	ldr r1, .L0803AF6C @ =gUnk_Sio_0810F314
	ldr r2, [r1, #4]
	ldr r1, [r1]
	str r1, [sp]
	str r2, [sp, #4]
	movs r7, #0
	lsls r1, r0, #1
	ldr r2, .L0803AF70 @ =gLinkArenaRuleData
	mov r8, r2
	adds r1, r1, r0
	adds r1, #6
	lsls r1, r1, #5
	mov sl, r1
	adds r2, #4
	lsls r6, r0, #4
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r2, r2, r1
	mov sb, r2
	adds r5, r1, #0
.L0803AF08:
	ldr r4, .L0803AF74 @ =gSioText_0203C67C
	adds r4, r6, r4
	adds r0, r4, #0
	bl ClearText
	ldr r1, [sp, #8]
	adds r0, r1, r7
	movs r1, #1
	ands r0, r1
	lsls r0, r0, #2
	add r0, sp
	ldr r1, [r0]
	adds r0, r4, #0
	bl Text_SetColor
	mov r0, r8
	adds r0, #0xc
	adds r0, r5, r0
	ldr r1, [r0]
	adds r0, r4, #0
	bl Text_DrawString
	mov r2, sb
	adds r2, #4
	mov sb, r2
	subs r2, #4
	ldm r2!, {r1}
	add r1, sl
	lsls r1, r1, #1
	ldr r0, .L0803AF78 @ =gBg0Tm
	adds r1, r1, r0
	adds r0, r4, #0
	bl PutText
	adds r6, #8
	adds r5, #4
	adds r7, #1
	cmp r7, #1
	ble .L0803AF08
	movs r0, #1
	bl EnableBgSync
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0803AF6C: .4byte gUnk_Sio_0810F314
.L0803AF70: .4byte gLinkArenaRuleData
.L0803AF74: .4byte gSioText_0203C67C
.L0803AF78: .4byte gBg0Tm

	thumb_func_start SioRuleSettings_Init
SioRuleSettings_Init: @ 0x0803AF7C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	mov r8, r0
	add r6, sp, #0xc
	ldr r1, .L0803B0E8 @ =gUnk_Sio_0810F31C
	adds r0, r6, #0
	movs r2, #9
	bl memcpy
	bl ClearSioBG
	bl InitSioBG
	ldr r4, .L0803B0EC @ =Img_LinkArenaRankIcons
	movs r0, #1
	bl GetBgChrOffset
	adds r1, r0, #0
	ldr r0, .L0803B0F0 @ =0x06000C00
	adds r1, r1, r0
	adds r0, r4, #0
	bl Decompress
	ldr r0, .L0803B0F4 @ =Pal_LinkArenaRankIcons
	movs r1, #0xc0
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, .L0803B0F8 @ =Img_TacticianSelObj
	ldr r1, .L0803B0FC @ =0x06014800
	bl Decompress
	ldr r0, .L0803B100 @ =Pal_TacticianSelObj
	movs r1, #0x98
	lsls r1, r1, #2
	movs r2, #0x80
	bl ApplyPaletteExt
	movs r0, #0
	bl func_fe6_0803FB08
	ldr r0, .L0803B104 @ =gSioFont_0203C758
	bl SetTextFont
	bl ResetTextFont
	bl func_fe6_08036C60
	movs r0, #0
	mov r1, r8
	str r0, [r1, #0x30]
	mov r0, r8
	bl func_fe6_08040744
	mov r2, r8
	str r0, [r2, #0x2c]
	movs r0, #1
	movs r1, #0xfe
	movs r2, #0
	bl SetBgOffset
	add r0, sp, #8
	bl LoadLinkArenaRuleSettings
	mov r3, r8
	ldr r0, [r3, #0x2c]
	ldr r4, [r3, #0x30]
	movs r2, #0x30
	ldrsh r1, [r3, r2]
	ldr r5, .L0803B108 @ =gLinkArenaRuleData
	mov r3, sp
	adds r3, r3, r4
	adds r3, #8
	lsls r2, r4, #2
	adds r2, r2, r4
	ldrb r3, [r3]
	adds r2, r3, r2
	lsls r2, r2, #2
	adds r3, r5, #4
	adds r2, r2, r3
	ldr r2, [r2]
	lsls r2, r2, #0x13
	asrs r2, r2, #0x10
	lsls r3, r4, #1
	adds r3, r3, r4
	lsls r3, r3, #0x13
	movs r4, #0xc0
	lsls r4, r4, #0xe
	adds r3, r3, r4
	asrs r3, r3, #0x10
	bl func_fe6_08040768
	movs r7, #0
	mov sl, r6
	movs r6, #0xc0
	lsls r6, r6, #1
.L0803B044:
	lsls r4, r7, #3
	ldr r0, .L0803B10C @ =gLinkArenaSt + 0xC
	mov sb, r0
	add r4, sb
	adds r0, r4, #0
	bl ClearText
	adds r0, r4, #0
	movs r1, #0
	bl Text_SetColor
	ldr r1, [r5]
	adds r0, r4, #0
	bl Text_DrawString
	ldr r1, .L0803B110 @ =gBg0Tm+0xC
	adds r1, r6, r1
	adds r0, r4, #0
	bl PutText
	mov r0, sp
	adds r0, r0, r7
	adds r0, #8
	ldrb r1, [r0]
	adds r0, r7, #0
	bl func_fe6_0803AED0
	adds r6, #0xc0
	adds r5, #0x14
	adds r7, #1
	cmp r7, #2
	ble .L0803B044
	ldr r5, .L0803B108 @ =gLinkArenaRuleData
	ldr r0, [r5, #0x18]
	lsls r0, r0, #1
	ldr r4, .L0803B114 @ =gBg1Tm+0x23C
	adds r0, r0, r4
	movs r1, #0
	bl DrawLinkArenaModeIcon
	ldr r0, [r5, #0x1c]
	lsls r0, r0, #1
	adds r0, r0, r4
	movs r1, #1
	bl DrawLinkArenaModeIcon
	mov r1, r8
	ldr r0, [r1, #0x2c]
	movs r1, #6
	bl StartLinkArenaTitleBanner
	mov r0, sb
	subs r0, #0xc
	ldrb r0, [r0]
	str r0, [sp]
	mov r2, r8
	ldr r0, [r2, #0x2c]
	str r0, [sp, #4]
	mov r0, sl
	movs r1, #9
	movs r2, #0
	movs r3, #8
	bl func_fe6_0803FD40
	mov r3, r8
	ldr r0, [r3, #0x30]
	ldr r4, .L0803B118 @ =0x000006D4
	adds r0, r0, r4
	movs r1, #1
	bl SioPutText
	movs r0, #0xf
	bl EnableBgSync
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0803B0E8: .4byte gUnk_Sio_0810F31C
.L0803B0EC: .4byte Img_LinkArenaRankIcons
.L0803B0F0: .4byte 0x06000C00
.L0803B0F4: .4byte Pal_LinkArenaRankIcons
.L0803B0F8: .4byte Img_TacticianSelObj
.L0803B0FC: .4byte 0x06014800
.L0803B100: .4byte Pal_TacticianSelObj
.L0803B104: .4byte gSioFont_0203C758
.L0803B108: .4byte gLinkArenaRuleData
.L0803B10C: .4byte gLinkArenaSt + 0xC
.L0803B110: .4byte gBg0Tm+0xC
.L0803B114: .4byte gBg1Tm+0x23C
.L0803B118: .4byte 0x000006D4

	thumb_func_start SioRuleSettings_Loop
SioRuleSettings_Loop: @ 0x0803B11C
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r6, r0, #0
	movs r4, #0
	movs r7, #0
	ldr r5, .L0803B238 @ =gKeySt
	ldr r1, [r5]
	movs r0, #2
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq .L0803B146
	movs r0, #1
	bl SioPlaySe
	ldr r0, .L0803B23C @ =gSioSaveConfig
	bl WriteMultiArenaSaveConfig
	adds r0, r6, #0
	bl Proc_Break
.L0803B146:
	mov r0, sp
	bl LoadLinkArenaRuleSettings
	ldr r1, [r5]
	movs r0, #0x40
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq .L0803B164
	ldr r0, [r6, #0x30]
	cmp r0, #0
	beq .L0803B164
	subs r0, #1
	str r0, [r6, #0x30]
	movs r4, #1
.L0803B164:
	ldr r2, .L0803B238 @ =gKeySt
	ldr r1, [r2]
	movs r0, #0x80
	ldrh r1, [r1, #6]
	ands r0, r1
	adds r5, r2, #0
	cmp r0, #0
	beq .L0803B184
	ldr r0, [r6, #0x30]
	cmp r0, #1
	bgt .L0803B184
	adds r0, #1
	str r0, [r6, #0x30]
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
.L0803B184:
	ldr r1, [r5]
	movs r0, #0x20
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq .L0803B1AC
	ldr r0, [r6, #0x30]
	mov r1, sp
	adds r3, r1, r0
	ldrb r1, [r3]
	subs r1, #1
	movs r2, #1
	ands r1, r2
	strb r1, [r3]
	ldrb r1, [r3]
	bl func_fe6_0803AED0
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
.L0803B1AC:
	ldr r1, [r5]
	movs r0, #0x10
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq .L0803B1D4
	ldr r0, [r6, #0x30]
	mov r2, sp
	adds r3, r2, r0
	ldrb r1, [r3]
	adds r1, #1
	movs r2, #1
	ands r1, r2
	strb r1, [r3]
	ldrb r1, [r3]
	bl func_fe6_0803AED0
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
.L0803B1D4:
	mov r0, sp
	bl SaveLinkArenaRuleSettings
	cmp r4, #0
	beq .L0803B22E
	movs r0, #3
	bl SioPlaySe
	ldr r5, [r6, #0x30]
	cmp r5, #1
	bne .L0803B1EE
	movs r7, #2
	rsbs r7, r7, #0
.L0803B1EE:
	ldr r0, [r6, #0x2c]
	lsls r1, r5, #0x10
	asrs r1, r1, #0x10
	ldr r3, .L0803B240 @ =gLinkArenaRuleData
	mov r2, sp
	adds r4, r2, r5
	lsls r2, r5, #2
	adds r2, r2, r5
	ldrb r4, [r4]
	adds r2, r4, r2
	lsls r2, r2, #2
	adds r3, #4
	adds r2, r2, r3
	ldr r2, [r2]
	adds r2, r2, r7
	lsls r2, r2, #0x13
	asrs r2, r2, #0x10
	lsls r3, r5, #1
	adds r3, r3, r5
	lsls r3, r3, #0x13
	movs r4, #0xc0
	lsls r4, r4, #0xe
	adds r3, r3, r4
	asrs r3, r3, #0x10
	bl func_fe6_08040768
	ldr r0, [r6, #0x30]
	ldr r1, .L0803B244 @ =0x000006D4
	adds r0, r0, r1
	movs r1, #1
	bl SioPutText
.L0803B22E:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0803B238: .4byte gKeySt
.L0803B23C: .4byte gSioSaveConfig
.L0803B240: .4byte gLinkArenaRuleData
.L0803B244: .4byte 0x000006D4

	thumb_func_start func_fe6_0803B248
func_fe6_0803B248: @ 0x0803B248
	push {r4, r5, r6, lr}
	sub sp, #0x28
	adds r2, r0, #0
	adds r3, r1, #0
	mov r0, sp
	ldr r1, .L0803B27C @ =gUnk_Sio_0810F328
	ldm r1!, {r4, r5, r6}
	stm r0!, {r4, r5, r6}
	ldm r1!, {r4, r5, r6}
	stm r0!, {r4, r5, r6}
	ldm r1!, {r4, r5, r6}
	stm r0!, {r4, r5, r6}
	ldr r1, [r1]
	str r1, [r0]
	cmp r3, #0
	bne .L0803B284
	adds r0, r2, #0
	adds r0, #0x58
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne .L0803B298
	ldr r0, .L0803B280 @ =0x000006C4
	b .L0803B2A4
	.align 2, 0
.L0803B27C: .4byte gUnk_Sio_0810F328
.L0803B280: .4byte 0x000006C4
.L0803B284:
	adds r0, r2, #0
	adds r0, #0x58
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne .L0803B298
	movs r0, #1
	rsbs r0, r0, #0
	b .L0803B2A4
.L0803B298:
	ldr r0, [r2, #0x48]
	lsls r0, r0, #1
	adds r0, r0, r3
	lsls r0, r0, #2
	add r0, sp
	ldr r0, [r0]
.L0803B2A4:
	add sp, #0x28
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start SioHaskValidSaveSlot
SioHaskValidSaveSlot: @ 0x0803B2AC
	push {r4, lr}
	movs r4, #0
.L0803B2B0:
	adds r0, r4, #0
	bl IsSaveValid
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L0803B2CC
	adds r0, r4, #0
	bl IsGameSavePastFirstChapter
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L0803B2CC
	movs r0, #1
	b .L0803B2D4
.L0803B2CC:
	adds r4, #1
	cmp r4, #2
	ble .L0803B2B0
	movs r0, #0
.L0803B2D4:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start SioMenu_Init
SioMenu_Init: @ 0x0803B2DC
	push {lr}
	bl SioHaskValidSaveSlot
	ldr r1, .L0803B308 @ =gLinkArenaSt
	strb r0, [r1, #0xa]
	ldr r1, .L0803B30C @ =gKeyInputSequenceBuffer
	movs r2, #0
	adds r0, r1, #0
	adds r0, #0x1e
.L0803B2EE:
	strh r2, [r0]
	subs r0, #2
	cmp r0, r1
	bge .L0803B2EE
	movs r1, #0
	ldr r3, .L0803B310 @ =gCurrentKeyInSeqIndex
	ldr r2, .L0803B314 @ =gTargetKeyInSeqIndex
	ldr r0, .L0803B318 @ =gKeyInputSequenceTimer
	str r1, [r0]
	str r1, [r2]
	str r1, [r3]
	pop {r0}
	bx r0
	.align 2, 0
.L0803B308: .4byte gLinkArenaSt
.L0803B30C: .4byte gKeyInputSequenceBuffer
.L0803B310: .4byte gCurrentKeyInSeqIndex
.L0803B314: .4byte gTargetKeyInSeqIndex
.L0803B318: .4byte gKeyInputSequenceTimer

	thumb_func_start SioMenu_LoadGraphics
SioMenu_LoadGraphics: @ 0x0803B31C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r6, r0, #0
	ldr r1, .L0803B3B0 @ =gUnk_Sio_0810F35A
	add r0, sp, #8
	movs r2, #5
	bl memcpy
	ldr r4, .L0803B3B4 @ =gSioSaveConfig
	adds r0, r4, #0
	bl ReadMultiArenaSaveConfig
	ldrb r4, [r4]
	lsls r0, r4, #0x1c
	lsrs r0, r0, #0x1f
	adds r5, r6, #0
	adds r5, #0x59
	movs r4, #0
	strb r0, [r5]
	bl InitSioBG
	ldr r0, .L0803B3B8 @ =Img_SioMenuBgSlide
	ldr r1, .L0803B3BC @ =0x06014800
	bl Decompress
	ldr r0, .L0803B3C0 @ =Pal_SioMenuBgSlide
	movs r1, #0x98
	lsls r1, r1, #2
	movs r2, #0x60
	bl ApplyPaletteExt
	movs r0, #0
	movs r1, #4
	bl Sio_RestartBgSlide
	ldr r0, .L0803B3C4 @ =gSioFont_0203C758
	bl SetTextFont
	bl InitSystemTextFont
	bl ResetTextFont
	bl func_fe6_08036C60
	str r4, [r6, #0x4c]
	bl IsMultiArenaSaveReady
	adds r2, r6, #0
	adds r2, #0x58
	strb r0, [r2]
	adds r1, r6, #0
	adds r1, #0x40
	movs r0, #1
	strb r0, [r1]
	movs r1, #0
	ldrsb r1, [r2, r1]
	rsbs r0, r1, #0
	orrs r0, r1
	lsrs r1, r0, #0x1f
	adds r0, r6, #0
	adds r0, #0x41
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	movs r0, #0
	ldrsb r0, [r5, r0]
	cmp r0, #0
	bne .L0803B3C8
	movs r1, #0
	movs r0, #3
	b .L0803B3CC
	.align 2, 0
.L0803B3B0: .4byte gUnk_Sio_0810F35A
.L0803B3B4: .4byte gSioSaveConfig
.L0803B3B8: .4byte Img_SioMenuBgSlide
.L0803B3BC: .4byte 0x06014800
.L0803B3C0: .4byte Pal_SioMenuBgSlide
.L0803B3C4: .4byte gSioFont_0203C758
.L0803B3C8:
	movs r1, #1
	movs r0, #4
.L0803B3CC:
	str r0, [r6, #0x50]
	adds r0, r6, #0
	adds r0, #0x44
	strb r1, [r0]
	ldr r0, .L0803B454 @ =gLinkArenaSt
	ldrb r0, [r0, #1]
	str r0, [r6, #0x48]
	adds r2, r6, #0
	adds r2, #0x40
	adds r0, r2, r0
	movs r1, #2
	strb r1, [r0]
	movs r4, #4
	adds r7, r2, #0
	adds r5, r6, #0
	adds r5, #0x3c
.L0803B3EC:
	lsls r3, r4, #0x18
	lsrs r3, r3, #0x18
	adds r0, r7, r4
	ldrb r0, [r0]
	str r0, [sp]
	adds r0, r6, #0
	movs r1, #0xb0
	movs r2, #0xa0
	bl func_fe6_08040014
	str r0, [r5]
	subs r5, #4
	subs r4, #1
	cmp r4, #0
	bge .L0803B3EC
	ldr r0, [r6, #0x2c]
	movs r1, #0
	bl StartLinkArenaTitleBanner
	movs r4, #0
	str r4, [sp]
	ldr r0, [r6, #0x2c]
	str r0, [sp, #4]
	add r0, sp, #8
	movs r1, #5
	movs r2, #0
	movs r3, #0xa8
	bl func_fe6_0803FD40
	ldr r0, .L0803B458 @ =gUnk_Sio_085CA404
	bl SetFaceConfig
	movs r0, #2
	str r0, [sp]
	movs r0, #3
	movs r1, #0xc0
	movs r2, #0xd0
	movs r3, #0x50
	bl StartFace
	str r4, [r6, #0x54]
	movs r0, #0x39
	movs r1, #0
	bl StartBgm
	bl func_fe6_0803CF9C
	add sp, #0x10
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0803B454: .4byte gLinkArenaSt
.L0803B458: .4byte gUnk_Sio_085CA404

	thumb_func_start SioMenu_0803B45C
SioMenu_0803B45C: @ 0x0803B45C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r7, r0, #0
	movs r1, #0x50
	rsbs r1, r1, #0
	ldr r5, .L0803B504 @ =gUnk_Sio_0810F350
	ldrb r2, [r5]
	ldr r3, [r7, #0x54]
	movs r4, #0x20
	str r4, [sp]
	movs r0, #4
	bl Interpolate
	adds r6, r0, #0
	ldrb r2, [r5, #1]
	ldr r3, [r7, #0x54]
	str r4, [sp]
	movs r0, #5
	movs r1, #0xa0
	bl Interpolate
	mov sb, r0
	movs r5, #4
	lsls r6, r6, #0x10
	mov r8, r6
	lsls r6, r0, #0x10
	adds r4, r7, #0
	adds r4, #0x3c
.L0803B49A:
	ldr r0, [r4]
	mov r2, r8
	asrs r1, r2, #0x10
	asrs r2, r6, #0x10
	bl func_fe6_08040098
	subs r4, #4
	subs r5, #1
	cmp r5, #0
	bge .L0803B49A
	mov r1, sb
	adds r1, #8
	movs r0, #0
	bl func_fe6_0803FE28
	ldr r0, [r7, #0x54]
	cmp r0, #0x1f
	ble .L0803B4F0
	movs r0, #0
	str r0, [r7, #0x54]
	adds r0, r7, #0
	movs r1, #0
	bl func_fe6_0803B248
	movs r1, #0
	bl SioPutText
	adds r0, r7, #0
	movs r1, #1
	bl func_fe6_0803B248
	movs r1, #1
	bl SioPutText
	ldr r0, .L0803B504 @ =gUnk_Sio_0810F350
	ldrb r1, [r0, #1]
	adds r1, #8
	movs r0, #0
	bl func_fe6_0803FE28
	adds r0, r7, #0
	bl Proc_Break
.L0803B4F0:
	ldr r0, [r7, #0x54]
	adds r0, #1
	str r0, [r7, #0x54]
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0803B504: .4byte gUnk_Sio_0810F350

	thumb_func_start SioMenu_0803B508
SioMenu_0803B508: @ 0x0803B508
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r5, r0, #0
	ldr r0, [r5, #0x48]
	lsls r0, r0, #1
	movs r7, #4
	ldr r1, .L0803B59C @ =gUnk_Sio_0810F350
	movs r2, #0x10
	mov r8, r2
	adds r6, r1, #0
	adds r6, #8
	adds r4, r0, r1
	mov sl, r4
	adds r0, #1
	adds r0, r0, r1
	mov sb, r0
.L0803B530:
	ldrb r2, [r6]
	ldr r3, [r5, #0x54]
	mov r0, r8
	str r0, [sp]
	movs r0, #4
	mov r4, sl
	ldrb r1, [r4]
	bl Interpolate
	adds r4, r0, #0
	mov r0, sb
	ldrb r1, [r0]
	ldrb r2, [r6, #1]
	ldr r3, [r5, #0x54]
	mov r0, r8
	str r0, [sp]
	movs r0, #4
	bl Interpolate
	adds r2, r0, #0
	lsls r1, r7, #2
	adds r0, r5, #0
	adds r0, #0x2c
	adds r0, r0, r1
	ldr r0, [r0]
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	adds r1, r4, #0
	bl func_fe6_08040098
	subs r6, #2
	subs r7, #1
	cmp r7, #0
	bge .L0803B530
	ldr r0, [r5, #0x54]
	cmp r0, #0xf
	ble .L0803B584
	adds r0, r5, #0
	bl Proc_Break
.L0803B584:
	ldr r0, [r5, #0x54]
	adds r0, #1
	str r0, [r5, #0x54]
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0803B59C: .4byte gUnk_Sio_0810F350

	thumb_func_start SioMenu_RestartGraphics
SioMenu_RestartGraphics: @ 0x0803B5A0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	adds r6, r0, #0
	ldr r1, .L0803B63C @ =gUnk_Sio_0810F35A
	add r0, sp, #8
	movs r2, #5
	bl memcpy
	ldr r4, .L0803B640 @ =gSioSaveConfig
	adds r0, r4, #0
	bl ReadMultiArenaSaveConfig
	ldrb r4, [r4]
	lsls r0, r4, #0x1c
	lsrs r0, r0, #0x1f
	adds r5, r6, #0
	adds r5, #0x59
	movs r4, #0
	strb r0, [r5]
	bl InitSioBG
	ldr r0, .L0803B644 @ =Img_SioMenuBgSlide
	ldr r1, .L0803B648 @ =0x06014800
	bl Decompress
	ldr r0, .L0803B64C @ =Pal_SioMenuBgSlide
	movs r1, #0x98
	lsls r1, r1, #2
	movs r2, #0x60
	bl ApplyPaletteExt
	movs r0, #0
	movs r1, #4
	bl Sio_RestartBgSlide
	ldr r0, .L0803B650 @ =gSioFont_0203C758
	bl SetTextFont
	bl InitSystemTextFont
	bl ResetTextFont
	bl func_fe6_08036C60
	str r4, [r6, #0x4c]
	bl IsMultiArenaSaveReady
	adds r2, r6, #0
	adds r2, #0x58
	strb r0, [r2]
	adds r1, r6, #0
	adds r1, #0x40
	movs r0, #1
	strb r0, [r1]
	movs r1, #0
	ldrsb r1, [r2, r1]
	rsbs r0, r1, #0
	orrs r0, r1
	lsrs r1, r0, #0x1f
	adds r0, r6, #0
	adds r0, #0x41
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	movs r0, #0
	ldrsb r0, [r5, r0]
	cmp r0, #0
	bne .L0803B654
	movs r1, #0
	movs r0, #3
	b .L0803B658
	.align 2, 0
.L0803B63C: .4byte gUnk_Sio_0810F35A
.L0803B640: .4byte gSioSaveConfig
.L0803B644: .4byte Img_SioMenuBgSlide
.L0803B648: .4byte 0x06014800
.L0803B64C: .4byte Pal_SioMenuBgSlide
.L0803B650: .4byte gSioFont_0203C758
.L0803B654:
	movs r1, #1
	movs r0, #4
.L0803B658:
	str r0, [r6, #0x50]
	adds r0, r6, #0
	adds r0, #0x44
	strb r1, [r0]
	ldr r0, .L0803B724 @ =gLinkArenaSt
	ldrb r0, [r0, #1]
	str r0, [r6, #0x48]
	adds r2, r6, #0
	adds r2, #0x40
	adds r0, r2, r0
	movs r1, #2
	strb r1, [r0]
	ldr r1, [r6, #0x48]
	lsls r1, r1, #1
	movs r5, #4
	mov sb, r2
	ldr r2, .L0803B728 @ =gUnk_Sio_0810F350
	adds r0, r1, #1
	adds r0, r0, r2
	mov r8, r0
	adds r4, r6, #0
	adds r4, #0x3c
	adds r1, r1, r2
	mov sl, r1
.L0803B688:
	lsls r3, r5, #0x18
	lsrs r3, r3, #0x18
	mov r1, sb
	adds r0, r1, r5
	ldrb r0, [r0]
	str r0, [sp]
	adds r0, r6, #0
	mov r2, sl
	ldrb r1, [r2]
	mov r7, r8
	ldrb r2, [r7]
	bl func_fe6_08040014
	str r0, [r4]
	subs r4, #4
	subs r5, #1
	cmp r5, #0
	bge .L0803B688
	ldr r0, [r6, #0x2c]
	movs r1, #0
	bl StartLinkArenaTitleBanner
	ldr r1, .L0803B728 @ =gUnk_Sio_0810F350
	ldr r0, [r6, #0x48]
	lsls r0, r0, #1
	adds r0, #1
	adds r0, r0, r1
	ldrb r3, [r0]
	adds r3, #8
	movs r4, #0
	str r4, [sp]
	ldr r0, [r6, #0x2c]
	str r0, [sp, #4]
	add r0, sp, #8
	movs r1, #5
	movs r2, #0
	bl func_fe6_0803FD40
	ldr r0, .L0803B72C @ =gUnk_Sio_085CA424
	bl SetFaceConfig
	movs r0, #2
	str r0, [sp]
	movs r0, #3
	movs r1, #0xc0
	movs r2, #0xd0
	movs r3, #0x50
	bl StartFace
	adds r0, r6, #0
	movs r1, #0
	bl func_fe6_0803B248
	movs r1, #0
	bl SioPutText
	adds r0, r6, #0
	movs r1, #1
	bl func_fe6_0803B248
	movs r1, #1
	bl SioPutText
	bl func_fe6_0803CF9C
	movs r0, #0x39
	movs r1, #0
	bl StartBgm
	str r4, [r6, #0x54]
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0803B724: .4byte gLinkArenaSt
.L0803B728: .4byte gUnk_Sio_0810F350
.L0803B72C: .4byte gUnk_Sio_085CA424

	thumb_func_start SioMenu_HandleDPadInput
SioMenu_HandleDPadInput: @ 0x0803B730
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	lsls r1, r1, #0x18
	lsrs r6, r1, #0x18
	ldr r0, [r5, #0x48]
	cmp r0, #1
	bne .L0803B7B0
	ldr r0, .L0803B828 @ =gKeySt
	ldr r1, [r0]
	movs r0, #0x20
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq .L0803B77A
	ldr r1, .L0803B82C @ =gLinkArenaSt
	ldrb r0, [r1, #5]
	subs r0, #1
	strb r0, [r1, #5]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #2
	bls .L0803B762
	movs r0, #2
	strb r0, [r1, #5]
.L0803B762:
	ldr r0, [r5, #0x30]
	movs r1, #6
	rsbs r1, r1, #0
	movs r2, #4
	str r2, [sp]
	movs r2, #0x34
	movs r3, #0x1f
	bl func_fe6_08040084
	movs r0, #3
	bl SioPlaySe
.L0803B77A:
	ldr r0, .L0803B828 @ =gKeySt
	ldr r1, [r0]
	movs r0, #0x10
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq .L0803B7B0
	ldr r4, .L0803B82C @ =gLinkArenaSt
	ldrb r0, [r4, #5]
	adds r0, #1
	strb r0, [r4, #5]
	ldrb r0, [r4, #5]
	movs r1, #3
	bl __umodsi3
	strb r0, [r4, #5]
	ldr r0, [r5, #0x30]
	movs r1, #0x1f
	str r1, [sp]
	movs r1, #0
	movs r2, #0x3a
	movs r3, #4
	bl func_fe6_08040084
	movs r0, #3
	bl SioPlaySe
.L0803B7B0:
	ldr r1, .L0803B828 @ =gKeySt
	ldr r2, [r1]
	ldrh r3, [r2, #6]
	movs r0, #0x40
	ands r0, r3
	adds r4, r1, #0
	cmp r0, #0
	beq .L0803B7EA
	ldr r1, [r5, #0x48]
	ldr r0, [r5, #0x4c]
	cmp r1, r0
	bgt .L0803B7CE
	ldrh r2, [r2, #8]
	cmp r3, r2
	bne .L0803B7EA
.L0803B7CE:
	subs r2, r6, #1
	adds r1, r5, #0
	adds r1, #0x40
.L0803B7D4:
	ldr r0, [r5, #0x48]
	subs r0, #1
	str r0, [r5, #0x48]
	cmp r0, #0
	bge .L0803B7E0
	str r2, [r5, #0x48]
.L0803B7E0:
	ldr r0, [r5, #0x48]
	adds r0, r1, r0
	ldrb r0, [r0]
	cmp r0, #0
	beq .L0803B7D4
.L0803B7EA:
	ldr r2, [r4]
	ldrh r3, [r2, #6]
	movs r0, #0x80
	ands r0, r3
	cmp r0, #0
	beq .L0803B81E
	ldr r1, [r5, #0x48]
	ldr r0, [r5, #0x50]
	cmp r1, r0
	blt .L0803B804
	ldrh r2, [r2, #8]
	cmp r3, r2
	bne .L0803B81E
.L0803B804:
	adds r4, r5, #0
	adds r4, #0x40
.L0803B808:
	ldr r0, [r5, #0x48]
	adds r0, #1
	str r0, [r5, #0x48]
	adds r1, r6, #0
	bl __modsi3
	str r0, [r5, #0x48]
	adds r0, r4, r0
	ldrb r0, [r0]
	cmp r0, #0
	beq .L0803B808
.L0803B81E:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L0803B828: .4byte gKeySt
.L0803B82C: .4byte gLinkArenaSt

	thumb_func_start SioMenu_Loop_HandleKeyInput
SioMenu_Loop_HandleKeyInput: @ 0x0803B830
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, [r4, #0x48]
	ldr r0, .L0803B928 @ =gUnk_Sio_085C99F8
	bl SioIsKeyInputSequenceComplete
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L0803B860
	ldr r1, .L0803B92C @ =gLinkArenaSt
	ldr r0, [r4, #0x48]
	strb r0, [r1]
	strb r0, [r1, #1]
	movs r0, #3
	bl EndFaceById
	ldr r0, .L0803B930 @ =ProcScr_SioMenuBurstFx
	adds r1, r4, #0
	bl SpawnProcLocking
	adds r0, r4, #0
	movs r1, #1
	bl Proc_Goto
.L0803B860:
	adds r0, r4, #0
	movs r1, #5
	bl SioMenu_HandleDPadInput
	ldr r0, [r4, #0x48]
	cmp r5, r0
	beq .L0803B8DA
	movs r0, #3
	bl SioPlaySe
	lsls r0, r5, #2
	adds r1, r4, #0
	adds r1, #0x2c
	adds r0, r1, r0
	ldr r3, [r0]
	adds r2, r3, #0
	adds r2, #0x2e
	movs r0, #1
	strb r0, [r2]
	ldr r0, [r4, #0x48]
	lsls r0, r0, #2
	adds r1, r1, r0
	ldr r3, [r1]
	adds r1, r3, #0
	adds r1, #0x2e
	movs r0, #2
	strb r0, [r1]
	movs r0, #0x2a
	ldrsh r1, [r3, r0]
	movs r0, #0x2c
	ldrsh r2, [r3, r0]
	adds r0, r3, #0
	bl func_fe6_0804085C
	adds r0, r4, #0
	movs r1, #0
	bl func_fe6_0803B248
	movs r1, #0
	bl SioPutText
	adds r0, r4, #0
	movs r1, #1
	bl func_fe6_0803B248
	movs r1, #1
	bl SioPutText
	ldr r1, .L0803B934 @ =gUnk_Sio_0810F350
	ldr r0, [r4, #0x48]
	lsls r0, r0, #1
	adds r0, #1
	adds r0, r0, r1
	ldrb r1, [r0]
	adds r1, #8
	movs r0, #0
	bl func_fe6_0803FE0C
	ldr r0, [r4, #0x48]
	bl func_fe6_0803FE48
.L0803B8DA:
	ldr r5, .L0803B938 @ =gKeySt
	ldr r1, [r5]
	movs r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq .L0803B8FE
	movs r0, #0
	str r0, [r4, #0x54]
	movs r0, #2
	bl SioPlaySe
	ldr r1, .L0803B92C @ =gLinkArenaSt
	ldr r0, [r4, #0x48]
	strb r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
.L0803B8FE:
	ldr r1, [r5]
	movs r0, #2
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq .L0803B922
	movs r0, #1
	bl SioPlaySe
	movs r0, #2
	bl FadeBgmOut
	ldr r1, .L0803B92C @ =gLinkArenaSt
	movs r0, #0xff
	strb r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
.L0803B922:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0803B928: .4byte gUnk_Sio_085C99F8
.L0803B92C: .4byte gLinkArenaSt
.L0803B930: .4byte ProcScr_SioMenuBurstFx
.L0803B934: .4byte gUnk_Sio_0810F350
.L0803B938: .4byte gKeySt

	thumb_func_start SioMenu_0803B93C
SioMenu_0803B93C: @ 0x0803B93C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r5, r0, #0
	ldr r4, .L0803B9E8 @ =gLinkArenaSt
	ldrb r0, [r4]
	cmp r0, #0xff
	bne .L0803B958
	adds r0, r5, #0
	bl Proc_Break
.L0803B958:
	ldrb r2, [r4]
	ldr r0, [r5, #0x54]
	cmp r0, #0x10
	bgt .L0803B9C6
	movs r0, #4
	mov r8, r0
	lsls r2, r2, #1
	ldr r1, .L0803B9EC @ =gUnk_Sio_0810F350
	movs r4, #0x10
	mov sb, r4
	adds r0, r2, #1
	adds r0, r0, r1
	str r0, [sp, #4]
	adds r6, r5, #0
	adds r6, #0x3c
	adds r7, r1, #0
	adds r7, #8
	adds r2, r2, r1
	mov sl, r2
.L0803B97E:
	ldrb r1, [r7]
	ldr r3, [r5, #0x54]
	mov r0, sb
	str r0, [sp]
	movs r0, #4
	mov r4, sl
	ldrb r2, [r4]
	bl Interpolate
	adds r4, r0, #0
	ldrb r1, [r7, #1]
	ldr r0, [sp, #4]
	ldrb r2, [r0]
	ldr r3, [r5, #0x54]
	mov r0, sb
	str r0, [sp]
	movs r0, #4
	bl Interpolate
	adds r2, r0, #0
	ldr r0, [r6]
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	adds r1, r4, #0
	bl func_fe6_08040098
	subs r6, #4
	subs r7, #2
	movs r4, #1
	rsbs r4, r4, #0
	add r8, r4
	mov r0, r8
	cmp r0, #0
	bge .L0803B97E
.L0803B9C6:
	ldr r0, [r5, #0x54]
	cmp r0, #0x20
	ble .L0803B9D2
	adds r0, r5, #0
	bl Proc_Break
.L0803B9D2:
	ldr r0, [r5, #0x54]
	adds r0, #1
	str r0, [r5, #0x54]
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0803B9E8: .4byte gLinkArenaSt
.L0803B9EC: .4byte gUnk_Sio_0810F350

	thumb_func_start SioMenu_End
SioMenu_End: @ 0x0803B9F0
	push {r4, r5, r6, lr}
	sub sp, #0x14
	adds r6, r0, #0
	mov r1, sp
	ldr r0, .L0803BA40 @ =gSioMenuProcArray
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldm r0!, {r2, r3}
	stm r1!, {r2, r3}
	movs r0, #3
	bl EndFaceById
	adds r5, r6, #0
	adds r5, #0x2c
	movs r4, #4
.L0803BA0E:
	ldm r5!, {r0}
	bl Proc_End
	subs r4, #1
	cmp r4, #0
	bge .L0803BA0E
	ldr r1, .L0803BA44 @ =gLinkArenaSt
	ldrb r2, [r1]
	adds r0, r2, #0
	cmp r0, #0xff
	bne .L0803BA4C
	bl EndBmVSync
	bl Sio_EndBackgroundSlide
	bl UnsetBmStLinkArenaFlag
	ldr r0, .L0803BA48 @ =ProcScr_DebugMonitor
	bl Proc_EndEach
	adds r0, r6, #0
	bl Proc_End
	b .L0803BA5C
	.align 2, 0
.L0803BA40: .4byte gSioMenuProcArray
.L0803BA44: .4byte gLinkArenaSt
.L0803BA48: .4byte ProcScr_DebugMonitor
.L0803BA4C:
	strb r2, [r1, #1]
	ldrb r1, [r1]
	lsls r0, r1, #2
	add r0, sp
	ldr r0, [r0]
	adds r1, r6, #0
	bl SpawnProcLocking
.L0803BA5C:
	add sp, #0x14
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start StartLinkArenaMainMenu
StartLinkArenaMainMenu: @ 0x0803BA64
	push {r4, lr}
	adds r4, r0, #0
	bl UnpackUiWindowFrameGraphics
	ldr r0, .L0803BAC8 @ =gSioFont_0203C758
	ldr r1, .L0803BACC @ =0x06001800
	movs r2, #0xc0
	movs r3, #0
	bl InitTextFont
	movs r0, #5
	bl IsSaveValid
	lsls r0, r0, #0x18
	cmp r0, #0
	bne .L0803BA88
	bl WriteNewMultiArenaSave
.L0803BA88:
	ldr r1, .L0803BAD0 @ =gLinkArenaSt
	movs r0, #0
	strb r0, [r1, #5]
	strb r0, [r1, #3]
	strb r0, [r1, #1]
	bl SetBmStLinkArenaFlag
	bl func_fe6_0803CE7C
	bl StartBmVSync
	ldr r1, .L0803BAD4 @ =gPlaySt
	movs r0, #0xdf
	ldrb r2, [r1, #0x14]
	ands r0, r2
	strb r0, [r1, #0x14]
	movs r0, #0xd
	rsbs r0, r0, #0
	ldrb r2, [r1, #0x1d]
	ands r0, r2
	strb r0, [r1, #0x1d]
	ldr r0, .L0803BAD8 @ =ProcScr_SIOMENU
	adds r1, r4, #0
	bl SpawnProcLocking
	ldr r0, .L0803BADC @ =ProcScr_DebugMonitor
	movs r1, #3
	bl SpawnProc
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0803BAC8: .4byte gSioFont_0203C758
.L0803BACC: .4byte 0x06001800
.L0803BAD0: .4byte gLinkArenaSt
.L0803BAD4: .4byte gPlaySt
.L0803BAD8: .4byte ProcScr_SIOMENU
.L0803BADC: .4byte ProcScr_DebugMonitor

	thumb_func_start XMapTransfer_0803BAE0
XMapTransfer_0803BAE0: @ 0x0803BAE0
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	movs r4, #0
	ldr r0, .L0803BB08 @ =ProcScr_SIOCON
	bl FindProc
	cmp r0, #0
	beq .L0803BB10
	ldr r0, .L0803BB0C @ =gKeySt
	ldr r1, [r0]
	movs r0, #2
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq .L0803BBEC
	adds r0, r5, #0
	movs r1, #4
	b .L0803BBA8
	.align 2, 0
.L0803BB08: .4byte ProcScr_SIOCON
.L0803BB0C: .4byte gKeySt
.L0803BB10:
	ldr r0, .L0803BB30 @ =gSioSt
	ldr r2, [r0]
	movs r0, #6
	ldrsb r0, [r2, r0]
	cmp r0, #1
	bgt .L0803BB2A
	adds r1, r0, #0
	adds r0, r2, #0
	adds r0, #0xb
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #2
	bne .L0803BB34
.L0803BB2A:
	adds r0, r5, #0
	movs r1, #0
	b .L0803BBA8
	.align 2, 0
.L0803BB30: .4byte gSioSt
.L0803BB34:
	movs r1, #0
	adds r2, #0x1a
.L0803BB38:
	adds r0, r2, r1
	ldrb r0, [r0]
	cmp r0, #0x3c
	bls .L0803BB42
	adds r4, #1
.L0803BB42:
	adds r1, #1
	cmp r1, #3
	ble .L0803BB38
	bl func_fe6_08035CF8
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L0803BB60
	ldr r6, .L0803BB68 @ =gSioSt
	ldr r2, [r6]
	ldrb r0, [r2, #0x1e]
	cmp r0, #0x3c
	bhi .L0803BB60
	cmp r4, #0
	beq .L0803BB6C
.L0803BB60:
	adds r0, r5, #0
	movs r1, #0
	b .L0803BBA8
	.align 2, 0
.L0803BB68: .4byte gSioSt
.L0803BB6C:
	ldr r0, .L0803BBB0 @ =gUnk_030044E0
	movs r1, #0x1c
	strb r1, [r0]
	ldrb r1, [r2, #6]
	strb r1, [r0, #1]
	ldrb r1, [r2]
	strh r1, [r0, #2]
	movs r1, #0xa
	bl SioSend
	ldr r0, [r6]
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne .L0803BBB4
	bl IsExtraMapAvailable
	lsls r0, r0, #0x18
	cmp r0, #0
	bne .L0803BBB4
	mov r1, sp
	movs r0, #1
	strb r0, [r1]
	mov r0, sp
	movs r1, #4
	bl SioEmitData
	adds r0, r5, #0
	movs r1, #3
.L0803BBA8:
	bl EventGotoLabel
.L0803BBAC:
	movs r0, #0
	b .L0803BBEE
	.align 2, 0
.L0803BBB0: .4byte gUnk_030044E0
.L0803BBB4:
	ldr r4, .L0803BBE8 @ =gSioSt
	ldr r1, [r4]
	movs r0, #3
	ldrb r2, [r1, #9]
	ands r0, r2
	cmp r0, #3
	bne .L0803BBEC
	strb r0, [r1, #9]
	bl func_fe6_08036608
	ldr r1, [r4]
	movs r2, #0
	movs r0, #6
	strh r0, [r1, #4]
	strb r2, [r1, #0x1e]
	ldr r0, [r4]
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq .L0803BBAC
	adds r0, r5, #0
	movs r1, #1
	bl EventGotoLabel
	b .L0803BBAC
	.align 2, 0
.L0803BBE8: .4byte gSioSt
.L0803BBEC:
	movs r0, #1
.L0803BBEE:
	add sp, #4
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start XMapTransfer_0803BBF8
XMapTransfer_0803BBF8: @ 0x0803BBF8
	push {lr}
	adds r1, r0, #0
	ldr r0, .L0803BC14 @ =gSioSt
	ldr r0, [r0]
	ldrb r0, [r0, #9]
	cmp r0, #3
	bls .L0803BC0E
	adds r0, r1, #0
	movs r1, #0
	bl EventGotoLabel
.L0803BC0E:
	pop {r0}
	bx r0
	.align 2, 0
.L0803BC14: .4byte gSioSt

	thumb_func_start XMapTransfer_0803BC18
XMapTransfer_0803BC18: @ 0x0803BC18
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	bl GetTalkChoiceResult
	cmp r0, #1
	bne .L0803BC30
	ldr r1, .L0803BC2C @ =gSioXmapOption
	movs r0, #0
	b .L0803BC34
	.align 2, 0
.L0803BC2C: .4byte gSioXmapOption
.L0803BC30:
	ldr r1, .L0803BC5C @ =gSioXmapOption
	movs r0, #1
.L0803BC34:
	str r0, [r1]
	adds r4, r1, #0
	mov r0, sp
	ldr r1, [r4]
	strb r1, [r0]
	movs r1, #4
	bl SioEmitData
	ldr r0, [r4]
	cmp r0, #0
	beq .L0803BC52
	adds r0, r5, #0
	movs r1, #5
	bl EventGotoLabel
.L0803BC52:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0803BC5C: .4byte gSioXmapOption

	thumb_func_start XMapTransfer_0803BC60
XMapTransfer_0803BC60: @ 0x0803BC60
	push {r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	movs r4, #0
	movs r1, #0
	ldr r0, .L0803BCA8 @ =gSioSt
	ldr r0, [r0]
	adds r2, r0, #0
	adds r2, #0x1a
.L0803BC72:
	adds r0, r2, r1
	ldrb r0, [r0]
	cmp r0, #0x3c
	bls .L0803BC7C
	adds r4, #1
.L0803BC7C:
	adds r1, #1
	cmp r1, #3
	ble .L0803BC72
	bl func_fe6_08035CF8
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L0803BC9A
	ldr r0, .L0803BCA8 @ =gSioSt
	ldr r0, [r0]
	ldrb r0, [r0, #0x1e]
	cmp r0, #0x3c
	bhi .L0803BC9A
	cmp r4, #0
	beq .L0803BCAC
.L0803BC9A:
	adds r0, r5, #0
	movs r1, #0
	bl EventGotoLabel
.L0803BCA2:
	movs r0, #0
	b .L0803BCD0
	.align 2, 0
.L0803BCA8: .4byte gSioSt
.L0803BCAC:
	add r1, sp, #4
	mov r0, sp
	movs r2, #0
	bl SioReceiveData
	lsls r0, r0, #0x10
	cmp r0, #0
	beq .L0803BCCE
	mov r0, sp
	ldrb r0, [r0]
	cmp r0, #0
	beq .L0803BCA2
	adds r0, r5, #0
	movs r1, #5
	bl EventGotoLabel
	b .L0803BCA2
.L0803BCCE:
	movs r0, #1
.L0803BCD0:
	add sp, #8
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start PutXMapProgressPercent
PutXMapProgressPercent: @ 0x0803BCD8
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	bl ClearText
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0
	adds r3, r5, #0
	bl Text_InsertDrawString
	adds r0, r4, #0
	movs r1, #0x36
	movs r2, #2
	adds r3, r6, #0
	bl Text_InsertDrawNumberOrBlank
	ldr r3, .L0803BD18 @ =gUnk_Sio_0810F374
	adds r0, r4, #0
	movs r1, #0x3e
	movs r2, #0
	bl Text_InsertDrawString
	ldr r1, .L0803BD1C @ =gBg0Tm+0x31E
	adds r0, r4, #0
	bl PutText
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L0803BD18: .4byte gUnk_Sio_0810F374
.L0803BD1C: .4byte gBg0Tm+0x31E

	thumb_func_start DrawXMapSendProgress
DrawXMapSendProgress: @ 0x0803BD20
	push {r4, r5, lr}
	sub sp, #0xc
	adds r5, r0, #0
	adds r5, #0x3c
	adds r0, #0x3b
	ldrb r1, [r5]
	ldrb r0, [r0]
	cmp r1, r0
	bhs .L0803BD76
	ldr r0, .L0803BD80 @ =gPlaySt
	ldrb r0, [r0, #0x1d]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L0803BD42
	movs r0, #0x7d
	bl m4aSongNumStart
.L0803BD42:
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	ldr r0, .L0803BD84 @ =gSioText_0203C67C
	ldr r1, .L0803BD88 @ =gUnk_Sio_0810F378
	ldrb r2, [r5]
	bl PutXMapProgressPercent
	movs r0, #0x80
	lsls r0, r0, #1
	ldr r2, .L0803BD8C @ =gBg0Tm+0x3DC
	movs r3, #0xc0
	lsls r3, r3, #7
	movs r1, #0x64
	str r1, [sp]
	ldrb r4, [r5]
	str r4, [sp, #4]
	ldrb r5, [r5]
	subs r1, r1, r5
	str r1, [sp, #8]
	movs r1, #0xe
	bl PutDrawUiGauge
	movs r0, #1
	bl EnableBgSync
.L0803BD76:
	add sp, #0xc
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0803BD80: .4byte gPlaySt
.L0803BD84: .4byte gSioText_0203C67C
.L0803BD88: .4byte gUnk_Sio_0810F378
.L0803BD8C: .4byte gBg0Tm+0x3DC

	thumb_func_start DrawXMapReceiveProgress
DrawXMapReceiveProgress: @ 0x0803BD90
	push {r4, r5, lr}
	sub sp, #0xc
	adds r5, r0, #0
	adds r5, #0x3c
	adds r0, #0x3b
	ldrb r1, [r5]
	ldrb r0, [r0]
	cmp r1, r0
	bhs .L0803BDE6
	ldr r0, .L0803BDF0 @ =gPlaySt
	ldrb r0, [r0, #0x1d]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L0803BDB2
	movs r0, #0x7d
	bl m4aSongNumStart
.L0803BDB2:
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	ldr r0, .L0803BDF4 @ =gSioText_0203C67C
	ldr r1, .L0803BDF8 @ =gUnk_Sio_0810F380
	ldrb r2, [r5]
	bl PutXMapProgressPercent
	movs r0, #0x80
	lsls r0, r0, #1
	ldr r2, .L0803BDFC @ =gBg0Tm+0x3DC
	movs r3, #0xc0
	lsls r3, r3, #7
	movs r1, #0x64
	str r1, [sp]
	ldrb r4, [r5]
	str r4, [sp, #4]
	ldrb r5, [r5]
	subs r1, r1, r5
	str r1, [sp, #8]
	movs r1, #0xe
	bl PutDrawUiGauge
	movs r0, #1
	bl EnableBgSync
.L0803BDE6:
	add sp, #0xc
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0803BDF0: .4byte gPlaySt
.L0803BDF4: .4byte gSioText_0203C67C
.L0803BDF8: .4byte gUnk_Sio_0810F380
.L0803BDFC: .4byte gBg0Tm+0x3DC

	thumb_func_start StartXMapTransfer
StartXMapTransfer: @ 0x0803BE00
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	ldr r0, .L0803BE44 @ =gSioFont_0203C758
	bl SetTextFont
	bl InitSystemTextFont
	ldr r0, .L0803BE48 @ =gSioSt
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne .L0803BE5C
	ldr r1, .L0803BE4C @ =ReadSramFast
	ldr r0, .L0803BE50 @ =0x0E007000
	ldr r4, .L0803BE54 @ =gUnk_Sio_02000000
	movs r5, #0x80
	lsls r5, r5, #5
	ldr r3, [r1]
	adds r1, r4, #0
	adds r2, r5, #0
	bl _call_via_r3
	ldr r2, .L0803BE58 @ =DrawXMapSendProgress
	str r6, [sp]
	adds r0, r4, #0
	adds r1, r5, #0
	movs r3, #0
	bl StartSioBigSend
	b .L0803BE66
	.align 2, 0
.L0803BE44: .4byte gSioFont_0203C758
.L0803BE48: .4byte gSioSt
.L0803BE4C: .4byte ReadSramFast
.L0803BE50: .4byte 0x0E007000
.L0803BE54: .4byte gUnk_Sio_02000000
.L0803BE58: .4byte DrawXMapSendProgress
.L0803BE5C:
	ldr r0, .L0803BE70 @ =gUnk_Sio_02000000
	ldr r1, .L0803BE74 @ =DrawXMapReceiveProgress
	adds r2, r6, #0
	bl StartSioBigReceive
.L0803BE66:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L0803BE70: .4byte gUnk_Sio_02000000
.L0803BE74: .4byte DrawXMapReceiveProgress

	thumb_func_start XMapTransfer_AwaitCompletion
XMapTransfer_AwaitCompletion: @ 0x0803BE78
	push {lr}
	bl IsSioBigTransferActive
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L0803BE88
	movs r0, #1
	b .L0803BEB8
.L0803BE88:
	ldr r0, .L0803BEBC @ =gPlaySt
	ldrb r0, [r0, #0x1d]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L0803BE98
	movs r0, #0x7e
	bl m4aSongNumStart
.L0803BE98:
	bl InitTalkTextFont
	ldr r0, .L0803BEC0 @ =gSioSt
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq .L0803BEB6
	ldr r0, .L0803BEC4 @ =gUnk_Sio_02000000
	ldr r1, .L0803BEC8 @ =0x0E007000
	movs r2, #0x80
	lsls r2, r2, #5
	bl WriteAndVerifySramFast
.L0803BEB6:
	movs r0, #0
.L0803BEB8:
	pop {r1}
	bx r1
	.align 2, 0
.L0803BEBC: .4byte gPlaySt
.L0803BEC0: .4byte gSioSt
.L0803BEC4: .4byte gUnk_Sio_02000000
.L0803BEC8: .4byte 0x0E007000

	thumb_func_start XMapTransfer_0803BECC
XMapTransfer_0803BECC: @ 0x0803BECC
	ldr r0, .L0803BEDC @ =gSioSt
	ldr r2, [r0]
	movs r1, #6
	ldrsb r1, [r2, r1]
	movs r0, #1
	lsls r0, r1
	strb r0, [r2, #0xa]
	bx lr
	.align 2, 0
.L0803BEDC: .4byte gSioSt

	thumb_func_start XMapTransfer_0803BEE0
XMapTransfer_0803BEE0: @ 0x0803BEE0
	push {r4, lr}
	ldr r0, .L0803BF0C @ =gSioMsgBuf
	movs r2, #0
	movs r1, #0x19
	strb r1, [r0]
	ldr r4, .L0803BF10 @ =gSioSt
	ldr r1, [r4]
	ldrb r1, [r1, #6]
	strb r1, [r0, #1]
	strh r2, [r0, #2]
	movs r1, #4
	bl SioSend
	ldr r4, [r4]
	ldrb r0, [r4, #9]
	ldrb r1, [r4, #0xa]
	ands r0, r1
	ldrb r1, [r4, #9]
	cmp r0, r1
	beq .L0803BF14
	movs r0, #1
	b .L0803BF20
	.align 2, 0
.L0803BF0C: .4byte gSioMsgBuf
.L0803BF10: .4byte gSioSt
.L0803BF14:
	movs r1, #6
	ldrsb r1, [r4, r1]
	movs r0, #1
	lsls r0, r1
	strb r0, [r4, #0xa]
	movs r0, #0
.L0803BF20:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start XMapTransfer_0803BF28
XMapTransfer_0803BF28: @ 0x0803BF28
	push {r4, lr}
	sub sp, #0xc
	movs r0, #6
	bl ApplyUiStatBarPal
	movs r4, #0
	str r4, [sp]
	movs r0, #0xd
	movs r1, #0xb
	movs r2, #0x10
	movs r3, #6
	bl PutUiWindowFrame
	ldr r0, .L0803BF7C @ =gSioFont_0203C758
	bl SetTextFont
	bl InitSystemTextFont
	ldr r0, .L0803BF80 @ =gSioText_0203C67C
	ldr r1, .L0803BF84 @ =gUnk_Sio_0810F388
	movs r2, #0
	bl PutXMapProgressPercent
	movs r0, #0x80
	lsls r0, r0, #1
	ldr r2, .L0803BF88 @ =gBg0Tm+0x3DC
	movs r3, #0xc0
	lsls r3, r3, #7
	movs r1, #0x64
	str r1, [sp]
	str r4, [sp, #4]
	str r1, [sp, #8]
	movs r1, #0xd
	bl PutDrawUiGauge
	movs r0, #1
	bl EnableBgSync
	add sp, #0xc
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0803BF7C: .4byte gSioFont_0203C758
.L0803BF80: .4byte gSioText_0203C67C
.L0803BF84: .4byte gUnk_Sio_0810F388
.L0803BF88: .4byte gBg0Tm+0x3DC

	thumb_func_start XmapTransfer_SetDisp
XmapTransfer_SetDisp: @ 0x0803BF8C
	ldr r2, .L0803BFAC @ =gDispIo
	adds r2, #0x36
	movs r0, #1
	ldrb r1, [r2]
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2]
	bx lr
	.align 2, 0
.L0803BFAC: .4byte gDispIo

	thumb_func_start func_fe6_0803BFB0
func_fe6_0803BFB0: @ 0x0803BFB0
	push {r4, r5, lr}
	ldr r4, [r0, #0x14]
	movs r0, #3
	bl EndFaceById
	adds r5, r4, #0
	adds r5, #0x2c
	movs r4, #4
.L0803BFC0:
	ldm r5!, {r0}
	bl Proc_End
	subs r4, #1
	cmp r4, #0
	bge .L0803BFC0
	bl InitSioBG
	movs r0, #0
	movs r1, #0
	bl Sio_RestartBgSlide
	ldr r0, .L0803C000 @ =gSioSt
	ldr r1, [r0]
	movs r0, #3
	strb r0, [r1]
	ldr r0, .L0803C004 @ =gSioFont_0203C758
	bl SetTextFont
	bl InitSystemTextFont
	ldr r0, .L0803C008 @ =gSioText_0203C67C
	movs r1, #0xa
	bl InitTextDb
	movs r0, #1
	bl FadeBgmOut
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0803C000: .4byte gSioSt
.L0803C004: .4byte gSioFont_0203C758
.L0803C008: .4byte gSioText_0203C67C

	thumb_func_start StartEvent_SioXMapTransfer
StartEvent_SioXMapTransfer: @ 0x0803C00C
	push {lr}
	adds r1, r0, #0
	ldr r0, .L0803C024 @ =gSioSt
	ldr r2, [r0]
	movs r0, #3
	strb r0, [r2]
	ldr r0, .L0803C028 @ =EventScr_SioXMapTransfer
	bl StartEventLocking
	pop {r0}
	bx r0
	.align 2, 0
.L0803C024: .4byte gSioSt
.L0803C028: .4byte EventScr_SioXMapTransfer

	thumb_func_start func_fe6_0803C02C
func_fe6_0803C02C: @ 0x0803C02C
	push {lr}
	bl ClearSioBG
	bl SioBat_EndHandler
	bl SioBat_ReleaseIrq
	bl SioInit_SW
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_fe6_0803C044
func_fe6_0803C044: @ 0x0803C044
	push {r4, lr}
	adds r4, r0, #0
	bl GetTalkChoiceResult
	cmp r0, #1
	beq .L0803C058
	adds r0, r4, #0
	movs r1, #1
	bl EventGotoLabel
.L0803C058:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_fe6_0803C060
func_fe6_0803C060: @ 0x0803C060
	push {r4, lr}
	adds r4, r0, #0
	bl GetTalkChoiceResult
	cmp r0, #1
	bne .L0803C072
	bl InitGlobalSaveInfo
	b .L0803C07A
.L0803C072:
	adds r0, r4, #0
	movs r1, #1
	bl EventGotoLabel
.L0803C07A:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start StartEvent_SioXmap_0803C080
StartEvent_SioXmap_0803C080: @ 0x0803C080
	push {lr}
	adds r1, r0, #0
	ldr r0, .L0803C090 @ =EventScr_SioXmap_085CA6B8
	bl StartEventLocking
	pop {r0}
	bx r0
	.align 2, 0
.L0803C090: .4byte EventScr_SioXmap_085CA6B8

	thumb_func_start func_fe6_0803C094
func_fe6_0803C094: @ 0x0803C094
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	ldr r0, .L0803C0D8 @ =gLinkArenaSt
	adds r1, r0, #0
	adds r1, #0xa0
	ldrb r3, [r1]
	adds r0, #0xec
	movs r1, #2
	ldrb r0, [r0]
	ands r1, r0
	cmp r1, #0
	beq .L0803C0E0
	movs r6, #0
	cmp r6, r3
	bge .L0803C13A
	ldr r4, .L0803C0DC @ =Sio_Unk_0203C993
	adds r5, r4, #5
	mov r2, r8
.L0803C0BC:
	adds r1, r6, r4
	ldrb r0, [r1]
	strb r0, [r2]
	ldrb r1, [r1]
	lsls r0, r1, #2
	adds r0, r0, r5
	ldr r0, [r0]
	str r0, [r2, #4]
	adds r2, #8
	adds r6, #1
	cmp r6, r3
	blt .L0803C0BC
	b .L0803C13A
	.align 2, 0
.L0803C0D8: .4byte gLinkArenaSt
.L0803C0DC: .4byte Sio_Unk_0203C993
.L0803C0E0:
	movs r6, #0
	subs r0, r3, #2
	mov ip, r0
	cmp r6, r3
	bge .L0803C100
	ldr r0, .L0803C104 @ =gSioBmSt
	adds r2, r0, #0
	adds r2, #0x14
	mov r1, r8
.L0803C0F2:
	strb r6, [r1]
	ldm r2!, {r0}
	str r0, [r1, #4]
	adds r1, #8
	adds r6, #1
	cmp r6, r3
	blt .L0803C0F2
.L0803C100:
	movs r6, #0
	b .L0803C134
	.align 2, 0
.L0803C104: .4byte gSioBmSt
.L0803C108:
	adds r5, r0, #0
	adds r7, r6, #1
	cmp r0, r6
	blt .L0803C132
	lsls r0, r0, #3
	mov r1, r8
	adds r2, r0, r1
.L0803C116:
	ldr r4, [r2, #4]
	ldr r3, [r2, #0xc]
	cmp r4, r3
	bhs .L0803C12A
	ldrb r1, [r2]
	ldrb r0, [r2, #8]
	strb r0, [r2]
	strb r1, [r2, #8]
	str r3, [r2, #4]
	str r4, [r2, #0xc]
.L0803C12A:
	subs r2, #8
	subs r5, #1
	cmp r5, r6
	bge .L0803C116
.L0803C132:
	adds r6, r7, #0
.L0803C134:
	mov r0, ip
	cmp r6, r0
	ble .L0803C108
.L0803C13A:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

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
	ldr r0, .L0803F708 @ =gUnk_082DD268
	ldr r1, .L0803F70C @ =0x06004400
	bl Decompress
	ldr r0, .L0803F710 @ =gUnk_082DD4C8
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
.L0803F708: .4byte gUnk_082DD268
.L0803F70C: .4byte 0x06004400
.L0803F710: .4byte gUnk_082DD4C8

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
	ldr r4, .L0803F7D0 @ =gUnk_082DD4E8
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
.L0803F7D0: .4byte gUnk_082DD4E8
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
