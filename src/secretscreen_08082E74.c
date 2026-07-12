#include "prelude.h"
#include "secretscreen.h"

void SecretScreen_InitBitstream(int bit_count, int seed)
{
	int remainder;

	gSecretScreenBitCount = bit_count;
	gSecretScreenBitMask = (1 << bit_count) - 1;

	gSecretScreenSymbolCount = 28 / bit_count;
	remainder = 28 % bit_count;

	if (remainder > 0)
		gSecretScreenSymbolCount++;

	gSecretScreenInitSeed = seed;
}

int SecretScreen_CeilDivBitCount(int a)
{
	int quotient;
	int remainder;

	quotient = a / gSecretScreenBitCount;
	remainder = a % gSecretScreenBitCount;

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

void SecretScreen_ShufflePasswordBuf(void)
{
	int i;

	for (i = 0; i < gSecretScreenSymbolCount; i++) {
		int tmp = gSecretScreenPasswordBuf[gSecretScreenSymbolCount + (i << 1) + i];

		gSecretScreenPasswordBuf[gSecretScreenSymbolCount + (i << 1) + i] = gSecretScreenPasswordBuf[i];
		gSecretScreenPasswordBuf[i] = tmp;
	}
}

#else

NAKEDFUNC
void SecretScreen_ShufflePasswordBuf(void)
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
.L08082F4C: .4byte gSecretScreenSymbolCount\n\
.L08082F50: .4byte gSecretScreenPasswordBuf\n\
	.syntax divided");
}

#endif

void SecretScreen_WriteBits(u8 *buf, int *counter, int value, int num_bits)
{
	int i;
	u16 tmp;

	tmp = GetSecretScreenRN();
	value = value + tmp;
	value &= (1 << num_bits) - 1;

	for (i = 0; i < num_bits; i++) {
		buf[*counter / gSecretScreenBitCount] |= ((value & (1 << i)) >> i) << (*counter % gSecretScreenBitCount % 8);
		(*counter)++;
	}
}

u32 SecretScreen_ReadBits(u8 *buf, int *counter, int round)
{
	int i;
	u32 value = 0;
	u16 tmp;

	for (i = 0; i < round; i++) {
		value |= ((buf[*counter / gSecretScreenBitCount] & (1 << (*counter % gSecretScreenBitCount % 8)))
			>> (*counter % gSecretScreenBitCount % 8)) << i;
		(*counter)++;
	}

	tmp = GetSecretScreenRN();
	return (value - tmp) & ((1 << round) - 1);
}

u16 SecretScreen_ChecksumPasswordBuf(u8 *buf, int length)
{
	u16 sum = 0;
	int i = 0;

	while (i < length) {
		sum = (u16)(sum + (buf[i] * (i + 1)));
		i++;
	}

	return (sum + (sum >> 9)) & 0x1FF;
}
