	.include "macro.inc"

	.syntax unified

	thumb_func_start func_fe6_0807B4C0
func_fe6_0807B4C0: @ 0x0807B4C0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov r8, r0
	mov r5, r8
	adds r5, #0x42
	ldrh r0, [r5]
	cmp r0, #0
	bne .L0807B50C
	mov r1, r8
	adds r1, #0x29
	movs r0, #1
	strb r0, [r1]
	adds r1, #1
	strb r0, [r1]
	adds r1, #1
	strb r0, [r1]
	mov r0, r8
	bl PrepScreen_DrawScreenInfo
	ldr r0, .L0807B594 @ =gBg0Tm
	movs r1, #0xc
	movs r2, #0x13
	movs r3, #0
	bl TmFillRect_thm
	ldr r0, .L0807B598 @ =gBg1Tm
	movs r1, #0xc
	movs r2, #0x13
	movs r3, #0
	bl TmFillRect_thm
	mov r0, r8
	bl func_fe6_08079D84
.L0807B50C:
	ldrh r4, [r5]
	adds r4, #0x10
	ldrh r0, [r5]
	movs r1, #0xc
	bl __udivsi3
	subs r4, r4, r0
	strh r4, [r5]
	lsls r4, r4, #0x10
	lsrs r7, r4, #0x13	@ r7 = _scroll_time = proc->scroll_time >> 0x3
	movs r0, #0			@ r0 = 0 = i
	rsbs r1, r7, #0
	str r1, [sp]		@ [sp] = -(proc->scroll_time >> 0x3)
.L0807B526:
	adds r1, r0, #1
	mov ip, r1			@ ip = r0 + 1 = i + 1
	cmp r7, #0			@ if (r7 != 0)
	beq .L0807B56C
	ldr r3, .L0807B59C @ =gUnk_0200E8A4
	adds r2, r0, #0
	adds r2, #0xa
	lsls r2, r2, #6		@ r2 = (i + 10) << 6
	ldr r1, [sp]
	adds r1, #0xd 		@ off2 = -_scroll_timer + 13
	lsls r4, r0, #6		@ r4 = i << 6
	ldr r0, .L0807B598 @ =gBg1Tm
	mov sl, r0
	ldr r0, .L0807B594 @ =gBg0Tm
	mov sb, r0
	adds r6, r7, #0		@ j = 0; j < _scroll_time; j++
	lsls r1, r1, #1 	@ off2 * 2
	adds r0, r4, r3		@ gUnk_0200E8A4 + (i << 6)
	adds r5, r1, r0		@ r5 = gUnk_0200E8A4 + (i << 6) + (-_scroll_timer + 13) * 2
	adds r2, r2, r3		@ gUnk_0200E8A4 + (i + 10) << 6
	adds r2, r1, r2		@ gUnk_0200E8A4 + (i + 10) << 6 + (-_scroll_timer + 13) * 2
.L0807B550:
	mov r0, sl
	adds r1, r4, r0
	ldrh r0, [r2]		@ gUnk_0200E8A4[(-_scroll_timer + 13) + j, i + 10]
	strh r0, [r1]		@ gBg1Tm[(j, i)]
	mov r0, sb
	adds r1, r4, r0
	ldrh r0, [r5]		@ gUnk_0200E8A4[(-_scroll_timer + 13) + j, i]
	strh r0, [r1]		@ gBg0Tm[(j, i)]
	adds r5, #2
	adds r2, #2
	adds r4, #2
	subs r6, #1
	cmp r6, #0
	bne .L0807B550
.L0807B56C:
	mov r0, ip
	cmp r0, #7
	ble .L0807B526
	movs r0, #3
	bl EnableBgSync
	cmp r7, #0xc
	ble .L0807B582
	mov r0, r8
	bl Proc_Break
.L0807B582:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0807B594: .4byte gBg0Tm
.L0807B598: .4byte gBg1Tm
.L0807B59C: .4byte gUnk_0200E8A4

	thumb_func_start func_fe6_0807B5A0
func_fe6_0807B5A0: @ 0x0807B5A0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r6, r0, #0
	adds r5, r6, #0
	adds r5, #0x42
	ldrh r1, [r5]
	cmp r1, #0
	bne .L0807B5BA
	adds r0, #0x2b
	strb r1, [r0]
.L0807B5BA:
	ldrh r4, [r5]
	adds r4, #0x10
	ldrh r0, [r5]
	movs r1, #0xc
	bl __udivsi3
	subs r4, r4, r0
	strh r4, [r5]
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x13
	mov sl, r4
	movs r2, #0
	movs r0, #0xd
	mov r1, sl
	subs r1, r0, r1
	mov r8, r1
	movs r3, #0
	mov sb, r3
	mov r0, sl
	lsls r7, r0, #1
.L0807B5E2:
	movs r5, #0
	lsls r1, r2, #6
	adds r3, r2, #1
	mov ip, r3
	adds r0, r7, r1
	ldr r3, .L0807B610 @ =gUnk_0200E8A4
	adds r4, r0, r3
	ldr r0, .L0807B614 @ =gBg0Tm
	adds r3, r1, r0
	ldr r0, .L0807B618 @ =gBg1Tm
	adds r1, r1, r0
	adds r0, r2, #0
	adds r0, #0xa
	lsls r0, r0, #6
	ldr r2, .L0807B610 @ =gUnk_0200E8A4
	adds r0, r0, r2
	adds r2, r7, r0
.L0807B604:
	cmp r5, r8
	blt .L0807B61C
	mov r0, sb
	strh r0, [r1]
	b .L0807B622
	.align 2, 0
.L0807B610: .4byte gUnk_0200E8A4
.L0807B614: .4byte gBg0Tm
.L0807B618: .4byte gBg1Tm
.L0807B61C:
	ldrh r0, [r2]
	strh r0, [r1]
	ldrh r0, [r4]
.L0807B622:
	strh r0, [r3]
	adds r4, #2
	adds r3, #2
	adds r2, #2
	adds r1, #2
	adds r5, #1
	cmp r5, #0xc
	ble .L0807B604
	mov r2, ip
	cmp r2, #7
	ble .L0807B5E2
	movs r0, #3
	bl EnableBgSync
	mov r1, sl
	cmp r1, #0xc
	ble .L0807B68A
	adds r1, r6, #0
	adds r1, #0x29
	movs r0, #0
	strb r0, [r1]
	adds r1, #1
	strb r0, [r1]
	adds r0, r6, #0
	bl func_fe6_08079A94
	adds r0, r6, #0
	bl Proc_Break
	ldr r1, .L0807B698 @ =gPrepUnitList
	adds r0, r6, #0
	adds r0, #0x30
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r0, [r0]
	ldrb r4, [r0, #4]
	bl ReorderPlayerUnitsBasedOnDeployment
	adds r0, r6, #0
	movs r1, #0
	bl func_fe6_0807A1C8
	adds r0, r6, #0
	adds r1, r4, #0
	movs r2, #1
	bl func_fe6_08079928
	adds r0, r6, #0
	bl PrepScreen_DrawScreenInfo
.L0807B68A:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0807B698: .4byte gPrepUnitList

	thumb_func_start func_fe6_0807B69C
func_fe6_0807B69C: @ 0x0807B69C
	ldr r2, .L0807B6B8 @ =gDispIo
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
	strb r0, [r2, #1]
	bx lr
	.align 2, 0
.L0807B6B8: .4byte gDispIo
