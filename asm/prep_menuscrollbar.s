	.include "macro.inc"

	.syntax unified

	thumb_func_start MenuScroll_Init
MenuScroll_Init: @ 0x08081EE8
	adds r3, r0, #0
	adds r0, #0x2a
	movs r1, #0
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	movs r2, #0
	strh r1, [r3, #0x2e]
	strh r1, [r3, #0x32]
	adds r0, #8
	strb r2, [r0]
	ldrh r0, [r3, #0x2e]
	strh r0, [r3, #0x30]
	movs r0, #0xe4
	lsls r0, r0, #2
	strh r0, [r3, #0x36]
	movs r0, #0x80
	lsls r0, r0, #5
	strh r0, [r3, #0x38]
	adds r0, r3, #0
	adds r0, #0x3a
	strb r2, [r0]
	adds r0, #1
	strb r2, [r0]
	bx lr
	.align 2, 0

	thumb_func_start MenuScroll_Loop
MenuScroll_Loop: @ 0x08081F20
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x30
	adds r6, r0, #0
	adds r0, #0x34
	ldrh r1, [r6, #0x32]
	ldrb r0, [r0]
	cmp r1, r0
	bhi .L08081F3A
	b .L080822EC
.L08081F3A:
	movs r4, #0
	adds r0, r6, #0
	adds r0, #0x2c
	ldrb r2, [r0]
	lsrs r1, r2, #2
	str r0, [sp, #0x10]
	adds r3, r6, #0
	adds r3, #0x3a
	str r3, [sp, #0x18]
	adds r5, r6, #0
	adds r5, #0x3b
	str r5, [sp, #0x1c]
	cmp r4, r1
	bhs .L08081F84
.L08081F56:
	adds r0, r6, #0
	adds r0, #0x2a
	ldrb r1, [r0]
	adds r0, #1
	lsls r2, r4, #5
	ldrb r0, [r0]
	adds r2, r0, r2
	ldrh r7, [r6, #0x38]
	ldrh r3, [r6, #0x36]
	adds r0, r7, r3
	str r0, [sp]
	movs r0, #4
	ldr r3, .L080821E4 @ =Sprite_MenuScrollContainer
	bl PutSpriteExt
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r5, [sp, #0x10]
	ldrb r5, [r5]
	lsrs r0, r5, #2
	cmp r4, r0
	blo .L08081F56
.L08081F84:
	movs r7, #0
	lsls r1, r4, #2
	ldr r2, [sp, #0x10]
	ldrb r2, [r2]
	subs r0, r2, r1
	asrs r0, r0, #1
	adds r5, r1, #0
	cmp r7, r0
	bge .L08081FCE
.L08081F96:
	adds r0, r6, #0
	adds r0, #0x2a
	ldrb r1, [r0]
	adds r0, #1
	lsls r2, r7, #4
	ldrb r0, [r0]
	adds r2, r0, r2
	lsls r0, r4, #5
	adds r2, r2, r0
	mov r8, r2
	ldrh r3, [r6, #0x38]
	ldrh r2, [r6, #0x36]
	adds r0, r3, r2
	str r0, [sp]
	movs r0, #4
	mov r2, r8
	ldr r3, .L080821E8 @ =Sprite_08679580
	bl PutSpriteExt
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldr r3, [sp, #0x10]
	ldrb r3, [r3]
	subs r0, r3, r5
	asrs r0, r0, #1
	cmp r7, r0
	blt .L08081F96
.L08081FCE:
	movs r0, #0
	mov sb, r0
	lsls r1, r7, #1
	adds r0, r5, r1
	ldr r2, [sp, #0x10]
	ldrb r2, [r2]
	subs r0, r2, r0
	mov r8, r1
	adds r3, r4, r7
	mov sl, r3
	cmp sb, r0
	bge .L0808202A
.L08081FE6:
	adds r0, r6, #0
	adds r0, #0x2a
	ldrb r1, [r0]
	adds r0, #1
	mov r3, sb
	lsls r2, r3, #3
	ldrb r0, [r0]
	adds r2, r0, r2
	lsls r0, r7, #4
	adds r2, r2, r0
	lsls r0, r4, #5
	adds r2, r2, r0
	mov ip, r2
	ldrh r2, [r6, #0x38]
	ldrh r3, [r6, #0x36]
	adds r0, r2, r3
	str r0, [sp]
	movs r0, #4
	mov r2, ip
	ldr r3, .L080821EC @ =Sprite_08679578
	bl PutSpriteExt
	mov r0, sb
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
	mov r1, r8
	adds r0, r5, r1
	ldr r2, [sp, #0x10]
	ldrb r2, [r2]
	subs r0, r2, r0
	cmp sb, r0
	blt .L08081FE6
.L0808202A:
	mov r0, sl
	add r0, sb
	cmp r0, #0
	bgt .L08082034
	b .L0808229A
.L08082034:
	ldr r3, [sp, #0x10]
	ldrb r3, [r3]
	lsls r4, r3, #0x13
	ldrh r5, [r6, #0x2e]
	mov r8, r5
	ldrh r5, [r6, #0x32]
	adds r0, r6, #0
	adds r0, #0x34
	ldrb r7, [r0]
	str r0, [sp, #0x14]
	subs r0, #0xa
	str r0, [sp, #8]
	adds r1, r6, #0
	adds r1, #0x2b
	str r1, [sp, #0xc]
	cmp r5, r7
	bhi .L08082058
	b .L08082260
.L08082058:
	adds r0, r4, #0
	adds r1, r5, #0
	bl __udivsi3
	mov sb, r0
	adds r0, r4, #0
	muls r0, r7, r0
	adds r1, r5, #0
	bl __udivsi3
	adds r7, r0, #0
	mov r2, r8
	cmp r2, #0
	beq .L080820A2
	ldr r3, [sp, #8]
	ldrb r1, [r3]
	adds r1, #1
	movs r0, #0x80
	lsls r0, r0, #6
	orrs r1, r0
	ldr r4, [sp, #0xc]
	ldrb r2, [r4]
	subs r2, #8
	ldr r3, .L080821F0 @ =MenuScrollArrowSprites
	ldr r5, [sp, #0x18]
	ldrb r5, [r5]
	lsrs r0, r5, #3
	lsls r0, r0, #2
	adds r0, r0, r3
	ldr r3, [r0]
	ldrh r4, [r6, #0x38]
	ldrh r5, [r6, #0x36]
	adds r0, r4, r5
	str r0, [sp]
	movs r0, #4
	bl PutSpriteExt
.L080820A2:
	movs r4, #0
	lsrs r0, r7, #0x15
	str r0, [sp, #0x2c]
	mov r2, r8
	mov r1, sb
	muls r1, r2, r1
	str r1, [sp, #0x24]
	lsrs r7, r7, #0x10
	mov sl, r7
	cmp r4, r0
	bhs .L080820E4
.L080820B8:
	ldr r3, [sp, #8]
	ldrb r1, [r3]
	ldr r5, [sp, #0x24]
	lsrs r2, r5, #0x14
	ldr r7, [sp, #0xc]
	ldrb r7, [r7]
	adds r2, r7, r2
	lsls r0, r4, #5
	adds r2, r2, r0
	ldr r0, .L080821F4 @ =MenuScrollBarSegmentSprites
	ldr r3, [r0, #0x28]
	ldrh r5, [r6, #0x38]
	ldrh r7, [r6, #0x36]
	adds r0, r5, r7
	str r0, [sp]
	movs r0, #4
	bl PutSpriteExt
	adds r4, #1
	ldr r0, [sp, #0x2c]
	cmp r4, r0
	blo .L080820B8
.L080820E4:
	movs r7, #0
	lsls r5, r4, #5
	mov r1, sl
	subs r0, r1, r5
	lsrs r0, r0, #4
	str r5, [sp, #0x20]
	cmp r7, r0
	bhs .L08082132
.L080820F4:
	ldr r2, [sp, #8]
	ldrb r1, [r2]
	ldr r3, [sp, #0x24]
	lsrs r2, r3, #0x14
	ldr r4, [sp, #0xc]
	ldrb r4, [r4]
	adds r2, r4, r2
	mov r8, r5
	adds r2, r2, r5
	lsls r0, r7, #4
	adds r2, r2, r0
	ldr r0, .L080821F4 @ =MenuScrollBarSegmentSprites
	ldr r0, [r0, #0x24]
	mov sb, r0
	ldrh r3, [r6, #0x38]
	ldrh r4, [r6, #0x36]
	adds r0, r3, r4
	str r0, [sp]
	movs r0, #4
	mov r3, sb
	bl PutSpriteExt
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	mov r0, sl
	mov r1, r8
	subs r4, r0, r1
	lsrs r4, r4, #4
	cmp r7, r4
	blo .L080820F4
.L08082132:
	movs r2, #0
	mov sb, r2
	ldr r3, [sp, #0x20]
	mov r8, r3
	mov r4, sl
	subs r0, r4, r3
	lsls r7, r7, #4
	subs r0, r0, r7
	lsrs r0, r0, #3
	str r7, [sp, #4]
	cmp sb, r0
	bhs .L08082194
.L0808214A:
	ldr r5, [sp, #8]
	ldrb r1, [r5]
	ldr r0, [sp, #0x24]
	lsrs r2, r0, #0x14
	ldr r3, [sp, #0xc]
	ldrb r3, [r3]
	adds r2, r3, r2
	mov r4, r8
	str r4, [sp, #0x28]
	add r2, r8
	str r7, [sp, #0x2c]
	adds r2, r2, r7
	mov r5, sb
	lsls r0, r5, #3
	adds r2, r2, r0
	ldr r0, .L080821F4 @ =MenuScrollBarSegmentSprites
	ldr r3, [r0, #0x20]
	ldrh r4, [r6, #0x38]
	ldrh r5, [r6, #0x36]
	adds r0, r4, r5
	str r0, [sp]
	movs r0, #4
	bl PutSpriteExt
	mov r0, sb
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
	mov r0, sl
	ldr r1, [sp, #0x28]
	subs r4, r0, r1
	ldr r2, [sp, #0x2c]
	subs r4, r4, r2
	lsrs r4, r4, #3
	cmp sb, r4
	blo .L0808214A
.L08082194:
	ldrh r3, [r6, #0x2e]
	lsrs r0, r3, #4
	ldr r4, [sp, #0x14]
	ldrb r4, [r4]
	adds r0, r4, r0
	ldrh r5, [r6, #0x32]
	cmp r0, r5
	bne .L080821F8
	ldr r7, [sp, #8]
	ldrb r1, [r7]
	ldr r0, [sp, #0x24]
	lsrs r4, r0, #0x14
	ldr r3, [sp, #0xc]
	ldrb r3, [r3]
	adds r2, r3, r4
	ldr r5, [sp, #0x20]
	ldr r7, [sp, #4]
	adds r3, r5, r7
	mov r5, sb
	lsls r0, r5, #3
	adds r3, r3, r0
	adds r2, r2, r3
	ldr r7, .L080821F4 @ =MenuScrollBarSegmentSprites
	mov r8, r7
	ldr r5, [sp, #0x10]
	ldrb r5, [r5]
	lsls r0, r5, #3
	adds r4, r4, r3
	subs r0, r0, r4
	lsls r0, r0, #2
	add r0, r8
	ldr r3, [r0]
	ldrh r7, [r6, #0x38]
	ldrh r4, [r6, #0x36]
	adds r0, r7, r4
	str r0, [sp]
	movs r0, #4
	bl PutSpriteExt
	b .L08082260
	.align 2, 0
.L080821E4: .4byte Sprite_MenuScrollContainer
.L080821E8: .4byte Sprite_08679580
.L080821EC: .4byte Sprite_08679578
.L080821F0: .4byte MenuScrollArrowSprites
.L080821F4: .4byte MenuScrollBarSegmentSprites
.L080821F8:
	ldr r5, [sp, #8]
	ldrb r1, [r5]
	ldr r7, [sp, #0x24]
	lsrs r2, r7, #0x14
	ldr r0, [sp, #0xc]
	ldrb r0, [r0]
	adds r2, r0, r2
	ldr r3, [sp, #0x20]
	ldr r4, [sp, #4]
	adds r0, r3, r4
	mov r5, sb
	lsls r3, r5, #3
	adds r0, r0, r3
	adds r2, r2, r0
	ldr r3, .L080822FC @ =MenuScrollBarSegmentSprites
	movs r0, #7
	mov r7, sl
	ands r7, r0
	lsls r0, r7, #2
	adds r0, r0, r3
	ldr r3, [r0]
	ldrh r4, [r6, #0x38]
	ldrh r5, [r6, #0x36]
	adds r0, r4, r5
	str r0, [sp]
	movs r0, #4
	bl PutSpriteExt
	ldr r7, [sp, #8]
	ldrb r1, [r7]
	adds r1, #1
	ldr r0, [sp, #0x10]
	ldrb r0, [r0]
	lsls r2, r0, #3
	ldr r3, [sp, #0xc]
	ldrb r3, [r3]
	adds r2, r3, r2
	adds r2, #1
	ldr r3, .L08082300 @ =MenuScrollArrowSprites
	ldr r4, [sp, #0x1c]
	ldrb r4, [r4]
	lsrs r0, r4, #3
	lsls r0, r0, #2
	adds r0, r0, r3
	ldr r3, [r0]
	ldrh r5, [r6, #0x38]
	ldrh r7, [r6, #0x36]
	adds r0, r5, r7
	str r0, [sp]
	movs r0, #4
	bl PutSpriteExt
.L08082260:
	ldr r0, [sp, #8]
	ldrb r1, [r0]
	ldr r3, [sp, #0xc]
	ldrb r2, [r3]
	subs r2, #8
	ldr r3, .L08082304 @ =Sprite_08679590
	ldrh r4, [r6, #0x38]
	ldrh r5, [r6, #0x36]
	adds r0, r4, r5
	str r0, [sp]
	movs r0, #4
	bl PutSpriteExt
	ldr r7, [sp, #8]
	ldrb r1, [r7]
	ldr r0, [sp, #0x10]
	ldrb r0, [r0]
	lsls r2, r0, #3
	ldr r3, [sp, #0xc]
	ldrb r3, [r3]
	adds r2, r3, r2
	ldr r3, .L08082308 @ =Sprite_08679598
	ldrh r4, [r6, #0x38]
	ldrh r5, [r6, #0x36]
	adds r0, r4, r5
	str r0, [sp]
	movs r0, #4
	bl PutSpriteExt
.L0808229A:
	ldrh r1, [r6, #0x30]
	ldrh r0, [r6, #0x2e]
	cmp r1, r0
	beq .L080822C2
	cmp r1, r0
	bls .L080822AE
	ldr r7, [sp, #0x18]
	ldrb r0, [r7]
	adds r0, #1
	strb r0, [r7]
.L080822AE:
	ldrh r0, [r6, #0x30]
	ldrh r1, [r6, #0x2e]
	cmp r0, r1
	bhs .L080822BE
	ldr r2, [sp, #0x1c]
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
.L080822BE:
	ldrh r0, [r6, #0x2e]
	strh r0, [r6, #0x30]
.L080822C2:
	ldr r3, [sp, #0x18]
	ldrb r0, [r3]
	adds r0, #1
	movs r1, #0
	strb r0, [r3]
	ldr r4, [sp, #0x1c]
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	ldrb r5, [r3]
	lsrs r0, r5, #3
	cmp r0, #5
	bls .L080822DE
	strb r1, [r3]
.L080822DE:
	ldr r7, [sp, #0x1c]
	ldrb r7, [r7]
	lsrs r0, r7, #3
	cmp r0, #5
	bls .L080822EC
	ldr r0, [sp, #0x1c]
	strb r1, [r0]
.L080822EC:
	add sp, #0x30
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L080822FC: .4byte MenuScrollBarSegmentSprites
.L08082300: .4byte MenuScrollArrowSprites
.L08082304: .4byte Sprite_08679590
.L08082308: .4byte Sprite_08679598
