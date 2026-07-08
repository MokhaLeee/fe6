	.include "macro.inc"

	.syntax unified

	.text


	thumb_func_start func_fe6_0808BFF0
func_fe6_0808BFF0: @ 0x0808BFF0
	push {r4, r5, lr}
	ldr r5, .L0808C074 @ =gSoundRoomText
	adds r0, r5, #0
	bl SetTextFont
	movs r0, #0
	bl SetTextFontGlyphs
	adds r4, r5, #0
	adds r4, #0x28
	adds r0, r4, #0
	movs r1, #0
	bl SpriteText_DrawBackgroundExt
	adds r0, r4, #0
	movs r1, #0
	bl Text_SetCursor
	adds r0, r4, #0
	movs r1, #0
	bl Text_SetColor
	ldr r1, .L0808C078 @ =String_Xmap_08336D3C
	adds r0, r4, #0
	bl Text_DrawString
	adds r4, #8
	adds r0, r4, #0
	movs r1, #0
	bl SpriteText_DrawBackgroundExt
	adds r0, r4, #0
	movs r1, #0
	bl Text_SetCursor
	adds r0, r4, #0
	movs r1, #0
	bl Text_SetColor
	ldr r1, .L0808C07C @ =String_Xmap_08336D48
	adds r0, r4, #0
	bl Text_DrawString
	adds r5, #0x38
	adds r0, r5, #0
	movs r1, #0
	bl SpriteText_DrawBackgroundExt
	adds r0, r5, #0
	movs r1, #0
	bl Text_SetCursor
	adds r0, r5, #0
	movs r1, #0
	bl Text_SetColor
	ldr r1, .L0808C080 @ =String_Xmap_08336D54
	adds r0, r5, #0
	bl Text_DrawString
	movs r0, #0
	bl SetTextFont
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0808C074: .4byte gSoundRoomText
.L0808C078: .4byte String_Xmap_08336D3C
.L0808C07C: .4byte String_Xmap_08336D48
.L0808C080: .4byte String_Xmap_08336D54

	thumb_func_start func_fe6_0808C084
func_fe6_0808C084: @ 0x0808C084
	ldr r1, [r0, #0x14]
	str r1, [r0, #0x2c]
	adds r1, r0, #0
	adds r1, #0x30
	movs r2, #0
	strb r2, [r1]
	adds r0, #0x31
	strb r2, [r0]
	bx lr
	.align 2, 0

	thumb_func_start func_fe6_0808C098
func_fe6_0808C098: @ 0x0808C098
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	str r0, [sp, #4]
	ldr r3, .L0808C300 @ =Sprite_0868A9E8
	movs r4, #0x80
	lsls r4, r4, #7
	str r4, [sp]
	movs r0, #0xb
	movs r1, #0x14
	movs r2, #0x4d
	bl PutSprite
	ldr r3, .L0808C304 @ =Sprite_0868A9F0
	str r4, [sp]
	movs r0, #0xb
	movs r1, #0x14
	movs r2, #0x61
	bl PutSprite
	ldr r3, .L0808C308 @ =Sprite_0868A9F8
	str r4, [sp]
	movs r0, #0xb
	movs r1, #0x14
	movs r2, #0x75
	bl PutSprite
	ldr r6, .L0808C30C @ =Sprite_0868A988
	ldr r0, [sp, #4]
	adds r0, #0x30
	ldrb r0, [r0]
	lsrs r0, r0, #3
	movs r1, #6
	bl __umodsi3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r4, #0xa0
	lsls r4, r4, #7
	adds r0, r0, r4
	str r0, [sp]
	movs r0, #0xb
	movs r1, #0x1a
	movs r2, #0x1a
	adds r3, r6, #0
	bl PutSpriteExt
	ldr r5, .L0808C310 @ =0x000010CE
	ldr r0, [sp, #4]
	adds r0, #0x31
	ldrb r0, [r0]
	lsrs r0, r0, #3
	movs r1, #6
	bl __umodsi3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r0, r0, r4
	str r0, [sp]
	movs r0, #0xb
	adds r1, r5, #0
	movs r2, #0x1a
	adds r3, r6, #0
	bl PutSpriteExt
	ldr r1, [sp, #4]
	ldr r0, [r1, #0x2c]
	ldrh r0, [r0, #0x2e]
	cmp r0, #0x30
	bhi .L0808C12C
	b .L0808C246
.L0808C12C:
	ldr r4, .L0808C314 @ =gSinLut
	movs r2, #0x80
	adds r2, r2, r4
	mov sb, r2
	movs r3, #0
	ldrsh r0, [r2, r3]
	lsls r0, r0, #4
	movs r1, #0x80
	lsls r1, r1, #1
	mov r8, r1
	bl Div
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	movs r2, #0
	ldrsh r0, [r4, r2]
	rsbs r0, r0, #0
	lsls r0, r0, #4
	ldr r3, [sp, #4]
	ldr r1, [r3, #0x2c]
	ldrh r1, [r1, #0x2e]
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
	movs r3, #0
	ldrsh r0, [r2, r3]
	lsls r0, r0, #4
	ldr r2, [sp, #4]
	ldr r1, [r2, #0x2c]
	ldrh r1, [r1, #0x2e]
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	movs r0, #0
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl SetObjAffine
	ldr r3, [sp, #4]
	ldr r0, [r3, #0x2c]
	adds r0, #0x41
	ldrb r0, [r0]
	movs r4, #0x18
	cmp r0, #0
	bne .L0808C1F6
	movs r4, #0x10
	ldr r0, .L0808C318 @ =gSoundRoomText + 0x40
	mov r8, r0
	movs r7, #0x40
	movs r6, #0x20
	movs r5, #4
.L0808C1B2:
	mov r1, r8
	ldrh r1, [r1]
	adds r0, r1, r7
	movs r2, #0x80
	lsls r2, r2, #5
	adds r0, r0, r2
	str r0, [sp]
	movs r0, #4
	adds r1, r6, #0
	movs r3, #0x88
	lsls r3, r3, #1
	adds r2, r4, r3
	ldr r3, .L0808C31C @ =Sprite_32x16
	bl PutSpriteExt
	adds r7, #4
	adds r6, #0x20
	subs r5, #1
	cmp r5, #0
	bge .L0808C1B2
	movs r0, #0x88
	lsls r0, r0, #1
	adds r2, r4, r0
	ldr r3, .L0808C320 @ =Sprite_16x16
	ldr r0, .L0808C324 @ =gSoundRoomText
	adds r0, #0x40
	ldrh r0, [r0]
	ldr r1, .L0808C328 @ =0x00001054
	adds r0, r0, r1
	str r0, [sp]
	movs r0, #4
	movs r1, #0xc0
	bl PutSpriteExt
.L0808C1F6:
	movs r5, #0
	ldr r7, .L0808C318 @ =gSoundRoomText + 0x40
	movs r6, #0x20
.L0808C1FC:
	lsls r0, r5, #2
	ldrh r2, [r7]
	adds r0, r2, r0
	movs r3, #0x80
	lsls r3, r3, #5
	adds r0, r0, r3
	str r0, [sp]
	movs r0, #4
	adds r1, r6, #0
	movs r3, #0x80
	lsls r3, r3, #1
	adds r2, r4, r3
	ldr r3, .L0808C31C @ =Sprite_32x16
	bl PutSpriteExt
	adds r6, #0x20
	adds r5, #1
	cmp r5, #4
	ble .L0808C1FC
	lsls r1, r5, #5
	adds r1, #0x20
	movs r0, #0x80
	lsls r0, r0, #1
	adds r2, r4, r0
	ldr r3, .L0808C320 @ =Sprite_16x16
	ldr r4, .L0808C324 @ =gSoundRoomText
	adds r4, #0x40
	lsls r0, r5, #2
	ldrh r4, [r4]
	adds r0, r4, r0
	movs r4, #0x80
	lsls r4, r4, #5
	adds r0, r0, r4
	str r0, [sp]
	movs r0, #4
	bl PutSpriteExt
.L0808C246:
	movs r4, #0
	ldr r0, [sp, #4]
	adds r0, #0x30
	str r0, [sp, #8]
	ldr r1, [sp, #4]
	adds r1, #0x31
	str r1, [sp, #0xc]
	ldr r2, .L0808C318 @ =gSoundRoomText + 0x40
	mov sl, r2
.L0808C258:
	asrs r1, r4, #1
	lsls r0, r4, #2
	lsls r7, r4, #6
	adds r3, r4, #1
	mov sb, r3
	adds r0, r0, r4
	lsls r0, r0, #2
	mov r8, r0
	movs r6, #0x80
	lsls r1, r1, #4
	adds r4, r1, #0
	adds r4, #0x28
	movs r5, #1
.L0808C272:
	mov r1, sl
	ldrh r1, [r1]
	adds r0, r1, r6
	adds r0, r0, r7
	str r0, [sp]
	movs r0, #4
	adds r1, r4, #0
	mov r2, r8
	adds r2, #0x4c
	ldr r3, .L0808C31C @ =Sprite_32x16
	bl PutSpriteExt
	adds r6, #4
	adds r4, #0x20
	subs r5, #1
	cmp r5, #0
	bge .L0808C272
	mov r4, sb
	cmp r4, #2
	ble .L0808C258
	ldr r1, [sp, #8]
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldr r2, [sp, #0xc]
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	ldr r3, [sp, #4]
	ldr r0, [r3, #0x2c]
	adds r0, #0x38
	ldrb r0, [r0]
	cmp r0, #0
	beq .L0808C2BC
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
.L0808C2BC:
	ldr r4, [sp, #4]
	ldr r0, [r4, #0x2c]
	adds r0, #0x39
	ldrb r0, [r0]
	cmp r0, #0
	beq .L0808C2CE
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
.L0808C2CE:
	ldr r0, [sp, #8]
	ldrb r1, [r0]
	lsrs r0, r1, #3
	cmp r0, #5
	bls .L0808C2E0
	adds r0, r1, #0
	subs r0, #0x30
	ldr r1, [sp, #8]
	strb r0, [r1]
.L0808C2E0:
	ldr r2, [sp, #0xc]
	ldrb r1, [r2]
	lsrs r0, r1, #3
	cmp r0, #5
	bls .L0808C2F0
	adds r0, r1, #0
	subs r0, #0x30
	strb r0, [r2]
.L0808C2F0:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0808C300: .4byte Sprite_0868A9E8
.L0808C304: .4byte Sprite_0868A9F0
.L0808C308: .4byte Sprite_0868A9F8
.L0808C30C: .4byte Sprite_0868A988
.L0808C310: .4byte 0x000010CE
.L0808C314: .4byte gSinLut
.L0808C318: .4byte gSoundRoomText + 0x40
.L0808C31C: .4byte Sprite_32x16
.L0808C320: .4byte Sprite_16x16
.L0808C324: .4byte gSoundRoomText
.L0808C328: .4byte 0x00001054

	thumb_func_start NewProc_0868AAA8
NewProc_0868AAA8: @ 0x0808C32C
	push {lr}
	adds r1, r0, #0
	ldr r0, .L0808C33C @ =ProcScr_0868AAA8
	bl SpawnProc
	pop {r1}
	bx r1
	.align 2, 0
.L0808C33C: .4byte ProcScr_0868AAA8
