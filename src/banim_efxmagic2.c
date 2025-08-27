#include "prelude.h"
#include "hardware.h"
#include "util.h"
#include "oam.h"
#include "banim.h"
#include "banim_ekrdragon.h"
#include "constants/songs.h"

void StartSpellAnimDivine(struct Anim *anim)
{
	struct ProcEfx *proc;

	SpellFx_Begin();
	NewEfxSpellCast();
	SpellFx_ClearBG1Position();

	proc = SpawnProc(ProcScr_EfxDivine, PROC_TREE_3);
	proc->anim = anim;
	proc->timer = 0;
	proc->hitted = CheckRoundMiss(GetAnimRoundTypeAnotherSide(anim));
}

void EfxDivine_Loop(struct ProcEfx *proc)
{
	struct Anim *anim = GetAnimAnotherSide(proc->anim);
	int duration = EfxGetCamMovDuration();

	proc->timer++;

	if (proc->timer == 1) {
		PlaySFX(0x127, 0x100, proc->anim->xPosition, 1);
		NewEfxDivineBG(anim);
		NewEfxDivineOBJ(proc->anim);
		return;
	}

	if (proc->timer == 20) {
		PlaySFX(0x128, 0x100, proc->anim->xPosition, 1);
		return;
	}

	if (proc->timer == 50) {
		NewEfxFarAttackWithDistance(proc->anim, -1);
		return;
	}

	if (proc->timer == duration + 70) {
		NewEfxDivineBG2(anim);
		PlaySFX(0x129, 0x100, anim->xPosition, 1);
		return;
	}

	if (proc->timer == duration + 73) {
		NewEfxFlashBgWhite(proc->anim, 10);
		return;
	}

	if (proc->timer == duration + 75) {
		NewEfxDivineBG3(anim);

		anim->flags3 |= (ANIM_BIT3_C02_BLOCK_END | ANIM_BIT3_C01_BLOCK_END_INBATTLE);

		StartBattleAnimHitEffectsDefault(anim, proc->hitted);

		if (!proc->hitted)
			EfxPlayHittedSFX(anim);

		return;
	}

	if (proc->timer == duration + 90)
		return;

	if (proc->timer == 100) {
		SpellFx_Finish();
		EndEfxSpellCastAsync();
		Proc_Break(proc);
	}
}

void NewEfxDivineBG(struct Anim *anim)
{
	struct ProcEfxBG *proc;

	gEfxBgSemaphore++;

	proc = SpawnProc(ProcScr_EfxDivineBG, PROC_TREE_3);
	proc->anim = anim;
	proc->timer = 0;
	proc->frame = 0;
	proc->frame_config = FrameArray_EfxDivineBG;
	proc->tsal = TsaArray_EfxDivineBG;
	proc->tsar = TsaArray_EfxDivineBG;
	proc->img = ImgArray_EfxDivineBG;

	SpellFx_RegisterBgPal(Pal_EfxDivineBG, PLTT_SIZE_4BPP);

	if (gEkrDistanceType != EKR_DISTANCE_CLOSE) {
		if (GetAnimPosition(proc->anim) == POS_L)
			SetBgOffset(BG_1, 232, 0);
		else
			SetBgOffset(BG_1, 24, 0);
	}

	SpellFx_SetSomeColorEffect();
}

void NewEfxDivineBG2(struct Anim *anim)
{
	struct ProcEfxBG *proc;

	gEfxBgSemaphore++;

	proc = SpawnProc(ProcScr_EfxDivineBG, PROC_TREE_3);
	proc->anim = anim;
	proc->timer = 0;
	proc->frame = 0;
	proc->frame_config = FrameArray_EfxDivineBG2;
	proc->tsal = TsaArray_EfxDivineBG2;
	proc->tsar = TsaArray_EfxDivineBG2;
	proc->img = ImgArray_EfxDivineBG2;

	SpellFx_RegisterBgPal(Pal_EfxDivineBG, PLTT_SIZE_4BPP);

	if (gEkrDistanceType != EKR_DISTANCE_CLOSE) {
		if (GetAnimPosition(proc->anim) == POS_L)
			SetBgOffset(BG_1, 24, 0);
		else
			SetBgOffset(BG_1, 232, 0);
	}

	SpellFx_SetSomeColorEffect();
}

void NewEfxDivineBG3(struct Anim *anim)
{
	struct ProcEfxBG *proc;

	gEfxBgSemaphore++;

	proc = SpawnProc(ProcScr_EfxDivineBG, PROC_TREE_3);
	proc->anim = anim;
	proc->timer = 0;
	proc->frame = 0;
	proc->frame_config = FrameArray_EfxDivineBG3;

	proc->tsal = TsaArray_EfxDivineBG3;
	proc->tsar = TsaArray_EfxDivineBG3;
	proc->img = ImgArray_EfxDivineBG3;

	SpellFx_RegisterBgPal(Pal_EfxDivineBG3, PLTT_SIZE_4BPP);

	if (gEkrDistanceType != EKR_DISTANCE_CLOSE) {
		if (GetAnimPosition(proc->anim) == POS_L)
			SetBgOffset(BG_1, 24, 0);
		else
			SetBgOffset(BG_1, 232, 0);
	}

	SpellFx_SetSomeColorEffect();
}

void EfxDivineBG_Loop(struct ProcEfxBG *proc)
{
	int ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

	if (ret >= 0) {
		u16 ** tsaL = proc->tsal;
		u16 ** tsaR = proc->tsar;
		u16 ** img = proc->img;

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

void NewEfxDivineOBJ(struct Anim *anim)
{
	struct ProcEfxOBJ *proc;
	struct Anim * frontAnim;

	gEfxBgSemaphore++;

	proc = SpawnProc(ProcScr_EfxDivineOBJ, PROC_TREE_3);
	proc->anim = anim;
	proc->timer = 0;

	frontAnim = EfxCreateFrontAnim(anim, AnimScr_EfxDivineOBJ, AnimScr_EfxDivineOBJ, AnimScr_EfxDivineOBJ, AnimScr_EfxDivineOBJ);
	proc->anim2 = frontAnim;

	if (GetAnimPosition(anim) == POS_L)
		frontAnim->xPosition -= 6;
	else
		frontAnim->xPosition += 6;

	SpellFx_RegisterObjPal(Pal_EfxDivineOBJ, PLTT_SIZE_4BPP);
	SpellFx_RegisterObjGfx(Img_EfxDivineOBJ, 32 * 4 * CHR_SIZE);
}

void EfxDivineOBJ_Loop(struct ProcEfxOBJ *proc)
{
	proc->timer++;

	if (proc->timer == 44) {
		BasRemove(proc->anim2);
		gEfxBgSemaphore--;
		Proc_Break(proc);
	}
}
