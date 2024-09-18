.include "macro.inc"
.include "animscr.inc"
.include "gba_sprites.inc"

.section .data.oamr
.global BANIM_OAMR_notm_ar1_2
BANIM_OAMR_notm_ar1_2:
OAMR:
OAMR_0:
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_16, 0x0040, -9, -16
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_8, 0x0080, -7, 0
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_32, 0x0023, -10, -15
    ANIM_SPRITE ATTR0_WIDE, ATTR1_SIZE_8, 0x0005, 6, -23
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x00BA, -11, -15
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_8, 0x00FA, -11, 1
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_16, 0x0000, -9, -32
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x0002, 7, -32
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_8, 0x0042, 2, -40
    ANIM_SPRITE_END
OAMR_1:
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_16, 0x00CD, -12, -15
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_32, 0x001C, -11, -17
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_16, 0x001B, -19, -17
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_8, 0x003A, 5, -25
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_8, 0x005A, 13, -25
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_16, 0x009C, -6, -28
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x009B, -14, -28
    ANIM_SPRITE ATTR0_WIDE, ATTR1_SIZE_8, 0x00BE, -2, -36
    ANIM_SPRITE_END
OAMR_2:
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_16, 0x00CD, -16, -17
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_32, 0x0015, -21, -15
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x0019, 11, -15
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_8, 0x0079, 11, 9
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_8, 0x0059, -29, -7
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_16, 0x00D9, 3, -31
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_8, 0x001A, -5, -23
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_16, 0x009C, -10, -30
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x009B, -18, -30
    ANIM_SPRITE ATTR0_WIDE, ATTR1_SIZE_8, 0x00BE, -6, -38
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
.global BANIM_OAML_notm_ar1_2
BANIM_OAML_notm_ar1_2:
OAML:
OAML_0:
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_16, 0x0040, -7, -16
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_8, 0x0080, -1, 0
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_32, 0x0023, -22, -15
    ANIM_SPRITE_XFLIP ATTR0_WIDE, ATTR1_SIZE_8, 0x0005, -22, -23
    ANIM_SPRITE_XFLIP ATTR0_TALL, ATTR1_SIZE_8, 0x00BA, 3, -15
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_8, 0x00FA, 3, 1
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_16, 0x0000, -7, -32
    ANIM_SPRITE_XFLIP ATTR0_TALL, ATTR1_SIZE_8, 0x0002, -15, -32
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_8, 0x0042, -10, -40
    ANIM_SPRITE_END
OAML_1:
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_16, 0x00CD, -4, -15
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_32, 0x001C, -21, -17
    ANIM_SPRITE_XFLIP ATTR0_TALL, ATTR1_SIZE_16, 0x001B, 11, -17
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_8, 0x003A, -13, -25
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_8, 0x005A, -21, -25
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_16, 0x009C, -10, -28
    ANIM_SPRITE_XFLIP ATTR0_TALL, ATTR1_SIZE_8, 0x009B, 6, -28
    ANIM_SPRITE_XFLIP ATTR0_WIDE, ATTR1_SIZE_8, 0x00BE, -14, -36
    ANIM_SPRITE_END
OAML_2:
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_16, 0x00CD, 0, -17
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_32, 0x0015, -11, -15
    ANIM_SPRITE_XFLIP ATTR0_TALL, ATTR1_SIZE_8, 0x0019, -19, -15
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_8, 0x0079, -19, 9
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_8, 0x0059, 21, -7
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_16, 0x00D9, -19, -31
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_8, 0x001A, -3, -23
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_16, 0x009C, -6, -30
    ANIM_SPRITE_XFLIP ATTR0_TALL, ATTR1_SIZE_8, 0x009B, 10, -30
    ANIM_SPRITE_XFLIP ATTR0_WIDE, ATTR1_SIZE_8, 0x00BE, -10, -38
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
.global BANIM_SCR_notm_ar1_2
BANIM_SCR_notm_ar1_2:
SCR:
SCR_NORMAL_ATK:
    ANIMSCR_FRAME 0x04, _data_BANIM_IMG_notm_ar1_0_start, 0x00, OAMR_0 - OAMR
    ANIMSCR_CMD 0x01
    ANIMSCR_BLOCKED

SCR_NORMAL_ATK_PRIORITY_L:
    ANIMSCR_FRAME 0x04, _data_BANIM_IMG_notm_ar1_0_start, 0x00, OAMR_0 - OAMR
    ANIMSCR_CMD 0x01
    ANIMSCR_BLOCKED

SCR_CRIT_ATK:
    ANIMSCR_FRAME 0x04, _data_BANIM_IMG_notm_ar1_0_start, 0x00, OAMR_0 - OAMR
    ANIMSCR_CMD 0x01
    ANIMSCR_BLOCKED

SCR_CRIT_ATK_PRIORITY_L:
    ANIMSCR_FRAME 0x04, _data_BANIM_IMG_notm_ar1_0_start, 0x00, OAMR_0 - OAMR
    ANIMSCR_CMD 0x01
    ANIMSCR_BLOCKED

SCR_RANGED_ATK:
    ANIMSCR_FRAME 0x04, _data_BANIM_IMG_notm_ar1_0_start, 0x00, OAMR_0 - OAMR
    ANIMSCR_CMD 0x01
    ANIMSCR_BLOCKED

SCR_RANGED_CRIT_ATK:
    ANIMSCR_FRAME 0x04, _data_BANIM_IMG_notm_ar1_0_start, 0x00, OAMR_0 - OAMR
    ANIMSCR_CMD 0x01
    ANIMSCR_BLOCKED

SCR_CLOSE_DODGE:
    ANIMSCR_CMD 0x02
    ANIMSCR_FRAME 0x01, _data_BANIM_IMG_notm_ar1_0_start, 0x00, OAMR_0 - OAMR
    ANIMSCR_FRAME 0x02, _data_BANIM_IMG_notm_ar1_1_end, 0x01, OAMR_1 - OAMR
    ANIMSCR_FRAME 0x01, _data_BANIM_IMG_notm_ar1_1_end, 0x02, OAMR_2 - OAMR
    ANIMSCR_CMD 0x01
    ANIMSCR_FRAME 0x04, _data_BANIM_IMG_notm_ar1_1_end, 0x01, OAMR_1 - OAMR
    ANIMSCR_CMD 0x1C
    ANIMSCR_CMD 0x0D
    ANIMSCR_BLOCKED

SCR_RANGED_DODGE:
    ANIMSCR_CMD 0x02
    ANIMSCR_FRAME 0x01, _data_BANIM_IMG_notm_ar1_0_start, 0x00, OAMR_0 - OAMR
    ANIMSCR_FRAME 0x02, _data_BANIM_IMG_notm_ar1_1_end, 0x01, OAMR_1 - OAMR
    ANIMSCR_FRAME 0x01, _data_BANIM_IMG_notm_ar1_1_end, 0x02, OAMR_2 - OAMR
    ANIMSCR_CMD 0x01
    ANIMSCR_FRAME 0x04, _data_BANIM_IMG_notm_ar1_1_end, 0x01, OAMR_1 - OAMR
    ANIMSCR_CMD 0x1C
    ANIMSCR_CMD 0x0D
    ANIMSCR_BLOCKED

SCR_STANDING:
    ANIMSCR_FRAME 0x04, _data_BANIM_IMG_notm_ar1_0_start, 0x00, OAMR_0 - OAMR
    ANIMSCR_CMD 0x01
    ANIMSCR_BLOCKED

SCR_STANDING2:
    ANIMSCR_FRAME 0x04, _data_BANIM_IMG_notm_ar1_0_start, 0x00, OAMR_0 - OAMR
    ANIMSCR_CMD 0x01
    ANIMSCR_BLOCKED

SCR_RANGED_STANDING:
    ANIMSCR_FRAME 0x04, _data_BANIM_IMG_notm_ar1_0_start, 0x00, OAMR_0 - OAMR
    ANIMSCR_CMD 0x01
    ANIMSCR_BLOCKED

SCR_MISSED_ATK:
    ANIMSCR_FRAME 0x04, _data_BANIM_IMG_notm_ar1_0_start, 0x00, OAMR_0 - OAMR
    ANIMSCR_CMD 0x01
    ANIMSCR_BLOCKED


.section .data.modes
.global BANIM_MODES_notm_ar1_2
BANIM_MODES_notm_ar1_2:
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