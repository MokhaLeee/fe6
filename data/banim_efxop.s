	.include "animscr.inc"
	.include "gba_sprites.inc"
	.section .data

	.global gClassReelSpellAnimFuncLut
gClassReelSpellAnimFuncLut: @ 085D3904
	.incbin "fe6-base.gba", 0x5D3904, (0x5D3924 - 0x5D3904) @ length: 0020

	.global ProcScr_EfxopFire
ProcScr_EfxopFire: @ 085D3924
	.incbin "fe6-base.gba", 0x5D3924, (0x5D394C - 0x5D3924) @ length: 0028

	.global ProcScr_EfxopFireBG
ProcScr_EfxopFireBG: @ 085D394C
	.incbin "fe6-base.gba", 0x5D394C, (0x5D3964 - 0x5D394C) @ length: 0018

	.global TsaArray_EfxopFireBG
TsaArray_EfxopFireBG: @ 085D3964
	.incbin "fe6-base.gba", 0x5D3964, (0x5D3994 - 0x5D3964) @ length: 0030

	.global ProcScr_EfxopFireOBJ
ProcScr_EfxopFireOBJ: @ 085D3994
	.incbin "fe6-base.gba", 0x5D3994, (0x5D39AC - 0x5D3994) @ length: 0018

	.global ProcScr_EfxopThunder
ProcScr_EfxopThunder: @ 085D39AC
	.incbin "fe6-base.gba", 0x5D39AC, (0x5D39D4 - 0x5D39AC) @ length: 0028

	.global ProcScr_EfxopThunderBG
ProcScr_EfxopThunderBG: @ 085D39D4
	.incbin "fe6-base.gba", 0x5D39D4, (0x5D39EC - 0x5D39D4) @ length: 0018

	.global TsaArray_EfxopThunderBG
TsaArray_EfxopThunderBG: @ 085D39EC
	.incbin "fe6-base.gba", 0x5D39EC, (0x5D39F4 - 0x5D39EC) @ length: 0008

	.global ProcScr_EfxopThunderBGCOL
ProcScr_EfxopThunderBGCOL: @ 085D39F4
	.incbin "fe6-base.gba", 0x5D39F4, (0x5D3A14 - 0x5D39F4) @ length: 0020

	.global ProcScr_EfxopThunderOBJ
ProcScr_EfxopThunderOBJ: @ 085D3A14
	.incbin "fe6-base.gba", 0x5D3A14, (0x5D3A2C - 0x5D3A14) @ length: 0018

	.global gUnk_085D3A2C
gUnk_085D3A2C: @ 085D3A2C
	.incbin "fe6-base.gba", 0x5D3A2C, (0x5D3A54 - 0x5D3A2C) @ length: 0028

	.global gUnk_085D3A54
gUnk_085D3A54: @ 085D3A54
	.incbin "fe6-base.gba", 0x5D3A54, (0x5D3A6C - 0x5D3A54) @ length: 0018

	.global gUnk_085D3A6C
gUnk_085D3A6C: @ 085D3A6C
	.incbin "fe6-base.gba", 0x5D3A6C, (0x5D3A70 - 0x5D3A6C) @ length: 0004

	.global gUnk_085D3A70
gUnk_085D3A70: @ 085D3A70
	.incbin "fe6-base.gba", 0x5D3A70, (0x5D3A90 - 0x5D3A70) @ length: 0020

	.global gUnk_085D3A90
gUnk_085D3A90: @ 085D3A90
	.incbin "fe6-base.gba", 0x5D3A90, (0x5D3AB0 - 0x5D3A90) @ length: 0020

	.global gUnk_085D3AB0
gUnk_085D3AB0: @ 085D3AB0
	.incbin "fe6-base.gba", 0x5D3AB0, (0x5D3AC8 - 0x5D3AB0)

