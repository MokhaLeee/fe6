	.data

	.global ProcScr_0868A634
ProcScr_0868A634: @ 0868A634
	.incbin "fe6-base.gba", 0x68A634, (0x68A644 - 0x68A634) @ length: 0010

	.global ProcScr_0868A644
ProcScr_0868A644: @ 0868A644
	.incbin "fe6-base.gba", 0x68A644, (0x68A664 - 0x68A644) @ length: 0020

	.global gUnk_0868A664
gUnk_0868A664: @ 0868A664
	.incbin "fe6-base.gba", 0x68A664, (0x68A988 - 0x68A664) @ length: 0324

	.global Sprite_0868A988
Sprite_0868A988: @ 0868A988
	.incbin "fe6-base.gba", 0x68A988, (0x68A998 - 0x68A988) @ length: 0010

	.global Imgs_0868A998
Imgs_0868A998: @ 0868A998
	.incbin "fe6-base.gba", 0x68A998, (0x68A9E8 - 0x68A998) @ length: 0050

	.global Sprite_0868A9E8
Sprite_0868A9E8: @ 0868A9E8
	.incbin "fe6-base.gba", 0x68A9E8, (0x68A9F0 - 0x68A9E8) @ length: 0008

	.global Sprite_0868A9F0
Sprite_0868A9F0: @ 0868A9F0
	.incbin "fe6-base.gba", 0x68A9F0, (0x68A9F8 - 0x68A9F0) @ length: 0008

	.global Sprite_0868A9F8
Sprite_0868A9F8: @ 0868A9F8
	.incbin "fe6-base.gba", 0x68A9F8, (0x68AA08 - 0x68A9F8) @ length: 0010

	.global ProcScr_SoundRoom
ProcScr_SoundRoom: @ 0868AA08
	.incbin "fe6-base.gba", 0x68AA08, (0x68AA80 - 0x68AA08) @ length: 0078

	.global ProcScr_0868AA80
ProcScr_0868AA80: @ 0868AA80
	.incbin "fe6-base.gba", 0x68AA80, (0x68AAA8 - 0x68AA80) @ length: 0028

	.global ProcScr_0868AAA8
ProcScr_0868AAA8: @ 0868AAA8
	.incbin "fe6-base.gba", 0x68AAA8, (0x68AAC8 - 0x68AAA8) @ length: 0020
