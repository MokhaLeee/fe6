	.data

	.global gUnk_0868C414
gUnk_0868C414: @ 0868C414
	.incbin "fe6-base.gba", 0x68C414, (0x68C648 - 0x68C414) @ length: 0234

	.global ProcScr_0868C648
ProcScr_0868C648: @ 0868C648
	.incbin "fe6-base.gba", 0x68C648, (0x68C658 - 0x68C648) @ length: 0010

	.global ProcScr_0868C658
ProcScr_0868C658: @ 0868C658
	.incbin "fe6-base.gba", 0x68C658, (0x68C668 - 0x68C658) @ length: 0010

	.global ProcScr_0868C668
ProcScr_0868C668: @ 0868C668
	.incbin "fe6-base.gba", 0x68C668, (0x68C688 - 0x68C668) @ length: 0048

	.global ProcScr_0868C688
ProcScr_0868C688:
    .incbin "fe6-base.gba", 0x68C688, (0x68C6B0 - 0x68C688)

	.global Config_WMHighlight
Config_WMHighlight: @ 0868C6B0
	.incbin "fe6-base.gba", 0x68C6B0, (0x68C704 - 0x68C6B0) @ length: 0054

	.global ProcScr_WroldMapRmBorder
ProcScr_WroldMapRmBorder: @ 0868C704
	.incbin "fe6-base.gba", 0x68C704, (0x68C734 - 0x68C704) @ length: 0030

	.global gUnk_0868C734
gUnk_0868C734: @ 0868C734
	.incbin "fe6-base.gba", 0x68C734, (0x68C8D8 - 0x68C734) @ length: 01A4

	.global gUnk_0868C8D8
gUnk_0868C8D8: @ 0868C8D8
	.incbin "fe6-base.gba", 0x68C8D8, (0x68C940 - 0x68C8D8) @ length: 0068

	.global gUnk_0868C940
gUnk_0868C940: @ 0868C940
	.incbin "fe6-base.gba", 0x68C940, (0x68C970 - 0x68C940) @ length: 0030

	.global gUnk_0868C970
gUnk_0868C970: @ 0868C970
	.incbin "fe6-base.gba", 0x68C970, (0x68C988 - 0x68C970) @ length: 0018

	.global gUnk_0868C988
gUnk_0868C988: @ 0868C988
	.incbin "fe6-base.gba", 0x68C988, (0x68FDB4 - 0x68C988) @ length: 342C
