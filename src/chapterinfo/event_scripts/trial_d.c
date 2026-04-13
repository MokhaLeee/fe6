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

// EventScr @ 086760FC
EventScr CONST_DATA EventScr_Unk_086760FC[] =
{
    EvtClearSkip
    EvtEnd
};

// EventScr @ 08676104
EventScr CONST_DATA EventScr_Unk_08676104[] =
{
    EvtSleep(64)
    EvtNextChapter(CHAPTER_TRIAL_D)
    EvtSleep(1)
    EvtKill
    EvtClearSkip
    EvtEnd
};

// EventScr @ 08676128
EventScr CONST_DATA EventScr_Unk_08676128[] =
{
    EvtSleep(64)
    EvtNextChapter(0)
    EvtSleep(1)
    EvtKill
    EvtClearSkip
    EvtEnd
};
