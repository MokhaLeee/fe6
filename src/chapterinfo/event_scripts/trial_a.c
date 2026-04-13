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

// EventScr @ 08675FF0
EventScr CONST_DATA EventScr_Unk_08675FF0[] =
{
    EvtClearSkip
    EvtEnd
};

// EventScr @ 08675FF8
EventScr CONST_DATA EventScr_Unk_08675FF8[] =
{
    EvtNextChapter(CHAPTER_TRIAL_A)
    EvtSleep(1)
    EvtKill
    EvtClearSkip
    EvtEnd
};

// EventScr @ 08676014
EventScr CONST_DATA EventScr_Unk_08676014[] =
{
    EvtNextChapter(0)
    EvtSleep(1)
    EvtKill
    EvtClearSkip
    EvtEnd
};
