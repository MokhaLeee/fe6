	.include "macro.inc"

	.syntax unified

	thumb_func_start StartWmSpriteDisp
StartWmSpriteDisp: @ 0x0809331C
	push {r4, r5, r6, lr}
	adds r3, r0, #0
	movs r1, #0
	movs r0, #0
	strh r0, [r3, #0x2a]
	strh r0, [r3, #0x2c]
	adds r0, r3, #0
	adds r0, #0x2e
	strb r1, [r0]
	ldr r6, .L08093388 @ =ProcScr_WmSpriteDisp
	movs r4, #0
	movs r2, #3
	adds r1, r3, #0
	adds r1, #0x3c
.L08093338:
	str r4, [r1]
	subs r1, #4
	subs r2, #1
	cmp r2, #0
	bge .L08093338
	adds r4, r3, #0
	adds r4, #0x50
	adds r5, r3, #0
	adds r5, #0x48
	adds r2, r3, #0
	adds r2, #0x40
	movs r0, #0
	adds r1, r3, #0
	adds r1, #0x44
.L08093354:
	str r0, [r1]
	subs r1, #4
	cmp r1, r2
	bge .L08093354
	adds r2, r4, #0
	movs r0, #0
	adds r1, r2, #4
.L08093362:
	str r0, [r1]
	subs r1, #4
	cmp r1, r2
	bge .L08093362
	adds r2, r5, #0
	movs r0, #0
	adds r1, r2, #4
.L08093370:
	str r0, [r1]
	subs r1, #4
	cmp r1, r2
	bge .L08093370
	adds r0, r6, #0
	adds r1, r3, #0
	bl SpawnProc
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08093388: .4byte ProcScr_WmSpriteDisp

	thumb_func_start WmSpriteDisp_Init
WmSpriteDisp_Init: @ 0x0809338C
	adds r0, #0x64
	movs r1, #0
	strh r1, [r0]
	bx lr

	thumb_func_start WmSpriteDisp_Loop
WmSpriteDisp_Loop: @ 0x08093394
	push {r4, lr}
	sub sp, #0x38
	adds r4, r0, #0
	ldr r1, .L080933EC @ =gUnk_08354728
	mov r0, sp
	movs r2, #0x37
	bl memcpy
	adds r4, #0x64
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	movs r1, #0
	ldrsh r0, [r4, r1]
	add r0, sp
	ldrb r0, [r0]
	cmp r0, #0xff
	bne .L080933BC
	movs r0, #0
	strh r0, [r4]
.L080933BC:
	movs r1, #0
	ldrsh r0, [r4, r1]
	add r0, sp
	ldrb r0, [r0]
	lsls r4, r0, #5
	ldr r0, .L080933F0 @ =gUnk_082D37E4
	adds r0, r4, r0
	movs r1, #0x80
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, .L080933F4 @ =gUnk_082D3764
	adds r4, r4, r0
	movs r1, #0x88
	lsls r1, r1, #2
	adds r0, r4, #0
	movs r2, #0x20
	bl ApplyPaletteExt
	add sp, #0x38
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L080933EC: .4byte gUnk_08354728
.L080933F0: .4byte gUnk_082D37E4
.L080933F4: .4byte gUnk_082D3764

	thumb_func_start StartWmSprite
StartWmSprite: @ 0x080933F8
	push {lr}
	ldr r0, .L08093430 @ =Img_WorldMapStuff
	ldr r1, .L08093434 @ =0x06016200
	bl Decompress
	ldr r0, .L08093438 @ =Pal_WorldMapStuff
	movs r1, #0x80
	lsls r1, r1, #2
	movs r2, #0x80
	bl ApplyPaletteExt
	ldr r0, .L0809343C @ =Pal_WorldMap_082D3864
	movs r1, #0xa0
	lsls r1, r1, #2
	movs r2, #0x40
	bl ApplyPaletteExt
	bl ResetWmArrowSt
	ldr r0, .L08093440 @ =ProcScr_WmSprite
	movs r1, #3
	bl SpawnProc
	bl func_fe6_080934A0
	pop {r0}
	bx r0
	.align 2, 0
.L08093430: .4byte Img_WorldMapStuff
.L08093434: .4byte 0x06016200
.L08093438: .4byte Pal_WorldMapStuff
.L0809343C: .4byte Pal_WorldMap_082D3864
.L08093440: .4byte ProcScr_WmSprite

	thumb_func_start WmSpriteExists
WmSpriteExists: @ 0x08093444
	push {lr}
	ldr r0, .L08093458 @ =ProcScr_WmSprite
	bl FindProc
	cmp r0, #0
	beq .L08093452
	movs r0, #1
.L08093452:
	pop {r1}
	bx r1
	.align 2, 0
.L08093458: .4byte ProcScr_WmSprite

	thumb_func_start func_fe6_0809345C
func_fe6_0809345C: @ 0x0809345C
	push {lr}
	movs r0, #8
	bl Proc_EndEachMarked
	bl EndEachSpriteAnimProc
	bl EndPutTalkSpriteText
	ldr r0, .L08093478 @ =ProcScr_WmSprite
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
.L08093478: .4byte ProcScr_WmSprite

	thumb_func_start func_fe6_0809347C
func_fe6_0809347C: @ 0x0809347C
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, .L0809349C @ =ProcScr_WmSprite
	bl FindProc
	subs r4, #0x78
	strh r4, [r0, #0x2a]
	subs r5, #0x50
	strh r5, [r0, #0x2c]
	adds r0, #0x2e
	movs r1, #1
	strb r1, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0809349C: .4byte ProcScr_WmSprite

	thumb_func_start func_fe6_080934A0
func_fe6_080934A0: @ 0x080934A0
	push {lr}
	ldr r0, .L080934B8 @ =ProcScr_WmSprite
	bl FindProc
	movs r2, #0
	movs r1, #0
	strh r1, [r0, #0x2a]
	strh r1, [r0, #0x2c]
	adds r0, #0x2e
	strb r2, [r0]
	pop {r0}
	bx r0
	.align 2, 0
.L080934B8: .4byte ProcScr_WmSprite

	thumb_func_start DisplayWmArrow
DisplayWmArrow: @ 0x080934BC
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r5, r0, #0
	adds r6, r1, #0
	ldr r0, .L08093510 @ =ProcScr_WmSprite
	bl FindProc
	lsls r1, r5, #1
	adds r1, r1, r5
	lsls r1, r1, #2
	ldr r2, .L08093514 @ =gWmArrowConf
	adds r2, r1, r2
	movs r3, #4
	ldrsh r1, [r2, r3]
	ldrh r7, [r0, #0x2a]
	subs r4, r1, r7
	movs r3, #6
	ldrsh r1, [r2, r3]
	ldrh r7, [r0, #0x2c]
	subs r3, r1, r7
	adds r0, #0x2e
	ldrb r0, [r0]
	cmp r0, #0
	bne .L080934F4
	asrs r4, r4, #1
	asrs r3, r3, #1
	subs r4, #2
	subs r3, #2
.L080934F4:
	ldrh r0, [r2, #0xa]
	str r0, [sp]
	ldrb r2, [r2, #9]
	lsls r0, r2, #8
	str r0, [sp, #4]
	adds r0, r5, #0
	adds r1, r6, #0
	adds r2, r4, #0
	bl StartWmArrow
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08093510: .4byte ProcScr_WmSprite
.L08093514: .4byte gWmArrowConf

	thumb_func_start func_fe6_08093518
func_fe6_08093518: @ 0x08093518
	push {lr}
	ldr r0, .L08093554 @ =Img_WorldMapStuff
	ldr r1, .L08093558 @ =0x06016200
	bl Decompress
	ldr r0, .L0809355C @ =Pal_WorldMapStuff
	movs r1, #0x80
	lsls r1, r1, #2
	movs r2, #0x80
	bl ApplyPaletteExt
	ldr r0, .L08093560 @ =Pal_SystemObjects
	movs r1, #0xd8
	lsls r1, r1, #2
	movs r2, #0x40
	bl ApplyPaletteExt
	ldr r0, .L08093564 @ =Img_WmDialogueBox
	ldr r1, .L08093568 @ =0x06016800
	bl Decompress
	ldr r0, .L0809356C @ =Pal_WmDialogueBox
	movs r1, #0xc8
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	pop {r0}
	bx r0
	.align 2, 0
.L08093554: .4byte Img_WorldMapStuff
.L08093558: .4byte 0x06016200
.L0809355C: .4byte Pal_WorldMapStuff
.L08093560: .4byte Pal_SystemObjects
.L08093564: .4byte Img_WmDialogueBox
.L08093568: .4byte 0x06016800
.L0809356C: .4byte Pal_WmDialogueBox

	thumb_func_start StartWMIntroRotation
StartWMIntroRotation: @ 0x08093570
	push {lr}
	adds r1, r0, #0
	ldr r0, .L08093580 @ =ProcScr_0868C668
	bl SpawnProcLocking
	pop {r0}
	bx r0
	.align 2, 0
.L08093580: .4byte ProcScr_0868C668

	thumb_func_start func_fe6_08093584
func_fe6_08093584: @ 0x08093584
	adds r3, r0, #0
	adds r1, r3, #0
	adds r1, #0x44
	movs r2, #0
	movs r0, #0x80
	lsls r0, r0, #2
	strh r0, [r1]
	adds r1, #4
	movs r0, #0x80
	strh r0, [r1]
	adds r0, r3, #0
	adds r0, #0x64
	strh r2, [r0]
	bx lr

	thumb_func_start func_fe6_080935A0
func_fe6_080935A0: @ 0x080935A0
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r7, r0, #0
	movs r1, #0x80
	lsls r1, r1, #8
	adds r4, r7, #0
	adds r4, #0x64
	movs r0, #0
	ldrsh r3, [r4, r0]
	movs r5, #0x23
	str r5, [sp]
	movs r0, #5
	movs r2, #0
	bl Interpolate
	adds r6, r0, #0
	movs r1, #0x80
	lsls r1, r1, #3
	movs r2, #0x80
	lsls r2, r2, #1
	ldrh r3, [r4]
	adds r0, r3, #1
	strh r0, [r4]
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	str r5, [sp]
	movs r0, #5
	bl Interpolate
	movs r2, #0xf0
	lsls r2, r2, #7
	movs r3, #0xa0
	lsls r3, r3, #7
	str r6, [sp]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #0
	movs r1, #0
	bl WmZoomCore
	ldrh r4, [r4]
	cmp r4, #0x28
	bne .L08093600
	adds r0, r7, #0
	bl Proc_Break
.L08093600:
	add sp, #0xc
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start func_fe6_08093608
func_fe6_08093608: @ 0x08093608
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	mov sb, r0
	movs r0, #0x64
	add sb, r0
	movs r0, #0
	mov r1, sb
	strh r0, [r1]
	bl InitScanlineEffect
	bl func_fe6_08069C74
	ldr r2, .L080936E0 @ =gDispIo+0x3C
	mov ip, r2
	ldr r0, .L080936E4 @ =0x0000FFE0
	ldrh r3, [r2]
	ands r0, r3
	movs r1, #0x1f
	orrs r0, r1
	strh r0, [r2]
	subs r2, #0x3c
	movs r4, #0x20
	mov r6, ip
	ldrb r0, [r6]
	orrs r0, r4
	strb r0, [r6]
	ldrb r0, [r2, #1]
	orrs r0, r4
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r2, #1]
	movs r0, #8
	rsbs r0, r0, #0
	add r0, ip
	mov sl, r0
	ldrb r0, [r0]
	orrs r0, r4
	mov r1, sl
	strb r0, [r1]
	mov r7, ip
	subs r7, #6
	movs r2, #0x21
	rsbs r2, r2, #0
	adds r0, r2, #0
	ldrb r3, [r7]
	ands r0, r3
	strb r0, [r7]
	movs r1, #1
	mov r6, sl
	ldrb r0, [r6]
	orrs r0, r1
	movs r3, #2
	mov r8, r3
	mov r6, r8
	orrs r0, r6
	movs r3, #4
	orrs r0, r3
	movs r5, #8
	orrs r0, r5
	movs r3, #0x10
	orrs r0, r3
	mov r6, sl
	strb r0, [r6]
	ldrb r0, [r7]
	orrs r1, r0
	mov r6, r8
	orrs r1, r6
	movs r0, #4
	orrs r1, r0
	orrs r1, r5
	orrs r1, r3
	strb r1, [r7]
	mov r1, sl
	ldrb r1, [r1]
	orrs r4, r1
	mov r3, sl
	strb r4, [r3]
	ldrb r6, [r7]
	ands r2, r6
	strb r2, [r7]
	movs r0, #0x3f
	mov r1, ip
	ldrb r1, [r1]
	ands r0, r1
	movs r1, #0x80
	orrs r0, r1
	mov r2, ip
	strb r0, [r2]
	movs r3, #0
	strb r3, [r2, #8]
	strb r3, [r2, #9]
	mov r6, sb
	ldrh r0, [r6]
	strb r0, [r2, #0xa]
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L080936E0: .4byte gDispIo+0x3C
.L080936E4: .4byte 0x0000FFE0

	thumb_func_start func_fe6_080936E8
func_fe6_080936E8: @ 0x080936E8
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	adds r4, r6, #0
	adds r4, #0x64
	movs r0, #0
	ldrsh r3, [r4, r0]
	movs r0, #0x2d
	str r0, [sp]
	movs r0, #5
	movs r1, #1
	movs r2, #0xc8
	bl Interpolate
	adds r2, r0, #0
	movs r0, #0x78
	movs r1, #0x50
	bl func_fe6_08069DA4
	ldr r5, .L08093760 @ =gDispIo
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
	movs r1, #0
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	movs r0, #0
	ldrsh r3, [r4, r0]
	movs r0, #0x28
	str r0, [sp]
	movs r0, #0
	movs r1, #0x10
	movs r2, #0
	bl Interpolate
	adds r1, r5, #0
	adds r1, #0x46
	strb r0, [r1]
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x28
	bne .L08093758
	adds r0, r6, #0
	bl Proc_Break
.L08093758:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08093760: .4byte gDispIo

	thumb_func_start func_fe6_08093764
func_fe6_08093764: @ 0x08093764
	push {r4, lr}
	ldr r4, .L080937A8 @ =gDispIo
	adds r1, r4, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r2, [r1]
	ands r0, r2
	strb r0, [r1]
	adds r1, #8
	movs r2, #0
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x45
	strb r2, [r0]
	adds r0, #1
	strb r2, [r0]
	movs r0, #0
	bl SetOnHBlankA
	movs r0, #0x21
	rsbs r0, r0, #0
	ldrb r1, [r4, #1]
	ands r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r4, #1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L080937A8: .4byte gDispIo

	thumb_func_start StartWMHighlight
StartWMHighlight: @ 0x080937AC
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r0, .L080937D0 @ =ProcScr_WroldMapRmBorder
	movs r1, #3
	bl SpawnProc
	adds r1, r0, #0
	adds r0, #0x64
	strh r5, [r0]
	adds r0, #2
	strh r4, [r0]
	adds r0, r4, #0
	bl SetWMHighlight
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L080937D0: .4byte ProcScr_WroldMapRmBorder

	thumb_func_start WMHighlight_Init
WMHighlight_Init: @ 0x080937D4
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r7, .L0809389C @ =Config_WMHighlight
	adds r4, r5, #0
	adds r4, #0x64
	movs r1, #0
	ldrsh r0, [r4, r1]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r7
	ldr r2, [r1]
	adds r6, r5, #0
	adds r6, #0x66
	movs r1, #0
	ldrsh r0, [r6, r1]
	ldr r1, .L080938A0 @ =0x06015100
	cmp r0, #0
	bne .L080937FC
	ldr r1, .L080938A4 @ =0x06014000
.L080937FC:
	adds r0, r2, #0
	bl Decompress
	ldr r0, .L080938A8 @ =Pal_WroldMapRmBorder
	movs r1, #0xd0
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	movs r2, #0
	ldrsh r1, [r4, r2]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r1, r7, #4
	adds r0, r0, r1
	ldr r0, [r0]
	movs r1, #0xd
	bl StartSpriteAnim
	adds r1, r0, #0
	str r1, [r5, #0x50]
	movs r4, #0
	ldrsh r0, [r6, r4]
	ldr r2, .L080938AC @ =0x0000A288
	adds r4, r2, #0
	cmp r0, #0
	bne .L0809383A
	movs r0, #0xa2
	lsls r0, r0, #8
	adds r4, r0, #0
.L0809383A:
	movs r2, #0
	movs r3, #0
	strh r4, [r1, #0x22]
	ldr r1, .L080938B0 @ =gDispIo
	mov ip, r1
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r4, [r1]
	ands r0, r4
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x44
	strb r2, [r0]
	mov r1, ip
	adds r1, #0x45
	movs r0, #0x10
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x46
	strb r2, [r0]
	ldr r0, .L080938B4 @ =0x0000FFE0
	mov r1, ip
	ldrh r1, [r1, #0x3c]
	ands r0, r1
	movs r1, #0x10
	orrs r0, r1
	ldr r1, .L080938B8 @ =0x0000E0FF
	ands r0, r1
	movs r2, #0x80
	lsls r2, r2, #3
	adds r1, r2, #0
	orrs r0, r1
	mov r4, ip
	strh r0, [r4, #0x3c]
	mov r1, ip
	adds r1, #0x3d
	movs r0, #0x20
	ldrb r2, [r1]
	orrs r0, r2
	strb r0, [r1]
	str r3, [r5, #0x54]
	adds r1, r5, #0
	adds r1, #0x44
	movs r0, #0xc0
	strh r0, [r1]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0809389C: .4byte Config_WMHighlight
.L080938A0: .4byte 0x06015100
.L080938A4: .4byte 0x06014000
.L080938A8: .4byte Pal_WroldMapRmBorder
.L080938AC: .4byte 0x0000A288
.L080938B0: .4byte gDispIo
.L080938B4: .4byte 0x0000FFE0
.L080938B8: .4byte 0x0000E0FF

	thumb_func_start WMHighlight_Loop
WMHighlight_Loop: @ 0x080938BC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	ldr r0, [r5, #0x50]
	ldr r2, .L08093954 @ =Config_WMHighlight
	adds r1, r5, #0
	adds r1, #0x64
	movs r3, #0
	ldrsh r1, [r1, r3]
	lsls r3, r1, #1
	adds r3, r3, r1
	lsls r3, r3, #2
	adds r3, r3, r2
	ldrb r1, [r3, #8]
	movs r2, #0x80
	lsls r2, r2, #3
	ldrb r3, [r3, #9]
	orrs r2, r3
	bl DisplaySpriteAnim
	ldr r1, .L08093958 @ =gSinLut
	adds r2, r5, #0
	adds r2, #0x44
	ldrb r7, [r2]
	lsls r0, r7, #1
	adds r0, r0, r1
	movs r3, #0
	ldrsh r1, [r0, r3]
	lsls r0, r1, #1
	adds r0, r0, r1
	asrs r0, r0, #0xb
	adds r3, r0, #0
	adds r3, #8
	ldrh r0, [r2]
	adds r0, #3
	movs r6, #0
	strh r0, [r2]
	ldr r1, .L0809395C @ =gDispIo
	adds r4, r1, #0
	adds r4, #0x3c
	movs r2, #0x3f
	ldrb r7, [r4]
	ands r2, r7
	strb r2, [r4]
	movs r0, #0x44
	adds r0, r0, r1
	mov r8, r0
	strb r3, [r0]
	movs r0, #0x10
	subs r0, r0, r3
	movs r7, #0x45
	adds r7, r7, r1
	strb r0, [r7]
	adds r1, #0x46
	strb r6, [r1]
	ldr r0, [r5, #0x54]
	cmp r0, #0
	beq .L08093948
	cmp r3, #2
	bne .L08093948
	strb r2, [r4]
	mov r0, r8
	strb r6, [r0]
	movs r0, #0x10
	strb r0, [r7]
	strb r6, [r1]
	adds r0, r5, #0
	bl Proc_End
.L08093948:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08093954: .4byte Config_WMHighlight
.L08093958: .4byte gSinLut
.L0809395C: .4byte gDispIo

	thumb_func_start WMHighlight_End
WMHighlight_End: @ 0x08093960
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x50]
	bl EndSpriteAnim
	adds r4, #0x66
	movs r1, #0
	ldrsh r0, [r4, r1]
	movs r1, #0
	bl SetWMHighlight
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start RemoveWMHighlight
RemoveWMHighlight: @ 0x0809397C
	push {lr}
	bl GetWMHighlight
	cmp r0, #0
	beq .L0809398A
	bl Proc_End
.L0809398A:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start RemoveAllWMHighlight
RemoveAllWMHighlight: @ 0x08093990
	push {r4, lr}
	movs r4, #0
.L08093994:
	adds r0, r4, #0
	bl RemoveWMHighlight
	adds r4, #1
	cmp r4, #1
	ble .L08093994
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start WMHighlightFadeOut
WMHighlightFadeOut: @ 0x080939A8
	push {lr}
	bl GetWMHighlight
	adds r1, r0, #0
	cmp r1, #0
	beq .L080939B8
	movs r0, #1
	str r0, [r1, #0x54]
.L080939B8:
	pop {r0}
	bx r0

	thumb_func_start WMHighlightExists
WMHighlightExists: @ 0x080939BC
	push {lr}
	bl GetWMHighlight
	cmp r0, #0
	bne .L080939CA
	movs r0, #0
	b .L080939CC
.L080939CA:
	movs r0, #1
.L080939CC:
	pop {r1}
	bx r1

	thumb_func_start WMHighlightAllSideExists
WMHighlightAllSideExists: @ 0x080939D0
	push {lr}
	movs r0, #0
	bl GetWMHighlight
	cmp r0, #0
	bne .L080939EA
	movs r0, #1
	bl GetWMHighlight
	cmp r0, #0
	bne .L080939EA
	movs r0, #0
	b .L080939EC
.L080939EA:
	movs r0, #1
.L080939EC:
	pop {r1}
	bx r1

	thumb_func_start WmPutDot
WmPutDot: @ 0x080939F0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0xc
	adds r4, r0, #0
	adds r5, r1, #0
	mov r8, r2
	adds r7, r3, #0
	adds r0, r7, #0
	bl GetWMDot
	adds r6, r0, #0
	lsls r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r4, r4, #0x10
	orrs r4, r5
	str r4, [sp, #8]
	add r4, sp, #8
	adds r0, r4, #0
	bl func_fe6_08093FD8
	cmp r6, #0
	beq .L08093A34
	add r0, sp, #8
	movs r2, #0
	ldrsh r1, [r0, r2]
	movs r3, #2
	ldrsh r2, [r4, r3]
	movs r3, #0xc4
	lsls r3, r3, #2
	adds r0, r6, #0
	bl SetSpriteAnimProcParameters
	b .L08093A62
.L08093A34:
	ldr r0, .L08093A70 @ =gUnk_082D3674
	add r1, sp, #8
	movs r2, #0
	ldrsh r1, [r1, r2]
	movs r3, #2
	ldrsh r2, [r4, r3]
	movs r3, #0xf
	mov r4, r8
	ands r3, r4
	lsls r3, r3, #0xc
	movs r4, #0xc4
	lsls r4, r4, #2
	orrs r3, r4
	movs r4, #1
	str r4, [sp]
	movs r4, #0xa
	str r4, [sp, #4]
	bl StartSpriteAnimProc
	adds r1, r0, #0
	adds r0, r7, #0
	bl SetWMDot
.L08093A62:
	add sp, #0xc
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08093A70: .4byte gUnk_082D3674

	thumb_func_start EndWMDot
EndWMDot: @ 0x08093A74
	push {r4, lr}
	adds r4, r0, #0
	bl GetWMDot
	cmp r0, #0
	beq .L08093A84
	bl EndSpriteAnimProc
.L08093A84:
	adds r0, r4, #0
	movs r1, #0
	bl SetWMDot
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start StartWMFlag
StartWMFlag: @ 0x08093A94
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0xc
	adds r4, r0, #0
	adds r5, r1, #0
	adds r7, r2, #0
	mov r8, r3
	mov r0, r8
	bl GetWMFlag
	adds r6, r0, #0
	lsls r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r4, r4, #0x10
	orrs r4, r5
	str r4, [sp, #8]
	add r4, sp, #8
	adds r0, r4, #0
	bl func_fe6_08093FD8
	cmp r6, #0
	beq .L08093AE0
	add r0, sp, #8
	movs r2, #0
	ldrsh r1, [r0, r2]
	movs r3, #2
	ldrsh r2, [r4, r3]
	movs r3, #0xf
	ands r3, r7
	lsls r3, r3, #0xc
	movs r0, #0xc4
	lsls r0, r0, #2
	orrs r3, r0
	adds r0, r6, #0
	bl SetSpriteAnimProcParameters
	b .L08093B0A
.L08093AE0:
	ldr r0, .L08093B18 @ =gUnk_082D3674
	add r1, sp, #8
	movs r2, #0
	ldrsh r1, [r1, r2]
	movs r3, #2
	ldrsh r2, [r4, r3]
	movs r3, #0xf
	ands r3, r7
	lsls r3, r3, #0xc
	movs r4, #0xc4
	lsls r4, r4, #2
	orrs r3, r4
	str r6, [sp]
	movs r4, #7
	str r4, [sp, #4]
	bl StartSpriteAnimProc
	adds r1, r0, #0
	mov r0, r8
	bl SetWMFlag
.L08093B0A:
	add sp, #0xc
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08093B18: .4byte gUnk_082D3674

	thumb_func_start EndWMFlag
EndWMFlag: @ 0x08093B1C
	push {r4, lr}
	adds r4, r0, #0
	bl GetWMFlag
	cmp r0, #0
	beq .L08093B2C
	bl EndSpriteAnimProc
.L08093B2C:
	adds r0, r4, #0
	movs r1, #0
	bl SetWMFlag
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start StartWMMapText
StartWMMapText: @ 0x08093B3C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r6, r2, #0
	mov r8, r3
	ldr r7, [sp, #0x1c]
	ldr r5, [sp, #0x20]
	lsls r0, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r0, r0, #0x10
	orrs r0, r1
	str r0, [sp]
	mov r4, sp
	mov r0, sp
	bl func_fe6_08093FD8
	ldr r0, .L08093B9C @ =gUnk_0868C8D8
	movs r1, #3
	bl SpawnProc
	adds r1, r0, #0
	mov r0, sp
	movs r2, #0
	ldrsh r0, [r0, r2]
	str r0, [r1, #0x2c]
	movs r2, #2
	ldrsh r0, [r4, r2]
	str r0, [r1, #0x30]
	adds r0, r1, #0
	adds r0, #0x64
	strh r6, [r0]
	adds r0, #2
	mov r2, r8
	strh r2, [r0]
	adds r0, #2
	strh r7, [r0]
	adds r0, #2
	strh r5, [r0]
	adds r0, r5, #0
	bl SetWMMapText
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08093B9C: .4byte gUnk_0868C8D8

	thumb_func_start RemoveWmMapText
RemoveWmMapText: @ 0x08093BA0
	push {lr}
	bl GetWMMapText
	cmp r0, #0
	beq .L08093BAE
	bl Proc_End
.L08093BAE:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start EndWmMapText
EndWmMapText: @ 0x08093BB4
	push {lr}
	bl GetWMMapText
	adds r1, r0, #0
	cmp r1, #0
	beq .L08093BC4
	movs r0, #1
	str r0, [r1, #0x54]
.L08093BC4:
	pop {r0}
	bx r0

	thumb_func_start func_fe6_08093BC8
func_fe6_08093BC8: @ 0x08093BC8
	push {r4, r5, lr}
	adds r5, r1, #0
	ldr r4, .L08093C14 @ =gBuf
	adds r1, r4, #0
	bl Decompress
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #8
	movs r3, #4
	bl func_fe6_08015298
	movs r1, #0x80
	lsls r1, r1, #3
	adds r0, r4, r1
	movs r2, #0x80
	lsls r2, r2, #1
	adds r1, r5, r2
	movs r2, #4
	movs r3, #4
	bl func_fe6_08015298
	movs r0, #0xc0
	lsls r0, r0, #3
	adds r4, r4, r0
	movs r1, #0xc0
	lsls r1, r1, #1
	adds r5, r5, r1
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #1
	movs r3, #4
	bl func_fe6_08015298
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08093C14: .4byte gBuf

	thumb_func_start func_fe6_08093C18
func_fe6_08093C18: @ 0x08093C18
	adds r2, r0, #0
	adds r2, #0x44
	movs r1, #0
	strh r1, [r2]
	str r1, [r0, #0x54]
	bx lr

	thumb_func_start func_fe6_08093C24
func_fe6_08093C24: @ 0x08093C24
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r0, .L08093C58 @ =gUnk_082D38A4
	movs r1, #0xb
	bl StartSpriteAnim
	str r0, [r4, #0x50]
	adds r2, r0, #0
	adds r0, r4, #0
	adds r0, #0x6a
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r1, #0xa2
	lsls r1, r1, #2
	cmp r0, #0
	bne .L08093C46
	subs r1, #0x88
.L08093C46:
	adds r0, r4, #0
	adds r0, #0x68
	movs r3, #0
	ldrsh r0, [r0, r3]
	cmp r0, #0
	bne .L08093C5C
	movs r0, #0xa0
	lsls r0, r0, #7
	b .L08093C60
	.align 2, 0
.L08093C58: .4byte gUnk_082D38A4
.L08093C5C:
	movs r0, #0x80
	lsls r0, r0, #7
.L08093C60:
	orrs r0, r1
	strh r0, [r2, #0x22]
	ldr r2, .L08093C8C @ =gUnk_0868C734
	adds r3, r4, #0
	adds r3, #0x64
	movs r0, #0
	ldrsh r1, [r3, r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r2, #8
	adds r0, r0, r2
	ldr r1, [r0]
	ldr r0, .L08093C90 @ =gUnk_082D5910
	adds r5, r3, #0
	cmp r1, r0
	bne .L08093C94
	ldr r0, [r4, #0x50]
	movs r1, #1
	bl SetSpriteAnimId
	b .L08093C9C
	.align 2, 0
.L08093C8C: .4byte gUnk_0868C734
.L08093C90: .4byte gUnk_082D5910
.L08093C94:
	ldr r0, [r4, #0x50]
	movs r1, #2
	bl SetSpriteAnimId
.L08093C9C:
	ldr r6, .L08093D34 @ =gUnk_0868C734
	movs r2, #0
	ldrsh r1, [r5, r2]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r1, r6, #4
	adds r0, r0, r1
	ldr r2, [r0]
	adds r4, #0x6a
	movs r3, #0
	ldrsh r0, [r4, r3]
	ldr r1, .L08093D38 @ =0x06015100
	cmp r0, #0
	bne .L08093CBC
	ldr r1, .L08093D3C @ =0x06014000
.L08093CBC:
	adds r0, r2, #0
	bl func_fe6_08093BC8
	movs r0, #0
	ldrsh r1, [r5, r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r1, r6, #0
	adds r1, #8
	adds r0, r0, r1
	ldr r3, [r0]
	movs r1, #0
	ldrsh r0, [r4, r1]
	ldr r1, .L08093D40 @ =0x06015300
	cmp r0, #0
	bne .L08093CE0
	ldr r1, .L08093D44 @ =0x06014200
.L08093CE0:
	adds r0, r3, #0
	bl func_fe6_08093BC8
	ldr r2, .L08093D48 @ =gDispIo
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
	adds r3, r2, #0
	adds r3, #0x45
	movs r0, #0x10
	strb r0, [r3]
	adds r0, r2, #0
	adds r0, #0x46
	strb r1, [r0]
	ldr r0, .L08093D4C @ =0x0000FFE0
	ldrh r1, [r2, #0x3c]
	ands r0, r1
	movs r1, #0x10
	orrs r0, r1
	ldr r1, .L08093D50 @ =0x0000E0FF
	ands r0, r1
	movs r3, #0x80
	lsls r3, r3, #3
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2, #0x3c]
	adds r1, r2, #0
	adds r1, #0x3d
	movs r0, #0x20
	ldrb r2, [r1]
	orrs r0, r2
	strb r0, [r1]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08093D34: .4byte gUnk_0868C734
.L08093D38: .4byte 0x06015100
.L08093D3C: .4byte 0x06014000
.L08093D40: .4byte 0x06015300
.L08093D44: .4byte 0x06014200
.L08093D48: .4byte gDispIo
.L08093D4C: .4byte 0x0000FFE0
.L08093D50: .4byte 0x0000E0FF

	thumb_func_start func_fe6_08093D54
func_fe6_08093D54: @ 0x08093D54
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r5, r0, #0
	ldr r0, [r5, #0x50]
	ldr r1, [r5, #0x2c]
	ldr r2, [r5, #0x30]
	movs r3, #0x80
	lsls r3, r3, #3
	orrs r2, r3
	adds r3, r5, #0
	adds r3, #0x64
	movs r4, #0
	ldrsh r3, [r3, r4]
	adds r4, r5, #0
	adds r4, #0x66
	movs r6, #0
	ldrsh r4, [r4, r6]
	str r4, [sp]
	adds r4, r5, #0
	adds r4, #0x68
	movs r6, #0
	ldrsh r4, [r4, r6]
	str r4, [sp, #4]
	bl func_fe6_08093EAC
	adds r0, r5, #0
	adds r0, #0x44
	ldrh r1, [r0]
	adds r1, #1
	movs r3, #0
	strh r1, [r0]
	ldr r4, .L08093DD0 @ =gDispIo
	adds r2, r4, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r6, [r2]
	ands r0, r6
	strb r0, [r2]
	adds r2, r1, #0
	adds r0, r4, #0
	adds r0, #0x44
	strb r2, [r0]
	movs r0, #0x10
	subs r0, r0, r2
	adds r2, r4, #0
	adds r2, #0x45
	strb r0, [r2]
	adds r0, r4, #0
	adds r0, #0x46
	strb r3, [r0]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	cmp r1, #0xf
	ble .L08093DC6
	adds r0, r5, #0
	bl Proc_Break
.L08093DC6:
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08093DD0: .4byte gDispIo

	thumb_func_start func_fe6_08093DD4
func_fe6_08093DD4: @ 0x08093DD4
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r5, r0, #0
	ldr r0, [r5, #0x50]
	ldr r1, [r5, #0x2c]
	ldr r2, [r5, #0x30]
	adds r3, r5, #0
	adds r3, #0x64
	movs r4, #0
	ldrsh r3, [r3, r4]
	adds r4, r5, #0
	adds r4, #0x66
	movs r6, #0
	ldrsh r4, [r4, r6]
	str r4, [sp]
	adds r4, r5, #0
	adds r4, #0x68
	movs r6, #0
	ldrsh r4, [r4, r6]
	str r4, [sp, #4]
	bl func_fe6_08093EAC
	ldr r0, [r5, #0x54]
	cmp r0, #0
	beq .L08093E0C
	adds r0, r5, #0
	bl Proc_Break
.L08093E0C:
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start func_fe6_08093E14
func_fe6_08093E14: @ 0x08093E14
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r5, r0, #0
	ldr r0, [r5, #0x50]
	ldr r1, [r5, #0x2c]
	ldr r2, [r5, #0x30]
	movs r3, #0x80
	lsls r3, r3, #3
	orrs r2, r3
	adds r3, r5, #0
	adds r3, #0x64
	movs r4, #0
	ldrsh r3, [r3, r4]
	adds r4, r5, #0
	adds r4, #0x66
	movs r6, #0
	ldrsh r4, [r4, r6]
	str r4, [sp]
	adds r4, r5, #0
	adds r4, #0x68
	movs r6, #0
	ldrsh r4, [r4, r6]
	str r4, [sp, #4]
	bl func_fe6_08093EAC
	adds r0, r5, #0
	adds r0, #0x44
	ldrh r2, [r0]
	subs r2, #1
	movs r3, #0
	strh r2, [r0]
	ldr r4, .L08093E8C @ =gDispIo
	adds r1, r4, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r6, [r1]
	ands r0, r6
	strb r0, [r1]
	adds r1, r2, #0
	adds r0, r4, #0
	adds r0, #0x44
	strb r1, [r0]
	movs r0, #0x10
	subs r0, r0, r1
	adds r1, r4, #0
	adds r1, #0x45
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x46
	strb r3, [r0]
	lsls r2, r2, #0x10
	cmp r2, #0
	bne .L08093E84
	adds r0, r5, #0
	bl Proc_Break
.L08093E84:
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08093E8C: .4byte gDispIo

	thumb_func_start func_fe6_08093E90
func_fe6_08093E90: @ 0x08093E90
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x6a
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r1, #0
	bl SetWMMapText
	ldr r0, [r4, #0x50]
	bl EndSpriteAnim
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start func_fe6_08093EAC
func_fe6_08093EAC: @ 0x08093EAC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	str r0, [sp, #4]
	adds r4, r1, #0
	adds r7, r2, #0
	str r3, [sp, #8]
	ldr r0, [sp, #0x30]
	mov r8, r0
	ldr r5, [sp, #0x34]
	ldr r1, .L08093EEC @ =0xFFFFFE00
	mov sb, r1
	mov r2, sb
	ands r2, r4
	mov sb, r2
	ldr r0, .L08093EF0 @ =0xFFFFFF00
	mov sl, r0
	mov r1, sl
	ands r1, r7
	mov sl, r1
	mov r2, r8
	cmp r2, #1
	beq .L08093F08
	cmp r2, #1
	bgt .L08093EF4
	cmp r2, #0
	beq .L08093F00
	b .L08093F0A
	.align 2, 0
.L08093EEC: .4byte 0xFFFFFE00
.L08093EF0: .4byte 0xFFFFFF00
.L08093EF4:
	mov r0, r8
	cmp r0, #2
	beq .L08093F04
	cmp r0, #3
	beq .L08093F08
	b .L08093F0A
.L08093F00:
	subs r4, #2
	b .L08093F0A
.L08093F04:
	subs r4, #3
	b .L08093F0A
.L08093F08:
	adds r4, #2
.L08093F0A:
	lsls r5, r5, #1
	subs r5, #1
	movs r0, #1
	rsbs r0, r0, #0
	mov r1, r8
	lsls r1, r1, #1
	str r1, [sp, #0xc]
	cmp r5, r0
	beq .L08093F54
	ldr r1, .L08093F64 @ =gUnk_0868C940
	ldr r0, [sp, #0xc]
	add r0, r8
	lsls r0, r0, #2
	adds r6, r0, r1
.L08093F26:
	ldr r1, .L08093F68 @ =0x000001FF
	ands r1, r4
	add r1, sb
	movs r2, #0xff
	ands r2, r7
	add r2, sl
	ldr r3, [r6]
	ldr r0, .L08093F6C @ =0x00004320
	str r0, [sp]
	movs r0, #0xb
	bl PutSpriteExt
	movs r2, #4
	ldrsh r0, [r6, r2]
	adds r4, r4, r0
	movs r1, #6
	ldrsh r0, [r6, r1]
	adds r7, r7, r0
	subs r5, #1
	movs r0, #1
	rsbs r0, r0, #0
	cmp r5, r0
	bne .L08093F26
.L08093F54:
	mov r2, r8
	cmp r2, #1
	beq .L08093F96
	cmp r2, #1
	bgt .L08093F70
	cmp r2, #0
	beq .L08093F7E
	b .L08093F96
	.align 2, 0
.L08093F64: .4byte gUnk_0868C940
.L08093F68: .4byte 0x000001FF
.L08093F6C: .4byte 0x00004320
.L08093F70:
	mov r0, r8
	cmp r0, #2
	beq .L08093F7C
	cmp r0, #3
	beq .L08093F94
	b .L08093F96
.L08093F7C:
	adds r4, #2
.L08093F7E:
	ldr r0, .L08093F90 @ =gUnk_0868C734
	ldr r2, [sp, #8]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r0, [r1]
	subs r4, r4, r0
	b .L08093F96
	.align 2, 0
.L08093F90: .4byte gUnk_0868C734
.L08093F94:
	subs r4, #2
.L08093F96:
	ldr r0, .L08093FD0 @ =gUnk_0868C940
	ldr r2, [sp, #0xc]
	add r2, r8
	lsls r2, r2, #2
	adds r2, r2, r0
	movs r0, #8
	ldrsh r1, [r2, r0]
	adds r1, r4, r1
	ldr r0, .L08093FD4 @ =0x000001FF
	ands r1, r0
	add r1, sb
	movs r0, #0xa
	ldrsh r2, [r2, r0]
	adds r2, r7, r2
	movs r0, #0xff
	ands r2, r0
	add r2, sl
	ldr r0, [sp, #4]
	bl DisplaySpriteAnim
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08093FD0: .4byte gUnk_0868C940
.L08093FD4: .4byte 0x000001FF

	thumb_func_start func_fe6_08093FD8
func_fe6_08093FD8: @ 0x08093FD8
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, .L0809400C @ =ProcScr_WmSprite
	bl FindProc
	ldrh r1, [r4]
	ldrh r3, [r0, #0x2a]
	subs r2, r1, r3
	strh r2, [r4]
	ldrh r5, [r4, #2]
	ldrh r3, [r0, #0x2c]
	subs r1, r5, r3
	strh r1, [r4, #2]
	adds r0, #0x2e
	ldrb r0, [r0]
	cmp r0, #0
	bne .L08094006
	lsls r0, r2, #0x10
	asrs r0, r0, #0x11
	strh r0, [r4]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x11
	strh r0, [r4, #2]
.L08094006:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0809400C: .4byte ProcScr_WmSprite

	thumb_func_start PlayWMIntroBGM
PlayWMIntroBGM: @ 0x08094010
	push {lr}
	ldr r0, .L0809402C @ =gPlaySt
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterInfo
	ldrb r0, [r0, #0x17]
	movs r1, #0
	bl StartBgm
	pop {r0}
	bx r0
	.align 2, 0
.L0809402C: .4byte gPlaySt

	thumb_func_start func_fe6_08094030
func_fe6_08094030: @ 0x08094030
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	adds r1, r3, #0
	ldr r0, .L08094058 @ =gUnk_0868C970
	bl SpawnProcLocking
	ldr r1, .L0809405C @ =0x000003FF
	ands r1, r4
	lsls r1, r1, #5
	ldr r2, .L08094060 @ =0x06010000
	adds r1, r1, r2
	str r1, [r0, #0x4c]
	str r5, [r0, #0x54]
	str r6, [r0, #0x58]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08094058: .4byte gUnk_0868C970
.L0809405C: .4byte 0x000003FF
.L08094060: .4byte 0x06010000

	thumb_func_start func_fe6_08094064
func_fe6_08094064: @ 0x08094064
	adds r0, #0x64
	movs r1, #0
	strh r1, [r0]
	bx lr

	thumb_func_start func_fe6_0809406C
func_fe6_0809406C: @ 0x0809406C
	push {r4, r5, r6, r7, lr}
	adds r3, r0, #0
	ldr r6, [r3, #0x4c]
	movs r1, #0
	b .L080940C8
.L08094076:
	movs r2, #0
	lsls r0, r1, #2
	adds r5, r1, #0
	adds r5, #8
	adds r4, r0, r6
.L08094080:
	lsls r0, r2, #2
	adds r1, r0, r4
	ldr r0, [r1, #4]
	str r0, [r1]
	ldr r0, [r1, #8]
	str r0, [r1, #4]
	ldr r0, [r1, #0xc]
	str r0, [r1, #8]
	ldr r0, [r1, #0x10]
	str r0, [r1, #0xc]
	ldr r0, [r1, #0x14]
	str r0, [r1, #0x10]
	ldr r0, [r1, #0x18]
	str r0, [r1, #0x14]
	ldr r0, [r1, #0x1c]
	str r0, [r1, #0x18]
	ldr r0, .L080940B0 @ =0x000002FF
	cmp r2, r0
	bgt .L080940B4
	movs r7, #0x80
	lsls r7, r7, #3
	adds r0, r1, r7
	ldr r0, [r0]
	b .L080940B6
	.align 2, 0
.L080940B0: .4byte 0x000002FF
.L080940B4:
	ldr r0, [r3, #0x58]
.L080940B6:
	str r0, [r1, #0x1c]
	movs r0, #0x80
	lsls r0, r0, #1
	adds r2, r2, r0
	movs r0, #0xc0
	lsls r0, r0, #2
	cmp r2, r0
	ble .L08094080
	adds r1, r5, #0
.L080940C8:
	ldr r0, [r3, #0x54]
	lsls r0, r0, #3
	cmp r1, r0
	blt .L08094076
	adds r1, r3, #0
	adds r1, #0x64
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xf
	ble .L080940E8
	adds r0, r3, #0
	bl Proc_Break
.L080940E8:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_fe6_080940F0
func_fe6_080940F0: @ 0x080940F0
	push {lr}
	bl EndMapUi
	ldr r0, .L08094104 @ =gUnk_0868C988
	movs r1, #3
	bl SpawnProc
	pop {r0}
	bx r0
	.align 2, 0
.L08094104: .4byte gUnk_0868C988

	thumb_func_start func_fe6_08094108
func_fe6_08094108: @ 0x08094108
	adds r0, #0x34
	movs r1, #1
	strb r1, [r0]
	bx lr

	thumb_func_start func_fe6_08094110
func_fe6_08094110: @ 0x08094110
	push {lr}
	movs r1, #0
	str r1, [r0, #0x2c]
	ldr r1, .L08094128 @ =gPlaySt
	ldrb r1, [r1, #0xe]
	adds r2, r0, #0
	adds r2, #0x35
	strb r1, [r2]
	bl func_fe6_08094108
	pop {r0}
	bx r0
	.align 2, 0
.L08094128: .4byte gPlaySt

	thumb_func_start func_fe6_0809412C
func_fe6_0809412C: @ 0x0809412C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r4, [r5, #0x2c]
	bl IsEventRunning
	lsls r0, r0, #0x18
	cmp r0, #0
	bne .L08094204
	adds r0, r5, #0
	adds r0, #0x34
	ldrb r1, [r0]
	adds r6, r0, #0
	cmp r1, #0
	bne .L08094158
	movs r0, #1
	rsbs r0, r0, #0
	movs r1, #9
	bl DebugInitObj
	adds r0, r5, #0
	bl func_fe6_08094108
.L08094158:
	movs r0, #0x70
	movs r1, #0x64
	adds r2, r4, #0
	movs r3, #4
	bl DebugPutObjNumber
	ldr r1, .L0809417C @ =gKeySt
	ldr r2, [r1]
	movs r0, #4
	ldrh r3, [r2, #8]
	ands r0, r3
	cmp r0, #0
	beq .L08094180
	adds r0, r5, #0
	bl Proc_Break
	b .L08094204
	.align 2, 0
.L0809417C: .4byte gKeySt
.L08094180:
	ldrh r2, [r2, #6]
	movs r0, #0x40
	ands r0, r2
	cmp r0, #0
	beq .L0809418C
	adds r4, #1
.L0809418C:
	movs r0, #0x80
	ands r0, r2
	cmp r0, #0
	beq .L08094196
	subs r4, #1
.L08094196:
	movs r0, #0x10
	ands r0, r2
	cmp r0, #0
	beq .L080941A0
	adds r4, #0xa
.L080941A0:
	movs r0, #0x20
	ands r0, r2
	cmp r0, #0
	beq .L080941AA
	subs r4, #0xa
.L080941AA:
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r2
	cmp r0, #0
	beq .L080941B6
	adds r4, #0x64
.L080941B6:
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r2
	cmp r0, #0
	beq .L080941C2
	subs r4, #0x64
.L080941C2:
	cmp r4, #0
	bge .L080941C8
	movs r4, #0
.L080941C8:
	cmp r4, #0x26
	ble .L080941CE
	movs r4, #0x26
.L080941CE:
	ldr r0, [r5, #0x2c]
	cmp r4, r0
	beq .L080941E2
	movs r0, #1
	rsbs r0, r0, #0
	movs r1, #9
	bl DebugInitObj
	str r4, [r5, #0x2c]
	b .L08094204
.L080941E2:
	ldr r1, [r1]
	movs r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq .L08094204
	movs r0, #0
	strb r0, [r6]
	ldr r1, .L0809420C @ =gPlaySt
	adds r0, r5, #0
	adds r0, #0x35
	ldrb r0, [r0]
	strb r0, [r1, #0xe]
	ldr r0, .L08094210 @ =ProcScr_WorldMapIntroEvent
	movs r1, #3
	bl SpawnProc
.L08094204:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L0809420C: .4byte gPlaySt
.L08094210: .4byte ProcScr_WorldMapIntroEvent
