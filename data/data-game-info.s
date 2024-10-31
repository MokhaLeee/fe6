    .data

    .global UnitSpriteTable
UnitSpriteTable: @ 08662C14
    .incbin "fe6-base.gba", 0x662C14, (0x662E4C - 0x662C14) @ length: 0238

    .global gSpellAssoc
gSpellAssoc: @ 08662E4C
    .incbin "fe6-base.gba", 0x662E4C, (0x66350C - 0x662E4C) @ length: 06C0

    .global AffinityBonuses
AffinityBonuses: @ 0866350C
    .incbin "fe6-base.gba", 0x66350C, (0x66354C - 0x66350C) @ length: 0040

    .global gCreditInfo
gCreditInfo: @ 0866354C
    .incbin "fe6-base.gba", 0x66354C, (0x6637A4 - 0x66354C) @ length: 0258

    .global ChapterInfoTable
ChapterInfoTable: @ 086637A4
    .incbin "fe6-base.gba", 0x6637A4, (0x664398 - 0x6637A4) @ length: 0BF4

    .global ChapterAssets
ChapterAssets: @ 08664398
    .incbin "fe6-base.gba", 0x664398, (0x66472C - 0x664398) @ length: 0394
