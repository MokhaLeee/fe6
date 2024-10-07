#include "prelude.h"
#include "m4a.h"
#include "unit.h"
#include "arena.h"
#include "arena_ui.h"
#include "mu.h"
#include "shop.h"
#include "face.h"
#include "talk.h"
#include "util.h"
#include "battle.h"
#include "hardware.h"
#include "manim.h"
#include "armfunc.h"
#include "constants/faces.h"
#include "constants/msg.h"

void StartArenaScreen(void)
{
    ArenaBegin(gActiveUnit);
    SpawnProc(ProcScr_ArenaUiMain, PROC_TREE_3);
}

void StartArenaResultsScreen(void)
{
    ProcPtr proc;
    proc = SpawnProc(ProcScr_ArenaUiResults, PROC_TREE_3);
}

void ArenaUi_Init(ProcPtr proc)
{
    Proc_ForEach(ProcScr_Mu, (ProcFunc) HideMu);

    InitShopScreenConfig();

    gDispIo.bg0_ct.priority = 0;
    gDispIo.bg1_ct.priority = 2;
    gDispIo.bg2_ct.priority = 0;
    gDispIo.bg3_ct.priority = 3;

    InitTalk(0x200, 2, 0);
    InitFaces();
    StartTalkFace(FID_BA, 0x20, 8, 3, 1);

    Decompress(Tsa_ShopWindows, gBuf);
    TmApplyTsa(gBg1Tm, gBuf, 0x1000);
    TmFillRect(gBg1Tm + 0x100, 0x1E, 0xC, 0);
    EnableBgSync(BG1_SYNC_BIT);

    StartUiGoldBox(proc);

	SetWinEnable(1, 1, 0);
	SetWin0Layers(1, 1, 1, 1, 1);
	SetWin1Layers(1, 1, 0, 1, 1);
	SetWOutLayers(1, 1, 0, 1, 1);
	SetWin0Box(88, 72, 240, 152);
	SetWin1Box(0, 8, 240, 56);

    gDispIo.win_ct.win0_enable_blend = 0;
    gDispIo.win_ct.win1_enable_blend = 1;
    gDispIo.win_ct.wout_enable_blend = 0;

    SetBlendConfig(3, 0, 0, 8);

    SetBlendTargetA(0, 0, 0, 1, 0);
    SetBlendTargetB(0, 0, 0, 0, 0);

    Decompress(Img_Background_082D80B0, (void *)BG_VRAM + GetBgChrOffset(BG_3));
    TmApplyTsa(gBg3Tm, Tsa_Background_082DAC8C, 0xC000);
    ApplyPalettes(Pal_Background_082DB140, 0xC, 4);

    EnableBgSync(BG3_SYNC_BIT);
}

void ArenaUi_BmEnd(ProcPtr proc)
{
    UpdateUnitFromBattle(gArenaSt.player, &gBattleUnitA);
    StartMu(gActiveUnit);
    SetAutoMuDefaultFacing();
}

void ArenaUi_WelcomeDialogue(ProcPtr proc)
{
	StartArenaDialogue(MSG_2F3, proc);
}

void ArenaUi_WagerGoldDialogue(ProcPtr proc)
{
    SetTalkNumber(ArenaGetMatchupGoldValue());
    StartArenaDialogue(MSG_2F4, proc);
}
