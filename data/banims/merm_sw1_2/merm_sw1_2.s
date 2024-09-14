
.section .data.oamr
BANIM_OAMR_merm_sw1_2:
BANIM_OAMR_merm_sw1_2_0:
    ANIM_SPRITE ATTR0_WIDE, ATTR1_SIZE_8, 0x00BE, -9, 8
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_8, 0x007F, 7, 8
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_16, 0x00DC, -7, -16
    ANIM_SPRITE ATTR0_WIDE, ATTR1_SIZE_8, 0x009E, -7, 0
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_8, 0x003F, -2, -24
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_8, 0x005F, 9, -12
    ANIM_SPRITE_END
BANIM_OAMR_merm_sw1_2_1:
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_32, 0x003C, -9, -26
    ANIM_SPRITE ATTR0_WIDE, ATTR1_SIZE_8, 0x00BC, -9, 6
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_16, 0x001E, 7, -18
    ANIM_SPRITE_END
BANIM_OAMR_merm_sw1_2_2:
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_32, 0x0012, -10, -16
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_16, 0x0014, 6, -16
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_8, 0x0015, -5, -24
    ANIM_SPRITE_END
    ANIM_SPRITE_END
    ANIM_SPRITE_END
    ANIM_SPRITE_END
    ANIM_SPRITE_END
    ANIM_SPRITE_END
    ANIM_SPRITE_END
    ANIM_SPRITE_END
    ANIM_SPRITE_END
    ANIM_SPRITE_END
    ANIM_SPRITE_END
    ANIM_SPRITE_END

.section .data.oaml
BANIM_OAML_merm_sw1_2:
BANIM_OAML_merm_sw1_2_0:
    ANIM_SPRITE_XFLIP ATTR0_WIDE, ATTR1_SIZE_8, 0x00BE, -7, 8
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_8, 0x007F, -15, 8
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_16, 0x00DC, -9, -16
    ANIM_SPRITE_XFLIP ATTR0_WIDE, ATTR1_SIZE_8, 0x009E, -9, 0
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_8, 0x003F, -6, -24
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_8, 0x005F, -17, -12
    ANIM_SPRITE_END
BANIM_OAML_merm_sw1_2_1:
    ANIM_SPRITE_XFLIP ATTR0_TALL, ATTR1_SIZE_32, 0x003C, -7, -26
    ANIM_SPRITE_XFLIP ATTR0_WIDE, ATTR1_SIZE_8, 0x00BC, -7, 6
    ANIM_SPRITE_XFLIP ATTR0_TALL, ATTR1_SIZE_16, 0x001E, -15, -18
    ANIM_SPRITE_END
BANIM_OAML_merm_sw1_2_2:
    ANIM_SPRITE_XFLIP ATTR0_TALL, ATTR1_SIZE_32, 0x0012, -6, -16
    ANIM_SPRITE_XFLIP ATTR0_TALL, ATTR1_SIZE_16, 0x0014, -14, -16
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_8, 0x0015, -3, -24
    ANIM_SPRITE_END
    ANIM_SPRITE_END
    ANIM_SPRITE_END
    ANIM_SPRITE_END
    ANIM_SPRITE_END
    ANIM_SPRITE_END
    ANIM_SPRITE_END
    ANIM_SPRITE_END
    ANIM_SPRITE_END
    ANIM_SPRITE_END
    ANIM_SPRITE_END
    ANIM_SPRITE_END

.section .data.script
BANIM_SCR_merm_sw1_2
BANIM_SCR_merm_sw1_2_NORMAL_ATK:
    ANIMSCR_FRAME 0x04, 0x086B5608, 0x00, 0x0000
    ANIMSCR_BLOCKED

BANIM_SCR_merm_sw1_2_NORMAL_ATK_PRIORITY_L:
    ANIMSCR_FRAME 0x04, 0x086B5608, 0x00, 0x0000
    ANIMSCR_BLOCKED

BANIM_SCR_merm_sw1_2_CRIT_ATK:
    ANIMSCR_FRAME 0x04, 0x086B5608, 0x00, 0x0000
    ANIMSCR_BLOCKED

BANIM_SCR_merm_sw1_2_CRIT_ATK_PRIORITY_L:
    ANIMSCR_FRAME 0x04, 0x086B5608, 0x00, 0x0000
    ANIMSCR_BLOCKED

BANIM_SCR_merm_sw1_2_RANGED_ATK:
    ANIMSCR_FRAME 0x04, 0x086B5608, 0x00, 0x0000
    ANIMSCR_BLOCKED

BANIM_SCR_merm_sw1_2_RANGED_CRIT_ATK:
    ANIMSCR_FRAME 0x04, 0x086B5608, 0x00, 0x0000
    ANIMSCR_BLOCKED

BANIM_SCR_merm_sw1_2_CLOSE_DODGE:
    ANIMSCR_CMD 0x02
    ANIMSCR_FRAME 0x01, 0x086B5608, 0x00, 0x0000
    ANIMSCR_FRAME 0x02, 0x086B5608, 0x01, 0x0054
    ANIMSCR_FRAME 0x01, 0x086B67FC, 0x02, 0x0084
    ANIMSCR_CMD 0x01
    ANIMSCR_FRAME 0x02, 0x086B5608, 0x01, 0x0054
    ANIMSCR_CMD 0x0D
    ANIMSCR_BLOCKED

BANIM_SCR_merm_sw1_2_RANGED_DODGE:
    ANIMSCR_CMD 0x02
    ANIMSCR_FRAME 0x01, 0x086B5608, 0x00, 0x0000
    ANIMSCR_FRAME 0x02, 0x086B5608, 0x01, 0x0054
    ANIMSCR_FRAME 0x01, 0x086B67FC, 0x02, 0x0084
    ANIMSCR_CMD 0x01
    ANIMSCR_FRAME 0x02, 0x086B5608, 0x01, 0x0054
    ANIMSCR_CMD 0x0D
    ANIMSCR_BLOCKED

BANIM_SCR_merm_sw1_2_STANDING:
    ANIMSCR_FRAME 0x01, 0x086B5608, 0x00, 0x0000
    ANIMSCR_CMD 0x01
    ANIMSCR_BLOCKED

BANIM_SCR_merm_sw1_2_STANDING2:
    ANIMSCR_FRAME 0x01, 0x086B5608, 0x00, 0x0000
    ANIMSCR_CMD 0x01
    ANIMSCR_BLOCKED

BANIM_SCR_merm_sw1_2_RANGED_STANDING:
    ANIMSCR_FRAME 0x01, 0x086B5608, 0x00, 0x0000
    ANIMSCR_CMD 0x01
    ANIMSCR_BLOCKED

BANIM_SCR_merm_sw1_2_MISSED_ATK:
    ANIMSCR_FRAME 0x04, 0x086B5608, 0x00, 0x0000
    ANIMSCR_BLOCKED


.section .data.modes
    .word BANIM_SCR_merm_sw1_2_NORMAL_ATK - BANIM_SCR_merm_sw1_2_START @ 0x0
    .word BANIM_SCR_merm_sw1_2_NORMAL_ATK_PRIORITY_L - BANIM_SCR_merm_sw1_2_START @ 0x10
    .word BANIM_SCR_merm_sw1_2_CRIT_ATK - BANIM_SCR_merm_sw1_2_START @ 0x20
    .word BANIM_SCR_merm_sw1_2_CRIT_ATK_PRIORITY_L - BANIM_SCR_merm_sw1_2_START @ 0x30
    .word BANIM_SCR_merm_sw1_2_RANGED_ATK - BANIM_SCR_merm_sw1_2_START @ 0x40
    .word BANIM_SCR_merm_sw1_2_RANGED_CRIT_ATK - BANIM_SCR_merm_sw1_2_START @ 0x50
    .word BANIM_SCR_merm_sw1_2_CLOSE_DODGE - BANIM_SCR_merm_sw1_2_START @ 0x60
    .word BANIM_SCR_merm_sw1_2_RANGED_DODGE - BANIM_SCR_merm_sw1_2_START @ 0xA0
    .word BANIM_SCR_merm_sw1_2_STANDING - BANIM_SCR_merm_sw1_2_START @ 0xE0
    .word BANIM_SCR_merm_sw1_2_STANDING2 - BANIM_SCR_merm_sw1_2_START @ 0xF4
    .word BANIM_SCR_merm_sw1_2_RANGED_STANDING - BANIM_SCR_merm_sw1_2_START @ 0x108
    .word BANIM_SCR_merm_sw1_2_MISSED_ATK - BANIM_SCR_merm_sw1_2_START @ 0x11C
    .word 0
    .word 0
    .word 0
    .word 0
    .word 0
    .word 0
    .word 0
    .word 0
    .word 0
    .word 0
    .word 0
    .word 0

.section .data.frames
