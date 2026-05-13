#include "prelude.h"
#include "oam.h"
#include "banim.h"

void InitLeftAnim(int round_type)
{
	struct Anim *anim;
	u32 frame_front = BanimDefaultModeConfig[round_type * 4 + 0];
	u32 priority_front = BanimDefaultModeConfig[round_type * 4 + 1];
	u32 frame_back = BanimDefaultModeConfig[round_type * 4 + 2];
	u32 priority_back = BanimDefaultModeConfig[round_type * 4 + 3];
	u32 x_off = BanimTypesPosLeft[gEkrDistanceType];
	int scr_offset;
	void *scr;

	gEkrXPosBase[0] = -BanimLeftDefaultPos[gEkrDistanceType];
	gEkrYPosBase[0] = 0;
	gEkrXPosReal[0] = gEkrXPosBase[0] + x_off;
	gEkrYPosReal[0] = 0x58;

	scr_offset = gpBanimModesLeft[frame_front];
	scr = gBanimScrs + scr_offset;

	if (frame_front == 0xFF)
		scr = AnimScr_DefaultAnim;

	/* front */
	anim = BasCreate(scr, priority_front);
	anim->xPosition = gEkrXPosReal[0] - gEkrBgPosition;
	anim->yPosition = gEkrYPosReal[0];
	anim->oam2 = OAM2_PAL(0x7) + OAM2_LAYER(0x2) + OAM2_CHR(0x4000 / 0x20);
	do {
		anim->flags2 |= ANIM_BIT2_0400 | ANIM_BIT2_BACK_FRAME;
		anim->nextRoundId = 0x0;
	} while (0);
	anim->currentRoundType = round_type;
	anim->imgBuf = gBanimImgSheetBuf_Left;
	anim->sprDataPool = gBanimOamBufs;
	gAnims[0] = anim;

	scr_offset = gpBanimModesLeft[frame_back];
	scr = gBanimScrs + scr_offset;

	if (frame_back == 0xFF)
		scr = AnimScr_DefaultAnim;

	/* back */
	anim = BasCreate(scr, priority_back);
	anim->xPosition = gEkrXPosReal[0] - gEkrBgPosition;
	anim->yPosition = gEkrYPosReal[0];
	anim->oam2 = OAM2_PAL(0x7) + OAM2_LAYER(0x2) + OAM2_CHR(0x4000 / 0x20);
	do {
		anim->flags2 |= ANIM_BIT2_0400 | ANIM_BIT2_FRONT_FRAME;
		anim->nextRoundId = 0x0;
	} while (0);
	asm("":::"r6");
	anim->currentRoundType = round_type;
	anim->imgBuf = gBanimImgSheetBuf_Left;
	anim->sprDataPool = gBanimOamBufs;
	gAnims[1] = anim;
}

void InitRightAnim(int round_type)
{
	struct Anim *anim;
	u32 frame_front = BanimDefaultModeConfig[round_type * 4 + 0];
	u32 priority_front = BanimDefaultModeConfig[round_type * 4 + 1];
	u32 frame_back = BanimDefaultModeConfig[round_type * 4 + 2];
	u32 priority_back = BanimDefaultModeConfig[round_type * 4 + 3];
	u32 x_off = BanimTypesPosRight[gEkrDistanceType];
	int scr_offset;
	void *scr;

	gEkrXPosBase[1] = 0;
	gEkrYPosBase[1] = 0;
	gEkrXPosReal[1] = gEkrXPosBase[1] + x_off;
	gEkrYPosReal[1] = 0x58;

	scr_offset = gpBanimModesRight[frame_front];
	scr = gBanimScrs + BAS_SCR_MAX_SIZE + scr_offset;

	if (frame_front == 0xFF)
		scr = AnimScr_DefaultAnim;

	/* front */
	anim = BasCreate(scr, priority_front);
	anim->xPosition = gEkrXPosReal[1] - gEkrBgPosition;
	anim->yPosition = gEkrYPosReal[1];
	anim->oam2 = OAM2_PAL(0x9) + OAM2_LAYER(0x2) + OAM2_CHR(0x6000 / 0x20);
	do {
		anim->flags2 |= ANIM_BIT2_POS_RIGHT | ANIM_BIT2_0400;
		anim->nextRoundId = 0x0;
	} while (0);
	anim->currentRoundType = round_type;
	anim->imgBuf = gBanimImgSheetBuf_Right;
	anim->sprDataPool = gBanimOamBufs + BAS_OAM_MAX_SIZE;
	gAnims[2] = anim;

	scr_offset = gpBanimModesRight[frame_back];
	scr = gBanimScrs + BAS_SCR_MAX_SIZE + scr_offset;

	if (frame_back == 0xFF)
		scr = AnimScr_DefaultAnim;

	/* back */
	anim = BasCreate(scr, priority_back);
	anim->xPosition = gEkrXPosReal[1] - gEkrBgPosition;
	anim->yPosition = gEkrYPosReal[1];
	anim->oam2 = OAM2_PAL(0x9) + OAM2_LAYER(0x2) + OAM2_CHR(0x6000 / 0x20);
	do {
		anim->flags2 |= ANIM_BIT2_FRONT_FRAME | ANIM_BIT2_POS_RIGHT | ANIM_BIT2_0400;
		anim->nextRoundId = 0x0;
	} while (0);
	asm("":::"r4");
	anim->currentRoundType = round_type;
	anim->imgBuf = gBanimImgSheetBuf_Right;
	anim->sprDataPool = gBanimOamBufs + BAS_OAM_MAX_SIZE;
	gAnims[3] = anim;
}
