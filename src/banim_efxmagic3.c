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

