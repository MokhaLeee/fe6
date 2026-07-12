#include "prelude.h"
#include "secretscreen.h"

void func_fe6_08082E74(int bit_count, int seed)
{
	int remainder;

	Unk_020168E8 = bit_count;
	Unk_020168EC = (1 << bit_count) - 1;

	Unk_020168F0 = 28 / bit_count;
	remainder = 28 % bit_count;

	if (remainder > 0)
		Unk_020168F0++;

	Unk_020168F4 = seed;
}

int func_fe6_08082EC0(int a)
{
	int quotient;
	int remainder;

	quotient = a / Unk_020168E8;
	remainder = a % Unk_020168E8;

	if (remainder > 0)
		quotient++;

	return quotient;
}

u32 GetSecretScreenRN(void)
{
	register u32 rn asm("r4");
	register u32 tmp asm("r0");

	tmp = gSecretScreenRN;
	rn = tmp << 4;
	rn = rn + tmp;
	rn = (rn << 19) >> 16;
	rn = rn + rn / 71;
	rn = rn + 3;
	rn = (u16)rn;

	gSecretScreenRN = rn;
	return rn;
}
