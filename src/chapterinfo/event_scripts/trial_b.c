#include "prelude.h"
#include "ai.h"
#include "faction.h"
#include "oam.h"
#include "util.h"
#include "mu.h"
#include "bmfx.h"
#include "helpbox.h"
#include "suspend_ui.h"

#include "eventinfo.h"
#include "eventfunctions.h"
#include "chapterunits.h"

#include "constants/pids.h"
#include "constants/msg.h"
#include "constants/songs.h"
#include "constants/iids.h"
#include "constants/chapters.h"

// EventScr @ 08676030
EventScr CONST_DATA EventScr_Unk_08676030[] =
{
    EvtClearSkip
    EvtEnd
};

// EventScr @ 08676038
EventScr CONST_DATA EventScr_Unk_08676038[] =
{
    EvtSleep(64)
    EvtNextChapter(CHAPTER_TRIAL_B)
    EvtSleep(1)
    EvtKill
    EvtClearSkip
    EvtEnd
};

// EventScr @ 0867605C
EventScr CONST_DATA EventScr_Unk_0867605C[] =
{
    EvtSleep(64)
    EvtNextChapter(0)
    EvtSleep(1)
    EvtKill
    EvtClearSkip
    EvtEnd
};
