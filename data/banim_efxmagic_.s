	.include "animscr.inc"
	.section .data

	.global gEkrSpellAnimLut
gEkrSpellAnimLut: @ 0x005D0DA0
	.4byte NewEfxDummyMagic
	.4byte NewEfxTeono
	.4byte NewEfxArrow
	.4byte StartSpellAnimJavelin
	.4byte StartSpellAnimJavelinCavalier
	.4byte StartSpellAnimJavelinSoldier
	.4byte StartSpellAnimJavelinPaladin
	.4byte StartSpellAnimJavelinPrgasusKnight
	.4byte StartSpellAnimJavelinFalcon
	.4byte StartSpellAnimJavelinWyvernRider
	.4byte StartSpellAnimJavelinWyvernLord
	.4byte StartSpellAnimJavelinGenerial
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte StartSpellAnimSong
	.4byte StartSpellAnimDance
	.4byte StartSpellAnimBallista
	.4byte StartSpellAnimEckesachs
	.4byte StartSpellAnimBindingBlade
	.4byte StartSpellAnimFireBreath
	.4byte StartSpellAnimIceBreath
	.4byte StartSpellAnimDarkBreath
	.4byte StartSpellAnimFire
	.4byte StartSpellAnimElfire
	.4byte StartSpellAnimForblaze
	.4byte StartSpellAnimThunder
	.4byte StartSpellAnimBolting
	.4byte StartSpellAnimFimbulvetr
	.4byte StartSpellAnimAircalibur
	.4byte StartSpellAnimFlux
	.4byte StartSpellAnimNosferatu
	.4byte StartSpellAnimLightning
	.4byte StartSpellAnimPurge
	.4byte StartSpellAnimAureola
	.4byte StartSpellAnimDivine
	.4byte StartSpellAnimApocalypse
	.4byte StartSpellAnimEclipse
	.4byte StartSpellAnimFenrir
	.4byte StartSpellAnimHeal
	.4byte StartSpellAnimMend
	.4byte StartSpellAnimRecover
	.4byte StartSpellAnimPhysic
	.4byte StartSpellAnimFortify
	.4byte StartSpellAnimLatona
	.4byte StartSpellAnimRestore
	.4byte StartSpellAnimSilence
	.4byte StartSpellAnimSleep
	.4byte StartSpellAnimHammerne
	.4byte StartSpellAnimBerserk
	.4byte StartSpellAnimBarrier
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000

AnimSprite_ManaketeFlame:
    ANIM_SPRITE_END

	.global AnimScr_ManaketeFlame
AnimScr_ManaketeFlame: @ 085D0E8C
    ANIMSCR_FORCE_SPRITE AnimSprite_ManaketeFlame, 1
    ANIMSCR_BLOCKED
