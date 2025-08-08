#include "prelude.h"
#include "unit.h"
#include "banim_sprite.h"
#include "banim.h"

#if 0
void BattleAIS_ExecCommands(void)
{
	u32 i;

	for (i = 0; i < 4; i++) {
		int type;
		struct Anim *anim;
		
		anim = gAnims[i];
		if (!anim)
			continue;

		type = anim->flags2 & ANIM_BIT2_CMD_MASK;
		if (type == 0)	
			continue;

		if (type & ANIM_BIT2_COMMAND) {
			while (1) {
				struct Anim *anim_other;

				if (anim->cqSize == 0)
					break;

				switch (anim->cq[anim->cqSize - 1]) {
				case BAS_CMD(0x01):
					if (gAnimC01Blocking == 1)
						anim->scrCur = anim->script;
					else if (!(anim->flags3 & ANIM_BIT3_C01_BLOCK_END_PREBATTLE))
						anim->scrCur++;
					else if (anim->flags3 & ANIM_BIT3_C01_BLOCK_END_INBATTLE) {
						if (CheckEkrHitDone() == true) {
							anim->flags3 &= ~(ANIM_BIT3_C02_BLOCK_END | ANIM_BIT3_C01_BLOCK_END_PREBATTLE | ANIM_BIT3_C01_BLOCK_END_INBATTLE);
							anim->scrCur++;
						}
					}
					break;

				/**
				 * C02: blocking
				 */
				case BAS_CMD(0x02):
					if (anim->flags3 & ANIM_BIT3_C02_BLOCK_END) {
						anim->flags3 &= ~ANIM_BIT3_C02_BLOCK_END;
						anim->scrCur++;
					}
					break;

				/**
				 * C03: EfxSpecalEffect
				 */
				case BAS_CMD(0x03):
					if (!(anim->flags3 & ANIM_BIT3_BLOCKING)) {
						anim->flags3 |= ANIM_BIT3_BLOCKING;

						if (GetAnimLayer(anim) == 0)
							NewEfxSpecalEffect(anim);
					}

					if (anim->flags3 & ANIM_BIT3_BLOCKEND) {
						anim->flags3 &= ~ANIM_BIT3_BLOCKING;
						anim->flags3 &= ~ANIM_BIT3_BLOCKEND;
						anim->scrCur++;
					}
					break;

				/**
				 * C04: Start normal hitted effect if not MISS
				 */
				case BAS_CMD(0x04):
					if (!(anim->flags3 & ANIM_BIT3_BLOCKING)) {
						anim->flags3 |= ANIM_BIT3_BLOCKING;
						anim->flags3 |= ANIM_BIT3_BLOCKEND;
					}

					if (anim->flags3 & ANIM_BIT3_BLOCKEND) {
						anim->flags3 &= ~ANIM_BIT3_BLOCKING;
						anim->flags3 &= ~ANIM_BIT3_BLOCKEND;
						anim->scrCur++;
						anim->flags3 |= ANIM_BIT3_C02_BLOCK_END | ANIM_BIT3_C01_BLOCK_END_INBATTLE;

						anim_other = GetAnimAnotherSide(anim);
						type = GetAnimRoundTypeAnotherSide(anim_other);

						if (CheckRoundMiss(type) == true && anim_other) {
							anim_other->flags3 |= ANIM_BIT3_C02_BLOCK_END | ANIM_BIT3_C01_BLOCK_END_INBATTLE;

							if (GetAnimLayer(anim) == 0)
								StartBattleAnimHitEffectsDefault(anim_other, CheckRoundMiss(type));
						}
					}
					break;

				/**
				 * C05: efx magic
				 */
				case BAS_CMD(0x05):
					if (!(anim->flags3 & ANIM_BIT3_BLOCKING)) {
						anim->flags3 |= ANIM_BIT3_BLOCKING;
						anim->flags3 |= ANIM_BIT3_BLOCKEND;
					}

					if (anim->flags3 & ANIM_BIT3_BLOCKEND) {
						anim->flags3 &= ~ANIM_BIT3_BLOCKING;
						anim->flags3 &= ~ANIM_BIT3_BLOCKEND;
						anim->scrCur++;
						anim->flags3 |= ANIM_BIT3_C02_BLOCK_END | ANIM_BIT3_C01_BLOCK_END_INBATTLE;

						if (GetAnimLayer(anim) == 0)
							StartSpellAnimation(anim);
					}
					break;

				/**
				 * C06
				 * Attacker anim trigger opponent's next round anim.
				 * 
				 * Usually, atttacker anim is written in:
				 * C06
				 * C0D
				 * in end.
				 */
				case BAS_CMD(0x06):
					anim_other = GetAnimAnotherSide(anim);
					if (anim_other) {
						type = GetAnimNextRoundTypeAnotherSide(anim_other);
						if (type != ANIM_ROUND_INVALID)
							anim_other->flags3 |= ANIM_BIT3_NEXT_ROUND_START;
					}
					break;

				/**
				 * C08
				 * Critical hit
				 */
				case BAS_CMD(0x08):
				case BAS_CMD(0x09):
				case BAS_CMD(0x0A):
				case BAS_CMD(0x0B):
				case BAS_CMD(0x0C):
					break;

				default:
					break;
				}

				anim->cqSize--;
			}
		}

		// L_end_cmd_exec
	}
}
#endif
