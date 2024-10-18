	.data

	.global Config_WmMapText
Config_WmMapText: @ 0868C734
	.incbin "fe6-base.gba", 0x68C734, (0x68C8D8 - 0x68C734) @ length: 01A4

	.global ProcScr_WmMapTextDisp
ProcScr_WmMapTextDisp: @ 0868C8D8
	.incbin "fe6-base.gba", 0x68C8D8, (0x68C940 - 0x68C8D8) @ length: 0068

	.global gUnk_0868C940
gUnk_0868C940: @ 0868C940
	.incbin "fe6-base.gba", 0x68C940, (0x68C970 - 0x68C940) @ length: 0030

	.global gUnk_0868C970
gUnk_0868C970: @ 0868C970
	.incbin "fe6-base.gba", 0x68C970, (0x68C988 - 0x68C970) @ length: 0018

	.global gUnk_0868C988
gUnk_0868C988: @ 0868C988
	.incbin "fe6-base.gba", 0x68C988, (0x68C9B8 - 0x68C988)
