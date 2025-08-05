#include "prelude.h"
#include "banim.h"
#include "item.h"
#include "unit.h"
#include "battle.h"
#include "faction.h"
#include "constants/iids.h"
#include "constants/banims.h"

const u16 RoundTypes_NormalPhy[EKR_DISTANCE_MAX] = {
	[EKR_DISTANCE_CLOSE]       = ANIM_ROUND_HIT_CLOSE,
	[EKR_DISTANCE_FAR]         = ANIM_ROUND_NONCRIT_FAR,
	[EKR_DISTANCE_FARFAR]      = ANIM_ROUND_NONCRIT_FAR,
	[EKR_DISTANCE_MONOCOMBAT]  = ANIM_ROUND_HIT_CLOSE,
	[EKR_DISTANCE_PROMOTION]   = ANIM_ROUND_HIT_CLOSE
};

const u16 RoundTypes_MissedPhy[EKR_DISTANCE_MAX] = {
	[EKR_DISTANCE_CLOSE]       = ANIM_ROUND_MISS_CLOSE,
	[EKR_DISTANCE_FAR]         = ANIM_ROUND_NONCRIT_FAR,
	[EKR_DISTANCE_FARFAR]      = ANIM_ROUND_NONCRIT_FAR,
	[EKR_DISTANCE_MONOCOMBAT]  = ANIM_ROUND_MISS_CLOSE,
	[EKR_DISTANCE_PROMOTION]   = ANIM_ROUND_MISS_CLOSE
};

const u16 RoundTypes_CriticalPhy[EKR_DISTANCE_MAX] = {
	[EKR_DISTANCE_CLOSE]       = ANIM_ROUND_CRIT_CLOSE,
	[EKR_DISTANCE_FAR]         = ANIM_ROUND_CRIT_FAR,
	[EKR_DISTANCE_FARFAR]      = ANIM_ROUND_CRIT_FAR,
	[EKR_DISTANCE_MONOCOMBAT]  = ANIM_ROUND_CRIT_CLOSE,
	[EKR_DISTANCE_PROMOTION]   = ANIM_ROUND_CRIT_CLOSE
};

const u16 RoundTypes_TargetMiss[EKR_DISTANCE_MAX] = {
	[EKR_DISTANCE_CLOSE]       = ANIM_ROUND_TAKING_MISS_CLOSE,
	[EKR_DISTANCE_FAR]         = ANIM_ROUND_TAKING_MISS_FAR,
	[EKR_DISTANCE_FARFAR]      = ANIM_ROUND_TAKING_MISS_FAR,
	[EKR_DISTANCE_MONOCOMBAT]  = ANIM_ROUND_TAKING_MISS_CLOSE,
	[EKR_DISTANCE_PROMOTION]   = ANIM_ROUND_TAKING_MISS_CLOSE
};

const u16 RoundTypes_TargetHitted[EKR_DISTANCE_MAX] = {
	[EKR_DISTANCE_CLOSE]       = ANIM_ROUND_TAKING_HIT_CLOSE,
	[EKR_DISTANCE_FAR]         = ANIM_ROUND_TAKING_HIT_FAR,
	[EKR_DISTANCE_FARFAR]      = ANIM_ROUND_TAKING_HIT_FAR,
	[EKR_DISTANCE_MONOCOMBAT]  = ANIM_ROUND_TAKING_HIT_CLOSE,
	[EKR_DISTANCE_PROMOTION]   = ANIM_ROUND_TAKING_HIT_CLOSE
};

const u16 RoundTypes_NormalMag[EKR_DISTANCE_MAX] = {
	[EKR_DISTANCE_CLOSE]       = ANIM_ROUND_NONCRIT_FAR,
	[EKR_DISTANCE_FAR]         = ANIM_ROUND_NONCRIT_FAR,
	[EKR_DISTANCE_FARFAR]      = ANIM_ROUND_NONCRIT_FAR,
	[EKR_DISTANCE_MONOCOMBAT]  = ANIM_ROUND_HIT_CLOSE,
	[EKR_DISTANCE_PROMOTION]   = ANIM_ROUND_HIT_CLOSE
};

const u16 RoundTypes_CriticalMag[EKR_DISTANCE_MAX] = {
	[EKR_DISTANCE_CLOSE]       = ANIM_ROUND_CRIT_FAR,
	[EKR_DISTANCE_FAR]         = ANIM_ROUND_CRIT_FAR,
	[EKR_DISTANCE_FARFAR]      = ANIM_ROUND_CRIT_FAR,
	[EKR_DISTANCE_MONOCOMBAT]  = ANIM_ROUND_CRIT_CLOSE,
	[EKR_DISTANCE_PROMOTION]   = ANIM_ROUND_CRIT_CLOSE
};

const u16 RoundTypes_Dragon1[EKR_DISTANCE_MAX] = {
	[EKR_DISTANCE_CLOSE]       = ANIM_ROUND_HIT_CLOSE,
	[EKR_DISTANCE_FAR]         = ANIM_ROUND_HIT_CLOSE,
	[EKR_DISTANCE_FARFAR]      = ANIM_ROUND_HIT_CLOSE,
	[EKR_DISTANCE_MONOCOMBAT]  = ANIM_ROUND_INVALID,
	[EKR_DISTANCE_PROMOTION]   = ANIM_ROUND_INVALID
};

const u16 RoundTypes_Dragon2[EKR_DISTANCE_MAX] = {
	[EKR_DISTANCE_CLOSE]       = ANIM_ROUND_NONCRIT_FAR,
	[EKR_DISTANCE_FAR]         = ANIM_ROUND_NONCRIT_FAR,
	[EKR_DISTANCE_FARFAR]      = ANIM_ROUND_NONCRIT_FAR,
	[EKR_DISTANCE_MONOCOMBAT]  = ANIM_ROUND_INVALID,
	[EKR_DISTANCE_PROMOTION]   = ANIM_ROUND_INVALID
};

const u16 RoundTypes_Dragon3[EKR_DISTANCE_MAX] = {
	[EKR_DISTANCE_CLOSE]       = ANIM_ROUND_CRIT_FAR,
	[EKR_DISTANCE_FAR]         = ANIM_ROUND_CRIT_FAR,
	[EKR_DISTANCE_FARFAR]      = ANIM_ROUND_CRIT_FAR,
	[EKR_DISTANCE_MONOCOMBAT]  = ANIM_ROUND_INVALID,
	[EKR_DISTANCE_PROMOTION]   = ANIM_ROUND_INVALID
};

// https://decomp.me/scratch/EcNSg
#if 0
void ParseBattleHitToBanimCmd(void)
{
	int i;
	u16 round_info[2];
	int round, hpoff_l, hpoff_r;
	int local_distance_types[2];
	int is_dark_breath;
	struct BattleUnit *battle_units[2];
	struct BattleHit *hit = gBattleHits;

	gpEkrTriangleUnits[POS_L] = NULL;
	gpEkrTriangleUnits[POS_R] = NULL;

	if (gEkrDistanceType == EKR_DISTANCE_PROMOTION) {
		gAnimRoundData[0 + POS_L] = ANIM_ROUND_TAKING_MISS_CLOSE;
		gAnimRoundData[0 + POS_R] = ANIM_ROUND_TAKING_MISS_CLOSE;

		gAnimRoundData[2 + POS_L] |= 0xFFFF;
		gAnimRoundData[2 + POS_R] |= 0xFFFF;
		return;
	}

	if (gBattleSt.flags & BATTLE_FLAG_REFRESH) {
		gAnimRoundData[0 + POS_L] = ANIM_ROUND_TAKING_HIT_CLOSE;
		gAnimRoundData[0 + POS_R] = ANIM_ROUND_TAKING_HIT_FAR;

		gAnimRoundData[2 + POS_L] |= 0xFFFF;
		gAnimRoundData[2 + POS_R] |= 0xFFFF;
		return;
	}

	local_distance_types[POS_L] = gEkrDistanceType;
	local_distance_types[POS_R] = gEkrDistanceType;

	is_dark_breath = false;

	battle_units[POS_L] = gpEkrBattleUnitLeft;
	battle_units[POS_R] = gpEkrBattleUnitRight;

	if (GetItemIid(battle_units[POS_L]->weapon_before) == IID_RUNESWORD  && (local_distance_types[POS_L] == ANIM_ROUND_HIT_CLOSE))
		local_distance_types[POS_L] = ANIM_ROUND_CRIT_CLOSE;
	if (GetItemIid(battle_units[POS_R]->weapon_before) == IID_RUNESWORD  && (local_distance_types[POS_R] == ANIM_ROUND_HIT_CLOSE))
		local_distance_types[POS_R] = ANIM_ROUND_CRIT_CLOSE;

	if (GetItemIid(battle_units[POS_L]->weapon_before) == IID_HANDAXE    && (local_distance_types[POS_L] == ANIM_ROUND_HIT_CLOSE))
		local_distance_types[POS_L] = ANIM_ROUND_CRIT_CLOSE;
	if (GetItemIid(battle_units[POS_R]->weapon_before) == IID_HANDAXE    && (local_distance_types[POS_R] == ANIM_ROUND_HIT_CLOSE))
		local_distance_types[POS_R] = ANIM_ROUND_CRIT_CLOSE;

	if (GetItemIid(battle_units[POS_L]->weapon_before) == IID_TOMAHAWK   && (local_distance_types[POS_L] == ANIM_ROUND_HIT_CLOSE))
		local_distance_types[POS_L] = ANIM_ROUND_CRIT_CLOSE;
	if (GetItemIid(battle_units[POS_R]->weapon_before) == IID_TOMAHAWK   && (local_distance_types[POS_R] == ANIM_ROUND_HIT_CLOSE))
		local_distance_types[POS_R] = ANIM_ROUND_CRIT_CLOSE;

	if (GetItemIid(battle_units[POS_L]->weapon_before) == IID_FIRESTONE  && (local_distance_types[POS_L] == ANIM_ROUND_HIT_CLOSE))
		local_distance_types[POS_L] = ANIM_ROUND_CRIT_CLOSE;

	if (GetItemIid(battle_units[POS_L]->weapon_before) == IID_DARKBREATH && (local_distance_types[POS_L] == ANIM_ROUND_HIT_CLOSE))
		is_dark_breath = true;

	for (i = 0; i < 0x14; i++)
		gAnimRoundData[i] = 0xFFFF;

	for (i = 0; i < 0x14; i++)
		gEfxHpLut[2 + i] = 0xFFFF;

	gEfxHpLut[0] = gEkrGaugeHp[0];
	gEfxHpLut[1] = gEkrGaugeHp[1];

	round = 0;
	hpoff_l = 0;
	hpoff_r = 0;

	for (; (hit->info & BATTLE_HIT_INFO_END) == 0; hit++, round++) {
		int is_target;
		u16 *act_round, *tar_round;
		int act_distance, tar_distance;
		struct Unit *actor_unit;
		int cur_is_dark_breath;

		if (hit->info & BATTLE_HIT_INFO_ACTORB)
			is_target = true;
		else
			is_target = false;

		if (gBanimPosIsTarget == is_target) {
			act_round = &round_info[POS_L];
			tar_round = &round_info[POS_R];
			act_distance = local_distance_types[POS_L];
			tar_distance = local_distance_types[POS_R];
			actor_unit = &battle_units[POS_L]->unit;
			cur_is_dark_breath = is_dark_breath;

			if (round == 0)
				gEkrInitialHitSide = POS_L;
		} else {
			act_round = &round_info[POS_R];
			tar_round = &round_info[POS_L];
			act_distance = local_distance_types[POS_R];
			tar_distance = local_distance_types[POS_L];
			actor_unit = &battle_units[POS_R]->unit;
			cur_is_dark_breath = is_dark_breath;

			if (round == 0)
				gEkrInitialHitSide = POS_R;
		}

		if (hit->attributes & BATTLE_HIT_ATTR_TRIANGLE_ATTACK) {
			gpEkrTriangleUnits[0] = gBattleSt.extra_unit_a;
			gpEkrTriangleUnits[1] = gBattleSt.extra_unit_b;
		}

		/* Check for attacker */
		if (hit->attributes & BATTLE_HIT_ATTR_CRIT) {
			if (!UnitKnowsMagic(actor_unit))
				*act_round = RoundTypes_CriticalPhy[round];
			else
				*act_round = RoundTypes_CriticalMag[round];
		} else if (cur_is_dark_breath == 0) {
			if (!UnitKnowsMagic(actor_unit))
				*act_round = RoundTypes_NormalPhy[round];
			else
				*act_round = RoundTypes_NormalMag[round];
		} else {
			// Idunn!
			switch (BanimSpawnRandB(2)) {
			case 0:
				*act_round = RoundTypes_Dragon1[round];
				break;

			case 1:
				*act_round = RoundTypes_Dragon2[round];
				break;

			case 2:
				*act_round = RoundTypes_Dragon3[round];
				break;
			}
		}

		/* Check for defender */
		if (hit->attributes & BATTLE_HIT_ATTR_MISS) {
			/**
			 * Make sure to ignore critical anim?
			 */
			if (!UnitKnowsMagic(actor_unit))
				*act_round = RoundTypes_MissedPhy[round];
			else
				*act_round = RoundTypes_NormalMag[round];

			tar_round = RoundTypes_TargetMiss[round];
		} else
			tar_round = RoundTypes_TargetHitted[round];

		gAnimRoundData[ANIM_REF_OFFSET(round, POS_L)] = round_info[POS_L];
		gAnimRoundData[ANIM_REF_OFFSET(round, POS_R)] = round_info[POS_R];

		if ((hit->attributes & BATTLE_HIT_ATTR_MISS) == 0) {
			if (hit->attributes & BATTLE_HIT_ATTR_DEVIL) {
				/* devil */
				if (gBanimPosIsTarget[POS_L] == is_target) {
					i16 new_hp = GetEfxHp(ANIM_REF_OFFSET(hpoff_l, POS_L)) - hit->damage;

					if (new_hp < 0)
						new_hp = 0;

					hpoff_l++;
					gEfxHpLut[ANIM_REF_OFFSET(hpoff_l, POS_L)] = new_hp;
					gAnimRoundData[ANIM_REF_OFFSET(round, POS_L)] |= ANIM_ROUND_DEVIL;
				} else {
					i16 new_hp = GetEfxHp(ANIM_REF_OFFSET(hpoff_r, POS_R)) - hit->damage;

					if (new_hp < 0)
						new_hp = 0;

					hpoff_r++;
					gEfxHpLut[ANIM_REF_OFFSET(hpoff_r, POS_R)] = new_hp;
					gAnimRoundData[ANIM_REF_OFFSET(round, POS_R)] |= ANIM_ROUND_DEVIL;
				}
			} else if (hit->attributes & BATTLE_HIT_ATTR_HPSTEAL) {
				/* devil */
				if (gBanimPosIsTarget[POS_L] == is_target) {
					i16 new_hp;

					/* target */
					new_hp= GetEfxHp(ANIM_REF_OFFSET(hpoff_r, POS_R)) - hit->damage;
					if (new_hp < 0)
						new_hp = 0;

					hpoff_r++;
					gEfxHpLut[ANIM_REF_OFFSET(hpoff_r, POS_R)] = new_hp;

					/* actor */
					new_hp = GetEfxHp(ANIM_REF_OFFSET(hpoff_l, POS_L)) + hit->damage;
					if (new_hp > gBanimMaxHP[POS_L])
						new_hp = gBanimMaxHP[POS_L];

					hpoff_l++;
					gEfxHpLut[ANIM_REF_OFFSET(hpoff_l, POS_L)] = new_hp;
				} else {
					i16 new_hp;

					/* target */
					new_hp= GetEfxHp(ANIM_REF_OFFSET(hpoff_l, POS_L)) - hit->damage;
					if (new_hp < 0)
						new_hp = 0;

					hpoff_l++;
					gEfxHpLut[ANIM_REF_OFFSET(hpoff_l, POS_L)] = new_hp;

					/* actor */
					new_hp = GetEfxHp(ANIM_REF_OFFSET(hpoff_r, POS_R)) + hit->damage;
					if (new_hp > gBanimMaxHP[POS_R])
						new_hp = gBanimMaxHP[POS_R];

					hpoff_r++;
					gEfxHpLut[ANIM_REF_OFFSET(hpoff_r, POS_R)] = new_hp;
				}
			} else {
				/* normal */
				if (gBanimPosIsTarget[POS_L] == is_target) {
					i16 new_hp = GetEfxHp(ANIM_REF_OFFSET(hpoff_r, POS_R)) - hit->damage;

					if (new_hp < 0)
						new_hp = 0;

					hpoff_r++;
					gEfxHpLut[ANIM_REF_OFFSET(hpoff_r, POS_R)] = new_hp;

					if (hit->attributes & BATTLE_HIT_ATTR_POISON)
						gAnimRoundData[ANIM_REF_OFFSET(round, POS_R)] |= ANIM_ROUND_POISON;

				} else {
					i16 new_hp= GetEfxHp(ANIM_REF_OFFSET(hpoff_l, POS_L)) - hit->damage;

					if (new_hp < 0)
						new_hp = 0;

					hpoff_l++;
					gEfxHpLut[ANIM_REF_OFFSET(hpoff_l, POS_L)] = new_hp;

					if (hit->attributes & BATTLE_HIT_ATTR_POISON)
						gAnimRoundData[ANIM_REF_OFFSET(round, POS_L)] |= ANIM_ROUND_POISON;
				}
			}
		}
	}
}
#endif

bool CheckBattleHasHit(void)
{
	const struct BattleHit *hit = &gBattleHits[0];

	if (hit->info & BATTLE_HIT_INFO_FINISHES)
		return true;
	else
		return false;
}

int GetBanimUniquePal(struct Unit * unit)
{
	int idx = !!(UNIT_ATTRIBUTES(unit) & UNIT_ATTR_PROMOTED);

	return unit->pinfo->banim_pal[idx] - 1;
}

const u16 *GetBanimTriangleAttackPalette(i16 bid, u16 item)
{
	switch (bid) {
	case BANIM_67:
		switch (GetItemIid(item)) {
		case IID_BALLISTA:
			return Pal_08113FB8;

		case IID_LONGBALLISTA:
			return Pal_08113F98;

		case IID_KILLERBALLISTA:
			return Pal_08113FD8;

		default:
			return NULL;
		}
		break;

	default:
		return NULL;
	}
}

int GetBanimFactionPalette(u32 faction)
{
	u8 _faction = faction;

	switch (_faction) {
	case FACTION_RED:
		return BANIMPAL_RED;

	case FACTION_GREEN:
		return BANIMPAL_GREEN;

	case FACTION_PURPLE:
		return BANIMPAL_PURPLE;

	case FACTION_BLUE:
		return BANIMPAL_BLUE;
	}

	return BANIMPAL_BLUE;
}

void EkrPrepareBanimfx(struct Anim * anim, i16 index)
{
	gBanimIdx[GetAnimPosition(anim)] = index;
	UpdateBanimFrame();
	LoadAnimFrame(anim, ANIM_ROUND_TAKING_HIT_CLOSE);
}

i16 GetBattleAnimRoundType(int index)
{
	i16 * buf = (i16 *)gAnimRoundData;

	if (buf[index] == -1)
		return -1;
	else
		return buf[index] & (0xFFF);
}

i16 func_fe6_0804A57C(int index)
{
	i16 * buf = (i16 *)gAnimRoundData;

	if (buf[index] == -1)
		return 0;
	else
		return buf[index] & (~0xFFF);
}

i16 GetEfxHp(int index)
{
	return gEfxHpLut[index] & 0xFFF;
}

i16 func_fe6_0804A5C0(int index)
{
	i16 * buf = (i16 *)gEfxHpLut;

	return buf[index] & (~0xFFF);
}
