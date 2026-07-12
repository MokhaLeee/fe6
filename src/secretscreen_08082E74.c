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

#if NONMATCHING

void func_fe6_08082F18(void)
{
	int i;

	for (i = 0; i < Unk_020168F0; i++) {
		int tmp = Unk_02016924[Unk_020168F0 + (i << 1) + i];

		Unk_02016924[Unk_020168F0 + (i << 1) + i] = Unk_02016924[i];
		Unk_02016924[i] = tmp;
	}
}

#else

NAKEDFUNC
void func_fe6_08082F18(void)
{
	asm("\
	.syntax unified\n\
	push {r4, r5, r6, lr}\n\
	movs r4, #0\n\
	ldr r1, .L08082F4C\n\
	ldr r0, [r1]\n\
	cmp r4, r0\n\
	bge .L08082F44\n\
	ldr r6, .L08082F50\n\
	adds r5, r1, #0\n\
.L08082F28:\n\
	ldr r0, [r5]\n\
	adds r0, r4, r0\n\
	lsls r1, r4, #1\n\
	adds r0, r0, r1\n\
	adds r0, r0, r6\n\
	ldrb r3, [r0]\n\
	adds r2, r4, r6\n\
	ldrb r1, [r2]\n\
	strb r1, [r0]\n\
	strb r3, [r2]\n\
	adds r4, #1\n\
	ldr r0, [r5]\n\
	cmp r4, r0\n\
	blt .L08082F28\n\
.L08082F44:\n\
	pop {r4, r5, r6}\n\
	pop {r0}\n\
	bx r0\n\
	.align 2, 0\n\
.L08082F4C: .4byte Unk_020168F0\n\
.L08082F50: .4byte Unk_02016924\n\
	.syntax divided");
}

#endif

void func_fe6_08082F54(u8 *buf, int *counter, int value, int num_bits)
{
	int i;
	u16 tmp;

	tmp = GetSecretScreenRN();
	value = value + tmp;
	value &= (1 << num_bits) - 1;

	for (i = 0; i < num_bits; i++) {
		buf[*counter / Unk_020168E8] |= ((value & (1 << i)) >> i) << (*counter % Unk_020168E8 % 8);
		(*counter)++;
	}
}
