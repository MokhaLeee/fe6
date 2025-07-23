#include "prelude.h"
#include "proc.h"
#include "oam.h"
#include "hardware.h"
#include "banim_sprite.h"
#include "banim.h"

/**
 * C26: banim_code_toss_sword
 * C27: banim_code_toss_shield
 */
struct ProcScr CONST_DATA ProcScr_EfxYushaSpinShield[] = {
	PROC_NAME_DEBUG("efxYushaSpinShield"),
	PROC_REPEAT(EfxYushaSpinShield_Null),
	PROC_END,
};

void NewEfxYushaSpinShield(struct Anim *anim, int r1)
{
	struct ProcEfx * proc;

	proc = SpawnProc(ProcScr_EfxYushaSpinShield, PROC_TREE_3);
	proc->anim = anim;
	proc->timer = 0;
	NewEfxYushaSpinShieldOBJ(anim, r1);
}

void EfxYushaSpinShield_Null(struct ProcEfx * proc)
{
    Proc_Break(proc);
}

struct ProcScr CONST_DATA ProcScr_EfxYushaSpinShieldOBJ[] = {
	PROC_NAME_DEBUG("efxYushaSpinShieldOBJ"),
	PROC_REPEAT(EfxYushaSpinShieldOBJ_1),
	PROC_REPEAT(EfxYushaSpinShieldOBJ_2),
	PROC_REPEAT(EfxYushaSpinShieldOBJ_3),
	PROC_REPEAT(EfxYushaSpinShieldOBJ_4),
	PROC_END,
};

void NewEfxYushaSpinShieldOBJ(struct Anim *anim, int r1)
{
	u32 *scr1, *scr2;
	struct ProcEfxOBJ * proc;
	struct Anim *anim2;

	proc = SpawnProc(ProcScr_EfxYushaSpinShieldOBJ, PROC_TREE_3);
	proc->anim = anim;
	proc->timer = 0;
	proc->unk29 = r1;

	if (r1 == 0) {
		scr1 = AnimScr_YushaSpinShieldOBJ_LeftTypeA;
		scr2 = AnimScr_YushaSpinShieldOBJ_RightTypeA;
	} else {
		scr1 = AnimScr_YushaSpinShieldOBJ_LeftTypeB;
		scr2 = AnimScr_YushaSpinShieldOBJ_RightTypeB;
	}

	anim2 = EfxCreateFrontAnim(anim, scr2, scr1, scr2, scr1);
	proc->anim2 = anim2;

	/**
	 * oam2_data::chr = 0;
	 * oam2_data::pal = 0;
	 */
	anim2->oam2 &= 0xC00;

	if (GetAnimPosition(anim) == POS_L)
		anim2->oam2 |= OAM2_PAL(OBPAL_EFX_UNIT_L) + VRAMOFF_OBJ_4000 / CHR_LINE;
	else
		anim2->oam2 |= OAM2_PAL(OBPAL_EFX_UNIT_R) + VRAMOFF_OBJ_6000 / CHR_SIZE;
}

void EfxYushaSpinShieldOBJ_1(struct ProcEfxOBJ * proc)
{
	struct Anim *anim2 = proc->anim2;
	if (++proc->timer != 0x45)
		return;
	
	if (proc->unk29 == 0) {
		if (GetAnimPosition(proc->anim) == POS_L) {
			anim2->script = AnimScr_YushaSpinShieldOBJ2_LeftTypeA;
			anim2->scrCur = AnimScr_YushaSpinShieldOBJ2_LeftTypeA;
		} else {
			anim2->script = AnimScr_YushaSpinShieldOBJ2_RightTypeA;
			anim2->scrCur = AnimScr_YushaSpinShieldOBJ2_RightTypeA;
		}
	} else {
		if (GetAnimPosition(proc->anim) == POS_L) {
			anim2->script = AnimScr_YushaSpinShieldOBJ2_LeftTypeB;
			anim2->scrCur = AnimScr_YushaSpinShieldOBJ2_LeftTypeB;
		} else {
			anim2->script = AnimScr_YushaSpinShieldOBJ2_RightTypeB;
			anim2->scrCur = AnimScr_YushaSpinShieldOBJ2_RightTypeB;
		}
	}

	anim2->timer = 0;
	proc->timer = 0;
	Proc_Break(proc);
}

void EfxYushaSpinShieldOBJ_2(struct ProcEfxOBJ * proc)
{
	if (!(proc->anim->flags3 & ANIM_BIT3_C01_BLOCKING_IN_BATTLE))
		return;

	if (!(proc->anim->flags3 & ANIM_BIT3_HIT_EFFECT_APPLIED))
		return;

	proc->timer = 0;
	Proc_Break(proc);
}

void EfxYushaSpinShieldOBJ_3(struct ProcEfxOBJ * proc)
{
	struct Anim *anim2 = proc->anim2;

	if (CheckEkrHitDone() != true)
		return;

	if (proc->unk29 == 0) {
		if (GetAnimPosition(proc->anim) == POS_L) {
			anim2->script = AnimScr_YushaSpinShieldOBJ3_LeftTypeA;
			anim2->scrCur = AnimScr_YushaSpinShieldOBJ3_LeftTypeA;
		} else {
			anim2->script = AnimScr_YushaSpinShieldOBJ3_RightTypeA;
			anim2->scrCur = AnimScr_YushaSpinShieldOBJ3_RightTypeA;
		}
	} else {
		if (GetAnimPosition(proc->anim) == POS_L) {
			anim2->script = AnimScr_YushaSpinShieldOBJ3_LeftTypeB;
			anim2->scrCur = AnimScr_YushaSpinShieldOBJ3_LeftTypeB;
		} else {
			anim2->script = AnimScr_YushaSpinShieldOBJ3_RightTypeB;
			anim2->scrCur = AnimScr_YushaSpinShieldOBJ3_RightTypeB;
		}
	}

	anim2->timer = 0;
	proc->timer = 0;
	Proc_Break(proc);
}

void EfxYushaSpinShieldOBJ_4(struct ProcEfxOBJ * proc)
{
	if (++proc->timer == 0x14) {
		proc->timer = 0;
		BasRemove(proc->anim2);
		Proc_Break(proc);
	}
}

/**
 * C2C: banim_code_effect_sealed_sword_fire
 */
