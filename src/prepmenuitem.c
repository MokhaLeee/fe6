#include "prelude.h"
#include "proc.h"
#include "hardware.h"
#include "text.h"
#include "bm.h"
#include "unit.h"
#include "sound.h"
#include "sprite.h"
#include "prepscreen.h"
#include "constants/msg.h"

void func_fe6_0807C520(int a, int b)
{
    int unkr6, unkr7, unkr3, unkr5, unkr8;
    int _a = a;
    if ((_a - 0x38) < 0)
    {
        unkr7 = 0;
        unkr6 = _a;
    }
    else if ((_a + 0x38) > 0xF0)
    {
        unkr7 = 0xF;
        unkr6 = _a - 0x78;
    }
    else
    {
        unkr7 = (_a - 0x38) >> 3;
        unkr6 = a - unkr7 * 8;
    }

    unkr3 = b - 0x28;

    if ((b + 0x30) > 0xA0)
    {
        unkr5 = 8;
        unkr8 = b - 0x40;
    }
    else
    {
        int r0 = unkr3;
        if (r0 < 0)
        {
            r0 = b - 0x21;
        }
        unkr5 = r0 >> 3;
        unkr8 = b - (unkr5 * 8);
    }

    PutNumberOrBlank(gBg0Tm + TM_OFFSET(4, 0), TEXT_COLOR_SYSTEM_BLUE, unkr7);
    PutNumberOrBlank(gBg0Tm + TM_OFFSET(4, 2), TEXT_COLOR_SYSTEM_BLUE, unkr5);
    PutNumberOrBlank(gBg0Tm + TM_OFFSET(4, 4), TEXT_COLOR_SYSTEM_BLUE, unkr6);
    PutNumberOrBlank(gBg0Tm + TM_OFFSET(4, 6), TEXT_COLOR_SYSTEM_BLUE, unkr8);

    EnableBgSync(BG0_SYNC_BIT);
}

void PrepScreenMenu_OnPickUnits(struct PrepMenuProc * proc)
{
    if (proc->unk_29 == 0)
    {
        proc->a_button_actions |= 1;
        Proc_Goto(proc, 9);
        PlaySe(0x6A);
    }
    else if (proc->unk_29 == 1)
    {
        int cur_counter = proc->cur_counter;

        if ((proc->a_button_actions & 1) && proc->a_button_actions & 2)
        {
            if (cur_counter != 0)
            {
                Proc_Goto(proc, 0x5);
                proc->unk_50->unk_2A = TRUE;
                PlaySe(0x6A);
            }
            else
            {
                PlaySe(0x6C);
            }
        }
        else
        {
            struct Unit * unit = GetUnitFromPrepList(proc->list_num_cur);

            if (unit->flags & UNIT_FLAG_NOT_DEPLOYED)
            {
                if ((proc->unk_2C & 1) == 0 || func_fe6_08082B74(unit) != 0)
                {
                    if (proc->max_counter > proc->cur_counter)
                    {
                        GetUnitFromPrepList(proc->list_num_cur)->flags &= ~(UNIT_FLAG_TURN_ENDED | UNIT_FLAG_NOT_DEPLOYED);
                        RegisterSioPid(UNIT_PID(GetUnitFromPrepList(proc->list_num_cur)));
                        PlaySe(0x6A);
                        proc->cur_counter++;
                        PrepUnit_DrawUnitListNames(proc, proc->yDiff_cur / 0x10 + proc->hand_y_pos);
                    }
                    else
                    {
                        PlaySe(0x6C);
                    }
                }
                else
                {
                    PrepMenuStartHelpbox(
                        (proc->list_num_cur & 1) * 0x40 + 0x70,
                        proc->hand_y_pos * 0x10 + 0x28,
                        MSG_6C1,
                        proc);

                    return;
                }
            }
            else
            {
                if ((proc->unk_2C & 1) || IsUnitMandatoryDeploy(unit) == FALSE)
                {
                    GetUnitFromPrepList(proc->list_num_cur)->flags |= UNIT_FLAG_TURN_ENDED | UNIT_FLAG_NOT_DEPLOYED;
                    RemoveSioPid(UNIT_PID(GetUnitFromPrepList(proc->list_num_cur)));
                    PlaySe(0x6B);
                    proc->cur_counter--;
                    PrepUnit_DrawUnitListNames(proc, proc->yDiff_cur / 0x10 + proc->hand_y_pos);
                }
                else
                {
                    PlaySe(0x6C);
                }
            }
        }

        if (cur_counter != proc->cur_counter)
            PrepUnit_DrawPickLeftBar(proc);
    }
}

void PrepScreenMenu_OnItems(struct PrepMenuProc * proc)
{
    if (proc->unk_29 == 0)
    {
        Proc_Goto(proc, 0x9);
        PlaySe(0x6A);
    }
    else if (proc->unk_29 == 1)
    {
        proc->unk_31 = proc->list_num_cur;
        proc->unk_32 = proc->list_num_cur;
        proc->unk_40 = proc->yDiff_cur;
        proc->unk_37 = proc->hand_y_pos;
        proc->unk_29 = 0;
        proc->unk_35 = 1;
        PlaySe(0x6A);
        func_fe6_08079A94(proc);
    }
}

void func_fe6_0807C840(struct PrepMenuProc * proc)
{
    int list_num_cur;

    if (proc->list_num_cur != proc->unk_31)
        return;

    list_num_cur = proc->list_num_cur;

    if ((list_num_cur & 1) == 0)
    {
        if ((list_num_cur + 1) < proc->unk_2D)
            proc->list_num_cur = list_num_cur + 1;
        else if ((u32)list_num_cur >= 2)
        {
            proc->list_num_cur = list_num_cur - 2;
            proc->hand_y_pos--;
        }
    }
    else
    {
        proc->list_num_cur = list_num_cur - 1;
    }
}
