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
