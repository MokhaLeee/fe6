	.include "macro.inc"

	.syntax unified

	.section .data
	.global ProcScr_EfxHpBar
ProcScr_EfxHpBar: @ 085CB730
	.incbin "fe6-base.gba", 0x5CB730, (0x5CB758 - 0x5CB730) @ length: 0028

	.global ProcScr_EfxHpBarResire
ProcScr_EfxHpBarResire: @ 085CB758
	.incbin "fe6-base.gba", 0x5CB758, (0x5CB790 - 0x5CB758) @ length: 0038

	.global ProcScr_EfxAvoid
ProcScr_EfxAvoid: @ 085CB790
	.incbin "fe6-base.gba", 0x5CB790, (0x5CB7B8 - 0x5CB790) @ length: 0028

	.global gUnk_085CB7B8
gUnk_085CB7B8: @ 085CB7B8
	.incbin "fe6-base.gba", 0x5CB7B8, (0x5CB7E0 - 0x5CB7B8) @ length: 0028

	.global ProcScr_EfxNoDmage
ProcScr_EfxNoDmage: @ 085CB7E0
	.incbin "fe6-base.gba", 0x5CB7E0, (0x5CB808 - 0x5CB7E0) @ length: 0028

	.global gUnk_085CB808
gUnk_085CB808: @ 085CB808
	.incbin "fe6-base.gba", 0x5CB808, (0x5CB820 - 0x5CB808) @ length: 0018

	.global ProcScr_EfxStatusCHG
ProcScr_EfxStatusCHG: @ 085CB820
	.incbin "fe6-base.gba", 0x5CB820, (0x5CB850 - 0x5CB820) @ length: 0030

	.section .text
	thumb_func_start CheckEkrHitDone
CheckEkrHitDone: @ 0x080449C4
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

	thumb_func_start CheckEkrHitNow
CheckEkrHitNow: @ 0x080449E4
	ldr r1, .L080449F0 @ =gEkrHitNow
	lsls r0, r0, #1
	adds r0, r0, r1
	movs r1, #0
	ldrsh r0, [r0, r1]
	bx lr
	.align 2, 0
.L080449F0: .4byte gEkrHitNow

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
	ldr r0, .L08044A28 @ =ProcScr_EfxHpBar
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
.L08044A28: .4byte ProcScr_EfxHpBar
.L08044A2C: .4byte gAnims
.L08044A30:
	ldr r0, .L08044A8C @ =gAnims
	ldr r1, [r0]
	str r1, [r6, #0x5c]
	ldr r0, [r0, #8]
.L08044A38:
	str r0, [r6, #0x60]
	ldr r4, .L08044A90 @ =gEfxHpLutOff
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
.L08044A90: .4byte gEfxHpLutOff
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
	ldr r1, .L08044ABC @ =gEkrHitNow
	lsls r0, r0, #1
	adds r0, r0, r1
	movs r1, #1
	strh r1, [r0]
.L08044AB4:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08044ABC: .4byte gEkrHitNow

	thumb_func_start EfxHp_BarDeclineWithDeathJudge
EfxHp_BarDeclineWithDeathJudge: @ 0x08044AC0
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
	ldr r4, .L08044B94 @ =gEfxHpLutOff
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
	ldr r1, .L08044B98 @ =gEkrHitNow
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
.L08044B94: .4byte gEfxHpLutOff
.L08044B98: .4byte gEkrHitNow
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
	ldr r4, .L08044C00 @ =gEfxHpLutOff
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
	ldr r1, .L08044C04 @ =gEkrHitNow
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
.L08044C00: .4byte gEfxHpLutOff
.L08044C04: .4byte gEkrHitNow
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
	bl NewEfxDeadEvent
	b .L08044C44
.L08044C28:
	bl func_fe6_0804C554
	adds r0, r6, #0
	adds r1, r7, #0
	bl NewEfxDead
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

	thumb_func_start NewEfxHpBarResire
NewEfxHpBarResire: @ 0x08044D4C
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r1, .L08044D84 @ =gEkrHPBarCount
	ldr r0, [r1]
	cmp r0, #0
	bne .L08044E1E
	movs r0, #1
	str r0, [r1]
	ldr r0, .L08044D88 @ =ProcScr_EfxHpBarResire
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
.L08044D88: .4byte ProcScr_EfxHpBarResire
.L08044D8C: .4byte gAnims
.L08044D90:
	ldr r0, .L08044DEC @ =gAnims
	ldr r1, [r0]
	str r1, [r6, #0x5c]
	ldr r0, [r0, #8]
.L08044D98:
	str r0, [r6, #0x60]
	ldr r4, .L08044DF0 @ =gEfxHpLutOff
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
.L08044DF0: .4byte gEfxHpLutOff
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
	ldr r1, .L08044E28 @ =gEkrHitNow
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
.L08044E28: .4byte gEkrHitNow

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
	ldr r4, .L08044ECC @ =gEfxHpLutOff
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
	ldr r1, .L08044ED0 @ =gEkrHitNow
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
.L08044ECC: .4byte gEfxHpLutOff
.L08044ED0: .4byte gEkrHitNow
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
	ldr r4, .L08044F68 @ =gEfxHpLutOff
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
.L08044F68: .4byte gEfxHpLutOff
.L08044F6C:
	movs r0, #1
.L08044F6E:
	str r0, [r6, #0x48]
	adds r0, r6, #0
	bl Proc_Break
	ldr r0, [r6, #0x5c]
	bl GetAnimPosition
	ldr r1, .L08044F8C @ =gEkrHitNow
	lsls r0, r0, #1
	adds r0, r0, r1
	movs r1, #2
	strh r1, [r0]
.L08044F86:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08044F8C: .4byte gEkrHitNow

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
	ldr r4, .L0804506C @ =gEfxHpLutOff
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
	ldr r1, .L08045070 @ =gEkrHitNow
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
.L0804506C: .4byte gEfxHpLutOff
.L08045070: .4byte gEkrHitNow
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
	bl NewEfxDeadEvent
	b .L080450B8
	.align 2, 0
.L08045098: .4byte gEkrPids
.L0804509C:
	bl func_fe6_0804C554
	adds r0, r6, #0
	mov r1, r8
	bl NewEfxDead
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
	ldr r0, .L08045118 @ =ProcScr_EfxAvoid
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
.L08045118: .4byte ProcScr_EfxAvoid
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
	bl NewEfxDamageMojiEffect
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

	thumb_func_start EfxAvoid_Loop
EfxAvoid_Loop: @ 0x08045180
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
	ldr r4, .L08045280 @ =gEfxHpLutOff
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
.L08045280: .4byte gEfxHpLutOff
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
	ldr r1, .L080452B4 @ =gEkrHitNow
	lsls r0, r0, #1
	adds r0, r0, r1
	movs r1, #2
	strh r1, [r0]
.L080452AC:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L080452B4: .4byte gEkrHitNow

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
	ldr r4, .L08045350 @ =gEfxHpLutOff
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
	ldr r1, .L08045354 @ =gEkrHitNow
	lsls r0, r0, #1
	adds r0, r0, r1
	strh r4, [r0]
	adds r0, r5, #0
	bl Proc_Break
	b .L08045364
	.align 2, 0
.L0804534C: .4byte gEkrGaugeHp
.L08045350: .4byte gEfxHpLutOff
.L08045354: .4byte gEkrHitNow
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
	ldr r0, .L080453BC @ =ProcScr_EfxNoDmage
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
	bl NewEfxDamageMojiEffect
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
.L080453BC: .4byte ProcScr_EfxNoDmage

	thumb_func_start EfxNoDmage_Loop
EfxNoDmage_Loop: @ 0x080453C0
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
	ldr r5, .L0804542C @ =gEfxHpLutOff
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
.L0804542C: .4byte gEfxHpLutOff
.L08045430:
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	cmp r0, #8
	bne .L0804546C
	ldr r5, .L08045474 @ =gEfxHpLutOff
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
.L08045474: .4byte gEfxHpLutOff

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
	ldr r0, .L080455A0 @ =ProcScr_EfxStatusCHG
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
.L080455A0: .4byte ProcScr_EfxStatusCHG

	thumb_func_start EfxStatusCHG_Loop
EfxStatusCHG_Loop: @ 0x080455A4
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
