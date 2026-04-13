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

// EventScr @ 0867614C
EventScr CONST_DATA EventScr_TrialE_Opening[] =
{
    EvtClearSkip
    EvtEnd
};

// EventScr @ 08676154
EventScr CONST_DATA EventScr_TrialE_Victory[] =
{
    EvtSleep(64)
    EvtNextChapter(CHAPTER_TRIAL_E)
    EvtSleep(1)
    EvtKill
    EvtClearSkip
    EvtEnd
};

// EventScr @ 08676178
EventScr CONST_DATA EventScr_TrialE_Failure[] =
{
    EvtSleep(64)
    EvtNextChapter(0)
    EvtSleep(1)
    EvtKill
    EvtClearSkip
    EvtEnd
};
