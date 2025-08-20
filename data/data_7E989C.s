    .data

    .incbin "fe6-base.gba", 0x7E989C, (0x7EA008 - 0x7E989C)

.global gBanimTerrainTable @ fe8: battle_terrain_table
gBanimTerrainTable:
    .incbin "fe6-base.gba", 0x7EA008, (0x7FC008 - 0x7EA008)

.global gBanimCharaPalTable
gBanimCharaPalTable:
    .incbin "fe6-base.gba", 0x7FC008, (0x7FF0A4 - 0x7FC008)
