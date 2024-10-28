	.include "macro.inc"

	.syntax unified

	thumb_func_start NewEkrPopup
NewEkrPopup: @ 0x0805F498
	push {r4, r5, lr}
	ldr r4, .L0805F554 @ =gpProcEkrPopup
	ldr r0, .L0805F558 @ =ProcScr_EkrPopup
	movs r1, #3
	bl SpawnProc
	adds r5, r0, #0
	str r5, [r4]
	ldr r1, .L0805F55C @ =gEkrPopupDone
	movs r0, #0
	str r0, [r1]
	strh r0, [r5, #0x2c]
	str r0, [r5, #0x48]
	str r0, [r5, #0x44]
	str r0, [r5, #0x50]
	str r0, [r5, #0x4c]
	bl func_fe6_08058F38
	cmp r0, #0
	bne .L0805F576
	ldr r0, .L0805F560 @ =gEkrDistanceType
	ldrh r0, [r0]
	cmp r0, #4
	beq .L0805F576
	ldr r0, .L0805F564 @ =gBanimFactionPal
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne .L0805F500
	ldr r4, .L0805F568 @ =gpEkrBattleUnitLeft
	ldr r0, [r4]
	bl HasBattleUnitGainedWeaponLevel
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne .L0805F4EA
	ldr r0, [r4]
	adds r0, #0x4a
	ldrh r0, [r0]
	str r0, [r5, #0x44]
.L0805F4EA:
	ldr r0, [r4]
	bl DidBattleUnitBreakWeapon
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne .L0805F500
	ldr r0, [r4]
	adds r0, #0x4a
	ldrh r0, [r0]
	str r0, [r5, #0x48]
.L0805F500:
	ldr r0, .L0805F564 @ =gBanimFactionPal
	movs r1, #2
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne .L0805F538
	ldr r4, .L0805F56C @ =gpEkrBattleUnitRight
	ldr r0, [r4]
	bl HasBattleUnitGainedWeaponLevel
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne .L0805F522
	ldr r0, [r4]
	adds r0, #0x4a
	ldrh r0, [r0]
	str r0, [r5, #0x4c]
.L0805F522:
	ldr r0, [r4]
	bl DidBattleUnitBreakWeapon
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne .L0805F538
	ldr r0, [r4]
	adds r0, #0x4a
	ldrh r0, [r0]
	str r0, [r5, #0x50]
.L0805F538:
	ldr r0, [r5, #0x44]
	ldr r1, [r5, #0x48]
	adds r0, r0, r1
	ldr r1, [r5, #0x4c]
	adds r0, r0, r1
	ldr r1, [r5, #0x50]
	cmn r0, r1
	bne .L0805F570
	ldr r1, .L0805F55C @ =gEkrPopupDone
	movs r0, #1
	str r0, [r1]
	bl EndEkrPopup
	b .L0805F576
	.align 2, 0
.L0805F554: .4byte gpProcEkrPopup
.L0805F558: .4byte ProcScr_EkrPopup
.L0805F55C: .4byte gEkrPopupDone
.L0805F560: .4byte gEkrDistanceType
.L0805F564: .4byte gBanimFactionPal
.L0805F568: .4byte gpEkrBattleUnitLeft
.L0805F56C: .4byte gpEkrBattleUnitRight
.L0805F570:
	movs r0, #0x80
	bl SetBgmVolume
.L0805F576:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start func_fe6_0805F57C
func_fe6_0805F57C: @ 0x0805F57C
	push {lr}
	adds r1, r0, #0
	ldrh r0, [r1, #0x2c]
	adds r0, #1
	strh r0, [r1, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x10
	ble .L0805F594
	adds r0, r1, #0
	bl Proc_Break
.L0805F594:
	pop {r0}
	bx r0

	thumb_func_start func_fe6_0805F598
func_fe6_0805F598: @ 0x0805F598
	push {r4, lr}
	adds r4, r0, #0
	ldr r2, [r4, #0x44]
	cmp r2, #0
	beq .L0805F5B4
	movs r1, #0
	bl DrawBattlePopup
	bl EfxPlaySound5AVol100
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #0x60
	strh r0, [r4, #0x2e]
.L0805F5B4:
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start func_fe6_0805F5C0
func_fe6_0805F5C0: @ 0x0805F5C0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x44]
	cmp r0, #0
	bne .L0805F5D2
	adds r0, r4, #0
	bl Proc_Break
	b .L0805F5F2
.L0805F5D2:
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r4, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	ble .L0805F5F2
	ldr r0, [r4, #0x60]
	bl BasRemove
	bl SpellFx_ClearBG1
	adds r0, r4, #0
	bl Proc_Break
.L0805F5F2:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start func_fe6_0805F5F8
func_fe6_0805F5F8: @ 0x0805F5F8
	push {r4, lr}
	adds r4, r0, #0
	ldr r2, [r4, #0x4c]
	cmp r2, #0
	beq .L0805F614
	movs r1, #0
	bl DrawBattlePopup
	bl EfxPlaySound5AVol100
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #0x60
	strh r0, [r4, #0x2e]
.L0805F614:
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start func_fe6_0805F620
func_fe6_0805F620: @ 0x0805F620
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x4c]
	cmp r0, #0
	bne .L0805F632
	adds r0, r4, #0
	bl Proc_Break
	b .L0805F652
.L0805F632:
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r4, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	ble .L0805F652
	ldr r0, [r4, #0x60]
	bl BasRemove
	bl SpellFx_ClearBG1
	adds r0, r4, #0
	bl Proc_Break
.L0805F652:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start func_fe6_0805F658
func_fe6_0805F658: @ 0x0805F658
	push {r4, lr}
	adds r4, r0, #0
	ldr r2, [r4, #0x48]
	cmp r2, #0
	beq .L0805F674
	movs r1, #1
	bl DrawBattlePopup
	bl EfxPlaySound5CVol100
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #0x6c
	strh r0, [r4, #0x2e]
.L0805F674:
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start func_fe6_0805F680
func_fe6_0805F680: @ 0x0805F680
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x48]
	cmp r0, #0
	bne .L0805F692
	adds r0, r4, #0
	bl Proc_Break
	b .L0805F6B2
.L0805F692:
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r4, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	ble .L0805F6B2
	ldr r0, [r4, #0x60]
	bl BasRemove
	bl SpellFx_ClearBG1
	adds r0, r4, #0
	bl Proc_Break
.L0805F6B2:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start func_fe6_0805F6B8
func_fe6_0805F6B8: @ 0x0805F6B8
	push {r4, lr}
	adds r4, r0, #0
	ldr r2, [r4, #0x50]
	cmp r2, #0
	beq .L0805F6D4
	movs r1, #1
	bl DrawBattlePopup
	bl EfxPlaySound5CVol100
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #0x6c
	strh r0, [r4, #0x2e]
.L0805F6D4:
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start func_fe6_0805F6E0
func_fe6_0805F6E0: @ 0x0805F6E0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x50]
	cmp r0, #0
	bne .L0805F6F2
	adds r0, r4, #0
	bl Proc_Break
	b .L0805F716
.L0805F6F2:
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r4, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	ble .L0805F716
	movs r0, #0
	strh r0, [r4, #0x2c]
	ldr r0, [r4, #0x60]
	bl BasRemove
	bl SpellFx_ClearBG1
	adds r0, r4, #0
	bl Proc_Break
.L0805F716:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start func_fe6_0805F71C
func_fe6_0805F71C: @ 0x0805F71C
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x10
	ble .L0805F742
	ldr r0, .L0805F748 @ =gEkrPopupDone
	movs r1, #1
	str r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #1
	bl SetBgmVolume
	adds r0, r4, #0
	bl Proc_Break
.L0805F742:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0805F748: .4byte gEkrPopupDone

	thumb_func_start func_fe6_0805F74C
func_fe6_0805F74C: @ 0x0805F74C
	bx lr
	.align 2, 0

	thumb_func_start func_fe6_0805F750
func_fe6_0805F750: @ 0x0805F750
	push {r4, lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r4, .L0805F77C @ =gUnk_08662E4C
	bl GetItemIid
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r1, [r4]
	ldr r2, .L0805F780 @ =0x0000FFFF
	cmp r1, r2
	beq .L0805F774
.L0805F768:
	cmp r1, r0
	beq .L0805F774
	adds r4, #0x10
	ldrh r1, [r4]
	cmp r1, r2
	bne .L0805F768
.L0805F774:
	adds r0, r4, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
.L0805F77C: .4byte gUnk_08662E4C
.L0805F780: .4byte 0x0000FFFF

	thumb_func_start GetWeaponAnimActorCount
GetWeaponAnimActorCount: @ 0x0805F784
	push {lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl func_fe6_0805F750
	ldrb r0, [r0, #2]
	pop {r1}
	bx r1

	thumb_func_start func_fe6_0805F794
func_fe6_0805F794: @ 0x0805F794
	push {lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl func_fe6_0805F750
	ldrh r0, [r0, #4]
	pop {r1}
	bx r1

	thumb_func_start GetWeaponAnimManimSpecialScr
GetWeaponAnimManimSpecialScr: @ 0x0805F7A4
	push {lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl func_fe6_0805F750
	ldr r0, [r0, #8]
	pop {r1}
	bx r1

	thumb_func_start func_fe6_0805F7B4
func_fe6_0805F7B4: @ 0x0805F7B4
	push {lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl func_fe6_0805F750
	ldrb r0, [r0, #0xc]
	pop {r1}
	bx r1

	thumb_func_start GetItemMaFacing
GetItemMaFacing: @ 0x0805F7C4
	push {lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl func_fe6_0805F750
	ldrb r0, [r0, #0xd]
	pop {r1}
	bx r1

	thumb_func_start func_fe6_0805F7D4
func_fe6_0805F7D4: @ 0x0805F7D4
	push {lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl func_fe6_0805F750
	ldrb r0, [r0, #0xe]
	pop {r1}
	bx r1
