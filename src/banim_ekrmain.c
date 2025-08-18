#include "prelude.h"
#include "proc.h"
#include "oam.h"
#include "move.h"
#include "hardware.h"
#include "unit.h"
#include "battle.h"
#include "banim_sprite.h"
#include "banim.h"
#include "banim_data.h"
#include "constants/banims.h"
#include "constants/jids.h"

CONST_DATA AnimScr AnimScr_DefaultAnim[] = {
    ANIMSCR_FRAME(1, NULL, BAS_OAM_MAX_SIZE),
    ANIMSCR_BLOCKED
};

CONST_DATA void *TsaConfs_BanimTmA[] = {
	TsaConf_BanimTmA_08112380,
	TsaConf_BanimTmA_08112418,
	TsaConf_BanimTmA_081124B0,
	TsaConf_BanimTmA_08112548,
	TsaConf_BanimTmA_081124B0,
	TsaConf_BanimTmA_08112548,
	TsaConf_BanimTmA_081124B0,
	TsaConf_BanimTmA_08112548,
	TsaConf_BanimTmA_08112380,
	TsaConf_BanimTmA_08112418,
};

struct ProcScr CONST_DATA ProcScr_EkrChienCHR[] = {
	PROC_NAME_DEBUG("ekrChienCHR"),
	PROC_REPEAT(EkrChienCHR_Loop),
	PROC_END,
};

void NewEkrChienCHR(struct Anim *anim)
{
	struct ProcEfx *proc;

	proc = SpawnProc(ProcScr_EkrChienCHR, PROC_TREE_3);
	proc->anim = anim;
}

void EkrChienCHR_Loop(struct ProcEfx *proc)
{
	SyncBanimImage(proc->anim);
	Proc_Break(proc);
}

void SyncBanimImage(struct Anim * anim)
{
	void *mmap;

	mmap = OBJ_VRAM0 + OAM2_CHR(anim->oam2) * CHR_SIZE;

	LZ77UnCompWram(anim->imgSheet, anim->imgBuf);
	RegisterDataMove(anim->imgBuf, mmap, 0x2000);
}

void ApplyBanimUniquePalette(u32 *buf, int pos)
{
	u32 i;

	if (gBanimUniquePaletteDisabled[pos] == 0)
		return;

	for (i = 0; i < 8; i++)
		buf[i] = buf[i + 0x20];
}

int GetBanimPalette(int banim_id, int pos)
{
	u32 jid;
	struct BattleUnit *bu;

	if (POS_L == pos)
		bu = gpEkrBattleUnitLeft;
	else
		bu = gpEkrBattleUnitRight;

	jid = bu->unit.jinfo->id;
	switch (jid) {
	case JID_ARCHER:
		return BANIM_0E;
	
	case JID_ARCHER_F:
		return BANIM_0F;
	
	case JID_SNIPER:
		return BANIM_04;
	
	case JID_SNIPER_F:
		return BANIM_05;
	
	default:
		return banim_id;
	}
}

#if 0
void UpdateBanimFrame(void)
{
	int bid, bid_pal, chara_pal;
	struct BattleAnim *banim = gBanimTable;

	gpImgSheet[POS_R] = NULL;
	gpImgSheet[POS_L] = NULL;

	if (gBanimValid[POS_L] == true) {
		bid = gBanimIdx[POS_L];
		bid_pal = gBanimFactionPal[POS_L];
		chara_pal = gBanimUniquePal[POS_L];

		LZ77UnCompWram(banim[bid].script, &gBanimScrs[POS_L * BAS_SCR_MAX_SIZE]);
		gpBanimModesLeft = banim[bid].modes;
		LZ77UnCompWram(banim[GetBanimPalette(bid, POS_L)].pal, gBanimPaletteRight);
		
		if (chara_pal != -1) {
            struct BattleAnimCharaPal *capal = &gBanimCharaPalTable[chara_pal];

			LZ77UnCompWram(capal->pal, gBanimPaletteRight);
			ApplyBanimUniquePalette((u32 *)gBanimPaletteRight, POS_L);
		}

		gpEfxUnitPaletteBackup[POS_L] = gBanimPaletteRight + PAL_OFFSET(bid_pal);
		CpuFastCopy(gBanimPaletteRight + PAL_OFFSET(bid_pal), PAL_OBJ(OBPAL_EFX_UNIT_L), 0x20);
		CpuFastCopy(gpBanimTriAtkPalettes[POS_L], PAL_OBJ(OBPAL_EFX_UNIT_BAK_L), 0x20);

		EnablePalSync();

		if (bid != BANIM_74)
			LZ77UnCompWram(banim[bid].oam_l, &gBanimOamBufs[POS_L * BAS_OAM_MAX_SIZE]);
		else
			LZ77UnCompWram(banim[bid].oam_r, &gBanimOamBufs[POS_L * BAS_OAM_MAX_SIZE]);

		*(u32 *)(gBanimOamBufs + POS_L * BAS_OAM_MAX_SIZE + BAS_OAM_MAX_SIZE) = 1;
	}

	if (gBanimValid[POS_R] == true) {
		bid = gBanimIdx[POS_R];
		bid_pal = gBanimFactionPal[POS_R];
		chara_pal = gBanimUniquePal[POS_R];

		LZ77UnCompWram(banim[bid].script, &gBanimScrs[POS_R * BAS_SCR_MAX_SIZE]);
		gpBanimModesRight = banim[bid].modes;
		LZ77UnCompWram(banim[GetBanimPalette(bid, POS_R)].pal, gBanimPaletteRight);
		
		if (chara_pal != -1) {
            struct BattleAnimCharaPal *capal = &gBanimCharaPalTable[chara_pal];

			LZ77UnCompWram(capal->pal, gBanimPaletteRight);
			ApplyBanimUniquePalette((u32 *)gBanimPaletteRight, POS_R);
		}

		gpEfxUnitPaletteBackup[POS_R] = gBanimPaletteRight + PAL_OFFSET(bid_pal);
		CpuFastCopy(gBanimPaletteRight + PAL_OFFSET(bid_pal), PAL_OBJ(OBPAL_EFX_UNIT_R), 0x20);
		CpuFastCopy(gpBanimTriAtkPalettes[POS_R], PAL_OBJ(OBPAL_EFX_UNIT_BAK_R), 0x20);

		EnablePalSync();

		LZ77UnCompWram(banim[bid].oam_r, &gBanimOamBufs[POS_R * BAS_OAM_MAX_SIZE]);

		*(u32 *)(gBanimOamBufs + POS_R * BAS_OAM_MAX_SIZE + BAS_OAM_MAX_SIZE) = 1;
	}

	/* triangle*/
	if (gpEkrTriangleUnits[0] != NULL) {
		bid = GetBattleAnimationId(gpEkrTriangleUnits[0]->jinfo->banim_info, 0);
		gpBanimTriAtkPalettes[0] = banim[bid].pal;

		chara_pal = (i16)GetBanimUniquePal(gpEkrTriangleUnits[0]);
		if (chara_pal != -1) {
            struct BattleAnimCharaPal *capal = &gBanimCharaPalTable[chara_pal];

			gpBanimTriAtkPalettes[0] = (void *)capal->pal;
        }

		bid = GetBattleAnimationId(gpEkrTriangleUnits[1]->jinfo->banim_info, 0);
		gpBanimTriAtkPalettes[1] = banim[bid].pal;

		chara_pal = (i16)GetBanimUniquePal(gpEkrTriangleUnits[1]);
		if (chara_pal != -1) {
            struct BattleAnimCharaPal *capal = &gBanimCharaPalTable[chara_pal];

			gpBanimTriAtkPalettes[1] = (void *)capal->pal;
        }
	}
}
#endif
