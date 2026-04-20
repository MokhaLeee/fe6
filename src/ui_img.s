	.section .rodata

	.global Img_UiWindowFrame_ThemeBlue
Img_UiWindowFrame_ThemeBlue: @ 0810F744
	.incbin "data/ui/Img_UiWindowFrame_ThemeBlue.4bpp.lz"

	.global Pal_UiWindowFrame_ThemeBlue
Pal_UiWindowFrame_ThemeBlue: @ 0810FF78
	.incbin "data/ui/Img_UiWindowFrame_ThemeBlue.gbapal", 0, 0x20

	.global Pal_UiStatBar_ThemeBlue
Pal_UiStatBar_ThemeBlue: @ 0810FF98
	.incbin "data/ui/Img_UiStatBarRef1.gbapal", 0, 0x20

	.global Img_UiWindowFrame_ThemeRed
Img_UiWindowFrame_ThemeRed: @ 0810FFB8
	.incbin "data/ui/Img_UiWindowFrame_ThemeRed.4bpp.lz"

	.global Pal_UiWindowFrame_ThemeRed
Pal_UiWindowFrame_ThemeRed: @ 08110838
	.incbin "data/ui/Img_UiWindowFrame_ThemeRed.gbapal", 0, 0x20

	.global Pal_UiStatBar_ThemeRed
Pal_UiStatBar_ThemeRed: @ 08110858
	.incbin "data/ui/Img_UiStatBarRef2.gbapal", 0, 0x20

	.global Img_UiWindowFrame_ThemeGray
Img_UiWindowFrame_ThemeGray: @ 08110878
	.incbin "data/ui/Img_UiWindowFrame_ThemeGray.4bpp.lz"

	.global Pal_UiWindowFrame_ThemeGray
Pal_UiWindowFrame_ThemeGray: @ 08111110
	.incbin "data/ui/Img_UiWindowFrame_ThemeGray.gbapal", 0, 0x20

	.global Pal_UiStatBar_ThemeGray
Pal_UiStatBar_ThemeGray: @ 08111130
	.incbin "data/ui/Img_UiStatBarRef3.gbapal", 0, 0x20

	.global Img_UiWindowFrame_ThemeGreen
Img_UiWindowFrame_ThemeGreen: @ 08111150
	.incbin "data/ui/Img_UiWindowFrame_ThemeGreen.4bpp.lz"

	.global Pal_UiWindowFrame_ThemeGreen
Pal_UiWindowFrame_ThemeGreen: @ 08111930
	.incbin "data/ui/Img_UiWindowFrame_ThemeGreen.gbapal", 0, 0x20

	.global Pal_UiStatBar_ThemeGreen
Pal_UiStatBar_ThemeGreen: @ 08111950
	.incbin "data/ui/Img_UiStatBarRef4.gbapal", 0, 0x20

	.global Img_UiUnitNameFrame
Img_UiUnitNameFrame: @ 08111970
	.incbin "data/ui/Img_UiUnitNameFrame1.4bpp.lz"

	.global Pal_UiUnitNameFrame
Pal_UiUnitNameFrame: @ 08111BC4
	.incbin "data/ui/Img_UiUnitNameFrame1.gbapal", 0, 0x20
	.incbin "data/ui/Img_UiUnitNameFrame2.gbapal", 0, 0x20
	.incbin "data/ui/Img_UiUnitNameFrame3.gbapal", 0, 0x20
	.incbin "data/ui/Img_UiUnitNameFrame4.gbapal", 0, 0x20
