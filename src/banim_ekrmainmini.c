#include "prelude.h"
#include "proc.h"
#include "oam.h"
#include "banim_sprite.h"
#include "banim.h"
#include "banim_data.h"

void EkrMainMini_ExecCommands(struct EkrMainMiniBuf *buf, struct Anim *anim)
{
	int type;

	if (anim == NULL)
		return;

	type = anim->flags2 & ANIM_BIT2_CMD_MASK;
	if (type == 0)
		return;

	if (type & ANIM_BIT2_COMMAND) {
		while (1) {
			if (anim->cqSize == 0)
				goto L_cmd_loop_end;

			switch (anim->cq[anim->cqSize - 1]) {
			case 0:
				break;

			case BAS_CMD(0x01):
			case BAS_CMD(0x02):
				EkrMainMini_C01_Blocking(anim);
				break;

			case BAS_CMD(0x05):
				if (GetAnimLayer(anim) == 0)
					StartClassReelSpellAnim(anim);

				/* fall through */

			case BAS_CMD(0x03):
			case BAS_CMD(0x04):
				anim->scrCur++;
				break;

			case BAS_CMD(0x0D):
				EkrMainMini_C0D_ExecNextRoundAfterAttack(anim);
				break;

			case BAS_CMD(0x18):
				EkrMainMini_C01_Blocking(anim);
				break;

			case BAS_CMD(0x30):
			case BAS_CMD(0x31):
			case BAS_CMD(0x32):
			default:
				break;
			}
			anim->cqSize--;
		}

		L_cmd_loop_end:
			anim->flags2 &= ~(ANIM_BIT2_COMMAND |
							  ANIM_BIT2_0800 |
							  ANIM_BIT2_0080 |
							  ANIM_BIT2_0040 |
							  ANIM_BIT2_0020 |
							  ANIM_BIT2_0010 |
							  ANIM_BIT2_0008 |
							  ANIM_BIT2_0004 |
							  ANIM_BIT2_0002 |
							  ANIM_BIT2_0001);
	}

	if (type & ANIM_BIT2_FRAME) {
		if (GetAnimLayer(anim) == 0 && buf->img_sheet != anim->imgSheet) {
			SyncBanimImage(anim);
			buf->img_sheet = anim->imgSheet;
		}

		anim->flags2 &= ~(ANIM_BIT2_FRAME |
						  ANIM_BIT2_0800 |
						  ANIM_BIT2_0080 |
						  ANIM_BIT2_0040 |
						  ANIM_BIT2_0020 |
						  ANIM_BIT2_0010 |
						  ANIM_BIT2_0008 |
						  ANIM_BIT2_0004 |
						  ANIM_BIT2_0002 |
						  ANIM_BIT2_0001);
	}

	if (type & ANIM_BIT2_STOP)
		anim->nextRoundId = -1;
}

void EkrMainMini_C01_Blocking(struct Anim * anim)
{
	anim->nextRoundId = -2;

	if (anim->flags3 & ANIM_BIT3_C01_BLOCK_END_INBATTLE) {
		anim->flags3 &= ANIM_BIT3_C01_BLOCK_END_INBATTLE;
		anim->nextRoundId = 0;
		anim->scrCur++;
	}
}

void EkrMainMini_C0D_ExecNextRoundAfterAttack(struct Anim * anim)
{
	register const void *tmp_ptr;
	register struct BanimScrFrame *scr_start asm("r1");
	register int scr_offset asm("r0");
	struct EkrMainMiniBuf *buf = anim->priv;

	if (GetAnimLayer(anim) == 0) {
		const u8 *mode_conf = BanimDefaultModeConfig;
		struct BattleAnim *banim_data = buf->bid + gBanimTable;
		const int *banim_mode = banim_data->modes;

		struct Anim *anim1 = buf->anim1;
		struct Anim *anim2 = buf->anim2;

		const u8 *scr_buf = tmp_ptr = buf->scr_buf;
		int frame_idx = mode_conf[ANIM_ROUND_TAKING_HIT_CLOSE * 4 + 0];

		scr_offset = banim_mode[frame_idx];
		scr_start = (void *)(scr_buf + scr_offset);

		anim1->imgSheet = scr_start->img;
#if !NONMATCHING
		anim1->sprData = tmp_ptr = (tmp_ptr = anim1->sprDataPool) + scr_start->oam_offset;
		anim2->sprData = tmp_ptr = (tmp_ptr = anim2->sprDataPool) + BAS_OAM_REF_MAX_SIZE;
#else
		anim1->sprData = anim1->sprDataPool + scr_start->oam_offset;
		anim2->sprData = anim2->sprDataPool + BAS_OAM_REF_MAX_SIZE;
#endif
		if (buf->img_sheet != anim->imgSheet) {
			NewEkrChienCHR(anim);
			buf->img_sheet = anim->imgSheet;
		}
	}
}

void EkrMainMini_InitAnim(struct EkrMainMiniBuf *buf)
{
	int mode1, mode2;
	int priority1, priority2;
	struct Anim *anim;
	u8 *oam_buf;
	u32 *scr1, *scr2;
	struct BattleAnim *banim, *tmp_banim;
	u8 *scr_buf;
	int *modes;

	banim = gBanimTable;

	mode1     = BanimDefaultModeConfig[buf->round_type * 4 + 0];
	priority1 = BanimDefaultModeConfig[buf->round_type * 4 + 1];
	mode2     = BanimDefaultModeConfig[buf->round_type * 4 + 2];
	priority2 = BanimDefaultModeConfig[buf->round_type * 4 + 3];

	/**
	 * scr
	 */
	LZ77UnCompWram(banim[buf->bid].script, buf->scr_buf);

	tmp_banim = &banim[buf->bid];
	modes = tmp_banim->modes;
	scr_buf = buf->scr_buf;

	scr1 = AnimScr_DefaultAnim;
	if (mode1 != (u8)BANIM_MODE_INVALID)
		scr1 = (void *)(scr_buf + modes[mode1]);

	scr2 = AnimScr_DefaultAnim;
	if (mode2 != (u8)BANIM_MODE_INVALID)
		scr2 = (void *)(scr_buf + modes[mode2]);

	/**
	 * oam
	 */
	if (buf->pos == POS_L) {
		oam_buf = (u8 *)buf->oam_buf;

		LZ77UnCompWram(tmp_banim->oam_l, oam_buf);
		*(u32 *)(oam_buf + BAS_OAM_REF_MAX_SIZE) = 1;
	} else {
		oam_buf = (u8 *)buf->oam_buf;

		LZ77UnCompWram(tmp_banim->oam_r, oam_buf);
		*(u32 *)(oam_buf + BAS_OAM_REF_MAX_SIZE) = 1;
	}

	/**
	 * front anim
	 */
	anim = BasCreate(scr1, priority1);
	anim->sprDataPool = buf->oam_buf;
	anim->xPosition = buf->x;
	anim->yPosition = buf->y;
	anim->oam2 = (buf->oam2_pal * 0x1000) | OAM2_LAYER(2) | buf->oam2_chr;
	anim->flags2 |= (buf->pos << 9) | ANIM_BIT2_0400 | ANIM_BIT2_BACK_FRAME;
	anim->nextRoundId = 0;
	anim->currentRoundType = buf->round_type;
	anim->imgBuf = buf->img_buf;

	buf->anim1 = anim;
	anim->priv = buf;

	/**
	 * back anim
	 */
	anim = BasCreate(scr2, priority2);
	anim->sprDataPool = buf->oam_buf;
	anim->xPosition = buf->x;
	anim->yPosition = buf->y;
	anim->oam2 = (buf->oam2_pal * 0x1000) | OAM2_LAYER(2) | buf->oam2_chr;
	anim->flags2 |= (buf->pos << 9) | ANIM_BIT2_0400 | ANIM_BIT2_FRONT_FRAME;
	anim->nextRoundId = 0;
	anim->currentRoundType = buf->round_type;
	anim->imgBuf = buf->img_buf;

	buf->anim2 = anim;
	anim->priv = buf;

	/**
	 * pal
	 */
	LZ77UnCompWram(banim[buf->bid].pal, buf->pal_buf);
	CpuFastCopy(buf->pal_buf + PAL_OFFSET(buf->faction_pal), gPal + 0x10 * 0x10 + PAL_OFFSET(buf->oam2_pal), 0x20);
	buf->img_sheet = NULL; // ?
	EnablePalSync();
}

void EkrMainMini_UpdateAnim(struct EkrMainMiniBuf *buf)
{
	int mode1, mode2;
	struct Anim *anim;
	u8 *oam_buf;
	u32 *scr1, *scr2;
	struct BattleAnim *banim, *tmp_banim;
	u8 *scr_buf;
	int *modes;

	banim = gBanimTable;

	mode1 = BanimDefaultModeConfig[buf->round_type * 4 + 0];
	mode2 = BanimDefaultModeConfig[buf->round_type * 4 + 2];

	/**
	 * scr
	 */
	LZ77UnCompWram(banim[buf->bid].script, buf->scr_buf);

	tmp_banim = &banim[buf->bid];
	modes = tmp_banim->modes;
	scr_buf = buf->scr_buf;

	scr1 = AnimScr_DefaultAnim;
	if (mode1 != (u8)BANIM_MODE_INVALID)
		scr1 = (void *)(scr_buf + modes[mode1]);

	scr2 = AnimScr_DefaultAnim;
	if (mode2 != (u8)BANIM_MODE_INVALID)
		scr2 = (void *)(scr_buf + modes[mode2]);

	/**
	 * oam
	 */
	if (buf->pos == POS_L) {
		oam_buf = (u8 *)buf->oam_buf;

		LZ77UnCompWram(tmp_banim->oam_l, oam_buf);
		*(u32 *)(oam_buf + BAS_OAM_REF_MAX_SIZE) = 1;
	} else {
		oam_buf = (u8 *)buf->oam_buf;

		LZ77UnCompWram(tmp_banim->oam_r, oam_buf);
		*(u32 *)(oam_buf + BAS_OAM_REF_MAX_SIZE) = 1;
	}

	/**
	 * front anim
	 */
	anim = buf->anim1;
	anim->script = scr1;
	anim->scrCur = scr1;
	anim->sprDataPool = buf->oam_buf;
	anim->xPosition = buf->x;
	anim->yPosition = buf->y;
	anim->oam2 = (buf->oam2_pal * 0x1000) | OAM2_LAYER(2) | buf->oam2_chr;
	anim->flags2 &= ANIM_BIT2_FRONT_FRAME | ANIM_BIT2_POS_RIGHT | ANIM_BIT2_0400;
	anim->flags3 = 0;
	anim->timer = 0;
	anim->nextRoundId = 0;
	anim->currentRoundType = buf->round_type;
	anim->imgBuf = buf->img_buf;

	anim->cqSize = 0;
	buf->anim1 = anim;

	/**
	 * back anim
	 */
	anim = buf->anim2;
	anim->script = scr2;
	anim->scrCur = scr2;
	anim->sprDataPool = buf->oam_buf;
	anim->xPosition = buf->x;
	anim->yPosition = buf->y;
	anim->oam2 = (buf->oam2_pal * 0x1000) | OAM2_LAYER(2) | buf->oam2_chr;
	anim->flags2 &= ANIM_BIT2_FRONT_FRAME | ANIM_BIT2_POS_RIGHT | ANIM_BIT2_0400;
	anim->flags3 = 0;
	anim->timer = 0;
	anim->nextRoundId = 0;
	anim->currentRoundType = buf->round_type;
	anim->imgBuf = buf->img_buf;

	anim->cqSize = 0;
	buf->anim2 = anim;

	/**
	 * pal
	 */
	LZ77UnCompWram(banim[buf->bid].pal, buf->pal_buf);
	CpuFastCopy(buf->pal_buf + PAL_OFFSET(buf->faction_pal), gPal + 0x10 * 0x10 + PAL_OFFSET(buf->oam2_pal), 0x20);
	EnablePalSync();
}

void EkrMainMini_ChangeAnim(struct EkrMainMiniBuf *buf, int bid)
{
	buf->bid = bid;
	EkrMainMini_UpdateAnim(buf);
}

void EkrMainMini_SetAnimPosition(struct EkrMainMiniBuf *buf, u16 x, u16 y)
{
	struct Anim * anim;

	buf->x = x;
	buf->y = y;

	anim = buf->anim1;
	anim->xPosition = buf->x;
	anim->yPosition = buf->y;

	anim = buf->anim2;
	anim->xPosition = buf->x;
	anim->yPosition = buf->y;
}

void EkrMainMini_SetAnimLayer(struct EkrMainMiniBuf *buf, u16 layer)
{
	struct Anim * anim;

	anim = buf->anim1;
	anim->oam2 = layer << 10;

	anim = buf->anim2;
	anim->oam2 = layer << 10;
}

bool EkrMainMini_CheckBlocking(struct EkrMainMiniBuf *buf)
{
	struct Anim * anim1 = buf->anim1;
	struct Anim * anim2 = buf->anim2;

	if (anim1->nextRoundId == (u16)-2)
		return true;

	if (anim2->nextRoundId == (u16)-2)
		return true;

	return false;
}

void EkrMainMini_EndBlock(struct EkrMainMiniBuf *buf)
{
	struct Anim * anim;

	anim = buf->anim1;
	anim->flags3 |= ANIM_BIT3_C01_BLOCK_END_INBATTLE;

	anim = buf->anim2;
	anim->flags3 |= ANIM_BIT3_C01_BLOCK_END_INBATTLE;
}

bool EkrMainMini_CheckDone(struct EkrMainMiniBuf *buf)
{
	struct Anim * anim = buf->anim1;

	if (anim->nextRoundId != (u16)-1)
		return false;

	return true;
}

struct ProcScr CONST_DATA ProcScr_EfxAnimeDrv[] = {
	PROC_NAME_DEBUG("ekrAnimeDrvProc"),
	PROC_REPEAT(EkrAnimeDrv_Loop),
	PROC_END,
};

void NewEfxAnimeDrvProc(void)
{
	ProcPtr *pproc = &gpProcEfxAnimeDrv;

	*pproc = SpawnProc(ProcScr_EfxAnimeDrv, PROC_TREE_4);
	BasInit();
}

void EndEfxAnimeDrvProc(void)
{
	Proc_End(gpProcEfxAnimeDrv);
}

void EkrAnimeDrv_Loop(void)
{
	BasUpdateAll();
}

struct ProcScr CONST_DATA ProcScr_EkrUnitMainMini[] = {
	PROC_NAME_DEBUG("ekrUnitMainMini"),
	PROC_REPEAT(EkrMainMini_Loop),
	PROC_END,
};

void NewEkrUnitMainMini(struct EkrMainMiniBuf *buf)
{
	struct ProcEkrUnitMainMini * proc = SpawnProc(ProcScr_EkrUnitMainMini, PROC_TREE_4);

	EkrMainMini_InitAnim(buf);

	proc->buf = buf;
	buf->proc = proc;
	buf->valid = true;
}

void EndEkrMainMini(struct EkrMainMiniBuf *buf)
{
	BasRemove(buf->anim1);
	BasRemove(buf->anim2);

	buf->anim1 = 0;
	buf->anim2 = 0;

	Proc_End(buf->proc);
}

void EkrMainMini_Loop(struct ProcEkrUnitMainMini * proc)
{
	struct EkrMainMiniBuf *buf = proc->buf;

	EkrMainMini_ExecCommands(buf, buf->anim1);
	EkrMainMini_ExecCommands(buf, buf->anim2);
}
