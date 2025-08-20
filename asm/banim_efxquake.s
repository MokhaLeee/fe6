	.include "macro.inc"

	.syntax unified

	.section .text

	thumb_func_start EfxHitQuake_Loop
EfxHitQuake_Loop: @ 0x0804646C
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
	bl BanimSetBg2Position
.L080464DE:
	ldr r0, [r6, #0x64]
	cmp r0, #0
	beq .L080464EE
	bl BasRemove
	ldr r0, .L08046584 @ =gEkrTerrainfxDesc
	bl EkrTerrainfx_PutTiles
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
	ldr r1, .L08046590 @ =gEfxHitQuakeExist
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
	bl EkrGauge_Setxy323A
	ldrh r3, [r4]
	rsbs r0, r3, #0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r4, [r4, #2]
	rsbs r1, r4, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl EkrDispUP_SetPositionSync
.L08046576:
	adds r0, r6, #0
	bl Proc_End
	b .L08046786
	.align 2, 0
.L08046580: .4byte gEkrBgPosition
.L08046584: .4byte gEkrTerrainfxDesc
.L08046588: .4byte gEkrXPosReal
.L0804658C: .4byte gEkrYPosReal
.L08046590: .4byte gEfxHitQuakeExist
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
	bl EkrGauge_Setxy323A
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
	bl EkrDispUP_SetPositionSync
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
