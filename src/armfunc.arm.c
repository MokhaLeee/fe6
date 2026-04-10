#include "prelude.h"

u32 _Checksum32(const u32 * data_u32, int size)
{
	int i;
	uint32_t add_acc;
	uint32_t xor_acc;

	for (i = 0; i < size / 4; i++)
	{
		add_acc += data_u32[i];
		xor_acc ^= data_u32[i];
	}
	return (u16)add_acc + ((u16)xor_acc << 0x10);
}
