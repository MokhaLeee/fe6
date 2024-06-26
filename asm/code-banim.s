
	.include "macro.inc"

	.syntax unified

	thumb_func_start NewEfxStatusUnit
NewEfxStatusUnit: @ 0x08046DA0
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	bl GetAnimPosition
	cmp r0, #0
	bne .L08046DB8
	ldr r0, .L08046DB4 @ =gpEkrBattleUnitLeft
	b .L08046DBA
	.align 2, 0
.L08046DB4: .4byte gpEkrBattleUnitLeft
.L08046DB8:
	ldr r0, .L08046E40 @ =gpEkrBattleUnitRight
.L08046DBA:
	ldr r6, [r0]
	ldr r0, .L08046E44 @ =gUnk_085CBA98
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	adds r0, #0x29
	movs r1, #0
	strb r1, [r0]
	str r5, [r4, #0x5c]
	strh r1, [r4, #0x2c]
	str r1, [r4, #0x44]
	ldr r0, .L08046E48 @ =gUnk_08112122
	str r0, [r4, #0x48]
	adds r0, r6, #0
	adds r0, #0x2e
	ldrb r0, [r0]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
	str r0, [r4, #0x4c]
	ldr r0, .L08046E4C @ =gEkrDebugModeMaybe
	ldrh r0, [r0]
	cmp r0, #1
	bne .L08046DEC
	str r1, [r4, #0x4c]
.L08046DEC:
	str r1, [r4, #0x50]
	strh r1, [r4, #0x36]
	strh r1, [r4, #0x34]
	strh r1, [r4, #0x32]
	adds r0, r5, #0
	bl GetAnimPosition
	ldr r1, .L08046E50 @ =gUnk_Banim_02017764
	lsls r0, r0, #2
	adds r0, r0, r1
	str r4, [r0]
	adds r0, r5, #0
	bl GetAnimPosition
	cmp r0, #0
	bne .L08046E5C
	ldr r5, .L08046E54 @ =gpEfxUnitPaletteBackup
	ldr r0, [r5]
	ldr r4, .L08046E58 @ =gFadeComponents
	adds r1, r4, #0
	movs r2, #0x10
	bl EfxSplitColor
	ldr r0, [r5]
	adds r5, r4, #0
	adds r5, #0x30
	adds r1, r5, #0
	movs r2, #0x10
	bl EfxSplitColorPetrify
	movs r0, #0xc0
	lsls r0, r0, #1
	adds r2, r4, r0
	movs r0, #0x10
	str r0, [sp]
	adds r0, r4, #0
	adds r1, r5, #0
	movs r3, #0x10
	bl func_fe6_0805B88C
	b .L08046E8C
	.align 2, 0
.L08046E40: .4byte gpEkrBattleUnitRight
.L08046E44: .4byte gUnk_085CBA98
.L08046E48: .4byte gUnk_08112122
.L08046E4C: .4byte gEkrDebugModeMaybe
.L08046E50: .4byte gUnk_Banim_02017764
.L08046E54: .4byte gpEfxUnitPaletteBackup
.L08046E58: .4byte gFadeComponents
.L08046E5C:
	ldr r5, .L08046E94 @ =gpEfxUnitPaletteBackup
	ldr r0, [r5, #4]
	ldr r4, .L08046E98 @ =gFadeComponents+0x60
	adds r1, r4, #0
	movs r2, #0x10
	bl EfxSplitColor
	ldr r0, [r5, #4]
	adds r5, r4, #0
	adds r5, #0x30
	adds r1, r5, #0
	movs r2, #0x10
	bl EfxSplitColorPetrify
	movs r0, #0xa8
	lsls r0, r0, #2
	adds r2, r4, r0
	movs r0, #0x10
	str r0, [sp]
	adds r0, r4, #0
	adds r1, r5, #0
	movs r3, #0x10
	bl func_fe6_0805B88C
.L08046E8C:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08046E94: .4byte gpEfxUnitPaletteBackup
.L08046E98: .4byte gFadeComponents+0x60

	thumb_func_start EndEfxStatusUnits
EndEfxStatusUnits: @ 0x08046E9C
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, .L08046ED4 @ =gUnk_Banim_02017764
	bl GetAnimPosition
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r0, [r0]
	cmp r0, #0
	beq .L08046ECE
	adds r0, r4, #0
	bl GetAnimPosition
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r0, [r0]
	bl Proc_End
	adds r0, r4, #0
	bl GetAnimPosition
	lsls r0, r0, #2
	adds r0, r0, r5
	movs r1, #0
	str r1, [r0]
.L08046ECE:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08046ED4: .4byte gUnk_Banim_02017764

	thumb_func_start DisableEfxStatusUnits
DisableEfxStatusUnits: @ 0x08046ED8
	push {r4, lr}
	ldr r4, .L08046EF4 @ =gUnk_Banim_02017764
	bl GetAnimPosition
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r0, [r0]
	adds r0, #0x29
	movs r1, #1
	strb r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08046EF4: .4byte gUnk_Banim_02017764

	thumb_func_start EnableEfxStatusUnits
EnableEfxStatusUnits: @ 0x08046EF8
	push {r4, lr}
	ldr r4, .L08046F14 @ =gUnk_Banim_02017764
	bl GetAnimPosition
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r0, [r0]
	adds r0, #0x29
	movs r1, #0
	strb r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08046F14: .4byte gUnk_Banim_02017764

	thumb_func_start SetUnitEfxDebuff
SetUnitEfxDebuff: @ 0x08046F18
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r5, r1, #0
	ldr r4, .L08046F44 @ =gUnk_Banim_02017764
	bl GetAnimPosition
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r0, [r0]
	str r5, [r0, #0x4c]
	cmp r5, #0
	bne .L08046F3C
	adds r0, r6, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl func_fe6_08046F64
.L08046F3C:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08046F44: .4byte gUnk_Banim_02017764

	thumb_func_start GetUnitEfxDebuff
GetUnitEfxDebuff: @ 0x08046F48
	push {r4, lr}
	ldr r4, .L08046F60 @ =gUnk_Banim_02017764
	bl GetAnimPosition
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r0, [r0]
	ldr r0, [r0, #0x4c]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
.L08046F60: .4byte gUnk_Banim_02017764

	thumb_func_start func_fe6_08046F64
func_fe6_08046F64: @ 0x08046F64
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	adds r4, r0, #0
	mov r8, r1
	adds r6, r2, #0
	adds r7, r3, #0
	bl GetEkrDragonStateType
	adds r5, r0, #0
	adds r0, r4, #0
	bl GetAnimPosition
	cmp r0, #0
	bne .L08046FE8
	ldr r0, .L08046FDC @ =gpEfxUnitPaletteBackup
	ldr r0, [r0]
	ldr r4, .L08046FE0 @ =gPal+0x2E0
	adds r1, r4, #0
	movs r2, #8
	bl CpuFastSet
	ldr r0, .L08046FE4 @ =0xFFFFFD20
	adds r4, r4, r0
	str r6, [sp]
	str r7, [sp, #4]
	adds r0, r4, #0
	movs r1, #0x17
	movs r2, #1
	mov r3, r8
	bl EfxPalFlashingInOut
	movs r0, #1
	ands r0, r5
	cmp r0, #0
	beq .L08046FB4
	movs r0, #0
	bl RestoreBodyFlashingPalForManakete
.L08046FB4:
	movs r0, #0x10
	ands r0, r5
	cmp r0, #0
	beq .L08046FC2
	movs r0, #0
	bl RestoreBodyFlashingPalForIdunn
.L08046FC2:
	movs r0, #0x11
	ands r0, r5
	cmp r0, #0
	beq .L0804703E
	str r6, [sp]
	str r7, [sp, #4]
	adds r0, r4, #0
	movs r1, #6
	movs r2, #1
	mov r3, r8
	bl EfxPalFlashingInOut
	b .L0804703E
	.align 2, 0
.L08046FDC: .4byte gpEfxUnitPaletteBackup
.L08046FE0: .4byte gPal+0x2E0
.L08046FE4: .4byte 0xFFFFFD20
.L08046FE8:
	ldr r0, .L0804704C @ =gpEfxUnitPaletteBackup
	ldr r0, [r0, #4]
	ldr r4, .L08047050 @ =gPal+0x320
	adds r1, r4, #0
	movs r2, #8
	bl CpuFastSet
	ldr r0, .L08047054 @ =0xFFFFFCE0
	adds r4, r4, r0
	str r6, [sp]
	str r7, [sp, #4]
	adds r0, r4, #0
	movs r1, #0x19
	movs r2, #1
	mov r3, r8
	bl EfxPalFlashingInOut
	movs r0, #2
	ands r0, r5
	cmp r0, #0
	beq .L08047018
	movs r0, #1
	bl RestoreBodyFlashingPalForManakete
.L08047018:
	movs r0, #0x20
	ands r0, r5
	cmp r0, #0
	beq .L08047026
	movs r0, #1
	bl RestoreBodyFlashingPalForIdunn
.L08047026:
	movs r0, #0x22
	ands r0, r5
	cmp r0, #0
	beq .L0804703E
	str r6, [sp]
	str r7, [sp, #4]
	adds r0, r4, #0
	movs r1, #7
	movs r2, #1
	mov r3, r8
	bl EfxPalFlashingInOut
.L0804703E:
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0804704C: .4byte gpEfxUnitPaletteBackup
.L08047050: .4byte gPal+0x320
.L08047054: .4byte 0xFFFFFCE0

	thumb_func_start func_fe6_08047058
func_fe6_08047058: @ 0x08047058
	push {r4, r5, r6, lr}
	sub sp, #0xc
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetUnitEfxDebuff
	cmp r0, #0
	beq .L0804714E
	adds r0, r4, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #1
	beq .L0804714E
	ldr r1, [r4, #0x4c]
	ldr r0, [r4, #0x50]
	cmp r1, r0
	beq .L08047082
	movs r0, #0
	strh r0, [r4, #0x2c]
	str r0, [r4, #0x44]
	str r1, [r4, #0x50]
.L08047082:
	adds r0, r4, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl EfxAdvanceFrameLut
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0
	blt .L080470D2
	ldr r0, [r4, #0x4c]
	cmp r0, #2
	beq .L080470BA
	cmp r0, #2
	bgt .L080470A8
	cmp r0, #1
	beq .L080470B2
	b .L080470CC
.L080470A8:
	cmp r0, #3
	beq .L080470CC
	cmp r0, #4
	beq .L080470C2
	b .L080470CC
.L080470B2:
	movs r0, #0
	strh r1, [r4, #0x32]
	strh r0, [r4, #0x34]
	b .L080470D0
.L080470BA:
	movs r0, #0
	strh r0, [r4, #0x32]
	strh r0, [r4, #0x34]
	b .L080470D0
.L080470C2:
	movs r0, #0
	strh r1, [r4, #0x32]
	strh r0, [r4, #0x34]
	strh r0, [r4, #0x36]
	b .L080470D2
.L080470CC:
	strh r1, [r4, #0x32]
	strh r1, [r4, #0x34]
.L080470D0:
	strh r1, [r4, #0x36]
.L080470D2:
	ldr r0, [r4, #0x4c]
	cmp r0, #3
	beq .L080470FA
	cmp r0, #3
	bgt .L080470E2
	cmp r0, #1
	blt .L0804714A
	b .L080470E6
.L080470E2:
	cmp r0, #4
	bne .L0804714A
.L080470E6:
	ldr r0, [r4, #0x5c]
	movs r2, #0x32
	ldrsh r1, [r4, r2]
	movs r3, #0x34
	ldrsh r2, [r4, r3]
	movs r5, #0x36
	ldrsh r3, [r4, r5]
	bl func_fe6_08046F64
	b .L0804714A
.L080470FA:
	ldr r0, [r4, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne .L0804712C
	ldr r0, .L08047124 @ =gPal+0x2E0
	ldr r1, .L08047128 @ =gFadeComponents
	adds r2, r1, #0
	adds r2, #0x30
	movs r6, #0xc0
	lsls r6, r6, #1
	adds r3, r1, r6
	movs r5, #0x10
	str r5, [sp]
	movs r6, #0x32
	ldrsh r4, [r4, r6]
	str r4, [sp, #4]
	str r5, [sp, #8]
	bl EfxDecodeSplitedPalette
	b .L0804714A
	.align 2, 0
.L08047124: .4byte gPal+0x2E0
.L08047128: .4byte gFadeComponents
.L0804712C:
	ldr r0, .L08047158 @ =gPal+0x320
	ldr r1, .L0804715C @ =gFadeComponents+0x60
	adds r2, r1, #0
	adds r2, #0x30
	movs r5, #0xa8
	lsls r5, r5, #2
	adds r3, r1, r5
	movs r5, #0x10
	str r5, [sp]
	movs r6, #0x32
	ldrsh r4, [r4, r6]
	str r4, [sp, #4]
	str r5, [sp, #8]
	bl EfxDecodeSplitedPalette
.L0804714A:
	bl EnablePalSync
.L0804714E:
	add sp, #0xc
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08047158: .4byte gPal+0x320
.L0804715C: .4byte gFadeComponents+0x60

	thumb_func_start func_fe6_08047160
func_fe6_08047160: @ 0x08047160
	push {r4, r5, lr}
	adds r4, r0, #0
	bl GetEkrDragonStateType
	adds r5, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne .L080471A8
	ldr r0, .L080471A0 @ =gpEfxUnitPaletteBackup
	ldr r0, [r0]
	ldr r1, .L080471A4 @ =gPal+0x2E0
	movs r2, #8
	bl CpuFastSet
	movs r0, #1
	ands r0, r5
	cmp r0, #0
	beq .L0804718E
	movs r0, #0
	bl RestoreBodyFlashingPalForManakete
.L0804718E:
	movs r0, #0x10
	ands r0, r5
	cmp r0, #0
	beq .L080471D0
	movs r0, #0
	bl RestoreBodyFlashingPalForIdunn
	b .L080471D0
	.align 2, 0
.L080471A0: .4byte gpEfxUnitPaletteBackup
.L080471A4: .4byte gPal+0x2E0
.L080471A8:
	ldr r0, .L080471DC @ =gpEfxUnitPaletteBackup
	ldr r0, [r0, #4]
	ldr r1, .L080471E0 @ =gPal+0x320
	movs r2, #8
	bl CpuFastSet
	movs r0, #2
	ands r0, r5
	cmp r0, #0
	beq .L080471C2
	movs r0, #1
	bl RestoreBodyFlashingPalForManakete
.L080471C2:
	movs r0, #0x20
	ands r0, r5
	cmp r0, #0
	beq .L080471D0
	movs r0, #1
	bl RestoreBodyFlashingPalForIdunn
.L080471D0:
	bl EnablePalSync
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L080471DC: .4byte gpEfxUnitPaletteBackup
.L080471E0: .4byte gPal+0x320

	thumb_func_start NewEfxWeaponIcon
NewEfxWeaponIcon: @ 0x080471E4
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	ldr r0, .L08047220 @ =gUnk_085CBAC0
	movs r1, #3
	bl SpawnProc
	movs r2, #0
	strh r2, [r0, #0x2c]
	str r2, [r0, #0x44]
	ldr r1, .L08047224 @ =gUnk_08112144
	str r1, [r0, #0x48]
	str r2, [r0, #0x4c]
	str r2, [r0, #0x50]
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	str r4, [r0, #0x54]
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	str r5, [r0, #0x58]
	ldr r1, .L08047228 @ =gUnk_Banim_0201776C
	str r0, [r1]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08047220: .4byte gUnk_085CBAC0
.L08047224: .4byte gUnk_08112144
.L08047228: .4byte gUnk_Banim_0201776C

	thumb_func_start EndProcEfxWeaponIcon
EndProcEfxWeaponIcon: @ 0x0804722C
	push {r4, lr}
	ldr r4, .L08047244 @ =gUnk_Banim_0201776C
	ldr r0, [r4]
	cmp r0, #0
	beq .L0804723E
	bl Proc_End
	movs r0, #0
	str r0, [r4]
.L0804723E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08047244: .4byte gUnk_Banim_0201776C

	thumb_func_start func_fe6_08047248
func_fe6_08047248: @ 0x08047248
	ldr r0, .L08047254 @ =gUnk_Banim_0201776C
	ldr r1, [r0]
	movs r0, #1
	str r0, [r1, #0x50]
	bx lr
	.align 2, 0
.L08047254: .4byte gUnk_Banim_0201776C

	thumb_func_start func_fe6_08047258
func_fe6_08047258: @ 0x08047258
	ldr r0, .L08047264 @ =gUnk_Banim_0201776C
	ldr r1, [r0]
	movs r0, #0
	str r0, [r1, #0x50]
	bx lr
	.align 2, 0
.L08047264: .4byte gUnk_Banim_0201776C

	thumb_func_start func_fe6_08047268
func_fe6_08047268: @ 0x08047268
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x50]
	cmp r0, #1
	beq .L080472C6
	bl InitIcons
	adds r0, r4, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl EfxAdvanceFrameLut
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0
	blt .L0804728E
	str r0, [r4, #0x4c]
.L0804728E:
	ldr r0, [r4, #0x54]
	cmp r0, #0
	beq .L080472A8
	movs r0, #0
	movs r1, #0x1d
	bl ApplyIconPalette
	ldr r0, .L080472CC @ =gPal
	ldr r3, [r4, #0x4c]
	movs r1, #0x1d
	movs r2, #1
	bl EfxPalWhiteInOut
.L080472A8:
	ldr r0, [r4, #0x58]
	cmp r0, #0
	beq .L080472C2
	movs r0, #0
	movs r1, #0x1e
	bl ApplyIconPalette
	ldr r0, .L080472CC @ =gPal
	ldr r3, [r4, #0x4c]
	movs r1, #0x1e
	movs r2, #1
	bl EfxPalWhiteInOut
.L080472C2:
	bl EnablePalSync
.L080472C6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L080472CC: .4byte gPal

	thumb_func_start func_fe6_080472D0
func_fe6_080472D0: @ 0x080472D0
	push {r4, lr}
	adds r4, r0, #0
	bl InitIcons
	ldr r0, [r4, #0x54]
	cmp r0, #0
	beq .L080472E6
	movs r0, #0
	movs r1, #0x1d
	bl ApplyIconPalette
.L080472E6:
	ldr r0, [r4, #0x58]
	cmp r0, #0
	beq .L080472F4
	movs r0, #0
	movs r1, #0x1e
	bl ApplyIconPalette
.L080472F4:
	bl EnablePalSync
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_fe6_08047300
func_fe6_08047300: @ 0x08047300
	push {r4, r5, lr}
	bl GetEkrDragonStateType
	adds r4, r0, #0
	cmp r4, #0
	bne .L0804734C
	ldr r0, .L08047334 @ =gUnk_085CBAE8
	movs r1, #4
	bl SpawnProc
	adds r5, r0, #0
	adds r0, #0x29
	strb r4, [r0]
	strh r4, [r5, #0x2c]
	movs r0, #4
	strh r0, [r5, #0x2e]
	ldr r0, .L08047338 @ =gUnk_Banim_02017770
	ldr r0, [r0]
	cmp r0, #0
	bne .L08047344
	ldr r0, .L0804733C @ =gPal+0xC0
	ldr r1, .L08047340 @ =gPal_Banim
	movs r2, #0x50
	bl CpuFastSet
	b .L08047348
	.align 2, 0
.L08047334: .4byte gUnk_085CBAE8
.L08047338: .4byte gUnk_Banim_02017770
.L0804733C: .4byte gPal+0xC0
.L08047340: .4byte gPal_Banim
.L08047344:
	bl Proc_End
.L08047348:
	ldr r0, .L08047354 @ =gUnk_Banim_02017770
	str r5, [r0]
.L0804734C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08047354: .4byte gUnk_Banim_02017770

	thumb_func_start func_fe6_08047358
func_fe6_08047358: @ 0x08047358
	ldr r0, .L0804736C @ =gUnk_Banim_02017770
	ldr r0, [r0]
	cmp r0, #0
	beq .L08047368
	adds r1, r0, #0
	adds r1, #0x29
	movs r0, #1
	strb r0, [r1]
.L08047368:
	bx lr
	.align 2, 0
.L0804736C: .4byte gUnk_Banim_02017770

	thumb_func_start func_fe6_08047370
func_fe6_08047370: @ 0x08047370
	push {lr}
	ldr r1, .L08047388 @ =gUnk_Banim_02017770
	ldr r0, [r1]
	cmp r0, #0
	beq .L08047382
	movs r0, #0
	str r0, [r1]
	bl Proc_End
.L08047382:
	pop {r0}
	bx r0
	.align 2, 0
.L08047388: .4byte gUnk_Banim_02017770

	thumb_func_start func_fe6_0804738C
func_fe6_0804738C: @ 0x0804738C
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	movs r0, #0x2c
	ldrsh r3, [r6, r0]
	movs r1, #0x2e
	ldrsh r0, [r6, r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #8
	bl Interpolate
	adds r5, r0, #0
	ldr r0, .L080473E8 @ =gPal_Banim
	ldr r4, .L080473EC @ =gPal+0xC0
	adds r1, r4, #0
	movs r2, #0x50
	bl CpuFastSet
	subs r4, #0xc0
	adds r0, r4, #0
	movs r1, #6
	movs r2, #0xa
	adds r3, r5, #0
	bl EfxPalBlackInOut
	bl EnablePalSync
	ldrh r1, [r6, #0x2c]
	adds r1, #1
	strh r1, [r6, #0x2c]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r2, #0x2e
	ldrsh r0, [r6, r2]
	adds r0, #1
	cmp r1, r0
	bne .L080473E0
	adds r0, r6, #0
	bl Proc_Break
.L080473E0:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L080473E8: .4byte gPal_Banim
.L080473EC: .4byte gPal+0xC0

	thumb_func_start func_fe6_080473F0
func_fe6_080473F0: @ 0x080473F0
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, .L08047428 @ =gPal_Banim
	ldr r4, .L0804742C @ =gPal+0xC0
	adds r1, r4, #0
	movs r2, #0x50
	bl CpuFastSet
	subs r4, #0xc0
	adds r0, r4, #0
	movs r1, #6
	movs r2, #0xa
	movs r3, #8
	bl EfxPalBlackInOut
	adds r0, r5, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #1
	bne .L08047422
	movs r0, #0
	strh r0, [r5, #0x2c]
	adds r0, r5, #0
	bl Proc_Break
.L08047422:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08047428: .4byte gPal_Banim
.L0804742C: .4byte gPal+0xC0

	thumb_func_start func_fe6_08047430
func_fe6_08047430: @ 0x08047430
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r5, r0, #0
	movs r0, #0x2c
	ldrsh r3, [r5, r0]
	movs r1, #0x2e
	ldrsh r0, [r5, r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #8
	movs r2, #0
	bl Interpolate
	adds r4, r0, #0
	ldr r7, .L080474A4 @ =gPal_Banim
	ldr r6, .L080474A8 @ =gPal+0xC0
	adds r0, r7, #0
	adds r1, r6, #0
	movs r2, #0x50
	bl CpuFastSet
	adds r0, r6, #0
	subs r0, #0xc0
	movs r1, #6
	movs r2, #0xa
	adds r3, r4, #0
	bl EfxPalBlackInOut
	bl EnablePalSync
	ldrh r1, [r5, #0x2c]
	adds r1, #1
	strh r1, [r5, #0x2c]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r2, #0x2e
	ldrsh r0, [r5, r2]
	adds r0, #1
	cmp r1, r0
	bne .L0804749A
	ldr r1, .L080474AC @ =gUnk_Banim_02017770
	movs r0, #0
	str r0, [r1]
	adds r0, r7, #0
	adds r1, r6, #0
	movs r2, #0x50
	bl CpuFastSet
	bl EnablePalSync
	adds r0, r5, #0
	bl Proc_Break
.L0804749A:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L080474A4: .4byte gPal_Banim
.L080474A8: .4byte gPal+0xC0
.L080474AC: .4byte gUnk_Banim_02017770

	thumb_func_start SpellFx_Begin
SpellFx_Begin: @ 0x080474B0
	ldr r1, .L080474B8 @ =gEfxSpellAnimExists
	movs r0, #1
	str r0, [r1]
	bx lr
	.align 2, 0
.L080474B8: .4byte gEfxSpellAnimExists

	thumb_func_start SpellFx_Finish
SpellFx_Finish: @ 0x080474BC
	ldr r1, .L080474C4 @ =gEfxSpellAnimExists
	movs r0, #0
	str r0, [r1]
	bx lr
	.align 2, 0
.L080474C4: .4byte gEfxSpellAnimExists

	thumb_func_start SpellFx_SetBG1Position
SpellFx_SetBG1Position: @ 0x080474C8
	push {lr}
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	pop {r0}
	bx r0

	thumb_func_start SpellFx_ClearBG1
SpellFx_ClearBG1: @ 0x080474D8
	push {lr}
	sub sp, #4
	movs r0, #0
	str r0, [sp]
	ldr r1, .L080474F8 @ =gBg1Tm
	ldr r2, .L080474FC @ =0x01000200
	mov r0, sp
	bl CpuFastSet
	movs r0, #2
	bl EnableBgSync
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
.L080474F8: .4byte gBg1Tm
.L080474FC: .4byte 0x01000200

	thumb_func_start SpellFx_SetSomeColorEffect
SpellFx_SetSomeColorEffect: @ 0x08047500
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r0, .L080475CC @ =gDispIo
	mov ip, r0
	mov r2, ip
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	mov r1, ip
	adds r1, #0x44
	movs r2, #0
	movs r3, #0x10
	mov r8, r3
	movs r0, #0x10
	strb r0, [r1]
	adds r1, #1
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x46
	strb r2, [r0]
	ldr r0, .L080475D0 @ =0x0000FFE0
	mov r1, ip
	ldrh r1, [r1, #0x3c]
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	ldr r1, .L080475D4 @ =0x0000E0FF
	ands r0, r1
	movs r3, #0xe0
	lsls r3, r3, #5
	adds r1, r3, #0
	orrs r0, r1
	mov r1, ip
	strh r0, [r1, #0x3c]
	movs r5, #0x20
	ldrb r0, [r1, #1]
	orrs r0, r5
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	mov r3, ip
	strb r0, [r3, #1]
	mov r0, ip
	adds r0, #0x2d
	strb r2, [r0]
	adds r0, #4
	strb r2, [r0]
	mov r1, ip
	adds r1, #0x2c
	movs r0, #0xf0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0xa0
	strb r0, [r1]
	mov r6, ip
	adds r6, #0x34
	movs r0, #1
	ldrb r1, [r6]
	orrs r1, r0
	movs r2, #2
	orrs r1, r2
	movs r4, #4
	orrs r1, r4
	movs r3, #8
	orrs r1, r3
	mov r2, r8
	orrs r1, r2
	mov r7, ip
	adds r7, #0x36
	ldrb r2, [r7]
	orrs r0, r2
	movs r2, #3
	rsbs r2, r2, #0
	ands r0, r2
	orrs r0, r4
	orrs r0, r3
	mov r3, r8
	orrs r0, r3
	orrs r1, r5
	strb r1, [r6]
	movs r1, #0x21
	rsbs r1, r1, #0
	ands r0, r1
	strb r0, [r7]
	mov r0, ip
	adds r0, #0x3d
	ldrb r1, [r0]
	orrs r5, r1
	strb r5, [r0]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L080475CC: .4byte gDispIo
.L080475D0: .4byte 0x0000FFE0
.L080475D4: .4byte 0x0000E0FF

	thumb_func_start SpellFx_ClearColorEffects
SpellFx_ClearColorEffects: @ 0x080475D8
	ldr r3, .L080475FC @ =gDispIo
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
	bx lr
	.align 2, 0
.L080475FC: .4byte gDispIo

	thumb_func_start StartBattleAnimHitEffectsDefault
StartBattleAnimHitEffectsDefault: @ 0x08047600
	push {lr}
	movs r2, #3
	movs r3, #4
	bl StartBattleAnimHitEffects
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_fe6_08047610
func_fe6_08047610: @ 0x08047610
	push {lr}
	movs r2, #5
	movs r3, #5
	bl StartBattleAnimHitEffects
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start StartBattleAnimHitEffects
StartBattleAnimHitEffects: @ 0x08047620
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r4, r1, #0
	str r2, [sp]
	mov sl, r3
	bl GetAnimPosition
	cmp r0, #0
	bne .L0804764C
	ldr r0, .L08047648 @ =gAnims
	ldr r7, [r0, #8]
	ldr r1, [r0, #0xc]
	mov sb, r1
	ldr r5, [r0]
	ldr r0, [r0, #4]
	b .L08047658
	.align 2, 0
.L08047648: .4byte gAnims
.L0804764C:
	ldr r0, .L08047668 @ =gAnims
	ldr r7, [r0]
	ldr r1, [r0, #4]
	mov sb, r1
	ldr r5, [r0, #8]
	ldr r0, [r0, #0xc]
.L08047658:
	mov r8, r0
	cmp r4, #0
	beq .L0804766C
	cmp r4, #1
	bne .L08047664
	b .L08047796
.L08047664:
	b .L0804779C
	.align 2, 0
.L08047668: .4byte gAnims
.L0804766C:
	adds r0, r7, #0
	bl GetAnimPosition
	adds r1, r0, #0
	ldrh r0, [r7, #0xe]
	subs r0, #1
	lsls r0, r0, #1
	adds r0, r0, r1
	bl GetBattleAnimRoundTypeFlags
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	adds r0, r5, #0
	bl GetAnimPosition
	adds r1, r0, #0
	ldrh r0, [r5, #0xe]
	subs r0, #1
	lsls r0, r0, #1
	adds r0, r0, r1
	bl GetBattleAnimRoundTypeFlags
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	lsls r0, r6, #0x10
	asrs r0, r0, #0x10
	movs r1, #0x80
	lsls r1, r1, #6
	ands r0, r1
	cmp r0, #0
	beq .L080476BC
	adds r0, r7, #0
	bl GetUnitEfxDebuff
	cmp r0, #0
	bne .L080476BC
	adds r0, r7, #0
	movs r1, #1
	bl SetUnitEfxDebuff
.L080476BC:
	lsls r0, r4, #0x10
	asrs r1, r0, #0x10
	movs r2, #0x80
	lsls r2, r2, #6
	ands r1, r2
	adds r4, r0, #0
	cmp r1, #0
	beq .L080476DE
	adds r0, r5, #0
	bl GetUnitEfxDebuff
	cmp r0, #0
	bne .L080476DE
	adds r0, r5, #0
	movs r1, #1
	bl SetUnitEfxDebuff
.L080476DE:
	lsls r0, r6, #0x10
	asrs r0, r0, #0x10
	movs r1, #0x80
	lsls r1, r1, #8
	ands r0, r1
	cmp r0, #0
	bne .L080476F4
	asrs r0, r4, #0x10
	ands r0, r1
	cmp r0, #0
	beq .L080476FC
.L080476F4:
	adds r0, r5, #0
	adds r5, r7, #0
	adds r7, r0, #0
	mov r8, sb
.L080476FC:
	ldr r4, .L08047764 @ =0x0203CD46
	adds r0, r5, #0
	bl GetAnimPosition
	lsls r0, r0, #1
	adds r0, r0, r4
	movs r1, #0
	ldrsh r6, [r0, r1]
	adds r0, r5, #0
	bl GetAnimPosition
	lsls r0, r0, #1
	adds r0, r0, r4
	movs r1, #0
	ldrsh r4, [r0, r1]
	adds r4, #1
	adds r0, r5, #0
	bl GetAnimPosition
	adds r1, r0, #0
	lsls r0, r6, #1
	adds r0, r0, r1
	bl GetEfxHp
	lsls r0, r0, #0x10
	asrs r6, r0, #0x10
	adds r0, r5, #0
	bl GetAnimPosition
	adds r1, r0, #0
	lsls r0, r4, #1
	adds r0, r0, r1
	bl GetEfxHp
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	cmp r6, r4
	beq .L0804778A
	adds r0, r5, #0
	bl NewEfxHPBar
	adds r0, r7, #0
	bl CheckRoundCrit
	cmp r0, #1
	bne .L08047768
	adds r0, r5, #0
	adds r1, r7, #0
	mov r2, sl
	bl NewEfxHitQuake
	b .L08047772
	.align 2, 0
.L08047764: .4byte 0x0203CD46
.L08047768:
	adds r0, r5, #0
	adds r1, r7, #0
	ldr r2, [sp]
	bl NewEfxHitQuake
.L08047772:
	adds r0, r5, #0
	movs r1, #0
	movs r2, #5
	bl NewEfxFlashHPBar
	adds r0, r5, #0
	movs r1, #0
	movs r2, #8
	movs r3, #0
	bl NewEfxFlashUnit
	b .L0804779C
.L0804778A:
	adds r0, r5, #0
	mov r1, r8
	movs r2, #0
	bl NewEfxNoDmage
	b .L0804779C
.L08047796:
	adds r0, r5, #0
	bl NewEfxAvoid
.L0804779C:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start StartBattleAnimResireHitEffects
StartBattleAnimResireHitEffects: @ 0x080477AC
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	mov sb, r1
	bl GetAnimPosition
	cmp r0, #0
	bne .L080477CC
	ldr r0, .L080477C8 @ =gAnims
	ldr r7, [r0, #8]
	ldr r5, [r0]
	ldr r0, [r0, #4]
	b .L080477D4
	.align 2, 0
.L080477C8: .4byte gAnims
.L080477CC:
	ldr r0, .L0804782C @ =gAnims
	ldr r7, [r0]
	ldr r5, [r0, #8]
	ldr r0, [r0, #0xc]
.L080477D4:
	mov r8, r0
	ldr r4, .L08047830 @ =0x0203CD46
	adds r0, r5, #0
	bl GetAnimPosition
	lsls r0, r0, #1
	adds r0, r0, r4
	movs r1, #0
	ldrsh r6, [r0, r1]
	adds r0, r5, #0
	bl GetAnimPosition
	lsls r0, r0, #1
	adds r0, r0, r4
	movs r1, #0
	ldrsh r4, [r0, r1]
	adds r4, #1
	adds r0, r5, #0
	bl GetAnimPosition
	adds r1, r0, #0
	lsls r0, r6, #1
	adds r0, r0, r1
	bl GetEfxHp
	lsls r0, r0, #0x10
	asrs r6, r0, #0x10
	adds r0, r5, #0
	bl GetAnimPosition
	adds r1, r0, #0
	lsls r0, r4, #1
	adds r0, r0, r1
	bl GetEfxHp
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	mov r0, sb
	cmp r0, #0
	beq .L08047834
	cmp r0, #1
	beq .L0804788C
	b .L08047892
	.align 2, 0
.L0804782C: .4byte gAnims
.L08047830: .4byte 0x0203CD46
.L08047834:
	cmp r6, r4
	beq .L08047876
	adds r0, r5, #0
	bl func_fe6_08044D4C
	adds r0, r7, #0
	bl CheckRoundCrit
	cmp r0, #1
	bne .L08047854
	adds r0, r5, #0
	adds r1, r7, #0
	movs r2, #4
	bl NewEfxHitQuake
	b .L0804785E
.L08047854:
	adds r0, r5, #0
	adds r1, r7, #0
	movs r2, #3
	bl NewEfxHitQuake
.L0804785E:
	adds r0, r5, #0
	movs r1, #0
	movs r2, #5
	bl NewEfxFlashHPBar
	adds r0, r5, #0
	movs r1, #0
	movs r2, #8
	movs r3, #0
	bl NewEfxFlashUnit
	b .L08047892
.L08047876:
	ldr r1, .L08047888 @ =gUnk_Banim_02017748
	movs r0, #2
	str r0, [r1]
	adds r0, r5, #0
	mov r1, r8
	movs r2, #1
	bl NewEfxNoDmage
	b .L08047892
	.align 2, 0
.L08047888: .4byte gUnk_Banim_02017748
.L0804788C:
	adds r0, r5, #0
	bl NewEfxAvoid
.L08047892:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start StartBattleAnimStatusChgHitEffects
StartBattleAnimStatusChgHitEffects: @ 0x080478A0
	push {r4, lr}
	adds r4, r1, #0
	bl GetAnimPosition
	cmp r0, #0
	bne .L080478B8
	ldr r0, .L080478B4 @ =gAnims
	ldr r0, [r0]
	b .L080478BC
	.align 2, 0
.L080478B4: .4byte gAnims
.L080478B8:
	ldr r0, .L080478C8 @ =gAnims
	ldr r0, [r0, #8]
.L080478BC:
	cmp r4, #0
	beq .L080478CC
	cmp r4, #1
	beq .L080478D2
	b .L080478D6
	.align 2, 0
.L080478C8: .4byte gAnims
.L080478CC:
	bl NewEfxStatusCHG
	b .L080478D6
.L080478D2:
	bl NewEfxAvoid
.L080478D6:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start EfxCreateFrontAnim
EfxCreateFrontAnim: @ 0x080478DC
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r7, r1, #0
	adds r6, r2, #0
	adds r5, r3, #0
	ldr r0, .L08047900 @ =gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne .L08047908
	adds r0, r4, #0
	bl GetAnimPosition
	cmp r0, #0
	bne .L08047904
	adds r0, r7, #0
	b .L08047918
	.align 2, 0
.L08047900: .4byte gEkrDistanceType
.L08047904:
	adds r0, r6, #0
	b .L08047918
.L08047908:
	adds r0, r4, #0
	bl GetAnimPosition
	cmp r0, #0
	bne .L08047916
	adds r0, r5, #0
	b .L08047918
.L08047916:
	ldr r0, [sp, #0x14]
.L08047918:
	movs r1, #0x78
	bl BasCreate
	adds r1, r0, #0
	movs r0, #0xa1
	lsls r0, r0, #6
	strh r0, [r1, #8]
	ldrh r0, [r4, #2]
	strh r0, [r1, #2]
	ldrh r0, [r4, #4]
	strh r0, [r1, #4]
	adds r0, r1, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start EfxCreateBackAnim
EfxCreateBackAnim: @ 0x08047938
	push {r4, lr}
	sub sp, #8
	adds r3, r0, #0
	ldr r0, .L0804796C @ =gEkrDistanceType
	movs r4, #0
	ldrsh r0, [r0, r4]
	adds r4, r2, #0
	cmp r0, #0
	bne .L0804794C
	adds r4, r1, #0
.L0804794C:
	adds r0, r3, #0
	bl GetAnimPosition
	cmp r0, #0
	bne .L08047974
	ldr r1, .L08047970 @ =gBg1Tm
	movs r0, #1
	str r0, [sp]
	adds r0, #0xff
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r2, #0x1e
	movs r3, #0x14
	bl EfxTmCpyBgHFlip
	b .L08047988
	.align 2, 0
.L0804796C: .4byte gEkrDistanceType
.L08047970: .4byte gBg1Tm
.L08047974:
	ldr r1, .L08047998 @ =gBg1Tm
	movs r0, #1
	str r0, [sp]
	adds r0, #0xff
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r2, #0x1e
	movs r3, #0x14
	bl EfxTmCpyBG
.L08047988:
	movs r0, #2
	bl EnableBgSync
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08047998: .4byte gBg1Tm

	thumb_func_start SpellFx_WriteBgMap
SpellFx_WriteBgMap: @ 0x0804799C
	push {r4, r5, lr}
	sub sp, #8
	adds r4, r0, #0
	adds r3, r1, #0
	ldr r0, .L080479B8 @ =gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne .L080479C0
	ldr r1, .L080479BC @ =gEkrTsaBuffer
	adds r0, r3, #0
	bl LZ77UnCompWram
	b .L080479C8
	.align 2, 0
.L080479B8: .4byte gEkrDistanceType
.L080479BC: .4byte gEkrTsaBuffer
.L080479C0:
	ldr r1, .L080479EC @ =gEkrTsaBuffer
	adds r0, r2, #0
	bl LZ77UnCompWram
.L080479C8:
	ldr r5, .L080479EC @ =gEkrTsaBuffer
	adds r0, r4, #0
	bl GetAnimPosition
	cmp r0, #0
	bne .L080479F4
	ldr r1, .L080479F0 @ =gBg1Tm
	movs r0, #1
	str r0, [sp]
	adds r0, #0xff
	str r0, [sp, #4]
	adds r0, r5, #0
	movs r2, #0x1e
	movs r3, #0x14
	bl EfxTmCpyBgHFlip
	b .L08047A08
	.align 2, 0
.L080479EC: .4byte gEkrTsaBuffer
.L080479F0: .4byte gBg1Tm
.L080479F4:
	ldr r1, .L08047A18 @ =gBg1Tm
	movs r0, #1
	str r0, [sp]
	adds r0, #0xff
	str r0, [sp, #4]
	adds r0, r5, #0
	movs r2, #0x1e
	movs r3, #0x14
	bl EfxTmCpyBG
.L08047A08:
	movs r0, #2
	bl EnableBgSync
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08047A18: .4byte gBg1Tm

	thumb_func_start SpellFx_WriteBgMapExt
SpellFx_WriteBgMapExt: @ 0x08047A1C
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r4, r0, #0
	adds r0, r1, #0
	adds r5, r2, #0
	adds r6, r3, #0
	ldr r7, .L08047A54 @ =gEkrTsaBuffer
	adds r1, r7, #0
	bl LZ77UnCompWram
	adds r0, r4, #0
	bl GetAnimPosition
	cmp r0, #0
	bne .L08047A5C
	ldr r1, .L08047A58 @ =gBg1Tm
	lsls r2, r5, #0x10
	lsrs r2, r2, #0x10
	lsls r3, r6, #0x10
	lsrs r3, r3, #0x10
	movs r0, #1
	str r0, [sp]
	adds r0, #0xff
	str r0, [sp, #4]
	adds r0, r7, #0
	bl EfxTmCpyBgHFlip
	b .L08047A74
	.align 2, 0
.L08047A54: .4byte gEkrTsaBuffer
.L08047A58: .4byte gBg1Tm
.L08047A5C:
	ldr r1, .L08047A84 @ =gBg1Tm
	lsls r2, r5, #0x10
	lsrs r2, r2, #0x10
	lsls r3, r6, #0x10
	lsrs r3, r3, #0x10
	movs r0, #1
	str r0, [sp]
	adds r0, #0xff
	str r0, [sp, #4]
	adds r0, r7, #0
	bl EfxTmCpyBG
.L08047A74:
	movs r0, #2
	bl EnableBgSync
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08047A84: .4byte gBg1Tm

	thumb_func_start SpellFx_RegisterObjGfx
SpellFx_RegisterObjGfx: @ 0x08047A88
	push {r4, r5, r6, lr}
	adds r6, r1, #0
	ldr r5, .L08047AA8 @ =0x06010800
	ldr r4, .L08047AAC @ =gBuf_Banim
	adds r1, r4, #0
	bl LZ77UnCompWram
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r6, #0
	bl RegisterDataMove
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08047AA8: .4byte 0x06010800
.L08047AAC: .4byte gBuf_Banim

	thumb_func_start SpellFx_RegisterObjPal
SpellFx_RegisterObjPal: @ 0x08047AB0
	push {lr}
	adds r2, r1, #0
	ldr r1, .L08047AC8 @ =gPal+0x240
	lsls r2, r2, #9
	lsrs r2, r2, #0xb
	bl CpuFastSet
	bl EnablePalSync
	pop {r0}
	bx r0
	.align 2, 0
.L08047AC8: .4byte gPal+0x240

	thumb_func_start SpellFx_RegisterBgGfx
SpellFx_RegisterBgGfx: @ 0x08047ACC
	push {r4, r5, r6, lr}
	adds r6, r1, #0
	ldr r5, .L08047AEC @ =0x06002000
	ldr r4, .L08047AF0 @ =gSpellAnimBgfx
	adds r1, r4, #0
	bl LZ77UnCompWram
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r6, #0
	bl RegisterDataMove
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08047AEC: .4byte 0x06002000
.L08047AF0: .4byte gSpellAnimBgfx

	thumb_func_start SpellFx_RegisterBgPal
SpellFx_RegisterBgPal: @ 0x08047AF4
	push {lr}
	adds r2, r1, #0
	ldr r1, .L08047B0C @ =gPal+0x20
	lsls r2, r2, #9
	lsrs r2, r2, #0xb
	bl CpuFastSet
	bl EnablePalSync
	pop {r0}
	bx r0
	.align 2, 0
.L08047B0C: .4byte gPal+0x20

	thumb_func_start func_fe6_08047B10
func_fe6_08047B10: @ 0x08047B10
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r5, r3, #0
	ldr r4, [sp, #0x10]
	movs r3, #0
	cmp r3, r4
	bhs .L08047B36
.L08047B1E:
	cmp r2, r5
	blo .L08047B24
	movs r2, #0
.L08047B24:
	lsls r0, r2, #1
	adds r0, r0, r6
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, #2
	adds r3, #1
	adds r2, #1
	cmp r3, r4
	blo .L08047B1E
.L08047B36:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start func_fe6_08047B3C
func_fe6_08047B3C: @ 0x08047B3C
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r5, r3, #0
	ldr r4, [sp, #0x10]
	movs r3, #0
	cmp r3, r4
	bhs .L08047B62
.L08047B4A:
	cmp r2, r5
	blo .L08047B50
	movs r2, #0
.L08047B50:
	lsls r0, r2, #1
	adds r0, r0, r6
	ldrh r0, [r0]
	strh r0, [r1, #0x20]
	adds r1, #2
	adds r3, #1
	adds r2, #1
	cmp r3, r4
	blo .L08047B4A
.L08047B62:
	bl EnablePalSync
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start func_fe6_08047B6C
func_fe6_08047B6C: @ 0x08047B6C
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r5, r3, #0
	ldr r4, [sp, #0x10]
	movs r3, #0
	cmp r3, r4
	bhs .L08047B98
	movs r0, #0x90
	lsls r0, r0, #2
	adds r1, r1, r0
.L08047B80:
	cmp r2, r5
	blo .L08047B86
	movs r2, #0
.L08047B86:
	lsls r0, r2, #1
	adds r0, r0, r6
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, #2
	adds r3, #1
	adds r2, #1
	cmp r3, r4
	blo .L08047B80
.L08047B98:
	bl EnablePalSync
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start EfxAdvanceFrameLut
EfxAdvanceFrameLut: @ 0x08047BA4
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r3, r1, #0
	ldrh r0, [r5]
	adds r6, r0, #0
	cmp r6, #0
	bne .L08047C0C
	ldrh r0, [r3]
	mov ip, r0
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrh r4, [r0]
	movs r7, #0
	ldrsh r1, [r0, r7]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq .L08047BD0
	movs r0, #4
	rsbs r0, r0, #0
	cmp r1, r0
	bne .L08047BD4
.L08047BD0:
	adds r0, r1, #0
	b .L08047C14
.L08047BD4:
	movs r0, #2
	rsbs r0, r0, #0
	cmp r1, r0
	bne .L08047BE2
	strh r6, [r3]
	ldrh r4, [r2]
	b .L08047BF6
.L08047BE2:
	movs r0, #3
	rsbs r0, r0, #0
	cmp r1, r0
	bne .L08047BF6
	mov r0, ip
	subs r0, #1
	strh r0, [r3]
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrh r4, [r0]
.L08047BF6:
	ldrh r1, [r3]
	lsls r0, r1, #2
	adds r0, r0, r2
	ldrh r0, [r0, #2]
	adds r1, #1
	strh r1, [r3]
	subs r0, #1
	strh r0, [r5]
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	b .L08047C14
.L08047C0C:
	subs r0, #1
	strh r0, [r5]
	movs r0, #5
	rsbs r0, r0, #0
.L08047C14:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start func_fe6_08047C1C
func_fe6_08047C1C: @ 0x08047C1C
	ldr r1, .L08047C24 @ =gUnk_Banim_02017754
	movs r0, #1
	str r0, [r1]
	bx lr
	.align 2, 0
.L08047C24: .4byte gUnk_Banim_02017754

	thumb_func_start EfxGetCamMovDuration
EfxGetCamMovDuration: @ 0x08047C28
	ldr r0, .L08047C38 @ =gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #2
	bne .L08047C3C
	movs r0, #0x18
	b .L08047C46
	.align 2, 0
.L08047C38: .4byte gEkrDistanceType
.L08047C3C:
	cmp r0, #1
	beq .L08047C44
	movs r0, #0
	b .L08047C46
.L08047C44:
	movs r0, #0x10
.L08047C46:
	bx lr

	thumb_func_start func_fe6_08047C48
func_fe6_08047C48: @ 0x08047C48
	push {lr}
	sub sp, #4
	ldr r1, .L08047C60 @ =gTmA_Banim
	str r0, [sp]
	ldr r2, .L08047C64 @ =0x050002D6
	mov r0, sp
	bl CpuSet
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
.L08047C60: .4byte gTmA_Banim
.L08047C64: .4byte 0x050002D6

	thumb_func_start EfxTmFill
EfxTmFill: @ 0x08047C68
	push {lr}
	sub sp, #4
	ldr r1, .L08047C80 @ =gTmB_Banim
	str r0, [sp]
	ldr r2, .L08047C84 @ =0x050002D6
	mov r0, sp
	bl CpuSet
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
.L08047C80: .4byte gTmB_Banim
.L08047C84: .4byte 0x050002D6

	thumb_func_start SetEkrFrontAnimPostion
SetEkrFrontAnimPostion: @ 0x08047C88
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	cmp r0, #0
	bne .L08047CA4
	ldr r0, .L08047CA0 @ =gAnims
	ldr r3, [r0]
	strh r1, [r3, #2]
	strh r2, [r3, #4]
	ldr r3, [r0, #4]
	b .L08047CAE
	.align 2, 0
.L08047CA0: .4byte gAnims
.L08047CA4:
	ldr r0, .L08047CB4 @ =gAnims
	ldr r3, [r0, #8]
	strh r1, [r3, #2]
	strh r2, [r3, #4]
	ldr r3, [r0, #0xc]
.L08047CAE:
	strh r1, [r3, #2]
	strh r2, [r3, #4]
	bx lr
	.align 2, 0
.L08047CB4: .4byte gAnims

	thumb_func_start SetupBanim
SetupBanim: @ 0x08047CB8
	push {lr}
	bl _SetupBanim
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start BeginAnimsOnBattleAnimations
BeginAnimsOnBattleAnimations: @ 0x08047CC8
	push {lr}
	bl GetBattleAnimArenaFlag
	cmp r0, #1
	bne .L08047CD8
	bl BeginAnimsOnBattle_Arena
	b .L08047D04
.L08047CD8:
	bl NewEkrBattleDeamon
	bl BasInit
	bl GetBanimInitPosReal
	ldr r1, .L08047D08 @ =gEkrInitPosReal
	str r0, [r1]
	bl NewEkrBattleStarting
	ldr r1, .L08047D0C @ =gAnims
	movs r0, #0
	str r0, [r1]
	str r0, [r1, #4]
	str r0, [r1, #8]
	str r0, [r1, #0xc]
	ldr r0, .L08047D10 @ =OnMainBas
	bl SetMainFunc
	movs r0, #0
	bl SetOnHBlankA
.L08047D04:
	pop {r0}
	bx r0
	.align 2, 0
.L08047D08: .4byte gEkrInitPosReal
.L08047D0C: .4byte gAnims
.L08047D10: .4byte OnMainBas

	thumb_func_start EkrMainEndExec
EkrMainEndExec: @ 0x08047D14
	push {lr}
	bl GetBattleAnimArenaFlag
	cmp r0, #1
	bne .L08047D24
	bl func_fe6_0804C5A4
	b .L08047D2E
.L08047D24:
	bl func_fe6_080481B4
	ldr r0, .L08047D34 @ =OnMainBas
	bl SetMainFunc
.L08047D2E:
	pop {r0}
	bx r0
	.align 2, 0
.L08047D34: .4byte OnMainBas

	thumb_func_start OnMainBas
OnMainBas: @ 0x08047D38
	push {r4, lr}
	ldr r0, .L08047D9C @ =gKeySt
	ldr r0, [r0]
	bl RefreshKeySt
	bl ClearSprites
	ldr r4, .L08047DA0 @ =gProcTreeRootArray
	ldr r0, [r4, #4]
	bl Proc_Run
	bl GetGameLock
	lsls r0, r0, #0x18
	cmp r0, #0
	bne .L08047D5E
	ldr r0, [r4, #8]
	bl Proc_Run
.L08047D5E:
	ldr r0, [r4, #0xc]
	bl Proc_Run
	ldr r0, [r4, #0x14]
	bl Proc_Run
	movs r0, #0
	bl PutSpriteLayerOam
	ldr r0, [r4, #0x10]
	bl Proc_Run
	bl BasUpdateAll
	bl BattleAIS_ExecCommands
	movs r0, #0xd
	bl PutSpriteLayerOam
	ldr r1, .L08047DA4 @ =gBmSt
	movs r0, #1
	strb r0, [r1]
	ldr r0, .L08047DA8 @ =0x04000006
	ldrh r0, [r0]
	strh r0, [r1, #6]
	bl VBlankIntrWait
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08047D9C: .4byte gKeySt
.L08047DA0: .4byte gProcTreeRootArray
.L08047DA4: .4byte gBmSt
.L08047DA8: .4byte 0x04000006

	thumb_func_start NewEkrBattleStarting
NewEkrBattleStarting: @ 0x08047DAC
	push {lr}
	ldr r0, .L08047DBC @ =gUnk_085CBB18
	movs r1, #3
	bl SpawnProc
	pop {r0}
	bx r0
	.align 2, 0
.L08047DBC: .4byte gUnk_085CBB18

	thumb_func_start func_fe6_08047DC0
func_fe6_08047DC0: @ 0x08047DC0
	push {r4, r5, r6, lr}
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6}
	sub sp, #4
	adds r5, r0, #0
	movs r4, #0
	movs r3, #0
	strh r3, [r5, #0x2c]
	movs r0, #0xf
	strh r0, [r5, #0x2e]
	ldr r2, .L08047EC0 @ =0x0203CD16
	movs r1, #0
	ldrsh r0, [r2, r1]
	movs r6, #4
	ldrsh r1, [r2, r6]
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, #8
	strh r0, [r5, #0x34]
	strh r0, [r5, #0x32]
	movs r1, #2
	ldrsh r0, [r2, r1]
	movs r6, #6
	ldrsh r1, [r2, r6]
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, #8
	strh r0, [r5, #0x3c]
	strh r0, [r5, #0x3a]
	str r3, [sp]
	ldr r1, .L08047EC4 @ =gBg2Tm
	ldr r2, .L08047EC8 @ =0x01000200
	mov r0, sp
	bl CpuFastSet
	movs r0, #4
	bl EnableBgSync
	ldr r6, .L08047ECC @ =gDispIo
	adds r1, r6, #0
	adds r1, #0x3c
	movs r0, #0xc0
	ldrb r2, [r1]
	orrs r0, r2
	strb r0, [r1]
	adds r0, r6, #0
	adds r0, #0x44
	strb r4, [r0]
	adds r0, #1
	strb r4, [r0]
	adds r1, #0xa
	movs r0, #4
	mov sl, r0
	movs r0, #4
	strb r0, [r1]
	ldr r0, .L08047ED0 @ =0x0000FFE0
	ldrh r1, [r6, #0x3c]
	ands r0, r1
	movs r1, #8
	orrs r0, r1
	strh r0, [r6, #0x3c]
	movs r2, #0x20
	mov sb, r2
	mov r0, sb
	ldrb r1, [r6, #1]
	orrs r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r6, #1]
	adds r0, r6, #0
	adds r0, #0x2d
	strb r4, [r0]
	adds r0, #4
	strb r4, [r0]
	adds r1, r6, #0
	adds r1, #0x2c
	movs r0, #0xf0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0xa0
	strb r0, [r1]
	movs r2, #0x34
	adds r2, r2, r6
	mov r8, r2
	movs r0, #1
	ldrb r1, [r2]
	orrs r1, r0
	movs r4, #2
	orrs r1, r4
	mov r2, sl
	orrs r1, r2
	movs r3, #8
	orrs r1, r3
	movs r2, #0x10
	orrs r1, r2
	adds r6, #0x36
	ldrb r2, [r6]
	orrs r0, r2
	orrs r0, r4
	mov r2, sl
	orrs r0, r2
	orrs r0, r3
	movs r2, #0x11
	rsbs r2, r2, #0
	ands r0, r2
	subs r2, #0x10
	ands r1, r2
	mov r2, r8
	strb r1, [r2]
	mov r1, sb
	orrs r0, r1
	strb r0, [r6]
	adds r0, r5, #0
	bl Proc_Break
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08047EC0: .4byte 0x0203CD16
.L08047EC4: .4byte gBg2Tm
.L08047EC8: .4byte 0x01000200
.L08047ECC: .4byte gDispIo
.L08047ED0: .4byte 0x0000FFE0

	thumb_func_start func_fe6_08047ED4
func_fe6_08047ED4: @ 0x08047ED4
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r7, r0, #0
	ldrh r0, [r7, #0x2c]
	ldrh r1, [r7, #0x2e]
	cmp r0, r1
	beq .L08047EEC
	adds r0, #1
	strh r0, [r7, #0x2c]
.L08047EEC:
	movs r0, #0x32
	ldrsh r2, [r7, r0]
	movs r1, #0x2c
	ldrsh r3, [r7, r1]
	movs r1, #0x2e
	ldrsh r0, [r7, r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	bl Interpolate
	adds r6, r0, #0
	movs r0, #0x3a
	ldrsh r2, [r7, r0]
	movs r1, #0x2c
	ldrsh r3, [r7, r1]
	movs r1, #0x2e
	ldrsh r0, [r7, r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	bl Interpolate
	adds r5, r0, #0
	movs r0, #0x34
	ldrsh r2, [r7, r0]
	movs r1, #0x2c
	ldrsh r3, [r7, r1]
	movs r1, #0x2e
	ldrsh r0, [r7, r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #0xf0
	bl Interpolate
	adds r4, r0, #0
	movs r0, #0x3c
	ldrsh r2, [r7, r0]
	movs r1, #0x2c
	ldrsh r3, [r7, r1]
	movs r1, #0x2e
	ldrsh r0, [r7, r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #0xa0
	bl Interpolate
	ldr r1, .L08047FD4 @ =gDispIo
	movs r2, #0x2d
	adds r2, r2, r1
	mov r8, r2
	movs r2, #0
	mov sb, r2
	mov r2, r8
	strb r6, [r2]
	adds r6, r1, #0
	adds r6, #0x31
	strb r5, [r6]
	adds r5, r1, #0
	adds r5, #0x2c
	strb r4, [r5]
	adds r4, r1, #0
	adds r4, #0x30
	strb r0, [r4]
	ldrh r0, [r7, #0x2c]
	ldrh r2, [r7, #0x2e]
	cmp r0, r2
	bne .L08047FC4
	adds r2, r1, #0
	adds r2, #0x36
	movs r0, #1
	ldrb r1, [r2]
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2]
	movs r0, #0
	bl InitOam
	bl LockBmDisplay
	mov r0, sb
	mov r2, r8
	strb r0, [r2]
	strb r0, [r6]
	movs r0, #0xf0
	strb r0, [r5]
	movs r0, #0xa0
	strb r0, [r4]
	ldr r0, .L08047FD8 @ =gPal
	movs r1, #6
	movs r2, #0xa
	movs r3, #4
	bl EfxPalBlackInOut
	bl EnablePalSync
	bl EndAllMus
	adds r0, r7, #0
	bl Proc_Break
.L08047FC4:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08047FD4: .4byte gDispIo
.L08047FD8: .4byte gPal

	thumb_func_start func_fe6_08047FDC
func_fe6_08047FDC: @ 0x08047FDC
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, .L08048008 @ =gEkrDebugModeMaybe
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne .L08048040
	bl NewEkrGauge
	bl func_fe6_08044198
	ldr r0, .L0804800C @ =gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #3
	beq .L08048010
	cmp r0, #3
	ble .L08048040
	cmp r0, #4
	beq .L08048038
	b .L08048040
	.align 2, 0
.L08048008: .4byte gEkrDebugModeMaybe
.L0804800C: .4byte gEkrDistanceType
.L08048010:
	ldr r4, .L08048034 @ =gEkrPairSideVaild
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne .L08048022
	bl func_fe6_080438E8
	bl func_fe6_080441FC
.L08048022:
	movs r1, #2
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne .L08048040
	bl func_fe6_080438F8
	bl func_fe6_0804420C
	b .L08048040
	.align 2, 0
.L08048034: .4byte gEkrPairSideVaild
.L08048038:
	bl func_fe6_080438E8
	bl func_fe6_080441FC
.L08048040:
	bl func_fe6_08044390
	movs r0, #0
	bl func_fe6_080489E8
	movs r0, #0
	bl func_fe6_08048574
	movs r0, #0
	movs r1, #0xb
	bl NewEkrWindowAppear
	movs r0, #0
	movs r1, #0xb
	movs r2, #0
	bl NewEkrNamewinAppear
	movs r0, #0
	movs r1, #0xb
	bl func_fe6_08048F88
	movs r0, #0
	strh r0, [r5, #0x2c]
	adds r0, r5, #0
	bl Proc_Break
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_fe6_0804807C
func_fe6_0804807C: @ 0x0804807C
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xb
	ble .L080480BC
	ldr r0, .L080480AC @ =gBanimBackgroundIndex
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq .L080480A0
	bl GetEkrDragonStateType
	cmp r0, #0
	beq .L080480B0
.L080480A0:
	bl NewEkrBattle
	adds r0, r4, #0
	bl Proc_End
	b .L080480BC
	.align 2, 0
.L080480AC: .4byte gBanimBackgroundIndex
.L080480B0:
	strh r0, [r4, #0x2c]
	bl NewEkrBattle
	adds r0, r4, #0
	bl Proc_Break
.L080480BC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_fe6_080480C4
func_fe6_080480C4: @ 0x080480C4
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	movs r0, #0x2c
	ldrsh r3, [r4, r0]
	movs r0, #8
	str r0, [sp]
	movs r0, #0
	movs r1, #4
	movs r2, #0x10
	bl Interpolate
	bl EfxChapterMapFadeOUT
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #9
	bne .L080480F8
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r4, #0
	bl Proc_Break
.L080480F8:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start func_fe6_08048100
func_fe6_08048100: @ 0x08048100
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, .L08048114 @ =gEkrSnowWeather
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne .L0804811C
	ldr r1, .L08048118 @ =gUnk_Banim_0201E0F8
	movs r0, #6
	b .L08048120
	.align 2, 0
.L08048114: .4byte gEkrSnowWeather
.L08048118: .4byte gUnk_Banim_0201E0F8
.L0804811C:
	ldr r1, .L08048148 @ =gUnk_Banim_0201E0F8
	movs r0, #0xa
.L08048120:
	str r0, [r1]
	ldr r0, .L0804814C @ =gBanimBackgroundIndex
	movs r1, #0
	ldrsh r0, [r0, r1]
	subs r0, #1
	bl func_fe6_0805F100
	ldr r0, .L08048150 @ =gPal
	movs r1, #6
	movs r2, #0xa
	movs r3, #0x10
	bl EfxPalBlackInOut
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08048148: .4byte gUnk_Banim_0201E0F8
.L0804814C: .4byte gBanimBackgroundIndex
.L08048150: .4byte gPal

	thumb_func_start func_fe6_08048154
func_fe6_08048154: @ 0x08048154
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	movs r0, #0x2c
	ldrsh r3, [r5, r0]
	movs r0, #8
	str r0, [sp]
	movs r0, #0
	movs r1, #0x10
	movs r2, #0
	bl Interpolate
	adds r4, r0, #0
	ldr r0, .L080481AC @ =gBanimBackgroundIndex
	movs r1, #0
	ldrsh r0, [r0, r1]
	subs r0, #1
	bl func_fe6_0805F0DC
	ldr r0, .L080481B0 @ =gPal
	movs r1, #6
	movs r2, #0xa
	adds r3, r4, #0
	bl EfxPalBlackInOut
	bl EnablePalSync
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #9
	bne .L080481A2
	movs r0, #0
	strh r0, [r5, #0x2c]
	adds r0, r5, #0
	bl Proc_Break
.L080481A2:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L080481AC: .4byte gBanimBackgroundIndex
.L080481B0: .4byte gPal

	thumb_func_start func_fe6_080481B4
func_fe6_080481B4: @ 0x080481B4
	push {lr}
	ldr r0, .L080481C8 @ =gUnk_085CBB60
	movs r1, #3
	bl SpawnProc
	movs r1, #0
	strh r1, [r0, #0x2c]
	pop {r0}
	bx r0
	.align 2, 0
.L080481C8: .4byte gUnk_085CBB60

	thumb_func_start func_fe6_080481CC
func_fe6_080481CC: @ 0x080481CC
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r7, .L080481F0 @ =gBanimBackgroundIndex
	movs r1, #0
	ldrsh r0, [r7, r1]
	cmp r0, #0
	beq .L080481E6
	bl GetEkrDragonStateType
	adds r6, r0, #0
	cmp r6, #0
	beq .L080481F4
.L080481E6:
	adds r0, r5, #0
	bl Proc_Break
	b .L08048238
	.align 2, 0
.L080481F0: .4byte gBanimBackgroundIndex
.L080481F4:
	movs r0, #0x2c
	ldrsh r3, [r5, r0]
	movs r0, #8
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0x10
	bl Interpolate
	adds r4, r0, #0
	movs r1, #0
	ldrsh r0, [r7, r1]
	subs r0, #1
	bl func_fe6_0805F0DC
	ldr r0, .L08048240 @ =gPal
	movs r1, #6
	movs r2, #0xa
	adds r3, r4, #0
	bl EfxPalBlackInOut
	bl EnablePalSync
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #9
	bne .L08048238
	strh r6, [r5, #0x2c]
	adds r0, r5, #0
	bl Proc_Break
.L08048238:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08048240: .4byte gPal

	thumb_func_start func_fe6_08048244
func_fe6_08048244: @ 0x08048244
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, .L08048264 @ =gBanimBackgroundIndex
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq .L0804825A
	bl GetEkrDragonStateType
	cmp r0, #0
	beq .L08048268
.L0804825A:
	adds r0, r4, #0
	bl Proc_Break
	b .L0804828E
	.align 2, 0
.L08048264: .4byte gBanimBackgroundIndex
.L08048268:
	ldr r0, .L08048294 @ =gPlaySt
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl ApplyChapterMapGraphics
	movs r0, #0x10
	bl EfxChapterMapFadeOUT
	bl RenderMap
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	adds r0, r4, #0
	bl Proc_Break
.L0804828E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08048294: .4byte gPlaySt

	thumb_func_start func_fe6_08048298
func_fe6_08048298: @ 0x08048298
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, .L080482BC @ =gBanimBackgroundIndex
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq .L080482B2
	bl GetEkrDragonStateType
	adds r5, r0, #0
	cmp r5, #0
	beq .L080482C0
.L080482B2:
	adds r0, r4, #0
	bl Proc_Break
	b .L080482EC
	.align 2, 0
.L080482BC: .4byte gBanimBackgroundIndex
.L080482C0:
	movs r0, #0x2c
	ldrsh r3, [r4, r0]
	movs r0, #8
	str r0, [sp]
	movs r0, #0
	movs r1, #0x10
	movs r2, #4
	bl Interpolate
	bl EfxChapterMapFadeOUT
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #9
	bne .L080482EC
	strh r5, [r4, #0x2c]
	adds r0, r4, #0
	bl Proc_Break
.L080482EC:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start func_fe6_080482F4
func_fe6_080482F4: @ 0x080482F4
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0
	strh r0, [r4, #0x2c]
	ldr r2, .L08048350 @ =0x0203CD16
	movs r1, #0
	ldrsh r0, [r2, r1]
	movs r3, #4
	ldrsh r1, [r2, r3]
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, #8
	strh r0, [r4, #0x34]
	strh r0, [r4, #0x32]
	movs r1, #2
	ldrsh r0, [r2, r1]
	movs r3, #6
	ldrsh r1, [r2, r3]
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, #8
	strh r0, [r4, #0x3c]
	strh r0, [r4, #0x3a]
	bl BasInit
	movs r0, #1
	bl func_fe6_080489E8
	movs r0, #1
	bl func_fe6_08048574
	movs r0, #1
	movs r1, #0xb
	bl NewEkrWindowAppear
	movs r0, #1
	movs r1, #0xb
	bl func_fe6_08048F88
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08048350: .4byte 0x0203CD16

	thumb_func_start func_fe6_08048354
func_fe6_08048354: @ 0x08048354
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	movs r5, #0
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xc
	ble .L080483D4
	bl EndEkrGauge
	adds r0, r4, #0
	bl Proc_Break
	bl InitBmBgLayers
	ldr r0, .L080483DC @ =gDispIo
	mov ip, r0
	movs r0, #0x20
	mov r1, ip
	ldrb r1, [r1, #1]
	orrs r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	mov r2, ip
	strb r0, [r2, #1]
	mov r0, ip
	adds r0, #0x2d
	strb r5, [r0]
	adds r0, #4
	strb r5, [r0]
	subs r0, #5
	strb r5, [r0]
	adds r0, #4
	strb r5, [r0]
	mov r5, ip
	adds r5, #0x34
	movs r1, #1
	ldrb r0, [r5]
	orrs r0, r1
	movs r6, #2
	orrs r0, r6
	movs r4, #4
	orrs r0, r4
	movs r3, #8
	orrs r0, r3
	movs r2, #0x10
	orrs r0, r2
	strb r0, [r5]
	mov r2, ip
	adds r2, #0x36
	ldrb r0, [r2]
	orrs r1, r0
	orrs r1, r6
	orrs r1, r4
	orrs r1, r3
	movs r0, #0x11
	rsbs r0, r0, #0
	ands r1, r0
	strb r1, [r2]
.L080483D4:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L080483DC: .4byte gDispIo

	thumb_func_start func_fe6_080483E0
func_fe6_080483E0: @ 0x080483E0
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r4, #0
	movs r0, #0
	strh r0, [r5, #0x2c]
	movs r0, #0xf
	strh r0, [r5, #0x2e]
	bl ResetUnitSprites
	bl func_fe6_080292B8
	bl RefreshUnitSprites
	bl ForceSyncUnitSpriteSheet
	bl ApplyUnitSpritePalettes
	ldr r2, .L08048468 @ =gDispIo
	adds r1, r2, #0
	adds r1, #0x3c
	movs r0, #0xc0
	ldrb r3, [r1]
	orrs r0, r3
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x44
	strb r4, [r0]
	adds r0, #1
	strb r4, [r0]
	adds r1, #0xa
	movs r0, #4
	strb r0, [r1]
	ldr r0, .L0804846C @ =0x0000FFE0
	ldrh r1, [r2, #0x3c]
	ands r0, r1
	movs r1, #8
	orrs r0, r1
	strh r0, [r2, #0x3c]
	adds r1, r2, #0
	adds r1, #0x34
	movs r0, #0x21
	rsbs r0, r0, #0
	ldrb r3, [r1]
	ands r0, r3
	strb r0, [r1]
	adds r1, #2
	movs r0, #0x20
	ldrb r2, [r1]
	orrs r0, r2
	strb r0, [r1]
	bl GetBattleAnimArenaFlag
	cmp r0, #1
	beq .L08048450
	bl ApplyChapterMapPalettes
.L08048450:
	bl GetBanimLinkArenaFlag
	cmp r0, #1
	bne .L0804845C
	bl func_fe6_0803CF58
.L0804845C:
	adds r0, r5, #0
	bl Proc_Break
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08048468: .4byte gDispIo
.L0804846C: .4byte 0x0000FFE0

	thumb_func_start func_fe6_08048470
func_fe6_08048470: @ 0x08048470
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	adds r7, r0, #0
	ldrh r0, [r7, #0x2c]
	ldrh r1, [r7, #0x2e]
	cmp r0, r1
	beq .L08048488
	adds r0, #1
	strh r0, [r7, #0x2c]
.L08048488:
	movs r2, #0x32
	ldrsh r1, [r7, r2]
	movs r0, #0x2c
	ldrsh r3, [r7, r0]
	movs r2, #0x2e
	ldrsh r0, [r7, r2]
	str r0, [sp]
	movs r0, #0
	movs r2, #0
	bl Interpolate
	adds r6, r0, #0
	movs r0, #0x3a
	ldrsh r1, [r7, r0]
	movs r2, #0x2c
	ldrsh r3, [r7, r2]
	movs r2, #0x2e
	ldrsh r0, [r7, r2]
	str r0, [sp]
	movs r0, #0
	movs r2, #0
	bl Interpolate
	adds r5, r0, #0
	movs r0, #0x34
	ldrsh r1, [r7, r0]
	movs r2, #0x2c
	ldrsh r3, [r7, r2]
	movs r2, #0x2e
	ldrsh r0, [r7, r2]
	str r0, [sp]
	movs r0, #0
	movs r2, #0xf0
	bl Interpolate
	adds r4, r0, #0
	movs r0, #0x3c
	ldrsh r1, [r7, r0]
	movs r2, #0x2c
	ldrsh r3, [r7, r2]
	movs r2, #0x2e
	ldrsh r0, [r7, r2]
	str r0, [sp]
	movs r0, #0
	movs r2, #0xa0
	bl Interpolate
	ldr r1, .L08048550 @ =gDispIo
	movs r2, #0x2d
	adds r2, r2, r1
	mov sb, r2
	movs r2, #0
	mov r8, r2
	mov r2, sb
	strb r6, [r2]
	adds r6, r1, #0
	adds r6, #0x31
	strb r5, [r6]
	adds r5, r1, #0
	adds r5, #0x2c
	strb r4, [r5]
	adds r4, r1, #0
	adds r4, #0x30
	strb r0, [r4]
	mov r0, r8
	str r0, [sp, #4]
	ldr r1, .L08048554 @ =gBg2Tm
	ldr r2, .L08048558 @ =0x01000200
	add r0, sp, #4
	bl CpuFastSet
	movs r0, #4
	bl EnableBgSync
	ldrh r1, [r7, #0x2c]
	ldrh r2, [r7, #0x2e]
	cmp r1, r2
	bne .L08048542
	movs r0, #0
	mov r1, r8
	strh r1, [r7, #0x2c]
	mov r2, sb
	strb r0, [r2]
	strb r0, [r6]
	movs r0, #0xf0
	strb r0, [r5]
	movs r0, #0xa0
	strb r0, [r4]
	bl EnablePalSync
	adds r0, r7, #0
	bl Proc_Break
.L08048542:
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08048550: .4byte gDispIo
.L08048554: .4byte gBg2Tm
.L08048558: .4byte 0x01000200

	thumb_func_start func_fe6_0804855C
func_fe6_0804855C: @ 0x0804855C
	push {r4, lr}
	adds r4, r0, #0
	bl EndEkrBattleDeamon
	bl func_fe6_08029240
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start func_fe6_08048574
func_fe6_08048574: @ 0x08048574
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	ldr r3, .L080485DC @ =gDispIo
	adds r1, r3, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r2, [r1]
	ands r0, r2
	strb r0, [r1]
	adds r1, #8
	movs r2, #0
	movs r0, #0xa
	strb r0, [r1]
	adds r1, #1
	movs r0, #6
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x46
	strb r2, [r0]
	ldr r0, .L080485E0 @ =0x0000FFE0
	ldrh r4, [r3, #0x3c]
	ands r0, r4
	ldr r1, .L080485E4 @ =0x0000E0FF
	ands r0, r1
	movs r2, #0xc0
	lsls r2, r2, #4
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r3, #0x3c]
	adds r1, r3, #0
	adds r1, #0x3d
	movs r0, #0x20
	ldrb r3, [r1]
	orrs r0, r3
	strb r0, [r1]
	ldr r0, .L080485E8 @ =0x0203CD16
	movs r4, #0
	ldrsh r3, [r0, r4]
	movs r1, #4
	ldrsh r2, [r0, r1]
	cmp r3, r2
	bne .L080485EC
	movs r2, #2
	ldrsh r1, [r0, r2]
	movs r3, #6
	ldrsh r0, [r0, r3]
	movs r4, #2
	cmp r1, r0
	blt .L08048618
	movs r4, #6
	b .L08048618
	.align 2, 0
.L080485DC: .4byte gDispIo
.L080485E0: .4byte 0x0000FFE0
.L080485E4: .4byte 0x0000E0FF
.L080485E8: .4byte 0x0203CD16
.L080485EC:
	movs r4, #2
	ldrsh r1, [r0, r4]
	movs r4, #6
	ldrsh r0, [r0, r4]
	cmp r1, r0
	bne .L08048602
	movs r4, #4
	cmp r3, r2
	bge .L08048618
	movs r4, #0
	b .L08048618
.L08048602:
	cmp r3, r2
	bge .L08048610
	movs r4, #1
	cmp r1, r0
	blt .L08048618
	movs r4, #7
	b .L08048618
.L08048610:
	movs r4, #3
	cmp r1, r0
	blt .L08048618
	movs r4, #5
.L08048618:
	ldr r0, .L0804862C @ =gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #3
	bgt .L08048630
	cmp r0, #1
	bge .L0804863C
	cmp r0, #0
	beq .L08048634
	b .L0804863C
	.align 2, 0
.L0804862C: .4byte gEkrDistanceType
.L08048630:
	cmp r0, #4
	bne .L0804863C
.L08048634:
	ldr r0, .L08048638 @ =gUnk_085CBBC8
	b .L0804863E
	.align 2, 0
.L08048638: .4byte gUnk_085CBBC8
.L0804863C:
	ldr r0, .L08048670 @ =gUnk_085CBBE8
.L0804863E:
	lsls r1, r4, #2
	adds r0, r1, r0
	ldr r0, [r0]
	adds r6, r1, #0
	ldr r1, .L08048674 @ =0x06010000
	bl LZ77UnCompVram
	ldr r0, .L08048678 @ =gUnk_08119CD8
	ldr r1, .L0804867C @ =gPal+0x280
	movs r2, #1
	bl CpuFastSet
	bl EnablePalSync
	ldr r0, .L08048680 @ =gEkrDistanceType
	movs r2, #0
	ldrsh r0, [r0, r2]
	cmp r0, #4
	bls .L08048666
	b .L08048942
.L08048666:
	lsls r0, r0, #2
	ldr r1, .L08048684 @ =.L08048688
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
.L08048670: .4byte gUnk_085CBBE8
.L08048674: .4byte 0x06010000
.L08048678: .4byte gUnk_08119CD8
.L0804867C: .4byte gPal+0x280
.L08048680: .4byte gEkrDistanceType
.L08048684: .4byte .L08048688
.L08048688: @ jump table
	.4byte .L0804869C @ case 0
	.4byte .L0804873C @ case 1
	.4byte .L0804873C @ case 2
	.4byte .L080488A8 @ case 3
	.4byte .L0804869C @ case 4
.L0804869C:
	ldr r0, .L080486EC @ =gUnk_085CBBB0
	movs r1, #3
	bl SpawnProc
	adds r5, r0, #0
	str r7, [r5, #0x44]
	adds r1, r5, #0
	adds r1, #0x29
	movs r0, #0
	strb r0, [r1]
	strh r0, [r5, #0x2c]
	movs r0, #0xb
	strh r0, [r5, #0x2e]
	ldr r2, .L080486F0 @ =0x0203CD16
	movs r3, #0
	ldrsh r0, [r2, r3]
	movs r4, #4
	ldrsh r1, [r2, r4]
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, #8
	strh r0, [r5, #0x32]
	movs r1, #2
	ldrsh r0, [r2, r1]
	movs r3, #6
	ldrsh r1, [r2, r3]
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, #8
	strh r0, [r5, #0x3a]
	movs r0, #0x78
	strh r0, [r5, #0x34]
	movs r0, #0x68
	strh r0, [r5, #0x3c]
	ldr r0, [r5, #0x44]
	cmp r0, #0
	bne .L080486F8
	ldr r0, .L080486F4 @ =gUnk_085CBC08
	b .L080486FA
	.align 2, 0
.L080486EC: .4byte gUnk_085CBBB0
.L080486F0: .4byte 0x0203CD16
.L080486F4: .4byte gUnk_085CBC08
.L080486F8:
	ldr r0, .L08048728 @ =gUnk_085CBC68
.L080486FA:
	adds r0, r6, r0
	ldr r0, [r0]
	movs r1, #0x64
	bl BasCreate
	adds r2, r0, #0
	str r2, [r5, #0x5c]
	movs r0, #0x90
	lsls r0, r0, #7
	strh r0, [r2, #8]
	ldr r0, [r2, #0x1c]
	movs r1, #0x80
	lsls r1, r1, #3
	orrs r0, r1
	str r0, [r2, #0x1c]
	ldr r0, [r5, #0x44]
	cmp r0, #0
	bne .L0804872C
	ldrh r0, [r5, #0x32]
	strh r0, [r2, #2]
	ldrh r0, [r5, #0x3a]
	b .L08048732
	.align 2, 0
.L08048728: .4byte gUnk_085CBC68
.L0804872C:
	ldrh r0, [r5, #0x34]
	strh r0, [r2, #2]
	ldrh r0, [r5, #0x3c]
.L08048732:
	strh r0, [r2, #4]
	ldr r0, .L08048738 @ =gUnk_085CBCC8
	b .L08048936
	.align 2, 0
.L08048738: .4byte gUnk_085CBCC8
.L0804873C:
	ldr r0, .L08048798 @ =gUnk_085CBBB0
	movs r1, #3
	bl SpawnProc
	adds r5, r0, #0
	str r7, [r5, #0x44]
	adds r1, r5, #0
	adds r1, #0x29
	movs r0, #0
	strb r0, [r1]
	strh r0, [r5, #0x2c]
	movs r0, #0xb
	strh r0, [r5, #0x2e]
	ldr r1, .L0804879C @ =0x0203CD16
	movs r4, #0
	ldrsh r0, [r1, r4]
	lsls r0, r0, #4
	adds r0, #8
	strh r0, [r5, #0x32]
	movs r2, #2
	ldrsh r0, [r1, r2]
	lsls r0, r0, #4
	adds r0, #8
	strh r0, [r5, #0x3a]
	movs r2, #0x48
	strh r2, [r5, #0x34]
	movs r0, #0x68
	strh r0, [r5, #0x3c]
	ldr r0, .L080487A0 @ =gEkrInitPosReal
	ldr r0, [r0]
	cmp r0, #1
	bne .L0804878E
	ldr r1, .L080487A4 @ =gUnk_081122D0
	ldr r0, .L080487A8 @ =gEkrDistanceType
	movs r3, #0
	ldrsh r0, [r0, r3]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	subs r0, r2, r0
	strh r0, [r5, #0x34]
.L0804878E:
	ldr r0, [r5, #0x44]
	cmp r0, #0
	bne .L080487B0
	ldr r0, .L080487AC @ =gUnk_085CBC28
	b .L080487B2
	.align 2, 0
.L08048798: .4byte gUnk_085CBBB0
.L0804879C: .4byte 0x0203CD16
.L080487A0: .4byte gEkrInitPosReal
.L080487A4: .4byte gUnk_081122D0
.L080487A8: .4byte gEkrDistanceType
.L080487AC: .4byte gUnk_085CBC28
.L080487B0:
	ldr r0, .L080487E0 @ =gUnk_085CBC88
.L080487B2:
	adds r0, r6, r0
	ldr r0, [r0]
	movs r1, #0x64
	bl BasCreate
	adds r2, r0, #0
	str r2, [r5, #0x5c]
	movs r0, #0x90
	lsls r0, r0, #7
	strh r0, [r2, #8]
	ldr r0, [r2, #0x1c]
	movs r1, #0x80
	lsls r1, r1, #3
	orrs r0, r1
	str r0, [r2, #0x1c]
	ldr r0, [r5, #0x44]
	cmp r0, #0
	bne .L080487E4
	ldrh r0, [r5, #0x32]
	strh r0, [r2, #2]
	ldrh r0, [r5, #0x3a]
	b .L080487EA
	.align 2, 0
.L080487E0: .4byte gUnk_085CBC88
.L080487E4:
	ldrh r0, [r5, #0x34]
	strh r0, [r2, #2]
	ldrh r0, [r5, #0x3c]
.L080487EA:
	strh r0, [r2, #4]
	ldr r0, .L08048858 @ =gUnk_085CBCE8
	adds r0, r6, r0
	ldr r0, [r0]
	str r0, [r5, #0x60]
	movs r4, #0
	strh r4, [r5, #0x3e]
	strh r4, [r5, #0x36]
	ldr r0, .L0804885C @ =gUnk_085CBBB0
	movs r1, #3
	bl SpawnProc
	adds r5, r0, #0
	str r7, [r5, #0x44]
	adds r1, r5, #0
	adds r1, #0x29
	movs r0, #1
	strb r0, [r1]
	strh r4, [r5, #0x2c]
	movs r0, #0xb
	strh r0, [r5, #0x2e]
	ldr r1, .L08048860 @ =0x0203CD16
	movs r4, #4
	ldrsh r0, [r1, r4]
	lsls r0, r0, #4
	adds r0, #8
	strh r0, [r5, #0x32]
	movs r2, #6
	ldrsh r0, [r1, r2]
	lsls r0, r0, #4
	adds r0, #8
	strh r0, [r5, #0x3a]
	movs r0, #0xa8
	strh r0, [r5, #0x34]
	movs r0, #0x68
	strh r0, [r5, #0x3c]
	ldr r0, .L08048864 @ =gEkrInitPosReal
	ldr r0, [r0]
	cmp r0, #0
	bne .L0804884C
	ldr r1, .L08048868 @ =gUnk_081122D0
	ldr r0, .L0804886C @ =gEkrDistanceType
	movs r3, #0
	ldrsh r0, [r0, r3]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	adds r0, #0xa8
	strh r0, [r5, #0x34]
.L0804884C:
	ldr r0, [r5, #0x44]
	cmp r0, #0
	bne .L08048874
	ldr r0, .L08048870 @ =gUnk_085CBC48
	b .L08048876
	.align 2, 0
.L08048858: .4byte gUnk_085CBCE8
.L0804885C: .4byte gUnk_085CBBB0
.L08048860: .4byte 0x0203CD16
.L08048864: .4byte gEkrInitPosReal
.L08048868: .4byte gUnk_081122D0
.L0804886C: .4byte gEkrDistanceType
.L08048870: .4byte gUnk_085CBC48
.L08048874:
	ldr r0, .L080488A4 @ =gUnk_085CBCA8
.L08048876:
	adds r0, r6, r0
	ldr r0, [r0]
	movs r1, #0x64
	bl BasCreate
	adds r2, r0, #0
	str r2, [r5, #0x5c]
	movs r0, #0x90
	lsls r0, r0, #7
	strh r0, [r2, #8]
	ldr r0, [r2, #0x1c]
	movs r1, #0x80
	lsls r1, r1, #3
	orrs r0, r1
	str r0, [r2, #0x1c]
	ldr r0, [r5, #0x44]
	cmp r0, #0
	bne .L0804892C
	ldrh r0, [r5, #0x32]
	strh r0, [r2, #2]
	ldrh r0, [r5, #0x3a]
	b .L08048932
	.align 2, 0
.L080488A4: .4byte gUnk_085CBCA8
.L080488A8:
	ldr r0, .L080488EC @ =gUnk_085CBBB0
	movs r1, #3
	bl SpawnProc
	adds r5, r0, #0
	str r7, [r5, #0x44]
	adds r1, r5, #0
	adds r1, #0x29
	movs r0, #0
	strb r0, [r1]
	strh r0, [r5, #0x2c]
	movs r0, #0xb
	strh r0, [r5, #0x2e]
	ldr r1, .L080488F0 @ =0x0203CD16
	movs r4, #4
	ldrsh r0, [r1, r4]
	lsls r0, r0, #4
	adds r0, #8
	strh r0, [r5, #0x32]
	movs r2, #6
	ldrsh r0, [r1, r2]
	lsls r0, r0, #4
	adds r0, #8
	strh r0, [r5, #0x3a]
	movs r0, #0x78
	strh r0, [r5, #0x34]
	movs r0, #0x68
	strh r0, [r5, #0x3c]
	ldr r0, [r5, #0x44]
	cmp r0, #0
	bne .L080488F8
	ldr r0, .L080488F4 @ =gUnk_085CBC48
	b .L080488FA
	.align 2, 0
.L080488EC: .4byte gUnk_085CBBB0
.L080488F0: .4byte 0x0203CD16
.L080488F4: .4byte gUnk_085CBC48
.L080488F8:
	ldr r0, .L08048928 @ =gUnk_085CBCA8
.L080488FA:
	adds r0, r6, r0
	ldr r0, [r0]
	movs r1, #0x64
	bl BasCreate
	adds r2, r0, #0
	str r2, [r5, #0x5c]
	movs r0, #0x90
	lsls r0, r0, #7
	strh r0, [r2, #8]
	ldr r0, [r2, #0x1c]
	movs r1, #0x80
	lsls r1, r1, #3
	orrs r0, r1
	str r0, [r2, #0x1c]
	ldr r0, [r5, #0x44]
	cmp r0, #0
	bne .L0804892C
	ldrh r0, [r5, #0x32]
	strh r0, [r2, #2]
	ldrh r0, [r5, #0x3a]
	b .L08048932
	.align 2, 0
.L08048928: .4byte gUnk_085CBCA8
.L0804892C:
	ldrh r0, [r5, #0x34]
	strh r0, [r2, #2]
	ldrh r0, [r5, #0x3c]
.L08048932:
	strh r0, [r2, #4]
	ldr r0, .L08048948 @ =gUnk_085CBD08
.L08048936:
	adds r0, r6, r0
	ldr r0, [r0]
	str r0, [r5, #0x60]
	movs r0, #0
	strh r0, [r5, #0x3e]
	strh r0, [r5, #0x36]
.L08048942:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08048948: .4byte gUnk_085CBD08

	thumb_func_start func_fe6_0804894C
func_fe6_0804894C: @ 0x0804894C
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r5, [r4, #0x5c]
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	movs r2, #0x2e
	ldrsh r0, [r4, r2]
	cmp r1, r0
	blt .L0804896E
	adds r0, r5, #0
	bl BasRemove
	adds r0, r4, #0
	bl Proc_Break
	b .L080489DE
.L0804896E:
	ldr r0, [r4, #0x44]
	cmp r0, #0
	bne .L08048998
	movs r3, #0x32
	ldrsh r1, [r4, r3]
	movs r6, #0x34
	ldrsh r2, [r4, r6]
	movs r0, #0x2c
	ldrsh r3, [r4, r0]
	movs r6, #0x2e
	ldrsh r0, [r4, r6]
	str r0, [sp]
	movs r0, #0
	bl Interpolate
	strh r0, [r5, #2]
	movs r0, #0x3a
	ldrsh r1, [r4, r0]
	movs r3, #0x3c
	ldrsh r2, [r4, r3]
	b .L080489BA
.L08048998:
	movs r0, #0x34
	ldrsh r1, [r4, r0]
	movs r3, #0x32
	ldrsh r2, [r4, r3]
	movs r6, #0x2c
	ldrsh r3, [r4, r6]
	movs r6, #0x2e
	ldrsh r0, [r4, r6]
	str r0, [sp]
	movs r0, #0
	bl Interpolate
	strh r0, [r5, #2]
	movs r0, #0x3c
	ldrsh r1, [r4, r0]
	movs r3, #0x3a
	ldrsh r2, [r4, r3]
.L080489BA:
	movs r6, #0x2c
	ldrsh r3, [r4, r6]
	movs r6, #0x2e
	ldrsh r0, [r4, r6]
	str r0, [sp]
	movs r0, #0
	bl Interpolate
	strh r0, [r5, #4]
	ldrh r2, [r4, #0x2c]
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	movs r3, #0x2e
	ldrsh r0, [r4, r3]
	cmp r1, r0
	bgt .L080489DE
	adds r0, r2, #1
	strh r0, [r4, #0x2c]
.L080489DE:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_fe6_080489E8
func_fe6_080489E8: @ 0x080489E8
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, .L08048A14 @ =gUnk_085CBD28
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x44]
	movs r1, #0
	str r1, [r4, #0x50]
	str r1, [r4, #0x4c]
	ldr r0, .L08048A18 @ =gEkrDistanceType
	movs r2, #0
	ldrsh r0, [r0, r2]
	cmp r0, #0
	blt .L08048A5E
	cmp r0, #3
	ble .L08048A1C
	cmp r0, #4
	beq .L08048A4C
	b .L08048A5E
	.align 2, 0
.L08048A14: .4byte gUnk_085CBD28
.L08048A18: .4byte gEkrDistanceType
.L08048A1C:
	ldr r0, .L08048A48 @ =gEkrPairSideVaild
	movs r1, #0
	ldrsh r5, [r0, r1]
	cmp r5, #1
	bne .L08048A30
	bl GetDragonPosition
	cmp r0, #0
	beq .L08048A30
	str r5, [r4, #0x4c]
.L08048A30:
	ldr r0, .L08048A48 @ =gEkrPairSideVaild
	movs r2, #2
	ldrsh r5, [r0, r2]
	cmp r5, #1
	bne .L08048A5E
	bl GetDragonPosition
	cmp r0, #1
	beq .L08048A5E
	str r5, [r4, #0x50]
	b .L08048A5E
	.align 2, 0
.L08048A48: .4byte gEkrPairSideVaild
.L08048A4C:
	cmp r5, #0
	bne .L08048A58
	str r1, [r4, #0x4c]
	movs r0, #1
	str r0, [r4, #0x50]
	b .L08048A5E
.L08048A58:
	movs r0, #1
	str r0, [r4, #0x4c]
	str r1, [r4, #0x50]
.L08048A5E:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start func_fe6_08048A64
func_fe6_08048A64: @ 0x08048A64
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r1, .L08048B74 @ =gUnk_081122C0
	ldr r0, .L08048B78 @ =gEkrDistanceType
	movs r2, #0
	ldrsh r0, [r0, r2]
	adds r0, r0, r1
	ldr r1, .L08048B7C @ =gUnk_08112298
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r6, [r0]
	bl UpdateBanimFrame
	ldr r0, [r4, #0x44]
	cmp r0, #0
	bne .L08048A9C
	ldr r1, .L08048B80 @ =gBattleSt
	movs r0, #0x40
	ldrb r1, [r1, #1]
	ands r0, r1
	cmp r0, #0
	beq .L08048A9C
	ldr r0, .L08048B84 @ =gPal
	movs r1, #0x17
	movs r2, #1
	bl EfxPalModifyPetrifyEffect
.L08048A9C:
	ldr r5, .L08048B88 @ =gEkrPairSideVaild
	ldrh r3, [r5]
	cmp r3, #1
	bne .L08048AC2
	ldr r0, .L08048B8C @ =gUnk_Banim_02000054
	ldr r1, [r0]
	lsls r0, r6, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldr r0, .L08048B90 @ =gUnk_Banim_0200F1C0
	adds r1, r1, r0
	ldr r0, [r1, #4]
	ldr r1, [r1, #8]
	ldr r2, .L08048B94 @ =gUnk_Banim_020041C0
	adds r1, r1, r2
	str r1, [r4, #0x54]
	ldr r1, .L08048B98 @ =gUnk_Banim_02000080
	bl LZ77UnCompWram
.L08048AC2:
	ldrh r5, [r5, #2]
	cmp r5, #1
	bne .L08048AE6
	ldr r0, .L08048B9C @ =gUnk_Banim_02000058
	ldr r1, [r0]
	lsls r0, r6, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldr r0, .L08048BA0 @ =gUnk_Banim_02011BC0
	adds r1, r1, r0
	ldr r0, [r1, #4]
	ldr r1, [r1, #8]
	ldr r2, .L08048BA4 @ =gUnk_Banim_020099C0
	adds r1, r1, r2
	str r1, [r4, #0x58]
	ldr r1, .L08048BA8 @ =gUnk_Banim_02002080
	bl LZ77UnCompWram
.L08048AE6:
	ldr r5, .L08048BAC @ =0x0203CD98
	ldr r0, [r5]
	cmp r0, #0
	beq .L08048AF4
	ldr r1, .L08048BB0 @ =gUnk_Banim_02001080
	bl LZ77UnCompWram
.L08048AF4:
	ldr r0, [r5, #4]
	cmp r0, #0
	beq .L08048B00
	ldr r1, .L08048BB4 @ =gUnk_Banim_02003080
	bl LZ77UnCompWram
.L08048B00:
	ldr r1, .L08048BB8 @ =0x06014000
	ldr r0, .L08048B98 @ =gUnk_Banim_02000080
	movs r2, #0x80
	lsls r2, r2, #7
	bl RegisterDataMove
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #0xb
	strh r0, [r4, #0x2e]
	ldr r1, .L08048BBC @ =0x0203CD16
	movs r5, #0
	ldrsh r0, [r1, r5]
	lsls r0, r0, #4
	adds r0, #8
	strh r0, [r4, #0x32]
	movs r2, #2
	ldrsh r0, [r1, r2]
	lsls r0, r0, #4
	adds r0, #8
	strh r0, [r4, #0x3a]
	movs r3, #4
	ldrsh r0, [r1, r3]
	lsls r0, r0, #4
	adds r0, #8
	strh r0, [r4, #0x34]
	movs r5, #6
	ldrsh r0, [r1, r5]
	lsls r0, r0, #4
	adds r0, #8
	strh r0, [r4, #0x3c]
	ldr r1, .L08048BC0 @ =gUnk_081122C5
	ldr r2, .L08048B78 @ =gEkrDistanceType
	movs r3, #0
	ldrsh r0, [r2, r3]
	adds r0, r0, r1
	ldrb r5, [r0]
	strh r5, [r4, #0x36]
	ldr r1, .L08048BC4 @ =gUnk_081122CA
	movs r3, #0
	ldrsh r0, [r2, r3]
	adds r0, r0, r1
	ldrb r3, [r0]
	strh r3, [r4, #0x38]
	ldr r0, .L08048BC8 @ =gEkrInitPosReal
	ldr r0, [r0]
	cmp r0, #0
	bne .L08048BD0
	ldr r0, .L08048BCC @ =gUnk_081122D0
	movs r5, #0
	ldrsh r1, [r2, r5]
	lsls r1, r1, #1
	adds r1, r1, r0
	ldrh r1, [r1]
	adds r0, r1, r3
	strh r0, [r4, #0x38]
	b .L08048BE0
	.align 2, 0
.L08048B74: .4byte gUnk_081122C0
.L08048B78: .4byte gEkrDistanceType
.L08048B7C: .4byte gUnk_08112298
.L08048B80: .4byte gBattleSt
.L08048B84: .4byte gPal
.L08048B88: .4byte gEkrPairSideVaild
.L08048B8C: .4byte gUnk_Banim_02000054
.L08048B90: .4byte gUnk_Banim_0200F1C0
.L08048B94: .4byte gUnk_Banim_020041C0
.L08048B98: .4byte gUnk_Banim_02000080
.L08048B9C: .4byte gUnk_Banim_02000058
.L08048BA0: .4byte gUnk_Banim_02011BC0
.L08048BA4: .4byte gUnk_Banim_020099C0
.L08048BA8: .4byte gUnk_Banim_02002080
.L08048BAC: .4byte 0x0203CD98
.L08048BB0: .4byte gUnk_Banim_02001080
.L08048BB4: .4byte gUnk_Banim_02003080
.L08048BB8: .4byte 0x06014000
.L08048BBC: .4byte 0x0203CD16
.L08048BC0: .4byte gUnk_081122C5
.L08048BC4: .4byte gUnk_081122CA
.L08048BC8: .4byte gEkrInitPosReal
.L08048BCC: .4byte gUnk_081122D0
.L08048BD0:
	ldr r0, .L08048BEC @ =gUnk_081122D0
	movs r3, #0
	ldrsh r1, [r2, r3]
	lsls r1, r1, #1
	adds r1, r1, r0
	ldrh r1, [r1]
	subs r0, r5, r1
	strh r0, [r4, #0x36]
.L08048BE0:
	adds r0, r4, #0
	bl Proc_Break
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08048BEC: .4byte gUnk_081122D0

	thumb_func_start func_fe6_08048BF0
func_fe6_08048BF0: @ 0x08048BF0
	push {r4, r5, r6, r7, lr}
	ldr r4, .L08048C10 @ =0xFFFFFCB4
	add sp, r4
	adds r4, r0, #0
	add r5, sp, #0x304
	ldrh r2, [r4, #0x2c]
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	movs r3, #0x2e
	ldrsh r0, [r4, r3]
	cmp r1, r0
	blt .L08048C14
	adds r0, r4, #0
	bl Proc_Break
	b .L08048D8A
	.align 2, 0
.L08048C10: .4byte 0xFFFFFCB4
.L08048C14:
	adds r0, r2, #1
	strh r0, [r4, #0x2c]
	ldr r0, [r4, #0x44]
	cmp r0, #0
	bne .L08048C2C
	movs r1, #0x94
	lsls r1, r1, #2
	movs r2, #0x80
	lsls r2, r2, #1
	movs r6, #0x2c
	ldrsh r3, [r4, r6]
	b .L08048C38
.L08048C2C:
	movs r1, #0x80
	lsls r1, r1, #1
	movs r2, #0x94
	lsls r2, r2, #2
	movs r0, #0x2c
	ldrsh r3, [r4, r0]
.L08048C38:
	movs r6, #0x2e
	ldrsh r0, [r4, r6]
	str r0, [sp]
	movs r0, #0
	bl Interpolate
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	ldr r0, [r4, #0x4c]
	cmp r0, #1
	bne .L08048CEA
	ldr r0, [r4, #0x54]
	lsls r3, r7, #0x10
	asrs r3, r3, #0x10
	movs r1, #0
	str r1, [sp]
	add r1, sp, #4
	adds r2, r3, #0
	bl BanimUpdateSpriteRotScale
	ldr r0, [r4, #0x44]
	cmp r0, #0
	bne .L08048C96
	movs r0, #0x32
	ldrsh r1, [r4, r0]
	movs r3, #0x36
	ldrsh r2, [r4, r3]
	movs r6, #0x2c
	ldrsh r3, [r4, r6]
	movs r6, #0x2e
	ldrsh r0, [r4, r6]
	str r0, [sp]
	movs r0, #0
	bl Interpolate
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	movs r0, #0x3a
	ldrsh r1, [r4, r0]
	movs r2, #0x2c
	ldrsh r3, [r4, r2]
	movs r2, #0x2e
	ldrsh r0, [r4, r2]
	str r0, [sp]
	movs r0, #0
	movs r2, #0x58
	b .L08048CC4
.L08048C96:
	movs r3, #0x36
	ldrsh r1, [r4, r3]
	movs r6, #0x32
	ldrsh r2, [r4, r6]
	movs r0, #0x2c
	ldrsh r3, [r4, r0]
	movs r6, #0x2e
	ldrsh r0, [r4, r6]
	str r0, [sp]
	movs r0, #0
	bl Interpolate
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	movs r0, #0x3a
	ldrsh r2, [r4, r0]
	movs r1, #0x2c
	ldrsh r3, [r4, r1]
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #0x58
.L08048CC4:
	bl Interpolate
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	add r2, sp, #4
	str r2, [r5, #0x3c]
	movs r0, #0
	strh r6, [r5, #2]
	strh r1, [r5, #4]
	movs r1, #0x80
	lsls r1, r1, #3
	strh r1, [r5, #0xc]
	movs r1, #0xe4
	lsls r1, r1, #7
	strh r1, [r5, #8]
	str r0, [r5, #0x1c]
	adds r0, r5, #0
	bl BasPutOam
.L08048CEA:
	ldr r1, [r4, #0x50]
	cmp r1, #1
	bne .L08048D8A
	ldr r0, [r4, #0x58]
	lsls r3, r7, #0x10
	asrs r3, r3, #0x10
	str r1, [sp]
	add r1, sp, #4
	adds r2, r3, #0
	bl BanimUpdateSpriteRotScale
	ldr r0, [r4, #0x44]
	cmp r0, #0
	bne .L08048D36
	movs r3, #0x34
	ldrsh r1, [r4, r3]
	movs r6, #0x38
	ldrsh r2, [r4, r6]
	movs r0, #0x2c
	ldrsh r3, [r4, r0]
	movs r6, #0x2e
	ldrsh r0, [r4, r6]
	str r0, [sp]
	movs r0, #0
	bl Interpolate
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	movs r0, #0x3c
	ldrsh r1, [r4, r0]
	movs r2, #0x2c
	ldrsh r3, [r4, r2]
	movs r2, #0x2e
	ldrsh r0, [r4, r2]
	str r0, [sp]
	movs r0, #0
	movs r2, #0x58
	b .L08048D64
.L08048D36:
	movs r3, #0x38
	ldrsh r1, [r4, r3]
	movs r6, #0x34
	ldrsh r2, [r4, r6]
	movs r0, #0x2c
	ldrsh r3, [r4, r0]
	movs r6, #0x2e
	ldrsh r0, [r4, r6]
	str r0, [sp]
	movs r0, #0
	bl Interpolate
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	movs r0, #0x3c
	ldrsh r2, [r4, r0]
	movs r1, #0x2c
	ldrsh r3, [r4, r1]
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #0x58
.L08048D64:
	bl Interpolate
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	add r2, sp, #4
	str r2, [r5, #0x3c]
	movs r0, #0
	strh r6, [r5, #2]
	strh r1, [r5, #4]
	movs r1, #0x80
	lsls r1, r1, #3
	strh r1, [r5, #0xc]
	movs r1, #0x93
	lsls r1, r1, #8
	strh r1, [r5, #8]
	str r0, [r5, #0x1c]
	adds r0, r5, #0
	bl BasPutOam
.L08048D8A:
	movs r3, #0xd3
	lsls r3, r3, #2
	add sp, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_fe6_08048D98
func_fe6_08048D98: @ 0x08048D98
	push {lr}
	bl Proc_Break
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start NewEkrWindowAppear
NewEkrWindowAppear: @ 0x08048DA4
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r0, .L08048DE8 @ =gUnk_085CBD50
	movs r1, #3
	bl SpawnProc
	str r5, [r0, #0x44]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r4, [r0, #0x2e]
	movs r1, #0x39
	strh r1, [r0, #0x30]
	movs r2, #0
	cmp r5, #0
	bne .L08048DC6
	movs r2, #0x39
.L08048DC6:
	ldr r1, .L08048DEC @ =gEkrBg0QuakeVec
	movs r3, #0
	ldrsh r0, [r1, r3]
	ldrh r1, [r1, #2]
	adds r1, r1, r2
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl func_fe6_08043918
	ldr r1, .L08048DF0 @ =gUnk_Banim_0201E0EC
	movs r0, #1
	str r0, [r1]
	bl func_fe6_08043950
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08048DE8: .4byte gUnk_085CBD50
.L08048DEC: .4byte gEkrBg0QuakeVec
.L08048DF0: .4byte gUnk_Banim_0201E0EC

	thumb_func_start CheckEkrWindowAppearUnexist
CheckEkrWindowAppearUnexist: @ 0x08048DF4
	ldr r0, .L08048E00 @ =gUnk_Banim_0201E0EC
	ldr r0, [r0]
	cmp r0, #0
	beq .L08048E04
	movs r0, #0
	b .L08048E06
	.align 2, 0
.L08048E00: .4byte gUnk_Banim_0201E0EC
.L08048E04:
	movs r0, #1
.L08048E06:
	bx lr

	thumb_func_start func_fe6_08048E08
func_fe6_08048E08: @ 0x08048E08
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldrh r2, [r4, #0x2c]
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	movs r3, #0x2e
	ldrsh r0, [r4, r3]
	cmp r1, r0
	blt .L08048E34
	ldr r1, .L08048E30 @ =gUnk_Banim_0201E0EC
	movs r0, #0
	str r0, [r1]
	bl func_fe6_08043940
	adds r0, r4, #0
	bl Proc_Break
	b .L08048E7C
	.align 2, 0
.L08048E30: .4byte gUnk_Banim_0201E0EC
.L08048E34:
	adds r0, r2, #1
	strh r0, [r4, #0x2c]
	ldr r0, [r4, #0x44]
	cmp r0, #0
	bne .L08048E52
	movs r0, #0x30
	ldrsh r1, [r4, r0]
	movs r2, #0x2c
	ldrsh r3, [r4, r2]
	movs r2, #0x2e
	ldrsh r0, [r4, r2]
	str r0, [sp]
	movs r0, #1
	movs r2, #0
	b .L08048E64
.L08048E52:
	movs r3, #0x30
	ldrsh r2, [r4, r3]
	movs r0, #0x2c
	ldrsh r3, [r4, r0]
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	str r0, [sp]
	movs r0, #4
	movs r1, #0
.L08048E64:
	bl Interpolate
	adds r2, r0, #0
	ldr r1, .L08048E84 @ =gEkrBg0QuakeVec
	movs r3, #0
	ldrsh r0, [r1, r3]
	ldrh r1, [r1, #2]
	adds r1, r1, r2
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl func_fe6_08043918
.L08048E7C:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08048E84: .4byte gEkrBg0QuakeVec

	thumb_func_start NewEkrNamewinAppear
NewEkrNamewinAppear: @ 0x08048E88
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	ldr r0, .L08048EB8 @ =gUnk_085CBD68
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x44]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r5, [r0, #0x2e]
	strh r6, [r0, #0x30]
	subs r1, #0x31
	str r1, [r0, #0x48]
	cmp r4, #0
	bne .L08048EBC
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0
	bl func_fe6_0804421C
	b .L08048EC4
	.align 2, 0
.L08048EB8: .4byte gUnk_085CBD68
.L08048EBC:
	movs r0, #0
	movs r1, #0
	bl func_fe6_0804421C
.L08048EC4:
	ldr r1, .L08048ED4 @ =gUnk_Banim_0201E0F0
	movs r0, #1
	str r0, [r1]
	bl func_fe6_08044254
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08048ED4: .4byte gUnk_Banim_0201E0F0

	thumb_func_start CheckEkrNamewinAppearUnexist
CheckEkrNamewinAppearUnexist: @ 0x08048ED8
	ldr r0, .L08048EE4 @ =gUnk_Banim_0201E0F0
	ldr r0, [r0]
	cmp r0, #0
	beq .L08048EE8
	movs r0, #0
	b .L08048EEA
	.align 2, 0
.L08048EE4: .4byte gUnk_Banim_0201E0F0
.L08048EE8:
	movs r0, #1
.L08048EEA:
	bx lr

	thumb_func_start func_fe6_08048EEC
func_fe6_08048EEC: @ 0x08048EEC
	push {lr}
	adds r1, r0, #0
	ldrh r0, [r1, #0x2c]
	ldrh r2, [r1, #0x30]
	cmp r0, r2
	bne .L08048F04
	movs r0, #0
	strh r0, [r1, #0x2c]
	adds r0, r1, #0
	bl Proc_Break
	b .L08048F08
.L08048F04:
	adds r0, #1
	strh r0, [r1, #0x2c]
.L08048F08:
	pop {r0}
	bx r0

	thumb_func_start func_fe6_08048F0C
func_fe6_08048F0C: @ 0x08048F0C
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldrh r2, [r4, #0x2c]
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	movs r3, #0x2e
	ldrsh r0, [r4, r3]
	cmp r1, r0
	blt .L08048F40
	ldr r0, .L08048F3C @ =gUnk_Banim_0201E0F0
	movs r1, #0
	str r1, [r0]
	bl func_fe6_08044244
	ldr r0, [r4, #0x44]
	cmp r0, #2
	bne .L08048F34
	bl func_fe6_080441C8
.L08048F34:
	adds r0, r4, #0
	bl Proc_Break
	b .L08048F7E
	.align 2, 0
.L08048F3C: .4byte gUnk_Banim_0201E0F0
.L08048F40:
	adds r0, r2, #1
	strh r0, [r4, #0x2c]
	ldr r0, [r4, #0x44]
	cmp r0, #0
	bne .L08048F60
	ldr r1, [r4, #0x48]
	movs r0, #0x2c
	ldrsh r3, [r4, r0]
	movs r2, #0x2e
	ldrsh r0, [r4, r2]
	str r0, [sp]
	movs r0, #1
	movs r2, #0
	bl Interpolate
	b .L08048F74
.L08048F60:
	ldr r2, [r4, #0x48]
	movs r0, #0x2c
	ldrsh r3, [r4, r0]
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	str r0, [sp]
	movs r0, #4
	movs r1, #0
	bl Interpolate
.L08048F74:
	lsls r1, r0, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0
	bl func_fe6_0804421C
.L08048F7E:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_fe6_08048F88
func_fe6_08048F88: @ 0x08048F88
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, .L08048FAC @ =gUnk_085CBD88
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x44]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r5, [r0, #0x2e]
	cmp r4, #0
	bne .L08048FB4
	ldr r2, .L08048FB0 @ =0x0000FFA8
	movs r0, #2
	bl SetBgOffset
	b .L08048FBE
	.align 2, 0
.L08048FAC: .4byte gUnk_085CBD88
.L08048FB0: .4byte 0x0000FFA8
.L08048FB4:
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
.L08048FBE:
	ldr r1, .L08048FCC @ =gUnk_Banim_0201E0F4
	movs r0, #1
	str r0, [r1]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08048FCC: .4byte gUnk_Banim_0201E0F4

	thumb_func_start func_fe6_08048FD0
func_fe6_08048FD0: @ 0x08048FD0
	ldr r0, .L08048FDC @ =gUnk_Banim_0201E0F4
	ldr r0, [r0]
	cmp r0, #0
	beq .L08048FE0
	movs r0, #0
	b .L08048FE2
	.align 2, 0
.L08048FDC: .4byte gUnk_Banim_0201E0F4
.L08048FE0:
	movs r0, #1
.L08048FE2:
	bx lr

	thumb_func_start func_fe6_08048FE4
func_fe6_08048FE4: @ 0x08048FE4
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldrh r2, [r4, #0x2c]
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	movs r3, #0x2e
	ldrsh r0, [r4, r3]
	cmp r1, r0
	blt .L0804900C
	ldr r1, .L08049008 @ =gUnk_Banim_0201E0F4
	movs r0, #0
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
	b .L08049050
	.align 2, 0
.L08049008: .4byte gUnk_Banim_0201E0F4
.L0804900C:
	adds r0, r2, #1
	strh r0, [r4, #0x2c]
	ldr r0, [r4, #0x44]
	cmp r0, #0
	bne .L0804902E
	movs r1, #0x50
	rsbs r1, r1, #0
	movs r0, #0x2c
	ldrsh r3, [r4, r0]
	movs r2, #0x2e
	ldrsh r0, [r4, r2]
	str r0, [sp]
	movs r0, #1
	movs r2, #0
	bl Interpolate
	b .L08049044
.L0804902E:
	movs r2, #0x50
	rsbs r2, r2, #0
	movs r0, #0x2c
	ldrsh r3, [r4, r0]
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	str r0, [sp]
	movs r0, #4
	movs r1, #0
	bl Interpolate
.L08049044:
	lsls r2, r0, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	movs r1, #0
	bl SetBgOffset
.L08049050:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start _SetupBanim
_SetupBanim: @ 0x08049058
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x24
	movs r0, #1
	str r0, [sp, #0x18]
	ldr r1, .L0804907C @ =gBattleSt
	movs r0, #0x20
	ldrb r1, [r1, #1]
	ands r0, r1
	cmp r0, #0
	bne .L08049080
	movs r0, #0
	bl func_fe6_0804C4F4
	b .L08049086
	.align 2, 0
.L0804907C: .4byte gBattleSt
.L08049080:
	movs r0, #1
	bl func_fe6_0804C4F4
.L08049086:
	ldr r1, .L0804909C @ =gBmSt
	movs r0, #0x40
	ldrb r1, [r1, #4]
	ands r0, r1
	cmp r0, #0
	bne .L080490A0
	movs r0, #0
	bl SetBanimLinkArenaFlag
	b .L080490A6
	.align 2, 0
.L0804909C: .4byte gBmSt
.L080490A0:
	movs r0, #1
	bl SetBanimLinkArenaFlag
.L080490A6:
	ldr r1, .L080490C0 @ =gBattleSt
	movs r0, #0x10
	ldrb r1, [r1, #1]
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0
	beq .L080490C8
	ldr r1, .L080490C4 @ =gEkrDistanceType
	movs r0, #4
	strh r0, [r1]
	adds r0, r1, #0
	b .L080490CC
	.align 2, 0
.L080490C0: .4byte gBattleSt
.L080490C4: .4byte gEkrDistanceType
.L080490C8:
	ldr r0, .L080490F8 @ =gEkrDistanceType
	strh r2, [r0]
.L080490CC:
	ldrh r0, [r0]
	cmp r0, #4
	bne .L08049114
	ldr r1, .L080490FC @ =gpEkrBattleUnitLeft
	ldr r0, .L08049100 @ =gBattleUnitA
	str r0, [r1]
	str r0, [sp]
	ldr r1, .L08049104 @ =gpEkrBattleUnitRight
	ldr r0, .L08049108 @ =gBattleUnitB
	str r0, [r1]
	str r0, [sp, #4]
	ldr r1, .L0804910C @ =0x0203CCFC
	movs r0, #0
	strh r0, [r1, #2]
	strh r0, [r1]
	ldr r0, .L08049110 @ =gEkrPairSideVaild
	movs r1, #1
	strh r1, [r0]
	strh r1, [r0, #2]
	ldr r7, [sp]
	adds r3, r0, #0
	b .L0804920E
	.align 2, 0
.L080490F8: .4byte gEkrDistanceType
.L080490FC: .4byte gpEkrBattleUnitLeft
.L08049100: .4byte gBattleUnitA
.L08049104: .4byte gpEkrBattleUnitRight
.L08049108: .4byte gBattleUnitB
.L0804910C: .4byte 0x0203CCFC
.L08049110: .4byte gEkrPairSideVaild
.L08049114:
	ldr r5, .L0804914C @ =gBattleUnitA
	movs r4, #0x40
	rsbs r4, r4, #0
	adds r0, r4, #0
	ldrb r1, [r5, #0xb]
	ands r0, r1
	bl func_fe6_0804A500
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	ldr r0, .L08049150 @ =gBattleUnitB
	ldrb r0, [r0, #0xb]
	ands r4, r0
	adds r0, r4, #0
	bl func_fe6_0804A500
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	ldr r1, .L08049154 @ =gBattleSt
	movs r0, #0x40
	ldrb r1, [r1, #1]
	ands r0, r1
	cmp r0, #0
	beq .L08049158
	movs r2, #2
	str r2, [sp, #0x18]
	b .L0804917C
	.align 2, 0
.L0804914C: .4byte gBattleUnitA
.L08049150: .4byte gBattleUnitB
.L08049154: .4byte gBattleSt
.L08049158:
	adds r1, r5, #0
	adds r1, #0x4a
	ldrh r0, [r1]
	cmp r0, #0
	bne .L08049168
	movs r3, #2
	str r3, [sp, #0x18]
	b .L0804917C
.L08049168:
	ldrh r0, [r1]
	bl GetItemIid
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetWeaponAnimActorCount
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x18]
.L0804917C:
	ldr r1, .L080491D0 @ =gEkrPairSideVaild
	movs r0, #1
	strh r0, [r1, #2]
	strh r0, [r1]
	movs r4, #0
	bl GetBanimLinkArenaFlag
	cmp r0, #1
	beq .L080491A4
	lsls r0, r7, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0
	beq .L080491A2
	cmp r0, #2
	beq .L080491A2
	cmp r0, #1
	bne .L080491A4
	cmp r6, #1
	bne .L080491A4
.L080491A2:
	movs r4, #1
.L080491A4:
	adds r2, r4, #0
	cmp r2, #1
	bne .L080491E8
	ldr r1, .L080491D4 @ =gpEkrBattleUnitLeft
	ldr r0, .L080491D8 @ =gBattleUnitB
	str r0, [r1]
	str r0, [sp]
	ldr r1, .L080491DC @ =gpEkrBattleUnitRight
	ldr r0, .L080491E0 @ =gBattleUnitA
	str r0, [r1]
	str r0, [sp, #4]
	ldr r0, .L080491E4 @ =0x0203CCFC
	movs r1, #0
	strh r2, [r0]
	strh r1, [r0, #2]
	ldr r7, [sp, #4]
	ldr r3, .L080491D0 @ =gEkrPairSideVaild
	ldr r4, [sp, #0x18]
	cmp r4, #1
	bne .L0804920E
	strh r1, [r3]
	b .L0804920E
	.align 2, 0
.L080491D0: .4byte gEkrPairSideVaild
.L080491D4: .4byte gpEkrBattleUnitLeft
.L080491D8: .4byte gBattleUnitB
.L080491DC: .4byte gpEkrBattleUnitRight
.L080491E0: .4byte gBattleUnitA
.L080491E4: .4byte 0x0203CCFC
.L080491E8:
	ldr r1, .L080492C4 @ =gpEkrBattleUnitLeft
	ldr r0, .L080492C8 @ =gBattleUnitA
	str r0, [r1]
	str r0, [sp]
	ldr r1, .L080492CC @ =gpEkrBattleUnitRight
	ldr r0, .L080492D0 @ =gBattleUnitB
	str r0, [r1]
	str r0, [sp, #4]
	ldr r1, .L080492D4 @ =0x0203CCFC
	movs r2, #0
	strh r2, [r1]
	movs r0, #1
	strh r0, [r1, #2]
	ldr r7, [sp]
	ldr r3, .L080492D8 @ =gEkrPairSideVaild
	ldr r0, [sp, #0x18]
	cmp r0, #1
	bne .L0804920E
	strh r2, [r3, #2]
.L0804920E:
	ldr r1, [sp]
	str r1, [sp, #0x10]
	ldr r2, [sp, #4]
	mov sl, r2
	ldr r4, [r1]
	str r4, [sp, #8]
	ldr r0, [r2]
	str r0, [sp, #0xc]
	movs r1, #0
	mov sb, r1
	mov r8, r1
	ldrh r1, [r3, #2]
	ldrh r2, [r3]
	str r2, [sp, #0x14]
	movs r4, #0
	ldrsh r6, [r3, r4]
	cmp r6, #0
	beq .L0804923A
	ldr r2, [sp, #0x10]
	ldr r0, [r2, #4]
	ldr r0, [r0, #0x30]
	mov r8, r0
.L0804923A:
	lsls r0, r1, #0x10
	asrs r5, r0, #0x10
	str r0, [sp, #0x20]
	cmp r5, #0
	beq .L0804924C
	mov r3, sl
	ldr r0, [r3, #4]
	ldr r0, [r0, #0x30]
	mov sb, r0
.L0804924C:
	cmp r6, #0
	beq .L08049278
	ldr r3, .L080492DC @ =0x0203CD16
	ldr r4, [sp, #0x10]
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	lsls r0, r0, #4
	ldr r2, .L080492E0 @ =gBmSt
	movs r4, #0xc
	ldrsh r1, [r2, r4]
	subs r0, r0, r1
	asrs r0, r0, #4
	strh r0, [r3]
	ldr r1, [sp, #0x10]
	movs r0, #0xf
	ldrsb r0, [r1, r0]
	lsls r0, r0, #4
	movs r4, #0xe
	ldrsh r1, [r2, r4]
	subs r0, r0, r1
	asrs r0, r0, #4
	strh r0, [r3, #2]
.L08049278:
	cmp r5, #0
	beq .L080492A4
	ldr r3, .L080492DC @ =0x0203CD16
	mov r1, sl
	movs r0, #0xe
	ldrsb r0, [r1, r0]
	lsls r0, r0, #4
	ldr r2, .L080492E0 @ =gBmSt
	movs r4, #0xc
	ldrsh r1, [r2, r4]
	subs r0, r0, r1
	asrs r0, r0, #4
	strh r0, [r3, #4]
	mov r1, sl
	movs r0, #0xf
	ldrsb r0, [r1, r0]
	lsls r0, r0, #4
	movs r4, #0xe
	ldrsh r1, [r2, r4]
	subs r0, r0, r1
	asrs r0, r0, #4
	strh r0, [r3, #6]
.L080492A4:
	ldr r4, .L080492E4 @ =gEkrDistanceType
	ldrh r0, [r4]
	cmp r0, #4
	beq .L08049372
	adds r0, r7, #0
	adds r0, #0x4a
	ldrh r0, [r0]
	bl GetItemAttributes
	movs r1, #0x80
	ands r1, r0
	cmp r1, #0
	beq .L080492E8
	movs r0, #2
	strh r0, [r4]
	b .L0804936A
	.align 2, 0
.L080492C4: .4byte gpEkrBattleUnitLeft
.L080492C8: .4byte gBattleUnitA
.L080492CC: .4byte gpEkrBattleUnitRight
.L080492D0: .4byte gBattleUnitB
.L080492D4: .4byte 0x0203CCFC
.L080492D8: .4byte gEkrPairSideVaild
.L080492DC: .4byte 0x0203CD16
.L080492E0: .4byte gBmSt
.L080492E4: .4byte gEkrDistanceType
.L080492E8:
	movs r0, #3
	strh r0, [r4]
	adds r0, r6, r5
	cmp r0, #2
	bne .L0804936A
	ldr r0, .L0804930C @ =0x0203CD16
	movs r2, #0
	ldrsh r1, [r0, r2]
	movs r3, #4
	ldrsh r2, [r0, r3]
	subs r1, r1, r2
	adds r2, r0, #0
	cmp r1, #0
	blt .L08049310
	ldrh r4, [r2]
	ldrh r1, [r2, #4]
	subs r0, r4, r1
	b .L08049316
	.align 2, 0
.L0804930C: .4byte 0x0203CD16
.L08049310:
	ldrh r3, [r2, #4]
	ldrh r4, [r2]
	subs r0, r3, r4
.L08049316:
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r3, r0, #0
	movs r1, #2
	ldrsh r0, [r2, r1]
	movs r4, #6
	ldrsh r1, [r2, r4]
	subs r0, r0, r1
	cmp r0, #0
	blt .L08049330
	ldrh r1, [r2, #2]
	ldrh r4, [r2, #6]
	b .L08049334
.L08049330:
	ldrh r1, [r2, #6]
	ldrh r4, [r2, #2]
.L08049334:
	subs r0, r1, r4
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r1, r3, #0x10
	asrs r1, r1, #0x10
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	adds r0, r1, r0
	cmp r0, #1
	bgt .L08049354
	ldr r1, .L08049350 @ =gEkrDistanceType
	movs r0, #0
	b .L08049368
	.align 2, 0
.L08049350: .4byte gEkrDistanceType
.L08049354:
	cmp r0, #3
	bgt .L08049364
	ldr r1, .L08049360 @ =gEkrDistanceType
	movs r0, #1
	b .L08049368
	.align 2, 0
.L08049360: .4byte gEkrDistanceType
.L08049364:
	ldr r1, .L080493A0 @ =gEkrDistanceType
	movs r0, #2
.L08049368:
	strh r0, [r1]
.L0804936A:
	ldr r0, .L080493A0 @ =gEkrDistanceType
	ldrh r0, [r0]
	cmp r0, #4
	bne .L080493AC
.L08049372:
	ldr r0, [sp]
	adds r0, #0x48
	ldrh r1, [r0]
	mov r0, r8
	bl GetBattleAnimationId_WithUnique
	ldr r5, .L080493A4 @ =gBanimIdx
	ldr r4, .L080493A8 @ =gBanimIdx_bak
	strh r0, [r4]
	strh r0, [r5]
	ldr r0, [sp, #4]
	adds r0, #0x48
	ldrh r1, [r0]
	mov r0, sb
	bl GetBattleAnimationId_WithUnique
	strh r0, [r4, #2]
	strh r0, [r5, #2]
	ldr r0, [sp, #0x14]
	lsls r0, r0, #0x10
	str r0, [sp, #0x1c]
	b .L080493E4
	.align 2, 0
.L080493A0: .4byte gEkrDistanceType
.L080493A4: .4byte gBanimIdx
.L080493A8: .4byte gBanimIdx_bak
.L080493AC:
	ldr r1, [sp, #0x14]
	lsls r0, r1, #0x10
	str r0, [sp, #0x1c]
	cmp r0, #0
	beq .L080493CA
	ldr r0, [sp]
	adds r0, #0x4a
	ldrh r1, [r0]
	mov r0, r8
	bl GetBattleAnimationId_WithUnique
	ldr r2, .L08049514 @ =gBanimIdx
	ldr r1, .L08049518 @ =gBanimIdx_bak
	strh r0, [r1]
	strh r0, [r2]
.L080493CA:
	ldr r2, [sp, #0x20]
	cmp r2, #0
	beq .L080493E4
	ldr r0, [sp, #4]
	adds r0, #0x4a
	ldrh r1, [r0]
	mov r0, sb
	bl GetBattleAnimationId_WithUnique
	ldr r2, .L08049514 @ =gBanimIdx
	ldr r1, .L08049518 @ =gBanimIdx_bak
	strh r0, [r1, #2]
	strh r0, [r2, #2]
.L080493E4:
	ldr r3, [sp, #0x1c]
	asrs r7, r3, #0x10
	cmp r7, #0
	beq .L080493F6
	ldr r0, [sp, #0x10]
	bl func_fe6_0804A49C
	ldr r1, .L0804951C @ =gBanimUniquePal
	strh r0, [r1]
.L080493F6:
	ldr r4, [sp, #0x20]
	asrs r4, r4, #0x10
	mov r8, r4
	cmp r4, #0
	beq .L0804940A
	mov r0, sl
	bl func_fe6_0804A49C
	ldr r1, .L0804951C @ =gBanimUniquePal
	strh r0, [r1, #2]
.L0804940A:
	cmp r7, #0
	beq .L08049422
	ldr r0, .L08049514 @ =gBanimIdx
	movs r1, #0
	ldrsh r0, [r0, r1]
	ldr r1, [sp]
	adds r1, #0x4a
	ldrh r1, [r1]
	bl func_fe6_0804A4B8
	ldr r1, .L08049520 @ =0x0203CD90
	str r0, [r1]
.L08049422:
	mov r2, r8
	cmp r2, #0
	beq .L0804943C
	ldr r0, .L08049514 @ =gBanimIdx
	movs r3, #2
	ldrsh r0, [r0, r3]
	ldr r1, [sp, #4]
	adds r1, #0x4a
	ldrh r1, [r1]
	bl func_fe6_0804A4B8
	ldr r1, .L08049520 @ =0x0203CD90
	str r0, [r1, #4]
.L0804943C:
	ldr r4, .L08049524 @ =0x0203CDC0
	mov sb, r4
	ldr r2, [sp]
	adds r2, #0x53
	ldrb r0, [r2]
	strh r0, [r4]
	ldr r6, [sp, #4]
	adds r6, #0x53
	ldrb r0, [r6]
	strh r0, [r4, #2]
	ldr r5, .L08049528 @ =gBanimFloorfx
	ldr r1, .L0804952C @ =0x0000FFFF
	adds r0, r1, #0
	ldrh r1, [r5, #2]
	orrs r1, r0
	strh r1, [r5, #2]
	ldrh r3, [r5]
	orrs r0, r3
	strh r0, [r5]
	cmp r7, #0
	beq .L0804947E
	ldrb r4, [r2]
	ldr r0, .L08049530 @ =gPlaySt
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterInfo
	ldrb r1, [r0, #0x12]
	adds r0, r4, #0
	bl func_fe6_08049C5C
	strh r0, [r5]
.L0804947E:
	mov r4, r8
	cmp r4, #0
	beq .L0804949C
	ldrb r4, [r6]
	ldr r0, .L08049530 @ =gPlaySt
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterInfo
	ldrb r1, [r0, #0x12]
	adds r0, r4, #0
	bl func_fe6_08049C5C
	strh r0, [r5, #2]
.L0804949C:
	ldr r1, .L08049534 @ =gBmSt
	movs r0, #0x40
	ldrb r1, [r1, #4]
	ands r0, r1
	cmp r0, #0
	beq .L080494EA
	movs r0, #0x30
	mov r1, sb
	strh r0, [r1]
	strh r0, [r1, #2]
	cmp r7, #0
	beq .L080494CA
	ldr r0, .L08049530 @ =gPlaySt
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterInfo
	ldrb r1, [r0, #0x12]
	movs r0, #0x30
	bl func_fe6_08049C5C
	strh r0, [r5]
.L080494CA:
	mov r2, r8
	cmp r2, #0
	beq .L080494EA
	mov r3, sb
	ldrh r4, [r3, #2]
	ldr r0, .L08049530 @ =gPlaySt
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterInfo
	ldrb r1, [r0, #0x12]
	adds r0, r4, #0
	bl func_fe6_08049C5C
	strh r0, [r5, #2]
.L080494EA:
	ldr r0, .L08049538 @ =gEkrDistanceType
	movs r4, #0
	ldrsh r0, [r0, r4]
	cmp r0, #0
	blt .L08049502
	cmp r0, #3
	ble .L08049502
	cmp r0, #4
	bne .L08049502
	ldr r1, .L08049528 @ =gBanimFloorfx
	ldrh r0, [r1, #2]
	strh r0, [r1]
.L08049502:
	ldr r0, .L08049530 @ =gPlaySt
	ldrb r0, [r0, #0x15]
	cmp r0, #2
	bgt .L08049540
	cmp r0, #1
	blt .L08049540
	ldr r1, .L0804953C @ =gEkrSnowWeather
	movs r0, #1
	b .L08049544
	.align 2, 0
.L08049514: .4byte gBanimIdx
.L08049518: .4byte gBanimIdx_bak
.L0804951C: .4byte gBanimUniquePal
.L08049520: .4byte 0x0203CD90
.L08049524: .4byte 0x0203CDC0
.L08049528: .4byte gBanimFloorfx
.L0804952C: .4byte 0x0000FFFF
.L08049530: .4byte gPlaySt
.L08049534: .4byte gBmSt
.L08049538: .4byte gEkrDistanceType
.L0804953C: .4byte gEkrSnowWeather
.L08049540:
	ldr r1, .L080495C0 @ =gEkrSnowWeather
	movs r0, #0
.L08049544:
	strh r0, [r1]
	ldr r0, [sp, #0x1c]
	asrs r4, r0, #0x10
	cmp r4, #0
	beq .L0804955C
	ldr r0, .L080495C4 @ =0x0203CDC4
	ldr r2, [sp, #0x10]
	ldr r1, [r2, #4]
	ldrb r1, [r1, #0x11]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	strh r1, [r0]
.L0804955C:
	ldr r3, [sp, #0x20]
	asrs r5, r3, #0x10
	cmp r5, #0
	beq .L08049572
	ldr r0, .L080495C4 @ =0x0203CDC4
	mov r2, sl
	ldr r1, [r2, #4]
	ldrb r1, [r1, #0x11]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	strh r1, [r0, #2]
.L08049572:
	cmp r4, #0
	beq .L0804958E
	ldr r1, .L080495C8 @ =gEkrGaugeHp
	ldr r0, [sp]
	adds r0, #0x6e
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	strh r0, [r1]
	ldr r1, .L080495CC @ =0x0203CDA4
	ldr r3, [sp, #0x10]
	movs r0, #0x10
	ldrsb r0, [r3, r0]
	strh r0, [r1]
.L0804958E:
	cmp r5, #0
	beq .L080495AA
	ldr r1, .L080495C8 @ =gEkrGaugeHp
	ldr r0, [sp, #4]
	adds r0, #0x6e
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	strh r0, [r1, #2]
	ldr r1, .L080495CC @ =0x0203CDA4
	mov r2, sl
	movs r0, #0x10
	ldrsb r0, [r2, r0]
	strh r0, [r1, #2]
.L080495AA:
	bl ParseBattleHitToBanimCmd
	ldr r0, .L080495D0 @ =gEkrDistanceType
	ldrh r0, [r0]
	cmp r0, #4
	bne .L080495D8
	ldr r1, .L080495D4 @ =gEkrSpellAnimIndex
	movs r0, #1
	strh r0, [r1, #2]
	strh r0, [r1]
	b .L08049634
	.align 2, 0
.L080495C0: .4byte gEkrSnowWeather
.L080495C4: .4byte 0x0203CDC4
.L080495C8: .4byte gEkrGaugeHp
.L080495CC: .4byte 0x0203CDA4
.L080495D0: .4byte gEkrDistanceType
.L080495D4: .4byte gEkrSpellAnimIndex
.L080495D8:
	cmp r4, #0
	beq .L080495F0
	ldr r3, [sp, #0x10]
	ldr r0, [r3, #4]
	ldrb r0, [r0, #4]
	ldr r1, [sp]
	adds r1, #0x4a
	ldrh r1, [r1]
	bl func_fe6_08049D98
	ldr r1, .L08049918 @ =gEkrSpellAnimIndex
	strh r0, [r1]
.L080495F0:
	cmp r5, #0
	beq .L08049608
	mov r4, sl
	ldr r0, [r4, #4]
	ldrb r0, [r0, #4]
	ldr r1, [sp, #4]
	adds r1, #0x4a
	ldrh r1, [r1]
	bl func_fe6_08049D98
	ldr r1, .L08049918 @ =gEkrSpellAnimIndex
	strh r0, [r1, #2]
.L08049608:
	ldr r1, .L0804991C @ =gBattleSt
	movs r0, #0x40
	ldrb r1, [r1, #1]
	ands r0, r1
	cmp r0, #0
	beq .L08049634
	mov r1, sl
	ldr r0, [r1, #4]
	ldrb r0, [r0, #4]
	cmp r0, #0x36
	bne .L08049624
	ldr r1, .L08049918 @ =gEkrSpellAnimIndex
	movs r0, #0xe
	strh r0, [r1, #2]
.L08049624:
	mov r2, sl
	ldr r0, [r2, #4]
	ldrb r0, [r0, #4]
	cmp r0, #0x37
	bne .L08049634
	ldr r1, .L08049918 @ =gEkrSpellAnimIndex
	movs r0, #0xf
	strh r0, [r1, #2]
.L08049634:
	ldr r3, [sp, #0x1c]
	asrs r5, r3, #0x10
	cmp r5, #0
	beq .L0804964A
	ldr r0, .L08049918 @ =gEkrSpellAnimIndex
	ldr r1, [sp]
	adds r1, #0x4a
	ldrh r2, [r1]
	movs r1, #0
	bl func_fe6_08049E9C
.L0804964A:
	ldr r4, [sp, #0x20]
	cmp r4, #0
	beq .L0804965E
	ldr r0, .L08049920 @ =0x0203CD0E
	ldr r1, [sp, #4]
	adds r1, #0x4a
	ldrh r2, [r1]
	movs r1, #1
	bl func_fe6_08049E9C
.L0804965E:
	movs r0, #0
	bl GetEkrDragonJid
	movs r4, #0
	strh r4, [r0]
	movs r0, #1
	bl GetEkrDragonJid
	strh r4, [r0]
	ldr r0, .L08049924 @ =gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	blt .L08049730
	cmp r0, #2
	bgt .L08049730
	cmp r5, #0
	beq .L0804969A
	ldr r0, [sp]
	adds r0, #0x4a
	ldrh r0, [r0]
	bl GetItemIid
	adds r4, r0, #0
	cmp r4, #0x53
	bne .L0804969A
	movs r0, #0
	bl GetEkrDragonJid
	strh r4, [r0]
.L0804969A:
	ldr r2, [sp, #0x20]
	cmp r2, #0
	beq .L080496B8
	ldr r0, [sp, #4]
	adds r0, #0x4a
	ldrh r0, [r0]
	bl GetItemIid
	adds r4, r0, #0
	cmp r4, #0x53
	bne .L080496B8
	movs r0, #1
	bl GetEkrDragonJid
	strh r4, [r0]
.L080496B8:
	ldr r3, [sp, #0x1c]
	cmp r3, #0
	beq .L080496D6
	ldr r0, [sp]
	adds r0, #0x4a
	ldrh r0, [r0]
	bl GetItemIid
	adds r4, r0, #0
	cmp r4, #0x54
	bne .L080496D6
	movs r0, #0
	bl GetEkrDragonJid
	strh r4, [r0]
.L080496D6:
	ldr r4, [sp, #0x20]
	cmp r4, #0
	beq .L080496F4
	ldr r0, [sp, #4]
	adds r0, #0x4a
	ldrh r0, [r0]
	bl GetItemIid
	adds r4, r0, #0
	cmp r4, #0x54
	bne .L080496F4
	movs r0, #1
	bl GetEkrDragonJid
	strh r4, [r0]
.L080496F4:
	ldr r0, [sp, #0x1c]
	cmp r0, #0
	beq .L08049712
	ldr r0, [sp]
	adds r0, #0x4a
	ldrh r0, [r0]
	bl GetItemIid
	adds r4, r0, #0
	cmp r4, #0x70
	bne .L08049712
	movs r0, #0
	bl GetEkrDragonJid
	strh r4, [r0]
.L08049712:
	ldr r1, [sp, #0x20]
	cmp r1, #0
	beq .L08049730
	ldr r0, [sp, #4]
	adds r0, #0x4a
	ldrh r0, [r0]
	bl GetItemIid
	adds r4, r0, #0
	cmp r4, #0x70
	bne .L08049730
	movs r0, #1
	bl GetEkrDragonJid
	strh r4, [r0]
.L08049730:
	ldr r2, [sp, #0x1c]
	asrs r5, r2, #0x10
	cmp r5, #0
	beq .L0804974A
	movs r0, #0x40
	rsbs r0, r0, #0
	ldr r3, [sp, #0x10]
	ldrb r3, [r3, #0xb]
	ands r0, r3
	bl func_fe6_0804A500
	ldr r1, .L08049928 @ =gBanimFactionPal
	strh r0, [r1]
.L0804974A:
	ldr r0, [sp, #0x20]
	asrs r4, r0, #0x10
	cmp r4, #0
	beq .L08049764
	movs r0, #0x40
	rsbs r0, r0, #0
	mov r1, sl
	ldrb r1, [r1, #0xb]
	ands r0, r1
	bl func_fe6_0804A500
	ldr r1, .L08049928 @ =gBanimFactionPal
	strh r0, [r1, #2]
.L08049764:
	ldr r1, .L0804992C @ =gEkrPids
	movs r3, #0
	strb r3, [r1, #1]
	strb r3, [r1]
	cmp r5, #0
	beq .L08049776
	ldr r2, [sp, #8]
	ldrb r0, [r2, #4]
	strb r0, [r1]
.L08049776:
	cmp r4, #0
	beq .L08049780
	ldr r2, [sp, #0xc]
	ldrb r0, [r2, #4]
	strb r0, [r1, #1]
.L08049780:
	ldr r0, .L08049930 @ =0x0203CDAC
	mov r8, r0
	cmp r5, #0
	beq .L08049792
	ldr r0, [sp]
	adds r0, #0x62
	ldrh r0, [r0]
	mov r1, r8
	strh r0, [r1]
.L08049792:
	cmp r4, #0
	beq .L080497A0
	ldr r0, [sp, #4]
	adds r0, #0x62
	ldrh r0, [r0]
	mov r2, r8
	strh r0, [r2, #2]
.L080497A0:
	mov r4, r8
	ldrh r0, [r4]
	adds r1, r0, #0
	cmp r1, #0xff
	bne .L080497AE
	ldr r0, .L08049934 @ =0x0000FFFF
	strh r0, [r4]
.L080497AE:
	mov r2, r8
	ldrh r0, [r2, #2]
	adds r4, r0, #0
	cmp r4, #0xff
	bne .L080497BC
	ldr r0, .L08049934 @ =0x0000FFFF
	strh r0, [r2, #2]
.L080497BC:
	cmp r5, #0
	beq .L080497E4
	ldr r2, .L08049938 @ =0x0203CDB0
	ldr r1, [sp]
	adds r1, #0x58
	ldr r0, [sp, #4]
	adds r0, #0x5a
	ldrh r4, [r1]
	ldrh r0, [r0]
	subs r0, r4, r0
	strh r0, [r2]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge .L080497DA
	strh r3, [r2]
.L080497DA:
	ldrh r1, [r1]
	cmp r1, #0xff
	bne .L080497E4
	ldr r0, .L08049934 @ =0x0000FFFF
	strh r0, [r2]
.L080497E4:
	ldr r0, [sp, #0x20]
	cmp r0, #0
	beq .L08049810
	ldr r2, .L08049938 @ =0x0203CDB0
	ldr r1, [sp, #4]
	adds r1, #0x58
	ldr r0, [sp]
	adds r0, #0x5a
	ldrh r3, [r1]
	ldrh r0, [r0]
	subs r0, r3, r0
	strh r0, [r2, #2]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge .L08049806
	movs r0, #0
	strh r0, [r2, #2]
.L08049806:
	ldrh r1, [r1]
	cmp r1, #0xff
	bne .L08049810
	ldr r0, .L08049934 @ =0x0000FFFF
	strh r0, [r2, #2]
.L08049810:
	ldr r4, [sp, #0x1c]
	asrs r7, r4, #0x10
	ldr r3, .L0804993C @ =0x0203CDB4
	cmp r7, #0
	beq .L08049822
	ldr r0, [sp]
	adds r0, #0x68
	ldrh r0, [r0]
	strh r0, [r3]
.L08049822:
	ldr r0, [sp, #0x20]
	asrs r6, r0, #0x10
	cmp r6, #0
	beq .L08049832
	ldr r0, [sp, #4]
	adds r0, #0x68
	ldrh r0, [r0]
	strh r0, [r3, #2]
.L08049832:
	adds r1, r3, #0
	ldrh r0, [r1]
	cmp r0, #0xff
	bne .L0804983E
	ldr r0, .L08049934 @ =0x0000FFFF
	strh r0, [r1]
.L0804983E:
	ldrh r0, [r1, #2]
	cmp r0, #0xff
	bne .L08049848
	ldr r0, .L08049934 @ =0x0000FFFF
	strh r0, [r1, #2]
.L08049848:
	ldr r0, .L08049924 @ =gEkrDistanceType
	ldrh r0, [r0]
	cmp r0, #4
	bne .L0804986A
	ldr r2, .L08049934 @ =0x0000FFFF
	adds r1, r2, #0
	mov r4, r8
	ldrh r0, [r4, #2]
	orrs r0, r1
	strh r0, [r4, #2]
	ldr r2, .L08049938 @ =0x0203CDB0
	ldrh r0, [r2, #2]
	orrs r0, r1
	strh r0, [r2, #2]
	ldrh r0, [r3, #2]
	orrs r1, r0
	strh r1, [r3, #2]
.L0804986A:
	cmp r7, #0
	beq .L0804987C
	ldr r1, .L08049940 @ =gEkrPairExpPrevious
	ldr r0, [sp]
	adds r0, #0x6d
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	strh r0, [r1]
.L0804987C:
	cmp r6, #0
	beq .L0804988E
	ldr r1, .L08049940 @ =gEkrPairExpPrevious
	ldr r0, [sp, #4]
	adds r0, #0x6d
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	strh r0, [r1, #2]
.L0804988E:
	cmp r7, #0
	beq .L080498A0
	ldr r1, .L08049944 @ =gEkrPairExpGain
	ldr r0, [sp]
	adds r0, #0x6a
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	strh r0, [r1]
.L080498A0:
	cmp r6, #0
	beq .L080498B2
	ldr r1, .L08049944 @ =gEkrPairExpGain
	ldr r0, [sp, #4]
	adds r0, #0x6a
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	strh r0, [r1, #2]
.L080498B2:
	ldr r1, .L08049948 @ =0x0203CDC8
	movs r5, #0
	strh r5, [r1, #2]
	strh r5, [r1]
	cmp r7, #0
	beq .L080498CA
	ldr r0, [sp]
	adds r0, #0x51
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	strh r0, [r1]
.L080498CA:
	cmp r6, #0
	beq .L080498DA
	ldr r0, [sp, #4]
	adds r0, #0x51
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	strh r0, [r1, #2]
.L080498DA:
	ldr r4, .L0804994C @ =gEkrPairEffectiveAgainst
	strh r5, [r4, #2]
	strh r5, [r4]
	cmp r7, #0
	beq .L080498F6
	ldr r0, [sp]
	adds r0, #0x48
	ldrh r0, [r0]
	mov r1, sl
	bl IsItemEffectiveAgainst
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	strh r0, [r4]
.L080498F6:
	cmp r6, #0
	beq .L0804990C
	ldr r0, [sp, #4]
	adds r0, #0x48
	ldrh r0, [r0]
	ldr r1, [sp, #0x10]
	bl IsItemEffectiveAgainst
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	strh r0, [r4, #2]
.L0804990C:
	ldr r4, .L08049950 @ =0x0203CD98
	str r5, [r4, #4]
	str r5, [r4]
	cmp r7, #0
	b .L08049954
	.align 2, 0
.L08049918: .4byte gEkrSpellAnimIndex
.L0804991C: .4byte gBattleSt
.L08049920: .4byte 0x0203CD0E
.L08049924: .4byte gEkrDistanceType
.L08049928: .4byte gBanimFactionPal
.L0804992C: .4byte gEkrPids
.L08049930: .4byte 0x0203CDAC
.L08049934: .4byte 0x0000FFFF
.L08049938: .4byte 0x0203CDB0
.L0804993C: .4byte 0x0203CDB4
.L08049940: .4byte gEkrPairExpPrevious
.L08049944: .4byte gEkrPairExpGain
.L08049948: .4byte 0x0203CDC8
.L0804994C: .4byte gEkrPairEffectiveAgainst
.L08049950: .4byte 0x0203CD98
.L08049954:
	beq .L08049994
	ldr r0, [sp]
	adds r0, #0x4a
	ldrh r0, [r0]
	bl GetItemIid
	cmp r0, #0x32
	bgt .L08049994
	cmp r0, #0x30
	blt .L08049994
	ldr r1, [sp, #0x10]
	ldr r0, [r1, #4]
	ldrb r0, [r0, #4]
	cmp r0, #0x11
	beq .L08049980
	cmp r0, #0x11
	ble .L08049994
	cmp r0, #0x12
	beq .L08049988
	cmp r0, #0x13
	beq .L08049990
	b .L08049994
.L08049980:
	ldr r0, .L08049984 @ =gUnk_08113FF8
	b .L08049992
	.align 2, 0
.L08049984: .4byte gUnk_08113FF8
.L08049988:
	ldr r0, .L0804998C @ =gUnk_0811446C
	b .L08049992
	.align 2, 0
.L0804998C: .4byte gUnk_0811446C
.L08049990:
	ldr r0, .L080499C4 @ =gUnk_0811490C
.L08049992:
	str r0, [r4]
.L08049994:
	ldr r2, [sp, #0x20]
	cmp r2, #0
	beq .L080499EE
	ldr r0, [sp, #4]
	adds r0, #0x4a
	ldrh r0, [r0]
	bl GetItemIid
	cmp r0, #0x32
	bgt .L080499EE
	cmp r0, #0x30
	blt .L080499EE
	mov r3, sl
	ldr r0, [r3, #4]
	ldrb r0, [r0, #4]
	cmp r0, #0x11
	beq .L080499C8
	cmp r0, #0x11
	ble .L080499EE
	cmp r0, #0x12
	beq .L080499D8
	cmp r0, #0x13
	beq .L080499E8
	b .L080499EE
	.align 2, 0
.L080499C4: .4byte gUnk_0811490C
.L080499C8:
	ldr r1, .L080499D0 @ =0x0203CD98
	ldr r0, .L080499D4 @ =gUnk_08113FF8
	b .L080499EC
	.align 2, 0
.L080499D0: .4byte 0x0203CD98
.L080499D4: .4byte gUnk_08113FF8
.L080499D8:
	ldr r1, .L080499E0 @ =0x0203CD98
	ldr r0, .L080499E4 @ =gUnk_0811446C
	b .L080499EC
	.align 2, 0
.L080499E0: .4byte 0x0203CD98
.L080499E4: .4byte gUnk_0811446C
.L080499E8:
	ldr r1, .L08049A08 @ =0x0203CD98
	ldr r0, .L08049A0C @ =gUnk_0811490C
.L080499EC:
	str r0, [r1, #4]
.L080499EE:
	bl GetBanimLinkArenaFlag
	cmp r0, #1
	beq .L08049A00
	ldr r0, .L08049A10 @ =gPlaySt
	ldrb r0, [r0, #0x1c]
	lsls r0, r0, #0x1f
	cmp r0, #0
	beq .L08049A18
.L08049A00:
	ldr r1, .L08049A14 @ =0x0203CDD0
	movs r0, #1
	b .L08049A1C
	.align 2, 0
.L08049A08: .4byte 0x0203CD98
.L08049A0C: .4byte gUnk_0811490C
.L08049A10: .4byte gPlaySt
.L08049A14: .4byte 0x0203CDD0
.L08049A18:
	ldr r1, .L08049A40 @ =0x0203CDD0
	movs r0, #0
.L08049A1C:
	strh r0, [r1, #2]
	strh r0, [r1]
	ldr r5, .L08049A44 @ =gBanimBackgroundIndex
	movs r0, #0
	strh r0, [r5]
	bl GetBattleAnimType
	cmp r0, #3
	bne .L08049A6A
	ldr r0, .L08049A48 @ =gEkrPairSideVaild
	movs r4, #0
	ldrsh r0, [r0, r4]
	cmp r0, #0
	beq .L08049A50
	ldr r0, .L08049A4C @ =0x0203CDC0
	ldrh r4, [r0]
	b .L08049A54
	.align 2, 0
.L08049A40: .4byte 0x0203CDD0
.L08049A44: .4byte gBanimBackgroundIndex
.L08049A48: .4byte gEkrPairSideVaild
.L08049A4C: .4byte 0x0203CDC0
.L08049A50:
	ldr r0, .L08049B78 @ =0x0203CDC0
	ldrh r4, [r0, #2]
.L08049A54:
	ldr r0, .L08049B7C @ =gPlaySt
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterInfo
	ldrb r1, [r0, #0x12]
	adds r0, r4, #0
	bl func_fe6_08049CFC
	strh r0, [r5]
.L08049A6A:
	movs r4, #0
	bl GetBattleAnimType
	cmp r0, #0
	bne .L08049A76
	movs r4, #1
.L08049A76:
	bl GetBattleAnimType
	cmp r0, #3
	bne .L08049A80
	movs r4, #1
.L08049A80:
	bl GetBattleAnimType
	cmp r0, #1
	bne .L08049AC8
	ldr r0, .L08049B80 @ =gEkrDistanceType
	ldrh r0, [r0]
	cmp r0, #4
	bne .L08049A92
	movs r4, #1
.L08049A92:
	bl GetBattleAnimArenaFlag
	cmp r0, #1
	bne .L08049A9C
	movs r4, #1
.L08049A9C:
	ldr r1, [sp, #0x10]
	ldr r0, [r1]
	ldrb r0, [r0, #4]
	cmp r0, #0x64
	bne .L08049AB2
	ldr r0, .L08049B84 @ =gBanimFactionPal
	movs r2, #0
	ldrsh r0, [r0, r2]
	cmp r0, #0
	beq .L08049AB2
	movs r4, #1
.L08049AB2:
	mov r3, sl
	ldr r0, [r3]
	ldrb r0, [r0, #4]
	cmp r0, #0x64
	bne .L08049AC8
	ldr r0, .L08049B84 @ =gBanimFactionPal
	movs r1, #2
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq .L08049AC8
	movs r4, #1
.L08049AC8:
	ldr r2, [sp, #0x10]
	ldr r0, [r2]
	ldrb r1, [r0, #4]
	cmp r1, #0x42
	beq .L08049B72
	mov r3, sl
	ldr r0, [r3]
	ldrb r0, [r0, #4]
	cmp r0, #0x42
	beq .L08049B72
	ldr r0, [sp, #0x18]
	cmp r0, #1
	beq .L08049AE6
	cmp r1, #0x66
	beq .L08049B98
.L08049AE6:
	cmp r4, #0
	beq .L08049B72
	ldr r0, .L08049B88 @ =gEkrPairSideVaild
	adds r3, r0, #0
	ldrh r1, [r3]
	cmp r1, #1
	bne .L08049B30
	ldr r1, [sp, #0x10]
	adds r1, #0x2e
	movs r0, #0xf
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #4
	beq .L08049B72
	ldr r0, .L08049B8C @ =gBanimIdx
	movs r2, #0
	ldrsh r0, [r0, r2]
	movs r2, #1
	rsbs r2, r2, #0
	cmp r0, r2
	beq .L08049B72
	ldr r0, .L08049B90 @ =gEkrSpellAnimIndex
	movs r4, #0
	ldrsh r1, [r0, r4]
	movs r0, #2
	rsbs r0, r0, #0
	cmp r1, r0
	beq .L08049B72
	ldr r0, .L08049B94 @ =gBanimFloorfx
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, r2
	beq .L08049B72
	ldr r0, .L08049B78 @ =0x0203CDC0
	ldrh r0, [r0]
	cmp r0, #0x1b
	beq .L08049B72
.L08049B30:
	ldrh r3, [r3, #2]
	cmp r3, #1
	bne .L08049B98
	mov r1, sl
	adds r1, #0x2e
	movs r0, #0xf
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #4
	beq .L08049B72
	ldr r0, .L08049B8C @ =gBanimIdx
	movs r2, #2
	ldrsh r0, [r0, r2]
	movs r2, #1
	rsbs r2, r2, #0
	cmp r0, r2
	beq .L08049B72
	ldr r0, .L08049B90 @ =gEkrSpellAnimIndex
	movs r3, #2
	ldrsh r1, [r0, r3]
	movs r0, #2
	rsbs r0, r0, #0
	cmp r1, r0
	beq .L08049B72
	ldr r0, .L08049B94 @ =gBanimFloorfx
	movs r4, #2
	ldrsh r0, [r0, r4]
	cmp r0, r2
	beq .L08049B72
	ldr r0, .L08049B78 @ =0x0203CDC0
	ldrh r0, [r0, #2]
	cmp r0, #0x1b
	bne .L08049B98
.L08049B72:
	movs r0, #0
	b .L08049B9A
	.align 2, 0
.L08049B78: .4byte 0x0203CDC0
.L08049B7C: .4byte gPlaySt
.L08049B80: .4byte gEkrDistanceType
.L08049B84: .4byte gBanimFactionPal
.L08049B88: .4byte gEkrPairSideVaild
.L08049B8C: .4byte gBanimIdx
.L08049B90: .4byte gEkrSpellAnimIndex
.L08049B94: .4byte gBanimFloorfx
.L08049B98:
	movs r0, #1
.L08049B9A:
	add sp, #0x24
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start GetBattleAnimationId_WithUnique
GetBattleAnimationId_WithUnique: @ 0x08049BAC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov sl, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov r8, r1
	movs r0, #0
	mov sb, r0
	mov r2, sl
	cmp r2, #0
	beq .L08049BD4
	mov r0, r8
	bl GetItemKind
	cmp r0, #9
	bne .L08049BDC
.L08049BD4:
	ldr r0, .L08049BD8 @ =0x0000FFFF
	b .L08049C4A
	.align 2, 0
.L08049BD8: .4byte 0x0000FFFF
.L08049BDC:
	mov r3, r8
	cmp r3, #0
	bne .L08049BE6
	movs r1, #9
	b .L08049BF0
.L08049BE6:
	mov r0, r8
	bl GetItemKind
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
.L08049BF0:
	movs r6, #0
	movs r7, #0
.L08049BF4:
	mov r5, sl
	b .L08049C32
.L08049BF8:
	cmp r6, #0
	bne .L08049C00
	cmp r0, #0xff
	bhi .L08049C30
.L08049C00:
	cmp r6, #1
	bne .L08049C0A
	ldrh r0, [r5]
	cmp r0, #0xff
	bls .L08049C30
.L08049C0A:
	ldrh r4, [r5]
	mov r0, r8
	str r1, [sp]
	bl GetItemIid
	ldr r1, [sp]
	cmp r4, r0
	beq .L08049C24
	ldrh r2, [r5]
	ldr r3, .L08049C2C @ =0xFFFFFF00
	adds r0, r2, r3
	cmp r0, r1
	bne .L08049C30
.L08049C24:
	ldrh r5, [r5, #2]
	mov sb, r5
	movs r7, #1
	b .L08049C38
	.align 2, 0
.L08049C2C: .4byte 0xFFFFFF00
.L08049C30:
	adds r5, #4
.L08049C32:
	ldrh r0, [r5]
	cmp r0, #0
	bne .L08049BF8
.L08049C38:
	cmp r7, #1
	beq .L08049C42
	adds r6, #1
	cmp r6, #1
	ble .L08049BF4
.L08049C42:
	mov r0, sb
	subs r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
.L08049C4A:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start func_fe6_08049C5C
func_fe6_08049C5C: @ 0x08049C5C
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #9
	bhi .L08049CE8
	lsls r0, r0, #2
	ldr r1, .L08049C74 @ =.L08049C78
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
.L08049C74: .4byte .L08049C78
.L08049C78: @ jump table
	.4byte .L08049CE8 @ case 0
	.4byte .L08049CA0 @ case 1
	.4byte .L08049CA8 @ case 2
	.4byte .L08049CB0 @ case 3
	.4byte .L08049CB8 @ case 4
	.4byte .L08049CC0 @ case 5
	.4byte .L08049CC8 @ case 6
	.4byte .L08049CD0 @ case 7
	.4byte .L08049CD8 @ case 8
	.4byte .L08049CE0 @ case 9
.L08049CA0:
	ldr r0, .L08049CA4 @ =Terrain_BanimUnk_0860CC42
	b .L08049CEA
	.align 2, 0
.L08049CA4: .4byte Terrain_BanimUnk_0860CC42
.L08049CA8:
	ldr r0, .L08049CAC @ =Terrain_BanimUnk_0860CC75
	b .L08049CEA
	.align 2, 0
.L08049CAC: .4byte Terrain_BanimUnk_0860CC75
.L08049CB0:
	ldr r0, .L08049CB4 @ =Terrain_BanimUnk_0860CCA8
	b .L08049CEA
	.align 2, 0
.L08049CB4: .4byte Terrain_BanimUnk_0860CCA8
.L08049CB8:
	ldr r0, .L08049CBC @ =Terrain_BanimUnk_0860CCDB
	b .L08049CEA
	.align 2, 0
.L08049CBC: .4byte Terrain_BanimUnk_0860CCDB
.L08049CC0:
	ldr r0, .L08049CC4 @ =Terrain_BanimUnk_0860CD0E
	b .L08049CEA
	.align 2, 0
.L08049CC4: .4byte Terrain_BanimUnk_0860CD0E
.L08049CC8:
	ldr r0, .L08049CCC @ =Terrain_BanimUnk_0860CD41
	b .L08049CEA
	.align 2, 0
.L08049CCC: .4byte Terrain_BanimUnk_0860CD41
.L08049CD0:
	ldr r0, .L08049CD4 @ =Terrain_BanimUnk_0860CD74
	b .L08049CEA
	.align 2, 0
.L08049CD4: .4byte Terrain_BanimUnk_0860CD74
.L08049CD8:
	ldr r0, .L08049CDC @ =Terrain_BanimUnk_0860CDA7
	b .L08049CEA
	.align 2, 0
.L08049CDC: .4byte Terrain_BanimUnk_0860CDA7
.L08049CE0:
	ldr r0, .L08049CE4 @ =Terrain_BanimUnk_0860CDDA
	b .L08049CEA
	.align 2, 0
.L08049CE4: .4byte Terrain_BanimUnk_0860CDDA
.L08049CE8:
	ldr r0, .L08049CF8 @ =Terrain_BanimUnk_0860CC0F
.L08049CEA:
	adds r0, r2, r0
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, #1
	bx lr
	.align 2, 0
.L08049CF8: .4byte Terrain_BanimUnk_0860CC0F

	thumb_func_start func_fe6_08049CFC
func_fe6_08049CFC: @ 0x08049CFC
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #9
	bhi .L08049D88
	lsls r0, r0, #2
	ldr r1, .L08049D14 @ =.L08049D18
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
.L08049D14: .4byte .L08049D18
.L08049D18: @ jump table
	.4byte .L08049D88 @ case 0
	.4byte .L08049D40 @ case 1
	.4byte .L08049D48 @ case 2
	.4byte .L08049D50 @ case 3
	.4byte .L08049D58 @ case 4
	.4byte .L08049D60 @ case 5
	.4byte .L08049D68 @ case 6
	.4byte .L08049D70 @ case 7
	.4byte .L08049D78 @ case 8
	.4byte .L08049D80 @ case 9
.L08049D40:
	ldr r0, .L08049D44 @ =Terrain_BanimUnk_0860CE40
	b .L08049D8A
	.align 2, 0
.L08049D44: .4byte Terrain_BanimUnk_0860CE40
.L08049D48:
	ldr r0, .L08049D4C @ =Terrain_BanimUnk_0860CE73
	b .L08049D8A
	.align 2, 0
.L08049D4C: .4byte Terrain_BanimUnk_0860CE73
.L08049D50:
	ldr r0, .L08049D54 @ =Terrain_BanimUnk_0860CEA6
	b .L08049D8A
	.align 2, 0
.L08049D54: .4byte Terrain_BanimUnk_0860CEA6
.L08049D58:
	ldr r0, .L08049D5C @ =Terrain_BanimUnk_0860CED9
	b .L08049D8A
	.align 2, 0
.L08049D5C: .4byte Terrain_BanimUnk_0860CED9
.L08049D60:
	ldr r0, .L08049D64 @ =Terrain_BanimUnk_0860CF0C
	b .L08049D8A
	.align 2, 0
.L08049D64: .4byte Terrain_BanimUnk_0860CF0C
.L08049D68:
	ldr r0, .L08049D6C @ =Terrain_BanimUnk_0860CF3F
	b .L08049D8A
	.align 2, 0
.L08049D6C: .4byte Terrain_BanimUnk_0860CF3F
.L08049D70:
	ldr r0, .L08049D74 @ =Terrain_BanimUnk_0860CF72
	b .L08049D8A
	.align 2, 0
.L08049D74: .4byte Terrain_BanimUnk_0860CF72
.L08049D78:
	ldr r0, .L08049D7C @ =Terrain_BanimUnk_0860CFA5
	b .L08049D8A
	.align 2, 0
.L08049D7C: .4byte Terrain_BanimUnk_0860CFA5
.L08049D80:
	ldr r0, .L08049D84 @ =Terrain_BanimUnk_0860CFD8
	b .L08049D8A
	.align 2, 0
.L08049D84: .4byte Terrain_BanimUnk_0860CFD8
.L08049D88:
	ldr r0, .L08049D94 @ =Terrain_BanimUnk_0860CE0D
.L08049D8A:
	adds r0, r2, r0
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bx lr
	.align 2, 0
.L08049D94: .4byte Terrain_BanimUnk_0860CE0D

	thumb_func_start func_fe6_08049D98
func_fe6_08049D98: @ 0x08049D98
	push {r4, lr}
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	adds r0, r1, #0
	bl GetItemIid
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r3, .L08049DB4 @ =gUnk_08662E4C
	ldrh r1, [r3]
	ldr r2, .L08049DB8 @ =0x0000FFFF
	b .L08049DC0
	.align 2, 0
.L08049DB4: .4byte gUnk_08662E4C
.L08049DB8: .4byte 0x0000FFFF
.L08049DBC:
	adds r3, #0x10
	ldrh r1, [r3]
.L08049DC0:
	cmp r1, r2
	beq .L08049DC8
	cmp r1, r0
	bne .L08049DBC
.L08049DC8:
	ldrh r2, [r3, #4]
	ldrh r3, [r3, #4]
	cmp r3, #3
	bne .L08049E92
	adds r0, r4, #0
	subs r0, #0xe
	cmp r0, #0x22
	bhi .L08049E92
	lsls r0, r0, #2
	ldr r1, .L08049DE4 @ =.L08049DE8
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
.L08049DE4: .4byte .L08049DE8
.L08049DE8: @ jump table
	.4byte .L08049E90 @ case 0
	.4byte .L08049E90 @ case 1
	.4byte .L08049E92 @ case 2
	.4byte .L08049E92 @ case 3
	.4byte .L08049E92 @ case 4
	.4byte .L08049E92 @ case 5
	.4byte .L08049E92 @ case 6
	.4byte .L08049E92 @ case 7
	.4byte .L08049E92 @ case 8
	.4byte .L08049E92 @ case 9
	.4byte .L08049E92 @ case 10
	.4byte .L08049E92 @ case 11
	.4byte .L08049E92 @ case 12
	.4byte .L08049E92 @ case 13
	.4byte .L08049E92 @ case 14
	.4byte .L08049E92 @ case 15
	.4byte .L08049E92 @ case 16
	.4byte .L08049E92 @ case 17
	.4byte .L08049E74 @ case 18
	.4byte .L08049E74 @ case 19
	.4byte .L08049E7C @ case 20
	.4byte .L08049E7C @ case 21
	.4byte .L08049E92 @ case 22
	.4byte .L08049E92 @ case 23
	.4byte .L08049E92 @ case 24
	.4byte .L08049E92 @ case 25
	.4byte .L08049E92 @ case 26
	.4byte .L08049E92 @ case 27
	.4byte .L08049E80 @ case 28
	.4byte .L08049E84 @ case 29
	.4byte .L08049E88 @ case 30
	.4byte .L08049E88 @ case 31
	.4byte .L08049E8C @ case 32
	.4byte .L08049E8C @ case 33
	.4byte .L08049E78 @ case 34
.L08049E74:
	movs r2, #4
	b .L08049E92
.L08049E78:
	movs r2, #5
	b .L08049E92
.L08049E7C:
	movs r2, #6
	b .L08049E92
.L08049E80:
	movs r2, #7
	b .L08049E92
.L08049E84:
	movs r2, #8
	b .L08049E92
.L08049E88:
	movs r2, #9
	b .L08049E92
.L08049E8C:
	movs r2, #0xa
	b .L08049E92
.L08049E90:
	movs r2, #0xb
.L08049E92:
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start func_fe6_08049E9C
func_fe6_08049E9C: @ 0x08049E9C
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r0, r2, #0
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x10
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetItemIid
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	movs r0, #0
	ldrsh r1, [r4, r0]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne .L08049EC2
	movs r0, #0
	strh r0, [r4]
.L08049EC2:
	ldr r0, .L08049EE0 @ =gEkrInitialHitSide
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, r5
	beq .L08049F14
	adds r0, r2, #0
	subs r0, #0x48
	cmp r0, #9
	bhi .L08049F14
	lsls r0, r0, #2
	ldr r1, .L08049EE4 @ =.L08049EE8
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
.L08049EE0: .4byte gEkrInitialHitSide
.L08049EE4: .4byte .L08049EE8
.L08049EE8: @ jump table
	.4byte .L08049F10 @ case 0
	.4byte .L08049F10 @ case 1
	.4byte .L08049F14 @ case 2
	.4byte .L08049F14 @ case 3
	.4byte .L08049F14 @ case 4
	.4byte .L08049F10 @ case 5
	.4byte .L08049F14 @ case 6
	.4byte .L08049F10 @ case 7
	.4byte .L08049F14 @ case 8
	.4byte .L08049F10 @ case 9
.L08049F10:
	movs r0, #0
	strh r0, [r4]
.L08049F14:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start ParseBattleHitToBanimCmd
ParseBattleHitToBanimCmd: @ 0x08049F1C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x24
	ldr r0, .L08049F58 @ =gBattleHits
	str r0, [sp, #4]
	ldr r0, .L08049F5C @ =gpEkrTriangleUnits
	movs r3, #0
	str r3, [r0, #4]
	str r3, [r0]
	ldr r2, .L08049F60 @ =gEkrDistanceType
	movs r5, #0
	ldrsh r1, [r2, r5]
	cmp r1, #4
	bne .L08049F6C
	ldr r0, .L08049F64 @ =0x0203CD1E
	strh r1, [r0]
	strh r1, [r0, #2]
	ldr r2, .L08049F68 @ =0x0000FFFF
	adds r1, r2, #0
	ldrh r2, [r0, #4]
	orrs r2, r1
	strh r2, [r0, #4]
	ldrh r5, [r0, #6]
	orrs r1, r5
	strh r1, [r0, #6]
	b .L0804A46E
	.align 2, 0
.L08049F58: .4byte gBattleHits
.L08049F5C: .4byte gpEkrTriangleUnits
.L08049F60: .4byte gEkrDistanceType
.L08049F64: .4byte 0x0203CD1E
.L08049F68: .4byte 0x0000FFFF
.L08049F6C:
	ldr r1, .L08049F94 @ =gBattleSt
	movs r0, #0x40
	ldrb r1, [r1, #1]
	ands r0, r1
	cmp r0, #0
	beq .L08049FA0
	ldr r2, .L08049F98 @ =0x0203CD1E
	movs r0, #6
	strh r0, [r2]
	strh r3, [r2, #2]
	ldr r1, .L08049F9C @ =0x0000FFFF
	adds r0, r1, #0
	ldrh r1, [r2, #4]
	orrs r1, r0
	strh r1, [r2, #4]
	ldrh r5, [r2, #6]
	orrs r0, r5
	strh r0, [r2, #6]
	b .L0804A46E
	.align 2, 0
.L08049F94: .4byte gBattleSt
.L08049F98: .4byte 0x0203CD1E
.L08049F9C: .4byte 0x0000FFFF
.L08049FA0:
	ldrh r2, [r2]
	str r2, [sp, #0x18]
	str r2, [sp, #0x1c]
	movs r0, #0
	str r0, [sp, #0x20]
	ldr r0, .L0804A0A4 @ =gpEkrBattleUnitLeft
	ldr r0, [r0]
	str r0, [sp, #8]
	ldr r0, .L0804A0A8 @ =gpEkrBattleUnitRight
	ldr r0, [r0]
	str r0, [sp, #0xc]
	ldr r0, [sp, #8]
	adds r0, #0x4a
	ldrh r0, [r0]
	bl GetItemIid
	cmp r0, #0x7d
	bne .L08049FCE
	ldr r1, [sp, #0x18]
	cmp r1, #0
	bne .L08049FCE
	movs r2, #1
	str r2, [sp, #0x18]
.L08049FCE:
	ldr r4, [sp, #0xc]
	adds r4, #0x4a
	ldrh r0, [r4]
	bl GetItemIid
	adds r5, r4, #0
	cmp r0, #0x7d
	bne .L08049FE8
	ldr r0, [sp, #0x1c]
	cmp r0, #0
	bne .L08049FE8
	movs r1, #1
	str r1, [sp, #0x1c]
.L08049FE8:
	ldr r4, [sp, #8]
	adds r4, #0x4a
	ldrh r0, [r4]
	bl GetItemIid
	cmp r0, #0x20
	bne .L0804A000
	ldr r2, [sp, #0x18]
	cmp r2, #0
	bne .L0804A000
	movs r0, #1
	str r0, [sp, #0x18]
.L0804A000:
	ldrh r0, [r5]
	bl GetItemIid
	cmp r0, #0x20
	bne .L0804A014
	ldr r1, [sp, #0x1c]
	cmp r1, #0
	bne .L0804A014
	movs r2, #1
	str r2, [sp, #0x1c]
.L0804A014:
	ldrh r0, [r4]
	bl GetItemIid
	cmp r0, #0x7f
	bne .L0804A028
	ldr r0, [sp, #0x18]
	cmp r0, #0
	bne .L0804A028
	movs r1, #1
	str r1, [sp, #0x18]
.L0804A028:
	ldrh r0, [r5]
	bl GetItemIid
	cmp r0, #0x7f
	bne .L0804A03C
	ldr r2, [sp, #0x1c]
	cmp r2, #0
	bne .L0804A03C
	movs r5, #1
	str r5, [sp, #0x1c]
.L0804A03C:
	ldrh r0, [r4]
	bl GetItemIid
	cmp r0, #0x53
	bne .L0804A050
	ldr r0, [sp, #0x18]
	cmp r0, #0
	bne .L0804A050
	movs r1, #1
	str r1, [sp, #0x18]
.L0804A050:
	ldrh r0, [r4]
	bl GetItemIid
	cmp r0, #0x70
	bne .L0804A05E
	movs r2, #1
	str r2, [sp, #0x20]
.L0804A05E:
	movs r2, #0
	ldr r4, .L0804A0AC @ =0x0203CD4A
	ldr r5, .L0804A0B0 @ =gEkrGaugeHp
	ldr r0, .L0804A0B4 @ =0x0000FFFF
	adds r3, r0, #0
	ldr r1, .L0804A0B8 @ =0x0203CD1E
.L0804A06A:
	ldrh r0, [r1]
	orrs r0, r3
	strh r0, [r1]
	adds r1, #2
	adds r2, #1
	cmp r2, #0x13
	bls .L0804A06A
	movs r2, #0
	ldr r0, .L0804A0AC @ =0x0203CD4A
	ldr r1, .L0804A0B4 @ =0x0000FFFF
	adds r3, r1, #0
	adds r1, r0, #4
.L0804A082:
	ldrh r0, [r1]
	orrs r0, r3
	strh r0, [r1]
	adds r1, #2
	adds r2, #1
	cmp r2, #0x13
	bls .L0804A082
	ldrh r0, [r5]
	strh r0, [r4]
	ldrh r0, [r5, #2]
	strh r0, [r4, #2]
	movs r2, #0
	str r2, [sp, #0x10]
	mov r8, r2
	movs r7, #0
	ldr r5, [sp, #4]
	b .L0804A462
	.align 2, 0
.L0804A0A4: .4byte gpEkrBattleUnitLeft
.L0804A0A8: .4byte gpEkrBattleUnitRight
.L0804A0AC: .4byte 0x0203CD4A
.L0804A0B0: .4byte gEkrGaugeHp
.L0804A0B4: .4byte 0x0000FFFF
.L0804A0B8: .4byte 0x0203CD1E
.L0804A0BC:
	movs r0, #8
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	rsbs r0, r0, #0
	lsrs r0, r0, #0x1f
	str r0, [sp, #0x14]
	ldr r0, .L0804A0F4 @ =0x0203CCFC
	movs r1, #0
	ldrsh r0, [r0, r1]
	ldr r2, [sp, #0x14]
	cmp r0, r2
	bne .L0804A0FC
	mov r5, sp
	movs r0, #2
	add r0, sp
	mov sb, r0
	ldr r4, [sp, #0x18]
	ldr r1, [sp, #0x1c]
	mov sl, r1
	ldr r6, [sp, #8]
	ldr r3, [sp, #0x20]
	ldr r2, [sp, #0x10]
	cmp r2, #0
	bne .L0804A118
	ldr r0, .L0804A0F8 @ =gEkrInitialHitSide
	strh r2, [r0]
	b .L0804A118
	.align 2, 0
.L0804A0F4: .4byte 0x0203CCFC
.L0804A0F8: .4byte gEkrInitialHitSide
.L0804A0FC:
	mov r5, sp
	adds r5, #2
	mov sb, sp
	ldr r4, [sp, #0x1c]
	ldr r0, [sp, #0x18]
	mov sl, r0
	ldr r6, [sp, #0xc]
	movs r3, #0
	ldr r1, [sp, #0x10]
	cmp r1, #0
	bne .L0804A118
	ldr r1, .L0804A150 @ =gEkrInitialHitSide
	movs r0, #1
	strh r0, [r1]
.L0804A118:
	movs r2, #0x80
	lsls r2, r2, #3
	adds r0, r2, #0
	ldr r1, [sp, #4]
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq .L0804A134
	ldr r2, .L0804A154 @ =gpEkrTriangleUnits
	ldr r1, .L0804A158 @ =gBattleSt
	ldr r0, [r1, #0xc]
	str r0, [r2]
	ldr r0, [r1, #0x10]
	str r0, [r2, #4]
.L0804A134:
	movs r0, #1
	ldr r2, [sp, #4]
	ldrh r2, [r2]
	ands r0, r2
	cmp r0, #0
	beq .L0804A168
	adds r0, r6, #0
	bl UnitKnowsMagic
	lsls r0, r0, #0x18
	cmp r0, #0
	bne .L0804A160
	ldr r0, .L0804A15C @ =gUnk_08112248
	b .L0804A1B6
	.align 2, 0
.L0804A150: .4byte gEkrInitialHitSide
.L0804A154: .4byte gpEkrTriangleUnits
.L0804A158: .4byte gBattleSt
.L0804A15C: .4byte gUnk_08112248
.L0804A160:
	ldr r0, .L0804A164 @ =gUnk_08112270
	b .L0804A1B6
	.align 2, 0
.L0804A164: .4byte gUnk_08112270
.L0804A168:
	cmp r3, #0
	bne .L0804A188
	adds r0, r6, #0
	bl UnitKnowsMagic
	lsls r0, r0, #0x18
	cmp r0, #0
	bne .L0804A180
	ldr r0, .L0804A17C @ =gUnk_08112234
	b .L0804A1B6
	.align 2, 0
.L0804A17C: .4byte gUnk_08112234
.L0804A180:
	ldr r0, .L0804A184 @ =gUnk_08112266
	b .L0804A1B6
	.align 2, 0
.L0804A184: .4byte gUnk_08112266
.L0804A188:
	movs r0, #2
	bl func_fe6_0805B9C8
	cmp r0, #1
	beq .L0804A1AC
	cmp r0, #1
	bgt .L0804A19C
	cmp r0, #0
	beq .L0804A1A2
	b .L0804A1C0
.L0804A19C:
	cmp r0, #2
	beq .L0804A1B4
	b .L0804A1C0
.L0804A1A2:
	ldr r0, .L0804A1A8 @ =gUnk_0811227A
	b .L0804A1B6
	.align 2, 0
.L0804A1A8: .4byte gUnk_0811227A
.L0804A1AC:
	ldr r0, .L0804A1B0 @ =gUnk_08112284
	b .L0804A1B6
	.align 2, 0
.L0804A1B0: .4byte gUnk_08112284
.L0804A1B4:
	ldr r0, .L0804A1DC @ =gUnk_0811228E
.L0804A1B6:
	lsls r1, r4, #0x10
	asrs r1, r1, #0xf
	adds r1, r1, r0
	ldrh r0, [r1]
	strh r0, [r5]
.L0804A1C0:
	movs r0, #2
	ldr r1, [sp, #4]
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq .L0804A1FC
	adds r0, r6, #0
	bl UnitKnowsMagic
	lsls r0, r0, #0x18
	cmp r0, #0
	bne .L0804A1E4
	ldr r0, .L0804A1E0 @ =gUnk_0811223E
	b .L0804A1E6
	.align 2, 0
.L0804A1DC: .4byte gUnk_0811228E
.L0804A1E0: .4byte gUnk_0811223E
.L0804A1E4:
	ldr r0, .L0804A1F4 @ =gUnk_08112266
.L0804A1E6:
	lsls r1, r4, #0x10
	asrs r1, r1, #0xf
	adds r1, r1, r0
	ldrh r0, [r1]
	strh r0, [r5]
	ldr r0, .L0804A1F8 @ =gUnk_08112252
	b .L0804A1FE
	.align 2, 0
.L0804A1F4: .4byte gUnk_08112266
.L0804A1F8: .4byte gUnk_08112252
.L0804A1FC:
	ldr r0, .L0804A27C @ =gUnk_0811225C
.L0804A1FE:
	mov r2, sl
	lsls r1, r2, #0x10
	asrs r1, r1, #0xf
	adds r1, r1, r0
	ldrh r0, [r1]
	mov r5, sb
	strh r0, [r5]
	ldr r1, .L0804A280 @ =0x0203CD1E
	ldr r2, [sp, #0x10]
	lsls r0, r2, #2
	adds r5, r0, r1
	mov r0, sp
	ldrh r0, [r0]
	movs r6, #0
	strh r0, [r5]
	lsls r0, r2, #1
	adds r0, #1
	lsls r0, r0, #1
	adds r4, r0, r1
	mov r1, sp
	ldrh r0, [r1, #2]
	strh r0, [r4]
	ldr r2, [sp, #4]
	ldrh r1, [r2]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq .L0804A238
	b .L0804A456
.L0804A238:
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq .L0804A2D0
	ldr r0, .L0804A284 @ =0x0203CCFC
	movs r1, #0
	ldrsh r0, [r0, r1]
	ldr r2, [sp, #0x14]
	cmp r0, r2
	bne .L0804A290
	lsls r0, r7, #1
	bl GetEfxHp
	ldr r2, [sp, #4]
	movs r1, #3
	ldrsb r1, [r2, r1]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r0, #0
	bge .L0804A264
	movs r2, #0
.L0804A264:
	adds r0, r7, #1
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	lsls r0, r7, #2
	ldr r1, .L0804A288 @ =0x0203CD4A
	adds r0, r0, r1
	strh r2, [r0]
	ldr r2, .L0804A28C @ =0xFFFF8000
	adds r0, r2, #0
	ldrh r1, [r5]
	orrs r0, r1
	b .L0804A454
	.align 2, 0
.L0804A27C: .4byte gUnk_0811225C
.L0804A280: .4byte 0x0203CD1E
.L0804A284: .4byte 0x0203CCFC
.L0804A288: .4byte 0x0203CD4A
.L0804A28C: .4byte 0xFFFF8000
.L0804A290:
	mov r2, r8
	lsls r0, r2, #1
	adds r0, #1
	bl GetEfxHp
	ldr r5, [sp, #4]
	movs r1, #3
	ldrsb r1, [r5, r1]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r0, #0
	bge .L0804A2AC
	movs r2, #0
.L0804A2AC:
	mov r0, r8
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	lsls r0, r0, #1
	adds r0, #1
	lsls r0, r0, #1
	ldr r1, .L0804A2C8 @ =0x0203CD4A
	adds r0, r0, r1
	strh r2, [r0]
	ldr r2, .L0804A2CC @ =0xFFFF8000
	b .L0804A406
	.align 2, 0
.L0804A2C8: .4byte 0x0203CD4A
.L0804A2CC: .4byte 0xFFFF8000
.L0804A2D0:
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	beq .L0804A3B8
	ldr r0, .L0804A344 @ =0x0203CCFC
	movs r5, #0
	ldrsh r0, [r0, r5]
	ldr r1, [sp, #0x14]
	cmp r0, r1
	bne .L0804A350
	mov r2, r8
	lsls r0, r2, #1
	adds r0, #1
	bl GetEfxHp
	ldr r5, [sp, #4]
	movs r1, #3
	ldrsb r1, [r5, r1]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r0, #0
	bge .L0804A304
	movs r2, #0
.L0804A304:
	mov r0, r8
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	ldr r4, .L0804A348 @ =0x0203CD4A
	lsls r0, r0, #1
	adds r0, #1
	lsls r0, r0, #1
	adds r0, r0, r4
	strh r2, [r0]
	lsls r0, r7, #1
	bl GetEfxHp
	ldr r2, [sp, #4]
	movs r1, #3
	ldrsb r1, [r2, r1]
	adds r0, r0, r1
	lsls r0, r0, #0x10
	ldr r3, .L0804A34C @ =0x0203CDA4
	lsrs r2, r0, #0x10
	ldrh r5, [r3]
	lsls r1, r5, #0x10
	cmp r0, r1
	ble .L0804A338
	ldrh r2, [r3]
.L0804A338:
	adds r0, r7, #1
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	lsls r0, r7, #2
	b .L0804A3A8
	.align 2, 0
.L0804A344: .4byte 0x0203CCFC
.L0804A348: .4byte 0x0203CD4A
.L0804A34C: .4byte 0x0203CDA4
.L0804A350:
	lsls r0, r7, #1
	bl GetEfxHp
	ldr r2, [sp, #4]
	movs r1, #3
	ldrsb r1, [r2, r1]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r0, #0
	bge .L0804A368
	movs r2, #0
.L0804A368:
	adds r0, r7, #1
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	ldr r4, .L0804A3B0 @ =0x0203CD4A
	lsls r0, r7, #2
	adds r0, r0, r4
	strh r2, [r0]
	mov r5, r8
	lsls r0, r5, #1
	adds r0, #1
	bl GetEfxHp
	ldr r2, [sp, #4]
	movs r1, #3
	ldrsb r1, [r2, r1]
	adds r0, r0, r1
	lsls r0, r0, #0x10
	ldr r3, .L0804A3B4 @ =0x0203CDA4
	lsrs r2, r0, #0x10
	ldrh r5, [r3, #2]
	lsls r1, r5, #0x10
	cmp r0, r1
	ble .L0804A398
	ldrh r2, [r3, #2]
.L0804A398:
	mov r0, r8
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	lsls r0, r0, #1
	adds r0, #1
	lsls r0, r0, #1
.L0804A3A8:
	adds r0, r0, r4
	strh r2, [r0]
	b .L0804A456
	.align 2, 0
.L0804A3B0: .4byte 0x0203CD4A
.L0804A3B4: .4byte 0x0203CDA4
.L0804A3B8:
	ldr r0, .L0804A410 @ =0x0203CCFC
	movs r1, #0
	ldrsh r0, [r0, r1]
	ldr r2, [sp, #0x14]
	cmp r0, r2
	bne .L0804A418
	mov r5, r8
	lsls r0, r5, #1
	adds r0, #1
	bl GetEfxHp
	ldr r2, [sp, #4]
	movs r1, #3
	ldrsb r1, [r2, r1]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r0, #0
	bge .L0804A3E0
	movs r2, #0
.L0804A3E0:
	mov r0, r8
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	lsls r0, r0, #1
	adds r0, #1
	lsls r0, r0, #1
	ldr r5, .L0804A414 @ =0x0203CD4A
	adds r0, r0, r5
	strh r2, [r0]
	movs r0, #0x40
	ldr r1, [sp, #4]
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq .L0804A456
	movs r2, #0x80
	lsls r2, r2, #6
.L0804A406:
	adds r0, r2, #0
	ldrh r5, [r4]
	orrs r0, r5
	strh r0, [r4]
	b .L0804A456
	.align 2, 0
.L0804A410: .4byte 0x0203CCFC
.L0804A414: .4byte 0x0203CD4A
.L0804A418:
	lsls r0, r7, #1
	bl GetEfxHp
	ldr r2, [sp, #4]
	movs r1, #3
	ldrsb r1, [r2, r1]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r0, #0
	bge .L0804A430
	movs r2, #0
.L0804A430:
	adds r0, r7, #1
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	lsls r0, r7, #2
	ldr r1, .L0804A480 @ =0x0203CD4A
	adds r0, r0, r1
	strh r2, [r0]
	movs r0, #0x40
	ldr r2, [sp, #4]
	ldrh r2, [r2]
	ands r0, r2
	cmp r0, #0
	beq .L0804A456
	movs r1, #0x80
	lsls r1, r1, #6
	adds r0, r1, #0
	ldrh r2, [r5]
	orrs r0, r2
.L0804A454:
	strh r0, [r5]
.L0804A456:
	ldr r5, [sp, #4]
	adds r5, #4
	str r5, [sp, #4]
	ldr r0, [sp, #0x10]
	adds r0, #1
	str r0, [sp, #0x10]
.L0804A462:
	ldrb r1, [r5, #2]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne .L0804A46E
	b .L0804A0BC
.L0804A46E:
	add sp, #0x24
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0804A480: .4byte 0x0203CD4A

	thumb_func_start func_fe6_0804A484
func_fe6_0804A484: @ 0x0804A484
	ldr r1, .L0804A494 @ =gBattleHits
	movs r0, #2
	ldrb r1, [r1, #2]
	ands r0, r1
	cmp r0, #0
	bne .L0804A498
	movs r0, #0
	b .L0804A49A
	.align 2, 0
.L0804A494: .4byte gBattleHits
.L0804A498:
	movs r0, #1
.L0804A49A:
	bx lr

	thumb_func_start func_fe6_0804A49C
func_fe6_0804A49C: @ 0x0804A49C
	ldr r2, [r0]
	ldr r1, [r0, #4]
	ldr r0, [r2, #0x28]
	ldr r1, [r1, #0x24]
	orrs r0, r1
	lsrs r0, r0, #8
	movs r1, #1
	ands r0, r1
	adds r2, #0x23
	adds r2, r2, r0
	ldrb r0, [r2]
	subs r0, #1
	bx lr
	.align 2, 0

	thumb_func_start func_fe6_0804A4B8
func_fe6_0804A4B8: @ 0x0804A4B8
	push {lr}
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x67
	bne .L0804A4F8
	adds r0, r1, #0
	bl GetItemIid
	cmp r0, #0x31
	beq .L0804A4E8
	cmp r0, #0x31
	bgt .L0804A4DA
	cmp r0, #0x30
	beq .L0804A4E0
	b .L0804A4F8
.L0804A4DA:
	cmp r0, #0x32
	beq .L0804A4F0
	b .L0804A4F8
.L0804A4E0:
	ldr r0, .L0804A4E4 @ =gUnk_08113FB8
	b .L0804A4FA
	.align 2, 0
.L0804A4E4: .4byte gUnk_08113FB8
.L0804A4E8:
	ldr r0, .L0804A4EC @ =gUnk_08113F98
	b .L0804A4FA
	.align 2, 0
.L0804A4EC: .4byte gUnk_08113F98
.L0804A4F0:
	ldr r0, .L0804A4F4 @ =gUnk_08113FD8
	b .L0804A4FA
	.align 2, 0
.L0804A4F4: .4byte gUnk_08113FD8
.L0804A4F8:
	movs r0, #0
.L0804A4FA:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start func_fe6_0804A500
func_fe6_0804A500: @ 0x0804A500
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, r0, #0
	cmp r0, #0x40
	beq .L0804A51C
	cmp r0, #0x40
	ble .L0804A524
	cmp r1, #0x80
	beq .L0804A518
	cmp r1, #0xc0
	beq .L0804A520
	b .L0804A524
.L0804A518:
	movs r0, #1
	b .L0804A526
.L0804A51C:
	movs r0, #2
	b .L0804A526
.L0804A520:
	movs r0, #3
	b .L0804A526
.L0804A524:
	movs r0, #0
.L0804A526:
	bx lr

	thumb_func_start EkrPrepareBanimfx
EkrPrepareBanimfx: @ 0x0804A528
	push {r4, r5, lr}
	adds r5, r0, #0
	lsls r4, r1, #0x10
	lsrs r4, r4, #0x10
	bl GetAnimPosition
	ldr r1, .L0804A550 @ =gBanimIdx
	lsls r0, r0, #1
	adds r0, r0, r1
	strh r4, [r0]
	bl UpdateBanimFrame
	adds r0, r5, #0
	movs r1, #6
	bl SwitchAISFrameDataFromBARoundType
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0804A550: .4byte gBanimIdx

	thumb_func_start GetBattleAnimRoundType
GetBattleAnimRoundType: @ 0x0804A554
	ldr r1, .L0804A570 @ =0x0203CD1E
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r2, [r0]
	movs r3, #0
	ldrsh r1, [r0, r3]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq .L0804A578
	ldr r0, .L0804A574 @ =0x00000FFF
	ands r0, r2
	b .L0804A57A
	.align 2, 0
.L0804A570: .4byte 0x0203CD1E
.L0804A574: .4byte 0x00000FFF
.L0804A578:
	adds r0, r1, #0
.L0804A57A:
	bx lr

	thumb_func_start GetBattleAnimRoundTypeFlags
GetBattleAnimRoundTypeFlags: @ 0x0804A57C
	ldr r1, .L0804A59C @ =0x0203CD1E
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r2, [r0]
	movs r3, #0
	ldrsh r1, [r0, r3]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq .L0804A5A4
	ldr r0, .L0804A5A0 @ =0xFFFFF000
	ands r0, r2
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	b .L0804A5A6
	.align 2, 0
.L0804A59C: .4byte 0x0203CD1E
.L0804A5A0: .4byte 0xFFFFF000
.L0804A5A4:
	movs r0, #0
.L0804A5A6:
	bx lr

	thumb_func_start GetEfxHp
GetEfxHp: @ 0x0804A5A8
	ldr r1, .L0804A5B8 @ =0x0203CD4A
	lsls r0, r0, #1
	adds r0, r0, r1
	ldr r1, .L0804A5BC @ =0x00000FFF
	ldrh r0, [r0]
	ands r1, r0
	adds r0, r1, #0
	bx lr
	.align 2, 0
.L0804A5B8: .4byte 0x0203CD4A
.L0804A5BC: .4byte 0x00000FFF

	thumb_func_start func_fe6_0804A5C0
func_fe6_0804A5C0: @ 0x0804A5C0
	ldr r1, .L0804A5D4 @ =0x0203CD4A
	lsls r0, r0, #1
	adds r0, r0, r1
	ldr r1, .L0804A5D8 @ =0xFFFFF000
	ldrh r0, [r0]
	ands r1, r0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r0, r1, #0
	bx lr
	.align 2, 0
.L0804A5D4: .4byte 0x0203CD4A
.L0804A5D8: .4byte 0xFFFFF000

	thumb_func_start BattleAIS_ExecCommands
BattleAIS_ExecCommands: @ 0x0804A5DC
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	movs r2, #0
.L00804A5E8: @ 0x0804A5E8
	ldr r1, .L0804A640 @ =gAnims
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r7, [r0]
	adds r2, #1
	mov sb, r2
	cmp r7, #0
	bne .L0804A5FC
	bl .L0804AF52
.L0804A5FC:
	movs r0, #0xf0
	lsls r0, r0, #8
	ldrh r1, [r7, #0xc]
	ands r1, r0
	mov r8, r1
	cmp r1, #0
	bne .L0804A60E
	bl .L0804AF52
.L0804A60E:
	movs r0, #0x80
	lsls r0, r0, #5
	ands r0, r1
	cmp r0, #0
	bne .L0804A61A
	b .L0804AD94
.L0804A61A:
	ldrb r0, [r7, #0x14]
	cmp r0, #0
	bne .L0804A622
	b .L0804AD8A
.L0804A622:
	subs r1, r0, #1
	adds r2, r7, #0
	adds r2, #0x15
	adds r1, r2, r1
	ldrb r1, [r1]
	adds r3, r0, #0
	cmp r1, #0x4a
	bls .L0804A634
	b .L0804AD82
.L0804A634:
	lsls r0, r1, #2
	ldr r1, .L0804A644 @ =.L0804A648
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
.L0804A640: .4byte gAnims
.L0804A644: .4byte .L0804A648
.L0804A648: @ jump table
	.4byte .L0804AD82 @ case 0
	.4byte .L0804A774 @ case 1
	.4byte .L0804A7B4 @ case 2
	.4byte .L0804A7C8 @ case 3
	.4byte .L0804A7EE @ case 4
	.4byte .L0804A874 @ case 5
	.4byte .L0804A8C8 @ case 6
	.4byte .L0804AD82 @ case 7
	.4byte .L0804A8F8 @ case 8
	.4byte .L0804A8F8 @ case 9
	.4byte .L0804A8F8 @ case 10
	.4byte .L0804A8F8 @ case 11
	.4byte .L0804A8F8 @ case 12
	.4byte .L0804A968 @ case 13
	.4byte .L0804AD82 @ case 14
	.4byte .L0804AD82 @ case 15
	.4byte .L0804AD82 @ case 16
	.4byte .L0804AD82 @ case 17
	.4byte .L0804AD82 @ case 18
	.4byte .L0804AB08 @ case 19
	.4byte .L0804AB38 @ case 20
	.4byte .L0804AB4C @ case 21
	.4byte .L0804AD82 @ case 22
	.4byte .L0804AD82 @ case 23
	.4byte .L0804AB60 @ case 24
	.4byte .L0804AD60 @ case 25
	.4byte .L0804AB9C @ case 26
	.4byte .L0804AD60 @ case 27
	.4byte .L0804AD60 @ case 28
	.4byte .L0804AD60 @ case 29
	.4byte .L0804AD60 @ case 30
	.4byte .L0804AD60 @ case 31
	.4byte .L0804AD60 @ case 32
	.4byte .L0804AD60 @ case 33
	.4byte .L0804AD60 @ case 34
	.4byte .L0804AD60 @ case 35
	.4byte .L0804AD60 @ case 36
	.4byte .L0804AD60 @ case 37
	.4byte .L0804ABF2 @ case 38
	.4byte .L0804AC08 @ case 39
	.4byte .L0804AD60 @ case 40
	.4byte .L0804AD60 @ case 41
	.4byte .L0804AD60 @ case 42
	.4byte .L0804AD60 @ case 43
	.4byte .L0804AC1E @ case 44
	.4byte .L0804AC32 @ case 45
	.4byte .L0804AC3A @ case 46
	.4byte .L0804AC50 @ case 47
	.4byte .L0804AC66 @ case 48
	.4byte .L0804AC7C @ case 49
	.4byte .L0804AC92 @ case 50
	.4byte .L0804AD60 @ case 51
	.4byte .L0804AD60 @ case 52
	.4byte .L0804AD60 @ case 53
	.4byte .L0804AD60 @ case 54
	.4byte .L0804AD60 @ case 55
	.4byte .L0804AD60 @ case 56
	.4byte .L0804ACA6 @ case 57
	.4byte .L0804ACEC @ case 58
	.4byte .L0804AD14 @ case 59
	.4byte .L0804AD60 @ case 60
	.4byte .L0804AD60 @ case 61
	.4byte .L0804AD60 @ case 62
	.4byte .L0804AD60 @ case 63
	.4byte .L0804AD60 @ case 64
	.4byte .L0804AD60 @ case 65
	.4byte .L0804AD60 @ case 66
	.4byte .L0804AD60 @ case 67
	.4byte .L0804AD3C @ case 68
	.4byte .L0804AD4E @ case 69
	.4byte .L0804AD60 @ case 70
	.4byte .L0804AD6E @ case 71
	.4byte .L0804AD76 @ case 72
	.4byte .L0804AD76 @ case 73
	.4byte .L0804AD76 @ case 74
.L0804A774:
	ldr r0, .L0804A784 @ =gAnimC01Blocking
	ldr r0, [r0]
	cmp r0, #1
	bne .L0804A788
	ldr r0, [r7, #0x24]
	str r0, [r7, #0x20]
	b .L0804AD82
	.align 2, 0
.L0804A784: .4byte gAnimC01Blocking
.L0804A788:
	ldrh r1, [r7, #0x10]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne .L0804A794
	b .L0804ACDC
.L0804A794:
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	bne .L0804A79E
	b .L0804AD82
.L0804A79E:
	bl func_fe6_080449C4
	cmp r0, #1
	beq .L0804A7A8
	b .L0804AD82
.L0804A7A8:
	ldr r0, .L0804A7B0 @ =0x0000FFF2
	ldrh r2, [r7, #0x10]
	ands r0, r2
	b .L0804ACDA
	.align 2, 0
.L0804A7B0: .4byte 0x0000FFF2
.L0804A7B4:
	ldrh r1, [r7, #0x10]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne .L0804A7C0
	b .L0804AD82
.L0804A7C0:
	ldr r0, .L0804A7C4 @ =0x0000FFFE
	b .L0804ACD8
	.align 2, 0
.L0804A7C4: .4byte 0x0000FFFE
.L0804A7C8:
	ldrh r1, [r7, #0x10]
	movs r2, #0x20
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	bne .L0804A7EA
	adds r0, r2, #0
	orrs r0, r1
	strh r0, [r7, #0x10]
	adds r0, r7, #0
	bl GetAnimLayer
	cmp r0, #0
	bne .L0804A7EA
	adds r0, r7, #0
	bl func_fe6_08057860
.L0804A7EA:
	ldrh r1, [r7, #0x10]
	b .L0804ACCA
.L0804A7EE:
	ldrh r1, [r7, #0x10]
	movs r2, #0x20
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	bne .L0804A804
	adds r0, r2, #0
	orrs r0, r1
	movs r1, #0x40
	orrs r0, r1
	strh r0, [r7, #0x10]
.L0804A804:
	ldrh r2, [r7, #0x10]
	movs r0, #0x40
	ands r0, r2
	cmp r0, #0
	bne .L0804A810
	b .L0804AD82
.L0804A810:
	ldr r1, .L0804A86C @ =0x0000FFDF
	ands r1, r2
	ldr r0, .L0804A870 @ =0x0000FFBF
	ands r1, r0
	ldr r0, [r7, #0x20]
	adds r0, #4
	str r0, [r7, #0x20]
	movs r5, #9
	movs r6, #0
	orrs r1, r5
	strh r1, [r7, #0x10]
	adds r0, r7, #0
	bl GetAnimAnotherSide
	adds r2, r0, #0
	adds r0, r7, #0
	str r2, [sp]
	bl GetAnimRoundTypeAnotherSide
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	mov r8, r0
	mov r4, r8
	adds r0, r4, #0
	bl CheckRoundMiss
	ldr r2, [sp]
	cmp r0, #1
	beq .L0804A84C
	b .L0804AD82
.L0804A84C:
	cmp r2, #0
	bne .L0804A852
	b .L0804AD82
.L0804A852:
	ldrh r0, [r2, #0x10]
	orrs r0, r5
	strh r0, [r2, #0x10]
	adds r0, r7, #0
	str r2, [sp]
	bl GetAnimLayer
	cmp r0, #0
	beq .L0804A866
	b .L0804AD82
.L0804A866:
	adds r0, r4, #0
	b .L0804A958
	.align 2, 0
.L0804A86C: .4byte 0x0000FFDF
.L0804A870: .4byte 0x0000FFBF
.L0804A874:
	ldrh r1, [r7, #0x10]
	movs r2, #0x20
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	bne .L0804A88A
	adds r0, r2, #0
	orrs r0, r1
	movs r1, #0x40
	orrs r0, r1
	strh r0, [r7, #0x10]
.L0804A88A:
	ldrh r2, [r7, #0x10]
	movs r0, #0x40
	ands r0, r2
	cmp r0, #0
	bne .L0804A896
	b .L0804AD82
.L0804A896:
	ldr r1, .L0804A8C0 @ =0x0000FFDF
	ands r1, r2
	ldr r0, .L0804A8C4 @ =0x0000FFBF
	ands r1, r0
	ldr r0, [r7, #0x20]
	adds r0, #4
	str r0, [r7, #0x20]
	movs r0, #9
	orrs r1, r0
	strh r1, [r7, #0x10]
	adds r0, r7, #0
	bl GetAnimLayer
	cmp r0, #0
	beq .L0804A8B6
	b .L0804AD82
.L0804A8B6:
	adds r0, r7, #0
	bl StartSpellAnimation
	b .L0804AD82
	.align 2, 0
.L0804A8C0: .4byte 0x0000FFDF
.L0804A8C4: .4byte 0x0000FFBF
.L0804A8C8:
	adds r0, r7, #0
	bl GetAnimAnotherSide
	adds r2, r0, #0
	cmp r2, #0
	bne .L0804A8D6
	b .L0804AD82
.L0804A8D6:
	str r2, [sp]
	bl GetAnimNextRoundTypeAnotherSide
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	mov r8, r0
	movs r0, #1
	rsbs r0, r0, #0
	ldr r2, [sp]
	cmp r8, r0
	bne .L0804A8EE
	b .L0804AD82
.L0804A8EE:
	movs r0, #2
	ldrh r3, [r2, #0x10]
	orrs r0, r3
	strh r0, [r2, #0x10]
	b .L0804AD82
.L0804A8F8:
	adds r0, r7, #0
	bl GetAnimLayer
	cmp r0, #0
	beq .L0804A904
	b .L0804AD82
.L0804A904:
	adds r0, r7, #0
	bl GetAnimAnotherSide
	adds r2, r0, #0
	adds r0, r7, #0
	str r2, [sp]
	bl GetAnimRoundTypeAnotherSide
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	mov r8, r0
	bl CheckRoundMiss
	ldr r2, [sp]
	cmp r0, #0
	bne .L0804A93C
	adds r0, r2, #0
	bl func_fe6_0805C308
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r2, [sp]
	cmp r0, #2
	beq .L0804A93C
	adds r0, r2, #0
	bl func_fe6_08056B08
	ldr r2, [sp]
.L0804A93C:
	cmp r2, #0
	bne .L0804A942
	b .L0804AD82
.L0804A942:
	movs r0, #9
	ldrh r1, [r2, #0x10]
	orrs r0, r1
	strh r0, [r2, #0x10]
	adds r0, r7, #0
	str r2, [sp]
	bl GetAnimRoundTypeAnotherSide
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	mov r8, r0
.L0804A958:
	bl CheckRoundMiss
	adds r1, r0, #0
	ldr r2, [sp]
	adds r0, r2, #0
	bl StartBattleAnimHitEffectsDefault
	b .L0804AD82
.L0804A968:
	adds r0, r7, #0
	bl GetAnimNextRoundType
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	mov r8, r0
	ldr r4, .L0804A9A8 @ =gAnims
	adds r0, r7, #0
	bl GetAnimPosition
	lsls r0, r0, #3
	adds r0, r0, r4
	ldr r2, [r0]
	adds r0, r7, #0
	str r2, [sp]
	bl GetAnimPosition
	lsls r0, r0, #1
	adds r0, #1
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r6, [r0]
	ldrb r0, [r7, #0x12]
	ldr r2, [sp]
	cmp r0, #9
	bls .L0804A99E
	b .L0804AD82
.L0804A99E:
	lsls r0, r0, #2
	ldr r1, .L0804A9AC @ =.L0804A9B0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
.L0804A9A8: .4byte gAnims
.L0804A9AC: .4byte .L0804A9B0
.L0804A9B0: @ jump table
	.4byte .L0804A9D8 @ case 0
	.4byte .L0804A9D8 @ case 1
	.4byte .L0804A9D8 @ case 2
	.4byte .L0804A9D8 @ case 3
	.4byte .L0804AAE0 @ case 4
	.4byte .L0804AAE0 @ case 5
	.4byte .L0804AAEE @ case 6
	.4byte .L0804AAEE @ case 7
	.4byte .L0804AAEE @ case 8
	.4byte .L0804A9D8 @ case 9
.L0804A9D8:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r8, r0
	bne .L0804A9E2
	b .L0804AAE0
.L0804A9E2:
	ldrh r0, [r2, #0xe]
	adds r0, #1
	strh r0, [r2, #0xe]
	ldrh r0, [r6, #0xe]
	adds r0, #1
	strh r0, [r6, #0xe]
	adds r0, r2, #0
	mov r1, r8
	str r2, [sp]
	bl SwitchAISFrameDataFromBARoundType
	adds r0, r6, #0
	mov r1, r8
	bl SwitchAISFrameDataFromBARoundType
	movs r1, #4
	ldr r2, [sp]
	ldrh r0, [r2, #0x10]
	orrs r0, r1
	strh r0, [r2, #0x10]
	ldrh r0, [r6, #0x10]
	orrs r0, r1
	strh r0, [r6, #0x10]
	ldr r1, .L0804AA38 @ =gUnk_081122C0
	ldr r0, .L0804AA3C @ =gEkrDistanceType
	movs r3, #0
	ldrsh r0, [r0, r3]
	adds r0, r0, r1
	ldrb r0, [r0]
	mov r8, r0
	ldr r1, .L0804AA40 @ =gUnk_08112298
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r4, [r0]
	adds r0, r7, #0
	str r2, [sp]
	bl GetAnimPosition
	ldr r2, [sp]
	cmp r0, #0
	bne .L0804AA48
	ldr r0, .L0804AA44 @ =gUnk_Banim_02000054
	b .L0804AA4A
	.align 2, 0
.L0804AA38: .4byte gUnk_081122C0
.L0804AA3C: .4byte gEkrDistanceType
.L0804AA40: .4byte gUnk_08112298
.L0804AA44: .4byte gUnk_Banim_02000054
.L0804AA48:
	ldr r0, .L0804AACC @ =gUnk_Banim_02000058
.L0804AA4A:
	ldr r1, [r0]
	lsls r0, r4, #2
	adds r0, r0, r1
	ldr r4, [r0]
	adds r0, r7, #0
	str r2, [sp]
	bl GetAnimPosition
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r0
	lsls r1, r1, #9
	ldr r0, .L0804AAD0 @ =gUnk_Banim_0200F1C0
	adds r1, r1, r0
	adds r1, r4, r1
	ldr r0, [r1, #4]
	ldr r2, [sp]
	str r0, [r2, #0x28]
	ldr r4, [r2, #0x30]
	ldr r1, [r1, #8]
	adds r4, r4, r1
	str r4, [r2, #0x3c]
	ldr r4, [r6, #0x30]
	ldr r0, .L0804AAD4 @ =0x000057F0
	adds r4, r4, r0
	str r4, [r6, #0x3c]
	ldr r4, .L0804AAD8 @ =0x0203CD98
	adds r0, r7, #0
	str r2, [sp]
	bl GetAnimPosition
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r0, [r0]
	ldr r2, [sp]
	cmp r0, #0
	beq .L0804AA98
	b .L0804AD8A
.L0804AA98:
	ldr r4, .L0804AADC @ =gpImgSheet
	adds r0, r2, #0
	bl GetAnimPosition
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r1, [r0]
	ldr r2, [sp]
	ldr r0, [r2, #0x28]
	cmp r1, r0
	bne .L0804AAB0
	b .L0804AD8A
.L0804AAB0:
	adds r0, r2, #0
	bl NewEkrChienCHR
	ldr r2, [sp]
	adds r0, r2, #0
	bl GetAnimPosition
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r2, [sp]
	ldr r1, [r2, #0x28]
	str r1, [r0]
	b .L0804AD8A
	.align 2, 0
.L0804AACC: .4byte gUnk_Banim_02000058
.L0804AAD0: .4byte gUnk_Banim_0200F1C0
.L0804AAD4: .4byte 0x000057F0
.L0804AAD8: .4byte 0x0203CD98
.L0804AADC: .4byte gpImgSheet
.L0804AAE0:
	ldr r1, .L0804AB00 @ =gUnk_081122C0
	ldr r0, .L0804AB04 @ =gEkrDistanceType
	movs r3, #0
	ldrsh r0, [r0, r3]
	adds r0, r0, r1
	ldrb r0, [r0]
	mov r8, r0
.L0804AAEE:
	adds r0, r2, #0
	mov r1, r8
	bl SwitchAISFrameDataFromBARoundType
	adds r0, r6, #0
	mov r1, r8
	bl SwitchAISFrameDataFromBARoundType
	b .L0804AD8A
	.align 2, 0
.L0804AB00: .4byte gUnk_081122C0
.L0804AB04: .4byte gEkrDistanceType
.L0804AB08:
	ldrh r2, [r7, #0x10]
	movs r1, #0x20
	movs r0, #0x20
	ands r0, r2
	cmp r0, #0
	bne .L0804AB1C
	adds r0, r1, #0
	orrs r0, r2
	strh r0, [r7, #0x10]
	b .L0804AD82
.L0804AB1C:
	ldr r1, .L0804AB30 @ =gUnk_Banim_02017750
	ldr r0, [r1]
	cmp r0, #1
	beq .L0804AB26
	b .L0804AD82
.L0804AB26:
	movs r0, #0
	str r0, [r1]
	ldr r0, .L0804AB34 @ =0x0000FFDF
	ands r0, r2
	b .L0804ACDA
	.align 2, 0
.L0804AB30: .4byte gUnk_Banim_02017750
.L0804AB34: .4byte 0x0000FFDF
.L0804AB38:
	adds r0, r7, #0
	bl GetAnimLayer
	cmp r0, #0
	beq .L0804AB44
	b .L0804AD82
.L0804AB44:
	movs r0, #3
	bl NewEfxQuake
	b .L0804AD82
.L0804AB4C:
	adds r0, r7, #0
	bl GetAnimLayer
	cmp r0, #0
	beq .L0804AB58
	b .L0804AD82
.L0804AB58:
	movs r0, #0
	bl NewEfxQuake
	b .L0804AD82
.L0804AB60:
	ldrh r1, [r7, #0x10]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne .L0804AB6C
	b .L0804AD82
.L0804AB6C:
	ldr r0, .L0804AB94 @ =0x0000FFFE
	ands r0, r1
	strh r0, [r7, #0x10]
	ldr r0, [r7, #0x20]
	adds r0, #4
	str r0, [r7, #0x20]
	ldr r0, .L0804AB98 @ =0x0000F3FF
	ldrh r1, [r7, #8]
	ands r0, r1
	movs r2, #0x80
	lsls r2, r2, #3
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r7, #8]
	movs r0, #0x8c
	strh r0, [r7, #0xa]
	bl BasSort
	b .L0804AD82
	.align 2, 0
.L0804AB94: .4byte 0x0000FFFE
.L0804AB98: .4byte 0x0000F3FF
.L0804AB9C:
	adds r0, r7, #0
	bl GetAnimLayer
	cmp r0, #0
	beq .L0804ABA8
	b .L0804AD82
.L0804ABA8:
	adds r0, r7, #0
	bl GetAnimAnotherSide
	adds r2, r0, #0
	cmp r2, #0
	beq .L0804ABDA
	movs r0, #9
	ldrh r3, [r2, #0x10]
	orrs r0, r3
	strh r0, [r2, #0x10]
	adds r0, r7, #0
	str r2, [sp]
	bl GetAnimRoundTypeAnotherSide
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	mov r8, r0
	bl CheckRoundMiss
	adds r1, r0, #0
	ldr r2, [sp]
	adds r0, r2, #0
	bl StartBattleAnimHitEffectsDefault
	ldr r2, [sp]
.L0804ABDA:
	adds r0, r2, #0
	bl func_fe6_0805C308
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #2
	bne .L0804ABEA
	b .L0804AD82
.L0804ABEA:
	adds r0, r7, #0
	bl func_fe6_08056C3C
	b .L0804AD82
.L0804ABF2:
	adds r0, r7, #0
	bl GetAnimLayer
	cmp r0, #0
	beq .L0804ABFE
	b .L0804AD82
.L0804ABFE:
	adds r0, r7, #0
	movs r1, #0
	bl func_fe6_08056D80
	b .L0804AD82
.L0804AC08:
	adds r0, r7, #0
	bl GetAnimLayer
	cmp r0, #0
	beq .L0804AC14
	b .L0804AD82
.L0804AC14:
	adds r0, r7, #0
	movs r1, #1
	bl func_fe6_08056D80
	b .L0804AD82
.L0804AC1E:
	adds r0, r7, #0
	bl GetAnimLayer
	cmp r0, #0
	beq .L0804AC2A
	b .L0804AD82
.L0804AC2A:
	adds r0, r7, #0
	bl NewEfxHurtmutEff00
	b .L0804AD82
.L0804AC32:
	adds r0, r7, #0
	bl GetAnimLayer
	b .L0804AD82
.L0804AC3A:
	adds r0, r7, #0
	bl GetAnimLayer
	cmp r0, #0
	beq .L0804AC46
	b .L0804AD82
.L0804AC46:
	adds r0, r7, #0
	movs r1, #0
	bl func_fe6_080571A0
	b .L0804AD82
.L0804AC50:
	adds r0, r7, #0
	bl GetAnimLayer
	cmp r0, #0
	beq .L0804AC5C
	b .L0804AD82
.L0804AC5C:
	adds r0, r7, #0
	movs r1, #1
	bl func_fe6_080571A0
	b .L0804AD82
.L0804AC66:
	adds r0, r7, #0
	bl GetAnimLayer
	cmp r0, #0
	beq .L0804AC72
	b .L0804AD82
.L0804AC72:
	adds r0, r7, #0
	movs r1, #0
	bl func_fe6_08057344
	b .L0804AD82
.L0804AC7C:
	adds r0, r7, #0
	bl GetAnimLayer
	cmp r0, #0
	beq .L0804AC88
	b .L0804AD82
.L0804AC88:
	adds r0, r7, #0
	movs r1, #1
	bl func_fe6_08057344
	b .L0804AD82
.L0804AC92:
	adds r0, r7, #0
	bl GetAnimLayer
	cmp r0, #0
	bne .L0804AD82
	adds r0, r7, #0
	movs r1, #2
	bl func_fe6_08057344
	b .L0804AD82
.L0804ACA6:
	ldrh r1, [r7, #0x10]
	movs r2, #0x20
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	bne .L0804ACCA
	adds r0, r2, #0
	orrs r0, r1
	strh r0, [r7, #0x10]
	adds r0, r7, #0
	bl GetAnimLayer
	cmp r0, #0
	bne .L0804AD82
	adds r0, r7, #0
	bl NewEfxKingPika
	b .L0804AD82
.L0804ACCA:
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq .L0804AD82
	ldr r0, .L0804ACE4 @ =0x0000FFDF
	ands r0, r1
	ldr r1, .L0804ACE8 @ =0x0000FFBF
.L0804ACD8:
	ands r0, r1
.L0804ACDA:
	strh r0, [r7, #0x10]
.L0804ACDC:
	ldr r0, [r7, #0x20]
	adds r0, #4
	str r0, [r7, #0x20]
	b .L0804AD82
	.align 2, 0
.L0804ACE4: .4byte 0x0000FFDF
.L0804ACE8: .4byte 0x0000FFBF
.L0804ACEC:
	ldrh r0, [r7, #2]
	adds r0, #0x20
	strh r0, [r7, #2]
	adds r0, r7, #0
	bl GetAnimLayer
	cmp r0, #0
	bne .L0804AD82
	adds r0, r7, #0
	bl GetAnimPosition
	ldr r1, .L0804AD10 @ =gEkrXPosReal
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	adds r1, #0x20
	strh r1, [r0]
	b .L0804AD82
	.align 2, 0
.L0804AD10: .4byte gEkrXPosReal
.L0804AD14:
	ldrh r0, [r7, #2]
	subs r0, #0x20
	strh r0, [r7, #2]
	adds r0, r7, #0
	bl GetAnimLayer
	cmp r0, #0
	bne .L0804AD82
	adds r0, r7, #0
	bl GetAnimPosition
	ldr r1, .L0804AD38 @ =gEkrXPosReal
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	subs r1, #0x20
	strh r1, [r0]
	b .L0804AD82
	.align 2, 0
.L0804AD38: .4byte gEkrXPosReal
.L0804AD3C:
	adds r0, r7, #0
	bl GetAnimLayer
	cmp r0, #0
	bne .L0804AD82
	adds r0, r7, #0
	bl NewEfxFlashFX
	b .L0804AD82
.L0804AD4E:
	adds r0, r7, #0
	bl GetAnimLayer
	cmp r0, #0
	bne .L0804AD82
	adds r0, r7, #0
	bl NewEfxSongOBJ2
	b .L0804AD82
.L0804AD60:
	subs r0, r3, #1
	adds r0, r2, r0
	ldrb r1, [r0]
	adds r0, r7, #0
	bl EfxPlaySEwithCmdCtrl
	b .L0804AD82
.L0804AD6E:
	adds r0, r7, #0
	bl NewEfxMantBatabata
	b .L0804AD82
.L0804AD76:
	subs r0, r3, #1
	adds r0, r2, r0
	ldrb r1, [r0]
	adds r0, r7, #0
	bl EfxPlaySEwithCmdCtrl
.L0804AD82:
	ldrb r0, [r7, #0x14]
	subs r0, #1
	strb r0, [r7, #0x14]
	b .L0804A61A
.L0804AD8A:
	movs r0, #0xe7
	lsls r0, r0, #8
	ldrh r1, [r7, #0xc]
	ands r0, r1
	strh r0, [r7, #0xc]
.L0804AD94:
	movs r0, #0x80
	lsls r0, r0, #6
	mov r2, r8
	ands r0, r2
	cmp r0, #0
	beq .L0804ADFA
	adds r0, r7, #0
	bl GetAnimLayer
	cmp r0, #0
	bne .L0804ADF0
	ldr r4, .L0804AE4C @ =0x0203CD98
	adds r0, r7, #0
	bl GetAnimPosition
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r0, [r0]
	cmp r0, #0
	bne .L0804ADF0
	movs r0, #0x80
	lsls r0, r0, #7
	ldrh r3, [r7, #0x10]
	ands r0, r3
	cmp r0, #0
	bne .L0804ADF0
	ldr r4, .L0804AE50 @ =gpImgSheet
	adds r0, r7, #0
	bl GetAnimPosition
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r1, [r0]
	ldr r0, [r7, #0x28]
	cmp r1, r0
	beq .L0804ADF0
	adds r0, r7, #0
	bl RegisterAISSheetGraphics
	adds r0, r7, #0
	bl GetAnimPosition
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r1, [r7, #0x28]
	str r1, [r0]
.L0804ADF0:
	movs r0, #0xd7
	lsls r0, r0, #8
	ldrh r1, [r7, #0xc]
	ands r0, r1
	strh r0, [r7, #0xc]
.L0804ADFA:
	movs r0, #0x80
	lsls r0, r0, #7
	mov r2, r8
	ands r2, r0
	cmp r2, #0
	bne .L0804AE10
	ldr r0, .L0804AE54 @ =gAnimC01Blocking
	ldr r0, [r0]
	cmp r0, #1
	beq .L0804AE10
	b .L0804AF52
.L0804AE10:
	ldrh r1, [r7, #0x10]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq .L0804AE98
	adds r0, r7, #0
	bl GetAnimNextRoundType
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	mov r8, r0
	movs r0, #1
	rsbs r0, r0, #0
	cmp r8, r0
	beq .L0804AE60
	ldr r6, .L0804AE58 @ =gAnims
	adds r0, r7, #0
	bl GetAnimPosition
	lsls r0, r0, #3
	adds r0, r0, r6
	ldr r2, [r0]
	adds r0, r2, #0
	mov r1, r8
	str r2, [sp]
	bl SwitchAISFrameDataFromBARoundType
	ldr r4, .L0804AE5C @ =0x0000FFFD
	b .L0804AED0
	.align 2, 0
.L0804AE4C: .4byte 0x0203CD98
.L0804AE50: .4byte gpImgSheet
.L0804AE54: .4byte gAnimC01Blocking
.L0804AE58: .4byte gAnims
.L0804AE5C: .4byte 0x0000FFFD
.L0804AE60:
	ldr r5, .L0804AE90 @ =gAnims
	adds r0, r7, #0
	bl GetAnimPosition
	lsls r0, r0, #3
	adds r0, r0, r5
	ldr r2, [r0]
	ldr r4, .L0804AE94 @ =0x0000FFFD
	adds r0, r4, #0
	ldrh r1, [r2, #0x10]
	ands r0, r1
	strh r0, [r2, #0x10]
	adds r0, r7, #0
	bl GetAnimPosition
	lsls r0, r0, #1
	adds r0, #1
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r6, [r0]
	ldrh r2, [r6, #0x10]
	ands r4, r2
	strh r4, [r6, #0x10]
	b .L0804AF52
	.align 2, 0
.L0804AE90: .4byte gAnims
.L0804AE94: .4byte 0x0000FFFD
.L0804AE98:
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r1
	cmp r0, #0
	beq .L0804AF18
	adds r0, r7, #0
	bl GetAnimNextRoundType
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	mov r8, r0
	movs r0, #1
	rsbs r0, r0, #0
	cmp r8, r0
	beq .L0804AF52
	ldr r6, .L0804AF10 @ =gAnims
	adds r0, r7, #0
	bl GetAnimPosition
	lsls r0, r0, #3
	adds r0, r0, r6
	ldr r2, [r0]
	adds r0, r2, #0
	mov r1, r8
	str r2, [sp]
	bl SwitchAISFrameDataFromBARoundType
	ldr r4, .L0804AF14 @ =0x00007FFF
.L0804AED0:
	adds r0, r4, #0
	ldr r2, [sp]
	ldrh r3, [r2, #0x10]
	ands r0, r3
	movs r5, #4
	orrs r0, r5
	strh r0, [r2, #0x10]
	adds r0, r7, #0
	str r2, [sp]
	bl GetAnimPosition
	lsls r0, r0, #1
	adds r0, #1
	lsls r0, r0, #2
	adds r0, r0, r6
	ldr r6, [r0]
	adds r0, r6, #0
	mov r1, r8
	bl SwitchAISFrameDataFromBARoundType
	ldrh r0, [r6, #0x10]
	ands r4, r0
	orrs r4, r5
	strh r4, [r6, #0x10]
	ldr r2, [sp]
	ldrh r0, [r2, #0xe]
	adds r0, #1
	strh r0, [r2, #0xe]
	ldrh r0, [r6, #0xe]
	adds r0, #1
	strh r0, [r6, #0xe]
	b .L0804AF52
	.align 2, 0
.L0804AF10: .4byte gAnims
.L0804AF14: .4byte 0x00007FFF
.L0804AF18:
	adds r0, r7, #0
	bl GetAnimLayer
	cmp r0, #0
	bne .L0804AF52
	adds r0, r7, #0
	bl GetAnimPosition
	adds r1, r0, #0
	ldrh r2, [r7, #0xe]
	lsls r0, r2, #1
	adds r0, r0, r1
	bl GetBattleAnimRoundType
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	mov r8, r0
	movs r0, #1
	rsbs r0, r0, #0
	cmp r8, r0
	bne .L0804AF52
	adds r0, r7, #0
	bl GetAnimPosition
	ldr r1, .L0804AF6C @ =gBanimDoneFlag
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #1
	str r1, [r0]
.L0804AF52:
	mov r2, sb
	cmp r2, #3
	bhi .L0804AF5C
	bl .L00804A5E8
.L0804AF5C:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0804AF6C: .4byte gBanimDoneFlag

	thumb_func_start NewEkrChienCHR
NewEkrChienCHR: @ 0x0804AF70
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, .L0804AF84 @ =ProcScr_EkrChienCHR
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0804AF84: .4byte ProcScr_EkrChienCHR

	thumb_func_start EkrChienCHRMain
EkrChienCHRMain: @ 0x0804AF88
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl RegisterAISSheetGraphics
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start RegisterAISSheetGraphics
RegisterAISSheetGraphics: @ 0x0804AFA0
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, .L0804AFCC @ =0x000003FF
	ldrh r0, [r5, #8]
	ands r4, r0
	lsls r4, r4, #5
	ldr r0, .L0804AFD0 @ =0x06010000
	adds r4, r4, r0
	ldr r0, [r5, #0x28]
	ldr r1, [r5, #0x2c]
	bl LZ77UnCompWram
	ldr r0, [r5, #0x2c]
	movs r2, #0x80
	lsls r2, r2, #6
	adds r1, r4, #0
	bl RegisterDataMove
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0804AFCC: .4byte 0x000003FF
.L0804AFD0: .4byte 0x06010000

	thumb_func_start func_fe6_0804AFD4
func_fe6_0804AFD4: @ 0x0804AFD4
	adds r2, r0, #0
	ldr r0, .L0804AFF8 @ =0x0203CDD0
	lsls r1, r1, #1
	adds r1, r1, r0
	movs r3, #0
	ldrsh r0, [r1, r3]
	cmp r0, #0
	beq .L0804AFF4
	movs r1, #0
	adds r3, r2, #0
	adds r3, #0x80
.L0804AFEA:
	ldm r3!, {r0}
	stm r2!, {r0}
	adds r1, #1
	cmp r1, #7
	bls .L0804AFEA
.L0804AFF4:
	bx lr
	.align 2, 0
.L0804AFF8: .4byte 0x0203CDD0

	thumb_func_start GetBanimPalette
GetBanimPalette: @ 0x0804AFFC
	adds r2, r0, #0
	cmp r1, #0
	bne .L0804B00C
	ldr r0, .L0804B008 @ =gpEkrBattleUnitLeft
	b .L0804B00E
	.align 2, 0
.L0804B008: .4byte gpEkrBattleUnitLeft
.L0804B00C:
	ldr r0, .L0804B024 @ =gpEkrBattleUnitRight
.L0804B00E:
	ldr r0, [r0]
	ldr r0, [r0, #4]
	ldrb r0, [r0, #4]
	cmp r0, #0x11
	beq .L0804B036
	cmp r0, #0x11
	bhi .L0804B028
	cmp r0, #0x10
	beq .L0804B032
	b .L0804B042
	.align 2, 0
.L0804B024: .4byte gpEkrBattleUnitRight
.L0804B028:
	cmp r0, #0x12
	beq .L0804B03A
	cmp r0, #0x13
	beq .L0804B03E
	b .L0804B042
.L0804B032:
	movs r0, #0xe
	b .L0804B044
.L0804B036:
	movs r0, #0xf
	b .L0804B044
.L0804B03A:
	movs r0, #4
	b .L0804B044
.L0804B03E:
	movs r0, #5
	b .L0804B044
.L0804B042:
	adds r0, r2, #0
.L0804B044:
	bx lr
	.align 2, 0

	thumb_func_start UpdateBanimFrame
UpdateBanimFrame: @ 0x0804B048
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r0, .L0804B0F8 @ =banim_data
	mov sl, r0
	ldr r1, .L0804B0FC @ =gpImgSheet
	movs r0, #0
	str r0, [r1, #4]
	str r0, [r1]
	ldr r0, .L0804B100 @ =gEkrPairSideVaild
	ldrh r1, [r0]
	cmp r1, #1
	bne .L0804B140
	ldr r0, .L0804B104 @ =gBanimIdx
	movs r2, #0
	ldrsh r7, [r0, r2]
	ldr r0, .L0804B108 @ =gBanimFactionPal
	movs r2, #0
	ldrsh r1, [r0, r2]
	mov r8, r1
	ldr r0, .L0804B10C @ =gBanimUniquePal
	movs r1, #0
	ldrsh r4, [r0, r1]
	lsls r0, r7, #5
	ldr r2, .L0804B0F8 @ =banim_data
	adds r6, r0, r2
	ldr r0, [r6, #0x10]
	ldr r1, .L0804B110 @ =gUnk_Banim_0200F1C0
	bl LZ77UnCompWram
	ldr r1, .L0804B114 @ =gUnk_Banim_02000054
	ldr r0, [r6, #0xc]
	str r0, [r1]
	adds r0, r7, #0
	movs r1, #0
	bl GetBanimPalette
	lsls r0, r0, #5
	ldr r1, .L0804B0F8 @ =banim_data
	adds r0, r0, r1
	ldr r0, [r0, #0x1c]
	ldr r5, .L0804B118 @ =gUnk_Banim_02004080
	adds r1, r5, #0
	bl LZ77UnCompWram
	movs r0, #1
	rsbs r0, r0, #0
	cmp r4, r0
	beq .L0804B0C4
	lsls r0, r4, #4
	ldr r2, .L0804B11C @ =0x087FC008
	adds r0, r0, r2
	ldr r0, [r0, #0xc]
	adds r1, r5, #0
	bl LZ77UnCompWram
	adds r0, r5, #0
	movs r1, #0
	bl func_fe6_0804AFD4
.L0804B0C4:
	ldr r1, .L0804B120 @ =gpEfxUnitPaletteBackup
	mov r2, r8
	lsls r0, r2, #5
	adds r0, r0, r5
	str r0, [r1]
	ldr r4, .L0804B124 @ =gPal+0x2E0
	adds r1, r4, #0
	movs r2, #8
	bl CpuFastSet
	ldr r0, .L0804B128 @ =0x0203CD90
	ldr r0, [r0]
	adds r4, #0x20
	adds r1, r4, #0
	movs r2, #8
	bl CpuFastSet
	bl EnablePalSync
	cmp r7, #0x74
	beq .L0804B130
	ldr r0, [r6, #0x18]
	ldr r1, .L0804B12C @ =gUnk_Banim_020041C0
	bl LZ77UnCompWram
	b .L0804B138
	.align 2, 0
.L0804B0F8: .4byte banim_data
.L0804B0FC: .4byte gpImgSheet
.L0804B100: .4byte gEkrPairSideVaild
.L0804B104: .4byte gBanimIdx
.L0804B108: .4byte gBanimFactionPal
.L0804B10C: .4byte gBanimUniquePal
.L0804B110: .4byte gUnk_Banim_0200F1C0
.L0804B114: .4byte gUnk_Banim_02000054
.L0804B118: .4byte gUnk_Banim_02004080
.L0804B11C: .4byte 0x087FC008
.L0804B120: .4byte gpEfxUnitPaletteBackup
.L0804B124: .4byte gPal+0x2E0
.L0804B128: .4byte 0x0203CD90
.L0804B12C: .4byte gUnk_Banim_020041C0
.L0804B130:
	ldr r0, [r6, #0x14]
	ldr r1, .L0804B254 @ =gUnk_Banim_020041C0
	bl LZ77UnCompWram
.L0804B138:
	ldr r4, .L0804B258 @ =gUnk_Banim_020099B0
	movs r0, #1
	str r0, [r4]
	ldr r0, .L0804B25C @ =gEkrPairSideVaild
.L0804B140:
	movs r2, #2
	ldrsh r1, [r0, r2]
	mov sb, r1
	cmp r1, #1
	bne .L0804B1DE
	ldr r0, .L0804B260 @ =gBanimIdx
	movs r1, #2
	ldrsh r7, [r0, r1]
	ldr r0, .L0804B264 @ =gBanimFactionPal
	movs r1, #2
	ldrsh r2, [r0, r1]
	mov r8, r2
	ldr r0, .L0804B268 @ =gBanimUniquePal
	movs r2, #2
	ldrsh r4, [r0, r2]
	lsls r0, r7, #5
	mov r1, sl
	adds r6, r0, r1
	ldr r0, [r6, #0x10]
	ldr r1, .L0804B26C @ =gUnk_Banim_02011BC0
	bl LZ77UnCompWram
	ldr r1, .L0804B270 @ =gUnk_Banim_02000058
	ldr r0, [r6, #0xc]
	str r0, [r1]
	adds r0, r7, #0
	movs r1, #1
	bl GetBanimPalette
	lsls r0, r0, #5
	add r0, sl
	ldr r0, [r0, #0x1c]
	ldr r5, .L0804B274 @ =gUnk_Banim_02004120
	adds r1, r5, #0
	bl LZ77UnCompWram
	movs r0, #1
	rsbs r0, r0, #0
	cmp r4, r0
	beq .L0804B1A6
	lsls r0, r4, #4
	ldr r2, .L0804B278 @ =0x087FC008
	adds r0, r0, r2
	ldr r0, [r0, #0xc]
	adds r1, r5, #0
	bl LZ77UnCompWram
	adds r0, r5, #0
	movs r1, #1
	bl func_fe6_0804AFD4
.L0804B1A6:
	ldr r1, .L0804B27C @ =gpEfxUnitPaletteBackup
	mov r2, r8
	lsls r0, r2, #5
	adds r0, r0, r5
	str r0, [r1, #4]
	ldr r4, .L0804B280 @ =gPal+0x320
	adds r1, r4, #0
	movs r2, #8
	bl CpuFastSet
	ldr r0, .L0804B284 @ =0x0203CD90
	ldr r0, [r0, #4]
	adds r4, #0x20
	adds r1, r4, #0
	movs r2, #8
	bl CpuFastSet
	bl EnablePalSync
	ldr r0, [r6, #0x14]
	ldr r4, .L0804B288 @ =gUnk_Banim_020099C0
	adds r1, r4, #0
	bl LZ77UnCompWram
	ldr r0, .L0804B28C @ =0x000057F0
	adds r4, r4, r0
	mov r1, sb
	str r1, [r4]
.L0804B1DE:
	ldr r6, .L0804B290 @ =gpEkrTriangleUnits
	ldr r0, [r6]
	cmp r0, #0
	beq .L0804B246
	ldr r0, [r0, #4]
	ldr r0, [r0, #0x30]
	movs r1, #0
	bl GetBattleAnimationId_WithUnique
	lsls r0, r0, #0x10
	ldr r5, .L0804B284 @ =0x0203CD90
	lsrs r0, r0, #0xb
	add r0, sl
	ldr r0, [r0, #0x1c]
	str r0, [r5]
	ldr r0, [r6]
	bl func_fe6_0804A49C
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	movs r7, #1
	rsbs r7, r7, #0
	cmp r4, r7
	beq .L0804B218
	lsls r0, r4, #4
	ldr r2, .L0804B278 @ =0x087FC008
	adds r0, r0, r2
	ldr r0, [r0, #0xc]
	str r0, [r5]
.L0804B218:
	ldr r0, [r6, #4]
	ldr r0, [r0, #4]
	ldr r0, [r0, #0x30]
	movs r1, #0
	bl GetBattleAnimationId_WithUnique
	lsls r0, r0, #0x10
	lsrs r0, r0, #0xb
	add r0, sl
	ldr r0, [r0, #0x1c]
	str r0, [r5, #4]
	ldr r0, [r6, #4]
	bl func_fe6_0804A49C
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	cmp r4, r7
	beq .L0804B246
	lsls r0, r4, #4
	ldr r1, .L0804B278 @ =0x087FC008
	adds r0, r0, r1
	ldr r0, [r0, #0xc]
	str r0, [r5, #4]
.L0804B246:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0804B254: .4byte gUnk_Banim_020041C0
.L0804B258: .4byte gUnk_Banim_020099B0
.L0804B25C: .4byte gEkrPairSideVaild
.L0804B260: .4byte gBanimIdx
.L0804B264: .4byte gBanimFactionPal
.L0804B268: .4byte gBanimUniquePal
.L0804B26C: .4byte gUnk_Banim_02011BC0
.L0804B270: .4byte gUnk_Banim_02000058
.L0804B274: .4byte gUnk_Banim_02004120
.L0804B278: .4byte 0x087FC008
.L0804B27C: .4byte gpEfxUnitPaletteBackup
.L0804B280: .4byte gPal+0x320
.L0804B284: .4byte 0x0203CD90
.L0804B288: .4byte gUnk_Banim_020099C0
.L0804B28C: .4byte 0x000057F0
.L0804B290: .4byte gpEkrTriangleUnits

	thumb_func_start InitMainAnims
InitMainAnims: @ 0x0804B294
	push {lr}
	ldr r0, .L0804B2AC @ =gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #4
	bhi .L0804B30E
	lsls r0, r0, #2
	ldr r1, .L0804B2B0 @ =.L0804B2B4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
.L0804B2AC: .4byte gEkrDistanceType
.L0804B2B0: .4byte .L0804B2B4
.L0804B2B4: @ jump table
	.4byte .L0804B2C8 @ case 0
	.4byte .L0804B2D2 @ case 1
	.4byte .L0804B2DC @ case 2
	.4byte .L0804B2C8 @ case 3
	.4byte .L0804B2C8 @ case 4
.L0804B2C8:
	movs r0, #6
	movs r1, #6
	bl InitBattleAnimFrame
	b .L0804B30E
.L0804B2D2:
	movs r0, #8
	movs r1, #8
	bl InitBattleAnimFrame
	b .L0804B30E
.L0804B2DC:
	movs r0, #8
	movs r1, #8
	bl InitBattleAnimFrame
	bl GetBanimInitPosReal
	cmp r0, #0
	bne .L0804B300
	ldr r1, .L0804B2FC @ =gAnims
	ldr r2, [r1, #8]
	movs r0, #0xc0
	lsls r0, r0, #1
	strh r0, [r2, #2]
	ldr r1, [r1, #0xc]
	b .L0804B30C
	.align 2, 0
.L0804B2FC: .4byte gAnims
.L0804B300:
	ldr r1, .L0804B31C @ =gAnims
	ldr r2, [r1]
	movs r0, #0xc0
	lsls r0, r0, #1
	strh r0, [r2, #2]
	ldr r1, [r1, #4]
.L0804B30C:
	strh r0, [r1, #2]
.L0804B30E:
	ldr r1, .L0804B320 @ =0x0203CD46
	movs r0, #0
	strh r0, [r1]
	strh r0, [r1, #2]
	pop {r0}
	bx r0
	.align 2, 0
.L0804B31C: .4byte gAnims
.L0804B320: .4byte 0x0203CD46

	thumb_func_start InitBattleAnimFrame
InitBattleAnimFrame: @ 0x0804B324
	push {r4, r5, r6, lr}
	adds r2, r0, #0
	adds r6, r1, #0
	ldr r4, .L0804B370 @ =gAnims
	movs r0, #0
	str r0, [r4]
	str r0, [r4, #4]
	str r0, [r4, #8]
	str r0, [r4, #0xc]
	ldr r5, .L0804B374 @ =gEkrPairSideVaild
	ldrh r0, [r5]
	cmp r0, #1
	bne .L0804B344
	adds r0, r2, #0
	bl InitLeftAnim
.L0804B344:
	ldrh r5, [r5, #2]
	cmp r5, #1
	bne .L0804B350
	adds r0, r6, #0
	bl InitRightAnim
.L0804B350:
	ldr r0, .L0804B378 @ =gEkrDistanceType
	ldrh r0, [r0]
	cmp r0, #4
	bne .L0804B36A
	ldr r1, [r4]
	movs r2, #2
	ldrh r0, [r1]
	orrs r0, r2
	strh r0, [r1]
	ldr r1, [r4, #4]
	ldrh r0, [r1]
	orrs r0, r2
	strh r0, [r1]
.L0804B36A:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L0804B370: .4byte gAnims
.L0804B374: .4byte gEkrPairSideVaild
.L0804B378: .4byte gEkrDistanceType

	thumb_func_start InitLeftAnim
InitLeftAnim: @ 0x0804B37C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r7, r0, #0
	ldr r2, .L0804B484 @ =gUnk_08112298
	lsls r1, r7, #2
	adds r0, r1, r2
	ldrb r5, [r0]
	adds r0, r1, #1
	adds r0, r0, r2
	ldrb r6, [r0]
	adds r0, r1, #2
	adds r0, r0, r2
	ldrb r0, [r0]
	mov r8, r0
	adds r1, #3
	adds r1, r1, r2
	ldrb r1, [r1]
	mov sb, r1
	ldr r0, .L0804B488 @ =gUnk_081122C5
	ldr r1, .L0804B48C @ =gEkrDistanceType
	movs r2, #0
	ldrsh r1, [r1, r2]
	adds r0, r1, r0
	ldrb r4, [r0]
	ldr r3, .L0804B490 @ =gEkrXPosBase
	ldr r0, .L0804B494 @ =gUnk_081122D0
	lsls r1, r1, #1
	adds r1, r1, r0
	ldrh r1, [r1]
	rsbs r1, r1, #0
	movs r2, #0
	strh r1, [r3]
	ldr r0, .L0804B498 @ =gEkrYPosBase
	strh r2, [r0]
	ldr r0, .L0804B49C @ =gEkrXPosReal
	adds r1, r1, r4
	strh r1, [r0]
	ldr r1, .L0804B4A0 @ =gEkrYPosReal
	movs r0, #0x58
	strh r0, [r1]
	ldr r0, .L0804B4A4 @ =gUnk_Banim_02000054
	ldr r1, [r0]
	lsls r0, r5, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldr r0, .L0804B4A8 @ =gUnk_Banim_0200F1C0
	adds r0, r1, r0
	cmp r5, #0xff
	bne .L0804B3E4
	ldr r0, .L0804B4AC @ =gUnk_085CBDA0
.L0804B3E4:
	adds r1, r6, #0
	bl BasCreate
	adds r2, r0, #0
	ldr r1, .L0804B49C @ =gEkrXPosReal
	ldr r0, .L0804B4B0 @ =gEkrBgPosition
	ldrh r1, [r1]
	ldrh r0, [r0]
	subs r0, r1, r0
	movs r1, #0
	strh r0, [r2, #2]
	ldr r0, .L0804B4A0 @ =gEkrYPosReal
	ldrh r0, [r0]
	strh r0, [r2, #4]
	movs r0, #0xf4
	lsls r0, r0, #7
	strh r0, [r2, #8]
	movs r3, #0x80
	lsls r3, r3, #3
	adds r0, r3, #0
	ldrh r3, [r2, #0xc]
	orrs r0, r3
	strh r0, [r2, #0xc]
	strh r1, [r2, #0xe]
	strb r7, [r2, #0x12]
	ldr r0, .L0804B4B4 @ =gUnk_Banim_02000080
	str r0, [r2, #0x2c]
	ldr r0, .L0804B4B8 @ =gUnk_Banim_020041C0
	str r0, [r2, #0x30]
	ldr r0, .L0804B4BC @ =gAnims
	str r2, [r0]
	ldr r0, .L0804B4A4 @ =gUnk_Banim_02000054
	ldr r1, [r0]
	mov r2, r8
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldr r0, .L0804B4A8 @ =gUnk_Banim_0200F1C0
	adds r0, r1, r0
	cmp r2, #0xff
	bne .L0804B438
	ldr r0, .L0804B4AC @ =gUnk_085CBDA0
.L0804B438:
	mov r1, sb
	bl BasCreate
	adds r2, r0, #0
	ldr r1, .L0804B49C @ =gEkrXPosReal
	ldr r0, .L0804B4B0 @ =gEkrBgPosition
	ldrh r1, [r1]
	ldrh r0, [r0]
	subs r0, r1, r0
	movs r1, #0
	strh r0, [r2, #2]
	ldr r0, .L0804B4A0 @ =gEkrYPosReal
	ldrh r0, [r0]
	strh r0, [r2, #4]
	movs r0, #0xf4
	lsls r0, r0, #7
	strh r0, [r2, #8]
	movs r3, #0xa0
	lsls r3, r3, #3
	adds r0, r3, #0
	ldrh r3, [r2, #0xc]
	orrs r0, r3
	strh r0, [r2, #0xc]
	strh r1, [r2, #0xe]
	strb r7, [r2, #0x12]
	ldr r0, .L0804B4B4 @ =gUnk_Banim_02000080
	str r0, [r2, #0x2c]
	ldr r0, .L0804B4B8 @ =gUnk_Banim_020041C0
	str r0, [r2, #0x30]
	ldr r0, .L0804B4BC @ =gAnims
	str r2, [r0, #4]
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0804B484: .4byte gUnk_08112298
.L0804B488: .4byte gUnk_081122C5
.L0804B48C: .4byte gEkrDistanceType
.L0804B490: .4byte gEkrXPosBase
.L0804B494: .4byte gUnk_081122D0
.L0804B498: .4byte gEkrYPosBase
.L0804B49C: .4byte gEkrXPosReal
.L0804B4A0: .4byte gEkrYPosReal
.L0804B4A4: .4byte gUnk_Banim_02000054
.L0804B4A8: .4byte gUnk_Banim_0200F1C0
.L0804B4AC: .4byte gUnk_085CBDA0
.L0804B4B0: .4byte gEkrBgPosition
.L0804B4B4: .4byte gUnk_Banim_02000080
.L0804B4B8: .4byte gUnk_Banim_020041C0
.L0804B4BC: .4byte gAnims

	thumb_func_start InitRightAnim
InitRightAnim: @ 0x0804B4C0
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r2, .L0804B5A8 @ =gUnk_08112298
	lsls r1, r5, #2
	adds r0, r1, r2
	ldrb r3, [r0]
	adds r0, r1, #1
	adds r0, r0, r2
	ldrb r4, [r0]
	adds r0, r1, #2
	adds r0, r0, r2
	ldrb r6, [r0]
	adds r1, #3
	adds r1, r1, r2
	ldrb r7, [r1]
	ldr r1, .L0804B5AC @ =gUnk_081122CA
	ldr r0, .L0804B5B0 @ =gEkrDistanceType
	movs r2, #0
	ldrsh r0, [r0, r2]
	adds r0, r0, r1
	ldrb r2, [r0]
	ldr r0, .L0804B5B4 @ =gEkrXPosBase
	movs r1, #0
	strh r1, [r0, #2]
	ldr r0, .L0804B5B8 @ =gEkrYPosBase
	strh r1, [r0, #2]
	ldr r0, .L0804B5BC @ =gEkrXPosReal
	strh r2, [r0, #2]
	ldr r1, .L0804B5C0 @ =gEkrYPosReal
	movs r0, #0x58
	strh r0, [r1, #2]
	ldr r0, .L0804B5C4 @ =gUnk_Banim_02000058
	ldr r1, [r0]
	lsls r0, r3, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldr r0, .L0804B5C8 @ =gUnk_Banim_02011BC0
	adds r0, r1, r0
	cmp r3, #0xff
	bne .L0804B512
	ldr r0, .L0804B5CC @ =gUnk_085CBDA0
.L0804B512:
	adds r1, r4, #0
	bl BasCreate
	adds r2, r0, #0
	ldr r1, .L0804B5BC @ =gEkrXPosReal
	ldr r0, .L0804B5D0 @ =gEkrBgPosition
	ldrh r1, [r1, #2]
	ldrh r0, [r0]
	subs r0, r1, r0
	movs r1, #0
	strh r0, [r2, #2]
	ldr r0, .L0804B5C0 @ =gEkrYPosReal
	ldrh r0, [r0, #2]
	strh r0, [r2, #4]
	movs r0, #0x9b
	lsls r0, r0, #8
	strh r0, [r2, #8]
	movs r3, #0xc0
	lsls r3, r3, #3
	adds r0, r3, #0
	ldrh r3, [r2, #0xc]
	orrs r0, r3
	strh r0, [r2, #0xc]
	strh r1, [r2, #0xe]
	strb r5, [r2, #0x12]
	ldr r0, .L0804B5D4 @ =gUnk_Banim_02002080
	str r0, [r2, #0x2c]
	ldr r0, .L0804B5D8 @ =gUnk_Banim_020099C0
	str r0, [r2, #0x30]
	ldr r0, .L0804B5DC @ =gAnims
	str r2, [r0, #8]
	ldr r0, .L0804B5C4 @ =gUnk_Banim_02000058
	ldr r1, [r0]
	lsls r0, r6, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldr r0, .L0804B5C8 @ =gUnk_Banim_02011BC0
	adds r0, r1, r0
	cmp r6, #0xff
	bne .L0804B564
	ldr r0, .L0804B5CC @ =gUnk_085CBDA0
.L0804B564:
	adds r1, r7, #0
	bl BasCreate
	adds r2, r0, #0
	ldr r1, .L0804B5BC @ =gEkrXPosReal
	ldr r0, .L0804B5D0 @ =gEkrBgPosition
	ldrh r1, [r1, #2]
	ldrh r0, [r0]
	subs r0, r1, r0
	movs r1, #0
	strh r0, [r2, #2]
	ldr r0, .L0804B5C0 @ =gEkrYPosReal
	ldrh r0, [r0, #2]
	strh r0, [r2, #4]
	movs r0, #0x9b
	lsls r0, r0, #8
	strh r0, [r2, #8]
	movs r3, #0xe0
	lsls r3, r3, #3
	adds r0, r3, #0
	ldrh r3, [r2, #0xc]
	orrs r0, r3
	strh r0, [r2, #0xc]
	strh r1, [r2, #0xe]
	strb r5, [r2, #0x12]
	ldr r0, .L0804B5D4 @ =gUnk_Banim_02002080
	str r0, [r2, #0x2c]
	ldr r0, .L0804B5D8 @ =gUnk_Banim_020099C0
	str r0, [r2, #0x30]
	ldr r0, .L0804B5DC @ =gAnims
	str r2, [r0, #0xc]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0804B5A8: .4byte gUnk_08112298
.L0804B5AC: .4byte gUnk_081122CA
.L0804B5B0: .4byte gEkrDistanceType
.L0804B5B4: .4byte gEkrXPosBase
.L0804B5B8: .4byte gEkrYPosBase
.L0804B5BC: .4byte gEkrXPosReal
.L0804B5C0: .4byte gEkrYPosReal
.L0804B5C4: .4byte gUnk_Banim_02000058
.L0804B5C8: .4byte gUnk_Banim_02011BC0
.L0804B5CC: .4byte gUnk_085CBDA0
.L0804B5D0: .4byte gEkrBgPosition
.L0804B5D4: .4byte gUnk_Banim_02002080
.L0804B5D8: .4byte gUnk_Banim_020099C0
.L0804B5DC: .4byte gAnims

	thumb_func_start SwitchAISFrameDataFromBARoundType
SwitchAISFrameDataFromBARoundType: @ 0x0804B5E0
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r6, r1, #0
	bl GetAnimLayer
	cmp r0, #0
	bne .L0804B600
	ldr r0, .L0804B5FC @ =gUnk_08112298
	lsls r1, r6, #2
	adds r2, r1, r0
	ldrb r5, [r2]
	adds r1, #1
	adds r1, r1, r0
	b .L0804B60E
	.align 2, 0
.L0804B5FC: .4byte gUnk_08112298
.L0804B600:
	ldr r2, .L0804B62C @ =gUnk_08112298
	lsls r1, r6, #2
	adds r0, r1, #2
	adds r0, r0, r2
	ldrb r5, [r0]
	adds r1, #3
	adds r1, r1, r2
.L0804B60E:
	ldrb r7, [r1]
	cmp r5, #0xff
	beq .L0804B654
	adds r0, r4, #0
	bl GetAnimPosition
	cmp r0, #0
	bne .L0804B638
	ldr r0, .L0804B630 @ =gUnk_Banim_02000054
	ldr r1, [r0]
	lsls r0, r5, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldr r0, .L0804B634 @ =gUnk_Banim_0200F1C0
	b .L0804B644
	.align 2, 0
.L0804B62C: .4byte gUnk_08112298
.L0804B630: .4byte gUnk_Banim_02000054
.L0804B634: .4byte gUnk_Banim_0200F1C0
.L0804B638:
	ldr r0, .L0804B64C @ =gUnk_Banim_02000058
	ldr r1, [r0]
	lsls r0, r5, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldr r0, .L0804B650 @ =gUnk_Banim_02011BC0
.L0804B644:
	adds r1, r1, r0
	str r1, [r4, #0x24]
	str r1, [r4, #0x20]
	b .L0804B65E
	.align 2, 0
.L0804B64C: .4byte gUnk_Banim_02000058
.L0804B650: .4byte gUnk_Banim_02011BC0
.L0804B654:
	ldr r0, .L0804B6A4 @ =gUnk_085CBDA0
	str r0, [r4, #0x24]
	str r0, [r4, #0x20]
	movs r0, #0
	strh r0, [r4, #0x10]
.L0804B65E:
	movs r3, #0
	movs r2, #0
	strh r7, [r4, #0xa]
	ldr r0, .L0804B6A8 @ =0x0000F3FF
	ldrh r1, [r4, #8]
	ands r0, r1
	movs r5, #0x80
	lsls r5, r5, #4
	adds r1, r5, #0
	orrs r0, r1
	strh r0, [r4, #8]
	strh r2, [r4, #6]
	movs r0, #0xe0
	lsls r0, r0, #3
	ldrh r1, [r4, #0xc]
	ands r0, r1
	strh r0, [r4, #0xc]
	strb r6, [r4, #0x12]
	strb r3, [r4, #0x14]
	adds r0, r4, #0
	bl GetAnimPosition
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	subs r1, r1, r0
	lsls r1, r1, #0xb
	ldr r0, .L0804B6AC @ =gUnk_Banim_020041C0
	adds r1, r1, r0
	str r1, [r4, #0x30]
	bl BasSort
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0804B6A4: .4byte gUnk_085CBDA0
.L0804B6A8: .4byte 0x0000F3FF
.L0804B6AC: .4byte gUnk_Banim_020041C0

	thumb_func_start GetAnimLayer
GetAnimLayer: @ 0x0804B6B0
	movs r1, #0x80
	lsls r1, r1, #1
	ldrh r0, [r0, #0xc]
	ands r1, r0
	cmp r1, #0
	beq .L0804B6C0
	movs r0, #1
	b .L0804B6C2
.L0804B6C0:
	movs r0, #0
.L0804B6C2:
	bx lr

	thumb_func_start GetAnimPosition
GetAnimPosition: @ 0x0804B6C4
	movs r1, #0x80
	lsls r1, r1, #2
	ldrh r0, [r0, #0xc]
	ands r1, r0
	cmp r1, #0
	beq .L0804B6D4
	movs r0, #1
	b .L0804B6D6
.L0804B6D4:
	movs r0, #0
.L0804B6D6:
	bx lr

	thumb_func_start CheckRoundMiss
CheckRoundMiss: @ 0x0804B6D8
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #9
	bhi .L0804B71C
	lsls r0, r0, #2
	ldr r1, .L0804B6EC @ =.L0804B6F0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
.L0804B6EC: .4byte .L0804B6F0
.L0804B6F0: @ jump table
	.4byte .L0804B71C @ case 0
	.4byte .L0804B71C @ case 1
	.4byte .L0804B71C @ case 2
	.4byte .L0804B71C @ case 3
	.4byte .L0804B718 @ case 4
	.4byte .L0804B718 @ case 5
	.4byte .L0804B71C @ case 6
	.4byte .L0804B71C @ case 7
	.4byte .L0804B71C @ case 8
	.4byte .L0804B71C @ case 9
.L0804B718:
	movs r0, #1
	b .L0804B71E
.L0804B71C:
	movs r0, #0
.L0804B71E:
	bx lr

	thumb_func_start CheckRound1
CheckRound1: @ 0x0804B720
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #9
	bhi .L0804B764
	lsls r0, r0, #2
	ldr r1, .L0804B734 @ =.L0804B738
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
.L0804B734: .4byte .L0804B738
.L0804B738: @ jump table
	.4byte .L0804B764 @ case 0
	.4byte .L0804B764 @ case 1
	.4byte .L0804B764 @ case 2
	.4byte .L0804B764 @ case 3
	.4byte .L0804B764 @ case 4
	.4byte .L0804B764 @ case 5
	.4byte .L0804B760 @ case 6
	.4byte .L0804B760 @ case 7
	.4byte .L0804B760 @ case 8
	.4byte .L0804B764 @ case 9
.L0804B760:
	movs r0, #1
	b .L0804B766
.L0804B764:
	movs r0, #0
.L0804B766:
	bx lr

	thumb_func_start CheckRound2
CheckRound2: @ 0x0804B768
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #9
	bhi .L0804B7AC
	lsls r0, r0, #2
	ldr r1, .L0804B77C @ =.L0804B780
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
.L0804B77C: .4byte .L0804B780
.L0804B780: @ jump table
	.4byte .L0804B7A8 @ case 0
	.4byte .L0804B7A8 @ case 1
	.4byte .L0804B7A8 @ case 2
	.4byte .L0804B7A8 @ case 3
	.4byte .L0804B7AC @ case 4
	.4byte .L0804B7AC @ case 5
	.4byte .L0804B7AC @ case 6
	.4byte .L0804B7AC @ case 7
	.4byte .L0804B7AC @ case 8
	.4byte .L0804B7A8 @ case 9
.L0804B7A8:
	movs r0, #1
	b .L0804B7AE
.L0804B7AC:
	movs r0, #0
.L0804B7AE:
	bx lr

	thumb_func_start CheckRoundCrit
CheckRoundCrit: @ 0x0804B7B0
	push {lr}
	adds r2, r0, #0
	ldrb r0, [r2, #0x12]
	cmp r0, #9
	bhi .L0804B806
	lsls r0, r0, #2
	ldr r1, .L0804B7C4 @ =.L0804B7C8
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
.L0804B7C4: .4byte .L0804B7C8
.L0804B7C8: @ jump table
	.4byte .L0804B806 @ case 0
	.4byte .L0804B802 @ case 1
	.4byte .L0804B806 @ case 2
	.4byte .L0804B7F0 @ case 3
	.4byte .L0804B806 @ case 4
	.4byte .L0804B806 @ case 5
	.4byte .L0804B806 @ case 6
	.4byte .L0804B806 @ case 7
	.4byte .L0804B806 @ case 8
	.4byte .L0804B806 @ case 9
.L0804B7F0:
	adds r0, r2, #0
	bl GetAnimPosition
	cmp r0, #0
	bne .L0804B802
	bl GetEkrDragonStateTypeIdunn
	cmp r0, #0
	bne .L0804B806
.L0804B802:
	movs r0, #1
	b .L0804B808
.L0804B806:
	movs r0, #0
.L0804B808:
	pop {r1}
	bx r1

	thumb_func_start GetAnimAnotherSide
GetAnimAnotherSide: @ 0x0804B80C
	push {r4, lr}
	ldr r4, .L0804B824 @ =gAnims
	bl GetAnimPosition
	movs r1, #1
	eors r1, r0
	lsls r1, r1, #3
	adds r1, r1, r4
	ldr r0, [r1]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
.L0804B824: .4byte gAnims

	thumb_func_start GetAnimRoundType
GetAnimRoundType: @ 0x0804B828
	push {r4, lr}
	adds r4, r0, #0
	bl GetAnimPosition
	adds r1, r0, #0
	ldrh r0, [r4, #0xe]
	subs r0, #1
	lsls r0, r0, #1
	adds r0, r0, r1
	bl GetBattleAnimRoundType
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start GetAnimNextRoundType
GetAnimNextRoundType: @ 0x0804B848
	push {r4, lr}
	adds r4, r0, #0
	bl GetAnimPosition
	adds r1, r0, #0
	ldrh r4, [r4, #0xe]
	lsls r0, r4, #1
	adds r0, r0, r1
	bl GetBattleAnimRoundType
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start GetAnimRoundTypeAnotherSide
GetAnimRoundTypeAnotherSide: @ 0x0804B868
	push {r4, lr}
	adds r4, r0, #0
	bl GetAnimPosition
	adds r2, r0, #0
	ldrh r0, [r4, #0xe]
	subs r0, #1
	lsls r0, r0, #1
	movs r1, #1
	eors r1, r2
	adds r0, r0, r1
	bl GetBattleAnimRoundType
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start GetAnimNextRoundTypeAnotherSide
GetAnimNextRoundTypeAnotherSide: @ 0x0804B88C
	push {r4, lr}
	adds r4, r0, #0
	bl GetAnimPosition
	adds r2, r0, #0
	ldrh r4, [r4, #0xe]
	lsls r0, r4, #1
	movs r1, #1
	eors r1, r2
	adds r0, r0, r1
	bl GetBattleAnimRoundType
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start SetAnimStateHidden
SetAnimStateHidden: @ 0x0804B8B0
	cmp r0, #0
	bne .L0804B8C8
	ldr r2, .L0804B8C4 @ =gAnims
	ldr r3, [r2]
	movs r1, #2
	ldrh r0, [r3]
	orrs r0, r1
	strh r0, [r3]
	ldr r3, [r2, #4]
	b .L0804B8DA
	.align 2, 0
.L0804B8C4: .4byte gAnims
.L0804B8C8:
	cmp r0, #1
	bne .L0804B8E0
	ldr r2, .L0804B8E4 @ =gAnims
	ldr r3, [r2, #8]
	movs r1, #2
	ldrh r0, [r3]
	orrs r0, r1
	strh r0, [r3]
	ldr r3, [r2, #0xc]
.L0804B8DA:
	ldrh r0, [r3]
	orrs r0, r1
	strh r0, [r3]
.L0804B8E0:
	bx lr
	.align 2, 0
.L0804B8E4: .4byte gAnims

	thumb_func_start SetAnimStateUnHidden
SetAnimStateUnHidden: @ 0x0804B8E8
	push {r4, lr}
	cmp r0, #0
	bne .L0804B908
	ldr r2, .L0804B900 @ =gAnims
	ldr r3, [r2]
	ldr r1, .L0804B904 @ =0x0000FFFD
	adds r0, r1, #0
	ldrh r4, [r3]
	ands r0, r4
	strh r0, [r3]
	ldr r3, [r2, #4]
	b .L0804B91C
	.align 2, 0
.L0804B900: .4byte gAnims
.L0804B904: .4byte 0x0000FFFD
.L0804B908:
	cmp r0, #1
	bne .L0804B922
	ldr r2, .L0804B928 @ =gAnims
	ldr r3, [r2, #8]
	ldr r1, .L0804B92C @ =0x0000FFFD
	adds r0, r1, #0
	ldrh r4, [r3]
	ands r0, r4
	strh r0, [r3]
	ldr r3, [r2, #0xc]
.L0804B91C:
	ldrh r0, [r3]
	ands r1, r0
	strh r1, [r3]
.L0804B922:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0804B928: .4byte gAnims
.L0804B92C: .4byte 0x0000FFFD

	thumb_func_start func_fe6_0804B930
func_fe6_0804B930: @ 0x0804B930
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r4, r1, #0
	cmp r4, #0
	bne .L0804B93C
	b .L0804BAC2
.L0804B93C:
	movs r5, #0xf0
	lsls r5, r5, #8
	ldrh r0, [r4, #0xc]
	ands r5, r0
	cmp r5, #0
	bne .L0804B94A
	b .L0804BAC2
.L0804B94A:
	movs r0, #0x80
	lsls r0, r0, #5
	ands r0, r5
	cmp r0, #0
	bne .L0804B956
	b .L0804BA84
.L0804B956:
	ldrb r0, [r4, #0x14]
	cmp r0, #0
	bne .L0804B95E
	b .L0804BA7A
.L0804B95E:
	ldrb r1, [r4, #0x14]
	adds r0, r1, r4
	ldrb r0, [r0, #0x14]
	cmp r0, #0x32
	bls .L0804B96A
	b .L0804BA72
.L0804B96A:
	lsls r0, r0, #2
	ldr r1, .L0804B974 @ =.L0804B978
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
.L0804B974: .4byte .L0804B978
.L0804B978: @ jump table
	.4byte .L0804BA72 @ case 0
	.4byte .L0804BA44 @ case 1
	.4byte .L0804BA44 @ case 2
	.4byte .L0804BA5C @ case 3
	.4byte .L0804BA5C @ case 4
	.4byte .L0804BA4C @ case 5
	.4byte .L0804BA72 @ case 6
	.4byte .L0804BA72 @ case 7
	.4byte .L0804BA72 @ case 8
	.4byte .L0804BA72 @ case 9
	.4byte .L0804BA72 @ case 10
	.4byte .L0804BA72 @ case 11
	.4byte .L0804BA72 @ case 12
	.4byte .L0804BA64 @ case 13
	.4byte .L0804BA72 @ case 14
	.4byte .L0804BA72 @ case 15
	.4byte .L0804BA72 @ case 16
	.4byte .L0804BA72 @ case 17
	.4byte .L0804BA72 @ case 18
	.4byte .L0804BA72 @ case 19
	.4byte .L0804BA72 @ case 20
	.4byte .L0804BA72 @ case 21
	.4byte .L0804BA72 @ case 22
	.4byte .L0804BA72 @ case 23
	.4byte .L0804BA6C @ case 24
	.4byte .L0804BA72 @ case 25
	.4byte .L0804BA72 @ case 26
	.4byte .L0804BA72 @ case 27
	.4byte .L0804BA72 @ case 28
	.4byte .L0804BA72 @ case 29
	.4byte .L0804BA72 @ case 30
	.4byte .L0804BA72 @ case 31
	.4byte .L0804BA72 @ case 32
	.4byte .L0804BA72 @ case 33
	.4byte .L0804BA72 @ case 34
	.4byte .L0804BA72 @ case 35
	.4byte .L0804BA72 @ case 36
	.4byte .L0804BA72 @ case 37
	.4byte .L0804BA72 @ case 38
	.4byte .L0804BA72 @ case 39
	.4byte .L0804BA72 @ case 40
	.4byte .L0804BA72 @ case 41
	.4byte .L0804BA72 @ case 42
	.4byte .L0804BA72 @ case 43
	.4byte .L0804BA72 @ case 44
	.4byte .L0804BA72 @ case 45
	.4byte .L0804BA72 @ case 46
	.4byte .L0804BA72 @ case 47
	.4byte .L0804BA72 @ case 48
	.4byte .L0804BA72 @ case 49
	.4byte .L0804BA72 @ case 50
.L0804BA44:
	adds r0, r4, #0
	bl func_fe6_0804BACC
	b .L0804BA72
.L0804BA4C:
	adds r0, r4, #0
	bl GetAnimLayer
	cmp r0, #0
	bne .L0804BA5C
	adds r0, r4, #0
	bl func_fe6_08058158
.L0804BA5C:
	ldr r0, [r4, #0x20]
	adds r0, #4
	str r0, [r4, #0x20]
	b .L0804BA72
.L0804BA64:
	adds r0, r4, #0
	bl func_fe6_0804BAF0
	b .L0804BA72
.L0804BA6C:
	adds r0, r4, #0
	bl func_fe6_0804BACC
.L0804BA72:
	ldrb r0, [r4, #0x14]
	subs r0, #1
	strb r0, [r4, #0x14]
	b .L0804B956
.L0804BA7A:
	movs r0, #0xe7
	lsls r0, r0, #8
	ldrh r1, [r4, #0xc]
	ands r0, r1
	strh r0, [r4, #0xc]
.L0804BA84:
	movs r0, #0x80
	lsls r0, r0, #6
	ands r0, r5
	cmp r0, #0
	beq .L0804BAB4
	adds r0, r4, #0
	bl GetAnimLayer
	cmp r0, #0
	bne .L0804BAAA
	ldr r1, [r6, #0x28]
	ldr r0, [r4, #0x28]
	cmp r1, r0
	beq .L0804BAAA
	adds r0, r4, #0
	bl RegisterAISSheetGraphics
	ldr r0, [r4, #0x28]
	str r0, [r6, #0x28]
.L0804BAAA:
	movs r0, #0xd7
	lsls r0, r0, #8
	ldrh r1, [r4, #0xc]
	ands r0, r1
	strh r0, [r4, #0xc]
.L0804BAB4:
	movs r0, #0x80
	lsls r0, r0, #7
	ands r5, r0
	cmp r5, #0
	beq .L0804BAC2
	ldr r0, .L0804BAC8 @ =0x0000FFFF
	strh r0, [r4, #0xe]
.L0804BAC2:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L0804BAC8: .4byte 0x0000FFFF

	thumb_func_start func_fe6_0804BACC
func_fe6_0804BACC: @ 0x0804BACC
	adds r1, r0, #0
	ldr r0, .L0804BAEC @ =0x0000FFFE
	strh r0, [r1, #0xe]
	movs r0, #8
	ldrh r2, [r1, #0x10]
	ands r0, r2
	cmp r0, #0
	beq .L0804BAE8
	strh r0, [r1, #0x10]
	movs r0, #0
	strh r0, [r1, #0xe]
	ldr r0, [r1, #0x20]
	adds r0, #4
	str r0, [r1, #0x20]
.L0804BAE8:
	bx lr
	.align 2, 0
.L0804BAEC: .4byte 0x0000FFFE

	thumb_func_start func_fe6_0804BAF0
func_fe6_0804BAF0: @ 0x0804BAF0
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	ldr r6, [r7, #0x44]
	bl GetAnimLayer
	cmp r0, #0
	bne .L0804BB40
	ldr r3, .L0804BB48 @ =gUnk_08112298
	ldrh r1, [r6, #6]
	lsls r0, r1, #5
	ldr r1, .L0804BB4C @ =banim_data
	adds r0, r0, r1
	ldr r1, [r0, #0xc]
	ldr r2, [r6, #0x10]
	ldr r4, [r6, #0x14]
	ldr r5, [r6, #0x24]
	ldrb r3, [r3, #0x18]
	lsls r0, r3, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r1, r5, r0
	ldr r0, [r1, #4]
	str r0, [r2, #0x28]
	ldr r5, [r2, #0x30]
	ldr r0, [r1, #8]
	adds r5, r5, r0
	str r5, [r2, #0x3c]
	ldr r5, [r4, #0x30]
	ldr r0, .L0804BB50 @ =0x000057F0
	adds r5, r5, r0
	str r5, [r4, #0x3c]
	ldr r1, [r6, #0x28]
	ldr r0, [r7, #0x28]
	cmp r1, r0
	beq .L0804BB40
	adds r0, r7, #0
	bl NewEkrChienCHR
	ldr r0, [r7, #0x28]
	str r0, [r6, #0x28]
.L0804BB40:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0804BB48: .4byte gUnk_08112298
.L0804BB4C: .4byte banim_data
.L0804BB50: .4byte 0x000057F0

	thumb_func_start func_fe6_0804BB54
func_fe6_0804BB54: @ 0x0804BB54
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r6, r0, #0
	ldr r0, .L0804BBD8 @ =banim_data
	mov sb, r0
	ldr r2, .L0804BBDC @ =gUnk_08112298
	ldrh r3, [r6, #8]
	lsls r1, r3, #2
	adds r0, r1, r2
	ldrb r4, [r0]
	adds r0, r1, #1
	adds r0, r0, r2
	ldrb r0, [r0]
	mov r8, r0
	adds r0, r1, #2
	adds r0, r0, r2
	ldrb r5, [r0]
	adds r1, #3
	adds r1, r1, r2
	ldrb r1, [r1]
	str r1, [sp]
	ldrh r1, [r6, #6]
	lsls r0, r1, #5
	add r0, sb
	ldr r0, [r0, #0x10]
	ldr r1, [r6, #0x24]
	bl LZ77UnCompWram
	ldrh r2, [r6, #6]
	lsls r0, r2, #5
	mov r3, sb
	adds r1, r0, r3
	ldr r2, [r1, #0xc]
	ldr r3, [r6, #0x24]
	ldr r7, .L0804BBE0 @ =gUnk_085CBDA0
	cmp r4, #0xff
	beq .L0804BBAE
	lsls r0, r4, #2
	adds r0, r0, r2
	ldr r0, [r0]
	adds r7, r3, r0
.L0804BBAE:
	ldr r0, .L0804BBE0 @ =gUnk_085CBDA0
	mov sl, r0
	cmp r5, #0xff
	beq .L0804BBC0
	lsls r0, r5, #2
	adds r0, r0, r2
	ldr r0, [r0]
	adds r3, r3, r0
	mov sl, r3
.L0804BBC0:
	ldrh r0, [r6, #0xa]
	cmp r0, #0
	bne .L0804BBE8
	ldr r4, [r6, #0x20]
	ldr r0, [r1, #0x18]
	adds r1, r4, #0
	bl LZ77UnCompWram
	ldr r2, .L0804BBE4 @ =0x000057F0
	adds r1, r4, r2
	b .L0804BBF6
	.align 2, 0
.L0804BBD8: .4byte banim_data
.L0804BBDC: .4byte gUnk_08112298
.L0804BBE0: .4byte gUnk_085CBDA0
.L0804BBE4: .4byte 0x000057F0
.L0804BBE8:
	ldr r4, [r6, #0x20]
	ldr r0, [r1, #0x14]
	adds r1, r4, #0
	bl LZ77UnCompWram
	ldr r3, .L0804BCC0 @ =0x000057F0
	adds r1, r4, r3
.L0804BBF6:
	movs r0, #1
	str r0, [r1]
	mov r1, r8
	adds r0, r7, #0
	bl BasCreate
	adds r2, r0, #0
	ldr r0, [r6, #0x20]
	str r0, [r2, #0x30]
	ldrh r0, [r6, #2]
	movs r4, #0
	strh r0, [r2, #2]
	ldrh r0, [r6, #4]
	strh r0, [r2, #4]
	ldrh r1, [r6, #0xe]
	lsls r0, r1, #0xc
	movs r3, #0x80
	lsls r3, r3, #4
	adds r5, r3, #0
	orrs r0, r5
	ldrh r1, [r6, #0xc]
	orrs r0, r1
	strh r0, [r2, #8]
	ldrh r3, [r6, #0xa]
	lsls r0, r3, #9
	movs r3, #0x80
	lsls r3, r3, #3
	adds r1, r3, #0
	orrs r0, r1
	ldrh r1, [r2, #0xc]
	orrs r0, r1
	strh r0, [r2, #0xc]
	strh r4, [r2, #0xe]
	ldrh r0, [r6, #8]
	strb r0, [r2, #0x12]
	ldr r0, [r6, #0x18]
	str r0, [r2, #0x2c]
	str r2, [r6, #0x10]
	str r6, [r2, #0x44]
	ldr r1, [sp]
	mov r0, sl
	bl BasCreate
	adds r2, r0, #0
	ldr r0, [r6, #0x20]
	str r0, [r2, #0x30]
	ldrh r0, [r6, #2]
	strh r0, [r2, #2]
	ldrh r0, [r6, #4]
	strh r0, [r2, #4]
	ldrh r3, [r6, #0xe]
	lsls r0, r3, #0xc
	orrs r0, r5
	ldrh r1, [r6, #0xc]
	orrs r0, r1
	strh r0, [r2, #8]
	ldrh r3, [r6, #0xa]
	lsls r0, r3, #9
	movs r3, #0xa0
	lsls r3, r3, #3
	adds r1, r3, #0
	orrs r0, r1
	ldrh r1, [r2, #0xc]
	orrs r0, r1
	strh r0, [r2, #0xc]
	strh r4, [r2, #0xe]
	ldrh r0, [r6, #8]
	strb r0, [r2, #0x12]
	ldr r0, [r6, #0x18]
	str r0, [r2, #0x2c]
	str r2, [r6, #0x14]
	str r6, [r2, #0x44]
	ldrh r2, [r6, #6]
	lsls r0, r2, #5
	add r0, sb
	ldr r0, [r0, #0x1c]
	ldr r1, [r6, #0x1c]
	bl LZ77UnCompWram
	ldrb r3, [r6, #1]
	lsls r1, r3, #5
	ldr r0, [r6, #0x1c]
	adds r0, r0, r1
	ldrh r2, [r6, #0xe]
	lsls r1, r2, #5
	ldr r2, .L0804BCC4 @ =gPal+0x200
	adds r1, r1, r2
	movs r2, #8
	bl CpuFastSet
	str r4, [r6, #0x28]
	bl EnablePalSync
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0804BCC0: .4byte 0x000057F0
.L0804BCC4: .4byte gPal+0x200

	thumb_func_start func_fe6_0804BCC8
func_fe6_0804BCC8: @ 0x0804BCC8
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r6, r0, #0
	ldr r0, .L0804BD38 @ =banim_data
	mov sb, r0
	ldr r2, .L0804BD3C @ =gUnk_08112298
	ldrh r1, [r6, #8]
	lsls r0, r1, #2
	adds r1, r0, r2
	ldrb r4, [r1]
	adds r0, #2
	adds r0, r0, r2
	ldrb r5, [r0]
	ldrh r2, [r6, #6]
	lsls r0, r2, #5
	add r0, sb
	ldr r0, [r0, #0x10]
	ldr r1, [r6, #0x24]
	bl LZ77UnCompWram
	ldrh r3, [r6, #6]
	lsls r0, r3, #5
	mov r7, sb
	adds r1, r0, r7
	ldr r2, [r1, #0xc]
	ldr r3, [r6, #0x24]
	ldr r7, .L0804BD40 @ =gUnk_085CBDA0
	cmp r4, #0xff
	beq .L0804BD0E
	lsls r0, r4, #2
	adds r0, r0, r2
	ldr r0, [r0]
	adds r7, r3, r0
.L0804BD0E:
	ldr r0, .L0804BD40 @ =gUnk_085CBDA0
	mov r8, r0
	cmp r5, #0xff
	beq .L0804BD20
	lsls r0, r5, #2
	adds r0, r0, r2
	ldr r0, [r0]
	adds r3, r3, r0
	mov r8, r3
.L0804BD20:
	ldrh r0, [r6, #0xa]
	cmp r0, #0
	bne .L0804BD48
	ldr r4, [r6, #0x20]
	ldr r0, [r1, #0x18]
	adds r1, r4, #0
	bl LZ77UnCompWram
	ldr r2, .L0804BD44 @ =0x000057F0
	adds r1, r4, r2
	b .L0804BD56
	.align 2, 0
.L0804BD38: .4byte banim_data
.L0804BD3C: .4byte gUnk_08112298
.L0804BD40: .4byte gUnk_085CBDA0
.L0804BD44: .4byte 0x000057F0
.L0804BD48:
	ldr r4, [r6, #0x20]
	ldr r0, [r1, #0x14]
	adds r1, r4, #0
	bl LZ77UnCompWram
	ldr r3, .L0804BE0C @ =0x000057F0
	adds r1, r4, r3
.L0804BD56:
	movs r0, #1
	str r0, [r1]
	ldr r5, [r6, #0x10]
	str r7, [r5, #0x24]
	str r7, [r5, #0x20]
	ldr r0, [r6, #0x20]
	str r0, [r5, #0x30]
	ldrh r0, [r6, #2]
	movs r4, #0
	movs r2, #0
	strh r0, [r5, #2]
	ldrh r0, [r6, #4]
	strh r0, [r5, #4]
	ldrh r7, [r6, #0xe]
	lsls r0, r7, #0xc
	movs r1, #0x80
	lsls r1, r1, #4
	adds r3, r1, #0
	orrs r0, r3
	ldrh r7, [r6, #0xc]
	orrs r0, r7
	strh r0, [r5, #8]
	movs r1, #0xe0
	lsls r1, r1, #3
	adds r0, r1, #0
	ldrh r7, [r5, #0xc]
	ands r0, r7
	strh r0, [r5, #0xc]
	strh r2, [r5, #0x10]
	strh r2, [r5, #6]
	strh r2, [r5, #0xe]
	ldrh r0, [r6, #8]
	strb r0, [r5, #0x12]
	ldr r0, [r6, #0x18]
	str r0, [r5, #0x2c]
	strb r4, [r5, #0x14]
	str r5, [r6, #0x10]
	ldr r5, [r6, #0x14]
	mov r0, r8
	str r0, [r5, #0x24]
	str r0, [r5, #0x20]
	ldr r0, [r6, #0x20]
	str r0, [r5, #0x30]
	ldrh r0, [r6, #2]
	strh r0, [r5, #2]
	ldrh r0, [r6, #4]
	strh r0, [r5, #4]
	ldrh r7, [r6, #0xe]
	lsls r0, r7, #0xc
	orrs r0, r3
	ldrh r3, [r6, #0xc]
	orrs r0, r3
	strh r0, [r5, #8]
	ldrh r7, [r5, #0xc]
	ands r1, r7
	strh r1, [r5, #0xc]
	strh r2, [r5, #0x10]
	strh r2, [r5, #6]
	strh r2, [r5, #0xe]
	ldrh r0, [r6, #8]
	strb r0, [r5, #0x12]
	ldr r0, [r6, #0x18]
	str r0, [r5, #0x2c]
	strb r4, [r5, #0x14]
	str r5, [r6, #0x14]
	ldrh r1, [r6, #6]
	lsls r0, r1, #5
	add r0, sb
	ldr r0, [r0, #0x1c]
	ldr r1, [r6, #0x1c]
	bl LZ77UnCompWram
	ldrb r2, [r6, #1]
	lsls r1, r2, #5
	ldr r0, [r6, #0x1c]
	adds r0, r0, r1
	ldrh r6, [r6, #0xe]
	lsls r1, r6, #5
	ldr r2, .L0804BE10 @ =gPal+0x200
	adds r1, r1, r2
	movs r2, #8
	bl CpuFastSet
	bl EnablePalSync
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0804BE0C: .4byte 0x000057F0
.L0804BE10: .4byte gPal+0x200

	thumb_func_start func_fe6_0804BE14
func_fe6_0804BE14: @ 0x0804BE14
	push {lr}
	strh r1, [r0, #6]
	bl func_fe6_0804BCC8
	pop {r0}
	bx r0

	thumb_func_start func_fe6_0804BE20
func_fe6_0804BE20: @ 0x0804BE20
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	strh r1, [r0, #2]
	strh r2, [r0, #4]
	ldr r2, [r0, #0x10]
	strh r1, [r2, #2]
	ldrh r1, [r0, #4]
	strh r1, [r2, #4]
	ldr r2, [r0, #0x14]
	ldrh r1, [r0, #2]
	strh r1, [r2, #2]
	ldrh r0, [r0, #4]
	strh r0, [r2, #4]
	bx lr

	thumb_func_start func_fe6_0804BE3C
func_fe6_0804BE3C: @ 0x0804BE3C
	lsls r1, r1, #0x10
	ldr r2, [r0, #0x10]
	lsrs r1, r1, #6
	strh r1, [r2, #8]
	ldr r2, [r0, #0x14]
	strh r1, [r2, #8]
	bx lr
	.align 2, 0

	thumb_func_start func_fe6_0804BE4C
func_fe6_0804BE4C: @ 0x0804BE4C
	ldr r1, [r0, #0x10]
	ldr r2, [r0, #0x14]
	ldr r0, .L0804BE64 @ =0x0000FFFE
	ldrh r1, [r1, #0xe]
	cmp r1, r0
	beq .L0804BE68
	ldrh r2, [r2, #0xe]
	cmp r2, r0
	beq .L0804BE68
	movs r0, #0
	b .L0804BE6A
	.align 2, 0
.L0804BE64: .4byte 0x0000FFFE
.L0804BE68:
	movs r0, #1
.L0804BE6A:
	bx lr

	thumb_func_start func_fe6_0804BE6C
func_fe6_0804BE6C: @ 0x0804BE6C
	ldr r3, [r0, #0x10]
	movs r2, #8
	ldrh r1, [r3, #0x10]
	orrs r1, r2
	strh r1, [r3, #0x10]
	ldr r3, [r0, #0x14]
	ldrh r0, [r3, #0x10]
	orrs r0, r2
	strh r0, [r3, #0x10]
	bx lr

	thumb_func_start func_fe6_0804BE80
func_fe6_0804BE80: @ 0x0804BE80
	ldr r1, [r0, #0x10]
	ldr r0, .L0804BE90 @ =0x0000FFFF
	ldrh r1, [r1, #0xe]
	cmp r1, r0
	bne .L0804BE94
	movs r0, #1
	b .L0804BE96
	.align 2, 0
.L0804BE90: .4byte 0x0000FFFF
.L0804BE94:
	movs r0, #0
.L0804BE96:
	bx lr

	thumb_func_start func_fe6_0804BE98
func_fe6_0804BE98: @ 0x0804BE98
	push {r4, lr}
	ldr r4, .L0804BEB0 @ =gUnk_Banim_0201E138
	ldr r0, .L0804BEB4 @ =gUnk_085CBDF0
	movs r1, #4
	bl SpawnProc
	str r0, [r4]
	bl BasInit
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0804BEB0: .4byte gUnk_Banim_0201E138
.L0804BEB4: .4byte gUnk_085CBDF0

	thumb_func_start func_fe6_0804BEB8
func_fe6_0804BEB8: @ 0x0804BEB8
	push {lr}
	ldr r0, .L0804BEC8 @ =gUnk_Banim_0201E138
	ldr r0, [r0]
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
.L0804BEC8: .4byte gUnk_Banim_0201E138

	thumb_func_start func_fe6_0804BECC
func_fe6_0804BECC: @ 0x0804BECC
	push {lr}
	bl BasUpdateAll
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_fe6_0804BED8
func_fe6_0804BED8: @ 0x0804BED8
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, .L0804BEFC @ =gUnk_085CBE08
	movs r1, #4
	bl SpawnProc
	adds r5, r0, #0
	adds r0, r4, #0
	bl func_fe6_0804BB54
	str r4, [r5, #0x5c]
	str r5, [r4, #0x30]
	movs r0, #1
	strb r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0804BEFC: .4byte gUnk_085CBE08

	thumb_func_start func_fe6_0804BF00
func_fe6_0804BF00: @ 0x0804BF00
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x10]
	bl BasRemove
	ldr r0, [r4, #0x14]
	bl BasRemove
	movs r0, #0
	str r0, [r4, #0x10]
	str r0, [r4, #0x14]
	ldr r0, [r4, #0x30]
	bl Proc_End
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_fe6_0804BF24
func_fe6_0804BF24: @ 0x0804BF24
	push {r4, lr}
	ldr r4, [r0, #0x5c]
	ldr r1, [r4, #0x10]
	adds r0, r4, #0
	bl func_fe6_0804B930
	ldr r1, [r4, #0x14]
	adds r0, r4, #0
	bl func_fe6_0804B930
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_fe6_0804BF40
func_fe6_0804BF40: @ 0x0804BF40
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0xc
	adds r6, r0, #0
	movs r0, #0
	ldrsh r1, [r6, r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	ldr r2, .L0804BFA8 @ =0x087EA008
	adds r0, r0, r2
	mov r8, r0
	movs r0, #6
	ldrsh r1, [r6, r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r5, r0, r2
	movs r1, #0
	ldrsh r0, [r6, r1]
	movs r4, #1
	rsbs r4, r4, #0
	cmp r0, r4
	beq .L0804BF7E
	mov r2, r8
	ldr r0, [r2, #0xc]
	ldr r1, [r6, #0x20]
	bl LZ77UnCompWram
.L0804BF7E:
	movs r1, #6
	ldrsh r0, [r6, r1]
	cmp r0, r4
	beq .L0804BF94
	ldr r0, [r5, #0xc]
	ldr r1, [r6, #0x20]
	movs r2, #0x80
	lsls r2, r2, #5
	adds r1, r1, r2
	bl LZ77UnCompWram
.L0804BF94:
	movs r1, #0xc
	ldrsh r0, [r6, r1]
	cmp r0, #3
	bgt .L0804BFAC
	cmp r0, #1
	bge .L0804BFBA
	cmp r0, #0
	beq .L0804BFB0
	b .L0804BFBA
	.align 2, 0
.L0804BFA8: .4byte 0x087EA008
.L0804BFAC:
	cmp r0, #4
	bne .L0804BFBA
.L0804BFB0:
	ldr r3, [r6, #0x20]
	movs r2, #0x80
	lsls r2, r2, #5
	adds r7, r3, r2
	b .L0804BFC8
.L0804BFBA:
	ldr r0, [r6, #0x20]
	movs r1, #0x80
	lsls r1, r1, #4
	adds r3, r0, r1
	movs r2, #0xc0
	lsls r2, r2, #5
	adds r7, r0, r2
.L0804BFC8:
	mov r0, r8
	ldr r0, [r0, #0x10]
	mov r8, r0
	ldr r5, [r5, #0x10]
	mov sb, r5
	movs r1, #0xe
	ldrsh r4, [r6, r1]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r4, r0
	beq .L0804C04C
	cmp r4, r0
	blt .L0804C0AC
	cmp r4, #3
	bgt .L0804C0AC
	movs r2, #4
	ldrsh r0, [r6, r2]
	adds r0, #0x40
	lsls r0, r0, #5
	movs r4, #0xc0
	lsls r4, r4, #0x13
	adds r0, r0, r4
	ldr r1, [r6, #0x1c]
	adds r1, r1, r0
	movs r5, #0x80
	lsls r5, r5, #4
	adds r0, r3, #0
	adds r2, r5, #0
	bl RegisterDataMove
	movs r1, #0xa
	ldrsh r0, [r6, r1]
	lsls r0, r0, #5
	adds r0, r0, r4
	ldr r1, [r6, #0x1c]
	adds r1, r1, r0
	adds r0, r7, #0
	adds r2, r5, #0
	bl RegisterDataMove
	movs r2, #2
	ldrsh r1, [r6, r2]
	lsls r1, r1, #5
	ldr r4, .L0804C048 @ =gPal
	adds r1, r1, r4
	mov r0, r8
	movs r2, #8
	bl CpuFastSet
	movs r0, #8
	ldrsh r1, [r6, r0]
	lsls r1, r1, #5
	adds r1, r1, r4
	mov r0, sb
	movs r2, #8
	bl CpuFastSet
	bl EnablePalSync
	adds r0, r6, #0
	bl func_fe6_0804C330
	b .L0804C0AC
	.align 2, 0
.L0804C048: .4byte gPal
.L0804C04C:
	movs r1, #0
	ldrsh r0, [r6, r1]
	cmp r0, r4
	beq .L0804C07A
	movs r2, #4
	ldrsh r0, [r6, r2]
	lsls r0, r0, #5
	ldr r1, [r6, #0x1c]
	adds r1, r1, r0
	movs r2, #0x80
	lsls r2, r2, #4
	adds r0, r3, #0
	bl RegisterDataMove
	movs r0, #2
	ldrsh r1, [r6, r0]
	lsls r1, r1, #5
	ldr r0, .L0804C0C4 @ =gPal+0x200
	adds r1, r1, r0
	mov r0, r8
	movs r2, #8
	bl CpuFastSet
.L0804C07A:
	movs r1, #6
	ldrsh r0, [r6, r1]
	cmp r0, r4
	beq .L0804C0A8
	movs r2, #0xa
	ldrsh r0, [r6, r2]
	lsls r0, r0, #5
	ldr r1, [r6, #0x1c]
	adds r1, r1, r0
	movs r2, #0x80
	lsls r2, r2, #4
	adds r0, r7, #0
	bl RegisterDataMove
	movs r0, #8
	ldrsh r1, [r6, r0]
	lsls r1, r1, #5
	ldr r0, .L0804C0C4 @ =gPal+0x200
	adds r1, r1, r0
	mov r0, sb
	movs r2, #8
	bl CpuFastSet
.L0804C0A8:
	bl EnablePalSync
.L0804C0AC:
	ldrh r0, [r6, #0xe]
	adds r0, #1
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #4
	bls .L0804C0BA
	b .L0804C2DA
.L0804C0BA:
	lsls r0, r0, #2
	ldr r1, .L0804C0C8 @ =.L0804C0CC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
.L0804C0C4: .4byte gPal+0x200
.L0804C0C8: .4byte .L0804C0CC
.L0804C0CC: @ jump table
	.4byte .L0804C100 @ case 0
	.4byte .L0804C0E0 @ case 1
	.4byte .L0804C0E8 @ case 2
	.4byte .L0804C0F0 @ case 3
	.4byte .L0804C0F8 @ case 4
.L0804C0E0:
	movs r0, #1
	bl EnableBgSync
	b .L0804C2DA
.L0804C0E8:
	movs r0, #2
	bl EnableBgSync
	b .L0804C2DA
.L0804C0F0:
	movs r0, #4
	bl EnableBgSync
	b .L0804C2DA
.L0804C0F8:
	movs r0, #8
	bl EnableBgSync
	b .L0804C2DA
.L0804C100:
	movs r0, #0
	str r0, [r6, #0x14]
	str r0, [r6, #0x18]
	movs r2, #0
	ldrsh r1, [r6, r2]
	subs r0, #1
	cmp r1, r0
	beq .L0804C1EE
	movs r1, #0xc
	ldrsh r0, [r6, r1]
	cmp r0, #4
	bhi .L0804C1EE
	lsls r0, r0, #2
	ldr r1, .L0804C124 @ =.L0804C128
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
.L0804C124: .4byte .L0804C128
.L0804C128: @ jump table
	.4byte .L0804C13C @ case 0
	.4byte .L0804C168 @ case 1
	.4byte .L0804C194 @ case 2
	.4byte .L0804C1C0 @ case 3
	.4byte .L0804C13C @ case 4
.L0804C13C:
	movs r2, #2
	ldrsh r0, [r6, r2]
	lsls r0, r0, #0xc
	ldrh r1, [r6, #4]
	orrs r0, r1
	movs r2, #0xc0
	lsls r2, r2, #4
	adds r1, r2, #0
	orrs r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r2, .L0804C164 @ =gUnk_085CCF38
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	movs r0, #4
	str r0, [sp, #8]
	movs r0, #0x48
	b .L0804C1E4
	.align 2, 0
.L0804C164: .4byte gUnk_085CCF38
.L0804C168:
	movs r1, #2
	ldrsh r0, [r6, r1]
	lsls r0, r0, #0xc
	ldrh r2, [r6, #4]
	orrs r0, r2
	movs r2, #0xc0
	lsls r2, r2, #4
	adds r1, r2, #0
	orrs r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r2, .L0804C190 @ =gUnk_085CCE38
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	movs r0, #4
	str r0, [sp, #8]
	movs r0, #0x20
	b .L0804C1E4
	.align 2, 0
.L0804C190: .4byte gUnk_085CCE38
.L0804C194:
	movs r1, #2
	ldrsh r0, [r6, r1]
	lsls r0, r0, #0xc
	ldrh r2, [r6, #4]
	orrs r0, r2
	movs r2, #0xc0
	lsls r2, r2, #4
	adds r1, r2, #0
	orrs r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r2, .L0804C1BC @ =gUnk_085CCE38
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	movs r0, #4
	str r0, [sp, #8]
	movs r0, #0x40
	b .L0804C1E4
	.align 2, 0
.L0804C1BC: .4byte gUnk_085CCE38
.L0804C1C0:
	movs r1, #2
	ldrsh r0, [r6, r1]
	lsls r0, r0, #0xc
	ldrh r2, [r6, #4]
	orrs r0, r2
	movs r2, #0xc0
	lsls r2, r2, #4
	adds r1, r2, #0
	orrs r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r2, .L0804C20C @ =gUnk_085CCF38
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	movs r0, #4
	str r0, [sp, #8]
	movs r0, #0x78
.L0804C1E4:
	movs r1, #0x68
	movs r3, #2
	bl NewEkrsubAnimeEmulator
	str r0, [r6, #0x14]
.L0804C1EE:
	movs r0, #6
	ldrsh r1, [r6, r0]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq .L0804C2DA
	movs r1, #0xc
	ldrsh r0, [r6, r1]
	cmp r0, #4
	bhi .L0804C2DA
	lsls r0, r0, #2
	ldr r1, .L0804C210 @ =.L0804C214
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
.L0804C20C: .4byte gUnk_085CCF38
.L0804C210: .4byte .L0804C214
.L0804C214: @ jump table
	.4byte .L0804C228 @ case 0
	.4byte .L0804C254 @ case 1
	.4byte .L0804C280 @ case 2
	.4byte .L0804C2AC @ case 3
	.4byte .L0804C228 @ case 4
.L0804C228:
	movs r2, #8
	ldrsh r0, [r6, r2]
	lsls r0, r0, #0xc
	ldrh r1, [r6, #0xa]
	orrs r0, r1
	movs r2, #0xc0
	lsls r2, r2, #4
	adds r1, r2, #0
	orrs r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r2, .L0804C250 @ =gUnk_085CCEB8
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	movs r0, #4
	str r0, [sp, #8]
	movs r0, #0xa8
	b .L0804C2D0
	.align 2, 0
.L0804C250: .4byte gUnk_085CCEB8
.L0804C254:
	movs r1, #8
	ldrsh r0, [r6, r1]
	lsls r0, r0, #0xc
	ldrh r2, [r6, #0xa]
	orrs r0, r2
	movs r2, #0xc0
	lsls r2, r2, #4
	adds r1, r2, #0
	orrs r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r2, .L0804C27C @ =gUnk_085CCDAC
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	movs r0, #4
	str r0, [sp, #8]
	movs r0, #0xb0
	b .L0804C2D0
	.align 2, 0
.L0804C27C: .4byte gUnk_085CCDAC
.L0804C280:
	movs r1, #8
	ldrsh r0, [r6, r1]
	lsls r0, r0, #0xc
	ldrh r2, [r6, #0xa]
	orrs r0, r2
	movs r2, #0xc0
	lsls r2, r2, #4
	adds r1, r2, #0
	orrs r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r2, .L0804C2A8 @ =gUnk_085CCDAC
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	movs r0, #4
	str r0, [sp, #8]
	movs r0, #0xb0
	b .L0804C2D0
	.align 2, 0
.L0804C2A8: .4byte gUnk_085CCDAC
.L0804C2AC:
	movs r1, #8
	ldrsh r0, [r6, r1]
	lsls r0, r0, #0xc
	ldrh r2, [r6, #0xa]
	orrs r0, r2
	movs r2, #0xc0
	lsls r2, r2, #4
	adds r1, r2, #0
	orrs r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r2, .L0804C2E8 @ =gUnk_085CCDAC
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	movs r0, #4
	str r0, [sp, #8]
	movs r0, #0x80
.L0804C2D0:
	movs r1, #0x68
	movs r3, #2
	bl NewEkrsubAnimeEmulator
	str r0, [r6, #0x18]
.L0804C2DA:
	add sp, #0xc
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0804C2E8: .4byte gUnk_085CCDAC

	thumb_func_start func_fe6_0804C2EC
func_fe6_0804C2EC: @ 0x0804C2EC
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0xe
	ldrsh r1, [r4, r0]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne .L0804C310
	ldr r0, [r4, #0x14]
	cmp r0, #0
	beq .L0804C306
	bl Proc_End
.L0804C306:
	ldr r0, [r4, #0x18]
	cmp r0, #0
	beq .L0804C310
	bl Proc_End
.L0804C310:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_fe6_0804C318
func_fe6_0804C318: @ 0x0804C318
	push {r4, r5, lr}
	ldr r4, [sp, #0xc]
	ldr r5, [r0, #0x14]
	strh r1, [r5, #0x32]
	strh r2, [r5, #0x3a]
	ldr r5, [r0, #0x18]
	strh r3, [r5, #0x32]
	strh r4, [r5, #0x3a]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_fe6_0804C330
func_fe6_0804C330: @ 0x0804C330
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	adds r7, r0, #0
	movs r4, #0
	mov sl, r4
	ldr r0, .L0804C374 @ =gUnk_085CBDB0
	movs r2, #0xc
	ldrsh r1, [r7, r2]
	lsls r2, r1, #3
	adds r2, r2, r0
	ldr r2, [r2]
	str r2, [sp, #0x10]
	lsls r1, r1, #1
	adds r1, #1
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r1, [r1]
	str r1, [sp, #0x14]
	movs r0, #0
	bl func_fe6_08047C48
	movs r1, #0xc
	ldrsh r0, [r7, r1]
	cmp r0, #4
	bhi .L0804C3C4
	lsls r0, r0, #2
	ldr r1, .L0804C378 @ =.L0804C37C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
.L0804C374: .4byte gUnk_085CBDB0
.L0804C378: .4byte .L0804C37C
.L0804C37C: @ jump table
	.4byte .L0804C390 @ case 0
	.4byte .L0804C398 @ case 1
	.4byte .L0804C3B0 @ case 2
	.4byte .L0804C3C4 @ case 3
	.4byte .L0804C390 @ case 4
.L0804C390:
	movs r4, #0x21
	movs r2, #0x30
	mov sl, r2
	b .L0804C3E4
.L0804C398:
	movs r4, #0x1d
	movs r0, #0x30
	mov sl, r0
	ldr r0, .L0804C3AC @ =gEkrInitPosReal
	ldr r0, [r0]
	movs r5, #4
	rsbs r5, r5, #0
.L0804C3A6:
	cmp r0, #1
	bne .L0804C3E6
	b .L0804C3E4
	.align 2, 0
.L0804C3AC: .4byte gEkrInitPosReal
.L0804C3B0:
	movs r4, #3
	movs r1, #0x30
	mov sl, r1
	ldr r0, .L0804C3C0 @ =gEkrInitPosReal
	ldr r0, [r0]
	movs r5, #0x1e
	rsbs r5, r5, #0
	b .L0804C3A6
	.align 2, 0
.L0804C3C0: .4byte gEkrInitPosReal
.L0804C3C4:
	movs r2, #0
	ldrsh r0, [r7, r2]
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	beq .L0804C3D6
	movs r4, #0x27
	movs r0, #3
	mov sl, r0
.L0804C3D6:
	movs r2, #6
	ldrsh r0, [r7, r2]
	cmp r0, r1
	beq .L0804C3E4
	movs r4, #3
	movs r0, #0x2a
	mov sl, r0
.L0804C3E4:
	movs r5, #0
.L0804C3E6:
	movs r1, #1
	rsbs r1, r1, #0
	mov sb, r1
	lsls r2, r4, #1
	ldr r4, .L0804C46C @ =gTmA_Banim + 0x6B4
	adds r2, r2, r4
	movs r0, #0xf
	mov r8, r0
	str r0, [sp]
	movs r6, #5
	str r6, [sp, #4]
	movs r1, #2
	ldrsh r0, [r7, r1]
	str r0, [sp, #8]
	movs r1, #4
	ldrsh r0, [r7, r1]
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x10]
	mov r1, sb
	movs r3, #0x42
	bl EfxTmCpyExt
	mov r0, sl
	lsls r2, r0, #1
	adds r2, r2, r4
	mov r1, r8
	str r1, [sp]
	str r6, [sp, #4]
	movs r1, #8
	ldrsh r0, [r7, r1]
	str r0, [sp, #8]
	movs r1, #0xa
	ldrsh r0, [r7, r1]
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x14]
	mov r1, sb
	movs r3, #0x42
	bl EfxTmCpyExt
	lsls r0, r5, #1
	adds r4, r4, r0
	ldr r2, .L0804C470 @ =0xFFFFFA96
	adds r4, r4, r2
	ldr r2, .L0804C474 @ =gBg2Tm
	movs r0, #0x20
	str r0, [sp]
	movs r0, #0x14
	str r0, [sp, #4]
	mov r0, sb
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	adds r0, r4, #0
	movs r1, #0x42
	movs r3, #0x20
	bl EfxTmCpyExt
	movs r0, #4
	bl EnableBgSync
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0804C46C: .4byte gTmA_Banim + 0x6B4
.L0804C470: .4byte 0xFFFFFA96
.L0804C474: .4byte gBg2Tm

	thumb_func_start func_fe6_0804C478
func_fe6_0804C478: @ 0x0804C478
	push {lr}
	sub sp, #0x10
	lsls r1, r1, #0x10
	lsrs r3, r1, #0x10
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #4
	bhi .L0804C4C0
	lsls r0, r0, #2
	ldr r1, .L0804C494 @ =.L0804C498
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
.L0804C494: .4byte .L0804C498
.L0804C498: @ jump table
	.4byte .L0804C4AC @ case 0
	.4byte .L0804C4B6 @ case 1
	.4byte .L0804C4C0 @ case 2
	.4byte .L0804C4C0 @ case 3
	.4byte .L0804C4AC @ case 4
.L0804C4AC:
	movs r2, #0x30
	cmp r3, #0
	bne .L0804C4C8
	movs r2, #0x21
	b .L0804C4C8
.L0804C4B6:
	movs r2, #0x30
	cmp r3, #0
	bne .L0804C4C8
	movs r2, #0x1d
	b .L0804C4C8
.L0804C4C0:
	movs r2, #0x30
	cmp r3, #0
	bne .L0804C4C8
	movs r2, #3
.L0804C4C8:
	ldr r0, .L0804C4EC @ =gUnk_081122DA
	movs r1, #1
	rsbs r1, r1, #0
	lsls r2, r2, #1
	ldr r3, .L0804C4F0 @ =gTmA_Banim + 0x6B4
	adds r2, r2, r3
	movs r3, #0xf
	str r3, [sp]
	movs r3, #5
	str r3, [sp, #4]
	str r1, [sp, #8]
	str r1, [sp, #0xc]
	movs r3, #0x42
	bl EfxTmCpyExt
	add sp, #0x10
	pop {r0}
	bx r0
	.align 2, 0
.L0804C4EC: .4byte gUnk_081122DA
.L0804C4F0: .4byte gTmA_Banim + 0x6B4

	thumb_func_start func_fe6_0804C4F4
func_fe6_0804C4F4: @ 0x0804C4F4
	ldr r1, .L0804C4FC @ =0x0203CDD4
	str r0, [r1]
	bx lr
	.align 2, 0
.L0804C4FC: .4byte 0x0203CDD4

	thumb_func_start GetBattleAnimArenaFlag
GetBattleAnimArenaFlag: @ 0x0804C500
	ldr r0, .L0804C508 @ =0x0203CDD4
	ldr r0, [r0]
	bx lr
	.align 2, 0
.L0804C508: .4byte 0x0203CDD4

	thumb_func_start func_fe6_0804C50C
func_fe6_0804C50C: @ 0x0804C50C
	push {r4, lr}
	sub sp, #0x10
	asrs r4, r0, #3
	movs r1, #7
	ands r1, r0
	movs r0, #3
	movs r2, #0
	bl SetBgOffset
	lsls r4, r4, #1
	ldr r0, .L0804C54C @ =gUnk_Banim_0201D424
	adds r4, r4, r0
	ldr r2, .L0804C550 @ =gBg3Tm
	movs r0, #0x20
	str r0, [sp]
	movs r0, #0x16
	str r0, [sp, #4]
	subs r0, #0x17
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	adds r0, r4, #0
	movs r1, #0x42
	movs r3, #0x20
	bl EfxTmCpyExt
	movs r0, #8
	bl EnableBgSync
	add sp, #0x10
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0804C54C: .4byte gUnk_Banim_0201D424
.L0804C550: .4byte gBg3Tm

	thumb_func_start func_fe6_0804C554
func_fe6_0804C554: @ 0x0804C554
	push {lr}
	bl GetBattleAnimArenaFlag
	cmp r0, #0
	beq .L0804C568
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0x8f
	bl EfxPlaySE
.L0804C568:
	pop {r0}
	bx r0

	thumb_func_start func_fe6_0804C56C
func_fe6_0804C56C: @ 0x0804C56C
	push {lr}
	bl GetBattleAnimArenaFlag
	cmp r0, #0
	beq .L0804C57C
	movs r0, #0x8e
	bl DoM4aSongNumStop
.L0804C57C:
	pop {r0}
	bx r0

	thumb_func_start BeginAnimsOnBattle_Arena
BeginAnimsOnBattle_Arena: @ 0x0804C580
	push {lr}
	bl NewEkrBattleDeamon
	bl BasInit
	bl GetBanimInitPosReal
	ldr r1, .L0804C5A0 @ =gEkrInitPosReal
	str r0, [r1]
	bl func_fe6_0804C5BC
	movs r0, #0
	bl SetOnHBlankA
	pop {r0}
	bx r0
	.align 2, 0
.L0804C5A0: .4byte gEkrInitPosReal

	thumb_func_start func_fe6_0804C5A4
func_fe6_0804C5A4: @ 0x0804C5A4
	push {lr}
	bl BasInit
	bl func_fe6_0804C744
	ldr r0, .L0804C5B8 @ =OnMainBas
	bl SetMainFunc
	pop {r0}
	bx r0
	.align 2, 0
.L0804C5B8: .4byte OnMainBas

	thumb_func_start func_fe6_0804C5BC
func_fe6_0804C5BC: @ 0x0804C5BC
	push {lr}
	ldr r0, .L0804C5CC @ =gUnk_085CBE20
	movs r1, #3
	bl SpawnProc
	pop {r0}
	bx r0
	.align 2, 0
.L0804C5CC: .4byte gUnk_085CBE20

	thumb_func_start func_fe6_0804C5D0
func_fe6_0804C5D0: @ 0x0804C5D0
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	mov r8, r0
	movs r0, #0
	bl InitOam
	ldr r1, .L0804C644 @ =gEkrInitPosReal
	ldr r0, .L0804C648 @ =gEkrInitialHitSide
	movs r2, #0
	ldrsh r0, [r0, r2]
	str r0, [r1]
	bl func_fe6_08044390
	bl UpdateBanimFrame
	bl NewEkrGauge
	bl func_fe6_08044198
	bl NewEkrBattle
	ldr r0, .L0804C64C @ =gUnk_08118330
	ldr r4, .L0804C650 @ =gPal+0xC0
	adds r1, r4, #0
	movs r2, #0x20
	bl CpuFastSet
	subs r4, #0xc0
	ldr r5, .L0804C654 @ =gEfxPal
	movs r6, #0x80
	lsls r6, r6, #1
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r6, #0
	bl CpuFastSet
	adds r0, r5, #0
	adds r1, r4, #0
	adds r2, r6, #0
	bl CpuFastSet
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0x20
	movs r3, #0x10
	bl EfxPalBlackInOut
	bl EnablePalSync
	mov r0, r8
	bl Proc_Break
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L0804C644: .4byte gEkrInitPosReal
.L0804C648: .4byte gEkrInitialHitSide
.L0804C64C: .4byte gUnk_08118330
.L0804C650: .4byte gPal+0xC0
.L0804C654: .4byte gEfxPal

	thumb_func_start func_fe6_0804C658
func_fe6_0804C658: @ 0x0804C658
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r5, r0, #0
	ldr r0, .L0804C6B8 @ =gUnk_08115524
	ldr r1, .L0804C6BC @ =0x06008000
	bl LZ77UnCompVram
	ldr r0, .L0804C6C0 @ =gUnk_08117B90
	ldr r6, .L0804C6C4 @ =gEkrTsaBuffer
	adds r1, r6, #0
	bl LZ77UnCompWram
	movs r1, #1
	rsbs r1, r1, #0
	ldr r2, .L0804C6C8 @ =gTmB_Banim
	movs r0, #0x2e
	str r0, [sp]
	movs r0, #0x14
	str r0, [sp, #4]
	movs r0, #6
	str r0, [sp, #8]
	movs r4, #0
	str r4, [sp, #0xc]
	adds r0, r6, #0
	movs r3, #0x42
	bl EfxTmCpyExt
	movs r0, #0
	bl func_fe6_0804C50C
	movs r0, #8
	bl EnableBgSync
	strh r4, [r5, #0x2c]
	movs r0, #0x10
	strh r0, [r5, #0x2e]
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0x8e
	bl EfxPlaySE
	adds r0, r5, #0
	bl Proc_Break
	add sp, #0x10
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L0804C6B8: .4byte gUnk_08115524
.L0804C6BC: .4byte 0x06008000
.L0804C6C0: .4byte gUnk_08117B90
.L0804C6C4: .4byte gEkrTsaBuffer
.L0804C6C8: .4byte gTmB_Banim

	thumb_func_start func_fe6_0804C6CC
func_fe6_0804C6CC: @ 0x0804C6CC
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	movs r0, #0x2c
	ldrsh r3, [r6, r0]
	movs r1, #0x2e
	ldrsh r0, [r6, r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #0x10
	movs r2, #0
	bl Interpolate
	adds r5, r0, #0
	ldr r0, .L0804C728 @ =gEfxPal
	ldr r4, .L0804C72C @ =gPal
	movs r2, #0x80
	lsls r2, r2, #1
	adds r1, r4, #0
	bl CpuFastSet
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0x20
	adds r3, r5, #0
	bl EfxPalBlackInOut
	bl EnablePalSync
	ldrh r1, [r6, #0x2c]
	adds r1, #1
	strh r1, [r6, #0x2c]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r2, #0x2e
	ldrsh r0, [r6, r2]
	adds r0, #1
	cmp r1, r0
	bne .L0804C720
	adds r0, r6, #0
	bl Proc_Break
.L0804C720:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L0804C728: .4byte gEfxPal
.L0804C72C: .4byte gPal

	thumb_func_start func_fe6_0804C730
func_fe6_0804C730: @ 0x0804C730
	push {r4, lr}
	adds r4, r0, #0
	bl func_fe6_0804C818
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start func_fe6_0804C744
func_fe6_0804C744: @ 0x0804C744
	push {lr}
	ldr r0, .L0804C758 @ =gUnk_085CBE50
	movs r1, #3
	bl SpawnProc
	bl func_fe6_0804C84C
	pop {r0}
	bx r0
	.align 2, 0
.L0804C758: .4byte gUnk_085CBE50

	thumb_func_start func_fe6_0804C75C
func_fe6_0804C75C: @ 0x0804C75C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, .L0804C780 @ =gPal
	ldr r1, .L0804C784 @ =gEfxPal
	movs r2, #0x80
	lsls r2, r2, #1
	bl CpuFastSet
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #0x10
	strh r0, [r4, #0x2e]
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0804C780: .4byte gPal
.L0804C784: .4byte gEfxPal

	thumb_func_start func_fe6_0804C788
func_fe6_0804C788: @ 0x0804C788
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	movs r0, #0x2c
	ldrsh r3, [r6, r0]
	movs r1, #0x2e
	ldrsh r0, [r6, r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0x10
	bl Interpolate
	adds r5, r0, #0
	ldr r0, .L0804C7E4 @ =gEfxPal
	ldr r4, .L0804C7E8 @ =gPal
	movs r2, #0x80
	lsls r2, r2, #1
	adds r1, r4, #0
	bl CpuFastSet
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0x20
	adds r3, r5, #0
	bl EfxPalBlackInOut
	bl EnablePalSync
	ldrh r1, [r6, #0x2c]
	adds r1, #1
	strh r1, [r6, #0x2c]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r2, #0x2e
	ldrsh r0, [r6, r2]
	adds r0, #1
	cmp r1, r0
	bne .L0804C7DC
	adds r0, r6, #0
	bl Proc_Break
.L0804C7DC:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L0804C7E4: .4byte gEfxPal
.L0804C7E8: .4byte gPal

	thumb_func_start func_fe6_0804C7EC
func_fe6_0804C7EC: @ 0x0804C7EC
	push {r4, lr}
	adds r4, r0, #0
	bl EndEkrBattleDeamon
	bl EndEkrGauge
	ldr r0, .L0804C810 @ =OnMain
	bl SetMainFunc
	ldr r0, .L0804C814 @ =OnVBlank
	bl SetOnVBlank
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0804C810: .4byte OnMain
.L0804C814: .4byte OnVBlank

	thumb_func_start func_fe6_0804C818
func_fe6_0804C818: @ 0x0804C818
	push {r4, lr}
	ldr r4, .L0804C83C @ =gUnk_Banim_0201E144
	ldr r0, .L0804C840 @ =gUnk_085CBE78
	movs r1, #3
	bl SpawnProc
	str r0, [r4]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, .L0804C844 @ =gUnk_08112370
	str r1, [r0, #0x48]
	ldr r1, .L0804C848 @ =gUnk_085CBE90
	str r1, [r0, #0x4c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0804C83C: .4byte gUnk_Banim_0201E144
.L0804C840: .4byte gUnk_085CBE78
.L0804C844: .4byte gUnk_08112370
.L0804C848: .4byte gUnk_085CBE90

	thumb_func_start func_fe6_0804C84C
func_fe6_0804C84C: @ 0x0804C84C
	push {lr}
	ldr r0, .L0804C85C @ =gUnk_Banim_0201E144
	ldr r0, [r0]
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
.L0804C85C: .4byte gUnk_Banim_0201E144

	thumb_func_start func_fe6_0804C860
func_fe6_0804C860: @ 0x0804C860
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl EfxAdvanceFrameLut
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0
	blt .L0804C88C
	ldr r1, [r4, #0x4c]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r1, .L0804C894 @ =gPal+0xC0
	movs r2, #0x20
	bl CpuFastSet
	bl EnablePalSync
.L0804C88C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0804C894: .4byte gPal+0xC0

	thumb_func_start StartSpellAnimation
StartSpellAnimation: @ 0x0804C898
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, .L0804C8C4 @ =gEkrSpellAnimIndex
	bl GetAnimPosition
	lsls r0, r0, #1
	adds r0, r0, r4
	ldr r1, .L0804C8C8 @ =gUnk_085D0DA0
	movs r2, #0
	ldrsh r0, [r0, r2]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r2, [r0]
	ldr r1, .L0804C8CC @ =gUnk_Banim_0201E7A4
	movs r0, #0
	str r0, [r1]
	adds r0, r5, #0
	bl _call_via_r2
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0804C8C4: .4byte gEkrSpellAnimIndex
.L0804C8C8: .4byte gUnk_085D0DA0
.L0804C8CC: .4byte gUnk_Banim_0201E7A4

	thumb_func_start func_fe6_0804C8D0
func_fe6_0804C8D0: @ 0x0804C8D0
	bx lr
	.align 2, 0

	thumb_func_start func_fe6_0804C8D4
func_fe6_0804C8D4: @ 0x0804C8D4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	mov r8, r3
	ldr r7, [sp, #0x18]
	ldr r1, .L0804C910 @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L0804C914 @ =gUnk_085D0E94
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x2e]
	str r5, [r0, #0x44]
	str r6, [r0, #0x48]
	mov r1, r8
	str r1, [r0, #0x4c]
	str r7, [r0, #0x50]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
.L0804C910: .4byte gEfxBgSemaphore
.L0804C914: .4byte gUnk_085D0E94

	thumb_func_start func_fe6_0804C918
func_fe6_0804C918: @ 0x0804C918
	ldr r1, .L0804C924 @ =gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bx lr
	.align 2, 0
.L0804C924: .4byte gEfxBgSemaphore

	thumb_func_start func_fe6_0804C928
func_fe6_0804C928: @ 0x0804C928
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r2, r0, #0
	ldr r0, .L0804C9A8 @ =gUnk_Banim_0201E3D8
	ldr r0, [r0]
	ldr r4, .L0804C9AC @ =gUnk_Banim_0201E3E4
	cmp r0, #0
	bne .L0804C940
	ldr r4, .L0804C9B0 @ =gUnk_Banim_0201E524
.L0804C940:
	ldrh r0, [r2, #0x2e]
	lsls r1, r0, #0x18
	lsrs r3, r1, #0x18
	ldr r1, [r2, #0x50]
	adds r0, r0, r1
	strh r0, [r2, #0x2e]
	movs r1, #0
	ldr r0, [r2, #0x44]
	mov r8, r0
	ldr r6, [r2, #0x48]
	mov sl, r6
	ldr r7, .L0804C9B4 @ =gUnk_08605A94
	mov ip, r7
	ldr r5, [r2, #0x4c]
	ldr r0, .L0804C9B8 @ =gDispIo
	mov sb, r0
.L0804C960:
	mov r6, sl
	adds r0, r3, r6
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	lsls r0, r3, #1
	add r0, ip
	movs r7, #0
	ldrsh r0, [r0, r7]
	muls r0, r5, r0
	lsls r0, r0, #8
	lsrs r0, r0, #0x10
	mov r6, sb
	ldrh r6, [r6, #0x20]
	adds r0, r6, r0
	strh r0, [r4]
	adds r4, #2
	adds r1, #1
	cmp r1, #0x77
	bls .L0804C960
	ldrh r0, [r2, #0x2c]
	adds r0, #1
	strh r0, [r2, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, r8
	bne .L0804C99A
	adds r0, r2, #0
	bl Proc_End
.L0804C99A:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0804C9A8: .4byte gUnk_Banim_0201E3D8
.L0804C9AC: .4byte gUnk_Banim_0201E3E4
.L0804C9B0: .4byte gUnk_Banim_0201E524
.L0804C9B4: .4byte gUnk_08605A94
.L0804C9B8: .4byte gDispIo

	thumb_func_start func_fe6_0804C9BC
func_fe6_0804C9BC: @ 0x0804C9BC
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, .L0804C9E4 @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L0804C9E8 @ =gUnk_085D0EB4
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x2e]
	str r5, [r0, #0x44]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0804C9E4: .4byte gEfxBgSemaphore
.L0804C9E8: .4byte gUnk_085D0EB4

	thumb_func_start func_fe6_0804C9EC
func_fe6_0804C9EC: @ 0x0804C9EC
	ldr r1, .L0804C9F8 @ =gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bx lr
	.align 2, 0
.L0804C9F8: .4byte gEfxBgSemaphore

	thumb_func_start func_fe6_0804C9FC
func_fe6_0804C9FC: @ 0x0804C9FC
	push {r4, r5, lr}
	adds r3, r0, #0
	ldr r0, .L0804CA38 @ =gUnk_Banim_0201E3D8
	ldr r0, [r0]
	ldr r1, .L0804CA3C @ =gUnk_Banim_0201E3E4
	cmp r0, #0
	bne .L0804CA0C
	ldr r1, .L0804CA40 @ =gUnk_Banim_0201E524
.L0804CA0C:
	movs r2, #0
	ldr r5, [r3, #0x44]
	ldr r4, .L0804CA44 @ =gDispIo
.L0804CA12:
	ldrh r0, [r4, #0x20]
	strh r0, [r1]
	adds r1, #2
	adds r2, #1
	cmp r2, #0x77
	bls .L0804CA12
	ldrh r0, [r3, #0x2c]
	adds r0, #1
	strh r0, [r3, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, r5
	bne .L0804CA32
	adds r0, r3, #0
	bl Proc_End
.L0804CA32:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0804CA38: .4byte gUnk_Banim_0201E3D8
.L0804CA3C: .4byte gUnk_Banim_0201E3E4
.L0804CA40: .4byte gUnk_Banim_0201E524
.L0804CA44: .4byte gDispIo

	thumb_func_start func_fe6_0804CA48
func_fe6_0804CA48: @ 0x0804CA48
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	mov r8, r0
	adds r4, r1, #0
	adds r5, r2, #0
	adds r6, r3, #0
	ldr r1, .L0804CA90 @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L0804CA94 @ =gUnk_085D0ED4
	movs r1, #3
	bl SpawnProc
	adds r7, r0, #0
	mov r0, r8
	str r0, [r7, #0x5c]
	movs r1, #0
	mov sb, r1
	movs r0, #0
	strh r0, [r7, #0x2c]
	strh r0, [r7, #0x2e]
	str r4, [r7, #0x44]
	str r5, [r7, #0x54]
	str r6, [r7, #0x58]
	mov r0, r8
	bl GetAnimAnotherSide
	bl GetAnimPosition
	cmp r0, #0
	bne .L0804CA9C
	ldr r0, .L0804CA98 @ =0x0000FFB8
	b .L0804CA9E
	.align 2, 0
.L0804CA90: .4byte gEfxBgSemaphore
.L0804CA94: .4byte gUnk_085D0ED4
.L0804CA98: .4byte 0x0000FFB8
.L0804CA9C:
	ldr r0, .L0804CABC @ =0x0000FFF8
.L0804CA9E:
	strh r0, [r7, #0x32]
	ldr r0, .L0804CAC0 @ =gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq .L0804CACA
	mov r0, r8
	bl GetAnimPosition
	cmp r0, #0
	bne .L0804CAC4
	ldrh r0, [r7, #0x32]
	adds r0, #0x18
	b .L0804CAC8
	.align 2, 0
.L0804CABC: .4byte 0x0000FFF8
.L0804CAC0: .4byte gEkrDistanceType
.L0804CAC4:
	ldrh r0, [r7, #0x32]
	subs r0, #0x18
.L0804CAC8:
	strh r0, [r7, #0x32]
.L0804CACA:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_fe6_0804CAD8
func_fe6_0804CAD8: @ 0x0804CAD8
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldr r0, .L0804CB20 @ =gUnk_Banim_0201E14C
	ldr r0, [r0]
	ldr r5, .L0804CB24 @ =gUnk_Banim_0201E158
	cmp r0, #0
	bne .L0804CAE8
	ldr r5, .L0804CB28 @ =gUnk_Banim_0201E298
.L0804CAE8:
	ldr r1, [r4, #0x54]
	movs r2, #0x2e
	ldrsh r0, [r4, r2]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r2, [r0]
	ldr r1, [r4, #0x58]
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r3, [r0]
	ldr r0, .L0804CB2C @ =0x0000FFFF
	cmp r2, r0
	beq .L0804CB54
	ldrh r0, [r4, #0x2e]
	adds r0, #1
	strh r0, [r4, #0x2e]
	movs r2, #0
	ldr r6, [r4, #0x44]
	ldr r7, .L0804CB30 @ =0x00007FFF
	mov ip, r7
.L0804CB10:
	ldrh r1, [r3]
	movs r7, #0
	ldrsh r0, [r3, r7]
	cmp r0, ip
	bne .L0804CB34
	movs r0, #0
	b .L0804CB46
	.align 2, 0
.L0804CB20: .4byte gUnk_Banim_0201E14C
.L0804CB24: .4byte gUnk_Banim_0201E158
.L0804CB28: .4byte gUnk_Banim_0201E298
.L0804CB2C: .4byte 0x0000FFFF
.L0804CB30: .4byte 0x00007FFF
.L0804CB34:
	ldrh r0, [r4, #0x32]
	adds r1, r1, r0
	ldrh r7, [r3, #2]
	adds r0, r0, r7
	lsls r1, r1, #0x10
	asrs r1, r1, #8
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	orrs r0, r1
.L0804CB46:
	strh r0, [r5]
	adds r3, #4
	adds r5, #2
	adds r2, #1
	cmp r2, #0x77
	bls .L0804CB10
	b .L0804CB64
.L0804CB54:
	movs r2, #0
	ldr r6, [r4, #0x44]
	movs r0, #0
.L0804CB5A:
	strh r0, [r5]
	adds r5, #2
	adds r2, #1
	cmp r2, #0x77
	bls .L0804CB5A
.L0804CB64:
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	movs r1, #0x2c
	ldrsh r0, [r4, r1]
	cmp r0, r6
	bne .L0804CB80
	ldr r1, .L0804CB88 @ =gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
.L0804CB80:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0804CB88: .4byte gEfxBgSemaphore

	thumb_func_start func_fe6_0804CB8C
func_fe6_0804CB8C: @ 0x0804CB8C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	mov r8, r0
	mov sb, r1
	adds r5, r3, #0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	ldr r1, .L0804CC34 @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r1, .L0804CC38 @ =gUnk_Banim_0201E158
	movs r0, #0
	adds r7, r1, #0
	ldr r4, .L0804CC3C @ =gUnk_Banim_0201E298
	ldr r3, .L0804CC40 @ =gUnk_Banim_0201E3E4
	ldr r6, .L0804CC44 @ =gUnk_Banim_0201E14C
	mov ip, r6
	ldr r6, .L0804CC48 @ =gUnk_Banim_0201E3D8
	mov sl, r6
.L0804CBBA:
	strh r2, [r1]
	adds r1, #2
	adds r0, #1
	cmp r0, #0x9f
	bls .L0804CBBA
	adds r1, r4, #0
	movs r0, #0
.L0804CBC8:
	strh r2, [r1]
	adds r1, #2
	adds r0, #1
	cmp r0, #0x9f
	bls .L0804CBC8
	adds r1, r3, #0
	movs r0, #0
.L0804CBD6:
	strh r2, [r1]
	adds r1, #2
	adds r0, #1
	cmp r0, #0x9f
	bls .L0804CBD6
	ldr r1, .L0804CC4C @ =gUnk_Banim_0201E524
	movs r0, #0
.L0804CBE4:
	strh r2, [r1]
	adds r1, #2
	adds r0, #1
	cmp r0, #0x9f
	bls .L0804CBE4
	movs r4, #0
	mov r0, ip
	str r4, [r0]
	mov r1, sl
	str r4, [r1]
	ldr r6, .L0804CC50 @ =gUnk_Banim_0201E150
	str r7, [r6]
	ldr r0, .L0804CC54 @ =gUnk_Banim_0201E3DC
	str r3, [r0]
	ldr r1, .L0804CC58 @ =gUnk_Banim_0201E154
	str r7, [r1]
	ldr r6, .L0804CC5C @ =gUnk_Banim_0201E3E0
	str r3, [r6]
	adds r0, r5, #0
	bl SetOnHBlankA
	ldr r1, .L0804CC60 @ =gUnk_Banim_0201E7A4
	movs r0, #1
	str r0, [r1]
	ldr r0, .L0804CC64 @ =gUnk_085D0EEC
	movs r1, #0
	bl SpawnProc
	mov r1, r8
	str r1, [r0, #0x5c]
	strh r4, [r0, #0x2c]
	mov r6, sb
	str r6, [r0, #0x44]
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0804CC34: .4byte gEfxBgSemaphore
.L0804CC38: .4byte gUnk_Banim_0201E158
.L0804CC3C: .4byte gUnk_Banim_0201E298
.L0804CC40: .4byte gUnk_Banim_0201E3E4
.L0804CC44: .4byte gUnk_Banim_0201E14C
.L0804CC48: .4byte gUnk_Banim_0201E3D8
.L0804CC4C: .4byte gUnk_Banim_0201E524
.L0804CC50: .4byte gUnk_Banim_0201E150
.L0804CC54: .4byte gUnk_Banim_0201E3DC
.L0804CC58: .4byte gUnk_Banim_0201E154
.L0804CC5C: .4byte gUnk_Banim_0201E3E0
.L0804CC60: .4byte gUnk_Banim_0201E7A4
.L0804CC64: .4byte gUnk_085D0EEC

	thumb_func_start func_fe6_0804CC68
func_fe6_0804CC68: @ 0x0804CC68
	push {lr}
	adds r3, r2, #0
	movs r2, #0
	bl func_fe6_0804CB8C
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_fe6_0804CC78
func_fe6_0804CC78: @ 0x0804CC78
	push {lr}
	bl Proc_Break
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_fe6_0804CC84
func_fe6_0804CC84: @ 0x0804CC84
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, .L0804CCA8 @ =gBmSt
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq .L0804CD04
	ldr r1, .L0804CCAC @ =gUnk_Banim_0201E14C
	ldr r0, [r1]
	cmp r0, #1
	bne .L0804CCB8
	movs r0, #0
	str r0, [r1]
	ldr r1, .L0804CCB0 @ =gUnk_Banim_0201E150
	ldr r0, .L0804CCB4 @ =gUnk_Banim_0201E158
	b .L0804CCC0
	.align 2, 0
.L0804CCA8: .4byte gBmSt
.L0804CCAC: .4byte gUnk_Banim_0201E14C
.L0804CCB0: .4byte gUnk_Banim_0201E150
.L0804CCB4: .4byte gUnk_Banim_0201E158
.L0804CCB8:
	movs r0, #1
	str r0, [r1]
	ldr r1, .L0804CCD8 @ =gUnk_Banim_0201E150
	ldr r0, .L0804CCDC @ =gUnk_Banim_0201E298
.L0804CCC0:
	str r0, [r1]
	adds r3, r1, #0
	ldr r1, .L0804CCE0 @ =gUnk_Banim_0201E3D8
	ldr r0, [r1]
	cmp r0, #1
	bne .L0804CCEC
	movs r0, #0
	str r0, [r1]
	ldr r1, .L0804CCE4 @ =gUnk_Banim_0201E3DC
	ldr r0, .L0804CCE8 @ =gUnk_Banim_0201E3E4
	b .L0804CCF4
	.align 2, 0
.L0804CCD8: .4byte gUnk_Banim_0201E150
.L0804CCDC: .4byte gUnk_Banim_0201E298
.L0804CCE0: .4byte gUnk_Banim_0201E3D8
.L0804CCE4: .4byte gUnk_Banim_0201E3DC
.L0804CCE8: .4byte gUnk_Banim_0201E3E4
.L0804CCEC:
	movs r0, #1
	str r0, [r1]
	ldr r1, .L0804CD34 @ =gUnk_Banim_0201E3DC
	ldr r0, .L0804CD38 @ =gUnk_Banim_0201E524
.L0804CCF4:
	str r0, [r1]
	adds r2, r1, #0
	ldr r1, .L0804CD3C @ =gUnk_Banim_0201E154
	ldr r0, [r3]
	str r0, [r1]
	ldr r1, .L0804CD40 @ =gUnk_Banim_0201E3E0
	ldr r0, [r2]
	str r0, [r1]
.L0804CD04:
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r1, [r4, #0x44]
	cmp r0, r1
	bne .L0804CD2E
	ldr r1, .L0804CD44 @ =gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	movs r0, #0
	bl SetOnHBlankA
	ldr r1, .L0804CD48 @ =gUnk_Banim_0201E7A4
	movs r0, #0
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
.L0804CD2E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0804CD34: .4byte gUnk_Banim_0201E3DC
.L0804CD38: .4byte gUnk_Banim_0201E524
.L0804CD3C: .4byte gUnk_Banim_0201E154
.L0804CD40: .4byte gUnk_Banim_0201E3E0
.L0804CD44: .4byte gEfxBgSemaphore
.L0804CD48: .4byte gUnk_Banim_0201E7A4

	thumb_func_start func_fe6_0804CD4C
func_fe6_0804CD4C: @ 0x0804CD4C
	ldr r0, .L0804CD78 @ =0x04000004
	ldrh r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne .L0804CD74
	ldr r3, .L0804CD7C @ =0x04000040
	ldr r2, .L0804CD80 @ =gUnk_Banim_0201E154
	ldr r0, [r2]
	ldrh r1, [r0]
	strh r1, [r3]
	adds r0, #2
	str r0, [r2]
	subs r3, #0x2c
	ldr r2, .L0804CD84 @ =gUnk_Banim_0201E3E0
	ldr r0, [r2]
	ldrh r1, [r0]
	strh r1, [r3]
	adds r0, #2
	str r0, [r2]
.L0804CD74:
	bx lr
	.align 2, 0
.L0804CD78: .4byte 0x04000004
.L0804CD7C: .4byte 0x04000040
.L0804CD80: .4byte gUnk_Banim_0201E154
.L0804CD84: .4byte gUnk_Banim_0201E3E0

	thumb_func_start func_fe6_0804CD88
func_fe6_0804CD88: @ 0x0804CD88
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r6, r2, #0
	mov r8, r3
	ldr r7, [sp, #0x18]
	ldr r1, .L0804CDC8 @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L0804CDCC @ =gUnk_085D0F0C
	movs r1, #3
	bl SpawnProc
	str r5, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r4, [r0, #0x2e]
	adds r4, r4, r6
	strh r4, [r0, #0x30]
	mov r1, r8
	str r1, [r0, #0x44]
	str r7, [r0, #0x48]
	ldr r1, [sp, #0x1c]
	str r1, [r0, #0x4c]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0804CDC8: .4byte gEfxBgSemaphore
.L0804CDCC: .4byte gUnk_085D0F0C

	thumb_func_start func_fe6_0804CDD0
func_fe6_0804CDD0: @ 0x0804CDD0
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r5, r0, #0
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	movs r7, #0
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r5, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	blt .L0804CEC4
	ldr r1, [r5, #0x44]
	ldr r2, [r5, #0x48]
	movs r6, #0x2c
	ldrsh r3, [r5, r6]
	movs r0, #0x2e
	ldrsh r4, [r5, r0]
	subs r3, r3, r4
	movs r6, #0x30
	ldrsh r0, [r5, r6]
	subs r0, r0, r4
	str r0, [sp]
	movs r0, #0
	bl Interpolate
	adds r6, r0, #0
	ldr r0, [r5, #0x4c]
	cmp r0, #1
	beq .L0804CE44
	cmp r0, #1
	bgt .L0804CE16
	cmp r0, #0
	beq .L0804CE1C
	b .L0804CEAA
.L0804CE16:
	cmp r0, #2
	beq .L0804CE6C
	b .L0804CEAA
.L0804CE1C:
	ldr r3, .L0804CE40 @ =gDispIo
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
	strb r6, [r0]
	adds r1, r3, #0
	adds r1, #0x45
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r3, #0
	b .L0804CEA6
	.align 2, 0
.L0804CE40: .4byte gDispIo
.L0804CE44:
	ldr r3, .L0804CE68 @ =gDispIo
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x80
	orrs r0, r1
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x44
	strb r7, [r0]
	adds r0, #1
	strb r7, [r0]
	adds r0, #1
	strb r6, [r0]
	b .L0804CEAA
	.align 2, 0
.L0804CE68: .4byte gDispIo
.L0804CE6C:
	movs r2, #0x2c
	ldrsh r3, [r5, r2]
	movs r0, #0x2e
	ldrsh r1, [r5, r0]
	subs r3, r3, r1
	movs r2, #0x30
	ldrsh r0, [r5, r2]
	subs r0, r0, r1
	str r0, [sp]
	movs r0, #0
	movs r1, #8
	movs r2, #0x10
	bl Interpolate
	ldr r4, .L0804CECC @ =gDispIo
	adds r3, r4, #0
	adds r3, #0x3c
	movs r1, #0x3f
	ldrb r2, [r3]
	ands r1, r2
	movs r2, #0x40
	orrs r1, r2
	strb r1, [r3]
	adds r1, r4, #0
	adds r1, #0x44
	strb r6, [r1]
	adds r1, #1
	strb r0, [r1]
	adds r0, r4, #0
.L0804CEA6:
	adds r0, #0x46
	strb r7, [r0]
.L0804CEAA:
	movs r6, #0x2c
	ldrsh r1, [r5, r6]
	movs r2, #0x30
	ldrsh r0, [r5, r2]
	cmp r1, r0
	blt .L0804CEC4
	ldr r1, .L0804CED0 @ =gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r5, #0
	bl Proc_Break
.L0804CEC4:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0804CECC: .4byte gDispIo
.L0804CED0: .4byte gEfxBgSemaphore

	thumb_func_start func_fe6_0804CED4
func_fe6_0804CED4: @ 0x0804CED4
	push {r4, r5, r6, lr}
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6}
	mov r8, r0
	mov sb, r1
	mov sl, r2
	adds r5, r3, #0
	ldr r6, [sp, #0x1c]
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	lsls r6, r6, #0x10
	lsrs r6, r6, #0x10
	ldr r1, .L0804CF2C @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L0804CF30 @ =gUnk_085D0F24
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	mov r0, r8
	str r0, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	strh r0, [r4, #0x2e]
	mov r0, sb
	str r0, [r4, #0x44]
	mov r0, sl
	str r0, [r4, #0x54]
	mov r0, r8
	bl GetAnimAnotherSide
	strh r5, [r4, #0x32]
	strh r6, [r4, #0x3a]
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L0804CF2C: .4byte gEfxBgSemaphore
.L0804CF30: .4byte gUnk_085D0F24

	thumb_func_start func_fe6_0804CF34
func_fe6_0804CF34: @ 0x0804CF34
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r5, r0, #0
	ldr r0, .L0804CFB4 @ =gUnk_Banim_0201E14C
	ldr r0, [r0]
	ldr r1, .L0804CFB8 @ =gUnk_Banim_0201E158
	mov r8, r1
	cmp r0, #0
	bne .L0804CF4E
	ldr r2, .L0804CFBC @ =gUnk_Banim_0201E298
	mov r8, r2
.L0804CF4E:
	ldr r4, [r5, #0x54]
	movs r7, #0x2e
	ldrsh r0, [r5, r7]
	lsls r0, r0, #1
	adds r0, r0, r4
	ldrh r7, [r0]
	adds r0, r7, #0
	bl func_fe6_08013F7C
	adds r6, r0, #0
	movs r1, #0x2e
	ldrsh r0, [r5, r1]
	lsls r0, r0, #1
	adds r0, r0, r4
	ldr r1, .L0804CFC0 @ =0x0000FFFF
	ldrh r0, [r0, #2]
	cmp r0, r1
	beq .L0804CF78
	ldrh r0, [r5, #0x2e]
	adds r0, #1
	strh r0, [r5, #0x2e]
.L0804CF78:
	ldrh r1, [r5, #0x3a]
	subs r0, r1, r7
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r0, #0
	bge .L0804CF86
	movs r2, #0
.L0804CF86:
	adds r0, r7, r1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xa0
	ble .L0804CF94
	movs r1, #0xa0
.L0804CF94:
	movs r3, #0
	lsls r0, r2, #0x10
	ldr r2, [r5, #0x44]
	mov ip, r2
	asrs r0, r0, #0x10
	mov sb, r0
	lsls r0, r1, #0x10
	asrs r4, r0, #0x10
.L0804CFA4:
	cmp sb, r3
	bhi .L0804CFAC
	cmp r4, r3
	bhs .L0804CFC4
.L0804CFAC:
	movs r0, #0
	mov r7, r8
	strh r0, [r7]
	b .L0804CFF4
	.align 2, 0
.L0804CFB4: .4byte gUnk_Banim_0201E14C
.L0804CFB8: .4byte gUnk_Banim_0201E158
.L0804CFBC: .4byte gUnk_Banim_0201E298
.L0804CFC0: .4byte 0x0000FFFF
.L0804CFC4:
	ldrh r2, [r5, #0x32]
	ldrh r1, [r6]
	adds r0, r2, r1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r0, #0
	bge .L0804CFD4
	movs r1, #0
.L0804CFD4:
	ldrh r7, [r6, #2]
	adds r0, r2, r7
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xf0
	ble .L0804CFE4
	movs r2, #0xf0
.L0804CFE4:
	lsls r1, r1, #0x10
	asrs r1, r1, #8
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	orrs r0, r1
	mov r1, r8
	strh r0, [r1]
	adds r6, #4
.L0804CFF4:
	movs r2, #2
	add r8, r2
	adds r3, #1
	cmp r3, #0x9f
	bls .L0804CFA4
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	movs r3, #0
	strh r0, [r5, #0x2c]
	movs r4, #0x2c
	ldrsh r0, [r5, r4]
	cmp r0, ip
	bne .L0804D03A
	ldr r1, .L0804D048 @ =gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	ldr r2, .L0804D04C @ =gDispIo
	adds r1, r2, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r7, [r1]
	ands r0, r7
	strb r0, [r1]
	adds r1, #8
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x45
	strb r3, [r0]
	adds r0, #1
	strb r3, [r0]
	adds r0, r5, #0
	bl Proc_Break
.L0804D03A:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0804D048: .4byte gEfxBgSemaphore
.L0804D04C: .4byte gDispIo

	thumb_func_start func_fe6_0804D050
func_fe6_0804D050: @ 0x0804D050
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	ldr r1, .L0804D080 @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L0804D084 @ =gUnk_085D0F3C
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #6
	movs r1, #0
	bl NewEfxQuakePure
	str r0, [r4, #0x60]
	movs r0, #0
	strh r0, [r4, #0x2c]
	strh r6, [r4, #0x2e]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L0804D080: .4byte gEfxBgSemaphore
.L0804D084: .4byte gUnk_085D0F3C

	thumb_func_start func_fe6_0804D088
func_fe6_0804D088: @ 0x0804D088
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	mov r8, r0
	ldr r5, .L0804D120 @ =gEkrBg2QuakeVec
	ldrh r1, [r5]
	ldrh r2, [r5, #2]
	movs r0, #2
	bl SetBgOffset
	ldr r4, .L0804D124 @ =gEkrBg0QuakeVec
	ldrh r0, [r5]
	ldrh r2, [r4]
	adds r1, r0, r2
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldrh r3, [r5, #2]
	ldrh r0, [r4, #2]
	adds r2, r3, r0
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
	ldrh r2, [r5, #2]
	ldrh r4, [r4, #2]
	adds r1, r2, r4
	rsbs r1, r1, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl func_fe6_08044230
	bl GetEkrDragonStateType
	cmp r0, #0
	beq .L0804D10C
	ldrh r1, [r5]
	ldrh r2, [r5, #2]
	adds r2, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #3
	bl SetBgOffset
.L0804D10C:
	bl GetEkrDragonStateType
	cmp r0, #0
	beq .L0804D12C
	ldr r3, .L0804D128 @ =gEkrXPosReal
	ldrh r4, [r3]
	ldrh r1, [r5]
	subs r0, r4, r1
	b .L0804D134
	.align 2, 0
.L0804D120: .4byte gEkrBg2QuakeVec
.L0804D124: .4byte gEkrBg0QuakeVec
.L0804D128: .4byte gEkrXPosReal
.L0804D12C:
	ldr r3, .L0804D244 @ =gEkrXPosReal
	ldrh r1, [r3]
	ldrh r2, [r5]
	adds r0, r1, r2
.L0804D134:
	ldr r2, .L0804D248 @ =gEkrBgPosition
	ldr r1, [r2]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	ldr r1, .L0804D24C @ =gEkrYPosReal
	ldrh r4, [r1]
	ldrh r5, [r5, #2]
	subs r0, r4, r5
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	mov sb, r3
	mov sl, r1
	ldr r2, .L0804D250 @ =gEkrBg2QuakeVec
	mov r1, sb
	ldrh r1, [r1, #2]
	ldrh r3, [r2]
	adds r0, r1, r3
	ldr r4, .L0804D248 @ =gEkrBgPosition
	ldr r1, [r4]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	mov r1, sl
	ldrh r1, [r1, #2]
	ldrh r2, [r2, #2]
	subs r0, r1, r2
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	lsls r1, r7, #0x10
	asrs r1, r1, #0x10
	lsls r2, r6, #0x10
	asrs r2, r2, #0x10
	movs r0, #0
	bl SetEkrFrontAnimPostion
	lsls r1, r5, #0x10
	asrs r1, r1, #0x10
	lsls r2, r4, #0x10
	asrs r2, r2, #0x10
	movs r0, #1
	bl SetEkrFrontAnimPostion
	mov r2, r8
	ldrh r0, [r2, #0x2c]
	adds r0, #1
	strh r0, [r2, #0x2c]
	lsls r0, r0, #0x10
	ldrh r3, [r2, #0x2e]
	lsls r1, r3, #0x10
	cmp r0, r1
	ble .L0804D236
	ldr r1, .L0804D254 @ =gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r4, .L0804D258 @ =gEkrBg0QuakeVec
	ldrh r1, [r4]
	ldrh r2, [r4, #2]
	movs r0, #0
	bl SetBgOffset
	ldrh r1, [r4]
	rsbs r0, r1, #0
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
	bl GetEkrDragonStateType
	cmp r0, #0
	beq .L0804D1F4
	movs r0, #3
	movs r1, #0
	movs r2, #0x10
	bl SetBgOffset
.L0804D1F4:
	ldr r4, .L0804D248 @ =gEkrBgPosition
	ldr r0, [r4]
	mov r2, sb
	ldrh r2, [r2]
	subs r1, r2, r0
	mov r3, sb
	ldrh r3, [r3, #2]
	subs r0, r3, r0
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	mov r0, sl
	ldrh r4, [r0, #2]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r3, #0
	ldrsh r2, [r0, r3]
	movs r0, #0
	bl SetEkrFrontAnimPostion
	lsls r1, r5, #0x10
	asrs r1, r1, #0x10
	lsls r2, r4, #0x10
	asrs r2, r2, #0x10
	movs r0, #1
	bl SetEkrFrontAnimPostion
	mov r4, r8
	ldr r0, [r4, #0x60]
	bl Proc_End
	mov r0, r8
	bl Proc_Break
.L0804D236:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0804D244: .4byte gEkrXPosReal
.L0804D248: .4byte gEkrBgPosition
.L0804D24C: .4byte gEkrYPosReal
.L0804D250: .4byte gEkrBg2QuakeVec
.L0804D254: .4byte gEfxBgSemaphore
.L0804D258: .4byte gEkrBg0QuakeVec

	thumb_func_start func_fe6_0804D25C
func_fe6_0804D25C: @ 0x0804D25C
	push {r4, lr}
	adds r4, r0, #0
	bl SpellFx_Begin
	bl SpellFx_SetBG1Position
	ldr r0, .L0804D27C @ =gUnk_085D0F54
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0804D27C: .4byte gUnk_085D0F54

	thumb_func_start func_fe6_0804D280
func_fe6_0804D280: @ 0x0804D280
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x5c]
	bl GetAnimAnotherSide
	adds r4, r0, #0
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	movs r6, #0
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne .L0804D2A6
	movs r0, #9
	ldrh r1, [r4, #0x10]
	orrs r0, r1
	strh r0, [r4, #0x10]
	b .L0804D2CE
.L0804D2A6:
	cmp r0, #0xa
	bne .L0804D2CE
	adds r0, r4, #0
	bl GetAnimNextRoundType
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	beq .L0804D2C4
	movs r0, #2
	ldrh r1, [r4, #0x10]
	orrs r0, r1
	strh r0, [r4, #0x10]
.L0804D2C4:
	bl SpellFx_Finish
	adds r0, r5, #0
	bl Proc_Break
.L0804D2CE:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start func_fe6_0804D2D4
func_fe6_0804D2D4: @ 0x0804D2D4
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl SpellFx_SetBG1Position
	ldr r0, .L0804D308 @ =gUnk_085D0F6C
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r5, #0
	bl GetAnimRoundTypeAnotherSide
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl CheckRoundMiss
	adds r4, #0x29
	strb r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0804D308: .4byte gUnk_085D0F6C

	thumb_func_start func_fe6_0804D30C
func_fe6_0804D30C: @ 0x0804D30C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x5c]
	bl GetAnimAnotherSide
	adds r6, r0, #0
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne .L0804D38A
	ldr r0, [r5, #0x5c]
	movs r1, #1
	rsbs r1, r1, #0
	bl NewEfxFarAttackWithDistance
	ldr r0, [r5, #0x5c]
	bl func_fe6_0804D3A8
	ldrh r0, [r5, #0x2c]
	cmp r0, #1
	bne .L0804D38A
	movs r0, #9
	ldrh r1, [r6, #0x10]
	orrs r0, r1
	strh r0, [r6, #0x10]
	adds r4, r5, #0
	adds r4, #0x29
	ldrb r1, [r4]
	adds r0, r6, #0
	bl StartBattleAnimHitEffectsDefault
	adds r0, r6, #0
	bl func_fe6_0805C308
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #2
	beq .L0804D37C
	ldr r0, [r5, #0x5c]
	bl CheckRoundCrit
	cmp r0, #1
	bne .L0804D370
	adds r0, r6, #0
	bl func_fe6_08056B08
	b .L0804D37C
.L0804D370:
	ldrb r0, [r4]
	cmp r0, #0
	bne .L0804D3A0
	ldr r0, [r5, #0x5c]
	bl func_fe6_08056C3C
.L0804D37C:
	ldrb r0, [r4]
	cmp r0, #0
	bne .L0804D3A0
	adds r0, r6, #0
	bl func_fe6_0805C358
	b .L0804D3A0
.L0804D38A:
	movs r1, #0x2c
	ldrsh r0, [r5, r1]
	cmp r0, #0x46
	beq .L0804D3A0
	cmp r0, #0x50
	bne .L0804D3A0
	bl SpellFx_Finish
	adds r0, r5, #0
	bl Proc_Break
.L0804D3A0:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_fe6_0804D3A8
func_fe6_0804D3A8: @ 0x0804D3A8
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r1, .L0804D3EC @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L0804D3F0 @ =gUnk_085D0F84
	movs r1, #3
	bl SpawnProc
	adds r6, r0, #0
	str r4, [r6, #0x5c]
	movs r0, #0
	strh r0, [r6, #0x2c]
	ldr r1, .L0804D3F4 @ =gUnk_085D4148
	ldr r2, .L0804D3F8 @ =gUnk_085D3DB0
	ldr r3, .L0804D3FC @ =gUnk_085D41A4
	ldr r0, .L0804D400 @ =gUnk_085D3E0C
	str r0, [sp]
	adds r0, r4, #0
	bl EfxCreateFrontAnim
	adds r5, r0, #0
	str r5, [r6, #0x60]
	adds r0, r4, #0
	bl GetAnimPosition
	cmp r0, #0
	bne .L0804D404
	ldrh r0, [r5, #2]
	adds r0, #0x48
	b .L0804D408
	.align 2, 0
.L0804D3EC: .4byte gEfxBgSemaphore
.L0804D3F0: .4byte gUnk_085D0F84
.L0804D3F4: .4byte gUnk_085D4148
.L0804D3F8: .4byte gUnk_085D3DB0
.L0804D3FC: .4byte gUnk_085D41A4
.L0804D400: .4byte gUnk_085D3E0C
.L0804D404:
	ldrh r0, [r5, #2]
	subs r0, #0x48
.L0804D408:
	strh r0, [r5, #2]
	ldr r0, .L0804D418 @ =gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne .L0804D41C
	movs r0, #0x23
	b .L0804D41E
	.align 2, 0
.L0804D418: .4byte gEkrDistanceType
.L0804D41C:
	movs r0, #0xa
.L0804D41E:
	strh r0, [r6, #0x2e]
	ldr r0, [r6, #0x5c]
	ldr r1, [r6, #0x60]
	bl func_fe6_0804D590
	str r0, [r6, #0x64]
	ldr r0, .L0804D444 @ =gUnk_0811B3E8
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, .L0804D448 @ =gUnk_0811AFE8
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L0804D444: .4byte gUnk_0811B3E8
.L0804D448: .4byte gUnk_0811AFE8

	thumb_func_start func_fe6_0804D44C
func_fe6_0804D44C: @ 0x0804D44C
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r4, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	bne .L0804D49E
	ldr r1, .L0804D48C @ =gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	ldr r0, [r4, #0x60]
	bl BasRemove
	ldr r0, .L0804D490 @ =gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne .L0804D498
	ldr r0, .L0804D494 @ =gUnk_Banim_02017750
	movs r1, #1
	str r1, [r0]
	ldr r0, [r4, #0x64]
	bl Proc_End
	adds r0, r4, #0
	bl Proc_End
	b .L0804D49E
	.align 2, 0
.L0804D48C: .4byte gEfxBgSemaphore
.L0804D490: .4byte gEkrDistanceType
.L0804D494: .4byte gUnk_Banim_02017750
.L0804D498:
	adds r0, r4, #0
	bl Proc_Break
.L0804D49E:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start func_fe6_0804D4A4
func_fe6_0804D4A4: @ 0x0804D4A4
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, .L0804D4C8 @ =gUnk_Banim_0201774C
	movs r0, #0
	str r0, [r1]
	ldr r0, [r4, #0x64]
	bl Proc_End
	ldr r0, [r4, #0x5c]
	bl func_fe6_0804D4CC
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0804D4C8: .4byte gUnk_Banim_0201774C

	thumb_func_start func_fe6_0804D4CC
func_fe6_0804D4CC: @ 0x0804D4CC
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r1, .L0804D50C @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L0804D510 @ =gUnk_085D0FA4
	movs r1, #3
	bl SpawnProc
	adds r6, r0, #0
	str r4, [r6, #0x5c]
	movs r0, #0
	strh r0, [r6, #0x2c]
	ldr r3, .L0804D514 @ =gUnk_085D41C4
	ldr r2, .L0804D518 @ =gUnk_085D3E2C
	str r2, [sp]
	adds r0, r4, #0
	adds r1, r3, #0
	bl EfxCreateFrontAnim
	adds r5, r0, #0
	str r5, [r6, #0x60]
	adds r0, r4, #0
	bl GetAnimPosition
	cmp r0, #0
	bne .L0804D51C
	ldrh r0, [r5, #2]
	adds r0, #0x48
	b .L0804D520
	.align 2, 0
.L0804D50C: .4byte gEfxBgSemaphore
.L0804D510: .4byte gUnk_085D0FA4
.L0804D514: .4byte gUnk_085D41C4
.L0804D518: .4byte gUnk_085D3E2C
.L0804D51C:
	ldrh r0, [r5, #2]
	subs r0, #0x48
.L0804D520:
	strh r0, [r5, #2]
	ldr r0, .L0804D548 @ =gUnk_0811B3E8
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, .L0804D54C @ =gUnk_0811AFE8
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	ldr r0, [r6, #0x5c]
	ldr r1, [r6, #0x60]
	bl func_fe6_0804D590
	str r0, [r6, #0x64]
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L0804D548: .4byte gUnk_0811B3E8
.L0804D54C: .4byte gUnk_0811AFE8

	thumb_func_start func_fe6_0804D550
func_fe6_0804D550: @ 0x0804D550
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x11
	bne .L0804D582
	ldr r1, .L0804D588 @ =gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	ldr r1, .L0804D58C @ =gUnk_Banim_02017750
	movs r0, #1
	str r0, [r1]
	ldr r0, [r4, #0x64]
	bl Proc_End
	ldr r0, [r4, #0x60]
	bl BasRemove
	adds r0, r4, #0
	bl Proc_Break
.L0804D582:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0804D588: .4byte gEfxBgSemaphore
.L0804D58C: .4byte gUnk_Banim_02017750

	thumb_func_start func_fe6_0804D590
func_fe6_0804D590: @ 0x0804D590
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r5, r1, #0
	ldr r1, .L0804D5CC @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L0804D5D0 @ =gUnk_085D0FBC
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r6, [r4, #0x5c]
	str r5, [r4, #0x60]
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #1
	strh r0, [r4, #0x2e]
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #2
	ldrsh r2, [r6, r0]
	movs r0, #0xcd
	movs r3, #1
	bl func_fe6_0805C804
	adds r0, r4, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
.L0804D5CC: .4byte gEfxBgSemaphore
.L0804D5D0: .4byte gUnk_085D0FBC

	thumb_func_start func_fe6_0804D5D4
func_fe6_0804D5D4: @ 0x0804D5D4
	ldr r1, .L0804D5E0 @ =gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bx lr
	.align 2, 0
.L0804D5E0: .4byte gEfxBgSemaphore

	thumb_func_start func_fe6_0804D5E4
func_fe6_0804D5E4: @ 0x0804D5E4
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #8
	bne .L0804D626
	ldr r0, [r4, #0x60]
	bl func_fe6_0805C76C
	adds r2, r0, #0
	ldr r0, [r4, #0x60]
	ldrh r0, [r0, #2]
	adds r2, r0, r2
	movs r1, #0x80
	lsls r1, r1, #1
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	movs r0, #0xcd
	movs r3, #1
	bl func_fe6_0805C804
	movs r0, #0
	strh r0, [r4, #0x2c]
	ldrh r1, [r4, #0x2e]
	movs r2, #0x2e
	ldrsh r0, [r4, r2]
	cmp r0, #8
	bgt .L0804D626
	adds r0, r1, #1
	strh r0, [r4, #0x2e]
.L0804D626:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start func_fe6_0804D62C
func_fe6_0804D62C: @ 0x0804D62C
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl SpellFx_SetBG1Position
	ldr r0, .L0804D660 @ =gUnk_085D0FDC
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r5, #0
	bl GetAnimRoundTypeAnotherSide
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl CheckRoundMiss
	adds r4, #0x29
	strb r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0804D660: .4byte gUnk_085D0FDC

	thumb_func_start func_fe6_0804D664
func_fe6_0804D664: @ 0x0804D664
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x5c]
	bl GetAnimAnotherSide
	adds r6, r0, #0
	bl EfxGetCamMovDuration
	adds r4, r0, #0
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne .L0804D6FA
	ldr r0, [r5, #0x5c]
	movs r1, #1
	rsbs r1, r1, #0
	bl NewEfxFarAttackWithDistance
	ldr r0, [r5, #0x5c]
	bl func_fe6_0804D728
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r0, [r5, #0x5c]
	movs r3, #2
	ldrsh r2, [r0, r3]
	movs r0, #0xcc
	movs r3, #1
	bl func_fe6_0805C804
	ldrh r0, [r5, #0x2c]
	cmp r0, #1
	bne .L0804D6FA
	movs r0, #9
	ldrh r1, [r6, #0x10]
	orrs r0, r1
	strh r0, [r6, #0x10]
	adds r4, r5, #0
	adds r4, #0x29
	ldrb r1, [r4]
	adds r0, r6, #0
	bl StartBattleAnimHitEffectsDefault
	adds r0, r6, #0
	bl func_fe6_0805C308
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #2
	beq .L0804D6EC
	ldr r0, [r5, #0x5c]
	bl CheckRoundCrit
	cmp r0, #1
	bne .L0804D6E0
	adds r0, r6, #0
	bl func_fe6_08056B08
	b .L0804D6EC
.L0804D6E0:
	ldrb r0, [r4]
	cmp r0, #0
	bne .L0804D720
	ldr r0, [r5, #0x5c]
	bl func_fe6_08056C3C
.L0804D6EC:
	ldrb r0, [r4]
	cmp r0, #0
	bne .L0804D720
	adds r0, r6, #0
	bl func_fe6_0805C358
	b .L0804D720
.L0804D6FA:
	movs r3, #0x2c
	ldrsh r1, [r5, r3]
	adds r0, r4, #0
	adds r0, #9
	cmp r1, r0
	bne .L0804D70E
	ldr r0, [r5, #0x5c]
	bl GetAnimAnotherSide
	b .L0804D720
.L0804D70E:
	adds r0, r4, #0
	adds r0, #0xa
	cmp r1, r0
	bne .L0804D720
	bl SpellFx_Finish
	adds r0, r5, #0
	bl Proc_Break
.L0804D720:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_fe6_0804D728
func_fe6_0804D728: @ 0x0804D728
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, .L0804D770 @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L0804D774 @ =gUnk_085D0FF4
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	ldr r1, .L0804D778 @ =gUnk_085D42F0
	ldr r2, .L0804D77C @ =gUnk_085D4264
	ldr r3, .L0804D780 @ =gUnk_085D4300
	ldr r0, .L0804D784 @ =gUnk_085D4274
	str r0, [sp]
	adds r0, r5, #0
	bl EfxCreateFrontAnim
	str r0, [r4, #0x60]
	ldr r0, .L0804D788 @ =gUnk_0811B3E8
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, .L0804D78C @ =gUnk_0811B408
	movs r1, #0x60
	bl SpellFx_RegisterObjGfx
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0804D770: .4byte gEfxBgSemaphore
.L0804D774: .4byte gUnk_085D0FF4
.L0804D778: .4byte gUnk_085D42F0
.L0804D77C: .4byte gUnk_085D4264
.L0804D780: .4byte gUnk_085D4300
.L0804D784: .4byte gUnk_085D4274
.L0804D788: .4byte gUnk_0811B3E8
.L0804D78C: .4byte gUnk_0811B408

	thumb_func_start func_fe6_0804D790
func_fe6_0804D790: @ 0x0804D790
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #4
	bne .L0804D7B6
	ldr r0, .L0804D7BC @ =gEfxBgSemaphore
	ldr r1, [r0]
	subs r1, #1
	str r1, [r0]
	ldr r0, [r4, #0x60]
	bl BasRemove
	adds r0, r4, #0
	bl Proc_Break
.L0804D7B6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0804D7BC: .4byte gEfxBgSemaphore

	thumb_func_start func_fe6_0804D7C0
func_fe6_0804D7C0: @ 0x0804D7C0
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl SpellFx_SetBG1Position
	ldr r0, .L0804D810 @ =gUnk_085D100C
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r5, #0
	bl GetAnimRoundTypeAnotherSide
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl CheckRoundMiss
	adds r4, #0x29
	strb r0, [r4]
	adds r0, r5, #0
	movs r1, #0
	bl func_fe6_0804DBAC
	ldr r0, .L0804D814 @ =gUnk_0811B674
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, .L0804D818 @ =gUnk_0811B444
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0804D810: .4byte gUnk_085D100C
.L0804D814: .4byte gUnk_0811B674
.L0804D818: .4byte gUnk_0811B444

	thumb_func_start func_fe6_0804D81C
func_fe6_0804D81C: @ 0x0804D81C
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl SpellFx_SetBG1Position
	ldr r0, .L0804D86C @ =gUnk_085D100C
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r5, #0
	bl GetAnimRoundTypeAnotherSide
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl CheckRoundMiss
	adds r4, #0x29
	strb r0, [r4]
	adds r0, r5, #0
	movs r1, #1
	bl func_fe6_0804DBAC
	ldr r0, .L0804D870 @ =gUnk_0811B8B0
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, .L0804D874 @ =gUnk_0811B694
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0804D86C: .4byte gUnk_085D100C
.L0804D870: .4byte gUnk_0811B8B0
.L0804D874: .4byte gUnk_0811B694

	thumb_func_start func_fe6_0804D878
func_fe6_0804D878: @ 0x0804D878
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl SpellFx_SetBG1Position
	ldr r0, .L0804D8C8 @ =gUnk_085D100C
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r5, #0
	bl GetAnimRoundTypeAnotherSide
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl CheckRoundMiss
	adds r4, #0x29
	strb r0, [r4]
	adds r0, r5, #0
	movs r1, #0
	bl func_fe6_0804DBAC
	ldr r0, .L0804D8CC @ =gUnk_0811BAE8
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, .L0804D8D0 @ =gUnk_0811B8D0
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0804D8C8: .4byte gUnk_085D100C
.L0804D8CC: .4byte gUnk_0811BAE8
.L0804D8D0: .4byte gUnk_0811B8D0

	thumb_func_start func_fe6_0804D8D4
func_fe6_0804D8D4: @ 0x0804D8D4
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl SpellFx_SetBG1Position
	ldr r0, .L0804D924 @ =gUnk_085D100C
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r5, #0
	bl GetAnimRoundTypeAnotherSide
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl CheckRoundMiss
	adds r4, #0x29
	strb r0, [r4]
	adds r0, r5, #0
	movs r1, #1
	bl func_fe6_0804DBAC
	ldr r0, .L0804D928 @ =gUnk_0811BD24
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, .L0804D92C @ =gUnk_0811BB08
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0804D924: .4byte gUnk_085D100C
.L0804D928: .4byte gUnk_0811BD24
.L0804D92C: .4byte gUnk_0811BB08

	thumb_func_start func_fe6_0804D930
func_fe6_0804D930: @ 0x0804D930
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl SpellFx_SetBG1Position
	ldr r0, .L0804D980 @ =gUnk_085D100C
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r5, #0
	bl GetAnimRoundTypeAnotherSide
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl CheckRoundMiss
	adds r4, #0x29
	strb r0, [r4]
	adds r0, r5, #0
	movs r1, #1
	bl func_fe6_0804DBAC
	ldr r0, .L0804D984 @ =gUnk_0811BF70
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, .L0804D988 @ =gUnk_0811BD44
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0804D980: .4byte gUnk_085D100C
.L0804D984: .4byte gUnk_0811BF70
.L0804D988: .4byte gUnk_0811BD44

	thumb_func_start func_fe6_0804D98C
func_fe6_0804D98C: @ 0x0804D98C
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl SpellFx_SetBG1Position
	ldr r0, .L0804D9DC @ =gUnk_085D100C
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r5, #0
	bl GetAnimRoundTypeAnotherSide
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl CheckRoundMiss
	adds r4, #0x29
	strb r0, [r4]
	adds r0, r5, #0
	movs r1, #1
	bl func_fe6_0804DBAC
	ldr r0, .L0804D9E0 @ =gUnk_0811C1D8
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, .L0804D9E4 @ =gUnk_0811BF90
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0804D9DC: .4byte gUnk_085D100C
.L0804D9E0: .4byte gUnk_0811C1D8
.L0804D9E4: .4byte gUnk_0811BF90

	thumb_func_start func_fe6_0804D9E8
func_fe6_0804D9E8: @ 0x0804D9E8
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl SpellFx_SetBG1Position
	ldr r0, .L0804DA38 @ =gUnk_085D100C
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r5, #0
	bl GetAnimRoundTypeAnotherSide
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl CheckRoundMiss
	adds r4, #0x29
	strb r0, [r4]
	adds r0, r5, #0
	movs r1, #1
	bl func_fe6_0804DBAC
	ldr r0, .L0804DA3C @ =gUnk_0811C430
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, .L0804DA40 @ =gUnk_0811C1F8
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0804DA38: .4byte gUnk_085D100C
.L0804DA3C: .4byte gUnk_0811C430
.L0804DA40: .4byte gUnk_0811C1F8

	thumb_func_start func_fe6_0804DA44
func_fe6_0804DA44: @ 0x0804DA44
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl SpellFx_SetBG1Position
	ldr r0, .L0804DA94 @ =gUnk_085D100C
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r5, #0
	bl GetAnimRoundTypeAnotherSide
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl CheckRoundMiss
	adds r4, #0x29
	strb r0, [r4]
	adds r0, r5, #0
	movs r1, #1
	bl func_fe6_0804DBAC
	ldr r0, .L0804DA98 @ =gUnk_0811C6B4
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, .L0804DA9C @ =gUnk_0811C450
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0804DA94: .4byte gUnk_085D100C
.L0804DA98: .4byte gUnk_0811C6B4
.L0804DA9C: .4byte gUnk_0811C450

	thumb_func_start func_fe6_0804DAA0
func_fe6_0804DAA0: @ 0x0804DAA0
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl SpellFx_SetBG1Position
	ldr r0, .L0804DAF0 @ =gUnk_085D100C
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r5, #0
	bl GetAnimRoundTypeAnotherSide
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl CheckRoundMiss
	adds r4, #0x29
	strb r0, [r4]
	adds r0, r5, #0
	movs r1, #1
	bl func_fe6_0804DBAC
	ldr r0, .L0804DAF4 @ =gUnk_0811C944
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, .L0804DAF8 @ =gUnk_0811C6D4
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0804DAF0: .4byte gUnk_085D100C
.L0804DAF4: .4byte gUnk_0811C944
.L0804DAF8: .4byte gUnk_0811C6D4

	thumb_func_start func_fe6_0804DAFC
func_fe6_0804DAFC: @ 0x0804DAFC
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne .L0804DB86
	ldr r0, [r5, #0x5c]
	movs r1, #1
	rsbs r1, r1, #0
	bl NewEfxFarAttackWithDistance
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r0, [r5, #0x5c]
	movs r3, #2
	ldrsh r2, [r0, r3]
	movs r0, #0xca
	movs r3, #1
	bl func_fe6_0805C804
	ldrh r0, [r5, #0x2c]
	cmp r0, #1
	bne .L0804DB86
	ldr r0, [r5, #0x5c]
	bl GetAnimAnotherSide
	adds r6, r0, #0
	movs r0, #9
	ldrh r1, [r6, #0x10]
	orrs r0, r1
	strh r0, [r6, #0x10]
	adds r4, r5, #0
	adds r4, #0x29
	ldrb r1, [r4]
	adds r0, r6, #0
	bl StartBattleAnimHitEffectsDefault
	adds r0, r6, #0
	bl func_fe6_0805C308
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #2
	beq .L0804DB78
	ldr r0, [r5, #0x5c]
	bl CheckRoundCrit
	cmp r0, #1
	bne .L0804DB6C
	adds r0, r6, #0
	bl func_fe6_08056B08
	b .L0804DB78
.L0804DB6C:
	ldrb r0, [r4]
	cmp r0, #0
	bne .L0804DBA4
	ldr r0, [r5, #0x5c]
	bl func_fe6_08056C3C
.L0804DB78:
	ldrb r0, [r4]
	cmp r0, #0
	bne .L0804DBA4
	adds r0, r6, #0
	bl func_fe6_0805C358
	b .L0804DBA4
.L0804DB86:
	movs r3, #0x2c
	ldrsh r0, [r5, r3]
	cmp r0, #0xe
	bne .L0804DB96
	ldr r0, [r5, #0x5c]
	bl GetAnimAnotherSide
	b .L0804DBA4
.L0804DB96:
	cmp r0, #0x10
	bne .L0804DBA4
	bl SpellFx_Finish
	adds r0, r5, #0
	bl Proc_Break
.L0804DBA4:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_fe6_0804DBAC
func_fe6_0804DBAC: @ 0x0804DBAC
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	adds r4, r1, #0
	ldr r1, .L0804DBD8 @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L0804DBDC @ =gUnk_085D1024
	movs r1, #3
	bl SpawnProc
	adds r5, r0, #0
	str r6, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	cmp r4, #0
	bne .L0804DBE8
	ldr r2, .L0804DBE0 @ =gUnk_085D44E4
	ldr r3, .L0804DBE4 @ =gUnk_085D4738
	b .L0804DBEC
	.align 2, 0
.L0804DBD8: .4byte gEfxBgSemaphore
.L0804DBDC: .4byte gUnk_085D1024
.L0804DBE0: .4byte gUnk_085D44E4
.L0804DBE4: .4byte gUnk_085D4738
.L0804DBE8:
	ldr r2, .L0804DC0C @ =gUnk_085D4998
	ldr r3, .L0804DC10 @ =gUnk_085D4BF8
.L0804DBEC:
	str r2, [sp]
	adds r0, r6, #0
	adds r1, r3, #0
	bl EfxCreateFrontAnim
	adds r4, r0, #0
	str r4, [r5, #0x60]
	adds r0, r6, #0
	bl GetAnimPosition
	cmp r0, #0
	bne .L0804DC14
	ldrh r0, [r4, #2]
	adds r0, #0x38
	b .L0804DC18
	.align 2, 0
.L0804DC0C: .4byte gUnk_085D4998
.L0804DC10: .4byte gUnk_085D4BF8
.L0804DC14:
	ldrh r0, [r4, #2]
	subs r0, #0x38
.L0804DC18:
	strh r0, [r4, #2]
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_fe6_0804DC24
func_fe6_0804DC24: @ 0x0804DC24
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xc
	bne .L0804DC4A
	ldr r0, .L0804DC50 @ =gEfxBgSemaphore
	ldr r1, [r0]
	subs r1, #1
	str r1, [r0]
	ldr r0, [r4, #0x60]
	bl BasRemove
	adds r0, r4, #0
	bl Proc_Break
.L0804DC4A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0804DC50: .4byte gEfxBgSemaphore

	thumb_func_start func_fe6_0804DC54
func_fe6_0804DC54: @ 0x0804DC54
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl SpellFx_SetBG1Position
	ldr r0, .L0804DC88 @ =gUnk_085D103C
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r5, #0
	bl GetAnimRoundTypeAnotherSide
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl CheckRoundMiss
	adds r4, #0x29
	strb r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0804DC88: .4byte gUnk_085D103C

	thumb_func_start func_fe6_0804DC8C
func_fe6_0804DC8C: @ 0x0804DC8C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x5c]
	bl GetAnimAnotherSide
	adds r4, r0, #0
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	movs r6, #0
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x27
	bne .L0804DCC4
	adds r0, r4, #0
	bl func_fe6_0804DD38
	adds r0, r4, #0
	bl func_fe6_0804DDC8
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #2
	ldrsh r2, [r4, r0]
	movs r0, #0xef
	movs r3, #1
	bl func_fe6_0805C804
.L0804DCC4:
	movs r1, #0x2c
	ldrsh r0, [r5, r1]
	cmp r0, #0x45
	bne .L0804DD1C
	movs r0, #9
	ldrh r1, [r4, #0x10]
	orrs r0, r1
	strh r0, [r4, #0x10]
	adds r0, r5, #0
	adds r0, #0x29
	ldrb r1, [r0]
	adds r0, r4, #0
	bl StartBattleAnimStatusChgHitEffects
	adds r0, r4, #0
	bl GetAnimPosition
	cmp r0, #0
	bne .L0804DD00
	ldr r0, .L0804DCF8 @ =gpEfxUnitPaletteBackup
	ldr r0, [r0]
	ldr r1, .L0804DCFC @ =gPal+0x2E0
	movs r2, #8
	bl CpuFastSet
	b .L0804DD0C
	.align 2, 0
.L0804DCF8: .4byte gpEfxUnitPaletteBackup
.L0804DCFC: .4byte gPal+0x2E0
.L0804DD00:
	ldr r0, .L0804DD14 @ =gpEfxUnitPaletteBackup
	ldr r0, [r0, #4]
	ldr r1, .L0804DD18 @ =gPal+0x320
	movs r2, #8
	bl CpuFastSet
.L0804DD0C:
	adds r0, r4, #0
	bl EnableEfxStatusUnits
	b .L0804DD32
	.align 2, 0
.L0804DD14: .4byte gpEfxUnitPaletteBackup
.L0804DD18: .4byte gPal+0x320
.L0804DD1C:
	cmp r0, #0x64
	bne .L0804DD32
	movs r0, #2
	ldrh r1, [r4, #0x10]
	orrs r0, r1
	strh r0, [r4, #0x10]
	bl SpellFx_Finish
	adds r0, r5, #0
	bl Proc_Break
.L0804DD32:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start func_fe6_0804DD38
func_fe6_0804DD38: @ 0x0804DD38
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r1, .L0804DD80 @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L0804DD84 @ =gUnk_085D1054
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	ldr r0, .L0804DD88 @ =gUnk_0811CAF8
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	ldr r0, .L0804DD8C @ =gUnk_0811CD14
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	ldr r0, [r4, #0x5c]
	ldr r2, .L0804DD90 @ =gUnk_0811D0D4
	adds r1, r2, #0
	bl SpellFx_WriteBgMap
	bl SpellFx_SetBG1Position
	bl SpellFx_SetSomeColorEffect
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0804DD80: .4byte gEfxBgSemaphore
.L0804DD84: .4byte gUnk_085D1054
.L0804DD88: .4byte gUnk_0811CAF8
.L0804DD8C: .4byte gUnk_0811CD14
.L0804DD90: .4byte gUnk_0811D0D4

	thumb_func_start func_fe6_0804DD94
func_fe6_0804DD94: @ 0x0804DD94
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x1f
	bne .L0804DDBC
	bl SpellFx_ClearBG1
	bl SpellFx_ClearColorEffects
	ldr r1, .L0804DDC4 @ =gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
.L0804DDBC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0804DDC4: .4byte gEfxBgSemaphore

	thumb_func_start func_fe6_0804DDC8
func_fe6_0804DDC8: @ 0x0804DDC8
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, .L0804DDF4 @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L0804DDF8 @ =gUnk_085D106C
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, .L0804DDFC @ =gUnk_08119CDC
	str r1, [r0, #0x48]
	ldr r1, .L0804DE00 @ =gUnk_0811CD14
	str r1, [r0, #0x4c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0804DDF4: .4byte gEfxBgSemaphore
.L0804DDF8: .4byte gUnk_085D106C
.L0804DDFC: .4byte gUnk_08119CDC
.L0804DE00: .4byte gUnk_0811CD14

	thumb_func_start func_fe6_0804DE04
func_fe6_0804DE04: @ 0x0804DE04
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
	blt .L0804DE2A
	ldr r0, [r4, #0x4c]
	lsls r1, r1, #5
	adds r0, r0, r1
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	b .L0804DE40
.L0804DE2A:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne .L0804DE40
	ldr r1, .L0804DE48 @ =gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
.L0804DE40:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0804DE48: .4byte gEfxBgSemaphore

	thumb_func_start func_fe6_0804DE4C
func_fe6_0804DE4C: @ 0x0804DE4C
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl SpellFx_SetBG1Position
	ldr r0, .L0804DE80 @ =gUnk_085D108C
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r5, #0
	bl GetAnimRoundTypeAnotherSide
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl CheckRoundMiss
	adds r4, #0x29
	strb r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0804DE80: .4byte gUnk_085D108C

	thumb_func_start func_fe6_0804DE84
func_fe6_0804DE84: @ 0x0804DE84
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x5c]
	bl GetAnimAnotherSide
	adds r4, r0, #0
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	movs r6, #0
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x19
	bne .L0804DEBC
	adds r0, r4, #0
	bl func_fe6_0804DD38
	adds r0, r4, #0
	bl func_fe6_0804DDC8
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #2
	ldrsh r2, [r4, r0]
	movs r0, #0xef
	movs r3, #1
	bl func_fe6_0805C804
.L0804DEBC:
	movs r1, #0x2c
	ldrsh r0, [r5, r1]
	cmp r0, #0x37
	bne .L0804DF14
	movs r0, #9
	ldrh r1, [r4, #0x10]
	orrs r0, r1
	strh r0, [r4, #0x10]
	adds r0, r5, #0
	adds r0, #0x29
	ldrb r1, [r0]
	adds r0, r4, #0
	bl StartBattleAnimStatusChgHitEffects
	adds r0, r4, #0
	bl GetAnimPosition
	cmp r0, #0
	bne .L0804DEF8
	ldr r0, .L0804DEF0 @ =gpEfxUnitPaletteBackup
	ldr r0, [r0]
	ldr r1, .L0804DEF4 @ =gPal+0x2E0
	movs r2, #8
	bl CpuFastSet
	b .L0804DF04
	.align 2, 0
.L0804DEF0: .4byte gpEfxUnitPaletteBackup
.L0804DEF4: .4byte gPal+0x2E0
.L0804DEF8:
	ldr r0, .L0804DF0C @ =gpEfxUnitPaletteBackup
	ldr r0, [r0, #4]
	ldr r1, .L0804DF10 @ =gPal+0x320
	movs r2, #8
	bl CpuFastSet
.L0804DF04:
	adds r0, r4, #0
	bl EnableEfxStatusUnits
	b .L0804DF2A
	.align 2, 0
.L0804DF0C: .4byte gpEfxUnitPaletteBackup
.L0804DF10: .4byte gPal+0x320
.L0804DF14:
	cmp r0, #0x64
	bne .L0804DF2A
	movs r0, #2
	ldrh r1, [r4, #0x10]
	orrs r0, r1
	strh r0, [r4, #0x10]
	bl SpellFx_Finish
	adds r0, r5, #0
	bl Proc_Break
.L0804DF2A:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start func_fe6_0804DF30
func_fe6_0804DF30: @ 0x0804DF30
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl SpellFx_SetBG1Position
	ldr r0, .L0804DF7C @ =gUnk_085D10A4
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r5, #0
	bl GetAnimRoundTypeAnotherSide
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl CheckRoundMiss
	adds r1, r4, #0
	adds r1, #0x29
	strb r0, [r1]
	movs r0, #0x9b
	lsls r0, r0, #1
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r2, [r4, #0x5c]
	movs r3, #2
	ldrsh r2, [r2, r3]
	movs r3, #1
	bl func_fe6_0805C804
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0804DF7C: .4byte gUnk_085D10A4

	thumb_func_start func_fe6_0804DF80
func_fe6_0804DF80: @ 0x0804DF80
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x5c]
	bl GetAnimAnotherSide
	adds r6, r0, #0
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #2
	bne .L0804DFA6
	ldr r0, [r5, #0x5c]
	movs r1, #1
	rsbs r1, r1, #0
	bl NewEfxFarAttackWithDistance
	b .L0804E038
.L0804DFA6:
	movs r1, #0x2c
	ldrsh r0, [r5, r1]
	cmp r0, #0x22
	bne .L0804DFC8
	ldr r0, .L0804DFC4 @ =0x00000137
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r2, [r5, #0x5c]
	movs r3, #2
	ldrsh r2, [r2, r3]
	movs r3, #1
	bl func_fe6_0805C804
	b .L0804E038
	.align 2, 0
.L0804DFC4: .4byte 0x00000137
.L0804DFC8:
	cmp r0, #0x2a
	bne .L0804DFD4
	adds r0, r6, #0
	bl func_fe6_0804E040
	b .L0804E038
.L0804DFD4:
	cmp r0, #0x2d
	bne .L0804E026
	movs r0, #9
	ldrh r1, [r6, #0x10]
	orrs r0, r1
	strh r0, [r6, #0x10]
	adds r4, r5, #0
	adds r4, #0x29
	ldrb r1, [r4]
	adds r0, r6, #0
	bl StartBattleAnimHitEffectsDefault
	adds r0, r6, #0
	bl func_fe6_0805C308
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #2
	beq .L0804E018
	ldr r0, [r5, #0x5c]
	bl CheckRoundCrit
	cmp r0, #1
	bne .L0804E00C
	adds r0, r6, #0
	bl func_fe6_08056B08
	b .L0804E018
.L0804E00C:
	ldrb r0, [r4]
	cmp r0, #0
	bne .L0804E038
	ldr r0, [r5, #0x5c]
	bl func_fe6_08056C3C
.L0804E018:
	ldrb r0, [r4]
	cmp r0, #0
	bne .L0804E038
	adds r0, r6, #0
	bl func_fe6_0805C358
	b .L0804E038
.L0804E026:
	cmp r0, #0x3e
	beq .L0804E038
	cmp r0, #0x40
	bne .L0804E038
	bl SpellFx_Finish
	adds r0, r5, #0
	bl Proc_Break
.L0804E038:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_fe6_0804E040
func_fe6_0804E040: @ 0x0804E040
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, .L0804E094 @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L0804E098 @ =gUnk_085D10BC
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r7, #0
	movs r0, #0
	strh r0, [r4, #0x2c]
	ldr r3, .L0804E09C @ =gUnk_085D4CFC
	ldr r2, .L0804E0A0 @ =gUnk_085D4D98
	str r2, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	bl EfxCreateFrontAnim
	adds r6, r0, #0
	str r6, [r4, #0x60]
	ldrh r0, [r6, #4]
	adds r0, #0x10
	strh r0, [r6, #4]
	movs r0, #0xc0
	lsls r0, r0, #4
	ldrh r1, [r6, #8]
	ands r0, r1
	strh r0, [r6, #8]
	adds r0, r5, #0
	bl GetAnimPosition
	cmp r0, #1
	bne .L0804E0A4
	movs r1, #0xe4
	lsls r1, r1, #7
	b .L0804E0A8
	.align 2, 0
.L0804E094: .4byte gEfxBgSemaphore
.L0804E098: .4byte gUnk_085D10BC
.L0804E09C: .4byte gUnk_085D4CFC
.L0804E0A0: .4byte gUnk_085D4D98
.L0804E0A4:
	movs r1, #0x93
	lsls r1, r1, #8
.L0804E0A8:
	adds r0, r1, #0
	ldrh r1, [r6, #8]
	orrs r0, r1
	strh r0, [r6, #8]
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start func_fe6_0804E0B8
func_fe6_0804E0B8: @ 0x0804E0B8
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xa
	ble .L0804E0DE
	ldr r0, [r4, #0x60]
	bl BasRemove
	ldr r1, .L0804E0E4 @ =gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
.L0804E0DE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0804E0E4: .4byte gEfxBgSemaphore

	thumb_func_start func_fe6_0804E0E8
func_fe6_0804E0E8: @ 0x0804E0E8
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl func_fe6_08047300
	bl SpellFx_SetBG1Position
	ldr r0, .L0804E120 @ =gUnk_085D10D4
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r5, #0
	bl GetAnimRoundTypeAnotherSide
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl CheckRoundMiss
	adds r4, #0x29
	strb r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0804E120: .4byte gUnk_085D10D4

	thumb_func_start func_fe6_0804E124
func_fe6_0804E124: @ 0x0804E124
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetAnimAnotherSide
	adds r5, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne .L0804E148
	ldr r0, [r4, #0x5c]
	movs r1, #6
	bl NewEfxFlashBgWhite
	b .L0804E1BA
.L0804E148:
	cmp r0, #6
	bne .L0804E180
	ldr r0, [r4, #0x5c]
	movs r1, #1
	rsbs r1, r1, #0
	bl NewEfxFarAttackWithDistance
	adds r0, r5, #0
	movs r1, #9
	bl func_fe6_0804E1C0
	adds r0, r5, #0
	movs r1, #9
	bl func_fe6_0804E2B4
	adds r0, r5, #0
	bl func_fe6_0804E3C0
	movs r0, #0x86
	lsls r0, r0, #1
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
	movs r3, #1
	bl func_fe6_0805C804
	b .L0804E1BA
.L0804E180:
	cmp r0, #0xa
	bne .L0804E1A4
	movs r0, #9
	ldrh r1, [r5, #0x10]
	orrs r0, r1
	strh r0, [r5, #0x10]
	adds r4, #0x29
	ldrb r1, [r4]
	adds r0, r5, #0
	bl StartBattleAnimHitEffectsDefault
	ldrb r0, [r4]
	cmp r0, #0
	bne .L0804E1BA
	adds r0, r5, #0
	bl func_fe6_0805C358
	b .L0804E1BA
.L0804E1A4:
	cmp r0, #0x19
	beq .L0804E1BA
	cmp r0, #0x1e
	bne .L0804E1BA
	bl SpellFx_Finish
	bl func_fe6_08047358
	adds r0, r4, #0
	bl Proc_Break
.L0804E1BA:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start func_fe6_0804E1C0
func_fe6_0804E1C0: @ 0x0804E1C0
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r5, r0, #0
	adds r6, r1, #0
	ldr r1, .L0804E220 @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L0804E224 @ =gUnk_085D10EC
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	strh r6, [r4, #0x2e]
	ldr r0, .L0804E228 @ =gUnk_0811F22C
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	ldr r0, .L0804E22C @ =gUnk_0811E36C
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	ldr r0, .L0804E230 @ =gUnk_0811F32C
	ldr r5, .L0804E234 @ =gEkrTsaBuffer
	adds r1, r5, #0
	bl LZ77UnCompWram
	ldr r0, [r4, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne .L0804E23C
	ldr r1, .L0804E238 @ =gBg1Tm
	movs r0, #1
	str r0, [sp]
	adds r0, #0xff
	str r0, [sp, #4]
	adds r0, r5, #0
	movs r2, #0x20
	movs r3, #0x14
	bl EfxTmCpyBG
	b .L0804E250
	.align 2, 0
.L0804E220: .4byte gEfxBgSemaphore
.L0804E224: .4byte gUnk_085D10EC
.L0804E228: .4byte gUnk_0811F22C
.L0804E22C: .4byte gUnk_0811E36C
.L0804E230: .4byte gUnk_0811F32C
.L0804E234: .4byte gEkrTsaBuffer
.L0804E238: .4byte gBg1Tm
.L0804E23C:
	ldr r1, .L0804E278 @ =gBg1Tm
	movs r0, #1
	str r0, [sp]
	adds r0, #0xff
	str r0, [sp, #4]
	adds r0, r5, #0
	movs r2, #0x20
	movs r3, #0x14
	bl EfxTmCpyBgHFlip
.L0804E250:
	movs r0, #2
	bl EnableBgSync
	bl SpellFx_SetSomeColorEffect
	ldr r2, .L0804E27C @ =gDispIo
	movs r0, #0x21
	rsbs r0, r0, #0
	ldrb r1, [r2, #1]
	ands r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r2, #1]
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L0804E278: .4byte gBg1Tm
.L0804E27C: .4byte gDispIo

	thumb_func_start func_fe6_0804E280
func_fe6_0804E280: @ 0x0804E280
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r4, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	bne .L0804E2AA
	bl SpellFx_ClearBG1
	ldr r1, .L0804E2B0 @ =gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_ClearColorEffects
	adds r0, r4, #0
	bl Proc_Break
.L0804E2AA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0804E2B0: .4byte gEfxBgSemaphore

	thumb_func_start func_fe6_0804E2B4
func_fe6_0804E2B4: @ 0x0804E2B4
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, .L0804E2E4 @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L0804E2E8 @ =gUnk_085D1104
	movs r1, #3
	bl SpawnProc
	adds r6, r0, #0
	str r4, [r6, #0x5c]
	movs r0, #0
	strh r0, [r6, #0x2c]
	strh r5, [r6, #0x2e]
	adds r0, r4, #0
	bl GetAnimPosition
	cmp r0, #0
	bne .L0804E2EC
	movs r0, #0xd8
	b .L0804E2F0
	.align 2, 0
.L0804E2E4: .4byte gEfxBgSemaphore
.L0804E2E8: .4byte gUnk_085D1104
.L0804E2EC:
	movs r0, #0xd8
	rsbs r0, r0, #0
.L0804E2F0:
	str r0, [r6, #0x44]
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start func_fe6_0804E2F8
func_fe6_0804E2F8: @ 0x0804E2F8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r6, r0, #0
	ldr r2, [r6, #0x44]
	movs r0, #0x2c
	ldrsh r3, [r6, r0]
	movs r1, #0x2e
	ldrsh r0, [r6, r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	bl Interpolate
	ldr r4, .L0804E330 @ =gDispIo
	strh r0, [r4, #0x20]
	ldr r0, [r6, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne .L0804E334
	ldrh r4, [r4, #0x20]
	lsrs r0, r4, #3
	adds r7, r0, #0
	adds r7, #0x1e
	b .L0804E33A
	.align 2, 0
.L0804E330: .4byte gDispIo
.L0804E334:
	ldrh r4, [r4, #0x20]
	lsrs r0, r4, #3
	subs r7, r0, #1
.L0804E33A:
	movs r2, #0x1f
	mov r8, r2
	adds r0, r7, #0
	ands r0, r2
	lsls r0, r0, #1
	ldr r5, .L0804E3B8 @ =gBg1Tm
	adds r0, r0, r5
	movs r4, #0x80
	lsls r4, r4, #1
	str r4, [sp]
	movs r1, #1
	movs r2, #0x14
	movs r3, #1
	bl FillBGRect
	adds r0, r7, #1
	mov r1, r8
	ands r0, r1
	lsls r0, r0, #1
	adds r0, r0, r5
	str r4, [sp]
	movs r1, #1
	movs r2, #0x14
	movs r3, #1
	bl FillBGRect
	adds r0, r7, #2
	mov r2, r8
	ands r0, r2
	lsls r0, r0, #1
	adds r0, r0, r5
	str r4, [sp]
	movs r1, #1
	movs r2, #0x14
	movs r3, #1
	bl FillBGRect
	movs r0, #2
	bl EnableBgSync
	ldrh r0, [r6, #0x2c]
	adds r0, #1
	strh r0, [r6, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r6, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	ble .L0804E3AC
	ldr r1, .L0804E3BC @ =gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_ClearBG1
	adds r0, r6, #0
	bl Proc_Break
.L0804E3AC:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0804E3B8: .4byte gBg1Tm
.L0804E3BC: .4byte gEfxBgSemaphore

	thumb_func_start func_fe6_0804E3C0
func_fe6_0804E3C0: @ 0x0804E3C0
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, .L0804E3EC @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L0804E3F0 @ =gUnk_085D111C
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, .L0804E3F4 @ =gUnk_08119D56
	str r1, [r0, #0x48]
	ldr r1, .L0804E3F8 @ =gUnk_0811F22C
	str r1, [r0, #0x4c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0804E3EC: .4byte gEfxBgSemaphore
.L0804E3F0: .4byte gUnk_085D111C
.L0804E3F4: .4byte gUnk_08119D56
.L0804E3F8: .4byte gUnk_0811F22C

	thumb_func_start func_fe6_0804E3FC
func_fe6_0804E3FC: @ 0x0804E3FC
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
	blt .L0804E422
	ldr r0, [r4, #0x4c]
	lsls r1, r1, #5
	adds r0, r0, r1
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	b .L0804E43C
.L0804E422:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne .L0804E43C
	bl SpellFx_ClearColorEffects
	ldr r1, .L0804E444 @ =gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
.L0804E43C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0804E444: .4byte gEfxBgSemaphore

	thumb_func_start func_fe6_0804E448
func_fe6_0804E448: @ 0x0804E448
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl func_fe6_08047300
	bl SpellFx_SetBG1Position
	ldr r0, .L0804E480 @ =gUnk_085D113C
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r5, #0
	bl GetAnimRoundTypeAnotherSide
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl CheckRoundMiss
	adds r4, #0x29
	strb r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0804E480: .4byte gUnk_085D113C

	thumb_func_start func_fe6_0804E484
func_fe6_0804E484: @ 0x0804E484
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetAnimAnotherSide
	adds r5, r0, #0
	bl EfxGetCamMovDuration
	adds r6, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	movs r7, #0
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne .L0804E4B2
	ldr r0, [r4, #0x5c]
	movs r1, #1
	rsbs r1, r1, #0
	bl NewEfxFarAttackWithDistance
.L0804E4B2:
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	adds r0, r6, #1
	cmp r1, r0
	bne .L0804E500
	ldr r0, .L0804E4FC @ =0x0000010D
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
	movs r3, #1
	bl func_fe6_0805C804
	adds r0, r5, #0
	bl func_fe6_0804E540
	ldr r0, [r4, #0x5c]
	movs r1, #6
	bl NewEfxFlashBgWhite
	movs r0, #9
	ldrh r1, [r5, #0x10]
	orrs r0, r1
	strh r0, [r5, #0x10]
	adds r4, #0x29
	ldrb r1, [r4]
	adds r0, r5, #0
	bl StartBattleAnimHitEffectsDefault
	ldrb r0, [r4]
	cmp r0, #0
	bne .L0804E536
	adds r0, r5, #0
	bl func_fe6_0805C358
	b .L0804E536
	.align 2, 0
.L0804E4FC: .4byte 0x0000010D
.L0804E500:
	adds r0, r6, #0
	adds r0, #0x1c
	cmp r1, r0
	bne .L0804E51A
	str r7, [sp]
	str r7, [sp, #4]
	adds r0, r5, #0
	movs r1, #0
	movs r2, #0xe
	movs r3, #0x10
	bl func_fe6_0804CD88
	b .L0804E536
.L0804E51A:
	adds r0, r6, #0
	adds r0, #0x32
	cmp r1, r0
	beq .L0804E536
	adds r0, #5
	cmp r1, r0
	bne .L0804E536
	bl SpellFx_Finish
	bl func_fe6_08047358
	adds r0, r4, #0
	bl Proc_Break
.L0804E536:
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_fe6_0804E540
func_fe6_0804E540: @ 0x0804E540
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, .L0804E598 @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L0804E59C @ =gUnk_085D1154
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #0x34
	strh r0, [r4, #0x2e]
	adds r0, r5, #0
	bl GetAnimPosition
	ldr r3, .L0804E5A0 @ =gUnk_085D6E78
	cmp r0, #0
	bne .L0804E570
	ldr r3, .L0804E5A4 @ =gUnk_085D6218
.L0804E570:
	str r3, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl EfxCreateFrontAnim
	str r0, [r4, #0x60]
	ldr r0, .L0804E5A8 @ =gUnk_081203F4
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, .L0804E5AC @ =gUnk_0811F6F4
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0804E598: .4byte gEfxBgSemaphore
.L0804E59C: .4byte gUnk_085D1154
.L0804E5A0: .4byte gUnk_085D6E78
.L0804E5A4: .4byte gUnk_085D6218
.L0804E5A8: .4byte gUnk_081203F4
.L0804E5AC: .4byte gUnk_0811F6F4

	thumb_func_start func_fe6_0804E5B0
func_fe6_0804E5B0: @ 0x0804E5B0
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r4, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	ble .L0804E5D8
	ldr r0, [r4, #0x60]
	bl BasRemove
	ldr r1, .L0804E5E0 @ =gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
.L0804E5D8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0804E5E0: .4byte gEfxBgSemaphore

	thumb_func_start func_fe6_0804E5E4
func_fe6_0804E5E4: @ 0x0804E5E4
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl SpellFx_SetBG1Position
	ldr r0, .L0804E618 @ =gUnk_085D116C
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r5, #0
	bl GetAnimRoundTypeAnotherSide
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl CheckRoundMiss
	adds r4, #0x29
	strb r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0804E618: .4byte gUnk_085D116C

	thumb_func_start func_fe6_0804E61C
func_fe6_0804E61C: @ 0x0804E61C
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetAnimAnotherSide
	adds r5, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	movs r6, #0
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne .L0804E67C
	ldr r0, [r4, #0x5c]
	movs r1, #0x5a
	bl func_fe6_0804D050
	adds r0, r5, #0
	bl func_fe6_0804E6BC
	adds r0, r5, #0
	bl func_fe6_0804E778
	adds r0, r5, #0
	bl func_fe6_0804E848
	str r6, [sp]
	str r6, [sp, #4]
	adds r0, r5, #0
	movs r1, #0x28
	movs r2, #0xf
	movs r3, #0x10
	bl func_fe6_0804CD88
	ldr r0, .L0804E678 @ =0x0000011D
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
	movs r3, #1
	bl func_fe6_0805C804
	b .L0804E6B2
	.align 2, 0
.L0804E678: .4byte 0x0000011D
.L0804E67C:
	cmp r0, #0xf
	bne .L0804E6A0
	movs r0, #9
	ldrh r1, [r5, #0x10]
	orrs r0, r1
	strh r0, [r5, #0x10]
	adds r4, #0x29
	ldrb r1, [r4]
	adds r0, r5, #0
	bl StartBattleAnimHitEffectsDefault
	ldrb r0, [r4]
	cmp r0, #0
	bne .L0804E6B2
	adds r0, r5, #0
	bl func_fe6_0805C358
	b .L0804E6B2
.L0804E6A0:
	cmp r0, #0x78
	beq .L0804E6B2
	cmp r0, #0x82
	bne .L0804E6B2
	bl SpellFx_Finish
	adds r0, r4, #0
	bl Proc_Break
.L0804E6B2:
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_fe6_0804E6BC
func_fe6_0804E6BC: @ 0x0804E6BC
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	ldr r1, .L0804E70C @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L0804E710 @ =gUnk_085D1184
	movs r1, #3
	bl SpawnProc
	adds r5, r0, #0
	str r6, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	movs r0, #0x34
	strh r0, [r5, #0x2e]
	adds r0, r6, #0
	bl GetAnimPosition
	ldr r3, .L0804E714 @ =gUnk_085D9208
	cmp r0, #0
	bne .L0804E6EC
	ldr r3, .L0804E718 @ =gUnk_085D8608
.L0804E6EC:
	str r3, [sp]
	adds r0, r6, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl EfxCreateFrontAnim
	adds r4, r0, #0
	str r4, [r5, #0x60]
	adds r0, r6, #0
	bl GetAnimPosition
	cmp r0, #0
	bne .L0804E71C
	ldrh r0, [r4, #2]
	adds r0, #0x20
	b .L0804E720
	.align 2, 0
.L0804E70C: .4byte gEfxBgSemaphore
.L0804E710: .4byte gUnk_085D1184
.L0804E714: .4byte gUnk_085D9208
.L0804E718: .4byte gUnk_085D8608
.L0804E71C:
	ldrh r0, [r4, #2]
	subs r0, #0x20
.L0804E720:
	strh r0, [r4, #2]
	ldr r0, .L0804E73C @ =gUnk_081203F4
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, .L0804E740 @ =gUnk_0811F6F4
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L0804E73C: .4byte gUnk_081203F4
.L0804E740: .4byte gUnk_0811F6F4

	thumb_func_start func_fe6_0804E744
func_fe6_0804E744: @ 0x0804E744
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r4, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	ble .L0804E76C
	ldr r0, [r4, #0x60]
	bl BasRemove
	ldr r1, .L0804E774 @ =gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
.L0804E76C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0804E774: .4byte gEfxBgSemaphore

	thumb_func_start func_fe6_0804E778
func_fe6_0804E778: @ 0x0804E778
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r1, .L0804E7D8 @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L0804E7DC @ =gUnk_085D119C
	movs r1, #3
	bl SpawnProc
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	movs r0, #0x70
	strh r0, [r5, #0x2e]
	ldr r0, .L0804E7E0 @ =gUnk_0813A6F8
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	ldr r0, [r5, #0x5c]
	ldr r2, .L0804E7E4 @ =gUnk_0813BA64
	adds r1, r2, #0
	bl SpellFx_WriteBgMap
	bl SpellFx_SetBG1Position
	bl SpellFx_SetSomeColorEffect
	ldr r0, .L0804E7E8 @ =gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq .L0804E808
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne .L0804E7EC
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl SetBgOffset
	b .L0804E7F6
	.align 2, 0
.L0804E7D8: .4byte gEfxBgSemaphore
.L0804E7DC: .4byte gUnk_085D119C
.L0804E7E0: .4byte gUnk_0813A6F8
.L0804E7E4: .4byte gUnk_0813BA64
.L0804E7E8: .4byte gEkrDistanceType
.L0804E7EC:
	movs r0, #1
	movs r1, #0xe8
	movs r2, #0
	bl SetBgOffset
.L0804E7F6:
	ldr r0, .L0804E810 @ =gBg1Tm+0x3C
	movs r1, #0x80
	lsls r1, r1, #1
	str r1, [sp]
	movs r1, #2
	movs r2, #0x14
	movs r3, #1
	bl func_fe6_0805B0D4
.L0804E808:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0804E810: .4byte gBg1Tm+0x3C

	thumb_func_start func_fe6_0804E814
func_fe6_0804E814: @ 0x0804E814
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r4, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	bne .L0804E83E
	bl SpellFx_ClearBG1
	bl SpellFx_ClearColorEffects
	ldr r1, .L0804E844 @ =gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
.L0804E83E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0804E844: .4byte gEfxBgSemaphore

	thumb_func_start func_fe6_0804E848
func_fe6_0804E848: @ 0x0804E848
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, .L0804E874 @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L0804E878 @ =gUnk_085D11B4
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, .L0804E87C @ =gUnk_08119D78
	str r1, [r0, #0x48]
	ldr r1, .L0804E880 @ =gUnk_0813B6B4
	str r1, [r0, #0x4c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0804E874: .4byte gEfxBgSemaphore
.L0804E878: .4byte gUnk_085D11B4
.L0804E87C: .4byte gUnk_08119D78
.L0804E880: .4byte gUnk_0813B6B4

	thumb_func_start func_fe6_0804E884
func_fe6_0804E884: @ 0x0804E884
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
	blt .L0804E8AA
	ldr r0, [r4, #0x4c]
	lsls r1, r1, #5
	adds r0, r0, r1
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	b .L0804E8C0
.L0804E8AA:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne .L0804E8C0
	ldr r1, .L0804E8C8 @ =gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
.L0804E8C0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0804E8C8: .4byte gEfxBgSemaphore

	thumb_func_start func_fe6_0804E8CC
func_fe6_0804E8CC: @ 0x0804E8CC
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl func_fe6_08047300
	bl SpellFx_SetBG1Position
	ldr r0, .L0804E904 @ =gUnk_085D11D4
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r5, #0
	bl GetAnimRoundTypeAnotherSide
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl CheckRoundMiss
	adds r4, #0x29
	strb r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0804E904: .4byte gUnk_085D11D4

	thumb_func_start func_fe6_0804E908
func_fe6_0804E908: @ 0x0804E908
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetAnimAnotherSide
	adds r5, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne .L0804E942
	ldr r0, [r4, #0x5c]
	movs r1, #0x5a
	bl func_fe6_0804D050
	ldr r0, [r4, #0x5c]
	bl func_fe6_0804E988
	movs r0, #0x8f
	lsls r0, r0, #1
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
	movs r3, #1
	bl func_fe6_0805C804
.L0804E942:
	movs r1, #0x2c
	ldrsh r0, [r4, r1]
	cmp r0, #4
	bne .L0804E96A
	movs r0, #9
	ldrh r3, [r5, #0x10]
	orrs r0, r3
	strh r0, [r5, #0x10]
	adds r4, #0x29
	ldrb r1, [r4]
	adds r0, r5, #0
	bl StartBattleAnimHitEffectsDefault
	ldrb r0, [r4]
	cmp r0, #0
	bne .L0804E980
	adds r0, r5, #0
	bl func_fe6_0805C358
	b .L0804E980
.L0804E96A:
	cmp r0, #0x32
	beq .L0804E980
	cmp r0, #0x3c
	bne .L0804E980
	bl SpellFx_Finish
	bl func_fe6_08047358
	adds r0, r4, #0
	bl Proc_Break
.L0804E980:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_fe6_0804E988
func_fe6_0804E988: @ 0x0804E988
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r1, .L0804E9C4 @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L0804E9C8 @ =gUnk_085D11EC
	movs r1, #3
	bl SpawnProc
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	ldr r2, .L0804E9CC @ =gUnk_085D9E38
	ldr r3, .L0804E9D0 @ =gUnk_085DAA68
	str r2, [sp]
	adds r0, r4, #0
	adds r1, r3, #0
	bl EfxCreateFrontAnim
	adds r6, r0, #0
	str r6, [r5, #0x60]
	adds r0, r4, #0
	bl GetAnimPosition
	cmp r0, #0
	bne .L0804E9D4
	ldrh r0, [r6, #2]
	adds r0, #0x20
	b .L0804E9D8
	.align 2, 0
.L0804E9C4: .4byte gEfxBgSemaphore
.L0804E9C8: .4byte gUnk_085D11EC
.L0804E9CC: .4byte gUnk_085D9E38
.L0804E9D0: .4byte gUnk_085DAA68
.L0804E9D4:
	ldrh r0, [r6, #2]
	subs r0, #0x20
.L0804E9D8:
	strh r0, [r6, #2]
	ldr r0, .L0804E9F4 @ =gUnk_081214B8
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, .L0804E9F8 @ =gUnk_0811F6F4
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L0804E9F4: .4byte gUnk_081214B8
.L0804E9F8: .4byte gUnk_0811F6F4

	thumb_func_start func_fe6_0804E9FC
func_fe6_0804E9FC: @ 0x0804E9FC
	push {lr}
	ldr r2, .L0804EA10 @ =gEfxBgSemaphore
	ldr r1, [r2]
	subs r1, #1
	str r1, [r2]
	ldr r0, [r0, #0x60]
	bl BasRemove
	pop {r0}
	bx r0
	.align 2, 0
.L0804EA10: .4byte gEfxBgSemaphore

	thumb_func_start func_fe6_0804EA14
func_fe6_0804EA14: @ 0x0804EA14
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl SpellFx_SetBG1Position
	ldr r0, .L0804EA48 @ =gUnk_085D120C
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r5, #0
	bl GetAnimRoundTypeAnotherSide
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl CheckRoundMiss
	adds r4, #0x29
	strb r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0804EA48: .4byte gUnk_085D120C

	thumb_func_start func_fe6_0804EA4C
func_fe6_0804EA4C: @ 0x0804EA4C
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetAnimAnotherSide
	adds r5, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne .L0804EA90
	ldr r0, [r4, #0x5c]
	movs r1, #0x5a
	bl func_fe6_0804D050
	ldr r0, [r4, #0x5c]
	bl func_fe6_0804EAD4
	ldr r0, [r4, #0x5c]
	bl func_fe6_0804EB7C
	ldr r0, [r4, #0x5c]
	bl func_fe6_0804EC04
	ldr r0, .L0804EAB8 @ =0x0000011F
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
	movs r3, #1
	bl func_fe6_0805C804
.L0804EA90:
	movs r1, #0x2c
	ldrsh r0, [r4, r1]
	cmp r0, #4
	bne .L0804EABC
	movs r0, #9
	ldrh r3, [r5, #0x10]
	orrs r0, r3
	strh r0, [r5, #0x10]
	adds r4, #0x29
	ldrb r1, [r4]
	adds r0, r5, #0
	bl StartBattleAnimHitEffectsDefault
	ldrb r0, [r4]
	cmp r0, #0
	bne .L0804EACE
	adds r0, r5, #0
	bl func_fe6_0805C358
	b .L0804EACE
	.align 2, 0
.L0804EAB8: .4byte 0x0000011F
.L0804EABC:
	cmp r0, #0x20
	beq .L0804EACE
	cmp r0, #0x30
	bne .L0804EACE
	bl SpellFx_Finish
	adds r0, r4, #0
	bl Proc_Break
.L0804EACE:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start func_fe6_0804EAD4
func_fe6_0804EAD4: @ 0x0804EAD4
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, .L0804EB10 @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L0804EB14 @ =gUnk_085D1224
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, .L0804EB18 @ =gUnk_08119DEA
	str r1, [r0, #0x48]
	ldr r1, .L0804EB1C @ =gUnk_085D123C
	str r1, [r0, #0x4c]
	str r1, [r0, #0x50]
	ldr r0, .L0804EB20 @ =gUnk_081214F8
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	bl SpellFx_SetSomeColorEffect
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0804EB10: .4byte gEfxBgSemaphore
.L0804EB14: .4byte gUnk_085D1224
.L0804EB18: .4byte gUnk_08119DEA
.L0804EB1C: .4byte gUnk_085D123C
.L0804EB20: .4byte gUnk_081214F8

	thumb_func_start func_fe6_0804EB24
func_fe6_0804EB24: @ 0x0804EB24
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
	blt .L0804EB52
	ldr r1, [r4, #0x4c]
	ldr r3, [r4, #0x50]
	ldr r0, [r4, #0x5c]
	lsls r2, r2, #2
	adds r1, r2, r1
	ldr r1, [r1]
	adds r2, r2, r3
	ldr r2, [r2]
	bl SpellFx_WriteBgMap
	b .L0804EB70
.L0804EB52:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r2, r0
	bne .L0804EB70
	bl SpellFx_ClearBG1
	ldr r1, .L0804EB78 @ =gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_ClearColorEffects
	adds r0, r4, #0
	bl Proc_Break
.L0804EB70:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0804EB78: .4byte gEfxBgSemaphore

	thumb_func_start func_fe6_0804EB7C
func_fe6_0804EB7C: @ 0x0804EB7C
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, .L0804EBA8 @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L0804EBAC @ =gUnk_085D126C
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, .L0804EBB0 @ =gUnk_08119E30
	str r1, [r0, #0x48]
	ldr r1, .L0804EBB4 @ =gUnk_0813E75C
	str r1, [r0, #0x4c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0804EBA8: .4byte gEfxBgSemaphore
.L0804EBAC: .4byte gUnk_085D126C
.L0804EBB0: .4byte gUnk_08119E30
.L0804EBB4: .4byte gUnk_0813E75C

	thumb_func_start func_fe6_0804EBB8
func_fe6_0804EBB8: @ 0x0804EBB8
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
	blt .L0804EBDE
	ldr r0, [r4, #0x4c]
	lsls r1, r1, #5
	adds r0, r0, r1
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	b .L0804EBF8
.L0804EBDE:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne .L0804EBF8
	bl SpellFx_ClearColorEffects
	ldr r1, .L0804EC00 @ =gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
.L0804EBF8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0804EC00: .4byte gEfxBgSemaphore

	thumb_func_start func_fe6_0804EC04
func_fe6_0804EC04: @ 0x0804EC04
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, .L0804EC48 @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L0804EC4C @ =gUnk_085D128C
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #0x37
	strh r0, [r4, #0x2e]
	ldr r3, .L0804EC50 @ =gUnk_085DB6A4
	str r3, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl EfxCreateFrontAnim
	adds r6, r0, #0
	str r6, [r4, #0x60]
	adds r0, r5, #0
	bl GetAnimPosition
	cmp r0, #0
	bne .L0804EC54
	ldrh r0, [r6, #2]
	adds r0, #0x24
	b .L0804EC58
	.align 2, 0
.L0804EC48: .4byte gEfxBgSemaphore
.L0804EC4C: .4byte gUnk_085D128C
.L0804EC50: .4byte gUnk_085DB6A4
.L0804EC54:
	ldrh r0, [r6, #2]
	subs r0, #0x24
.L0804EC58:
	strh r0, [r6, #2]
	ldrh r0, [r6, #4]
	adds r0, #0xc
	strh r0, [r6, #4]
	ldr r0, .L0804EC7C @ =gUnk_081214D8
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, .L0804EC80 @ =gUnk_0811F6F4
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L0804EC7C: .4byte gUnk_081214D8
.L0804EC80: .4byte gUnk_0811F6F4

	thumb_func_start func_fe6_0804EC84
func_fe6_0804EC84: @ 0x0804EC84
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r4, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	bne .L0804ECAC
	ldr r0, .L0804ECB4 @ =gEfxBgSemaphore
	ldr r1, [r0]
	subs r1, #1
	str r1, [r0]
	ldr r0, [r4, #0x60]
	bl BasRemove
	adds r0, r4, #0
	bl Proc_Break
.L0804ECAC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0804ECB4: .4byte gEfxBgSemaphore

	thumb_func_start func_fe6_0804ECB8
func_fe6_0804ECB8: @ 0x0804ECB8
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl func_fe6_08047300
	bl SpellFx_SetBG1Position
	ldr r0, .L0804ECF0 @ =gUnk_085D12A4
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r5, #0
	bl GetAnimRoundTypeAnotherSide
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl CheckRoundMiss
	adds r4, #0x29
	strb r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0804ECF0: .4byte gUnk_085D12A4

	thumb_func_start func_fe6_0804ECF4
func_fe6_0804ECF4: @ 0x0804ECF4
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetAnimAnotherSide
	adds r5, r0, #0
	bl EfxGetCamMovDuration
	adds r6, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne .L0804ED1E
	ldr r0, [r4, #0x5c]
	movs r1, #1
	rsbs r1, r1, #0
	bl NewEfxFarAttackWithDistance
.L0804ED1E:
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	adds r0, r6, #1
	cmp r1, r0
	bne .L0804ED3C
	adds r0, r5, #0
	bl func_fe6_0804ED94
	adds r0, r5, #0
	bl func_fe6_0804EE9C
	adds r0, r5, #0
	bl func_fe6_0804EF24
	b .L0804ED8E
.L0804ED3C:
	adds r0, r6, #4
	cmp r1, r0
	bne .L0804ED72
	movs r0, #9
	ldrh r1, [r5, #0x10]
	orrs r0, r1
	strh r0, [r5, #0x10]
	adds r4, #0x29
	ldrb r1, [r4]
	adds r0, r5, #0
	bl StartBattleAnimHitEffectsDefault
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #2
	ldrsh r2, [r5, r0]
	movs r0, #0xf5
	movs r3, #1
	bl func_fe6_0805C804
	ldrb r0, [r4]
	cmp r0, #0
	bne .L0804ED8E
	adds r0, r5, #0
	bl func_fe6_0805C358
	b .L0804ED8E
.L0804ED72:
	adds r0, r6, #0
	adds r0, #0x50
	cmp r1, r0
	beq .L0804ED8E
	adds r0, #0x10
	cmp r1, r0
	bne .L0804ED8E
	bl SpellFx_Finish
	bl func_fe6_08047358
	adds r0, r4, #0
	bl Proc_Break
.L0804ED8E:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start func_fe6_0804ED94
func_fe6_0804ED94: @ 0x0804ED94
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, .L0804EDEC @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L0804EDF0 @ =gUnk_085D12BC
	movs r1, #3
	bl SpawnProc
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	str r0, [r5, #0x44]
	ldr r0, .L0804EDF4 @ =gUnk_08119ED2
	str r0, [r5, #0x48]
	ldr r0, .L0804EDF8 @ =gUnk_085D12D4
	str r0, [r5, #0x4c]
	ldr r0, .L0804EDFC @ =gUnk_085D12DC
	str r0, [r5, #0x50]
	ldr r0, .L0804EE00 @ =gUnk_0812C68C
	movs r1, #0x86
	lsls r1, r1, #5
	bl SpellFx_RegisterBgGfx
	bl SpellFx_SetSomeColorEffect
	ldr r0, .L0804EE04 @ =gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq .L0804EE12
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne .L0804EE08
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl SetBgOffset
	b .L0804EE12
	.align 2, 0
.L0804EDEC: .4byte gEfxBgSemaphore
.L0804EDF0: .4byte gUnk_085D12BC
.L0804EDF4: .4byte gUnk_08119ED2
.L0804EDF8: .4byte gUnk_085D12D4
.L0804EDFC: .4byte gUnk_085D12DC
.L0804EE00: .4byte gUnk_0812C68C
.L0804EE04: .4byte gEkrDistanceType
.L0804EE08:
	movs r0, #1
	movs r1, #0xe8
	movs r2, #0
	bl SetBgOffset
.L0804EE12:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start func_fe6_0804EE18
func_fe6_0804EE18: @ 0x0804EE18
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r4, r0, #0
	movs r6, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl EfxAdvanceFrameLut
	lsls r0, r0, #0x10
	asrs r5, r0, #0x10
	cmp r5, #0
	blt .L0804EE70
	ldr r1, [r4, #0x4c]
	ldr r3, [r4, #0x50]
	ldr r0, [r4, #0x5c]
	lsls r2, r5, #2
	adds r1, r2, r1
	ldr r1, [r1]
	adds r2, r2, r3
	ldr r2, [r2]
	bl SpellFx_WriteBgMap
	cmp r5, #0
	bne .L0804EE4E
	ldr r6, .L0804EE68 @ =0x0000011F
.L0804EE4E:
	cmp r5, #1
	bne .L0804EE56
	movs r6, #0xa8
	lsls r6, r6, #1
.L0804EE56:
	ldr r0, .L0804EE6C @ =gBg1Tm+0x3C
	str r6, [sp]
	movs r1, #2
	movs r2, #0x14
	movs r3, #1
	bl FillBGRect
	b .L0804EE8E
	.align 2, 0
.L0804EE68: .4byte 0x0000011F
.L0804EE6C: .4byte gBg1Tm+0x3C
.L0804EE70:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r5, r0
	bne .L0804EE8E
	bl SpellFx_ClearBG1
	ldr r1, .L0804EE98 @ =gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_ClearColorEffects
	adds r0, r4, #0
	bl Proc_Break
.L0804EE8E:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L0804EE98: .4byte gEfxBgSemaphore

	thumb_func_start func_fe6_0804EE9C
func_fe6_0804EE9C: @ 0x0804EE9C
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, .L0804EEC8 @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L0804EECC @ =gUnk_085D12E4
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, .L0804EED0 @ =gUnk_08119EDC
	str r1, [r0, #0x48]
	ldr r1, .L0804EED4 @ =gUnk_0812CF48
	str r1, [r0, #0x4c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0804EEC8: .4byte gEfxBgSemaphore
.L0804EECC: .4byte gUnk_085D12E4
.L0804EED0: .4byte gUnk_08119EDC
.L0804EED4: .4byte gUnk_0812CF48

	thumb_func_start func_fe6_0804EED8
func_fe6_0804EED8: @ 0x0804EED8
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
	blt .L0804EEFE
	ldr r0, [r4, #0x4c]
	lsls r1, r1, #5
	adds r0, r0, r1
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	b .L0804EF18
.L0804EEFE:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne .L0804EF18
	bl SpellFx_ClearColorEffects
	ldr r1, .L0804EF20 @ =gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
.L0804EF18:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0804EF20: .4byte gEfxBgSemaphore

	thumb_func_start func_fe6_0804EF24
func_fe6_0804EF24: @ 0x0804EF24
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, .L0804EF6C @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L0804EF70 @ =gUnk_085D1304
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	ldr r3, .L0804EF74 @ =gUnk_085E2508
	ldr r2, .L0804EF78 @ =gUnk_085E19DC
	str r2, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	bl EfxCreateFrontAnim
	str r0, [r4, #0x60]
	ldr r0, .L0804EF7C @ =gUnk_0812D80C
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, .L0804EF80 @ =gUnk_0812D374
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0804EF6C: .4byte gEfxBgSemaphore
.L0804EF70: .4byte gUnk_085D1304
.L0804EF74: .4byte gUnk_085E2508
.L0804EF78: .4byte gUnk_085E19DC
.L0804EF7C: .4byte gUnk_0812D80C
.L0804EF80: .4byte gUnk_0812D374

	thumb_func_start func_fe6_0804EF84
func_fe6_0804EF84: @ 0x0804EF84
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x32
	ble .L0804EFAA
	ldr r0, [r4, #0x60]
	bl BasRemove
	ldr r1, .L0804EFB0 @ =gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
.L0804EFAA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0804EFB0: .4byte gEfxBgSemaphore

	thumb_func_start func_fe6_0804EFB4
func_fe6_0804EFB4: @ 0x0804EFB4
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl func_fe6_08047300
	bl SpellFx_SetBG1Position
	ldr r0, .L0804EFF4 @ =gUnk_085D131C
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r1, #0
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r4, #0
	adds r0, #0x2a
	strb r1, [r0]
	adds r0, r5, #0
	bl GetAnimRoundTypeAnotherSide
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl CheckRoundMiss
	adds r4, #0x29
	strb r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0804EFF4: .4byte gUnk_085D131C

	thumb_func_start func_fe6_0804EFF8
func_fe6_0804EFF8: @ 0x0804EFF8
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl func_fe6_08047300
	bl SpellFx_SetBG1Position
	ldr r0, .L0804F038 @ =gUnk_085D131C
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r1, r4, #0
	adds r1, #0x2a
	movs r0, #1
	strb r0, [r1]
	adds r0, r5, #0
	bl GetAnimRoundTypeAnotherSide
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl CheckRoundMiss
	adds r4, #0x29
	strb r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0804F038: .4byte gUnk_085D131C

	thumb_func_start func_fe6_0804F03C
func_fe6_0804F03C: @ 0x0804F03C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetAnimAnotherSide
	adds r6, r0, #0
	ldr r0, .L0804F068 @ =gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne .L0804F06C
	movs r5, #0x20
	movs r7, #0x34
	movs r3, #0x36
	mov r8, r3
	movs r0, #0x55
	mov sb, r0
	b .L0804F078
	.align 2, 0
.L0804F068: .4byte gEkrDistanceType
.L0804F06C:
	movs r5, #0x28
	movs r7, #0x3c
	movs r1, #0x41
	mov r8, r1
	movs r3, #0x60
	mov sb, r3
.L0804F078:
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne .L0804F0A4
	ldr r0, [r4, #0x5c]
	bl func_fe6_0804F144
	ldr r0, [r4, #0x5c]
	bl func_fe6_0804F1FC
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r0, [r4, #0x5c]
	movs r3, #2
	ldrsh r2, [r0, r3]
	movs r0, #0xf1
	movs r3, #1
	bl func_fe6_0805C804
.L0804F0A4:
	movs r1, #0x2c
	ldrsh r0, [r4, r1]
	cmp r0, r5
	bne .L0804F0B8
	ldr r0, [r4, #0x5c]
	movs r1, #1
	rsbs r1, r1, #0
	bl NewEfxFarAttackWithDistance
	b .L0804F138
.L0804F0B8:
	cmp r0, r7
	bne .L0804F122
	movs r0, #9
	ldrh r3, [r6, #0x10]
	orrs r0, r3
	strh r0, [r6, #0x10]
	adds r5, r4, #0
	adds r5, #0x29
	ldrb r1, [r5]
	adds r0, r6, #0
	bl StartBattleAnimHitEffectsDefault
	ldrb r0, [r5]
	cmp r0, #0
	bne .L0804F138
	adds r0, r4, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	cmp r0, #0
	bne .L0804F0F8
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #2
	ldrsh r2, [r6, r0]
	movs r0, #0xf7
	movs r3, #1
	bl func_fe6_0805C804
	adds r0, r6, #0
	bl func_fe6_0804F2D0
	b .L0804F11A
.L0804F0F8:
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r6, r3]
	movs r0, #0xf8
	movs r3, #1
	bl func_fe6_0805C804
	adds r0, r6, #0
	bl func_fe6_0804F3B8
	adds r0, r6, #0
	bl func_fe6_0804F484
	adds r0, r6, #0
	bl func_fe6_0804F510
.L0804F11A:
	adds r0, r6, #0
	bl func_fe6_0805C358
	b .L0804F138
.L0804F122:
	cmp r0, r8
	beq .L0804F138
	cmp r0, sb
	bne .L0804F138
	bl SpellFx_Finish
	bl func_fe6_08047358
	adds r0, r4, #0
	bl Proc_Break
.L0804F138:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start func_fe6_0804F144
func_fe6_0804F144: @ 0x0804F144
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, .L0804F188 @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L0804F18C @ =gUnk_085D1334
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, .L0804F190 @ =gUnk_08119F1E
	str r1, [r0, #0x48]
	ldr r1, .L0804F194 @ =gUnk_085D134C
	str r1, [r0, #0x4c]
	ldr r1, .L0804F198 @ =gUnk_085D137C
	str r1, [r0, #0x50]
	ldr r0, .L0804F19C @ =gUnk_0812E4A4
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	ldr r0, .L0804F1A0 @ =gUnk_0812D8AC
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	bl SpellFx_SetSomeColorEffect
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0804F188: .4byte gEfxBgSemaphore
.L0804F18C: .4byte gUnk_085D1334
.L0804F190: .4byte gUnk_08119F1E
.L0804F194: .4byte gUnk_085D134C
.L0804F198: .4byte gUnk_085D137C
.L0804F19C: .4byte gUnk_0812E4A4
.L0804F1A0: .4byte gUnk_0812D8AC

	thumb_func_start func_fe6_0804F1A4
func_fe6_0804F1A4: @ 0x0804F1A4
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
	blt .L0804F1D2
	ldr r1, [r4, #0x4c]
	ldr r3, [r4, #0x50]
	ldr r0, [r4, #0x5c]
	lsls r2, r2, #2
	adds r1, r2, r1
	ldr r1, [r1]
	adds r2, r2, r3
	ldr r2, [r2]
	bl SpellFx_WriteBgMap
	b .L0804F1F0
.L0804F1D2:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r2, r0
	bne .L0804F1F0
	bl SpellFx_ClearBG1
	ldr r1, .L0804F1F8 @ =gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_ClearColorEffects
	adds r0, r4, #0
	bl Proc_Break
.L0804F1F0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0804F1F8: .4byte gEfxBgSemaphore

	thumb_func_start func_fe6_0804F1FC
func_fe6_0804F1FC: @ 0x0804F1FC
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	ldr r1, .L0804F240 @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L0804F244 @ =gUnk_085D13AC
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r6, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	ldr r1, .L0804F248 @ =gUnk_085E2CA8
	ldr r2, .L0804F24C @ =gUnk_085E2920
	ldr r3, .L0804F250 @ =gUnk_085E2CD4
	ldr r0, .L0804F254 @ =gUnk_085E294C
	str r0, [sp]
	adds r0, r6, #0
	bl EfxCreateFrontAnim
	adds r5, r0, #0
	str r5, [r4, #0x60]
	adds r0, r6, #0
	bl GetAnimPosition
	cmp r0, #0
	bne .L0804F258
	ldrh r0, [r6, #2]
	subs r0, #8
	b .L0804F25C
	.align 2, 0
.L0804F240: .4byte gEfxBgSemaphore
.L0804F244: .4byte gUnk_085D13AC
.L0804F248: .4byte gUnk_085E2CA8
.L0804F24C: .4byte gUnk_085E2920
.L0804F250: .4byte gUnk_085E2CD4
.L0804F254: .4byte gUnk_085E294C
.L0804F258:
	ldrh r0, [r6, #2]
	adds r0, #8
.L0804F25C:
	strh r0, [r5, #2]
	ldrh r0, [r6, #4]
	adds r0, #8
	strh r0, [r5, #4]
	ldr r0, .L0804F280 @ =gUnk_0812FFD8
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, .L0804F284 @ =gUnk_0812F9DC
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L0804F280: .4byte gUnk_0812FFD8
.L0804F284: .4byte gUnk_0812F9DC

	thumb_func_start func_fe6_0804F288
func_fe6_0804F288: @ 0x0804F288
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x25
	bne .L0804F2AE
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r0, [r4, #0x5c]
	movs r3, #2
	ldrsh r2, [r0, r3]
	movs r0, #0xf2
	movs r3, #1
	bl func_fe6_0805C804
	b .L0804F2C6
.L0804F2AE:
	cmp r0, #0x32
	ble .L0804F2C6
	ldr r0, [r4, #0x60]
	bl BasRemove
	ldr r1, .L0804F2CC @ =gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
.L0804F2C6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0804F2CC: .4byte gEfxBgSemaphore

	thumb_func_start func_fe6_0804F2D0
func_fe6_0804F2D0: @ 0x0804F2D0
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, .L0804F328 @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L0804F32C @ =gUnk_085D13C4
	movs r1, #3
	bl SpawnProc
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	str r0, [r5, #0x44]
	ldr r0, .L0804F330 @ =gUnk_08119F50
	str r0, [r5, #0x48]
	ldr r0, .L0804F334 @ =gUnk_085D1430
	str r0, [r5, #0x4c]
	str r0, [r5, #0x50]
	ldr r0, .L0804F338 @ =gUnk_085D13DC
	str r0, [r5, #0x54]
	ldr r0, .L0804F33C @ =gUnk_08138BF0
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	bl SpellFx_SetSomeColorEffect
	ldr r0, .L0804F340 @ =gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq .L0804F34E
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne .L0804F344
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl SetBgOffset
	b .L0804F34E
	.align 2, 0
.L0804F328: .4byte gEfxBgSemaphore
.L0804F32C: .4byte gUnk_085D13C4
.L0804F330: .4byte gUnk_08119F50
.L0804F334: .4byte gUnk_085D1430
.L0804F338: .4byte gUnk_085D13DC
.L0804F33C: .4byte gUnk_08138BF0
.L0804F340: .4byte gEkrDistanceType
.L0804F344:
	movs r0, #1
	movs r1, #0xe8
	movs r2, #0
	bl SetBgOffset
.L0804F34E:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start func_fe6_0804F354
func_fe6_0804F354: @ 0x0804F354
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r0, #0x2c
	adds r1, r7, #0
	adds r1, #0x44
	ldr r2, [r7, #0x48]
	bl EfxAdvanceFrameLut
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	cmp r4, #0
	blt .L0804F390
	ldr r5, [r7, #0x4c]
	ldr r6, [r7, #0x50]
	ldr r0, [r7, #0x54]
	lsls r4, r4, #2
	adds r0, r4, r0
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	ldr r0, [r7, #0x5c]
	adds r5, r4, r5
	ldr r1, [r5]
	adds r4, r4, r6
	ldr r2, [r4]
	bl SpellFx_WriteBgMap
	b .L0804F3AE
.L0804F390:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r4, r0
	bne .L0804F3AE
	bl SpellFx_ClearBG1
	ldr r1, .L0804F3B4 @ =gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_ClearColorEffects
	adds r0, r7, #0
	bl Proc_End
.L0804F3AE:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0804F3B4: .4byte gEfxBgSemaphore

	thumb_func_start func_fe6_0804F3B8
func_fe6_0804F3B8: @ 0x0804F3B8
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r1, .L0804F414 @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L0804F418 @ =gUnk_085D1484
	movs r1, #3
	bl SpawnProc
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	ldr r0, .L0804F41C @ =gUnk_0813A6F8
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	ldr r0, [r5, #0x5c]
	ldr r2, .L0804F420 @ =gUnk_0813B8B4
	adds r1, r2, #0
	bl SpellFx_WriteBgMap
	bl SpellFx_SetBG1Position
	bl SpellFx_SetSomeColorEffect
	ldr r0, .L0804F424 @ =gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq .L0804F444
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne .L0804F428
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl SetBgOffset
	b .L0804F432
	.align 2, 0
.L0804F414: .4byte gEfxBgSemaphore
.L0804F418: .4byte gUnk_085D1484
.L0804F41C: .4byte gUnk_0813A6F8
.L0804F420: .4byte gUnk_0813B8B4
.L0804F424: .4byte gEkrDistanceType
.L0804F428:
	movs r0, #1
	movs r1, #0xe8
	movs r2, #0
	bl SetBgOffset
.L0804F432:
	ldr r0, .L0804F44C @ =gBg1Tm+0x3C
	movs r1, #0x80
	lsls r1, r1, #1
	str r1, [sp]
	movs r1, #2
	movs r2, #0x14
	movs r3, #1
	bl func_fe6_0805B0D4
.L0804F444:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0804F44C: .4byte gBg1Tm+0x3C

	thumb_func_start func_fe6_0804F450
func_fe6_0804F450: @ 0x0804F450
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x28
	bne .L0804F478
	bl SpellFx_ClearBG1
	bl SpellFx_ClearColorEffects
	ldr r1, .L0804F480 @ =gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
.L0804F478:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0804F480: .4byte gEfxBgSemaphore

	thumb_func_start func_fe6_0804F484
func_fe6_0804F484: @ 0x0804F484
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, .L0804F4B8 @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L0804F4BC @ =gUnk_085D149C
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, .L0804F4C0 @ =gUnk_08119FA6
	str r1, [r0, #0x48]
	ldr r1, .L0804F4C4 @ =gUnk_0813B6B4
	str r1, [r0, #0x4c]
	adds r0, r1, #0
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0804F4B8: .4byte gEfxBgSemaphore
.L0804F4BC: .4byte gUnk_085D149C
.L0804F4C0: .4byte gUnk_08119FA6
.L0804F4C4: .4byte gUnk_0813B6B4

	thumb_func_start func_fe6_0804F4C8
func_fe6_0804F4C8: @ 0x0804F4C8
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
	blt .L0804F4EE
	ldr r0, [r4, #0x4c]
	lsls r1, r1, #5
	adds r0, r0, r1
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	b .L0804F504
.L0804F4EE:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne .L0804F504
	ldr r1, .L0804F50C @ =gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
.L0804F504:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0804F50C: .4byte gEfxBgSemaphore

	thumb_func_start func_fe6_0804F510
func_fe6_0804F510: @ 0x0804F510
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, .L0804F550 @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L0804F554 @ =gUnk_085D14BC
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	ldr r3, .L0804F558 @ =gUnk_085E48C4
	ldr r2, .L0804F55C @ =gUnk_085E3AA4
	str r2, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	bl EfxCreateFrontAnim
	adds r6, r0, #0
	str r6, [r4, #0x60]
	adds r0, r5, #0
	bl GetAnimPosition
	cmp r0, #0
	bne .L0804F560
	ldrh r0, [r6, #2]
	subs r0, #8
	b .L0804F564
	.align 2, 0
.L0804F550: .4byte gEfxBgSemaphore
.L0804F554: .4byte gUnk_085D14BC
.L0804F558: .4byte gUnk_085E48C4
.L0804F55C: .4byte gUnk_085E3AA4
.L0804F560:
	ldrh r0, [r6, #2]
	adds r0, #8
.L0804F564:
	strh r0, [r6, #2]
	ldr r0, [r6, #0x1c]
	movs r1, #0x80
	lsls r1, r1, #3
	orrs r0, r1
	str r0, [r6, #0x1c]
	ldr r0, .L0804F58C @ =gUnk_0813BD74
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, .L0804F590 @ =gUnk_0813BAFC
	movs r1, #0x80
	lsls r1, r1, #4
	bl SpellFx_RegisterObjGfx
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L0804F58C: .4byte gUnk_0813BD74
.L0804F590: .4byte gUnk_0813BAFC

	thumb_func_start func_fe6_0804F594
func_fe6_0804F594: @ 0x0804F594
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x28
	ble .L0804F5BA
	ldr r0, [r4, #0x60]
	bl BasRemove
	ldr r1, .L0804F5C0 @ =gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
.L0804F5BA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0804F5C0: .4byte gEfxBgSemaphore

	thumb_func_start func_fe6_0804F5C4
func_fe6_0804F5C4: @ 0x0804F5C4
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl func_fe6_08047300
	bl SpellFx_SetBG1Position
	ldr r0, .L0804F5FC @ =gUnk_085D14D4
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r5, #0
	bl GetAnimRoundTypeAnotherSide
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl CheckRoundMiss
	adds r4, #0x29
	strb r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0804F5FC: .4byte gUnk_085D14D4

	thumb_func_start func_fe6_0804F600
func_fe6_0804F600: @ 0x0804F600
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetAnimAnotherSide
	adds r5, r0, #0
	bl EfxGetCamMovDuration
	adds r6, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	movs r1, #0
	mov r8, r1
	movs r7, #0
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne .L0804F636
	ldr r0, [r4, #0x5c]
	movs r1, #1
	rsbs r1, r1, #0
	bl NewEfxFarAttackWithDistance
.L0804F636:
	movs r2, #0x2c
	ldrsh r1, [r4, r2]
	adds r0, r6, #1
	cmp r1, r0
	bne .L0804F692
	adds r0, r5, #0
	bl func_fe6_0804F738
	adds r0, r5, #0
	bl func_fe6_0804F99C
	ldr r3, .L0804F6A8 @ =gDispIo
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
	mov r2, r8
	strb r2, [r0]
	adds r0, #1
	movs r1, #0x10
	strb r1, [r0]
	adds r0, #1
	strb r2, [r0]
	str r1, [sp]
	str r7, [sp, #4]
	adds r0, r5, #0
	movs r1, #0
	movs r2, #0x10
	movs r3, #0
	bl func_fe6_0804CD88
	movs r0, #0x91
	lsls r0, r0, #1
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
	movs r3, #1
	bl func_fe6_0805C804
.L0804F692:
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	adds r0, r6, #0
	adds r0, #0x52
	cmp r1, r0
	bne .L0804F6AC
	ldr r0, [r4, #0x5c]
	movs r1, #4
	bl NewEfxFlashBgWhite
	b .L0804F72C
	.align 2, 0
.L0804F6A8: .4byte gDispIo
.L0804F6AC:
	adds r0, r6, #0
	adds r0, #0x55
	cmp r1, r0
	bne .L0804F6E8
	adds r0, r5, #0
	bl func_fe6_0804F820
	adds r0, r5, #0
	bl func_fe6_0804F908
	str r7, [sp]
	str r7, [sp, #4]
	adds r0, r5, #0
	movs r1, #0x18
	movs r2, #0x10
	movs r3, #0x10
	bl func_fe6_0804CD88
	ldr r0, .L0804F6E4 @ =0x00000123
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
	movs r3, #1
	bl func_fe6_0805C804
	b .L0804F72C
	.align 2, 0
.L0804F6E4: .4byte 0x00000123
.L0804F6E8:
	adds r0, r6, #0
	adds r0, #0x58
	cmp r1, r0
	bne .L0804F710
	movs r0, #9
	ldrh r1, [r5, #0x10]
	orrs r0, r1
	strh r0, [r5, #0x10]
	adds r4, #0x29
	ldrb r1, [r4]
	adds r0, r5, #0
	bl StartBattleAnimHitEffectsDefault
	ldrb r0, [r4]
	cmp r0, #0
	bne .L0804F72C
	adds r0, r5, #0
	bl func_fe6_0805C358
	b .L0804F72C
.L0804F710:
	adds r0, r6, #0
	adds r0, #0x88
	cmp r1, r0
	beq .L0804F72C
	adds r0, #0x19
	cmp r1, r0
	bne .L0804F72C
	bl SpellFx_Finish
	bl func_fe6_08047358
	adds r0, r4, #0
	bl Proc_Break
.L0804F72C:
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start func_fe6_0804F738
func_fe6_0804F738: @ 0x0804F738
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, .L0804F78C @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L0804F790 @ =gUnk_085D14EC
	movs r1, #3
	bl SpawnProc
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	str r0, [r5, #0x44]
	ldr r0, .L0804F794 @ =gUnk_08119FFC
	str r0, [r5, #0x48]
	ldr r0, .L0804F798 @ =gUnk_085D1504
	str r0, [r5, #0x4c]
	str r0, [r5, #0x50]
	ldr r0, .L0804F79C @ =gUnk_085D151C
	str r0, [r5, #0x54]
	ldr r0, .L0804F7A0 @ =gUnk_081521C0
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	ldr r0, .L0804F7A4 @ =gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq .L0804F7B2
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne .L0804F7A8
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl SetBgOffset
	b .L0804F7B2
	.align 2, 0
.L0804F78C: .4byte gEfxBgSemaphore
.L0804F790: .4byte gUnk_085D14EC
.L0804F794: .4byte gUnk_08119FFC
.L0804F798: .4byte gUnk_085D1504
.L0804F79C: .4byte gUnk_085D151C
.L0804F7A0: .4byte gUnk_081521C0
.L0804F7A4: .4byte gEkrDistanceType
.L0804F7A8:
	movs r0, #1
	movs r1, #0xe8
	movs r2, #0
	bl SetBgOffset
.L0804F7B2:
	bl SpellFx_SetSomeColorEffect
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start func_fe6_0804F7BC
func_fe6_0804F7BC: @ 0x0804F7BC
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl EfxAdvanceFrameLut
	lsls r0, r0, #0x10
	asrs r3, r0, #0x10
	cmp r3, #0
	blt .L0804F7F8
	ldr r1, [r4, #0x4c]
	ldr r2, [r4, #0x50]
	ldr r5, [r4, #0x54]
	ldr r0, [r4, #0x5c]
	lsls r4, r3, #2
	adds r1, r4, r1
	ldr r1, [r1]
	adds r2, r4, r2
	ldr r2, [r2]
	bl SpellFx_WriteBgMap
	adds r4, r4, r5
	ldr r0, [r4]
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	b .L0804F816
.L0804F7F8:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r3, r0
	bne .L0804F816
	bl SpellFx_ClearBG1
	ldr r1, .L0804F81C @ =gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_ClearColorEffects
	adds r0, r4, #0
	bl Proc_Break
.L0804F816:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0804F81C: .4byte gEfxBgSemaphore

	thumb_func_start func_fe6_0804F820
func_fe6_0804F820: @ 0x0804F820
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, .L0804F874 @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L0804F878 @ =gUnk_085D1534
	movs r1, #3
	bl SpawnProc
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	str r0, [r5, #0x44]
	ldr r0, .L0804F87C @ =gUnk_0811A06A
	str r0, [r5, #0x48]
	ldr r0, .L0804F880 @ =gUnk_085D154C
	str r0, [r5, #0x4c]
	str r0, [r5, #0x50]
	ldr r0, .L0804F884 @ =gUnk_085D1578
	str r0, [r5, #0x54]
	ldr r0, .L0804F888 @ =gUnk_0814A498
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	ldr r0, .L0804F88C @ =gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq .L0804F89A
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne .L0804F890
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl SetBgOffset
	b .L0804F89A
	.align 2, 0
.L0804F874: .4byte gEfxBgSemaphore
.L0804F878: .4byte gUnk_085D1534
.L0804F87C: .4byte gUnk_0811A06A
.L0804F880: .4byte gUnk_085D154C
.L0804F884: .4byte gUnk_085D1578
.L0804F888: .4byte gUnk_0814A498
.L0804F88C: .4byte gEkrDistanceType
.L0804F890:
	movs r0, #1
	movs r1, #0xe8
	movs r2, #0
	bl SetBgOffset
.L0804F89A:
	bl SpellFx_SetSomeColorEffect
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start func_fe6_0804F8A4
func_fe6_0804F8A4: @ 0x0804F8A4
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl EfxAdvanceFrameLut
	lsls r0, r0, #0x10
	asrs r3, r0, #0x10
	cmp r3, #0
	blt .L0804F8E0
	ldr r1, [r4, #0x4c]
	ldr r2, [r4, #0x50]
	ldr r5, [r4, #0x54]
	ldr r0, [r4, #0x5c]
	lsls r4, r3, #2
	adds r1, r4, r1
	ldr r1, [r1]
	adds r2, r4, r2
	ldr r2, [r2]
	bl SpellFx_WriteBgMap
	adds r4, r4, r5
	ldr r0, [r4]
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	b .L0804F8FE
.L0804F8E0:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r3, r0
	bne .L0804F8FE
	bl SpellFx_ClearBG1
	ldr r1, .L0804F904 @ =gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_ClearColorEffects
	adds r0, r4, #0
	bl Proc_Break
.L0804F8FE:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0804F904: .4byte gEfxBgSemaphore

	thumb_func_start func_fe6_0804F908
func_fe6_0804F908: @ 0x0804F908
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, .L0804F958 @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L0804F95C @ =gUnk_085D15A4
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	ldr r3, .L0804F960 @ =gUnk_085E79F8
	str r3, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl EfxCreateFrontAnim
	str r0, [r4, #0x60]
	ldrh r1, [r0, #2]
	adds r1, #0x18
	strh r1, [r0, #2]
	ldr r0, .L0804F964 @ =gUnk_081AC0F4
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, .L0804F968 @ =gUnk_08152E78
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0804F958: .4byte gEfxBgSemaphore
.L0804F95C: .4byte gUnk_085D15A4
.L0804F960: .4byte gUnk_085E79F8
.L0804F964: .4byte gUnk_081AC0F4
.L0804F968: .4byte gUnk_08152E78

	thumb_func_start func_fe6_0804F96C
func_fe6_0804F96C: @ 0x0804F96C
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x33
	ble .L0804F992
	ldr r0, [r4, #0x60]
	bl BasRemove
	ldr r1, .L0804F998 @ =gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
.L0804F992:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0804F998: .4byte gEfxBgSemaphore

	thumb_func_start func_fe6_0804F99C
func_fe6_0804F99C: @ 0x0804F99C
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, .L0804F9D8 @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L0804F9DC @ =gUnk_085D15BC
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r2, #0
	strh r2, [r0, #0x2c]
	strh r2, [r0, #0x2e]
	movs r1, #1
	str r1, [r0, #0x44]
	str r2, [r0, #0x48]
	ldr r0, .L0804F9E0 @ =gUnk_081AC0F4
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, .L0804F9E4 @ =gUnk_08152E78
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0804F9D8: .4byte gEfxBgSemaphore
.L0804F9DC: .4byte gUnk_085D15BC
.L0804F9E0: .4byte gUnk_081AC0F4
.L0804F9E4: .4byte gUnk_08152E78

	thumb_func_start func_fe6_0804F9E8
func_fe6_0804F9E8: @ 0x0804F9E8
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r4, #0
.L0804F9EE:
	ldr r0, [r5, #0x5c]
	adds r1, r4, #0
	bl func_fe6_0804FA14
	adds r4, #1
	cmp r4, #0x1f
	ble .L0804F9EE
	ldr r1, .L0804FA10 @ =gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r5, #0
	bl Proc_Break
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0804FA10: .4byte gEfxBgSemaphore

	thumb_func_start func_fe6_0804FA14
func_fe6_0804FA14: @ 0x0804FA14
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	adds r6, r0, #0
	mov r8, r1
	mov r4, sp
	mov r0, sp
	movs r1, #0
	movs r2, #8
	bl memset
	movs r5, #0
	movs r0, #1
	strb r0, [r4, #6]
	strb r0, [r4, #7]
	ldr r1, .L0804FAA4 @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L0804FAA8 @ =gUnk_085D15D4
	movs r1, #3
	bl SpawnProc
	adds r7, r0, #0
	str r6, [r7, #0x5c]
	strh r5, [r7, #0x2c]
	movs r0, #0x64
	strh r0, [r7, #0x2e]
	movs r0, #7
	mov r1, r8
	ands r0, r1
	mov r2, sp
	adds r4, r2, r0
	ldrb r0, [r4]
	adds r1, r7, #0
	adds r1, #0x29
	strb r0, [r1]
	ldr r0, .L0804FAAC @ =gUnk_085E7A64
	movs r1, #0x78
	bl BasCreate
	str r0, [r7, #0x60]
	movs r1, #0xa1
	lsls r1, r1, #6
	strh r1, [r0, #8]
	movs r1, #0x80
	lsls r1, r1, #1
	strh r1, [r0, #2]
	strh r1, [r0, #4]
	ldr r5, .L0804FAB0 @ =0x0000FFFF
	adds r0, r5, #0
	bl func_fe6_0805B9C8
	strh r0, [r7, #0x32]
	adds r0, r5, #0
	bl func_fe6_0805B9C8
	strh r0, [r7, #0x3a]
	ldrb r0, [r4]
	cmp r0, #0
	bne .L0804FAB8
	adds r0, r5, #0
	bl func_fe6_0805B9C8
	ldr r2, .L0804FAB4 @ =0x000001FF
	adds r1, r2, #0
	ands r0, r1
	movs r1, #0xe0
	lsls r1, r1, #3
	b .L0804FACA
	.align 2, 0
.L0804FAA4: .4byte gEfxBgSemaphore
.L0804FAA8: .4byte gUnk_085D15D4
.L0804FAAC: .4byte gUnk_085E7A64
.L0804FAB0: .4byte 0x0000FFFF
.L0804FAB4: .4byte 0x000001FF
.L0804FAB8:
	adds r0, r5, #0
	bl func_fe6_0805B9C8
	ldr r2, .L0804FB14 @ =0x000001FF
	adds r1, r2, #0
	ands r0, r1
	movs r2, #0xa0
	lsls r2, r2, #4
	adds r1, r2, #0
.L0804FACA:
	adds r0, r0, r1
	strh r0, [r7, #0x34]
	ldr r4, .L0804FB18 @ =0x0000FF0F
	adds r0, r4, #0
	bl func_fe6_0805B9C8
	ldr r2, .L0804FB1C @ =0x000003FF
	adds r1, r2, #0
	ands r0, r1
	ldr r1, .L0804FB20 @ =0xFFFFFF00
	adds r0, r0, r1
	strh r0, [r7, #0x3c]
	adds r0, r4, #0
	bl func_fe6_0805B9C8
	strh r0, [r7, #0x36]
	adds r0, r4, #0
	bl func_fe6_0805B9C8
	strh r0, [r7, #0x3e]
	movs r0, #7
	mov r2, r8
	ands r0, r2
	add r0, sp
	ldrb r0, [r0]
	cmp r0, #0
	bne .L0804FB24
	adds r0, r4, #0
	bl func_fe6_0805B9C8
	ldr r2, .L0804FB14 @ =0x000001FF
	adds r1, r2, #0
	ands r0, r1
	movs r1, #0xe0
	lsls r1, r1, #3
	b .L0804FB36
	.align 2, 0
.L0804FB14: .4byte 0x000001FF
.L0804FB18: .4byte 0x0000FF0F
.L0804FB1C: .4byte 0x000003FF
.L0804FB20: .4byte 0xFFFFFF00
.L0804FB24:
	adds r0, r4, #0
	bl func_fe6_0805B9C8
	ldr r2, .L0804FB5C @ =0x000001FF
	adds r1, r2, #0
	ands r0, r1
	movs r2, #0xa0
	lsls r2, r2, #4
	adds r1, r2, #0
.L0804FB36:
	adds r0, r0, r1
	strh r0, [r7, #0x38]
	ldr r0, .L0804FB60 @ =0x0000FF0F
	bl func_fe6_0805B9C8
	ldr r2, .L0804FB64 @ =0x000003FF
	adds r1, r2, #0
	ands r0, r1
	ldr r1, .L0804FB68 @ =0xFFFFFF00
	adds r0, r0, r1
	adds r1, r7, #0
	adds r1, #0x40
	strh r0, [r1]
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0804FB5C: .4byte 0x000001FF
.L0804FB60: .4byte 0x0000FF0F
.L0804FB64: .4byte 0x000003FF
.L0804FB68: .4byte 0xFFFFFF00

	thumb_func_start func_fe6_0804FB6C
func_fe6_0804FB6C: @ 0x0804FB6C
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r3, [r4, #0x60]
	ldrh r2, [r4, #0x2c]
	adds r2, #1
	strh r2, [r4, #0x2c]
	lsls r1, r2, #0x10
	ldrh r5, [r4, #0x2e]
	lsls r0, r5, #0x10
	cmp r1, r0
	ble .L0804FB9C
	ldr r1, .L0804FB98 @ =gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r3, #0
	bl BasRemove
	adds r0, r4, #0
	bl Proc_Break
	b .L0804FC1C
	.align 2, 0
.L0804FB98: .4byte gEfxBgSemaphore
.L0804FB9C:
	movs r0, #1
	ands r2, r0
	cmp r2, #0
	bne .L0804FBE0
	adds r0, r4, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #0
	bne .L0804FBB8
	ldr r0, .L0804FBB4 @ =gUnk_085E7AC4
	b .L0804FBBA
	.align 2, 0
.L0804FBB4: .4byte gUnk_085E7AC4
.L0804FBB8:
	ldr r0, .L0804FBDC @ =gUnk_085E7ACC
.L0804FBBA:
	str r0, [r3, #0x24]
	str r0, [r3, #0x20]
	movs r0, #0
	strh r0, [r3, #6]
	ldrh r1, [r4, #0x32]
	ldrh r2, [r4, #0x34]
	adds r0, r1, r2
	strh r0, [r4, #0x32]
	ldrh r5, [r4, #0x3a]
	ldrh r2, [r4, #0x3c]
	adds r1, r5, r2
	strh r1, [r4, #0x3a]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x18
	strh r0, [r3, #2]
	ldrh r4, [r4, #0x3a]
	b .L0804FC18
	.align 2, 0
.L0804FBDC: .4byte gUnk_085E7ACC
.L0804FBE0:
	adds r0, r4, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #0
	bne .L0804FBF4
	ldr r0, .L0804FBF0 @ =gUnk_085E7AC4
	b .L0804FBF6
	.align 2, 0
.L0804FBF0: .4byte gUnk_085E7AC4
.L0804FBF4:
	ldr r0, .L0804FC24 @ =gUnk_085E7ACC
.L0804FBF6:
	str r0, [r3, #0x24]
	str r0, [r3, #0x20]
	movs r0, #0
	strh r0, [r3, #6]
	ldrh r5, [r4, #0x3e]
	ldrh r1, [r4, #0x38]
	adds r0, r5, r1
	strh r0, [r4, #0x3e]
	adds r1, r4, #0
	adds r1, #0x40
	ldrh r1, [r1]
	adds r0, r1, r0
	strh r0, [r4, #0x3e]
	ldrh r2, [r4, #0x36]
	lsrs r0, r2, #8
	strh r0, [r3, #2]
	ldrh r4, [r4, #0x3e]
.L0804FC18:
	lsrs r0, r4, #8
	strh r0, [r3, #4]
.L0804FC1C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0804FC24: .4byte gUnk_085E7ACC

	thumb_func_start func_fe6_0804FC28
func_fe6_0804FC28: @ 0x0804FC28
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl func_fe6_08047300
	bl SpellFx_SetBG1Position
	ldr r0, .L0804FC60 @ =gUnk_085D15EC
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r5, #0
	bl GetAnimRoundTypeAnotherSide
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl CheckRoundMiss
	adds r4, #0x29
	strb r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0804FC60: .4byte gUnk_085D15EC

	thumb_func_start func_fe6_0804FC64
func_fe6_0804FC64: @ 0x0804FC64
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetAnimAnotherSide
	adds r5, r0, #0
	bl EfxGetCamMovDuration
	adds r6, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne .L0804FC8E
	ldr r0, [r4, #0x5c]
	movs r1, #1
	rsbs r1, r1, #0
	bl NewEfxFarAttackWithDistance
.L0804FC8E:
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	adds r0, r6, #1
	cmp r1, r0
	bne .L0804FCB4
	ldr r0, .L0804FCFC @ =0x00000119
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
	movs r3, #1
	bl func_fe6_0805C804
	adds r0, r5, #0
	bl func_fe6_0804FD24
	adds r0, r5, #0
	bl func_fe6_0804FE60
.L0804FCB4:
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	adds r0, r6, #0
	adds r0, #0x59
	cmp r1, r0
	bne .L0804FCCA
	adds r0, r5, #0
	movs r1, #2
	movs r2, #3
	bl func_fe6_0804FF94
.L0804FCCA:
	movs r3, #0x2c
	ldrsh r1, [r4, r3]
	adds r0, r6, #0
	adds r0, #0x5e
	cmp r1, r0
	bne .L0804FD00
	adds r0, r5, #0
	bl func_fe6_0804FDD4
	movs r0, #9
	ldrh r1, [r5, #0x10]
	orrs r0, r1
	strh r0, [r5, #0x10]
	adds r4, #0x29
	ldrb r1, [r4]
	adds r0, r5, #0
	bl StartBattleAnimHitEffectsDefault
	ldrb r0, [r4]
	cmp r0, #0
	bne .L0804FD1C
	adds r0, r5, #0
	bl func_fe6_0805C358
	b .L0804FD1C
	.align 2, 0
.L0804FCFC: .4byte 0x00000119
.L0804FD00:
	adds r0, r6, #0
	adds r0, #0xc3
	cmp r1, r0
	beq .L0804FD1C
	adds r0, #5
	cmp r1, r0
	bne .L0804FD1C
	bl SpellFx_Finish
	bl func_fe6_08047358
	adds r0, r4, #0
	bl Proc_Break
.L0804FD1C:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_fe6_0804FD24
func_fe6_0804FD24: @ 0x0804FD24
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, .L0804FD60 @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L0804FD64 @ =gUnk_085D1604
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, .L0804FD68 @ =gUnk_0811A098
	str r1, [r0, #0x48]
	ldr r1, .L0804FD6C @ =gUnk_085D1648
	str r1, [r0, #0x4c]
	str r1, [r0, #0x50]
	ldr r1, .L0804FD70 @ =gUnk_085D161C
	str r1, [r0, #0x54]
	ldr r0, .L0804FD74 @ =gUnk_0813E75C
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	bl SpellFx_SetSomeColorEffect
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0804FD60: .4byte gEfxBgSemaphore
.L0804FD64: .4byte gUnk_085D1604
.L0804FD68: .4byte gUnk_0811A098
.L0804FD6C: .4byte gUnk_085D1648
.L0804FD70: .4byte gUnk_085D161C
.L0804FD74: .4byte gUnk_0813E75C

	thumb_func_start func_fe6_0804FD78
func_fe6_0804FD78: @ 0x0804FD78
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r0, #0x2c
	adds r1, r7, #0
	adds r1, #0x44
	ldr r2, [r7, #0x48]
	bl EfxAdvanceFrameLut
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	cmp r4, #0
	blt .L0804FDB4
	ldr r5, [r7, #0x4c]
	ldr r6, [r7, #0x50]
	ldr r0, [r7, #0x54]
	lsls r4, r4, #2
	adds r0, r4, r0
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	ldr r0, [r7, #0x5c]
	adds r5, r4, r5
	ldr r1, [r5]
	adds r4, r4, r6
	ldr r2, [r4]
	bl SpellFx_WriteBgMap
	b .L0804FDCA
.L0804FDB4:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r4, r0
	bne .L0804FDCA
	ldr r1, .L0804FDD0 @ =gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r7, #0
	bl Proc_End
.L0804FDCA:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0804FDD0: .4byte gEfxBgSemaphore

	thumb_func_start func_fe6_0804FDD4
func_fe6_0804FDD4: @ 0x0804FDD4
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, .L0804FDF0 @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L0804FDF4 @ =gUnk_085D1674
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0804FDF0: .4byte gEfxBgSemaphore
.L0804FDF4: .4byte gUnk_085D1674

	thumb_func_start func_fe6_0804FDF8
func_fe6_0804FDF8: @ 0x0804FDF8
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	ldr r3, .L0804FE30 @ =gUnk_085E5858
	str r3, [sp]
	adds r1, r3, #0
	adds r2, r3, #0
	bl EfxCreateFrontAnim
	str r0, [r4, #0x60]
	ldr r0, .L0804FE34 @ =gUnk_0812D80C
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, .L0804FE38 @ =gUnk_0812D374
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	adds r0, r4, #0
	bl Proc_Break
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0804FE30: .4byte gUnk_085E5858
.L0804FE34: .4byte gUnk_0812D80C
.L0804FE38: .4byte gUnk_0812D374

	thumb_func_start func_fe6_0804FE3C
func_fe6_0804FE3C: @ 0x0804FE3C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x60]
	bl BasRemove
	ldr r1, .L0804FE5C @ =gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0804FE5C: .4byte gEfxBgSemaphore

	thumb_func_start func_fe6_0804FE60
func_fe6_0804FE60: @ 0x0804FE60
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, .L0804FE7C @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L0804FE80 @ =gUnk_085D169C
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0804FE7C: .4byte gEfxBgSemaphore
.L0804FE80: .4byte gUnk_085D169C

	thumb_func_start func_fe6_0804FE84
func_fe6_0804FE84: @ 0x0804FE84
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x8d
	lsls r0, r0, #1
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r2, [r4, #0x5c]
	movs r3, #2
	ldrsh r2, [r2, r3]
	movs r3, #1
	bl func_fe6_0805C804
	ldr r0, [r4, #0x5c]
	movs r1, #0x26
	bl NewEfxFlashBgWhite
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #5
	strh r0, [r4, #0x2e]
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start func_fe6_0804FEB8
func_fe6_0804FEB8: @ 0x0804FEB8
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	movs r0, #0x2c
	ldrsh r3, [r6, r0]
	movs r1, #0x2e
	ldrsh r0, [r6, r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #0x10
	movs r2, #0
	bl Interpolate
	adds r5, r0, #0
	ldr r0, .L0804FF14 @ =gPal
	ldr r4, .L0804FF18 @ =gEfxPal
	movs r2, #0x80
	lsls r2, r2, #1
	adds r1, r4, #0
	bl CpuFastSet
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0x20
	adds r3, r5, #0
	bl EfxPalWhiteInOut
	ldrh r0, [r6, #0x2c]
	adds r0, #1
	strh r0, [r6, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r6, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	ble .L0804FF0C
	movs r0, #0
	strh r0, [r6, #0x2c]
	movs r0, #0xa
	strh r0, [r6, #0x2e]
	adds r0, r6, #0
	bl Proc_Break
.L0804FF0C:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L0804FF14: .4byte gPal
.L0804FF18: .4byte gEfxPal

	thumb_func_start func_fe6_0804FF1C
func_fe6_0804FF1C: @ 0x0804FF1C
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	movs r0, #0x2c
	ldrsh r3, [r4, r0]
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #0x10
	movs r2, #0
	bl Interpolate
	ldr r2, .L0804FF8C @ =gDispIo
	mov ip, r2
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
	movs r2, #0
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x10
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x46
	strb r2, [r0]
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r4, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	ble .L0804FF84
	bl SpellFx_ClearBG1
	bl SpellFx_ClearColorEffects
	ldr r1, .L0804FF90 @ =gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
.L0804FF84:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0804FF8C: .4byte gDispIo
.L0804FF90: .4byte gEfxBgSemaphore

	thumb_func_start func_fe6_0804FF94
func_fe6_0804FF94: @ 0x0804FF94
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	ldr r1, .L0804FFC8 @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L0804FFCC @ =gPal
	ldr r1, .L0804FFD0 @ =gEfxPal
	movs r2, #0x80
	lsls r2, r2, #1
	bl CpuFastSet
	ldr r0, .L0804FFD4 @ =gUnk_085D16DC
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
.L0804FFC8: .4byte gEfxBgSemaphore
.L0804FFCC: .4byte gPal
.L0804FFD0: .4byte gEfxPal
.L0804FFD4: .4byte gUnk_085D16DC

	thumb_func_start func_fe6_0804FFD8
func_fe6_0804FFD8: @ 0x0804FFD8
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	movs r0, #0x2c
	ldrsh r3, [r5, r0]
	movs r1, #0x2e
	ldrsh r0, [r5, r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0x10
	bl Interpolate
	adds r3, r0, #0
	ldr r4, .L08050034 @ =gEfxPal
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0x20
	bl EfxPalBlackInOut
	movs r1, #0xa0
	lsls r1, r1, #0x13
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r4, #0
	bl CpuFastSet
	bl DisablePalSync
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r5, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	ble .L0805002C
	movs r0, #0
	strh r0, [r5, #0x2c]
	adds r0, r5, #0
	bl Proc_Break
.L0805002C:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08050034: .4byte gEfxPal

	thumb_func_start func_fe6_08050038
func_fe6_08050038: @ 0x08050038
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, .L08050074 @ =gEfxPal
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
	ldrh r2, [r4, #0x30]
	lsls r1, r2, #0x10
	cmp r0, r1
	ble .L0805006C
	ldr r1, .L08050078 @ =gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
.L0805006C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08050074: .4byte gEfxPal
.L08050078: .4byte gEfxBgSemaphore

	thumb_func_start func_fe6_0805007C
func_fe6_0805007C: @ 0x0805007C
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl func_fe6_08047300
	bl SpellFx_SetBG1Position
	ldr r0, .L080500B4 @ =gUnk_085D16FC
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r5, #0
	bl GetAnimRoundTypeAnotherSide
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl CheckRoundMiss
	adds r4, #0x29
	strb r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L080500B4: .4byte gUnk_085D16FC

	thumb_func_start func_fe6_080500B8
func_fe6_080500B8: @ 0x080500B8
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetAnimAnotherSide
	adds r5, r0, #0
	bl EfxGetCamMovDuration
	adds r2, r0, #0
	ldr r0, .L08050110 @ =gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r3, #0x3a
	cmp r0, #0
	beq .L080500DA
	movs r3, #0x32
.L080500DA:
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	movs r6, #0
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne .L08050114
	ldr r0, [r4, #0x5c]
	bl func_fe6_08050308
	movs r0, #0x84
	lsls r0, r0, #1
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r2, [r4, #0x5c]
	movs r3, #2
	ldrsh r2, [r2, r3]
	movs r3, #1
	bl func_fe6_0805C804
	ldr r0, [r4, #0x5c]
	movs r1, #1
	rsbs r1, r1, #0
	bl NewEfxFarAttackWithDistance
	b .L080501B0
	.align 2, 0
.L08050110: .4byte gEkrDistanceType
.L08050114:
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	adds r0, r3, r2
	cmp r1, r0
	bne .L08050128
	ldr r0, [r4, #0x5c]
	movs r1, #6
	bl NewEfxFlashBgWhite
	b .L080501B0
.L08050128:
	adds r0, r2, #6
	adds r0, r3, r0
	cmp r1, r0
	bne .L08050164
	adds r0, r5, #0
	bl func_fe6_080501B8
	adds r0, r5, #0
	bl func_fe6_0805027C
	str r6, [sp]
	str r6, [sp, #4]
	adds r0, r5, #0
	movs r1, #6
	movs r2, #5
	movs r3, #0x10
	bl func_fe6_0804CD88
	ldr r0, .L08050160 @ =0x00000109
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
	movs r3, #1
	bl func_fe6_0805C804
	b .L080501B0
	.align 2, 0
.L08050160: .4byte 0x00000109
.L08050164:
	adds r0, r2, #0
	adds r0, #8
	adds r0, r3, r0
	cmp r1, r0
	bne .L0805018E
	movs r0, #9
	ldrh r1, [r5, #0x10]
	orrs r0, r1
	strh r0, [r5, #0x10]
	adds r4, #0x29
	ldrb r1, [r4]
	adds r0, r5, #0
	bl StartBattleAnimHitEffectsDefault
	ldrb r0, [r4]
	cmp r0, #0
	bne .L080501B0
	adds r0, r5, #0
	bl func_fe6_0805C358
	b .L080501B0
.L0805018E:
	adds r0, r2, #0
	adds r0, #0xc
	adds r0, r3, r0
	cmp r1, r0
	beq .L080501B0
	adds r0, r2, #0
	adds r0, #0xe
	adds r0, r3, r0
	cmp r1, r0
	bne .L080501B0
	bl SpellFx_Finish
	bl func_fe6_08047358
	adds r0, r4, #0
	bl Proc_Break
.L080501B0:
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start func_fe6_080501B8
func_fe6_080501B8: @ 0x080501B8
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r1, .L08050204 @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08050208 @ =gUnk_085D1714
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	str r0, [r4, #0x44]
	ldr r0, .L0805020C @ =gUnk_0811A0DE
	str r0, [r4, #0x48]
	ldr r0, .L08050210 @ =gUnk_085D172C
	str r0, [r4, #0x4c]
	ldr r0, .L08050214 @ =gUnk_08159D98
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	bl SpellFx_SetSomeColorEffect
	ldr r0, [r4, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne .L08050218
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl SetBgOffset
	b .L08050222
	.align 2, 0
.L08050204: .4byte gEfxBgSemaphore
.L08050208: .4byte gUnk_085D1714
.L0805020C: .4byte gUnk_0811A0DE
.L08050210: .4byte gUnk_085D172C
.L08050214: .4byte gUnk_08159D98
.L08050218:
	movs r0, #1
	movs r1, #0xe8
	movs r2, #0
	bl SetBgOffset
.L08050222:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start func_fe6_08050228
func_fe6_08050228: @ 0x08050228
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
	blt .L08050254
	ldr r2, [r4, #0x4c]
	ldr r0, [r4, #0x5c]
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r1, [r1]
	movs r2, #0x20
	movs r3, #0x14
	bl SpellFx_WriteBgMapExt
	b .L08050272
.L08050254:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne .L08050272
	bl SpellFx_ClearBG1
	ldr r1, .L08050278 @ =gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_ClearColorEffects
	adds r0, r4, #0
	bl Proc_Break
.L08050272:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08050278: .4byte gEfxBgSemaphore

	thumb_func_start func_fe6_0805027C
func_fe6_0805027C: @ 0x0805027C
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, .L080502B0 @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L080502B4 @ =gUnk_085D1734
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x2e]
	str r1, [r0, #0x44]
	ldr r1, .L080502B8 @ =gUnk_0811A0E8
	str r1, [r0, #0x48]
	ldr r1, .L080502BC @ =gUnk_0815B364
	str r1, [r0, #0x4c]
	adds r0, r1, #0
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L080502B0: .4byte gEfxBgSemaphore
.L080502B4: .4byte gUnk_085D1734
.L080502B8: .4byte gUnk_0811A0E8
.L080502BC: .4byte gUnk_0815B364

	thumb_func_start func_fe6_080502C0
func_fe6_080502C0: @ 0x080502C0
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
	blt .L080502E6
	ldr r0, [r4, #0x4c]
	lsls r1, r1, #5
	adds r0, r0, r1
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	b .L080502FC
.L080502E6:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne .L080502FC
	ldr r1, .L08050304 @ =gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
.L080502FC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08050304: .4byte gEfxBgSemaphore

	thumb_func_start func_fe6_08050308
func_fe6_08050308: @ 0x08050308
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r1, .L0805034C @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08050350 @ =gUnk_085D1754
	movs r1, #3
	bl SpawnProc
	adds r6, r0, #0
	str r4, [r6, #0x5c]
	movs r0, #0
	strh r0, [r6, #0x2c]
	ldr r1, .L08050354 @ =gUnk_085EA7F0
	ldr r2, .L08050358 @ =gUnk_085E90AC
	ldr r3, .L0805035C @ =gUnk_085EA8A4
	ldr r0, .L08050360 @ =gUnk_085E9160
	str r0, [sp]
	adds r0, r4, #0
	bl EfxCreateFrontAnim
	adds r5, r0, #0
	str r5, [r6, #0x60]
	adds r0, r4, #0
	bl GetAnimPosition
	cmp r0, #0
	bne .L08050364
	ldrh r0, [r5, #2]
	adds r0, #0x48
	b .L08050368
	.align 2, 0
.L0805034C: .4byte gEfxBgSemaphore
.L08050350: .4byte gUnk_085D1754
.L08050354: .4byte gUnk_085EA7F0
.L08050358: .4byte gUnk_085E90AC
.L0805035C: .4byte gUnk_085EA8A4
.L08050360: .4byte gUnk_085E9160
.L08050364:
	ldrh r0, [r5, #2]
	subs r0, #0x48
.L08050368:
	strh r0, [r5, #2]
	movs r0, #0x60
	strh r0, [r6, #0x2e]
	ldr r0, .L08050388 @ =gUnk_0815BED4
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, .L0805038C @ =gUnk_0815B910
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08050388: .4byte gUnk_0815BED4
.L0805038C: .4byte gUnk_0815B910

	thumb_func_start func_fe6_08050390
func_fe6_08050390: @ 0x08050390
	push {lr}
	adds r2, r0, #0
	ldrh r0, [r2, #0x2c]
	adds r0, #1
	strh r0, [r2, #0x2c]
	lsls r0, r0, #0x10
	ldrh r3, [r2, #0x2e]
	lsls r1, r3, #0x10
	cmp r0, r1
	bne .L080503B2
	ldr r1, .L080503B8 @ =gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r2, #0
	bl Proc_Break
.L080503B2:
	pop {r0}
	bx r0
	.align 2, 0
.L080503B8: .4byte gEfxBgSemaphore

	thumb_func_start func_fe6_080503BC
func_fe6_080503BC: @ 0x080503BC
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl func_fe6_08047300
	bl SpellFx_SetBG1Position
	ldr r0, .L080503F4 @ =gUnk_085D176C
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r5, #0
	bl GetAnimRoundTypeAnotherSide
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl CheckRoundMiss
	adds r4, #0x29
	strb r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L080503F4: .4byte gUnk_085D176C

	thumb_func_start func_fe6_080503F8
func_fe6_080503F8: @ 0x080503F8
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetAnimAnotherSide
	adds r5, r0, #0
	bl EfxGetCamMovDuration
	adds r2, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne .L08050434
	movs r0, #0x85
	lsls r0, r0, #1
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r2, [r4, #0x5c]
	movs r3, #2
	ldrsh r2, [r2, r3]
	movs r3, #1
	bl func_fe6_0805C804
	adds r0, r5, #0
	bl func_fe6_080504F0
	b .L080504E8
.L08050434:
	cmp r0, #0x18
	bne .L08050440
	ldr r0, [r4, #0x5c]
	bl func_fe6_080506B4
	b .L080504E8
.L08050440:
	cmp r0, #0x82
	bne .L08050450
	ldr r0, [r4, #0x5c]
	movs r1, #1
	rsbs r1, r1, #0
	bl NewEfxFarAttackWithDistance
	b .L080504E8
.L08050450:
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	adds r0, r2, #0
	adds r0, #0x83
	cmp r1, r0
	bne .L08050466
	adds r0, r5, #0
	bl func_fe6_080506F8
	str r0, [r4, #0x64]
	b .L080504E8
.L08050466:
	adds r0, r2, #0
	adds r0, #0x96
	cmp r1, r0
	bne .L0805048C
	ldr r0, .L08050488 @ =0x0000010B
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
	movs r3, #1
	bl func_fe6_0805C804
	ldr r0, [r4, #0x5c]
	bl func_fe6_080505A0
	b .L080504E8
	.align 2, 0
.L08050488: .4byte 0x0000010B
.L0805048C:
	adds r0, r2, #0
	adds r0, #0xaa
	cmp r1, r0
	bne .L0805049C
	ldr r0, [r4, #0x64]
	bl Proc_End
	b .L080504E8
.L0805049C:
	adds r0, r2, #0
	adds r0, #0xc3
	cmp r1, r0
	bne .L080504CC
	ldr r0, [r4, #0x5c]
	movs r1, #6
	bl NewEfxFlashBgWhite
	movs r0, #9
	ldrh r1, [r5, #0x10]
	orrs r0, r1
	strh r0, [r5, #0x10]
	adds r4, #0x29
	ldrb r1, [r4]
	adds r0, r5, #0
	bl StartBattleAnimHitEffectsDefault
	ldrb r0, [r4]
	cmp r0, #0
	bne .L080504E8
	adds r0, r5, #0
	bl func_fe6_0805C358
	b .L080504E8
.L080504CC:
	adds r0, r2, #0
	adds r0, #0xe6
	cmp r1, r0
	beq .L080504E8
	adds r0, #0xa
	cmp r1, r0
	bne .L080504E8
	bl SpellFx_Finish
	bl func_fe6_08047358
	adds r0, r4, #0
	bl Proc_Break
.L080504E8:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_fe6_080504F0
func_fe6_080504F0: @ 0x080504F0
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, .L08050548 @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L0805054C @ =gUnk_085D1784
	movs r1, #3
	bl SpawnProc
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	str r0, [r5, #0x44]
	ldr r0, .L08050550 @ =gUnk_0811A102
	str r0, [r5, #0x48]
	ldr r0, .L08050554 @ =gUnk_085D179C
	str r0, [r5, #0x4c]
	str r0, [r5, #0x50]
	ldr r0, .L08050558 @ =gUnk_085D1840
	str r0, [r5, #0x54]
	ldr r0, .L0805055C @ =gUnk_0815F880
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	bl SpellFx_SetSomeColorEffect
	ldr r0, .L08050560 @ =gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq .L0805056E
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne .L08050564
	movs r0, #1
	movs r1, #0xe8
	movs r2, #0
	bl SetBgOffset
	b .L0805056E
	.align 2, 0
.L08050548: .4byte gEfxBgSemaphore
.L0805054C: .4byte gUnk_085D1784
.L08050550: .4byte gUnk_0811A102
.L08050554: .4byte gUnk_085D179C
.L08050558: .4byte gUnk_085D1840
.L0805055C: .4byte gUnk_0815F880
.L08050560: .4byte gEkrDistanceType
.L08050564:
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl SetBgOffset
.L0805056E:
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne .L08050584
	ldr r0, .L08050580 @ =gDispIo
	ldrh r1, [r0, #0x20]
	adds r1, #4
	b .L0805058A
	.align 2, 0
.L08050580: .4byte gDispIo
.L08050584:
	ldr r0, .L0805059C @ =gDispIo
	ldrh r1, [r0, #0x20]
	subs r1, #4
.L0805058A:
	strh r1, [r0, #0x20]
	adds r1, r0, #0
	ldrh r0, [r1, #0x22]
	adds r0, #8
	strh r0, [r1, #0x22]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0805059C: .4byte gDispIo

	thumb_func_start func_fe6_080505A0
func_fe6_080505A0: @ 0x080505A0
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, .L08050620 @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08050624 @ =gUnk_085D1784
	movs r1, #3
	bl SpawnProc
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r4, #0
	movs r0, #0
	strh r0, [r5, #0x2c]
	str r0, [r5, #0x44]
	ldr r0, .L08050628 @ =gUnk_0811A134
	str r0, [r5, #0x48]
	ldr r0, .L0805062C @ =gUnk_085D179C
	str r0, [r5, #0x4c]
	str r0, [r5, #0x50]
	ldr r0, .L08050630 @ =gUnk_085D1840
	str r0, [r5, #0x54]
	ldr r0, .L08050634 @ =gUnk_0815F8A0
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	bl SpellFx_SetSomeColorEffect
	ldr r3, .L08050638 @ =gDispIo
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r1, r3, #0
	adds r1, #0x44
	movs r0, #0xa
	strb r0, [r1]
	adds r1, #1
	movs r0, #7
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x46
	strb r4, [r0]
	ldr r0, .L0805063C @ =gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq .L0805064A
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne .L08050640
	movs r0, #1
	movs r1, #0xe8
	movs r2, #0
	bl SetBgOffset
	b .L0805064A
	.align 2, 0
.L08050620: .4byte gEfxBgSemaphore
.L08050624: .4byte gUnk_085D1784
.L08050628: .4byte gUnk_0811A134
.L0805062C: .4byte gUnk_085D179C
.L08050630: .4byte gUnk_085D1840
.L08050634: .4byte gUnk_0815F8A0
.L08050638: .4byte gDispIo
.L0805063C: .4byte gEkrDistanceType
.L08050640:
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl SetBgOffset
.L0805064A:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start func_fe6_08050650
func_fe6_08050650: @ 0x08050650
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r0, #0x2c
	adds r1, r7, #0
	adds r1, #0x44
	ldr r2, [r7, #0x48]
	bl EfxAdvanceFrameLut
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	cmp r4, #0
	blt .L0805068C
	ldr r5, [r7, #0x4c]
	ldr r6, [r7, #0x50]
	ldr r0, [r7, #0x54]
	lsls r4, r4, #2
	adds r0, r4, r0
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	ldr r0, [r7, #0x5c]
	adds r5, r4, r5
	ldr r1, [r5]
	adds r4, r4, r6
	ldr r2, [r4]
	bl SpellFx_WriteBgMap
	b .L080506AA
.L0805068C:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r4, r0
	bne .L080506AA
	bl SpellFx_ClearBG1
	ldr r1, .L080506B0 @ =gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_ClearColorEffects
	adds r0, r7, #0
	bl Proc_End
.L080506AA:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L080506B0: .4byte gEfxBgSemaphore

	thumb_func_start func_fe6_080506B4
func_fe6_080506B4: @ 0x080506B4
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, .L080506EC @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L080506F0 @ =gUnk_085D18E4
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	adds r0, r5, #0
	bl GetAnimAnotherSide
	ldr r3, .L080506F4 @ =AnimScr_ManaketeFlame
	ldr r0, [r4, #0x5c]
	str r3, [sp]
	adds r1, r3, #0
	adds r2, r3, #0
	bl EfxCreateFrontAnim
	str r0, [r4, #0x60]
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L080506EC: .4byte gEfxBgSemaphore
.L080506F0: .4byte gUnk_085D18E4
.L080506F4: .4byte AnimScr_ManaketeFlame

	thumb_func_start func_fe6_080506F8
func_fe6_080506F8: @ 0x080506F8
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, .L08050738 @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L0805073C @ =gUnk_085D192C
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	adds r0, r5, #0
	bl GetAnimAnotherSide
	ldr r3, .L08050740 @ =AnimScr_ManaketeFlame
	ldr r0, [r4, #0x5c]
	str r3, [sp]
	adds r1, r3, #0
	adds r2, r3, #0
	bl EfxCreateFrontAnim
	str r0, [r4, #0x60]
	ldrh r1, [r0, #4]
	subs r1, #4
	strh r1, [r0, #4]
	adds r0, r4, #0
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
.L08050738: .4byte gEfxBgSemaphore
.L0805073C: .4byte gUnk_085D192C
.L08050740: .4byte AnimScr_ManaketeFlame

	thumb_func_start func_fe6_08050744
func_fe6_08050744: @ 0x08050744
	push {lr}
	ldr r2, .L08050758 @ =gEfxBgSemaphore
	ldr r1, [r2]
	subs r1, #1
	str r1, [r2]
	ldr r0, [r0, #0x60]
	bl BasRemove
	pop {r0}
	bx r0
	.align 2, 0
.L08050758: .4byte gEfxBgSemaphore

	thumb_func_start func_fe6_0805075C
func_fe6_0805075C: @ 0x0805075C
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x60]
	ldr r0, .L0805078C @ =gUnk_085EABC0
	str r0, [r1, #0x24]
	str r0, [r1, #0x20]
	movs r0, #0
	strh r0, [r1, #6]
	ldr r0, .L08050790 @ =gUnk_081629D4
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, .L08050794 @ =gUnk_08161DDC
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0805078C: .4byte gUnk_085EABC0
.L08050790: .4byte gUnk_081629D4
.L08050794: .4byte gUnk_08161DDC

	thumb_func_start func_fe6_08050798
func_fe6_08050798: @ 0x08050798
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x60]
	ldr r0, .L080507C8 @ =gUnk_085EADB0
	str r0, [r1, #0x24]
	str r0, [r1, #0x20]
	movs r0, #0
	strh r0, [r1, #6]
	ldr r0, .L080507CC @ =gUnk_081629D4
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, .L080507D0 @ =gUnk_081621DC
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L080507C8: .4byte gUnk_085EADB0
.L080507CC: .4byte gUnk_081629D4
.L080507D0: .4byte gUnk_081621DC

	thumb_func_start func_fe6_080507D4
func_fe6_080507D4: @ 0x080507D4
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x60]
	ldr r0, .L08050804 @ =gUnk_085EB264
	str r0, [r1, #0x24]
	str r0, [r1, #0x20]
	movs r0, #0
	strh r0, [r1, #6]
	ldr r0, .L08050808 @ =gUnk_081629D4
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, .L0805080C @ =gUnk_0816261C
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08050804: .4byte gUnk_085EB264
.L08050808: .4byte gUnk_081629D4
.L0805080C: .4byte gUnk_0816261C

	thumb_func_start func_fe6_08050810
func_fe6_08050810: @ 0x08050810
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x60]
	ldr r0, .L08050838 @ =gUnk_085EB1A8
	str r0, [r1, #0x24]
	str r0, [r1, #0x20]
	movs r0, #0
	strh r0, [r1, #6]
	movs r0, #0x14
	strh r0, [r1, #0xa]
	bl BasSort
	movs r0, #0x27
	strh r0, [r4, #0x2c]
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08050838: .4byte gUnk_085EB1A8

	thumb_func_start func_fe6_0805083C
func_fe6_0805083C: @ 0x0805083C
	adds r1, r0, #0
	ldr r2, [r1, #0x60]
	ldrh r0, [r1, #0x2c]
	adds r0, #1
	movs r3, #0
	strh r0, [r1, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x28
	bne .L0805085A
	ldr r0, .L0805085C @ =gUnk_085EB1DC
	str r0, [r2, #0x24]
	str r0, [r2, #0x20]
	strh r3, [r2, #6]
	strh r3, [r1, #0x2c]
.L0805085A:
	bx lr
	.align 2, 0
.L0805085C: .4byte gUnk_085EB1DC

	thumb_func_start func_fe6_08050860
func_fe6_08050860: @ 0x08050860
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl func_fe6_08047300
	bl SpellFx_SetBG1Position
	ldr r0, .L08050898 @ =gUnk_085D195C
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r5, #0
	bl GetAnimRoundTypeAnotherSide
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl CheckRoundMiss
	adds r4, #0x29
	strb r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08050898: .4byte gUnk_085D195C

	thumb_func_start func_fe6_0805089C
func_fe6_0805089C: @ 0x0805089C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetAnimAnotherSide
	adds r6, r0, #0
	bl EfxGetCamMovDuration
	adds r5, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	movs r1, #0
	mov r8, r1
	movs r7, #0
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne .L080508D2
	ldr r0, [r4, #0x5c]
	movs r1, #1
	rsbs r1, r1, #0
	bl NewEfxFarAttackWithDistance
.L080508D2:
	movs r2, #0x2c
	ldrsh r1, [r4, r2]
	adds r0, r5, #1
	cmp r1, r0
	bne .L08050930
	ldr r3, .L0805092C @ =gDispIo
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
	mov r2, r8
	strb r2, [r0]
	adds r0, #1
	movs r1, #0x10
	strb r1, [r0]
	adds r0, #1
	strb r2, [r0]
	str r1, [sp]
	str r7, [sp, #4]
	adds r0, r6, #0
	movs r1, #0
	movs r2, #0xa
	movs r3, #0
	bl func_fe6_0804CD88
	str r7, [sp]
	str r7, [sp, #4]
	adds r0, r6, #0
	movs r1, #0x28
	movs r2, #0x28
	movs r3, #0x10
	bl func_fe6_0804CD88
	adds r0, r6, #0
	bl func_fe6_08050A70
	movs r0, #0x92
	lsls r0, r0, #1
	b .L08050982
	.align 2, 0
.L0805092C: .4byte gDispIo
.L08050930:
	adds r0, r5, #0
	adds r0, #0xf
	cmp r1, r0
	bne .L0805096C
	movs r0, #2
	str r0, [sp]
	adds r0, r6, #0
	movs r1, #0x52
	movs r2, #0xf
	movs r3, #0
	bl func_fe6_0804C8D4
	adds r1, r0, #0
	adds r0, r6, #0
	movs r2, #0x3c
	bl func_fe6_08050D68
	ldr r0, .L08050964 @ =gDispIo
	movs r1, #0x20
	ldrsh r2, [r0, r1]
	ldr r3, .L08050968 @ =func_fe6_0804CD4C
	adds r0, r6, #0
	movs r1, #0x53
	bl func_fe6_0804CB8C
	b .L080509D8
	.align 2, 0
.L08050964: .4byte gDispIo
.L08050968: .4byte func_fe6_0804CD4C
.L0805096C:
	adds r0, r5, #0
	adds r0, #0x64
	cmp r1, r0
	bne .L08050998
	adds r0, r4, #0
	adds r0, #0x29
	ldrb r1, [r0]
	adds r0, r6, #0
	bl func_fe6_080509E4
	ldr r0, .L08050994 @ =0x00000125
.L08050982:
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r6, r3]
	movs r3, #1
	bl func_fe6_0805C804
	b .L080509D8
	.align 2, 0
.L08050994: .4byte 0x00000125
.L08050998:
	adds r0, r5, #0
	adds r0, #0x69
	cmp r1, r0
	bne .L080509C0
	movs r0, #9
	ldrh r1, [r6, #0x10]
	orrs r0, r1
	strh r0, [r6, #0x10]
	adds r4, #0x29
	ldrb r1, [r4]
	adds r0, r6, #0
	bl StartBattleAnimResireHitEffects
	ldrb r0, [r4]
	cmp r0, #0
	bne .L080509D8
	adds r0, r6, #0
	bl func_fe6_0805C358
	b .L080509D8
.L080509C0:
	adds r0, r5, #0
	adds r0, #0x96
	cmp r1, r0
	beq .L080509D8
	adds r0, #0x14
	cmp r1, r0
	bne .L080509D8
	bl SpellFx_Finish
	adds r0, r4, #0
	bl Proc_Break
.L080509D8:
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start func_fe6_080509E4
func_fe6_080509E4: @ 0x080509E4
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, .L08050A44 @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08050A48 @ =gUnk_085D1974
	movs r1, #3
	bl SpawnProc
	adds r6, r0, #0
	str r4, [r6, #0x5c]
	adds r1, r6, #0
	adds r1, #0x29
	movs r0, #0
	strb r5, [r1]
	strh r0, [r6, #0x2c]
	str r0, [r6, #0x44]
	ldr r0, .L08050A4C @ =gUnk_0811A1AA
	str r0, [r6, #0x48]
	ldr r0, .L08050A50 @ =gUnk_085D1A88
	str r0, [r6, #0x4c]
	str r0, [r6, #0x50]
	ldr r0, .L08050A54 @ =gUnk_085D19BC
	str r0, [r6, #0x54]
	ldr r0, .L08050A58 @ =gUnk_0816B328
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	bl SpellFx_SetSomeColorEffect
	ldr r0, .L08050A5C @ =gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq .L08050A6A
	ldr r0, [r6, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne .L08050A60
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl SetBgOffset
	b .L08050A6A
	.align 2, 0
.L08050A44: .4byte gEfxBgSemaphore
.L08050A48: .4byte gUnk_085D1974
.L08050A4C: .4byte gUnk_0811A1AA
.L08050A50: .4byte gUnk_085D1A88
.L08050A54: .4byte gUnk_085D19BC
.L08050A58: .4byte gUnk_0816B328
.L08050A5C: .4byte gEkrDistanceType
.L08050A60:
	movs r0, #1
	movs r1, #0xe8
	movs r2, #0
	bl SetBgOffset
.L08050A6A:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start func_fe6_08050A70
func_fe6_08050A70: @ 0x08050A70
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, .L08050AE0 @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08050AE4 @ =gUnk_085D19A4
	movs r1, #3
	bl SpawnProc
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	str r0, [r5, #0x44]
	ldr r0, .L08050AE8 @ =gUnk_0811A276
	str r0, [r5, #0x48]
	ldr r0, .L08050AEC @ =gUnk_085D1A88
	str r0, [r5, #0x4c]
	str r0, [r5, #0x50]
	ldr r0, .L08050AF0 @ =gUnk_085D19BC
	str r0, [r5, #0x54]
	ldr r0, .L08050AF4 @ =gUnk_0816B328
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	bl SpellFx_SetSomeColorEffect
	ldr r2, .L08050AF8 @ =gDispIo
	movs r0, #0x21
	rsbs r0, r0, #0
	ldrb r1, [r2, #1]
	ands r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r2, #1]
	ldr r0, .L08050AFC @ =gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq .L08050B0A
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne .L08050B00
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl SetBgOffset
	b .L08050B0A
	.align 2, 0
.L08050AE0: .4byte gEfxBgSemaphore
.L08050AE4: .4byte gUnk_085D19A4
.L08050AE8: .4byte gUnk_0811A276
.L08050AEC: .4byte gUnk_085D1A88
.L08050AF0: .4byte gUnk_085D19BC
.L08050AF4: .4byte gUnk_0816B328
.L08050AF8: .4byte gDispIo
.L08050AFC: .4byte gEkrDistanceType
.L08050B00:
	movs r0, #1
	movs r1, #0xe8
	movs r2, #0
	bl SetBgOffset
.L08050B0A:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start func_fe6_08050B10
func_fe6_08050B10: @ 0x08050B10
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r0, #0x2c
	adds r1, r7, #0
	adds r1, #0x44
	ldr r2, [r7, #0x48]
	bl EfxAdvanceFrameLut
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	cmp r4, #0
	blt .L08050B4C
	ldr r5, [r7, #0x4c]
	ldr r6, [r7, #0x50]
	ldr r0, [r7, #0x54]
	lsls r4, r4, #2
	adds r0, r4, r0
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	ldr r0, [r7, #0x5c]
	adds r5, r4, r5
	ldr r1, [r5]
	adds r4, r4, r6
	ldr r2, [r4]
	bl SpellFx_WriteBgMap
	b .L08050B8E
.L08050B4C:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r4, r0
	bne .L08050B8E
	bl SpellFx_ClearBG1
	adds r0, r7, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #1
	bne .L08050B80
	ldr r1, .L08050B7C @ =gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_ClearColorEffects
	bl func_fe6_08047358
	adds r0, r7, #0
	bl Proc_End
	b .L08050B8E
	.align 2, 0
.L08050B7C: .4byte gEfxBgSemaphore
.L08050B80:
	movs r0, #0
	strh r0, [r7, #0x2c]
	movs r0, #0x1e
	strh r0, [r7, #0x2e]
	adds r0, r7, #0
	bl Proc_Break
.L08050B8E:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start func_fe6_08050B94
func_fe6_08050B94: @ 0x08050B94
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, .L08050BB8 @ =gUnk_Banim_02017748
	ldr r0, [r5]
	cmp r0, #2
	bne .L08050BC0
	ldr r1, .L08050BBC @ =gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_ClearColorEffects
	bl func_fe6_08047358
	adds r0, r4, #0
	bl Proc_End
	b .L08050C1A
	.align 2, 0
.L08050BB8: .4byte gUnk_Banim_02017748
.L08050BBC: .4byte gEfxBgSemaphore
.L08050BC0:
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	movs r3, #0
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #0x2e
	ldrsh r2, [r4, r1]
	ldrh r1, [r4, #0x2e]
	cmp r0, r2
	ble .L08050BD8
	strh r1, [r4, #0x2c]
.L08050BD8:
	movs r1, #0x2c
	ldrsh r0, [r4, r1]
	cmp r0, r2
	bne .L08050C1A
	ldr r0, [r5]
	cmp r0, #1
	bne .L08050C1A
	strh r3, [r4, #0x2c]
	strh r3, [r4, #0x2e]
	str r3, [r4, #0x44]
	ldr r0, .L08050C20 @ =gUnk_0811A218
	str r0, [r4, #0x48]
	ldr r0, .L08050C24 @ =gUnk_085D1A88
	str r0, [r4, #0x4c]
	str r0, [r4, #0x50]
	ldr r0, .L08050C28 @ =gUnk_085D19BC
	str r0, [r4, #0x54]
	ldr r0, .L08050C2C @ =gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq .L08050C14
	bl EfxGetCamMovDuration
	strh r0, [r4, #0x2e]
	ldr r0, [r4, #0x5c]
	movs r1, #1
	rsbs r1, r1, #0
	bl NewEfxFarAttackWithDistance
.L08050C14:
	adds r0, r4, #0
	bl Proc_Break
.L08050C1A:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08050C20: .4byte gUnk_0811A218
.L08050C24: .4byte gUnk_085D1A88
.L08050C28: .4byte gUnk_085D19BC
.L08050C2C: .4byte gEkrDistanceType

	thumb_func_start func_fe6_08050C30
func_fe6_08050C30: @ 0x08050C30
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetAnimAnotherSide
	adds r5, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r4, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	ble .L08050C96
	ldr r0, .L08050C6C @ =gEkrDistanceType
	movs r3, #0
	ldrsh r0, [r0, r3]
	cmp r0, #0
	beq .L08050C7A
	ldr r0, [r4, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne .L08050C70
	movs r0, #1
	movs r1, #0xe8
	movs r2, #0
	bl SetBgOffset
	b .L08050C7A
	.align 2, 0
.L08050C6C: .4byte gEkrDistanceType
.L08050C70:
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl SetBgOffset
.L08050C7A:
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #0x93
	lsls r0, r0, #1
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
	movs r3, #1
	bl func_fe6_0805C804
	adds r0, r4, #0
	bl Proc_Break
.L08050C96:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start func_fe6_08050C9C
func_fe6_08050C9C: @ 0x08050C9C
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r0, #0x2c
	adds r1, r7, #0
	adds r1, #0x44
	ldr r2, [r7, #0x48]
	bl EfxAdvanceFrameLut
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	cmp r4, #0
	blt .L08050CD8
	ldr r5, [r7, #0x4c]
	ldr r6, [r7, #0x50]
	ldr r0, [r7, #0x54]
	lsls r4, r4, #2
	adds r0, r4, r0
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	ldr r0, [r7, #0x5c]
	adds r5, r4, r5
	ldr r1, [r5]
	adds r4, r4, r6
	ldr r2, [r4]
	bl SpellFx_WriteBgMap
	b .L08050CFA
.L08050CD8:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r4, r0
	bne .L08050CFA
	bl SpellFx_ClearBG1
	ldr r1, .L08050D00 @ =gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_ClearColorEffects
	bl func_fe6_08047358
	adds r0, r7, #0
	bl Proc_Break
.L08050CFA:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08050D00: .4byte gEfxBgSemaphore

	thumb_func_start func_fe6_08050D04
func_fe6_08050D04: @ 0x08050D04
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r0, #0x2c
	adds r1, r7, #0
	adds r1, #0x44
	ldr r2, [r7, #0x48]
	bl EfxAdvanceFrameLut
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	cmp r4, #0
	blt .L08050D40
	ldr r5, [r7, #0x4c]
	ldr r6, [r7, #0x50]
	ldr r0, [r7, #0x54]
	lsls r4, r4, #2
	adds r0, r4, r0
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	ldr r0, [r7, #0x5c]
	adds r5, r4, r5
	ldr r1, [r5]
	adds r4, r4, r6
	ldr r2, [r4]
	bl SpellFx_WriteBgMap
	b .L08050D5E
.L08050D40:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r4, r0
	bne .L08050D5E
	bl SpellFx_ClearBG1
	ldr r1, .L08050D64 @ =gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_ClearColorEffects
	adds r0, r7, #0
	bl Proc_Break
.L08050D5E:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08050D64: .4byte gEfxBgSemaphore

	thumb_func_start func_fe6_08050D68
func_fe6_08050D68: @ 0x08050D68
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r6, r1, #0
	adds r5, r2, #0
	ldr r1, .L08050D90 @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08050D94 @ =gUnk_085D1B54
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r5, [r0, #0x2e]
	str r6, [r0, #0x64]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08050D90: .4byte gEfxBgSemaphore
.L08050D94: .4byte gUnk_085D1B54

	thumb_func_start func_fe6_08050D98
func_fe6_08050D98: @ 0x08050D98
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r4, [r5, #0x64]
	movs r0, #0x2c
	ldrsh r3, [r5, r0]
	movs r1, #0x2e
	ldrsh r0, [r5, r1]
	str r0, [sp]
	movs r0, #4
	movs r1, #0
	movs r2, #0x80
	bl Interpolate
	str r0, [r4, #0x4c]
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r5, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	ble .L08050DD4
	ldr r1, .L08050DDC @ =gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r5, #0
	bl Proc_Break
.L08050DD4:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08050DDC: .4byte gEfxBgSemaphore

	thumb_func_start func_fe6_08050DE0
func_fe6_08050DE0: @ 0x08050DE0
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl func_fe6_08047300
	bl SpellFx_SetBG1Position
	ldr r0, .L08050E18 @ =gUnk_085D1B6C
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r5, #0
	bl GetAnimRoundTypeAnotherSide
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl CheckRoundMiss
	adds r4, #0x29
	strb r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08050E18: .4byte gUnk_085D1B6C

	thumb_func_start func_fe6_08050E1C
func_fe6_08050E1C: @ 0x08050E1C
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetAnimAnotherSide
	adds r5, r0, #0
	bl EfxGetCamMovDuration
	adds r6, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne .L08050E46
	ldr r0, [r4, #0x5c]
	movs r1, #1
	rsbs r1, r1, #0
	bl NewEfxFarAttackWithDistance
.L08050E46:
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	adds r0, r6, #1
	cmp r1, r0
	bne .L08050E6A
	movs r0, #0x90
	lsls r0, r0, #1
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
	movs r3, #1
	bl func_fe6_0805C804
	adds r0, r5, #0
	bl func_fe6_08050ED4
	b .L08050ECC
.L08050E6A:
	adds r0, r6, #0
	adds r0, #0x1a
	cmp r1, r0
	bne .L08050EB0
	ldr r0, .L08050EAC @ =0x00000121
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
	movs r3, #1
	bl func_fe6_0805C804
	ldr r0, [r4, #0x5c]
	movs r1, #4
	bl NewEfxFlashBgWhite
	movs r0, #9
	ldrh r1, [r5, #0x10]
	orrs r0, r1
	strh r0, [r5, #0x10]
	adds r4, #0x29
	ldrb r1, [r4]
	adds r0, r5, #0
	bl StartBattleAnimHitEffectsDefault
	ldrb r0, [r4]
	cmp r0, #0
	bne .L08050ECC
	adds r0, r5, #0
	bl func_fe6_0805C358
	b .L08050ECC
	.align 2, 0
.L08050EAC: .4byte 0x00000121
.L08050EB0:
	adds r0, r6, #0
	adds r0, #0x2f
	cmp r1, r0
	beq .L08050ECC
	adds r0, #1
	cmp r1, r0
	bne .L08050ECC
	bl SpellFx_Finish
	bl func_fe6_08047358
	adds r0, r4, #0
	bl Proc_Break
.L08050ECC:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_fe6_08050ED4
func_fe6_08050ED4: @ 0x08050ED4
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, .L08050F28 @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08050F2C @ =gUnk_085D1B84
	movs r1, #3
	bl SpawnProc
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	str r0, [r5, #0x44]
	ldr r0, .L08050F30 @ =gUnk_0811A27C
	str r0, [r5, #0x48]
	ldr r0, .L08050F34 @ =gUnk_085D1CA4
	str r0, [r5, #0x4c]
	str r0, [r5, #0x50]
	ldr r0, .L08050F38 @ =gUnk_085D1B9C
	str r0, [r5, #0x54]
	ldr r0, .L08050F3C @ =gUnk_085D1C20
	str r0, [r5, #0x58]
	bl SpellFx_SetSomeColorEffect
	ldr r0, .L08050F40 @ =gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq .L08050F4E
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne .L08050F44
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl SetBgOffset
	b .L08050F4E
	.align 2, 0
.L08050F28: .4byte gEfxBgSemaphore
.L08050F2C: .4byte gUnk_085D1B84
.L08050F30: .4byte gUnk_0811A27C
.L08050F34: .4byte gUnk_085D1CA4
.L08050F38: .4byte gUnk_085D1B9C
.L08050F3C: .4byte gUnk_085D1C20
.L08050F40: .4byte gEkrDistanceType
.L08050F44:
	movs r0, #1
	movs r1, #0xe8
	movs r2, #0
	bl SetBgOffset
.L08050F4E:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start func_fe6_08050F54
func_fe6_08050F54: @ 0x08050F54
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r7, r0, #0
	adds r0, #0x2c
	adds r1, r7, #0
	adds r1, #0x44
	ldr r2, [r7, #0x48]
	bl EfxAdvanceFrameLut
	lsls r0, r0, #0x10
	asrs r5, r0, #0x10
	cmp r5, #0
	blt .L08050FDC
	ldr r6, [r7, #0x4c]
	ldr r0, [r7, #0x50]
	mov r8, r0
	ldr r0, [r7, #0x54]
	ldr r4, [r7, #0x58]
	lsls r5, r5, #2
	adds r0, r5, r0
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	adds r4, r5, r4
	ldr r0, [r4]
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	ldr r0, [r7, #0x5c]
	adds r6, r5, r6
	ldr r1, [r6]
	add r5, r8
	ldr r2, [r5]
	bl SpellFx_WriteBgMap
	ldr r0, .L08050FBC @ =gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq .L08050FFA
	ldr r0, [r7, #0x5c]
	bl GetAnimPosition
	adds r1, r0, #0
	cmp r1, #0
	bne .L08050FC4
	ldr r0, .L08050FC0 @ =gBg1Tm
	b .L08050FC8
	.align 2, 0
.L08050FBC: .4byte gEkrDistanceType
.L08050FC0: .4byte gBg1Tm
.L08050FC4:
	ldr r0, .L08050FD8 @ =gBg1Tm+0x3A
	movs r1, #0
.L08050FC8:
	str r1, [sp]
	movs r1, #3
	movs r2, #0x14
	movs r3, #0
	bl FillBGRect
	b .L08050FFA
	.align 2, 0
.L08050FD8: .4byte gBg1Tm+0x3A
.L08050FDC:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r5, r0
	bne .L08050FFA
	bl SpellFx_ClearBG1
	ldr r1, .L08051008 @ =gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_ClearColorEffects
	adds r0, r7, #0
	bl Proc_End
.L08050FFA:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08051008: .4byte gEfxBgSemaphore

	thumb_func_start func_fe6_0805100C
func_fe6_0805100C: @ 0x0805100C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl func_fe6_08047300
	bl SpellFx_SetBG1Position
	ldr r0, .L08051048 @ =gUnk_085D1D28
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r6, #0
	strh r6, [r4, #0x2c]
	adds r0, r5, #0
	bl GetAnimRoundTypeAnotherSide
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl CheckRoundMiss
	adds r4, #0x29
	strb r0, [r4]
	ldr r0, .L0805104C @ =gUnk_Banim_0201E7A8
	str r6, [r0]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08051048: .4byte gUnk_085D1D28
.L0805104C: .4byte gUnk_Banim_0201E7A8

	thumb_func_start func_fe6_08051050
func_fe6_08051050: @ 0x08051050
	push {lr}
	adds r2, r0, #0
	adds r3, r1, #0
	ldr r0, .L0805106C @ =gUnk_Banim_0201E7A8
	ldr r0, [r0]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq .L08051070
	adds r1, #0xff
	movs r0, #0xfe
	bl func_fe6_0805C804
	b .L0805107A
	.align 2, 0
.L0805106C: .4byte gUnk_Banim_0201E7A8
.L08051070:
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0xff
	bl func_fe6_0805C804
.L0805107A:
	ldr r1, .L08051088 @ =gUnk_Banim_0201E7A8
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
.L08051088: .4byte gUnk_Banim_0201E7A8

	thumb_func_start func_fe6_0805108C
func_fe6_0805108C: @ 0x0805108C
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r6, r0, #0
	ldr r0, [r6, #0x5c]
	bl GetAnimAnotherSide
	adds r5, r0, #0
	bl EfxGetCamMovDuration
	adds r4, r0, #0
	ldrh r0, [r6, #0x2c]
	adds r0, #1
	movs r7, #0
	strh r0, [r6, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne .L080510BA
	ldr r0, [r6, #0x5c]
	movs r1, #1
	rsbs r1, r1, #0
	bl NewEfxFarAttackWithDistance
.L080510BA:
	movs r0, #0x2c
	ldrsh r1, [r6, r0]
	adds r0, r4, #1
	cmp r1, r0
	bne .L080510DC
	adds r0, r5, #0
	movs r1, #4
	bl NewEfxFlashBgWhite
	adds r0, r5, #0
	bl func_fe6_080511BC
	adds r0, r5, #0
	bl func_fe6_08051288
	movs r0, #0x30
	b .L08051102
.L080510DC:
	adds r0, r4, #0
	adds r0, #0x15
	cmp r1, r0
	bne .L080510F0
	adds r0, r5, #0
	movs r1, #4
	bl NewEfxFlashBgWhite
	movs r0, #0xa0
	b .L08051102
.L080510F0:
	adds r0, r4, #0
	adds r0, #0x29
	cmp r1, r0
	bne .L0805110A
	adds r0, r5, #0
	movs r1, #4
	bl NewEfxFlashBgWhite
	movs r0, #0x70
.L08051102:
	movs r1, #0
	bl func_fe6_08051050
	b .L080511B4
.L0805110A:
	adds r0, r4, #0
	adds r0, #0x3d
	cmp r1, r0
	bne .L0805113E
	adds r0, r5, #0
	movs r1, #4
	bl NewEfxFlashBgWhite
	movs r0, #0x10
	str r0, [sp]
	str r7, [sp, #4]
	adds r0, r5, #0
	movs r1, #3
	movs r2, #0xa
	movs r3, #0
	bl func_fe6_0804CD88
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
	adds r0, r1, #0
	movs r3, #1
	bl func_fe6_0805C804
	b .L080511B4
.L0805113E:
	adds r0, r4, #0
	adds r0, #0x5e
	cmp r1, r0
	bne .L08051184
	adds r0, r5, #0
	movs r1, #4
	bl NewEfxFlashBgWhite
	movs r0, #9
	ldrh r1, [r5, #0x10]
	orrs r0, r1
	strh r0, [r5, #0x10]
	adds r4, r6, #0
	adds r4, #0x29
	ldrb r1, [r4]
	adds r0, r5, #0
	bl StartBattleAnimHitEffectsDefault
	ldr r0, .L08051180 @ =0x00000101
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
	movs r3, #1
	bl func_fe6_0805C804
	ldrb r0, [r4]
	cmp r0, #0
	bne .L080511B4
	adds r0, r5, #0
	bl func_fe6_0805C358
	b .L080511B4
	.align 2, 0
.L08051180: .4byte 0x00000101
.L08051184:
	adds r0, r4, #0
	adds r0, #0x69
	cmp r1, r0
	bne .L0805119E
	str r7, [sp]
	str r7, [sp, #4]
	adds r0, r5, #0
	movs r1, #0
	movs r2, #0x14
	movs r3, #8
	bl func_fe6_0804CD88
	b .L080511B4
.L0805119E:
	adds r0, r4, #0
	adds r0, #0x71
	cmp r1, r0
	bne .L080511B4
	bl SpellFx_Finish
	bl func_fe6_08047358
	adds r0, r6, #0
	bl Proc_Break
.L080511B4:
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start func_fe6_080511BC
func_fe6_080511BC: @ 0x080511BC
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, .L080511F4 @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L080511F8 @ =gUnk_085D1D40
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, .L080511FC @ =gUnk_0811A302
	str r1, [r0, #0x48]
	ldr r1, .L08051200 @ =gUnk_085D1FC8
	str r1, [r0, #0x4c]
	str r1, [r0, #0x50]
	ldr r1, .L08051204 @ =gUnk_085D1D58
	str r1, [r0, #0x54]
	ldr r1, .L08051208 @ =gUnk_085D1E90
	str r1, [r0, #0x58]
	bl SpellFx_SetSomeColorEffect
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L080511F4: .4byte gEfxBgSemaphore
.L080511F8: .4byte gUnk_085D1D40
.L080511FC: .4byte gUnk_0811A302
.L08051200: .4byte gUnk_085D1FC8
.L08051204: .4byte gUnk_085D1D58
.L08051208: .4byte gUnk_085D1E90

	thumb_func_start func_fe6_0805120C
func_fe6_0805120C: @ 0x0805120C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	adds r0, #0x2c
	adds r1, r7, #0
	adds r1, #0x44
	ldr r2, [r7, #0x48]
	bl EfxAdvanceFrameLut
	lsls r0, r0, #0x10
	asrs r5, r0, #0x10
	cmp r5, #0
	blt .L0805125A
	ldr r6, [r7, #0x4c]
	ldr r0, [r7, #0x50]
	mov r8, r0
	ldr r0, [r7, #0x54]
	ldr r4, [r7, #0x58]
	lsls r5, r5, #2
	adds r0, r5, r0
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	adds r4, r5, r4
	ldr r0, [r4]
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	ldr r0, [r7, #0x5c]
	adds r6, r5, r6
	ldr r1, [r6]
	add r5, r8
	ldr r2, [r5]
	bl SpellFx_WriteBgMap
	b .L08051278
.L0805125A:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r5, r0
	bne .L08051278
	bl SpellFx_ClearBG1
	ldr r1, .L08051284 @ =gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_ClearColorEffects
	adds r0, r7, #0
	bl Proc_End
.L08051278:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08051284: .4byte gEfxBgSemaphore

	thumb_func_start func_fe6_08051288
func_fe6_08051288: @ 0x08051288
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, .L080512B4 @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L080512B8 @ =gUnk_085D2100
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r2, #0
	strh r2, [r0, #0x2c]
	movs r1, #7
	str r1, [r0, #0x44]
	strh r2, [r0, #0x2e]
	movs r1, #6
	str r1, [r0, #0x48]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L080512B4: .4byte gEfxBgSemaphore
.L080512B8: .4byte gUnk_085D2100

	thumb_func_start func_fe6_080512BC
func_fe6_080512BC: @ 0x080512BC
	push {r4, r5, lr}
	adds r5, r0, #0
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r1, [r5, #0x44]
	cmp r0, r1
	ble .L08051318
	movs r0, #0
	strh r0, [r5, #0x2c]
	ldr r2, .L08051320 @ =gUnk_085D2120
	movs r1, #0x2e
	ldrsh r0, [r5, r1]
	lsls r1, r0, #3
	adds r1, r1, r2
	ldr r4, [r1]
	lsls r0, r0, #1
	adds r0, #1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r2, [r0]
	ldr r0, [r5, #0x60]
	adds r1, r4, #0
	bl func_fe6_08051328
	adds r0, r4, #0
	movs r1, #1
	bl func_fe6_08051050
	ldrh r0, [r5, #0x2e]
	adds r0, #1
	strh r0, [r5, #0x2e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r1, [r5, #0x48]
	cmp r0, r1
	ble .L08051318
	ldr r1, .L08051324 @ =gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r5, #0
	bl Proc_Break
.L08051318:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08051320: .4byte gUnk_085D2120
.L08051324: .4byte gEfxBgSemaphore

	thumb_func_start func_fe6_08051328
func_fe6_08051328: @ 0x08051328
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #4
	adds r5, r0, #0
	adds r6, r1, #0
	mov r8, r2
	ldr r1, .L08051380 @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08051384 @ =gUnk_085D2158
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	ldr r3, .L08051388 @ =gUnk_085EDCC8
	str r3, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl EfxCreateFrontAnim
	str r0, [r4, #0x60]
	strh r6, [r0, #2]
	mov r1, r8
	strh r1, [r0, #4]
	ldr r0, .L0805138C @ =gUnk_081AB190
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, .L08051390 @ =gUnk_081AAECC
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08051380: .4byte gEfxBgSemaphore
.L08051384: .4byte gUnk_085D2158
.L08051388: .4byte gUnk_085EDCC8
.L0805138C: .4byte gUnk_081AB190
.L08051390: .4byte gUnk_081AAECC

	thumb_func_start func_fe6_08051394
func_fe6_08051394: @ 0x08051394
	push {lr}
	ldr r0, [r0, #0x60]
	bl BasRemove
	ldr r1, .L080513A8 @ =gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
.L080513A8: .4byte gEfxBgSemaphore

	thumb_func_start func_fe6_080513AC
func_fe6_080513AC: @ 0x080513AC
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl func_fe6_08047300
	bl SpellFx_SetBG1Position
	ldr r0, .L080513E4 @ =gUnk_085D2178
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r5, #0
	bl GetAnimRoundTypeAnotherSide
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl CheckRoundMiss
	adds r4, #0x29
	strb r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L080513E4: .4byte gUnk_085D2178

	thumb_func_start func_fe6_080513E8
func_fe6_080513E8: @ 0x080513E8
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r6, r0, #0
	ldr r0, [r6, #0x5c]
	bl GetAnimAnotherSide
	adds r5, r0, #0
	bl EfxGetCamMovDuration
	adds r4, r0, #0
	ldrh r0, [r6, #0x2c]
	adds r0, #1
	movs r7, #0
	strh r0, [r6, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne .L08051416
	ldr r0, [r6, #0x5c]
	movs r1, #1
	rsbs r1, r1, #0
	bl NewEfxFarAttackWithDistance
.L08051416:
	movs r0, #0x2c
	ldrsh r1, [r6, r0]
	adds r0, r4, #1
	cmp r1, r0
	bne .L08051448
	adds r0, r5, #0
	bl func_fe6_0805151C
	bl func_fe6_080516B8
	adds r0, r5, #0
	movs r1, #0xa0
	bl func_fe6_08051624
	ldr r0, .L08051444 @ =0x0000012D
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
	movs r3, #1
	bl func_fe6_0805C804
	b .L08051514
	.align 2, 0
.L08051444: .4byte 0x0000012D
.L08051448:
	adds r0, r4, #0
	adds r0, #0x5a
	cmp r1, r0
	bne .L0805146A
	adds r0, r5, #0
	movs r1, #0x3c
	bl func_fe6_08051720
	movs r0, #0x97
	lsls r0, r0, #1
	movs r1, #0x80
	lsls r1, r1, #1
	movs r2, #0x78
	movs r3, #0
	bl func_fe6_0805C804
	b .L08051514
.L0805146A:
	adds r0, r4, #0
	adds r0, #0xa0
	cmp r1, r0
	bne .L0805147C
	ldr r0, [r6, #0x5c]
	movs r1, #3
	bl NewEfxFlashBgRed
	b .L08051514
.L0805147C:
	adds r0, r4, #0
	adds r0, #0xa3
	cmp r1, r0
	bne .L080514F4
	adds r0, r5, #0
	movs r1, #0x64
	bl func_fe6_0804D050
	adds r0, r5, #0
	movs r1, #0x64
	bl func_fe6_08051870
	str r7, [sp]
	str r7, [sp, #4]
	adds r0, r5, #0
	movs r1, #0x50
	movs r2, #0x14
	movs r3, #0x10
	bl func_fe6_0804CD88
	ldr r2, .L080514EC @ =func_fe6_08051C00
	adds r0, r5, #0
	movs r1, #0x64
	bl func_fe6_0804CC68
	movs r0, #0x64
	bl func_fe6_08051C30
	adds r0, r5, #0
	bl func_fe6_08051A14
	ldr r0, .L080514F0 @ =0x0000012F
	movs r1, #0x80
	lsls r1, r1, #1
	movs r2, #0x78
	movs r3, #0
	bl func_fe6_0805C804
	movs r0, #9
	ldrh r1, [r5, #0x10]
	orrs r0, r1
	strh r0, [r5, #0x10]
	adds r4, r6, #0
	adds r4, #0x29
	ldrb r1, [r4]
	adds r0, r5, #0
	bl StartBattleAnimHitEffectsDefault
	ldrb r0, [r4]
	cmp r0, #0
	bne .L08051514
	adds r0, r5, #0
	bl func_fe6_0805C358
	b .L08051514
	.align 2, 0
.L080514EC: .4byte func_fe6_08051C00
.L080514F0: .4byte 0x0000012F
.L080514F4:
	adds r0, r4, #0
	adds r0, #0xfa
	cmp r1, r0
	beq .L08051514
	movs r2, #0x82
	lsls r2, r2, #1
	adds r0, r4, r2
	cmp r1, r0
	bne .L08051514
	bl SpellFx_Finish
	bl func_fe6_08047358
	adds r0, r6, #0
	bl Proc_Break
.L08051514:
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start func_fe6_0805151C
func_fe6_0805151C: @ 0x0805151C
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, .L08051570 @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08051574 @ =gUnk_085D2190
	movs r1, #3
	bl SpawnProc
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	str r0, [r5, #0x44]
	ldr r0, .L08051578 @ =gUnk_0811A478
	str r0, [r5, #0x48]
	ldr r0, .L0805157C @ =gUnk_085D21A8
	str r0, [r5, #0x4c]
	str r0, [r5, #0x50]
	ldr r0, .L08051580 @ =gUnk_085D21DC
	str r0, [r5, #0x54]
	ldr r0, .L08051584 @ =gUnk_081408CC
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	ldr r0, .L08051588 @ =gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq .L08051596
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne .L0805158C
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl SetBgOffset
	b .L08051596
	.align 2, 0
.L08051570: .4byte gEfxBgSemaphore
.L08051574: .4byte gUnk_085D2190
.L08051578: .4byte gUnk_0811A478
.L0805157C: .4byte gUnk_085D21A8
.L08051580: .4byte gUnk_085D21DC
.L08051584: .4byte gUnk_081408CC
.L08051588: .4byte gEkrDistanceType
.L0805158C:
	movs r0, #1
	movs r1, #0xe8
	movs r2, #0
	bl SetBgOffset
.L08051596:
	bl SpellFx_SetSomeColorEffect
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start func_fe6_080515A0
func_fe6_080515A0: @ 0x080515A0
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r7, r0, #0
	adds r0, #0x2c
	adds r1, r7, #0
	adds r1, #0x44
	ldr r2, [r7, #0x48]
	bl EfxAdvanceFrameLut
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	cmp r4, #0
	blt .L080515F8
	ldr r5, [r7, #0x4c]
	ldr r6, [r7, #0x50]
	ldr r0, [r7, #0x54]
	lsls r4, r4, #2
	adds r0, r4, r0
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	ldr r0, [r7, #0x5c]
	adds r5, r4, r5
	ldr r1, [r5]
	adds r4, r4, r6
	ldr r2, [r4]
	bl SpellFx_WriteBgMap
	ldr r0, .L080515F0 @ =gBg1Tm+0x3C
	ldr r1, .L080515F4 @ =0x0000011F
	str r1, [sp]
	movs r1, #2
	movs r2, #0x14
	movs r3, #1
	bl FillBGRect
	b .L08051616
	.align 2, 0
.L080515F0: .4byte gBg1Tm+0x3C
.L080515F4: .4byte 0x0000011F
.L080515F8:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r4, r0
	bne .L08051616
	bl SpellFx_ClearBG1
	ldr r1, .L08051620 @ =gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_ClearColorEffects
	adds r0, r7, #0
	bl Proc_Break
.L08051616:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08051620: .4byte gEfxBgSemaphore

	thumb_func_start func_fe6_08051624
func_fe6_08051624: @ 0x08051624
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, .L0805165C @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08051660 @ =gUnk_085D2210
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x2e]
	strh r5, [r0, #0x30]
	str r1, [r0, #0x44]
	ldr r1, .L08051664 @ =gUnk_0811A50E
	str r1, [r0, #0x48]
	ldr r1, .L08051668 @ =gUnk_081408CC
	str r1, [r0, #0x4c]
	adds r0, r1, #0
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0805165C: .4byte gEfxBgSemaphore
.L08051660: .4byte gUnk_085D2210
.L08051664: .4byte gUnk_0811A50E
.L08051668: .4byte gUnk_081408CC

	thumb_func_start func_fe6_0805166C
func_fe6_0805166C: @ 0x0805166C
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
	blt .L08051690
	ldr r0, [r4, #0x4c]
	lsls r1, r1, #5
	adds r0, r0, r1
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
.L08051690:
	ldrh r0, [r4, #0x2e]
	adds r0, #1
	strh r0, [r4, #0x2e]
	lsls r0, r0, #0x10
	ldrh r2, [r4, #0x30]
	lsls r1, r2, #0x10
	cmp r0, r1
	bne .L080516AE
	ldr r1, .L080516B4 @ =gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
.L080516AE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L080516B4: .4byte gEfxBgSemaphore

	thumb_func_start func_fe6_080516B8
func_fe6_080516B8: @ 0x080516B8
	push {lr}
	ldr r0, .L080516D0 @ =gEfxBgSemaphore
	ldr r1, [r0]
	adds r1, #1
	str r1, [r0]
	ldr r0, .L080516D4 @ =gUnk_085D2230
	movs r1, #3
	bl SpawnProc
	pop {r0}
	bx r0
	.align 2, 0
.L080516D0: .4byte gEfxBgSemaphore
.L080516D4: .4byte gUnk_085D2230

	thumb_func_start func_fe6_080516D8
func_fe6_080516D8: @ 0x080516D8
	push {lr}
	ldr r2, .L080516E8 @ =gDispIo
	movs r1, #8
	strh r1, [r2, #0x22]
	bl Proc_Break
	pop {r0}
	bx r0
	.align 2, 0
.L080516E8: .4byte gDispIo

	thumb_func_start func_fe6_080516EC
func_fe6_080516EC: @ 0x080516EC
	push {lr}
	ldr r2, .L080516FC @ =gDispIo
	movs r1, #0x10
	strh r1, [r2, #0x22]
	bl Proc_Break
	pop {r0}
	bx r0
	.align 2, 0
.L080516FC: .4byte gDispIo

	thumb_func_start func_fe6_08051700
func_fe6_08051700: @ 0x08051700
	push {lr}
	ldr r2, .L08051718 @ =gDispIo
	movs r1, #0x18
	strh r1, [r2, #0x22]
	ldr r2, .L0805171C @ =gEfxBgSemaphore
	ldr r1, [r2]
	subs r1, #1
	str r1, [r2]
	bl Proc_Break
	pop {r0}
	bx r0
	.align 2, 0
.L08051718: .4byte gDispIo
.L0805171C: .4byte gEfxBgSemaphore

	thumb_func_start func_fe6_08051720
func_fe6_08051720: @ 0x08051720
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, .L08051760 @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08051764 @ =gUnk_085D2270
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r2, #0
	strh r2, [r0, #0x2c]
	strh r5, [r0, #0x2e]
	strh r2, [r0, #0x30]
	movs r1, #1
	str r1, [r0, #0x44]
	str r2, [r0, #0x48]
	ldr r0, .L08051768 @ =gUnk_08143EE4
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	ldr r0, .L0805176C @ =gUnk_08144A00
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08051760: .4byte gEfxBgSemaphore
.L08051764: .4byte gUnk_085D2270
.L08051768: .4byte gUnk_08143EE4
.L0805176C: .4byte gUnk_08144A00

	thumb_func_start func_fe6_08051770
func_fe6_08051770: @ 0x08051770
	push {r4, lr}
	adds r3, r0, #0
	ldrh r0, [r3, #0x2c]
	adds r0, #1
	movs r2, #0
	strh r0, [r3, #0x2c]
	lsls r0, r0, #0x10
	ldrh r4, [r3, #0x2e]
	lsls r1, r4, #0x10
	cmp r0, r1
	bne .L0805179C
	ldr r1, .L08051798 @ =gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r3, #0
	bl Proc_Break
	b .L080517DA
	.align 2, 0
.L08051798: .4byte gEfxBgSemaphore
.L0805179C:
	ldrh r0, [r3, #0x30]
	adds r0, #1
	strh r0, [r3, #0x30]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r1, [r3, #0x44]
	cmp r0, r1
	bne .L080517DA
	strh r2, [r3, #0x30]
	movs r0, #2
	str r0, [r3, #0x44]
	ldr r4, .L080517E0 @ =gUnk_085D2288
	ldr r0, [r3, #0x48]
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r1, [r0]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne .L080517C6
	str r2, [r3, #0x48]
.L080517C6:
	ldr r2, [r3, #0x48]
	lsls r0, r2, #2
	adds r0, r0, r4
	ldr r1, [r0]
	adds r2, #1
	str r2, [r3, #0x48]
	ldr r0, [r3, #0x5c]
	movs r2, #0x50
	bl func_fe6_080517E4
.L080517DA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L080517E0: .4byte gUnk_085D2288

	thumb_func_start func_fe6_080517E4
func_fe6_080517E4: @ 0x080517E4
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #4
	adds r5, r0, #0
	adds r6, r1, #0
	mov r8, r2
	ldr r1, .L08051830 @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08051834 @ =gUnk_085D22E0
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #0xc
	strh r0, [r4, #0x2e]
	ldr r3, .L08051838 @ =gUnk_085E5C10
	str r3, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl EfxCreateFrontAnim
	str r0, [r4, #0x60]
	strh r6, [r0, #2]
	mov r1, r8
	strh r1, [r0, #4]
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08051830: .4byte gEfxBgSemaphore
.L08051834: .4byte gUnk_085D22E0
.L08051838: .4byte gUnk_085E5C10

	thumb_func_start func_fe6_0805183C
func_fe6_0805183C: @ 0x0805183C
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r4, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	ble .L08051864
	ldr r0, .L0805186C @ =gEfxBgSemaphore
	ldr r1, [r0]
	subs r1, #1
	str r1, [r0]
	ldr r0, [r4, #0x60]
	bl BasRemove
	adds r0, r4, #0
	bl Proc_Break
.L08051864:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0805186C: .4byte gEfxBgSemaphore

	thumb_func_start func_fe6_08051870
func_fe6_08051870: @ 0x08051870
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, .L080518E0 @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L080518E4 @ =gUnk_085D22F8
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r5, [r0, #0x2e]
	strh r1, [r0, #0x30]
	ldr r0, .L080518E8 @ =gUnk_08141320
	ldr r1, .L080518EC @ =gSpellAnimBgfx
	bl LZ77UnCompWram
	ldr r0, .L080518F0 @ =gUnk_08142EAC
	ldr r1, .L080518F4 @ =gBuf_Banim + 0x1000
	bl LZ77UnCompWram
	ldr r0, .L080518F8 @ =gUnk_08143AB8
	ldr r4, .L080518FC @ =gEkrTsaBuffer
	adds r1, r4, #0
	bl LZ77UnCompWram
	ldr r0, .L08051900 @ =gUnk_08143DA8
	movs r1, #0x80
	lsls r1, r1, #4
	adds r4, r4, r1
	adds r1, r4, #0
	bl LZ77UnCompWram
	movs r0, #2
	bl EnableBgSync
	bl SpellFx_SetSomeColorEffect
	ldr r2, .L08051904 @ =gDispIo
	movs r0, #0x21
	rsbs r0, r0, #0
	ldrb r1, [r2, #1]
	ands r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r2, #1]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L080518E0: .4byte gEfxBgSemaphore
.L080518E4: .4byte gUnk_085D22F8
.L080518E8: .4byte gUnk_08141320
.L080518EC: .4byte gSpellAnimBgfx
.L080518F0: .4byte gUnk_08142EAC
.L080518F4: .4byte gBuf_Banim + 0x1000
.L080518F8: .4byte gUnk_08143AB8
.L080518FC: .4byte gEkrTsaBuffer
.L08051900: .4byte gUnk_08143DA8
.L08051904: .4byte gDispIo

	thumb_func_start func_fe6_08051908
func_fe6_08051908: @ 0x08051908
	push {r4, r5, lr}
	sub sp, #8
	adds r4, r0, #0
	movs r5, #1
	adds r0, r5, #0
	ldrh r1, [r4, #0x2c]
	ands r0, r1
	cmp r0, #0
	bne .L080519A0
	movs r2, #0x30
	ldrsh r0, [r4, r2]
	cmp r0, #1
	beq .L0805193C
	cmp r0, #1
	bgt .L0805192C
	cmp r0, #0
	beq .L08051932
	b .L0805194C
.L0805192C:
	cmp r0, #2
	beq .L08051944
	b .L0805194C
.L08051932:
	ldr r0, .L08051938 @ =gUnk_08143A38
	b .L0805194E
	.align 2, 0
.L08051938: .4byte gUnk_08143A38
.L0805193C:
	ldr r0, .L08051940 @ =gUnk_08143A58
	b .L0805194E
	.align 2, 0
.L08051940: .4byte gUnk_08143A58
.L08051944:
	ldr r0, .L08051948 @ =gUnk_08143A78
	b .L0805194E
	.align 2, 0
.L08051948: .4byte gUnk_08143A78
.L0805194C:
	movs r0, #0
.L0805194E:
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	ldrh r0, [r4, #0x30]
	adds r0, #1
	strh r0, [r4, #0x30]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #3
	bne .L08051966
	movs r0, #0
	strh r0, [r4, #0x30]
.L08051966:
	ldr r0, .L08051990 @ =gSpellAnimBgfx
	ldr r1, .L08051994 @ =0x06002000
	movs r2, #0x80
	lsls r2, r2, #6
	bl RegisterDataMove
	ldr r0, .L08051998 @ =gEkrTsaBuffer
	ldr r1, .L0805199C @ =gBg1Tm
	movs r2, #1
	str r2, [sp]
	adds r2, #0xff
	str r2, [sp, #4]
	movs r2, #0x20
	movs r3, #0x10
	bl EfxTmCpyBG
	movs r0, #2
	bl EnableBgSync
	b .L080519CE
	.align 2, 0
.L08051990: .4byte gSpellAnimBgfx
.L08051994: .4byte 0x06002000
.L08051998: .4byte gEkrTsaBuffer
.L0805199C: .4byte gBg1Tm
.L080519A0:
	ldr r0, .L080519FC @ =gUnk_08143A98
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	ldr r0, .L08051A00 @ =gBuf_Banim + 0x1000
	ldr r1, .L08051A04 @ =0x06002000
	movs r2, #0x80
	lsls r2, r2, #5
	bl RegisterDataMove
	ldr r0, .L08051A08 @ =gEkrTsaBuffer + 0x800
	ldr r1, .L08051A0C @ =gBg1Tm
	str r5, [sp]
	movs r2, #0x80
	lsls r2, r2, #1
	str r2, [sp, #4]
	movs r2, #0x20
	movs r3, #0x10
	bl EfxTmCpyBG
	movs r0, #2
	bl EnableBgSync
.L080519CE:
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r4, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	bne .L080519F4
	bl SpellFx_ClearBG1
	ldr r1, .L08051A10 @ =gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_ClearColorEffects
	adds r0, r4, #0
	bl Proc_End
.L080519F4:
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L080519FC: .4byte gUnk_08143A98
.L08051A00: .4byte gBuf_Banim + 0x1000
.L08051A04: .4byte 0x06002000
.L08051A08: .4byte gEkrTsaBuffer + 0x800
.L08051A0C: .4byte gBg1Tm
.L08051A10: .4byte gEfxBgSemaphore

	thumb_func_start func_fe6_08051A14
func_fe6_08051A14: @ 0x08051A14
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, .L08051A50 @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08051A54 @ =gUnk_085D2310
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r2, #0
	strh r2, [r0, #0x2c]
	strh r2, [r0, #0x2e]
	movs r1, #2
	str r1, [r0, #0x44]
	str r2, [r0, #0x48]
	ldr r0, .L08051A58 @ =gUnk_08143EE4
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	ldr r0, .L08051A5C @ =gUnk_08144A00
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08051A50: .4byte gEfxBgSemaphore
.L08051A54: .4byte gUnk_085D2310
.L08051A58: .4byte gUnk_08143EE4
.L08051A5C: .4byte gUnk_08144A00

	thumb_func_start func_fe6_08051A60
func_fe6_08051A60: @ 0x08051A60
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x41
	bne .L08051A88
	ldr r1, .L08051A84 @ =gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
	b .L08051ABC
	.align 2, 0
.L08051A84: .4byte gEfxBgSemaphore
.L08051A88:
	ldrh r0, [r4, #0x2e]
	adds r0, #1
	strh r0, [r4, #0x2e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r1, [r4, #0x44]
	cmp r0, r1
	bne .L08051ABC
	movs r0, #0
	strh r0, [r4, #0x2e]
	movs r0, #2
	str r0, [r4, #0x44]
	ldr r0, [r4, #0x5c]
	ldr r2, [r4, #0x48]
	adds r1, r2, #0
	adds r2, #1
	str r2, [r4, #0x48]
	bl func_fe6_08051AC4
	ldr r0, [r4, #0x5c]
	ldr r2, [r4, #0x48]
	adds r1, r2, #0
	adds r2, #1
	str r2, [r4, #0x48]
	bl func_fe6_08051AC4
.L08051ABC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_fe6_08051AC4
func_fe6_08051AC4: @ 0x08051AC4
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, .L08051B1C @ =gUnk_0811A520
	mov r0, sp
	movs r2, #0x10
	bl memcpy
	ldr r1, .L08051B20 @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08051B24 @ =gUnk_085D2328
	movs r1, #3
	bl SpawnProc
	adds r6, r0, #0
	str r4, [r6, #0x5c]
	movs r4, #0
	strh r4, [r6, #0x2c]
	movs r0, #7
	ands r0, r5
	lsls r0, r0, #1
	add r0, sp
	ldrh r0, [r0]
	strh r0, [r6, #0x2e]
	movs r0, #0xe0
	bl func_fe6_0805B9C8
	adds r0, #8
	strh r0, [r6, #0x32]
	strh r4, [r6, #0x3a]
	movs r0, #9
	bl func_fe6_0805B9C8
	cmp r0, #9
	bhi .L08051B78
	lsls r0, r0, #2
	ldr r1, .L08051B28 @ =.L08051B2C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
.L08051B1C: .4byte gUnk_0811A520
.L08051B20: .4byte gEfxBgSemaphore
.L08051B24: .4byte gUnk_085D2328
.L08051B28: .4byte .L08051B2C
.L08051B2C: @ jump table
	.4byte .L08051B54 @ case 0
	.4byte .L08051B54 @ case 1
	.4byte .L08051B54 @ case 2
	.4byte .L08051B54 @ case 3
	.4byte .L08051B54 @ case 4
	.4byte .L08051B54 @ case 5
	.4byte .L08051B54 @ case 6
	.4byte .L08051B5C @ case 7
	.4byte .L08051B64 @ case 8
	.4byte .L08051B6C @ case 9
.L08051B54:
	ldr r0, .L08051B58 @ =gUnk_085E5C44
	b .L08051B6E
	.align 2, 0
.L08051B58: .4byte gUnk_085E5C44
.L08051B5C:
	ldr r0, .L08051B60 @ =gUnk_085E5C3C
	b .L08051B6E
	.align 2, 0
.L08051B60: .4byte gUnk_085E5C3C
.L08051B64:
	ldr r0, .L08051B68 @ =gUnk_085E5C34
	b .L08051B6E
	.align 2, 0
.L08051B68: .4byte gUnk_085E5C34
.L08051B6C:
	ldr r0, .L08051B8C @ =gUnk_085E5C2C
.L08051B6E:
	movs r1, #0x78
	bl BasCreate
	adds r4, r0, #0
	str r4, [r6, #0x60]
.L08051B78:
	cmp r4, #0
	bne .L08051B94
	ldr r1, .L08051B90 @ =gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r6, #0
	bl Proc_End
	b .L08051BA2
	.align 2, 0
.L08051B8C: .4byte gUnk_085E5C2C
.L08051B90: .4byte gEfxBgSemaphore
.L08051B94:
	movs r0, #0x91
	lsls r0, r0, #6
	strh r0, [r4, #8]
	ldrh r0, [r6, #0x32]
	strh r0, [r4, #2]
	ldrh r0, [r6, #0x3a]
	strh r0, [r4, #4]
.L08051BA2:
	add sp, #0x10
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_fe6_08051BAC
func_fe6_08051BAC: @ 0x08051BAC
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r5, [r4, #0x60]
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	movs r2, #0x2e
	ldrsh r0, [r4, r2]
	cmp r1, r0
	ble .L08051BDC
	ldr r1, .L08051BD8 @ =gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r5, #0
	bl BasRemove
	adds r0, r4, #0
	bl Proc_Break
	b .L08051BF8
	.align 2, 0
.L08051BD8: .4byte gEfxBgSemaphore
.L08051BDC:
	movs r0, #0x2c
	ldrsh r3, [r4, r0]
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	str r0, [sp]
	movs r0, #1
	movs r1, #0x78
	movs r2, #8
	bl Interpolate
	strh r0, [r5, #4]
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
.L08051BF8:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start func_fe6_08051C00
func_fe6_08051C00: @ 0x08051C00
	ldr r0, .L08051C24 @ =0x04000004
	ldrh r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne .L08051C20
	ldr r2, .L08051C28 @ =0x04000014
	ldr r3, .L08051C2C @ =gUnk_Banim_0201E154
	ldr r1, [r3]
	ldrh r0, [r1]
	strh r0, [r2]
	adds r2, #2
	ldrh r0, [r1]
	strh r0, [r2]
	adds r1, #2
	str r1, [r3]
.L08051C20:
	bx lr
	.align 2, 0
.L08051C24: .4byte 0x04000004
.L08051C28: .4byte 0x04000014
.L08051C2C: .4byte gUnk_Banim_0201E154

	thumb_func_start func_fe6_08051C30
func_fe6_08051C30: @ 0x08051C30
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, .L08051C54 @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08051C58 @ =gUnk_085D2340
	movs r1, #3
	bl SpawnProc
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r4, [r0, #0x2e]
	strh r1, [r0, #0x30]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08051C54: .4byte gEfxBgSemaphore
.L08051C58: .4byte gUnk_085D2340

	thumb_func_start func_fe6_08051C5C
func_fe6_08051C5C: @ 0x08051C5C
	push {r4, r5, r6, r7, lr}
	adds r3, r0, #0
	ldr r0, .L08051CBC @ =gUnk_Banim_0201E3D8
	ldr r0, [r0]
	ldr r4, .L08051CC0 @ =gUnk_Banim_0201E158
	cmp r0, #0
	bne .L08051C6C
	ldr r4, .L08051CC4 @ =gUnk_Banim_0201E298
.L08051C6C:
	movs r2, #0
	ldr r6, .L08051CC8 @ =gSinLut
	movs r5, #0xff
.L08051C72:
	lsls r0, r2, #1
	movs r7, #0x30
	ldrsh r1, [r3, r7]
	adds r0, r0, r1
	ands r0, r5
	lsls r0, r0, #1
	adds r0, r0, r6
	movs r1, #0
	ldrsh r0, [r0, r1]
	asrs r0, r0, #0xa
	adds r0, #4
	strh r0, [r4]
	adds r4, #2
	adds r2, #1
	cmp r2, #0x9f
	bls .L08051C72
	ldrh r0, [r3, #0x30]
	adds r0, #2
	strh r0, [r3, #0x30]
	ldrh r0, [r3, #0x2c]
	adds r0, #1
	strh r0, [r3, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r3, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	ble .L08051CB6
	ldr r1, .L08051CCC @ =gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r3, #0
	bl Proc_Break
.L08051CB6:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08051CBC: .4byte gUnk_Banim_0201E3D8
.L08051CC0: .4byte gUnk_Banim_0201E158
.L08051CC4: .4byte gUnk_Banim_0201E298
.L08051CC8: .4byte gSinLut
.L08051CCC: .4byte gEfxBgSemaphore

	thumb_func_start func_fe6_08051CD0
func_fe6_08051CD0: @ 0x08051CD0
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl func_fe6_08047300
	bl SpellFx_SetBG1Position
	ldr r0, .L08051D08 @ =gUnk_085D2358
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r5, #0
	bl GetAnimRoundTypeAnotherSide
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl CheckRoundMiss
	adds r4, #0x29
	strb r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08051D08: .4byte gUnk_085D2358

	thumb_func_start func_fe6_08051D0C
func_fe6_08051D0C: @ 0x08051D0C
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetAnimAnotherSide
	adds r5, r0, #0
	bl EfxGetCamMovDuration
	adds r3, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	cmp r2, #1
	bne .L08051D50
	ldr r0, .L08051D4C @ =0x00000127
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r2, [r4, #0x5c]
	movs r3, #2
	ldrsh r2, [r2, r3]
	movs r3, #1
	bl func_fe6_0805C804
	adds r0, r5, #0
	bl func_fe6_08051DFC
	ldr r0, [r4, #0x5c]
	bl func_fe6_08051FEC
	b .L08051DF6
	.align 2, 0
.L08051D4C: .4byte 0x00000127
.L08051D50:
	cmp r2, #0x14
	bne .L08051D64
	movs r0, #0x94
	lsls r0, r0, #1
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r2, [r4, #0x5c]
	movs r3, #2
	ldrsh r2, [r2, r3]
	b .L08051D90
.L08051D64:
	cmp r2, #0x32
	bne .L08051D74
	ldr r0, [r4, #0x5c]
	movs r1, #1
	rsbs r1, r1, #0
	bl NewEfxFarAttackWithDistance
	b .L08051DF6
.L08051D74:
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	adds r0, r3, #0
	adds r0, #0x46
	cmp r1, r0
	bne .L08051D9C
	adds r0, r5, #0
	bl func_fe6_08051E80
	ldr r0, .L08051D98 @ =0x00000129
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
.L08051D90:
	movs r3, #1
	bl func_fe6_0805C804
	b .L08051DF6
	.align 2, 0
.L08051D98: .4byte 0x00000129
.L08051D9C:
	adds r0, r3, #0
	adds r0, #0x49
	cmp r1, r0
	bne .L08051DAE
	ldr r0, [r4, #0x5c]
	movs r1, #0xa
	bl NewEfxFlashBgWhite
	b .L08051DF6
.L08051DAE:
	adds r0, r3, #0
	adds r0, #0x4b
	cmp r1, r0
	bne .L08051DDC
	adds r0, r5, #0
	bl func_fe6_08051F04
	movs r0, #9
	ldrh r1, [r5, #0x10]
	orrs r0, r1
	strh r0, [r5, #0x10]
	adds r4, #0x29
	ldrb r1, [r4]
	adds r0, r5, #0
	bl StartBattleAnimHitEffectsDefault
	ldrb r0, [r4]
	cmp r0, #0
	bne .L08051DF6
	adds r0, r5, #0
	bl func_fe6_0805C358
	b .L08051DF6
.L08051DDC:
	adds r0, r3, #0
	adds r0, #0x5a
	cmp r1, r0
	beq .L08051DF6
	cmp r2, #0x64
	bne .L08051DF6
	bl SpellFx_Finish
	bl func_fe6_08047358
	adds r0, r4, #0
	bl Proc_Break
.L08051DF6:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start func_fe6_08051DFC
func_fe6_08051DFC: @ 0x08051DFC
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, .L08051E50 @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08051E54 @ =gUnk_085D2370
	movs r1, #3
	bl SpawnProc
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	str r0, [r5, #0x44]
	ldr r0, .L08051E58 @ =gUnk_0811A530
	str r0, [r5, #0x48]
	ldr r0, .L08051E5C @ =gUnk_085D23D8
	str r0, [r5, #0x4c]
	str r0, [r5, #0x50]
	ldr r0, .L08051E60 @ =gUnk_085D2388
	str r0, [r5, #0x54]
	ldr r0, .L08051E64 @ =gUnk_08176A6C
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	ldr r0, .L08051E68 @ =gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq .L08051E76
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne .L08051E6C
	movs r0, #1
	movs r1, #0xe8
	movs r2, #0
	bl SetBgOffset
	b .L08051E76
	.align 2, 0
.L08051E50: .4byte gEfxBgSemaphore
.L08051E54: .4byte gUnk_085D2370
.L08051E58: .4byte gUnk_0811A530
.L08051E5C: .4byte gUnk_085D23D8
.L08051E60: .4byte gUnk_085D2388
.L08051E64: .4byte gUnk_08176A6C
.L08051E68: .4byte gEkrDistanceType
.L08051E6C:
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl SetBgOffset
.L08051E76:
	bl SpellFx_SetSomeColorEffect
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start func_fe6_08051E80
func_fe6_08051E80: @ 0x08051E80
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, .L08051ED4 @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08051ED8 @ =gUnk_085D2370
	movs r1, #3
	bl SpawnProc
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	str r0, [r5, #0x44]
	ldr r0, .L08051EDC @ =gUnk_0811A59E
	str r0, [r5, #0x48]
	ldr r0, .L08051EE0 @ =gUnk_085D2434
	str r0, [r5, #0x4c]
	str r0, [r5, #0x50]
	ldr r0, .L08051EE4 @ =gUnk_085D2428
	str r0, [r5, #0x54]
	ldr r0, .L08051EE8 @ =gUnk_08176A6C
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	ldr r0, .L08051EEC @ =gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq .L08051EFA
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne .L08051EF0
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl SetBgOffset
	b .L08051EFA
	.align 2, 0
.L08051ED4: .4byte gEfxBgSemaphore
.L08051ED8: .4byte gUnk_085D2370
.L08051EDC: .4byte gUnk_0811A59E
.L08051EE0: .4byte gUnk_085D2434
.L08051EE4: .4byte gUnk_085D2428
.L08051EE8: .4byte gUnk_08176A6C
.L08051EEC: .4byte gEkrDistanceType
.L08051EF0:
	movs r0, #1
	movs r1, #0xe8
	movs r2, #0
	bl SetBgOffset
.L08051EFA:
	bl SpellFx_SetSomeColorEffect
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start func_fe6_08051F04
func_fe6_08051F04: @ 0x08051F04
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, .L08051F58 @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08051F5C @ =gUnk_085D2370
	movs r1, #3
	bl SpawnProc
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	str r0, [r5, #0x44]
	ldr r0, .L08051F60 @ =gUnk_0811A5AC
	str r0, [r5, #0x48]
	ldr r0, .L08051F64 @ =gUnk_085D2494
	str r0, [r5, #0x4c]
	str r0, [r5, #0x50]
	ldr r0, .L08051F68 @ =gUnk_085D2440
	str r0, [r5, #0x54]
	ldr r0, .L08051F6C @ =gUnk_08176A4C
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	ldr r0, .L08051F70 @ =gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq .L08051F7E
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne .L08051F74
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl SetBgOffset
	b .L08051F7E
	.align 2, 0
.L08051F58: .4byte gEfxBgSemaphore
.L08051F5C: .4byte gUnk_085D2370
.L08051F60: .4byte gUnk_0811A5AC
.L08051F64: .4byte gUnk_085D2494
.L08051F68: .4byte gUnk_085D2440
.L08051F6C: .4byte gUnk_08176A4C
.L08051F70: .4byte gEkrDistanceType
.L08051F74:
	movs r0, #1
	movs r1, #0xe8
	movs r2, #0
	bl SetBgOffset
.L08051F7E:
	bl SpellFx_SetSomeColorEffect
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start func_fe6_08051F88
func_fe6_08051F88: @ 0x08051F88
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r0, #0x2c
	adds r1, r7, #0
	adds r1, #0x44
	ldr r2, [r7, #0x48]
	bl EfxAdvanceFrameLut
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	cmp r4, #0
	blt .L08051FC4
	ldr r5, [r7, #0x4c]
	ldr r6, [r7, #0x50]
	ldr r0, [r7, #0x54]
	lsls r4, r4, #2
	adds r0, r4, r0
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	ldr r0, [r7, #0x5c]
	adds r5, r4, r5
	ldr r1, [r5]
	adds r4, r4, r6
	ldr r2, [r4]
	bl SpellFx_WriteBgMap
	b .L08051FE2
.L08051FC4:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r4, r0
	bne .L08051FE2
	bl SpellFx_ClearBG1
	ldr r1, .L08051FE8 @ =gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_ClearColorEffects
	adds r0, r7, #0
	bl Proc_Break
.L08051FE2:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08051FE8: .4byte gEfxBgSemaphore

	thumb_func_start func_fe6_08051FEC
func_fe6_08051FEC: @ 0x08051FEC
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, .L0805202C @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08052030 @ =gUnk_085D24E8
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	ldr r3, .L08052034 @ =gUnk_085EB83C
	str r3, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl EfxCreateFrontAnim
	adds r6, r0, #0
	str r6, [r4, #0x60]
	adds r0, r5, #0
	bl GetAnimPosition
	cmp r0, #0
	bne .L08052038
	ldrh r0, [r6, #2]
	subs r0, #6
	b .L0805203C
	.align 2, 0
.L0805202C: .4byte gEfxBgSemaphore
.L08052030: .4byte gUnk_085D24E8
.L08052034: .4byte gUnk_085EB83C
.L08052038:
	ldrh r0, [r6, #2]
	adds r0, #6
.L0805203C:
	strh r0, [r6, #2]
	ldr r0, .L08052058 @ =gUnk_0817AC2C
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, .L0805205C @ =gUnk_0817AAC0
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08052058: .4byte gUnk_0817AC2C
.L0805205C: .4byte gUnk_0817AAC0

	thumb_func_start func_fe6_08052060
func_fe6_08052060: @ 0x08052060
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x2c
	bne .L08052086
	ldr r0, [r4, #0x60]
	bl BasRemove
	ldr r1, .L0805208C @ =gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
.L08052086:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0805208C: .4byte gEfxBgSemaphore

	thumb_func_start func_fe6_08052090
func_fe6_08052090: @ 0x08052090
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl func_fe6_08047300
	bl SpellFx_SetBG1Position
	ldr r0, .L080520C8 @ =gUnk_085D2500
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r5, #0
	bl GetAnimRoundTypeAnotherSide
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl CheckRoundMiss
	adds r4, #0x29
	strb r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L080520C8: .4byte gUnk_085D2500

	thumb_func_start func_fe6_080520CC
func_fe6_080520CC: @ 0x080520CC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetAnimAnotherSide
	adds r5, r0, #0
	bl EfxGetCamMovDuration
	adds r6, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	movs r7, #0
	movs r1, #0
	mov r8, r1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne .L08052100
	ldr r0, [r4, #0x5c]
	subs r1, #1
	bl NewEfxFarAttackWithDistance
.L08052100:
	movs r2, #0x2c
	ldrsh r1, [r4, r2]
	adds r0, r6, #1
	cmp r1, r0
	bne .L08052158
	adds r0, r5, #0
	bl func_fe6_08052238
	ldr r3, .L08052154 @ =gDispIo
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
	strb r7, [r0]
	adds r0, #1
	movs r1, #0x10
	strb r1, [r0]
	adds r0, #1
	strb r7, [r0]
	str r1, [sp]
	mov r2, r8
	str r2, [sp, #4]
	adds r0, r5, #0
	movs r1, #0
	movs r2, #0x20
	movs r3, #0
	bl func_fe6_0804CD88
	adds r0, r5, #0
	movs r1, #0xaa
	bl func_fe6_080524F4
	movs r0, #0x95
	lsls r0, r0, #1
	b .L08052162
	.align 2, 0
.L08052154: .4byte gDispIo
.L08052158:
	ldr r2, .L08052174 @ =0x0000011B
	adds r0, r6, r2
	cmp r1, r0
	bne .L0805217C
	ldr r0, .L08052178 @ =0x0000012B
.L08052162:
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
	movs r3, #1
	bl func_fe6_0805C804
	b .L0805222A
	.align 2, 0
.L08052174: .4byte 0x0000011B
.L08052178: .4byte 0x0000012B
.L0805217C:
	ldr r2, .L08052190 @ =0x0000013B
	adds r0, r6, r2
	cmp r1, r0
	bne .L08052194
	adds r0, r5, #0
	movs r1, #0x19
	bl func_fe6_080526F4
	b .L0805222A
	.align 2, 0
.L08052190: .4byte 0x0000013B
.L08052194:
	movs r3, #0xaa
	lsls r3, r3, #1
	adds r0, r6, r3
	cmp r1, r0
	bne .L080521C6
	adds r0, r5, #0
	movs r1, #0xc
	bl NewEfxFlashBgWhite
	movs r0, #9
	ldrh r1, [r5, #0x10]
	orrs r0, r1
	strh r0, [r5, #0x10]
	adds r4, #0x29
	ldrb r1, [r4]
	adds r0, r5, #0
	bl func_fe6_08047610
	ldrb r0, [r4]
	cmp r0, #0
	bne .L0805222A
	adds r0, r5, #0
	bl func_fe6_0805C358
	b .L0805222A
.L080521C6:
	movs r2, #0xad
	lsls r2, r2, #1
	adds r0, r6, r2
	cmp r1, r0
	bne .L08052212
	movs r0, #0x96
	lsls r0, r0, #1
	movs r1, #0x80
	lsls r1, r1, #1
	movs r2, #0x78
	movs r3, #0
	bl func_fe6_0805C804
	adds r0, r5, #0
	movs r1, #0x64
	bl func_fe6_0804D050
	adds r0, r5, #0
	movs r1, #0x64
	bl func_fe6_08052334
	adds r0, r5, #0
	movs r1, #0x64
	bl func_fe6_08052460
	mov r3, r8
	str r3, [sp]
	str r3, [sp, #4]
	adds r0, r5, #0
	movs r1, #0x46
	movs r2, #0x1e
	movs r3, #0x10
	bl func_fe6_0804CD88
	adds r0, r5, #0
	bl func_fe6_08052848
	b .L0805222A
.L08052212:
	movs r2, #0xf5
	lsls r2, r2, #1
	adds r0, r6, r2
	cmp r1, r0
	bne .L0805222A
	bl SpellFx_Finish
	bl func_fe6_08047358
	adds r0, r4, #0
	bl Proc_Break
.L0805222A:
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_fe6_08052238
func_fe6_08052238: @ 0x08052238
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, .L0805228C @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08052290 @ =gUnk_085D2518
	movs r1, #3
	bl SpawnProc
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	str r0, [r5, #0x44]
	ldr r0, .L08052294 @ =gUnk_0811A602
	str r0, [r5, #0x48]
	ldr r0, .L08052298 @ =gUnk_085D2544
	str r0, [r5, #0x4c]
	ldr r0, .L0805229C @ =gUnk_085D2530
	str r0, [r5, #0x54]
	ldr r0, .L080522A0 @ =gUnk_081BB35C
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	bl SpellFx_SetBG1Position
	bl SpellFx_SetSomeColorEffect
	ldr r0, .L080522A4 @ =gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne .L080522B4
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne .L080522A8
	movs r0, #1
	movs r1, #0xf8
	b .L080522AC
	.align 2, 0
.L0805228C: .4byte gEfxBgSemaphore
.L08052290: .4byte gUnk_085D2518
.L08052294: .4byte gUnk_0811A602
.L08052298: .4byte gUnk_085D2544
.L0805229C: .4byte gUnk_085D2530
.L080522A0: .4byte gUnk_081BB35C
.L080522A4: .4byte gEkrDistanceType
.L080522A8:
	movs r0, #1
	movs r1, #0x18
.L080522AC:
	movs r2, #0
	bl SetBgOffset
	b .L080522C8
.L080522B4:
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne .L080522C8
	movs r0, #1
	movs r1, #0x10
	movs r2, #0
	bl SetBgOffset
.L080522C8:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_fe6_080522D0
func_fe6_080522D0: @ 0x080522D0
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r0, #0x2c
	adds r1, r6, #0
	adds r1, #0x44
	ldr r2, [r6, #0x48]
	bl EfxAdvanceFrameLut
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	cmp r4, #0
	blt .L0805230A
	ldr r5, [r6, #0x4c]
	ldr r0, [r6, #0x54]
	lsls r4, r4, #2
	adds r0, r4, r0
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	ldr r0, [r6, #0x5c]
	adds r4, r4, r5
	ldr r1, [r4]
	movs r2, #0x20
	movs r3, #0x14
	bl SpellFx_WriteBgMapExt
	b .L08052328
.L0805230A:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r4, r0
	bne .L08052328
	bl SpellFx_ClearBG1
	ldr r1, .L08052330 @ =gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_ClearColorEffects
	adds r0, r6, #0
	bl Proc_Break
.L08052328:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08052330: .4byte gEfxBgSemaphore

	thumb_func_start func_fe6_08052334
func_fe6_08052334: @ 0x08052334
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, .L0805237C @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08052380 @ =gUnk_085D2558
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r5, [r0, #0x2e]
	strh r1, [r0, #0x32]
	strh r1, [r0, #0x3a]
	strh r1, [r0, #0x34]
	strh r1, [r0, #0x3c]
	ldr r0, .L08052384 @ =gUnk_081B8E64
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	ldr r0, .L08052388 @ =gUnk_081BB37C
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	bl SpellFx_SetBG1Position
	bl SpellFx_SetSomeColorEffect
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0805237C: .4byte gEfxBgSemaphore
.L08052380: .4byte gUnk_085D2558
.L08052384: .4byte gUnk_081B8E64
.L08052388: .4byte gUnk_081BB37C

	thumb_func_start func_fe6_0805238C
func_fe6_0805238C: @ 0x0805238C
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r5, r0, #0
	movs r6, #1
	adds r0, r6, #0
	ldrh r1, [r5, #0x2c]
	ands r0, r1
	cmp r0, #0
	beq .L080523E8
	ldrh r2, [r5, #0x32]
	subs r2, #0xc
	strh r2, [r5, #0x32]
	ldrh r1, [r5, #0x3a]
	adds r1, #0xc
	strh r1, [r5, #0x3a]
	ldr r0, .L080523D8 @ =gDispIo
	strh r2, [r0, #0x20]
	strh r1, [r0, #0x22]
	ldr r0, .L080523DC @ =gUnk_081BB5E4
	ldr r4, .L080523E0 @ =gEkrTsaBuffer
	adds r1, r4, #0
	bl LZ77UnCompWram
	ldr r1, .L080523E4 @ =gBg1Tm
	str r6, [sp]
	movs r0, #0x80
	lsls r0, r0, #1
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r2, #0x20
	movs r3, #0x20
	bl EfxTmCpyBG
	movs r0, #2
	bl EnableBgSync
	b .L0805241E
	.align 2, 0
.L080523D8: .4byte gDispIo
.L080523DC: .4byte gUnk_081BB5E4
.L080523E0: .4byte gEkrTsaBuffer
.L080523E4: .4byte gBg1Tm
.L080523E8:
	ldrh r2, [r5, #0x34]
	adds r2, #8
	strh r2, [r5, #0x34]
	ldrh r1, [r5, #0x3c]
	adds r1, #8
	strh r1, [r5, #0x3c]
	ldr r0, .L0805244C @ =gDispIo
	strh r2, [r0, #0x20]
	strh r1, [r0, #0x22]
	ldr r0, .L08052450 @ =gUnk_081BB5E4
	ldr r4, .L08052454 @ =gEkrTsaBuffer
	adds r1, r4, #0
	bl LZ77UnCompWram
	ldr r1, .L08052458 @ =gBg1Tm
	str r6, [sp]
	movs r0, #0x80
	lsls r0, r0, #1
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r2, #0x20
	movs r3, #0x20
	bl EfxTmCpyBgHFlip
	movs r0, #2
	bl EnableBgSync
.L0805241E:
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r5, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	bne .L08052444
	bl SpellFx_ClearBG1
	bl SpellFx_ClearColorEffects
	ldr r1, .L0805245C @ =gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r5, #0
	bl Proc_Break
.L08052444:
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L0805244C: .4byte gDispIo
.L08052450: .4byte gUnk_081BB5E4
.L08052454: .4byte gEkrTsaBuffer
.L08052458: .4byte gBg1Tm
.L0805245C: .4byte gEfxBgSemaphore

	thumb_func_start func_fe6_08052460
func_fe6_08052460: @ 0x08052460
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, .L08052498 @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L0805249C @ =gUnk_085D2570
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x2e]
	strh r5, [r0, #0x30]
	str r1, [r0, #0x44]
	ldr r1, .L080524A0 @ =gUnk_0811A618
	str r1, [r0, #0x48]
	ldr r1, .L080524A4 @ =gUnk_081BB37C
	str r1, [r0, #0x4c]
	adds r0, r1, #0
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08052498: .4byte gEfxBgSemaphore
.L0805249C: .4byte gUnk_085D2570
.L080524A0: .4byte gUnk_0811A618
.L080524A4: .4byte gUnk_081BB37C

	thumb_func_start func_fe6_080524A8
func_fe6_080524A8: @ 0x080524A8
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
	blt .L080524CC
	ldr r0, [r4, #0x4c]
	lsls r1, r1, #5
	adds r0, r0, r1
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
.L080524CC:
	ldrh r0, [r4, #0x2e]
	adds r0, #1
	strh r0, [r4, #0x2e]
	lsls r0, r0, #0x10
	ldrh r2, [r4, #0x30]
	lsls r1, r2, #0x10
	cmp r0, r1
	bne .L080524EA
	ldr r1, .L080524F0 @ =gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
.L080524EA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L080524F0: .4byte gEfxBgSemaphore

	thumb_func_start func_fe6_080524F4
func_fe6_080524F4: @ 0x080524F4
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, .L08052534 @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08052538 @ =gUnk_085D2590
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r2, #0
	strh r2, [r0, #0x2c]
	strh r5, [r0, #0x2e]
	strh r2, [r0, #0x30]
	movs r1, #0xa
	str r1, [r0, #0x44]
	str r2, [r0, #0x48]
	ldr r0, .L0805253C @ =gUnk_081BC0A8
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, .L08052540 @ =gUnk_081BBBB4
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08052534: .4byte gEfxBgSemaphore
.L08052538: .4byte gUnk_085D2590
.L0805253C: .4byte gUnk_081BC0A8
.L08052540: .4byte gUnk_081BBBB4

	thumb_func_start func_fe6_08052544
func_fe6_08052544: @ 0x08052544
	push {lr}
	adds r3, r0, #0
	ldrh r0, [r3, #0x2c]
	adds r0, #1
	strh r0, [r3, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r3, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	bne .L0805256C
	ldr r1, .L08052568 @ =gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r3, #0
	bl Proc_Break
	b .L08052592
	.align 2, 0
.L08052568: .4byte gEfxBgSemaphore
.L0805256C:
	ldrh r0, [r3, #0x30]
	adds r0, #1
	strh r0, [r3, #0x30]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r1, [r3, #0x44]
	cmp r0, r1
	bne .L08052592
	movs r0, #0
	strh r0, [r3, #0x30]
	movs r0, #0xa
	str r0, [r3, #0x44]
	ldr r0, [r3, #0x5c]
	ldr r2, [r3, #0x48]
	adds r1, r2, #0
	adds r2, #1
	str r2, [r3, #0x48]
	bl func_fe6_08052598
.L08052592:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_fe6_08052598
func_fe6_08052598: @ 0x08052598
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r1, .L08052624 @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08052628 @ =gUnk_085D25A8
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r6, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #0x1e
	bl func_fe6_0805B9C8
	adds r0, #0x8c
	strh r0, [r4, #0x2e]
	movs r0, #0x1e
	bl func_fe6_0805B9C8
	adds r5, r0, #0
	movs r0, #0x1e
	bl func_fe6_0805B9C8
	adds r1, r0, #0
	adds r0, r5, #0
	adds r0, #0x46
	strh r0, [r4, #0x32]
	adds r0, r1, #0
	adds r0, #0x28
	strh r0, [r4, #0x34]
	ldr r0, .L0805262C @ =0x0000FFEC
	strh r0, [r4, #0x3a]
	movs r0, #0xa0
	strh r0, [r4, #0x3c]
	ldr r0, .L08052630 @ =gEkrDistanceType
	movs r2, #0
	ldrsh r0, [r0, r2]
	cmp r0, #0
	bne .L080525F8
	adds r0, r5, #0
	adds r0, #0x5e
	strh r0, [r4, #0x32]
	adds r0, r1, #0
	adds r0, #0x40
	strh r0, [r4, #0x34]
.L080525F8:
	adds r0, r6, #0
	bl GetAnimPosition
	cmp r0, #1
	bne .L08052610
	movs r0, #0xf0
	ldrh r2, [r4, #0x32]
	subs r1, r0, r2
	strh r1, [r4, #0x32]
	ldrh r1, [r4, #0x34]
	subs r0, r0, r1
	strh r0, [r4, #0x34]
.L08052610:
	movs r0, #2
	bl func_fe6_0805B9C8
	cmp r0, #0
	beq .L08052638
	cmp r0, #1
	beq .L08052640
	ldr r0, .L08052634 @ =gUnk_08603B2C
	b .L08052642
	.align 2, 0
.L08052624: .4byte gEfxBgSemaphore
.L08052628: .4byte gUnk_085D25A8
.L0805262C: .4byte 0x0000FFEC
.L08052630: .4byte gEkrDistanceType
.L08052634: .4byte gUnk_08603B2C
.L08052638:
	ldr r0, .L0805263C @ =gUnk_08603B1C
	b .L08052642
	.align 2, 0
.L0805263C: .4byte gUnk_08603B1C
.L08052640:
	ldr r0, .L08052660 @ =gUnk_08603B24
.L08052642:
	movs r1, #0x78
	bl BasCreate
	adds r1, r0, #0
	str r1, [r4, #0x60]
	cmp r1, #0
	bne .L08052668
	ldr r1, .L08052664 @ =gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_End
	b .L08052676
	.align 2, 0
.L08052660: .4byte gUnk_08603B24
.L08052664: .4byte gEfxBgSemaphore
.L08052668:
	movs r0, #0x91
	lsls r0, r0, #6
	strh r0, [r1, #8]
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r1, #2]
	strh r0, [r1, #4]
.L08052676:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start func_fe6_0805267C
func_fe6_0805267C: @ 0x0805267C
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r6, [r5, #0x60]
	movs r0, #0x2c
	ldrsh r1, [r5, r0]
	movs r2, #0x2e
	ldrsh r0, [r5, r2]
	cmp r1, r0
	ble .L080526AC
	ldr r1, .L080526A8 @ =gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r6, #0
	bl BasRemove
	adds r0, r5, #0
	bl Proc_Break
	b .L080526EC
	.align 2, 0
.L080526A8: .4byte gEfxBgSemaphore
.L080526AC:
	movs r4, #0x32
	ldrsh r1, [r5, r4]
	movs r7, #0x34
	ldrsh r2, [r5, r7]
	movs r0, #0x2c
	ldrsh r3, [r5, r0]
	movs r4, #0x2e
	ldrsh r0, [r5, r4]
	str r0, [sp]
	movs r0, #0
	bl Interpolate
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	movs r7, #0x3a
	ldrsh r1, [r5, r7]
	movs r0, #0x3c
	ldrsh r2, [r5, r0]
	movs r7, #0x2c
	ldrsh r3, [r5, r7]
	movs r7, #0x2e
	ldrsh r0, [r5, r7]
	str r0, [sp]
	movs r0, #0
	bl Interpolate
	strh r4, [r6, #2]
	strh r0, [r6, #4]
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
.L080526EC:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start func_fe6_080526F4
func_fe6_080526F4: @ 0x080526F4
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	adds r4, r1, #0
	ldr r1, .L0805278C @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08052790 @ =gUnk_085D25C0
	movs r1, #3
	bl SpawnProc
	adds r5, r0, #0
	str r6, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	strh r0, [r5, #0x2e]
	strh r4, [r5, #0x30]
	movs r0, #0x5b
	strh r0, [r5, #0x32]
	movs r0, #0x3f
	strh r0, [r5, #0x34]
	ldr r0, .L08052794 @ =0x0000FFF6
	strh r0, [r5, #0x3a]
	movs r0, #0x64
	strh r0, [r5, #0x3c]
	ldr r0, .L08052798 @ =gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne .L0805273A
	movs r0, #0x73
	strh r0, [r5, #0x32]
	movs r0, #0x57
	strh r0, [r5, #0x34]
.L0805273A:
	adds r0, r6, #0
	bl GetAnimPosition
	cmp r0, #1
	bne .L08052752
	movs r0, #0xf0
	ldrh r2, [r5, #0x32]
	subs r1, r0, r2
	strh r1, [r5, #0x32]
	ldrh r1, [r5, #0x34]
	subs r0, r0, r1
	strh r0, [r5, #0x34]
.L08052752:
	ldr r3, .L0805279C @ =gUnk_08603B34
	str r3, [sp]
	adds r0, r6, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl EfxCreateFrontAnim
	str r0, [r5, #0x60]
	ldrh r1, [r5, #0x32]
	strh r1, [r0, #2]
	ldrh r1, [r5, #0x3a]
	strh r1, [r0, #4]
	ldr r3, .L080527A0 @ =gUnk_08603B58
	str r3, [sp]
	adds r0, r6, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl EfxCreateFrontAnim
	str r0, [r5, #0x64]
	ldrh r1, [r5, #0x32]
	strh r1, [r0, #2]
	ldrh r1, [r5, #0x3a]
	strh r1, [r0, #4]
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L0805278C: .4byte gEfxBgSemaphore
.L08052790: .4byte gUnk_085D25C0
.L08052794: .4byte 0x0000FFF6
.L08052798: .4byte gEkrDistanceType
.L0805279C: .4byte gUnk_08603B34
.L080527A0: .4byte gUnk_08603B58

	thumb_func_start func_fe6_080527A4
func_fe6_080527A4: @ 0x080527A4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r4, r0, #0
	ldr r6, [r4, #0x60]
	ldr r5, [r4, #0x64]
	movs r0, #0x32
	ldrsh r1, [r4, r0]
	movs r7, #0x34
	ldrsh r2, [r4, r7]
	movs r0, #0x2e
	ldrsh r3, [r4, r0]
	movs r7, #0x30
	ldrsh r0, [r4, r7]
	str r0, [sp]
	movs r0, #0
	bl Interpolate
	movs r1, #0
	mov r8, r1
	strh r0, [r5, #2]
	strh r0, [r6, #2]
	movs r2, #0x3a
	ldrsh r1, [r4, r2]
	movs r7, #0x3c
	ldrsh r2, [r4, r7]
	movs r0, #0x2e
	ldrsh r3, [r4, r0]
	movs r7, #0x30
	ldrsh r0, [r4, r7]
	str r0, [sp]
	movs r0, #0
	bl Interpolate
	strh r0, [r5, #4]
	strh r0, [r6, #4]
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x11
	bne .L0805280A
	mov r0, r8
	strh r0, [r4, #0x2c]
	ldr r0, .L08052840 @ =gUnk_08603B58
	str r0, [r5, #0x24]
	str r0, [r5, #0x20]
	mov r1, r8
	strh r1, [r6, #6]
.L0805280A:
	ldrh r0, [r4, #0x2e]
	adds r0, #1
	strh r0, [r4, #0x2e]
	lsls r0, r0, #0x10
	ldrh r2, [r4, #0x30]
	lsls r1, r2, #0x10
	cmp r0, r1
	ble .L08052834
	adds r0, r6, #0
	bl BasRemove
	adds r0, r5, #0
	bl BasRemove
	ldr r1, .L08052844 @ =gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
.L08052834:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08052840: .4byte gUnk_08603B58
.L08052844: .4byte gEfxBgSemaphore

	thumb_func_start func_fe6_08052848
func_fe6_08052848: @ 0x08052848
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, .L08052870 @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08052874 @ =gUnk_085D25D8
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r2, #0
	strh r2, [r0, #0x2c]
	strh r2, [r0, #0x2e]
	movs r1, #1
	str r1, [r0, #0x44]
	str r2, [r0, #0x48]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08052870: .4byte gEfxBgSemaphore
.L08052874: .4byte gUnk_085D25D8

	thumb_func_start func_fe6_08052878
func_fe6_08052878: @ 0x08052878
	push {lr}
	adds r3, r0, #0
	ldrh r0, [r3, #0x2c]
	adds r0, #1
	strh r0, [r3, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x2f
	bne .L080528A0
	ldr r1, .L0805289C @ =gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r3, #0
	bl Proc_Break
	b .L080528C6
	.align 2, 0
.L0805289C: .4byte gEfxBgSemaphore
.L080528A0:
	ldrh r0, [r3, #0x2e]
	adds r0, #1
	strh r0, [r3, #0x2e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r1, [r3, #0x44]
	cmp r0, r1
	bne .L080528C6
	movs r0, #0
	strh r0, [r3, #0x2e]
	movs r0, #1
	str r0, [r3, #0x44]
	ldr r0, [r3, #0x5c]
	ldr r2, [r3, #0x48]
	adds r1, r2, #0
	adds r2, #1
	str r2, [r3, #0x48]
	bl func_fe6_080528CC
.L080528C6:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_fe6_080528CC
func_fe6_080528CC: @ 0x080528CC
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, .L08052928 @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L0805292C @ =gUnk_085D25F0
	movs r1, #3
	bl SpawnProc
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	movs r0, #0x14
	strh r0, [r5, #0x2e]
	movs r0, #0x78
	bl func_fe6_0805B9C8
	adds r1, r0, #0
	subs r1, #0x3c
	strh r1, [r5, #0x32]
	adds r0, #0xb4
	strh r0, [r5, #0x34]
	movs r1, #0x32
	ldrsh r0, [r5, r1]
	lsls r1, r0, #1
	adds r1, r1, r0
	asrs r1, r1, #1
	movs r0, #0x34
	ldrsh r2, [r5, r0]
	lsls r0, r2, #1
	adds r0, r0, r2
	asrs r0, r0, #1
	adds r1, #0xc0
	strh r1, [r5, #0x3a]
	ldr r1, .L08052930 @ =0xFFFFFEB8
	adds r0, r0, r1
	strh r0, [r5, #0x3c]
	movs r0, #2
	bl func_fe6_0805B9C8
	cmp r0, #1
	bne .L08052938
	ldr r0, .L08052934 @ =gUnk_08603BA4
	b .L0805293A
	.align 2, 0
.L08052928: .4byte gEfxBgSemaphore
.L0805292C: .4byte gUnk_085D25F0
.L08052930: .4byte 0xFFFFFEB8
.L08052934: .4byte gUnk_08603BA4
.L08052938:
	ldr r0, .L08052958 @ =gUnk_08603BC0
.L0805293A:
	movs r1, #0x78
	bl BasCreate
	adds r1, r0, #0
	str r1, [r5, #0x60]
	cmp r1, #0
	bne .L08052960
	ldr r1, .L0805295C @ =gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r5, #0
	bl Proc_End
	b .L0805296E
	.align 2, 0
.L08052958: .4byte gUnk_08603BC0
.L0805295C: .4byte gEfxBgSemaphore
.L08052960:
	movs r0, #0x91
	lsls r0, r0, #6
	strh r0, [r1, #8]
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r1, #2]
	strh r0, [r1, #4]
.L0805296E:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start func_fe6_08052974
func_fe6_08052974: @ 0x08052974
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r6, [r5, #0x60]
	movs r0, #0x2c
	ldrsh r1, [r5, r0]
	movs r2, #0x2e
	ldrsh r0, [r5, r2]
	cmp r1, r0
	ble .L080529A4
	ldr r1, .L080529A0 @ =gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r6, #0
	bl BasRemove
	adds r0, r5, #0
	bl Proc_Break
	b .L080529E4
	.align 2, 0
.L080529A0: .4byte gEfxBgSemaphore
.L080529A4:
	movs r4, #0x32
	ldrsh r1, [r5, r4]
	movs r7, #0x34
	ldrsh r2, [r5, r7]
	movs r0, #0x2c
	ldrsh r3, [r5, r0]
	movs r4, #0x2e
	ldrsh r0, [r5, r4]
	str r0, [sp]
	movs r0, #0
	bl Interpolate
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	movs r7, #0x3a
	ldrsh r1, [r5, r7]
	movs r0, #0x3c
	ldrsh r2, [r5, r0]
	movs r7, #0x2c
	ldrsh r3, [r5, r7]
	movs r7, #0x2e
	ldrsh r0, [r5, r7]
	str r0, [sp]
	movs r0, #0
	bl Interpolate
	strh r4, [r6, #2]
	strh r0, [r6, #4]
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
.L080529E4:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start func_fe6_080529EC
func_fe6_080529EC: @ 0x080529EC
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl func_fe6_08047300
	bl SpellFx_SetBG1Position
	ldr r0, .L08052A24 @ =gUnk_085D2608
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r5, #0
	bl GetAnimRoundTypeAnotherSide
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl CheckRoundMiss
	adds r4, #0x29
	strb r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08052A24: .4byte gUnk_085D2608

	thumb_func_start func_fe6_08052A28
func_fe6_08052A28: @ 0x08052A28
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r6, r0, #0
	ldr r0, [r6, #0x5c]
	bl GetAnimAnotherSide
	adds r5, r0, #0
	bl EfxGetCamMovDuration
	adds r4, r0, #0
	ldrh r0, [r6, #0x2c]
	adds r0, #1
	movs r7, #0
	strh r0, [r6, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne .L08052A56
	ldr r0, [r6, #0x5c]
	movs r1, #1
	rsbs r1, r1, #0
	bl NewEfxFarAttackWithDistance
.L08052A56:
	movs r0, #0x2c
	ldrsh r1, [r6, r0]
	adds r0, r4, #1
	cmp r1, r0
	bne .L08052AD4
	ldr r4, .L08052AC4 @ =0x000001D1
	adds r0, r5, #0
	adds r1, r4, #0
	bl func_fe6_08052BA8
	adds r0, r5, #0
	bl func_fe6_08052D40
	adds r0, r5, #0
	bl func_fe6_08052C68
	ldr r1, .L08052AC8 @ =0x0000018B
	adds r0, r5, #0
	movs r2, #0xa
	bl func_fe6_0805315C
	ldr r1, .L08052ACC @ =0x0000019F
	adds r0, r5, #0
	movs r2, #0x14
	bl func_fe6_080531C4
	adds r0, r5, #0
	bl func_fe6_08052DF4
	adds r0, r5, #0
	adds r1, r4, #0
	bl func_fe6_0805304C
	movs r0, #3
	str r0, [sp]
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #0x14
	movs r3, #0x80
	bl func_fe6_0804C8D4
	adds r1, r0, #0
	adds r0, r5, #0
	movs r2, #0x8c
	bl func_fe6_080530E4
	ldr r2, .L08052AD0 @ =func_fe6_0804CD4C
	adds r0, r5, #0
	adds r1, r4, #0
	bl func_fe6_0804CC68
	movs r0, #0x82
	lsls r0, r0, #1
	b .L08052B38
	.align 2, 0
.L08052AC4: .4byte 0x000001D1
.L08052AC8: .4byte 0x0000018B
.L08052ACC: .4byte 0x0000019F
.L08052AD0: .4byte func_fe6_0804CD4C
.L08052AD4:
	adds r0, r4, #0
	adds r0, #0x92
	cmp r1, r0
	bne .L08052AE4
	ldr r0, .L08052AE0 @ =0x00000105
	b .L08052B38
	.align 2, 0
.L08052AE0: .4byte 0x00000105
.L08052AE4:
	movs r2, #0xe6
	lsls r2, r2, #1
	adds r0, r4, r2
	cmp r1, r0
	bne .L08052AFA
	adds r0, r5, #0
	movs r1, #0xa
	movs r2, #0x14
	bl NewEfxWhiteOUT
	b .L08052B9A
.L08052AFA:
	ldr r2, .L08052B48 @ =0x000001D5
	adds r0, r4, r2
	cmp r1, r0
	bne .L08052B4C
	adds r0, r5, #0
	movs r1, #0xa0
	bl func_fe6_0805327C
	str r7, [sp]
	str r7, [sp, #4]
	adds r0, r5, #0
	movs r1, #0x6e
	movs r2, #0x28
	movs r3, #0x10
	bl func_fe6_0804CD88
	adds r0, r5, #0
	movs r1, #0x8c
	movs r2, #0x18
	bl func_fe6_08053420
	adds r0, r5, #0
	movs r1, #0x3c
	bl func_fe6_08053530
	adds r0, r5, #0
	movs r1, #0x5a
	bl func_fe6_0804D050
	movs r0, #0x83
	lsls r0, r0, #1
.L08052B38:
	movs r1, #0x80
	lsls r1, r1, #1
	movs r2, #0x78
	movs r3, #0
	bl func_fe6_0805C804
	b .L08052B9A
	.align 2, 0
.L08052B48: .4byte 0x000001D5
.L08052B4C:
	ldr r2, .L08052B78 @ =0x0000020D
	adds r0, r4, r2
	cmp r1, r0
	bne .L08052B7C
	movs r0, #9
	ldrh r1, [r5, #0x10]
	orrs r0, r1
	strh r0, [r5, #0x10]
	adds r4, r6, #0
	adds r4, #0x29
	ldrb r1, [r4]
	adds r0, r5, #0
	bl StartBattleAnimHitEffectsDefault
	ldrb r0, [r4]
	cmp r0, #0
	bne .L08052B9A
	adds r0, r5, #0
	bl func_fe6_0805C358
	b .L08052B9A
	.align 2, 0
.L08052B78: .4byte 0x0000020D
.L08052B7C:
	ldr r2, .L08052BA4 @ =0x00000271
	adds r0, r4, r2
	cmp r1, r0
	beq .L08052B9A
	adds r2, #0xa
	adds r0, r4, r2
	cmp r1, r0
	bne .L08052B9A
	bl SpellFx_Finish
	bl func_fe6_08047358
	adds r0, r6, #0
	bl Proc_Break
.L08052B9A:
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08052BA4: .4byte 0x00000271

	thumb_func_start func_fe6_08052BA8
func_fe6_08052BA8: @ 0x08052BA8
	push {r4, r5, lr}
	sub sp, #8
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, .L08052C18 @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08052C1C @ =gUnk_085D2620
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r5, [r0, #0x2e]
	ldr r0, .L08052C20 @ =gUnk_0817AC4C
	movs r1, #0x84
	lsls r1, r1, #5
	bl SpellFx_RegisterBgGfx
	bl SpellFx_ClearBG1
	ldr r0, .L08052C24 @ =gUnk_0817B438
	ldr r4, .L08052C28 @ =gEkrTsaBuffer
	adds r1, r4, #0
	bl LZ77UnCompWram
	ldr r1, .L08052C2C @ =gBg1Tm
	movs r0, #1
	str r0, [sp]
	adds r0, #0xff
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r2, #0x20
	movs r3, #0x14
	bl EfxTmCpyBG
	bl SpellFx_SetSomeColorEffect
	ldr r2, .L08052C30 @ =gDispIo
	movs r0, #0x21
	rsbs r0, r0, #0
	ldrb r1, [r2, #1]
	ands r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r2, #1]
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08052C18: .4byte gEfxBgSemaphore
.L08052C1C: .4byte gUnk_085D2620
.L08052C20: .4byte gUnk_0817AC4C
.L08052C24: .4byte gUnk_0817B438
.L08052C28: .4byte gEkrTsaBuffer
.L08052C2C: .4byte gBg1Tm
.L08052C30: .4byte gDispIo

	thumb_func_start func_fe6_08052C34
func_fe6_08052C34: @ 0x08052C34
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r4, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	bne .L08052C5E
	bl SpellFx_ClearBG1
	ldr r1, .L08052C64 @ =gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_ClearColorEffects
	adds r0, r4, #0
	bl Proc_End
.L08052C5E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08052C64: .4byte gEfxBgSemaphore

	thumb_func_start func_fe6_08052C68
func_fe6_08052C68: @ 0x08052C68
	push {r4, lr}
	ldr r1, .L08052C94 @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08052C98 @ =gUnk_085D2638
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	movs r0, #1
	movs r1, #0
	movs r2, #0x10
	bl SetBgOffset
	movs r0, #0
	strh r0, [r4, #0x2c]
	strh r0, [r4, #0x2e]
	strh r0, [r4, #0x30]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08052C94: .4byte gEfxBgSemaphore
.L08052C98: .4byte gUnk_085D2638

	thumb_func_start func_fe6_08052C9C
func_fe6_08052C9C: @ 0x08052C9C
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	movs r0, #0x30
	ldrsh r3, [r6, r0]
	movs r0, #0x96
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0xff
	bl Interpolate
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	ldrh r1, [r6, #0x30]
	movs r3, #0x30
	ldrsh r0, [r6, r3]
	cmp r0, #0x96
	bgt .L08052CC6
	adds r0, r1, #1
	strh r0, [r6, #0x30]
.L08052CC6:
	ldrh r3, [r6, #0x2e]
	movs r1, #0xff
	ands r1, r3
	ldr r5, .L08052D34 @ =gUnk_08605A94
	lsls r0, r1, #1
	adds r0, r0, r5
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	ldrh r0, [r0]
	muls r0, r2, r0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	ldr r4, .L08052D38 @ =gDispIo
	strh r0, [r4, #0x20]
	adds r1, #0x40
	lsls r1, r1, #1
	adds r1, r1, r5
	ldrh r1, [r1]
	adds r0, r1, #0
	muls r0, r2, r0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	adds r0, #0x10
	strh r0, [r4, #0x22]
	adds r3, #2
	strh r3, [r6, #0x2e]
	movs r0, #1
	ldrh r1, [r6, #0x2c]
	ands r0, r1
	cmp r0, #0
	bne .L08052D0E
	movs r0, #1
	movs r1, #0
	movs r2, #0x10
	bl SetBgOffset
.L08052D0E:
	ldrh r0, [r6, #0x2c]
	adds r0, #1
	strh r0, [r6, #0x2c]
	lsls r0, r0, #0x10
	movs r1, #0xa0
	lsls r1, r1, #0x11
	cmp r0, r1
	bne .L08052D2C
	ldr r1, .L08052D3C @ =gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r6, #0
	bl Proc_Break
.L08052D2C:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08052D34: .4byte gUnk_08605A94
.L08052D38: .4byte gDispIo
.L08052D3C: .4byte gEfxBgSemaphore

	thumb_func_start func_fe6_08052D40
func_fe6_08052D40: @ 0x08052D40
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, .L08052D7C @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08052D80 @ =gUnk_085D2658
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	movs r1, #0x10
	strh r1, [r0, #0x2e]
	ldr r0, .L08052D84 @ =gUnk_0817B418
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	ldr r0, .L08052D88 @ =gPal
	movs r1, #1
	movs r2, #1
	movs r3, #0x10
	bl EfxPalBlackInOut
	bl EnablePalSync
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08052D7C: .4byte gEfxBgSemaphore
.L08052D80: .4byte gUnk_085D2658
.L08052D84: .4byte gUnk_0817B418
.L08052D88: .4byte gPal

	thumb_func_start func_fe6_08052D8C
func_fe6_08052D8C: @ 0x08052D8C
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	movs r0, #0x2c
	ldrsh r3, [r5, r0]
	movs r1, #0x2e
	ldrsh r0, [r5, r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #0x10
	movs r2, #0
	bl Interpolate
	adds r4, r0, #0
	ldr r0, .L08052DE8 @ =gUnk_0817B418
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	ldr r0, .L08052DEC @ =gPal
	movs r1, #1
	movs r2, #1
	adds r3, r4, #0
	bl EfxPalBlackInOut
	bl EnablePalSync
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r5, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	ble .L08052DDE
	ldr r1, .L08052DF0 @ =gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r5, #0
	bl Proc_Break
.L08052DDE:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08052DE8: .4byte gUnk_0817B418
.L08052DEC: .4byte gPal
.L08052DF0: .4byte gEfxBgSemaphore

	thumb_func_start func_fe6_08052DF4
func_fe6_08052DF4: @ 0x08052DF4
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r4, #0
.L08052DFA:
	ldr r0, .L08052E24 @ =gUnk_085D2678
	movs r1, #3
	bl SpawnProc
	str r5, [r0, #0x5c]
	str r4, [r0, #0x44]
	adds r4, #1
	cmp r4, #7
	bls .L08052DFA
	ldr r0, .L08052E28 @ =gUnk_0817BBB4
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, .L08052E2C @ =gUnk_0817B8D0
	movs r1, #0x80
	lsls r1, r1, #4
	bl SpellFx_RegisterObjGfx
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08052E24: .4byte gUnk_085D2678
.L08052E28: .4byte gUnk_0817BBB4
.L08052E2C: .4byte gUnk_0817B8D0

	thumb_func_start func_fe6_08052E30
func_fe6_08052E30: @ 0x08052E30
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r1, .L08052E90 @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	movs r0, #0
	strh r0, [r4, #0x2c]
	strh r0, [r4, #0x2e]
	ldr r0, [r4, #0x44]
	lsls r1, r0, #0xd
	strh r1, [r4, #0x30]
	ldr r1, .L08052E94 @ =gUnk_085D26B0
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r3, [r0]
	ldr r0, [r4, #0x5c]
	str r3, [sp]
	adds r1, r3, #0
	adds r2, r3, #0
	bl EfxCreateFrontAnim
	str r0, [r4, #0x60]
	ldr r1, .L08052E98 @ =0x0000F3FF
	ldrh r2, [r0, #8]
	ands r1, r2
	movs r3, #0x80
	lsls r3, r3, #3
	adds r2, r3, #0
	orrs r1, r2
	strh r1, [r0, #8]
	movs r1, #0x80
	lsls r1, r1, #1
	strh r1, [r0, #2]
	strh r1, [r0, #4]
	movs r0, #0x78
	strh r0, [r4, #0x32]
	movs r0, #0x40
	strh r0, [r4, #0x3a]
	adds r0, r4, #0
	bl Proc_Break
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08052E90: .4byte gEfxBgSemaphore
.L08052E94: .4byte gUnk_085D26B0
.L08052E98: .4byte 0x0000F3FF

	thumb_func_start func_fe6_08052E9C
func_fe6_08052E9C: @ 0x08052E9C
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r4, [r5, #0x60]
	movs r0, #0x2c
	ldrsh r3, [r5, r0]
	movs r7, #0x3c
	str r7, [sp]
	movs r0, #0
	movs r1, #0xb4
	movs r2, #0x32
	bl Interpolate
	ldrh r2, [r5, #0x30]
	movs r3, #0xc0
	lsls r3, r3, #2
	adds r1, r2, r3
	movs r6, #0
	strh r1, [r5, #0x30]
	lsrs r2, r1, #8
	ldr r3, .L08052F24 @ =gSinLut
	lsls r1, r2, #1
	adds r1, r1, r3
	adds r2, #0x40
	lsls r2, r2, #1
	adds r2, r2, r3
	movs r3, #0
	ldrsh r1, [r1, r3]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	muls r1, r0, r1
	lsls r1, r1, #4
	movs r3, #0
	ldrsh r2, [r2, r3]
	muls r0, r2, r0
	lsls r0, r0, #4
	asrs r1, r1, #0x10
	ldrh r2, [r5, #0x32]
	adds r1, r2, r1
	asrs r0, r0, #0x10
	ldrh r3, [r5, #0x3a]
	adds r0, r3, r0
	strh r1, [r4, #2]
	strh r0, [r4, #4]
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x3c
	ble .L08052F04
	strh r7, [r5, #0x2c]
.L08052F04:
	ldrh r0, [r5, #0x2e]
	adds r0, #1
	strh r0, [r5, #0x2e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x78
	ble .L08052F1C
	strh r6, [r5, #0x2c]
	strh r6, [r5, #0x2e]
	adds r0, r5, #0
	bl Proc_Break
.L08052F1C:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08052F24: .4byte gSinLut

	thumb_func_start func_fe6_08052F28
func_fe6_08052F28: @ 0x08052F28
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r4, [r5, #0x60]
	movs r0, #0x2c
	ldrsh r3, [r5, r0]
	movs r7, #0x50
	str r7, [sp]
	movs r0, #0
	movs r1, #0x32
	movs r2, #0
	bl Interpolate
	ldrh r2, [r5, #0x30]
	movs r3, #0xc0
	lsls r3, r3, #2
	adds r1, r2, r3
	movs r6, #0
	strh r1, [r5, #0x30]
	lsrs r2, r1, #8
	ldr r3, .L08052FB0 @ =gSinLut
	lsls r1, r2, #1
	adds r1, r1, r3
	adds r2, #0x40
	lsls r2, r2, #1
	adds r2, r2, r3
	movs r3, #0
	ldrsh r1, [r1, r3]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	muls r1, r0, r1
	lsls r1, r1, #4
	movs r3, #0
	ldrsh r2, [r2, r3]
	muls r0, r2, r0
	lsls r0, r0, #4
	asrs r1, r1, #0x10
	ldrh r2, [r5, #0x32]
	adds r1, r2, r1
	asrs r0, r0, #0x10
	ldrh r3, [r5, #0x3a]
	adds r0, r3, r0
	strh r1, [r4, #2]
	strh r0, [r4, #4]
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x50
	ble .L08052F90
	strh r7, [r5, #0x2c]
.L08052F90:
	ldrh r0, [r5, #0x2e]
	adds r0, #1
	strh r0, [r5, #0x2e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x50
	ble .L08052FA8
	strh r6, [r5, #0x2c]
	strh r6, [r5, #0x2e]
	adds r0, r5, #0
	bl Proc_Break
.L08052FA8:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08052FB0: .4byte gSinLut

	thumb_func_start func_fe6_08052FB4
func_fe6_08052FB4: @ 0x08052FB4
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r4, [r5, #0x60]
	movs r0, #0x2c
	ldrsh r3, [r5, r0]
	movs r6, #0x32
	str r6, [sp]
	movs r0, #1
	movs r1, #0
	movs r2, #0xb4
	bl Interpolate
	ldrh r2, [r5, #0x30]
	movs r3, #0x80
	lsls r3, r3, #4
	adds r1, r2, r3
	strh r1, [r5, #0x30]
	lsrs r2, r1, #8
	ldr r3, .L08053044 @ =gSinLut
	lsls r1, r2, #1
	adds r1, r1, r3
	adds r2, #0x40
	lsls r2, r2, #1
	adds r2, r2, r3
	movs r3, #0
	ldrsh r1, [r1, r3]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	muls r1, r0, r1
	lsls r1, r1, #4
	movs r3, #0
	ldrsh r2, [r2, r3]
	muls r0, r2, r0
	lsls r0, r0, #4
	asrs r1, r1, #0x10
	ldrh r2, [r5, #0x32]
	adds r1, r2, r1
	asrs r0, r0, #0x10
	ldrh r3, [r5, #0x3a]
	adds r0, r3, r0
	strh r1, [r4, #2]
	strh r0, [r4, #4]
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x32
	ble .L0805301A
	strh r6, [r5, #0x2c]
.L0805301A:
	ldrh r0, [r5, #0x2e]
	adds r0, #1
	strh r0, [r5, #0x2e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x32
	ble .L0805303C
	ldr r0, .L08053048 @ =gEfxBgSemaphore
	ldr r1, [r0]
	subs r1, #1
	str r1, [r0]
	ldr r0, [r5, #0x60]
	bl BasRemove
	adds r0, r5, #0
	bl Proc_Break
.L0805303C:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08053044: .4byte gSinLut
.L08053048: .4byte gEfxBgSemaphore

	thumb_func_start func_fe6_0805304C
func_fe6_0805304C: @ 0x0805304C
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, .L0805307C @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08053080 @ =gUnk_085D26D0
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x2e]
	strh r5, [r0, #0x30]
	str r1, [r0, #0x44]
	ldr r1, .L08053084 @ =gUnk_0811A62A
	str r1, [r0, #0x48]
	ldr r1, .L08053088 @ =gUnk_0817BBB6
	str r1, [r0, #0x4c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0805307C: .4byte gEfxBgSemaphore
.L08053080: .4byte gUnk_085D26D0
.L08053084: .4byte gUnk_0811A62A
.L08053088: .4byte gUnk_0817BBB6

	thumb_func_start func_fe6_0805308C
func_fe6_0805308C: @ 0x0805308C
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl EfxAdvanceFrameLut
	lsls r0, r0, #0x10
	asrs r3, r0, #0x10
	cmp r3, #0
	blt .L080530B6
	ldr r0, [r4, #0x4c]
	ldr r1, .L080530DC @ =gPal+0x2
	movs r2, #0xf
	str r2, [sp]
	adds r2, r3, #0
	movs r3, #0xf
	bl func_fe6_08047B6C
.L080530B6:
	ldrh r0, [r4, #0x2e]
	adds r0, #1
	strh r0, [r4, #0x2e]
	lsls r0, r0, #0x10
	ldrh r2, [r4, #0x30]
	lsls r1, r2, #0x10
	cmp r0, r1
	ble .L080530D4
	ldr r1, .L080530E0 @ =gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
.L080530D4:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L080530DC: .4byte gPal+0x2
.L080530E0: .4byte gEfxBgSemaphore

	thumb_func_start func_fe6_080530E4
func_fe6_080530E4: @ 0x080530E4
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r6, r1, #0
	adds r5, r2, #0
	ldr r1, .L0805310C @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08053110 @ =gUnk_085D26F0
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r5, [r0, #0x2e]
	str r6, [r0, #0x64]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L0805310C: .4byte gEfxBgSemaphore
.L08053110: .4byte gUnk_085D26F0

	thumb_func_start func_fe6_08053114
func_fe6_08053114: @ 0x08053114
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r4, [r5, #0x64]
	movs r0, #0x2c
	ldrsh r3, [r5, r0]
	movs r1, #0x2e
	ldrsh r0, [r5, r1]
	str r0, [sp]
	movs r0, #4
	movs r1, #0x80
	movs r2, #0
	bl Interpolate
	str r0, [r4, #0x4c]
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r5, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	ble .L08053150
	ldr r1, .L08053158 @ =gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r5, #0
	bl Proc_Break
.L08053150:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08053158: .4byte gEfxBgSemaphore

	thumb_func_start func_fe6_0805315C
func_fe6_0805315C: @ 0x0805315C
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	ldr r1, .L08053184 @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08053188 @ =gUnk_085D2708
	movs r1, #3
	bl SpawnProc
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r4, [r0, #0x2e]
	strh r5, [r0, #0x30]
	str r6, [r0, #0x5c]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08053184: .4byte gEfxBgSemaphore
.L08053188: .4byte gUnk_085D2708

	thumb_func_start func_fe6_0805318C
func_fe6_0805318C: @ 0x0805318C
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r4, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	ble .L080531B8
	ldr r1, .L080531C0 @ =gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	ldr r0, [r4, #0x5c]
	movs r2, #0x30
	ldrsh r1, [r4, r2]
	bl NewEfxFlashBgWhite
	adds r0, r4, #0
	bl Proc_Break
.L080531B8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L080531C0: .4byte gEfxBgSemaphore

	thumb_func_start func_fe6_080531C4
func_fe6_080531C4: @ 0x080531C4
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	ldr r1, .L080531EC @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L080531F0 @ =gUnk_085D2720
	movs r1, #3
	bl SpawnProc
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r4, [r0, #0x2e]
	strh r5, [r0, #0x30]
	str r6, [r0, #0x5c]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L080531EC: .4byte gEfxBgSemaphore
.L080531F0: .4byte gUnk_085D2720

	thumb_func_start func_fe6_080531F4
func_fe6_080531F4: @ 0x080531F4
	push {lr}
	adds r2, r0, #0
	ldrh r0, [r2, #0x2c]
	adds r0, #1
	strh r0, [r2, #0x2c]
	lsls r0, r0, #0x10
	ldrh r3, [r2, #0x2e]
	lsls r1, r3, #0x10
	cmp r0, r1
	ble .L08053212
	movs r0, #0
	strh r0, [r2, #0x2c]
	adds r0, r2, #0
	bl Proc_Break
.L08053212:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_fe6_08053218
func_fe6_08053218: @ 0x08053218
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	movs r0, #0x2c
	ldrsh r3, [r5, r0]
	movs r1, #0x30
	ldrsh r0, [r5, r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0x10
	bl Interpolate
	adds r4, r0, #0
	ldr r0, .L08053270 @ =gUnk_0817B418
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	ldr r0, .L08053274 @ =gPal
	movs r1, #1
	movs r2, #1
	adds r3, r4, #0
	bl EfxPalWhiteInOut
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r5, #0x30]
	lsls r1, r2, #0x10
	cmp r0, r1
	ble .L08053266
	ldr r1, .L08053278 @ =gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r5, #0
	bl Proc_Break
.L08053266:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08053270: .4byte gUnk_0817B418
.L08053274: .4byte gPal
.L08053278: .4byte gEfxBgSemaphore

	thumb_func_start func_fe6_0805327C
func_fe6_0805327C: @ 0x0805327C
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r4, r1, #0
	ldr r1, .L08053320 @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08053324 @ =gUnk_085D2740
	movs r1, #3
	bl SpawnProc
	adds r5, r0, #0
	str r6, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	strh r0, [r5, #0x2e]
	strh r4, [r5, #0x30]
	str r0, [r5, #0x44]
	ldr r0, .L08053328 @ =gUnk_0811A668
	str r0, [r5, #0x48]
	ldr r0, .L0805332C @ =gUnk_085D2768
	str r0, [r5, #0x4c]
	str r0, [r5, #0x50]
	ldr r0, .L08053330 @ =gUnk_085D2758
	str r0, [r5, #0x54]
	ldr r0, .L08053334 @ =gUnk_08181E60
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	bl SpellFx_SetSomeColorEffect
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	bl GetEkrDragonStateType
	cmp r0, #0
	beq .L08053318
	ldr r0, [r5, #0x5c]
	bl GetAnimAnotherSide
	ldr r4, .L08053338 @ =gDispIo
	movs r2, #4
	rsbs r2, r2, #0
	adds r1, r2, #0
	ldrb r3, [r4, #0xc]
	ands r1, r3
	strb r1, [r4, #0xc]
	adds r1, r2, #0
	ldrb r3, [r4, #0x18]
	ands r1, r3
	movs r3, #1
	orrs r1, r3
	strb r1, [r4, #0x18]
	ldrb r1, [r4, #0x10]
	ands r2, r1
	movs r1, #2
	orrs r2, r1
	strb r2, [r4, #0x10]
	movs r1, #3
	ldrb r2, [r4, #0x14]
	orrs r1, r2
	strb r1, [r4, #0x14]
	ldr r1, .L0805333C @ =0x0000F3FF
	adds r2, r1, #0
	ldrh r3, [r6, #8]
	ands r2, r3
	movs r4, #0x80
	lsls r4, r4, #3
	adds r3, r4, #0
	orrs r2, r3
	strh r2, [r6, #8]
	ldrh r2, [r0, #8]
	ands r1, r2
	orrs r1, r3
	strh r1, [r0, #8]
.L08053318:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08053320: .4byte gEfxBgSemaphore
.L08053324: .4byte gUnk_085D2740
.L08053328: .4byte gUnk_0811A668
.L0805332C: .4byte gUnk_085D2768
.L08053330: .4byte gUnk_085D2758
.L08053334: .4byte gUnk_08181E60
.L08053338: .4byte gDispIo
.L0805333C: .4byte 0x0000F3FF

	thumb_func_start func_fe6_08053340
func_fe6_08053340: @ 0x08053340
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	ldr r0, [r7, #0x5c]
	bl GetAnimAnotherSide
	mov r8, r0
	adds r0, r7, #0
	adds r0, #0x2c
	adds r1, r7, #0
	adds r1, #0x44
	ldr r2, [r7, #0x48]
	bl EfxAdvanceFrameLut
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	cmp r4, #0
	blt .L08053388
	ldr r5, [r7, #0x4c]
	ldr r6, [r7, #0x50]
	ldr r0, [r7, #0x54]
	lsls r4, r4, #2
	adds r0, r4, r0
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	ldr r0, [r7, #0x5c]
	adds r5, r4, r5
	ldr r1, [r5]
	adds r4, r4, r6
	ldr r2, [r4]
	bl SpellFx_WriteBgMap
.L08053388:
	ldrh r0, [r7, #0x2e]
	adds r0, #1
	strh r0, [r7, #0x2e]
	lsls r0, r0, #0x10
	ldrh r2, [r7, #0x30]
	lsls r1, r2, #0x10
	cmp r0, r1
	bne .L08053408
	bl GetEkrDragonStateType
	cmp r0, #0
	beq .L080533F2
	ldr r3, .L08053414 @ =gDispIo
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r2, [r3, #0xc]
	ands r0, r2
	strb r0, [r3, #0xc]
	adds r0, r1, #0
	ldrb r2, [r3, #0x10]
	ands r0, r2
	movs r2, #1
	orrs r0, r2
	strb r0, [r3, #0x10]
	ldrb r0, [r3, #0x18]
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	strb r1, [r3, #0x18]
	movs r0, #3
	ldrb r1, [r3, #0x14]
	orrs r0, r1
	strb r0, [r3, #0x14]
	ldr r2, [r7, #0x5c]
	ldr r1, .L08053418 @ =0x0000F3FF
	adds r0, r1, #0
	ldrh r3, [r2, #8]
	ands r0, r3
	strh r0, [r2, #8]
	ldr r2, [r7, #0x5c]
	movs r0, #0x80
	lsls r0, r0, #4
	adds r3, r0, #0
	ldrh r0, [r2, #8]
	orrs r0, r3
	strh r0, [r2, #8]
	mov r2, r8
	ldrh r2, [r2, #8]
	ands r1, r2
	orrs r1, r3
	mov r3, r8
	strh r1, [r3, #8]
.L080533F2:
	bl SpellFx_ClearBG1
	ldr r1, .L0805341C @ =gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_ClearColorEffects
	adds r0, r7, #0
	bl Proc_End
.L08053408:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08053414: .4byte gDispIo
.L08053418: .4byte 0x0000F3FF
.L0805341C: .4byte gEfxBgSemaphore

	thumb_func_start func_fe6_08053420
func_fe6_08053420: @ 0x08053420
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #4
	adds r5, r0, #0
	adds r6, r1, #0
	mov r8, r2
	ldr r1, .L080534A4 @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L080534A8 @ =gUnk_085D2778
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	strh r6, [r4, #0x2e]
	mov r0, r8
	strh r0, [r4, #0x30]
	ldr r3, .L080534AC @ =gUnk_085EBF40
	str r3, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl EfxCreateFrontAnim
	adds r5, r0, #0
	str r5, [r4, #0x60]
	movs r0, #0x78
	strh r0, [r5, #2]
	movs r0, #0x48
	strh r0, [r5, #4]
	movs r0, #0x14
	strh r0, [r5, #0xa]
	bl BasSort
	bl GetEkrDragonStateType
	cmp r0, #0
	beq .L08053486
	ldr r0, .L080534B0 @ =0x0000F3FF
	ldrh r1, [r5, #8]
	ands r0, r1
	movs r2, #0xc0
	lsls r2, r2, #4
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r5, #8]
.L08053486:
	ldr r0, .L080534B4 @ =gUnk_081629D4
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, .L080534B8 @ =gUnk_081830F4
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L080534A4: .4byte gEfxBgSemaphore
.L080534A8: .4byte gUnk_085D2778
.L080534AC: .4byte gUnk_085EBF40
.L080534B0: .4byte 0x0000F3FF
.L080534B4: .4byte gUnk_081629D4
.L080534B8: .4byte gUnk_081830F4

	thumb_func_start func_fe6_080534BC
func_fe6_080534BC: @ 0x080534BC
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r2, [r4, #0x60]
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	movs r3, #0
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	ldrh r5, [r4, #0x2e]
	lsls r1, r5, #0x10
	cmp r0, r1
	ble .L080534EE
	strh r3, [r4, #0x2c]
	ldr r0, .L080534F4 @ =gUnk_085EC478
	str r0, [r2, #0x24]
	str r0, [r2, #0x20]
	strh r3, [r2, #6]
	ldr r0, .L080534F8 @ =gUnk_0818360C
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	adds r0, r4, #0
	bl Proc_Break
.L080534EE:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L080534F4: .4byte gUnk_085EC478
.L080534F8: .4byte gUnk_0818360C

	thumb_func_start func_fe6_080534FC
func_fe6_080534FC: @ 0x080534FC
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r4, #0x30]
	lsls r1, r2, #0x10
	cmp r0, r1
	ble .L08053524
	ldr r0, [r4, #0x60]
	bl BasRemove
	ldr r1, .L0805352C @ =gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
.L08053524:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0805352C: .4byte gEfxBgSemaphore

	thumb_func_start func_fe6_08053530
func_fe6_08053530: @ 0x08053530
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, .L08053560 @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08053564 @ =gUnk_085D2798
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r2, #0
	strh r2, [r0, #0x2c]
	strh r5, [r0, #0x2e]
	strh r2, [r0, #0x30]
	movs r1, #1
	str r1, [r0, #0x44]
	str r2, [r0, #0x48]
	str r2, [r0, #0x4c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08053560: .4byte gEfxBgSemaphore
.L08053564: .4byte gUnk_085D2798

	thumb_func_start func_fe6_08053568
func_fe6_08053568: @ 0x08053568
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	movs r1, #0
	mov ip, r1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r4, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	bne .L08053594
	ldr r1, .L08053590 @ =gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
	b .L080535E4
	.align 2, 0
.L08053590: .4byte gEfxBgSemaphore
.L08053594:
	ldrh r0, [r4, #0x30]
	adds r0, #1
	strh r0, [r4, #0x30]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r1, [r4, #0x44]
	cmp r0, r1
	bne .L080535E4
	mov r0, ip
	strh r0, [r4, #0x30]
	movs r0, #2
	str r0, [r4, #0x44]
	ldr r3, .L080535EC @ =gUnk_085D27B0
	ldr r1, [r4, #0x4c]
	lsls r2, r1, #2
	adds r0, r2, r3
	ldr r7, [r0]
	ldr r0, .L080535F0 @ =gUnk_085D287C
	adds r0, r2, r0
	ldr r6, [r0]
	ldr r0, .L080535F4 @ =gUnk_085D2944
	adds r2, r2, r0
	ldr r5, [r2]
	adds r1, #1
	str r1, [r4, #0x4c]
	lsls r1, r1, #2
	adds r1, r1, r3
	ldr r1, [r1]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne .L080535D8
	mov r1, ip
	str r1, [r4, #0x4c]
.L080535D8:
	ldr r0, [r4, #0x5c]
	adds r1, r7, #0
	adds r2, r6, #0
	adds r3, r5, #0
	bl func_fe6_080535F8
.L080535E4:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L080535EC: .4byte gUnk_085D27B0
.L080535F0: .4byte gUnk_085D287C
.L080535F4: .4byte gUnk_085D2944

	thumb_func_start func_fe6_080535F8
func_fe6_080535F8: @ 0x080535F8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	mov r8, r0
	adds r4, r1, #0
	adds r5, r2, #0
	adds r7, r3, #0
	ldr r1, .L08053644 @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08053648 @ =gUnk_085D2A0C
	movs r1, #3
	bl SpawnProc
	adds r6, r0, #0
	mov r0, r8
	str r0, [r6, #0x5c]
	movs r0, #0
	strh r0, [r6, #0x2c]
	strh r4, [r6, #0x2e]
	str r5, [r6, #0x44]
	lsls r4, r4, #0xb
	adds r5, r5, r4
	str r5, [r6, #0x48]
	movs r0, #0x78
	strh r0, [r6, #0x32]
	movs r0, #0x48
	strh r0, [r6, #0x3a]
	cmp r7, #6
	bhi .L0805367C
	lsls r0, r7, #2
	ldr r1, .L0805364C @ =.L08053650
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
.L08053644: .4byte gEfxBgSemaphore
.L08053648: .4byte gUnk_085D2A0C
.L0805364C: .4byte .L08053650
.L08053650: @ jump table
	.4byte .L0805366C @ case 0
	.4byte .L0805366C @ case 1
	.4byte .L0805366C @ case 2
	.4byte .L0805366C @ case 3
	.4byte .L0805366C @ case 4
	.4byte .L08053674 @ case 5
	.4byte .L0805367C @ case 6
.L0805366C:
	ldr r3, .L08053670 @ =gUnk_085EBF60
	b .L0805367E
	.align 2, 0
.L08053670: .4byte gUnk_085EBF60
.L08053674:
	ldr r3, .L08053678 @ =gUnk_085EBF58
	b .L0805367E
	.align 2, 0
.L08053678: .4byte gUnk_085EBF58
.L0805367C:
	ldr r3, .L080536BC @ =gUnk_085EBF50
.L0805367E:
	str r3, [sp]
	mov r0, r8
	adds r1, r3, #0
	adds r2, r3, #0
	bl EfxCreateFrontAnim
	adds r4, r0, #0
	str r4, [r6, #0x60]
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r4, #2]
	strh r0, [r4, #4]
	bl GetEkrDragonStateType
	cmp r0, #0
	beq .L080536AE
	ldr r0, .L080536C0 @ =0x0000F3FF
	ldrh r1, [r4, #8]
	ands r0, r1
	movs r2, #0x80
	lsls r2, r2, #3
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r4, #8]
.L080536AE:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L080536BC: .4byte gUnk_085EBF50
.L080536C0: .4byte 0x0000F3FF

	thumb_func_start func_fe6_080536C4
func_fe6_080536C4: @ 0x080536C4
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r6, r0, #0
	ldr r5, [r6, #0x60]
	movs r0, #0x2c
	ldrsh r3, [r6, r0]
	movs r1, #0x2e
	ldrsh r0, [r6, r1]
	str r0, [sp]
	movs r0, #1
	movs r1, #0x6e
	movs r2, #0
	bl Interpolate
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	ldr r1, [r6, #0x44]
	ldr r2, [r6, #0x48]
	movs r7, #0x2c
	ldrsh r3, [r6, r7]
	movs r7, #0x2e
	ldrsh r0, [r6, r7]
	str r0, [sp]
	movs r0, #1
	bl Interpolate
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x18
	ldr r2, .L0805375C @ =gSinLut
	lsls r1, r0, #1
	adds r1, r1, r2
	adds r0, #0x40
	lsls r0, r0, #1
	adds r0, r0, r2
	movs r2, #0
	ldrsh r1, [r1, r2]
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	muls r1, r4, r1
	lsls r1, r1, #4
	movs r7, #0
	ldrsh r0, [r0, r7]
	muls r0, r4, r0
	lsls r0, r0, #4
	asrs r1, r1, #0x10
	ldrh r2, [r6, #0x32]
	adds r1, r2, r1
	asrs r0, r0, #0x10
	ldrh r7, [r6, #0x3a]
	adds r0, r7, r0
	strh r1, [r5, #2]
	strh r0, [r5, #4]
	ldrh r0, [r6, #0x2c]
	adds r0, #1
	strh r0, [r6, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r6, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	ble .L08053752
	ldr r0, [r6, #0x60]
	bl BasRemove
	ldr r1, .L08053760 @ =gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r6, #0
	bl Proc_Break
.L08053752:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0805375C: .4byte gSinLut
.L08053760: .4byte gEfxBgSemaphore

	thumb_func_start func_fe6_08053764
func_fe6_08053764: @ 0x08053764
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl func_fe6_08047300
	bl SpellFx_SetBG1Position
	ldr r0, .L0805379C @ =gUnk_085D2A24
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r5, #0
	bl GetAnimRoundTypeAnotherSide
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl CheckRoundMiss
	adds r4, #0x29
	strb r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0805379C: .4byte gUnk_085D2A24

	thumb_func_start func_fe6_080537A0
func_fe6_080537A0: @ 0x080537A0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	adds r6, r0, #0
	ldr r0, [r6, #0x5c]
	bl GetAnimAnotherSide
	adds r5, r0, #0
	bl EfxGetCamMovDuration
	adds r4, r0, #0
	ldrh r0, [r6, #0x2c]
	adds r0, #1
	movs r1, #0
	mov r8, r1
	movs r7, #0
	strh r0, [r6, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne .L080537D6
	ldr r0, [r6, #0x5c]
	movs r1, #1
	rsbs r1, r1, #0
	bl NewEfxFarAttackWithDistance
.L080537D6:
	movs r2, #0x2c
	ldrsh r1, [r6, r2]
	adds r0, r4, #1
	cmp r1, r0
	bne .L08053848
	ldr r3, .L08053844 @ =gDispIo
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
	mov r2, r8
	strb r2, [r0]
	adds r0, #1
	movs r1, #0x10
	strb r1, [r0]
	adds r0, #1
	strb r2, [r0]
	str r1, [sp]
	str r7, [sp, #4]
	adds r0, r5, #0
	movs r1, #0
	movs r2, #0x1e
	movs r3, #0
	bl func_fe6_0804CD88
	str r7, [sp]
	str r7, [sp, #4]
	adds r0, r5, #0
	movs r1, #0xa0
	movs r2, #0x1e
	movs r3, #0x10
	bl func_fe6_0804CD88
	ldr r0, [r6, #0x5c]
	bl func_fe6_08053954
	ldr r0, [r6, #0x5c]
	bl func_fe6_08053CB4
	movs r0, #0x9c
	lsls r0, r0, #1
	movs r1, #0x80
	lsls r1, r1, #1
	movs r2, #0x78
	movs r3, #0
	bl func_fe6_0805C804
	b .L08053946
	.align 2, 0
.L08053844: .4byte gDispIo
.L08053848:
	adds r0, r4, #0
	adds r0, #0x7f
	cmp r1, r0
	bne .L0805387C
	movs r0, #2
	str r0, [sp]
	adds r0, r5, #0
	movs r1, #0x52
	movs r2, #0xf
	movs r3, #0
	bl func_fe6_0804C8D4
	adds r1, r0, #0
	adds r0, r5, #0
	movs r2, #0x3c
	bl func_fe6_08050D68
	ldr r2, .L08053878 @ =func_fe6_0804CD4C
	adds r0, r5, #0
	movs r1, #0x53
	bl func_fe6_0804CC68
	b .L08053946
	.align 2, 0
.L08053878: .4byte func_fe6_0804CD4C
.L0805387C:
	adds r0, r4, #0
	adds r0, #0xd2
	cmp r1, r0
	bne .L0805388C
	adds r0, r5, #0
	bl func_fe6_080539C4
	b .L08053946
.L0805388C:
	adds r0, r4, #0
	adds r0, #0xd7
	cmp r1, r0
	bne .L080538AC
	ldr r0, .L080538A8 @ =0x00000139
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
	movs r3, #1
	bl func_fe6_0805C804
	b .L08053946
	.align 2, 0
.L080538A8: .4byte 0x00000139
.L080538AC:
	adds r0, r4, #0
	adds r0, #0xf1
	cmp r1, r0
	bne .L080538BC
	ldr r0, [r6, #0x5c]
	bl func_fe6_08053AFC
	b .L08053946
.L080538BC:
	movs r2, #0x9e
	lsls r2, r2, #1
	adds r0, r4, r2
	cmp r1, r0
	bne .L08053902
	movs r0, #0x9d
	lsls r0, r0, #1
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
	movs r3, #1
	bl func_fe6_0805C804
	adds r0, r5, #0
	movs r1, #0xa
	bl NewEfxFlashBgWhite
	movs r0, #9
	ldrh r1, [r5, #0x10]
	orrs r0, r1
	strh r0, [r5, #0x10]
	adds r4, r6, #0
	adds r4, #0x29
	ldrb r1, [r4]
	adds r0, r5, #0
	bl StartBattleAnimHitEffectsDefault
	ldrb r0, [r4]
	cmp r0, #0
	bne .L08053946
	adds r0, r5, #0
	bl func_fe6_0805C358
	b .L08053946
.L08053902:
	movs r2, #0xa3
	lsls r2, r2, #1
	adds r0, r4, r2
	cmp r1, r0
	bne .L08053924
	adds r0, r5, #0
	bl func_fe6_08053A44
	str r7, [sp]
	str r7, [sp, #4]
	adds r0, r5, #0
	movs r1, #0x10
	movs r2, #0xa
	movs r3, #0x10
	bl func_fe6_0804CD88
	b .L08053946
.L08053924:
	movs r3, #0xaf
	lsls r3, r3, #1
	adds r0, r4, r3
	cmp r1, r0
	beq .L08053946
	movs r2, #0xb4
	lsls r2, r2, #1
	adds r0, r4, r2
	cmp r1, r0
	bne .L08053946
	bl SpellFx_Finish
	bl func_fe6_08047358
	adds r0, r6, #0
	bl Proc_Break
.L08053946:
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_fe6_08053954
func_fe6_08053954: @ 0x08053954
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, .L080539A8 @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L080539AC @ =gUnk_085D2A3C
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, .L080539B0 @ =gUnk_0811A67A
	str r1, [r0, #0x48]
	ldr r1, .L080539B4 @ =gUnk_085D2A54
	str r1, [r0, #0x4c]
	str r1, [r0, #0x50]
	ldr r1, .L080539B8 @ =gUnk_085D2AC0
	str r1, [r0, #0x54]
	ldr r0, .L080539BC @ =gUnk_0816B328
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	bl SpellFx_SetSomeColorEffect
	ldr r2, .L080539C0 @ =gDispIo
	movs r0, #0x21
	rsbs r0, r0, #0
	ldrb r1, [r2, #1]
	ands r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r2, #1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L080539A8: .4byte gEfxBgSemaphore
.L080539AC: .4byte gUnk_085D2A3C
.L080539B0: .4byte gUnk_0811A67A
.L080539B4: .4byte gUnk_085D2A54
.L080539B8: .4byte gUnk_085D2AC0
.L080539BC: .4byte gUnk_0816B328
.L080539C0: .4byte gDispIo

	thumb_func_start func_fe6_080539C4
func_fe6_080539C4: @ 0x080539C4
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, .L08053A28 @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08053A2C @ =gUnk_085D2A3C
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r4, #0
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, .L08053A30 @ =gUnk_0811A680
	str r1, [r0, #0x48]
	ldr r1, .L08053A34 @ =gUnk_085D2A54
	str r1, [r0, #0x4c]
	str r1, [r0, #0x50]
	ldr r1, .L08053A38 @ =gUnk_085D2AC0
	str r1, [r0, #0x54]
	ldr r0, .L08053A3C @ =gUnk_0818BBCC
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	bl SpellFx_SetSomeColorEffect
	ldr r3, .L08053A40 @ =gDispIo
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r1, r3, #0
	adds r1, #0x44
	movs r0, #0xc
	strb r0, [r1]
	adds r1, #1
	movs r0, #6
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x46
	strb r4, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08053A28: .4byte gEfxBgSemaphore
.L08053A2C: .4byte gUnk_085D2A3C
.L08053A30: .4byte gUnk_0811A680
.L08053A34: .4byte gUnk_085D2A54
.L08053A38: .4byte gUnk_085D2AC0
.L08053A3C: .4byte gUnk_0818BBCC
.L08053A40: .4byte gDispIo

	thumb_func_start func_fe6_08053A44
func_fe6_08053A44: @ 0x08053A44
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, .L08053A80 @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08053A84 @ =gUnk_085D2A3C
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, .L08053A88 @ =gUnk_0811A722
	str r1, [r0, #0x48]
	ldr r1, .L08053A8C @ =gUnk_085D2A54
	str r1, [r0, #0x4c]
	str r1, [r0, #0x50]
	ldr r1, .L08053A90 @ =gUnk_085D2AC0
	str r1, [r0, #0x54]
	ldr r0, .L08053A94 @ =gUnk_0818BBEC
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	bl SpellFx_SetSomeColorEffect
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08053A80: .4byte gEfxBgSemaphore
.L08053A84: .4byte gUnk_085D2A3C
.L08053A88: .4byte gUnk_0811A722
.L08053A8C: .4byte gUnk_085D2A54
.L08053A90: .4byte gUnk_085D2AC0
.L08053A94: .4byte gUnk_0818BBEC

	thumb_func_start func_fe6_08053A98
func_fe6_08053A98: @ 0x08053A98
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r0, #0x2c
	adds r1, r7, #0
	adds r1, #0x44
	ldr r2, [r7, #0x48]
	bl EfxAdvanceFrameLut
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	cmp r4, #0
	blt .L08053AD4
	ldr r5, [r7, #0x4c]
	ldr r6, [r7, #0x50]
	ldr r0, [r7, #0x54]
	lsls r4, r4, #2
	adds r0, r4, r0
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	ldr r0, [r7, #0x5c]
	adds r5, r4, r5
	ldr r1, [r5]
	adds r4, r4, r6
	ldr r2, [r4]
	bl SpellFx_WriteBgMap
	b .L08053AF2
.L08053AD4:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r4, r0
	bne .L08053AF2
	bl SpellFx_ClearBG1
	ldr r1, .L08053AF8 @ =gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_ClearColorEffects
	adds r0, r7, #0
	bl Proc_Break
.L08053AF2:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08053AF8: .4byte gEfxBgSemaphore

	thumb_func_start func_fe6_08053AFC
func_fe6_08053AFC: @ 0x08053AFC
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, .L08053B54 @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08053B58 @ =gUnk_085D2B2C
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	adds r0, r5, #0
	bl GetAnimAnotherSide
	adds r5, r0, #0
	movs r0, #0
	strh r0, [r4, #0x2c]
	ldr r3, .L08053B5C @ =AnimScr_ManaketeFlame
	str r3, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl EfxCreateFrontAnim
	adds r6, r0, #0
	str r6, [r4, #0x60]
	ldr r0, .L08053B60 @ =0x0000F3FF
	ldrh r1, [r6, #8]
	ands r0, r1
	movs r2, #0x80
	lsls r2, r2, #3
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r6, #8]
	adds r0, r5, #0
	bl GetAnimPosition
	cmp r0, #0
	bne .L08053B64
	ldrh r0, [r6, #2]
	subs r0, #8
	b .L08053B68
	.align 2, 0
.L08053B54: .4byte gEfxBgSemaphore
.L08053B58: .4byte gUnk_085D2B2C
.L08053B5C: .4byte AnimScr_ManaketeFlame
.L08053B60: .4byte 0x0000F3FF
.L08053B64:
	ldrh r0, [r6, #2]
	adds r0, #8
.L08053B68:
	strh r0, [r6, #2]
	ldrh r0, [r6, #4]
	subs r0, #0x10
	strh r0, [r6, #4]
	bl GetEkrDragonStateTypeIdunn
	cmp r0, #0
	beq .L08053B7E
	ldrh r0, [r6, #2]
	subs r0, #0x10
	strh r0, [r6, #2]
.L08053B7E:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_fe6_08053B88
func_fe6_08053B88: @ 0x08053B88
	push {lr}
	ldr r2, .L08053B9C @ =gEfxBgSemaphore
	ldr r1, [r2]
	subs r1, #1
	str r1, [r2]
	ldr r0, [r0, #0x60]
	bl BasRemove
	pop {r0}
	bx r0
	.align 2, 0
.L08053B9C: .4byte gEfxBgSemaphore

	thumb_func_start func_fe6_08053BA0
func_fe6_08053BA0: @ 0x08053BA0
	push {r4, lr}
	adds r1, r0, #0
	ldr r2, [r1, #0x60]
	ldrh r0, [r1, #0x2c]
	adds r0, #1
	movs r4, #0
	strh r0, [r1, #0x2c]
	lsls r0, r0, #0x10
	asrs r3, r0, #0x10
	cmp r3, #1
	bne .L08053BE4
	ldr r0, .L08053BD8 @ =gUnk_085EC630
	str r0, [r2, #0x24]
	str r0, [r2, #0x20]
	strh r4, [r2, #6]
	movs r0, #0xa
	strh r0, [r1, #0x2e]
	ldr r0, .L08053BDC @ =gUnk_0818EA78
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, .L08053BE0 @ =gUnk_0818DD18
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	b .L08053BF4
	.align 2, 0
.L08053BD8: .4byte gUnk_085EC630
.L08053BDC: .4byte gUnk_0818EA78
.L08053BE0: .4byte gUnk_0818DD18
.L08053BE4:
	movs r2, #0x2e
	ldrsh r0, [r1, r2]
	cmp r3, r0
	bne .L08053BF4
	strh r4, [r1, #0x2c]
	adds r0, r1, #0
	bl Proc_Break
.L08053BF4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_fe6_08053BFC
func_fe6_08053BFC: @ 0x08053BFC
	push {r4, lr}
	adds r1, r0, #0
	ldr r2, [r1, #0x60]
	ldrh r0, [r1, #0x2c]
	adds r0, #1
	movs r4, #0
	strh r0, [r1, #0x2c]
	lsls r0, r0, #0x10
	asrs r3, r0, #0x10
	cmp r3, #1
	bne .L08053C40
	ldr r0, .L08053C34 @ =gUnk_085EC938
	str r0, [r2, #0x24]
	str r0, [r2, #0x20]
	strh r4, [r2, #6]
	movs r0, #0xa
	strh r0, [r1, #0x2e]
	ldr r0, .L08053C38 @ =gUnk_0818EA78
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, .L08053C3C @ =gUnk_0818E1E4
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	b .L08053C50
	.align 2, 0
.L08053C34: .4byte gUnk_085EC938
.L08053C38: .4byte gUnk_0818EA78
.L08053C3C: .4byte gUnk_0818E1E4
.L08053C40:
	movs r2, #0x2e
	ldrsh r0, [r1, r2]
	cmp r3, r0
	bne .L08053C50
	strh r4, [r1, #0x2c]
	adds r0, r1, #0
	bl Proc_Break
.L08053C50:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_fe6_08053C58
func_fe6_08053C58: @ 0x08053C58
	push {r4, lr}
	adds r1, r0, #0
	ldr r2, [r1, #0x60]
	ldrh r0, [r1, #0x2c]
	adds r0, #1
	movs r4, #0
	strh r0, [r1, #0x2c]
	lsls r0, r0, #0x10
	asrs r3, r0, #0x10
	cmp r3, #1
	bne .L08053C9C
	ldr r0, .L08053C90 @ =gUnk_085ECC34
	str r0, [r2, #0x24]
	str r0, [r2, #0x20]
	strh r4, [r2, #6]
	movs r0, #0xa
	strh r0, [r1, #0x2e]
	ldr r0, .L08053C94 @ =gUnk_0818EA78
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, .L08053C98 @ =gUnk_0818E67C
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	b .L08053CAC
	.align 2, 0
.L08053C90: .4byte gUnk_085ECC34
.L08053C94: .4byte gUnk_0818EA78
.L08053C98: .4byte gUnk_0818E67C
.L08053C9C:
	movs r2, #0x2e
	ldrsh r0, [r1, r2]
	cmp r3, r0
	bne .L08053CAC
	strh r4, [r1, #0x2c]
	adds r0, r1, #0
	bl Proc_Break
.L08053CAC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_fe6_08053CB4
func_fe6_08053CB4: @ 0x08053CB4
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, .L08053CEC @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08053CF0 @ =gUnk_085D2B74
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x2e]
	movs r1, #0x64
	strh r1, [r0, #0x30]
	ldr r0, .L08053CF4 @ =gUnk_081629D4
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, .L08053CF8 @ =gUnk_08161DDC
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08053CEC: .4byte gEfxBgSemaphore
.L08053CF0: .4byte gUnk_085D2B74
.L08053CF4: .4byte gUnk_081629D4
.L08053CF8: .4byte gUnk_08161DDC

	thumb_func_start func_fe6_08053CFC
func_fe6_08053CFC: @ 0x08053CFC
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x12
	bne .L08053D4E
	movs r0, #0
	strh r0, [r4, #0x2c]
	ldr r0, .L08053D54 @ =gUnk_085D2B8C
	movs r1, #0x2e
	ldrsh r2, [r4, r1]
	lsls r1, r2, #2
	adds r1, r1, r0
	lsls r2, r2, #1
	adds r2, #1
	lsls r2, r2, #1
	adds r2, r2, r0
	ldr r0, [r4, #0x5c]
	movs r3, #0
	ldrsh r1, [r1, r3]
	movs r3, #0
	ldrsh r2, [r2, r3]
	bl func_fe6_08053D5C
	ldrh r0, [r4, #0x2e]
	adds r0, #1
	strh r0, [r4, #0x2e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #6
	bne .L08053D4E
	ldr r1, .L08053D58 @ =gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
.L08053D4E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08053D54: .4byte gUnk_085D2B8C
.L08053D58: .4byte gEfxBgSemaphore

	thumb_func_start func_fe6_08053D5C
func_fe6_08053D5C: @ 0x08053D5C
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #4
	adds r5, r0, #0
	adds r6, r1, #0
	mov r8, r2
	ldr r1, .L08053DA4 @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08053DA8 @ =gUnk_085D2BA4
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	ldr r3, .L08053DAC @ =gUnk_085EAC34
	str r3, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl EfxCreateFrontAnim
	str r0, [r4, #0x60]
	strh r6, [r0, #2]
	mov r1, r8
	strh r1, [r0, #4]
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08053DA4: .4byte gEfxBgSemaphore
.L08053DA8: .4byte gUnk_085D2BA4
.L08053DAC: .4byte gUnk_085EAC34

	thumb_func_start func_fe6_08053DB0
func_fe6_08053DB0: @ 0x08053DB0
	push {lr}
	ldr r2, .L08053DC4 @ =gEfxBgSemaphore
	ldr r1, [r2]
	subs r1, #1
	str r1, [r2]
	ldr r0, [r0, #0x60]
	bl BasRemove
	pop {r0}
	bx r0
	.align 2, 0
.L08053DC4: .4byte gEfxBgSemaphore

	thumb_func_start func_fe6_08053DC8
func_fe6_08053DC8: @ 0x08053DC8
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl func_fe6_08047300
	bl SpellFx_SetBG1Position
	ldr r0, .L08053E00 @ =gUnk_085D2BC4
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r5, #0
	bl GetAnimRoundTypeAnotherSide
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl CheckRoundMiss
	adds r4, #0x29
	strb r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08053E00: .4byte gUnk_085D2BC4

	thumb_func_start func_fe6_08053E04
func_fe6_08053E04: @ 0x08053E04
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	adds r6, r0, #0
	ldr r0, [r6, #0x5c]
	bl GetAnimAnotherSide
	adds r5, r0, #0
	bl EfxGetCamMovDuration
	adds r4, r0, #0
	ldrh r0, [r6, #0x2c]
	adds r0, #1
	movs r1, #0
	mov r8, r1
	movs r7, #0
	strh r0, [r6, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne .L08053E3A
	ldr r0, [r6, #0x5c]
	movs r1, #1
	rsbs r1, r1, #0
	bl NewEfxFarAttackWithDistance
.L08053E3A:
	movs r2, #0x2c
	ldrsh r1, [r6, r2]
	adds r0, r4, #1
	cmp r1, r0
	bne .L08053ED0
	adds r0, r5, #0
	movs r1, #0x64
	bl func_fe6_08053FF4
	adds r0, r5, #0
	movs r1, #0x64
	bl func_fe6_080540D0
	movs r4, #0x80
	lsls r4, r4, #1
	movs r0, #1
	str r0, [sp]
	adds r0, r5, #0
	movs r1, #0x64
	movs r2, #2
	adds r3, r4, #0
	bl func_fe6_0804C8D4
	ldr r2, .L08053EC8 @ =func_fe6_0804CD4C
	adds r0, r5, #0
	movs r1, #0x69
	bl func_fe6_0804CC68
	ldr r3, .L08053ECC @ =gDispIo
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
	mov r2, r8
	strb r2, [r0]
	adds r0, #1
	movs r1, #0x10
	strb r1, [r0]
	adds r0, #1
	strb r2, [r0]
	str r1, [sp]
	str r7, [sp, #4]
	adds r0, r5, #0
	movs r1, #0
	movs r2, #0xf
	movs r3, #0
	bl func_fe6_0804CD88
	str r7, [sp]
	str r7, [sp, #4]
	adds r0, r5, #0
	movs r1, #0x46
	movs r2, #0xf
	movs r3, #0x10
	bl func_fe6_0804CD88
	movs r0, #0x98
	lsls r0, r0, #1
	adds r1, r4, #0
	movs r2, #0x78
	movs r3, #0
	bl func_fe6_0805C804
	b .L08053FE8
	.align 2, 0
.L08053EC8: .4byte func_fe6_0804CD4C
.L08053ECC: .4byte gDispIo
.L08053ED0:
	adds r0, r4, #0
	adds r0, #0x28
	cmp r1, r0
	bne .L08053EE8
	adds r0, r5, #0
	movs r1, #0x4a
	bl func_fe6_08054168
	ldr r0, .L08053EE4 @ =0x00000131
	b .L08053F40
	.align 2, 0
.L08053EE4: .4byte 0x00000131
.L08053EE8:
	adds r0, r4, #0
	adds r0, #0x6e
	cmp r1, r0
	bne .L08053EF8
	adds r0, r5, #0
	bl func_fe6_080541FC
	b .L08053FE8
.L08053EF8:
	adds r0, r4, #0
	adds r0, #0x6f
	cmp r1, r0
	beq .L08053F3C
	adds r0, r4, #0
	adds r0, #0x8b
	cmp r1, r0
	beq .L08053F3C
	adds r0, r4, #0
	adds r0, #0xa7
	cmp r1, r0
	beq .L08053F3C
	adds r0, r4, #0
	adds r0, #0xc3
	cmp r1, r0
	beq .L08053F3C
	adds r0, r4, #0
	adds r0, #0xdf
	cmp r1, r0
	beq .L08053F3C
	adds r0, r4, #0
	adds r0, #0xfb
	cmp r1, r0
	beq .L08053F3C
	ldr r2, .L08053F50 @ =0x00000117
	adds r0, r4, r2
	cmp r1, r0
	beq .L08053F3C
	movs r0, #0x2c
	ldrsh r1, [r6, r0]
	ldr r7, .L08053F54 @ =0x00000133
	adds r0, r4, r7
	cmp r1, r0
	bne .L08053F58
.L08053F3C:
	movs r0, #0x99
	lsls r0, r0, #1
.L08053F40:
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
	movs r3, #1
	bl func_fe6_0805C804
	b .L08053FE8
	.align 2, 0
.L08053F50: .4byte 0x00000117
.L08053F54: .4byte 0x00000133
.L08053F58:
	movs r2, #0xb3
	lsls r2, r2, #1
	adds r0, r4, r2
	cmp r1, r0
	bne .L08053FA2
	adds r0, r5, #0
	movs r1, #0xa
	bl NewEfxFlashBgWhite
	adds r0, r5, #0
	bl func_fe6_080543C4
	movs r0, #9
	ldrh r3, [r5, #0x10]
	orrs r0, r3
	strh r0, [r5, #0x10]
	adds r4, r6, #0
	adds r4, #0x29
	ldrb r1, [r4]
	adds r0, r5, #0
	bl StartBattleAnimHitEffectsDefault
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #2
	ldrsh r2, [r5, r0]
	adds r0, r7, #0
	movs r3, #1
	bl func_fe6_0805C804
	ldrb r0, [r4]
	cmp r0, #0
	bne .L08053FE8
	adds r0, r5, #0
	bl func_fe6_0805C358
	b .L08053FE8
.L08053FA2:
	movs r2, #0xb8
	lsls r2, r2, #1
	adds r0, r4, r2
	cmp r1, r0
	bne .L08053FC6
	adds r0, r5, #0
	bl func_fe6_0805428C
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	adds r0, r5, #0
	movs r1, #0x12
	movs r2, #8
	movs r3, #0x10
	bl func_fe6_0804CD88
	b .L08053FE8
.L08053FC6:
	movs r3, #0xcd
	lsls r3, r3, #1
	adds r0, r4, r3
	cmp r1, r0
	beq .L08053FE8
	movs r2, #0xd2
	lsls r2, r2, #1
	adds r0, r4, r2
	cmp r1, r0
	bne .L08053FE8
	bl SpellFx_Finish
	bl func_fe6_08047358
	adds r0, r6, #0
	bl Proc_Break
.L08053FE8:
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start func_fe6_08053FF4
func_fe6_08053FF4: @ 0x08053FF4
	push {r4, r5, lr}
	sub sp, #8
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, .L08054068 @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L0805406C @ =gUnk_085D2BDC
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r5, [r0, #0x2e]
	ldr r0, .L08054070 @ =gUnk_0818EA98
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	bl SpellFx_ClearBG1
	ldr r0, .L08054074 @ =gUnk_0818F3D8
	ldr r4, .L08054078 @ =gEkrTsaBuffer
	adds r1, r4, #0
	bl LZ77UnCompWram
	ldr r1, .L0805407C @ =gBg1Tm
	movs r0, #1
	str r0, [sp]
	adds r0, #0xff
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r2, #0x20
	movs r3, #0x20
	bl EfxTmCpyBG
	movs r0, #2
	bl EnableBgSync
	bl SpellFx_SetSomeColorEffect
	ldr r2, .L08054080 @ =gDispIo
	movs r0, #0x21
	rsbs r0, r0, #0
	ldrb r1, [r2, #1]
	ands r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r2, #1]
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08054068: .4byte gEfxBgSemaphore
.L0805406C: .4byte gUnk_085D2BDC
.L08054070: .4byte gUnk_0818EA98
.L08054074: .4byte gUnk_0818F3D8
.L08054078: .4byte gEkrTsaBuffer
.L0805407C: .4byte gBg1Tm
.L08054080: .4byte gDispIo

	thumb_func_start func_fe6_08054084
func_fe6_08054084: @ 0x08054084
	push {lr}
	bl SpellFx_ClearBG1
	ldr r1, .L0805409C @ =gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_ClearColorEffects
	pop {r0}
	bx r0
	.align 2, 0
.L0805409C: .4byte gEfxBgSemaphore

	thumb_func_start func_fe6_080540A0
func_fe6_080540A0: @ 0x080540A0
	push {lr}
	adds r2, r0, #0
	ldr r0, .L080540CC @ =gDispIo
	ldrh r1, [r0, #0x22]
	adds r1, #1
	strh r1, [r0, #0x22]
	ldrh r1, [r0, #0x20]
	subs r1, #1
	strh r1, [r0, #0x20]
	ldrh r0, [r2, #0x2c]
	adds r0, #1
	strh r0, [r2, #0x2c]
	lsls r0, r0, #0x10
	ldrh r3, [r2, #0x2e]
	lsls r1, r3, #0x10
	cmp r0, r1
	ble .L080540C8
	adds r0, r2, #0
	bl Proc_Break
.L080540C8:
	pop {r0}
	bx r0
	.align 2, 0
.L080540CC: .4byte gDispIo

	thumb_func_start func_fe6_080540D0
func_fe6_080540D0: @ 0x080540D0
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, .L08054108 @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L0805410C @ =gUnk_085D2BFC
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x2e]
	strh r5, [r0, #0x30]
	str r1, [r0, #0x44]
	ldr r1, .L08054110 @ =gUnk_0811A758
	str r1, [r0, #0x48]
	ldr r1, .L08054114 @ =gUnk_0818F1F8
	str r1, [r0, #0x4c]
	adds r0, r1, #0
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08054108: .4byte gEfxBgSemaphore
.L0805410C: .4byte gUnk_085D2BFC
.L08054110: .4byte gUnk_0811A758
.L08054114: .4byte gUnk_0818F1F8

	thumb_func_start func_fe6_08054118
func_fe6_08054118: @ 0x08054118
	ldr r1, .L08054124 @ =gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bx lr
	.align 2, 0
.L08054124: .4byte gEfxBgSemaphore

	thumb_func_start func_fe6_08054128
func_fe6_08054128: @ 0x08054128
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
	blt .L0805414C
	ldr r0, [r4, #0x4c]
	lsls r1, r1, #5
	adds r0, r0, r1
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
.L0805414C:
	ldrh r0, [r4, #0x2e]
	adds r0, #1
	strh r0, [r4, #0x2e]
	lsls r0, r0, #0x10
	ldrh r2, [r4, #0x30]
	lsls r1, r2, #0x10
	cmp r0, r1
	ble .L08054162
	adds r0, r4, #0
	bl Proc_Break
.L08054162:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start func_fe6_08054168
func_fe6_08054168: @ 0x08054168
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	adds r6, r1, #0
	ldr r1, .L080541B4 @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L080541B8 @ =gUnk_085D2C24
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	strh r6, [r4, #0x2e]
	ldr r3, .L080541BC @ =gUnk_085ED924
	str r3, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl EfxCreateFrontAnim
	str r0, [r4, #0x60]
	ldr r0, .L080541C0 @ =gUnk_0819875C
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, .L080541C4 @ =gUnk_08197BE0
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L080541B4: .4byte gEfxBgSemaphore
.L080541B8: .4byte gUnk_085D2C24
.L080541BC: .4byte gUnk_085ED924
.L080541C0: .4byte gUnk_0819875C
.L080541C4: .4byte gUnk_08197BE0

	thumb_func_start func_fe6_080541C8
func_fe6_080541C8: @ 0x080541C8
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r4, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	ble .L080541F0
	ldr r0, .L080541F8 @ =gEfxBgSemaphore
	ldr r1, [r0]
	subs r1, #1
	str r1, [r0]
	ldr r0, [r4, #0x60]
	bl BasRemove
	adds r0, r4, #0
	bl Proc_Break
.L080541F0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L080541F8: .4byte gEfxBgSemaphore

	thumb_func_start func_fe6_080541FC
func_fe6_080541FC: @ 0x080541FC
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, .L08054260 @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08054264 @ =gUnk_085D2C3C
	movs r1, #3
	bl SpawnProc
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	str r0, [r5, #0x44]
	ldr r0, .L08054268 @ =gUnk_0811A796
	str r0, [r5, #0x48]
	ldr r0, .L0805426C @ =gUnk_085D2D20
	str r0, [r5, #0x4c]
	str r0, [r5, #0x50]
	ldr r0, .L08054270 @ =gUnk_085D2C54
	str r0, [r5, #0x54]
	ldr r0, .L08054274 @ =gUnk_08193598
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	bl SpellFx_SetSomeColorEffect
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r0, .L08054278 @ =gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq .L08054286
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne .L0805427C
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl SetBgOffset
	b .L08054286
	.align 2, 0
.L08054260: .4byte gEfxBgSemaphore
.L08054264: .4byte gUnk_085D2C3C
.L08054268: .4byte gUnk_0811A796
.L0805426C: .4byte gUnk_085D2D20
.L08054270: .4byte gUnk_085D2C54
.L08054274: .4byte gUnk_08193598
.L08054278: .4byte gEkrDistanceType
.L0805427C:
	movs r0, #1
	movs r1, #0xe8
	movs r2, #0
	bl SetBgOffset
.L08054286:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start func_fe6_0805428C
func_fe6_0805428C: @ 0x0805428C
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, .L080542E4 @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L080542E8 @ =gUnk_085D2C3C
	movs r1, #3
	bl SpawnProc
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	str r0, [r5, #0x44]
	ldr r0, .L080542EC @ =gUnk_08119F50
	str r0, [r5, #0x48]
	ldr r0, .L080542F0 @ =gUnk_085D1430
	str r0, [r5, #0x4c]
	str r0, [r5, #0x50]
	ldr r0, .L080542F4 @ =gUnk_085D13DC
	str r0, [r5, #0x54]
	ldr r0, .L080542F8 @ =gUnk_081935B8
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	bl SpellFx_SetSomeColorEffect
	ldr r0, .L080542FC @ =gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq .L0805430A
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne .L08054300
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl SetBgOffset
	b .L0805430A
	.align 2, 0
.L080542E4: .4byte gEfxBgSemaphore
.L080542E8: .4byte gUnk_085D2C3C
.L080542EC: .4byte gUnk_08119F50
.L080542F0: .4byte gUnk_085D1430
.L080542F4: .4byte gUnk_085D13DC
.L080542F8: .4byte gUnk_081935B8
.L080542FC: .4byte gEkrDistanceType
.L08054300:
	movs r0, #1
	movs r1, #0xe8
	movs r2, #0
	bl SetBgOffset
.L0805430A:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start func_fe6_08054310
func_fe6_08054310: @ 0x08054310
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r7, r0, #0
	adds r0, #0x2c
	adds r1, r7, #0
	adds r1, #0x44
	ldr r2, [r7, #0x48]
	bl EfxAdvanceFrameLut
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	cmp r4, #0
	blt .L08054398
	ldr r5, [r7, #0x4c]
	ldr r6, [r7, #0x50]
	ldr r0, [r7, #0x54]
	lsls r4, r4, #2
	adds r0, r4, r0
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	ldr r0, [r7, #0x5c]
	adds r5, r4, r5
	ldr r1, [r5]
	adds r4, r4, r6
	ldr r2, [r4]
	bl SpellFx_WriteBgMap
	ldr r0, .L08054374 @ =gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq .L080543B6
	ldr r0, [r7, #0x5c]
	bl GetAnimPosition
	adds r1, r0, #0
	cmp r1, #0
	bne .L0805437C
	ldr r0, .L08054378 @ =gBg1Tm
	str r1, [sp]
	movs r1, #3
	movs r2, #0x14
	movs r3, #0
	bl FillBGRect
	b .L0805438C
	.align 2, 0
.L08054374: .4byte gEkrDistanceType
.L08054378: .4byte gBg1Tm
.L0805437C:
	ldr r0, .L08054394 @ =gBg1Tm+0x3A
	movs r1, #0
	str r1, [sp]
	movs r1, #3
	movs r2, #0x14
	movs r3, #0
	bl FillBGRect
.L0805438C:
	movs r0, #2
	bl EnableBgSync
	b .L080543B6
	.align 2, 0
.L08054394: .4byte gBg1Tm+0x3A
.L08054398:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r4, r0
	bne .L080543B6
	bl SpellFx_ClearBG1
	ldr r1, .L080543C0 @ =gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_ClearColorEffects
	adds r0, r7, #0
	bl Proc_Break
.L080543B6:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L080543C0: .4byte gEfxBgSemaphore

	thumb_func_start func_fe6_080543C4
func_fe6_080543C4: @ 0x080543C4
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, .L080543FC @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08054400 @ =gUnk_085D2DEC
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x2e]
	str r1, [r0, #0x44]
	ldr r0, .L08054404 @ =gUnk_0819877C
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, .L08054408 @ =gUnk_08197BE0
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L080543FC: .4byte gEfxBgSemaphore
.L08054400: .4byte gUnk_085D2DEC
.L08054404: .4byte gUnk_0819877C
.L08054408: .4byte gUnk_08197BE0

	thumb_func_start func_fe6_0805440C
func_fe6_0805440C: @ 0x0805440C
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #2
	bne .L0805444C
	movs r0, #0
	strh r0, [r4, #0x2c]
	ldr r0, [r4, #0x5c]
	ldr r2, [r4, #0x44]
	adds r1, r2, #0
	adds r2, #1
	str r2, [r4, #0x44]
	bl func_fe6_08054458
	ldrh r0, [r4, #0x2e]
	adds r0, #1
	strh r0, [r4, #0x2e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #8
	bne .L0805444C
	ldr r1, .L08054454 @ =gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
.L0805444C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08054454: .4byte gEfxBgSemaphore

	thumb_func_start func_fe6_08054458
func_fe6_08054458: @ 0x08054458
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r4, r1, #0
	ldr r1, .L08054498 @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L0805449C @ =gUnk_085D2E04
	movs r1, #3
	bl SpawnProc
	adds r5, r0, #0
	str r6, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	movs r0, #0x1e
	strh r0, [r5, #0x2e]
	ldr r1, .L080544A0 @ =gUnk_085D2E1C
	movs r0, #7
	ands r0, r4
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	str r0, [r5, #0x44]
	movs r1, #0
	movs r0, #1
	ands r0, r4
	cmp r0, #0
	beq .L080544A4
	cmp r0, #1
	beq .L080544AC
	b .L080544B8
	.align 2, 0
.L08054498: .4byte gEfxBgSemaphore
.L0805449C: .4byte gUnk_085D2E04
.L080544A0: .4byte gUnk_085D2E1C
.L080544A4:
	ldr r0, .L080544A8 @ =gUnk_085ED8CC
	b .L080544AE
	.align 2, 0
.L080544A8: .4byte gUnk_085ED8CC
.L080544AC:
	ldr r0, .L080544D4 @ =gUnk_085ED8F8
.L080544AE:
	movs r1, #0x78
	bl BasCreate
	adds r1, r0, #0
	str r1, [r5, #0x60]
.L080544B8:
	movs r0, #0xa1
	lsls r0, r0, #6
	strh r0, [r1, #8]
	ldrh r0, [r6, #2]
	strh r0, [r1, #2]
	ldrh r0, [r6, #2]
	strh r0, [r5, #0x32]
	ldrh r0, [r6, #4]
	strh r0, [r1, #4]
	ldrh r0, [r6, #4]
	strh r0, [r5, #0x3a]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L080544D4: .4byte gUnk_085ED8F8

	thumb_func_start func_fe6_080544D8
func_fe6_080544D8: @ 0x080544D8
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	ldr r5, [r6, #0x60]
	movs r2, #0x96
	lsls r2, r2, #1
	movs r0, #0x2c
	ldrsh r3, [r6, r0]
	movs r1, #0x2e
	ldrsh r0, [r6, r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	bl Interpolate
	ldr r4, .L08054550 @ =gSinLut
	ldr r2, [r6, #0x44]
	lsls r1, r2, #1
	adds r1, r1, r4
	movs r3, #0
	ldrsh r1, [r1, r3]
	adds r3, r0, #0
	muls r3, r1, r3
	adds r2, #0x40
	lsls r2, r2, #1
	adds r2, r2, r4
	movs r4, #0
	ldrsh r1, [r2, r4]
	muls r0, r1, r0
	asrs r3, r3, #0xc
	ldrh r1, [r6, #0x32]
	adds r3, r1, r3
	strh r3, [r5, #2]
	asrs r0, r0, #0xc
	ldrh r2, [r6, #0x3a]
	adds r0, r2, r0
	strh r0, [r5, #4]
	ldrh r0, [r6, #0x2c]
	adds r0, #1
	strh r0, [r6, #0x2c]
	lsls r0, r0, #0x10
	ldrh r3, [r6, #0x2e]
	lsls r1, r3, #0x10
	cmp r0, r1
	ble .L08054546
	ldr r0, .L08054554 @ =gEfxBgSemaphore
	ldr r1, [r0]
	subs r1, #1
	str r1, [r0]
	ldr r0, [r6, #0x60]
	bl BasRemove
	adds r0, r6, #0
	bl Proc_Break
.L08054546:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08054550: .4byte gSinLut
.L08054554: .4byte gEfxBgSemaphore

	thumb_func_start func_fe6_08054558
func_fe6_08054558: @ 0x08054558
	push {r4, lr}
	adds r4, r0, #0
	bl SpellFx_Begin
	bl func_fe6_08047300
	bl SpellFx_SetBG1Position
	ldr r0, .L0805457C @ =gUnk_085D2E3C
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0805457C: .4byte gUnk_085D2E3C

	thumb_func_start func_fe6_08054580
func_fe6_08054580: @ 0x08054580
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetAnimAnotherSide
	adds r5, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	movs r6, #0
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne .L080545B0
	ldr r0, [r4, #0x5c]
	bl func_fe6_08054F8C
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r0, [r4, #0x5c]
	movs r3, #2
	ldrsh r2, [r0, r3]
	movs r0, #0xf3
	b .L0805465C
.L080545B0:
	cmp r0, #0x34
	bne .L08054618
	ldr r0, [r4, #0x5c]
	movs r1, #0
	bl func_fe6_08054B98
	ldr r0, [r4, #0x5c]
	movs r1, #0
	bl func_fe6_08054D78
	ldr r3, .L08054614 @ =gDispIo
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
	strb r6, [r0]
	adds r1, r3, #0
	adds r1, #0x45
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x46
	strb r6, [r0]
	ldr r0, [r4, #0x5c]
	movs r1, #1
	movs r2, #0xc
	movs r3, #0
	bl func_fe6_08054EA0
	ldr r0, [r4, #0x5c]
	movs r1, #0x23
	movs r2, #0x19
	movs r3, #1
	bl func_fe6_08054EA0
	movs r0, #0x87
	lsls r0, r0, #1
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r2, [r4, #0x5c]
	movs r3, #2
	ldrsh r2, [r2, r3]
	b .L0805465C
	.align 2, 0
.L08054614: .4byte gDispIo
.L08054618:
	cmp r0, #0x37
	bne .L08054626
	movs r0, #9
	ldrh r1, [r5, #0x10]
	orrs r0, r1
	strh r0, [r5, #0x10]
	b .L080546A0
.L08054626:
	cmp r0, #0x71
	bne .L08054668
	ldr r0, [r4, #0x5c]
	movs r1, #0
	bl func_fe6_08054C54
	ldr r0, [r4, #0x5c]
	movs r1, #0
	bl func_fe6_08054DE8
	ldr r0, [r4, #0x5c]
	movs r1, #1
	movs r2, #0xc
	movs r3, #0
	bl func_fe6_08054EA0
	ldr r0, [r4, #0x5c]
	movs r1, #0x1d
	movs r2, #0x19
	movs r3, #1
	bl func_fe6_08054EA0
	ldr r0, .L08054664 @ =0x0000010F
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
.L0805465C:
	movs r3, #1
	bl func_fe6_0805C804
	b .L080546A0
	.align 2, 0
.L08054664: .4byte 0x0000010F
.L08054668:
	cmp r0, #0xa6
	bne .L08054674
	adds r0, r5, #0
	bl func_fe6_080451E0
	b .L080546A0
.L08054674:
	cmp r0, #0xb5
	bne .L080546A0
	bl SpellFx_Finish
	bl func_fe6_08047358
	adds r0, r5, #0
	bl GetAnimNextRoundType
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	beq .L0805469A
	movs r0, #2
	ldrh r1, [r5, #0x10]
	orrs r0, r1
	strh r0, [r5, #0x10]
.L0805469A:
	adds r0, r4, #0
	bl Proc_Break
.L080546A0:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_fe6_080546A8
func_fe6_080546A8: @ 0x080546A8
	push {r4, lr}
	adds r4, r0, #0
	bl SpellFx_Begin
	bl func_fe6_08047300
	bl SpellFx_SetBG1Position
	ldr r0, .L080546CC @ =gUnk_085D2E54
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L080546CC: .4byte gUnk_085D2E54

	thumb_func_start func_fe6_080546D0
func_fe6_080546D0: @ 0x080546D0
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetAnimAnotherSide
	adds r5, r0, #0
	bl EfxGetCamMovDuration
	adds r2, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	movs r6, #0
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne .L08054706
	ldr r0, [r4, #0x5c]
	bl func_fe6_08054F8C
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r0, [r4, #0x5c]
	movs r3, #2
	ldrsh r2, [r0, r3]
	movs r0, #0xf3
	b .L080547EE
.L08054706:
	cmp r0, #0x34
	bne .L0805476C
	ldr r0, [r4, #0x5c]
	movs r1, #1
	bl func_fe6_08054B98
	ldr r0, [r4, #0x5c]
	movs r1, #1
	bl func_fe6_08054D78
	ldr r3, .L08054768 @ =gDispIo
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
	strb r6, [r0]
	adds r1, r3, #0
	adds r1, #0x45
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x46
	strb r6, [r0]
	ldr r0, [r4, #0x5c]
	movs r1, #1
	movs r2, #0xc
	movs r3, #0
	bl func_fe6_08054EA0
	ldr r0, [r4, #0x5c]
	movs r1, #0x23
	movs r2, #0x19
	movs r3, #1
	bl func_fe6_08054EA0
	movs r0, #0x88
	lsls r0, r0, #1
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r2, [r4, #0x5c]
	movs r3, #2
	ldrsh r2, [r2, r3]
	b .L080547EE
	.align 2, 0
.L08054768: .4byte gDispIo
.L0805476C:
	cmp r0, #0x37
	bne .L0805477A
	movs r0, #9
	ldrh r1, [r5, #0x10]
	orrs r0, r1
	strh r0, [r5, #0x10]
	b .L08054840
.L0805477A:
	cmp r0, #0x71
	bne .L0805478A
	ldr r0, [r4, #0x5c]
	movs r1, #1
	rsbs r1, r1, #0
	bl NewEfxFarAttackWithDistance
	b .L08054840
.L0805478A:
	movs r3, #0x2c
	ldrsh r1, [r4, r3]
	adds r0, r2, #0
	adds r0, #0x72
	cmp r1, r0
	bne .L08054800
	ldr r0, [r4, #0x5c]
	movs r1, #1
	bl func_fe6_08054C54
	ldr r0, [r4, #0x5c]
	movs r1, #1
	bl func_fe6_08054DE8
	ldr r3, .L080547F8 @ =gDispIo
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
	strb r6, [r0]
	adds r1, r3, #0
	adds r1, #0x45
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x46
	strb r6, [r0]
	ldr r0, [r4, #0x5c]
	movs r1, #1
	movs r2, #0xc
	movs r3, #0
	bl func_fe6_08054EA0
	ldr r0, [r4, #0x5c]
	movs r1, #0x1d
	movs r2, #0x19
	movs r3, #1
	bl func_fe6_08054EA0
	ldr r0, .L080547FC @ =0x00000111
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
.L080547EE:
	movs r3, #1
	bl func_fe6_0805C804
	b .L08054840
	.align 2, 0
.L080547F8: .4byte gDispIo
.L080547FC: .4byte 0x00000111
.L08054800:
	adds r0, r2, #0
	adds r0, #0xa6
	cmp r1, r0
	bne .L08054810
	adds r0, r5, #0
	bl func_fe6_080451E0
	b .L08054840
.L08054810:
	adds r0, r2, #0
	adds r0, #0xb5
	cmp r1, r0
	bne .L08054840
	bl SpellFx_Finish
	bl func_fe6_08047358
	adds r0, r5, #0
	bl GetAnimNextRoundType
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	beq .L0805483A
	movs r0, #2
	ldrh r1, [r5, #0x10]
	orrs r0, r1
	strh r0, [r5, #0x10]
.L0805483A:
	adds r0, r4, #0
	bl Proc_Break
.L08054840:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_fe6_08054848
func_fe6_08054848: @ 0x08054848
	push {r4, lr}
	adds r4, r0, #0
	bl SpellFx_Begin
	bl func_fe6_08047300
	bl SpellFx_SetBG1Position
	ldr r0, .L0805486C @ =gUnk_085D2E6C
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0805486C: .4byte gUnk_085D2E6C

	thumb_func_start func_fe6_08054870
func_fe6_08054870: @ 0x08054870
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetAnimAnotherSide
	adds r5, r0, #0
	bl EfxGetCamMovDuration
	adds r2, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	movs r6, #0
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne .L080548A6
	ldr r0, [r4, #0x5c]
	bl func_fe6_08054F8C
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r0, [r4, #0x5c]
	movs r3, #2
	ldrsh r2, [r0, r3]
	movs r0, #0xf3
	b .L0805498E
.L080548A6:
	cmp r0, #0x34
	bne .L0805490C
	ldr r0, [r4, #0x5c]
	movs r1, #2
	bl func_fe6_08054B98
	ldr r0, [r4, #0x5c]
	movs r1, #2
	bl func_fe6_08054D78
	ldr r3, .L08054908 @ =gDispIo
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
	strb r6, [r0]
	adds r1, r3, #0
	adds r1, #0x45
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x46
	strb r6, [r0]
	ldr r0, [r4, #0x5c]
	movs r1, #1
	movs r2, #0xc
	movs r3, #0
	bl func_fe6_08054EA0
	ldr r0, [r4, #0x5c]
	movs r1, #0x23
	movs r2, #0x19
	movs r3, #1
	bl func_fe6_08054EA0
	movs r0, #0x89
	lsls r0, r0, #1
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r2, [r4, #0x5c]
	movs r3, #2
	ldrsh r2, [r2, r3]
	b .L0805498E
	.align 2, 0
.L08054908: .4byte gDispIo
.L0805490C:
	cmp r0, #0x37
	bne .L0805491A
	movs r0, #9
	ldrh r1, [r5, #0x10]
	orrs r0, r1
	strh r0, [r5, #0x10]
	b .L080549E0
.L0805491A:
	cmp r0, #0x71
	bne .L0805492A
	ldr r0, [r4, #0x5c]
	movs r1, #1
	rsbs r1, r1, #0
	bl NewEfxFarAttackWithDistance
	b .L080549E0
.L0805492A:
	movs r3, #0x2c
	ldrsh r1, [r4, r3]
	adds r0, r2, #0
	adds r0, #0x72
	cmp r1, r0
	bne .L080549A0
	ldr r0, [r4, #0x5c]
	movs r1, #2
	bl func_fe6_08054C54
	ldr r0, [r4, #0x5c]
	movs r1, #2
	bl func_fe6_08054DE8
	ldr r3, .L08054998 @ =gDispIo
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
	strb r6, [r0]
	adds r1, r3, #0
	adds r1, #0x45
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x46
	strb r6, [r0]
	ldr r0, [r4, #0x5c]
	movs r1, #1
	movs r2, #0xc
	movs r3, #0
	bl func_fe6_08054EA0
	ldr r0, [r4, #0x5c]
	movs r1, #0x1d
	movs r2, #0x19
	movs r3, #1
	bl func_fe6_08054EA0
	ldr r0, .L0805499C @ =0x00000113
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
.L0805498E:
	movs r3, #1
	bl func_fe6_0805C804
	b .L080549E0
	.align 2, 0
.L08054998: .4byte gDispIo
.L0805499C: .4byte 0x00000113
.L080549A0:
	adds r0, r2, #0
	adds r0, #0xa6
	cmp r1, r0
	bne .L080549B0
	adds r0, r5, #0
	bl func_fe6_080451E0
	b .L080549E0
.L080549B0:
	adds r0, r2, #0
	adds r0, #0xb5
	cmp r1, r0
	bne .L080549E0
	bl SpellFx_Finish
	bl func_fe6_08047358
	adds r0, r5, #0
	bl GetAnimNextRoundType
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	beq .L080549DA
	movs r0, #2
	ldrh r1, [r5, #0x10]
	orrs r0, r1
	strh r0, [r5, #0x10]
.L080549DA:
	adds r0, r4, #0
	bl Proc_Break
.L080549E0:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_fe6_080549E8
func_fe6_080549E8: @ 0x080549E8
	push {r4, lr}
	adds r4, r0, #0
	bl SpellFx_Begin
	bl func_fe6_08047300
	bl SpellFx_SetBG1Position
	ldr r0, .L08054A0C @ =gUnk_085D2E84
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08054A0C: .4byte gUnk_085D2E84

	thumb_func_start func_fe6_08054A10
func_fe6_08054A10: @ 0x08054A10
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetAnimAnotherSide
	adds r5, r0, #0
	bl EfxGetCamMovDuration
	adds r2, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	movs r6, #0
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne .L08054A4E
	ldr r0, [r4, #0x5c]
	bl func_fe6_08054F8C
	ldr r0, [r4, #0x5c]
	movs r1, #0
	bl func_fe6_080550EC
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r0, [r4, #0x5c]
	movs r3, #2
	ldrsh r2, [r0, r3]
	movs r0, #0xf3
	b .L08054B3E
.L08054A4E:
	cmp r0, #0x34
	bne .L08054AB4
	ldr r0, [r4, #0x5c]
	movs r1, #0
	bl func_fe6_08054B98
	ldr r0, [r4, #0x5c]
	movs r1, #0
	bl func_fe6_08054D78
	ldr r3, .L08054AB0 @ =gDispIo
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
	strb r6, [r0]
	adds r1, r3, #0
	adds r1, #0x45
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x46
	strb r6, [r0]
	ldr r0, [r4, #0x5c]
	movs r1, #1
	movs r2, #0xc
	movs r3, #0
	bl func_fe6_08054EA0
	ldr r0, [r4, #0x5c]
	movs r1, #0x23
	movs r2, #0x19
	movs r3, #1
	bl func_fe6_08054EA0
	movs r0, #0x87
	lsls r0, r0, #1
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r2, [r4, #0x5c]
	movs r3, #2
	ldrsh r2, [r2, r3]
	b .L08054B3E
	.align 2, 0
.L08054AB0: .4byte gDispIo
.L08054AB4:
	cmp r0, #0x37
	bne .L08054AC2
	movs r0, #9
	ldrh r1, [r5, #0x10]
	orrs r0, r1
	strh r0, [r5, #0x10]
	b .L08054B90
.L08054AC2:
	cmp r0, #0x97
	bne .L08054ADA
	ldr r0, [r4, #0x5c]
	movs r1, #1
	bl func_fe6_080550EC
	ldr r0, [r4, #0x5c]
	movs r1, #1
	rsbs r1, r1, #0
	bl NewEfxFarAttackWithDistance
	b .L08054B90
.L08054ADA:
	movs r3, #0x2c
	ldrsh r1, [r4, r3]
	adds r0, r2, #0
	adds r0, #0xa1
	cmp r1, r0
	bne .L08054B50
	ldr r0, [r4, #0x5c]
	movs r1, #0
	bl func_fe6_08054C54
	ldr r0, [r4, #0x5c]
	movs r1, #0
	bl func_fe6_08054DE8
	ldr r3, .L08054B48 @ =gDispIo
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
	strb r6, [r0]
	adds r1, r3, #0
	adds r1, #0x45
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x46
	strb r6, [r0]
	ldr r0, [r4, #0x5c]
	movs r1, #1
	movs r2, #0xc
	movs r3, #0
	bl func_fe6_08054EA0
	ldr r0, [r4, #0x5c]
	movs r1, #0x1d
	movs r2, #0x19
	movs r3, #1
	bl func_fe6_08054EA0
	ldr r0, .L08054B4C @ =0x0000010F
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
.L08054B3E:
	movs r3, #1
	bl func_fe6_0805C804
	b .L08054B90
	.align 2, 0
.L08054B48: .4byte gDispIo
.L08054B4C: .4byte 0x0000010F
.L08054B50:
	adds r0, r2, #0
	adds r0, #0xd3
	cmp r1, r0
	bne .L08054B60
	adds r0, r5, #0
	bl func_fe6_080451E0
	b .L08054B90
.L08054B60:
	adds r0, r2, #0
	adds r0, #0xdd
	cmp r1, r0
	bne .L08054B90
	bl SpellFx_Finish
	bl func_fe6_08047358
	adds r0, r5, #0
	bl GetAnimNextRoundType
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	beq .L08054B8A
	movs r0, #2
	ldrh r1, [r5, #0x10]
	orrs r0, r1
	strh r0, [r5, #0x10]
.L08054B8A:
	adds r0, r4, #0
	bl Proc_Break
.L08054B90:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_fe6_08054B98
func_fe6_08054B98: @ 0x08054B98
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r6, r1, #0
	ldr r1, .L08054BE0 @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08054BE4 @ =gUnk_085D2E9C
	movs r1, #3
	bl SpawnProc
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	str r0, [r5, #0x44]
	cmp r6, #0
	beq .L08054BF8
	cmp r6, #2
	bhi .L08054C4A
	adds r1, r5, #0
	adds r1, #0x29
	movs r0, #1
	strb r0, [r1]
	ldr r0, .L08054BE8 @ =gUnk_0811A8A4
	str r0, [r5, #0x48]
	ldr r0, .L08054BEC @ =gUnk_081AC90C
	str r0, [r5, #0x4c]
	ldr r0, .L08054BF0 @ =gUnk_081AD26C
	str r0, [r5, #0x50]
	ldr r0, .L08054BF4 @ =gUnk_081AC114
	movs r1, #0xa8
	lsls r1, r1, #5
	bl SpellFx_RegisterBgGfx
	b .L08054C4A
	.align 2, 0
.L08054BE0: .4byte gEfxBgSemaphore
.L08054BE4: .4byte gUnk_085D2E9C
.L08054BE8: .4byte gUnk_0811A8A4
.L08054BEC: .4byte gUnk_081AC90C
.L08054BF0: .4byte gUnk_081AD26C
.L08054BF4: .4byte gUnk_081AC114
.L08054BF8:
	adds r1, r5, #0
	adds r1, #0x29
	movs r0, #1
	strb r0, [r1]
	ldr r0, .L08054C30 @ =gUnk_0811A898
	str r0, [r5, #0x48]
	ldr r0, .L08054C34 @ =gUnk_081AB340
	str r0, [r5, #0x4c]
	str r0, [r5, #0x50]
	ldr r0, .L08054C38 @ =gUnk_081AB1B0
	movs r1, #0x80
	lsls r1, r1, #3
	bl SpellFx_RegisterBgGfx
	ldr r0, .L08054C3C @ =gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq .L08054C4A
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne .L08054C40
	movs r0, #1
	movs r1, #0x18
	b .L08054C44
	.align 2, 0
.L08054C30: .4byte gUnk_0811A898
.L08054C34: .4byte gUnk_081AB340
.L08054C38: .4byte gUnk_081AB1B0
.L08054C3C: .4byte gEkrDistanceType
.L08054C40:
	movs r0, #1
	movs r1, #0xe8
.L08054C44:
	movs r2, #0
	bl SetBgOffset
.L08054C4A:
	bl SpellFx_SetSomeColorEffect
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start func_fe6_08054C54
func_fe6_08054C54: @ 0x08054C54
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r6, r1, #0
	ldr r1, .L08054C9C @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08054CA0 @ =gUnk_085D2E9C
	movs r1, #3
	bl SpawnProc
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r1, #0
	movs r0, #0
	strh r0, [r5, #0x2c]
	str r0, [r5, #0x44]
	adds r0, r5, #0
	adds r0, #0x29
	strb r1, [r0]
	cmp r6, #0
	beq .L08054CB4
	cmp r6, #2
	bhi .L08054CFE
	ldr r0, .L08054CA4 @ =gUnk_0811A8AA
	str r0, [r5, #0x48]
	ldr r0, .L08054CA8 @ =gUnk_081AC90C
	str r0, [r5, #0x4c]
	ldr r0, .L08054CAC @ =gUnk_081AD26C
	str r0, [r5, #0x50]
	ldr r0, .L08054CB0 @ =gUnk_081AC114
	movs r1, #0xa8
	lsls r1, r1, #5
	bl SpellFx_RegisterBgGfx
	b .L08054CFE
	.align 2, 0
.L08054C9C: .4byte gEfxBgSemaphore
.L08054CA0: .4byte gUnk_085D2E9C
.L08054CA4: .4byte gUnk_0811A8AA
.L08054CA8: .4byte gUnk_081AC90C
.L08054CAC: .4byte gUnk_081AD26C
.L08054CB0: .4byte gUnk_081AC114
.L08054CB4:
	ldr r0, .L08054CE4 @ =gUnk_0811A89E
	str r0, [r5, #0x48]
	ldr r0, .L08054CE8 @ =gUnk_081AB340
	str r0, [r5, #0x4c]
	str r0, [r5, #0x50]
	ldr r0, .L08054CEC @ =gUnk_081AB1B0
	movs r1, #0x80
	lsls r1, r1, #3
	bl SpellFx_RegisterBgGfx
	ldr r0, .L08054CF0 @ =gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq .L08054CFE
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne .L08054CF4
	movs r0, #1
	movs r1, #0xe8
	b .L08054CF8
	.align 2, 0
.L08054CE4: .4byte gUnk_0811A89E
.L08054CE8: .4byte gUnk_081AB340
.L08054CEC: .4byte gUnk_081AB1B0
.L08054CF0: .4byte gEkrDistanceType
.L08054CF4:
	movs r0, #1
	movs r1, #0x18
.L08054CF8:
	movs r2, #0
	bl SetBgOffset
.L08054CFE:
	bl SpellFx_SetSomeColorEffect
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start func_fe6_08054D08
func_fe6_08054D08: @ 0x08054D08
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl EfxAdvanceFrameLut
	lsls r0, r0, #0x10
	asrs r3, r0, #0x10
	cmp r3, #0
	blt .L08054D3A
	ldr r1, [r4, #0x4c]
	ldr r2, [r4, #0x50]
	ldr r0, [r4, #0x5c]
	lsls r4, r3, #2
	adds r4, r4, r3
	lsls r3, r4, #4
	subs r3, r3, r4
	lsls r3, r3, #4
	adds r1, r1, r3
	adds r2, r2, r3
	bl EfxCreateBackAnim
	b .L08054D6C
.L08054D3A:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r3, r0
	bne .L08054D6C
	adds r0, r4, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #0
	bne .L08054D54
	bl SpellFx_ClearBG1
	bl SpellFx_ClearColorEffects
.L08054D54:
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r1, .L08054D74 @ =gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
.L08054D6C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08054D74: .4byte gEfxBgSemaphore

	thumb_func_start func_fe6_08054D78
func_fe6_08054D78: @ 0x08054D78
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, .L08054DA0 @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08054DA4 @ =gUnk_085D2EB4
	movs r1, #3
	bl SpawnProc
	adds r1, r0, #0
	str r4, [r1, #0x5c]
	movs r0, #0
	strh r0, [r1, #0x2c]
	str r0, [r1, #0x44]
	cmp r5, #0
	bne .L08054DAC
	ldr r0, .L08054DA8 @ =gUnk_0811A8B0
	b .L08054DBA
	.align 2, 0
.L08054DA0: .4byte gEfxBgSemaphore
.L08054DA4: .4byte gUnk_085D2EB4
.L08054DA8: .4byte gUnk_0811A8B0
.L08054DAC:
	cmp r5, #1
	bne .L08054DB8
	ldr r0, .L08054DB4 @ =gUnk_0811A934
	b .L08054DBA
	.align 2, 0
.L08054DB4: .4byte gUnk_0811A934
.L08054DB8:
	ldr r0, .L08054DC4 @ =gUnk_0811A966
.L08054DBA:
	str r0, [r1, #0x48]
	cmp r5, #0
	bne .L08054DCC
	ldr r0, .L08054DC8 @ =gUnk_081ABCA0
	b .L08054DDA
	.align 2, 0
.L08054DC4: .4byte gUnk_0811A966
.L08054DC8: .4byte gUnk_081ABCA0
.L08054DCC:
	cmp r5, #1
	bne .L08054DD8
	ldr r0, .L08054DD4 @ =gUnk_081ADDEC
	b .L08054DDA
	.align 2, 0
.L08054DD4: .4byte gUnk_081ADDEC
.L08054DD8:
	ldr r0, .L08054DE4 @ =gUnk_081ADBCC
.L08054DDA:
	str r0, [r1, #0x4c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08054DE4: .4byte gUnk_081ADBCC

	thumb_func_start func_fe6_08054DE8
func_fe6_08054DE8: @ 0x08054DE8
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, .L08054E10 @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08054E14 @ =gUnk_085D2EB4
	movs r1, #3
	bl SpawnProc
	adds r1, r0, #0
	str r4, [r1, #0x5c]
	movs r0, #0
	strh r0, [r1, #0x2c]
	str r0, [r1, #0x44]
	cmp r5, #0
	bne .L08054E1C
	ldr r0, .L08054E18 @ =gUnk_0811A8F2
	b .L08054E2A
	.align 2, 0
.L08054E10: .4byte gEfxBgSemaphore
.L08054E14: .4byte gUnk_085D2EB4
.L08054E18: .4byte gUnk_0811A8F2
.L08054E1C:
	cmp r5, #1
	bne .L08054E28
	ldr r0, .L08054E24 @ =gUnk_0811A934
	b .L08054E2A
	.align 2, 0
.L08054E24: .4byte gUnk_0811A934
.L08054E28:
	ldr r0, .L08054E34 @ =gUnk_0811A966
.L08054E2A:
	str r0, [r1, #0x48]
	cmp r5, #0
	bne .L08054E3C
	ldr r0, .L08054E38 @ =gUnk_081ABCA0
	b .L08054E4A
	.align 2, 0
.L08054E34: .4byte gUnk_0811A966
.L08054E38: .4byte gUnk_081ABCA0
.L08054E3C:
	cmp r5, #1
	bne .L08054E48
	ldr r0, .L08054E44 @ =gUnk_081ADDEC
	b .L08054E4A
	.align 2, 0
.L08054E44: .4byte gUnk_081ADDEC
.L08054E48:
	ldr r0, .L08054E54 @ =gUnk_081ADBCC
.L08054E4A:
	str r0, [r1, #0x4c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08054E54: .4byte gUnk_081ADBCC

	thumb_func_start func_fe6_08054E58
func_fe6_08054E58: @ 0x08054E58
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
	blt .L08054E7E
	ldr r0, [r4, #0x4c]
	lsls r1, r1, #5
	adds r0, r0, r1
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	b .L08054E94
.L08054E7E:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne .L08054E94
	ldr r1, .L08054E9C @ =gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
.L08054E94:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08054E9C: .4byte gEfxBgSemaphore

	thumb_func_start func_fe6_08054EA0
func_fe6_08054EA0: @ 0x08054EA0
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	mov r8, r3
	ldr r1, .L08054ED4 @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08054ED8 @ =gUnk_085D2ED4
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
.L08054ED4: .4byte gEfxBgSemaphore
.L08054ED8: .4byte gUnk_085D2ED4

	thumb_func_start func_fe6_08054EDC
func_fe6_08054EDC: @ 0x08054EDC
	push {lr}
	adds r1, r0, #0
	ldrh r0, [r1, #0x2c]
	subs r0, #1
	strh r0, [r1, #0x2c]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne .L08054EF2
	adds r0, r1, #0
	bl Proc_Break
.L08054EF2:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_fe6_08054EF8
func_fe6_08054EF8: @ 0x08054EF8
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	movs r2, #0x2e
	ldrsh r0, [r4, r2]
	cmp r1, r0
	ble .L08054F20
	ldr r1, .L08054F1C @ =gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
	b .L08054F7E
	.align 2, 0
.L08054F1C: .4byte gEfxBgSemaphore
.L08054F20:
	adds r0, r4, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #0
	bne .L08054F3C
	movs r0, #0x2c
	ldrsh r3, [r4, r0]
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0x10
	b .L08054F4C
.L08054F3C:
	movs r2, #0x2c
	ldrsh r3, [r4, r2]
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #0x10
	movs r2, #0
.L08054F4C:
	bl Interpolate
	adds r5, r0, #0
	ldr r3, .L08054F88 @ =gDispIo
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
.L08054F7E:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08054F88: .4byte gDispIo

	thumb_func_start func_fe6_08054F8C
func_fe6_08054F8C: @ 0x08054F8C
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, .L08054FD8 @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08054FDC @ =gUnk_085D2EF4
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #0x33
	strh r0, [r4, #0x2e]
	ldr r3, .L08054FE0 @ =gUnk_085F0A14
	str r3, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl EfxCreateFrontAnim
	str r0, [r4, #0x60]
	ldr r0, .L08054FE4 @ =gUnk_081AC0F4
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, .L08054FE8 @ =gUnk_081ABEA0
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08054FD8: .4byte gEfxBgSemaphore
.L08054FDC: .4byte gUnk_085D2EF4
.L08054FE0: .4byte gUnk_085F0A14
.L08054FE4: .4byte gUnk_081AC0F4
.L08054FE8: .4byte gUnk_081ABEA0

	thumb_func_start func_fe6_08054FEC
func_fe6_08054FEC: @ 0x08054FEC
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, .L0805503C @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08055040 @ =gUnk_085D2F0C
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #0x33
	strh r0, [r4, #0x2e]
	movs r0, #0x34
	strh r0, [r4, #0x30]
	ldr r3, .L08055044 @ =gUnk_085F0A14
	str r3, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl EfxCreateFrontAnim
	str r0, [r4, #0x60]
	ldr r0, .L08055048 @ =gUnk_081AC0F4
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, .L0805504C @ =gUnk_081ABEA0
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0805503C: .4byte gEfxBgSemaphore
.L08055040: .4byte gUnk_085D2F0C
.L08055044: .4byte gUnk_085F0A14
.L08055048: .4byte gUnk_081AC0F4
.L0805504C: .4byte gUnk_081ABEA0

	thumb_func_start func_fe6_08055050
func_fe6_08055050: @ 0x08055050
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r4, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	bne .L08055078
	ldr r0, .L08055080 @ =gEfxBgSemaphore
	ldr r1, [r0]
	subs r1, #1
	str r1, [r0]
	ldr r0, [r4, #0x60]
	bl BasRemove
	adds r0, r4, #0
	bl Proc_Break
.L08055078:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08055080: .4byte gEfxBgSemaphore

	thumb_func_start func_fe6_08055084
func_fe6_08055084: @ 0x08055084
	push {r4, r5, lr}
	adds r2, r0, #0
	ldr r3, [r2, #0x60]
	ldrh r0, [r2, #0x2c]
	adds r0, #1
	movs r4, #0
	strh r0, [r2, #0x2c]
	lsls r0, r0, #0x10
	ldrh r5, [r2, #0x2e]
	lsls r1, r5, #0x10
	cmp r0, r1
	bne .L080550AC
	ldr r0, .L080550B4 @ =gUnk_085F0AA4
	str r0, [r3, #0x24]
	str r0, [r3, #0x20]
	strh r4, [r3, #6]
	strh r4, [r2, #0x2c]
	adds r0, r2, #0
	bl Proc_Break
.L080550AC:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L080550B4: .4byte gUnk_085F0AA4

	thumb_func_start func_fe6_080550B8
func_fe6_080550B8: @ 0x080550B8
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r4, #0x30]
	lsls r1, r2, #0x10
	cmp r0, r1
	bne .L080550E0
	ldr r0, .L080550E8 @ =gEfxBgSemaphore
	ldr r1, [r0]
	subs r1, #1
	str r1, [r0]
	ldr r0, [r4, #0x60]
	bl BasRemove
	adds r0, r4, #0
	bl Proc_Break
.L080550E0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L080550E8: .4byte gEfxBgSemaphore

	thumb_func_start func_fe6_080550EC
func_fe6_080550EC: @ 0x080550EC
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r1, .L0805511C @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08055120 @ =gUnk_085D2F2C
	movs r1, #3
	bl SpawnProc
	adds r1, r0, #0
	str r5, [r1, #0x5c]
	movs r0, #0
	strh r0, [r1, #0x2c]
	adds r0, r1, #0
	adds r0, #0x29
	strb r4, [r0]
	cmp r4, #0
	bne .L08055124
	movs r0, #0x2b
	strh r0, [r1, #0x2e]
	movs r0, #0x44
	b .L0805512A
	.align 2, 0
.L0805511C: .4byte gEfxBgSemaphore
.L08055120: .4byte gUnk_085D2F2C
.L08055124:
	movs r0, #0x1f
	strh r0, [r1, #0x2e]
	movs r0, #0x3d
.L0805512A:
	strh r0, [r1, #0x30]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_fe6_08055134
func_fe6_08055134: @ 0x08055134
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r4, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	bne .L080551F2
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r4, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #0
	bne .L0805519A
	ldr r0, .L0805517C @ =gUnk_085F1FC0
	mov r8, r0
	ldr r7, .L08055180 @ =gUnk_085F35C0
	ldr r0, .L08055184 @ =gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq .L08055188
	ldr r0, [r4, #0x5c]
	bl GetAnimPosition
	movs r5, #0x88
	cmp r0, #0
	bne .L08055196
	movs r5, #0x68
	b .L08055196
	.align 2, 0
.L0805517C: .4byte gUnk_085F1FC0
.L08055180: .4byte gUnk_085F35C0
.L08055184: .4byte gEkrDistanceType
.L08055188:
	ldr r0, [r4, #0x5c]
	bl GetAnimPosition
	movs r5, #0x70
	cmp r0, #0
	bne .L08055196
	movs r5, #0x80
.L08055196:
	movs r6, #0x4e
	b .L080551D8
.L0805519A:
	ldr r2, .L080551BC @ =gUnk_085F2034
	mov r8, r2
	ldr r7, .L080551C0 @ =gUnk_085F3634
	ldr r0, .L080551C4 @ =gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq .L080551C8
	ldr r0, [r4, #0x5c]
	bl GetAnimPosition
	movs r5, #0x4c
	cmp r0, #0
	bne .L080551D6
	movs r5, #0xa4
	b .L080551D6
	.align 2, 0
.L080551BC: .4byte gUnk_085F2034
.L080551C0: .4byte gUnk_085F3634
.L080551C4: .4byte gEkrDistanceType
.L080551C8:
	ldr r0, [r4, #0x5c]
	bl GetAnimPosition
	movs r5, #0x64
	cmp r0, #0
	bne .L080551D6
	movs r5, #0x8c
.L080551D6:
	movs r6, #0x40
.L080551D8:
	ldr r0, [r4, #0x5c]
	mov r2, r8
	str r2, [sp]
	adds r1, r7, #0
	adds r3, r7, #0
	bl EfxCreateFrontAnim
	str r0, [r4, #0x60]
	strh r5, [r0, #2]
	strh r6, [r0, #4]
	adds r0, r4, #0
	bl Proc_Break
.L080551F2:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_fe6_08055200
func_fe6_08055200: @ 0x08055200
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r4, #0x30]
	lsls r1, r2, #0x10
	cmp r0, r1
	bne .L08055228
	ldr r0, .L08055230 @ =gEfxBgSemaphore
	ldr r1, [r0]
	subs r1, #1
	str r1, [r0]
	ldr r0, [r4, #0x60]
	bl BasRemove
	adds r0, r4, #0
	bl Proc_Break
.L08055228:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08055230: .4byte gEfxBgSemaphore

	thumb_func_start func_fe6_08055234
func_fe6_08055234: @ 0x08055234
	push {r4, lr}
	adds r4, r0, #0
	bl SpellFx_Begin
	bl func_fe6_08047300
	bl SpellFx_SetBG1Position
	ldr r0, .L08055260 @ =gUnk_085D2F4C
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r2, #0
	movs r1, #0
	strh r1, [r0, #0x2c]
	adds r0, #0x29
	strb r2, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08055260: .4byte gUnk_085D2F4C

	thumb_func_start func_fe6_08055264
func_fe6_08055264: @ 0x08055264
	push {r4, lr}
	adds r4, r0, #0
	bl SpellFx_Begin
	bl func_fe6_08047300
	bl SpellFx_SetBG1Position
	ldr r0, .L08055290 @ =gUnk_085D2F4C
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	adds r0, #0x29
	movs r1, #1
	strb r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08055290: .4byte gUnk_085D2F4C

	thumb_func_start func_fe6_08055294
func_fe6_08055294: @ 0x08055294
	push {r4, r5, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	movs r5, #0
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #1
	bne .L080552C2
	ldr r0, [r4, #0x5c]
	bl func_fe6_08054FEC
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r0, [r4, #0x5c]
	movs r3, #2
	ldrsh r2, [r0, r3]
	movs r0, #0xf3
	movs r3, #1
	bl func_fe6_0805C804
	b .L08055358
.L080552C2:
	cmp r1, #0x34
	bne .L080552DA
	ldr r0, [r4, #0x5c]
	bl func_fe6_08055364
	ldr r0, [r4, #0x5c]
	adds r1, r4, #0
	adds r1, #0x29
	ldrb r1, [r1]
	bl func_fe6_08055434
	b .L08055358
.L080552DA:
	cmp r1, #0xb7
	bne .L08055344
	movs r0, #0x8a
	lsls r0, r0, #1
	movs r1, #0x80
	lsls r1, r1, #1
	movs r2, #0x78
	movs r3, #0
	bl func_fe6_0805C804
	ldr r0, [r4, #0x5c]
	bl func_fe6_080554C8
	ldr r0, [r4, #0x5c]
	adds r1, r4, #0
	adds r1, #0x29
	ldrb r1, [r1]
	bl func_fe6_08055628
	ldr r3, .L08055340 @ =gDispIo
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
	strb r5, [r0]
	adds r1, r3, #0
	adds r1, #0x45
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x46
	strb r5, [r0]
	ldr r0, [r4, #0x5c]
	movs r1, #1
	movs r2, #0x14
	movs r3, #0
	bl func_fe6_08054EA0
	ldr r0, [r4, #0x5c]
	movs r1, #0xb4
	movs r2, #0x28
	movs r3, #1
	bl func_fe6_08054EA0
	b .L08055358
	.align 2, 0
.L08055340: .4byte gDispIo
.L08055344:
	ldr r0, .L08055360 @ =0x000001C5
	cmp r1, r0
	bne .L08055358
	bl SpellFx_Finish
	bl func_fe6_08047358
	adds r0, r4, #0
	bl Proc_Break
.L08055358:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08055360: .4byte 0x000001C5

	thumb_func_start func_fe6_08055364
func_fe6_08055364: @ 0x08055364
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, .L080553A0 @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L080553A4 @ =gUnk_085D2F64
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, .L080553A8 @ =gUnk_0811A9A8
	str r1, [r0, #0x48]
	ldr r1, .L080553AC @ =gUnk_085D2F7C
	str r1, [r0, #0x4c]
	str r1, [r0, #0x50]
	ldr r0, .L080553B0 @ =gUnk_081AB1B0
	movs r1, #0x80
	lsls r1, r1, #3
	bl SpellFx_RegisterBgGfx
	bl SpellFx_SetSomeColorEffect
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L080553A0: .4byte gEfxBgSemaphore
.L080553A4: .4byte gUnk_085D2F64
.L080553A8: .4byte gUnk_0811A9A8
.L080553AC: .4byte gUnk_085D2F7C
.L080553B0: .4byte gUnk_081AB1B0

	thumb_func_start func_fe6_080553B4
func_fe6_080553B4: @ 0x080553B4
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetAnimAnotherSide
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
	blt .L0805540C
	ldr r1, [r4, #0x4c]
	ldr r2, [r4, #0x50]
	lsls r0, r5, #2
	adds r1, r0, r1
	ldr r1, [r1]
	adds r0, r0, r2
	ldr r2, [r0]
	adds r0, r6, #0
	bl SpellFx_WriteBgMap
	ldr r0, .L08055404 @ =gUnk_0811A9BA
	lsls r1, r5, #1
	adds r0, r1, r0
	ldrh r0, [r0]
	ldr r2, .L08055408 @ =gUnk_0811A9C2
	adds r1, r1, r2
	ldrh r2, [r1]
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #0
	bl func_fe6_0805C804
	b .L0805542A
	.align 2, 0
.L08055404: .4byte gUnk_0811A9BA
.L08055408: .4byte gUnk_0811A9C2
.L0805540C:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r5, r0
	bne .L0805542A
	bl SpellFx_ClearBG1
	ldr r1, .L08055430 @ =gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_ClearColorEffects
	adds r0, r4, #0
	bl Proc_Break
.L0805542A:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08055430: .4byte gEfxBgSemaphore

	thumb_func_start func_fe6_08055434
func_fe6_08055434: @ 0x08055434
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, .L08055460 @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08055464 @ =gUnk_085D2F8C
	movs r1, #3
	bl SpawnProc
	adds r1, r0, #0
	str r4, [r1, #0x5c]
	movs r0, #0
	strh r0, [r1, #0x2c]
	str r0, [r1, #0x44]
	ldr r0, .L08055468 @ =gUnk_0811A9CA
	str r0, [r1, #0x48]
	cmp r5, #0
	bne .L08055470
	ldr r0, .L0805546C @ =gUnk_081AE88C
	b .L08055472
	.align 2, 0
.L08055460: .4byte gEfxBgSemaphore
.L08055464: .4byte gUnk_085D2F8C
.L08055468: .4byte gUnk_0811A9CA
.L0805546C: .4byte gUnk_081AE88C
.L08055470:
	ldr r0, .L0805547C @ =gUnk_081AEA8C
.L08055472:
	str r0, [r1, #0x4c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0805547C: .4byte gUnk_081AEA8C

	thumb_func_start func_fe6_08055480
func_fe6_08055480: @ 0x08055480
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
	blt .L080554A6
	ldr r0, [r4, #0x4c]
	lsls r1, r1, #5
	adds r0, r0, r1
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	b .L080554BC
.L080554A6:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne .L080554BC
	ldr r1, .L080554C4 @ =gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
.L080554BC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L080554C4: .4byte gEfxBgSemaphore

	thumb_func_start func_fe6_080554C8
func_fe6_080554C8: @ 0x080554C8
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r1, .L0805555C @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08055560 @ =gUnk_085D2FAC
	movs r1, #3
	bl SpawnProc
	str r5, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, .L08055564 @ =gUnk_0811AACC
	str r1, [r0, #0x48]
	ldr r1, .L08055568 @ =gUnk_085D2FC4
	str r1, [r0, #0x4c]
	str r1, [r0, #0x50]
	ldr r0, .L0805556C @ =gUnk_081AC114
	movs r1, #0xa8
	lsls r1, r1, #5
	bl SpellFx_RegisterBgGfx
	ldr r4, .L08055570 @ =gDispIo
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r2, [r4, #0xc]
	ands r0, r2
	strb r0, [r4, #0xc]
	adds r0, r1, #0
	ldrb r2, [r4, #0x14]
	ands r0, r2
	movs r2, #1
	orrs r0, r2
	strb r0, [r4, #0x14]
	ldrb r0, [r4, #0x10]
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	strb r1, [r4, #0x10]
	movs r0, #3
	ldrb r1, [r4, #0x18]
	orrs r0, r1
	strb r0, [r4, #0x18]
	bl func_fe6_08047C1C
	ldr r0, .L08055574 @ =0x0000F3FF
	ldrh r2, [r5, #8]
	ands r0, r2
	movs r2, #0x80
	lsls r2, r2, #3
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r5, #8]
	bl SpellFx_SetSomeColorEffect
	ldr r0, .L08055578 @ =0x0000FFE0
	ldrh r1, [r4, #0x3c]
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	ldr r1, .L0805557C @ =0x0000E0FF
	ands r0, r1
	movs r2, #0x80
	lsls r2, r2, #4
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r4, #0x3c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0805555C: .4byte gEfxBgSemaphore
.L08055560: .4byte gUnk_085D2FAC
.L08055564: .4byte gUnk_0811AACC
.L08055568: .4byte gUnk_085D2FC4
.L0805556C: .4byte gUnk_081AC114
.L08055570: .4byte gDispIo
.L08055574: .4byte 0x0000F3FF
.L08055578: .4byte 0x0000FFE0
.L0805557C: .4byte 0x0000E0FF

	thumb_func_start func_fe6_08055580
func_fe6_08055580: @ 0x08055580
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetAnimAnotherSide
	adds r5, r0, #0
	ldr r6, [r4, #0x5c]
	adds r0, r4, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl EfxAdvanceFrameLut
	lsls r0, r0, #0x10
	asrs r3, r0, #0x10
	cmp r3, #0
	blt .L080555BA
	ldr r1, [r4, #0x4c]
	ldr r2, [r4, #0x50]
	lsls r0, r3, #2
	adds r1, r0, r1
	ldr r1, [r1]
	adds r0, r0, r2
	ldr r2, [r0]
	adds r0, r5, #0
	bl SpellFx_WriteBgMap
	b .L08055614
.L080555BA:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r3, r0
	bne .L08055614
	bl SpellFx_ClearBG1
	ldr r1, .L0805561C @ =gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	ldr r3, .L08055620 @ =gDispIo
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r2, [r3, #0xc]
	ands r0, r2
	strb r0, [r3, #0xc]
	adds r0, r1, #0
	ldrb r2, [r3, #0x10]
	ands r0, r2
	movs r2, #1
	orrs r0, r2
	strb r0, [r3, #0x10]
	ldrb r0, [r3, #0x14]
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	strb r1, [r3, #0x14]
	movs r0, #3
	ldrb r1, [r3, #0x18]
	orrs r0, r1
	strb r0, [r3, #0x18]
	ldr r0, .L08055624 @ =0x0000F3FF
	ldrh r2, [r6, #8]
	ands r0, r2
	movs r2, #0x80
	lsls r2, r2, #4
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r6, #8]
	bl SpellFx_ClearColorEffects
	adds r0, r4, #0
	bl Proc_Break
.L08055614:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L0805561C: .4byte gEfxBgSemaphore
.L08055620: .4byte gDispIo
.L08055624: .4byte 0x0000F3FF

	thumb_func_start func_fe6_08055628
func_fe6_08055628: @ 0x08055628
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, .L08055654 @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08055658 @ =gUnk_085D2FC8
	movs r1, #3
	bl SpawnProc
	adds r1, r0, #0
	str r4, [r1, #0x5c]
	movs r0, #0
	strh r0, [r1, #0x2c]
	str r0, [r1, #0x44]
	ldr r0, .L0805565C @ =gUnk_0811AAD2
	str r0, [r1, #0x48]
	cmp r5, #0
	bne .L08055664
	ldr r0, .L08055660 @ =gUnk_081ABCA0
	b .L08055666
	.align 2, 0
.L08055654: .4byte gEfxBgSemaphore
.L08055658: .4byte gUnk_085D2FC8
.L0805565C: .4byte gUnk_0811AAD2
.L08055660: .4byte gUnk_081ABCA0
.L08055664:
	ldr r0, .L08055670 @ =gUnk_081AEC8C
.L08055666:
	str r0, [r1, #0x4c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08055670: .4byte gUnk_081AEC8C

	thumb_func_start func_fe6_08055674
func_fe6_08055674: @ 0x08055674
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
	blt .L0805569A
	ldr r0, [r4, #0x4c]
	lsls r1, r1, #5
	adds r0, r0, r1
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	b .L080556B0
.L0805569A:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne .L080556B0
	ldr r1, .L080556B8 @ =gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
.L080556B0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L080556B8: .4byte gEfxBgSemaphore

	thumb_func_start func_fe6_080556BC
func_fe6_080556BC: @ 0x080556BC
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl func_fe6_08047300
	bl SpellFx_SetBG1Position
	ldr r0, .L080556F4 @ =gUnk_085D2FE8
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r5, #0
	bl GetAnimRoundTypeAnotherSide
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl CheckRoundMiss
	adds r4, #0x29
	strb r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L080556F4: .4byte gUnk_085D2FE8

	thumb_func_start func_fe6_080556F8
func_fe6_080556F8: @ 0x080556F8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetAnimAnotherSide
	adds r6, r0, #0
	bl EfxGetCamMovDuration
	adds r5, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	movs r1, #0
	mov r8, r1
	movs r7, #0
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne .L0805572E
	ldr r0, [r4, #0x5c]
	movs r1, #1
	rsbs r1, r1, #0
	bl NewEfxFarAttackWithDistance
.L0805572E:
	movs r2, #0x2c
	ldrsh r1, [r4, r2]
	adds r0, r5, #1
	cmp r1, r0
	bne .L080557A4
	adds r0, r6, #0
	bl func_fe6_0805581C
	movs r5, #8
	str r5, [sp]
	str r7, [sp, #4]
	adds r0, r6, #0
	movs r1, #0x28
	movs r2, #0x1e
	movs r3, #0x10
	bl func_fe6_0804CD88
	movs r4, #0x10
	str r4, [sp]
	str r7, [sp, #4]
	adds r0, r6, #0
	movs r1, #0x47
	movs r2, #0x1e
	movs r3, #8
	bl func_fe6_0804CD88
	str r5, [sp]
	str r7, [sp, #4]
	adds r0, r6, #0
	movs r1, #0x66
	movs r2, #0x1e
	movs r3, #0x10
	bl func_fe6_0804CD88
	str r4, [sp]
	str r7, [sp, #4]
	adds r0, r6, #0
	movs r1, #0x85
	movs r2, #0x1e
	movs r3, #8
	bl func_fe6_0804CD88
	str r7, [sp]
	str r7, [sp, #4]
	adds r0, r6, #0
	movs r1, #0xa4
	movs r2, #0x3c
	movs r3, #0x10
	bl func_fe6_0804CD88
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #2
	ldrsh r2, [r6, r0]
	movs r0, #0xfd
	movs r3, #1
	bl func_fe6_0805C804
	b .L08055810
.L080557A4:
	adds r0, r5, #0
	adds r0, #0x50
	cmp r1, r0
	bne .L080557B4
	adds r0, r6, #0
	bl func_fe6_080558D4
	b .L08055810
.L080557B4:
	adds r0, r5, #0
	adds r0, #0xa4
	cmp r1, r0
	bne .L080557CA
	adds r0, r6, #0
	movs r1, #1
	movs r2, #5
	movs r3, #0
	bl NewEfxFlashUnit
	b .L08055810
.L080557CA:
	adds r0, r5, #0
	adds r0, #0xc8
	cmp r1, r0
	bne .L080557F0
	movs r0, #9
	ldrh r1, [r6, #0x10]
	orrs r0, r1
	strh r0, [r6, #0x10]
	adds r0, r4, #0
	adds r0, #0x29
	ldrb r1, [r0]
	adds r0, r6, #0
	bl StartBattleAnimStatusChgHitEffects
	adds r0, r6, #0
	movs r1, #0
	bl SetUnitEfxDebuff
	b .L08055810
.L080557F0:
	movs r2, #0x96
	lsls r2, r2, #1
	adds r0, r5, r2
	cmp r1, r0
	bne .L08055810
	movs r0, #2
	ldrh r1, [r6, #0x10]
	orrs r0, r1
	strh r0, [r6, #0x10]
	bl SpellFx_Finish
	bl func_fe6_08047358
	adds r0, r4, #0
	bl Proc_Break
.L08055810:
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start func_fe6_0805581C
func_fe6_0805581C: @ 0x0805581C
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, .L08055858 @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L0805585C @ =gUnk_085D3000
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, .L08055860 @ =gUnk_0811ABB0
	str r1, [r0, #0x48]
	ldr r1, .L08055864 @ =gUnk_085D3018
	str r1, [r0, #0x4c]
	str r1, [r0, #0x50]
	ldr r1, .L08055868 @ =gUnk_085D304C
	str r1, [r0, #0x54]
	ldr r0, .L0805586C @ =Pal_Unk_081B1710
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	bl SpellFx_SetSomeColorEffect
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08055858: .4byte gEfxBgSemaphore
.L0805585C: .4byte gUnk_085D3000
.L08055860: .4byte gUnk_0811ABB0
.L08055864: .4byte gUnk_085D3018
.L08055868: .4byte gUnk_085D304C
.L0805586C: .4byte Pal_Unk_081B1710

	thumb_func_start func_fe6_08055870
func_fe6_08055870: @ 0x08055870
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl EfxAdvanceFrameLut
	lsls r0, r0, #0x10
	asrs r3, r0, #0x10
	cmp r3, #0
	blt .L080558AC
	ldr r1, [r4, #0x4c]
	ldr r2, [r4, #0x50]
	ldr r5, [r4, #0x54]
	ldr r0, [r4, #0x5c]
	lsls r4, r3, #2
	adds r1, r4, r1
	ldr r1, [r1]
	adds r2, r4, r2
	ldr r2, [r2]
	bl SpellFx_WriteBgMap
	adds r4, r4, r5
	ldr r0, [r4]
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	b .L080558CA
.L080558AC:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r3, r0
	bne .L080558CA
	bl SpellFx_ClearBG1
	ldr r1, .L080558D0 @ =gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_ClearColorEffects
	adds r0, r4, #0
	bl Proc_Break
.L080558CA:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L080558D0: .4byte gEfxBgSemaphore

	thumb_func_start func_fe6_080558D4
func_fe6_080558D4: @ 0x080558D4
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r1, .L08055910 @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08055914 @ =gUnk_085D3080
	movs r1, #3
	bl SpawnProc
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	ldr r3, .L08055918 @ =gUnk_085F63A8
	str r3, [sp]
	adds r0, r4, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl EfxCreateFrontAnim
	adds r6, r0, #0
	str r6, [r5, #0x60]
	adds r0, r4, #0
	bl GetAnimPosition
	cmp r0, #0
	bne .L0805591C
	ldrh r0, [r6, #2]
	subs r0, #8
	b .L08055920
	.align 2, 0
.L08055910: .4byte gEfxBgSemaphore
.L08055914: .4byte gUnk_085D3080
.L08055918: .4byte gUnk_085F63A8
.L0805591C:
	ldrh r0, [r6, #2]
	adds r0, #8
.L08055920:
	strh r0, [r6, #2]
	ldrh r0, [r6, #4]
	subs r0, #8
	strh r0, [r6, #4]
	ldr r0, .L08055944 @ =gUnk_081B7650
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, .L08055948 @ =gUnk_081B7468
	movs r1, #0x80
	lsls r1, r1, #4
	bl SpellFx_RegisterObjGfx
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08055944: .4byte gUnk_081B7650
.L08055948: .4byte gUnk_081B7468

	thumb_func_start func_fe6_0805594C
func_fe6_0805594C: @ 0x0805594C
	ldr r1, .L08055958 @ =gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bx lr
	.align 2, 0
.L08055958: .4byte gEfxBgSemaphore

	thumb_func_start func_fe6_0805595C
func_fe6_0805595C: @ 0x0805595C
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl func_fe6_08047300
	bl SpellFx_SetBG1Position
	ldr r0, .L08055994 @ =gUnk_085D30A0
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r5, #0
	bl GetAnimRoundTypeAnotherSide
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl CheckRoundMiss
	adds r4, #0x29
	strb r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08055994: .4byte gUnk_085D30A0

	thumb_func_start func_fe6_08055998
func_fe6_08055998: @ 0x08055998
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetAnimAnotherSide
	adds r5, r0, #0
	bl EfxGetCamMovDuration
	adds r6, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	movs r1, #0
	mov r8, r1
	movs r7, #0
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne .L080559DC
	ldr r0, [r4, #0x5c]
	bl func_fe6_08055B84
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r0, [r4, #0x5c]
	movs r3, #2
	ldrsh r2, [r0, r3]
	movs r0, #0xfa
	movs r3, #1
	bl func_fe6_0805C804
.L080559DC:
	ldrh r0, [r4, #0x2c]
	cmp r0, #0x29
	bne .L080559EE
	ldr r0, [r4, #0x5c]
	movs r1, #1
	rsbs r1, r1, #0
	bl NewEfxFarAttackWithDistance
	b .L08055A92
.L080559EE:
	movs r3, #0x2c
	ldrsh r1, [r4, r3]
	adds r0, r6, #0
	adds r0, #0x44
	cmp r1, r0
	bne .L08055A22
	ldr r0, [r4, #0x5c]
	bl func_fe6_08055AA0
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #2
	ldrsh r2, [r5, r0]
	movs r0, #0xfb
	movs r3, #1
	bl func_fe6_0805C804
	ldr r0, [r4, #0x5c]
	str r7, [sp]
	str r7, [sp, #4]
	movs r1, #0x42
	movs r2, #0x14
	movs r3, #0x10
	bl func_fe6_0804CD88
	b .L08055A92
.L08055A22:
	adds r0, r6, #0
	adds r0, #0x86
	cmp r1, r0
	bne .L08055A74
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
	movs r0, #0xfc
	movs r3, #1
	bl func_fe6_0805C804
	bl func_fe6_0805BD8C
	movs r0, #9
	ldrh r1, [r5, #0x10]
	orrs r0, r1
	strh r0, [r5, #0x10]
	adds r6, r4, #0
	adds r6, #0x29
	ldrb r1, [r6]
	adds r0, r5, #0
	bl StartBattleAnimStatusChgHitEffects
	ldr r0, [r4, #0x5c]
	movs r1, #0xa
	bl NewEfxFlashBgWhite
	ldrb r0, [r6]
	cmp r0, #0
	bne .L08055A92
	adds r0, r5, #0
	bl GetUnitEfxDebuff
	cmp r0, #0
	bne .L08055A92
	adds r0, r5, #0
	movs r1, #3
	bl SetUnitEfxDebuff
	b .L08055A92
.L08055A74:
	adds r0, r6, #0
	adds r0, #0x9e
	cmp r1, r0
	bne .L08055A92
	movs r0, #2
	ldrh r3, [r5, #0x10]
	orrs r0, r3
	strh r0, [r5, #0x10]
	bl SpellFx_Finish
	bl func_fe6_08047358
	adds r0, r4, #0
	bl Proc_Break
.L08055A92:
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_fe6_08055AA0
func_fe6_08055AA0: @ 0x08055AA0
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, .L08055B00 @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08055B04 @ =gUnk_085D30B8
	movs r1, #3
	bl SpawnProc
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	str r0, [r5, #0x44]
	ldr r0, .L08055B08 @ =gUnk_0811ABE6
	str r0, [r5, #0x48]
	ldr r0, .L08055B0C @ =gUnk_085D30D0
	str r0, [r5, #0x4c]
	str r0, [r5, #0x50]
	ldr r0, .L08055B10 @ =gUnk_081B4254
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	ldr r0, .L08055B14 @ =gUnk_081B2348
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	bl SpellFx_SetSomeColorEffect
	ldr r0, .L08055B18 @ =gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq .L08055B26
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne .L08055B1C
	movs r0, #1
	movs r1, #0xe8
	movs r2, #0
	bl SetBgOffset
	b .L08055B26
	.align 2, 0
.L08055B00: .4byte gEfxBgSemaphore
.L08055B04: .4byte gUnk_085D30B8
.L08055B08: .4byte gUnk_0811ABE6
.L08055B0C: .4byte gUnk_085D30D0
.L08055B10: .4byte gUnk_081B4254
.L08055B14: .4byte gUnk_081B2348
.L08055B18: .4byte gEkrDistanceType
.L08055B1C:
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl SetBgOffset
.L08055B26:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start func_fe6_08055B2C
func_fe6_08055B2C: @ 0x08055B2C
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
	blt .L08055B5A
	ldr r1, [r4, #0x4c]
	ldr r3, [r4, #0x50]
	ldr r0, [r4, #0x5c]
	lsls r2, r2, #2
	adds r1, r2, r1
	ldr r1, [r1]
	adds r2, r2, r3
	ldr r2, [r2]
	bl SpellFx_WriteBgMap
	b .L08055B78
.L08055B5A:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r2, r0
	bne .L08055B78
	bl SpellFx_ClearBG1
	ldr r1, .L08055B80 @ =gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_ClearColorEffects
	adds r0, r4, #0
	bl Proc_Break
.L08055B78:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08055B80: .4byte gEfxBgSemaphore

	thumb_func_start func_fe6_08055B84
func_fe6_08055B84: @ 0x08055B84
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, .L08055BC8 @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08055BCC @ =gUnk_085D3118
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	ldr r3, .L08055BD0 @ =gUnk_085F6674
	str r3, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl EfxCreateFrontAnim
	str r0, [r4, #0x60]
	ldr r0, .L08055BD4 @ =gUnk_081B4254
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, .L08055BD8 @ =gUnk_081B3D34
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08055BC8: .4byte gEfxBgSemaphore
.L08055BCC: .4byte gUnk_085D3118
.L08055BD0: .4byte gUnk_085F6674
.L08055BD4: .4byte gUnk_081B4254
.L08055BD8: .4byte gUnk_081B3D34

	thumb_func_start func_fe6_08055BDC
func_fe6_08055BDC: @ 0x08055BDC
	push {lr}
	ldr r0, [r0, #0x60]
	bl BasRemove
	ldr r1, .L08055BF0 @ =gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
.L08055BF0: .4byte gEfxBgSemaphore

	thumb_func_start func_fe6_08055BF4
func_fe6_08055BF4: @ 0x08055BF4
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl func_fe6_08047300
	bl SpellFx_SetBG1Position
	ldr r0, .L08055C2C @ =gUnk_085D3138
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r5, #0
	bl GetAnimRoundTypeAnotherSide
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl CheckRoundMiss
	adds r4, #0x29
	strb r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08055C2C: .4byte gUnk_085D3138

	thumb_func_start func_fe6_08055C30
func_fe6_08055C30: @ 0x08055C30
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetAnimAnotherSide
	adds r5, r0, #0
	bl EfxGetCamMovDuration
	adds r6, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	movs r1, #0
	mov r8, r1
	movs r7, #0
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne .L08055C74
	ldr r0, [r4, #0x5c]
	bl func_fe6_08055E14
	ldr r0, .L08055CC8 @ =0x0000011B
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r2, [r4, #0x5c]
	movs r3, #2
	ldrsh r2, [r2, r3]
	movs r3, #1
	bl func_fe6_0805C804
.L08055C74:
	ldrh r0, [r4, #0x2c]
	cmp r0, #0x64
	bne .L08055C84
	ldr r0, [r4, #0x5c]
	movs r1, #1
	rsbs r1, r1, #0
	bl NewEfxFarAttackWithDistance
.L08055C84:
	movs r2, #0x2c
	ldrsh r1, [r4, r2]
	adds r0, r6, #0
	adds r0, #0x82
	cmp r1, r0
	bne .L08055CCC
	adds r0, r5, #0
	bl func_fe6_08055E6C
	adds r0, r5, #0
	bl func_fe6_08055ED0
	ldr r0, [r4, #0x5c]
	bl func_fe6_08055D30
	movs r0, #0x10
	str r0, [sp]
	str r7, [sp, #4]
	adds r0, r5, #0
	movs r1, #0
	movs r2, #0x14
	movs r3, #0
	bl func_fe6_0804CD88
	str r7, [sp]
	str r7, [sp, #4]
	adds r0, r5, #0
	movs r1, #0xe6
	movs r2, #0x14
	movs r3, #0x10
	bl func_fe6_0804CD88
	b .L08055D22
	.align 2, 0
.L08055CC8: .4byte 0x0000011B
.L08055CCC:
	movs r3, #0xa5
	lsls r3, r3, #1
	adds r0, r6, r3
	cmp r1, r0
	bne .L08055D02
	movs r0, #9
	ldrh r1, [r5, #0x10]
	orrs r0, r1
	strh r0, [r5, #0x10]
	adds r4, #0x29
	ldrb r1, [r4]
	adds r0, r5, #0
	bl StartBattleAnimStatusChgHitEffects
	ldrb r0, [r4]
	cmp r0, #0
	bne .L08055D22
	adds r0, r5, #0
	bl GetUnitEfxDebuff
	cmp r0, #0
	bne .L08055D22
	adds r0, r5, #0
	movs r1, #2
	bl SetUnitEfxDebuff
	b .L08055D22
.L08055D02:
	movs r2, #0xb9
	lsls r2, r2, #1
	adds r0, r6, r2
	cmp r1, r0
	bne .L08055D22
	movs r0, #2
	ldrh r3, [r5, #0x10]
	orrs r0, r3
	strh r0, [r5, #0x10]
	bl SpellFx_Finish
	bl func_fe6_08047358
	adds r0, r4, #0
	bl Proc_Break
.L08055D22:
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_fe6_08055D30
func_fe6_08055D30: @ 0x08055D30
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, .L08055D90 @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08055D94 @ =gUnk_085D3150
	movs r1, #3
	bl SpawnProc
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	str r0, [r5, #0x44]
	ldr r0, .L08055D98 @ =gUnk_0811AC30
	str r0, [r5, #0x48]
	ldr r0, .L08055D9C @ =gUnk_085D3168
	str r0, [r5, #0x4c]
	str r0, [r5, #0x50]
	ldr r0, .L08055DA0 @ =gUnk_081B6688
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	ldr r0, .L08055DA4 @ =gUnk_081B57BC
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	bl SpellFx_SetSomeColorEffect
	ldr r0, .L08055DA8 @ =gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq .L08055DB6
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne .L08055DAC
	movs r0, #1
	movs r1, #0xe8
	movs r2, #0
	bl SetBgOffset
	b .L08055DB6
	.align 2, 0
.L08055D90: .4byte gEfxBgSemaphore
.L08055D94: .4byte gUnk_085D3150
.L08055D98: .4byte gUnk_0811AC30
.L08055D9C: .4byte gUnk_085D3168
.L08055DA0: .4byte gUnk_081B6688
.L08055DA4: .4byte gUnk_081B57BC
.L08055DA8: .4byte gEkrDistanceType
.L08055DAC:
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl SetBgOffset
.L08055DB6:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start func_fe6_08055DBC
func_fe6_08055DBC: @ 0x08055DBC
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
	blt .L08055DEA
	ldr r1, [r4, #0x4c]
	ldr r3, [r4, #0x50]
	ldr r0, [r4, #0x5c]
	lsls r2, r2, #2
	adds r1, r2, r1
	ldr r1, [r1]
	adds r2, r2, r3
	ldr r2, [r2]
	bl SpellFx_WriteBgMap
	b .L08055E08
.L08055DEA:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r2, r0
	bne .L08055E08
	bl SpellFx_ClearBG1
	ldr r1, .L08055E10 @ =gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_ClearColorEffects
	adds r0, r4, #0
	bl Proc_Break
.L08055E08:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08055E10: .4byte gEfxBgSemaphore

	thumb_func_start func_fe6_08055E14
func_fe6_08055E14: @ 0x08055E14
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, .L08055E58 @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08055E5C @ =gUnk_085D31A8
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	ldr r3, .L08055E60 @ =gUnk_085FE544
	str r3, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl EfxCreateFrontAnim
	str r0, [r4, #0x60]
	ldr r0, .L08055E64 @ =gUnk_081B7650
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, .L08055E68 @ =gUnk_081B7468
	movs r1, #0x80
	lsls r1, r1, #4
	bl SpellFx_RegisterObjGfx
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08055E58: .4byte gEfxBgSemaphore
.L08055E5C: .4byte gUnk_085D31A8
.L08055E60: .4byte gUnk_085FE544
.L08055E64: .4byte gUnk_081B7650
.L08055E68: .4byte gUnk_081B7468

	thumb_func_start func_fe6_08055E6C
func_fe6_08055E6C: @ 0x08055E6C
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, .L08055EB4 @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08055EB8 @ =gUnk_085D31C8
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	ldr r3, .L08055EBC @ =gUnk_085FE3C4
	str r3, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl EfxCreateFrontAnim
	adds r5, r0, #0
	str r5, [r4, #0x60]
	ldrh r0, [r5, #4]
	subs r0, #8
	strh r0, [r5, #4]
	bl GetEkrDragonStateTypeIdunn
	cmp r0, #0
	beq .L08055EAC
	ldrh r0, [r5, #2]
	subs r0, #0x10
	strh r0, [r5, #2]
.L08055EAC:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08055EB4: .4byte gEfxBgSemaphore
.L08055EB8: .4byte gUnk_085D31C8
.L08055EBC: .4byte gUnk_085FE3C4

	thumb_func_start func_fe6_08055EC0
func_fe6_08055EC0: @ 0x08055EC0
	ldr r1, .L08055ECC @ =gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bx lr
	.align 2, 0
.L08055ECC: .4byte gEfxBgSemaphore

	thumb_func_start func_fe6_08055ED0
func_fe6_08055ED0: @ 0x08055ED0
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, .L08055EEC @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08055EF0 @ =gUnk_085D31E8
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08055EEC: .4byte gEfxBgSemaphore
.L08055EF0: .4byte gUnk_085D31E8

	thumb_func_start func_fe6_08055EF4
func_fe6_08055EF4: @ 0x08055EF4
	push {r4, lr}
	movs r3, #0x8e
	lsls r3, r3, #1
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r0, [r0, #0x5c]
	movs r4, #2
	ldrsh r2, [r0, r4]
	adds r0, r3, #0
	movs r3, #1
	bl func_fe6_0805C804
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_fe6_08055F14
func_fe6_08055F14: @ 0x08055F14
	ldr r1, .L08055F20 @ =gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bx lr
	.align 2, 0
.L08055F20: .4byte gEfxBgSemaphore

	thumb_func_start func_fe6_08055F24
func_fe6_08055F24: @ 0x08055F24
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl func_fe6_08047300
	bl SpellFx_SetBG1Position
	ldr r0, .L08055F5C @ =gUnk_085D3230
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r5, #0
	bl GetAnimRoundTypeAnotherSide
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl CheckRoundMiss
	adds r4, #0x29
	strb r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08055F5C: .4byte gUnk_085D3230

	thumb_func_start func_fe6_08055F60
func_fe6_08055F60: @ 0x08055F60
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetAnimAnotherSide
	adds r6, r0, #0
	bl EfxGetCamMovDuration
	adds r5, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	movs r1, #0
	mov r8, r1
	movs r7, #0
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne .L08055F96
	ldr r0, [r4, #0x5c]
	movs r1, #1
	rsbs r1, r1, #0
	bl NewEfxFarAttackWithDistance
.L08055F96:
	movs r2, #0x2c
	ldrsh r1, [r4, r2]
	adds r0, r5, #1
	cmp r1, r0
	bne .L08056010
	adds r0, r6, #0
	bl func_fe6_08056080
	movs r5, #8
	str r5, [sp]
	str r7, [sp, #4]
	adds r0, r6, #0
	movs r1, #0x28
	movs r2, #0x1e
	movs r3, #0x10
	bl func_fe6_0804CD88
	movs r4, #0x10
	str r4, [sp]
	str r7, [sp, #4]
	adds r0, r6, #0
	movs r1, #0x47
	movs r2, #0x1e
	movs r3, #8
	bl func_fe6_0804CD88
	str r5, [sp]
	str r7, [sp, #4]
	adds r0, r6, #0
	movs r1, #0x66
	movs r2, #0x1e
	movs r3, #0x10
	bl func_fe6_0804CD88
	str r4, [sp]
	str r7, [sp, #4]
	adds r0, r6, #0
	movs r1, #0x85
	movs r2, #0x1e
	movs r3, #8
	bl func_fe6_0804CD88
	str r7, [sp]
	str r7, [sp, #4]
	adds r0, r6, #0
	movs r1, #0xa4
	movs r2, #0x3c
	movs r3, #0x10
	bl func_fe6_0804CD88
	ldr r0, .L0805600C @ =0x00000103
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r6, r3]
	movs r3, #1
	bl func_fe6_0805C804
	b .L08056074
	.align 2, 0
.L0805600C: .4byte 0x00000103
.L08056010:
	adds r0, r5, #0
	adds r0, #0x50
	cmp r1, r0
	bne .L08056020
	adds r0, r6, #0
	bl func_fe6_08056138
	b .L08056074
.L08056020:
	adds r0, r5, #0
	adds r0, #0xa4
	cmp r1, r0
	bne .L08056036
	adds r0, r6, #0
	movs r1, #1
	movs r2, #5
	movs r3, #0
	bl NewEfxFlashUnit
	b .L08056074
.L08056036:
	adds r0, r5, #0
	adds r0, #0xc8
	cmp r1, r0
	bne .L08056054
	movs r0, #9
	ldrh r1, [r6, #0x10]
	orrs r0, r1
	strh r0, [r6, #0x10]
	adds r0, r4, #0
	adds r0, #0x29
	ldrb r1, [r0]
	adds r0, r6, #0
	bl StartBattleAnimStatusChgHitEffects
	b .L08056074
.L08056054:
	movs r2, #0x96
	lsls r2, r2, #1
	adds r0, r5, r2
	cmp r1, r0
	bne .L08056074
	movs r0, #2
	ldrh r3, [r6, #0x10]
	orrs r0, r3
	strh r0, [r6, #0x10]
	bl SpellFx_Finish
	bl func_fe6_08047358
	adds r0, r4, #0
	bl Proc_Break
.L08056074:
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start func_fe6_08056080
func_fe6_08056080: @ 0x08056080
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, .L080560BC @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L080560C0 @ =gUnk_085D3248
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, .L080560C4 @ =gUnk_0811AD32
	str r1, [r0, #0x48]
	ldr r1, .L080560C8 @ =gUnk_085D3260
	str r1, [r0, #0x4c]
	str r1, [r0, #0x50]
	ldr r1, .L080560CC @ =gUnk_085D3294
	str r1, [r0, #0x54]
	ldr r0, .L080560D0 @ =gUnk_081B4274
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	bl SpellFx_SetSomeColorEffect
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L080560BC: .4byte gEfxBgSemaphore
.L080560C0: .4byte gUnk_085D3248
.L080560C4: .4byte gUnk_0811AD32
.L080560C8: .4byte gUnk_085D3260
.L080560CC: .4byte gUnk_085D3294
.L080560D0: .4byte gUnk_081B4274

	thumb_func_start func_fe6_080560D4
func_fe6_080560D4: @ 0x080560D4
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl EfxAdvanceFrameLut
	lsls r0, r0, #0x10
	asrs r3, r0, #0x10
	cmp r3, #0
	blt .L08056110
	ldr r1, [r4, #0x4c]
	ldr r2, [r4, #0x50]
	ldr r5, [r4, #0x54]
	ldr r0, [r4, #0x5c]
	lsls r4, r3, #2
	adds r1, r4, r1
	ldr r1, [r1]
	adds r2, r4, r2
	ldr r2, [r2]
	bl SpellFx_WriteBgMap
	adds r4, r4, r5
	ldr r0, [r4]
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	b .L0805612E
.L08056110:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r3, r0
	bne .L0805612E
	bl SpellFx_ClearBG1
	ldr r1, .L08056134 @ =gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_ClearColorEffects
	adds r0, r4, #0
	bl Proc_Break
.L0805612E:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08056134: .4byte gEfxBgSemaphore

	thumb_func_start func_fe6_08056138
func_fe6_08056138: @ 0x08056138
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, .L0805617C @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08056180 @ =gUnk_085D32C8
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	ldr r3, .L08056184 @ =gUnk_085F9358
	str r3, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl EfxCreateFrontAnim
	str r0, [r4, #0x60]
	ldr r0, .L08056188 @ =gUnk_081B7670
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, .L0805618C @ =gUnk_081B7468
	movs r1, #0x80
	lsls r1, r1, #4
	bl SpellFx_RegisterObjGfx
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0805617C: .4byte gEfxBgSemaphore
.L08056180: .4byte gUnk_085D32C8
.L08056184: .4byte gUnk_085F9358
.L08056188: .4byte gUnk_081B7670
.L0805618C: .4byte gUnk_081B7468

	thumb_func_start func_fe6_08056190
func_fe6_08056190: @ 0x08056190
	ldr r1, .L0805619C @ =gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bx lr
	.align 2, 0
.L0805619C: .4byte gEfxBgSemaphore

	thumb_func_start func_fe6_080561A0
func_fe6_080561A0: @ 0x080561A0
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl func_fe6_08047300
	bl SpellFx_SetBG1Position
	ldr r0, .L080561D8 @ =gUnk_085D32E8
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r5, #0
	bl GetAnimRoundTypeAnotherSide
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl CheckRoundMiss
	adds r4, #0x29
	strb r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L080561D8: .4byte gUnk_085D32E8

	thumb_func_start func_fe6_080561DC
func_fe6_080561DC: @ 0x080561DC
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetAnimAnotherSide
	adds r5, r0, #0
	bl EfxGetCamMovDuration
	adds r6, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	movs r7, #0
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne .L0805620A
	ldr r0, [r4, #0x5c]
	movs r1, #1
	rsbs r1, r1, #0
	bl NewEfxFarAttackWithDistance
.L0805620A:
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	adds r0, r6, #1
	cmp r1, r0
	bne .L0805625C
	adds r0, r5, #0
	bl func_fe6_080564E4
	adds r0, r5, #0
	movs r1, #0x4a
	bl func_fe6_080562C0
	adds r0, r5, #0
	movs r1, #0x4a
	bl func_fe6_08056444
	movs r4, #0x80
	lsls r4, r4, #1
	movs r0, #1
	str r0, [sp]
	adds r0, r5, #0
	movs r1, #0x4a
	movs r2, #0xa
	adds r3, r4, #0
	bl func_fe6_0804C8D4
	ldr r2, .L08056258 @ =func_fe6_0804CD4C
	adds r0, r5, #0
	movs r1, #0x4a
	bl func_fe6_0804CC68
	movs r1, #2
	ldrsh r2, [r5, r1]
	movs r0, #0xf9
	adds r1, r4, #0
	movs r3, #1
	bl func_fe6_0805C804
	b .L080562B6
	.align 2, 0
.L08056258: .4byte func_fe6_0804CD4C
.L0805625C:
	adds r0, r6, #0
	adds r0, #0x4a
	cmp r1, r0
	bne .L08056298
	adds r0, r5, #0
	movs r1, #5
	bl NewEfxFlashBgWhite
	movs r0, #9
	ldrh r1, [r5, #0x10]
	orrs r0, r1
	strh r0, [r5, #0x10]
	adds r4, #0x29
	ldrb r1, [r4]
	adds r0, r5, #0
	bl StartBattleAnimStatusChgHitEffects
	ldrb r0, [r4]
	cmp r0, #0
	bne .L080562B6
	adds r0, r5, #0
	bl GetUnitEfxDebuff
	cmp r0, #0
	bne .L080562B6
	adds r0, r5, #0
	movs r1, #4
	bl SetUnitEfxDebuff
	b .L080562B6
.L08056298:
	adds r0, r6, #0
	adds r0, #0x5a
	cmp r1, r0
	bne .L080562B6
	movs r0, #2
	ldrh r1, [r5, #0x10]
	orrs r0, r1
	strh r0, [r5, #0x10]
	bl SpellFx_Finish
	bl func_fe6_08047358
	adds r0, r4, #0
	bl Proc_Break
.L080562B6:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_fe6_080562C0
func_fe6_080562C0: @ 0x080562C0
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r1, .L080563B8 @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L080563BC @ =gUnk_085D3300
	movs r1, #3
	bl SpawnProc
	str r5, [r0, #0x5c]
	movs r6, #0
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r4, [r0, #0x2e]
	ldr r0, .L080563C0 @ =gUnk_081B7690
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	ldr r0, .L080563C4 @ =gUnk_081B4E9C
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	ldr r0, .L080563C8 @ =gUnk_081B4F9C
	ldr r1, .L080563CC @ =gBg1Tm
	movs r2, #1
	str r2, [sp]
	adds r2, #0xff
	str r2, [sp, #4]
	movs r2, #0x20
	movs r3, #0x20
	bl EfxTmCpyBG
	movs r0, #2
	bl EnableBgSync
	bl SpellFx_SetSomeColorEffect
	ldr r0, .L080563D0 @ =gDispIo
	mov ip, r0
	mov r2, ip
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	mov r1, ip
	adds r1, #0x44
	movs r0, #0xe
	strb r0, [r1]
	adds r1, #1
	movs r4, #8
	movs r0, #8
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x46
	strb r6, [r0]
	mov r6, ip
	adds r6, #0x37
	movs r3, #0x20
	ldrb r1, [r6]
	orrs r1, r3
	movs r0, #0x21
	rsbs r0, r0, #0
	mov r2, ip
	ldrb r2, [r2, #1]
	ands r0, r2
	movs r2, #0x41
	rsbs r2, r2, #0
	ands r0, r2
	movs r2, #0x80
	orrs r0, r2
	mov r7, ip
	strb r0, [r7, #1]
	movs r0, #2
	rsbs r0, r0, #0
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	movs r0, #4
	orrs r1, r0
	orrs r1, r4
	movs r0, #0x10
	orrs r1, r0
	strb r1, [r6]
	ldr r0, .L080563D4 @ =0x0000FFE0
	ldrh r1, [r7, #0x3c]
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	ldr r1, .L080563D8 @ =0x0000E0FF
	ands r0, r1
	movs r2, #0xe0
	lsls r2, r2, #5
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r7, #0x3c]
	mov r0, ip
	adds r0, #0x3d
	ldrb r7, [r0]
	orrs r3, r7
	strb r3, [r0]
	ldr r0, [r5, #0x1c]
	movs r1, #0x80
	lsls r1, r1, #4
	orrs r0, r1
	str r0, [r5, #0x1c]
	ldr r0, .L080563DC @ =0x0000F3FF
	ldrh r1, [r5, #8]
	ands r0, r1
	movs r2, #0x80
	lsls r2, r2, #3
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r5, #8]
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L080563B8: .4byte gEfxBgSemaphore
.L080563BC: .4byte gUnk_085D3300
.L080563C0: .4byte gUnk_081B7690
.L080563C4: .4byte gUnk_081B4E9C
.L080563C8: .4byte gUnk_081B4F9C
.L080563CC: .4byte gBg1Tm
.L080563D0: .4byte gDispIo
.L080563D4: .4byte 0x0000FFE0
.L080563D8: .4byte 0x0000E0FF
.L080563DC: .4byte 0x0000F3FF

	thumb_func_start func_fe6_080563E0
func_fe6_080563E0: @ 0x080563E0
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, [r4, #0x5c]
	ldr r1, .L08056434 @ =gDispIo
	ldrh r0, [r1, #0x22]
	subs r0, #1
	strh r0, [r1, #0x22]
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r4, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	bne .L0805642C
	bl SpellFx_ClearBG1
	bl SpellFx_ClearColorEffects
	ldr r0, [r5, #0x1c]
	ldr r1, .L08056438 @ =0xFFFFF7FF
	ands r0, r1
	str r0, [r5, #0x1c]
	ldr r0, .L0805643C @ =0x0000F3FF
	ldrh r1, [r5, #8]
	ands r0, r1
	movs r2, #0x80
	lsls r2, r2, #4
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r5, #8]
	ldr r1, .L08056440 @ =gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
.L0805642C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08056434: .4byte gDispIo
.L08056438: .4byte 0xFFFFF7FF
.L0805643C: .4byte 0x0000F3FF
.L08056440: .4byte gEfxBgSemaphore

	thumb_func_start func_fe6_08056444
func_fe6_08056444: @ 0x08056444
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, .L08056468 @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L0805646C @ =gUnk_085D3318
	movs r1, #4
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r5, [r0, #0x2e]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08056468: .4byte gEfxBgSemaphore
.L0805646C: .4byte gUnk_085D3318

	thumb_func_start func_fe6_08056470
func_fe6_08056470: @ 0x08056470
	push {r4, lr}
	sub sp, #0x48
	adds r4, r0, #0
	ldr r2, [r4, #0x5c]
	mov r1, sp
	ldrh r0, [r2, #2]
	strh r0, [r1, #2]
	ldrh r0, [r2, #4]
	strh r0, [r1, #4]
	ldr r0, [r2, #0x3c]
	str r0, [sp, #0x3c]
	ldr r0, [r2, #0x1c]
	ldr r1, .L080564CC @ =0xFFFFF7FF
	ands r0, r1
	str r0, [sp, #0x1c]
	mov r0, sp
	ldrh r1, [r2, #8]
	strh r1, [r0, #8]
	mov r2, sp
	ldr r0, .L080564D0 @ =0x0000F3FF
	ands r0, r1
	strh r0, [r2, #8]
	movs r3, #0x80
	lsls r3, r3, #4
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2, #8]
	mov r0, sp
	bl BasPutOam
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r4, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	bne .L080564C2
	adds r0, r4, #0
	bl Proc_Break
.L080564C2:
	add sp, #0x48
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L080564CC: .4byte 0xFFFFF7FF
.L080564D0: .4byte 0x0000F3FF

	thumb_func_start func_fe6_080564D4
func_fe6_080564D4: @ 0x080564D4
	ldr r1, .L080564E0 @ =gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bx lr
	.align 2, 0
.L080564E0: .4byte gEfxBgSemaphore

	thumb_func_start func_fe6_080564E4
func_fe6_080564E4: @ 0x080564E4
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, .L0805652C @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08056530 @ =gUnk_085D3338
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	adds r0, r5, #0
	bl GetAnimAnotherSide
	ldr r3, .L08056534 @ =AnimScr_ManaketeFlame
	ldr r0, [r4, #0x5c]
	str r3, [sp]
	adds r1, r3, #0
	adds r2, r3, #0
	bl EfxCreateFrontAnim
	str r0, [r4, #0x60]
	ldr r1, .L08056538 @ =0x0000F3FF
	ldrh r2, [r0, #8]
	ands r1, r2
	movs r3, #0x80
	lsls r3, r3, #3
	adds r2, r3, #0
	orrs r1, r2
	strh r1, [r0, #8]
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0805652C: .4byte gEfxBgSemaphore
.L08056530: .4byte gUnk_085D3338
.L08056534: .4byte AnimScr_ManaketeFlame
.L08056538: .4byte 0x0000F3FF

	thumb_func_start func_fe6_0805653C
func_fe6_0805653C: @ 0x0805653C
	push {lr}
	ldr r2, .L08056550 @ =gEfxBgSemaphore
	ldr r1, [r2]
	subs r1, #1
	str r1, [r2]
	ldr r0, [r0, #0x60]
	bl BasRemove
	pop {r0}
	bx r0
	.align 2, 0
.L08056550: .4byte gEfxBgSemaphore

	thumb_func_start func_fe6_08056554
func_fe6_08056554: @ 0x08056554
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x60]
	ldr r0, .L08056584 @ =gUnk_085FEAF8
	str r0, [r1, #0x24]
	str r0, [r1, #0x20]
	movs r0, #0
	strh r0, [r1, #6]
	ldr r0, .L08056588 @ =gUnk_081B7F68
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, .L0805658C @ =gUnk_081B76B0
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08056584: .4byte gUnk_085FEAF8
.L08056588: .4byte gUnk_081B7F68
.L0805658C: .4byte gUnk_081B76B0

	thumb_func_start func_fe6_08056590
func_fe6_08056590: @ 0x08056590
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x60]
	ldr r0, .L080565C0 @ =gUnk_085FEB0C
	str r0, [r1, #0x24]
	str r0, [r1, #0x20]
	movs r0, #0
	strh r0, [r1, #6]
	ldr r0, .L080565C4 @ =gUnk_081B7F68
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, .L080565C8 @ =gUnk_081B76B0
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L080565C0: .4byte gUnk_085FEB0C
.L080565C4: .4byte gUnk_081B7F68
.L080565C8: .4byte gUnk_081B76B0

	thumb_func_start func_fe6_080565CC
func_fe6_080565CC: @ 0x080565CC
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x60]
	ldr r0, .L080565FC @ =gUnk_085FEB20
	str r0, [r1, #0x24]
	str r0, [r1, #0x20]
	movs r0, #0
	strh r0, [r1, #6]
	ldr r0, .L08056600 @ =gUnk_081B7F68
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, .L08056604 @ =gUnk_081B76B0
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L080565FC: .4byte gUnk_085FEB20
.L08056600: .4byte gUnk_081B7F68
.L08056604: .4byte gUnk_081B76B0

	thumb_func_start func_fe6_08056608
func_fe6_08056608: @ 0x08056608
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x60]
	ldr r0, .L08056638 @ =gUnk_085FEB34
	str r0, [r1, #0x24]
	str r0, [r1, #0x20]
	movs r0, #0
	strh r0, [r1, #6]
	ldr r0, .L0805663C @ =gUnk_081B7F68
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, .L08056640 @ =gUnk_081B76B0
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08056638: .4byte gUnk_085FEB34
.L0805663C: .4byte gUnk_081B7F68
.L08056640: .4byte gUnk_081B76B0

	thumb_func_start func_fe6_08056644
func_fe6_08056644: @ 0x08056644
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x60]
	ldr r0, .L08056674 @ =gUnk_085FEB48
	str r0, [r1, #0x24]
	str r0, [r1, #0x20]
	movs r0, #0
	strh r0, [r1, #6]
	ldr r0, .L08056678 @ =gUnk_081B7F68
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, .L0805667C @ =gUnk_081B76B0
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08056674: .4byte gUnk_085FEB48
.L08056678: .4byte gUnk_081B7F68
.L0805667C: .4byte gUnk_081B76B0

	thumb_func_start func_fe6_08056680
func_fe6_08056680: @ 0x08056680
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x60]
	ldr r0, .L080566B0 @ =gUnk_085FEEBC
	str r0, [r1, #0x24]
	str r0, [r1, #0x20]
	movs r0, #0
	strh r0, [r1, #6]
	ldr r0, .L080566B4 @ =gUnk_081B7F68
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, .L080566B8 @ =gUnk_081B7B48
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L080566B0: .4byte gUnk_085FEEBC
.L080566B4: .4byte gUnk_081B7F68
.L080566B8: .4byte gUnk_081B7B48

	thumb_func_start func_fe6_080566BC
func_fe6_080566BC: @ 0x080566BC
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x60]
	ldr r0, .L080566EC @ =gUnk_085FEEC8
	str r0, [r1, #0x24]
	str r0, [r1, #0x20]
	movs r0, #0
	strh r0, [r1, #6]
	ldr r0, .L080566F0 @ =gUnk_081B7F68
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, .L080566F4 @ =gUnk_081B7B48
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L080566EC: .4byte gUnk_085FEEC8
.L080566F0: .4byte gUnk_081B7F68
.L080566F4: .4byte gUnk_081B7B48

	thumb_func_start func_fe6_080566F8
func_fe6_080566F8: @ 0x080566F8
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x60]
	ldr r0, .L08056728 @ =gUnk_085FEED4
	str r0, [r1, #0x24]
	str r0, [r1, #0x20]
	movs r0, #0
	strh r0, [r1, #6]
	ldr r0, .L0805672C @ =gUnk_081B7F68
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, .L08056730 @ =gUnk_081B7B48
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08056728: .4byte gUnk_085FEED4
.L0805672C: .4byte gUnk_081B7F68
.L08056730: .4byte gUnk_081B7B48

	thumb_func_start func_fe6_08056734
func_fe6_08056734: @ 0x08056734
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x60]
	ldr r0, .L08056764 @ =gUnk_085FEEE0
	str r0, [r1, #0x24]
	str r0, [r1, #0x20]
	movs r0, #0
	strh r0, [r1, #6]
	ldr r0, .L08056768 @ =gUnk_081B7F68
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, .L0805676C @ =gUnk_081B7B48
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08056764: .4byte gUnk_085FEEE0
.L08056768: .4byte gUnk_081B7F68
.L0805676C: .4byte gUnk_081B7B48

	thumb_func_start func_fe6_08056770
func_fe6_08056770: @ 0x08056770
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x60]
	ldr r0, .L080567A0 @ =gUnk_085FEEEC
	str r0, [r1, #0x24]
	str r0, [r1, #0x20]
	movs r0, #0
	strh r0, [r1, #6]
	ldr r0, .L080567A4 @ =gUnk_081B7F68
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, .L080567A8 @ =gUnk_081B7B48
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L080567A0: .4byte gUnk_085FEEEC
.L080567A4: .4byte gUnk_081B7F68
.L080567A8: .4byte gUnk_081B7B48

	thumb_func_start func_fe6_080567AC
func_fe6_080567AC: @ 0x080567AC
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl func_fe6_08047300
	bl SpellFx_SetBG1Position
	ldr r0, .L080567E4 @ =gUnk_085D33F0
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r5, #0
	bl GetAnimRoundTypeAnotherSide
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl CheckRoundMiss
	adds r4, #0x29
	strb r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L080567E4: .4byte gUnk_085D33F0

	thumb_func_start func_fe6_080567E8
func_fe6_080567E8: @ 0x080567E8
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x5c]
	bl GetAnimAnotherSide
	adds r4, r0, #0
	bl EfxGetCamMovDuration
	adds r6, r0, #0
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	movs r7, #0
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne .L08056814
	ldr r0, [r5, #0x5c]
	movs r1, #1
	rsbs r1, r1, #0
	bl NewEfxFarAttackWithDistance
.L08056814:
	movs r0, #0x2c
	ldrsh r1, [r5, r0]
	adds r0, r6, #1
	cmp r1, r0
	bne .L08056844
	ldr r0, [r5, #0x5c]
	bl func_fe6_080568B4
	adds r0, r4, #0
	bl func_fe6_08056968
	adds r0, r4, #0
	bl func_fe6_080569C0
	movs r0, #0x81
	lsls r0, r0, #1
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r4, r3]
	movs r3, #1
	bl func_fe6_0805C804
	b .L080568AE
.L08056844:
	adds r0, r6, #0
	adds r0, #0x28
	cmp r1, r0
	beq .L08056854
	adds r0, r6, #0
	adds r0, #0x50
	cmp r1, r0
	bne .L0805685C
.L08056854:
	adds r0, r4, #0
	bl func_fe6_080569C0
	b .L080568AE
.L0805685C:
	adds r0, r6, #0
	adds r0, #0xb0
	cmp r1, r0
	bne .L08056872
	adds r0, r4, #0
	movs r1, #1
	movs r2, #5
	movs r3, #0
	bl NewEfxFlashUnit
	b .L080568AE
.L08056872:
	adds r0, r6, #0
	adds r0, #0xe1
	cmp r1, r0
	bne .L08056890
	movs r0, #9
	ldrh r1, [r4, #0x10]
	orrs r0, r1
	strh r0, [r4, #0x10]
	adds r0, r5, #0
	adds r0, #0x29
	ldrb r1, [r0]
	adds r0, r4, #0
	bl StartBattleAnimStatusChgHitEffects
	b .L080568AE
.L08056890:
	adds r0, r6, #0
	adds r0, #0xe6
	cmp r1, r0
	bne .L080568AE
	movs r0, #2
	ldrh r3, [r4, #0x10]
	orrs r0, r3
	strh r0, [r4, #0x10]
	bl SpellFx_Finish
	bl func_fe6_08047358
	adds r0, r5, #0
	bl Proc_Break
.L080568AE:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start func_fe6_080568B4
func_fe6_080568B4: @ 0x080568B4
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, .L080568F8 @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L080568FC @ =gUnk_085D3408
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, .L08056900 @ =gUnk_0811AD68
	str r1, [r0, #0x48]
	ldr r1, .L08056904 @ =gUnk_085D3420
	str r1, [r0, #0x4c]
	str r1, [r0, #0x50]
	ldr r0, .L08056908 @ =gUnk_081B8934
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	ldr r0, .L0805690C @ =gUnk_081B80A8
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	bl SpellFx_SetSomeColorEffect
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L080568F8: .4byte gEfxBgSemaphore
.L080568FC: .4byte gUnk_085D3408
.L08056900: .4byte gUnk_0811AD68
.L08056904: .4byte gUnk_085D3420
.L08056908: .4byte gUnk_081B8934
.L0805690C: .4byte gUnk_081B80A8

	thumb_func_start func_fe6_08056910
func_fe6_08056910: @ 0x08056910
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
	blt .L0805693E
	ldr r1, [r4, #0x4c]
	ldr r3, [r4, #0x50]
	ldr r0, [r4, #0x5c]
	lsls r2, r2, #2
	adds r1, r2, r1
	ldr r1, [r1]
	adds r2, r2, r3
	ldr r2, [r2]
	bl SpellFx_WriteBgMap
	b .L0805695C
.L0805693E:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r2, r0
	bne .L0805695C
	bl SpellFx_ClearBG1
	ldr r1, .L08056964 @ =gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_ClearColorEffects
	adds r0, r4, #0
	bl Proc_Break
.L0805695C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08056964: .4byte gEfxBgSemaphore

	thumb_func_start func_fe6_08056968
func_fe6_08056968: @ 0x08056968
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, .L080569AC @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L080569B0 @ =gUnk_085D3434
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	ldr r3, .L080569B4 @ =gUnk_08602FAC
	str r3, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl EfxCreateFrontAnim
	str r0, [r4, #0x60]
	ldr r0, .L080569B8 @ =gUnk_081B8E44
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, .L080569BC @ =gUnk_081B7468
	movs r1, #0x80
	lsls r1, r1, #4
	bl SpellFx_RegisterObjGfx
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L080569AC: .4byte gEfxBgSemaphore
.L080569B0: .4byte gUnk_085D3434
.L080569B4: .4byte gUnk_08602FAC
.L080569B8: .4byte gUnk_081B8E44
.L080569BC: .4byte gUnk_081B7468

	thumb_func_start func_fe6_080569C0
func_fe6_080569C0: @ 0x080569C0
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, .L080569F4 @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L080569F8 @ =gUnk_085D3454
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	ldr r3, .L080569FC @ =gUnk_086030FC
	str r3, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl EfxCreateFrontAnim
	str r0, [r4, #0x60]
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L080569F4: .4byte gEfxBgSemaphore
.L080569F8: .4byte gUnk_085D3454
.L080569FC: .4byte gUnk_086030FC

	thumb_func_start func_fe6_08056A00
func_fe6_08056A00: @ 0x08056A00
	push {lr}
	ldr r0, [r0, #0x60]
	bl BasRemove
	ldr r1, .L08056A14 @ =gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
.L08056A14: .4byte gEfxBgSemaphore

	thumb_func_start func_fe6_08056A18
func_fe6_08056A18: @ 0x08056A18
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, .L08056A38 @ =gUnk_085D3474
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	adds r0, #0x29
	strb r5, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08056A38: .4byte gUnk_085D3474

	thumb_func_start func_fe6_08056A3C
func_fe6_08056A3C: @ 0x08056A3C
	push {lr}
	adds r1, r0, #0
	ldrh r0, [r1, #0x2c]
	adds r0, #1
	strh r0, [r1, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne .L08056A5A
	ldr r0, [r1, #0x5c]
	adds r1, #0x29
	ldrb r1, [r1]
	bl func_fe6_08056A68
	b .L08056A64
.L08056A5A:
	cmp r0, #0xa
	bne .L08056A64
	adds r0, r1, #0
	bl Proc_Break
.L08056A64:
	pop {r0}
	bx r0

	thumb_func_start func_fe6_08056A68
func_fe6_08056A68: @ 0x08056A68
	push {r4, r5, r6, lr}
	sub sp, #0xc
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r0, .L08056A8C @ =gUnk_085D348C
	movs r1, #3
	bl SpawnProc
	adds r6, r0, #0
	str r5, [r6, #0x5c]
	movs r0, #0
	strh r0, [r6, #0x2c]
	cmp r4, #0
	bne .L08056A94
	movs r0, #0x32
	strh r0, [r6, #0x2e]
	ldr r4, .L08056A90 @ =gUnk_085CDCA4
	b .L08056A9A
	.align 2, 0
.L08056A8C: .4byte gUnk_085D348C
.L08056A90: .4byte gUnk_085CDCA4
.L08056A94:
	movs r0, #0x32
	strh r0, [r6, #0x2e]
	ldr r4, .L08056AD4 @ =gUnk_085CDD18
.L08056A9A:
	adds r0, r5, #0
	bl GetAnimPosition
	movs r2, #0xa2
	lsls r2, r2, #7
	cmp r0, #0
	bne .L08056AAC
	movs r2, #0xc2
	lsls r2, r2, #7
.L08056AAC:
	movs r1, #2
	ldrsh r0, [r5, r1]
	movs r3, #4
	ldrsh r1, [r5, r3]
	subs r1, #0x28
	str r2, [sp]
	movs r2, #0
	str r2, [sp, #4]
	movs r2, #3
	str r2, [sp, #8]
	adds r2, r4, #0
	movs r3, #2
	bl NewEkrsubAnimeEmulator
	str r0, [r6, #0x60]
	add sp, #0xc
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08056AD4: .4byte gUnk_085CDD18

	thumb_func_start func_fe6_08056AD8
func_fe6_08056AD8: @ 0x08056AD8
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x60]
	ldr r0, [r4, #0x5c]
	ldrh r0, [r0, #2]
	strh r0, [r1, #0x32]
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r4, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	ble .L08056B00
	ldr r0, [r4, #0x60]
	bl Proc_End
	adds r0, r4, #0
	bl Proc_Break
.L08056B00:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_fe6_08056B08
func_fe6_08056B08: @ 0x08056B08
	push {r4, lr}
	adds r4, r0, #0
	bl SpellFx_SetBG1Position
	ldr r0, .L08056B24 @ =gUnk_085D34A4
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08056B24: .4byte gUnk_085D34A4

	thumb_func_start func_fe6_08056B28
func_fe6_08056B28: @ 0x08056B28
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne .L08056B48
	ldr r0, [r4, #0x5c]
	bl func_fe6_08056B58
	ldr r0, [r4, #0x5c]
	bl func_fe6_08056BD0
	b .L08056B52
.L08056B48:
	cmp r0, #0x11
	bne .L08056B52
	adds r0, r4, #0
	bl Proc_Break
.L08056B52:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start func_fe6_08056B58
func_fe6_08056B58: @ 0x08056B58
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, .L08056B94 @ =gUnk_085D34BC
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	ldr r0, .L08056B98 @ =gUnk_08122A3C
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	ldr r0, .L08056B9C @ =gUnk_08123B1C
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	ldr r0, [r4, #0x5c]
	ldr r1, .L08056BA0 @ =gUnk_08123D1C
	ldr r2, .L08056BA4 @ =gUnk_081241BC
	bl SpellFx_WriteBgMap
	bl SpellFx_SetSomeColorEffect
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08056B94: .4byte gUnk_085D34BC
.L08056B98: .4byte gUnk_08122A3C
.L08056B9C: .4byte gUnk_08123B1C
.L08056BA0: .4byte gUnk_08123D1C
.L08056BA4: .4byte gUnk_081241BC

	thumb_func_start func_fe6_08056BA8
func_fe6_08056BA8: @ 0x08056BA8
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x11
	bne .L08056BC8
	bl SpellFx_ClearBG1
	bl SpellFx_ClearColorEffects
	adds r0, r4, #0
	bl Proc_Break
.L08056BC8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_fe6_08056BD0
func_fe6_08056BD0: @ 0x08056BD0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, .L08056BF4 @ =gUnk_085D34D4
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, .L08056BF8 @ =gUnk_0811AE34
	str r1, [r0, #0x48]
	ldr r1, .L08056BFC @ =gUnk_08123B1C
	str r1, [r0, #0x4c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08056BF4: .4byte gUnk_085D34D4
.L08056BF8: .4byte gUnk_0811AE34
.L08056BFC: .4byte gUnk_08123B1C

	thumb_func_start func_fe6_08056C00
func_fe6_08056C00: @ 0x08056C00
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
	blt .L08056C26
	ldr r0, [r4, #0x4c]
	lsls r1, r1, #5
	adds r0, r0, r1
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	b .L08056C34
.L08056C26:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne .L08056C34
	adds r0, r4, #0
	bl Proc_Break
.L08056C34:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_fe6_08056C3C
func_fe6_08056C3C: @ 0x08056C3C
	push {r4, lr}
	adds r4, r0, #0
	bl SpellFx_SetBG1Position
	ldr r0, .L08056C58 @ =gUnk_085D34F4
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08056C58: .4byte gUnk_085D34F4

	thumb_func_start func_fe6_08056C5C
func_fe6_08056C5C: @ 0x08056C5C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetAnimAnotherSide
	adds r1, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne .L08056C80
	ldr r0, [r4, #0x5c]
	movs r1, #4
	bl NewEfxFlashBgWhite
	b .L08056C96
.L08056C80:
	cmp r0, #4
	bne .L08056C8C
	adds r0, r1, #0
	bl func_fe6_08056C9C
	b .L08056C96
.L08056C8C:
	cmp r0, #0x18
	bne .L08056C96
	adds r0, r4, #0
	bl Proc_Break
.L08056C96:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start func_fe6_08056C9C
func_fe6_08056C9C: @ 0x08056C9C
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, .L08056CFC @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08056D00 @ =gUnk_085D350C
	movs r1, #3
	bl SpawnProc
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	str r0, [r5, #0x44]
	ldr r0, .L08056D04 @ =gUnk_0811AE76
	str r0, [r5, #0x48]
	ldr r0, .L08056D08 @ =gUnk_085D3524
	str r0, [r5, #0x4c]
	str r0, [r5, #0x50]
	ldr r0, .L08056D0C @ =gUnk_08124B64
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	ldr r0, .L08056D10 @ =gUnk_0812479C
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	bl SpellFx_SetSomeColorEffect
	ldr r0, .L08056D14 @ =gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq .L08056D22
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne .L08056D18
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl SetBgOffset
	b .L08056D22
	.align 2, 0
.L08056CFC: .4byte gEfxBgSemaphore
.L08056D00: .4byte gUnk_085D350C
.L08056D04: .4byte gUnk_0811AE76
.L08056D08: .4byte gUnk_085D3524
.L08056D0C: .4byte gUnk_08124B64
.L08056D10: .4byte gUnk_0812479C
.L08056D14: .4byte gEkrDistanceType
.L08056D18:
	movs r0, #1
	movs r1, #0xe8
	movs r2, #0
	bl SetBgOffset
.L08056D22:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start func_fe6_08056D28
func_fe6_08056D28: @ 0x08056D28
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
	blt .L08056D56
	ldr r1, [r4, #0x4c]
	ldr r3, [r4, #0x50]
	ldr r0, [r4, #0x5c]
	lsls r2, r2, #2
	adds r1, r2, r1
	ldr r1, [r1]
	adds r2, r2, r3
	ldr r2, [r2]
	bl SpellFx_WriteBgMap
	b .L08056D74
.L08056D56:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r2, r0
	bne .L08056D74
	bl SpellFx_ClearBG1
	ldr r1, .L08056D7C @ =gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_ClearColorEffects
	adds r0, r4, #0
	bl Proc_Break
.L08056D74:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08056D7C: .4byte gEfxBgSemaphore

	thumb_func_start func_fe6_08056D80
func_fe6_08056D80: @ 0x08056D80
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, .L08056DA4 @ =gUnk_085D354C
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	adds r0, r4, #0
	adds r1, r5, #0
	bl func_fe6_08056DB4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08056DA4: .4byte gUnk_085D354C

	thumb_func_start func_fe6_08056DA8
func_fe6_08056DA8: @ 0x08056DA8
	push {lr}
	bl Proc_Break
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_fe6_08056DB4
func_fe6_08056DB4: @ 0x08056DB4
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	adds r4, r1, #0
	ldr r0, .L08056DDC @ =gUnk_085D3564
	movs r1, #3
	bl SpawnProc
	adds r5, r0, #0
	str r6, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	adds r0, r5, #0
	adds r0, #0x29
	strb r4, [r0]
	cmp r4, #0
	bne .L08056DE8
	ldr r2, .L08056DE0 @ =gUnk_085DC850
	ldr r3, .L08056DE4 @ =gUnk_085DDAF0
	b .L08056DEC
	.align 2, 0
.L08056DDC: .4byte gUnk_085D3564
.L08056DE0: .4byte gUnk_085DC850
.L08056DE4: .4byte gUnk_085DDAF0
.L08056DE8:
	ldr r2, .L08056E18 @ =gUnk_085DEDC0
	ldr r3, .L08056E1C @ =gUnk_085E0090
.L08056DEC:
	str r2, [sp]
	adds r0, r6, #0
	adds r1, r3, #0
	bl EfxCreateFrontAnim
	adds r4, r0, #0
	str r4, [r5, #0x60]
	movs r0, #0xc0
	lsls r0, r0, #4
	ldrh r1, [r4, #8]
	ands r0, r1
	movs r5, #0
	strh r0, [r4, #8]
	adds r0, r6, #0
	bl GetAnimPosition
	cmp r0, #0
	bne .L08056E20
	movs r1, #0xe4
	lsls r1, r1, #7
	b .L08056E24
	.align 2, 0
.L08056E18: .4byte gUnk_085DEDC0
.L08056E1C: .4byte gUnk_085E0090
.L08056E20:
	movs r1, #0x93
	lsls r1, r1, #8
.L08056E24:
	adds r0, r1, #0
	ldrh r1, [r4, #8]
	orrs r0, r1
	strh r0, [r4, #8]
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start func_fe6_08056E34
func_fe6_08056E34: @ 0x08056E34
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, [r5, #0x60]
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x45
	bne .L08056E92
	adds r0, r5, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #0
	bne .L08056E6C
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne .L08056E64
	ldr r0, .L08056E60 @ =gUnk_085DDBF4
	b .L08056E82
	.align 2, 0
.L08056E60: .4byte gUnk_085DDBF4
.L08056E64:
	ldr r0, .L08056E68 @ =gUnk_085DC954
	b .L08056E82
	.align 2, 0
.L08056E68: .4byte gUnk_085DC954
.L08056E6C:
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne .L08056E80
	ldr r0, .L08056E7C @ =gUnk_085E0194
	b .L08056E82
	.align 2, 0
.L08056E7C: .4byte gUnk_085E0194
.L08056E80:
	ldr r0, .L08056E98 @ =gUnk_085DEEC4
.L08056E82:
	str r0, [r4, #0x24]
	str r0, [r4, #0x20]
	movs r0, #0
	strh r0, [r4, #6]
	strh r0, [r5, #0x2c]
	adds r0, r5, #0
	bl Proc_Break
.L08056E92:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08056E98: .4byte gUnk_085DEEC4

	thumb_func_start func_fe6_08056E9C
func_fe6_08056E9C: @ 0x08056E9C
	push {lr}
	adds r1, r0, #0
	ldr r0, [r1, #0x5c]
	ldrh r2, [r0, #0x10]
	movs r0, #4
	ands r0, r2
	cmp r0, #0
	beq .L08056EBE
	movs r0, #8
	ands r0, r2
	cmp r0, #0
	beq .L08056EBE
	movs r0, #0
	strh r0, [r1, #0x2c]
	adds r0, r1, #0
	bl Proc_Break
.L08056EBE:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_fe6_08056EC4
func_fe6_08056EC4: @ 0x08056EC4
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, [r5, #0x60]
	bl func_fe6_080449C4
	cmp r0, #1
	bne .L08056F1E
	adds r0, r5, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #0
	bne .L08056EF8
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne .L08056EF0
	ldr r0, .L08056EEC @ =gUnk_085DDC1C
	b .L08056F0E
	.align 2, 0
.L08056EEC: .4byte gUnk_085DDC1C
.L08056EF0:
	ldr r0, .L08056EF4 @ =gUnk_085DC97C
	b .L08056F0E
	.align 2, 0
.L08056EF4: .4byte gUnk_085DC97C
.L08056EF8:
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne .L08056F0C
	ldr r0, .L08056F08 @ =gUnk_085E01BC
	b .L08056F0E
	.align 2, 0
.L08056F08: .4byte gUnk_085E01BC
.L08056F0C:
	ldr r0, .L08056F24 @ =gUnk_085DEEEC
.L08056F0E:
	str r0, [r4, #0x24]
	str r0, [r4, #0x20]
	movs r0, #0
	strh r0, [r4, #6]
	strh r0, [r5, #0x2c]
	adds r0, r5, #0
	bl Proc_Break
.L08056F1E:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08056F24: .4byte gUnk_085DEEEC

	thumb_func_start func_fe6_08056F28
func_fe6_08056F28: @ 0x08056F28
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x14
	bne .L08056F4A
	movs r0, #0
	strh r0, [r4, #0x2c]
	ldr r0, [r4, #0x60]
	bl BasRemove
	adds r0, r4, #0
	bl Proc_Break
.L08056F4A:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start NewEfxHurtmutEff00
NewEfxHurtmutEff00: @ 0x08056F50
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, .L08056F7C @ =gEfxBgSemaphore
	ldr r5, [r0]
	cmp r5, #0
	bne .L08056F8E
	ldr r0, .L08056F80 @ =gUnk_085D3594
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	strh r5, [r0, #0x2c]
	ldr r0, .L08056F84 @ =gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne .L08056F88
	adds r0, r4, #0
	bl func_fe6_08056FA0
	b .L08056F8E
	.align 2, 0
.L08056F7C: .4byte gEfxBgSemaphore
.L08056F80: .4byte gUnk_085D3594
.L08056F84: .4byte gEkrDistanceType
.L08056F88:
	adds r0, r4, #0
	bl func_fe6_080570A0
.L08056F8E:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start func_fe6_08056F94
func_fe6_08056F94: @ 0x08056F94
	push {lr}
	bl Proc_Break
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_fe6_08056FA0
func_fe6_08056FA0: @ 0x08056FA0
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, .L08056FD8 @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08056FDC @ =gUnk_085D35AC
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	ldr r3, .L08056FE0 @ =AnimScr_ManaketeFlame
	str r3, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl EfxCreateFrontAnim
	str r0, [r4, #0x60]
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08056FD8: .4byte gEfxBgSemaphore
.L08056FDC: .4byte gUnk_085D35AC
.L08056FE0: .4byte AnimScr_ManaketeFlame

	thumb_func_start func_fe6_08056FE4
func_fe6_08056FE4: @ 0x08056FE4
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, [r5, #0x60]
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #1
	bne .L08056FFC
	ldr r0, .L08056FF8 @ =gUnk_085D7190
	b .L08056FFE
	.align 2, 0
.L08056FF8: .4byte gUnk_085D7190
.L08056FFC:
	ldr r0, .L08057024 @ =gUnk_085D74FC
.L08056FFE:
	str r0, [r4, #0x24]
	str r0, [r4, #0x20]
	movs r0, #0
	strh r0, [r4, #6]
	ldr r0, .L08057028 @ =gUnk_08121498
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, .L0805702C @ =gUnk_08120414
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	adds r0, r5, #0
	bl Proc_Break
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08057024: .4byte gUnk_085D74FC
.L08057028: .4byte gUnk_08121498
.L0805702C: .4byte gUnk_08120414

	thumb_func_start func_fe6_08057030
func_fe6_08057030: @ 0x08057030
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, [r5, #0x60]
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #1
	bne .L08057048
	ldr r0, .L08057044 @ =gUnk_085D77E4
	b .L0805704A
	.align 2, 0
.L08057044: .4byte gUnk_085D77E4
.L08057048:
	ldr r0, .L08057070 @ =gUnk_085D7A40
.L0805704A:
	str r0, [r4, #0x24]
	str r0, [r4, #0x20]
	movs r0, #0
	strh r0, [r4, #6]
	ldr r0, .L08057074 @ =gUnk_08121498
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, .L08057078 @ =gUnk_08120CB4
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	adds r0, r5, #0
	bl Proc_Break
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08057070: .4byte gUnk_085D7A40
.L08057074: .4byte gUnk_08121498
.L08057078: .4byte gUnk_08120CB4

	thumb_func_start func_fe6_0805707C
func_fe6_0805707C: @ 0x0805707C
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, .L0805709C @ =gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	ldr r0, [r4, #0x60]
	bl BasRemove
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0805709C: .4byte gEfxBgSemaphore

	thumb_func_start func_fe6_080570A0
func_fe6_080570A0: @ 0x080570A0
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, .L080570D8 @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L080570DC @ =gUnk_085D35E4
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	ldr r3, .L080570E0 @ =AnimScr_ManaketeFlame
	str r3, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl EfxCreateFrontAnim
	str r0, [r4, #0x60]
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L080570D8: .4byte gEfxBgSemaphore
.L080570DC: .4byte gUnk_085D35E4
.L080570E0: .4byte AnimScr_ManaketeFlame

	thumb_func_start func_fe6_080570E4
func_fe6_080570E4: @ 0x080570E4
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, [r5, #0x60]
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #1
	bne .L080570FC
	ldr r0, .L080570F8 @ =gUnk_085D71D8
	b .L080570FE
	.align 2, 0
.L080570F8: .4byte gUnk_085D71D8
.L080570FC:
	ldr r0, .L08057124 @ =gUnk_085D7544
.L080570FE:
	str r0, [r4, #0x24]
	str r0, [r4, #0x20]
	movs r0, #0
	strh r0, [r4, #6]
	ldr r0, .L08057128 @ =gUnk_08121498
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, .L0805712C @ =gUnk_08120414
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	adds r0, r5, #0
	bl Proc_Break
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08057124: .4byte gUnk_085D7544
.L08057128: .4byte gUnk_08121498
.L0805712C: .4byte gUnk_08120414

	thumb_func_start func_fe6_08057130
func_fe6_08057130: @ 0x08057130
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, [r5, #0x60]
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #1
	bne .L08057148
	ldr r0, .L08057144 @ =gUnk_085D77F4
	b .L0805714A
	.align 2, 0
.L08057144: .4byte gUnk_085D77F4
.L08057148:
	ldr r0, .L08057170 @ =gUnk_085D7A50
.L0805714A:
	str r0, [r4, #0x24]
	str r0, [r4, #0x20]
	movs r0, #0
	strh r0, [r4, #6]
	ldr r0, .L08057174 @ =gUnk_08121498
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, .L08057178 @ =gUnk_08120CB4
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	adds r0, r5, #0
	bl Proc_Break
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08057170: .4byte gUnk_085D7A50
.L08057174: .4byte gUnk_08121498
.L08057178: .4byte gUnk_08120CB4

	thumb_func_start func_fe6_0805717C
func_fe6_0805717C: @ 0x0805717C
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, .L0805719C @ =gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	ldr r0, [r4, #0x60]
	bl BasRemove
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0805719C: .4byte gEfxBgSemaphore

	thumb_func_start func_fe6_080571A0
func_fe6_080571A0: @ 0x080571A0
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r7, r1, #0
	ldr r0, .L080571EC @ =gEfxBgSemaphore
	ldr r4, [r0]
	cmp r4, #0
	bne .L08057200
	bl SpellFx_SetBG1Position
	ldr r0, .L080571F0 @ =gUnk_085D361C
	movs r1, #3
	bl SpawnProc
	adds r5, r0, #0
	str r6, [r5, #0x5c]
	strh r4, [r5, #0x2c]
	ldr r4, .L080571F4 @ =gBanimIdx
	adds r0, r6, #0
	bl GetAnimPosition
	lsls r0, r0, #1
	adds r0, r0, r4
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0x11
	beq .L080571F8
	cmp r0, #0x11
	bgt .L080571F8
	cmp r0, #0xd
	bgt .L080571F8
	cmp r0, #0xc
	blt .L080571F8
	ldr r0, [r5, #0x5c]
	adds r1, r7, #0
	bl func_fe6_08057224
	b .L08057200
	.align 2, 0
.L080571EC: .4byte gEfxBgSemaphore
.L080571F0: .4byte gUnk_085D361C
.L080571F4: .4byte gBanimIdx
.L080571F8:
	ldr r0, [r5, #0x5c]
	adds r1, r7, #2
	bl func_fe6_08057224
.L08057200:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_fe6_08057208
func_fe6_08057208: @ 0x08057208
	push {lr}
	adds r1, r0, #0
	ldrh r0, [r1, #0x2c]
	adds r0, #1
	strh r0, [r1, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x14
	bne .L08057220
	adds r0, r1, #0
	bl Proc_Break
.L08057220:
	pop {r0}
	bx r0

	thumb_func_start func_fe6_08057224
func_fe6_08057224: @ 0x08057224
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r6, r1, #0
	ldr r1, .L08057258 @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L0805725C @ =gUnk_085D3634
	movs r1, #3
	bl SpawnProc
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	str r0, [r5, #0x44]
	cmp r6, #1
	beq .L08057270
	cmp r6, #1
	blo .L08057260
	cmp r6, #2
	beq .L08057280
	cmp r6, #3
	beq .L08057288
	b .L08057292
	.align 2, 0
.L08057258: .4byte gEfxBgSemaphore
.L0805725C: .4byte gUnk_085D3634
.L08057260:
	ldr r0, .L08057268 @ =gUnk_0811AEA0
	str r0, [r5, #0x48]
	ldr r0, .L0805726C @ =gUnk_085D364C
	b .L0805728E
	.align 2, 0
.L08057268: .4byte gUnk_0811AEA0
.L0805726C: .4byte gUnk_085D364C
.L08057270:
	ldr r0, .L08057278 @ =gUnk_0811AEB6
	str r0, [r5, #0x48]
	ldr r0, .L0805727C @ =gUnk_085D364C
	b .L0805728E
	.align 2, 0
.L08057278: .4byte gUnk_0811AEB6
.L0805727C: .4byte gUnk_085D364C
.L08057280:
	ldr r0, .L08057284 @ =gUnk_0811AEBC
	b .L0805728A
	.align 2, 0
.L08057284: .4byte gUnk_0811AEBC
.L08057288:
	ldr r0, .L080572C8 @ =gUnk_0811AEDE
.L0805728A:
	str r0, [r5, #0x48]
	ldr r0, .L080572CC @ =gUnk_085D3664
.L0805728E:
	str r0, [r5, #0x4c]
	str r0, [r5, #0x50]
.L08057292:
	ldr r0, .L080572D0 @ =gUnk_08129504
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	ldr r0, .L080572D4 @ =gUnk_0812A258
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	bl SpellFx_SetSomeColorEffect
	ldr r0, .L080572D8 @ =gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq .L080572E6
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne .L080572DC
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl SetBgOffset
	b .L080572E6
	.align 2, 0
.L080572C8: .4byte gUnk_0811AEDE
.L080572CC: .4byte gUnk_085D3664
.L080572D0: .4byte gUnk_08129504
.L080572D4: .4byte gUnk_0812A258
.L080572D8: .4byte gEkrDistanceType
.L080572DC:
	movs r0, #1
	movs r1, #0xe8
	movs r2, #0
	bl SetBgOffset
.L080572E6:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start func_fe6_080572EC
func_fe6_080572EC: @ 0x080572EC
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
	blt .L0805731A
	ldr r1, [r4, #0x4c]
	ldr r3, [r4, #0x50]
	ldr r0, [r4, #0x5c]
	lsls r2, r2, #2
	adds r1, r2, r1
	ldr r1, [r1]
	adds r2, r2, r3
	ldr r2, [r2]
	bl SpellFx_WriteBgMap
	b .L08057338
.L0805731A:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r2, r0
	bne .L08057338
	bl SpellFx_ClearBG1
	ldr r1, .L08057340 @ =gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_ClearColorEffects
	adds r0, r4, #0
	bl Proc_End
.L08057338:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08057340: .4byte gEfxBgSemaphore

	thumb_func_start func_fe6_08057344
func_fe6_08057344: @ 0x08057344
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	ldr r0, .L0805736C @ =gEfxBgSemaphore
	ldr r4, [r0]
	cmp r4, #0
	bne .L08057366
	ldr r0, .L08057370 @ =gUnk_085D36A4
	movs r1, #3
	bl SpawnProc
	str r5, [r0, #0x5c]
	strh r4, [r0, #0x2c]
	adds r0, r5, #0
	adds r1, r6, #0
	bl func_fe6_08057380
.L08057366:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L0805736C: .4byte gEfxBgSemaphore
.L08057370: .4byte gUnk_085D36A4

	thumb_func_start func_fe6_08057374
func_fe6_08057374: @ 0x08057374
	push {lr}
	bl Proc_Break
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_fe6_08057380
func_fe6_08057380: @ 0x08057380
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	adds r4, r1, #0
	ldr r1, .L080573E8 @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L080573EC @ =gUnk_085D36BC
	movs r1, #3
	bl SpawnProc
	adds r5, r0, #0
	str r6, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	ldr r2, .L080573F0 @ =gUnk_085E0280
	cmp r4, #0
	beq .L080573AE
	ldr r2, .L080573F4 @ =gUnk_085E0510
	cmp r4, #1
	bne .L080573AE
	ldr r2, .L080573F8 @ =gUnk_085E03C8
.L080573AE:
	ldr r3, .L080573FC @ =gUnk_085E0324
	cmp r4, #0
	beq .L080573BC
	ldr r3, .L08057400 @ =gUnk_085E05B4
	cmp r4, #1
	bne .L080573BC
	ldr r3, .L08057404 @ =gUnk_085E046C
.L080573BC:
	str r2, [sp]
	adds r0, r6, #0
	adds r1, r3, #0
	bl EfxCreateFrontAnim
	str r0, [r5, #0x60]
	ldr r4, .L08057408 @ =0x0203CDC0
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	lsls r0, r0, #1
	adds r0, r0, r4
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0x32
	bls .L080573DE
	b .L08057510
.L080573DE:
	lsls r0, r0, #2
	ldr r1, .L0805740C @ =.L08057410
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
.L080573E8: .4byte gEfxBgSemaphore
.L080573EC: .4byte gUnk_085D36BC
.L080573F0: .4byte gUnk_085E0280
.L080573F4: .4byte gUnk_085E0510
.L080573F8: .4byte gUnk_085E03C8
.L080573FC: .4byte gUnk_085E0324
.L08057400: .4byte gUnk_085E05B4
.L08057404: .4byte gUnk_085E046C
.L08057408: .4byte 0x0203CDC0
.L0805740C: .4byte .L08057410
.L08057410: @ jump table
	.4byte .L08057510 @ case 0
	.4byte .L080574DC @ case 1
	.4byte .L080574DC @ case 2
	.4byte .L080574DC @ case 3
	.4byte .L080574DC @ case 4
	.4byte .L080574DC @ case 5
	.4byte .L08057508 @ case 6
	.4byte .L08057508 @ case 7
	.4byte .L08057508 @ case 8
	.4byte .L08057508 @ case 9
	.4byte .L080574DC @ case 10
	.4byte .L08057508 @ case 11
	.4byte .L080574DC @ case 12
	.4byte .L080574DC @ case 13
	.4byte .L080574DC @ case 14
	.4byte .L080574DC @ case 15
	.4byte .L080574F8 @ case 16
	.4byte .L080574DC @ case 17
	.4byte .L080574DC @ case 18
	.4byte .L080574DC @ case 19
	.4byte .L080574E4 @ case 20
	.4byte .L080574F8 @ case 21
	.4byte .L080574F8 @ case 22
	.4byte .L08057508 @ case 23
	.4byte .L08057508 @ case 24
	.4byte .L080574DC @ case 25
	.4byte .L080574DC @ case 26
	.4byte .L080574DC @ case 27
	.4byte .L080574DC @ case 28
	.4byte .L08057508 @ case 29
	.4byte .L08057508 @ case 30
	.4byte .L08057508 @ case 31
	.4byte .L08057508 @ case 32
	.4byte .L08057508 @ case 33
	.4byte .L080574DC @ case 34
	.4byte .L080574DC @ case 35
	.4byte .L08057508 @ case 36
	.4byte .L080574DC @ case 37
	.4byte .L080574DC @ case 38
	.4byte .L080574DC @ case 39
	.4byte .L080574DC @ case 40
	.4byte .L080574DC @ case 41
	.4byte .L080574DC @ case 42
	.4byte .L080574DC @ case 43
	.4byte .L08057510 @ case 44
	.4byte .L08057508 @ case 45
	.4byte .L08057510 @ case 46
	.4byte .L080574DC @ case 47
	.4byte .L08057508 @ case 48
	.4byte .L08057508 @ case 49
	.4byte .L08057508 @ case 50
.L080574DC:
	ldr r0, .L080574E0 @ =gUnk_0812C62C
	b .L080574FA
	.align 2, 0
.L080574E0: .4byte gUnk_0812C62C
.L080574E4:
	ldr r0, [r5, #0x5c]
	bl func_fe6_0805C2B0
	cmp r0, #0
	beq .L080574F8
	ldr r0, .L080574F4 @ =gUnk_0812C62C
	b .L080574FA
	.align 2, 0
.L080574F4: .4byte gUnk_0812C62C
.L080574F8:
	ldr r0, .L08057504 @ =gUnk_0812C64C
.L080574FA:
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	b .L08057510
	.align 2, 0
.L08057504: .4byte gUnk_0812C64C
.L08057508:
	ldr r0, .L08057524 @ =gUnk_0812C66C
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
.L08057510:
	ldr r0, .L08057528 @ =gUnk_0812C1BC
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08057524: .4byte gUnk_0812C66C
.L08057528: .4byte gUnk_0812C1BC

	thumb_func_start func_fe6_0805752C
func_fe6_0805752C: @ 0x0805752C
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #9
	bne .L08057552
	ldr r0, .L08057558 @ =gEfxBgSemaphore
	ldr r1, [r0]
	subs r1, #1
	str r1, [r0]
	ldr r0, [r4, #0x60]
	bl BasRemove
	adds r0, r4, #0
	bl Proc_Break
.L08057552:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08057558: .4byte gEfxBgSemaphore

	thumb_func_start NewEfxKingPika
NewEfxKingPika: @ 0x0805755C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, .L08057574 @ =gUnk_085D36D4
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08057574: .4byte gUnk_085D36D4

	thumb_func_start func_fe6_08057578
func_fe6_08057578: @ 0x08057578
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	ldr r6, [r7, #0x5c]
	ldrh r0, [r7, #0x2c]
	adds r0, #1
	strh r0, [r7, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne .L0805759A
	adds r0, r6, #0
	movs r1, #1
	movs r2, #0x28
	movs r3, #0
	bl NewEfxFlashUnit
	b .L080575DE
.L0805759A:
	cmp r0, #0xa
	bne .L080575A8
	adds r0, r6, #0
	movs r1, #0x14
	bl NewEfxFlashBgWhite
	b .L080575DE
.L080575A8:
	cmp r0, #0x2d
	bne .L080575DE
	ldr r5, .L080575E4 @ =gAnims
	adds r0, r6, #0
	bl GetAnimPosition
	lsls r0, r0, #3
	adds r0, r0, r5
	ldr r4, [r0]
	adds r0, r6, #0
	bl GetAnimPosition
	lsls r0, r0, #1
	adds r0, #1
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r2, [r0]
	movs r0, #0x40
	ldrh r1, [r4, #0x10]
	orrs r1, r0
	strh r1, [r4, #0x10]
	ldrh r1, [r2, #0x10]
	orrs r0, r1
	strh r0, [r2, #0x10]
	adds r0, r7, #0
	bl Proc_Break
.L080575DE:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L080575E4: .4byte gAnims

	thumb_func_start NewEfxFlashFX
NewEfxFlashFX: @ 0x080575E8
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, .L08057648 @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L0805764C @ =gUnk_085D36EC
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #0x28
	strh r0, [r4, #0x2e]
	ldr r3, .L08057650 @ =gUnk_085D55C0
	str r3, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl EfxCreateFrontAnim
	str r0, [r4, #0x60]
	ldr r0, .L08057654 @ =gUnk_0811CAD8
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, .L08057658 @ =gUnk_0811C964
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r0, [r4, #0x5c]
	movs r3, #2
	ldrsh r2, [r0, r3]
	movs r0, #0xee
	movs r3, #1
	bl func_fe6_0805C804
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08057648: .4byte gEfxBgSemaphore
.L0805764C: .4byte gUnk_085D36EC
.L08057650: .4byte gUnk_085D55C0
.L08057654: .4byte gUnk_0811CAD8
.L08057658: .4byte gUnk_0811C964

	thumb_func_start func_fe6_0805765C
func_fe6_0805765C: @ 0x0805765C
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x18
	bne .L08057680
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r0, [r4, #0x5c]
	movs r3, #2
	ldrsh r2, [r0, r3]
	movs r0, #0xee
	movs r3, #1
	bl func_fe6_0805C804
.L08057680:
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	movs r2, #0x2e
	ldrsh r0, [r4, r2]
	cmp r1, r0
	ble .L080576A0
	ldr r0, [r4, #0x60]
	bl BasRemove
	ldr r1, .L080576A8 @ =gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
.L080576A0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L080576A8: .4byte gEfxBgSemaphore

	thumb_func_start NewEfxSongOBJ2
NewEfxSongOBJ2: @ 0x080576AC
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, .L0805770C @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08057710 @ =gUnk_085D3704
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #0x19
	strh r0, [r4, #0x2e]
	ldr r3, .L08057714 @ =gUnk_085D5590
	str r3, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl EfxCreateFrontAnim
	str r0, [r4, #0x60]
	ldr r0, .L08057718 @ =gUnk_0811CAD8
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, .L0805771C @ =gUnk_0811C964
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r0, [r4, #0x5c]
	movs r3, #2
	ldrsh r2, [r0, r3]
	movs r0, #0xe1
	movs r3, #1
	bl func_fe6_0805C804
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0805770C: .4byte gEfxBgSemaphore
.L08057710: .4byte gUnk_085D3704
.L08057714: .4byte gUnk_085D5590
.L08057718: .4byte gUnk_0811CAD8
.L0805771C: .4byte gUnk_0811C964

	thumb_func_start func_fe6_08057720
func_fe6_08057720: @ 0x08057720
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r4, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	ble .L08057748
	ldr r0, [r4, #0x60]
	bl BasRemove
	ldr r1, .L08057750 @ =gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
.L08057748:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08057750: .4byte gEfxBgSemaphore

	thumb_func_start func_fe6_08057754
func_fe6_08057754: @ 0x08057754
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	adds r7, r2, #0
	bl GetEkrDragonStateType
	adds r4, r0, #0
	cmp r4, #0
	bne .L0805778E
	ldr r1, .L08057794 @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08057798 @ =gUnk_085D371C
	movs r1, #3
	bl SpawnProc
	str r5, [r0, #0x5c]
	movs r2, #0
	strh r4, [r0, #0x2c]
	strh r6, [r0, #0x2e]
	strh r7, [r0, #0x30]
	ldr r1, .L0805779C @ =gDispIo
	movs r0, #0x40
	ldrb r3, [r1, #0x18]
	orrs r0, r3
	strb r0, [r1, #0x18]
	adds r1, #0x38
	strb r2, [r1]
.L0805778E:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08057794: .4byte gEfxBgSemaphore
.L08057798: .4byte gUnk_085D371C
.L0805779C: .4byte gDispIo

	thumb_func_start func_fe6_080577A0
func_fe6_080577A0: @ 0x080577A0
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	movs r0, #0x30
	ldrsh r2, [r4, r0]
	movs r1, #0x2c
	ldrsh r3, [r4, r1]
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	bl Interpolate
	ldr r2, .L080577F0 @ =gDispIo
	adds r2, #0x38
	movs r3, #0xf
	adds r1, r0, #0
	ands r1, r3
	lsls r0, r0, #4
	orrs r0, r1
	strb r0, [r2]
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r4, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	ble .L080577E6
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r4, #0
	bl Proc_Break
.L080577E6:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L080577F0: .4byte gDispIo

	thumb_func_start func_fe6_080577F4
func_fe6_080577F4: @ 0x080577F4
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	movs r0, #0x30
	ldrsh r1, [r4, r0]
	movs r2, #0x2c
	ldrsh r3, [r4, r2]
	movs r2, #0x2e
	ldrsh r0, [r4, r2]
	str r0, [sp]
	movs r0, #0
	movs r2, #0
	bl Interpolate
	ldr r3, .L08057858 @ =gDispIo
	adds r5, r3, #0
	adds r5, #0x38
	movs r2, #0xf
	adds r1, r0, #0
	ands r1, r2
	lsls r0, r0, #4
	orrs r0, r1
	strb r0, [r5]
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r4, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	ble .L0805784E
	ldr r1, .L0805785C @ =gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	movs r0, #0x41
	rsbs r0, r0, #0
	ldrb r1, [r3, #0x18]
	ands r0, r1
	strb r0, [r3, #0x18]
	movs r0, #0
	strb r0, [r5]
	adds r0, r4, #0
	bl Proc_Break
.L0805784E:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08057858: .4byte gDispIo
.L0805785C: .4byte gEfxBgSemaphore

	thumb_func_start func_fe6_08057860
func_fe6_08057860: @ 0x08057860
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r4, .L08057894 @ =gUnk_Banim_02017760
	bl GetAnimPosition
	lsls r0, r0, #1
	adds r0, r0, r4
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne .L080578BC
	adds r0, r5, #0
	bl GetAnimPosition
	lsls r0, r0, #1
	adds r0, r0, r4
	movs r1, #1
	strh r1, [r0]
	adds r0, r5, #0
	bl GetAnimPosition
	cmp r0, #0
	bne .L0805789C
	ldr r0, .L08057898 @ =gpEkrBattleUnitLeft
	b .L0805789E
	.align 2, 0
.L08057894: .4byte gUnk_Banim_02017760
.L08057898: .4byte gpEkrBattleUnitLeft
.L0805789C:
	ldr r0, .L080578EC @ =gpEkrBattleUnitRight
.L0805789E:
	ldr r0, [r0]
	adds r4, r0, #0
	adds r4, #0x4a
	ldrh r0, [r4]
	bl GetItemKind
	ldrh r0, [r4]
	bl GetItemRequiredExp
	movs r1, #0
	cmp r0, #0xfb
	bne .L080578B8
	movs r1, #1
.L080578B8:
	cmp r1, #0
	bne .L080578F4
.L080578BC:
	ldr r4, .L080578F0 @ =gAnims
	adds r0, r5, #0
	bl GetAnimPosition
	lsls r0, r0, #3
	adds r0, r0, r4
	ldr r6, [r0]
	adds r0, r5, #0
	bl GetAnimPosition
	lsls r0, r0, #1
	adds r0, #1
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r2, [r0]
	movs r1, #0x40
	ldrh r0, [r6, #0x10]
	orrs r0, r1
	strh r0, [r6, #0x10]
	ldrh r0, [r2, #0x10]
	orrs r0, r1
	strh r0, [r2, #0x10]
	b .L08057916
	.align 2, 0
.L080578EC: .4byte gpEkrBattleUnitRight
.L080578F0: .4byte gAnims
.L080578F4:
	ldr r0, .L0805791C @ =gUnk_085D373C
	movs r1, #3
	bl SpawnProc
	str r5, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0xf0
	movs r2, #0x78
	movs r3, #0
	bl func_fe6_0805C804
	adds r0, r5, #0
	bl func_fe6_0805792C
.L08057916:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L0805791C: .4byte gUnk_085D373C

	thumb_func_start func_fe6_08057920
func_fe6_08057920: @ 0x08057920
	push {lr}
	bl Proc_Break
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_fe6_0805792C
func_fe6_0805792C: @ 0x0805792C
	push {r4, lr}
	adds r4, r0, #0
	bl SpellFx_SetBG1Position
	ldr r0, .L08057948 @ =gUnk_085D3754
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08057948: .4byte gUnk_085D3754

	thumb_func_start func_fe6_0805794C
func_fe6_0805794C: @ 0x0805794C
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldrh r0, [r6, #0x2c]
	adds r0, #1
	strh r0, [r6, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne .L08057966
	ldr r0, [r6, #0x5c]
	bl func_fe6_080579C0
	b .L080579B6
.L08057966:
	cmp r0, #0x15
	bne .L08057980
	ldr r0, [r6, #0x5c]
	ldr r2, .L0805797C @ =func_fe6_08057A34
	movs r1, #0x2d
	bl func_fe6_0804CC68
	bl func_fe6_08057A5C
	b .L080579B6
	.align 2, 0
.L0805797C: .4byte func_fe6_08057A34
.L08057980:
	cmp r0, #0x46
	bne .L080579B6
	ldr r5, .L080579BC @ =gAnims
	ldr r0, [r6, #0x5c]
	bl GetAnimPosition
	lsls r0, r0, #3
	adds r0, r0, r5
	ldr r4, [r0]
	ldr r0, [r6, #0x5c]
	bl GetAnimPosition
	lsls r0, r0, #1
	adds r0, #1
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r2, [r0]
	movs r0, #0x40
	ldrh r1, [r4, #0x10]
	orrs r1, r0
	strh r1, [r4, #0x10]
	ldrh r1, [r2, #0x10]
	orrs r0, r1
	strh r0, [r2, #0x10]
	adds r0, r6, #0
	bl Proc_Break
.L080579B6:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L080579BC: .4byte gAnims

	thumb_func_start func_fe6_080579C0
func_fe6_080579C0: @ 0x080579C0
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, .L080579FC @ =gUnk_085D376C
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	ldr r0, .L08057A00 @ =gUnk_08124618
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	ldr r0, .L08057A04 @ =gUnk_081246D8
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	ldr r0, [r4, #0x5c]
	ldr r2, .L08057A08 @ =gUnk_081246F8
	adds r1, r2, #0
	bl SpellFx_WriteBgMap
	bl SpellFx_SetSomeColorEffect
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L080579FC: .4byte gUnk_085D376C
.L08057A00: .4byte gUnk_08124618
.L08057A04: .4byte gUnk_081246D8
.L08057A08: .4byte gUnk_081246F8

	thumb_func_start func_fe6_08057A0C
func_fe6_08057A0C: @ 0x08057A0C
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x3c
	bne .L08057A2C
	bl SpellFx_ClearBG1
	bl SpellFx_ClearColorEffects
	adds r0, r4, #0
	bl Proc_Break
.L08057A2C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_fe6_08057A34
func_fe6_08057A34: @ 0x08057A34
	ldr r0, .L08057A50 @ =0x04000004
	ldrh r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne .L08057A4E
	ldr r3, .L08057A54 @ =0x04000016
	ldr r2, .L08057A58 @ =gUnk_Banim_0201E3E0
	ldr r0, [r2]
	ldrh r1, [r0]
	strh r1, [r3]
	adds r0, #2
	str r0, [r2]
.L08057A4E:
	bx lr
	.align 2, 0
.L08057A50: .4byte 0x04000004
.L08057A54: .4byte 0x04000016
.L08057A58: .4byte gUnk_Banim_0201E3E0

	thumb_func_start func_fe6_08057A5C
func_fe6_08057A5C: @ 0x08057A5C
	push {lr}
	ldr r0, .L08057A78 @ =gUnk_085D3784
	movs r1, #3
	bl SpawnProc
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x2e]
	str r1, [r0, #0x44]
	bl func_fe6_08057B2C
	pop {r0}
	bx r0
	.align 2, 0
.L08057A78: .4byte gUnk_085D3784

	thumb_func_start func_fe6_08057A7C
func_fe6_08057A7C: @ 0x08057A7C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	mov sb, r0
	ldr r0, .L08057AD8 @ =gUnk_Banim_0201E3D8
	ldr r0, [r0]
	ldr r5, .L08057ADC @ =gUnk_Banim_0201E158
	cmp r0, #0
	bne .L08057A92
	ldr r5, .L08057AE0 @ =gUnk_Banim_0201E298
.L08057A92:
	ldr r4, .L08057AE4 @ =gUnk_Banim_0201E3E4
	cmp r0, #0
	bne .L08057A9A
	ldr r4, .L08057AE8 @ =gUnk_Banim_0201E524
.L08057A9A:
	movs r3, #0
	movs r0, #0
	mov r8, r0
	movs r1, #0x88
	lsls r1, r1, #0x10
	mov ip, r1
	movs r7, #0x88
	ldr r6, .L08057AEC @ =gUnk_085D37B4
.L08057AAA:
	cmp r3, #0x77
	bhi .L08057B04
	movs r2, #0
	ldrsh r1, [r6, r2]
	mov r2, sb
	ldr r0, [r2, #0x44]
	muls r0, r1, r0
	lsls r0, r0, #4
	lsrs r2, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0
	beq .L08057AFC
	cmp r3, #0x3b
	bhi .L08057AF4
	adds r0, r3, #0
	subs r0, #0x88
	cmp r1, r0
	bhs .L08057AFC
	ldr r1, .L08057AF0 @ =0x0000FF78
	adds r0, r3, r1
	lsls r0, r0, #0x10
	b .L08057AFA
	.align 2, 0
.L08057AD8: .4byte gUnk_Banim_0201E3D8
.L08057ADC: .4byte gUnk_Banim_0201E158
.L08057AE0: .4byte gUnk_Banim_0201E298
.L08057AE4: .4byte gUnk_Banim_0201E3E4
.L08057AE8: .4byte gUnk_Banim_0201E524
.L08057AEC: .4byte gUnk_085D37B4
.L08057AF0: .4byte 0x0000FF78
.L08057AF4:
	cmp r1, r7
	bls .L08057AFC
	mov r0, ip
.L08057AFA:
	lsrs r2, r0, #0x10
.L08057AFC:
	strh r2, [r5]
	adds r5, #2
	strh r2, [r4]
	b .L08057B0C
.L08057B04:
	mov r1, r8
	strh r1, [r5]
	adds r5, #2
	strh r1, [r4]
.L08057B0C:
	adds r4, #2
	ldr r2, .L08057B28 @ =0xFFFF0000
	add ip, r2
	subs r7, #1
	adds r6, #2
	adds r3, #1
	cmp r3, #0x9f
	bls .L08057AAA
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08057B28: .4byte 0xFFFF0000

	thumb_func_start func_fe6_08057B2C
func_fe6_08057B2C: @ 0x08057B2C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, .L08057B48 @ =gUnk_085D379C
	movs r1, #3
	bl SpawnProc
	movs r1, #0
	strh r1, [r0, #0x2c]
	movs r1, #0x28
	strh r1, [r0, #0x2e]
	str r4, [r0, #0x5c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08057B48: .4byte gUnk_085D379C

	thumb_func_start func_fe6_08057B4C
func_fe6_08057B4C: @ 0x08057B4C
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r5, [r4, #0x5c]
	movs r2, #0x80
	lsls r2, r2, #0xb
	movs r0, #0x2c
	ldrsh r3, [r4, r0]
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	bl Interpolate
	str r0, [r5, #0x44]
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r4, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	ble .L08057B88
	adds r0, r5, #0
	bl Proc_End
	adds r0, r4, #0
	bl Proc_Break
.L08057B88:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start func_fe6_08057B90
func_fe6_08057B90: @ 0x08057B90
	push {r4, lr}
	adds r4, r0, #0
	bl SpellFx_SetBG1Position
	ldr r0, .L08057BAC @ =gUnk_085D38A4
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08057BAC: .4byte gUnk_085D38A4

	thumb_func_start func_fe6_08057BB0
func_fe6_08057BB0: @ 0x08057BB0
	push {r4, r5, lr}
	adds r5, r0, #0
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x11
	bne .L08057BE6
	ldr r0, [r5, #0x5c]
	movs r1, #0x49
	bl func_fe6_08057BF8
	movs r4, #0xa0
	lsls r4, r4, #1
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r4, #0
	bl EfxPlaySE
	ldr r0, [r5, #0x5c]
	movs r2, #2
	ldrsh r1, [r0, r2]
	adds r0, r4, #0
	movs r2, #1
	bl M4aPlayWithPostionCtrl
.L08057BE6:
	ldrh r0, [r5, #0x2c]
	cmp r0, #0x64
	bne .L08057BF2
	adds r0, r5, #0
	bl Proc_Break
.L08057BF2:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start func_fe6_08057BF8
func_fe6_08057BF8: @ 0x08057BF8
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, .L08057C78 @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08057C7C @ =gUnk_085D38BC
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x2e]
	strh r5, [r0, #0x30]
	str r1, [r0, #0x44]
	ldr r1, .L08057C80 @ =gUnk_0811AF00
	str r1, [r0, #0x48]
	ldr r1, .L08057C84 @ =gUnk_085D38D4
	str r1, [r0, #0x4c]
	str r1, [r0, #0x50]
	ldr r0, .L08057C88 @ =gUnk_0812BE10
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	ldr r0, .L08057C8C @ =gUnk_0812B19C
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	bl SpellFx_SetSomeColorEffect
	ldr r3, .L08057C90 @ =gDispIo
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r2, [r3, #0xc]
	ands r0, r2
	strb r0, [r3, #0xc]
	adds r0, r1, #0
	ldrb r2, [r3, #0x14]
	ands r0, r2
	movs r2, #1
	orrs r0, r2
	strb r0, [r3, #0x14]
	ldrb r0, [r3, #0x10]
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	strb r1, [r3, #0x10]
	movs r0, #3
	ldrb r1, [r3, #0x18]
	orrs r0, r1
	strb r0, [r3, #0x18]
	movs r0, #1
	movs r1, #0x10
	movs r2, #0
	bl SetBgOffset
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08057C78: .4byte gEfxBgSemaphore
.L08057C7C: .4byte gUnk_085D38BC
.L08057C80: .4byte gUnk_0811AF00
.L08057C84: .4byte gUnk_085D38D4
.L08057C88: .4byte gUnk_0812BE10
.L08057C8C: .4byte gUnk_0812B19C
.L08057C90: .4byte gDispIo

	thumb_func_start func_fe6_08057C94
func_fe6_08057C94: @ 0x08057C94
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
	blt .L08057CC0
	ldr r1, [r4, #0x4c]
	ldr r3, [r4, #0x50]
	ldr r0, [r4, #0x5c]
	lsls r2, r2, #2
	adds r1, r2, r1
	ldr r1, [r1]
	adds r2, r2, r3
	ldr r2, [r2]
	bl SpellFx_WriteBgMap
.L08057CC0:
	ldrh r0, [r4, #0x2e]
	adds r0, #1
	strh r0, [r4, #0x2e]
	lsls r0, r0, #0x10
	ldrh r2, [r4, #0x30]
	lsls r1, r2, #0x10
	cmp r0, r1
	bne .L08057D12
	ldr r3, .L08057D18 @ =gDispIo
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r2, [r3, #0xc]
	ands r0, r2
	strb r0, [r3, #0xc]
	adds r0, r1, #0
	ldrb r2, [r3, #0x10]
	ands r0, r2
	movs r2, #1
	orrs r0, r2
	strb r0, [r3, #0x10]
	ldrb r0, [r3, #0x18]
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	strb r1, [r3, #0x18]
	movs r0, #3
	ldrb r1, [r3, #0x14]
	orrs r0, r1
	strb r0, [r3, #0x14]
	bl SpellFx_ClearBG1
	ldr r1, .L08057D1C @ =gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_ClearColorEffects
	adds r0, r4, #0
	bl Proc_Break
.L08057D12:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08057D18: .4byte gDispIo
.L08057D1C: .4byte gEfxBgSemaphore

	thumb_func_start NewEfxMantBatabata
NewEfxMantBatabata: @ 0x08057D20
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r7, r0, #0
	bl GetAnimPosition
	ldr r1, .L08057D4C @ =gBanimIdx
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	subs r0, #0xc
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x29
	bhi .L08057E1C
	lsls r0, r0, #2
	ldr r1, .L08057D50 @ =.L08057D54
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
.L08057D4C: .4byte gBanimIdx
.L08057D50: .4byte .L08057D54
.L08057D54: @ jump table
	.4byte .L08057DFC @ case 0
	.4byte .L08057DFC @ case 1
	.4byte .L08057E1C @ case 2
	.4byte .L08057E1C @ case 3
	.4byte .L08057E1C @ case 4
	.4byte .L08057E0C @ case 5
	.4byte .L08057E1C @ case 6
	.4byte .L08057E1C @ case 7
	.4byte .L08057E1C @ case 8
	.4byte .L08057E1C @ case 9
	.4byte .L08057E1C @ case 10
	.4byte .L08057E1C @ case 11
	.4byte .L08057E1C @ case 12
	.4byte .L08057E1C @ case 13
	.4byte .L08057E1C @ case 14
	.4byte .L08057E1C @ case 15
	.4byte .L08057E1C @ case 16
	.4byte .L08057E1C @ case 17
	.4byte .L08057E1C @ case 18
	.4byte .L08057E1C @ case 19
	.4byte .L08057E1C @ case 20
	.4byte .L08057E1C @ case 21
	.4byte .L08057E1C @ case 22
	.4byte .L08057E1C @ case 23
	.4byte .L08057E1C @ case 24
	.4byte .L08057E1C @ case 25
	.4byte .L08057E1C @ case 26
	.4byte .L08057E1C @ case 27
	.4byte .L08057E1C @ case 28
	.4byte .L08057E1C @ case 29
	.4byte .L08057E1C @ case 30
	.4byte .L08057E1C @ case 31
	.4byte .L08057E1C @ case 32
	.4byte .L08057E1C @ case 33
	.4byte .L08057E1C @ case 34
	.4byte .L08057E1C @ case 35
	.4byte .L08057E1C @ case 36
	.4byte .L08057E1C @ case 37
	.4byte .L08057E1C @ case 38
	.4byte .L08057E1C @ case 39
	.4byte .L08057E1C @ case 40
	.4byte .L08057E0C @ case 41
.L08057DFC:
	ldr r6, .L08057E04 @ =gUnk_085E0748
	ldr r4, .L08057E08 @ =gUnk_085E08DC
	b .L08057E20
	.align 2, 0
.L08057E04: .4byte gUnk_085E0748
.L08057E08: .4byte gUnk_085E08DC
.L08057E0C:
	ldr r6, .L08057E14 @ =gUnk_085E0A88
	ldr r4, .L08057E18 @ =gUnk_085E0C34
	b .L08057E20
	.align 2, 0
.L08057E14: .4byte gUnk_085E0A88
.L08057E18: .4byte gUnk_085E0C34
.L08057E1C:
	ldr r6, .L08057E68 @ =gUnk_085E0DE0
	ldr r4, .L08057E6C @ =gUnk_085E0F88
.L08057E20:
	ldr r0, .L08057E70 @ =gUnk_085D38E4
	movs r1, #3
	bl SpawnProc
	adds r5, r0, #0
	str r7, [r5, #0x5c]
	movs r0, #0
	mov r8, r0
	movs r0, #0
	strh r0, [r5, #0x2c]
	str r6, [sp]
	adds r0, r7, #0
	adds r1, r4, #0
	adds r2, r6, #0
	adds r3, r4, #0
	bl EfxCreateFrontAnim
	adds r4, r0, #0
	str r4, [r5, #0x60]
	movs r0, #0xc0
	lsls r0, r0, #4
	ldrh r1, [r4, #8]
	ands r0, r1
	strh r0, [r4, #8]
	movs r0, #0x64
	strh r0, [r4, #0xa]
	bl BasSort
	adds r0, r7, #0
	bl GetAnimPosition
	cmp r0, #0
	bne .L08057E74
	movs r1, #0xe4
	lsls r1, r1, #7
	b .L08057E78
	.align 2, 0
.L08057E68: .4byte gUnk_085E0DE0
.L08057E6C: .4byte gUnk_085E0F88
.L08057E70: .4byte gUnk_085D38E4
.L08057E74:
	movs r1, #0x93
	lsls r1, r1, #8
.L08057E78:
	adds r0, r1, #0
	ldrh r1, [r4, #8]
	orrs r0, r1
	strh r0, [r4, #8]
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	bl SetAnimStateHidden
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_fe6_08057E98
func_fe6_08057E98: @ 0x08057E98
	push {lr}
	adds r2, r0, #0
	ldr r1, [r2, #0x60]
	ldr r0, [r2, #0x5c]
	ldrh r0, [r0, #2]
	strh r0, [r1, #2]
	ldr r0, [r2, #0x5c]
	ldrh r1, [r0, #0x10]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq .L08057EBE
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq .L08057EBE
	adds r0, r2, #0
	bl Proc_Break
.L08057EBE:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_fe6_08057EC4
func_fe6_08057EC4: @ 0x08057EC4
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x60]
	ldr r0, [r4, #0x5c]
	ldrh r0, [r0, #2]
	strh r0, [r1, #2]
	bl func_fe6_080449C4
	cmp r0, #1
	bne .L08057EEE
	ldr r0, [r4, #0x5c]
	bl GetAnimPosition
	bl SetAnimStateUnHidden
	ldr r0, [r4, #0x60]
	bl BasRemove
	adds r0, r4, #0
	bl Proc_Break
.L08057EEE:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start func_fe6_08057EF4
func_fe6_08057EF4: @ 0x08057EF4
	ldr r0, .L08057F00 @ =0x0203CDD8
	movs r1, #0
	str r1, [r0]
	ldr r0, .L08057F04 @ =0x0203CDDC
	str r1, [r0]
	bx lr
	.align 2, 0
.L08057F00: .4byte 0x0203CDD8
.L08057F04: .4byte 0x0203CDDC

	thumb_func_start func_fe6_08057F08
func_fe6_08057F08: @ 0x08057F08
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

	thumb_func_start func_fe6_08057F24
func_fe6_08057F24: @ 0x08057F24
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

	thumb_func_start func_fe6_08057F40
func_fe6_08057F40: @ 0x08057F40
	ldr r1, .L08057F48 @ =0x0203CDD8
	str r0, [r1]
	bx lr
	.align 2, 0
.L08057F48: .4byte 0x0203CDD8

	thumb_func_start func_fe6_08057F4C
func_fe6_08057F4C: @ 0x08057F4C
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
	bl func_fe6_08057F40
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
	ldr r1, .L08058218 @ =gUnk_0812E4A4
	adds r0, r5, #0
	bl func_fe6_080580D8
	ldr r0, [r4, #0x5c]
	ldr r1, .L0805821C @ =gUnk_0812D8AC
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
.L08058218: .4byte gUnk_0812E4A4
.L0805821C: .4byte gUnk_0812D8AC

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
	ldr r2, .L080582AC @ =gUnk_085E2CA8
	ldr r3, .L080582B0 @ =gUnk_085E2920
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
.L080582AC: .4byte gUnk_085E2CA8
.L080582B0: .4byte gUnk_085E2920
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
	ldr r1, .L080582E4 @ =gUnk_0812FFD8
	bl func_fe6_08058130
	ldr r0, [r6, #0x5c]
	ldr r1, .L080582E8 @ =gUnk_0812F9DC
	bl func_fe6_08058100
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L080582E4: .4byte gUnk_0812FFD8
.L080582E8: .4byte gUnk_0812F9DC

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
	bl func_fe6_08057F40
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
	ldr r1, .L080583AC @ =gUnk_0812CF48
	adds r0, r5, #0
	bl func_fe6_080580D8
	ldr r0, [r4, #0x5c]
	ldr r1, .L080583B0 @ =gUnk_0812C68C
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
.L080583AC: .4byte gUnk_0812CF48
.L080583B0: .4byte gUnk_0812C68C

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
	bl func_fe6_08057F4C
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	str r0, [r4, #0x44]
	ldr r0, .L08058464 @ =gUnk_0811AF5C
	str r0, [r4, #0x48]
	ldr r0, .L08058468 @ =gUnk_0812CF48
	str r0, [r4, #0x4c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08058460: .4byte gUnk_085D39F4
.L08058464: .4byte gUnk_0811AF5C
.L08058468: .4byte gUnk_0812CF48

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
	bl func_fe6_08057F24
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
	ldr r2, .L080584EC @ =gUnk_085E2508
	ldr r3, .L080584F0 @ =gUnk_085E19DC
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
.L080584EC: .4byte gUnk_085E2508
.L080584F0: .4byte gUnk_085E19DC
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
	ldr r1, .L08058520 @ =gUnk_0812D80C
	bl func_fe6_08058130
	ldr r0, [r6, #0x5c]
	ldr r1, .L08058524 @ =gUnk_0812D374
	bl func_fe6_08058100
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08058520: .4byte gUnk_0812D80C
.L08058524: .4byte gUnk_0812D374

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
	bl func_fe6_08057F40
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
	bl func_fe6_08057F4C
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
	bl func_fe6_08057F24
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
