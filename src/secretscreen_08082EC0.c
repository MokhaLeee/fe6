#include "prelude.h"
#include "secretscreen.h"

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
