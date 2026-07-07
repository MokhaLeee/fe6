#include "prelude.h"
#include "proc.h"
#include "hardware.h"

#include "banim.h"

struct ProcScr CONST_DATA ProcScr_EkrBaseKaiten[] = {
	PROC_19,
	PROC_REPEAT(EkrBaseKaiten_Loop),
	PROC_END,
};

const u8 *CONST_DATA Imgs_EkrBaseKaiten1[] = {
	Img_EkrBaseKaiten2, NULL,
	Img_EkrBaseKaiten2, NULL,
	Img_EkrBaseKaiten1, NULL,
	Img_EkrBaseKaiten2, NULL
};

const u8 *CONST_DATA Imgs_EkrBaseKaiten2[] = {
	Img_EkrBaseKaiten3,
	Img_EkrBaseKaiten4,
	Img_EkrBaseKaiten4,
	Img_EkrBaseKaiten4,
	Img_EkrBaseKaiten5,
	Img_EkrBaseKaiten4,
	Img_EkrBaseKaiten4,
	Img_EkrBaseKaiten4
};

CONST_DATA AnimScr *AnimScrs_EkrBaseKaiten1[] = {
	AnimScr_EkrBaseKaiten_085CEDF8, NULL,
	AnimScr_EkrBaseKaiten_085CEE18, NULL,
	AnimScr_EkrBaseKaiten_085CE168, NULL,
	AnimScr_EkrBaseKaiten_085CEE3C, NULL,
};

CONST_DATA AnimScr *AnimScrs_EkrBaseKaiten2[] = {
	AnimScr_EkrBaseKaiten_085CF6CC,
	AnimScr_EkrBaseKaiten_085D0530,
	AnimScr_EkrBaseKaiten_085D0530,
	AnimScr_EkrBaseKaiten_085D0530,
	AnimScr_EkrBaseKaiten_085D0D34,
	AnimScr_EkrBaseKaiten_085D0554,
	AnimScr_EkrBaseKaiten_085D0554,
	AnimScr_EkrBaseKaiten_085D0554
};

CONST_DATA AnimScr *AnimScrs_EkrBaseKaiten3[] = {
	AnimScr_EkrBaseKaiten_085CF6A8,
	AnimScr_EkrBaseKaiten_085D04E8,
	AnimScr_EkrBaseKaiten_085D04E8,
	AnimScr_EkrBaseKaiten_085D04E8,
	AnimScr_EkrBaseKaiten_085D0D10,
	AnimScr_EkrBaseKaiten_085D050C,
	AnimScr_EkrBaseKaiten_085D050C,
	AnimScr_EkrBaseKaiten_085D050C
};

CONST_DATA AnimScr *AnimScrs_EkrBaseKaiten4[] = {
	AnimScr_EkrBaseKaiten_085CEE60, NULL,
	AnimScr_EkrBaseKaiten_085CEE80, NULL,
	AnimScr_EkrBaseKaiten_085CE18C, NULL,
	AnimScr_EkrBaseKaiten_085CEEA4, NULL,
};

CONST_DATA AnimScr *AnimScrs_EkrBaseKaiten5[] = {
	AnimScr_EkrBaseKaiten_085CF714,
	AnimScr_EkrBaseKaiten_085D05C0,
	AnimScr_EkrBaseKaiten_085D05C0,
	AnimScr_EkrBaseKaiten_085D05C0,
	AnimScr_EkrBaseKaiten_085D0D7C,
	AnimScr_EkrBaseKaiten_085D05E4,
	AnimScr_EkrBaseKaiten_085D05E4,
	AnimScr_EkrBaseKaiten_085D05E4
};

CONST_DATA AnimScr *AnimScrs_EkrBaseKaiten6[] = {
	AnimScr_EkrBaseKaiten_085CF6F0,
	AnimScr_EkrBaseKaiten_085D0578,
	AnimScr_EkrBaseKaiten_085D0578,
	AnimScr_EkrBaseKaiten_085D0578,
	AnimScr_EkrBaseKaiten_085D0D58,
	AnimScr_EkrBaseKaiten_085D059C,
	AnimScr_EkrBaseKaiten_085D059C,
	AnimScr_EkrBaseKaiten_085D059C
};

const u16 EkrBaseKaiten_RefTable[12][8] = {
	{0xA0, 0xB8, 0xE0, 0xF0, 0x01, 0x30, 0x60, 0xFFFF},
	{0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFFFF},
	{0xC0, 0xD8, 0xF0, 0x01, 0x10, 0x28, 0x40, 0xFFFF},
	{0x40, 0x28, 0x10, 0x01, 0xE8, 0xD0, 0xC0, 0xFFFF},
	{0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFFFF},
	{0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFFFF},
	{0x40, 0x40, 0x4C, 0x58, 0x64, 0x70, 0x80, 0xFFFF},
	{0x40, 0x30, 0x20, 0x10, 0xE8, 0xD0, 0xC0, 0xFFFF},
	{0xC0, 0xC8, 0xD0, 0xD8, 0xE0, 0xF0, 0xF8, 0xFFFF},
	{0xC8, 0xC0, 0xB8, 0xB0, 0xA0, 0x90, 0x80, 0xFFFF},
	{0xF0, 0xC0, 0x90, 0x60, 0x30, 0x00, 0xD0, 0xFFFF},
	{0x70, 0x40, 0x10, 0xE0, 0xB0, 0x80, 0x50, 0xFFFF}
};

const u16 *CONST_DATA EkrBaseKaiten_Table1[] = {
	EkrBaseKaiten_RefTable[1], NULL,
	EkrBaseKaiten_RefTable[2], NULL,
	EkrBaseKaiten_RefTable[0], NULL,
	EkrBaseKaiten_RefTable[3], NULL,
};

const u16 *CONST_DATA EkrBaseKaiten_Table2[] = {
	EkrBaseKaiten_RefTable[5],
	EkrBaseKaiten_RefTable[8],
	EkrBaseKaiten_RefTable[8],
	EkrBaseKaiten_RefTable[8],
	EkrBaseKaiten_RefTable[11],
	EkrBaseKaiten_RefTable[9],
	EkrBaseKaiten_RefTable[9],
	EkrBaseKaiten_RefTable[9]
};

const u16 *CONST_DATA EkrBaseKaiten_Table3[] = {
	EkrBaseKaiten_RefTable[4],
	EkrBaseKaiten_RefTable[6],
	EkrBaseKaiten_RefTable[6],
	EkrBaseKaiten_RefTable[6],
	EkrBaseKaiten_RefTable[10],
	EkrBaseKaiten_RefTable[7],
	EkrBaseKaiten_RefTable[7],
	EkrBaseKaiten_RefTable[7]
};

#define AccessArray(array, index, offset) \
	(*(typeof(&*(array)))((void *)(array) + (offset)))

void NewEkrBaseKaiten(int identifier)
{
	int mode;
	struct Anim *anim;
	struct ProcEkrBaseKaiten *proc;
	u32 scale;
	const u8 *img;

	SetBlendConfig(0, 10, 6, 0);
	SetBlendTargetA(0, 0, 0, 0, 0);
	SetBlendTargetB(0, 0, 1, 1, 0);
	gDispIo.blend_ct.target2_enable_bd = 1;

	if (gEkrBmLocation[POS_L] == gEkrBmLocation[2]) {
		if (gEkrBmLocation[POS_R] >= gEkrBmLocation[3])
			mode = 6;
		else
			mode = 2;
	} else if (gEkrBmLocation[POS_R] == gEkrBmLocation[3]) {
		if (gEkrBmLocation[POS_L] < gEkrBmLocation[2])
			mode = 0;
		else
			mode = 4;
	} else if (gEkrBmLocation[POS_L] < gEkrBmLocation[2]) {
		if (gEkrBmLocation[POS_R] >= gEkrBmLocation[3])
			mode = 7;
		else
			mode = 1;
	} else {
		if (gEkrBmLocation[POS_R] >= gEkrBmLocation[3])
			mode = 5;
		else
			mode = 3;
	}

	switch (gEkrDistanceType) {
	case EKR_DISTANCE_CLOSE:
	case EKR_DISTANCE_PROMOTION:
		img = Imgs_EkrBaseKaiten1[mode];
		break;

	case EKR_DISTANCE_FAR:
	case EKR_DISTANCE_FARFAR:
	case EKR_DISTANCE_MONOCOMBAT:
	default:
		img = Imgs_EkrBaseKaiten2[mode];
		break;
	}

	scale = mode << 2;
	LZ77UnCompVram(img, OBJ_VRAM0);
	CpuFastSet(Pal_EkrBaseKaiten, gPal + 0x140, 1);
	EnablePalSync();

	switch (gEkrDistanceType) {
	case EKR_DISTANCE_CLOSE:
	case EKR_DISTANCE_PROMOTION:
		proc = SpawnProc(ProcScr_EkrBaseKaiten, PROC_TREE_3);
		proc->type = identifier;
		proc->unk29 = 0;
		proc->timer = 0;
		proc->terminator = 0xB;
		proc->x1 = (gEkrBmLocation[POS_L] + gEkrBmLocation[2]) * 8 + 8;
		proc->y1 = (gEkrBmLocation[POS_R] + gEkrBmLocation[3]) * 8 + 8;
		proc->x2 = 0x78;
		proc->y2 = 0x68;

		if (proc->type == 0)
			anim = BasCreate(AccessArray(AnimScrs_EkrBaseKaiten1, mode, scale), 0x64);
		else
			anim = BasCreate(AccessArray(AnimScrs_EkrBaseKaiten4, mode, scale), 0x64);

		proc->anim = anim;
		anim->oam2 = 0x4800;
		anim->oam01 |= 0x400;

		if (proc->type == 0) {
			anim->xPosition = proc->x1;
			anim->yPosition = proc->y1;
		} else {
			anim->xPosition = proc->x2;
			anim->yPosition = proc->y2;
		}

		proc->unk60 = AccessArray(EkrBaseKaiten_Table1, mode, scale);
		proc->unk3E = 0;
		proc->unk36 = 0;
		break;

	case EKR_DISTANCE_FAR:
	case EKR_DISTANCE_FARFAR:
		proc = SpawnProc(ProcScr_EkrBaseKaiten, PROC_TREE_3);
		proc->type = identifier;
		proc->unk29 = 0;
		proc->timer = 0;
		proc->terminator = 0xB;
		proc->x1 = gEkrBmLocation[POS_L] * 0x10 + 8;
		proc->y1 = gEkrBmLocation[POS_R] * 0x10 + 8;
		proc->x2 = 0x48;
		proc->y2 = 0x68;

		if (gEkrInitPosReal == POS_R)
			proc->x2 -= BanimLeftDefaultPos[gEkrDistanceType];

		if (proc->type == 0)
			anim = BasCreate(AccessArray(AnimScrs_EkrBaseKaiten2, mode, scale), 0x64);
		else
			anim = BasCreate(AccessArray(AnimScrs_EkrBaseKaiten5, mode, scale), 0x64);

		proc->anim = anim;
		anim->oam2 = 0x4800;
		anim->oam01 |= 0x400;

		if (proc->type == 0) {
			anim->xPosition = proc->x1;
			anim->yPosition = proc->y1;
		} else {
			anim->xPosition = proc->x2;
			anim->yPosition = proc->y2;
		}

		proc->unk60 = AccessArray(EkrBaseKaiten_Table2, mode, scale);
		proc->unk3E = 0;
		proc->unk36 = 0;

		proc = SpawnProc(ProcScr_EkrBaseKaiten, PROC_TREE_3);
		proc->type = identifier;
		proc->unk29 = 1;
		proc->timer = 0;
		proc->terminator = 0xB;
		proc->x1 = gEkrBmLocation[2] * 0x10 + 8;
		proc->y1 = gEkrBmLocation[3] * 0x10 + 8;
		proc->x2 = 0xA8;
		proc->y2 = 0x68;

		if (gEkrInitPosReal == POS_L)
			proc->x2 = BanimLeftDefaultPos[gEkrDistanceType] + 0xA8;

		if (proc->type == 0)
			anim = BasCreate(AccessArray(AnimScrs_EkrBaseKaiten3, mode, scale), 0x64);
		else
			anim = BasCreate(AccessArray(AnimScrs_EkrBaseKaiten6, mode, scale), 0x64);

		proc->anim = anim;
		anim->oam2 = 0x4800;
		anim->oam01 |= 0x400;

		if (proc->type == 0) {
			anim->xPosition = proc->x1;
			anim->yPosition = proc->y1;
		} else {
			anim->xPosition = proc->x2;
			anim->yPosition = proc->y2;
		}

		proc->unk60 = AccessArray(EkrBaseKaiten_Table3, mode, scale);
		proc->unk3E = 0;
		proc->unk36 = 0;
		break;

	case EKR_DISTANCE_MONOCOMBAT:
		proc = SpawnProc(ProcScr_EkrBaseKaiten, PROC_TREE_3);
		proc->type = identifier;
		proc->unk29 = 0;
		proc->timer = 0;
		proc->terminator = 0xB;
		proc->x1 = gEkrBmLocation[2] * 0x10 + 8;
		proc->y1 = gEkrBmLocation[3] * 0x10 + 8;
		proc->x2 = 0x78;
		proc->y2 = 0x68;

		if (proc->type == 0)
			anim = BasCreate(AccessArray(AnimScrs_EkrBaseKaiten3, mode, scale), 0x64);
		else
			anim = BasCreate(AccessArray(AnimScrs_EkrBaseKaiten6, mode, scale), 0x64);

		proc->anim = anim;
		anim->oam2 = 0x4800;
		anim->oam01 |= 0x400;

		if (proc->type == 0) {
			anim->xPosition = proc->x1;
			anim->yPosition = proc->y1;
		} else {
			anim->xPosition = proc->x2;
			anim->yPosition = proc->y2;
		}

		proc->unk60 = AccessArray(EkrBaseKaiten_Table3, mode, scale);
		proc->unk3E = 0;
		proc->unk36 = 0;
		break;

	default:
		break;
	}
}
