.include "macro.inc"
.include "animscr.inc"
.include "gba_sprites.inc"

.section .data.oamr
@ BANIM_OAMR_notf_ar1_2:
OAMR:
OAMR_0:
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_16, 0x0040, -8, -16
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_8, 0x0080, -6, 0
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_32, 0x0023, -8, -15
    ANIM_SPRITE ATTR0_WIDE, ATTR1_SIZE_8, 0x0005, 8, -23
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x00BA, -9, -15
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_8, 0x00FA, -9, 1
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_16, 0x0000, -8, -32
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x0002, 8, -32
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_8, 0x0042, 3, -39
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_8, 0x00BF, 8, -16
    ANIM_SPRITE_END
OAMR_1:
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_16, 0x00CD, -11, -13
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_32, 0x001C, -9, -17
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_16, 0x001B, -17, -17
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_8, 0x003A, 7, -25
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_8, 0x005A, 15, -25
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_16, 0x009C, -6, -27
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x009B, -14, -27
    ANIM_SPRITE ATTR0_WIDE, ATTR1_SIZE_8, 0x00BE, -2, -34
    ANIM_SPRITE_END
OAMR_2:
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_16, 0x00CD, -13, -16
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_32, 0x0015, -19, -15
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x0019, 13, -15
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_8, 0x0079, 13, 9
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_8, 0x0059, -27, -7
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_16, 0x00D9, 5, -31
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_8, 0x001A, -3, -23
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_16, 0x009C, -8, -30
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x009B, -16, -30
    ANIM_SPRITE ATTR0_WIDE, ATTR1_SIZE_8, 0x00BE, -4, -37
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
@ BANIM_OAML_notf_ar1_2:
OAML:
OAML_0:
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_16, 0x0040, -8, -16
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_8, 0x0080, -2, 0
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_32, 0x0023, -24, -15
    ANIM_SPRITE_XFLIP ATTR0_WIDE, ATTR1_SIZE_8, 0x0005, -24, -23
    ANIM_SPRITE_XFLIP ATTR0_TALL, ATTR1_SIZE_8, 0x00BA, 1, -15
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_8, 0x00FA, 1, 1
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_16, 0x0000, -8, -32
    ANIM_SPRITE_XFLIP ATTR0_TALL, ATTR1_SIZE_8, 0x0002, -16, -32
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_8, 0x0042, -11, -39
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_8, 0x00BF, -16, -16
    ANIM_SPRITE_END
OAML_1:
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_16, 0x00CD, -5, -13
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_32, 0x001C, -23, -17
    ANIM_SPRITE_XFLIP ATTR0_TALL, ATTR1_SIZE_16, 0x001B, 9, -17
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_8, 0x003A, -15, -25
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_8, 0x005A, -23, -25
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_16, 0x009C, -10, -27
    ANIM_SPRITE_XFLIP ATTR0_TALL, ATTR1_SIZE_8, 0x009B, 6, -27
    ANIM_SPRITE_XFLIP ATTR0_WIDE, ATTR1_SIZE_8, 0x00BE, -14, -34
    ANIM_SPRITE_END
OAML_2:
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_16, 0x00CD, -3, -16
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_32, 0x0015, -13, -15
    ANIM_SPRITE_XFLIP ATTR0_TALL, ATTR1_SIZE_8, 0x0019, -21, -15
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_8, 0x0079, -21, 9
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_8, 0x0059, 19, -7
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_16, 0x00D9, -21, -31
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_8, 0x001A, -5, -23
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_16, 0x009C, -8, -30
    ANIM_SPRITE_XFLIP ATTR0_TALL, ATTR1_SIZE_8, 0x009B, 8, -30
    ANIM_SPRITE_XFLIP ATTR0_WIDE, ATTR1_SIZE_8, 0x00BE, -12, -37
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
@ BANIM_SCR_notf_ar1_2:
SCR:
SCR_NORMAL_ATK:
    ANIMSCR_FRAME 0x04, BANIM_IMG_notf_ar1_0, 0x00, OAMR_0 - OAMR
    ANIMSCR_CMD 0x01
    ANIMSCR_BLOCKED

SCR_NORMAL_ATK_PRIORITY_L:
    ANIMSCR_FRAME 0x04, BANIM_IMG_notf_ar1_0, 0x00, OAMR_0 - OAMR
    ANIMSCR_CMD 0x01
    ANIMSCR_BLOCKED

SCR_CRIT_ATK:
    ANIMSCR_FRAME 0x04, BANIM_IMG_notf_ar1_0, 0x00, OAMR_0 - OAMR
    ANIMSCR_CMD 0x01
    ANIMSCR_BLOCKED

SCR_CRIT_ATK_PRIORITY_L:
    ANIMSCR_FRAME 0x04, BANIM_IMG_notf_ar1_0, 0x00, OAMR_0 - OAMR
    ANIMSCR_CMD 0x01
    ANIMSCR_BLOCKED

SCR_RANGED_ATK:
    ANIMSCR_FRAME 0x04, BANIM_IMG_notf_ar1_0, 0x00, OAMR_0 - OAMR
    ANIMSCR_CMD 0x01
    ANIMSCR_BLOCKED

SCR_RANGED_CRIT_ATK:
    ANIMSCR_FRAME 0x04, BANIM_IMG_notf_ar1_0, 0x00, OAMR_0 - OAMR
    ANIMSCR_CMD 0x01
    ANIMSCR_BLOCKED

SCR_CLOSE_DODGE:
    ANIMSCR_CMD 0x02
    ANIMSCR_FRAME 0x01, BANIM_IMG_notf_ar1_0, 0x00, OAMR_0 - OAMR
    ANIMSCR_FRAME 0x02, BANIM_IMG_notf_ar1_2, 0x01, OAMR_1 - OAMR
    ANIMSCR_FRAME 0x01, BANIM_IMG_notf_ar1_2, 0x02, OAMR_2 - OAMR
    ANIMSCR_CMD 0x01
    ANIMSCR_FRAME 0x04, BANIM_IMG_notf_ar1_2, 0x01, OAMR_1 - OAMR
    ANIMSCR_CMD 0x1C
    ANIMSCR_CMD 0x0D
    ANIMSCR_BLOCKED

SCR_RANGED_DODGE:
    ANIMSCR_CMD 0x02
    ANIMSCR_FRAME 0x01, BANIM_IMG_notf_ar1_0, 0x00, OAMR_0 - OAMR
    ANIMSCR_FRAME 0x02, BANIM_IMG_notf_ar1_2, 0x01, OAMR_1 - OAMR
    ANIMSCR_FRAME 0x01, BANIM_IMG_notf_ar1_2, 0x02, OAMR_2 - OAMR
    ANIMSCR_CMD 0x01
    ANIMSCR_FRAME 0x04, BANIM_IMG_notf_ar1_2, 0x01, OAMR_1 - OAMR
    ANIMSCR_CMD 0x1C
    ANIMSCR_CMD 0x0D
    ANIMSCR_BLOCKED

SCR_STANDING:
    ANIMSCR_FRAME 0x04, BANIM_IMG_notf_ar1_0, 0x00, OAMR_0 - OAMR
    ANIMSCR_CMD 0x01
    ANIMSCR_BLOCKED

SCR_STANDING2:
    ANIMSCR_FRAME 0x04, BANIM_IMG_notf_ar1_0, 0x00, OAMR_0 - OAMR
    ANIMSCR_CMD 0x01
    ANIMSCR_BLOCKED

SCR_RANGED_STANDING:
    ANIMSCR_FRAME 0x04, BANIM_IMG_notf_ar1_0, 0x00, OAMR_0 - OAMR
    ANIMSCR_CMD 0x01
    ANIMSCR_BLOCKED

SCR_MISSED_ATK:
    ANIMSCR_FRAME 0x04, BANIM_IMG_notf_ar1_0, 0x00, OAMR_0 - OAMR
    ANIMSCR_CMD 0x01
    ANIMSCR_BLOCKED


.section .data.modes
@ BANIM_MODES_notf_ar1_2:
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
