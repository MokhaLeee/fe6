#include "prelude.h"
#include "proc.h"

#include "opinfo.h"

void func_fe6_08095D28(void) {}

ProcPtr StartClassDemoStatus(ProcPtr parent)
{
    return SpawnProc(ProcScr_ClassDemoStatus, parent);
}

void SetOpClassDemoStatusPos(struct ProcClassDemoStatus *proc, int pos)
{
    proc->unk_43 = pos;
}

void func_fe6_08095D48(ProcPtr unused)
{
    unk_opinfo_0200FF54[0] = 0x80;
    unk_opinfo_0200FF54[1] = 2;
}

void func_fe6_08095D58(void) {}
