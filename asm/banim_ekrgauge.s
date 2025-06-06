	.include "macro.inc"

	.syntax unified

	.section .data
	.global ProcScr_EkrGauge
ProcScr_EkrGauge: @ 085CB568
	.incbin "fe6-base.gba", 0x5CB568, (0x5CB580 - 0x5CB568) @ length: 0018

	.global gUnk_085CB580
gUnk_085CB580: @ 085CB580
	.incbin "fe6-base.gba", 0x5CB580, (0x5CB5B0 - 0x5CB580) @ length: 0030

	.global gUnk_085CB5B0
gUnk_085CB5B0: @ 085CB5B0
	.incbin "fe6-base.gba", 0x5CB5B0, (0x5CB5C8 - 0x5CB5B0) @ length: 0018

	.global gUnk_085CB5C8
gUnk_085CB5C8: @ 085CB5C8
	.incbin "fe6-base.gba", 0x5CB5C8, (0x5CB5F8 - 0x5CB5C8) @ length: 0030

	.global gUnk_085CB5F8
gUnk_085CB5F8: @ 085CB5F8
	.incbin "fe6-base.gba", 0x5CB5F8, (0x5CB634 - 0x5CB5F8) @ length: 003C

	.global gUnk_085CB634
gUnk_085CB634: @ 085CB634
	.incbin "fe6-base.gba", 0x5CB634, (0x5CB670 - 0x5CB634) @ length: 003C

	.global gUnk_085CB670
gUnk_085CB670: @ 085CB670
	.incbin "fe6-base.gba", 0x5CB670, (0x5CB688 - 0x5CB670) @ length: 0018

	.global gUnk_085CB688
gUnk_085CB688: @ 085CB688
	.incbin "fe6-base.gba", 0x5CB688, (0x5CB6A0 - 0x5CB688) @ length: 0018

	.global gUnk_085CB6A0
gUnk_085CB6A0: @ 085CB6A0
	.incbin "fe6-base.gba", 0x5CB6A0, (0x5CB6B8 - 0x5CB6A0) @ length: 0018

	.global gUnk_085CB6B8
gUnk_085CB6B8: @ 085CB6B8
	.incbin "fe6-base.gba", 0x5CB6B8, (0x5CB6D0 - 0x5CB6B8) @ length: 0018

	.global gUnk_085CB6D0
gUnk_085CB6D0: @ 085CB6D0
	.incbin "fe6-base.gba", 0x5CB6D0, (0x5CB6E8 - 0x5CB6D0) @ length: 0018

	.global gUnk_085CB6E8
gUnk_085CB6E8: @ 085CB6E8
	.incbin "fe6-base.gba", 0x5CB6E8, (0x5CB700 - 0x5CB6E8) @ length: 0018

	.global gUnk_085CB700
gUnk_085CB700: @ 085CB700
	.incbin "fe6-base.gba", 0x5CB700, (0x5CB718 - 0x5CB700) @ length: 0018

	.section .text

	thumb_func_start EkrGauge_Loop
EkrGauge_Loop: @ 0x080439CC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x118
	mov sl, r0
	movs r0, #0
	str r0, [sp, #0xd8]
	bl GetGameTime
	lsrs r0, r0, #3
	movs r1, #3
	bl DivRem
	str r0, [sp, #0xe8]

	mov r0, sl
	adds r0, #0x2a
	ldrb r0, [r0]
	cmp r0, #1
	bne .L080439F8
	b .L08044152
.L080439F8:
	mov r0, sl
	adds r0, #0x29
	ldrb r1, [r0]
	str r0, [sp, #0x104]
	cmp r1, #0
	bne .L08043AE6

	@ (proc->battle_init == false
	mov r1, sl
	ldrh r1, [r1, #0x3a]
	lsls r0, r1, #0x10
	asrs r4, r0, #0x13
	lsls r0, r4, #5
	movs r2, #0xd0
	lsls r2, r2, #1
	adds r7, r0, r2
	cmp r7, #0
	bge .L08043A1A
	movs r7, #0
.L08043A1A:
	adds r6, r4, #7
	cmp r6, #7
	ble .L08043A22
	movs r6, #7
.L08043A22:
	movs r0, #7
	subs r0, r0, r6
	lsls r1, r0, #4
	subs r1, r1, r0
	lsls r1, r1, #1
	mov sb, r1
	ldr r0, .L08043A44 @ =gEkrDistanceType
	movs r3, #0
	ldrsh r0, [r0, r3]
	cmp r0, #0
	blt .L08043A48
	cmp r0, #2
	bgt .L08043A48
	movs r4, #0
	movs r0, #0xf
	str r0, [sp, #0xdc]
	b .L08043A4E
	.align 2, 0
.L08043A44: .4byte gEkrDistanceType
.L08043A48:
	movs r1, #8
	str r1, [sp, #0xdc]
	movs r4, #8
.L08043A4E:
	ldr r2, .L08043B34 @ =gBg0Tm+0x340
	mov r8, r2
	movs r0, #0x9f
	str r0, [sp]
	mov r0, r8
	movs r1, #0x1e
	movs r2, #8
	movs r3, #0
	bl FillBGRect
	mov r3, sl
	ldr r0, [r3, #0x4c]
	cmp r0, #0
	bne .L08043AA0
	ldr r0, .L08043B38 @ =gUnk_08112AD0
	add r0, sb
	lsls r5, r7, #1
	lsls r1, r4, #1
	ldr r2, .L08043B3C @ =0xFFFFFCC0
	add r2, r8
	adds r1, r1, r2
	adds r5, r5, r1
	lsls r4, r6, #0x10
	lsrs r4, r4, #0x10
	movs r1, #1
	rsbs r1, r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	adds r1, r5, #0
	movs r2, #0xf
	adds r3, r4, #0
	bl EfxTmCpyBG
	movs r0, #0x80
	str r0, [sp]
	adds r0, r5, #0
	movs r1, #0xf
	adds r2, r4, #0
	movs r3, #2
	bl func_fe6_0805B01C
.L08043AA0:
	mov r4, sl
	ldr r0, [r4, #0x50]
	cmp r0, #0
	bne .L08043AE0
	ldr r0, .L08043B40 @ =gUnk_08112BA4
	add r0, sb
	lsls r5, r7, #1
	ldr r2, [sp, #0xdc]
	lsls r1, r2, #1
	ldr r2, .L08043B3C @ =0xFFFFFCC0
	add r2, r8
	adds r1, r1, r2
	adds r5, r5, r1
	lsls r4, r6, #0x10
	lsrs r4, r4, #0x10
	movs r1, #1
	rsbs r1, r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	adds r1, r5, #0
	movs r2, #0x10
	adds r3, r4, #0
	bl EfxTmCpyBG
	movs r0, #0x80
	str r0, [sp]
	adds r0, r5, #0
	movs r1, #0x10
	adds r2, r4, #0
	movs r3, #3
	bl func_fe6_0805B01C
.L08043AE0:
	movs r0, #1
	bl EnableBgSync
.L08043AE6:
	ldr r1, .L08043B44 @ =gEkrGaugeHpBak
	ldr r0, .L08043B48 @ =gEkrGaugeHp
	ldrh r2, [r0]
	adds r5, r0, #0
	ldrh r3, [r1]
	ldrh r4, [r5]
	cmp r3, r4
	beq .L08043AFA
	movs r0, #1
	str r0, [sp, #0xd8]
.L08043AFA:
	ldrh r0, [r5, #2]
	ldrh r3, [r1, #2]
	cmp r3, r0
	beq .L08043B06
	movs r4, #1
	str r4, [sp, #0xd8]
.L08043B06:
	strh r2, [r1]
	strh r0, [r1, #2]
	ldrh r7, [r5]
	ldr r0, .L08043B4C @ =gBanimMaxHP
	ldrh r6, [r0]
	ldrh r1, [r5, #2]
	mov r8, r1
	ldrh r0, [r0, #2]
	str r0, [sp, #0xd4]
	ldr r0, .L08043B50 @ =gEkrDistanceType
	movs r2, #0
	ldrsh r0, [r0, r2]
	cmp r0, #3
	beq .L08043B54
	cmp r0, #3
	bgt .L08043B74
	cmp r0, #0
	blt .L08043B74
	mov r3, sl
	movs r4, #0x32
	ldrsh r3, [r3, r4]
	str r3, [sp, #0xe0]
	b .L08043B7E
	.align 2, 0
.L08043B34: .4byte gBg0Tm+0x340
.L08043B38: .4byte gUnk_08112AD0
.L08043B3C: .4byte 0xFFFFFCC0
.L08043B40: .4byte gUnk_08112BA4
.L08043B44: .4byte gEkrGaugeHpBak
.L08043B48: .4byte gEkrGaugeHp
.L08043B4C: .4byte gBanimMaxHP
.L08043B50: .4byte gEkrDistanceType
.L08043B54:
	ldr r0, .L08043B68 @ =gBanimValid
	ldrh r0, [r0]
	cmp r0, #1
	bne .L08043B6C
	mov r1, sl
	movs r2, #0x32
	ldrsh r0, [r1, r2]
	adds r0, #0x38
	b .L08043B7C
	.align 2, 0
.L08043B68: .4byte gBanimValid
.L08043B6C:
	mov r3, sl
	movs r4, #0x32
	ldrsh r0, [r3, r4]
	b .L08043B7A
.L08043B74:
	mov r1, sl
	movs r2, #0x32
	ldrsh r0, [r1, r2]
.L08043B7A:
	subs r0, #0x38
.L08043B7C:
	str r0, [sp, #0xe0]
.L08043B7E:
	ldr r3, [sp, #0x104]
	ldrb r0, [r3]
	cmp r0, #0
	bne .L08043B98
	ldr r4, .L08043B94 @ =0x0000FFF8
	mov r0, sl
	ldrh r1, [r0, #0x3a]
	ands r1, r4
	str r1, [sp, #0xe4]
	b .L08043BA0
	.align 2, 0
.L08043B94: .4byte 0x0000FFF8
.L08043B98:
	mov r2, sl
	movs r3, #0x3a
	ldrsh r2, [r2, r3]
	str r2, [sp, #0xe4]
.L08043BA0:
	adds r4, r5, #0
	movs r1, #0
	ldrsh r0, [r4, r1]
	movs r1, #0xa
	bl Div
	add r2, sp, #0x68
	strh r0, [r2]
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #1
	ldrh r4, [r4]
	subs r1, r4, r1
	strh r1, [r2, #2]
	lsls r0, r0, #0x10
	mov sb, r2
	cmp r0, #0
	bne .L08043BC8
	movs r0, #0xb
	strh r0, [r2]
.L08043BC8:
	movs r2, #2
	ldrsh r0, [r5, r2]
	movs r1, #0xa
	bl Div
	mov r3, sb
	strh r0, [r3, #4]
	adds r4, r0, #0
	lsls r1, r4, #2
	adds r2, r0, #0
	adds r1, r1, r2
	lsls r1, r1, #1
	ldrh r5, [r5, #2]
	subs r1, r5, r1
	strh r1, [r3, #6]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne .L08043BF0
	movs r0, #0xb
	strh r0, [r3, #4]
.L08043BF0:
	ldr r3, [sp, #0xe0]
	adds r3, #9
	str r3, [sp, #0xf0]
	ldr r4, [sp, #0xe4]
	adds r4, #0x91
	str r4, [sp, #0x110]
	ldr r0, [sp, #0xe0]
	adds r0, #0x81
	str r0, [sp, #0x10c]
	lsls r1, r7, #0x10
	str r1, [sp, #0xf4]
	lsls r6, r6, #0x10
	str r6, [sp, #0xf8]
	ldr r2, [sp, #0xe0]
	adds r2, #0x1d
	str r2, [sp, #0x108]
	mov r3, r8
	lsls r3, r3, #0x10
	str r3, [sp, #0xfc]
	ldr r4, [sp, #0xd4]
	lsls r4, r4, #0x10
	str r4, [sp, #0x100]
	ldr r0, [sp, #0xe0]
	adds r0, #0x95
	str r0, [sp, #0x114]
	ldr r1, [sp, #0xd8]
	cmp r1, #1
	bne .L08043C7E
	add r0, sp, #0xd0
	movs r1, #0
	str r1, [r0]
	ldr r1, .L08043CB8 @ =gUnk_Banim_02016DC0
	ldr r2, .L08043CBC @ =0x01000020
	bl CpuFastSet
	movs r0, #0
.L08043C38:
	adds r2, r0, #1
	mov r8, r2
	lsls r5, r0, #6
	lsls r0, r0, #2
	mov r3, sb
	adds r4, r0, r3
	movs r6, #1
.L08043C46:
	ldrh r1, [r4]
	lsls r0, r1, #5
	ldr r1, .L08043CC0 @ =Img_EkrGaugeNumber
	adds r0, r0, r1
	ldr r7, .L08043CB8 @ =gUnk_Banim_02016DC0
	adds r1, r5, r7
	movs r2, #0x10
	bl CpuSet
	adds r5, #0x20
	adds r4, #2
	subs r6, #1
	cmp r6, #0
	bge .L08043C46
	mov r0, r8
	cmp r0, #1
	ble .L08043C38
	ldr r1, .L08043CC4 @ =0x060139C0
	adds r0, r7, #0
	movs r2, #0x40
	bl RegisterDataMove
	adds r0, r7, #0
	adds r0, #0x40
	ldr r1, .L08043CC8 @ =0x06013DC0
	movs r2, #0x40
	bl RegisterDataMove
.L08043C7E:
	add r0, sp, #8
	movs r4, #0
	ldr r1, .L08043CCC @ =0x000051CE
	strh r1, [r0, #8]
	adds r2, r0, #0
	mov r3, sl
	ldr r0, [r3, #0x44]
	orrs r0, r1
	strh r0, [r2, #8]
	adds r0, r2, #0
	add r1, sp, #0xf0
	ldrh r1, [r1]
	strh r1, [r0, #2]
	add r2, sp, #0x110
	ldrh r2, [r2]
	strh r2, [r0, #4]
	strh r4, [r0, #0xc]
	movs r0, #0
	bl CheckEkrHitNow
	lsls r0, r0, #0x10
	asrs r3, r0, #0x10
	cmp r3, #1
	beq .L08043CD4
	ldr r0, .L08043CD0 @ =gUnk_085CB5B0
	str r0, [sp, #0x44]
	str r4, [sp, #0x24]
	b .L08043CFE
	.align 2, 0
.L08043CB8: .4byte gUnk_Banim_02016DC0
.L08043CBC: .4byte 0x01000020
.L08043CC0: .4byte Img_EkrGaugeNumber
.L08043CC4: .4byte 0x060139C0
.L08043CC8: .4byte 0x06013DC0
.L08043CCC: .4byte 0x000051CE
.L08043CD0: .4byte gUnk_085CB5B0
.L08043CD4:
	add r1, sp, #0x70
	str r1, [sp, #0x44]
	movs r0, #0x80
	lsls r0, r0, #2
	str r0, [sp, #0x24]
	add r2, sp, #8
	adds r0, r2, #0
	ldrh r0, [r0, #2]
	subs r0, #8
	strh r0, [r2, #2]
	adds r0, r2, #0
	ldrh r0, [r0, #4]
	subs r0, #8
	strh r0, [r2, #4]
	ldr r0, .L08043D48 @ =gUnk_085CB5B0
	movs r2, #0x80
	lsls r2, r2, #1
	str r3, [sp]
	movs r3, #0x80
	bl BanimUpdateSpriteRotScale
.L08043CFE:
	mov r3, sl
	ldr r0, [r3, #0x4c]
	cmp r0, #0
	bne .L08043D0C
	add r0, sp, #8
	bl BasPutOam
.L08043D0C:
	movs r4, #0
	str r4, [sp, #0x24]
	add r0, sp, #8
	ldr r1, .L08043D4C @ =0x000061EE
	strh r1, [r0, #8]
	adds r2, r0, #0
	mov r3, sl
	ldr r0, [r3, #0x44]
	orrs r0, r1
	strh r0, [r2, #8]
	adds r0, r2, #0
	add r1, sp, #0x10c
	ldrh r1, [r1]
	strh r1, [r0, #2]
	add r2, sp, #0x110
	ldrh r2, [r2]
	strh r2, [r0, #4]
	strh r4, [r0, #0xc]
	movs r0, #1
	bl CheckEkrHitNow
	lsls r0, r0, #0x10
	asrs r3, r0, #0x10
	cmp r3, #1
	beq .L08043D50
	ldr r0, .L08043D48 @ =gUnk_085CB5B0
	str r0, [sp, #0x44]
	str r4, [sp, #0x24]
	b .L08043D7A
	.align 2, 0
.L08043D48: .4byte gUnk_085CB5B0
.L08043D4C: .4byte 0x000061EE
.L08043D50:
	add r1, sp, #0x70
	str r1, [sp, #0x44]
	movs r0, #0x80
	lsls r0, r0, #2
	str r0, [sp, #0x24]
	add r2, sp, #8
	adds r0, r2, #0
	ldrh r0, [r0, #2]
	subs r0, #8
	strh r0, [r2, #2]
	adds r0, r2, #0
	ldrh r0, [r0, #4]
	subs r0, #8
	strh r0, [r2, #4]
	ldr r0, .L08043E5C @ =gUnk_085CB5B0
	movs r2, #0x80
	lsls r2, r2, #1
	str r3, [sp]
	movs r3, #0x80
	bl BanimUpdateSpriteRotScale
.L08043D7A:
	mov r3, sl
	ldr r0, [r3, #0x50]
	cmp r0, #0
	bne .L08043D88
	add r0, sp, #8
	bl BasPutOam
.L08043D88:
	ldr r4, [sp, #0xf4]
	ldr r0, .L08043E60 @ =0xFFD80000
	adds r1, r4, r0
	ldr r2, [sp, #0xf8]
	adds r0, r2, r0
	lsrs r5, r0, #0x10
	lsrs r6, r4, #0x10
	lsrs r7, r2, #0x10
	lsrs r3, r1, #0x10
	mov r8, r3
	cmp r1, #0
	bge .L08043DA4
	movs r4, #0
	mov r8, r4
.L08043DA4:
	lsls r0, r5, #0x10
	cmp r0, #0
	bge .L08043DAC
	movs r5, #0
.L08043DAC:
	lsls r0, r6, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x28
	ble .L08043DB6
	movs r6, #0x28
.L08043DB6:
	lsls r0, r7, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x28
	ble .L08043DC0
	movs r7, #0x28
.L08043DC0:
	add r0, sp, #8
	movs r3, #0
	movs r1, #0xb0
	lsls r1, r1, #8
	strh r1, [r0, #8]
	adds r2, r0, #0
	mov r4, sl
	ldr r0, [r4, #0x44]
	orrs r0, r1
	strh r0, [r2, #8]
	str r3, [sp, #0x24]
	adds r0, r2, #0
	add r1, sp, #0x108
	ldrh r1, [r1]
	strh r1, [r0, #2]
	ldr r0, .L08043E64 @ =gUnk_085CB580
	str r0, [sp, #0x44]
	ldr r2, [r4, #0x4c]
	mov sb, r2
	cmp r2, #0
	bne .L08043E94
	lsls r0, r5, #0x10
	asrs r2, r0, #0x10
	add r4, sp, #0x50
	cmp r2, #0
	beq .L08043E30
	mov r3, r8
	lsls r1, r3, #0x10
	asrs r1, r1, #0x10
	adds r0, r4, #0
	bl func_fe6_0805B380
	ldr r0, [sp, #0xd8]
	cmp r0, #1
	bne .L08043E0E
	ldr r1, .L08043E68 @ =gUnk_Banim_02016E40
	adds r0, r4, #0
	bl func_fe6_080435EC
.L08043E0E:
	add r1, sp, #8
	ldr r0, [sp, #0xe4]
	adds r0, #0x8e
	strh r0, [r1, #4]
	adds r2, r1, #0
	movs r0, #0xfc
	lsls r0, r0, #8
	ldrh r1, [r1, #8]
	ands r0, r1
	strh r0, [r2, #8]
	adds r1, r2, #0
	strh r0, [r1, #8]
	adds r0, r1, #0
	mov r1, sb
	strh r1, [r0, #0xc]
	bl BasPutOam
.L08043E30:
	lsls r1, r6, #0x10
	asrs r1, r1, #0x10
	lsls r2, r7, #0x10
	asrs r2, r2, #0x10
	adds r0, r4, #0
	bl func_fe6_0805B380
	ldr r2, [sp, #0xd8]
	cmp r2, #1
	bne .L08043E4C
	ldr r1, .L08043E6C @ =gUnk_Banim_02017240
	adds r0, r4, #0
	bl func_fe6_080435EC
.L08043E4C:
	cmp r5, #0
	beq .L08043E70
	add r1, sp, #8
	ldr r0, [sp, #0xe4]
	adds r0, #0x95
	strh r0, [r1, #4]
	b .L08043E78
	.align 2, 0
.L08043E5C: .4byte gUnk_085CB5B0
.L08043E60: .4byte 0xFFD80000
.L08043E64: .4byte gUnk_085CB580
.L08043E68: .4byte gUnk_Banim_02016E40
.L08043E6C: .4byte gUnk_Banim_02017240
.L08043E70:
	add r0, sp, #8
	add r3, sp, #0x110
	ldrh r3, [r3]
	strh r3, [r0, #4]
.L08043E78:
	add r2, sp, #8
	adds r1, r2, #0
	movs r0, #0xfc
	lsls r0, r0, #8
	ldrh r1, [r1, #8]
	ands r0, r1
	movs r3, #0
	movs r1, #0x20
	orrs r0, r1
	strh r0, [r2, #8]
	adds r0, r2, #0
	strh r3, [r0, #0xc]
	bl BasPutOam
.L08043E94:
	ldr r4, [sp, #0xfc]
	ldr r0, .L08043F74 @ =0xFFD80000
	adds r1, r4, r0
	ldr r2, [sp, #0x100]
	adds r0, r2, r0
	lsrs r5, r0, #0x10
	lsrs r6, r4, #0x10
	lsrs r7, r2, #0x10
	lsrs r3, r1, #0x10
	mov r8, r3
	cmp r1, #0
	bge .L08043EB0
	movs r4, #0
	mov r8, r4
.L08043EB0:
	lsls r0, r5, #0x10
	cmp r0, #0
	bge .L08043EB8
	movs r5, #0
.L08043EB8:
	lsls r0, r6, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x28
	ble .L08043EC2
	movs r6, #0x28
.L08043EC2:
	lsls r0, r7, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x28
	ble .L08043ECC
	movs r7, #0x28
.L08043ECC:
	add r0, sp, #8
	movs r1, #0
	mov sb, r1
	movs r1, #0xc0
	lsls r1, r1, #8
	strh r1, [r0, #8]
	adds r2, r0, #0
	mov r3, sl
	ldr r0, [r3, #0x44]
	movs r4, #0
	add r3, sp, #0xec
	strh r4, [r3]
	orrs r0, r1
	strh r0, [r2, #8]
	mov r4, sb
	str r4, [sp, #0x24]
	adds r0, r2, #0
	add r1, sp, #0x114
	ldrh r1, [r1]
	strh r1, [r0, #2]
	ldr r0, .L08043F78 @ =gUnk_085CB580
	str r0, [sp, #0x44]
	mov r2, sl
	ldr r2, [r2, #0x50]
	mov sb, r2
	cmp r2, #0
	bne .L08043FA8
	lsls r0, r5, #0x10
	asrs r2, r0, #0x10
	adds r5, r0, #0
	add r4, sp, #0x50
	cmp r2, #0
	beq .L08043F4A
	mov r3, r8
	lsls r1, r3, #0x10
	asrs r1, r1, #0x10
	adds r0, r4, #0
	bl func_fe6_0805B380
	ldr r0, [sp, #0xd8]
	cmp r0, #1
	bne .L08043F28
	ldr r1, .L08043F7C @ =gUnk_Banim_02017040
	adds r0, r4, #0
	bl func_fe6_080435EC
.L08043F28:
	add r1, sp, #8
	ldr r0, [sp, #0xe4]
	adds r0, #0x8e
	strh r0, [r1, #4]
	adds r2, r1, #0
	movs r0, #0xfc
	lsls r0, r0, #8
	ldrh r1, [r1, #8]
	ands r0, r1
	movs r1, #0x10
	orrs r0, r1
	strh r0, [r2, #8]
	adds r0, r2, #0
	mov r1, sb
	strh r1, [r0, #0xc]
	bl BasPutOam
.L08043F4A:
	lsls r1, r6, #0x10
	asrs r1, r1, #0x10
	lsls r2, r7, #0x10
	asrs r2, r2, #0x10
	adds r0, r4, #0
	bl func_fe6_0805B380
	ldr r2, [sp, #0xd8]
	cmp r2, #1
	bne .L08043F66
	ldr r1, .L08043F80 @ =gUnk_Banim_02017440
	adds r0, r4, #0
	bl func_fe6_080435EC
.L08043F66:
	cmp r5, #0
	beq .L08043F84
	add r1, sp, #8
	ldr r0, [sp, #0xe4]
	adds r0, #0x95
	strh r0, [r1, #4]
	b .L08043F8C
	.align 2, 0
.L08043F74: .4byte 0xFFD80000
.L08043F78: .4byte gUnk_085CB580
.L08043F7C: .4byte gUnk_Banim_02017040
.L08043F80: .4byte gUnk_Banim_02017440
.L08043F84:
	add r0, sp, #8
	add r3, sp, #0x110
	ldrh r3, [r3]
	strh r3, [r0, #4]
.L08043F8C:
	add r2, sp, #8
	adds r1, r2, #0
	movs r0, #0xfc
	lsls r0, r0, #8
	ldrh r1, [r1, #8]
	ands r0, r1
	movs r3, #0
	movs r1, #0x30
	orrs r0, r1
	strh r0, [r2, #8]
	adds r0, r2, #0
	strh r3, [r0, #0xc]
	bl BasPutOam
.L08043FA8:
	ldr r4, [sp, #0xd8]
	cmp r4, #1
	bne .L08043FBA
	ldr r0, .L08044164 @ =gUnk_Banim_02016E40
	ldr r1, .L08044168 @ =0x06013000
	movs r2, #0x80
	lsls r2, r2, #4
	bl RegisterDataMove
.L08043FBA:
	mov r0, sl
	ldr r4, [r0, #0x4c]
	cmp r4, #0
	bne .L0804401A
	str r4, [sp, #0x24]
	ldr r0, .L0804416C @ =gUnk_085CB5C8
	str r0, [sp, #0x44]
	add r0, sp, #8
	ldr r1, .L08044170 @ =0x000051D0
	strh r1, [r0, #8]
	adds r2, r0, #0
	mov r3, sl
	ldr r0, [r3, #0x44]
	orrs r0, r1
	strh r0, [r2, #8]
	adds r1, r2, #0
	ldr r0, [sp, #0xe0]
	adds r0, #0xf
	strh r0, [r1, #2]
	ldr r0, [sp, #0xe4]
	adds r0, #0x70
	strh r0, [r1, #4]
	adds r0, r1, #0
	strh r4, [r0, #0xc]
	bl BasPutOam
	str r4, [sp, #0x24]
	ldr r0, .L08044174 @ =gUnk_085CB5F8
	str r0, [sp, #0x44]
	add r0, sp, #8
	ldr r1, .L08044178 @ =0x000051C0
	strh r1, [r0, #8]
	adds r2, r0, #0
	mov r3, sl
	ldr r0, [r3, #0x44]
	orrs r0, r1
	strh r0, [r2, #8]
	adds r1, r2, #0
	ldr r0, [sp, #0xe0]
	adds r0, #0x65
	strh r0, [r1, #2]
	ldr r0, [sp, #0xe4]
	adds r0, #0x78
	strh r0, [r1, #4]
	adds r0, r1, #0
	strh r4, [r0, #0xc]
	bl BasPutOam
.L0804401A:
	mov r0, sl
	ldr r4, [r0, #0x50]
	cmp r4, #0
	bne .L0804407A
	str r4, [sp, #0x24]
	ldr r0, .L0804416C @ =gUnk_085CB5C8
	str r0, [sp, #0x44]
	add r0, sp, #8
	ldr r1, .L0804417C @ =0x000061F0
	strh r1, [r0, #8]
	adds r2, r0, #0
	mov r3, sl
	ldr r0, [r3, #0x44]
	orrs r0, r1
	strh r0, [r2, #8]
	adds r1, r2, #0
	ldr r0, [sp, #0xe0]
	adds r0, #0xd7
	strh r0, [r1, #2]
	ldr r0, [sp, #0xe4]
	adds r0, #0x70
	strh r0, [r1, #4]
	adds r0, r1, #0
	strh r4, [r0, #0xc]
	bl BasPutOam
	str r4, [sp, #0x24]
	ldr r0, .L08044180 @ =gUnk_085CB634
	str r0, [sp, #0x44]
	add r0, sp, #8
	ldr r1, .L08044184 @ =0x000061C0
	strh r1, [r0, #8]
	adds r2, r0, #0
	mov r3, sl
	ldr r0, [r3, #0x44]
	orrs r0, r1
	strh r0, [r2, #8]
	adds r1, r2, #0
	ldr r0, [sp, #0xe0]
	adds r0, #0x87
	strh r0, [r1, #2]
	ldr r0, [sp, #0xe4]
	adds r0, #0x78
	strh r0, [r1, #4]
	adds r0, r1, #0
	strh r4, [r0, #0xc]
	bl BasPutOam
.L0804407A:
	mov r0, sl
	ldr r4, [r0, #0x4c]
	cmp r4, #0
	bne .L080440E6
	str r4, [sp, #0x24]
	ldr r1, .L08044188 @ =gBanimWtaBonus
	movs r2, #0
	ldrsh r0, [r1, r2]
	ldr r5, [sp, #0xe4]
	adds r5, #0x7a
	cmp r0, #0
	beq .L080440C0
	adds r1, r0, #0
	add r0, sp, #8
	ldr r2, [sp, #0xe8]
	bl func_fe6_08043980
	add r0, sp, #8
	movs r1, #0xe5
	lsls r1, r1, #1
	strh r1, [r0, #8]
	adds r2, r0, #0
	mov r3, sl
	ldr r0, [r3, #0x44]
	orrs r0, r1
	strh r0, [r2, #8]
	adds r1, r2, #0
	ldr r0, [sp, #0xe0]
	adds r0, #0x36
	strh r0, [r1, #2]
	adds r0, r1, #0
	strh r5, [r0, #4]
	strh r4, [r0, #0xc]
	bl BasPutOam
.L080440C0:
	ldr r0, .L0804418C @ =gUnk_085CB670
	str r0, [sp, #0x44]
	add r0, sp, #8
	ldr r1, .L08044190 @ =0x0000D1DC
	strh r1, [r0, #8]
	adds r2, r0, #0
	mov r3, sl
	ldr r0, [r3, #0x44]
	orrs r0, r1
	strh r0, [r2, #8]
	adds r1, r2, #0
	ldr r0, [sp, #0xe0]
	adds r0, #0x2c
	strh r0, [r1, #2]
	adds r0, r1, #0
	strh r5, [r0, #4]
	strh r4, [r0, #0xc]
	bl BasPutOam
.L080440E6:
	mov r0, sl
	ldr r4, [r0, #0x50]
	cmp r4, #0
	bne .L08044152
	str r4, [sp, #0x24]
	ldr r1, .L08044188 @ =gBanimWtaBonus
	movs r2, #2
	ldrsh r0, [r1, r2]
	ldr r5, [sp, #0xe4]
	adds r5, #0x7a
	cmp r0, #0
	beq .L0804412C
	adds r1, r0, #0
	add r0, sp, #8
	ldr r2, [sp, #0xe8]
	bl func_fe6_08043980
	add r0, sp, #8
	movs r1, #0xe5
	lsls r1, r1, #1
	strh r1, [r0, #8]
	adds r2, r0, #0
	mov r3, sl
	ldr r0, [r3, #0x44]
	orrs r0, r1
	strh r0, [r2, #8]
	adds r1, r2, #0
	ldr r0, [sp, #0xe0]
	adds r0, #0x85
	strh r0, [r1, #2]
	adds r0, r1, #0
	strh r5, [r0, #4]
	strh r4, [r0, #0xc]
	bl BasPutOam
.L0804412C:
	ldr r0, .L0804418C @ =gUnk_085CB670
	str r0, [sp, #0x44]
	add r0, sp, #8
	ldr r1, .L08044194 @ =0x0000E1DE
	strh r1, [r0, #8]
	adds r2, r0, #0
	mov r3, sl
	ldr r0, [r3, #0x44]
	orrs r0, r1
	strh r0, [r2, #8]
	adds r1, r2, #0
	ldr r0, [sp, #0xe0]
	adds r0, #0x7b
	strh r0, [r1, #2]
	adds r0, r1, #0
	strh r5, [r0, #4]
	strh r4, [r0, #0xc]
	bl BasPutOam
.L08044152:
	add sp, #0x118
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08044164: .4byte gUnk_Banim_02016E40
.L08044168: .4byte 0x06013000
.L0804416C: .4byte gUnk_085CB5C8
.L08044170: .4byte 0x000051D0
.L08044174: .4byte gUnk_085CB5F8
.L08044178: .4byte 0x000051C0
.L0804417C: .4byte 0x000061F0
.L08044180: .4byte gUnk_085CB634
.L08044184: .4byte 0x000061C0
.L08044188: .4byte gBanimWtaBonus
.L0804418C: .4byte gUnk_085CB670
.L08044190: .4byte 0x0000D1DC
.L08044194: .4byte 0x0000E1DE
