#include "prelude.h"
#include "hardware.h"
#include "proc.h"
#include "text.h"
#include "prepscreen.h"

void func_fe6_08082320(struct PrepSubItemfxProc *proc, int a, int b, int c, int d, int e, int f)
{
	proc->unk_2A[0] = a;
	proc->unk_2A[1] = b;
	proc->unk_2A[2] = c;

	proc->unk_2E = d;
	proc->unk_32 = e;
	proc->unk_34 = f;
}

void func_fe6_08082348(struct PrepSubItemfxProc *proc, int a, u8 b)
{
	if (a < 0)
		a = a + 0x1F;

	proc->unk_36 = a >> 5;
	proc->unk_38 = b << 12;
}

void PrepPutText(struct Text *th, u16 *tm, int color, int x, const char *str)
{
    ClearText(th);
    Text_SetColor(th, color);
    Text_SetCursor(th, x);
    Text_DrawString(th, str);
    PutText(th, tm);
}

void func_fe6_080823A0(u8 * a, u16 * b)
{
	if (gPrep_Unk_0201636A == 0) {
		*a = 0;
		*b = 0;
		return;
	}

	if (gPrep_Unk_0201636A < 8) {
		if (*a >= gPrep_Unk_0201636A)
			*a = gPrep_Unk_0201636A - 1;

		*b = 0;
	} else {
		int unk = (*b >> 4) + 7;

		if (unk < gPrep_Unk_0201636A) {
			if (*a != 6)
				return;

			*a = 5;
			return;
		}

		if (unk <= gPrep_Unk_0201636A)
			return;

		*b = (gPrep_Unk_0201636A - 7) * 16;
	}
}
