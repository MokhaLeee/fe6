	.include "macro.inc"
	.include "asm_proc.inc"

	.syntax unified

	.data
	.global gSecretScreenPlayRankGlyphTable
gSecretScreenPlayRankGlyphTable: @ 0867978C
	.incbin "fe6-base.gba", 0x67978C, (0x6797D0 - 0x67978C) @ length: 0044

	.global ProcScr_Prep_Password
ProcScr_Prep_Password: @ 086797D0
	.incbin "fe6-base.gba", 0x6797D0, (0x679820 - 0x6797D0) @ length: 0050

	.global gSecretScreenUnitGlyphTable
gSecretScreenUnitGlyphTable: @ 08679820
	.incbin "fe6-base.gba", 0x679820, (0x679924 - 0x679820) @ length: 0104

	.global ProcScr_SecretScreen
ProcScr_SecretScreen: @ 08679924
	PROC_SLEEP 0
	PROC_CALL SecretScreen_Init
	PROC_CALL StartMidFadeFromBlack
	PROC_REPEAT WhileFadeExists
	PROC_REPEAT SecretScreen_Loop_Dummy
	PROC_CALL StartMidFadeToBlack
	PROC_REPEAT WhileFadeExists
PROC_LABEL 0
	PROC_CALL SecretScreen_End
	PROC_END

	.text


	thumb_func_start SecretScreen_EmbedPasswordMeta
SecretScreen_EmbedPasswordMeta: @ 0x080830AC
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	movs r6, #0
	ldr r0, .L080830E4 @ =gSecretScreenSymbolCount
	ldr r0, [r0]
	ldr r5, .L080830E8 @ =gSecretScreenPasswordBuf
	adds r0, r0, r5
	ldr r4, .L080830EC @ =gSecretScreenPasswordMeta
	ldrh r1, [r4, #6]
	bl SecretScreen_ChecksumPasswordBuf
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sb, r0
	adds r7, r5, #0
	mov r8, r4
.L080830D0:
	adds r0, r6, #0
	movs r1, #3
	bl __modsi3
	adds r5, r0, #0
	cmp r5, #0
	bne .L080830F0
	mov r0, r8
	ldrh r4, [r0]
	b .L08083108
	.align 2, 0
.L080830E4: .4byte gSecretScreenSymbolCount
.L080830E8: .4byte gSecretScreenPasswordBuf
.L080830EC: .4byte gSecretScreenPasswordMeta
.L080830F0:
	cmp r5, #1
	bne .L08083104
	mov r0, r8
	ldrh r4, [r0, #2]
	adds r0, r6, #0
	movs r1, #3
	bl __divsi3
	adds r1, r5, #0
	b .L08083112
.L08083104:
	mov r0, r8
	ldrh r4, [r0, #4]
.L08083108:
	adds r0, r6, #0
	movs r1, #3
	bl __divsi3
	movs r1, #1
.L08083112:
	lsls r1, r0
	ands r4, r1
	asrs r4, r0
	ldr r5, .L08083170 @ =0x020168E8
	ldr r1, [r5]
	adds r0, r6, #0
	bl __modsi3
	lsls r4, r0
	ldrb r0, [r7]
	orrs r4, r0
	strb r4, [r7]
	adds r6, #1
	ldr r1, [r5]
	adds r0, r6, #0
	bl __modsi3
	cmp r0, #0
	bne .L0808313A
	adds r7, #1
.L0808313A:
	cmp r6, #0x1c
	bne .L080830D0
	movs r2, #0
	ldr r3, .L08083174 @ =gSecretScreenSymbolCount
	ldr r0, [r3]
	cmp r2, r0
	bge .L08083160
	ldr r5, .L08083178 @ =gSecretScreenPasswordBuf
	ldr r4, .L0808317C @ =0x020168EC
.L0808314C:
	adds r0, r2, r5
	ldrb r1, [r0]
	add r1, sb
	ldrb r6, [r4]
	ands r1, r6
	strb r1, [r0]
	adds r2, #1
	ldr r0, [r3]
	cmp r2, r0
	blt .L0808314C
.L08083160:
	bl SecretScreen_ShufflePasswordBuf
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08083170: .4byte 0x020168E8
.L08083174: .4byte gSecretScreenSymbolCount
.L08083178: .4byte gSecretScreenPasswordBuf
.L0808317C: .4byte 0x020168EC

	thumb_func_start SecretScreen_ExtractPasswordMeta
SecretScreen_ExtractPasswordMeta: @ 0x08083180
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	movs r0, #0
	mov sl, r0
	movs r7, #0
	bl SecretScreen_ShufflePasswordBuf
	ldr r4, .L08083218 @ =gSecretScreenSymbolCount
	ldr r0, [r4]
	ldr r5, .L0808321C @ =gSecretScreenPasswordBuf
	adds r0, r0, r5
	ldr r1, .L08083220 @ =gSecretScreenPasswordMeta
	ldrh r1, [r1, #6]
	bl SecretScreen_ChecksumPasswordBuf
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	movs r2, #0
	ldr r0, [r4]
	cmp sl, r0
	bge .L080831CA
	mov r8, r5
	ldr r5, .L08083224 @ =0x020168EC
.L080831B4:
	mov r1, r8
	adds r0, r2, r1
	ldrb r6, [r0]
	subs r1, r6, r3
	ldrb r6, [r5]
	ands r1, r6
	strb r1, [r0]
	adds r2, #1
	ldr r0, [r4]
	cmp r2, r0
	blt .L080831B4
.L080831CA:
	ldr r0, .L08083220 @ =gSecretScreenPasswordMeta
	movs r1, #0
	strh r1, [r0]
	strh r1, [r0, #2]
	strh r1, [r0, #4]
	ldr r1, .L0808321C @ =gSecretScreenPasswordBuf
	ldr r2, .L08083228 @ =0x020168E8
	mov sb, r2
	mov r8, r0
	mov r0, sl
	adds r6, r0, r1
.L080831E0:
	adds r0, r7, #0
	movs r1, #3
	bl __modsi3
	adds r5, r0, #0
	cmp r5, #0
	bne .L0808322C
	ldrb r4, [r6]
	mov r2, sb
	ldr r1, [r2]
	adds r0, r7, #0
	bl __modsi3
	asrs r4, r0
	movs r0, #1
	ands r4, r0
	adds r0, r7, #0
	movs r1, #3
	bl __divsi3
	lsls r4, r0
	mov r0, r8
	ldrh r0, [r0]
	orrs r4, r0
	mov r1, r8
	strh r4, [r1]
	b .L0808327C
	.align 2, 0
.L08083218: .4byte gSecretScreenSymbolCount
.L0808321C: .4byte gSecretScreenPasswordBuf
.L08083220: .4byte gSecretScreenPasswordMeta
.L08083224: .4byte 0x020168EC
.L08083228: .4byte 0x020168E8
.L0808322C:
	cmp r5, #1
	bne .L08083256
	ldrb r4, [r6]
	mov r2, sb
	ldr r1, [r2]
	adds r0, r7, #0
	bl __modsi3
	asrs r4, r0
	ands r4, r5
	adds r0, r7, #0
	movs r1, #3
	bl __divsi3
	lsls r4, r0
	mov r0, r8
	ldrh r0, [r0, #2]
	orrs r4, r0
	mov r1, r8
	strh r4, [r1, #2]
	b .L0808327C
.L08083256:
	ldrb r4, [r6]
	mov r2, sb
	ldr r1, [r2]
	adds r0, r7, #0
	bl __modsi3
	asrs r4, r0
	movs r0, #1
	ands r4, r0
	adds r0, r7, #0
	movs r1, #3
	bl __divsi3
	lsls r4, r0
	mov r0, r8
	ldrh r0, [r0, #4]
	orrs r4, r0
	mov r1, r8
	strh r4, [r1, #4]
.L0808327C:
	adds r7, #1
	mov r2, sb
	ldr r1, [r2]
	adds r0, r7, #0
	bl __modsi3
	cmp r0, #0
	bne .L0808328E
	adds r6, #1
.L0808328E:
	cmp r7, #0x1c
	bne .L080831E0
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start SecretScreen_ModifyPassword
SecretScreen_ModifyPassword: @ 0x080832A0
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r3, r0, #0
	movs r0, #0
	str r0, [sp]
	ldr r6, .L0808335C @ =gSecretScreenPasswordBuf
	ldr r5, .L08083360 @ =gSecretScreenSymbolCount
	adds r2, r6, #0
	movs r1, #0
	adds r0, r6, #0
	adds r0, #0x9f
.L080832B6:
	strb r1, [r0]
	subs r0, #1
	cmp r0, r2
	bge .L080832B6
	ldr r1, [r5]
	adds r1, r1, r6
	mov r0, sp
	bl _call_via_r3
	ldr r0, [sp]
	bl SecretScreen_CeilDivBitCount
	ldr r4, .L08083364 @ =gSecretScreenPasswordMeta
	strh r0, [r4, #6]
	ldr r0, [r5]
	adds r0, r0, r6
	ldrh r1, [r4, #6]
	bl SecretScreen_ChecksumPasswordBuf
	strh r0, [r4, #2]
	bl GetGameTime
	lsrs r0, r0, #3
	ldrh r1, [r4, #2]
	adds r0, r1, r0
	ldr r1, .L08083368 @ =0x000003FF
	ands r0, r1
	strh r0, [r4]
	ldr r1, .L0808336C @ =gSecretScreenRN
	ldrh r0, [r4]
	str r0, [r1]
	bl GetSecretScreenRN
	ldrh r2, [r4, #2]
	adds r0, r0, r2
	ldr r2, .L08083370 @ =0x000001FF
	adds r1, r2, #0
	ands r0, r1
	strh r0, [r4, #2]
	movs r5, #0
	ldrh r4, [r4, #6]
	cmp r5, r4
	bge .L08083330
	adds r4, r6, #0
.L0808330E:
	bl GetSecretScreenRN
	ldr r1, .L08083360 @ =gSecretScreenSymbolCount
	ldr r2, [r1]
	adds r2, r5, r2
	adds r2, r2, r4
	ldrb r1, [r2]
	adds r0, r1, r0
	ldr r1, .L08083374 @ =0x020168EC
	ldrb r1, [r1]
	ands r0, r1
	strb r0, [r2]
	adds r5, #1
	ldr r0, .L08083364 @ =gSecretScreenPasswordMeta
	ldrh r0, [r0, #6]
	cmp r5, r0
	blt .L0808330E
.L08083330:
	ldr r0, .L08083360 @ =gSecretScreenSymbolCount
	ldr r0, [r0]
	ldr r1, .L0808335C @ =gSecretScreenPasswordBuf
	adds r0, r0, r1
	ldr r5, .L08083364 @ =gSecretScreenPasswordMeta
	ldrh r1, [r5, #6]
	bl SecretScreen_ChecksumPasswordBuf
	adds r4, r0, #0
	bl GetSecretScreenRN
	adds r4, r4, r0
	ldr r2, .L08083370 @ =0x000001FF
	adds r0, r2, #0
	ands r4, r0
	strh r4, [r5, #4]
	bl SecretScreen_EmbedPasswordMeta
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L0808335C: .4byte gSecretScreenPasswordBuf
.L08083360: .4byte gSecretScreenSymbolCount
.L08083364: .4byte gSecretScreenPasswordMeta
.L08083368: .4byte 0x000003FF
.L0808336C: .4byte gSecretScreenRN
.L08083370: .4byte 0x000001FF
.L08083374: .4byte 0x020168EC

	thumb_func_start SecretScreen_VerifyPassword
SecretScreen_VerifyPassword: @ 0x08083378
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	mov sb, r0
	movs r0, #0
	str r0, [sp, #4]
	bl SecretScreen_ExtractPasswordMeta
	ldr r1, .L08083424 @ =gSecretScreenRN
	ldr r4, .L08083428 @ =gSecretScreenPasswordMeta
	ldrh r0, [r4]
	str r0, [r1]
	ldr r0, .L0808342C @ =gSecretScreenSymbolCount
	ldr r0, [r0]
	ldr r7, .L08083430 @ =gSecretScreenPasswordBuf
	adds r0, r0, r7
	ldrh r1, [r4, #6]
	bl SecretScreen_ChecksumPasswordBuf
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	bl GetSecretScreenRN
	mov r1, sp
	strh r0, [r1]
	movs r5, #0
	add r0, sp, #4
	mov r8, r0
	ldrh r4, [r4, #6]
	cmp r5, r4
	bge .L080833DE
	adds r4, r7, #0
.L080833BC:
	bl GetSecretScreenRN
	ldr r1, .L0808342C @ =gSecretScreenSymbolCount
	ldr r2, [r1]
	adds r2, r5, r2
	adds r2, r2, r4
	ldrb r1, [r2]
	subs r0, r1, r0
	ldr r1, .L08083434 @ =0x020168EC
	ldrb r1, [r1]
	ands r0, r1
	strb r0, [r2]
	adds r5, #1
	ldr r0, .L08083428 @ =gSecretScreenPasswordMeta
	ldrh r0, [r0, #6]
	cmp r5, r0
	blt .L080833BC
.L080833DE:
	bl GetSecretScreenRN
	mov r1, sp
	strh r0, [r1, #2]
	ldr r5, .L0808342C @ =gSecretScreenSymbolCount
	ldr r1, [r5]
	ldr r4, .L08083430 @ =gSecretScreenPasswordBuf
	adds r1, r1, r4
	mov r0, r8
	bl _call_via_r9
	ldr r0, [r5]
	adds r0, r0, r4
	ldr r4, .L08083428 @ =gSecretScreenPasswordMeta
	ldrh r1, [r4, #6]
	bl SecretScreen_ChecksumPasswordBuf
	mov r1, sp
	ldrh r1, [r1]
	adds r0, r1, r0
	ldr r1, .L08083438 @ =0x000001FF
	adds r2, r1, #0
	ands r0, r2
	mov r1, sp
	ldrh r1, [r1, #2]
	adds r6, r6, r1
	ands r6, r2
	ldrh r1, [r4, #2]
	cmp r1, r0
	bne .L08083420
	ldrh r4, [r4, #4]
	cmp r4, r6
	beq .L0808343C
.L08083420:
	movs r0, #0
	b .L0808343E
	.align 2, 0
.L08083424: .4byte gSecretScreenRN
.L08083428: .4byte gSecretScreenPasswordMeta
.L0808342C: .4byte gSecretScreenSymbolCount
.L08083430: .4byte gSecretScreenPasswordBuf
.L08083434: .4byte 0x020168EC
.L08083438: .4byte 0x000001FF
.L0808343C:
	movs r0, #1
.L0808343E:
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start SecretScreen_FindGlyphIndex
SecretScreen_FindGlyphIndex: @ 0x0808344C
	adds r3, r0, #0
	movs r2, #0
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	beq .L08083472
	ldrh r3, [r3]
.L0808345A:
	ldrh r0, [r1]
	cmp r0, r3
	bne .L08083466
	lsls r0, r2, #0x10
	lsrs r0, r0, #0x10
	b .L08083474
.L08083466:
	adds r1, #2
	adds r2, #1
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bne .L0808345A
.L08083472:
	ldr r0, .L08083478 @ =0x0000FFFF
.L08083474:
	bx lr
	.align 2, 0
.L08083478: .4byte 0x0000FFFF

	thumb_func_start SecretScreen_MapGlyphsToPasswordBuf
SecretScreen_MapGlyphsToPasswordBuf: @ 0x0808347C
	push {r4, r5, r6, lr}
	adds r2, r0, #0
	adds r6, r1, #0
	movs r5, #0
	movs r0, #0
	ldrsb r0, [r2, r0]
	cmp r0, #0
	beq .L080834A8
	adds r4, r2, #0
.L0808348E:
	adds r0, r4, #0
	adds r1, r6, #0
	bl SecretScreen_FindGlyphIndex
	ldr r1, .L080834B0 @ =gSecretScreenPasswordBuf
	adds r1, r5, r1
	strb r0, [r1]
	adds r4, #2
	adds r5, #1
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r0, #0
	bne .L0808348E
.L080834A8:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L080834B0: .4byte gSecretScreenPasswordBuf

	thumb_func_start SecretScreen_EncodePlayRankStats
SecretScreen_EncodePlayRankStats: @ 0x080834B4
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r1, .L08083570 @ =gSecretScreenRN
	ldr r0, .L08083574 @ =gSecretScreenInitSeed
	ldr r0, [r0]
	str r0, [r1]
	ldr r6, .L08083578 @ =gSecretScreenPlayRankStats
	ldrb r2, [r6, #0x11]
	adds r0, r4, #0
	adds r1, r5, #0
	movs r3, #1
	bl SecretScreen_WriteBits
	bl PlayRank_GetTotalTurn
	adds r2, r0, #0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	adds r0, r4, #0
	adds r1, r5, #0
	movs r3, #0x10
	bl SecretScreen_WriteBits
	bl PlayRank_GetWinningRate
	adds r2, r0, #0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	adds r0, r4, #0
	adds r1, r5, #0
	movs r3, #0x10
	bl SecretScreen_WriteBits
	bl PlayRank_GetDeadAllies
	adds r2, r0, #0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	adds r0, r4, #0
	adds r1, r5, #0
	movs r3, #7
	bl SecretScreen_WriteBits
	bl PlayRank_GetTotalLevelsGained
	adds r2, r0, #0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	adds r0, r4, #0
	adds r1, r5, #0
	movs r3, #0xc
	bl SecretScreen_WriteBits
	bl GetTotalAsset
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	movs r3, #0x18
	bl SecretScreen_WriteBits
	bl PlayRank_CalcTotalLevel
	adds r2, r0, #0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	adds r0, r4, #0
	adds r1, r5, #0
	movs r3, #0xc
	bl SecretScreen_WriteBits
	ldrb r2, [r6, #0xe]
	adds r0, r4, #0
	adds r1, r5, #0
	movs r3, #0xa
	bl SecretScreen_WriteBits
	ldrb r2, [r6, #0xf]
	adds r0, r4, #0
	adds r1, r5, #0
	movs r3, #6
	bl SecretScreen_WriteBits
	ldrb r2, [r6, #0x10]
	adds r0, r4, #0
	adds r1, r5, #0
	movs r3, #6
	bl SecretScreen_WriteBits
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08083570: .4byte gSecretScreenRN
.L08083574: .4byte gSecretScreenInitSeed
.L08083578: .4byte gSecretScreenPlayRankStats

	thumb_func_start SecretScreen_DecodePlayRankStats
SecretScreen_DecodePlayRankStats: @ 0x0808357C
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r5, r1, #0
	ldr r1, .L0808360C @ =gSecretScreenRN
	ldr r0, .L08083610 @ =gSecretScreenInitSeed
	ldr r0, [r0]
	str r0, [r1]
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #1
	bl SecretScreen_ReadBits
	ldr r4, .L08083614 @ =gSecretScreenPlayRankStats
	strb r0, [r4, #0x11]
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #0x10
	bl SecretScreen_ReadBits
	strh r0, [r4]
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #0x10
	bl SecretScreen_ReadBits
	strh r0, [r4, #2]
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #7
	bl SecretScreen_ReadBits
	strh r0, [r4, #4]
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #0xc
	bl SecretScreen_ReadBits
	strh r0, [r4, #6]
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #0x18
	bl SecretScreen_ReadBits
	str r0, [r4, #8]
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #0xc
	bl SecretScreen_ReadBits
	strh r0, [r4, #0xc]
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #0xa
	bl SecretScreen_ReadBits
	strb r0, [r4, #0xe]
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #6
	bl SecretScreen_ReadBits
	strb r0, [r4, #0xf]
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #6
	bl SecretScreen_ReadBits
	strb r0, [r4, #0x10]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L0808360C: .4byte gSecretScreenRN
.L08083610: .4byte gSecretScreenInitSeed
.L08083614: .4byte gSecretScreenPlayRankStats

	thumb_func_start SecretScreen_FillPlayRankStats
SecretScreen_FillPlayRankStats: @ 0x08083618
	push {r4, lr}
	sub sp, #0xc
	bl PlayRank_GetTotalTurn
	ldr r4, .L08083654 @ =gSecretScreenPlayRankStats
	strh r0, [r4]
	bl PlayRank_GetWinningRate
	strh r0, [r4, #2]
	bl PlayRank_GetDeadAllies
	strh r0, [r4, #4]
	bl PlayRank_GetTotalLevelsGained
	strh r0, [r4, #6]
	bl GetTotalAsset
	str r0, [r4, #8]
	bl PlayRank_CalcTotalLevel
	strh r0, [r4, #0xc]
	ldr r1, .L08083658 @ =gPlaySt
	movs r0, #0x40
	ldrb r1, [r1, #0x14]
	ands r0, r1
	cmp r0, #0
	beq .L0808365C
	movs r0, #1
	b .L0808365E
	.align 2, 0
.L08083654: .4byte gSecretScreenPlayRankStats
.L08083658: .4byte gPlaySt
.L0808365C:
	movs r0, #0
.L0808365E:
	strb r0, [r4, #0x11]
	bl PlayRank_GetTotalPlayTime
	add r2, sp, #4
	add r3, sp, #8
	mov r1, sp
	bl FormatTime
	ldr r1, .L08083684 @ =gSecretScreenPlayRankStats
	ldr r0, [sp]
	strb r0, [r1, #0xe]
	ldr r0, [sp, #4]
	strb r0, [r1, #0xf]
	ldr r0, [sp, #8]
	strb r0, [r1, #0x10]
	add sp, #0xc
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08083684: .4byte gSecretScreenPlayRankStats

	thumb_func_start SecretScreen_PrintPlayRankPassword
SecretScreen_PrintPlayRankPassword: @ 0x08083688
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	str r0, [sp, #0xc]
	mov r8, r1
	add r1, sp, #8
	movs r0, #0
	strb r0, [r1, #2]
	movs r0, #4
	bl EnableBgSync
	movs r0, #0
	str r0, [sp, #0x10]
	add r7, sp, #8
	movs r1, #0xe0
	lsls r1, r1, #1
	mov sl, r1
	mov sb, r0
	movs r6, #0
.L080836B4:
	ldr r2, [sp, #0xc]
	adds r0, r2, r6
	bl ClearText
	movs r5, #2
	bl InitTalkTextFont
	movs r4, #0
.L080836C4:
	mov r0, sb
	adds r2, r0, r4
	ldr r1, .L08083740 @ =gSecretScreenPasswordMeta
	ldr r0, .L08083744 @ =gSecretScreenSymbolCount
	ldr r0, [r0]
	ldrh r1, [r1, #6]
	adds r0, r1, r0
	cmp r2, r0
	beq .L08083730
	ldr r1, .L08083748 @ =gSecretScreenPasswordBuf
	adds r1, r2, r1
	ldrb r2, [r1]
	lsls r0, r2, #1
	add r0, r8
	ldrb r0, [r0]
	strb r0, [r7]
	ldrb r1, [r1]
	lsls r0, r1, #1
	add r0, r8
	ldrb r0, [r0, #1]
	strb r0, [r7, #1]
	movs r0, #0
	str r0, [sp]
	add r1, sp, #8
	str r1, [sp, #4]
	ldr r2, [sp, #0xc]
	adds r0, r2, r6
	ldr r1, .L0808374C @ =gBg2Tm+0x8
	add r1, sl
	movs r2, #1
	adds r3, r5, #0
	bl PutDrawText
	adds r5, #0xb
	adds r4, #1
	adds r0, r4, #0
	movs r1, #5
	bl __modsi3
	cmp r0, #0
	bne .L08083718
	adds r5, #0xb
.L08083718:
	cmp r4, #0xd
	ble .L080836C4
	movs r0, #0xc0
	add sl, r0
	movs r1, #0xe
	add sb, r1
	adds r6, #8
	ldr r2, [sp, #0x10]
	adds r2, #1
	str r2, [sp, #0x10]
	cmp r2, #2
	ble .L080836B4
.L08083730:
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08083740: .4byte gSecretScreenPasswordMeta
.L08083744: .4byte gSecretScreenSymbolCount
.L08083748: .4byte gSecretScreenPasswordBuf
.L0808374C: .4byte gBg2Tm+0x8

	thumb_func_start SecretScreen_PrintPlayRankStatNumbers
SecretScreen_PrintPlayRankStatNumbers: @ 0x08083750
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r5, r0, #0
	lsls r4, r5, #6
	ldr r0, .L080837C0 @ =gBg2Tm+0x4
	mov r8, r0
	adds r0, r4, r0
	ldr r6, .L080837C4 @ =gSecretScreenPlayRankStats
	ldrh r2, [r6]
	movs r1, #2
	bl PutNumberOrBlank
	mov r0, r8
	adds r0, #8
	adds r0, r4, r0
	ldrh r2, [r6, #2]
	movs r1, #2
	bl PutNumberOrBlank
	mov r0, r8
	adds r0, #0x10
	adds r0, r4, r0
	ldrh r2, [r6, #4]
	movs r1, #2
	bl PutNumberOrBlank
	mov r0, r8
	adds r0, #0x18
	adds r0, r4, r0
	ldrh r2, [r6, #6]
	movs r1, #2
	bl PutNumberOrBlank
	movs r1, #0x28
	add r8, r1
	add r4, r8
	ldrh r2, [r6, #0xc]
	adds r0, r4, #0
	movs r1, #2
	bl PutNumberOrBlank
	adds r5, #2
	lsls r5, r5, #6
	add r5, r8
	ldr r2, [r6, #8]
	adds r0, r5, #0
	movs r1, #2
	bl PutNumberOrBlank
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L080837C0: .4byte gBg2Tm+0x4
.L080837C4: .4byte gSecretScreenPlayRankStats

	thumb_func_start SecretScreen_PlayRankPasswordInit
SecretScreen_PlayRankPasswordInit: @ 0x080837C8
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	movs r0, #0
	bl InitBgs
	bl ResetTextFont
	bl ResetText
	movs r0, #0
	strh r0, [r6, #0x2a]
	ldr r4, .L080838DC @ =gDispIo
	movs r2, #1
	ldrb r0, [r4, #1]
	orrs r0, r2
	movs r3, #2
	orrs r0, r3
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x11
	rsbs r1, r1, #0
	ands r0, r1
	strb r0, [r4, #1]
	adds r1, #0xd
	adds r0, r1, #0
	ldrb r5, [r4, #0xc]
	ands r0, r5
	orrs r0, r2
	strb r0, [r4, #0xc]
	adds r0, r1, #0
	ldrb r2, [r4, #0x10]
	ands r0, r2
	orrs r0, r3
	strb r0, [r4, #0x10]
	ldrb r5, [r4, #0x14]
	ands r1, r5
	strb r1, [r4, #0x14]
	movs r0, #3
	ldrb r1, [r4, #0x18]
	orrs r0, r1
	strb r0, [r4, #0x18]
	bl UnpackUiWindowFrameGraphics
	bl EnablePalSync
	ldr r0, .L080838E0 @ =gBg0Tm
	movs r1, #0
	bl TmFill
	ldr r0, .L080838E4 @ =gBg1Tm
	movs r1, #0
	bl TmFill
	ldr r0, .L080838E8 @ =gBg2Tm
	movs r1, #0
	bl TmFill
	ldr r0, .L080838EC @ =gBg3Tm
	movs r1, #0
	bl TmFill
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
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #0x21
	rsbs r0, r0, #0
	ldrb r2, [r4, #1]
	ands r0, r2
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r4, #1]
	movs r0, #2
	str r0, [sp]
	movs r1, #6
	movs r2, #0x1a
	movs r3, #7
	bl PutUiWindowFrame
	movs r0, #0xf
	bl EnableBgSync
	ldr r5, .L080838F0 @ =gSecretScreenTexts
	movs r4, #2
.L0808389C:
	adds r0, r5, #0
	movs r1, #0x1b
	bl InitText
	adds r5, #8
	subs r4, #1
	cmp r4, #0
	bge .L0808389C
	bl SecretScreen_FillPlayRankStats
	movs r0, #5
	movs r1, #0xb
	bl SecretScreen_InitBitstream
	ldr r0, .L080838F4 @ =SecretScreen_EncodePlayRankStats
	bl SecretScreen_ModifyPassword
	ldr r0, .L080838F0 @ =gSecretScreenTexts
	ldr r1, .L080838F8 @ =gSecretScreenPlayRankGlyphTable
	bl SecretScreen_PrintPlayRankPassword
	movs r0, #0
	movs r1, #0
	movs r2, #0xa
	bl StartMuralBackground
	str r0, [r6, #0x44]
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L080838DC: .4byte gDispIo
.L080838E0: .4byte gBg0Tm
.L080838E4: .4byte gBg1Tm
.L080838E8: .4byte gBg2Tm
.L080838EC: .4byte gBg3Tm
.L080838F0: .4byte gSecretScreenTexts
.L080838F4: .4byte SecretScreen_EncodePlayRankStats
.L080838F8: .4byte gSecretScreenPlayRankGlyphTable

	thumb_func_start SecretScreen_PlayRankPasswordLoop
SecretScreen_PlayRankPasswordLoop: @ 0x080838FC
	bx lr
	.align 2, 0

	thumb_func_start SecretScreen_PlayRankPasswordEnd
SecretScreen_PlayRankPasswordEnd: @ 0x08083900
	push {lr}
	ldr r0, [r0, #0x44]
	bl Proc_End
	ldr r2, .L0808392C @ =gDispIo
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r1, [r2, #1]
	ands r0, r1
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #2
	ands r0, r1
	subs r1, #4
	ands r0, r1
	subs r1, #8
	ands r0, r1
	strb r0, [r2, #1]
	pop {r0}
	bx r0
	.align 2, 0
.L0808392C: .4byte gDispIo

	thumb_func_start NewPassword
NewPassword: @ 0x08083930
	push {lr}
	adds r1, r0, #0
	ldr r0, .L08083940 @ =ProcScr_Prep_Password
	bl SpawnProcLocking
	pop {r1}
	bx r1
	.align 2, 0
.L08083940: .4byte ProcScr_Prep_Password

	thumb_func_start SecretScreen_EncodeUnitData
SecretScreen_EncodeUnitData: @ 0x08083944
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	mov r8, r0
	adds r7, r1, #0
	ldr r0, .L08083A54 @ =gSecretScreenRN
	ldr r1, .L08083A58 @ =gSecretScreenInitSeed
	ldr r1, [r1]
	str r1, [r0]
	ldr r0, .L08083A5C @ =gSecretScreenData
	mov sl, r0
	movs r1, #0
	mov sb, r1
	mov r6, sl
.L08083964:
	ldrb r2, [r6]
	adds r0, r7, #0
	mov r1, r8
	movs r3, #8
	bl SecretScreen_WriteBits
	ldrb r2, [r6, #1]
	adds r0, r7, #0
	mov r1, r8
	movs r3, #1
	bl SecretScreen_WriteBits
	ldrb r2, [r6, #2]
	adds r0, r7, #0
	mov r1, r8
	movs r3, #5
	bl SecretScreen_WriteBits
	ldrb r2, [r6, #3]
	adds r0, r7, #0
	mov r1, r8
	movs r3, #6
	bl SecretScreen_WriteBits
	ldrb r2, [r6, #4]
	adds r0, r7, #0
	mov r1, r8
	movs r3, #5
	bl SecretScreen_WriteBits
	ldrb r2, [r6, #5]
	adds r0, r7, #0
	mov r1, r8
	movs r3, #5
	bl SecretScreen_WriteBits
	ldrb r2, [r6, #6]
	adds r0, r7, #0
	mov r1, r8
	movs r3, #5
	bl SecretScreen_WriteBits
	ldrb r2, [r6, #7]
	adds r0, r7, #0
	mov r1, r8
	movs r3, #5
	bl SecretScreen_WriteBits
	ldrb r2, [r6, #8]
	adds r0, r7, #0
	mov r1, r8
	movs r3, #5
	bl SecretScreen_WriteBits
	ldrb r2, [r6, #9]
	adds r0, r7, #0
	mov r1, r8
	movs r3, #5
	bl SecretScreen_WriteBits
	ldrb r2, [r6, #0xa]
	adds r0, r7, #0
	mov r1, r8
	movs r3, #5
	bl SecretScreen_WriteBits
	mov r0, sl
	adds r0, #0xb
	mov r1, sb
	adds r4, r1, r0
	movs r5, #7
.L080839F2:
	ldrb r2, [r4]
	adds r0, r7, #0
	mov r1, r8
	movs r3, #3
	bl SecretScreen_WriteBits
	adds r4, #1
	subs r5, #1
	cmp r5, #0
	bge .L080839F2
	ldr r4, .L08083A60 @ =0x0203D4B3
	add r4, sb
	movs r5, #4
.L08083A0C:
	ldrb r2, [r4]
	adds r0, r7, #0
	mov r1, r8
	movs r3, #8
	bl SecretScreen_WriteBits
	adds r4, #1
	subs r5, #1
	cmp r5, #0
	bge .L08083A0C
	movs r0, #0x18
	add sb, r0
	adds r6, #0x18
	mov r0, sl
	adds r0, #0x60
	cmp r6, r0
	ble .L08083964
	movs r4, #0
	ldr r5, .L08083A64 @ =gSecretScreenSupportLevels
.L08083A32:
	adds r0, r4, r5
	ldrb r2, [r0]
	adds r0, r7, #0
	mov r1, r8
	movs r3, #2
	bl SecretScreen_WriteBits
	adds r4, #1
	cmp r4, #9
	ble .L08083A32
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08083A54: .4byte gSecretScreenRN
.L08083A58: .4byte gSecretScreenInitSeed
.L08083A5C: .4byte gSecretScreenData
.L08083A60: .4byte 0x0203D4B3
.L08083A64: .4byte gSecretScreenSupportLevels
