#include "prelude.h"
#include "hardware.h"
#include "proc.h"
#include "text.h"
#include "prepscreen.h"

void SetPrepMenuScrollBarBaseInfo(struct MenuScrollBarProc *proc, int a, int b, int c, int d, int e, int f)
{
	proc->xBase = a;
	proc->unk_2B = b;
	proc->yBase = c;

	proc->currentSegment = d;
	proc->numTotalRows = e;
	proc->numVisibleRows = f;
}

void SetPrepMenuScrollBarOam2Info(struct MenuScrollBarProc *proc, int a, u8 b)
{
	if (a < 0)
		a = a + 0x1F;

	proc->oam2Chr = a >> 5;
	proc->oam2Pal = b << 12;
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
