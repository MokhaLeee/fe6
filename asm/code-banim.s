	.include "macro.inc"
	.syntax unified


	thumb_func_start ResetClassReelSpell
ResetClassReelSpell: @ 0x08057EF4
	ldr r0, .L08057F00 @ =0x0203CDD8
	movs r1, #0
	str r1, [r0]
	ldr r0, .L08057F04 @ =0x0203CDDC
	str r1, [r0]
	bx lr
	.align 2, 0
.L08057F00: .4byte 0x0203CDD8
.L08057F04: .4byte 0x0203CDDC

	thumb_func_start EndActiveClassReelSpell
EndActiveClassReelSpell: @ 0x08057F08
	push {r4, lr}
	ldr r4, .L08057F20 @ =0x0203CDD8
	ldr r0, [r4]
	cmp r0, #0
	beq .L08057F1A
	bl Proc_End
	movs r0, #0
	str r0, [r4]
.L08057F1A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08057F20: .4byte 0x0203CDD8

	thumb_func_start EndActiveClassReelBgColorProc
EndActiveClassReelBgColorProc: @ 0x08057F24
	push {r4, lr}
	ldr r4, .L08057F3C @ =0x0203CDDC
	ldr r0, [r4]
	cmp r0, #0
	beq .L08057F36
	bl Proc_End
	movs r0, #0
	str r0, [r4]
.L08057F36:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08057F3C: .4byte 0x0203CDDC

	thumb_func_start SetActiveClassReelSpell
SetActiveClassReelSpell: @ 0x08057F40
	ldr r1, .L08057F48 @ =0x0203CDD8
	str r0, [r1]
	bx lr
	.align 2, 0
.L08057F48: .4byte 0x0203CDD8

	thumb_func_start SetActiveCRSpellBgColorProc
SetActiveCRSpellBgColorProc: @ 0x08057F4C
	ldr r1, .L08057F54 @ =0x0203CDDC
	str r0, [r1]
	bx lr
	.align 2, 0
.L08057F54: .4byte 0x0203CDDC

	thumb_func_start func_fe6_08057F58
func_fe6_08057F58: @ 0x08057F58
	ldr r0, [r0, #0x44]
	ldr r0, [r0, #0x2c]
	bx lr
	.align 2, 0

	thumb_func_start func_fe6_08057F60
func_fe6_08057F60: @ 0x08057F60
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	bl GetAnimPosition
	cmp r0, #0
	bne .L08057F7C
	ldr r0, .L08057F78 @ =gUnk_081122C5
	ldrh r1, [r4, #2]
	ldrb r0, [r0]
	subs r0, r1, r0
	b .L08057F84
	.align 2, 0
.L08057F78: .4byte gUnk_081122C5
.L08057F7C:
	ldr r0, .L08057FB4 @ =gUnk_081122CA
	ldrb r0, [r0]
	ldrh r3, [r4, #2]
	subs r0, r0, r3
.L08057F84:
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	movs r2, #0x58
	ldrh r4, [r4, #4]
	subs r2, r2, r4
	ldrh r0, [r5, #0x12]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldrh r3, [r5, #2]
	subs r1, r1, r3
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	ldrh r5, [r5, #4]
	subs r2, r2, r5
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	bl SetBgOffset
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08057FB4: .4byte gUnk_081122CA

	thumb_func_start func_fe6_08057FB8
func_fe6_08057FB8: @ 0x08057FB8
	push {r4, lr}
	sub sp, #4
	bl func_fe6_08057F58
	adds r4, r0, #0
	movs r0, #0
	str r0, [sp]
	ldr r1, [r4, #0x14]
	ldr r2, .L08057FE4 @ =0x01000200
	mov r0, sp
	bl CpuFastSet
	movs r0, #1
	ldrh r4, [r4, #0x12]
	lsls r0, r4
	bl EnableBgSync
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08057FE4: .4byte 0x01000200

	thumb_func_start func_fe6_08057FE8
func_fe6_08057FE8: @ 0x08057FE8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r7, r2, #0
	adds r6, r3, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	bl func_fe6_08057F58
	mov r8, r0
	cmp r4, #0
	bne .L08058008
	adds r0, r7, #0
	b .L0805800A
.L08058008:
	adds r0, r6, #0
.L0805800A:
	movs r1, #0x78
	bl BasCreate
	adds r2, r0, #0
	mov r1, r8
	ldrh r1, [r1, #0x10]
	lsls r0, r1, #0xc
	mov r3, r8
	ldrh r3, [r3, #0xe]
	orrs r0, r3
	movs r3, #0x80
	lsls r3, r3, #4
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2, #8]
	ldrh r0, [r5, #2]
	strh r0, [r2, #2]
	ldrh r0, [r5, #4]
	strh r0, [r2, #4]
	adds r0, r2, #0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start func_fe6_0805803C
func_fe6_0805803C: @ 0x0805803C
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r6, r2, #0
	lsls r1, r1, #0x10
	lsrs r7, r1, #0x10
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	adds r5, r3, #0
	bl func_fe6_08057F58
	adds r4, r0, #0
	cmp r5, #1
	bne .L0805805E
	ldr r1, [r4, #0x1c]
	adds r0, r6, #0
	bl LZ77UnCompWram
.L0805805E:
	adds r2, r6, #0
	cmp r5, #1
	bne .L08058066
	ldr r2, [r4, #0x1c]
.L08058066:
	cmp r7, #0
	bne .L08058080
	ldr r1, [r4, #0x14]
	ldrh r0, [r4, #0xc]
	str r0, [sp]
	ldrh r0, [r4, #0xa]
	str r0, [sp, #4]
	adds r0, r2, #0
	movs r2, #0x1e
	movs r3, #0x14
	bl EfxTmCpyBgHFlip
	b .L08058094
.L08058080:
	ldr r1, [r4, #0x14]
	ldrh r0, [r4, #0xc]
	str r0, [sp]
	ldrh r0, [r4, #0xa]
	str r0, [sp, #4]
	adds r0, r2, #0
	movs r2, #0x1e
	movs r3, #0x14
	bl EfxTmCpyBG
.L08058094:
	movs r0, #1
	ldrh r4, [r4, #0x12]
	lsls r0, r4
	bl EnableBgSync
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_fe6_080580A8
func_fe6_080580A8: @ 0x080580A8
	push {r4, r5, r6, lr}
	adds r6, r1, #0
	bl func_fe6_08057F58
	adds r4, r0, #0
	ldrh r0, [r4, #0xa]
	lsls r5, r0, #5
	movs r0, #0xc0
	lsls r0, r0, #0x13
	adds r5, r5, r0
	ldr r1, [r4, #0x18]
	adds r0, r6, #0
	bl LZ77UnCompWram
	ldr r0, [r4, #0x18]
	movs r2, #0x80
	lsls r2, r2, #6
	adds r1, r5, #0
	bl RegisterDataMove
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_fe6_080580D8
func_fe6_080580D8: @ 0x080580D8
	push {r4, lr}
	adds r4, r1, #0
	bl func_fe6_08057F58
	ldrh r0, [r0, #0xc]
	lsls r1, r0, #5
	ldr r0, .L080580FC @ =gPal
	adds r1, r1, r0
	adds r0, r4, #0
	movs r2, #8
	bl CpuFastSet
	bl EnablePalSync
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L080580FC: .4byte gPal

	thumb_func_start func_fe6_08058100
func_fe6_08058100: @ 0x08058100
	push {r4, r5, r6, lr}
	adds r6, r1, #0
	bl func_fe6_08057F58
	adds r4, r0, #0
	ldrh r0, [r4, #0xe]
	lsls r5, r0, #5
	ldr r0, .L0805812C @ =0x06010000
	adds r5, r5, r0
	ldr r1, [r4, #0x20]
	adds r0, r6, #0
	bl LZ77UnCompWram
	ldr r0, [r4, #0x20]
	movs r2, #0x80
	lsls r2, r2, #5
	adds r1, r5, #0
	bl RegisterDataMove
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L0805812C: .4byte 0x06010000

	thumb_func_start func_fe6_08058130
func_fe6_08058130: @ 0x08058130
	push {r4, lr}
	adds r4, r1, #0
	bl func_fe6_08057F58
	ldrh r0, [r0, #0x10]
	lsls r1, r0, #5
	ldr r0, .L08058154 @ =gPal+0x200
	adds r1, r1, r0
	adds r0, r4, #0
	movs r2, #8
	bl CpuFastSet
	bl EnablePalSync
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08058154: .4byte gPal+0x200

	thumb_func_start func_fe6_08058158
func_fe6_08058158: @ 0x08058158
	push {r4, lr}
	adds r4, r0, #0
	bl func_fe6_08057F58
	ldr r1, .L08058178 @ =gUnk_085D3904
	ldrh r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08058178: .4byte gUnk_085D3904

	thumb_func_start func_fe6_0805817C
func_fe6_0805817C: @ 0x0805817C
	bx lr
	.align 2, 0

	thumb_func_start func_fe6_08058180
func_fe6_08058180: @ 0x08058180
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, .L0805819C @ =gUnk_085D3924
	movs r1, #3
	bl SpawnProc
	adds r5, r0, #0
	bl SetActiveClassReelSpell
	str r4, [r5, #0x5c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0805819C: .4byte gUnk_085D3924

	thumb_func_start func_fe6_080581A0
func_fe6_080581A0: @ 0x080581A0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	adds r1, r4, #0
	bl func_fe6_080581C0
	ldr r0, [r4, #0x5c]
	adds r1, r4, #0
	bl func_fe6_0805826C
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start func_fe6_080581C0
func_fe6_080581C0: @ 0x080581C0
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	bl func_fe6_08057F58
	adds r6, r0, #0
	ldr r0, .L0805820C @ =gUnk_085D394C
	adds r1, r4, #0
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	str r0, [r4, #0x44]
	ldr r0, .L08058210 @ =gUnk_0811AF20
	str r0, [r4, #0x48]
	ldr r0, .L08058214 @ =gUnk_085D3964
	str r0, [r4, #0x4c]
	ldr r1, .L08058218 @ =Pal_EfxFireBG
	adds r0, r5, #0
	bl func_fe6_080580D8
	ldr r0, [r4, #0x5c]
	ldr r1, .L0805821C @ =Img_EfxFireBG
	bl func_fe6_080580A8
	ldr r0, [r6, #0x24]
	bl _call_via_r0
	ldr r0, [r4, #0x5c]
	adds r1, r6, #0
	bl func_fe6_08057F60
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L0805820C: .4byte gUnk_085D394C
.L08058210: .4byte gUnk_0811AF20
.L08058214: .4byte gUnk_085D3964
.L08058218: .4byte Pal_EfxFireBG
.L0805821C: .4byte Img_EfxFireBG

	thumb_func_start func_fe6_08058220
func_fe6_08058220: @ 0x08058220
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl EfxAdvanceFrameLut
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0
	blt .L0805824C
	ldr r2, [r4, #0x4c]
	ldr r0, [r4, #0x5c]
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r2, [r1]
	movs r1, #1
	movs r3, #1
	bl func_fe6_0805803C
	b .L08058264
.L0805824C:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne .L08058264
	ldr r0, [r4, #0x5c]
	bl func_fe6_08057FB8
	bl SpellFx_ClearColorEffects
	adds r0, r4, #0
	bl Proc_Break
.L08058264:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_fe6_0805826C
func_fe6_0805826C: @ 0x0805826C
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	bl func_fe6_08057F58
	adds r7, r0, #0
	ldr r0, .L080582A8 @ =gUnk_085D3994
	adds r1, r4, #0
	bl SpawnProc
	adds r6, r0, #0
	str r5, [r6, #0x5c]
	movs r0, #0
	strh r0, [r6, #0x2c]
	ldr r2, .L080582AC @ =AnimScr_EfxFireOBJ_R_Front
	ldr r3, .L080582B0 @ =AnimScr_EfxFireOBJ_L_Front
	adds r0, r5, #0
	movs r1, #1
	bl func_fe6_08057FE8
	adds r4, r0, #0
	str r4, [r6, #0x60]
	adds r0, r5, #0
	bl GetAnimPosition
	cmp r0, #0
	bne .L080582B4
	ldrh r0, [r5, #2]
	subs r0, #8
	b .L080582B8
	.align 2, 0
.L080582A8: .4byte gUnk_085D3994
.L080582AC: .4byte AnimScr_EfxFireOBJ_R_Front
.L080582B0: .4byte AnimScr_EfxFireOBJ_L_Front
.L080582B4:
	ldrh r0, [r5, #2]
	adds r0, #8
.L080582B8:
	strh r0, [r4, #2]
	ldrh r0, [r5, #4]
	adds r0, #8
	strh r0, [r4, #4]
	ldrh r2, [r4, #2]
	ldrh r3, [r7, #6]
	adds r1, r2, r3
	strh r1, [r4, #2]
	ldrh r7, [r7, #8]
	adds r0, r7, r0
	strh r0, [r4, #4]
	ldr r0, [r6, #0x5c]
	ldr r1, .L080582E4 @ =Pal_EfxFireOBJ
	bl func_fe6_08058130
	ldr r0, [r6, #0x5c]
	ldr r1, .L080582E8 @ =Img_EfxFireOBJ
	bl func_fe6_08058100
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L080582E4: .4byte Pal_EfxFireOBJ
.L080582E8: .4byte Img_EfxFireOBJ

	thumb_func_start func_fe6_080582EC
func_fe6_080582EC: @ 0x080582EC
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x32
	ble .L0805830A
	ldr r0, [r4, #0x60]
	bl BasRemove
	adds r0, r4, #0
	bl Proc_Break
.L0805830A:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start func_fe6_08058310
func_fe6_08058310: @ 0x08058310
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, .L0805832C @ =gUnk_085D39AC
	movs r1, #3
	bl SpawnProc
	adds r5, r0, #0
	bl SetActiveClassReelSpell
	str r4, [r5, #0x5c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0805832C: .4byte gUnk_085D39AC

	thumb_func_start func_fe6_08058330
func_fe6_08058330: @ 0x08058330
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	adds r1, r4, #0
	bl func_fe6_08058358
	ldr r0, [r4, #0x5c]
	adds r1, r4, #0
	bl func_fe6_08058438
	ldr r0, [r4, #0x5c]
	adds r1, r4, #0
	bl func_fe6_080584AC
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start func_fe6_08058358
func_fe6_08058358: @ 0x08058358
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	bl func_fe6_08057F58
	adds r6, r0, #0
	ldr r0, .L080583A0 @ =gUnk_085D39D4
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	str r0, [r4, #0x44]
	ldr r0, .L080583A4 @ =gUnk_0811AF52
	str r0, [r4, #0x48]
	ldr r0, .L080583A8 @ =gUnk_085D39EC
	str r0, [r4, #0x4c]
	ldr r1, .L080583AC @ =Pal_EfxThunderBGCOL
	adds r0, r5, #0
	bl func_fe6_080580D8
	ldr r0, [r4, #0x5c]
	ldr r1, .L080583B0 @ =Img_EfxThunderBG
	bl func_fe6_080580A8
	ldr r0, [r6, #0x24]
	bl _call_via_r0
	ldr r0, [r4, #0x5c]
	adds r1, r6, #0
	bl func_fe6_08057F60
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L080583A0: .4byte gUnk_085D39D4
.L080583A4: .4byte gUnk_0811AF52
.L080583A8: .4byte gUnk_085D39EC
.L080583AC: .4byte Pal_EfxThunderBGCOL
.L080583B0: .4byte Img_EfxThunderBG

	thumb_func_start func_fe6_080583B4
func_fe6_080583B4: @ 0x080583B4
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r4, r0, #0
	movs r7, #0
	ldr r0, [r4, #0x5c]
	bl func_fe6_08057F58
	adds r6, r0, #0
	adds r0, r4, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl EfxAdvanceFrameLut
	lsls r0, r0, #0x10
	asrs r5, r0, #0x10
	cmp r5, #0
	blt .L08058416
	ldr r2, [r4, #0x4c]
	ldr r0, [r4, #0x5c]
	lsls r1, r5, #2
	adds r1, r1, r2
	ldr r2, [r1]
	movs r1, #0
	movs r3, #1
	bl func_fe6_0805803C
	cmp r5, #0
	bne .L080583F8
	ldrh r0, [r6, #0xa]
	adds r0, #0x1f
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
.L080583F8:
	cmp r5, #1
	bne .L08058404
	ldrh r0, [r6, #0xa]
	adds r0, #0x50
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
.L08058404:
	ldr r0, [r6, #0x14]
	adds r0, #0x3c
	ldrh r3, [r6, #0xc]
	str r7, [sp]
	movs r1, #2
	movs r2, #0x14
	bl FillBGRect
	b .L0805842E
.L08058416:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r5, r0
	bne .L0805842E
	ldr r0, [r4, #0x5c]
	bl func_fe6_08057FB8
	bl SpellFx_ClearColorEffects
	adds r0, r4, #0
	bl Proc_Break
.L0805842E:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_fe6_08058438
func_fe6_08058438: @ 0x08058438
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, .L08058460 @ =gUnk_085D39F4
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	bl SetActiveCRSpellBgColorProc
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	str r0, [r4, #0x44]
	ldr r0, .L08058464 @ =gUnk_0811AF5C
	str r0, [r4, #0x48]
	ldr r0, .L08058468 @ =Pal_EfxThunderBGCOL
	str r0, [r4, #0x4c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08058460: .4byte gUnk_085D39F4
.L08058464: .4byte gUnk_0811AF5C
.L08058468: .4byte Pal_EfxThunderBGCOL

	thumb_func_start func_fe6_0805846C
func_fe6_0805846C: @ 0x0805846C
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl EfxAdvanceFrameLut
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	cmp r2, #0
	blt .L08058492
	ldr r1, [r4, #0x4c]
	ldr r0, [r4, #0x5c]
	lsls r2, r2, #5
	adds r1, r1, r2
	bl func_fe6_080580D8
	b .L080584A4
.L08058492:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r2, r0
	bne .L080584A4
	bl EndActiveClassReelBgColorProc
	adds r0, r4, #0
	bl Proc_Break
.L080584A4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_fe6_080584AC
func_fe6_080584AC: @ 0x080584AC
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	bl func_fe6_08057F58
	adds r7, r0, #0
	ldr r0, .L080584E8 @ =gUnk_085D3A14
	movs r1, #3
	bl SpawnProc
	adds r6, r0, #0
	str r5, [r6, #0x5c]
	movs r0, #0
	strh r0, [r6, #0x2c]
	ldr r2, .L080584EC @ =AnimScr_EfxThunderOBJ_L
	ldr r3, .L080584F0 @ =AnimScr_EfxThunderOBJ_R
	adds r0, r5, #0
	movs r1, #1
	bl func_fe6_08057FE8
	adds r4, r0, #0
	str r4, [r6, #0x60]
	adds r0, r5, #0
	bl GetAnimPosition
	cmp r0, #0
	bne .L080584F4
	ldrh r0, [r5, #2]
	adds r0, #0x38
	b .L080584F8
	.align 2, 0
.L080584E8: .4byte gUnk_085D3A14
.L080584EC: .4byte AnimScr_EfxThunderOBJ_L
.L080584F0: .4byte AnimScr_EfxThunderOBJ_R
.L080584F4:
	ldrh r0, [r5, #2]
	subs r0, #0x38
.L080584F8:
	strh r0, [r4, #2]
	ldrh r1, [r4, #2]
	ldrh r2, [r7, #6]
	adds r0, r1, r2
	strh r0, [r4, #2]
	ldrh r1, [r4, #4]
	ldrh r7, [r7, #8]
	adds r0, r1, r7
	strh r0, [r4, #4]
	ldr r0, [r6, #0x5c]
	ldr r1, .L08058520 @ =Pal_EfxThunderOBJ
	bl func_fe6_08058130
	ldr r0, [r6, #0x5c]
	ldr r1, .L08058524 @ =Img_EfxThunderOBJ
	bl func_fe6_08058100
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08058520: .4byte Pal_EfxThunderOBJ
.L08058524: .4byte Img_EfxThunderOBJ

	thumb_func_start func_fe6_08058528
func_fe6_08058528: @ 0x08058528
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x32
	ble .L08058546
	ldr r0, [r4, #0x60]
	bl BasRemove
	adds r0, r4, #0
	bl Proc_Break
.L08058546:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start func_fe6_0805854C
func_fe6_0805854C: @ 0x0805854C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, .L08058564 @ =gUnk_085D3A2C
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08058564: .4byte gUnk_085D3A2C

	thumb_func_start func_fe6_08058568
func_fe6_08058568: @ 0x08058568
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	adds r1, r4, #0
	bl func_fe6_080587C0
	ldr r0, [r4, #0x5c]
	adds r1, r4, #0
	bl func_fe6_080585DC
	ldr r0, [r4, #0x5c]
	adds r1, r4, #0
	bl func_fe6_0805867C
	ldr r3, .L080585D8 @ =gDispIo
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x44
	movs r1, #0
	strb r1, [r0]
	adds r2, #9
	movs r0, #0x10
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x46
	strb r1, [r0]
	ldr r0, [r4, #0x5c]
	str r4, [sp]
	movs r1, #1
	movs r2, #0xc
	movs r3, #0
	bl func_fe6_080586F0
	ldr r0, [r4, #0x5c]
	str r4, [sp]
	movs r1, #0x23
	movs r2, #0x19
	movs r3, #1
	bl func_fe6_080586F0
	adds r0, r4, #0
	bl Proc_Break
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L080585D8: .4byte gDispIo

	thumb_func_start func_fe6_080585DC
func_fe6_080585DC: @ 0x080585DC
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	bl func_fe6_08057F58
	adds r6, r0, #0
	ldr r0, .L08058620 @ =gUnk_085D3A54
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	bl SetActiveClassReelSpell
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	str r0, [r4, #0x44]
	ldr r0, .L08058624 @ =gUnk_0811AF9E
	str r0, [r4, #0x48]
	ldr r0, .L08058628 @ =gUnk_085D3A6C
	str r0, [r4, #0x4c]
	ldr r1, .L0805862C @ =gUnk_081AB1B0
	adds r0, r5, #0
	bl func_fe6_080580A8
	ldr r0, [r6, #0x24]
	bl _call_via_r0
	ldr r0, [r4, #0x5c]
	adds r1, r6, #0
	bl func_fe6_08057F60
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08058620: .4byte gUnk_085D3A54
.L08058624: .4byte gUnk_0811AF9E
.L08058628: .4byte gUnk_085D3A6C
.L0805862C: .4byte gUnk_081AB1B0

	thumb_func_start func_fe6_08058630
func_fe6_08058630: @ 0x08058630
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl EfxAdvanceFrameLut
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0
	blt .L0805865C
	ldr r2, [r4, #0x4c]
	ldr r0, [r4, #0x5c]
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r2, [r1]
	movs r1, #1
	movs r3, #0
	bl func_fe6_0805803C
	b .L08058674
.L0805865C:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne .L08058674
	ldr r0, [r4, #0x5c]
	bl func_fe6_08057FB8
	bl SpellFx_ClearColorEffects
	adds r0, r4, #0
	bl Proc_Break
.L08058674:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_fe6_0805867C
func_fe6_0805867C: @ 0x0805867C
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, .L080586A4 @ =gUnk_085D3A70
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	bl SetActiveCRSpellBgColorProc
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	str r0, [r4, #0x44]
	ldr r0, .L080586A8 @ =gUnk_0811AFA4
	str r0, [r4, #0x48]
	ldr r0, .L080586AC @ =gUnk_081ABCA0
	str r0, [r4, #0x4c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L080586A4: .4byte gUnk_085D3A70
.L080586A8: .4byte gUnk_0811AFA4
.L080586AC: .4byte gUnk_081ABCA0

	thumb_func_start func_fe6_080586B0
func_fe6_080586B0: @ 0x080586B0
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl EfxAdvanceFrameLut
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	cmp r2, #0
	blt .L080586D6
	ldr r1, [r4, #0x4c]
	ldr r0, [r4, #0x5c]
	lsls r2, r2, #5
	adds r1, r1, r2
	bl func_fe6_080580D8
	b .L080586E8
.L080586D6:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r2, r0
	bne .L080586E8
	bl EndActiveClassReelBgColorProc
	adds r0, r4, #0
	bl Proc_Break
.L080586E8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_fe6_080586F0
func_fe6_080586F0: @ 0x080586F0
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	mov r8, r3
	ldr r0, .L0805871C @ =gUnk_085D3A90
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	strh r5, [r0, #0x2c]
	strh r6, [r0, #0x2e]
	adds r0, #0x29
	mov r1, r8
	strb r1, [r0]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L0805871C: .4byte gUnk_085D3A90

	thumb_func_start func_fe6_08058720
func_fe6_08058720: @ 0x08058720
	push {lr}
	adds r1, r0, #0
	ldrh r0, [r1, #0x2c]
	subs r0, #1
	strh r0, [r1, #0x2c]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne .L08058736
	adds r0, r1, #0
	bl Proc_Break
.L08058736:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_fe6_0805873C
func_fe6_0805873C: @ 0x0805873C
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	movs r2, #0x2e
	ldrsh r0, [r4, r2]
	cmp r1, r0
	ble .L08058756
	adds r0, r4, #0
	bl Proc_Break
	b .L080587B4
.L08058756:
	adds r0, r4, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #0
	bne .L08058772
	movs r0, #0x2c
	ldrsh r3, [r4, r0]
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0x10
	b .L08058782
.L08058772:
	movs r2, #0x2c
	ldrsh r3, [r4, r2]
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #0x10
	movs r2, #0
.L08058782:
	bl Interpolate
	adds r5, r0, #0
	ldr r3, .L080587BC @ =gDispIo
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x44
	movs r1, #0
	strb r5, [r0]
	adds r2, #9
	movs r0, #0x10
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x46
	strb r1, [r0]
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
.L080587B4:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L080587BC: .4byte gDispIo

	thumb_func_start func_fe6_080587C0
func_fe6_080587C0: @ 0x080587C0
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	bl func_fe6_08057F58
	adds r6, r0, #0
	ldr r0, .L08058814 @ =gUnk_085D3AB0
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #0x33
	strh r0, [r4, #0x2e]
	ldr r3, .L08058818 @ =gUnk_085F0A14
	adds r0, r5, #0
	movs r1, #1
	adds r2, r3, #0
	bl func_fe6_08057FE8
	str r0, [r4, #0x60]
	ldrh r2, [r0, #2]
	ldrh r3, [r6, #6]
	adds r1, r2, r3
	strh r1, [r0, #2]
	ldrh r2, [r0, #4]
	ldrh r6, [r6, #8]
	adds r1, r2, r6
	strh r1, [r0, #4]
	ldr r0, [r4, #0x5c]
	ldr r1, .L0805881C @ =gUnk_081AC0F4
	bl func_fe6_08058130
	ldr r0, [r4, #0x5c]
	ldr r1, .L08058820 @ =gUnk_081ABEA0
	bl func_fe6_08058100
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08058814: .4byte gUnk_085D3AB0
.L08058818: .4byte gUnk_085F0A14
.L0805881C: .4byte gUnk_081AC0F4
.L08058820: .4byte gUnk_081ABEA0

	thumb_func_start func_fe6_08058824
func_fe6_08058824: @ 0x08058824
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r4, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	bne .L08058844
	ldr r0, [r4, #0x60]
	bl BasRemove
	adds r0, r4, #0
	bl Proc_Break
.L08058844:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
