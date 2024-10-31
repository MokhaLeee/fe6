#include "prelude.h"
#include "proc.h"
#include "item.h"
#include "spellassoc.h"

struct SpellAssoc * GetSpellAssoc(u16 item)
{
    struct SpellAssoc * it = gSpellAssoc;
    u16 iid = GetItemIid(item);
    u16 item_;

    item_ = it->item;

    if (item_ != 0xFFFF)
    {
        while (item_ != iid)
        {
            item_ = (++it)->item;

            if (item_ == 0xFFFF)
                break;
        }
    }

    return it;
}

u8 GetSpellAssocCharCount(u16 item)
{
    return GetSpellAssoc(item)->count;
}

u16 GetSpellAssocEfxIndex(u16 item)
{
    return GetSpellAssoc(item)->efx;
}

struct ProcScr const * GetSpellAssocManimSpecialScr(int item)
{
    return GetSpellAssoc(item)->scr;
}

fu8 CheckSpellAssocCombat(u16 item)
{
    return GetSpellAssoc(item)->stat;
}

fu8 GetSpellAssocFacing(u16 item)
{
    return GetSpellAssoc(item)->facing;
}

fu8 GetSpellAssocFlashColor(u16 item)
{
    return GetSpellAssoc(item)->flash_color;
}

