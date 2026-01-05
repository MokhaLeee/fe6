	.include "macro.inc"

	.syntax unified

	thumb_func_start PrepBgScrolling_Init
PrepBgScrolling_Init: @ 0x080823F4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r7, r0, #0
	ldr r4, .L0808248C @ =gBg3Tm
	adds r0, r4, #0
	movs r1, #0
	bl TmFill
	ldr r0, .L08082490 @ =Tsa_MonologueScrollingBG
	mov sb, r0
	movs r0, #0
	movs r1, #0x2c
	adds r1, r1, r7
	mov sl, r1
	mov ip, r4
	movs r3, #0x27
	mov r8, r3
	movs r1, #0xa0
	lsls r1, r1, #8
	adds r4, r1, #0
.L08082422:
	movs r2, #0
	adds r6, r0, #1
	lsls r5, r0, #6
	mov r3, r8
	subs r1, r3, r0
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	mov r1, sb
	adds r3, r0, r1
.L08082436:
	lsls r0, r2, #1
	adds r1, r5, r0
	add r1, ip
	adds r0, r0, r3
	ldrh r0, [r0]
	adds r0, r4, r0
	strh r0, [r1]
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0x1d
	bls .L08082436
	lsls r0, r6, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x1f
	bls .L08082422
	movs r0, #8
	bl EnableBgSync
	movs r6, #0
	movs r5, #0
	strh r5, [r7, #0x2a]
	movs r4, #0xff
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r0, .L08082494 @ =0x0400001E
	ldrh r3, [r7, #0x2a]
	ands r4, r3
	strh r4, [r0]
	mov r0, sl
	strb r6, [r0]
	strh r5, [r7, #0x2a]
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0808248C: .4byte gBg3Tm
.L08082490: .4byte Tsa_MonologueScrollingBG
.L08082494: .4byte 0x0400001E

	thumb_func_start PrepBgScrolling_Loop
PrepBgScrolling_Loop: @ 0x08082498
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r6, r5, #0
	adds r6, #0x2c
	ldrb r0, [r6]
	cmp r0, #3
	bne .L080824D6
	ldrh r0, [r5, #0x2a]
	adds r0, #1
	strh r0, [r5, #0x2a]
	lsls r0, r0, #0x10
	movs r1, #0xa0
	lsls r1, r1, #0x13
	cmp r0, r1
	bne .L080824BA
	movs r0, #0
	strh r0, [r5, #0x2a]
.L080824BA:
	movs r4, #0xff
	adds r2, r4, #0
	ldrh r1, [r5, #0x2a]
	ands r2, r1
	movs r0, #3
	movs r1, #0
	bl SetBgOffset
	ldr r0, .L0808254C @ =0x0400001E
	ldrh r1, [r5, #0x2a]
	ands r4, r1
	strh r4, [r0]
	movs r0, #0
	strb r0, [r6]
.L080824D6:
	adds r1, r5, #0
	adds r1, #0x2c
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]

	ldrh r1, [r5, #0x2a]
	movs r0, #7
	ands r0, r1
	cmp r0, #0
	bne .L08082544

	ldr r5, .L08082550 @ =Tsa_MonologueScrollingBG

	@ (proc->pos / 8 - 1) & 0x1F
	lsrs r0, r1, #3
	subs r4, r0, #1
	movs r1, #0x1f
	ands r4, r1

	@ (proc->pos * 8 + 30) % 40
	adds r0, #0x1e
	movs r1, #0x28
	bl __modsi3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18

	movs r2, #0

	ldr r1, .L08082554 @ =gBg3Tm
	mov ip, r1

	lsls r4, r4, #6
	mov r7, ip

	@ (40 - (30 % 40) - 1)
	movs r1, #0x27
	subs r1, r1, r0
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r3, r0, r5
	movs r0, #0xa0
	lsls r0, r0, #8
	adds r6, r0, #0
	adds r5, r4, #0
.L0808251E:
	lsls r0, r2, #1
	adds r1, r4, r0
	adds r1, r1, r7
	adds r0, r0, r3
	ldrh r0, [r0]
	adds r0, r6, r0
	strh r0, [r1]
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0x1d
	bls .L0808251E
	mov r1, ip
	adds r0, r5, r1
	ldr r1, .L08082558 @ =0x06007800
	adds r1, r5, r1
	movs r2, #0xf
	bl CpuFastSet
.L08082544:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0808254C: .4byte 0x0400001E
.L08082550: .4byte Tsa_MonologueScrollingBG
.L08082554: .4byte gBg3Tm
.L08082558: .4byte 0x06007800
