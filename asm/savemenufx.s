	.include "macro.inc"

	.syntax unified

	thumb_func_start func_fe6_0808AA84
func_fe6_0808AA84: @ 0x0808AA84
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x46
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	bgt .L0808AB34
	movs r0, #4
	strb r0, [r1]
	ldr r0, .L0808AAD0 @ =0x0203DBE8
	bl SetTextFont
	movs r0, #1
	bl SetTextFontGlyphs
	movs r6, #0
	adds r0, r4, #0
	adds r0, #0x45
	adds r7, r0, #0
	ldrb r0, [r7]
	cmp r6, r0
	bge .L0808AB2E
	adds r5, r4, #0
	adds r5, #0x44
.L0808AABA:
	ldr r0, [r4, #0x40]
	ldrb r2, [r0]
	adds r3, r0, #0
	cmp r2, #3
	bgt .L0808AAD4
	cmp r2, #1
	bge .L0808AAE4
	cmp r2, #0
	beq .L0808AADA
	b .L0808AB06
	.align 2, 0
.L0808AAD0: .4byte 0x0203DBE8
.L0808AAD4:
	cmp r2, #4
	beq .L0808AB00
	b .L0808AB06
.L0808AADA:
	movs r0, #0
	bl SetTextFont
	movs r0, #1
	b .L0808AB36
.L0808AAE4:
	adds r0, r3, #1
	str r0, [r4, #0x40]
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	adds r1, r4, #0
	adds r1, #0x46
	movs r0, #8
	strb r0, [r1]
	ldrb r1, [r5]
	cmp r1, #5
	bne .L0808AB26
	movs r0, #1
	b .L0808AB36
.L0808AB00:
	adds r0, r3, #1
	str r0, [r4, #0x40]
	b .L0808AB26
.L0808AB06:
	ldrb r1, [r5]
	lsls r0, r1, #3
	ldr r1, .L0808AB3C @ =0x0203DC10
	adds r0, r0, r1
	adds r1, r3, #0
	bl Text_DrawCharacter
	str r0, [r4, #0x40]
	ldr r0, .L0808AB40 @ =gPlaySt
	ldrb r0, [r0, #0x1d]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L0808AB26
	movs r0, #0x6e
	bl m4aSongNumStart
.L0808AB26:
	adds r6, #1
	ldrb r0, [r7]
	cmp r6, r0
	blt .L0808AABA
.L0808AB2E:
	movs r0, #0
	bl SetTextFont
.L0808AB34:
	movs r0, #0
.L0808AB36:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
.L0808AB3C: .4byte 0x0203DC10
.L0808AB40: .4byte gPlaySt

	thumb_func_start func_fe6_0808AB44
func_fe6_0808AB44: @ 0x0808AB44
	ldr r0, .L0808AB60 @ =0x04000006
	ldrh r0, [r0]
	adds r1, r0, #0
	cmp r0, #0x20
	bne .L0808AB6C
	ldr r1, .L0808AB64 @ =0x04000050
	movs r0, #0xcf
	strh r0, [r1]
	adds r1, #4
	ldr r0, .L0808AB68 @ =0x0203DC6C
	ldrb r0, [r0]
	lsrs r0, r0, #1
	b .L0808ABC8
	.align 2, 0
.L0808AB60: .4byte 0x04000006
.L0808AB64: .4byte 0x04000050
.L0808AB68: .4byte 0x0203DC6C
.L0808AB6C:
	cmp r0, #0x78
	bne .L0808AB7C
	ldr r1, .L0808AB78 @ =0x04000050
	movs r0, #0
	b .L0808ABC8
	.align 2, 0
.L0808AB78: .4byte 0x04000050
.L0808AB7C:
	cmp r0, #0x84
	bne .L0808ABB8
	ldr r1, .L0808ABA8 @ =0x04000050
	movs r0, #0xcf
	strh r0, [r1]
	ldr r3, .L0808ABAC @ =0x04000040
	ldr r0, .L0808ABB0 @ =0x0203DC6D
	ldrb r2, [r0]
	movs r0, #0xa
	subs r0, r0, r2
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #0xa
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r0, #0x78
	adds r1, r1, r0
	strh r1, [r3]
	ldr r1, .L0808ABB4 @ =0x0400004A
	movs r0, #0xf
	b .L0808ABC8
	.align 2, 0
.L0808ABA8: .4byte 0x04000050
.L0808ABAC: .4byte 0x04000040
.L0808ABB0: .4byte 0x0203DC6D
.L0808ABB4: .4byte 0x0400004A
.L0808ABB8:
	cmp r1, #0x98
	bne .L0808ABCA
	ldr r1, .L0808ABCC @ =0x04000050
	movs r0, #0
	strh r0, [r1]
	subs r1, #6
	ldr r2, .L0808ABD0 @ =0x0000FFFF
	adds r0, r2, #0
.L0808ABC8:
	strh r0, [r1]
.L0808ABCA:
	bx lr
	.align 2, 0
.L0808ABCC: .4byte 0x04000050
.L0808ABD0: .4byte 0x0000FFFF
