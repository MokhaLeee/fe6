#include "prelude.h"
#include "proc.h"
#include "bm.h"
#include "m4a.h"
#include "sound.h"
#include "util.h"
#include "banim.h"
#include "constants/songs.h"
#include "constants/terrains.h"

EWRAM_OVERLAY(banim) int gEkrMainBgmPlaying = 0;
EWRAM_OVERLAY(banim) int gEfxSoundSeExist = 0;

struct ProcScr CONST_DATA ProcScr_EfxSoundSE[] = {
	PROC_19,
	PROC_REPEAT(EfxSoundSE_Loop),
	PROC_END,
};

void EfxPlaySE(int songid, int volume)
{
	struct ProcEfxSoundSE *proc;

	if (gBmSt.flags & BM_FLAG_5)
		return;

	if (CheckEfxSoundSeExist() == 0) {
		RegisterEfxSoundSeExist();
		SetSeVolume(volume);
		PlaySe(songid);
		return;
	}

	proc = SpawnProc(ProcScr_EfxSoundSE, PROC_TREE_3);
	proc->volume = volume;
	proc->index = songid;
	proc->timer = 0;
}

void EfxSoundSE_Loop(struct ProcEfxSoundSE *proc)
{
	if (++proc->timer == 5) {
		Proc_Break(proc);
		return;
	}

	if (CheckEfxSoundSeExist() == 0) {
		RegisterEfxSoundSeExist();
		SetSeVolume(proc->volume);
		PlaySe(proc->index);
		Proc_Break(proc);
	}
}

void DoM4aSongNumStop(int songid)
{
	m4aSongNumStop(songid);
}

void EfxOverrideBgm(int songid, int volume)
{
	if (gBmSt.flags & BM_FLAG_5)
		return;

	SetBgmVolume(volume);
	OverrideBgm(songid);
}

void EfxStopBGM1(void)
{
	m4aMPlayStop(&gMusicPlayer_FightBgm);
}

void UnregisterEfxSoundSeExist(void)
{
	gEfxSoundSeExist = false;
}

void RegisterEfxSoundSeExist(void)
{
	gEfxSoundSeExist = true;
}

int CheckEfxSoundSeExist(void)
{
	return gEfxSoundSeExist;
}

void M4aPlayWithPostionCtrl(int songid, int x, int flag)
{
	int pan;

	if (gBmSt.flags & BM_FLAG_5)
		return;

	if (flag != 0) {
		struct MusicPlayer * info;

		if (x <= 0x77)
			pan = Div(x * x, 0x78) - 0x78;
		else
			pan = 0x78 - Div((0xF0 - x) * (0xF0 - x), 0x78);

		info = gMusicPlayerTable[gSongTable[songid].ms].music_player;
		m4aMPlayImmInit(info);
		m4aMPlayPanpotControl(info, 0xFFFF, pan);
	} else {
		struct MusicPlayer *info;

		info = gMusicPlayerTable[gSongTable[songid].ms].music_player;
		m4aMPlayImmInit(info);
		m4aMPlayPanpotControl(info, 0xFFFF, Screen2Pan(x));
	}
}

// TODO: song ids
CONST_DATA u16 EfxSounds1[]  = { 0x14A, 0x14B, 0x14C, 0x14D, 0x14E, 0x14F, 0x150, 0x151 };
CONST_DATA u16 EfxSounds2[]  = { 0x154, 0x155, 0x156, 0x157, 0x158, 0x159, 0x15A, 0x15B };
CONST_DATA u16 EfxSounds3[]  = { 0x15E, 0x15F, 0x160, 0x161, 0x162, 0x163, 0x164, 0x165 };
CONST_DATA u16 EfxSounds4[]  = { 0x168, 0x169, 0x16A, 0x16B, 0x16C, 0x16D, 0x16E, 0x16F };
CONST_DATA u16 EfxSounds5[]  = { 0x172, 0x173, 0x174, 0x175, 0x176, 0x177, 0x178, 0x179 };
CONST_DATA u16 EfxSounds6[]  = { 0x17C, 0x17D, 0x17E, 0x17F, 0x180, 0x181, 0x182, 0x183 };
CONST_DATA u16 EfxSounds7[]  = { 0x186, 0x187, 0x188, 0x189, 0x18A, 0x18B, 0x18C, 0x18D };
CONST_DATA u16 EfxSounds8[]  = { 0x190, 0x191, 0x19A, 0x19B, 0x1A4, 0x1A5, 0x1A4, 0x1A5 };
CONST_DATA u16 EfxSounds9[]  = { 0x1AE, 0x1AF, 0x1B8, 0x1B9, 0x1C2, 0x1C3, 0x1C2, 0x1C3 };
CONST_DATA u16 EfxSounds10[] = { 0x1CC, 0x1CD, 0x1D6, 0x1D7, 0x1E0, 0x1E1, 0x1E0, 0x1E1 };
CONST_DATA u16 EfxSounds11[] = { 0x1EA, 0x1EB, 0x1F4, 0x1F5, 0x1FE, 0x1FF, 0x1FE, 0x1FF };
CONST_DATA u16 EfxSounds12[] = { 0x208, 0x209, 0x212, 0x213, 0x21C, 0x21D, 0x21C, 0x21D };
CONST_DATA u16 EfxSounds13[] = { 0x226, 0x227, 0x230, 0x231, 0x23A, 0x23B, 0x23A, 0x23B };
CONST_DATA u16 EfxSounds14[] = { 0x244, 0x245, 0x24E, 0x24F, 0x258, 0x259, 0x258, 0x259 };
CONST_DATA u16 EfxSounds15[] = { 0x192, 0x193, 0x19C, 0x19D, 0x1A6, 0x1A7, 0x1A6, 0x1A7 };
CONST_DATA u16 EfxSounds16[] = { 0x1B1, 0x1B0, 0x1BA, 0x1BB, 0x1C4, 0x1C5, 0x1C4, 0x1C5 };
CONST_DATA u16 EfxSounds17[] = { 0x1CE, 0x1CF, 0x1D8, 0x1D9, 0x1E2, 0x1E3, 0x1E2, 0x1E3 };
CONST_DATA u16 EfxSounds18[] = { 0x1EC, 0x1ED, 0x1F6, 0x1F7, 0x200, 0x201, 0x200, 0x201 };
CONST_DATA u16 EfxSounds19[] = { 0x20A, 0x20B, 0x214, 0x215, 0x21E, 0x21F, 0x21E, 0x21F };
CONST_DATA u16 EfxSounds20[] = { 0x228, 0x229, 0x232, 0x233, 0x23C, 0x23D, 0x23C, 0x23D };
CONST_DATA u16 EfxSounds21[] = { 0x246, 0x247, 0x250, 0x251, 0x25A, 0x25B, 0x25A, 0x25B };
CONST_DATA u16 EfxSounds22[] = { 0x194, 0x195, 0x19E, 0x19F, 0x1A8, 0x1A9, 0x1A8, 0x1A9 };
CONST_DATA u16 EfxSounds23[] = { 0x1B2, 0x1B3, 0x1BC, 0x1BD, 0x1C6, 0x1C7, 0x1C6, 0x1C7 };
CONST_DATA u16 EfxSounds24[] = { 0x1D0, 0x1D1, 0x1DA, 0x1DB, 0x1E4, 0x1E5, 0x1E4, 0x1E5 };
CONST_DATA u16 EfxSounds25[] = { 0x1EE, 0x1EF, 0x1F8, 0x1F9, 0x202, 0x203, 0x202, 0x203 };
CONST_DATA u16 EfxSounds26[] = { 0x20C, 0x20D, 0x216, 0x217, 0x220, 0x221, 0x220, 0x221 };
CONST_DATA u16 EfxSounds27[] = { 0x22A, 0x22B, 0x234, 0x235, 0x23E, 0x23F, 0x23E, 0x23F };
CONST_DATA u16 EfxSounds28[] = { 0x248, 0x249, 0x252, 0x253, 0x25C, 0x25D, 0x25C, 0x25D };

CONST_DATA u16 *gBanimBossBGMs[] = {
	EfxSounds1, EfxSounds2, EfxSounds3,
	EfxSounds4, EfxSounds5, EfxSounds6, EfxSounds7,
};

CONST_DATA u16 *gBanimSongTable1[] = {
	EfxSounds8,  EfxSounds9, EfxSounds10,
	EfxSounds11, EfxSounds12, EfxSounds13, EfxSounds14,
};

CONST_DATA u16 *gBanimSongTable2[] = {
	EfxSounds15, EfxSounds16, EfxSounds17,
	EfxSounds18, EfxSounds19, EfxSounds20, EfxSounds21,
};

CONST_DATA u16 *gBanimSongTable3[] = {
	EfxSounds22, EfxSounds23, EfxSounds24,
	EfxSounds25, EfxSounds26, EfxSounds27, EfxSounds28,
};

// https://decomp.me/scratch/Hh9lL
#if 0
void EfxPlaySEwithCmdCtrl(struct Anim *anim, int cmd)
{
	register u16 sound_type;
    u16 val2;
    register u16 sound_pos;
	int pos;
    int terrain, volume, basecon;
	int songid;
	s16 _songid;
	u16 *song_table;
	register struct Anim *anim_other;

    anim_other = GetAnimAnotherSide(anim);

	if (GetAnimLayer(anim) == 1)
		return;
	pos = GetAnimPosition(anim);
	if (pos == POS_L)
		terrain = gBanimTerrain[POS_L];
	else
		terrain = gBanimTerrain[POS_R];

	sound_type = GetEfxSoundType1FromTerrain(terrain);
	if (terrain == TERRAIN_DRAWBRIDGE)
		if (IsAnimSoundInPosition(anim) == 0)
			sound_type = EFX_SOUNDT_2;

	if (pos == POS_L)
		basecon = gBanimCon[POS_L];
	else
		basecon = gBanimCon[POS_R];

	val2 = GetEfxSoundType2FromBaseCon(basecon);

	songid = (u16)-1;
	sound_pos = GetProperAnimSoundLocation(anim) + anim->xPosition;
	volume = 0x100;

	switch (cmd) {
	case BAS_CMD(25):
		songid = SONG_D1;
		break;

	case BAS_CMD(28):
		song_table = gBanimSongTable1[sound_type];
		songid = song_table[pos + val2 * 2];
		break;

	case BAS_CMD(29):
		song_table = gBanimSongTable2[sound_type];
		songid = song_table[pos + val2 * 2];
		break;

	case BAS_CMD(30):
		song_table = gBanimSongTable3[sound_type];
		songid = song_table[pos + val2 * 2];
		break;

	case BAS_CMD(31):
		EfxPlayCriticalHittedSFX(anim_other);

		switch (GetEfxHpChangeType(anim_other)) {
		case EFX_HPT_CHANGED:
			songid = SONG_D2;
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
		sound_pos = anim_other->xPosition + GetProperAnimSoundLocation(anim_other);
		break;

	case BAS_CMD(32):
		EfxPlayCriticalHittedSFX(anim_other);

		switch (GetEfxHpChangeType(anim_other)) {
		case EFX_HPT_CHANGED:
			songid = SONG_D3;
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
		sound_pos = anim_other->xPosition + GetProperAnimSoundLocation(anim_other);
		break;

	case BAS_CMD(33):
		EfxPlayCriticalHittedSFX(anim_other);

		switch (GetEfxHpChangeType(anim_other)) {
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
		sound_pos = anim_other->xPosition + GetProperAnimSoundLocation(anim_other);
		break;

	case BAS_CMD(34):
		songid = SONG_C9;
		break;

	case BAS_CMD(35):
		songid = SONG_C8;
		break;

	case BAS_CMD(36):
		songid = SONG_CA;
		break;

	case BAS_CMD(37):
		songid = SONG_263;
		if (pos == POS_L)
			songid = songid - 1; //SONG_262
		break;

	case BAS_CMD(40):
		songid = SONG_F6;
		break;

	case BAS_CMD(41):
		songid = SONG_141;
		break;

	case BAS_CMD(42):
		songid = SONG_142;
		break;

	case BAS_CMD(43):
		songid = SONG_267;
		if (pos == POS_L)
			songid = songid - 1; //SONG_266
		break;

	case BAS_CMD(51):
		songid = SONG_E7;
		break;

	case BAS_CMD(27):
	case BAS_CMD(52):
		song_table = gBanimBossBGMs[sound_type];
		songid = song_table[pos + val2 * 2];
		break;

	case 53:
        songid = SONG_265;
        if (pos == POS_L)
            songid = songid - 1; // SONG_264
        break;

    case 54:
        songid = SONG_CE;
        break;

    case 55:
        songid = SONG_CF;
        break;

    case 56:
        songid = SONG_CB;
        break;

	case 60:
        songid = SONG_263;
        if (pos == POS_L)
            songid = songid - 1; //SONG_262

        volume = 0x80;
        break;

	case 61:
        songid = SONG_267;
        if (pos == POS_L)
            songid = songid - 1; //SONG_266

        volume = 0x80;
        break;

	case 62:
        songid = SONG_F1;
        break;

    case 63:
        songid = SONG_136;
        break;

    case 64:
        songid = SONG_117;
        break;

    case 65:
        songid = SONG_EB;
        break;

    case 66:
        songid = SONG_EA;
        break;

	case 67:
        songid = SONG_118;
        break;

	case 70:
        songid = SONG_E0;
        break;

    case 72:
        songid = SONG_ED;
        break;

	case 73:
        songid = SONG_135;
        break;

	case 74:
        songid = SONG_134;
        break;

	default:
		songid = SONG_NONE;
		break;
	}

    _songid = songid;
    if (_songid != -1) {
        i16 _volume = volume;
        int sound_pos_ = sound_pos;

		EfxPlaySE(_songid, _volume);
#if 0
{
        register int r2 asm("r2");
        register int r1 asm("r1");

        r2 = sound_pos_;
        r1 = (r2 << 0x10) >> 0x10;
        r2 = 1;
        M4aPlayWithPostionCtrl(_songid, r1, r2);
}
#else
        M4aPlayWithPostionCtrl(_songid, (s16)sound_pos, 1);
#endif
	}
}
#endif