	.include "animscr.inc"
	.include "gba_sprites.inc"
	.section .data

AnimSprite_EkrPopup:  @ 0x607648
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_16, 0x0000, 0, 0
    ANIM_SPRITE_END

	.global AnimScr_EkrPopup
AnimScr_EkrPopup: @ 0x607660
    ANIMSCR_FORCE_SPRITE AnimSprite_EkrPopup, 1
    ANIMSCR_BLOCKED
