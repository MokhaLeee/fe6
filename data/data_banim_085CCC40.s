	.include "animscr.inc"
	.section .data

	.global gUnk_085CCC40
gUnk_085CCC40: @ 085CCC40
	.incbin "fe6-base.gba", 0x5CCC40, (0x5CCDAC - 0x5CCC40) @ length: 016C

	.global gUnk_085CCDAC
gUnk_085CCDAC: @ 085CCDAC
	.incbin "fe6-base.gba", 0x5CCDAC, (0x5CCE38 - 0x5CCDAC) @ length: 008C

	.global gUnk_085CCE38
gUnk_085CCE38: @ 085CCE38
	.incbin "fe6-base.gba", 0x5CCE38, (0x5CCEB8 - 0x5CCE38) @ length: 0080

	.global gUnk_085CCEB8
gUnk_085CCEB8: @ 085CCEB8
	.incbin "fe6-base.gba", 0x5CCEB8, (0x5CCF38 - 0x5CCEB8) @ length: 0080

	.global gUnk_085CCF38
gUnk_085CCF38: @ 085CCF38
	.incbin "fe6-base.gba", 0x5CCF38, (0x5CDCA4 - 0x5CCF38) @ length: 0D6C

	.global gUnk_085CDCA4
gUnk_085CDCA4: @ 085CDCA4
	.incbin "fe6-base.gba", 0x5CDCA4, (0x5CDD18 - 0x5CDCA4) @ length: 0074

	.global gUnk_085CDD18
gUnk_085CDD18: @ 085CDD18
	.incbin "fe6-base.gba", 0x5CDD18, (0x5D0DA0 - 0x5CDD18) @ length: 3088
