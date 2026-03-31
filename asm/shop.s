	.include "macro.inc"

	.syntax unified




	thumb_func_start ShopTryMoveCursor
ShopTryMoveCursor: @ 0x080978AC
	push {r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	adds r0, r2, #0
	adds r1, r7, #0
	adds r1, #8
	strb r0, [r1]
	ldr r0, [r7]
	cmp r0, #0
	bge .L080978C8
	movs r0, #0
	str r0, [r7]
.L080978C8:
	ldr r0, [r7]
	ldr r1, [r7, #4]
	cmp r0, r1
	blt .L080978D6
	ldr r0, [r7, #4]
	subs r1, r0, #1
	str r1, [r7]
.L080978D6:
	ldr r0, [r7]
	str r0, [r7, #0xc]
	ldr r1, .L08097920 @ =gKeySt
	ldr r0, [r1]
	ldrh r1, [r0, #6]
	movs r2, #0x40
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq .L0809792C
	ldr r0, [r7]
	cmp r0, #0
	bne .L08097924
	adds r0, r7, #0
	adds r0, #8
	movs r1, #0
	ldrsb r1, [r0, r1]
	cmp r1, #0
	beq .L0809791E
	ldr r1, .L08097920 @ =gKeySt
	ldr r0, [r1]
	ldrh r1, [r0, #8]
	movs r2, #0x40
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq .L0809791E
	ldr r0, [r7, #4]
	subs r1, r0, #1
	str r1, [r7]
.L0809791E:
	b .L0809792A
	.align 2, 0
.L08097920: .4byte gKeySt
.L08097924:
	ldr r0, [r7]
	subs r1, r0, #1
	str r1, [r7]
.L0809792A:
	b .L0809797E
.L0809792C:
	ldr r1, .L08097974 @ =gKeySt
	ldr r0, [r1]
	ldrh r1, [r0, #6]
	movs r2, #0x80
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq .L0809797E
	ldr r1, [r7, #4]
	subs r0, r1, #1
	ldr r1, [r7]
	cmp r1, r0
	bne .L08097978
	adds r0, r7, #0
	adds r0, #8
	movs r1, #0
	ldrsb r1, [r0, r1]
	cmp r1, #0
	beq .L08097972
	ldr r1, .L08097974 @ =gKeySt
	ldr r0, [r1]
	ldrh r1, [r0, #8]
	movs r2, #0x80
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq .L08097972
	movs r0, #0
	str r0, [r7]
.L08097972:
	b .L0809797E
	.align 2, 0
.L08097974: .4byte gKeySt
.L08097978:
	ldr r0, [r7]
	adds r1, r0, #1
	str r1, [r7]
.L0809797E:
	ldr r0, [r7, #0xc]
	ldr r1, [r7]
	cmp r0, r1
	beq .L08097998
	ldr r0, .L080979A0 @ =gPlaySt
	ldrb r1, [r0, #0x1d]
	lsls r2, r1, #0x1e
	lsrs r0, r2, #0x1f
	cmp r0, #0
	bne .L08097998
	movs r0, #0x66
	bl m4aSongNumStart
.L08097998:
	ldr r1, [r7]
	adds r0, r1, #0
	b .L080979A4
	.align 2, 0
.L080979A0: .4byte gPlaySt
.L080979A4:
	add sp, #0x10
	pop {r7}
	pop {r1}
	bx r1

	thumb_func_start ShopSt_SetHeadLocBak
ShopSt_SetHeadLocBak: @ 0x080979AC
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, .L080979C4 @ =gShopSt
	ldr r1, [r7]
	str r1, [r0]
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
.L080979C4: .4byte gShopSt

	thumb_func_start ShopTryScrollPage
ShopTryScrollPage: @ 0x080979C8
	push {r7, lr}
	sub sp, #0x14
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	str r3, [r7, #0xc]
	ldr r0, .L080979F0 @ =gShopSt
	ldr r1, [r0]
	str r1, [r7, #0x10]
	ldr r0, .L080979F0 @ =gShopSt
	ldr r1, [r7]
	str r1, [r0]
	ldr r0, [r7]
	ldr r1, [r7, #0x10]
	cmp r0, r1
	bne .L080979F4
	movs r0, #0
	b .L08097A4A
	.align 2, 0
.L080979F0: .4byte gShopSt
.L080979F4:
	ldr r0, [r7, #8]
	ldr r1, [r7, #4]
	cmp r0, r1
	ble .L08097A00
	movs r0, #0
	b .L08097A4A
.L08097A00:
	ldr r0, [r7]
	ldr r1, [r7, #0x10]
	cmp r0, r1
	bge .L08097A24
	ldr r0, [r7, #0xc]
	cmp r0, #0
	bne .L08097A12
	movs r0, #0
	b .L08097A4A
.L08097A12:
	ldr r0, [r7]
	ldr r1, [r7, #0xc]
	subs r0, r0, r1
	cmp r0, #0
	bgt .L08097A22
	movs r0, #1
	rsbs r0, r0, #0
	b .L08097A4A
.L08097A22:
	b .L08097A46
.L08097A24:
	ldr r0, [r7, #8]
	ldr r1, [r7, #0xc]
	adds r0, r0, r1
	ldr r1, [r7, #4]
	cmp r0, r1
	bne .L08097A34
	movs r0, #0
	b .L08097A4A
.L08097A34:
	ldr r0, [r7]
	ldr r1, [r7, #0xc]
	subs r0, r0, r1
	ldr r2, [r7, #8]
	subs r1, r2, #1
	cmp r0, r1
	blt .L08097A46
	movs r0, #1
	b .L08097A4A
.L08097A46:
	movs r0, #0
	b .L08097A4A
.L08097A4A:
	add sp, #0x14
	pop {r7}
	pop {r1}
	bx r1
	.align 2, 0
