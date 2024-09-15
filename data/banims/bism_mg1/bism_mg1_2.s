.include "macro.inc"
.include "animscr.inc"
.include "gba_sprites.inc"

.section .data.oamr
OAMR:
OAMR_0:
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_32, 0x0000, -13, -24
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_16, 0x0002, 3, -24
    ANIM_SPRITE ATTR0_WIDE, ATTR1_SIZE_8, 0x0080, -13, 8
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_8, 0x0082, 3, 8
    ANIM_SPRITE_END
OAMR_1:
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x00A0, -22, -24
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_8, 0x00E0, -22, -8
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_8, 0x00A1, -3, -24
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_32, 0x0003, -14, -16
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_16, 0x0005, 2, -16
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_8, 0x00C1, 10, -3
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_8, 0x00E7, -11, -24
    ANIM_SPRITE_END
OAMR_2:
    ANIM_SPRITE ATTR0_WIDE, ATTR1_SIZE_32, 0x0083, -24, -24
    ANIM_SPRITE ATTR0_WIDE, ATTR1_SIZE_32, 0x00C3, -17, -8
    ANIM_SPRITE ATTR0_WIDE, ATTR1_SIZE_8, 0x00E1, -7, 8
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_8, 0x00C2, -15, 8
    ANIM_SPRITE_END
OAMR_3:
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_8, 0x00C7, -1, -5
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x00BE, 6, -17
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_8, 0x00BD, -2, -1
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_8, 0x00DD, -2, -9
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_8, 0x00FD, -7, 7
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_32, 0x0006, -11, -17
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_16, 0x0008, 5, -17
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_8, 0x0087, -1, -25
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_8, 0x00E7, -9, -25
    ANIM_SPRITE_END
OAMR_4:
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_8, 0x00E8, 4, -10
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x00BE, 8, -19
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_8, 0x00BD, 0, -3
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_8, 0x00DD, 0, -11
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_8, 0x00FD, -5, 5
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_32, 0x0009, -12, -18
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_16, 0x000B, 4, -18
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_8, 0x00A7, 0, -26
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_8, 0x00E7, -8, -26
    ANIM_SPRITE_END
OAMR_5:
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_8, 0x001F, 0, -8
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
    ANIM_SPRITE_XFLIP ATTR0_TALL, ATTR1_SIZE_32, 0x0000, -3, -24
    ANIM_SPRITE_XFLIP ATTR0_TALL, ATTR1_SIZE_16, 0x0002, -11, -24
    ANIM_SPRITE_XFLIP ATTR0_WIDE, ATTR1_SIZE_8, 0x0080, -3, 8
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_8, 0x0082, -11, 8
    ANIM_SPRITE_END
OAML_1:
    ANIM_SPRITE_XFLIP ATTR0_TALL, ATTR1_SIZE_8, 0x00A0, 14, -24
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_8, 0x00E0, 14, -8
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_8, 0x00A1, -5, -24
    ANIM_SPRITE_XFLIP ATTR0_TALL, ATTR1_SIZE_32, 0x0003, -2, -16
    ANIM_SPRITE_XFLIP ATTR0_TALL, ATTR1_SIZE_16, 0x0005, -10, -16
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_8, 0x00C1, -18, -3
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_8, 0x00E7, 3, -24
    ANIM_SPRITE_END
OAML_2:
    ANIM_SPRITE_XFLIP ATTR0_WIDE, ATTR1_SIZE_32, 0x0083, -8, -24
    ANIM_SPRITE_XFLIP ATTR0_WIDE, ATTR1_SIZE_32, 0x00C3, -15, -8
    ANIM_SPRITE_XFLIP ATTR0_WIDE, ATTR1_SIZE_8, 0x00E1, -9, 8
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_8, 0x00C2, 7, 8
    ANIM_SPRITE_END
OAML_3:
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_8, 0x00C7, -7, -5
    ANIM_SPRITE_XFLIP ATTR0_TALL, ATTR1_SIZE_8, 0x00BE, -14, -17
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_8, 0x00BD, -6, -1
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_8, 0x00DD, -6, -9
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_8, 0x00FD, -1, 7
    ANIM_SPRITE_XFLIP ATTR0_TALL, ATTR1_SIZE_32, 0x0006, -5, -17
    ANIM_SPRITE_XFLIP ATTR0_TALL, ATTR1_SIZE_16, 0x0008, -13, -17
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_8, 0x0087, -7, -25
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_8, 0x00E7, 1, -25
    ANIM_SPRITE_END
OAML_4:
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_8, 0x00E8, -12, -10
    ANIM_SPRITE_XFLIP ATTR0_TALL, ATTR1_SIZE_8, 0x00BE, -16, -19
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_8, 0x00BD, -8, -3
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_8, 0x00DD, -8, -11
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_8, 0x00FD, -3, 5
    ANIM_SPRITE_XFLIP ATTR0_TALL, ATTR1_SIZE_32, 0x0009, -4, -18
    ANIM_SPRITE_XFLIP ATTR0_TALL, ATTR1_SIZE_16, 0x000B, -12, -18
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_8, 0x00A7, -8, -26
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_8, 0x00E7, 0, -26
    ANIM_SPRITE_END
OAML_5:
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_8, 0x001F, -8, -8
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
    ANIMSCR_CMD 0x03
    ANIMSCR_CMD 0x07
    ANIMSCR_FRAME 0x01, BANIM_IMG_bism_mg1_0, 0x00, OAMR_0 - OAMR
    ANIMSCR_FRAME 0x04, BANIM_IMG_bism_mg1_0, 0x01, OAMR_1 - OAMR
    ANIMSCR_CMD 0x05
    ANIMSCR_FRAME 0x01, BANIM_IMG_bism_mg1_0, 0x02, OAMR_2 - OAMR
    ANIMSCR_CMD 0x01
    ANIMSCR_CMD 0x06
    ANIMSCR_FRAME 0x04, BANIM_IMG_bism_mg1_0, 0x01, OAMR_1 - OAMR
    ANIMSCR_CMD 0x0D
    ANIMSCR_BLOCKED

SCR_NORMAL_ATK_PRIORITY_L:
    ANIMSCR_CMD 0x03
    ANIMSCR_CMD 0x07
    ANIMSCR_FRAME 0x01, BANIM_IMG_bism_mg1_0, 0x05, OAMR_5 - OAMR
    ANIMSCR_FRAME 0x04, BANIM_IMG_bism_mg1_0, 0x05, OAMR_5 - OAMR
    ANIMSCR_CMD 0x05
    ANIMSCR_FRAME 0x01, BANIM_IMG_bism_mg1_0, 0x05, OAMR_5 - OAMR
    ANIMSCR_CMD 0x01
    ANIMSCR_CMD 0x06
    ANIMSCR_FRAME 0x04, BANIM_IMG_bism_mg1_0, 0x05, OAMR_5 - OAMR
    ANIMSCR_CMD 0x0D
    ANIMSCR_BLOCKED

SCR_CRIT_ATK:
    ANIMSCR_CMD 0x03
    ANIMSCR_CMD 0x07
    ANIMSCR_FRAME 0x01, BANIM_IMG_bism_mg1_0, 0x00, OAMR_0 - OAMR
    ANIMSCR_FRAME 0x04, BANIM_IMG_bism_mg1_0, 0x01, OAMR_1 - OAMR
    ANIMSCR_CMD 0x05
    ANIMSCR_FRAME 0x01, BANIM_IMG_bism_mg1_0, 0x02, OAMR_2 - OAMR
    ANIMSCR_CMD 0x01
    ANIMSCR_CMD 0x06
    ANIMSCR_FRAME 0x04, BANIM_IMG_bism_mg1_0, 0x01, OAMR_1 - OAMR
    ANIMSCR_CMD 0x0D
    ANIMSCR_BLOCKED

SCR_CRIT_ATK_PRIORITY_L:
    ANIMSCR_CMD 0x03
    ANIMSCR_CMD 0x07
    ANIMSCR_FRAME 0x01, BANIM_IMG_bism_mg1_0, 0x05, OAMR_5 - OAMR
    ANIMSCR_FRAME 0x04, BANIM_IMG_bism_mg1_0, 0x05, OAMR_5 - OAMR
    ANIMSCR_CMD 0x05
    ANIMSCR_FRAME 0x01, BANIM_IMG_bism_mg1_0, 0x05, OAMR_5 - OAMR
    ANIMSCR_CMD 0x01
    ANIMSCR_CMD 0x06
    ANIMSCR_FRAME 0x04, BANIM_IMG_bism_mg1_0, 0x05, OAMR_5 - OAMR
    ANIMSCR_CMD 0x0D
    ANIMSCR_BLOCKED

SCR_RANGED_ATK:
    ANIMSCR_CMD 0x03
    ANIMSCR_CMD 0x07
    ANIMSCR_FRAME 0x01, BANIM_IMG_bism_mg1_0, 0x00, OAMR_0 - OAMR
    ANIMSCR_FRAME 0x04, BANIM_IMG_bism_mg1_0, 0x01, OAMR_1 - OAMR
    ANIMSCR_CMD 0x05
    ANIMSCR_FRAME 0x01, BANIM_IMG_bism_mg1_0, 0x02, OAMR_2 - OAMR
    ANIMSCR_CMD 0x01
    ANIMSCR_CMD 0x06
    ANIMSCR_FRAME 0x04, BANIM_IMG_bism_mg1_0, 0x01, OAMR_1 - OAMR
    ANIMSCR_CMD 0x0D
    ANIMSCR_BLOCKED

SCR_RANGED_CRIT_ATK:
    ANIMSCR_CMD 0x03
    ANIMSCR_CMD 0x07
    ANIMSCR_FRAME 0x01, BANIM_IMG_bism_mg1_0, 0x00, OAMR_0 - OAMR
    ANIMSCR_FRAME 0x04, BANIM_IMG_bism_mg1_0, 0x01, OAMR_1 - OAMR
    ANIMSCR_CMD 0x05
    ANIMSCR_FRAME 0x01, BANIM_IMG_bism_mg1_0, 0x02, OAMR_2 - OAMR
    ANIMSCR_CMD 0x01
    ANIMSCR_CMD 0x06
    ANIMSCR_FRAME 0x04, BANIM_IMG_bism_mg1_0, 0x01, OAMR_1 - OAMR
    ANIMSCR_CMD 0x0D
    ANIMSCR_BLOCKED

SCR_CLOSE_DODGE:
    ANIMSCR_CMD 0x02
    ANIMSCR_FRAME 0x01, BANIM_IMG_bism_mg1_0, 0x00, OAMR_0 - OAMR
    ANIMSCR_CMD 0x0E
    ANIMSCR_FRAME 0x03, BANIM_IMG_bism_mg1_0, 0x03, OAMR_3 - OAMR
    ANIMSCR_FRAME 0x01, BANIM_IMG_bism_mg1_0, 0x04, OAMR_4 - OAMR
    ANIMSCR_CMD 0x01
    ANIMSCR_FRAME 0x03, BANIM_IMG_bism_mg1_0, 0x03, OAMR_3 - OAMR
    ANIMSCR_CMD 0x0D
    ANIMSCR_BLOCKED

SCR_RANGED_DODGE:
    ANIMSCR_CMD 0x02
    ANIMSCR_FRAME 0x01, BANIM_IMG_bism_mg1_0, 0x00, OAMR_0 - OAMR
    ANIMSCR_CMD 0x0E
    ANIMSCR_FRAME 0x03, BANIM_IMG_bism_mg1_0, 0x03, OAMR_3 - OAMR
    ANIMSCR_FRAME 0x01, BANIM_IMG_bism_mg1_0, 0x04, OAMR_4 - OAMR
    ANIMSCR_CMD 0x01
    ANIMSCR_FRAME 0x03, BANIM_IMG_bism_mg1_0, 0x03, OAMR_3 - OAMR
    ANIMSCR_CMD 0x0D
    ANIMSCR_BLOCKED

SCR_STANDING:
    ANIMSCR_FRAME 0x01, BANIM_IMG_bism_mg1_0, 0x00, OAMR_0 - OAMR
    ANIMSCR_CMD 0x01
    ANIMSCR_BLOCKED

SCR_STANDING2:
    ANIMSCR_FRAME 0x01, BANIM_IMG_bism_mg1_0, 0x00, OAMR_0 - OAMR
    ANIMSCR_CMD 0x01
    ANIMSCR_BLOCKED

SCR_RANGED_STANDING:
    ANIMSCR_FRAME 0x01, BANIM_IMG_bism_mg1_0, 0x00, OAMR_0 - OAMR
    ANIMSCR_CMD 0x01
    ANIMSCR_BLOCKED

SCR_MISSED_ATK:
    ANIMSCR_CMD 0x03
    ANIMSCR_CMD 0x07
    ANIMSCR_FRAME 0x01, BANIM_IMG_bism_mg1_0, 0x00, OAMR_0 - OAMR
    ANIMSCR_FRAME 0x04, BANIM_IMG_bism_mg1_0, 0x01, OAMR_1 - OAMR
    ANIMSCR_CMD 0x05
    ANIMSCR_FRAME 0x01, BANIM_IMG_bism_mg1_0, 0x02, OAMR_2 - OAMR
    ANIMSCR_CMD 0x01
    ANIMSCR_CMD 0x06
    ANIMSCR_FRAME 0x04, BANIM_IMG_bism_mg1_0, 0x01, OAMR_1 - OAMR
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
