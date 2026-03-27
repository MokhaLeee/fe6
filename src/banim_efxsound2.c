#include "prelude.h"
#include "proc.h"
#include "bm.h"
#include "m4a.h"
#include "sound.h"
#include "util.h"
#include "unit.h"
#include "item.h"
#include "battle.h"
#include "faction.h"

#include "banim.h"
#include "banim_ekrbattle.h"
#include "banim_ekrdragon.h"

#include "constants/songs.h"
#include "constants/pids.h"
#include "constants/jids.h"
#include "constants/iids.h"

u16 GetEfxSoundType1FromTerrain(u16 terrain)
{
	int ret;

	if (GetBattleAnimArenaFlag() == true)
		return 0;

	/* TODO: terrain index */
	switch (terrain) {
	case 1:
	case 2:
	case 3:
	case 4:
	case 5:
	case 10:
	case 17:
	case 25:
	case 26:
	case 27:
	case 28:
	case 34:
	case 35:
	case 37:
	case 39:
	case 40:
	case 41:
	case 43:
	case 47:
		ret = 0;
		break;

	case 12:
	case 13:
		ret = 1;
		break;

	case 16:
	case 21:
	case 22:
		ret = 2;
		break;

	case 18:
	case 38:
	case 42:
		ret = 3;
		break;

	case 14:
	case 15:
		ret = 4;
		break;

	case 19:
	case 20:
		ret = 5;
		break;

	case 6:
	case 7:
	case 8:
	case 9:
	case 11:
	case 23:
	case 24:
	case 29:
	case 30:
	case 31:
	case 32:
	case 33:
	case 36:
	case 45:
	case 48:
	case 49:
	case 50:
		ret = 6;
		break;

	case 0:
	case 44:
	case 46:
	default:
		ret = 0;
		break;
	}
	return ret;
}

int IsAnimSoundInPosition(struct Anim * anim)
{
	int sound_pos = GetProperAnimSoundLocation(anim) + anim->xPosition;

	if (GetAnimPosition(anim) == POS_L) {
		if (sound_pos > 0x58)
			return false;
		else
			return true;
	} else {
		if (sound_pos <= 0x97)
			return false;
		else
			return true;
	}
}

u16 GetEfxSoundType2FromBaseCon(u16 basecon)
{
	int ret = 0;

	if (basecon >= 5) {
		if (basecon <= 8)
			ret = 1;
		else if (basecon <= 0xB)
			ret = 2;
		else if (basecon <= 0xF)
			ret = 3;
	}
	return ret;
}

i16 GetEfxHpChangeType(struct Anim *anim)
{
	int offset, hp1, hp2;
	offset = gEfxHpLutOff[GetAnimPosition(anim)];
	offset = offset * 2 + GetAnimPosition(anim);

	hp1 = GetEfxHp(offset);
	hp2 = GetEfxHp(offset + 2);

	if (hp1 != hp2) {
		/* Hurt */
		if (hp2 != 0)
			return EFX_HPT_CHANGED;

		/* Defeated */
		return EFX_HPT_DEFEATED;
	}

	/* Hp not change */
	return EFX_HPT_NOT_CHANGE;
}

void EfxPlayHittedSFX(struct Anim *anim)
{
	i16 songid = -1;

	EfxPlayCriticalHittedSFX(anim);

	switch (GetEfxHpChangeType(anim)) {
	case EFX_HPT_CHANGED:
		songid = SONG_D4;
		break;

	case EFX_HPT_DEFEATED:
		songid = SONG_D5;
		break;

	case EFX_HPT_NOT_CHANGE:
		songid = SONG_EC;
		break;

	default:
		break;
	}

	if (songid != -1) {
		EfxPlaySE(songid, 0x100);
		M4aPlayWithPostionCtrl(songid, anim->xPosition, 1);
	}
}

void EfxPlayCriticalHittedSFX(struct Anim *anim)
{
	struct Anim *anim_other = GetAnimAnotherSide(anim);

	switch (GetEfxHpChangeType(anim)) {
	case EFX_HPT_CHANGED:
	case EFX_HPT_DEFEATED:
		if (CheckRoundCrit(anim_other) == true) {
			EfxPlaySE(SONG_D8, 0x100);
			M4aPlayWithPostionCtrl(SONG_D8, anim->xPosition, 1);
		}
		break;
	}
}

int EfxCheckRetaliation(int is_retaliation)
{
	int ret;
	struct BattleHit *hit = gBattleHits;

	if (hit->info & BATTLE_HIT_INFO_ACTORB)
		ret = true;
	else
		ret = false;

	if (is_retaliation == ret)
		return true;

	return false;
}

int EfxCheckStaffType(int weapon)
{
	int ret;

	if (!weapon)
		return EFX_STAFF_NOPE;

	switch (GetItemIid(weapon)) {
	case IID_HEALSTAFF:
	case IID_MENDSTAFF:
	case IID_RECOVERSTAFF:
	case IID_PHYSICSTAFF:
	case IID_FORTIFYSTAFF:
	case IID_RESTORESTAFF:
	case IID_HAMMERNESTAFF:
	case IID_BARRIERSTAFF:
	case IID_TINASSTAFF:
	case IID_SAINTSSTAFF:
		return EFX_STAFF_HEAL;

	case IID_SILENCESTAFF:
	case IID_SLEEPSTAFF:
	case IID_BERSERKSTAFF:
		return EFX_STAFF_OFFSENSIVE;

	default:
		return EFX_STAFF_NOPE;
	}
}

void EkrPlayMainBGM(void)
{
	int ret, songid, songid2, pid, staff_type;
	struct BattleUnit **pbul, **pbur;
	struct Unit *unitl, *unitr;

	pbul = &gpEkrBattleUnitLeft;
	pbur = &gpEkrBattleUnitRight;

	unitl = &(*pbul)->unit;
	unitr = &(*pbur)->unit;

	if (gBmSt.flags & BM_FLAG_5) {
		gEkrMainBgmPlaying = 0;
		return;
	}

	gEkrMainBgmPlaying = 1;

	songid = gBanimFactionPal[gEkrInitialHitSide] != 1 ? SONG_48 : SONG_49;

	if (GetBattleAnimArenaFlag() == 1) {
		EfxOverrideBgm(SONG_3A, 0x100);
		return;
	}

	if (GetBanimLinkArenaFlag() == 1) {
		EfxOverrideBgm(SONG_3A, 0x100);
		return;
	}

	if (gEkrDistanceType == EKR_DISTANCE_PROMOTION) {
		EfxOverrideBgm(SONG_1C, 0x100);
		return;
	}

	ret = false;
	if (UNIT_PID(unitl) == PID_IDUNN)
		ret = true;
	if (UNIT_PID(unitl) == PID_IDUNN_DRAGON)
		ret = true;
	if (ret == true) {
		EfxOverrideBgm(SONG_19, 0x100);
		return;
	}

	ret = false;
	if (UNIT_PID(unitl) == PID_MURDOCK)
		ret = true;
	if (UNIT_PID(unitr) == PID_MURDOCK)
		ret = true;
	if (UNIT_PID(unitl) == PID_BRUNNYA)
		ret = true;
	if (UNIT_PID(unitr) == PID_BRUNNYA)
		ret = true;
	if (UNIT_PID(unitl) == PID_NARCIAN)
		ret = true;
	if (UNIT_PID(unitr) == PID_NARCIAN)
		ret = true;
	if (ret == true) {
		EfxOverrideBgm(SONG_17, 0x100);
		return;
	}

	ret = false;
	if (UNIT_PID(unitl) == PID_ZEPHIEL)
		ret = true;
	if (UNIT_PID(unitr) == PID_ZEPHIEL)
		ret = true;
	if (ret == true) {
		EfxOverrideBgm(SONG_18, 0x100);
		return;
	}

	ret = false;
	if (UNIT_PID(unitl) == PID_JAHN)
		ret = true;
	if (ret == true) {
		EfxOverrideBgm(SONG_15, 0x100);
		return;
	}

	ret = false;
	if ((UNIT_ATTRIBUTES(unitl) & UNIT_ATTR_BOSS) && (UNIT_FACTION(unitl) == FACTION_RED))
		ret = true;
	if (ret == true) {
		EfxOverrideBgm(SONG_16, 0x100);
		return;
	}

	ret = false;
	if (UNIT_JID(unitr) == JID_DANCER) {
		if (gBattleSt.flags & BATTLE_FLAG_REFRESH)
			ret = 2;
		else
			ret = 1;
	}
	if (ret == 1) {
		EfxOverrideBgm(SONG_40, 0x100);
		return;
	}
	if (ret == 2) {
		EfxOverrideBgm(SONG_41, 0x100);
		return;
	}

	ret = false;
	if (UNIT_JID(unitr) == JID_BARD)
		if (gBattleSt.flags & BATTLE_FLAG_REFRESH)
			ret = 1;
	if (ret == 1) {
		EfxOverrideBgm(SONG_14, 0x100);
		return;
	}

	if (EfxCheckRetaliation(POS_L) == true)
		staff_type = EfxCheckStaffType(gBattleUnitA.weapon_before);
	else if (EfxCheckRetaliation(POS_R) == true)
		staff_type = EfxCheckStaffType(gBattleUnitB.weapon_before);
	else
		staff_type = 0;


	switch (staff_type) {
	case EFX_STAFF_HEAL:
		songid = SONG_1B;
		break;

	case EFX_STAFF_OFFSENSIVE:
		songid = SONG_1A;
		break;

	default:
		break;
	}

	if (songid != -1) {
		EfxOverrideBgm(songid, 0x100);
		return;
	}
	gEkrMainBgmPlaying = false;
}

void EkrRestoreBGM(void)
{
	if (CheckEkrDragonWorking()|| gBmSt.flags & BM_FLAG_5 || gEkrMainBgmPlaying == false) {
		MakeBgmOverridePersist();
		return;
	}
	RestoreBgm();
}

int GetProperAnimSoundLocation(struct Anim *anim)
{
	int i, header, val2, val1;
	u32 ret;
	const struct BaSpriteData *anim_sprite, *it;

	anim_sprite = anim->sprData;
	header = anim_sprite->header;

	if ((header & 0xFFFF0000) == 0xFFFF0000)
		for (val2 = (header & 0x0000FFFF); val2 != 0; val2--, anim_sprite++);

	it = anim_sprite;
	val2 = 0;
	val1 = 0;

	for (; it->header != 1; it++) {
		int a, b, c;
		
		a = it->as.object.x;
		a += (GetAnimSpriteRotScaleX(it->header) << 0x10) >> 0x11;
		b = GetAnimSpriteRotScaleX(it->header);
		c = GetAnimSpriteRotScaleY(it->header);

		val1 += ((s16)b) * ((s16)c) * a;
		val2 += ((s16)b) * ((s16)c);
	}

	if (val2 == 0)
		ret = 0x7FFFFFFF;
	else
		ret = Div(val1, val2);

	val1 = ret;

	asm("":::"memory");
	ret = val1;
	return val1;
}

void PlaySFX(int songid, int volume, int locate, int type)
{
	EfxPlaySE(songid, volume);
	M4aPlayWithPostionCtrl(songid, locate, type);
}

void PlaySfxAutomatically(int songid, int volume, struct Anim * anim)
{
	EfxPlaySE(songid, volume);
	M4aPlayWithPostionCtrl(songid, GetProperAnimSoundLocation(anim), 1);
}
