.include "macro.inc"
.include "animscr.inc"
.include "gba_sprites.inc"

.section .data.oamr
OAMR:
OAMR_0:
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_32, 0x009A, -16, -40
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_16, 0x009C, 0, -40
    ANIM_SPRITE ATTR0_WIDE, ATTR1_SIZE_8, 0x0080, -32, -16
    ANIM_SPRITE ATTR0_WIDE, ATTR1_SIZE_16, 0x00A0, -32, -8
    ANIM_SPRITE ATTR0_WIDE, ATTR1_SIZE_8, 0x00A4, 0, -8
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_8, 0x00A6, 16, -8
    ANIM_SPRITE ATTR0_WIDE, ATTR1_SIZE_32, 0x00C2, -16, 0
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_16, 0x00C6, 16, 0
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_8, 0x0020, 32, 0
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_8, 0x0000, 40, -1
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_16, 0x0040, 48, -13
    ANIM_SPRITE ATTR0_WIDE, ATTR1_SIZE_8, 0x0085, 8, -16
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_32, 0x0005, 8, -48
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_16, 0x0007, 24, -48
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x0001, -24, -48
    ANIM_SPRITE ATTR0_WIDE, ATTR1_SIZE_8, 0x0002, -16, -48
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_8, 0x0004, 0, -48
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_8, 0x00C0, 32, -48
    ANIM_SPRITE ATTR0_WIDE, ATTR1_SIZE_32, 0x0008, -16, -64
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_16, 0x000C, 16, -64
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x000E, 32, -64
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_8, 0x00A7, 40, -72
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_8, 0x0087, 0, -72
    ANIM_SPRITE ATTR0_WIDE, ATTR1_SIZE_8, 0x00E0, 24, -72
    ANIM_SPRITE_END
OAMR_1:
    ANIM_SPRITE ATTR0_WIDE, ATTR1_SIZE_32, 0x0080, -32, -16
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_16, 0x0084, 0, -16
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x0086, 16, -16
    ANIM_SPRITE ATTR0_WIDE, ATTR1_SIZE_32, 0x00C2, -16, 0
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_16, 0x00C6, 16, 0
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_32, 0x0002, -16, -48
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_16, 0x0006, 16, -48
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x0001, -24, -48
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_8, 0x0041, -24, -32
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x0007, 24, -48
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_16, 0x0008, -19, -64
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_8, 0x0047, -11, -72
    ANIM_SPRITE ATTR0_WIDE, ATTR1_SIZE_16, 0x0049, 0, -56
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_16, 0x000A, 8, -72
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x000C, 24, -72
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_8, 0x000D, 32, -72
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_8, 0x0048, 32, -80
    ANIM_SPRITE ATTR0_WIDE, ATTR1_SIZE_8, 0x0060, 32, 0
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_8, 0x0040, 32, -48
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_16, 0x0070, 40, -16
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x002D, 24, -32
    ANIM_SPRITE_END
OAMR_2:
    ANIM_SPRITE ATTR0_WIDE, ATTR1_SIZE_32, 0x0087, -32, -16
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_16, 0x008B, 0, -16
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x008D, 16, -16
    ANIM_SPRITE ATTR0_WIDE, ATTR1_SIZE_32, 0x00C9, -16, 0
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x00CD, 16, 0
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_8, 0x00E8, -24, 8
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x0072, 24, 0
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_8, 0x0067, 32, 0
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_16, 0x00C0, 24, -16
    ANIM_SPRITE ATTR0_WIDE, ATTR1_SIZE_16, 0x0069, -16, -24
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_8, 0x006D, 16, -24
    ANIM_SPRITE ATTR0_WIDE, ATTR1_SIZE_32, 0x000E, -32, -48
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_16, 0x0012, 0, -48
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x0014, 16, -48
    ANIM_SPRITE ATTR0_WIDE, ATTR1_SIZE_16, 0x004E, -32, -32
    ANIM_SPRITE ATTR0_WIDE, ATTR1_SIZE_8, 0x0052, 0, -32
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_8, 0x0054, 16, -32
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_16, 0x00B0, 0, -72
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x00B2, 16, -72
    ANIM_SPRITE ATTR0_WIDE, ATTR1_SIZE_8, 0x00F0, 0, -56
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_8, 0x00F2, 16, -56
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_8, 0x00EF, -8, -56
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_8, 0x00CF, 24, -48
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x0073, 24, -80
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_16, 0x006E, -26, -72
    ANIM_SPRITE ATTR0_WIDE, ATTR1_SIZE_8, 0x00AE, -26, -56
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
OAML:
OAML_0:
    ANIM_SPRITE_XFLIP ATTR0_TALL, ATTR1_SIZE_32, 0x009A, 0, -40
    ANIM_SPRITE_XFLIP ATTR0_TALL, ATTR1_SIZE_16, 0x009C, -8, -40
    ANIM_SPRITE_XFLIP ATTR0_WIDE, ATTR1_SIZE_8, 0x0080, 16, -16
    ANIM_SPRITE_XFLIP ATTR0_WIDE, ATTR1_SIZE_16, 0x00A0, 0, -8
    ANIM_SPRITE_XFLIP ATTR0_WIDE, ATTR1_SIZE_8, 0x00A4, -16, -8
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_8, 0x00A6, -24, -8
    ANIM_SPRITE_XFLIP ATTR0_WIDE, ATTR1_SIZE_32, 0x00C2, -16, 0
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_16, 0x00C6, -32, 0
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_8, 0x0020, -40, 0
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_8, 0x0000, -48, -1
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_16, 0x0040, -64, -13
    ANIM_SPRITE_XFLIP ATTR0_WIDE, ATTR1_SIZE_8, 0x0085, -24, -16
    ANIM_SPRITE_XFLIP ATTR0_TALL, ATTR1_SIZE_32, 0x0005, -24, -48
    ANIM_SPRITE_XFLIP ATTR0_TALL, ATTR1_SIZE_16, 0x0007, -32, -48
    ANIM_SPRITE_XFLIP ATTR0_TALL, ATTR1_SIZE_8, 0x0001, 16, -48
    ANIM_SPRITE_XFLIP ATTR0_WIDE, ATTR1_SIZE_8, 0x0002, 0, -48
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_8, 0x0004, -8, -48
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_8, 0x00C0, -40, -48
    ANIM_SPRITE_XFLIP ATTR0_WIDE, ATTR1_SIZE_32, 0x0008, -16, -64
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_16, 0x000C, -32, -64
    ANIM_SPRITE_XFLIP ATTR0_TALL, ATTR1_SIZE_8, 0x000E, -40, -64
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_8, 0x00A7, -48, -72
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_8, 0x0087, -8, -72
    ANIM_SPRITE_XFLIP ATTR0_WIDE, ATTR1_SIZE_8, 0x00E0, -40, -72
    ANIM_SPRITE_END
OAML_1:
    ANIM_SPRITE_XFLIP ATTR0_WIDE, ATTR1_SIZE_32, 0x0080, 0, -16
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_16, 0x0084, -16, -16
    ANIM_SPRITE_XFLIP ATTR0_TALL, ATTR1_SIZE_8, 0x0086, -24, -16
    ANIM_SPRITE_XFLIP ATTR0_WIDE, ATTR1_SIZE_32, 0x00C2, -16, 0
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_16, 0x00C6, -32, 0
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_32, 0x0002, -16, -48
    ANIM_SPRITE_XFLIP ATTR0_TALL, ATTR1_SIZE_16, 0x0006, -24, -48
    ANIM_SPRITE_XFLIP ATTR0_TALL, ATTR1_SIZE_8, 0x0001, 16, -48
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_8, 0x0041, 16, -32
    ANIM_SPRITE_XFLIP ATTR0_TALL, ATTR1_SIZE_8, 0x0007, -32, -48
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_16, 0x0008, 3, -64
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_8, 0x0047, 3, -72
    ANIM_SPRITE_XFLIP ATTR0_WIDE, ATTR1_SIZE_16, 0x0049, -32, -56
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_16, 0x000A, -24, -72
    ANIM_SPRITE_XFLIP ATTR0_TALL, ATTR1_SIZE_8, 0x000C, -32, -72
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_8, 0x000D, -40, -72
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_8, 0x0048, -40, -80
    ANIM_SPRITE_XFLIP ATTR0_WIDE, ATTR1_SIZE_8, 0x0060, -48, 0
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_8, 0x0040, -40, -48
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_16, 0x0070, -56, -16
    ANIM_SPRITE_XFLIP ATTR0_TALL, ATTR1_SIZE_8, 0x002D, -32, -32
    ANIM_SPRITE_END
OAML_2:
    ANIM_SPRITE_XFLIP ATTR0_WIDE, ATTR1_SIZE_32, 0x0087, 0, -16
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_16, 0x008B, -16, -16
    ANIM_SPRITE_XFLIP ATTR0_TALL, ATTR1_SIZE_8, 0x008D, -24, -16
    ANIM_SPRITE_XFLIP ATTR0_WIDE, ATTR1_SIZE_32, 0x00C9, -16, 0
    ANIM_SPRITE_XFLIP ATTR0_TALL, ATTR1_SIZE_8, 0x00CD, -24, 0
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_8, 0x00E8, 16, 8
    ANIM_SPRITE_XFLIP ATTR0_TALL, ATTR1_SIZE_8, 0x0072, -32, 0
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_8, 0x0067, -40, 0
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_16, 0x00C0, -40, -16
    ANIM_SPRITE_XFLIP ATTR0_WIDE, ATTR1_SIZE_16, 0x0069, -16, -24
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_8, 0x006D, -24, -24
    ANIM_SPRITE_XFLIP ATTR0_WIDE, ATTR1_SIZE_32, 0x000E, 0, -48
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_16, 0x0012, -16, -48
    ANIM_SPRITE_XFLIP ATTR0_TALL, ATTR1_SIZE_8, 0x0014, -24, -48
    ANIM_SPRITE_XFLIP ATTR0_WIDE, ATTR1_SIZE_16, 0x004E, 0, -32
    ANIM_SPRITE_XFLIP ATTR0_WIDE, ATTR1_SIZE_8, 0x0052, -16, -32
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_8, 0x0054, -24, -32
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_16, 0x00B0, -16, -72
    ANIM_SPRITE_XFLIP ATTR0_TALL, ATTR1_SIZE_8, 0x00B2, -24, -72
    ANIM_SPRITE_XFLIP ATTR0_WIDE, ATTR1_SIZE_8, 0x00F0, -16, -56
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_8, 0x00F2, -24, -56
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_8, 0x00EF, 0, -56
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_8, 0x00CF, -32, -48
    ANIM_SPRITE_XFLIP ATTR0_TALL, ATTR1_SIZE_8, 0x0073, -32, -80
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_16, 0x006E, 10, -72
    ANIM_SPRITE_XFLIP ATTR0_WIDE, ATTR1_SIZE_8, 0x00AE, 10, -56
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
SCR:
SCR_NORMAL_ATK:
    ANIMSCR_CMD 0x02
    ANIMSCR_FRAME 0x01, BANIM_IMG_drmm_sp1_0, 0x00, OAMR_0 - OAMR
    ANIMSCR_CMD 0x0E
    ANIMSCR_FRAME 0x03, BANIM_IMG_drmm_sp1_3_1, 0x01, OAMR_1 - OAMR
    ANIMSCR_FRAME 0x01, BANIM_IMG_drmm_sp1_3_1, 0x02, OAMR_2 - OAMR
    ANIMSCR_CMD 0x01
    ANIMSCR_FRAME 0x03, BANIM_IMG_drmm_sp1_3_1, 0x01, OAMR_1 - OAMR
    ANIMSCR_CMD 0x0D
    ANIMSCR_BLOCKED

SCR_NORMAL_ATK_PRIORITY_L:
    ANIMSCR_CMD 0x02
    ANIMSCR_FRAME 0x01, BANIM_IMG_drmm_sp1_0, 0x00, OAMR_0 - OAMR
    ANIMSCR_CMD 0x0E
    ANIMSCR_FRAME 0x03, BANIM_IMG_drmm_sp1_3_1, 0x01, OAMR_1 - OAMR
    ANIMSCR_FRAME 0x01, BANIM_IMG_drmm_sp1_3_1, 0x02, OAMR_2 - OAMR
    ANIMSCR_CMD 0x01
    ANIMSCR_FRAME 0x03, BANIM_IMG_drmm_sp1_3_1, 0x01, OAMR_1 - OAMR
    ANIMSCR_CMD 0x0D
    ANIMSCR_BLOCKED

SCR_CRIT_ATK:
    ANIMSCR_CMD 0x02
    ANIMSCR_FRAME 0x01, BANIM_IMG_drmm_sp1_0, 0x00, OAMR_0 - OAMR
    ANIMSCR_CMD 0x0E
    ANIMSCR_FRAME 0x03, BANIM_IMG_drmm_sp1_3_1, 0x01, OAMR_1 - OAMR
    ANIMSCR_FRAME 0x01, BANIM_IMG_drmm_sp1_3_1, 0x02, OAMR_2 - OAMR
    ANIMSCR_CMD 0x01
    ANIMSCR_FRAME 0x03, BANIM_IMG_drmm_sp1_3_1, 0x01, OAMR_1 - OAMR
    ANIMSCR_CMD 0x0D
    ANIMSCR_BLOCKED

SCR_CRIT_ATK_PRIORITY_L:
    ANIMSCR_CMD 0x02
    ANIMSCR_FRAME 0x01, BANIM_IMG_drmm_sp1_0, 0x00, OAMR_0 - OAMR
    ANIMSCR_CMD 0x0E
    ANIMSCR_FRAME 0x03, BANIM_IMG_drmm_sp1_3_1, 0x01, OAMR_1 - OAMR
    ANIMSCR_FRAME 0x01, BANIM_IMG_drmm_sp1_3_1, 0x02, OAMR_2 - OAMR
    ANIMSCR_CMD 0x01
    ANIMSCR_FRAME 0x03, BANIM_IMG_drmm_sp1_3_1, 0x01, OAMR_1 - OAMR
    ANIMSCR_CMD 0x0D
    ANIMSCR_BLOCKED

SCR_RANGED_ATK:
    ANIMSCR_CMD 0x02
    ANIMSCR_FRAME 0x01, BANIM_IMG_drmm_sp1_0, 0x00, OAMR_0 - OAMR
    ANIMSCR_CMD 0x0E
    ANIMSCR_FRAME 0x03, BANIM_IMG_drmm_sp1_3_1, 0x01, OAMR_1 - OAMR
    ANIMSCR_FRAME 0x01, BANIM_IMG_drmm_sp1_3_1, 0x02, OAMR_2 - OAMR
    ANIMSCR_CMD 0x01
    ANIMSCR_FRAME 0x03, BANIM_IMG_drmm_sp1_3_1, 0x01, OAMR_1 - OAMR
    ANIMSCR_CMD 0x0D
    ANIMSCR_BLOCKED

SCR_RANGED_CRIT_ATK:
    ANIMSCR_CMD 0x02
    ANIMSCR_FRAME 0x01, BANIM_IMG_drmm_sp1_0, 0x00, OAMR_0 - OAMR
    ANIMSCR_CMD 0x0E
    ANIMSCR_FRAME 0x03, BANIM_IMG_drmm_sp1_3_1, 0x01, OAMR_1 - OAMR
    ANIMSCR_FRAME 0x01, BANIM_IMG_drmm_sp1_3_1, 0x02, OAMR_2 - OAMR
    ANIMSCR_CMD 0x01
    ANIMSCR_FRAME 0x03, BANIM_IMG_drmm_sp1_3_1, 0x01, OAMR_1 - OAMR
    ANIMSCR_CMD 0x0D
    ANIMSCR_BLOCKED

SCR_CLOSE_DODGE:
    ANIMSCR_CMD 0x02
    ANIMSCR_FRAME 0x01, BANIM_IMG_drmm_sp1_0, 0x00, OAMR_0 - OAMR
    ANIMSCR_CMD 0x0E
    ANIMSCR_FRAME 0x03, BANIM_IMG_drmm_sp1_3_1, 0x01, OAMR_1 - OAMR
    ANIMSCR_FRAME 0x01, BANIM_IMG_drmm_sp1_3_1, 0x02, OAMR_2 - OAMR
    ANIMSCR_CMD 0x01
    ANIMSCR_FRAME 0x03, BANIM_IMG_drmm_sp1_3_1, 0x01, OAMR_1 - OAMR
    ANIMSCR_CMD 0x0D
    ANIMSCR_BLOCKED

SCR_RANGED_DODGE:
    ANIMSCR_CMD 0x02
    ANIMSCR_FRAME 0x01, BANIM_IMG_drmm_sp1_0, 0x00, OAMR_0 - OAMR
    ANIMSCR_CMD 0x0E
    ANIMSCR_FRAME 0x03, BANIM_IMG_drmm_sp1_3_1, 0x01, OAMR_1 - OAMR
    ANIMSCR_FRAME 0x01, BANIM_IMG_drmm_sp1_3_1, 0x02, OAMR_2 - OAMR
    ANIMSCR_CMD 0x01
    ANIMSCR_FRAME 0x03, BANIM_IMG_drmm_sp1_3_1, 0x01, OAMR_1 - OAMR
    ANIMSCR_CMD 0x0D
    ANIMSCR_BLOCKED

SCR_STANDING:
    ANIMSCR_FRAME 0x01, BANIM_IMG_drmm_sp1_0, 0x00, OAMR_0 - OAMR
    ANIMSCR_CMD 0x01
    ANIMSCR_BLOCKED

SCR_STANDING2:
    ANIMSCR_FRAME 0x01, BANIM_IMG_drmm_sp1_0, 0x00, OAMR_0 - OAMR
    ANIMSCR_CMD 0x01
    ANIMSCR_BLOCKED

SCR_RANGED_STANDING:
    ANIMSCR_FRAME 0x01, BANIM_IMG_drmm_sp1_0, 0x00, OAMR_0 - OAMR
    ANIMSCR_CMD 0x01
    ANIMSCR_BLOCKED

SCR_MISSED_ATK:
    ANIMSCR_CMD 0x02
    ANIMSCR_FRAME 0x01, BANIM_IMG_drmm_sp1_0, 0x00, OAMR_0 - OAMR
    ANIMSCR_CMD 0x0E
    ANIMSCR_FRAME 0x03, BANIM_IMG_drmm_sp1_3_1, 0x01, OAMR_1 - OAMR
    ANIMSCR_FRAME 0x01, BANIM_IMG_drmm_sp1_3_1, 0x02, OAMR_2 - OAMR
    ANIMSCR_CMD 0x01
    ANIMSCR_FRAME 0x03, BANIM_IMG_drmm_sp1_3_1, 0x01, OAMR_1 - OAMR
    ANIMSCR_CMD 0x0D
    ANIMSCR_BLOCKED


.section .data.modes
    .word SCR_NORMAL_ATK - SCR
    .word SCR_NORMAL_ATK_PRIORITY_L - SCR
    .word SCR_CRIT_ATK - SCR
    .word SCR_CRIT_ATK_PRIORITY_L - SCR
    .word SCR_RANGED_ATK - SCR
    .word SCR_RANGED_CRIT_ATK - SCR
    .word SCR_CLOSE_DODGE - SCR
    .word SCR_RANGED_DODGE - SCR
    .word SCR_STANDING - SCR
    .word SCR_STANDING2 - SCR
    .word SCR_RANGED_STANDING - SCR
    .word SCR_MISSED_ATK - SCR
    .word 0x0
    .word 0x0
    .word 0x0
    .word 0x0
    .word 0x0
    .word 0x0
    .word 0x0
    .word 0x0
    .word 0x0
    .word 0x0
    .word 0x0
    .word 0x0
