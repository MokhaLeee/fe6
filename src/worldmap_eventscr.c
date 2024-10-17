#include "prelude.h"
#include "event.h"
#include "eventscript.h"
#include "worldmap.h"
#include "constants/msg.h"
#include "constants/faces.h"

CONST_DATA EventScr EventScr_Tutorial[] = {
    EvtNoSkipNoTextSkip
    EvtFuncOnSkip(func_fe6_08093120)
    EvtWmStart
    EvtSleep(42)
    EvtYesSkip
    EvtWmTalkBoxTop
    EvtWmPutMapText(0, 0xc8, 0xb4, 2, 0, 0)
    EvtSleep(20)
    EvtWmPutHighlight(1, 3)
    EvtWmTalk(MSG_B6B)
    EvtWmRemoveBothHighlights
    EvtWmRemoveMapText(0)
    EvtWmRemoveMapText(1)
    EvtSleep(20)
    EvtWmTalkBoxRemove
    EvtSleep(2)
    EvtWmZoomTo(0xb4, 0x96)
    EvtWmTalkBoxBottom
    EvtWmPutDot(0, 0x14a, 0xde, 1)
    EvtWmPutMapText(1, 0x14a, 0xde, 13, 0, 1)
    EvtSleep(20)
    EvtWmPutFace(0, 0x28, 0x2c, FID_02)
    EvtSleep(20)
    EvtWmTalk(MSG_B6C)
    EvtWmRemoveMapText(0)
    EvtWmRemoveMapText(1)
    EvtSleep(20)
    EvtWmRemoveDot(0)
    EvtWmRemoveDot(1)
    EvtWmPutDot(0, 0xf4, 0xb3, 1)
    EvtWmPutMapText(1, 0xf4, 0xb3, 24, 3, 1)
    EvtSleep(20)
    EvtTalkContinue
    EvtWmTalk(MSG_B6D)
    EvtWmRemoveMapText(0)
    EvtWmRemoveMapText(1)
    EvtSleep(20)
    EvtWmPutFace(1, 0xc8, 0x2c, FID_34)
    EvtSleep(20)
    EvtTalkContinue
    EvtSleep(60)
    EvtFadeBgmOut(4)
    EvtWmEnd
    EvtSleep(0)
    EvtFunc(func_fe6_0809345C)
    EvtEnd
};
