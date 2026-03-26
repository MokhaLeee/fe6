#include "prelude.h"
#include "proc.h"
#include "bm.h"
#include "m4a.h"
#include "sound.h"
#include "util.h"
#include "banim.h"
#include "constants/songs.h"

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
