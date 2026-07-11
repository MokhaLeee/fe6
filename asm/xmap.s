	.include "macro.inc"

	.syntax unified

	thumb_func_start PutSoundRoomCG
PutSoundRoomCG: @ 0x0808B93C
	push {r4, r5, r6, lr}
	adds r1, r0, #0
	movs r1, #0xa
	bl __modsi3
	adds r1, r0, #0
	movs r4, #0
	ldr r5, .L0808B9A8 @ =gSoundRoom_020004AC
	ldr r6, .L0808B9AC @ =gSoundRoomCgInfo
.L0808B94E:
	lsrs r0, r4, #0x1f
	adds r0, r4, r0
	asrs r0, r0, #1
	lsls r0, r0, #1
	subs r0, r4, r0
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, r1
	bne .L0808B96A
	adds r0, r1, #1
	movs r1, #0xa
	bl __modsi3
	adds r1, r0, #0
.L0808B96A:
	adds r4, #1
	cmp r4, #2
	ble .L0808B94E
	ldrb r0, [r5]
	strb r0, [r5, #1]
	strb r1, [r5]
	lsls r0, r1, #3
	adds r0, r0, r6
	ldr r4, [r0]
	movs r0, #2
	bl GetBgChrOffset
	adds r1, r0, #0
	ldr r0, .L0808B9B0 @ =0x06002800
	adds r1, r1, r0
	adds r0, r4, #0
	bl Decompress
	ldrb r5, [r5]
	lsls r0, r5, #3
	adds r1, r6, #4
	adds r0, r0, r1
	ldr r0, [r0]
	movs r1, #0xc0
	movs r2, #0x20
	bl ApplyPaletteExt
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L0808B9A8: .4byte gSoundRoom_020004AC
.L0808B9AC: .4byte gSoundRoomCgInfo
.L0808B9B0: .4byte 0x06002800
