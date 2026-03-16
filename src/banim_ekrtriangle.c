#include "prelude.h"
#include "proc.h"
#include "unit.h"
#include "item.h"
#include "banim.h"
#include "constants/jids.h"
#include "constants/iids.h"

EWRAM_OVERLAY(banim) int gEkrTriangleInvalid = 0;

bool CheckEkrTriangleInvalid(void)
{
	if (gEkrTriangleInvalid == true)
		return true;

	return false;
}

void DebugEkrTriangleMsg(void) {}

struct ProcScr CONST_DATA ProcScr_EkrTriangle[] = {
	PROC_19,
	PROC_REPEAT(EkrTriangle_Loop),
	PROC_END,
};

void NewEkrTriangle(struct Anim * anim)
{
	struct ProcEfx *proc;

	proc = SpawnProc(ProcScr_EkrTriangle, PROC_TREE_3);
	proc->anim = anim;
	gEkrTriangleInvalid = false;
}

#if 0
void EkrTriangle_Loop(struct ProcEfx *proc)
{
	int jid, jid1, jid2, wpn_type;
	int etype2;
	int ewtype1;
	int ewtype2;
	int etype1;
	struct Unit *unit;
	u16 wpn;

	etype1 = 0;
	etype2 = 0;
	ewtype1 = 0;
	ewtype2 = 0;

	jid = (GetAnimPosition(proc->anim) == POS_L)
		? gpEkrBattleUnitLeft->unit.jinfo->id
		: gpEkrBattleUnitRight->unit.jinfo->id;

	switch (jid) {
	case JID_GENERAL_F:
	case JID_GENERAL:
	case JID_ARMOR_F:
	case JID_ARMOR:

		unit = gpEkrTriangleUnits[POS_L];
		jid1 = unit->jinfo->id;

		if (jid1 == JID_ARMOR)
			etype1 = EKR_TRI_JTYPE_DEFAULT;
		if (jid1 == JID_ARMOR_F)
			etype1 = EKR_TRI_JTYPE_DEFAULT;
		if (jid1 == JID_GENERAL)
			etype1 = EKR_TRI_JTYPE_PROMOTED;
		if (jid1 == JID_GENERAL_F)
			etype1 = EKR_TRI_JTYPE_PROMOTED;

		wpn = GetUnitEquippedWeapon(unit);
		if (wpn == 0)
			wpn_type = ITEM_KIND_LANCE;
		else
			wpn_type = GetItemKind(wpn);

		switch (wpn_type) {
		case ITEM_KIND_LANCE:
			ewtype1 = EKR_TRI_WTYPE_DEFAULT;
			break;

		case ITEM_KIND_AXE:
			ewtype1 = (GetItemIid(wpn) == IID_HANDAXE)
					? EKR_TRI_WTYPE_ALTERNATIVE2
					: EKR_TRI_WTYPE_ALTERNATIVE;
			break;

		default:
			break;
		}

		unit = gpEkrTriangleUnits[POS_R];
		jid2 = unit->jinfo->id;

		if (jid2 == JID_ARMOR)
			etype2 = EKR_TRI_JTYPE_DEFAULT;
		if (jid2 == JID_ARMOR_F)
			etype2 = EKR_TRI_JTYPE_DEFAULT;
		if (jid2 == JID_GENERAL)
			etype2 = EKR_TRI_JTYPE_PROMOTED;
		if (jid2 == JID_GENERAL_F)
			etype2 = EKR_TRI_JTYPE_PROMOTED;

		wpn = GetUnitEquippedWeapon(unit);
		if (wpn == 0)
			wpn_type = ITEM_KIND_LANCE;
		else
			wpn_type = GetItemKind(wpn);

		switch (wpn_type) {
		case ITEM_KIND_LANCE:
			ewtype2 = EKR_TRI_WTYPE_DEFAULT;
			break;

		case ITEM_KIND_AXE:
			ewtype2 = (GetItemIid(wpn) == IID_HANDAXE)
					? EKR_TRI_WTYPE_ALTERNATIVE2
					: EKR_TRI_WTYPE_ALTERNATIVE;
			break;

		default:
			break;
		}

		NewEkrTriArmorKnight(proc->anim, etype1, etype2, ewtype1, ewtype2);

		if (GetItemIid(gpEkrBattleUnitRight->weapon_before) == IID_HANDAXE)
			gEkrTriangleInvalid = false;
		else
			gEkrTriangleInvalid = true;

		break;

	default:
		unit = gpEkrTriangleUnits[POS_L];
		jid1 = unit->jinfo->id;

		if (jid1 == JID_PEGASUSKNIGHT)
			etype1 = EKR_TRI_JTYPE_DEFAULT;
		if (jid1 == JID_FALCONKNIGHT)
			etype1 = EKR_TRI_JTYPE_PROMOTED;

		wpn = GetUnitEquippedWeapon(unit);
		if (wpn == 0)
			wpn_type = ITEM_KIND_LANCE;
		else
			wpn_type = GetItemKind(wpn);

		switch (wpn_type) {
		case ITEM_KIND_LANCE:
			ewtype1 = EKR_TRI_WTYPE_DEFAULT;
			break;

		case ITEM_KIND_SWORD:
			ewtype1 = EKR_TRI_WTYPE_ALTERNATIVE;
			break;

		default:
			break;
		}

		unit = gpEkrTriangleUnits[POS_R];
		jid2 = unit->jinfo->id;

		if (jid2 == JID_PEGASUSKNIGHT)
			etype2 = EKR_TRI_JTYPE_DEFAULT;
		if (jid2 == JID_FALCONKNIGHT)
			etype2 = EKR_TRI_JTYPE_PROMOTED;

		wpn = GetUnitEquippedWeapon(unit);
		if (wpn == 0)
			wpn_type = ITEM_KIND_LANCE;
		else
			wpn_type = GetItemKind(wpn);

		switch (wpn_type) {
		case ITEM_KIND_LANCE:
			ewtype2 = EKR_TRI_WTYPE_DEFAULT;
			break;

		case ITEM_KIND_SWORD:
			ewtype2 = EKR_TRI_WTYPE_ALTERNATIVE;
			break;

		default:
			break;
		}

		NewEkrTriPegasusKnight(proc->anim, etype1, etype2, ewtype1, ewtype2);

		if (jid == JID_PEGASUSKNIGHT)
			gEkrTriangleInvalid = false;
		else
			gEkrTriangleInvalid = true;

		break;
	}

	Proc_Break(proc);
}
#endif
