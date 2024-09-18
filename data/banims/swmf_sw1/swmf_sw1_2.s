.include "macro.inc"
.include "animscr.inc"
.include "gba_sprites.inc"

.section .data.oamr
.global BANIM_OAMR_swmf_sw1_2
BANIM_OAMR_swmf_sw1_2:
OAMR:
OAMR_0:
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_32, 0x009C, -8, -16
    ANIM_SPRITE ATTR0_WIDE, ATTR1_SIZE_8, 0x00DA, -8, -24
    ANIM_SPRITE_END
OAMR_1:
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_32, 0x009E, -9, -16
    ANIM_SPRITE ATTR0_WIDE, ATTR1_SIZE_8, 0x00FA, -9, -24
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_8, 0x00D9, 7, 8
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
.global BANIM_OAML_swmf_sw1_2
BANIM_OAML_swmf_sw1_2:
OAML:
OAML_0:
    ANIM_SPRITE_XFLIP ATTR0_TALL, ATTR1_SIZE_32, 0x009C, -8, -16
    ANIM_SPRITE_XFLIP ATTR0_WIDE, ATTR1_SIZE_8, 0x00DA, -8, -24
    ANIM_SPRITE_END
OAML_1:
    ANIM_SPRITE_XFLIP ATTR0_TALL, ATTR1_SIZE_32, 0x009E, -7, -16
    ANIM_SPRITE_XFLIP ATTR0_WIDE, ATTR1_SIZE_8, 0x00FA, -7, -24
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_8, 0x00D9, -15, 8
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
.global BANIM_SCR_swmf_sw1_2
BANIM_SCR_swmf_sw1_2:
SCR:
SCR_NORMAL_ATK:
    ANIMSCR_CMD 0x02
    ANIMSCR_FRAME 0x01, BANIM_IMG_swmf_sw1_0, 0x00, OAMR_0 - OAMR
    ANIMSCR_CMD 0x0E
    ANIMSCR_FRAME 0x04, BANIM_IMG_swmf_sw1_0, 0x01, OAMR_1 - OAMR
    ANIMSCR_CMD 0x01
    ANIMSCR_CMD 0x0D
    ANIMSCR_BLOCKED

SCR_NORMAL_ATK_PRIORITY_L:
    ANIMSCR_CMD 0x02
    ANIMSCR_FRAME 0x01, BANIM_IMG_swmf_sw1_0, 0x00, OAMR_0 - OAMR
    ANIMSCR_CMD 0x0E
    ANIMSCR_FRAME 0x04, BANIM_IMG_swmf_sw1_0, 0x01, OAMR_1 - OAMR
    ANIMSCR_CMD 0x01
    ANIMSCR_CMD 0x0D
    ANIMSCR_BLOCKED

SCR_CRIT_ATK:
    ANIMSCR_CMD 0x02
    ANIMSCR_FRAME 0x01, BANIM_IMG_swmf_sw1_0, 0x00, OAMR_0 - OAMR
    ANIMSCR_CMD 0x0E
    ANIMSCR_FRAME 0x04, BANIM_IMG_swmf_sw1_0, 0x01, OAMR_1 - OAMR
    ANIMSCR_CMD 0x01
    ANIMSCR_CMD 0x0D
    ANIMSCR_BLOCKED

SCR_CRIT_ATK_PRIORITY_L:
    ANIMSCR_CMD 0x02
    ANIMSCR_FRAME 0x01, BANIM_IMG_swmf_sw1_0, 0x00, OAMR_0 - OAMR
    ANIMSCR_CMD 0x0E
    ANIMSCR_FRAME 0x04, BANIM_IMG_swmf_sw1_0, 0x01, OAMR_1 - OAMR
    ANIMSCR_CMD 0x01
    ANIMSCR_CMD 0x0D
    ANIMSCR_BLOCKED

SCR_RANGED_ATK:
    ANIMSCR_CMD 0x02
    ANIMSCR_FRAME 0x01, BANIM_IMG_swmf_sw1_0, 0x00, OAMR_0 - OAMR
    ANIMSCR_CMD 0x0E
    ANIMSCR_FRAME 0x04, BANIM_IMG_swmf_sw1_0, 0x01, OAMR_1 - OAMR
    ANIMSCR_CMD 0x01
    ANIMSCR_CMD 0x0D
    ANIMSCR_BLOCKED

SCR_RANGED_CRIT_ATK:
    ANIMSCR_CMD 0x02
    ANIMSCR_FRAME 0x01, BANIM_IMG_swmf_sw1_0, 0x00, OAMR_0 - OAMR
    ANIMSCR_CMD 0x0E
    ANIMSCR_FRAME 0x04, BANIM_IMG_swmf_sw1_0, 0x01, OAMR_1 - OAMR
    ANIMSCR_CMD 0x01
    ANIMSCR_CMD 0x0D
    ANIMSCR_BLOCKED

SCR_CLOSE_DODGE:
    ANIMSCR_CMD 0x02
    ANIMSCR_FRAME 0x01, BANIM_IMG_swmf_sw1_0, 0x00, OAMR_0 - OAMR
    ANIMSCR_CMD 0x0E
    ANIMSCR_FRAME 0x04, BANIM_IMG_swmf_sw1_0, 0x01, OAMR_1 - OAMR
    ANIMSCR_CMD 0x01
    ANIMSCR_CMD 0x0D
    ANIMSCR_BLOCKED

SCR_RANGED_DODGE:
    ANIMSCR_CMD 0x02
    ANIMSCR_FRAME 0x01, BANIM_IMG_swmf_sw1_0, 0x00, OAMR_0 - OAMR
    ANIMSCR_CMD 0x0E
    ANIMSCR_FRAME 0x04, BANIM_IMG_swmf_sw1_0, 0x01, OAMR_1 - OAMR
    ANIMSCR_CMD 0x01
    ANIMSCR_CMD 0x0D
    ANIMSCR_BLOCKED

SCR_STANDING:
    ANIMSCR_FRAME 0x01, BANIM_IMG_swmf_sw1_0, 0x00, OAMR_0 - OAMR
    ANIMSCR_CMD 0x01
    ANIMSCR_BLOCKED

SCR_STANDING2:
    ANIMSCR_FRAME 0x01, BANIM_IMG_swmf_sw1_0, 0x00, OAMR_0 - OAMR
    ANIMSCR_CMD 0x01
    ANIMSCR_BLOCKED

SCR_RANGED_STANDING:
    ANIMSCR_FRAME 0x01, BANIM_IMG_swmf_sw1_0, 0x00, OAMR_0 - OAMR
    ANIMSCR_CMD 0x01
    ANIMSCR_BLOCKED

SCR_MISSED_ATK:
    ANIMSCR_CMD 0x02
    ANIMSCR_FRAME 0x01, BANIM_IMG_swmf_sw1_0, 0x00, OAMR_0 - OAMR
    ANIMSCR_CMD 0x0E
    ANIMSCR_FRAME 0x04, BANIM_IMG_swmf_sw1_0, 0x01, OAMR_1 - OAMR
    ANIMSCR_CMD 0x01
    ANIMSCR_CMD 0x0D
    ANIMSCR_BLOCKED


.section .data.modes
.global BANIM_MODES_swmf_sw1_2
BANIM_MODES_swmf_sw1_2:
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
