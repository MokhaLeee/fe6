#include "prelude.h"
#include "proc.h"
#include "banim.h"
#include "sound.h"
#include "hardware.h"
#include "savemenu.h"
#include "gamecontroller.h"
#include "class_demo.h"

struct ProcScr CONST_DATA ProcScr_ClassDemo[] = {
    PROC_NAME_DEBUG("opinfo"),
    PROC_YIELD,
    PROC_CALL(ClassDemo_Init),

PROC_LABEL(PL_CLASS_DEMO_BRANMCH),
    PROC_REPEAT(ClassDemo_Branch),

PROC_LABEL(PL_CLASS_DEMO_IDLE),
    PROC_REPEAT(ClassDemo_Idle),
    PROC_CALL(ClassDemo_PostAnim),
    PROC_GOTO(PL_CLASS_DEMO_BRANMCH),

PROC_LABEL(PL_CLASS_DEMO_END_TITLE),
    PROC_CALL(func_fe6_0808958C),
    PROC_YIELD,
    PROC_GOTO(PL_CLASS_DEMO_END_EXT),

PROC_LABEL(PL_CLASS_DEMO_END_FADE),
    PROC_CALL(ClassDemo_FadeBgmOut),
    PROC_REPEAT(ClassDemo_Idle),

PROC_LABEL(PL_CLASS_DEMO_END_EXT),
    PROC_CALL(ClassDemo_EndSubProcs),
    PROC_YIELD,
    PROC_CALL(ClassDemo_End),
    PROC_END,
};

void ClassDemo_Init(struct ProcClassDemo * proc)
{
    gDispIo.disp_ct.mode = 0;

    InitBgs(NULL);
    NewEfxAnimeDrvProc();
    ResetClassReelSpell();

    proc->unk_2E = 0;
    proc->unk_30 = gUnk_0869056C[proc->class_set][0];
    proc->timer = 0;
    proc->subproc1 = NULL;
    proc->anim_proc = NULL;
    proc->subproc1 = func_fe6_08094C80(proc, proc->unk_30);

    SetDispEnable(0, 0, 0, 0, 1);
    SetBgOffset(BG_0, 0, 0);
    SetBgOffset(BG_1, 0, 0);
    SetBgOffset(BG_2, 0, 0);
    SetBgOffset(BG_3, 0, 0);

    proc->game_time = GetGameTime();
    proc->unk_3C = 0;
    proc->mode = CALSS_DEMO_MODE_1;
    proc->unk_32 = 0;
}

void ClassDemo_Branch(struct ProcClassDemo * proc)
{
    proc->unk_3C = GetGameTime() - proc->game_time;

    switch (proc->mode) {
    case CALSS_DEMO_MODE_1:
        if (gKeySt->held & (KEY_BUTTON_A | KEY_BUTTON_B | KEY_BUTTON_START))
        {
            SetNextGameAction(GAME_ACTION_0);
            Proc_Goto(proc, PL_CLASS_DEMO_END_FADE);
        }
        break;

    case CALSS_DEMO_MODE_2:
        if (proc->unk_30 >= (gUnk_0869056C[proc->class_set][proc->unk_2E] + 4))
        {
            proc->unk_2E++;

            if (gUnk_0869056C[proc->class_set][proc->unk_2E] == 0xFF || proc->unk_2E > 3)
            {
                SetNextGameAction(GAME_ACTION_1);
                Proc_Goto(proc, PL_CLASS_DEMO_END_TITLE);
                FadeBgmOut(-1);
            }
            else
            {
                proc->unk_30 = gUnk_0869056C[proc->class_set][proc->unk_2E];
                Proc_Goto(proc, PL_CLASS_DEMO_IDLE);
            }
        }
        else
        {
            proc->unk_30 = proc->unk_30 + 1;
            Proc_Goto(proc, PL_CLASS_DEMO_IDLE);
        }
        break;

    case CALSS_DEMO_MODE_3:
        proc->anim_proc = StartClassAnimDisplay(proc, proc->unk_30);
        proc->mode = CALSS_DEMO_MODE_1;
        break;
    }

    proc->timer = 0;
}

void ClassDemo_PostAnim(struct ProcClassDemo * proc)
{
    if (proc->anim_proc != NULL)
        Proc_Goto(proc->anim_proc, 4);

    SetDispEnable(0, 0, 0, 0, 1);

    proc->subproc1 = func_fe6_08094C80(proc, proc->unk_30);
    proc->mode = CALSS_DEMO_MODE_1;
}

void ClassDemo_Idle(struct ProcClassDemo * proc)
{
    if (gKeySt->held & (KEY_BUTTON_A | KEY_BUTTON_B | KEY_BUTTON_START) && proc->unk_32 == 0)
    {
        SetNextGameAction(GAME_ACTION_0);
        proc->unk_32 = 1;
        Proc_Goto(proc, PL_CLASS_DEMO_END_FADE);
    }

    if (proc->timer == 0)
        EndActiveClassReelBgColorProc();

    if ((++proc->timer / 2) > 0xD)
    {
        SetDispEnable(0, 0, 0, 0, 0);
        Proc_Break(proc);
    }
    else
        func_fe6_0809485C(proc->timer);
}

void ClassDemo_FadeBgmOut(struct ProcClassDemo * proc)
{
    FadeBgmOut(1);
}

void ClassDemo_EndSubProcs(struct ProcClassDemo * proc)
{
    if (proc->subproc1 != NULL)
        Proc_Goto(proc->subproc1, 4);

    if (proc->anim_proc != NULL)
        Proc_Goto(proc->anim_proc, 4);
}

void ClassDemo_End(struct ProcClassDemo * proc)
{
    EndEfxAnimeDrvProc();
    CleanupGame(proc);
}

void StartClassDemo(u8 class_set, ProcPtr parent)
{
    struct ProcClassDemo * proc;

    proc = SpawnProcLocking(ProcScr_ClassDemo, parent);
    proc->class_set = class_set;
}
