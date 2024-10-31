	.include "macro.inc"

	.syntax unified


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
