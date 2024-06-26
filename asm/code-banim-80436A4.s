
	.include "macro.inc"

	.syntax unified

	thumb_func_start NewEkrGauge
NewEkrGauge: @ 0x080436A4
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	ldr r4, .L08043850 @ =gpProcEkrGauge
	ldr r0, .L08043854 @ =ProcScr_EkrGauge
	movs r1, #1
	bl SpawnProc
	str r0, [r4]
	movs r0, #0
	bl EkrGauge_08043908
	bl EkrGauge_080438C8
	bl DisableEkrGauge
	bl func_fe6_08043950
	ldr r1, .L08043858 @ =gEkrBg0QuakeVec
	movs r2, #0
	ldrsh r0, [r1, r2]
	movs r2, #2
	ldrsh r1, [r1, r2]
	bl func_fe6_08043918
	ldr r6, .L0804385C @ =gBanimFactionPal
	movs r1, #0
	ldrsh r0, [r6, r1]
	lsls r0, r0, #5
	ldr r4, .L08043860 @ =gUnk_08113424
	adds r0, r0, r4
	ldr r5, .L08043864 @ =gPal+0x360
	adds r1, r5, #0
	movs r2, #0x10
	bl CpuSet
	movs r2, #2
	ldrsh r0, [r6, r2]
	lsls r0, r0, #5
	adds r0, r0, r4
	adds r1, r5, #0
	adds r1, #0x20
	movs r2, #0x10
	bl CpuSet
	ldr r1, .L08043868 @ =0x0203CDA8
	ldr r2, .L0804386C @ =0x0000FFFF
	adds r0, r2, #0
	ldrh r2, [r1]
	orrs r2, r0
	strh r2, [r1]
	ldrh r2, [r1, #2]
	orrs r0, r2
	strh r0, [r1, #2]
	ldr r0, .L08043870 @ =gUnk_08112D54
	ldr r1, .L08043874 @ =0x06013800
	bl LZ77UnCompVram
	ldr r0, .L08043878 @ =gUnk_08112DF4
	ldr r1, .L0804387C @ =0x06013C00
	bl LZ77UnCompVram
	movs r1, #0
	ldrsh r0, [r6, r1]
	lsls r0, r0, #5
	ldr r4, .L08043880 @ =gUnk_081131A4
	adds r0, r0, r4
	adds r1, r5, #0
	subs r1, #0xc0
	movs r2, #8
	bl CpuFastSet
	movs r2, #2
	ldrsh r0, [r6, r2]
	lsls r0, r0, #5
	adds r0, r0, r4
	subs r5, #0xa0
	adds r1, r5, #0
	movs r2, #8
	bl CpuFastSet
	bl EnablePalSync
	ldr r6, .L08043884 @ =0x0203CDAC
	movs r1, #0
	ldrsh r0, [r6, r1]
	ldr r7, .L08043888 @ =gUnk_Banim_020176F8
	adds r1, r7, #0
	bl EkrGaugeModDec
	ldr r5, .L0804388C @ =0x0203CDB0
	movs r2, #0
	ldrsh r0, [r5, r2]
	adds r1, r7, #6
	bl EkrGaugeModDec
	ldr r4, .L08043890 @ =0x0203CDB4
	movs r1, #0
	ldrsh r0, [r4, r1]
	adds r1, r7, #0
	adds r1, #0xc
	bl EkrGaugeModDec
	movs r2, #2
	ldrsh r0, [r6, r2]
	adds r1, r7, #0
	adds r1, #0x12
	bl EkrGaugeModDec
	movs r1, #2
	ldrsh r0, [r5, r1]
	adds r1, r7, #0
	adds r1, #0x18
	bl EkrGaugeModDec
	movs r2, #2
	ldrsh r0, [r4, r2]
	adds r1, r7, #0
	adds r1, #0x1e
	bl EkrGaugeModDec
	movs r0, #0
	str r0, [sp]
	ldr r1, .L08043894 @ =gUnk_Banim_020169C0
	ldr r2, .L08043898 @ =0x01000100
	mov r0, sp
	bl CpuFastSet
	movs r6, #0
	mov sb, r7
.L080437AC:
	movs r5, #0
	lsls r3, r6, #1
	adds r0, r6, #1
	mov r8, r0
	lsls r4, r6, #7
.L080437B6:
	adds r0, r3, r6
	adds r0, r0, r5
	lsls r0, r0, #1
	add r0, sb
	ldrh r0, [r0]
	lsls r0, r0, #5
	ldr r1, .L0804389C @ =gUnk_08113024
	adds r0, r0, r1
	ldr r7, .L08043894 @ =gUnk_Banim_020169C0
	adds r1, r4, r7
	movs r2, #0x10
	str r3, [sp, #4]
	bl CpuSet
	adds r4, #0x20
	adds r5, #1
	ldr r3, [sp, #4]
	cmp r5, #2
	bls .L080437B6
	mov r6, r8
	cmp r6, #5
	bls .L080437AC
	ldr r1, .L080438A0 @ =0x06013A00
	movs r4, #0xc0
	lsls r4, r4, #1
	adds r0, r7, #0
	adds r2, r4, #0
	bl RegisterDataMove
	adds r0, r7, r4
	ldr r1, .L080438A4 @ =0x06013E00
	adds r2, r4, #0
	bl RegisterDataMove
	bl InitIcons
	movs r0, #0
	movs r1, #0x1d
	bl ApplyIconPalette
	movs r0, #0
	movs r1, #0x1e
	bl ApplyIconPalette
	ldr r0, .L080438A8 @ =gpEkrBattleUnitLeft
	ldr r0, [r0]
	adds r0, #0x4a
	ldrh r0, [r0]
	bl GetItemIcon
	movs r1, #0xee
	lsls r1, r1, #1
	bl PutIconObjImg
	ldr r0, .L080438AC @ =gpEkrBattleUnitRight
	ldr r0, [r0]
	adds r0, #0x4a
	ldrh r0, [r0]
	bl GetItemIcon
	movs r1, #0xef
	lsls r1, r1, #1
	bl PutIconObjImg
	ldr r0, .L080438B0 @ =Pal_SystemObjects
	movs r1, #0x80
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08043850: .4byte gpProcEkrGauge
.L08043854: .4byte ProcScr_EkrGauge
.L08043858: .4byte gEkrBg0QuakeVec
.L0804385C: .4byte gBanimFactionPal
.L08043860: .4byte gUnk_08113424
.L08043864: .4byte gPal+0x360
.L08043868: .4byte 0x0203CDA8
.L0804386C: .4byte 0x0000FFFF
.L08043870: .4byte gUnk_08112D54
.L08043874: .4byte 0x06013800
.L08043878: .4byte gUnk_08112DF4
.L0804387C: .4byte 0x06013C00
.L08043880: .4byte gUnk_081131A4
.L08043884: .4byte 0x0203CDAC
.L08043888: .4byte gUnk_Banim_020176F8
.L0804388C: .4byte 0x0203CDB0
.L08043890: .4byte 0x0203CDB4
.L08043894: .4byte gUnk_Banim_020169C0
.L08043898: .4byte 0x01000100
.L0804389C: .4byte gUnk_08113024
.L080438A0: .4byte 0x06013A00
.L080438A4: .4byte 0x06013E00
.L080438A8: .4byte gpEkrBattleUnitLeft
.L080438AC: .4byte gpEkrBattleUnitRight
.L080438B0: .4byte Pal_SystemObjects

	thumb_func_start EndEkrGauge
EndEkrGauge: @ 0x080438B4
	push {lr}
	ldr r0, .L080438C4 @ =gpProcEkrGauge
	ldr r0, [r0]
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
.L080438C4: .4byte gpProcEkrGauge

	thumb_func_start EkrGauge_080438C8
EkrGauge_080438C8: @ 0x080438C8
	ldr r0, .L080438D4 @ =gpProcEkrGauge
	ldr r1, [r0]
	movs r0, #0
	str r0, [r1, #0x4c]
	str r0, [r1, #0x50]
	bx lr
	.align 2, 0
.L080438D4: .4byte gpProcEkrGauge

	thumb_func_start EkrGauge_080438D8
EkrGauge_080438D8: @ 0x080438D8
	ldr r0, .L080438E4 @ =gpProcEkrGauge
	ldr r1, [r0]
	movs r0, #1
	str r0, [r1, #0x4c]
	str r0, [r1, #0x50]
	bx lr
	.align 2, 0
.L080438E4: .4byte gpProcEkrGauge

	thumb_func_start func_fe6_080438E8
func_fe6_080438E8: @ 0x080438E8
	ldr r0, .L080438F4 @ =gpProcEkrGauge
	ldr r1, [r0]
	movs r0, #1
	str r0, [r1, #0x4c]
	bx lr
	.align 2, 0
.L080438F4: .4byte gpProcEkrGauge

	thumb_func_start func_fe6_080438F8
func_fe6_080438F8: @ 0x080438F8
	ldr r0, .L08043904 @ =gpProcEkrGauge
	ldr r1, [r0]
	movs r0, #1
	str r0, [r1, #0x50]
	bx lr
	.align 2, 0
.L08043904: .4byte gpProcEkrGauge

	thumb_func_start EkrGauge_08043908
EkrGauge_08043908: @ 0x08043908
	lsls r0, r0, #0x10
	ldr r1, .L08043914 @ =gpProcEkrGauge
	ldr r1, [r1]
	lsrs r0, r0, #6
	str r0, [r1, #0x44]
	bx lr
	.align 2, 0
.L08043914: .4byte gpProcEkrGauge

	thumb_func_start func_fe6_08043918
func_fe6_08043918: @ 0x08043918
	ldr r2, .L08043928 @ =gpProcEkrGauge
	ldr r2, [r2]
	movs r3, #0
	strh r0, [r2, #0x32]
	strh r1, [r2, #0x3a]
	adds r2, #0x29
	strb r3, [r2]
	bx lr
	.align 2, 0
.L08043928: .4byte gpProcEkrGauge

	thumb_func_start func_fe6_0804392C
func_fe6_0804392C: @ 0x0804392C
	ldr r2, .L0804393C @ =gpProcEkrGauge
	ldr r2, [r2]
	strh r0, [r2, #0x32]
	strh r1, [r2, #0x3a]
	adds r2, #0x29
	movs r0, #1
	strb r0, [r2]
	bx lr
	.align 2, 0
.L0804393C: .4byte gpProcEkrGauge

	thumb_func_start func_fe6_08043940
func_fe6_08043940: @ 0x08043940
	ldr r0, .L0804394C @ =gpProcEkrGauge
	ldr r0, [r0]
	adds r0, #0x29
	movs r1, #1
	strb r1, [r0]
	bx lr
	.align 2, 0
.L0804394C: .4byte gpProcEkrGauge

	thumb_func_start func_fe6_08043950
func_fe6_08043950: @ 0x08043950
	ldr r0, .L0804395C @ =gpProcEkrGauge
	ldr r0, [r0]
	adds r0, #0x29
	movs r1, #0
	strb r1, [r0]
	bx lr
	.align 2, 0
.L0804395C: .4byte gpProcEkrGauge

	thumb_func_start EnableEkrGauge
EnableEkrGauge: @ 0x08043960
	ldr r0, .L0804396C @ =gpProcEkrGauge
	ldr r0, [r0]
	adds r0, #0x2a
	movs r1, #1
	strb r1, [r0]
	bx lr
	.align 2, 0
.L0804396C: .4byte gpProcEkrGauge

	thumb_func_start DisableEkrGauge
DisableEkrGauge: @ 0x08043970
	ldr r0, .L0804397C @ =gpProcEkrGauge
	ldr r0, [r0]
	adds r0, #0x2a
	movs r1, #0
	strb r1, [r0]
	bx lr
	.align 2, 0
.L0804397C: .4byte gpProcEkrGauge

	thumb_func_start func_fe6_08043980
func_fe6_08043980: @ 0x08043980
	adds r3, r0, #0
	cmp r1, #0
	ble .L080439A8
	cmp r2, #1
	beq .L08043998
	cmp r2, #1
	bhs .L080439A0
	ldr r0, .L08043994 @ =gUnk_085CB688
	b .L080439C2
	.align 2, 0
.L08043994: .4byte gUnk_085CB688
.L08043998:
	ldr r0, .L0804399C @ =gUnk_085CB6A0
	b .L080439C2
	.align 2, 0
.L0804399C: .4byte gUnk_085CB6A0
.L080439A0:
	ldr r0, .L080439A4 @ =gUnk_085CB6B8
	b .L080439C2
	.align 2, 0
.L080439A4: .4byte gUnk_085CB6B8
.L080439A8:
	cmp r2, #1
	beq .L080439B8
	cmp r2, #1
	bhs .L080439C0
	ldr r0, .L080439B4 @ =gUnk_085CB6D0
	b .L080439C2
	.align 2, 0
.L080439B4: .4byte gUnk_085CB6D0
.L080439B8:
	ldr r0, .L080439BC @ =gUnk_085CB6E8
	b .L080439C2
	.align 2, 0
.L080439BC: .4byte gUnk_085CB6E8
.L080439C0:
	ldr r0, .L080439C8 @ =gUnk_085CB700
.L080439C2:
	str r0, [r3, #0x3c]
	bx lr
	.align 2, 0
.L080439C8: .4byte gUnk_085CB700

	thumb_func_start func_fe6_080439CC
func_fe6_080439CC: @ 0x080439CC
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
	ldr r1, .L08043B44 @ =0x0203CDA8
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
	ldr r0, .L08043B4C @ =0x0203CDA4
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
.L08043B44: .4byte 0x0203CDA8
.L08043B48: .4byte gEkrGaugeHp
.L08043B4C: .4byte 0x0203CDA4
.L08043B50: .4byte gEkrDistanceType
.L08043B54:
	ldr r0, .L08043B68 @ =gEkrPairSideVaild
	ldrh r0, [r0]
	cmp r0, #1
	bne .L08043B6C
	mov r1, sl
	movs r2, #0x32
	ldrsh r0, [r1, r2]
	adds r0, #0x38
	b .L08043B7C
	.align 2, 0
.L08043B68: .4byte gEkrPairSideVaild
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
	ldr r1, .L08043CC0 @ =gUnk_08113024
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
	bl func_fe6_080449E4
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
.L08043CC0: .4byte gUnk_08113024
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
	bl func_fe6_080449E4
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
	ldr r1, .L08044188 @ =0x0203CDC8
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
	ldr r1, .L08044188 @ =0x0203CDC8
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
.L08044188: .4byte 0x0203CDC8
.L0804418C: .4byte gUnk_085CB670
.L08044190: .4byte 0x0000D1DC
.L08044194: .4byte 0x0000E1DE

	thumb_func_start func_fe6_08044198
func_fe6_08044198: @ 0x08044198
	push {r4, lr}
	ldr r4, .L080441C0 @ =gUnk_Banim_02000064
	ldr r0, .L080441C4 @ =gUnk_085CB718
	movs r1, #5
	bl SpawnProc
	str r0, [r4]
	movs r0, #0
	movs r1, #0
	bl func_fe6_0804421C
	bl func_fe6_080441DC
	bl EkrGauge_08044274
	bl func_fe6_08044254
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L080441C0: .4byte gUnk_Banim_02000064
.L080441C4: .4byte gUnk_085CB718

	thumb_func_start func_fe6_080441C8
func_fe6_080441C8: @ 0x080441C8
	push {lr}
	ldr r0, .L080441D8 @ =gUnk_Banim_02000064
	ldr r0, [r0]
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
.L080441D8: .4byte gUnk_Banim_02000064

	thumb_func_start func_fe6_080441DC
func_fe6_080441DC: @ 0x080441DC
	ldr r0, .L080441E8 @ =gUnk_Banim_02000064
	ldr r1, [r0]
	movs r0, #0
	str r0, [r1, #0x4c]
	str r0, [r1, #0x50]
	bx lr
	.align 2, 0
.L080441E8: .4byte gUnk_Banim_02000064

	thumb_func_start func_fe6_080441EC
func_fe6_080441EC: @ 0x080441EC
	ldr r0, .L080441F8 @ =gUnk_Banim_02000064
	ldr r1, [r0]
	movs r0, #1
	str r0, [r1, #0x4c]
	str r0, [r1, #0x50]
	bx lr
	.align 2, 0
.L080441F8: .4byte gUnk_Banim_02000064

	thumb_func_start func_fe6_080441FC
func_fe6_080441FC: @ 0x080441FC
	ldr r0, .L08044208 @ =gUnk_Banim_02000064
	ldr r1, [r0]
	movs r0, #1
	str r0, [r1, #0x4c]
	bx lr
	.align 2, 0
.L08044208: .4byte gUnk_Banim_02000064

	thumb_func_start func_fe6_0804420C
func_fe6_0804420C: @ 0x0804420C
	ldr r0, .L08044218 @ =gUnk_Banim_02000064
	ldr r1, [r0]
	movs r0, #1
	str r0, [r1, #0x50]
	bx lr
	.align 2, 0
.L08044218: .4byte gUnk_Banim_02000064

	thumb_func_start func_fe6_0804421C
func_fe6_0804421C: @ 0x0804421C
	ldr r2, .L0804422C @ =gUnk_Banim_02000064
	ldr r2, [r2]
	movs r3, #0
	strh r0, [r2, #0x32]
	strh r1, [r2, #0x3a]
	adds r2, #0x29
	strb r3, [r2]
	bx lr
	.align 2, 0
.L0804422C: .4byte gUnk_Banim_02000064

	thumb_func_start func_fe6_08044230
func_fe6_08044230: @ 0x08044230
	ldr r2, .L08044240 @ =gUnk_Banim_02000064
	ldr r2, [r2]
	strh r0, [r2, #0x32]
	strh r1, [r2, #0x3a]
	adds r2, #0x29
	movs r0, #1
	strb r0, [r2]
	bx lr
	.align 2, 0
.L08044240: .4byte gUnk_Banim_02000064

	thumb_func_start func_fe6_08044244
func_fe6_08044244: @ 0x08044244
	ldr r0, .L08044250 @ =gUnk_Banim_02000064
	ldr r0, [r0]
	adds r0, #0x29
	movs r1, #1
	strb r1, [r0]
	bx lr
	.align 2, 0
.L08044250: .4byte gUnk_Banim_02000064

	thumb_func_start func_fe6_08044254
func_fe6_08044254: @ 0x08044254
	ldr r0, .L08044260 @ =gUnk_Banim_02000064
	ldr r0, [r0]
	adds r0, #0x29
	movs r1, #0
	strb r1, [r0]
	bx lr
	.align 2, 0
.L08044260: .4byte gUnk_Banim_02000064

	thumb_func_start EkrGauge_08044264
EkrGauge_08044264: @ 0x08044264
	ldr r0, .L08044270 @ =gUnk_Banim_02000064
	ldr r0, [r0]
	adds r0, #0x2a
	movs r1, #1
	strb r1, [r0]
	bx lr
	.align 2, 0
.L08044270: .4byte gUnk_Banim_02000064

	thumb_func_start EkrGauge_08044274
EkrGauge_08044274: @ 0x08044274
	ldr r0, .L08044280 @ =gUnk_Banim_02000064
	ldr r0, [r0]
	adds r0, #0x2a
	movs r1, #0
	strb r1, [r0]
	bx lr
	.align 2, 0
.L08044280: .4byte gUnk_Banim_02000064

	thumb_func_start func_fe6_08044284
func_fe6_08044284: @ 0x08044284
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r7, r0, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	cmp r0, #1
	beq .L08044374
	adds r0, r7, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #0
	bne .L08044374
	ldrh r1, [r7, #0x3a]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x13
	lsls r2, r0, #5
	mov r8, r2
	cmp r2, #0
	bge .L080442B6
	movs r1, #0
	mov r8, r1
.L080442B6:
	adds r6, r0, #7
	cmp r6, #6
	ble .L080442BE
	movs r6, #6
.L080442BE:
	movs r0, #6
	subs r0, r0, r6
	lsls r1, r0, #4
	subs r1, r1, r0
	lsls r1, r1, #1
	mov sl, r1
	ldr r0, .L080442DC @ =gEkrDistanceType
	movs r2, #0
	ldrsh r0, [r0, r2]
	cmp r0, #0
	blt .L080442E0
	cmp r0, #2
	bgt .L080442E0
	movs r4, #0
	b .L080442E2
	.align 2, 0
.L080442DC: .4byte gEkrDistanceType
.L080442E0:
	movs r4, #0xf
.L080442E2:
	ldr r0, .L08044384 @ =gBg0Tm
	mov sb, r0
	movs r0, #0x9f
	str r0, [sp]
	mov r0, sb
	movs r1, #0x1e
	movs r2, #7
	movs r3, #0
	bl FillBGRect
	cmp r6, #0
	ble .L0804436E
	ldr r0, [r7, #0x4c]
	cmp r0, #0
	bne .L08044334
	ldr r0, .L08044388 @ =gUnk_08112968
	add r0, sl
	mov r1, r8
	lsls r5, r1, #1
	lsls r1, r4, #1
	add r1, sb
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
.L08044334:
	ldr r0, [r7, #0x50]
	cmp r0, #0
	bne .L0804436E
	ldr r0, .L0804438C @ =gUnk_08112A1C
	add r0, sl
	mov r2, r8
	lsls r5, r2, #1
	movs r2, #0xf
	lsls r1, r2, #1
	add r1, sb
	adds r5, r5, r1
	lsls r4, r6, #0x10
	lsrs r4, r4, #0x10
	movs r1, #1
	rsbs r1, r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	adds r1, r5, #0
	adds r3, r4, #0
	bl EfxTmCpyBG
	movs r0, #0x80
	str r0, [sp]
	adds r0, r5, #0
	movs r1, #0xf
	adds r2, r4, #0
	movs r3, #3
	bl func_fe6_0805B01C
.L0804436E:
	movs r0, #1
	bl EnableBgSync
.L08044374:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08044384: .4byte gBg0Tm
.L08044388: .4byte gUnk_08112968
.L0804438C: .4byte gUnk_08112A1C

	thumb_func_start func_fe6_08044390
func_fe6_08044390: @ 0x08044390
	push {r4, r5, r6, lr}
	sub sp, #0x10
	ldr r4, .L08044484 @ =gDispIo
	movs r2, #8
	rsbs r2, r2, #0
	ldrb r0, [r4]
	ands r2, r0
	movs r5, #1
	ldrb r0, [r4, #1]
	orrs r0, r5
	movs r6, #2
	orrs r0, r6
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r4, #1]
	movs r0, #0x41
	rsbs r0, r0, #0
	ands r2, r0
	strb r2, [r4]
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
	movs r0, #0
	movs r1, #0
	bl SetBgChrOffset
	movs r0, #1
	movs r1, #0
	bl SetBgChrOffset
	movs r0, #2
	movs r1, #0
	bl SetBgChrOffset
	movs r1, #0x80
	lsls r1, r1, #8
	movs r0, #3
	bl SetBgChrOffset
	movs r1, #0xc0
	lsls r1, r1, #7
	movs r0, #0
	bl SetBgTilemapOffset
	movs r1, #0xd0
	lsls r1, r1, #7
	movs r0, #1
	bl SetBgTilemapOffset
	movs r1, #0xe0
	lsls r1, r1, #7
	movs r0, #2
	bl SetBgTilemapOffset
	movs r1, #0xf0
	lsls r1, r1, #7
	movs r0, #3
	bl SetBgTilemapOffset
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r2, [r4, #0xc]
	ands r0, r2
	strb r0, [r4, #0xc]
	adds r0, r1, #0
	ldrb r2, [r4, #0x10]
	ands r0, r2
	orrs r0, r5
	strb r0, [r4, #0x10]
	ldrb r0, [r4, #0x14]
	ands r1, r0
	orrs r1, r6
	strb r1, [r4, #0x14]
	movs r0, #3
	ldrb r1, [r4, #0x18]
	orrs r0, r1
	strb r0, [r4, #0x18]
	movs r4, #0
	str r4, [sp]
	ldr r1, .L08044488 @ =gBg0Tm
	ldr r5, .L0804448C @ =0x01000200
	mov r0, sp
	adds r2, r5, #0
	bl CpuFastSet
	str r4, [sp, #4]
	add r0, sp, #4
	ldr r1, .L08044490 @ =gBg1Tm
	adds r2, r5, #0
	bl CpuFastSet
	str r4, [sp, #8]
	add r0, sp, #8
	ldr r6, .L08044494 @ =gBg2Tm
	adds r1, r6, #0
	adds r2, r5, #0
	bl CpuFastSet
	bl GetBattleAnimArenaFlag
	cmp r0, #0
	bne .L08044498
	bl func_fe6_080444EC
	b .L080444A4
	.align 2, 0
.L08044484: .4byte gDispIo
.L08044488: .4byte gBg0Tm
.L0804448C: .4byte 0x01000200
.L08044490: .4byte gBg1Tm
.L08044494: .4byte gBg2Tm
.L08044498:
	str r4, [sp, #0xc]
	add r0, sp, #0xc
	adds r1, r6, #0
	adds r2, r5, #0
	bl CpuFastSet
.L080444A4:
	bl EfxPrepareScreenFx
	bl EnablePalSync
	movs r0, #1
	bl EnableBgSync
	movs r0, #2
	bl EnableBgSync
	movs r0, #4
	bl EnableBgSync
	ldr r3, .L080444E8 @ =gDispIo
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
	add sp, #0x10
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L080444E8: .4byte gDispIo

	thumb_func_start func_fe6_080444EC
func_fe6_080444EC: @ 0x080444EC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r4, .L0804452C @ =gUnk_Banim_0201E0FC
	ldr r2, .L08044530 @ =gBanimFloorfx
	movs r0, #0
	ldrsh r1, [r2, r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	ldr r3, .L08044534 @ =0x087EA008
	adds r5, r0, r3
	movs r6, #2
	ldrsh r1, [r2, r6]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r3, r0, r3
	ldr r0, .L08044538 @ =gEkrDistanceType
	movs r7, #0
	ldrsh r1, [r0, r7]
	mov r8, r2
	adds r6, r0, #0
	cmp r1, #3
	bgt .L08044540
	cmp r1, #1
	bge .L08044564
	cmp r1, #0
	beq .L08044548
	ldr r0, .L0804453C @ =gUnk_Banim_020145C0
	b .L08044576
	.align 2, 0
.L0804452C: .4byte gUnk_Banim_0201E0FC
.L08044530: .4byte gBanimFloorfx
.L08044534: .4byte 0x087EA008
.L08044538: .4byte gEkrDistanceType
.L0804453C: .4byte gUnk_Banim_020145C0
.L08044540:
	ldr r7, .L0804455C @ =gUnk_Banim_020145C0
	mov ip, r7
	cmp r1, #4
	bne .L08044578
.L08044548:
	ldr r0, .L08044560 @ =gUnk_Banim_02000034
	ldr r1, .L0804455C @ =gUnk_Banim_020145C0
	str r1, [r0]
	movs r7, #0x80
	lsls r7, r7, #5
	adds r2, r1, r7
	str r2, [r0, #4]
	mov ip, r1
	b .L08044578
	.align 2, 0
.L0804455C: .4byte gUnk_Banim_020145C0
.L08044560: .4byte gUnk_Banim_02000034
.L08044564:
	ldr r0, .L080445E8 @ =gUnk_Banim_02000034
	ldr r1, .L080445EC @ =gUnk_Banim_02014DC0
	str r1, [r0]
	movs r7, #0x80
	lsls r7, r7, #5
	adds r2, r1, r7
	str r2, [r0, #4]
	ldr r0, .L080445F0 @ =0xFFFFF800
	adds r0, r0, r1
.L08044576:
	mov ip, r0
.L08044578:
	ldr r0, .L080445F4 @ =gPlaySt
	ldrb r0, [r0, #0x15]
	ldr r0, .L080445F8 @ =gUnk_Banim_02000044
	ldr r1, [r5, #0x10]
	str r1, [r0]
	ldr r1, [r3, #0x10]
	str r1, [r0, #4]
	ldr r2, .L080445FC @ =gUnk_Banim_0200003C
	ldr r1, .L08044600 @ =gUnk_085CBDB0
	movs r3, #0
	ldrsh r0, [r6, r3]
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r0, [r0]
	str r0, [r2]
	movs r7, #0
	ldrsh r0, [r6, r7]
	lsls r0, r0, #1
	adds r0, #1
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	str r0, [r2, #4]
	mov r1, r8
	ldrh r0, [r1]
	movs r2, #0
	strh r0, [r4]
	movs r0, #4
	strh r0, [r4, #2]
	movs r1, #0xa0
	lsls r1, r1, #2
	strh r1, [r4, #4]
	mov r3, r8
	ldrh r0, [r3, #2]
	strh r0, [r4, #6]
	movs r0, #5
	strh r0, [r4, #8]
	strh r1, [r4, #0xa]
	ldrh r0, [r6]
	strh r0, [r4, #0xc]
	movs r0, #2
	strh r0, [r4, #0xe]
	str r2, [r4, #0x1c]
	mov r6, ip
	str r6, [r4, #0x20]
	ldr r0, .L08044604 @ =gEkrSnowWeather
	ldrh r0, [r0]
	strh r0, [r4, #0x10]
	adds r0, r4, #0
	bl func_fe6_0804BF40
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L080445E8: .4byte gUnk_Banim_02000034
.L080445EC: .4byte gUnk_Banim_02014DC0
.L080445F0: .4byte 0xFFFFF800
.L080445F4: .4byte gPlaySt
.L080445F8: .4byte gUnk_Banim_02000044
.L080445FC: .4byte gUnk_Banim_0200003C
.L08044600: .4byte gUnk_085CBDB0
.L08044604: .4byte gEkrSnowWeather

	thumb_func_start EfxPrepareScreenFx
EfxPrepareScreenFx: @ 0x08044608
	push {r4, r5, r6, lr}
	sub sp, #8
	ldr r4, .L08044648 @ =Pal_Text
	adds r0, r4, #0
	movs r1, #0x40
	movs r2, #0x20
	bl ApplyPaletteExt
	adds r0, r4, #0
	movs r1, #0x60
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, .L0804464C @ =gUnk_Banim_02017640
	ldr r1, .L08044650 @ =0x06001400
	movs r2, #0xa0
	movs r3, #2
	bl InitTextFont
	bl SetTextDrawNoClear
	ldr r0, .L08044654 @ =gUnk_081125E0
	ldr r1, .L08044658 @ =0x06001000
	bl LZ77UnCompVram
	ldr r0, .L0804465C @ =gEkrPairSideVaild
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne .L08044664
	ldr r5, .L08044660 @ =gNopStr
	b .L08044672
	.align 2, 0
.L08044648: .4byte Pal_Text
.L0804464C: .4byte gUnk_Banim_02017640
.L08044650: .4byte 0x06001400
.L08044654: .4byte gUnk_081125E0
.L08044658: .4byte 0x06001000
.L0804465C: .4byte gEkrPairSideVaild
.L08044660: .4byte gNopStr
.L08044664:
	ldr r0, .L080446AC @ =gpEkrBattleUnitLeft
	ldr r0, [r0]
	ldr r0, [r0]
	ldrh r0, [r0]
	bl DecodeMsg
	adds r5, r0, #0
.L08044672:
	ldr r4, .L080446B0 @ =gUnk_Banim_02017658
	adds r0, r4, #0
	movs r1, #6
	bl InitText
	movs r0, #0x30
	adds r1, r5, #0
	bl GetStringTextCenteredPos
	adds r1, r0, #0
	adds r0, r4, #0
	bl Text_SetCursor
	ldr r0, .L080446B4 @ =gUnk_081127F0
	ldr r1, .L080446B8 @ =0x06001400
	bl LZ77UnCompVram
	adds r0, r4, #0
	adds r1, r5, #0
	bl Text_DrawString
	ldr r0, .L080446BC @ =gEkrPairSideVaild
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne .L080446C4
	ldr r5, .L080446C0 @ =gNopStr
	b .L080446D2
	.align 2, 0
.L080446AC: .4byte gpEkrBattleUnitLeft
.L080446B0: .4byte gUnk_Banim_02017658
.L080446B4: .4byte gUnk_081127F0
.L080446B8: .4byte 0x06001400
.L080446BC: .4byte gEkrPairSideVaild
.L080446C0: .4byte gNopStr
.L080446C4:
	ldr r0, .L0804470C @ =gpEkrBattleUnitLeft
	ldr r0, [r0]
	adds r0, #0x4a
	ldrh r0, [r0]
	bl GetItemName
	adds r5, r0, #0
.L080446D2:
	ldr r4, .L08044710 @ =gUnk_Banim_02017668
	adds r0, r4, #0
	movs r1, #7
	bl InitText
	movs r0, #0x38
	adds r1, r5, #0
	bl GetStringTextCenteredPos
	adds r1, r0, #0
	adds r0, r4, #0
	bl Text_SetCursor
	ldr r0, .L08044714 @ =gUnk_08112840
	ldr r1, .L08044718 @ =0x06001580
	bl LZ77UnCompVram
	adds r0, r4, #0
	adds r1, r5, #0
	bl Text_DrawString
	ldr r0, .L0804471C @ =gEkrPairSideVaild
	movs r1, #2
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne .L08044724
	ldr r5, .L08044720 @ =gNopStr
	b .L08044732
	.align 2, 0
.L0804470C: .4byte gpEkrBattleUnitLeft
.L08044710: .4byte gUnk_Banim_02017668
.L08044714: .4byte gUnk_08112840
.L08044718: .4byte 0x06001580
.L0804471C: .4byte gEkrPairSideVaild
.L08044720: .4byte gNopStr
.L08044724:
	ldr r0, .L0804476C @ =gpEkrBattleUnitRight
	ldr r0, [r0]
	ldr r0, [r0]
	ldrh r0, [r0]
	bl DecodeMsg
	adds r5, r0, #0
.L08044732:
	ldr r4, .L08044770 @ =gUnk_Banim_02017670
	adds r0, r4, #0
	movs r1, #6
	bl InitText
	movs r0, #0x30
	adds r1, r5, #0
	bl GetStringTextCenteredPos
	adds r1, r0, #0
	adds r0, r4, #0
	bl Text_SetCursor
	ldr r0, .L08044774 @ =gUnk_081128AC
	ldr r1, .L08044778 @ =0x06001740
	bl LZ77UnCompVram
	adds r0, r4, #0
	adds r1, r5, #0
	bl Text_DrawString
	ldr r0, .L0804477C @ =gEkrPairSideVaild
	movs r1, #2
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne .L08044784
	ldr r5, .L08044780 @ =gNopStr
	b .L08044792
	.align 2, 0
.L0804476C: .4byte gpEkrBattleUnitRight
.L08044770: .4byte gUnk_Banim_02017670
.L08044774: .4byte gUnk_081128AC
.L08044778: .4byte 0x06001740
.L0804477C: .4byte gEkrPairSideVaild
.L08044780: .4byte gNopStr
.L08044784:
	ldr r0, .L08044848 @ =gpEkrBattleUnitRight
	ldr r0, [r0]
	adds r0, #0x4a
	ldrh r0, [r0]
	bl GetItemName
	adds r5, r0, #0
.L08044792:
	ldr r4, .L0804484C @ =gUnk_Banim_02017660
	adds r0, r4, #0
	movs r1, #7
	bl InitText
	movs r0, #0x38
	adds r1, r5, #0
	bl GetStringTextCenteredPos
	adds r1, r0, #0
	adds r0, r4, #0
	bl Text_SetCursor
	ldr r0, .L08044850 @ =gUnk_081128FC
	ldr r1, .L08044854 @ =0x060018C0
	bl LZ77UnCompVram
	adds r0, r4, #0
	adds r1, r5, #0
	bl Text_DrawString
	ldr r4, .L08044858 @ =gBg0Tm
	adds r0, r4, #0
	movs r1, #0x9f
	bl TmFill
	ldr r0, .L0804485C @ =gUnk_08112C84
	adds r6, r4, #0
	adds r6, #0x3c
	movs r1, #1
	rsbs r1, r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	adds r1, r6, #0
	movs r2, #2
	movs r3, #0x14
	bl EfxTmCpyBG
	adds r4, #0x3e
	movs r5, #0x80
	str r5, [sp]
	adds r0, r4, #0
	movs r1, #1
	movs r2, #0x14
	movs r3, #2
	bl func_fe6_0805B01C
	str r5, [sp]
	adds r0, r6, #0
	movs r1, #1
	movs r2, #0x14
	movs r3, #3
	bl func_fe6_0805B01C
	movs r0, #1
	bl EnableBgSync
	ldr r6, .L08044860 @ =gBanimFactionPal
	movs r1, #0
	ldrsh r0, [r6, r1]
	lsls r0, r0, #5
	ldr r5, .L08044864 @ =gUnk_08112CD4
	adds r0, r0, r5
	ldr r4, .L08044868 @ =gPal+0x40
	adds r1, r4, #0
	movs r2, #8
	bl CpuFastSet
	movs r1, #2
	ldrsh r0, [r6, r1]
	lsls r0, r0, #5
	adds r0, r0, r5
	adds r4, #0x20
	adds r1, r4, #0
	movs r2, #8
	bl CpuFastSet
	bl EnablePalSync
	ldr r1, .L0804486C @ =gEkrBg0QuakeVec
	movs r0, #0
	strh r0, [r1]
	strh r0, [r1, #2]
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08044848: .4byte gpEkrBattleUnitRight
.L0804484C: .4byte gUnk_Banim_02017660
.L08044850: .4byte gUnk_081128FC
.L08044854: .4byte 0x060018C0
.L08044858: .4byte gBg0Tm
.L0804485C: .4byte gUnk_08112C84
.L08044860: .4byte gBanimFactionPal
.L08044864: .4byte gUnk_08112CD4
.L08044868: .4byte gPal+0x40
.L0804486C: .4byte gEkrBg0QuakeVec

	thumb_func_start GetBanimInitPosReal
GetBanimInitPosReal: @ 0x08044870
	push {r4, r5, lr}
	ldr r0, .L08044888 @ =gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #4
	bhi .L080448B0
	lsls r0, r0, #2
	ldr r1, .L0804488C @ =.L08044890
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
.L08044888: .4byte gEkrDistanceType
.L0804488C: .4byte .L08044890
.L08044890: @ jump table
	.4byte .L080448F8 @ case 0
	.4byte .L080448A4 @ case 1
	.4byte .L080448B0 @ case 2
	.4byte .L080448F8 @ case 3
	.4byte .L080448F8 @ case 4
.L080448A4:
	ldr r0, .L080448AC @ =gEkrInitialHitSide
	movs r2, #0
	ldrsh r0, [r0, r2]
	b .L080448FA
	.align 2, 0
.L080448AC: .4byte gEkrInitialHitSide
.L080448B0:
	movs r1, #0
	movs r5, #0
	ldr r0, .L080448E0 @ =gEkrDebugModeMaybe
	movs r2, #0
	ldrsh r0, [r0, r2]
	cmp r0, #0
	bne .L080448D8
	ldr r4, .L080448E4 @ =gEkrPids
	ldrb r0, [r4]
	ldrb r1, [r4, #1]
	bl CheckBattleTalk
	lsls r0, r0, #0x18
	asrs r5, r0, #0x18
	ldrb r0, [r4, #1]
	ldrb r1, [r4]
	bl CheckBattleTalk
	lsls r0, r0, #0x18
	asrs r1, r0, #0x18
.L080448D8:
	cmp r5, #1
	bne .L080448E8
	movs r0, #0
	b .L080448FA
	.align 2, 0
.L080448E0: .4byte gEkrDebugModeMaybe
.L080448E4: .4byte gEkrPids
.L080448E8:
	cmp r1, #1
	beq .L080448F8
	ldr r0, .L080448F4 @ =gEkrInitialHitSide
	movs r1, #0
	ldrsh r0, [r0, r1]
	b .L080448FA
	.align 2, 0
.L080448F4: .4byte gEkrInitialHitSide
.L080448F8:
	movs r0, #1
.L080448FA:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start EkrEfxStatusClear
EkrEfxStatusClear: @ 0x08044900
	push {r4, lr}
	ldr r0, .L0804496C @ =gEkrHPBarCount
	movs r4, #0
	str r4, [r0]
	ldr r0, .L08044970 @ =gEfxSpellAnimExists
	str r4, [r0]
	ldr r0, .L08044974 @ =gUnk_Banim_02017728
	str r4, [r0]
	ldr r0, .L08044978 @ =gEkrDeadEventExist
	str r4, [r0]
	ldr r0, .L0804497C @ =gUnk_Banim_02017734
	str r4, [r0]
	ldr r0, .L08044980 @ =gUnk_Banim_02017738
	str r4, [r0]
	ldr r0, .L08044984 @ =gUnk_Banim_02017740
	str r4, [r0]
	ldr r0, .L08044988 @ =gEfxBgSemaphore
	str r4, [r0]
	ldr r0, .L0804498C @ =gUnk_Banim_02017748
	str r4, [r0]
	ldr r0, .L08044990 @ =gUnk_Banim_0201774C
	str r4, [r0]
	ldr r0, .L08044994 @ =gUnk_Banim_02017750
	str r4, [r0]
	ldr r0, .L08044998 @ =gUnk_Banim_02017754
	str r4, [r0]
	ldr r0, .L0804499C @ =gEkrBg2QuakeVec
	strh r4, [r0]
	strh r4, [r0, #2]
	ldr r0, .L080449A0 @ =gUnk_Banim_0201775C
	strh r4, [r0]
	strh r4, [r0, #2]
	ldr r0, .L080449A4 @ =gUnk_Banim_02017760
	strh r4, [r0]
	strh r4, [r0, #2]
	ldr r0, .L080449A8 @ =gUnk_Banim_02017778
	strh r4, [r0]
	strh r4, [r0, #2]
	ldr r0, .L080449AC @ =gUnk_Banim_02017764
	str r4, [r0]
	str r4, [r0, #4]
	ldr r0, .L080449B0 @ =gUnk_Banim_02017770
	str r4, [r0]
	ldr r0, .L080449B4 @ =gUnk_Banim_02017774
	str r4, [r0]
	ldr r0, .L080449B8 @ =gUnk_08113D70
	ldr r1, .L080449BC @ =0x06012000
	bl LZ77UnCompVram
	ldr r0, .L080449C0 @ =gUnk_Banim_0201E7A4
	str r4, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0804496C: .4byte gEkrHPBarCount
.L08044970: .4byte gEfxSpellAnimExists
.L08044974: .4byte gUnk_Banim_02017728
.L08044978: .4byte gEkrDeadEventExist
.L0804497C: .4byte gUnk_Banim_02017734
.L08044980: .4byte gUnk_Banim_02017738
.L08044984: .4byte gUnk_Banim_02017740
.L08044988: .4byte gEfxBgSemaphore
.L0804498C: .4byte gUnk_Banim_02017748
.L08044990: .4byte gUnk_Banim_0201774C
.L08044994: .4byte gUnk_Banim_02017750
.L08044998: .4byte gUnk_Banim_02017754
.L0804499C: .4byte gEkrBg2QuakeVec
.L080449A0: .4byte gUnk_Banim_0201775C
.L080449A4: .4byte gUnk_Banim_02017760
.L080449A8: .4byte gUnk_Banim_02017778
.L080449AC: .4byte gUnk_Banim_02017764
.L080449B0: .4byte gUnk_Banim_02017770
.L080449B4: .4byte gUnk_Banim_02017774
.L080449B8: .4byte gUnk_08113D70
.L080449BC: .4byte 0x06012000
.L080449C0: .4byte gUnk_Banim_0201E7A4

	thumb_func_start func_fe6_080449C4
func_fe6_080449C4: @ 0x080449C4
	ldr r0, .L080449D8 @ =gEkrHPBarCount
	ldr r0, [r0]
	cmp r0, #0
	bne .L080449E0
	ldr r0, .L080449DC @ =gEfxSpellAnimExists
	ldr r0, [r0]
	cmp r0, #0
	bne .L080449E0
	movs r0, #1
	b .L080449E2
	.align 2, 0
.L080449D8: .4byte gEkrHPBarCount
.L080449DC: .4byte gEfxSpellAnimExists
.L080449E0:
	movs r0, #0
.L080449E2:
	bx lr

	thumb_func_start func_fe6_080449E4
func_fe6_080449E4: @ 0x080449E4
	ldr r1, .L080449F0 @ =gUnk_Banim_02017778
	lsls r0, r0, #1
	adds r0, r0, r1
	movs r1, #0
	ldrsh r0, [r0, r1]
	bx lr
	.align 2, 0
.L080449F0: .4byte gUnk_Banim_02017778

	thumb_func_start NewEfxHPBar
NewEfxHPBar: @ 0x080449F4
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r1, .L08044A24 @ =gEkrHPBarCount
	ldr r0, [r1]
	cmp r0, #0
	bne .L08044AB4
	movs r0, #1
	str r0, [r1]
	ldr r0, .L08044A28 @ =gUnk_085CB730
	movs r1, #3
	bl SpawnProc
	adds r6, r0, #0
	str r4, [r6, #0x64]
	adds r0, r4, #0
	bl GetAnimPosition
	cmp r0, #0
	bne .L08044A30
	ldr r0, .L08044A2C @ =gAnims
	ldr r1, [r0, #8]
	str r1, [r6, #0x5c]
	ldr r0, [r0]
	b .L08044A38
	.align 2, 0
.L08044A24: .4byte gEkrHPBarCount
.L08044A28: .4byte gUnk_085CB730
.L08044A2C: .4byte gAnims
.L08044A30:
	ldr r0, .L08044A8C @ =gAnims
	ldr r1, [r0]
	str r1, [r6, #0x5c]
	ldr r0, [r0, #8]
.L08044A38:
	str r0, [r6, #0x60]
	ldr r4, .L08044A90 @ =0x0203CD46
	ldr r0, [r6, #0x60]
	bl GetAnimPosition
	lsls r0, r0, #1
	adds r0, r0, r4
	movs r1, #0
	ldrsh r5, [r0, r1]
	adds r4, r5, #1
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	ldr r0, [r6, #0x60]
	bl GetAnimPosition
	lsls r5, r5, #1
	adds r5, r5, r0
	adds r0, r5, #0
	bl GetEfxHp
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [r6, #0x4c]
	ldr r0, [r6, #0x60]
	bl GetAnimPosition
	lsls r4, r4, #0x10
	asrs r4, r4, #0xf
	adds r4, r4, r0
	adds r0, r4, #0
	bl GetEfxHp
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [r6, #0x50]
	ldr r1, [r6, #0x4c]
	cmp r1, r0
	ble .L08044A94
	movs r0, #1
	rsbs r0, r0, #0
	b .L08044A96
	.align 2, 0
.L08044A8C: .4byte gAnims
.L08044A90: .4byte 0x0203CD46
.L08044A94:
	movs r0, #1
.L08044A96:
	str r0, [r6, #0x48]
	movs r1, #0
	strh r1, [r6, #0x2c]
	ldr r0, [r6, #0x4c]
	strh r0, [r6, #0x2e]
	str r1, [r6, #0x54]
	str r1, [r6, #0x58]
	ldr r0, [r6, #0x60]
	bl GetAnimPosition
	ldr r1, .L08044ABC @ =gUnk_Banim_02017778
	lsls r0, r0, #1
	adds r0, r0, r1
	movs r1, #1
	strh r1, [r0]
.L08044AB4:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08044ABC: .4byte gUnk_Banim_02017778

	thumb_func_start func_fe6_08044AC0
func_fe6_08044AC0: @ 0x08044AC0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	ldr r4, .L08044B88 @ =gAnims
	ldr r0, [r5, #0x60]
	bl GetAnimPosition
	lsls r0, r0, #3
	adds r0, r0, r4
	ldr r6, [r0]
	ldr r0, [r5, #0x60]
	bl GetAnimPosition
	lsls r0, r0, #1
	adds r0, #1
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r7, [r0]
	ldr r1, [r5, #0x58]
	cmp r1, #0
	bne .L08044B26
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #2
	bne .L08044B26
	strh r1, [r5, #0x2c]
	ldr r0, [r5, #0x48]
	ldrh r1, [r5, #0x2e]
	adds r0, r1, r0
	strh r0, [r5, #0x2e]
	ldr r0, [r5, #0x60]
	bl GetAnimPosition
	ldr r1, .L08044B8C @ =gEkrGaugeHp
	lsls r0, r0, #1
	adds r0, r0, r1
	ldr r1, [r5, #0x48]
	ldrh r2, [r0]
	adds r1, r2, r1
	strh r1, [r0]
	movs r0, #0x2e
	ldrsh r1, [r5, r0]
	ldr r0, [r5, #0x50]
	cmp r1, r0
	bne .L08044B26
	movs r0, #1
	str r0, [r5, #0x58]
.L08044B26:
	ldr r1, .L08044B90 @ =gEkrPids
	mov r8, r1
	ldr r0, [r5, #0x60]
	bl GetAnimPosition
	add r0, r8
	ldrb r0, [r0]
	cmp r0, #0x66
	beq .L08044B46
	ldr r0, [r5, #0x60]
	bl GetAnimPosition
	add r0, r8
	ldrb r0, [r0]
	cmp r0, #3
	bne .L08044BC0
.L08044B46:
	ldr r1, [r5, #0x54]
	cmp r1, #0x50
	bne .L08044BB4
	ldr r0, [r5, #0x58]
	cmp r0, #1
	bne .L08044BB4
	ldr r4, .L08044B94 @ =0x0203CD46
	ldr r0, [r5, #0x60]
	bl GetAnimPosition
	lsls r0, r0, #1
	adds r0, r0, r4
	ldrh r1, [r0]
	adds r1, #1
	movs r4, #0
	strh r1, [r0]
	ldr r0, [r5, #0x60]
	bl GetAnimPosition
	ldr r1, .L08044B98 @ =gUnk_Banim_02017778
	lsls r0, r0, #1
	adds r0, r0, r1
	strh r4, [r0]
	ldr r0, [r5, #0x50]
	cmp r0, #0
	bne .L08044C44
	bl GetBanimLinkArenaFlag
	cmp r0, #1
	bne .L08044B9C
	movs r0, #0
	b .L08044BAE
	.align 2, 0
.L08044B88: .4byte gAnims
.L08044B8C: .4byte gEkrGaugeHp
.L08044B90: .4byte gEkrPids
.L08044B94: .4byte 0x0203CD46
.L08044B98: .4byte gUnk_Banim_02017778
.L08044B9C:
	adds r0, r6, #0
	bl GetAnimPosition
	add r0, r8
	ldrb r0, [r0]
	bl CheckBattleDefeatTalk
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
.L08044BAE:
	cmp r0, #1
	beq .L08044C1E
	b .L08044C28
.L08044BB4:
	adds r0, r1, #1
	str r0, [r5, #0x54]
	cmp r0, #0x4f
	bls .L08044C5C
	movs r0, #0x50
	b .L08044C5A
.L08044BC0:
	ldr r1, [r5, #0x54]
	cmp r1, #0x1e
	bne .L08044C50
	ldr r0, [r5, #0x58]
	cmp r0, #1
	bne .L08044C50
	ldr r4, .L08044C00 @ =0x0203CD46
	ldr r0, [r5, #0x60]
	bl GetAnimPosition
	lsls r0, r0, #1
	adds r0, r0, r4
	ldrh r1, [r0]
	adds r1, #1
	movs r4, #0
	strh r1, [r0]
	ldr r0, [r5, #0x60]
	bl GetAnimPosition
	ldr r1, .L08044C04 @ =gUnk_Banim_02017778
	lsls r0, r0, #1
	adds r0, r0, r1
	strh r4, [r0]
	ldr r0, [r5, #0x50]
	cmp r0, #0
	bne .L08044C44
	bl GetBanimLinkArenaFlag
	cmp r0, #1
	bne .L08044C08
	movs r0, #0
	b .L08044C1A
	.align 2, 0
.L08044C00: .4byte 0x0203CD46
.L08044C04: .4byte gUnk_Banim_02017778
.L08044C08:
	adds r0, r6, #0
	bl GetAnimPosition
	add r0, r8
	ldrb r0, [r0]
	bl CheckBattleDefeatTalk
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
.L08044C1A:
	cmp r0, #1
	bne .L08044C28
.L08044C1E:
	adds r0, r6, #0
	adds r1, r7, #0
	bl func_fe6_080455C0
	b .L08044C44
.L08044C28:
	bl func_fe6_0804C554
	adds r0, r6, #0
	adds r1, r7, #0
	bl func_fe6_080457E8
	ldr r0, [r5, #0x60]
	bl GetAnimPosition
	ldr r1, .L08044C4C @ =gEkrPairSideVaild
	lsls r0, r0, #1
	adds r0, r0, r1
	movs r1, #0
	strh r1, [r0]
.L08044C44:
	adds r0, r5, #0
	bl Proc_Break
	b .L08044C5C
	.align 2, 0
.L08044C4C: .4byte gEkrPairSideVaild
.L08044C50:
	adds r0, r1, #1
	str r0, [r5, #0x54]
	cmp r0, #0x1d
	bls .L08044C5C
	movs r0, #0x1e
.L08044C5A:
	str r0, [r5, #0x54]
.L08044C5C:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_fe6_08044C68
func_fe6_08044C68: @ 0x08044C68
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, .L08044CB0 @ =gEfxBgSemaphore
	ldr r0, [r0]
	cmp r0, #0
	bne .L08044D00
	ldr r0, .L08044CB4 @ =gEfxSpellAnimExists
	ldr r0, [r0]
	cmp r0, #0
	bne .L08044D00
	strh r0, [r5, #0x2c]
	movs r0, #1
	strh r0, [r5, #0x2e]
	ldr r0, [r5, #0x64]
	bl GetAnimAnotherSide
	adds r4, r0, #0
	bl GetAnimNextRoundType
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl CheckRound2
	cmp r0, #1
	bne .L08044CFA
	ldr r0, .L08044CB8 @ =gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #4
	bhi .L08044CFA
	lsls r0, r0, #2
	ldr r1, .L08044CBC @ =.L08044CC0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
.L08044CB0: .4byte gEfxBgSemaphore
.L08044CB4: .4byte gEfxSpellAnimExists
.L08044CB8: .4byte gEkrDistanceType
.L08044CBC: .4byte .L08044CC0
.L08044CC0: @ jump table
	.4byte .L08044CD4 @ case 0
	.4byte .L08044CD4 @ case 1
	.4byte .L08044CE8 @ case 2
	.4byte .L08044CD4 @ case 3
	.4byte .L08044CD4 @ case 4
.L08044CD4:
	movs r0, #0x10
	strh r0, [r5, #0x2e]
	adds r0, r4, #0
	bl GetAnimAnotherSide
	movs r1, #1
	rsbs r1, r1, #0
	bl NewEfxFarAttackWithDistance
	b .L08044CFA
.L08044CE8:
	movs r0, #0x14
	strh r0, [r5, #0x2e]
	adds r0, r4, #0
	bl GetAnimAnotherSide
	movs r1, #1
	rsbs r1, r1, #0
	bl NewEfxFarAttackWithDistance
.L08044CFA:
	adds r0, r5, #0
	bl Proc_Break
.L08044D00:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_fe6_08044D08
func_fe6_08044D08: @ 0x08044D08
	push {lr}
	adds r2, r0, #0
	ldrh r0, [r2, #0x2c]
	adds r0, #1
	strh r0, [r2, #0x2c]
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	movs r3, #0x2e
	ldrsh r0, [r2, r3]
	subs r0, #4
	cmp r1, r0
	bne .L08044D2E
	ldr r0, [r2, #0x64]
	bl GetAnimAnotherSide
	movs r0, #4
	bl EnableBgSync
	b .L08044D44
.L08044D2E:
	movs r3, #0x2e
	ldrsh r0, [r2, r3]
	cmp r1, r0
	bne .L08044D44
	ldr r1, .L08044D48 @ =gEkrHPBarCount
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r2, #0
	bl Proc_Break
.L08044D44:
	pop {r0}
	bx r0
	.align 2, 0
.L08044D48: .4byte gEkrHPBarCount

	thumb_func_start func_fe6_08044D4C
func_fe6_08044D4C: @ 0x08044D4C
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r1, .L08044D84 @ =gEkrHPBarCount
	ldr r0, [r1]
	cmp r0, #0
	bne .L08044E1E
	movs r0, #1
	str r0, [r1]
	ldr r0, .L08044D88 @ =gUnk_085CB758
	movs r1, #3
	bl SpawnProc
	adds r6, r0, #0
	adds r0, r4, #0
	bl GetAnimAnotherSide
	str r0, [r6, #0x64]
	adds r0, r4, #0
	bl GetAnimPosition
	cmp r0, #0
	bne .L08044D90
	ldr r0, .L08044D8C @ =gAnims
	ldr r1, [r0, #8]
	str r1, [r6, #0x5c]
	ldr r0, [r0]
	b .L08044D98
	.align 2, 0
.L08044D84: .4byte gEkrHPBarCount
.L08044D88: .4byte gUnk_085CB758
.L08044D8C: .4byte gAnims
.L08044D90:
	ldr r0, .L08044DEC @ =gAnims
	ldr r1, [r0]
	str r1, [r6, #0x5c]
	ldr r0, [r0, #8]
.L08044D98:
	str r0, [r6, #0x60]
	ldr r4, .L08044DF0 @ =0x0203CD46
	ldr r0, [r6, #0x60]
	bl GetAnimPosition
	lsls r0, r0, #1
	adds r0, r0, r4
	movs r1, #0
	ldrsh r5, [r0, r1]
	adds r4, r5, #1
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	ldr r0, [r6, #0x60]
	bl GetAnimPosition
	lsls r5, r5, #1
	adds r5, r5, r0
	adds r0, r5, #0
	bl GetEfxHp
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [r6, #0x4c]
	ldr r0, [r6, #0x60]
	bl GetAnimPosition
	lsls r4, r4, #0x10
	asrs r4, r4, #0xf
	adds r4, r4, r0
	adds r0, r4, #0
	bl GetEfxHp
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [r6, #0x50]
	ldr r1, [r6, #0x4c]
	cmp r1, r0
	ble .L08044DF4
	movs r0, #1
	rsbs r0, r0, #0
	b .L08044DF6
	.align 2, 0
.L08044DEC: .4byte gAnims
.L08044DF0: .4byte 0x0203CD46
.L08044DF4:
	movs r0, #1
.L08044DF6:
	str r0, [r6, #0x48]
	adds r0, r6, #0
	adds r0, #0x29
	movs r1, #0
	strb r1, [r0]
	strh r1, [r6, #0x2c]
	ldr r0, [r6, #0x4c]
	strh r0, [r6, #0x2e]
	str r1, [r6, #0x54]
	str r1, [r6, #0x58]
	ldr r0, .L08044E24 @ =gUnk_Banim_02017748
	str r1, [r0]
	ldr r0, [r6, #0x60]
	bl GetAnimPosition
	ldr r1, .L08044E28 @ =gUnk_Banim_02017778
	lsls r0, r0, #1
	adds r0, r0, r1
	movs r1, #1
	strh r1, [r0]
.L08044E1E:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08044E24: .4byte gUnk_Banim_02017748
.L08044E28: .4byte gUnk_Banim_02017778

	thumb_func_start func_fe6_08044E2C
func_fe6_08044E2C: @ 0x08044E2C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x60]
	bl GetAnimPosition
	ldr r0, [r5, #0x60]
	bl GetAnimPosition
	ldr r1, [r5, #0x58]
	cmp r1, #0
	bne .L08044E7C
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #2
	bne .L08044E7C
	strh r1, [r5, #0x2c]
	ldr r0, [r5, #0x48]
	ldrh r1, [r5, #0x2e]
	adds r0, r1, r0
	strh r0, [r5, #0x2e]
	ldr r0, [r5, #0x60]
	bl GetAnimPosition
	ldr r1, .L08044EC8 @ =gEkrGaugeHp
	lsls r0, r0, #1
	adds r0, r0, r1
	ldr r1, [r5, #0x48]
	ldrh r2, [r0]
	adds r1, r2, r1
	strh r1, [r0]
	movs r0, #0x2e
	ldrsh r1, [r5, r0]
	ldr r0, [r5, #0x50]
	cmp r1, r0
	bne .L08044E7C
	movs r0, #1
	str r0, [r5, #0x58]
.L08044E7C:
	ldr r0, [r5, #0x54]
	cmp r0, #0x54
	bne .L08044ED8
	ldr r6, [r5, #0x58]
	cmp r6, #1
	bne .L08044ED8
	ldr r4, .L08044ECC @ =0x0203CD46
	ldr r0, [r5, #0x60]
	bl GetAnimPosition
	lsls r0, r0, #1
	adds r0, r0, r4
	ldrh r1, [r0]
	adds r1, #1
	movs r4, #0
	strh r1, [r0]
	ldr r0, [r5, #0x60]
	bl GetAnimPosition
	ldr r1, .L08044ED0 @ =gUnk_Banim_02017778
	lsls r0, r0, #1
	adds r0, r0, r1
	strh r4, [r0]
	ldr r0, [r5, #0x50]
	cmp r0, #0
	bne .L08044EB6
	adds r0, r5, #0
	adds r0, #0x29
	strb r6, [r0]
.L08044EB6:
	strh r4, [r5, #0x2c]
	movs r0, #0xa
	strh r0, [r5, #0x2e]
	ldr r0, .L08044ED4 @ =gUnk_Banim_02017748
	str r6, [r0]
	adds r0, r5, #0
	bl Proc_Break
	b .L08044EE4
	.align 2, 0
.L08044EC8: .4byte gEkrGaugeHp
.L08044ECC: .4byte 0x0203CD46
.L08044ED0: .4byte gUnk_Banim_02017778
.L08044ED4: .4byte gUnk_Banim_02017748
.L08044ED8:
	adds r0, #1
	str r0, [r5, #0x54]
	cmp r0, #0x53
	bls .L08044EE4
	movs r0, #0x54
	str r0, [r5, #0x54]
.L08044EE4:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_fe6_08044EEC
func_fe6_08044EEC: @ 0x08044EEC
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	ldrh r0, [r6, #0x2c]
	adds r0, #1
	movs r7, #0
	strh r0, [r6, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r6, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	ble .L08044F86
	ldr r4, .L08044F68 @ =0x0203CD46
	ldr r0, [r6, #0x5c]
	bl GetAnimPosition
	lsls r0, r0, #1
	adds r0, r0, r4
	movs r1, #0
	ldrsh r5, [r0, r1]
	adds r4, r5, #1
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	ldr r0, [r6, #0x5c]
	bl GetAnimPosition
	lsls r5, r5, #1
	adds r5, r5, r0
	adds r0, r5, #0
	bl GetEfxHp
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [r6, #0x4c]
	ldr r0, [r6, #0x5c]
	bl GetAnimPosition
	lsls r4, r4, #0x10
	asrs r4, r4, #0xf
	adds r4, r4, r0
	adds r0, r4, #0
	bl GetEfxHp
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [r6, #0x50]
	strh r7, [r6, #0x2c]
	ldr r1, [r6, #0x4c]
	strh r1, [r6, #0x2e]
	str r7, [r6, #0x54]
	str r7, [r6, #0x58]
	cmp r1, r0
	bne .L08044F58
	movs r0, #1
	str r0, [r6, #0x58]
.L08044F58:
	ldr r1, [r6, #0x4c]
	ldr r0, [r6, #0x50]
	cmp r1, r0
	ble .L08044F6C
	movs r0, #1
	rsbs r0, r0, #0
	b .L08044F6E
	.align 2, 0
.L08044F68: .4byte 0x0203CD46
.L08044F6C:
	movs r0, #1
.L08044F6E:
	str r0, [r6, #0x48]
	adds r0, r6, #0
	bl Proc_Break
	ldr r0, [r6, #0x5c]
	bl GetAnimPosition
	ldr r1, .L08044F8C @ =gUnk_Banim_02017778
	lsls r0, r0, #1
	adds r0, r0, r1
	movs r1, #2
	strh r1, [r0]
.L08044F86:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08044F8C: .4byte gUnk_Banim_02017778

	thumb_func_start func_fe6_08044F90
func_fe6_08044F90: @ 0x08044F90
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	ldr r4, .L08045064 @ =gAnims
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	lsls r0, r0, #3
	adds r0, r0, r4
	ldr r7, [r0]
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	ldr r0, [r5, #0x60]
	bl GetAnimPosition
	lsls r0, r0, #3
	adds r0, r0, r4
	ldr r6, [r0]
	ldr r0, [r5, #0x60]
	bl GetAnimPosition
	lsls r0, r0, #1
	adds r0, #1
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r0, [r0]
	mov r8, r0
	ldr r1, [r5, #0x58]
	cmp r1, #0
	bne .L08045020
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #4
	bne .L08045020
	strh r1, [r5, #0x2c]
	ldr r0, [r5, #0x48]
	ldrh r1, [r5, #0x2e]
	adds r0, r1, r0
	strh r0, [r5, #0x2e]
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	ldr r1, .L08045068 @ =gEkrGaugeHp
	lsls r0, r0, #1
	adds r0, r0, r1
	ldr r1, [r5, #0x48]
	ldrh r2, [r0]
	adds r1, r2, r1
	strh r1, [r0]
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0x75
	bl EfxPlaySE
	movs r0, #2
	ldrsh r1, [r7, r0]
	movs r0, #0x75
	movs r2, #1
	bl M4aPlayWithPostionCtrl
	movs r2, #0x2e
	ldrsh r1, [r5, r2]
	ldr r0, [r5, #0x50]
	cmp r1, r0
	bne .L08045020
	movs r0, #1
	str r0, [r5, #0x58]
.L08045020:
	ldr r1, [r5, #0x54]
	cmp r1, #0x1e
	bne .L080450C4
	ldr r0, [r5, #0x58]
	cmp r0, #1
	bne .L080450C4
	ldr r4, .L0804506C @ =0x0203CD46
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	lsls r0, r0, #1
	adds r0, r0, r4
	ldrh r1, [r0]
	adds r1, #1
	movs r4, #0
	strh r1, [r0]
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	ldr r1, .L08045070 @ =gUnk_Banim_02017778
	lsls r0, r0, #1
	adds r0, r0, r1
	strh r4, [r0]
	adds r0, r5, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #1
	bne .L080450B8
	bl GetBanimLinkArenaFlag
	cmp r0, #1
	bne .L08045074
	movs r0, #0
	b .L08045088
	.align 2, 0
.L08045064: .4byte gAnims
.L08045068: .4byte gEkrGaugeHp
.L0804506C: .4byte 0x0203CD46
.L08045070: .4byte gUnk_Banim_02017778
.L08045074:
	ldr r4, .L08045098 @ =gEkrPids
	adds r0, r6, #0
	bl GetAnimPosition
	adds r0, r0, r4
	ldrb r0, [r0]
	bl CheckBattleDefeatTalk
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
.L08045088:
	cmp r0, #1
	bne .L0804509C
	adds r0, r6, #0
	mov r1, r8
	bl func_fe6_080455C0
	b .L080450B8
	.align 2, 0
.L08045098: .4byte gEkrPids
.L0804509C:
	bl func_fe6_0804C554
	adds r0, r6, #0
	mov r1, r8
	bl func_fe6_080457E8
	ldr r0, [r5, #0x60]
	bl GetAnimPosition
	ldr r1, .L080450C0 @ =gEkrPairSideVaild
	lsls r0, r0, #1
	adds r0, r0, r1
	movs r1, #0
	strh r1, [r0]
.L080450B8:
	adds r0, r5, #0
	bl Proc_Break
	b .L080450D0
	.align 2, 0
.L080450C0: .4byte gEkrPairSideVaild
.L080450C4:
	adds r0, r1, #1
	str r0, [r5, #0x54]
	cmp r0, #0x1d
	bls .L080450D0
	movs r0, #0x1e
	str r0, [r5, #0x54]
.L080450D0:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start NewEfxAvoid
NewEfxAvoid: @ 0x080450DC
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	bl GetEkrDragonStateTypeGeneric
	adds r7, r0, #0
	ldr r1, .L08045114 @ =gEkrHPBarCount
	ldr r5, [r1]
	cmp r5, #0
	bne .L0804517A
	movs r0, #1
	str r0, [r1]
	ldr r0, .L08045118 @ =gUnk_085CB790
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	strh r5, [r4, #0x2c]
	adds r0, r6, #0
	bl GetAnimPosition
	cmp r0, #0
	bne .L08045120
	ldr r0, .L0804511C @ =gAnims
	ldr r1, [r0, #8]
	str r1, [r4, #0x5c]
	ldr r0, [r0]
	b .L08045128
	.align 2, 0
.L08045114: .4byte gEkrHPBarCount
.L08045118: .4byte gUnk_085CB790
.L0804511C: .4byte gAnims
.L08045120:
	ldr r0, .L08045148 @ =gAnims
	ldr r1, [r0]
	str r1, [r4, #0x5c]
	ldr r0, [r0, #8]
.L08045128:
	str r0, [r4, #0x60]
	ldr r0, [r4, #0x60]
	movs r1, #1
	bl func_fe6_08056A18
	str r6, [r4, #0x64]
	adds r4, #0x29
	movs r0, #0
	strb r0, [r4]
	adds r0, r6, #0
	bl GetAnimPosition
	cmp r0, #0
	bne .L0804514C
	movs r0, #0x10
	b .L0804514E
	.align 2, 0
.L08045148: .4byte gAnims
.L0804514C:
	movs r0, #0x20
.L0804514E:
	ands r0, r7
	cmp r0, #0
	beq .L08045158
	movs r0, #1
	strb r0, [r4]
.L08045158:
	ldrb r4, [r4]
	cmp r4, #1
	bne .L08045164
	adds r0, r6, #0
	bl func_fe6_0805A998
.L08045164:
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0xd7
	bl EfxPlaySE
	movs r0, #2
	ldrsh r1, [r6, r0]
	movs r0, #0xd7
	movs r2, #1
	bl M4aPlayWithPostionCtrl
.L0804517A:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start func_fe6_08045180
func_fe6_08045180: @ 0x08045180
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #0
	bne .L080451C6
	ldr r4, .L080451AC @ =gEkrPids
	ldr r0, [r5, #0x60]
	bl GetAnimPosition
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #3
	bne .L080451B0
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x50
	bne .L080451DA
	b .L080451BE
	.align 2, 0
.L080451AC: .4byte gEkrPids
.L080451B0:
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x1e
	bne .L080451DA
.L080451BE:
	adds r0, r5, #0
	bl Proc_Break
	b .L080451DA
.L080451C6:
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x50
	bne .L080451DA
	adds r0, r5, #0
	bl Proc_Break
.L080451DA:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start func_fe6_080451E0
func_fe6_080451E0: @ 0x080451E0
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	ldr r1, .L08045210 @ =gEkrHPBarCount
	ldr r0, [r1]
	cmp r0, #0
	bne .L080452AC
	movs r0, #1
	str r0, [r1]
	ldr r0, .L08045214 @ =gUnk_085CB7B8
	movs r1, #3
	bl SpawnProc
	adds r6, r0, #0
	adds r0, r7, #0
	bl GetAnimPosition
	cmp r0, #0
	bne .L0804521C
	ldr r0, .L08045218 @ =gAnims
	ldr r1, [r0, #8]
	str r1, [r6, #0x5c]
	ldr r0, [r0]
	b .L08045224
	.align 2, 0
.L08045210: .4byte gEkrHPBarCount
.L08045214: .4byte gUnk_085CB7B8
.L08045218: .4byte gAnims
.L0804521C:
	ldr r0, .L0804527C @ =gAnims
	ldr r1, [r0]
	str r1, [r6, #0x5c]
	ldr r0, [r0, #8]
.L08045224:
	str r0, [r6, #0x60]
	ldr r4, .L08045280 @ =0x0203CD46
	ldr r0, [r6, #0x60]
	bl GetAnimPosition
	lsls r0, r0, #1
	adds r0, r0, r4
	movs r1, #0
	ldrsh r5, [r0, r1]
	adds r4, r5, #1
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	ldr r0, [r6, #0x60]
	bl GetAnimPosition
	lsls r5, r5, #1
	adds r5, r5, r0
	adds r0, r5, #0
	bl GetEfxHp
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [r6, #0x4c]
	ldr r0, [r6, #0x60]
	bl GetAnimPosition
	lsls r4, r4, #0x10
	asrs r4, r4, #0xf
	adds r4, r4, r0
	adds r0, r4, #0
	bl GetEfxHp
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	str r1, [r6, #0x50]
	movs r0, #0
	str r0, [r6, #0x54]
	str r0, [r6, #0x58]
	ldr r0, [r6, #0x4c]
	cmp r0, r1
	bne .L08045284
	movs r0, #1
	str r0, [r6, #0x58]
	b .L08045292
	.align 2, 0
.L0804527C: .4byte gAnims
.L08045280: .4byte 0x0203CD46
.L08045284:
	cmp r0, r1
	ble .L0804528E
	movs r0, #1
	rsbs r0, r0, #0
	b .L08045290
.L0804528E:
	movs r0, #1
.L08045290:
	str r0, [r6, #0x48]
.L08045292:
	movs r0, #0
	strh r0, [r6, #0x2c]
	ldr r0, [r6, #0x4c]
	strh r0, [r6, #0x2e]
	str r7, [r6, #0x64]
	ldr r0, [r6, #0x5c]
	bl GetAnimPosition
	ldr r1, .L080452B4 @ =gUnk_Banim_02017778
	lsls r0, r0, #1
	adds r0, r0, r1
	movs r1, #2
	strh r1, [r0]
.L080452AC:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L080452B4: .4byte gUnk_Banim_02017778

	thumb_func_start func_fe6_080452B8
func_fe6_080452B8: @ 0x080452B8
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r6, [r5, #0x60]
	ldr r1, [r5, #0x58]
	cmp r1, #0
	bne .L08045314
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #4
	bne .L08045314
	strh r1, [r5, #0x2c]
	ldr r0, [r5, #0x48]
	ldrh r1, [r5, #0x2e]
	adds r0, r1, r0
	strh r0, [r5, #0x2e]
	adds r0, r6, #0
	bl GetAnimPosition
	ldr r1, .L0804534C @ =gEkrGaugeHp
	lsls r0, r0, #1
	adds r0, r0, r1
	ldr r1, [r5, #0x48]
	ldrh r2, [r0]
	adds r1, r2, r1
	strh r1, [r0]
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0x75
	bl EfxPlaySE
	movs r0, #2
	ldrsh r1, [r6, r0]
	movs r0, #0x75
	movs r2, #1
	bl M4aPlayWithPostionCtrl
	movs r2, #0x2e
	ldrsh r1, [r5, r2]
	ldr r0, [r5, #0x50]
	cmp r1, r0
	bne .L08045314
	movs r0, #1
	str r0, [r5, #0x58]
.L08045314:
	ldr r1, [r5, #0x54]
	cmp r1, #0x1e
	bne .L08045358
	ldr r0, [r5, #0x58]
	cmp r0, #1
	bne .L08045358
	ldr r4, .L08045350 @ =0x0203CD46
	adds r0, r6, #0
	bl GetAnimPosition
	lsls r0, r0, #1
	adds r0, r0, r4
	ldrh r1, [r0]
	adds r1, #1
	movs r4, #0
	strh r1, [r0]
	adds r0, r6, #0
	bl GetAnimPosition
	ldr r1, .L08045354 @ =gUnk_Banim_02017778
	lsls r0, r0, #1
	adds r0, r0, r1
	strh r4, [r0]
	adds r0, r5, #0
	bl Proc_Break
	b .L08045364
	.align 2, 0
.L0804534C: .4byte gEkrGaugeHp
.L08045350: .4byte 0x0203CD46
.L08045354: .4byte gUnk_Banim_02017778
.L08045358:
	adds r0, r1, #1
	str r0, [r5, #0x54]
	cmp r0, #0x1d
	bls .L08045364
	movs r0, #0x1e
	str r0, [r5, #0x54]
.L08045364:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start NewEfxNoDmage
NewEfxNoDmage: @ 0x0804536C
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r5, r0, #0
	adds r6, r1, #0
	mov r8, r2
	ldr r1, .L080453B8 @ =gEkrHPBarCount
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L080453BC @ =gUnk_085CB7E0
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	str r6, [r4, #0x60]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r4, #0
	adds r0, #0x29
	mov r1, r8
	strb r1, [r0]
	str r5, [r4, #0x64]
	ldr r0, [r4, #0x5c]
	movs r1, #0
	bl func_fe6_08056A18
	ldr r0, [r4, #0x5c]
	ldr r1, [r4, #0x60]
	bl func_fe6_08045478
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L080453B8: .4byte gEkrHPBarCount
.L080453BC: .4byte gUnk_085CB7E0

	thumb_func_start func_fe6_080453C0
func_fe6_080453C0: @ 0x080453C0
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetAnimAnotherSide
	adds r6, r0, #0
	ldr r5, .L08045428 @ =gEkrPids
	ldr r0, [r4, #0x5c]
	bl GetAnimPosition
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, #0x66
	beq .L080453EA
	ldr r0, [r4, #0x5c]
	bl GetAnimPosition
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, #3
	bne .L08045430
.L080453EA:
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	cmp r0, #0x3a
	bne .L0804546C
	ldr r5, .L0804542C @ =0x0203CD46
	ldr r0, [r4, #0x5c]
	bl GetAnimPosition
	lsls r0, r0, #1
	adds r0, r0, r5
	ldrh r1, [r0]
	adds r1, #1
	strh r1, [r0]
	adds r0, r4, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #1
	bne .L08045420
	adds r0, r6, #0
	bl GetAnimPosition
	lsls r0, r0, #1
	adds r0, r0, r5
	ldrh r1, [r0]
	adds r1, #1
	strh r1, [r0]
.L08045420:
	adds r0, r4, #0
	bl Proc_Break
	b .L0804546C
	.align 2, 0
.L08045428: .4byte gEkrPids
.L0804542C: .4byte 0x0203CD46
.L08045430:
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	cmp r0, #8
	bne .L0804546C
	ldr r5, .L08045474 @ =0x0203CD46
	ldr r0, [r4, #0x5c]
	bl GetAnimPosition
	lsls r0, r0, #1
	adds r0, r0, r5
	ldrh r1, [r0]
	adds r1, #1
	strh r1, [r0]
	adds r0, r4, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #1
	bne .L08045466
	adds r0, r6, #0
	bl GetAnimPosition
	lsls r0, r0, #1
	adds r0, r0, r5
	ldrh r1, [r0]
	adds r1, #1
	strh r1, [r0]
.L08045466:
	adds r0, r4, #0
	bl Proc_Break
.L0804546C:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08045474: .4byte 0x0203CD46

	thumb_func_start func_fe6_08045478
func_fe6_08045478: @ 0x08045478
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, .L08045498 @ =gUnk_085CB808
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	str r5, [r0, #0x60]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x2e]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08045498: .4byte gUnk_085CB808

	thumb_func_start func_fe6_0804549C
func_fe6_0804549C: @ 0x0804549C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r7, r0, #0
	ldr r0, [r7, #0x5c]
	mov r8, r0
	ldr r1, [r7, #0x60]
	mov sb, r1
	ldr r4, .L080454F8 @ =gUnk_08111C44
	movs r2, #0x2c
	ldrsh r0, [r7, r2]
	lsls r0, r0, #1
	adds r0, r0, r4
	movs r2, #0
	ldrsh r1, [r0, r2]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne .L08045504
	mov r0, r8
	bl GetAnimPosition
	ldr r5, .L080454FC @ =gEkrXPosReal
	lsls r0, r0, #1
	adds r0, r0, r5
	ldr r4, .L08045500 @ =gEkrBgPosition
	ldrh r0, [r0]
	ldrh r1, [r4]
	subs r0, r0, r1
	mov r2, r8
	strh r0, [r2, #2]
	ldr r0, [r7, #0x60]
	bl GetAnimPosition
	lsls r0, r0, #1
	adds r0, r0, r5
	ldrh r0, [r0]
	ldrh r4, [r4]
	subs r0, r0, r4
	mov r1, sb
	strh r0, [r1, #2]
	adds r0, r7, #0
	bl Proc_Break
	b .L08045564
	.align 2, 0
.L080454F8: .4byte gUnk_08111C44
.L080454FC: .4byte gEkrXPosReal
.L08045500: .4byte gEkrBgPosition
.L08045504:
	mov r0, r8
	bl GetAnimPosition
	cmp r0, #1
	bne .L08045520
	movs r2, #0x2c
	ldrsh r0, [r7, r2]
	lsls r0, r0, #1
	adds r0, r0, r4
	ldrh r0, [r0]
	rsbs r0, r0, #0
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	b .L0804552A
.L08045520:
	movs r1, #0x2c
	ldrsh r0, [r7, r1]
	lsls r0, r0, #1
	adds r0, r0, r4
	ldrh r4, [r0]
.L0804552A:
	ldr r0, [r7, #0x5c]
	bl GetAnimPosition
	ldr r6, .L08045570 @ =gEkrXPosReal
	lsls r0, r0, #1
	adds r0, r0, r6
	ldr r5, .L08045574 @ =gEkrBgPosition
	ldr r1, [r5]
	ldrh r0, [r0]
	subs r1, r0, r1
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	adds r1, r4, r1
	mov r2, r8
	strh r1, [r2, #2]
	ldr r0, [r7, #0x60]
	bl GetAnimPosition
	lsls r0, r0, #1
	adds r0, r0, r6
	ldr r1, [r5]
	ldrh r0, [r0]
	subs r1, r0, r1
	adds r4, r4, r1
	mov r0, sb
	strh r4, [r0, #2]
	ldrh r0, [r7, #0x2c]
	adds r0, #1
	strh r0, [r7, #0x2c]
.L08045564:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08045570: .4byte gEkrXPosReal
.L08045574: .4byte gEkrBgPosition

	thumb_func_start NewEfxStatusCHG
NewEfxStatusCHG: @ 0x08045578
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r1, .L0804559C @ =gEkrHPBarCount
	ldr r4, [r1]
	cmp r4, #0
	bne .L08045594
	movs r0, #1
	str r0, [r1]
	ldr r0, .L080455A0 @ =gUnk_085CB820
	movs r1, #3
	bl SpawnProc
	strh r4, [r0, #0x2c]
	str r5, [r0, #0x64]
.L08045594:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0804559C: .4byte gEkrHPBarCount
.L080455A0: .4byte gUnk_085CB820

	thumb_func_start func_fe6_080455A4
func_fe6_080455A4: @ 0x080455A4
	push {lr}
	adds r1, r0, #0
	ldrh r0, [r1, #0x2c]
	adds r0, #1
	strh r0, [r1, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x11
	bne .L080455BC
	adds r0, r1, #0
	bl Proc_Break
.L080455BC:
	pop {r0}
	bx r0

	thumb_func_start func_fe6_080455C0
func_fe6_080455C0: @ 0x080455C0
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, .L08045604 @ =gUnk_085CB850
	movs r1, #3
	bl SpawnProc
	adds r6, r0, #0
	str r4, [r6, #0x5c]
	str r5, [r6, #0x60]
	ldr r1, .L08045608 @ =gEkrDeadEventExist
	movs r0, #1
	str r0, [r1]
	bl GetEkrDragonStateTypeIdunn
	cmp r0, #0
	beq .L080455FC
	ldr r0, [r6, #0x5c]
	bl NewEkrIdunnIntroDeamon1
	str r0, [r6, #0x64]
	ldr r2, .L0804560C @ =gEkrXPosBase
	ldr r1, .L08045610 @ =gEkrBgPosition
	ldr r1, [r1]
	subs r1, #0x4e
	ldrh r2, [r2]
	subs r1, r2, r1
	strh r1, [r0, #0x32]
	movs r1, #0xb2
	strh r1, [r0, #0x3a]
.L080455FC:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08045604: .4byte gUnk_085CB850
.L08045608: .4byte gEkrDeadEventExist
.L0804560C: .4byte gEkrXPosBase
.L08045610: .4byte gEkrBgPosition

	thumb_func_start func_fe6_08045614
func_fe6_08045614: @ 0x08045614
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x5c]
	bl GetAnimAnotherSide
	adds r7, r0, #0
	movs r6, #0
	ldr r0, .L08045680 @ =gEfxBgSemaphore
	ldr r0, [r0]
	cmp r0, #0
	bne .L08045646
	ldr r0, .L08045684 @ =gEfxSpellAnimExists
	ldr r0, [r0]
	cmp r0, #0
	bne .L08045646
	ldr r4, .L08045688 @ =gBanimDoneFlag
	adds r0, r7, #0
	bl GetAnimPosition
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r0, [r0]
	cmp r0, #1
	bne .L08045646
	movs r6, #1
.L08045646:
	cmp r6, #1
	bne .L0804567A
	movs r0, #7
	strh r0, [r5, #0x2c]
	ldr r0, .L0804568C @ =gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq .L08045674
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	ldr r1, .L08045690 @ =gEkrInitPosReal
	ldr r1, [r1]
	cmp r0, r1
	beq .L08045674
	movs r1, #1
	rsbs r1, r1, #0
	adds r0, r7, #0
	bl NewEfxFarAttackWithDistance
	movs r0, #0
	strh r0, [r5, #0x2c]
.L08045674:
	adds r0, r5, #0
	bl Proc_Break
.L0804567A:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08045680: .4byte gEfxBgSemaphore
.L08045684: .4byte gEfxSpellAnimExists
.L08045688: .4byte gBanimDoneFlag
.L0804568C: .4byte gEkrDistanceType
.L08045690: .4byte gEkrInitPosReal

	thumb_func_start func_fe6_08045694
func_fe6_08045694: @ 0x08045694
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #8
	bne .L080456BE
	movs r0, #1
	movs r1, #7
	bl NewEkrWindowAppear
	movs r0, #1
	movs r1, #7
	movs r2, #0
	bl NewEkrNamewinAppear
	adds r0, r4, #0
	bl Proc_Break
.L080456BE:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start func_fe6_080456C4
func_fe6_080456C4: @ 0x080456C4
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	bl CheckEkrWindowAppearUnexist
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne .L08045734
	bl EnableEkrGauge
	bl EkrGauge_08044264
	movs r0, #0
	str r0, [sp]
	ldr r1, .L0804573C @ =gBg0Tm
	ldr r2, .L08045740 @ =0x01000200
	mov r0, sp
	bl CpuFastSet
	ldr r0, .L08045744 @ =gEkrBg0QuakeVec
	ldrh r1, [r0]
	ldrh r2, [r0, #2]
	movs r0, #0
	bl SetBgOffset
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #1
	bl EnableBgSync
	bl EkrGauge_080438D8
	ldr r5, .L08045748 @ =gEkrPids
	ldr r0, [r4, #0x5c]
	bl GetAnimPosition
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, #0x66
	bne .L08045720
	bl func_fe6_0805AFD4
.L08045720:
	ldr r0, [r4, #0x5c]
	bl GetAnimPosition
	adds r0, r0, r5
	ldrb r0, [r0]
	bl StartBattleDefeatTalk
	adds r0, r4, #0
	bl Proc_Break
.L08045734:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0804573C: .4byte gBg0Tm
.L08045740: .4byte 0x01000200
.L08045744: .4byte gEkrBg0QuakeVec
.L08045748: .4byte gEkrPids

	thumb_func_start func_fe6_0804574C
func_fe6_0804574C: @ 0x0804574C
	push {r4, r5, lr}
	adds r4, r0, #0
	bl IsEventRunning
	lsls r0, r0, #0x18
	asrs r5, r0, #0x18
	cmp r5, #0
	bne .L080457A4
	bl func_fe6_0804C554
	ldr r0, [r4, #0x5c]
	ldr r1, [r4, #0x60]
	bl func_fe6_080457E8
	bl EfxPrepareScreenFx
	ldr r0, [r4, #0x5c]
	bl GetAnimPosition
	ldr r1, .L080457AC @ =gEkrPairSideVaild
	lsls r0, r0, #1
	adds r0, r0, r1
	strh r5, [r0]
	movs r0, #1
	bl EnableBgSync
	movs r0, #0
	movs r1, #7
	bl NewEkrWindowAppear
	movs r0, #0
	movs r1, #7
	movs r2, #0
	bl NewEkrNamewinAppear
	bl DisableEkrGauge
	bl EkrGauge_08044274
	bl EkrGauge_080438C8
	adds r0, r4, #0
	bl Proc_Break
.L080457A4:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L080457AC: .4byte gEkrPairSideVaild

	thumb_func_start func_fe6_080457B0
func_fe6_080457B0: @ 0x080457B0
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r6, [r5, #0x64]
	bl CheckEkrWindowAppearUnexist
	lsls r0, r0, #0x18
	asrs r4, r0, #0x18
	cmp r4, #1
	bne .L080457DC
	ldr r0, .L080457E4 @ =gEkrDeadEventExist
	movs r1, #0
	str r1, [r0]
	bl GetEkrDragonStateTypeIdunn
	cmp r0, #0
	beq .L080457D6
	adds r0, r6, #0
	adds r0, #0x29
	strb r4, [r0]
.L080457D6:
	adds r0, r5, #0
	bl Proc_Break
.L080457DC:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L080457E4: .4byte gEkrDeadEventExist

	thumb_func_start func_fe6_080457E8
func_fe6_080457E8: @ 0x080457E8
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, .L0804581C @ =gEkrHPBarCount
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r1, .L08045820 @ =gUnk_Banim_0201772C
	movs r0, #1
	str r0, [r1]
	ldr r0, .L08045824 @ =gUnk_085CB888
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	str r5, [r0, #0x60]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x2e]
	adds r0, r4, #0
	bl DisableEfxStatusUnits
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0804581C: .4byte gEkrHPBarCount
.L08045820: .4byte gUnk_Banim_0201772C
.L08045824: .4byte gUnk_085CB888

	thumb_func_start func_fe6_08045828
func_fe6_08045828: @ 0x08045828
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	bl GetEkrDragonStateTypeGeneric
	adds r4, r0, #0
	ldr r6, [r5, #0x5c]
	ldr r7, [r5, #0x60]
	adds r0, r6, #0
	bl GetAnimPosition
	cmp r0, #0
	bne .L08045844
	movs r0, #0x15
	b .L08045846
.L08045844:
	movs r0, #0x2a
.L08045846:
	ands r4, r0
	ldr r0, .L0804587C @ =gEfxBgSemaphore
	ldr r0, [r0]
	cmp r0, #0
	bne .L080458BA
	ldr r0, .L08045880 @ =gEfxSpellAnimExists
	ldr r0, [r0]
	cmp r0, #0
	bne .L080458BA
	movs r0, #3
	ands r0, r4
	cmp r0, #0
	beq .L08045884
	movs r1, #2
	ldrh r0, [r6]
	orrs r0, r1
	strh r0, [r6]
	ldrh r0, [r7]
	orrs r0, r1
	strh r0, [r7]
	ldr r0, [r5, #0x5c]
	bl GetEkrDragonProc
	bl func_fe6_08058D34
	b .L0804589C
	.align 2, 0
.L0804587C: .4byte gEfxBgSemaphore
.L08045880: .4byte gEfxSpellAnimExists
.L08045884:
	movs r0, #0x30
	ands r0, r4
	cmp r0, #0
	bne .L0804589C
	movs r0, #0xc
	ands r0, r4
	cmp r0, #0
	beq .L080458A8
	ldr r0, [r5, #0x5c]
	ldr r1, [r5, #0x60]
	bl func_fe6_08045974
.L0804589C:
	ldr r0, [r5, #0x5c]
	bl CheckEkrDragonFasten
	movs r1, #1
	strh r1, [r0]
	b .L080458B0
.L080458A8:
	ldr r0, [r5, #0x5c]
	ldr r1, [r5, #0x60]
	bl func_fe6_08045974
.L080458B0:
	movs r0, #0x32
	strh r0, [r5, #0x2e]
	adds r0, r5, #0
	bl Proc_Break
.L080458BA:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start func_fe6_080458C0
func_fe6_080458C0: @ 0x080458C0
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	bl GetEkrDragonStateTypeGeneric
	adds r5, r0, #0
	ldr r6, [r4, #0x5c]
	adds r0, r6, #0
	bl GetAnimPosition
	cmp r0, #0
	bne .L080458DA
	movs r0, #0x15
	b .L080458DC
.L080458DA:
	movs r0, #0x2a
.L080458DC:
	ands r5, r0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0x1e
	bne .L0804594A
	movs r0, #3
	ands r0, r5
	cmp r0, #0
	beq .L08045918
	ldr r0, [r4, #0x5c]
	ldr r1, [r4, #0x60]
	bl func_fe6_08045B24
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0xd6
	bl EfxPlaySE
	movs r0, #2
	ldrsh r1, [r6, r0]
	movs r0, #0xd6
	movs r2, #1
	bl M4aPlayWithPostionCtrl
	movs r0, #0x64
	strh r0, [r4, #0x2e]
	b .L08045966
.L08045918:
	movs r0, #0x30
	ands r0, r5
	cmp r0, #0
	beq .L08045926
	movs r0, #0x1f
	strh r0, [r4, #0x2e]
	b .L08045966
.L08045926:
	ldr r0, [r4, #0x5c]
	ldr r1, [r4, #0x60]
	bl func_fe6_080459F8
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0xd6
	bl EfxPlaySE
	movs r2, #2
	ldrsh r1, [r6, r2]
	movs r0, #0xd6
	movs r2, #1
	bl M4aPlayWithPostionCtrl
	movs r0, #0x32
	strh r0, [r4, #0x2e]
	b .L08045966
.L0804594A:
	movs r2, #0x2e
	ldrsh r0, [r4, r2]
	cmp r1, r0
	bne .L08045966
	ldr r1, .L0804596C @ =gEkrHPBarCount
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	ldr r1, .L08045970 @ =gUnk_Banim_0201772C
	movs r0, #0
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
.L08045966:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L0804596C: .4byte gEkrHPBarCount
.L08045970: .4byte gUnk_Banim_0201772C

	thumb_func_start func_fe6_08045974
func_fe6_08045974: @ 0x08045974
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, .L08045994 @ =gUnk_085CB8A8
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	str r5, [r0, #0x60]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x2e]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08045994: .4byte gUnk_085CB8A8

	thumb_func_start func_fe6_08045998
func_fe6_08045998: @ 0x08045998
	push {r4, r5, lr}
	adds r2, r0, #0
	ldr r3, [r2, #0x5c]
	ldr r4, [r2, #0x60]
	ldrh r0, [r2, #0x2c]
	adds r0, #1
	strh r0, [r2, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #6
	ble .L080459D0
	ldr r1, .L080459CC @ =0x0000FFFD
	adds r0, r1, #0
	ldrh r5, [r3]
	ands r0, r5
	strh r0, [r3]
	ldrh r0, [r4]
	ands r1, r0
	strh r1, [r4]
	movs r0, #0
	strh r0, [r2, #0x2c]
	ldrh r0, [r2, #0x2e]
	adds r0, #1
	strh r0, [r2, #0x2e]
	b .L080459DE
	.align 2, 0
.L080459CC: .4byte 0x0000FFFD
.L080459D0:
	movs r0, #2
	ldrh r1, [r3]
	orrs r1, r0
	strh r1, [r3]
	ldrh r1, [r4]
	orrs r0, r1
	strh r0, [r4]
.L080459DE:
	movs r5, #0x2e
	ldrsh r0, [r2, r5]
	cmp r0, #5
	ble .L080459F2
	movs r0, #0
	strh r0, [r2, #0x2c]
	strh r0, [r2, #0x2e]
	adds r0, r2, #0
	bl Proc_Break
.L080459F2:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start func_fe6_080459F8
func_fe6_080459F8: @ 0x080459F8
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, .L08045A60 @ =gUnk_085CB8C0
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	str r5, [r0, #0x60]
	movs r6, #0
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x2e]
	movs r0, #0xa
	strh r0, [r4, #0xa]
	strh r0, [r5, #0xa]
	bl BasSort
	ldr r2, .L08045A64 @ =gDispIo
	adds r1, r2, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r3, [r1]
	ands r0, r3
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x44
	movs r1, #0x10
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r6, [r0]
	ldr r0, .L08045A68 @ =0x0000FFE0
	ldrh r1, [r2, #0x3c]
	ands r0, r1
	ldr r1, .L08045A6C @ =0x0000E0FF
	ands r0, r1
	movs r3, #0xc0
	lsls r3, r3, #4
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
.L08045A60: .4byte gUnk_085CB8C0
.L08045A64: .4byte gDispIo
.L08045A68: .4byte 0x0000FFE0
.L08045A6C: .4byte 0x0000E0FF

	thumb_func_start func_fe6_08045A70
func_fe6_08045A70: @ 0x08045A70
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r2, [r4, #0x5c]
	ldr r3, [r4, #0x60]
	ldr r0, [r2, #0x1c]
	movs r1, #0x80
	lsls r1, r1, #3
	orrs r0, r1
	str r0, [r2, #0x1c]
	ldr r0, [r3, #0x1c]
	orrs r0, r1
	str r0, [r3, #0x1c]
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	movs r5, #0
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x3c
	ble .L08045AE4
	movs r0, #2
	ldrh r1, [r2]
	orrs r1, r0
	strh r1, [r2]
	ldrh r1, [r3]
	orrs r0, r1
	strh r0, [r3]
	ldr r0, [r2, #0x1c]
	ldr r1, .L08045ADC @ =0xFFFFFBFF
	ands r0, r1
	str r0, [r2, #0x1c]
	ldr r0, [r3, #0x1c]
	ands r0, r1
	str r0, [r3, #0x1c]
	ldr r2, .L08045AE0 @ =gDispIo
	adds r1, r2, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r3, [r1]
	ands r0, r3
	strb r0, [r1]
	adds r1, #8
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x45
	strb r5, [r0]
	adds r0, #1
	strb r5, [r0]
	adds r0, r4, #0
	bl Proc_Break
	b .L08045B16
	.align 2, 0
.L08045ADC: .4byte 0xFFFFFBFF
.L08045AE0: .4byte gDispIo
.L08045AE4:
	movs r0, #0x2c
	ldrsh r3, [r4, r0]
	movs r0, #0x3c
	str r0, [sp]
	movs r0, #0
	movs r1, #0x10
	movs r2, #0
	bl Interpolate
	ldr r3, .L08045B20 @ =gDispIo
	adds r2, r3, #0
	adds r2, #0x3c
	movs r1, #0x3f
	ldrb r4, [r2]
	ands r1, r4
	strb r1, [r2]
	adds r1, r3, #0
	adds r1, #0x44
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x46
	strb r5, [r0]
.L08045B16:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08045B20: .4byte gDispIo

	thumb_func_start func_fe6_08045B24
func_fe6_08045B24: @ 0x08045B24
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, .L08045BE8 @ =gUnk_085CB8D8
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	str r5, [r0, #0x60]
	movs r2, #2
	movs r6, #0
	movs r3, #0
	ldrh r1, [r4]
	orrs r1, r2
	strh r1, [r4]
	ldrh r1, [r5]
	orrs r2, r1
	strh r2, [r5]
	strh r3, [r0, #0x2c]
	strh r3, [r0, #0x2e]
	ldr r0, [r0, #0x5c]
	bl EndEkrDragonDaemon
	ldr r5, .L08045BEC @ =gDispIo
	adds r2, r5, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r1, r5, #0
	adds r1, #0x44
	movs r4, #0x10
	movs r0, #0x10
	strb r0, [r1]
	adds r1, #1
	strb r0, [r1]
	adds r0, r5, #0
	adds r0, #0x46
	strb r6, [r0]
	ldr r0, .L08045BF0 @ =0x0000FFE0
	ldrh r2, [r5, #0x3c]
	ands r0, r2
	movs r1, #8
	orrs r0, r1
	ldr r1, .L08045BF4 @ =0x0000E0FF
	ands r0, r1
	movs r2, #0x80
	lsls r2, r2, #3
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r5, #0x3c]
	movs r2, #0x20
	ldrb r0, [r5, #1]
	orrs r0, r2
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r5, #1]
	adds r0, r5, #0
	adds r0, #0x2d
	strb r6, [r0]
	adds r0, #4
	strb r6, [r0]
	adds r1, r5, #0
	adds r1, #0x2c
	movs r0, #0xf0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0xa0
	strb r0, [r1]
	adds r3, r5, #0
	adds r3, #0x34
	movs r0, #1
	ldrb r1, [r3]
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	orrs r0, r4
	orrs r0, r2
	strb r0, [r3]
	adds r0, r5, #0
	adds r0, #0x3d
	ldrb r1, [r0]
	orrs r2, r1
	strb r2, [r0]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08045BE8: .4byte gUnk_085CB8D8
.L08045BEC: .4byte gDispIo
.L08045BF0: .4byte 0x0000FFE0
.L08045BF4: .4byte 0x0000E0FF

	thumb_func_start func_fe6_08045BF8
func_fe6_08045BF8: @ 0x08045BF8
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	movs r5, #0
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x3c
	ble .L08045C4C
	ldr r0, .L08045C44 @ =gBg3Tm
	movs r1, #0xf0
	lsls r1, r1, #8
	bl TmFill
	movs r0, #8
	bl EnableBgSync
	ldr r2, .L08045C48 @ =gDispIo
	adds r1, r2, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r3, [r1]
	ands r0, r3
	strb r0, [r1]
	adds r1, #8
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x45
	strb r5, [r0]
	adds r0, #1
	strb r5, [r0]
	adds r0, r4, #0
	bl Proc_Break
	b .L08045C84
	.align 2, 0
.L08045C44: .4byte gBg3Tm
.L08045C48: .4byte gDispIo
.L08045C4C:
	movs r0, #0x2c
	ldrsh r3, [r4, r0]
	movs r0, #0x3c
	str r0, [sp]
	movs r0, #0
	movs r1, #0x10
	movs r2, #0
	bl Interpolate
	ldr r1, .L08045C8C @ =gDispIo
	mov ip, r1
	mov r3, ip
	adds r3, #0x3c
	movs r1, #0x3f
	ldrb r2, [r3]
	ands r1, r2
	movs r2, #0x40
	orrs r1, r2
	strb r1, [r3]
	mov r1, ip
	adds r1, #0x44
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x10
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x46
	strb r5, [r0]
.L08045C84:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08045C8C: .4byte gDispIo

	thumb_func_start NewEfxFarAttackWithDistance
NewEfxFarAttackWithDistance: @ 0x08045C90
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	lsls r1, r1, #0x10
	lsrs r6, r1, #0x10
	ldr r0, .L08045CAC @ =gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #4
	bhi .L08045D5C
	lsls r0, r0, #2
	ldr r1, .L08045CB0 @ =.L08045CB4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
.L08045CAC: .4byte gEkrDistanceType
.L08045CB0: .4byte .L08045CB4
.L08045CB4: @ jump table
	.4byte .L08045D5C @ case 0
	.4byte .L08045CC8 @ case 1
	.4byte .L08045CC8 @ case 2
	.4byte .L08045D5C @ case 3
	.4byte .L08045D5C @ case 4
.L08045CC8:
	ldr r0, .L08045CFC @ =ProcScr_efxFarAttack
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	adds r0, r5, #0
	bl GetAnimPosition
	adds r2, r4, #0
	adds r2, #0x29
	movs r1, #0
	strb r0, [r2]
	strh r1, [r4, #0x2c]
	lsls r1, r6, #0x10
	asrs r2, r1, #0x10
	movs r0, #1
	rsbs r0, r0, #0
	cmp r2, r0
	beq .L08045D04
	asrs r0, r1, #0x11
	strh r0, [r4, #0x2e]
	subs r0, r2, r0
	strh r0, [r4, #0x30]
	ldr r2, .L08045D00 @ =gEkrDistanceType
	b .L08045D1E
	.align 2, 0
.L08045CFC: .4byte ProcScr_efxFarAttack
.L08045D00: .4byte gEkrDistanceType
.L08045D04:
	ldr r0, .L08045D14 @ =gEkrDistanceType
	adds r2, r0, #0
	ldrh r0, [r2]
	cmp r0, #1
	bne .L08045D18
	movs r0, #5
	b .L08045D1A
	.align 2, 0
.L08045D14: .4byte gEkrDistanceType
.L08045D18:
	movs r0, #7
.L08045D1A:
	strh r0, [r4, #0x2e]
	strh r0, [r4, #0x30]
.L08045D1E:
	movs r1, #0xf0
	ldrh r2, [r2]
	cmp r2, #1
	bne .L08045D28
	movs r1, #0x20
.L08045D28:
	adds r0, r4, #0
	adds r0, #0x29
	ldrb r2, [r0]
	cmp r2, #0
	bne .L08045D40
	rsbs r0, r1, #0
	strh r0, [r4, #0x32]
	lsrs r0, r0, #1
	strh r0, [r4, #0x34]
	strh r0, [r4, #0x36]
	strh r2, [r4, #0x38]
	b .L08045D4E
.L08045D40:
	movs r0, #0
	strh r0, [r4, #0x32]
	rsbs r1, r1, #0
	lsrs r0, r1, #1
	strh r0, [r4, #0x34]
	strh r0, [r4, #0x36]
	strh r1, [r4, #0x38]
.L08045D4E:
	ldr r1, .L08045D64 @ =gEkrBgPosition
	movs r2, #0x32
	ldrsh r0, [r4, r2]
	str r0, [r1]
	ldr r1, .L08045D68 @ =gUnk_Banim_02017740
	movs r0, #1
	str r0, [r1]
.L08045D5C:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08045D64: .4byte gEkrBgPosition
.L08045D68: .4byte gUnk_Banim_02017740

	thumb_func_start func_fe6_08045D6C
func_fe6_08045D6C: @ 0x08045D6C
	push {r4, r5, lr}
	ldr r3, .L08045D9C @ =gAnims
	ldr r4, [r3]
	rsbs r1, r1, #0
	ldr r2, .L08045DA0 @ =gEkrXPosReal
	ldrh r5, [r2]
	adds r0, r5, r1
	strh r0, [r4, #2]
	ldr r4, [r3, #4]
	ldrh r5, [r2]
	adds r0, r5, r1
	strh r0, [r4, #2]
	ldr r4, [r3, #8]
	ldrh r5, [r2, #2]
	adds r0, r5, r1
	strh r0, [r4, #2]
	ldr r4, [r3, #0xc]
	ldrh r2, [r2, #2]
	adds r1, r2, r1
	strh r1, [r4, #2]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08045D9C: .4byte gAnims
.L08045DA0: .4byte gEkrXPosReal

	thumb_func_start func_fe6_08045DA4
func_fe6_08045DA4: @ 0x08045DA4
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x32
	ldrsh r1, [r4, r0]
	adds r0, r4, #0
	bl func_fe6_08045D6C
	bl GetEkrDragonStateType
	cmp r0, #0
	beq .L08045DC2
	movs r1, #0x32
	ldrsh r0, [r4, r1]
	bl EkrDragonTmCpyExt
.L08045DC2:
	movs r1, #0x32
	ldrsh r0, [r4, r1]
	bl func_fe6_08045EE8
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_fe6_08045DDC
func_fe6_08045DDC: @ 0x08045DDC
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	movs r0, #0x32
	ldrsh r1, [r4, r0]
	movs r5, #0x34
	ldrsh r2, [r4, r5]
	movs r0, #0x2c
	ldrsh r3, [r4, r0]
	movs r5, #0x2e
	ldrsh r0, [r4, r5]
	str r0, [sp]
	movs r0, #1
	bl Interpolate
	adds r1, r0, #0
	ldr r5, .L08045E4C @ =gEkrBgPosition
	str r1, [r5]
	adds r0, r4, #0
	bl func_fe6_08045D6C
	bl GetEkrDragonStateType
	cmp r0, #0
	beq .L08045E14
	ldr r0, [r5]
	bl EkrDragonTmCpyExt
.L08045E14:
	ldr r0, [r5]
	bl func_fe6_08045EE8
	bl GetBattleAnimArenaFlag
	cmp r0, #0
	beq .L08045E28
	ldr r0, [r5]
	bl func_fe6_0804C50C
.L08045E28:
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r4, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	ble .L08045E42
	movs r0, #1
	strh r0, [r4, #0x2c]
	adds r0, r4, #0
	bl Proc_Break
.L08045E42:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08045E4C: .4byte gEkrBgPosition

	thumb_func_start func_fe6_08045E50
func_fe6_08045E50: @ 0x08045E50
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	movs r0, #0x36
	ldrsh r1, [r4, r0]
	movs r5, #0x38
	ldrsh r2, [r4, r5]
	movs r0, #0x2c
	ldrsh r3, [r4, r0]
	movs r5, #0x30
	ldrsh r0, [r4, r5]
	str r0, [sp]
	movs r0, #4
	bl Interpolate
	adds r1, r0, #0
	ldr r5, .L08045EBC @ =gEkrBgPosition
	str r1, [r5]
	adds r0, r4, #0
	bl func_fe6_08045D6C
	bl GetEkrDragonStateType
	cmp r0, #0
	beq .L08045E88
	ldr r0, [r5]
	bl EkrDragonTmCpyExt
.L08045E88:
	ldr r0, [r5]
	bl func_fe6_08045EE8
	bl GetBattleAnimArenaFlag
	cmp r0, #0
	beq .L08045E9C
	ldr r0, [r5]
	bl func_fe6_0804C50C
.L08045E9C:
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r4, #0x30]
	lsls r1, r2, #0x10
	cmp r0, r1
	ble .L08045ED6
	adds r0, r4, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #0
	bne .L08045EC4
	ldr r1, .L08045EC0 @ =gEkrInitPosReal
	movs r0, #1
	b .L08045EC8
	.align 2, 0
.L08045EBC: .4byte gEkrBgPosition
.L08045EC0: .4byte gEkrInitPosReal
.L08045EC4:
	ldr r1, .L08045EE0 @ =gEkrInitPosReal
	movs r0, #0
.L08045EC8:
	str r0, [r1]
	ldr r1, .L08045EE4 @ =gUnk_Banim_02017740
	movs r0, #0
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
.L08045ED6:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08045EE0: .4byte gEkrInitPosReal
.L08045EE4: .4byte gUnk_Banim_02017740

	thumb_func_start func_fe6_08045EE8
func_fe6_08045EE8: @ 0x08045EE8
	push {r4, r5, lr}
	sub sp, #0x10
	adds r5, r0, #0
	bl GetEkrDragonStateTypeIdunn
	cmp r0, #0
	bne .L08045F38
	bl GetBattleAnimArenaFlag
	cmp r0, #0
	bne .L08045F38
	asrs r4, r5, #3
	movs r1, #7
	ands r1, r5
	movs r0, #2
	movs r2, #0
	bl SetBgOffset
	lsls r4, r4, #1
	ldr r0, .L08045F40 @ =gTmA_Banim + 0x42
	adds r4, r4, r0
	movs r0, #0x84
	lsls r0, r0, #1
	adds r4, r4, r0
	ldr r2, .L08045F44 @ =gBg2Tm
	movs r0, #0x20
	str r0, [sp]
	movs r0, #0x14
	str r0, [sp, #4]
	subs r0, #0x15
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	adds r0, r4, #0
	movs r1, #0x42
	movs r3, #0x20
	bl EfxTmCpyExt
	movs r0, #4
	bl EnableBgSync
.L08045F38:
	add sp, #0x10
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08045F40: .4byte gTmA_Banim + 0x42
.L08045F44: .4byte gBg2Tm

	thumb_func_start NewEfxQuakePure
NewEfxQuakePure: @ 0x08045F48
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, .L08045F80 @ =ProcScr_EfxQuakePure
	movs r1, #3
	bl SpawnProc
	ldr r2, .L08045F84 @ =gUnk_085CB930
	lsls r1, r4, #3
	adds r1, r1, r2
	ldr r1, [r1]
	str r1, [r0, #0x44]
	lsls r4, r4, #1
	adds r4, #1
	lsls r4, r4, #2
	adds r4, r4, r2
	ldr r1, [r4]
	adds r3, r0, #0
	adds r3, #0x29
	movs r2, #0
	strb r1, [r3]
	adds r1, r0, #0
	adds r1, #0x2a
	strb r5, [r1]
	strh r2, [r0, #0x2c]
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
.L08045F80: .4byte ProcScr_EfxQuakePure
.L08045F84: .4byte gUnk_085CB930

	thumb_func_start func_fe6_08045F88
func_fe6_08045F88: @ 0x08045F88
	push {r4, lr}
	adds r2, r0, #0
	ldr r3, [r2, #0x44]
	movs r1, #0x2c
	ldrsh r0, [r2, r1]
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrh r4, [r0]
	ldr r1, .L08045FB8 @ =0x00007FFF
	cmp r4, r1
	beq .L08045FC0
	ldr r1, .L08045FBC @ =gEkrBg2QuakeVec
	strh r4, [r1]
	movs r4, #0x2c
	ldrsh r0, [r2, r4]
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrh r0, [r0, #2]
	strh r0, [r1, #2]
	ldrh r0, [r2, #0x2c]
	adds r0, #1
	strh r0, [r2, #0x2c]
	b .L08045FEC
	.align 2, 0
.L08045FB8: .4byte 0x00007FFF
.L08045FBC: .4byte gEkrBg2QuakeVec
.L08045FC0:
	adds r0, r2, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	cmp r0, #0
	beq .L08045FD0
	cmp r0, #1
	beq .L08045FE4
	b .L08045FEC
.L08045FD0:
	strh r0, [r2, #0x2c]
	ldr r0, .L08045FE0 @ =gEkrBg2QuakeVec
	ldrh r1, [r3]
	strh r1, [r0]
	ldrh r1, [r3, #2]
	strh r1, [r0, #2]
	b .L08045FEC
	.align 2, 0
.L08045FE0: .4byte gEkrBg2QuakeVec
.L08045FE4:
	ldr r1, .L08045FF4 @ =gEkrBg2QuakeVec
	movs r0, #0
	strh r0, [r1, #2]
	strh r0, [r1]
.L08045FEC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08045FF4: .4byte gEkrBg2QuakeVec

	thumb_func_start NewEfxHitQuakePure
NewEfxHitQuakePure: @ 0x08045FF8
	push {lr}
	ldr r0, .L08046008 @ =ProcScr_EfxHitQuakePure
	movs r1, #3
	bl SpawnProc
	pop {r1}
	bx r1
	.align 2, 0
.L08046008: .4byte ProcScr_EfxHitQuakePure

	thumb_func_start EfxHitQuakePure_Loop
EfxHitQuakePure_Loop: @ 0x0804600C
	bx lr
	.align 2, 0

	thumb_func_start NewEfxQuake
NewEfxQuake: @ 0x08046010
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, .L08046020 @ =gUnk_Banim_02017740
	ldr r0, [r0]
	cmp r0, #1
	bne .L08046024
	movs r0, #0
	b .L08046100
	.align 2, 0
.L08046020: .4byte gUnk_Banim_02017740
.L08046024:
	ldr r1, .L08046050 @ =gUnk_Banim_02017734
	movs r0, #1
	str r0, [r1]
	ldr r0, .L08046054 @ =gUnk_085CB9A0
	movs r1, #3
	bl SpawnProc
	adds r2, r0, #0
	movs r0, #0
	strh r0, [r2, #0x2c]
	ldr r1, .L08046058 @ =gAnims
	ldr r0, [r1]
	str r0, [r2, #0x5c]
	ldr r0, [r1, #8]
	str r0, [r2, #0x60]
	cmp r4, #6
	bhi .L080460EC
	lsls r0, r4, #2
	ldr r1, .L0804605C @ =.L08046060
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
.L08046050: .4byte gUnk_Banim_02017734
.L08046054: .4byte gUnk_085CB9A0
.L08046058: .4byte gAnims
.L0804605C: .4byte .L08046060
.L08046060: @ jump table
	.4byte .L0804607C @ case 0
	.4byte .L0804608C @ case 1
	.4byte .L0804609C @ case 2
	.4byte .L080460AC @ case 3
	.4byte .L080460BC @ case 4
	.4byte .L080460CC @ case 5
	.4byte .L080460DC @ case 6
.L0804607C:
	ldr r0, .L08046088 @ =gUnk_08111C60
	str r0, [r2, #0x44]
	adds r1, r2, #0
	adds r1, #0x29
	movs r0, #0
	b .L080460F6
	.align 2, 0
.L08046088: .4byte gUnk_08111C60
.L0804608C:
	ldr r0, .L08046098 @ =gUnk_08111C82
	str r0, [r2, #0x44]
	adds r1, r2, #0
	adds r1, #0x29
	movs r0, #0
	b .L080460F6
	.align 2, 0
.L08046098: .4byte gUnk_08111C82
.L0804609C:
	ldr r0, .L080460A8 @ =gUnk_08111CCC
	str r0, [r2, #0x44]
	adds r1, r2, #0
	adds r1, #0x29
	movs r0, #0
	b .L080460F6
	.align 2, 0
.L080460A8: .4byte gUnk_08111CCC
.L080460AC:
	ldr r0, .L080460B8 @ =gUnk_08111D16
	str r0, [r2, #0x44]
	adds r1, r2, #0
	adds r1, #0x29
	movs r0, #0
	b .L080460F6
	.align 2, 0
.L080460B8: .4byte gUnk_08111D16
.L080460BC:
	ldr r0, .L080460C8 @ =gUnk_08111D60
	str r0, [r2, #0x44]
	adds r1, r2, #0
	adds r1, #0x29
	movs r0, #0
	b .L080460F6
	.align 2, 0
.L080460C8: .4byte gUnk_08111D60
.L080460CC:
	ldr r0, .L080460D8 @ =gUnk_08111DAA
	str r0, [r2, #0x44]
	adds r1, r2, #0
	adds r1, #0x29
	movs r0, #1
	b .L080460F6
	.align 2, 0
.L080460D8: .4byte gUnk_08111DAA
.L080460DC:
	ldr r0, .L080460E8 @ =gUnk_08111E14
	str r0, [r2, #0x44]
	adds r1, r2, #0
	adds r1, #0x29
	movs r0, #1
	b .L080460F6
	.align 2, 0
.L080460E8: .4byte gUnk_08111E14
.L080460EC:
	ldr r0, .L08046108 @ =gUnk_08111C60
	str r0, [r2, #0x44]
	adds r1, r2, #0
	adds r1, #0x29
	movs r0, #0
.L080460F6:
	strb r0, [r1]
	movs r0, #0
	strh r0, [r2, #0x34]
	strh r0, [r2, #0x3c]
	adds r0, r2, #0
.L08046100:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
.L08046108: .4byte gUnk_08111C60

	thumb_func_start EfxQuake_Loop
EfxQuake_Loop: @ 0x0804610C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	ldr r3, [r7, #0x44]
	ldrh r4, [r7, #0x2c]
	movs r1, #0x2c
	ldrsh r0, [r7, r1]
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrh r2, [r0]
	ldr r1, .L0804618C @ =0x00007FFF
	cmp r2, r1
	bne .L080461A0
	ldr r3, .L08046190 @ =gEkrXPosReal
	movs r4, #0
	ldrsh r2, [r3, r4]
	ldr r0, .L08046194 @ =gEkrBgPosition
	ldr r1, [r0]
	subs r6, r2, r1
	ldr r2, .L08046198 @ =gEkrYPosReal
	movs r4, #2
	ldrsh r0, [r3, r4]
	subs r4, r0, r1
	movs r0, #2
	ldrsh r5, [r2, r0]
	lsls r1, r6, #0x10
	asrs r1, r1, #0x10
	movs r3, #0
	ldrsh r2, [r2, r3]
	movs r0, #0
	bl SetEkrFrontAnimPostion
	lsls r1, r4, #0x10
	asrs r1, r1, #0x10
	adds r2, r5, #0
	movs r0, #1
	bl SetEkrFrontAnimPostion
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	bl GetEkrDragonStateType
	cmp r0, #0
	beq .L0804617C
	ldrh r1, [r7, #0x34]
	ldrh r2, [r7, #0x3c]
	adds r2, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #3
	bl SetBgOffset
.L0804617C:
	ldr r1, .L0804619C @ =gUnk_Banim_02017734
	movs r0, #0
	str r0, [r1]
	adds r0, r7, #0
	bl Proc_End
	b .L080462B2
	.align 2, 0
.L0804618C: .4byte 0x00007FFF
.L08046190: .4byte gEkrXPosReal
.L08046194: .4byte gEkrBgPosition
.L08046198: .4byte gEkrYPosReal
.L0804619C: .4byte gUnk_Banim_02017734
.L080461A0:
	ldr r5, .L080461F8 @ =gEkrBg2QuakeVec
	strh r2, [r5]
	movs r1, #0x2c
	ldrsh r0, [r7, r1]
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrh r0, [r0, #2]
	strh r0, [r5, #2]
	adds r0, r4, #1
	strh r0, [r7, #0x2c]
	ldrh r1, [r5]
	ldrh r2, [r5, #2]
	movs r0, #2
	bl SetBgOffset
	bl GetEkrDragonStateType
	cmp r0, #0
	beq .L080461E2
	ldrh r2, [r7, #0x34]
	ldrh r3, [r5]
	adds r1, r2, r3
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldrh r4, [r7, #0x3c]
	ldrh r0, [r5, #2]
	adds r2, r4, r0
	adds r2, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #3
	bl SetBgOffset
.L080461E2:
	bl GetEkrDragonStateType
	cmp r0, #0
	beq .L08046200
	ldr r4, .L080461FC @ =gEkrXPosReal
	movs r2, #0
	ldrsh r1, [r4, r2]
	movs r3, #0
	ldrsh r0, [r5, r3]
	subs r1, r1, r0
	b .L0804620C
	.align 2, 0
.L080461F8: .4byte gEkrBg2QuakeVec
.L080461FC: .4byte gEkrXPosReal
.L08046200:
	ldr r4, .L0804626C @ =gEkrXPosReal
	movs r2, #0
	ldrsh r1, [r4, r2]
	movs r3, #0
	ldrsh r0, [r5, r3]
	adds r1, r1, r0
.L0804620C:
	ldr r3, .L08046270 @ =gEkrBgPosition
	ldr r0, [r3]
	subs r6, r1, r0
	ldr r2, .L08046274 @ =gEkrYPosReal
	movs r1, #0
	ldrsh r0, [r2, r1]
	mov r8, r0
	movs r1, #2
	ldrsh r0, [r5, r1]
	mov r1, r8
	subs r1, r1, r0
	mov r8, r1
	adds r5, r2, #0
	movs r2, #2
	ldrsh r1, [r4, r2]
	ldr r2, .L08046278 @ =gEkrBg2QuakeVec
	movs r4, #0
	ldrsh r0, [r2, r4]
	adds r1, r1, r0
	ldr r0, [r3]
	subs r4, r1, r0
	movs r0, #2
	ldrsh r1, [r5, r0]
	movs r3, #2
	ldrsh r0, [r2, r3]
	subs r5, r1, r0
	ldr r0, .L0804627C @ =gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne .L08046280
	lsls r1, r6, #0x10
	asrs r1, r1, #0x10
	mov r3, r8
	lsls r2, r3, #0x10
	asrs r2, r2, #0x10
	movs r0, #0
	bl SetEkrFrontAnimPostion
	lsls r1, r4, #0x10
	asrs r1, r1, #0x10
	lsls r2, r5, #0x10
	asrs r2, r2, #0x10
	movs r0, #1
	bl SetEkrFrontAnimPostion
	b .L080462B2
	.align 2, 0
.L0804626C: .4byte gEkrXPosReal
.L08046270: .4byte gEkrBgPosition
.L08046274: .4byte gEkrYPosReal
.L08046278: .4byte gEkrBg2QuakeVec
.L0804627C: .4byte gEkrDistanceType
.L08046280:
	cmp r0, #0
	blt .L080462B2
	cmp r0, #2
	bgt .L080462B2
	ldr r0, [r7, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne .L080462A4
	lsls r1, r6, #0x10
	asrs r1, r1, #0x10
	mov r4, r8
	lsls r2, r4, #0x10
	asrs r2, r2, #0x10
	movs r0, #0
	bl SetEkrFrontAnimPostion
	b .L080462B2
.L080462A4:
	lsls r1, r4, #0x10
	asrs r1, r1, #0x10
	lsls r2, r5, #0x10
	asrs r2, r2, #0x10
	movs r0, #1
	bl SetEkrFrontAnimPostion
.L080462B2:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start NewEfxHitQuake
NewEfxHitQuake: @ 0x080462BC
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	mov sb, r0
	mov r8, r1
	adds r6, r2, #0
	ldr r0, .L08046300 @ =gUnk_Banim_02017738
	ldr r7, [r0]
	cmp r7, #0
	beq .L080462D4
	b .L08046446
.L080462D4:
	movs r4, #1
	str r4, [r0]
	ldr r0, .L08046304 @ =ProcScr_EfxHitQuake
	movs r1, #3
	bl SpawnProc
	adds r5, r0, #0
	mov r0, sb
	str r0, [r5, #0x5c]
	mov r1, r8
	str r1, [r5, #0x60]
	strh r7, [r5, #0x2c]
	adds r0, r5, #0
	adds r0, #0x29
	strb r4, [r0]
	cmp r6, #0
	beq .L0804633C
	cmp r6, #1
	bne .L0804630C
	ldr r0, .L08046308 @ =gUnk_08111C82
	b .L0804633E
	.align 2, 0
.L08046300: .4byte gUnk_Banim_02017738
.L08046304: .4byte ProcScr_EfxHitQuake
.L08046308: .4byte gUnk_08111C82
.L0804630C:
	cmp r6, #2
	bne .L08046318
	ldr r0, .L08046314 @ =gUnk_08111CCC
	b .L0804633E
	.align 2, 0
.L08046314: .4byte gUnk_08111CCC
.L08046318:
	cmp r6, #3
	bne .L08046324
	ldr r0, .L08046320 @ =gUnk_08111D16
	b .L0804633E
	.align 2, 0
.L08046320: .4byte gUnk_08111D16
.L08046324:
	cmp r6, #4
	bne .L08046330
	ldr r0, .L0804632C @ =gUnk_08111F30
	b .L0804633E
	.align 2, 0
.L0804632C: .4byte gUnk_08111F30
.L08046330:
	cmp r6, #5
	bne .L0804633C
	ldr r0, .L08046338 @ =gUnk_08111FC6
	b .L0804633E
	.align 2, 0
.L08046338: .4byte gUnk_08111FC6
.L0804633C:
	ldr r0, .L08046354 @ =gUnk_08111C60
.L0804633E:
	str r0, [r5, #0x44]
	movs r0, #1
	str r0, [r5, #0x48]
	bl GetEkrDragonStateTypeIdunn
	adds r4, r0, #0
	cmp r4, #0
	beq .L08046358
	movs r0, #0
	str r0, [r5, #0x64]
	b .L08046446
	.align 2, 0
.L08046354: .4byte gUnk_08111C60
.L08046358:
	bl GetBattleAnimArenaFlag
	cmp r0, #0
	beq .L08046364
	str r4, [r5, #0x64]
	b .L08046446
.L08046364:
	ldr r0, .L08046374 @ =gEkrDistanceType
	movs r2, #0
	ldrsh r0, [r0, r2]
	cmp r0, #0
	bne .L08046378
	str r0, [r5, #0x64]
	b .L08046446
	.align 2, 0
.L08046374: .4byte gEkrDistanceType
.L08046378:
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	ldr r1, .L080463A8 @ =gEkrBgPosition
	ldr r1, [r1]
	ldr r2, .L080463AC @ =gEkrXPosBase
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	subs r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r4, r1, #0x10
	mov r0, sb
	bl GetAnimPosition
	cmp r0, #0
	bne .L080463B4
	movs r0, #0x40
	strh r0, [r5, #0x36]
	movs r0, #0x68
	strh r0, [r5, #0x3e]
	ldr r0, .L080463B0 @ =gUnk_085CCE38
	b .L080463BE
	.align 2, 0
.L080463A8: .4byte gEkrBgPosition
.L080463AC: .4byte gEkrXPosBase
.L080463B0: .4byte gUnk_085CCE38
.L080463B4:
	movs r0, #0xb0
	strh r0, [r5, #0x36]
	movs r0, #0x68
	strh r0, [r5, #0x3e]
	ldr r0, .L080463E4 @ =gUnk_085CCDAC
.L080463BE:
	movs r1, #5
	bl BasCreate
	adds r1, r0, #0
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	ldrh r2, [r5, #0x36]
	subs r0, r2, r0
	strh r0, [r1, #2]
	ldrh r0, [r5, #0x3e]
	strh r0, [r1, #4]
	ldr r0, .L080463E8 @ =gUnk_Banim_02017754
	ldr r0, [r0]
	cmp r0, #1
	bne .L080463EC
	movs r0, #0xd3
	lsls r0, r0, #6
	b .L080463F0
	.align 2, 0
.L080463E4: .4byte gUnk_085CCDAC
.L080463E8: .4byte gUnk_Banim_02017754
.L080463EC:
	movs r0, #0xf3
	lsls r0, r0, #6
.L080463F0:
	strh r0, [r1, #8]
	str r1, [r5, #0x64]
	ldr r4, .L08046454 @ =gUnk_Banim_02000034
	mov r0, sb
	bl GetAnimPosition
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r0, [r0]
	ldr r1, .L08046458 @ =0x06011800
	movs r2, #0x80
	lsls r2, r2, #4
	bl RegisterDataMove
	ldr r4, .L0804645C @ =gUnk_Banim_02000044
	mov r0, sb
	bl GetAnimPosition
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r0, [r0]
	ldr r1, .L08046460 @ =gPal+0x260
	movs r2, #8
	bl CpuFastSet
	bl EnablePalSync
	ldr r0, .L08046464 @ =gEkrDistanceType
	movs r1, #0
	ldrsh r4, [r0, r1]
	mov r0, sb
	bl GetAnimPosition
	adds r1, r0, #0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r0, r4, #0
	bl func_fe6_0804C478
	ldr r0, .L08046468 @ =gEkrBgPosition
	ldr r0, [r0]
	bl func_fe6_08045EE8
.L08046446:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08046454: .4byte gUnk_Banim_02000034
.L08046458: .4byte 0x06011800
.L0804645C: .4byte gUnk_Banim_02000044
.L08046460: .4byte gPal+0x260
.L08046464: .4byte gEkrDistanceType
.L08046468: .4byte gEkrBgPosition

	thumb_func_start func_fe6_0804646C
func_fe6_0804646C: @ 0x0804646C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r6, r0, #0
	ldr r5, [r6, #0x44]
	movs r1, #0x2c
	ldrsh r0, [r6, r1]
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r1, .L080464B4 @ =0x00007FFF
	ldrh r0, [r0]
	cmp r0, r1
	beq .L0804648A
	b .L08046598
.L0804648A:
	ldr r0, .L080464B8 @ =gEkrDistanceType
	movs r2, #0
	ldrsh r0, [r0, r2]
	cmp r0, #0
	bne .L080464BC
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	bl GetEkrDragonStateType
	cmp r0, #0
	beq .L080464DE
	movs r0, #3
	movs r1, #0
	movs r2, #0x10
	bl SetBgOffset
	b .L080464DE
	.align 2, 0
.L080464B4: .4byte 0x00007FFF
.L080464B8: .4byte gEkrDistanceType
.L080464BC:
	cmp r0, #0
	blt .L080464DE
	cmp r0, #2
	bgt .L080464DE
	bl GetEkrDragonStateType
	cmp r0, #0
	beq .L080464D6
	movs r0, #3
	movs r1, #0
	movs r2, #0x10
	bl SetBgOffset
.L080464D6:
	ldr r0, .L08046580 @ =gEkrBgPosition
	ldr r0, [r0]
	bl func_fe6_08045EE8
.L080464DE:
	ldr r0, [r6, #0x64]
	cmp r0, #0
	beq .L080464EE
	bl BasRemove
	ldr r0, .L08046584 @ =gUnk_Banim_0201E0FC
	bl func_fe6_0804C330
.L080464EE:
	ldr r3, .L08046588 @ =gEkrXPosReal
	movs r4, #0
	ldrsh r2, [r3, r4]
	ldr r0, .L08046580 @ =gEkrBgPosition
	ldr r1, [r0]
	subs r7, r2, r1
	ldr r2, .L0804658C @ =gEkrYPosReal
	movs r5, #2
	ldrsh r0, [r3, r5]
	subs r4, r0, r1
	movs r0, #2
	ldrsh r5, [r2, r0]
	lsls r1, r7, #0x10
	asrs r1, r1, #0x10
	movs r3, #0
	ldrsh r2, [r2, r3]
	movs r0, #0
	bl SetEkrFrontAnimPostion
	lsls r1, r4, #0x10
	asrs r1, r1, #0x10
	adds r2, r5, #0
	movs r0, #1
	bl SetEkrFrontAnimPostion
	ldr r1, .L08046590 @ =gUnk_Banim_02017738
	movs r0, #0
	str r0, [r1]
	adds r0, r6, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #1
	bne .L08046576
	bl GetEkrDragonStateType
	cmp r0, #0
	beq .L08046542
	movs r0, #3
	movs r1, #0
	movs r2, #0x10
	bl SetBgOffset
.L08046542:
	ldr r4, .L08046594 @ =gEkrBg0QuakeVec
	ldrh r1, [r4]
	ldrh r2, [r4, #2]
	movs r0, #0
	bl SetBgOffset
	ldrh r5, [r4]
	rsbs r0, r5, #0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldrh r2, [r4, #2]
	rsbs r1, r2, #0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl func_fe6_0804392C
	ldrh r3, [r4]
	rsbs r0, r3, #0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r4, [r4, #2]
	rsbs r1, r4, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl func_fe6_08044230
.L08046576:
	adds r0, r6, #0
	bl Proc_End
	b .L08046786
	.align 2, 0
.L08046580: .4byte gEkrBgPosition
.L08046584: .4byte gUnk_Banim_0201E0FC
.L08046588: .4byte gEkrXPosReal
.L0804658C: .4byte gEkrYPosReal
.L08046590: .4byte gUnk_Banim_02017738
.L08046594: .4byte gEkrBg0QuakeVec
.L08046598:
	movs r0, #0x2c
	ldrsh r4, [r6, r0]
	cmp r4, #0
	bne .L080465C4
	ldr r0, [r6, #0x64]
	cmp r0, #0
	beq .L080465C4
	ldr r0, [r6, #0x5c]
	bl GetAnimPosition
	adds r1, r0, #0
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #1
	ldr r1, .L0804661C @ =gBg2Tm+0x2C0
	adds r0, r0, r1
	str r4, [sp]
	movs r1, #0xf
	movs r2, #5
	movs r3, #0
	bl FillBGRect
.L080465C4:
	ldr r4, .L08046620 @ =gEkrBg2QuakeVec
	movs r1, #0x2c
	ldrsh r0, [r6, r1]
	lsls r0, r0, #2
	adds r0, r0, r5
	movs r2, #0
	ldrsh r0, [r0, r2]
	strh r0, [r4]
	movs r3, #0x2c
	ldrsh r0, [r6, r3]
	lsls r0, r0, #2
	adds r0, r0, r5
	movs r5, #2
	ldrsh r0, [r0, r5]
	strh r0, [r4, #2]
	ldrh r0, [r6, #0x2c]
	adds r0, #1
	strh r0, [r6, #0x2c]
	ldr r0, [r6, #0x64]
	cmp r0, #0
	beq .L0804662C
	ldr r0, [r6, #0x5c]
	bl GetAnimPosition
	ldr r1, .L08046624 @ =gEkrBgPosition
	ldr r1, [r1]
	ldr r2, .L08046628 @ =gEkrXPosBase
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	subs r1, r1, r0
	ldr r2, [r6, #0x64]
	ldrh r3, [r6, #0x36]
	ldrh r5, [r4]
	adds r0, r3, r5
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	subs r0, r0, r1
	strh r0, [r2, #2]
	ldrh r1, [r6, #0x3e]
	ldrh r4, [r4, #2]
	subs r0, r1, r4
	strh r0, [r2, #4]
	b .L08046636
	.align 2, 0
.L0804661C: .4byte gBg2Tm+0x2C0
.L08046620: .4byte gEkrBg2QuakeVec
.L08046624: .4byte gEkrBgPosition
.L08046628: .4byte gEkrXPosBase
.L0804662C:
	ldrh r1, [r4]
	ldrh r2, [r4, #2]
	movs r0, #2
	bl SetBgOffset
.L08046636:
	adds r0, r6, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #1
	bne .L08046696
	ldr r5, .L080466CC @ =gEkrBg2QuakeVec
	ldr r4, .L080466D0 @ =gEkrBg0QuakeVec
	ldrh r2, [r5]
	ldrh r3, [r4]
	adds r1, r2, r3
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldrh r0, [r5, #2]
	ldrh r3, [r4, #2]
	adds r2, r0, r3
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #0
	bl SetBgOffset
	ldrh r1, [r5]
	ldrh r2, [r4]
	adds r0, r1, r2
	rsbs r0, r0, #0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldrh r3, [r5, #2]
	ldrh r2, [r4, #2]
	adds r1, r3, r2
	rsbs r1, r1, #0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl func_fe6_0804392C
	ldrh r3, [r5]
	ldrh r1, [r4]
	adds r0, r3, r1
	rsbs r0, r0, #0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r5, [r5, #2]
	ldrh r4, [r4, #2]
	adds r1, r5, r4
	rsbs r1, r1, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl func_fe6_08044230
.L08046696:
	bl GetEkrDragonStateType
	cmp r0, #0
	beq .L080466B0
	ldr r0, .L080466CC @ =gEkrBg2QuakeVec
	ldrh r1, [r0]
	ldrh r2, [r0, #2]
	adds r2, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #3
	bl SetBgOffset
.L080466B0:
	bl GetEkrDragonStateType
	cmp r0, #0
	beq .L080466D8
	ldr r2, .L080466D4 @ =gEkrXPosReal
	mov ip, r2
	movs r3, #0
	ldrsh r1, [r2, r3]
	ldr r2, .L080466CC @ =gEkrBg2QuakeVec
	movs r4, #0
	ldrsh r0, [r2, r4]
	subs r1, r1, r0
	b .L080466E8
	.align 2, 0
.L080466CC: .4byte gEkrBg2QuakeVec
.L080466D0: .4byte gEkrBg0QuakeVec
.L080466D4: .4byte gEkrXPosReal
.L080466D8:
	ldr r0, .L08046740 @ =gEkrXPosReal
	mov ip, r0
	movs r2, #0
	ldrsh r1, [r0, r2]
	ldr r2, .L08046744 @ =gEkrBg2QuakeVec
	movs r3, #0
	ldrsh r0, [r2, r3]
	adds r1, r1, r0
.L080466E8:
	ldr r4, .L08046748 @ =gEkrBgPosition
	ldr r0, [r4]
	subs r7, r1, r0
	ldr r3, .L0804674C @ =gEkrYPosReal
	movs r5, #0
	ldrsh r1, [r3, r5]
	movs r5, #2
	ldrsh r0, [r2, r5]
	subs r1, r1, r0
	mov r8, r1
	mov r5, ip
	movs r1, #2
	ldrsh r0, [r5, r1]
	movs r5, #0
	ldrsh r1, [r2, r5]
	adds r0, r0, r1
	ldr r1, [r4]
	subs r4, r0, r1
	movs r0, #2
	ldrsh r1, [r3, r0]
	movs r3, #2
	ldrsh r0, [r2, r3]
	subs r5, r1, r0
	ldr r0, .L08046750 @ =gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne .L08046754
	lsls r1, r7, #0x10
	asrs r1, r1, #0x10
	mov r3, r8
	lsls r2, r3, #0x10
	asrs r2, r2, #0x10
	movs r0, #0
	bl SetEkrFrontAnimPostion
	lsls r1, r4, #0x10
	asrs r1, r1, #0x10
	lsls r2, r5, #0x10
	asrs r2, r2, #0x10
	movs r0, #1
	bl SetEkrFrontAnimPostion
	b .L08046786
	.align 2, 0
.L08046740: .4byte gEkrXPosReal
.L08046744: .4byte gEkrBg2QuakeVec
.L08046748: .4byte gEkrBgPosition
.L0804674C: .4byte gEkrYPosReal
.L08046750: .4byte gEkrDistanceType
.L08046754:
	cmp r0, #0
	blt .L08046786
	cmp r0, #2
	bgt .L08046786
	ldr r0, [r6, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne .L08046778
	lsls r1, r7, #0x10
	asrs r1, r1, #0x10
	mov r4, r8
	lsls r2, r4, #0x10
	asrs r2, r2, #0x10
	movs r0, #0
	bl SetEkrFrontAnimPostion
	b .L08046786
.L08046778:
	lsls r1, r4, #0x10
	asrs r1, r1, #0x10
	lsls r2, r5, #0x10
	asrs r2, r2, #0x10
	movs r0, #1
	bl SetEkrFrontAnimPostion
.L08046786:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start NewEfxFlashBgWhite
NewEfxFlashBgWhite: @ 0x08046794
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, .L080467C4 @ =ProcScr_EfxFlashBG
	movs r1, #0
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r5, [r0, #0x2e]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [sp]
	ldr r1, .L080467C8 @ =gEfxPal
	ldr r2, .L080467CC @ =0x01000100
	mov r0, sp
	bl CpuFastSet
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L080467C4: .4byte ProcScr_EfxFlashBG
.L080467C8: .4byte gEfxPal
.L080467CC: .4byte 0x01000100

	thumb_func_start NewEfxFlashBgRed
NewEfxFlashBgRed: @ 0x080467D0
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, .L08046800 @ =ProcScr_EfxFlashBG
	movs r1, #0
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r5, [r0, #0x2e]
	ldr r0, .L08046804 @ =0x001F001F
	str r0, [sp]
	ldr r1, .L08046808 @ =gEfxPal
	ldr r2, .L0804680C @ =0x01000100
	mov r0, sp
	bl CpuFastSet
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08046800: .4byte ProcScr_EfxFlashBG
.L08046804: .4byte 0x001F001F
.L08046808: .4byte gEfxPal
.L0804680C: .4byte 0x01000100

	thumb_func_start NewEfxFlashBgBlack
NewEfxFlashBgBlack: @ 0x08046810
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, .L08046844 @ =gEfxPal
	movs r1, #0xa0
	lsls r1, r1, #0x13
	movs r2, #0x80
	lsls r2, r2, #1
	bl CpuFastSet
	bl DisablePalSync
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r4, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	blt .L0804683C
	adds r0, r4, #0
	bl Proc_Break
.L0804683C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08046844: .4byte gEfxPal

	thumb_func_start EfxFlashRestorePalSync
EfxFlashRestorePalSync: @ 0x08046848
	push {r4, lr}
	adds r4, r0, #0
	bl EnablePalSync
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start NewEfxWhiteOUT
NewEfxWhiteOUT: @ 0x0804685C
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	ldr r0, .L0804687C @ =ProcScr_EfxWhiteOUT
	movs r1, #0
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r5, [r0, #0x2e]
	strh r6, [r0, #0x30]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L0804687C: .4byte ProcScr_EfxWhiteOUT

	thumb_func_start func_fe6_08046880
func_fe6_08046880: @ 0x08046880
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r0, .L080468D0 @ =gPal
	ldr r4, .L080468D4 @ =gEfxPal
	movs r5, #0x80
	lsls r5, r5, #1
	adds r1, r4, #0
	adds r2, r5, #0
	bl CpuFastSet
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0x20
	movs r3, #0x10
	bl EfxPalWhiteInOut
	movs r1, #0xa0
	lsls r1, r1, #0x13
	adds r0, r4, #0
	adds r2, r5, #0
	bl CpuFastSet
	bl DisablePalSync
	ldrh r0, [r6, #0x2c]
	adds r0, #1
	strh r0, [r6, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r6, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	ble .L080468CA
	movs r0, #0
	strh r0, [r6, #0x2c]
	adds r0, r6, #0
	bl Proc_Break
.L080468CA:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L080468D0: .4byte gPal
.L080468D4: .4byte gEfxPal

	thumb_func_start func_fe6_080468D8
func_fe6_080468D8: @ 0x080468D8
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r7, r0, #0
	movs r0, #0x2c
	ldrsh r3, [r7, r0]
	movs r1, #0x30
	ldrsh r0, [r7, r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #0x10
	movs r2, #0
	bl Interpolate
	adds r6, r0, #0
	ldr r0, .L08046940 @ =gPal
	ldr r4, .L08046944 @ =gEfxPal
	movs r5, #0x80
	lsls r5, r5, #1
	adds r1, r4, #0
	adds r2, r5, #0
	bl CpuFastSet
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0x20
	adds r3, r6, #0
	bl EfxPalWhiteInOut
	movs r1, #0xa0
	lsls r1, r1, #0x13
	adds r0, r4, #0
	adds r2, r5, #0
	bl CpuFastSet
	bl DisablePalSync
	ldrh r0, [r7, #0x2c]
	adds r0, #1
	strh r0, [r7, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r7, #0x30]
	lsls r1, r2, #0x10
	cmp r0, r1
	ble .L08046936
	adds r0, r7, #0
	bl Proc_Break
.L08046936:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08046940: .4byte gPal
.L08046944: .4byte gEfxPal

	thumb_func_start func_fe6_08046948
func_fe6_08046948: @ 0x08046948
	push {r4, lr}
	adds r4, r0, #0
	bl EnablePalSync
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start NewEfxFlashHPBar
NewEfxFlashHPBar: @ 0x0804695C
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	ldr r0, .L08046990 @ =gUnk_085CBA20
	movs r1, #4
	bl SpawnProc
	adds r1, r0, #0
	str r6, [r1, #0x5c]
	movs r0, #0
	strh r0, [r1, #0x2c]
	strh r4, [r1, #0x2e]
	strh r5, [r1, #0x30]
	cmp r4, #0
	bne .L0804698A
	adds r0, r1, #0
	bl Proc_Break
.L0804698A:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08046990: .4byte gUnk_085CBA20

	thumb_func_start func_fe6_08046994
func_fe6_08046994: @ 0x08046994
	push {lr}
	adds r2, r0, #0
	ldrh r0, [r2, #0x2c]
	adds r0, #1
	strh r0, [r2, #0x2c]
	lsls r0, r0, #0x10
	ldrh r3, [r2, #0x2e]
	lsls r1, r3, #0x10
	cmp r0, r1
	blt .L080469AE
	adds r0, r2, #0
	bl Proc_Break
.L080469AE:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_fe6_080469B4
func_fe6_080469B4: @ 0x080469B4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne .L080469D8
	ldr r0, .L080469D0 @ =gUnk_081134A4
	ldr r1, .L080469D4 @ =gPal+0x360
	movs r2, #0x10
	bl CpuSet
	b .L080469E2
	.align 2, 0
.L080469D0: .4byte gUnk_081134A4
.L080469D4: .4byte gPal+0x360
.L080469D8:
	ldr r0, .L08046A04 @ =gUnk_081134A4
	ldr r1, .L08046A08 @ =gPal+0x380
	movs r2, #0x10
	bl CpuSet
.L080469E2:
	bl EnablePalSync
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r4, #0x30]
	lsls r1, r2, #0x10
	cmp r0, r1
	blt .L080469FC
	adds r0, r4, #0
	bl Proc_Break
.L080469FC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08046A04: .4byte gUnk_081134A4
.L08046A08: .4byte gPal+0x380

	thumb_func_start func_fe6_08046A0C
func_fe6_08046A0C: @ 0x08046A0C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne .L08046A3C
	ldr r0, .L08046A30 @ =gBanimFactionPal
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r0, r0, #5
	ldr r1, .L08046A34 @ =gUnk_08113424
	adds r0, r0, r1
	ldr r1, .L08046A38 @ =gPal+0x360
	movs r2, #0x10
	bl CpuSet
	b .L08046A50
	.align 2, 0
.L08046A30: .4byte gBanimFactionPal
.L08046A34: .4byte gUnk_08113424
.L08046A38: .4byte gPal+0x360
.L08046A3C:
	ldr r0, .L08046A60 @ =gBanimFactionPal
	movs r1, #2
	ldrsh r0, [r0, r1]
	lsls r0, r0, #5
	ldr r1, .L08046A64 @ =gUnk_08113424
	adds r0, r0, r1
	ldr r1, .L08046A68 @ =gPal+0x380
	movs r2, #0x10
	bl CpuSet
.L08046A50:
	bl EnablePalSync
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08046A60: .4byte gBanimFactionPal
.L08046A64: .4byte gUnk_08113424
.L08046A68: .4byte gPal+0x380

	thumb_func_start NewEfxHPBarColorChange
NewEfxHPBarColorChange: @ 0x08046A6C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r5, r0, #0
	ldr r4, .L08046B24 @ =gUnk_Banim_02017774
	ldr r0, .L08046B28 @ =gUnk_085CBA50
	movs r1, #3
	bl SpawnProc
	str r0, [r4]
	str r5, [r0, #0x5c]
	movs r2, #0
	strh r2, [r0, #0x2c]
	str r2, [r0, #0x44]
	ldr r1, .L08046B2C @ =gUnk_081120F8
	str r1, [r0, #0x48]
	str r2, [r0, #0x4c]
	str r2, [r0, #0x50]
	ldr r0, .L08046B30 @ =gBanimFactionPal
	mov r8, r0
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r0, r0, #5
	ldr r7, .L08046B34 @ =gUnk_08113424
	adds r0, r0, r7
	ldr r6, .L08046B38 @ =gUnk_Banim_0201DF6C
	adds r1, r6, #0
	movs r2, #0x10
	bl EfxSplitColor
	mov r2, r8
	movs r1, #0
	ldrsh r0, [r2, r1]
	lsls r0, r0, #5
	ldr r2, .L08046B3C @ =gUnk_081134C4
	mov sl, r2
	add r0, sl
	ldr r4, .L08046B40 @ =gUnk_Banim_0201DFCC
	adds r1, r4, #0
	movs r2, #0x10
	bl EfxSplitColor
	ldr r5, .L08046B44 @ =gUnk_Banim_0201E02C
	movs r0, #5
	mov sb, r0
	str r0, [sp]
	adds r0, r6, #0
	adds r1, r4, #0
	adds r2, r5, #0
	movs r3, #0x10
	bl func_fe6_0805B88C
	mov r1, r8
	movs r2, #2
	ldrsh r0, [r1, r2]
	lsls r0, r0, #5
	adds r0, r0, r7
	adds r6, #0x30
	adds r1, r6, #0
	movs r2, #0x10
	bl EfxSplitColor
	mov r1, r8
	movs r2, #2
	ldrsh r0, [r1, r2]
	lsls r0, r0, #5
	add r0, sl
	adds r4, #0x30
	adds r1, r4, #0
	movs r2, #0x10
	bl EfxSplitColor
	adds r5, #0x60
	mov r0, sb
	str r0, [sp]
	adds r0, r6, #0
	adds r1, r4, #0
	adds r2, r5, #0
	movs r3, #0x10
	bl func_fe6_0805B88C
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08046B24: .4byte gUnk_Banim_02017774
.L08046B28: .4byte gUnk_085CBA50
.L08046B2C: .4byte gUnk_081120F8
.L08046B30: .4byte gBanimFactionPal
.L08046B34: .4byte gUnk_08113424
.L08046B38: .4byte gUnk_Banim_0201DF6C
.L08046B3C: .4byte gUnk_081134C4
.L08046B40: .4byte gUnk_Banim_0201DFCC
.L08046B44: .4byte gUnk_Banim_0201E02C

	thumb_func_start EndEfxHPBarColorChange
EndEfxHPBarColorChange: @ 0x08046B48
	push {lr}
	ldr r0, .L08046B58 @ =gUnk_Banim_02017774
	ldr r0, [r0]
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
.L08046B58: .4byte gUnk_Banim_02017774

	thumb_func_start func_fe6_08046B5C
func_fe6_08046B5C: @ 0x08046B5C
	ldr r0, .L08046B68 @ =gUnk_Banim_02017774
	ldr r1, [r0]
	movs r0, #1
	str r0, [r1, #0x50]
	bx lr
	.align 2, 0
.L08046B68: .4byte gUnk_Banim_02017774

	thumb_func_start func_fe6_08046B6C
func_fe6_08046B6C: @ 0x08046B6C
	ldr r0, .L08046B78 @ =gUnk_Banim_02017774
	ldr r1, [r0]
	movs r0, #0
	str r0, [r1, #0x50]
	bx lr
	.align 2, 0
.L08046B78: .4byte gUnk_Banim_02017774

	thumb_func_start EfxHpBarColorChange_Loop
EfxHpBarColorChange_Loop: @ 0x08046B7C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	adds r7, r0, #0
	ldr r0, [r7, #0x50]
	cmp r0, #1
	beq .L08046BF4
	adds r0, r7, #0
	adds r0, #0x2c
	adds r1, r7, #0
	adds r1, #0x44
	ldr r2, [r7, #0x48]
	bl EfxAdvanceFrameLut
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0
	blt .L08046BA8
	str r0, [r7, #0x4c]
.L08046BA8:
	ldr r4, .L08046C04 @ =gPal+0x360
	ldr r5, .L08046C08 @ =gUnk_Banim_0201DF6C
	ldr r6, .L08046C0C @ =gUnk_Banim_0201DFCC
	ldr r0, .L08046C10 @ =gUnk_Banim_0201E02C
	mov r8, r0
	movs r0, #0x10
	mov sl, r0
	str r0, [sp]
	ldr r0, [r7, #0x4c]
	str r0, [sp, #4]
	movs r0, #5
	mov sb, r0
	str r0, [sp, #8]
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r6, #0
	mov r3, r8
	bl EfxDecodeSplitedPalette
	adds r4, #0x20
	adds r5, #0x30
	adds r6, #0x30
	movs r0, #0x60
	add r8, r0
	mov r0, sl
	str r0, [sp]
	ldr r0, [r7, #0x4c]
	str r0, [sp, #4]
	mov r0, sb
	str r0, [sp, #8]
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r6, #0
	mov r3, r8
	bl EfxDecodeSplitedPalette
	bl EnablePalSync
.L08046BF4:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08046C04: .4byte gPal+0x360
.L08046C08: .4byte gUnk_Banim_0201DF6C
.L08046C0C: .4byte gUnk_Banim_0201DFCC
.L08046C10: .4byte gUnk_Banim_0201E02C
