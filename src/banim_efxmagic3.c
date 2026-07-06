#include "prelude.h"
#include "hardware.h"
#include "util.h"
#include "oam.h"
#include "banim.h"
#include "banim_ekrdragon.h"
#include "constants/songs.h"

/**
 * Eclipse
 */
void StartSpellAnimEclipse(struct Anim * anim)
{
	struct ProcEfx * proc;

	SpellFx_Begin();
	NewEfxSpellCast();
	SpellFx_ClearBG1Position();

	proc = SpawnProc(ProcScr_EfxHazymoon, PROC_TREE_3);
	proc->anim = anim;
	proc->timer = 0;
	proc->hitted = CheckRoundMiss(GetAnimRoundTypeAnotherSide(anim));
}

void EfxHazymoon_Loop(struct ProcEfx *proc)
{
	struct Anim *anim = GetAnimAnotherSide(proc->anim);
	int duration = EfxGetCamMovDuration();

	proc->timer++;

	if (proc->timer == 1)
		NewEfxFarAttackWithDistance(proc->anim, -1);

	if (proc->timer == duration + 1) {
		SetBlendAlpha(0, 16);
		NewEfxALPHA(anim, 0, 30, 0, 16, 0);
		NewEfxALPHA(anim, 0xA0, 30, 16, 0, 0);
		NewEfxHazymoonBG1(proc->anim);
		NewEfxHazymoonOBJ3(proc->anim);
		PlaySFX(SONG_138, 0x100, 0x78, 0);
		return;
	}

	if (proc->timer == duration + 0x7F) {
		NewEfxResireRST(anim, NewEfxRestRST(anim, 0x52, 15, 0, 2), 0x3C);
		NewEfxRestWINH_(anim, 0x53, EfxRestWINH_DefaultHblank);
		return;
	}

	if (proc->timer == duration + 0xD2) {
		NewEfxHazymoonBG2(anim);
		return;
	}

	if (proc->timer == duration + 0xD7) {
		PlaySFX(SONG_139, 0x100, anim->xPosition, 1);
		return;
	}

	if (proc->timer == duration + 0xF1) {
		NewEfxHazymoonOBJ2(proc->anim);
		return;
	}

	if (proc->timer == duration + 0x13C) {
		PlaySFX(SONG_13A, 0x100, anim->xPosition, 1);
		NewEfxFlashBgWhite(anim, 10);
		anim->flags3 |= ANIM_BIT3_C02_BLOCK_END | ANIM_BIT3_C01_BLOCK_END_INBATTLE;
		StartBattleAnimHitEffectsDefault(anim, proc->hitted);

		if (!proc->hitted)
			EfxPlayHittedSFX(anim);

		return;
	}

	if (proc->timer == duration + 0x146) {
		NewEfxHazymoonBG3(anim);
		NewEfxALPHA(anim, 16, 10, 16, 0, 0);
		return;
	}

	if (proc->timer == duration + 0x15E)
		return;

	if (proc->timer == duration + 0x168) {
		SpellFx_Finish();
		EndEfxSpellCastAsync();
		Proc_Break(proc);
	}
}

void NewEfxHazymoonBG1(struct Anim *anim)
{
	struct ProcEfxEclipseBG *proc;

	gEfxBgSemaphore++;

	proc = SpawnProc(ProcScr_EfxHazymoonBG, PROC_TREE_3);
	proc->anim = anim;
	proc->timer = 0;
	proc->frame = 0;
	proc->frame_config = FrameArray_EfxHazymoonBG1;
	proc->tsal = TsaArray_EfxHazymoonBG;
	proc->tsar = TsaArray_EfxHazymoonBG;
	proc->img = ImgArray_EfxHazymoonBG;

	SpellFx_RegisterBgPal(Pal_EfxResireBG, PLTT_SIZE_4BPP);
	SpellFx_SetSomeColorEffect();

	SetWinEnable(0, 0, 0);
}

void NewEfxHazymoonBG2(struct Anim *anim)
{
	struct ProcEfxEclipseBG *proc;

	gEfxBgSemaphore++;

	proc = SpawnProc(ProcScr_EfxHazymoonBG, PROC_TREE_3);
	proc->anim = anim;
	proc->timer = 0;
	proc->frame = 0;
	proc->frame_config = FrameArray_EfxHazymoonBG2;
	proc->tsal = TsaArray_EfxHazymoonBG;
	proc->tsar = TsaArray_EfxHazymoonBG;
	proc->img = ImgArray_EfxHazymoonBG;

	SpellFx_RegisterBgPal(Pal_EfxHazymoonBG2, PLTT_SIZE_4BPP);
	SpellFx_SetSomeColorEffect();

	SetBlendAlpha(12, 6);
}

void NewEfxHazymoonBG3(struct Anim *anim)
{
	struct ProcEfxEclipseBG *proc;

	gEfxBgSemaphore++;

	proc = SpawnProc(ProcScr_EfxHazymoonBG, PROC_TREE_3);
	proc->anim = anim;
	proc->timer = 0;
	proc->frame = 0;
	proc->frame_config = FrameArray_EfxHazymoonBG3;
	proc->tsal = TsaArray_EfxHazymoonBG;
	proc->tsar = TsaArray_EfxHazymoonBG;
	proc->img = ImgArray_EfxHazymoonBG;

	SpellFx_RegisterBgPal(Pal_EfxHazymoonBG3, PLTT_SIZE_4BPP);
	SpellFx_SetSomeColorEffect();
}

void EfxHazymoonBG_Loop(struct ProcEfxEclipseBG * proc)
{
	i16 ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

	if (ret >= 0) {
		u16 **tsaL = proc->tsal;
		u16 **tsaR = proc->tsar;
		u16 **img = proc->img;

		SpellFx_RegisterBgGfx(*(img + ret), 32 * 8 * CHR_SIZE);
		SpellFx_WriteBgMap(proc->anim, *(tsaL + ret), *(tsaR + ret));
		return;
	}

	if (ret == -1) {
		SpellFx_ClearBG1();
		gEfxBgSemaphore--;
		SpellFx_ClearColorEffects();
		Proc_Break(proc);
	}
}

void NewEfxHazymoonOBJ2(struct BaSprite *anim)
{
	struct ProcEfxMagicOBJ *proc;
	struct BaSprite *anim_front;
	struct BaSprite *anim_other;

	gEfxBgSemaphore++;

	proc = (struct ProcEfxMagicOBJ *)SpawnProc(ProcScr_EfxHazymoonOBJ2, PROC_TREE_3);
	proc->anim = anim;

	anim_other = GetAnimAnotherSide(anim);

	proc->timer = 0;

	anim_front = EfxCreateFrontAnim(anim_other, AnimScr_Common, AnimScr_Common,
					AnimScr_Common, AnimScr_Common);
	proc->anim2 = anim_front;

	anim_front->oam2 = (anim_front->oam2 & 0xF3FF) | 0x400;

	if (GetAnimPosition(anim_other) == POS_L)
		anim_front->xPosition -= 8;
	else
		anim_front->xPosition += 8;

	anim_front->yPosition -= 0x10;

	if (GetEkrDragonStateTypeIdunn() != 0)
		anim_front->xPosition -= 0x10;
}

void EfxHazymoonOBJ2_OnEnd(struct ProcEfxMagicOBJ *proc)
{
	gEfxBgSemaphore--;
	BasRemove(proc->anim2);
}

void EfxHazymoonOBJ2_Loop1(struct ProcEfxMagicOBJ *proc)
{
	struct BaSprite *anim = proc->anim2;

	proc->timer++;

	if (proc->timer == 1) {
		anim->script = AnimScr_EfxHazymoonOBJ2_1;
		anim->scrCur = AnimScr_EfxHazymoonOBJ2_1;
		anim->timer = 0;
		proc->terminator = 0xa;
		SpellFx_RegisterObjPal(Pal_EfxHazymoonOBJ2, 0x20);
		SpellFx_RegisterObjGfx(Img_EfxHazymoonOBJ2_1, 0x1000);
	} else if (proc->timer == proc->terminator) {
		proc->timer = 0;
		Proc_Break(proc);
	}
}

void EfxHazymoonOBJ2_Loop2(struct ProcEfxMagicOBJ *proc)
{
	struct BaSprite *anim = proc->anim2;

	proc->timer++;

	if (proc->timer == 1) {
		anim->script = AnimScr_EfxHazymoonOBJ2_2;
		anim->scrCur = AnimScr_EfxHazymoonOBJ2_2;
		anim->timer = 0;
		proc->terminator = 0xa;
		SpellFx_RegisterObjPal(Pal_EfxHazymoonOBJ2, 0x20);
		SpellFx_RegisterObjGfx(Img_EfxHazymoonOBJ2_2, 0x1000);
	} else if (proc->timer == proc->terminator) {
		proc->timer = 0;
		Proc_Break(proc);
	}
}

void EfxHazymoonOBJ2_Loop3(struct ProcEfxMagicOBJ *proc)
{
	struct BaSprite *anim = proc->anim2;

	proc->timer++;

	if (proc->timer == 1) {
		anim->script = AnimScr_EfxHazymoonOBJ2_3;
		anim->scrCur = AnimScr_EfxHazymoonOBJ2_3;
		anim->timer = 0;
		proc->terminator = 0xa;
		SpellFx_RegisterObjPal(Pal_EfxHazymoonOBJ2, 0x20);
		SpellFx_RegisterObjGfx(Img_EfxHazymoonOBJ2_3, 0x1000);
	} else if (proc->timer == proc->terminator) {
		proc->timer = 0;
		Proc_Break(proc);
	}
}

void NewEfxHazymoonOBJ3(struct BaSprite *anim)
{
	struct ProcEfxMagicOBJ *proc;

	gEfxBgSemaphore++;

	proc = (struct ProcEfxMagicOBJ *)SpawnProc(ProcScr_EfxHazymoonOBJ3, PROC_TREE_3);
	proc->anim = anim;
	proc->timer = 0;
	proc->terminator = 0;
	proc->unk_30 = 0x64;

	SpellFx_RegisterObjPal(Pal_EfxMistyrainOBJ1, 0x20);
	SpellFx_RegisterObjGfx(Img_EfxMistyrainOBJ1_1, 0x1000);
}

void EfxHazymoonOBJ3_Loop(struct ProcEfxMagicOBJ *proc)
{
	i16 r0, r2;
	void *coord;
	i16 x, y;

	proc->timer++;

	if (proc->timer == 0x12) {
		proc->timer = 0;

		r2 = proc->terminator;
		coord = gEclipseAnimSpriteCoordinates;

		x = gEclipseAnimSpriteCoordinates[r2 * 2 + 0];
		y = gEclipseAnimSpriteCoordinates[r2 * 2 + 1];

		NewEfxHazymoonOBJ3RND(proc->anim, x, y);

		proc->terminator++;

		if (proc->terminator == 6) {
			gEfxBgSemaphore--;
			Proc_Break(proc);
		}
	}
}

void NewEfxHazymoonOBJ3RND(struct BaSprite *anim, int x, int y)
{
	struct ProcEfxMagicOBJ *proc;
	struct BaSprite *anim_front;

	gEfxBgSemaphore++;

	proc = (struct ProcEfxMagicOBJ *)SpawnProc(ProcScr_EfxHazymoonOBJ3RND, PROC_TREE_3);
	proc->anim = anim;
	proc->timer = 0;

	anim_front = EfxCreateFrontAnim(anim, AnimScr_EfxHazymoonOBJ3RND, AnimScr_EfxHazymoonOBJ3RND,
					AnimScr_EfxHazymoonOBJ3RND, AnimScr_EfxHazymoonOBJ3RND);
	proc->anim2 = anim_front;
	anim_front->xPosition = x;
	anim_front->yPosition = y;
}

void EfxHazymoonOBJ3RND_Loop(struct ProcEfxMagicOBJ *proc)
{
	gEfxBgSemaphore--;
	BasRemove(proc->anim2);
}

/**
 * Fenrir
 */
void StartSpellAnimFenrir(struct Anim *anim)
{
	struct ProcEfx *proc;

	SpellFx_Begin();
	NewEfxSpellCast();
	SpellFx_ClearBG1Position();

	proc = SpawnProc(ProcScr_EfxFenrir, PROC_TREE_3);
	proc->anim = anim;
	proc->timer = 0;
	proc->hitted = CheckRoundMiss(GetAnimRoundTypeAnotherSide(anim));
}

void EfxFenrir_Loop(struct ProcEfx *proc)
{
	struct Anim *anim;
	int duration;
	int frame;
	u8 *disp;

	anim = GetAnimAnotherSide(proc->anim);
	duration = EfxGetCamMovDuration();

	proc->timer++;

	if (proc->timer == 1)
		NewEfxFarAttackWithDistance(proc->anim, -1);

	if (proc->timer == duration + 1) {
		NewEfxFenrirBG(anim, 0x64);
		NewEfxFenrirBGCOL(anim, 0x64);
		frame = 0x100;
		NewEfxRestRST(anim, 0x64, 2, frame, 1);
		NewEfxRestWINH_(anim, 0x69, EfxRestWINH_DefaultHblank);

		disp = (u8 *)&gDispIo;
		disp[0x3C] = (disp[0x3C] & 0x3F) | 0x40;
		{
			register u8 *p asm("r0") = disp + 0x44;
			u8 cb;

			*p++ = 0;
			cb = 0x10;
			*p++ = cb;
			*p = 0;
			NewEfxALPHA(anim, 0, 0xF, 0, cb, 0);
		}
		NewEfxALPHA(anim, 0x46, 0xF, 0x10, 0, 0);
		PlaySFX(SONG_130, 0x100, 0x78, 0);
	} else if (proc->timer == duration + 0x28) {
		NewEfxFenrirOBJ(anim, 0x4A);
		PlaySFX(SONG_131, 0x100, anim->xPosition, 1);
	} else if (proc->timer == duration + 0x6E) {
		NewEfxFenrirBG2_A(anim);
	} else if (proc->timer == duration + 0x6F) {
		PlaySFX(SONG_132, 0x100, anim->xPosition, 1);
	} else if (proc->timer == duration + 0x8B) {
		PlaySFX(SONG_132, 0x100, anim->xPosition, 1);
	} else if (proc->timer == duration + 0xA7) {
		PlaySFX(SONG_132, 0x100, anim->xPosition, 1);
	} else if (proc->timer == duration + 0xC3) {
		PlaySFX(SONG_132, 0x100, anim->xPosition, 1);
	} else if (proc->timer == duration + 0xDF) {
		PlaySFX(SONG_132, 0x100, anim->xPosition, 1);
	} else if (proc->timer == duration + 0xFB) {
		PlaySFX(SONG_132, 0x100, anim->xPosition, 1);
	} else if (proc->timer == duration + 0x117) {
		PlaySFX(SONG_132, 0x100, anim->xPosition, 1);
	} else if (proc->timer == duration + 0x133) {
		PlaySFX(SONG_132, 0x100, anim->xPosition, 1);
	} else if (proc->timer == duration + 0x166) {
		NewEfxFlashBgWhite(anim, 0xA);
		NewEfxFenrirOBJ2(anim);
		anim->flags3 |= ANIM_BIT3_C02_BLOCK_END | ANIM_BIT3_C01_BLOCK_END_INBATTLE;
		StartBattleAnimHitEffectsDefault(anim, proc->hitted);
		PlaySFX(SONG_133, 0x100, anim->xPosition, 1);

		if (!proc->hitted)
			EfxPlayHittedSFX(anim);
	} else if (proc->timer == duration + 0x170) {
		NewEfxFenrirBG2_B(anim);
		NewEfxALPHA(anim, 0x12, 8, 0x10, 0, 0);
	} else if (proc->timer == duration + 0x19A) {
	} else if (proc->timer == duration + 0x1A4) {
		SpellFx_Finish();
		EndEfxSpellCastAsync();
		Proc_Break(proc);
	}
}

void NewEfxFenrirBG(struct Anim *anim, int duration)
{
	struct ProcEfxBG *proc;

	gEfxBgSemaphore++;

	proc = SpawnProc(ProcScr_EfxFenrirBG, PROC_TREE_3);
	proc->anim = anim;
	proc->timer = 0;
	proc->terminator = duration;

	SpellFx_RegisterBgGfx(Img_EfxFenrirBG, 32 * 8 * CHR_SIZE);
	SpellFx_ClearBG1();

	LZ77UnCompWram(Tsa_EfxFenrirBG, gEkrTsaBuffer);
	EfxTmCpyBG(gEkrTsaBuffer, gBg1Tm, 0x20, 0x20,
		   BGPAL_EFX_SPELL_BG, VRAMOFF_BANIM_SPELL_BG / CHR_SIZE);

	EnableBgSync(BG1_SYNC_BIT);
	SpellFx_SetSomeColorEffect();
	SetWinEnable(0, 0, 0);
}

void EfxFenrirBG_OnEnd(void)
{
	SpellFx_ClearBG1();
	gEfxBgSemaphore--;
	SpellFx_ClearColorEffects();
}

void EfxFenrirBG_Loop(struct ProcEfxBG *proc)
{
	gDispIo.bg_off[BG_1].y++;
	gDispIo.bg_off[BG_1].x--;

	proc->timer++;

	if (proc->timer > proc->terminator)
		Proc_Break(proc);
}

void NewEfxFenrirBGCOL(struct Anim *anim, int duration)
{
	struct ProcEfxBGCOL *proc;

	gEfxBgSemaphore++;

	proc = SpawnProc(ProcScr_EfxFenrirBGCOL, PROC_TREE_3);
	proc->anim = anim;
	proc->timer = 0;
	proc->timer2 = 0;
	proc->terminator = duration;
	proc->frame = 0;
	proc->frame_config = FrameArray_EfxFenrirBGCOL;
	proc->pal = Pal_EfxFenrirBGCOL;

	SpellFx_RegisterBgPal(Pal_EfxFenrirBGCOL, 0x20);
}

void EfxFenrirBGCOL_OnEnd(void)
{
	gEfxBgSemaphore--;
}

void EfxFenrirBGCOL_Loop(struct ProcEfxBGCOL *proc)
{
	int ret;
	const u16 *pal;

	ret = EfxAdvanceFrameLut((i16 *)&proc->timer, (i16 *)&proc->frame,
				 proc->frame_config);

	if (ret >= 0) {
		pal = proc->pal;
		SpellFx_RegisterBgPal(pal + ret * 0x10, 0x20);
	}

	proc->timer2++;

	if (proc->timer2 > proc->terminator)
		Proc_Break(proc);
}

void NewEfxFenrirOBJ(struct Anim *anim, int duration)
{
	struct ProcEfxOBJ *proc;

	gEfxBgSemaphore++;

	proc = SpawnProc(ProcScr_EfxFenrirOBJ, PROC_TREE_3);
	proc->anim = anim;
	proc->timer = 0;
	proc->terminator = duration;
	proc->anim2 = EfxCreateFrontAnim(anim, AnimScr_EfxFenrirOBJ,
					 AnimScr_EfxFenrirOBJ,
					 AnimScr_EfxFenrirOBJ,
					 AnimScr_EfxFenrirOBJ);

	SpellFx_RegisterObjPal(Pal_EfxFenrirOBJ, 0x20);
	SpellFx_RegisterObjGfx(Img_EfxFenrirOBJ, 32 * 4 * CHR_SIZE);
}
