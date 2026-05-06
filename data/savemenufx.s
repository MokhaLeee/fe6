	.data

	.global Sprite_0868A348
Sprite_0868A348:	@ 0x68A348
	.incbin "fe6-base.gba", 0x68A348, 0x68A362 - 0x68A348

	.global Sprite_0868A362
Sprite_0868A362:	@ 0x68A362
	.incbin "fe6-base.gba", 0x68A362, 0x68A37C - 0x68A362

	.global Sprite_0868A37C
Sprite_0868A37C:	@ 0x68A37C
	.incbin "fe6-base.gba", 0x68A37C, 0x68A390 - 0x68A37C

	.global Sprite_0868A390
Sprite_0868A390:	@ 0x68A390
	.incbin "fe6-base.gba", 0x68A390, 0x68A3A4 - 0x68A390

	.global Sprite_0868A3A4
Sprite_0868A3A4:	@ 0x68A3A4
	.incbin "fe6-base.gba", 0x68A3A4, 0x68A3BE - 0x68A3A4

	.global Sprite_0868A3BE
Sprite_0868A3BE:	@ 0x68A3BE
	.incbin "fe6-base.gba", 0x68A3BE, 0x68A3D2 - 0x68A3BE

	.global Sprite_0868A3D2
Sprite_0868A3D2:	@ 0x68A3D2
	.incbin "fe6-base.gba", 0x68A3D2, 0x68A3E0 - 0x68A3D2

	.global Sprite_0868A3E0
Sprite_0868A3E0:	@ 0x68A3E0
	.incbin "fe6-base.gba", 0x68A3E0, 0x68A3FA - 0x68A3E0

	.global Sprite_0868A3FA
Sprite_0868A3FA:	@ 0x68A3FA
	.incbin "fe6-base.gba", 0x68A3FA, 0x68A414 - 0x68A3FA

	.global Sprite_0868A414
Sprite_0868A414:	@ 0x68A414
	.incbin "fe6-base.gba", 0x68A414, 0x68A42E - 0x68A414

	.global Sprite_0868A42E
Sprite_0868A42E:	@ 0x68A42E
	.incbin "fe6-base.gba", 0x68A42E, 0x68A448 - 0x68A42E

	.global Sprite_0868A448
Sprite_0868A448:	@ 0x68A448
	.incbin "fe6-base.gba", 0x68A448, 0x68A45C - 0x68A448

	.global Sprite_0868A45C
Sprite_0868A45C:	@ 0x68A45C
	.incbin "fe6-base.gba", 0x68A45C, 0x68A470 - 0x68A45C

	.global Sprite_0868A470
Sprite_0868A470:	@ 0x68A470
	.incbin "fe6-base.gba", 0x68A470, 0x68A484 - 0x68A470

	.global Sprite_0868A484
Sprite_0868A484:	@ 0x68A484
	.incbin "fe6-base.gba", 0x68A484, 0x68A4AA - 0x68A484

	.global Sprite_0868A4AA
Sprite_0868A4AA:	@ 0x68A4AA
	.incbin "fe6-base.gba", 0x68A4AA, 0x68A4D0 - 0x68A4AA

	.global Sprite_0868A4D0
Sprite_0868A4D0:	@ 0x68A4D0
	.incbin "fe6-base.gba", 0x68A4D0, 0x68A4F8 - 0x68A4D0

	.global Sprites_0868A4F8
Sprites_0868A4F8: @ 0868A4F8
	.4byte Sprite_0868A3E0
	.4byte 0x00000000
	.4byte Sprite_0868A3FA
	.4byte 0x00000000
	.4byte Sprite_0868A414
	.4byte 0x00000000
	.4byte Sprite_0868A42E
	.4byte 0x00000000

	.global Sprites_0868A518
Sprites_0868A518: @ 0868A518
	.4byte Sprite_0868A348
	.4byte 0x00000000
	.4byte Sprite_0868A362
	.4byte 0x00000000
	.4byte Sprite_0868A37C
	.4byte 0x00000010
	.4byte Sprite_0868A390
	.4byte 0x00000010
	.4byte Sprite_0868A3A4
	.4byte 0x00000000
	.4byte Sprite_0868A3BE
	.4byte 0x00000010
	.4byte Sprite_0868A3D2
	.4byte 0x00000018

	.global Sprites_0868A550
Sprites_0868A550: @ 0868A550
	.4byte Sprite_0868A484
	.4byte Sprite_0868A4AA
	.4byte Sprite_0868A4D0

	.global Sprites_0868A55C
Sprites_0868A55C: @ 0868A55C
	.4byte Sprite_0868A448
	.4byte Sprite_0868A45C
	.4byte Sprite_0868A470

	.global Sprite_0868A568
Sprite_0868A568: @ 0868A568
	.incbin "fe6-base.gba", 0x68A568, (0x68A570 - 0x68A568) @ length: 0008

	.global Sprite_0868A570
Sprite_0868A570: @ 0868A570
	.incbin "fe6-base.gba", 0x68A570, (0x68A58C - 0x68A570) @ length: 001C
