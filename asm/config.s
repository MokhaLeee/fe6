	.include "macro.inc"

	.syntax unified

	thumb_func_start MusicOptionChangeHandler
MusicOptionChangeHandler: @ 0x0808C9C8
	push {lr}
	bl GenericOptionChangeHandler
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L0808CA0C
	ldr r1, .L0808CA00 @ =gUiConfigOrder
	ldr r0, .L0808CA04 @ =gpUiConfigSt
	ldr r2, [r0]
	movs r3, #0x32
	ldrsh r0, [r2, r3]
	lsls r0, r0, #3
	adds r1, #4
	adds r0, r0, r1
	movs r3, #0x2a
	ldrsh r1, [r2, r3]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	bl GetGameOption
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L0808CA08
	movs r0, #1
	bl FadeBgmOut
	b .L0808CA0C
	.align 2, 0
.L0808CA00: .4byte gUiConfigOrder
.L0808CA04: .4byte gpUiConfigSt
.L0808CA08:
	bl StartMapSongBgm
.L0808CA0C:
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start GenericOptionChangeHandler
GenericOptionChangeHandler: @ 0x0808CA14
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	movs r7, #0
	ldr r0, .L0808CA70 @ =gpUiConfigSt
	ldr r0, [r0]
	movs r1, #0x2a
	ldrsh r5, [r0, r1]
	ldr r1, .L0808CA74 @ =gUiConfigOrder
	movs r2, #0x32
	ldrsh r0, [r0, r2]
	lsls r0, r0, #3
	adds r1, #4
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r4, [r0]
	adds r6, r4, #0
	bl GetSelectedOptionValue
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	ldr r0, .L0808CA78 @ =gKeySt
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0x30
	ands r0, r1
	cmp r0, #0
	beq .L0808CAD8
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq .L0808CA7C
	cmp r3, #0
	beq .L0808CAA2
	subs r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	adds r0, r4, #0
	adds r1, r3, #0
	bl SetGameOption
	movs r7, #1
	b .L0808CAA6
	.align 2, 0
.L0808CA70: .4byte gpUiConfigSt
.L0808CA74: .4byte gUiConfigOrder
.L0808CA78: .4byte gKeySt
.L0808CA7C:
	ldr r2, .L0808CAE4 @ =gUiConfigOptions
	adds r4, r3, #1
	lsls r0, r4, #3
	movs r1, #0x2c
	muls r1, r6, r1
	adds r0, r0, r1
	adds r0, r0, r2
	ldrh r0, [r0, #6]
	cmp r0, #0
	beq .L0808CAA2
	cmp r3, #2
	bhi .L0808CAA2
	lsls r0, r4, #0x18
	lsrs r3, r0, #0x18
	adds r0, r6, #0
	adds r1, r3, #0
	bl SetGameOption
	movs r7, #1
.L0808CAA2:
	cmp r7, #0
	beq .L0808CAD8
.L0808CAA6:
	ldr r0, .L0808CAE8 @ =ProcScr_RewriteUiConfigExplanition
	mov r1, r8
	bl SpawnProc
	adds r0, r5, #0
	movs r1, #7
	bl __modsi3
	adds r1, r0, #0
	lsls r2, r5, #1
	adds r2, #4
	adds r0, r5, #0
	bl DrawOptionValueTexts
	movs r0, #5
	bl EnableBgSync
	ldr r0, .L0808CAEC @ =gPlaySt
	ldrb r0, [r0, #0x1d]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L0808CAD8
	movs r0, #0x67
	bl m4aSongNumStart
.L0808CAD8:
	adds r0, r7, #0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
.L0808CAE4: .4byte gUiConfigOptions
.L0808CAE8: .4byte ProcScr_RewriteUiConfigExplanition
.L0808CAEC: .4byte gPlaySt

	thumb_func_start GetGameOption
GetGameOption: @ 0x0808CAF0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r2, #0
	cmp r0, #0xd
	bls .L0808CAFC
	b .L0808CC10
.L0808CAFC:
	lsls r0, r0, #2
	ldr r1, .L0808CB08 @ =.L0808CB0C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
.L0808CB08: .4byte .L0808CB0C
.L0808CB0C: @ jump table
	.4byte .L0808CB44 @ case 0
	.4byte .L0808CB7A @ case 1
	.4byte .L0808CB88 @ case 2
	.4byte .L0808CB94 @ case 3
	.4byte .L0808CBA0 @ case 4
	.4byte .L0808CBB0 @ case 5
	.4byte .L0808CBBC @ case 6
	.4byte .L0808CBC8 @ case 7
	.4byte .L0808CBD4 @ case 8
	.4byte .L0808CC10 @ case 9
	.4byte .L0808CBE0 @ case 10
	.4byte .L0808CBF0 @ case 11
	.4byte .L0808CBFC @ case 12
	.4byte .L0808CC08 @ case 13
.L0808CB44:
	ldr r0, .L0808CB5C @ =gPlaySt
	ldrb r0, [r0, #0x1e]
	lsls r0, r0, #0x1e
	lsrs r0, r0, #0x1e
	cmp r0, #1
	beq .L0808CB72
	cmp r0, #1
	bgt .L0808CB60
	cmp r0, #0
	beq .L0808CB6A
	b .L0808CB7A
	.align 2, 0
.L0808CB5C: .4byte gPlaySt
.L0808CB60:
	cmp r0, #2
	beq .L0808CB76
	cmp r0, #3
	beq .L0808CB6E
	b .L0808CB7A
.L0808CB6A:
	movs r0, #0
	b .L0808CC12
.L0808CB6E:
	movs r0, #1
	b .L0808CC12
.L0808CB72:
	movs r0, #2
	b .L0808CC12
.L0808CB76:
	movs r0, #3
	b .L0808CC12
.L0808CB7A:
	ldr r0, .L0808CB84 @ =gPlaySt
	ldrb r0, [r0, #0x1c]
	lsls r0, r0, #0x1e
	b .L0808CC0E
	.align 2, 0
.L0808CB84: .4byte gPlaySt
.L0808CB88:
	ldr r0, .L0808CB90 @ =gPlaySt
	ldrb r0, [r0, #0x1c]
	b .L0808CBE4
	.align 2, 0
.L0808CB90: .4byte gPlaySt
.L0808CB94:
	ldr r0, .L0808CB9C @ =gPlaySt
	ldrb r0, [r0, #0x1c]
	lsls r0, r0, #0x1b
	b .L0808CC0E
	.align 2, 0
.L0808CB9C: .4byte gPlaySt
.L0808CBA0:
	ldr r0, .L0808CBAC @ =gPlaySt
	ldrb r0, [r0, #0x1c]
	lsls r0, r0, #0x19
	lsrs r2, r0, #0x1e
	b .L0808CC10
	.align 2, 0
.L0808CBAC: .4byte gPlaySt
.L0808CBB0:
	ldr r0, .L0808CBB8 @ =gPlaySt
	ldrb r0, [r0, #0x1c]
	lsrs r2, r0, #7
	b .L0808CC10
	.align 2, 0
.L0808CBB8: .4byte gPlaySt
.L0808CBBC:
	ldr r0, .L0808CBC4 @ =gPlaySt
	ldrb r0, [r0, #0x1d]
	b .L0808CC0C
	.align 2, 0
.L0808CBC4: .4byte gPlaySt
.L0808CBC8:
	ldr r0, .L0808CBD0 @ =gPlaySt
	ldrb r0, [r0, #0x1d]
	lsls r0, r0, #0x1e
	b .L0808CC0E
	.align 2, 0
.L0808CBD0: .4byte gPlaySt
.L0808CBD4:
	ldr r0, .L0808CBDC @ =gPlaySt
	ldrb r0, [r0, #0x1d]
	b .L0808CBE4
	.align 2, 0
.L0808CBDC: .4byte gPlaySt
.L0808CBE0:
	ldr r0, .L0808CBEC @ =gPlaySt
	ldrb r0, [r0, #0x1e]
.L0808CBE4:
	lsls r0, r0, #0x1c
	lsrs r2, r0, #0x1e
	b .L0808CC10
	.align 2, 0
.L0808CBEC: .4byte gPlaySt
.L0808CBF0:
	ldr r0, .L0808CBF8 @ =gPlaySt
	ldrb r0, [r0, #0x1d]
	lsrs r2, r0, #7
	b .L0808CC10
	.align 2, 0
.L0808CBF8: .4byte gPlaySt
.L0808CBFC:
	ldr r0, .L0808CC04 @ =gPlaySt
	ldrb r0, [r0, #0x1d]
	lsls r0, r0, #0x19
	b .L0808CC0E
	.align 2, 0
.L0808CC04: .4byte gPlaySt
.L0808CC08:
	ldr r0, .L0808CC14 @ =gPlaySt
	ldrb r0, [r0, #0x1c]
.L0808CC0C:
	lsls r0, r0, #0x1f
.L0808CC0E:
	lsrs r2, r0, #0x1f
.L0808CC10:
	adds r0, r2, #0
.L0808CC12:
	bx lr
	.align 2, 0
.L0808CC14: .4byte gPlaySt

	thumb_func_start SetGameOption
SetGameOption: @ 0x0808CC18
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r3, r1, #0x18
	cmp r0, #0xd
	bls .L0808CC26
	b .L0808CDC4
.L0808CC26:
	lsls r0, r0, #2
	ldr r1, .L0808CC30 @ =.L0808CC34
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
.L0808CC30: .4byte .L0808CC34
.L0808CC34: @ jump table
	.4byte .L0808CC6C @ case 0
	.4byte .L0808CCD4 @ case 1
	.4byte .L0808CCE8 @ case 2
	.4byte .L0808CCFC @ case 3
	.4byte .L0808CD10 @ case 4
	.4byte .L0808CD24 @ case 5
	.4byte .L0808CD30 @ case 6
	.4byte .L0808CD44 @ case 7
	.4byte .L0808CD58 @ case 8
	.4byte .L0808CDC4 @ case 9
	.4byte .L0808CD6C @ case 10
	.4byte .L0808CD88 @ case 11
	.4byte .L0808CD94 @ case 12
	.4byte .L0808CDB0 @ case 13
.L0808CC6C:
	cmp r3, #1
	beq .L0808CC98
	cmp r3, #1
	bgt .L0808CC7A
	cmp r3, #0
	beq .L0808CC84
	b .L0808CCD4
.L0808CC7A:
	cmp r3, #2
	beq .L0808CCA8
	cmp r3, #3
	beq .L0808CCBC
	b .L0808CCD4
.L0808CC84:
	ldr r1, .L0808CC94 @ =gPlaySt
	movs r0, #4
	rsbs r0, r0, #0
	ldrb r2, [r1, #0x1e]
	ands r0, r2
	strb r0, [r1, #0x1e]
	b .L0808CDC4
	.align 2, 0
.L0808CC94: .4byte gPlaySt
.L0808CC98:
	ldr r1, .L0808CCA4 @ =gPlaySt
	movs r0, #3
	ldrb r3, [r1, #0x1e]
	orrs r0, r3
	strb r0, [r1, #0x1e]
	b .L0808CDC4
	.align 2, 0
.L0808CCA4: .4byte gPlaySt
.L0808CCA8:
	ldr r0, .L0808CCB8 @ =gPlaySt
	movs r1, #4
	rsbs r1, r1, #0
	ldrb r2, [r0, #0x1e]
	ands r1, r2
	movs r2, #1
	b .L0808CCC8
	.align 2, 0
.L0808CCB8: .4byte gPlaySt
.L0808CCBC:
	ldr r0, .L0808CCD0 @ =gPlaySt
	movs r1, #4
	rsbs r1, r1, #0
	ldrb r3, [r0, #0x1e]
	ands r1, r3
	movs r2, #2
.L0808CCC8:
	orrs r1, r2
	strb r1, [r0, #0x1e]
	b .L0808CDC4
	.align 2, 0
.L0808CCD0: .4byte gPlaySt
.L0808CCD4:
	ldr r2, .L0808CCE4 @ =gPlaySt
	movs r0, #1
	adds r1, r3, #0
	ands r1, r0
	lsls r1, r1, #1
	movs r0, #3
	rsbs r0, r0, #0
	b .L0808CDBC
	.align 2, 0
.L0808CCE4: .4byte gPlaySt
.L0808CCE8:
	ldr r2, .L0808CCF8 @ =gPlaySt
	movs r0, #3
	adds r1, r3, #0
	ands r1, r0
	lsls r1, r1, #2
	movs r0, #0xd
	rsbs r0, r0, #0
	b .L0808CDBC
	.align 2, 0
.L0808CCF8: .4byte gPlaySt
.L0808CCFC:
	ldr r2, .L0808CD0C @ =gPlaySt
	movs r0, #1
	adds r1, r3, #0
	ands r1, r0
	lsls r1, r1, #4
	movs r0, #0x11
	rsbs r0, r0, #0
	b .L0808CDBC
	.align 2, 0
.L0808CD0C: .4byte gPlaySt
.L0808CD10:
	ldr r2, .L0808CD20 @ =gPlaySt
	movs r0, #3
	adds r1, r3, #0
	ands r1, r0
	lsls r1, r1, #5
	movs r0, #0x61
	rsbs r0, r0, #0
	b .L0808CDBC
	.align 2, 0
.L0808CD20: .4byte gPlaySt
.L0808CD24:
	ldr r2, .L0808CD2C @ =gPlaySt
	lsls r1, r3, #7
	movs r0, #0x7f
	b .L0808CDBC
	.align 2, 0
.L0808CD2C: .4byte gPlaySt
.L0808CD30:
	ldr r2, .L0808CD40 @ =gPlaySt
	movs r0, #1
	adds r1, r3, #0
	ands r1, r0
	movs r0, #2
	rsbs r0, r0, #0
	b .L0808CDA2
	.align 2, 0
.L0808CD40: .4byte gPlaySt
.L0808CD44:
	ldr r2, .L0808CD54 @ =gPlaySt
	movs r0, #1
	adds r1, r3, #0
	ands r1, r0
	lsls r1, r1, #1
	movs r0, #3
	rsbs r0, r0, #0
	b .L0808CDA2
	.align 2, 0
.L0808CD54: .4byte gPlaySt
.L0808CD58:
	ldr r2, .L0808CD68 @ =gPlaySt
	movs r0, #3
	adds r1, r3, #0
	ands r1, r0
	lsls r1, r1, #2
	movs r0, #0xd
	rsbs r0, r0, #0
	b .L0808CDA2
	.align 2, 0
.L0808CD68: .4byte gPlaySt
.L0808CD6C:
	ldr r2, .L0808CD84 @ =gPlaySt
	movs r0, #3
	adds r1, r3, #0
	ands r1, r0
	lsls r1, r1, #2
	movs r0, #0xd
	rsbs r0, r0, #0
	ldrb r3, [r2, #0x1e]
	ands r0, r3
	orrs r0, r1
	strb r0, [r2, #0x1e]
	b .L0808CDC4
	.align 2, 0
.L0808CD84: .4byte gPlaySt
.L0808CD88:
	ldr r2, .L0808CD90 @ =gPlaySt
	lsls r1, r3, #7
	movs r0, #0x7f
	b .L0808CDA2
	.align 2, 0
.L0808CD90: .4byte gPlaySt
.L0808CD94:
	ldr r2, .L0808CDAC @ =gPlaySt
	movs r0, #1
	adds r1, r3, #0
	ands r1, r0
	lsls r1, r1, #6
	movs r0, #0x41
	rsbs r0, r0, #0
.L0808CDA2:
	ldrb r3, [r2, #0x1d]
	ands r0, r3
	orrs r0, r1
	strb r0, [r2, #0x1d]
	b .L0808CDC4
	.align 2, 0
.L0808CDAC: .4byte gPlaySt
.L0808CDB0:
	ldr r2, .L0808CDC8 @ =gPlaySt
	movs r0, #1
	adds r1, r3, #0
	ands r1, r0
	movs r0, #2
	rsbs r0, r0, #0
.L0808CDBC:
	ldrb r3, [r2, #0x1c]
	ands r0, r3
	orrs r0, r1
	strb r0, [r2, #0x1c]
.L0808CDC4:
	bx lr
	.align 2, 0
.L0808CDC8: .4byte gPlaySt

	thumb_func_start func_fe6_0808CDCC
func_fe6_0808CDCC: @ 0x0808CDCC
	push {r4, r5, r6, r7, lr}
	adds r5, r1, #0
	adds r7, r2, #0
	lsls r0, r5, #1
	adds r6, r0, #4
	lsls r0, r6, #5
	ldr r2, .L0808CE44 @ =gBg2Tm
	movs r4, #0
	adds r1, r0, #0
	adds r1, #0x22
	adds r0, #2
	movs r3, #0x1a
	lsls r0, r0, #1
	adds r0, r0, r2
	lsls r1, r1, #1
	adds r1, r1, r2
.L0808CDEC:
	strh r4, [r0]
	strh r4, [r1]
	adds r1, #2
	adds r0, #2
	subs r3, #1
	cmp r3, #0
	bge .L0808CDEC
	adds r0, r5, #0
	movs r1, #7
	bl __modsi3
	adds r4, r0, #0
	adds r0, r5, #0
	movs r1, #4
	bl DrawGameOptionIcon
	adds r0, r5, #0
	adds r1, r4, #0
	adds r2, r6, #0
	bl DrawGameOptionText
	adds r0, r5, #0
	adds r1, r4, #0
	adds r2, r6, #0
	bl DrawOptionValueTexts
	ldr r1, .L0808CE48 @ =gBg0Tm
	movs r2, #0
	adds r0, r7, #0
	adds r0, #0x62
	movs r3, #0x1a
	lsls r0, r0, #1
	adds r0, r0, r1
.L0808CE2E:
	strh r2, [r0]
	adds r0, #2
	subs r3, #1
	cmp r3, #0
	bge .L0808CE2E
	movs r0, #5
	bl EnableBgSync
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0808CE44: .4byte gBg2Tm
.L0808CE48: .4byte gBg0Tm

	thumb_func_start Config_Loop
Config_Loop: @ 0x0808CE4C
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	movs r3, #0
	movs r1, #0x30
	ldrsh r0, [r4, r1]
	cmp r0, #6
	bls .L0808CE5C
	b .L0808D06C
.L0808CE5C:
	lsls r0, r0, #2
	ldr r1, .L0808CE68 @ =.L0808CE6C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
.L0808CE68: .4byte .L0808CE6C
.L0808CE6C: @ jump table
	.4byte .L0808CE88 @ case 0
	.4byte .L0808D048 @ case 1
	.4byte .L0808D048 @ case 2
	.4byte .L0808D048 @ case 3
	.4byte .L0808D058 @ case 4
	.4byte .L0808D058 @ case 5
	.4byte .L0808D058 @ case 6
.L0808CE88:
	ldr r0, .L0808CEA8 @ =gKeySt
	ldr r2, [r0]
	ldrh r1, [r2, #8]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq .L0808CEB0
	ldr r0, .L0808CEAC @ =gPlaySt
	ldrb r0, [r0, #0x1d]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L0808CF02
	movs r0, #0x6b
	bl m4aSongNumStart
	b .L0808CF02
	.align 2, 0
.L0808CEA8: .4byte gKeySt
.L0808CEAC: .4byte gPlaySt
.L0808CEB0:
	movs r5, #1
	adds r0, r5, #0
	ands r0, r1
	cmp r0, #0
	beq .L0808CF18
	ldr r1, .L0808CF0C @ =gUiConfigOrder
	ldr r0, .L0808CF10 @ =gpUiConfigSt
	ldr r2, [r0]
	movs r3, #0x32
	ldrsh r0, [r2, r3]
	lsls r0, r0, #3
	adds r1, #4
	adds r0, r0, r1
	movs r5, #0x2a
	ldrsh r1, [r2, r5]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq .L0808CEDA
	b .L0808D06C
.L0808CEDA:
	movs r0, #0
	bl GetGameOption
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #3
	beq .L0808CEEA
	b .L0808D06C
.L0808CEEA:
	ldr r0, .L0808CF14 @ =gPlaySt
	ldrb r0, [r0, #0x1d]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L0808CEFA
	movs r0, #0x6a
	bl m4aSongNumStart
.L0808CEFA:
	adds r1, r4, #0
	adds r1, #0x36
	movs r0, #1
	strb r0, [r1]
.L0808CF02:
	adds r0, r4, #0
	bl Proc_Break
	b .L0808D06C
	.align 2, 0
.L0808CF0C: .4byte gUiConfigOrder
.L0808CF10: .4byte gpUiConfigSt
.L0808CF14: .4byte gPlaySt
.L0808CF18:
	ldrh r1, [r2, #6]
	movs r0, #0xc0
	ands r0, r1
	cmp r0, #0
	beq .L0808CFF8
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq .L0808CF78
	ldr r0, .L0808CF74 @ =gpUiConfigSt
	ldr r2, [r0]
	ldrh r1, [r2, #0x2a]
	movs r6, #0x2a
	ldrsh r0, [r2, r6]
	cmp r0, #0
	beq .L0808CFC6
	subs r0, r1, #1
	strh r0, [r2, #0x2a]
	movs r1, #0x2a
	ldrsh r0, [r2, r1]
	movs r3, #0x2c
	ldrsh r1, [r2, r3]
	subs r0, r0, r1
	cmp r0, #0
	bgt .L0808CF6E
	ldrh r1, [r2, #0x2c]
	movs r6, #0x2c
	ldrsh r0, [r2, r6]
	cmp r0, #0
	beq .L0808CF6E
	subs r0, r1, #1
	strh r0, [r2, #0x2c]
	movs r0, #0x2a
	ldrsh r1, [r2, r0]
	subs r1, #1
	adds r0, r4, #0
	movs r2, #0
	bl func_fe6_0808CDCC
	ldrh r0, [r4, #0x2e]
	subs r0, #4
	strh r0, [r4, #0x2e]
	strh r5, [r4, #0x30]
.L0808CF6E:
	movs r3, #1
	b .L0808CFCA
	.align 2, 0
.L0808CF74: .4byte gpUiConfigSt
.L0808CF78:
	ldr r0, .L0808CFEC @ =gpUiConfigSt
	ldr r2, [r0]
	movs r5, #0x2a
	ldrsh r1, [r2, r5]
	movs r6, #0x34
	ldrsh r0, [r2, r6]
	subs r0, #1
	cmp r1, r0
	bge .L0808CFC6
	ldrh r0, [r2, #0x2a]
	adds r0, #1
	strh r0, [r2, #0x2a]
	movs r0, #0x2a
	ldrsh r1, [r2, r0]
	movs r3, #0x2c
	ldrsh r0, [r2, r3]
	subs r0, r1, r0
	cmp r0, #4
	ble .L0808CFC4
	movs r5, #0x34
	ldrsh r0, [r2, r5]
	subs r0, #1
	cmp r1, r0
	bge .L0808CFC4
	ldrh r0, [r2, #0x2c]
	adds r0, #1
	strh r0, [r2, #0x2c]
	adds r1, #1
	movs r2, #0xa0
	lsls r2, r2, #1
	adds r0, r4, #0
	bl func_fe6_0808CDCC
	ldrh r0, [r4, #0x2e]
	adds r0, #4
	strh r0, [r4, #0x2e]
	movs r0, #4
	strh r0, [r4, #0x30]
.L0808CFC4:
	movs r3, #1
.L0808CFC6:
	cmp r3, #0
	beq .L0808CFF8
.L0808CFCA:
	ldr r0, .L0808CFF0 @ =ProcScr_RewriteUiConfigExplanition
	adds r1, r4, #0
	bl SpawnProc
	movs r0, #5
	bl EnableBgSync
	ldr r0, .L0808CFF4 @ =gPlaySt
	ldrb r0, [r0, #0x1d]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L0808D06C
	movs r0, #0x66
	bl m4aSongNumStart
	b .L0808D06C
	.align 2, 0
.L0808CFEC: .4byte gpUiConfigSt
.L0808CFF0: .4byte ProcScr_RewriteUiConfigExplanition
.L0808CFF4: .4byte gPlaySt
.L0808CFF8:
	ldr r0, .L0808D038 @ =gKeySt
	ldr r1, [r0]
	movs r0, #0x30
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq .L0808D06C
	ldr r3, .L0808D03C @ =gUiConfigOptions
	ldr r1, .L0808D040 @ =gUiConfigOrder
	ldr r0, .L0808D044 @ =gpUiConfigSt
	ldr r2, [r0]
	movs r5, #0x32
	ldrsh r0, [r2, r5]
	lsls r0, r0, #3
	adds r1, #4
	adds r0, r0, r1
	movs r6, #0x2a
	ldrsh r1, [r2, r6]
	ldr r0, [r0]
	adds r0, r0, r1
	movs r1, #0x2c
	ldrb r0, [r0]
	muls r0, r1, r0
	adds r3, #0x28
	adds r0, r0, r3
	ldr r1, [r0]
	cmp r1, #0
	beq .L0808D06C
	adds r0, r4, #0
	bl _call_via_r1
	b .L0808D06C
	.align 2, 0
.L0808D038: .4byte gKeySt
.L0808D03C: .4byte gUiConfigOptions
.L0808D040: .4byte gUiConfigOrder
.L0808D044: .4byte gpUiConfigSt
.L0808D048:
	ldrh r0, [r4, #0x2e]
	subs r0, #4
	strh r0, [r4, #0x2e]
	ldrh r0, [r4, #0x30]
	cmp r0, #3
	bne .L0808D068
	movs r0, #0
	b .L0808D06A
.L0808D058:
	ldrh r0, [r4, #0x2e]
	adds r0, #4
	strh r0, [r4, #0x2e]
	ldrh r0, [r4, #0x30]
	cmp r0, #6
	bne .L0808D068
	movs r0, #0
	b .L0808D06A
.L0808D068:
	adds r0, #1
.L0808D06A:
	strh r0, [r4, #0x30]
.L0808D06C:
	ldrh r2, [r4, #0x2e]
	movs r0, #2
	movs r1, #0
	bl SetBgOffset
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start Config_End
Config_End: @ 0x0808D07C
	push {r4, lr}
	adds r4, r0, #0
	bl EndMuralBackground
	ldr r0, .L0808D0A0 @ =ProcScr_ConfigObj
	bl Proc_EndEach
	ldr r0, .L0808D0A4 @ =ProcScr_RewriteUiConfigExplanition
	bl Proc_EndEach
	adds r0, r4, #0
	adds r0, #0x36
	ldrb r0, [r0]
	cmp r0, #0
	bne .L0808D0A8
	movs r0, #1
	b .L0808D0B8
	.align 2, 0
.L0808D0A0: .4byte ProcScr_ConfigObj
.L0808D0A4: .4byte ProcScr_RewriteUiConfigExplanition
.L0808D0A8:
	adds r0, r4, #0
	bl StartUnitListScreenForSoloAnim
	adds r0, r4, #0
	movs r1, #0
	bl Proc_Goto
	movs r0, #0
.L0808D0B8:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
