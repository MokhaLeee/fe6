	.include "macro.inc"

	.syntax unified

	.section .data


	.global Sprite_0868A9E8
Sprite_0868A9E8: @ 0868A9E8
	.incbin "fe6-base.gba", 0x68A9E8, (0x68A9F0 - 0x68A9E8) @ length: 0008

	.global Sprite_0868A9F0
Sprite_0868A9F0: @ 0868A9F0
	.incbin "fe6-base.gba", 0x68A9F0, (0x68A9F8 - 0x68A9F0) @ length: 0008

	.global Sprite_0868A9F8
Sprite_0868A9F8: @ 0868A9F8
	.incbin "fe6-base.gba", 0x68A9F8, (0x68AA08 - 0x68A9F8) @ length: 0010

	.global ProcScr_SoundRoom
ProcScr_SoundRoom: @ 0868AA08
	.incbin "fe6-base.gba", 0x68AA08, (0x68AA80 - 0x68AA08) @ length: 0078

	.global ProcScr_0868AA80
ProcScr_0868AA80: @ 0868AA80
	.incbin "fe6-base.gba", 0x68AA80, (0x68AAA8 - 0x68AA80) @ length: 0028

	.global ProcScr_0868AAA8
ProcScr_0868AAA8: @ 0868AAA8
	.incbin "fe6-base.gba", 0x68AAA8, (0x68AAC8 - 0x68AAA8) @ length: 0020

    .text

	thumb_func_start func_fe6_0808BCBC
func_fe6_0808BCBC: @ 0x0808BCBC
	push {r4, r5, lr}
	adds r5, r0, #0
	ldrh r4, [r5, #0x2c]
	adds r4, #1
	strh r4, [r5, #0x2c]
	movs r0, #6
	subs r0, r0, r4
	lsls r0, r0, #8
	movs r1, #6
	bl __divsi3
	strh r0, [r5, #0x2e]
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	cmp r4, #6
	bne .L0808BCE8
	adds r0, r5, #0
	bl func_fe6_0808BF00
	adds r0, r5, #0
	bl Proc_Break
.L0808BCE8:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_fe6_0808BCF0
func_fe6_0808BCF0: @ 0x0808BCF0
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldrh r4, [r5, #0x2c]
	subs r4, #1
	movs r6, #0
	strh r4, [r5, #0x2c]
	movs r0, #6
	subs r0, r0, r4
	lsls r0, r0, #8
	movs r1, #6
	bl __divsi3
	strh r0, [r5, #0x2e]
	lsls r4, r4, #0x10
	cmp r4, #0
	bne .L0808BD20
	adds r0, r5, #0
	bl Proc_Break
	adds r0, r5, #0
	adds r0, #0x38
	strb r6, [r0]
	adds r0, #1
	strb r6, [r0]
.L0808BD20:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_fe6_0808BD28
func_fe6_0808BD28: @ 0x0808BD28
	push {lr}
	ldr r3, .L0808BD54 @ =gDispIo
	movs r1, #2
	rsbs r1, r1, #0
	ldrb r2, [r3, #1]
	ands r1, r2
	movs r2, #3
	rsbs r2, r2, #0
	ands r1, r2
	subs r2, #2
	ands r1, r2
	subs r2, #4
	ands r1, r2
	subs r2, #8
	ands r1, r2
	strb r1, [r3, #1]
	ldr r0, [r0, #0x3c]
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
.L0808BD54: .4byte gDispIo

	thumb_func_start SaveMenu_ExecSoundroom
SaveMenu_ExecSoundroom: @ 0x0808BD58
	push {lr}
	adds r1, r0, #0
	ldr r0, .L0808BD68 @ =ProcScr_SoundRoom
	bl SpawnProcLocking
	pop {r1}
	bx r1
	.align 2, 0
.L0808BD68: .4byte ProcScr_SoundRoom

	thumb_func_start func_fe6_0808BD6C
func_fe6_0808BD6C: @ 0x0808BD6C
	movs r1, #0
	strh r1, [r0, #0x2c]
	ldr r1, [r0, #0x14]
	ldr r1, [r1, #0x30]
	str r1, [r0, #0x30]
	bx lr

	thumb_func_start func_fe6_0808BD78
func_fe6_0808BD78: @ 0x0808BD78
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldrh r4, [r6, #0x2c]
	adds r4, #1
	movs r3, #0
	strh r4, [r6, #0x2c]
	ldr r5, .L0808BDEC @ =gDispIo
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
	strb r3, [r0]
	adds r0, #1
	strb r3, [r0]
	ldrh r0, [r6, #0x2c]
	movs r1, #3
	bl __udivsi3
	adds r1, r5, #0
	adds r1, #0x46
	strb r0, [r1]
	ldr r0, .L0808BDF0 @ =0x0000FFE0
	ldrh r1, [r5, #0x3c]
	ands r0, r1
	movs r1, #4
	orrs r0, r1
	strh r0, [r5, #0x3c]
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	cmp r4, #0x30
	bne .L0808BDE4
	ldr r2, .L0808BDF4 @ =gSoundRoomInfo
	ldr r1, [r6, #0x30]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r0, [r0]
	movs r1, #0
	bl StartBgm
	bl GetGameTime
	bl PutSoundRoomCG
	adds r0, r6, #0
	bl Proc_Break
.L0808BDE4:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L0808BDEC: .4byte gDispIo
.L0808BDF0: .4byte 0x0000FFE0
.L0808BDF4: .4byte gSoundRoomInfo

	thumb_func_start func_fe6_0808BDF8
func_fe6_0808BDF8: @ 0x0808BDF8
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	ldrh r4, [r6, #0x2c]
	subs r4, #1
	movs r7, #0
	strh r4, [r6, #0x2c]
	ldr r5, .L0808BE54 @ =gDispIo
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
	strb r7, [r0]
	adds r0, #1
	strb r7, [r0]
	ldrh r0, [r6, #0x2c]
	movs r1, #3
	bl __udivsi3
	adds r1, r5, #0
	adds r1, #0x46
	strb r0, [r1]
	ldr r0, .L0808BE58 @ =0x0000FFE0
	ldrh r1, [r5, #0x3c]
	ands r0, r1
	movs r1, #4
	orrs r0, r1
	strh r0, [r5, #0x3c]
	lsls r4, r4, #0x10
	cmp r4, #0
	bne .L0808BE4C
	adds r0, r6, #0
	bl Proc_Break
	ldr r0, [r6, #0x14]
	adds r0, #0x40
	strb r7, [r0]
.L0808BE4C:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0808BE54: .4byte gDispIo
.L0808BE58: .4byte 0x0000FFE0

	thumb_func_start NewProc_0868AA80
NewProc_0868AA80: @ 0x0808BE5C
	push {lr}
	adds r1, r0, #0
	ldr r0, .L0808BE6C @ =ProcScr_0868AA80
	bl SpawnProc
	pop {r1}
	bx r1
	.align 2, 0
.L0808BE6C: .4byte ProcScr_0868AA80

	thumb_func_start func_fe6_0808BE70
func_fe6_0808BE70: @ 0x0808BE70
	push {r4, r5, r6, lr}
	ldr r6, .L0808BEE8 @ =0x06014000
	ldr r4, .L0808BEEC @ =gSoundRoomText
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #5
	bl InitSpriteTextFont
	ldr r0, .L0808BEF0 @ =Pal_Text
	movs r5, #0xd0
	lsls r5, r5, #2
	adds r1, r5, #0
	movs r2, #0x40
	bl ApplyPaletteExt
	ldr r0, .L0808BEF4 @ =gPal
	adds r0, r0, r5
	movs r1, #0
	strh r1, [r0]
	bl EnablePalSync
	adds r0, r4, #0
	bl SetTextFont
	adds r0, r4, #0
	adds r0, #0x18
	bl InitSpriteText
	adds r0, r4, #0
	adds r0, #0x20
	bl InitSpriteText
	adds r4, #0x28
	movs r5, #2
.L0808BEB4:
	adds r0, r4, #0
	bl InitSpriteText
	adds r4, #8
	subs r5, #1
	cmp r5, #0
	bge .L0808BEB4
	movs r0, #0
	bl SetTextFont
	ldr r2, .L0808BEEC @ =gSoundRoomText
	ldr r0, .L0808BEF8 @ =0x0001FFFF
	ands r0, r6
	lsrs r0, r0, #5
	ldr r3, .L0808BEFC @ =0x000003FF
	adds r1, r3, #0
	ands r0, r1
	movs r3, #0xa0
	lsls r3, r3, #8
	adds r1, r3, #0
	adds r0, r0, r1
	adds r2, #0x40
	strh r0, [r2]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L0808BEE8: .4byte 0x06014000
.L0808BEEC: .4byte gSoundRoomText
.L0808BEF0: .4byte Pal_Text
.L0808BEF4: .4byte gPal
.L0808BEF8: .4byte 0x0001FFFF
.L0808BEFC: .4byte 0x000003FF

	thumb_func_start func_fe6_0808BF00
func_fe6_0808BF00: @ 0x0808BF00
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r7, r0, #0
	ldr r0, [r7, #0x30]
	mov r8, r0
	ldr r6, .L0808BF90 @ =gSoundRoomText
	adds r0, r6, #0
	bl SetTextFont
	movs r0, #1
	bl SetTextFontGlyphs
	mov r1, r8
	lsls r0, r1, #1
	add r0, r8
	lsls r0, r0, #2
	mov sb, r0
	ldr r5, .L0808BF94 @ =gSoundRoomInfo
	adds r5, #4
	add r5, sb
	ldr r0, [r5]
	bl DecodeMsg
	add r1, sp, #4
	mov sl, r1
	mov r1, sp
	mov r2, sl
	bl func_fe6_08071C00
	adds r4, r6, #0
	adds r4, #0x18
	adds r0, r4, #0
	movs r1, #0
	bl SpriteText_DrawBackgroundExt
	ldr r0, [sp]
	movs r1, #0xb0
	subs r1, r1, r0
	lsrs r0, r1, #0x1f
	adds r1, r1, r0
	asrs r1, r1, #1
	adds r0, r4, #0
	bl Text_SetCursor
	adds r0, r4, #0
	movs r1, #0
	bl Text_SetColor
	ldr r0, [r5]
	bl DecodeMsg
	adds r1, r0, #0
	adds r0, r4, #0
	bl Text_DrawString
	adds r6, #0x20
	adds r0, r6, #0
	movs r1, #0
	bl SpriteText_DrawBackgroundExt
	mov r0, r8
	cmp r0, #0
	bne .L0808BF98
	adds r1, r7, #0
	adds r1, #0x41
	movs r0, #1
	strb r0, [r1]
	b .L0808BFD6
	.align 2, 0
.L0808BF90: .4byte gSoundRoomText
.L0808BF94: .4byte gSoundRoomInfo
.L0808BF98:
	adds r1, r7, #0
	adds r1, #0x41
	movs r0, #0
	strb r0, [r1]
	ldr r4, .L0808BFEC @ =gSoundRoomInfo
	adds r4, #8
	add r4, sb
	ldr r0, [r4]
	bl DecodeMsg
	mov r1, sp
	mov r2, sl
	bl func_fe6_08071C00
	ldr r0, [sp]
	movs r1, #0xa8
	subs r1, r1, r0
	adds r0, r6, #0
	bl Text_SetCursor
	adds r0, r6, #0
	movs r1, #0
	bl Text_SetColor
	ldr r0, [r4]
	bl DecodeMsg
	adds r1, r0, #0
	adds r0, r6, #0
	bl Text_DrawString
.L0808BFD6:
	movs r0, #0
	bl SetTextFont
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0808BFEC: .4byte gSoundRoomInfo

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
	ldr r0, .L0808C318 @ =gSoundRoom_020004A8
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
	ldr r7, .L0808C318 @ =gSoundRoom_020004A8
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
	ldr r2, .L0808C318 @ =gSoundRoom_020004A8
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
.L0808C318: .4byte gSoundRoom_020004A8
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
