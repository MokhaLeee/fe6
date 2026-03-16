	.include "macro.inc"
	.syntax unified



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

	@ gpEkrTriangleUnits
	ldr r0, .L08049F5C @ =gpEkrTriangleUnits
	movs r3, #0
	str r3, [r0, #4]
	str r3, [r0]

	ldr r2, .L08049F60 @ =gEkrDistanceType
	movs r5, #0
	ldrsh r1, [r2, r5]
	cmp r1, #4
	bne .L08049F6C
	ldr r0, .L08049F64 @ =gAnimRoundData
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
	b .L_return_0804A46E
	.align 2, 0
.L08049F58: .4byte gBattleHits
.L08049F5C: .4byte gpEkrTriangleUnits
.L08049F60: .4byte gEkrDistanceType
.L08049F64: .4byte gAnimRoundData
.L08049F68: .4byte 0x0000FFFF
.L08049F6C:
	ldr r1, .L08049F94 @ =gBattleSt
	movs r0, #0x40
	ldrb r1, [r1, #1]
	ands r0, r1
	cmp r0, #0
	beq .L08049FA0
	ldr r2, .L08049F98 @ =gAnimRoundData
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
	b .L_return_0804A46E
	.align 2, 0
.L08049F94: .4byte gBattleSt
.L08049F98: .4byte gAnimRoundData
.L08049F9C: .4byte 0x0000FFFF
.L08049FA0:

	ldrh r2, [r2]
	str r2, [sp, #0x18]
	str r2, [sp, #0x1c]

	@ unk_sp_20 = 0
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
	ldr r4, .L0804A0AC @ =gEfxHpLut
	ldr r5, .L0804A0B0 @ =gEkrGaugeHp
	ldr r0, .L0804A0B4 @ =0x0000FFFF
	adds r3, r0, #0
	ldr r1, .L0804A0B8 @ =gAnimRoundData
.L0804A06A:
	ldrh r0, [r1]
	orrs r0, r3
	strh r0, [r1]
	adds r1, #2
	adds r2, #1
	cmp r2, #0x13
	bls .L0804A06A
	movs r2, #0
	ldr r0, .L0804A0AC @ =gEfxHpLut
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
.L0804A0AC: .4byte gEfxHpLut
.L0804A0B0: .4byte gEkrGaugeHp
.L0804A0B4: .4byte 0x0000FFFF
.L0804A0B8: .4byte gAnimRoundData
.L0804A0BC:
	movs r0, #8
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	rsbs r0, r0, #0
	lsrs r0, r0, #0x1f
	str r0, [sp, #0x14]
	ldr r0, .L0804A0F4 @ =gBanimPosIsTarget
	movs r1, #0
	ldrsh r0, [r0, r1]
	ldr r2, [sp, #0x14]
	cmp r0, r2
	bne .L0804A0FC

	# if (gBanimPosIsTarget == is_target) {
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
.L0804A0F4: .4byte gBanimPosIsTarget
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

	@ if (hit->attributes & BATTLE_HIT_ATTR_TRIANGLE_ATTACK)
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

	@ if (hit->attributes & BATTLE_HIT_ATTR_CRIT)
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
	ldr r0, .L0804A15C @ =RoundTypes_CriticalPhy
	b .L0804A1B6
	.align 2, 0
.L0804A150: .4byte gEkrInitialHitSide
.L0804A154: .4byte gpEkrTriangleUnits
.L0804A158: .4byte gBattleSt
.L0804A15C: .4byte RoundTypes_CriticalPhy
.L0804A160:
	ldr r0, .L0804A164 @ =RoundTypes_CriticalMag
	b .L0804A1B6
	.align 2, 0
.L0804A164: .4byte RoundTypes_CriticalMag
.L0804A168:
	cmp r3, #0
	bne .L0804A188
	adds r0, r6, #0
	bl UnitKnowsMagic
	lsls r0, r0, #0x18
	cmp r0, #0
	bne .L0804A180
	ldr r0, .L0804A17C @ =RoundTypes_NormalPhy
	b .L0804A1B6
	.align 2, 0
.L0804A17C: .4byte RoundTypes_NormalPhy
.L0804A180:
	ldr r0, .L0804A184 @ =RoundTypes_NormalMag
	b .L0804A1B6
	.align 2, 0
.L0804A184: .4byte RoundTypes_NormalMag
.L0804A188:
	movs r0, #2
	bl BanimSpawnRandB
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
	ldr r0, .L0804A1A8 @ =RoundTypes_Dragon1
	b .L0804A1B6
	.align 2, 0
.L0804A1A8: .4byte RoundTypes_Dragon1
.L0804A1AC:
	ldr r0, .L0804A1B0 @ =RoundTypes_Dragon2
	b .L0804A1B6
	.align 2, 0
.L0804A1B0: .4byte RoundTypes_Dragon2
.L0804A1B4:
	ldr r0, .L0804A1DC @ =RoundTypes_Dragon3
.L0804A1B6:
	lsls r1, r4, #0x10
	asrs r1, r1, #0xf
	adds r1, r1, r0
	ldrh r0, [r1]
	strh r0, [r5]
.L0804A1C0:

	@ check for target
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
	ldr r0, .L0804A1E0 @ =RoundTypes_MissedPhy
	b .L0804A1E6
	.align 2, 0
.L0804A1DC: .4byte RoundTypes_Dragon3
.L0804A1E0: .4byte RoundTypes_MissedPhy
.L0804A1E4:
	ldr r0, .L0804A1F4 @ =RoundTypes_NormalMag
.L0804A1E6:
	lsls r1, r4, #0x10
	asrs r1, r1, #0xf
	adds r1, r1, r0
	ldrh r0, [r1]
	strh r0, [r5]
	ldr r0, .L0804A1F8 @ =RoundTypes_TargetMiss
	b .L0804A1FE
	.align 2, 0
.L0804A1F4: .4byte RoundTypes_NormalMag
.L0804A1F8: .4byte RoundTypes_TargetMiss
.L0804A1FC:
	ldr r0, .L0804A27C @ =RoundTypes_TargetHitted
.L0804A1FE:
	mov r2, sl
	lsls r1, r2, #0x10
	asrs r1, r1, #0xf
	adds r1, r1, r0
	ldrh r0, [r1]
	mov r5, sb
	strh r0, [r5]

	ldr r1, .L0804A280 @ =gAnimRoundData
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
	ldr r0, .L0804A284 @ =gBanimPosIsTarget
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
	ldr r1, .L0804A288 @ =gEfxHpLut
	adds r0, r0, r1
	strh r2, [r0]
	ldr r2, .L0804A28C @ =0xFFFF8000
	adds r0, r2, #0
	ldrh r1, [r5]
	orrs r0, r1
	b .L0804A454
	.align 2, 0
.L0804A27C: .4byte RoundTypes_TargetHitted
.L0804A280: .4byte gAnimRoundData
.L0804A284: .4byte gBanimPosIsTarget
.L0804A288: .4byte gEfxHpLut
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
	ldr r1, .L0804A2C8 @ =gEfxHpLut
	adds r0, r0, r1
	strh r2, [r0]
	ldr r2, .L0804A2CC @ =0xFFFF8000
	b .L0804A406
	.align 2, 0
.L0804A2C8: .4byte gEfxHpLut
.L0804A2CC: .4byte 0xFFFF8000
.L0804A2D0:
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	beq .L0804A3B8
	ldr r0, .L0804A344 @ =gBanimPosIsTarget
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
	ldr r4, .L0804A348 @ =gEfxHpLut
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
	ldr r3, .L0804A34C @ =gBanimMaxHP
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
.L0804A344: .4byte gBanimPosIsTarget
.L0804A348: .4byte gEfxHpLut
.L0804A34C: .4byte gBanimMaxHP
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
	ldr r4, .L0804A3B0 @ =gEfxHpLut
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
	ldr r3, .L0804A3B4 @ =gBanimMaxHP
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
.L0804A3B0: .4byte gEfxHpLut
.L0804A3B4: .4byte gBanimMaxHP
.L0804A3B8:
	ldr r0, .L0804A410 @ =gBanimPosIsTarget
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
	ldr r5, .L0804A414 @ =gEfxHpLut
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
.L0804A410: .4byte gBanimPosIsTarget
.L0804A414: .4byte gEfxHpLut
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
	ldr r1, .L0804A480 @ =gEfxHpLut
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
	bne .L_return_0804A46E
	b .L0804A0BC
.L_return_0804A46E:
	add sp, #0x24
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0804A480: .4byte gEfxHpLut
