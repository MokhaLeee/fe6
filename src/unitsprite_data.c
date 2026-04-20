#include "prelude.h"
#include "unitsprite.h"
#include "constants/unitsprites.h"

struct UnitSpriteInfo CONST_DATA UnitSpriteTable[] = {
	[UNITSPRITE_ROY] = {
		.unk_00 = 2,
		.size = UNITSPRITE_16x16,
		.img = Img_UnitSprite_Roylord
	},
	[UNITSPRITE_MERCENARY] = {
		.unk_00 = 2,
		.size = UNITSPRITE_16x16,
		.img = Img_UnitSprite_Mercenary
	},
	[UNITSPRITE_MERCENARY_F] = {
		.unk_00 = 2,
		.size = UNITSPRITE_32x32,
		.img = Img_UnitSprite_0825073C
	},
	[UNITSPRITE_HERO] = {
		.unk_00 = 2,
		.size = UNITSPRITE_16x16,
		.img = Img_UnitSprite_082508CC
	},
	[UNITSPRITE_HERO_F] = {
		.unk_00 = 2,
		.size = UNITSPRITE_16x16,
		.img = Img_UnitSprite_08250A2C
	},
	[UNITSPRITE_MYRMIDON] = {
		.unk_00 = 2,
		.size = UNITSPRITE_16x16,
		.img = Img_UnitSprite_08250B68
	},
	[UNITSPRITE_MYRMIDON_F] = {
		.unk_00 = 2,
		.size = UNITSPRITE_16x16,
		.img = Img_UnitSprite_08250C7C
	},
	[UNITSPRITE_SWORDMASTER] = {
		.unk_00 = 2,
		.size = UNITSPRITE_16x16,
		.img = Img_UnitSprite_08250D8C
	},
	[UNITSPRITE_SWORDMASTER_F] = {
		.unk_00 = 2,
		.size = UNITSPRITE_16x16,
		.img = Img_UnitSprite_08250E74
	},
	[UNITSPRITE_FIGHTER] = {
		.unk_00 = 2,
		.size = UNITSPRITE_16x32,
		.img = Img_UnitSprite_08250F50
	},
	[UNITSPRITE_WARRIOR] = {
		.unk_00 = 2,
		.size = UNITSPRITE_16x32,
		.img = Img_UnitSprite_0825107C
	},
	[UNITSPRITE_ARMOR] = {
		.unk_00 = 2,
		.size = UNITSPRITE_16x16,
		.img = Img_UnitSprite_082511FC
	},
	[UNITSPRITE_GENERAL] = {
		.unk_00 = 0,
		.size = UNITSPRITE_16x32,
		.img = Img_UnitSprite_08251308
	},
	[UNITSPRITE_ARCHER] = {
		.unk_00 = 2,
		.size = UNITSPRITE_16x16,
		.img = Img_UnitSprite_082514A8
	},
	[UNITSPRITE_ARCHER_F] = {
		.unk_00 = 2,
		.size = UNITSPRITE_16x16,
		.img = Img_UnitSprite_082515C0
	},
	[UNITSPRITE_SNIPER] = {
		.unk_00 = 2,
		.size = UNITSPRITE_16x16,
		.img = Img_UnitSprite_082516D4
	},
	[UNITSPRITE_SNIPER_F] = {
		.unk_00 = 2,
		.size = UNITSPRITE_16x16,
		.img = Img_UnitSprite_08251818
	},
	[UNITSPRITE_PRIEST] = {
		.unk_00 = 2,
		.size = UNITSPRITE_16x16,
		.img = Img_UnitSprite_0825193C
	},
	[UNITSPRITE_CLERIC] = {
		.unk_00 = 2,
		.size = UNITSPRITE_16x16,
		.img = Img_UnitSprite_08251A48
	},
	[UNITSPRITE_BISHOP] = {
		.unk_00 = 2,
		.size = UNITSPRITE_16x16,
		.img = Img_UnitSprite_08251B6C
	},
	[UNITSPRITE_BISHOP_F] = {
		.unk_00 = 2,
		.size = UNITSPRITE_16x16,
		.img = Img_UnitSprite_08251CC0
	},
	[UNITSPRITE_MAGE] = {
		.unk_00 = 2,
		.size = UNITSPRITE_16x16,
		.img = Img_UnitSprite_08251E18
	},
	[UNITSPRITE_MAGE_F] = {
		.unk_00 = 2,
		.size = UNITSPRITE_16x16,
		.img = Img_UnitSprite_08251F50
	},
	[UNITSPRITE_SAGE] = {
		.unk_00 = 2,
		.size = UNITSPRITE_16x16,
		.img = Img_UnitSprite_08252090
	},
	[UNITSPRITE_SAGE_F] = {
		.unk_00 = 2,
		.size = UNITSPRITE_16x16,
		.img = Img_UnitSprite_082521EC
	},
	[UNITSPRITE_SHAMAN] = {
		.unk_00 = 2,
		.size = UNITSPRITE_16x16,
		.img = Img_UnitSprite_0825234C
	},
	[UNITSPRITE_SHAMAN_F] = {
		.unk_00 = 2,
		.size = UNITSPRITE_16x16,
		.img = Img_UnitSprite_082524A4
	},
	[UNITSPRITE_DRUID] = {
		.unk_00 = 2,
		.size = UNITSPRITE_16x16,
		.img = Img_UnitSprite_082525E8
	},
	[UNITSPRITE_DRUID_F] = {
		.unk_00 = 2,
		.size = UNITSPRITE_16x16,
		.img = Img_UnitSprite_0825275C
	},
	[UNITSPRITE_CAVALIER] = {
		.unk_00 = 2,
		.size = UNITSPRITE_16x32,
		.img = Img_UnitSprite_082528A8
	},
	[UNITSPRITE_CAVALIER_F] = {
		.unk_00 = 0,
		.size = UNITSPRITE_16x32,
		.img = Img_UnitSprite_08252A64
	},
	[UNITSPRITE_PALADIN] = {
		.unk_00 = 2,
		.size = UNITSPRITE_16x32,
		.img = Img_UnitSprite_08252B94
	},
	[UNITSPRITE_PALADIN_F] = {
		.unk_00 = 0,
		.size = UNITSPRITE_16x32,
		.img = Img_UnitSprite_08252D64
	},
	[UNITSPRITE_TROUBADOUR] = {
		.unk_00 = 2,
		.size = UNITSPRITE_16x32,
		.img = Img_UnitSprite_08252E94
	},
	[UNITSPRITE_VALKYRIE] = {
		.unk_00 = 2,
		.size = UNITSPRITE_16x32,
		.img = Img_UnitSprite_08253050
	},
	[UNITSPRITE_NOMAD] = {
		.unk_00 = 2,
		.size = UNITSPRITE_16x32,
		.img = Img_UnitSprite_08253200
	},
	[UNITSPRITE_NOMAD_F] = {
		.unk_00 = 2,
		.size = UNITSPRITE_16x32,
		.img = Img_UnitSprite_082533D0
	},
	[UNITSPRITE_NOMADTROOPER] = {
		.unk_00 = 2,
		.size = UNITSPRITE_16x32,
		.img = Img_UnitSprite_082535AC
	},
	[UNITSPRITE_NOMADTROOPER_F] = {
		.unk_00 = 2,
		.size = UNITSPRITE_16x32,
		.img = Img_UnitSprite_08253788
	},
	[UNITSPRITE_PEGASUSKNIGHT] = {
		.unk_00 = 2,
		.size = UNITSPRITE_16x32,
		.img = Img_UnitSprite_0825396C
	},
	[UNITSPRITE_FALCONKNIGHT] = {
		.unk_00 = 2,
		.size = UNITSPRITE_16x32,
		.img = Img_UnitSprite_08253B10
	},
	[UNITSPRITE_WYVERNRIDER] = {
		.unk_00 = 2,
		.size = UNITSPRITE_16x32,
		.img = Img_UnitSprite_08253CBC
	},
	[UNITSPRITE_WYVERNLORD] = {
		.unk_00 = 2,
		.size = UNITSPRITE_16x32,
		.img = Img_UnitSprite_08253EB0
	},
	[UNITSPRITE_SOLDIER] = {
		.unk_00 = 2,
		.size = UNITSPRITE_16x16,
		.img = Img_UnitSprite_082540A4
	},
	[UNITSPRITE_BRIGAND] = {
		.unk_00 = 2,
		.size = UNITSPRITE_16x32,
		.img = Img_UnitSprite_082541F8
	},
	[UNITSPRITE_PIRATE] = {
		.unk_00 = 2,
		.size = UNITSPRITE_16x16,
		.img = Img_UnitSprite_0825436C
	},
	[UNITSPRITE_BERSERKER] = {
		.unk_00 = 2,
		.size = UNITSPRITE_16x32,
		.img = Img_UnitSprite_082544E8
	},
	[UNITSPRITE_THIEF] = {
		.unk_00 = 2,
		.size = UNITSPRITE_16x16,
		.img = Img_UnitSprite_082546C8
	},
	[UNITSPRITE_THIEF_F] = {
		.unk_00 = 2,
		.size = UNITSPRITE_16x16,
		.img = Img_UnitSprite_08254804
	},
	[UNITSPRITE_BARD] = {
		.unk_00 = 2,
		.size = UNITSPRITE_16x16,
		.img = Img_UnitSprite_08254944
	},
	[UNITSPRITE_DANCER] = {
		.unk_00 = 2,
		.size = UNITSPRITE_16x16,
		.img = Img_UnitSprite_08254A88
	},
	[UNITSPRITE_MANAKETE] = {
		.unk_00 = 2,
		.size = UNITSPRITE_16x16,
		.img = Img_UnitSprite_08254BC4
	},
	[UNITSPRITE_FAE] = {
		.unk_00 = 2,
		.size = UNITSPRITE_16x16,
		.img = Img_UnitSprite_08254D14
	},
	[UNITSPRITE_FIREDRAGON] = {
		.unk_00 = 3,
		.size = UNITSPRITE_16x16,
		.img = Img_UnitSprite_08254E0C
	},
	[UNITSPRITE_DIVINEDRAGON] = {
		.unk_00 = 2,
		.size = UNITSPRITE_16x16,
		.img = Img_UnitSprite_08254EE0
	},
	[UNITSPRITE_DEMONDRAGON] = {
		.unk_00 = 2,
		.size = UNITSPRITE_32x32,
		.img = Img_UnitSprite_08254F50
	},
	[UNITSPRITE_KING] = {
		.unk_00 = 2,
		.size = UNITSPRITE_16x32,
		.img = Img_UnitSprite_082552C0
	},
	[UNITSPRITE_CIVILIAN] = {
		.unk_00 = 2,
		.size = UNITSPRITE_16x16,
		.img = Img_UnitSprite_082554A8
	},
	[UNITSPRITE_CIVILIAN_F] = {
		.unk_00 = 2,
		.size = UNITSPRITE_16x16,
		.img = Img_UnitSprite_08255588
	},
	[UNITSPRITE_CHILD] = {
		.unk_00 = 2,
		.size = UNITSPRITE_16x16,
		.img = Img_UnitSprite_0825566C
	},
	[UNITSPRITE_CHILD_F] = {
		.unk_00 = 2,
		.size = UNITSPRITE_16x16,
		.img = Img_UnitSprite_0825573C
	},
	[UNITSPRITE_SUPPLY] = {
		.unk_00 = 2,
		.size = UNITSPRITE_16x32,
		.img = Img_UnitSprite_08255810
	},
	[UNITSPRITE_ROY_PROMOTED] = {
		.unk_00 = 0,
		.size = UNITSPRITE_16x32,
		.img = Img_UnitSprite_082559B8
	},
	[UNITSPRITE_ARCHER_BALLISTA] = {
		.unk_00 = 2,
		.size = UNITSPRITE_16x32,
		.img = Img_UnitSprite_08255B4C
	},
	[UNITSPRITE_ARCHER_LONGBALLISTA] = {
		.unk_00 = 2,
		.size = UNITSPRITE_16x32,
		.img = Img_UnitSprite_08255CB0
	},
	[UNITSPRITE_ARCHER_KILLERBALLISTA] = {
		.unk_00 = 2,
		.size = UNITSPRITE_16x32,
		.img = Img_UnitSprite_08255E34
	},
	[UNITSPRITE_BALLISTA] = {
		.unk_00 = 2,
		.size = UNITSPRITE_16x32,
		.img = Img_UnitSprite_08255F98
	},
	[UNITSPRITE_LONGBALLISTA] = {
		.unk_00 = 2,
		.size = UNITSPRITE_16x32,
		.img = Img_UnitSprite_082560DC
	},
	[UNITSPRITE_KILLERBALLISTA] = {
		.unk_00 = 2,
		.size = UNITSPRITE_16x32,
		.img = Img_UnitSprite_0825623C
	},
	[UNITSPRITE_DISMOUNTED] = {
		.unk_00 = 2,
		.size = UNITSPRITE_16x16,
		.img = Img_UnitSprite_08256384
	},
	[UNITSPRITE_DISMOUNTED_F] = {
		.unk_00 = 2,
		.size = UNITSPRITE_16x16,
		.img = Img_UnitSprite_082563BC
	},
};
