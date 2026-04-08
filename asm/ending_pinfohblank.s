	.include "macro.inc"

	.syntax unified

	thumb_func_start HBlank_Ending_SinglePInfo
HBlank_Ending_SinglePInfo: @ 0x080910DC
	push {r4, r5, lr}
	movs r2, #0
	ldr r0, .L080910F4 @ =0x04000006
	ldrh r0, [r0]
	cmp r0, #0x18
	beq .L080910FE
	cmp r0, #0x18
	bgt .L080910F8
	cmp r0, #0
	beq .L0809110C
	b .L08091110
	.align 2, 0
.L080910F4: .4byte 0x04000006
.L080910F8:
	cmp r0, #0x30
	beq .L0809110C
	b .L08091110
.L080910FE:
	ldr r1, .L08091108 @ =0x04000012
	movs r0, #4
	strh r0, [r1]
	b .L08091110
	.align 2, 0
.L08091108: .4byte 0x04000012
.L0809110C:
	ldr r0, .L08091134 @ =0x04000012
	strh r2, [r0]
.L08091110:
	ldr r0, .L08091138 @ =0x04000006
	ldrh r0, [r0]
	cmp r0, #0x3c
	beq .L08091186
	cmp r0, #0x3c
	bgt .L08091156
	cmp r0, #0x34
	beq .L0809118E
	cmp r0, #0x34
	bgt .L08091142
	cmp r0, #0x30
	beq .L08091192
	cmp r0, #0x30
	bgt .L0809113C
	cmp r0, #0
	beq .L08091194
	b .L080911BA
	.align 2, 0
.L08091134: .4byte 0x04000012
.L08091138: .4byte 0x04000006
.L0809113C:
	cmp r0, #0x32
	beq .L08091190
	b .L080911BA
.L08091142:
	cmp r0, #0x38
	beq .L0809118A
	cmp r0, #0x38
	bgt .L08091150
	cmp r0, #0x36
	beq .L0809118C
	b .L080911BA
.L08091150:
	cmp r0, #0x3a
	beq .L08091188
	b .L080911BA
.L08091156:
	cmp r0, #0x96
	beq .L0809118E
	cmp r0, #0x96
	bgt .L08091172
	cmp r0, #0x92
	beq .L0809118A
	cmp r0, #0x92
	bgt .L0809116C
	cmp r0, #0x90
	beq .L08091188
	b .L080911BA
.L0809116C:
	cmp r0, #0x94
	beq .L0809118C
	b .L080911BA
.L08091172:
	cmp r0, #0x9a
	beq .L08091192
	cmp r0, #0x9a
	bgt .L08091180
	cmp r0, #0x98
	beq .L08091190
	b .L080911BA
.L08091180:
	cmp r0, #0x9c
	beq .L08091194
	b .L080911BA
.L08091186:
	adds r2, #1
.L08091188:
	adds r2, #1
.L0809118A:
	adds r2, #1
.L0809118C:
	adds r2, #1
.L0809118E:
	adds r2, #1
.L08091190:
	adds r2, #1
.L08091192:
	adds r2, #1
.L08091194:
	lsls r0, r2, #5
	ldr r2, .L080911C0 @ =unk_02016B94
	ldr r1, .L080911C4 @ =unk_02016C94
	adds r3, r0, r1
	ldr r5, .L080911C8 @ =0x05000060
	adds r1, r0, r2
	ldr r4, .L080911CC @ =0x05000040
	movs r2, #0xf
.L080911A4:
	ldrh r0, [r1]
	strh r0, [r4]
	ldrh r0, [r3]
	strh r0, [r5]
	adds r3, #2
	adds r5, #2
	adds r1, #2
	adds r4, #2
	subs r2, #1
	cmp r2, #0
	bge .L080911A4
.L080911BA:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L080911C0: .4byte unk_02016B94
.L080911C4: .4byte unk_02016C94
.L080911C8: .4byte 0x05000060
.L080911CC: .4byte 0x05000040

	thumb_func_start HBlank_Ending_DyadPInfo
HBlank_Ending_DyadPInfo: @ 0x080911D0
	push {r4, r5, lr}
	movs r3, #0
	ldr r4, .L08091210 @ =0x04000006
	ldrh r0, [r4]
	cmp r0, #0
	bne .L080911E8
	ldr r2, .L08091214 @ =0x04000010
	ldr r0, .L08091218 @ =EndingFaceXPos
	ldrh r1, [r0]
	strh r1, [r2]
	ldr r0, .L0809121C @ =0x04000014
	strh r1, [r0]
.L080911E8:
	ldrh r0, [r4]
	cmp r0, #0x50
	bne .L080911FA
	ldr r2, .L08091214 @ =0x04000010
	ldr r0, .L08091218 @ =EndingFaceXPos
	ldrh r1, [r0, #2]
	strh r1, [r2]
	ldr r0, .L0809121C @ =0x04000014
	strh r1, [r0]
.L080911FA:
	ldrh r0, [r4]
	cmp r0, #0x2a
	beq .L0809124C
	cmp r0, #0x2a
	bgt .L08091220
	cmp r0, #0
	beq .L08091234
	cmp r0, #0x18
	beq .L08091240
	b .L08091252
	.align 2, 0
.L08091210: .4byte 0x04000006
.L08091214: .4byte 0x04000010
.L08091218: .4byte EndingFaceXPos
.L0809121C: .4byte 0x04000014
.L08091220:
	cmp r0, #0x68
	beq .L08091240
	cmp r0, #0x68
	bgt .L0809122E
	cmp r0, #0x50
	beq .L08091234
	b .L08091252
.L0809122E:
	cmp r0, #0x7a
	beq .L0809124C
	b .L08091252
.L08091234:
	ldr r1, .L0809123C @ =0x04000012
	movs r0, #0
	b .L08091250
	.align 2, 0
.L0809123C: .4byte 0x04000012
.L08091240:
	ldr r1, .L08091248 @ =0x04000012
	movs r0, #4
	b .L08091250
	.align 2, 0
.L08091248: .4byte 0x04000012
.L0809124C:
	ldr r1, .L08091268 @ =0x04000012
	movs r0, #5
.L08091250:
	strh r0, [r1]

.L08091252:
	ldr r0, .L0809126C @ =0x04000006
	ldrh r0, [r0]
	subs r0, #9
	cmp r0, #0x86
	bls .L0809125E
	b ._default
.L0809125E:
	lsls r0, r0, #2
	ldr r1, .L08091270 @ =.L08091274
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
.L08091268: .4byte 0x04000012
.L0809126C: .4byte 0x04000006
.L08091270: .4byte .L08091274
.L08091274: @ jump table
	.4byte .L0809149E @ case 0
	.4byte ._default @ case 1
	.4byte ._default @ case 2
	.4byte ._default @ case 3
	.4byte ._default @ case 4
	.4byte ._default @ case 5
	.4byte ._default @ case 6
	.4byte ._default @ case 7
	.4byte ._default @ case 8
	.4byte .L0809149C @ case 9
	.4byte ._default @ case 10
	.4byte ._default @ case 11
	.4byte ._default @ case 12
	.4byte ._default @ case 13
	.4byte ._default @ case 14
	.4byte ._default @ case 15
	.4byte ._default @ case 16
	.4byte ._default @ case 17
	.4byte .L0809149A @ case 18
	.4byte ._default @ case 19
	.4byte ._default @ case 20
	.4byte ._default @ case 21
	.4byte ._default @ case 22
	.4byte ._default @ case 23
	.4byte ._default @ case 24
	.4byte ._default @ case 25
	.4byte ._default @ case 26
	.4byte .L08091498 @ case 27
	.4byte ._default @ case 28
	.4byte ._default @ case 29
	.4byte ._default @ case 30
	.4byte ._default @ case 31
	.4byte ._default @ case 32
	.4byte ._default @ case 33
	.4byte ._default @ case 34
	.4byte ._default @ case 35
	.4byte .L08091496 @ case 36
	.4byte ._default @ case 37
	.4byte ._default @ case 38
	.4byte ._default @ case 39
	.4byte ._default @ case 40
	.4byte ._default @ case 41
	.4byte ._default @ case 42
	.4byte ._default @ case 43
	.4byte ._default @ case 44
	.4byte .L08091494 @ case 45
	.4byte ._default @ case 46
	.4byte ._default @ case 47
	.4byte ._default @ case 48
	.4byte ._default @ case 49
	.4byte ._default @ case 50
	.4byte ._default @ case 51
	.4byte ._default @ case 52
	.4byte ._default @ case 53
	.4byte .L08091492 @ case 54
	.4byte ._default @ case 55
	.4byte ._default @ case 56
	.4byte ._default @ case 57
	.4byte ._default @ case 58
	.4byte ._default @ case 59
	.4byte ._default @ case 60
	.4byte ._default @ case 61
	.4byte ._default @ case 62
	.4byte .L08091490 @ case 63
	.4byte ._default @ case 64
	.4byte ._default @ case 65
	.4byte ._default @ case 66
	.4byte ._default @ case 67
	.4byte ._default @ case 68
	.4byte ._default @ case 69
	.4byte ._default @ case 70
	.4byte ._default @ case 71
	.4byte ._default @ case 72
	.4byte ._default @ case 73
	.4byte ._default @ case 74
	.4byte ._default @ case 75
	.4byte ._default @ case 76
	.4byte ._default @ case 77
	.4byte ._default @ case 78
	.4byte ._default @ case 79
	.4byte .L08091492 @ case 80
	.4byte ._default @ case 81
	.4byte ._default @ case 82
	.4byte ._default @ case 83
	.4byte ._default @ case 84
	.4byte ._default @ case 85
	.4byte ._default @ case 86
	.4byte ._default @ case 87
	.4byte ._default @ case 88
	.4byte .L08091494 @ case 89
	.4byte ._default @ case 90
	.4byte ._default @ case 91
	.4byte ._default @ case 92
	.4byte ._default @ case 93
	.4byte ._default @ case 94
	.4byte ._default @ case 95
	.4byte ._default @ case 96
	.4byte ._default @ case 97
	.4byte .L08091496 @ case 98
	.4byte ._default @ case 99
	.4byte ._default @ case 100
	.4byte ._default @ case 101
	.4byte ._default @ case 102
	.4byte ._default @ case 103
	.4byte ._default @ case 104
	.4byte ._default @ case 105
	.4byte ._default @ case 106
	.4byte .L08091498 @ case 107
	.4byte ._default @ case 108
	.4byte ._default @ case 109
	.4byte ._default @ case 110
	.4byte ._default @ case 111
	.4byte ._default @ case 112
	.4byte ._default @ case 113
	.4byte ._default @ case 114
	.4byte ._default @ case 115
	.4byte .L0809149A @ case 116
	.4byte ._default @ case 117
	.4byte ._default @ case 118
	.4byte ._default @ case 119
	.4byte ._default @ case 120
	.4byte ._default @ case 121
	.4byte ._default @ case 122
	.4byte ._default @ case 123
	.4byte ._default @ case 124
	.4byte .L0809149C @ case 125
	.4byte ._default @ case 126
	.4byte ._default @ case 127
	.4byte ._default @ case 128
	.4byte ._default @ case 129
	.4byte ._default @ case 130
	.4byte ._default @ case 131
	.4byte ._default @ case 132
	.4byte ._default @ case 133
	.4byte .L0809149E @ case 134
.L08091490:
	adds r3, #1
.L08091492:
	adds r3, #1
.L08091494:
	adds r3, #1
.L08091496:
	adds r3, #1
.L08091498:
	adds r3, #1
.L0809149A:
	adds r3, #1
.L0809149C:
	adds r3, #1
.L0809149E:
	lsls r0, r3, #5
	ldr r2, .L080914CC @ =unk_02016B94
	ldr r1, .L080914D0 @ =unk_02016C94
	adds r3, r0, r1
	ldr r5, .L080914D4 @ =0x05000060
	adds r1, r0, r2
	ldr r4, .L080914D8 @ =0x05000040
	movs r2, #0xf
.L080914AE:
	ldrh r0, [r1]
	strh r0, [r4]
	ldrh r0, [r3]
	strh r0, [r5]
	adds r3, #2
	adds r5, #2
	adds r1, #2
	adds r4, #2
	subs r2, #1
	cmp r2, #0
	bge .L080914AE
._default:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L080914CC: .4byte unk_02016B94
.L080914D0: .4byte unk_02016C94
.L080914D4: .4byte 0x05000060
.L080914D8: .4byte 0x05000040
