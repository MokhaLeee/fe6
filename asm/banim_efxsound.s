	.include "macro.inc"

	.syntax unified
	.section .text

	thumb_func_start EfxPlaySEwithCmdCtrl
EfxPlaySEwithCmdCtrl: @ 0x0805BE7C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	mov r8, r0
	mov sb, r1
	bl GetAnimAnotherSide
	adds r6, r0, #0
	mov r0, r8
	bl GetAnimLayer
	cmp r0, #1
	bne .L0805BE9C
	b .L0805C190
.L0805BE9C:
	mov r0, r8
	bl GetAnimPosition
	adds r5, r0, #0
	cmp r5, #0
	bne .L0805BEB4
	ldr r0, .L0805BEB0 @ =gBanimTerrain
	movs r1, #0
	ldrsh r4, [r0, r1]
	b .L0805BEBA
	.align 2, 0
.L0805BEB0: .4byte gBanimTerrain
.L0805BEB4:
	ldr r0, .L0805BEE4 @ =gBanimTerrain
	movs r3, #2
	ldrsh r4, [r0, r3]
.L0805BEBA:
	lsls r0, r4, #0x10
	lsrs r0, r0, #0x10
	bl GetEfxSoundType1FromTerrain
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	cmp r4, #0x14
	bne .L0805BED6
	mov r0, r8
	bl IsAnimSoundInPosition
	cmp r0, #0
	bne .L0805BED6
	movs r7, #2
.L0805BED6:
	cmp r5, #0
	bne .L0805BEEC
	ldr r0, .L0805BEE8 @ =gBanimCon
	movs r1, #0
	ldrsh r0, [r0, r1]
	b .L0805BEF2
	.align 2, 0
.L0805BEE4: .4byte gBanimTerrain
.L0805BEE8: .4byte gBanimCon
.L0805BEEC:
	ldr r0, .L0805BF30 @ =gBanimCon
	movs r3, #2
	ldrsh r0, [r0, r3]
.L0805BEF2:
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetEfxSoundType2FromBaseCon
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	ldr r4, .L0805BF34 @ =0x0000FFFF
	mov r0, r8
	str r2, [sp]
	bl GetProperAnimSoundLocation
	mov r1, r8
	ldrh r1, [r1, #2]
	adds r0, r1, r0
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	movs r0, #0x80
	lsls r0, r0, #1
	mov r8, r0
	mov r0, sb
	subs r0, #0x19
	ldr r2, [sp]
	cmp r0, #0x31
	bls .L0805BF24
	b .direct_break
.L0805BF24:
	lsls r0, r0, #2
	ldr r1, .L0805BF38 @ =.L0805BF3C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
.L0805BF30: .4byte gBanimCon
.L0805BF34: .4byte 0x0000FFFF
.L0805BF38: .4byte .L0805BF3C
.L0805BF3C: @ jump table
	.4byte .L0805C004 @ case 25
	.4byte .direct_break @ case 26
	.4byte .boss_bgm @ case 27
	.4byte .L0805C008 @ case 28
	.4byte .L0805C010 @ case 29
	.4byte .L0805C018 @ case 30
	.4byte .case_31 @ case 31
	.4byte .case_32 @ case 7
	.4byte .case_33 @ case 8
	.4byte .case_34 @ case 9
	.4byte .case_35 @ case 10
	.4byte .case_36 @ case 11
	.4byte .case_37 @ case 12
	.4byte .direct_break @ case 13
	.4byte .direct_break @ case 14
	.4byte .case_40 @ case 15
	.4byte .case_41 @ case 16
	.4byte .case_42 @ case 17
	.4byte .case_43 @ case 18
	.4byte .direct_break @ case 19
	.4byte .direct_break @ case 20
	.4byte .direct_break @ case 21
	.4byte .direct_break @ case 22
	.4byte .direct_break @ case 23
	.4byte .direct_break @ case 24
	.4byte .direct_break @ case 25
	.4byte .case_51 @ case 26
	.4byte .boss_bgm @ case 27
	.4byte .case_53 @ case 28
	.4byte .case_54 @ case 29
	.4byte .case_55 @ case 30
	.4byte .case_56 @ case 31
	.4byte .direct_break @ case 32
	.4byte .direct_break @ case 33
	.4byte .direct_break @ case 34
	.4byte .case_60 @ case 35
	.4byte .case_61 @ case 36
	.4byte .case_62 @ case 37
	.4byte .case_63 @ case 38
	.4byte .case_64 @ case 39
	.4byte .case_65 @ case 40
	.4byte .case_66 @ case 41
	.4byte .case_67 @ case 42
	.4byte .direct_break @ case 43
	.4byte .direct_break @ case 44
	.4byte .case_70 @ case 45
	.4byte .direct_break @ case 46
	.4byte .case_72 @ case 47
	.4byte .case_73 @ case 48
	.4byte .case_74 @ case 49
.L0805C004:
	movs r4, #0xd1
	b .L0805C16C
.L0805C008:
	ldr r1, .L0805C00C @ =gBanimSongTable1
	b .L0805C0D6
	.align 2, 0
.L0805C00C: .4byte gBanimSongTable1
.L0805C010:
	ldr r1, .L0805C014 @ =gBanimSongTable2
	b .L0805C0D6
	.align 2, 0
.L0805C014: .4byte gBanimSongTable2
.L0805C018:
	ldr r1, .L0805C01C @ =gBanimSongTable3
	b .L0805C0D6
	.align 2, 0
.L0805C01C: .4byte gBanimSongTable3
.case_31:
	adds r0, r6, #0
	bl EfxPlayCriticalHittedSFX
	adds r0, r6, #0
	bl GetEfxHpChangeType
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	beq .L0805C088
	cmp r0, #1
	bgt .L0805C07E
	cmp r0, #0
	bne .L0805C08E
	movs r4, #0xd2
	b .L0805C08E
.case_32:
	adds r0, r6, #0
	bl EfxPlayCriticalHittedSFX
	adds r0, r6, #0
	bl GetEfxHpChangeType
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	beq .L0805C088
	cmp r0, #1
	bgt .L0805C07E
	cmp r0, #0
	bne .L0805C08E
	movs r4, #0xd3
	b .L0805C08E
.case_33:
	adds r0, r6, #0
	bl EfxPlayCriticalHittedSFX
	adds r0, r6, #0
	bl GetEfxHpChangeType
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	beq .L0805C088
	cmp r0, #1
	bgt .L0805C07E
	cmp r0, #0
	beq .L0805C084
	b .L0805C08E
.L0805C07E:
	cmp r0, #2
	beq .L0805C08C
	b .L0805C08E
.L0805C084:
	movs r4, #0xd4
	b .L0805C08E
.L0805C088:
	movs r4, #0xd5
	b .L0805C08E
.L0805C08C:
	movs r4, #0xec
.L0805C08E:
	adds r0, r6, #0
	bl GetProperAnimSoundLocation
	ldrh r6, [r6, #2]
	adds r0, r6, r0
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	b .L0805C16C
.case_34:
	movs r4, #0xc9
	b .L0805C16C
.case_35:
	movs r4, #0xc8
	b .L0805C16C
.case_36:
	movs r4, #0xca
	b .L0805C16C
.case_37:
	ldr r4, .L0805C0B0 @ =0x00000263
	b .L0805C0EE
	.align 2, 0
.L0805C0B0: .4byte 0x00000263
.case_40:
	movs r4, #0xf6
	b .L0805C16C
.case_41:
	ldr r4, .L0805C0BC @ =0x00000141
	b .L0805C16C
	.align 2, 0
.L0805C0BC: .4byte 0x00000141
.case_42:
	movs r4, #0xa1
	lsls r4, r4, #1
	b .L0805C16C
.case_43:
	ldr r4, .L0805C0CC @ =0x00000267
	b .L0805C0EE
	.align 2, 0
.L0805C0CC: .4byte 0x00000267
.case_51:
	movs r4, #0xe7
	b .L0805C16C
.boss_bgm:
	ldr r1, .L0805C0E8 @ =gBanimBossBGMs
.L0805C0D6:
	lsls r0, r7, #2
	adds r0, r0, r1
	ldr r1, [r0]
	lsls r0, r2, #1
	adds r0, r0, r5
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r4, [r0]
	b .L0805C16C
	.align 2, 0
.L0805C0E8: .4byte gBanimBossBGMs
.case_53:
	ldr r4, .L0805C0F8 @ =0x00000265
.L0805C0EE:
	cmp r5, #0
	bne .L0805C16C
	subs r4, #1
	b .L0805C16C
	.align 2, 0
.L0805C0F8: .4byte 0x00000265
.case_54:
	movs r4, #0xce
	b .L0805C16C
.case_55:
	movs r4, #0xcf
	b .L0805C16C
.case_56:
	movs r4, #0xcb
	b .L0805C16C
.case_60:
	ldr r4, .L0805C118 @ =0x00000263
	cmp r5, #0
	bne .L0805C110
	subs r4, #1
.L0805C110:
	movs r1, #0x80
	mov r8, r1
	b .L0805C16C
	.align 2, 0
.L0805C118: .4byte 0x00000263
.case_61:
	ldr r4, .L0805C12C @ =0x00000267
	cmp r5, #0
	bne .L0805C124
	subs r4, #1
.L0805C124:
	movs r0, #0x80
	mov r8, r0
	b .L0805C16C
	.align 2, 0
.L0805C12C: .4byte 0x00000267
.case_62:
	movs r4, #0xf1
	b .L0805C16C
.case_63:
	movs r4, #0x9b
	lsls r4, r4, #1
	b .L0805C16C
.case_64:
	ldr r4, .L0805C140 @ =0x00000117
	b .L0805C16C
	.align 2, 0
.L0805C140: .4byte 0x00000117
.case_65:
	movs r4, #0xeb
	b .L0805C16C
.case_66:
	movs r4, #0xea
	b .L0805C16C
.case_67:
	movs r4, #0x8c
	lsls r4, r4, #1
	b .L0805C16C
.case_70:
	movs r4, #0xe0
	b .L0805C16C
.case_72:
	movs r4, #0xed
	b .L0805C16C
.case_73:
	ldr r4, .L0805C160 @ =0x00000135
	b .L0805C16C
	.align 2, 0
.L0805C160: .4byte 0x00000135
.case_74:
	movs r4, #0x9a
	lsls r4, r4, #1
	b .L0805C16C
.direct_break:
	movs r4, #0
.L0805C16C:
	lsls r0, r4, #0x10
	asrs r4, r0, #0x10
	movs r0, #1
	rsbs r0, r0, #0
	cmp r4, r0
	beq .L0805C190
	mov r1, r8
	adds r0, r4, #0
	str r3, [sp, #4]
	bl EfxPlaySE
	ldr r3, [sp, #4]
	lsls r1, r3, #0x10
	asrs r1, r1, #0x10
	movs r2, #1
	adds r0, r4, #0
	bl M4aPlayWithPostionCtrl
.L0805C190:
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
