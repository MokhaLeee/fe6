#include "prelude.h"
#include "item.h"
#include "constants/iids.h"

struct BanimInfoEnt CONST_DATA BanimInfo_Roy[] = {
    {
        .wtype = 0x0100 | ITEM_KIND_SWORD,
        .index = 0x0011,
    },
    {
        .wtype = 0x0100 | ITEM_KIND_ITEM,
        .index = 0x0015,
    },
    {
        .wtype = IID_BINDINGBLADE,
        .index = 0x004F,
    },
    { 0 }
};

struct BanimInfoEnt CONST_DATA BanimInfo_Mercenary[] = {
    {
        .wtype = 0x0100 | ITEM_KIND_SWORD,
        .index = 0x0007,
    },
    {
        .wtype = 0x0100 | ITEM_KIND_ITEM,
        .index = 0x0008,
    },
    { 0 }
};

struct BanimInfoEnt CONST_DATA BanimInfo_Hero[] = {
    {
        .wtype = 0x0100 | ITEM_KIND_SWORD,
        .index = 0x0016,
    },
    {
        .wtype = 0x0100 | ITEM_KIND_ITEM,
        .index = 0x0037,
    },
    {
        .wtype = 0x0100 | ITEM_KIND_AXE,
        .index = 0x004B,
    },
    {
        .wtype = IID_HANDAXE,
        .index = 0x0061,
    },
    {
        .wtype = IID_TOMAHAWK,
        .index = 0x0061,
    },
    { 0 }
};

struct BanimInfoEnt CONST_DATA BanimInfo_Hero_F[] = {
    {
        .wtype = 0x0100 | ITEM_KIND_SWORD,
        .index = 0x003E,
    },
    {
        .wtype = 0x0100 | ITEM_KIND_ITEM,
        .index = 0x003F,
    },
    {
        .wtype = 0x0100 | ITEM_KIND_AXE,
        .index = 0x004C,
    },
    {
        .wtype = IID_HANDAXE,
        .index = 0x0062,
    },
    {
        .wtype = IID_TOMAHAWK,
        .index = 0x0062,
    },
    { 0 }
};

struct BanimInfoEnt CONST_DATA BanimInfo_Myrmidon[] = {
    {
        .wtype = 0x0100 | ITEM_KIND_SWORD,
        .index = 0x0040,
    },
    {
        .wtype = 0x0100 | ITEM_KIND_ITEM,
        .index = 0x0041,
    },
    { 0 }
};

struct BanimInfoEnt CONST_DATA BanimInfo_Myrmidon_F[] = {
    {
        .wtype = 0x0100 | ITEM_KIND_SWORD,
        .index = 0x0049,
    },
    {
        .wtype = 0x0100 | ITEM_KIND_ITEM,
        .index = 0x004A,
    },
    { 0 }
};

struct BanimInfoEnt CONST_DATA BanimInfo_Swordmaster[] = {
    {
        .wtype = 0x0100 | ITEM_KIND_SWORD,
        .index = 0x0057,
    },
    {
        .wtype = 0x0100 | ITEM_KIND_ITEM,
        .index = 0x0058,
    },
    { 0 }
};

struct BanimInfoEnt CONST_DATA BanimInfo_Swordmaster_F[] = {
    {
        .wtype = 0x0100 | ITEM_KIND_SWORD,
        .index = 0x0059,
    },
    {
        .wtype = 0x0100 | ITEM_KIND_ITEM,
        .index = 0x005A,
    },
    { 0 }
};

struct BanimInfoEnt CONST_DATA BanimInfo_Fighter[] = {
    {
        .wtype = 0x0100 | ITEM_KIND_AXE,
        .index = 0x0023,
    },
    {
        .wtype = 0x0100 | ITEM_KIND_ITEM,
        .index = 0x0024,
    },
    {
        .wtype = IID_HANDAXE,
        .index = 0x0060,
    },
    {
        .wtype = IID_TOMAHAWK,
        .index = 0x0060,
    },
    { 0 }
};

struct BanimInfoEnt CONST_DATA BanimInfo_Warrior[] = {
    {
        .wtype = 0x0100 | ITEM_KIND_AXE,
        .index = 0x002F,
    },
    {
        .wtype = 0x0100 | ITEM_KIND_ITEM,
        .index = 0x0030,
    },
    {
        .wtype = 0x0100 | ITEM_KIND_BOW,
        .index = 0x0048,
    },
    {
        .wtype = IID_HANDAXE,
        .index = 0x0064,
    },
    {
        .wtype = IID_TOMAHAWK,
        .index = 0x0064,
    },
    { 0 }
};

struct BanimInfoEnt CONST_DATA BanimInfo_Armor[] = {
    {
        .wtype = 0x0100 | ITEM_KIND_LANCE,
        .index = 0x0001,
    },
    {
        .wtype = 0x0100 | ITEM_KIND_ITEM,
        .index = 0x0020,
    },
    { 0 }
};

struct BanimInfoEnt CONST_DATA BanimInfo_Armor_F[] = {
    {
        .wtype = 0x0100 | ITEM_KIND_LANCE,
        .index = 0x0001,
    },
    {
        .wtype = 0x0100 | ITEM_KIND_ITEM,
        .index = 0x0020,
    },
    { 0 }
};

struct BanimInfoEnt CONST_DATA BanimInfo_General[] = {
    {
        .wtype = 0x0100 | ITEM_KIND_LANCE,
        .index = 0x006E,
    },
    {
        .wtype = 0x0100 | ITEM_KIND_ITEM,
        .index = 0x0070,
    },
    {
        .wtype = 0x0100 | ITEM_KIND_AXE,
        .index = 0x006F,
    },
    {
        .wtype = IID_HANDAXE,
        .index = 0x0069,
    },
    {
        .wtype = IID_TOMAHAWK,
        .index = 0x0069,
    },
    { 0 }
};

struct BanimInfoEnt CONST_DATA BanimInfo_General_F[] = {
    {
        .wtype = 0x0100 | ITEM_KIND_LANCE,
        .index = 0x006E,
    },
    {
        .wtype = 0x0100 | ITEM_KIND_ITEM,
        .index = 0x0070,
    },
    {
        .wtype = 0x0100 | ITEM_KIND_AXE,
        .index = 0x006F,
    },
    {
        .wtype = IID_HANDAXE,
        .index = 0x0069,
    },
    {
        .wtype = IID_TOMAHAWK,
        .index = 0x0069,
    },
    { 0 }
};

struct BanimInfoEnt CONST_DATA BanimInfo_Archer[] = {
    {
        .wtype = 0x0100 | ITEM_KIND_BOW,
        .index = 0x000F,
    },
    {
        .wtype = 0x0100 | ITEM_KIND_ITEM,
        .index = 0x0045,
    },
    {
        .wtype = IID_BALLISTA,
        .index = 0x0068,
    },
    {
        .wtype = IID_LONGBALLISTA,
        .index = 0x0068,
    },
    {
        .wtype = IID_KILLERBALLISTA,
        .index = 0x0068,
    },
    { 0 }
};

struct BanimInfoEnt CONST_DATA BanimInfo_Archer_F[] = {
    {
        .wtype = 0x0100 | ITEM_KIND_BOW,
        .index = 0x0010,
    },
    {
        .wtype = 0x0100 | ITEM_KIND_ITEM,
        .index = 0x0046,
    },
    {
        .wtype = IID_BALLISTA,
        .index = 0x0068,
    },
    {
        .wtype = IID_LONGBALLISTA,
        .index = 0x0068,
    },
    {
        .wtype = IID_KILLERBALLISTA,
        .index = 0x0068,
    },
    { 0 }
};

struct BanimInfoEnt CONST_DATA BanimInfo_Sniper[] = {
    {
        .wtype = 0x0100 | ITEM_KIND_BOW,
        .index = 0x0005,
    },
    {
        .wtype = 0x0100 | ITEM_KIND_ITEM,
        .index = 0x0077,
    },
    {
        .wtype = IID_BALLISTA,
        .index = 0x0068,
    },
    {
        .wtype = IID_LONGBALLISTA,
        .index = 0x0068,
    },
    {
        .wtype = IID_KILLERBALLISTA,
        .index = 0x0068,
    },
    { 0 }
};

struct BanimInfoEnt CONST_DATA BanimInfo_Sniper_F[] = {
    {
        .wtype = 0x0100 | ITEM_KIND_BOW,
        .index = 0x0006,
    },
    {
        .wtype = 0x0100 | ITEM_KIND_ITEM,
        .index = 0x0078,
    },
    {
        .wtype = IID_BALLISTA,
        .index = 0x0068,
    },
    {
        .wtype = IID_LONGBALLISTA,
        .index = 0x0068,
    },
    {
        .wtype = IID_KILLERBALLISTA,
        .index = 0x0068,
    },
    { 0 }
};

struct BanimInfoEnt CONST_DATA BanimInfo_Priest[] = {
    {
        .wtype = 0x0100 | ITEM_KIND_STAFF,
        .index = 0x001A,
    },
    {
        .wtype = 0x0100 | ITEM_KIND_ITEM,
        .index = 0x0022,
    },
    { 0 }
};

struct BanimInfoEnt CONST_DATA BanimInfo_Cleric[] = {
    {
        .wtype = 0x0100 | ITEM_KIND_STAFF,
        .index = 0x0019,
    },
    {
        .wtype = 0x0100 | ITEM_KIND_ITEM,
        .index = 0x0021,
    },
    { 0 }
};

struct BanimInfoEnt CONST_DATA BanimInfo_Bishop[] = {
    {
        .wtype = 0x0100 | ITEM_KIND_STAFF,
        .index = 0x0026,
    },
    {
        .wtype = 0x0100 | ITEM_KIND_ANIMA,
        .index = 0x0025,
    },
    {
        .wtype = 0x0100 | ITEM_KIND_LIGHT,
        .index = 0x0025,
    },
    {
        .wtype = 0x0100 | ITEM_KIND_ELDER,
        .index = 0x0025,
    },
    {
        .wtype = 0x0100 | ITEM_KIND_ITEM,
        .index = 0x006A,
    },
    { 0 }
};

struct BanimInfoEnt CONST_DATA BanimInfo_Bishop_F[] = {
    {
        .wtype = 0x0100 | ITEM_KIND_STAFF,
        .index = 0x0028,
    },
    {
        .wtype = 0x0100 | ITEM_KIND_ANIMA,
        .index = 0x0027,
    },
    {
        .wtype = 0x0100 | ITEM_KIND_LIGHT,
        .index = 0x0027,
    },
    {
        .wtype = 0x0100 | ITEM_KIND_ELDER,
        .index = 0x0027,
    },
    {
        .wtype = 0x0100 | ITEM_KIND_ITEM,
        .index = 0x006B,
    },
    { 0 }
};

struct BanimInfoEnt CONST_DATA BanimInfo_Mage[] = {
    {
        .wtype = 0x0100 | ITEM_KIND_ANIMA,
        .index = 0x000D,
    },
    {
        .wtype = 0x0100 | ITEM_KIND_LIGHT,
        .index = 0x000D,
    },
    {
        .wtype = 0x0100 | ITEM_KIND_ELDER,
        .index = 0x000D,
    },
    {
        .wtype = 0x0100 | ITEM_KIND_ITEM,
        .index = 0x000D,
    },
    { 0 }
};

struct BanimInfoEnt CONST_DATA BanimInfo_Mage_F[] = {
    {
        .wtype = 0x0100 | ITEM_KIND_ANIMA,
        .index = 0x000E,
    },
    {
        .wtype = 0x0100 | ITEM_KIND_LIGHT,
        .index = 0x000E,
    },
    {
        .wtype = 0x0100 | ITEM_KIND_ELDER,
        .index = 0x000E,
    },
    {
        .wtype = 0x0100 | ITEM_KIND_ITEM,
        .index = 0x000E,
    },
    { 0 }
};

struct BanimInfoEnt CONST_DATA BanimInfo_Sage[] = {
    {
        .wtype = 0x0100 | ITEM_KIND_ANIMA,
        .index = 0x0036,
    },
    {
        .wtype = 0x0100 | ITEM_KIND_LIGHT,
        .index = 0x0036,
    },
    {
        .wtype = 0x0100 | ITEM_KIND_ELDER,
        .index = 0x0036,
    },
    {
        .wtype = 0x0100 | ITEM_KIND_ITEM,
        .index = 0x0036,
    },
    {
        .wtype = 0x0100 | ITEM_KIND_STAFF,
        .index = 0x0079,
    },
    { 0 }
};

struct BanimInfoEnt CONST_DATA BanimInfo_Sage_F[] = {
    {
        .wtype = 0x0100 | ITEM_KIND_ANIMA,
        .index = 0x0012,
    },
    {
        .wtype = 0x0100 | ITEM_KIND_LIGHT,
        .index = 0x0012,
    },
    {
        .wtype = 0x0100 | ITEM_KIND_ELDER,
        .index = 0x0012,
    },
    {
        .wtype = 0x0100 | ITEM_KIND_ITEM,
        .index = 0x0012,
    },
    {
        .wtype = 0x0100 | ITEM_KIND_STAFF,
        .index = 0x007A,
    },
    { 0 }
};

struct BanimInfoEnt CONST_DATA BanimInfo_Shaman[] = {
    {
        .wtype = 0x0100 | ITEM_KIND_ANIMA,
        .index = 0x002D,
    },
    {
        .wtype = 0x0100 | ITEM_KIND_LIGHT,
        .index = 0x002D,
    },
    {
        .wtype = 0x0100 | ITEM_KIND_ELDER,
        .index = 0x002D,
    },
    {
        .wtype = 0x0100 | ITEM_KIND_ITEM,
        .index = 0x002D,
    },
    { 0 }
};

struct BanimInfoEnt CONST_DATA BanimInfo_Shaman_F[] = {
    {
        .wtype = 0x0100 | ITEM_KIND_ANIMA,
        .index = 0x002E,
    },
    {
        .wtype = 0x0100 | ITEM_KIND_LIGHT,
        .index = 0x002E,
    },
    {
        .wtype = 0x0100 | ITEM_KIND_ELDER,
        .index = 0x002E,
    },
    {
        .wtype = 0x0100 | ITEM_KIND_ITEM,
        .index = 0x002E,
    },
    { 0 }
};

struct BanimInfoEnt CONST_DATA BanimInfo_Druid[] = {
    {
        .wtype = 0x0100 | ITEM_KIND_ANIMA,
        .index = 0x0014,
    },
    {
        .wtype = 0x0100 | ITEM_KIND_LIGHT,
        .index = 0x0014,
    },
    {
        .wtype = 0x0100 | ITEM_KIND_ELDER,
        .index = 0x0014,
    },
    {
        .wtype = 0x0100 | ITEM_KIND_ITEM,
        .index = 0x0014,
    },
    {
        .wtype = 0x0100 | ITEM_KIND_STAFF,
        .index = 0x005B,
    },
    { 0 }
};

struct BanimInfoEnt CONST_DATA BanimInfo_Druid_F[] = {
    {
        .wtype = 0x0100 | ITEM_KIND_ANIMA,
        .index = 0x0071,
    },
    {
        .wtype = 0x0100 | ITEM_KIND_LIGHT,
        .index = 0x0071,
    },
    {
        .wtype = 0x0100 | ITEM_KIND_ELDER,
        .index = 0x0071,
    },
    {
        .wtype = 0x0100 | ITEM_KIND_ITEM,
        .index = 0x0071,
    },
    {
        .wtype = 0x0100 | ITEM_KIND_STAFF,
        .index = 0x0072,
    },
    { 0 }
};

struct BanimInfoEnt CONST_DATA BanimInfo_Cavalier[] = {
    {
        .wtype = 0x0100 | ITEM_KIND_SWORD,
        .index = 0x000A,
    },
    {
        .wtype = 0x0100 | ITEM_KIND_LANCE,
        .index = 0x0009,
    },
    {
        .wtype = 0x0100 | ITEM_KIND_ITEM,
        .index = 0x000B,
    },
    { 0 }
};

struct BanimInfoEnt CONST_DATA BanimInfo_Paladin[] = {
    {
        .wtype = 0x0100 | ITEM_KIND_LANCE,
        .index = 0x001B,
    },
    {
        .wtype = 0x0100 | ITEM_KIND_SWORD,
        .index = 0x0043,
    },
    {
        .wtype = 0x0100 | ITEM_KIND_AXE,
        .index = 0x0042,
    },
    {
        .wtype = 0x0100 | ITEM_KIND_ITEM,
        .index = 0x0044,
    },
    { 0 }
};

struct BanimInfoEnt CONST_DATA BanimInfo_Troubadour[] = {
    {
        .wtype = 0x0100 | ITEM_KIND_STAFF,
        .index = 0x0032,
    },
    {
        .wtype = 0x0100 | ITEM_KIND_ITEM,
        .index = 0x0033,
    },
    { 0 }
};

struct BanimInfoEnt CONST_DATA BanimInfo_Valkyrie[] = {
    {
        .wtype = 0x0100 | ITEM_KIND_STAFF,
        .index = 0x0035,
    },
    {
        .wtype = 0x0100 | ITEM_KIND_ANIMA,
        .index = 0x0034,
    },
    {
        .wtype = 0x0100 | ITEM_KIND_LIGHT,
        .index = 0x0034,
    },
    {
        .wtype = 0x0100 | ITEM_KIND_ELDER,
        .index = 0x0034,
    },
    {
        .wtype = 0x0100 | ITEM_KIND_ITEM,
        .index = 0x0034,
    },
    { 0 }
};

struct BanimInfoEnt CONST_DATA BanimInfo_Nomad[] = {
    {
        .wtype = 0x0100 | ITEM_KIND_BOW,
        .index = 0x001C,
    },
    {
        .wtype = 0x0100 | ITEM_KIND_ITEM,
        .index = 0x001D,
    },
    { 0 }
};

struct BanimInfoEnt CONST_DATA BanimInfo_Nomad_F[] = {
    {
        .wtype = 0x0100 | ITEM_KIND_BOW,
        .index = 0x001E,
    },
    {
        .wtype = 0x0100 | ITEM_KIND_ITEM,
        .index = 0x001F,
    },
    { 0 }
};

struct BanimInfoEnt CONST_DATA BanimInfo_Nomadtrooper[] = {
    {
        .wtype = 0x0100 | ITEM_KIND_BOW,
        .index = 0x0052,
    },
    {
        .wtype = 0x0100 | ITEM_KIND_ITEM,
        .index = 0x0054,
    },
    {
        .wtype = 0x0100 | ITEM_KIND_SWORD,
        .index = 0x0050,
    },
    { 0 }
};

struct BanimInfoEnt CONST_DATA BanimInfo_Nomadtrooper_F[] = {
    {
        .wtype = 0x0100 | ITEM_KIND_BOW,
        .index = 0x0053,
    },
    {
        .wtype = 0x0100 | ITEM_KIND_ITEM,
        .index = 0x0055,
    },
    {
        .wtype = 0x0100 | ITEM_KIND_SWORD,
        .index = 0x0051,
    },
    { 0 }
};

struct BanimInfoEnt CONST_DATA BanimInfo_Pegasusknight[] = {
    {
        .wtype = 0x0100 | ITEM_KIND_LANCE,
        .index = 0x0038,
    },
    {
        .wtype = 0x0100 | ITEM_KIND_ITEM,
        .index = 0x0039,
    },
    { 0 }
};

struct BanimInfoEnt CONST_DATA BanimInfo_Falconknight[] = {
    {
        .wtype = 0x0100 | ITEM_KIND_LANCE,
        .index = 0x0073,
    },
    {
        .wtype = 0x0100 | ITEM_KIND_ITEM,
        .index = 0x0074,
    },
    {
        .wtype = 0x0100 | ITEM_KIND_SWORD,
        .index = 0x000C,
    },
    { 0 }
};

struct BanimInfoEnt CONST_DATA BanimInfo_Wyvernrider[] = {
    {
        .wtype = 0x0100 | ITEM_KIND_LANCE,
        .index = 0x004D,
    },
    {
        .wtype = 0x0100 | ITEM_KIND_ITEM,
        .index = 0x004E,
    },
    { 0 }
};

struct BanimInfoEnt CONST_DATA BanimInfo_Wyvernrider_F[] = {
    {
        .wtype = 0x0100 | ITEM_KIND_LANCE,
        .index = 0x004D,
    },
    {
        .wtype = 0x0100 | ITEM_KIND_ITEM,
        .index = 0x004E,
    },
    { 0 }
};

struct BanimInfoEnt CONST_DATA BanimInfo_Wyvernlord[] = {
    {
        .wtype = 0x0100 | ITEM_KIND_LANCE,
        .index = 0x0065,
    },
    {
        .wtype = 0x0100 | ITEM_KIND_ITEM,
        .index = 0x0067,
    },
    {
        .wtype = 0x0100 | ITEM_KIND_SWORD,
        .index = 0x0066,
    },
    { 0 }
};

struct BanimInfoEnt CONST_DATA BanimInfo_Wyvernlord_F[] = {
    {
        .wtype = 0x0100 | ITEM_KIND_LANCE,
        .index = 0x0065,
    },
    {
        .wtype = 0x0100 | ITEM_KIND_ITEM,
        .index = 0x0067,
    },
    {
        .wtype = 0x0100 | ITEM_KIND_SWORD,
        .index = 0x0066,
    },
    { 0 }
};

struct BanimInfoEnt CONST_DATA BanimInfo_Soldier[] = {
    {
        .wtype = 0x0100 | ITEM_KIND_LANCE,
        .index = 0x0013,
    },
    {
        .wtype = 0x0100 | ITEM_KIND_ITEM,
        .index = 0x0047,
    },
    { 0 }
};

struct BanimInfoEnt CONST_DATA BanimInfo_Brigand[] = {
    {
        .wtype = 0x0100 | ITEM_KIND_AXE,
        .index = 0x0004,
    },
    {
        .wtype = 0x0100 | ITEM_KIND_ITEM,
        .index = 0x002B,
    },
    {
        .wtype = IID_HANDAXE,
        .index = 0x005F,
    },
    {
        .wtype = IID_TOMAHAWK,
        .index = 0x005F,
    },
    { 0 }
};

struct BanimInfoEnt CONST_DATA BanimInfo_Pirate[] = {
    {
        .wtype = 0x0100 | ITEM_KIND_AXE,
        .index = 0x0002,
    },
    {
        .wtype = 0x0100 | ITEM_KIND_ITEM,
        .index = 0x0031,
    },
    {
        .wtype = IID_HANDAXE,
        .index = 0x005D,
    },
    {
        .wtype = IID_TOMAHAWK,
        .index = 0x005D,
    },
    { 0 }
};

struct BanimInfoEnt CONST_DATA BanimInfo_Berserker[] = {
    {
        .wtype = 0x0100 | ITEM_KIND_AXE,
        .index = 0x0003,
    },
    {
        .wtype = 0x0100 | ITEM_KIND_ITEM,
        .index = 0x002C,
    },
    {
        .wtype = IID_HANDAXE,
        .index = 0x005E,
    },
    {
        .wtype = IID_TOMAHAWK,
        .index = 0x005E,
    },
    { 0 }
};

struct BanimInfoEnt CONST_DATA BanimInfo_Thief[] = {
    {
        .wtype = 0x0100 | ITEM_KIND_SWORD,
        .index = 0x003A,
    },
    {
        .wtype = 0x0100 | ITEM_KIND_ITEM,
        .index = 0x003B,
    },
    { 0 }
};

struct BanimInfoEnt CONST_DATA BanimInfo_Thief_F[] = {
    {
        .wtype = 0x0100 | ITEM_KIND_SWORD,
        .index = 0x003C,
    },
    {
        .wtype = 0x0100 | ITEM_KIND_ITEM,
        .index = 0x003D,
    },
    { 0 }
};

struct BanimInfoEnt CONST_DATA BanimInfo_Bard[] = {
    {
        .wtype = 0x0100 | ITEM_KIND_ITEM,
        .index = 0x0018,
    },
    { 0 }
};

struct BanimInfoEnt CONST_DATA BanimInfo_Dancer[] = {
    {
        .wtype = 0x0100 | ITEM_KIND_ITEM,
        .index = 0x0017,
    },
    { 0 }
};

struct BanimInfoEnt CONST_DATA BanimInfo_Manakete[] = {
    {
        .wtype = 0x0100 | ITEM_KIND_ITEM,
        .index = 0x0029,
    },
    {
        .wtype = 0x0100 | ITEM_KIND_DRAGONSTONE,
        .index = 0x0029,
    },
    { 0 }
};

struct BanimInfoEnt CONST_DATA BanimInfo_Manakete_F[] = {
    {
        .wtype = 0x0100 | ITEM_KIND_ITEM,
        .index = 0x002A,
    },
    {
        .wtype = 0x0100 | ITEM_KIND_DRAGONSTONE,
        .index = 0x002A,
    },
    { 0 }
};

struct BanimInfoEnt CONST_DATA BanimInfo_Firedragon[] = {
    {
        .wtype = 0x0100 | ITEM_KIND_ANIMA,
        .index = 0x0056,
    },
    {
        .wtype = 0x0100 | ITEM_KIND_LIGHT,
        .index = 0x0056,
    },
    {
        .wtype = 0x0100 | ITEM_KIND_ELDER,
        .index = 0x0056,
    },
    { 0 }
};

struct BanimInfoEnt CONST_DATA BanimInfo_Divinedragon[] = {
    {
        .wtype = 0x0100 | ITEM_KIND_ANIMA,
        .index = 0x005C,
    },
    {
        .wtype = 0x0100 | ITEM_KIND_LIGHT,
        .index = 0x005C,
    },
    {
        .wtype = 0x0100 | ITEM_KIND_ELDER,
        .index = 0x005C,
    },
    { 0 }
};

struct BanimInfoEnt CONST_DATA BanimInfo_Demondragon[] = {
    {
        .wtype = 0x0100 | ITEM_KIND_ITEM,
        .index = 0x0029,
    },
    {
        .wtype = 0x0100 | ITEM_KIND_DRAGONSTONE,
        .index = 0x0029,
    },
    { 0 }
};

struct BanimInfoEnt CONST_DATA BanimInfo_King[] = {
    {
        .wtype = 0x0100 | ITEM_KIND_SWORD,
        .index = 0x0076,
    },
    {
        .wtype = 0x0100 | ITEM_KIND_ITEM,
        .index = 0x0076,
    },
    { 0 }
};

struct BanimInfoEnt CONST_DATA BanimInfo_Roy_Promoted[] = {
    {
        .wtype = 0x0100 | ITEM_KIND_SWORD,
        .index = 0x0011,
    },
    {
        .wtype = 0x0100 | ITEM_KIND_ITEM,
        .index = 0x0015,
    },
    {
        .wtype = IID_BINDINGBLADE,
        .index = 0x004F,
    },
    { 0 }
};
