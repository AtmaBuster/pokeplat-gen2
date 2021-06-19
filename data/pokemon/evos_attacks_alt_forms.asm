SECTION "Evolutions and Attacks 6", ROMX

EvosAttacksPointers6::
	dw PichuSpikyEvosAttacks
	dw DeoxysAttackEvosAttacks
	dw DeoxysDefenseEvosAttacks
	dw DeoxysSpeedEvosAttacks
	dw BurmySandEvosAttacks
	dw BurmyTrashEvosAttacks
	dw WormadamSandEvosAttacks
	dw WormadamTrashEvosAttacks
	dw ShellosEastEvosAttacks
	dw GastrodonEastEvosAttacks
	dw RotomFanEvosAttacks
	dw RotomHeatEvosAttacks
	dw RotomMowEvosAttacks
	dw RotomFridgeEvosAttacks
	dw RotomWashEvosAttacks
	dw GiratinaOriginEvosAttacks
	dw ShayminSkyEvosAttacks
	dw CastformRnEvosAttacks
	dw CastformSnEvosAttacks
	dw CastformSwEvosAttacks
	dw CherrimSEvosAttacks

PichuSpikyEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, THUNDERSHOCK
	dbw 1, CHARM
	dbw 5, TAIL_WHIP
	dbw 10, THUNDER_WAVE
	dbw 15, SWEET_KISS
	dbw 20, NASTY_PLOT
	dbw 30, THUNDERBOLT
	dbw 50, FUTURE_SIGHT
	dbw 65, LAST_RESORT
	dbw 70, DOOM_DESIRE
	db 0 ; no more level-up moves

DeoxysAttackEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, WRAP
	dbw 1, LEER
	dbw 9, NIGHT_SHADE
	dbw 17, TELEPORT
	dbw 25, TAUNT
	dbw 33, PURSUIT
	dbw 41, PSYCHIC_M
	dbw 49, SUPERPOWER
	dbw 57, PSYCHO_SHIFT
	dbw 65, ZEN_HEADBUTT
	dbw 73, COSMIC_POWER
	dbw 81, ZAP_CANNON
	dbw 89, PSYCHO_BOOST
	dbw 97, HYPER_BEAM
	db 0 ; no more level-up moves

DeoxysDefenseEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, WRAP
	dbw 1, LEER
	dbw 9, NIGHT_SHADE
	dbw 17, TELEPORT
	dbw 25, KNOCK_OFF
	dbw 33, SPIKES
	dbw 41, PSYCHIC_M
	dbw 49, SNATCH
	dbw 57, PSYCHO_SHIFT
	dbw 65, ZEN_HEADBUTT
	dbw 73, IRON_DEFENSE
	dbw 73, AMNESIA
	dbw 81, RECOVER
	dbw 89, PSYCHO_BOOST
	dbw 97, COUNTER
	dbw 97, MIRROR_COAT
	db 0 ; no more level-up moves

DeoxysSpeedEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, WRAP
	dbw 1, LEER
	dbw 9, NIGHT_SHADE
	dbw 17, DOUBLE_TEAM
	dbw 25, KNOCK_OFF
	dbw 33, PURSUIT
	dbw 41, PSYCHIC_M
	dbw 49, SWIFT
	dbw 57, PSYCHO_SHIFT
	dbw 65, ZEN_HEADBUTT
	dbw 73, AGILITY
	dbw 81, RECOVER
	dbw 89, PSYCHO_BOOST
	dbw 97, EXTREMESPEED
	db 0 ; no more level-up moves

BurmySandEvosAttacks:
	dbbw EVOLVE_LEVEL_AND_FEMALE, 20, WORMADAM_S
	dbbw EVOLVE_LEVEL_AND_MALE, 20, MOTHIM
	db 0 ; no more evolutions
	dbw 1, PROTECT
	dbw 10, TACKLE
	dbw 15, BUG_BITE
	dbw 20, HIDDEN_POWER
	db 0 ; no more level-up moves

BurmyTrashEvosAttacks:
	dbbw EVOLVE_LEVEL_AND_FEMALE, 20, WORMADAM_T
	dbbw EVOLVE_LEVEL_AND_MALE, 20, MOTHIM
	db 0 ; no more evolutions
	dbw 1, PROTECT
	dbw 10, TACKLE
	dbw 15, BUG_BITE
	dbw 20, HIDDEN_POWER
	db 0 ; no more level-up moves

WormadamSandEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 10, PROTECT
	dbw 15, BUG_BITE
	dbw 20, HIDDEN_POWER
	dbw 23, CONFUSION
	dbw 26, ROCK_BLAST
	dbw 29, HARDEN
	dbw 32, PSYBEAM
	dbw 35, CAPTIVATE
	dbw 38, FLAIL
	dbw 41, ATTRACT
	dbw 44, PSYCHIC_M
	dbw 47, FISSURE
	db 0 ; no more level-up moves

WormadamTrashEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 10, PROTECT
	dbw 15, BUG_BITE
	dbw 20, HIDDEN_POWER
	dbw 23, CONFUSION
	dbw 26, MIRROR_SHOT
	dbw 29, METAL_SOUND
	dbw 32, PSYBEAM
	dbw 35, CAPTIVATE
	dbw 38, FLAIL
	dbw 41, ATTRACT
	dbw 44, PSYCHIC_M
	dbw 47, IRON_HEAD
	db 0 ; no more level-up moves

ShellosEastEvosAttacks:
	dbbw EVOLVE_LEVEL, 30, GASTRODON_E
	db 0 ; no more evolutions
	dbw 1, MUD_SLAP
	dbw 2, MUD_SPORT
	dbw 4, HARDEN
	dbw 7, WATER_PULSE
	dbw 11, MUD_BOMB
	dbw 16, HIDDEN_POWER
	dbw 22, RAIN_DANCE
	dbw 29, BODY_SLAM
	dbw 37, MUDDY_WATER
	dbw 46, RECOVER
	db 0 ; no more level-up moves

GastrodonEastEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, HARDEN
	dbw 1, MUD_SLAP
	dbw 1, MUD_SPORT
	dbw 1, WATER_PULSE
	dbw 2, MUD_SPORT
	dbw 4, HARDEN
	dbw 7, WATER_PULSE
	dbw 11, MUD_BOMB
	dbw 16, HIDDEN_POWER
	dbw 22, RAIN_DANCE
	dbw 29, BODY_SLAM
	dbw 41, MUDDY_WATER
	dbw 54, RECOVER
	db 0 ; no more level-up moves

RotomFanEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, THUNDERSHOCK
	dbw 1, THUNDER_WAVE
	dbw 1, CONFUSE_RAY
	dbw 1, TRICK
	dbw 1, ASTONISH
	dbw 8, UPROAR
	dbw 15, DOUBLE_TEAM
	dbw 22, SHOCK_WAVE
	dbw 29, OMINOUS_WIND
	dbw 36, SUBSTITUTE
	dbw 43, CHARGE
	dbw 50, DISCHARGE
	db 0 ; no more level-up moves

RotomHeatEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, THUNDERSHOCK
	dbw 1, THUNDER_WAVE
	dbw 1, CONFUSE_RAY
	dbw 1, TRICK
	dbw 1, ASTONISH
	dbw 8, UPROAR
	dbw 15, DOUBLE_TEAM
	dbw 22, SHOCK_WAVE
	dbw 29, OMINOUS_WIND
	dbw 36, SUBSTITUTE
	dbw 43, CHARGE
	dbw 50, DISCHARGE
	db 0 ; no more level-up moves

RotomMowEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, THUNDERSHOCK
	dbw 1, THUNDER_WAVE
	dbw 1, CONFUSE_RAY
	dbw 1, TRICK
	dbw 1, ASTONISH
	dbw 8, UPROAR
	dbw 15, DOUBLE_TEAM
	dbw 22, SHOCK_WAVE
	dbw 29, OMINOUS_WIND
	dbw 36, SUBSTITUTE
	dbw 43, CHARGE
	dbw 50, DISCHARGE
	db 0 ; no more level-up moves

RotomFridgeEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, THUNDERSHOCK
	dbw 1, THUNDER_WAVE
	dbw 1, CONFUSE_RAY
	dbw 1, TRICK
	dbw 1, ASTONISH
	dbw 8, UPROAR
	dbw 15, DOUBLE_TEAM
	dbw 22, SHOCK_WAVE
	dbw 29, OMINOUS_WIND
	dbw 36, SUBSTITUTE
	dbw 43, CHARGE
	dbw 50, DISCHARGE
	db 0 ; no more level-up moves

RotomWashEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, THUNDERSHOCK
	dbw 1, THUNDER_WAVE
	dbw 1, CONFUSE_RAY
	dbw 1, TRICK
	dbw 1, ASTONISH
	dbw 8, UPROAR
	dbw 15, DOUBLE_TEAM
	dbw 22, SHOCK_WAVE
	dbw 29, OMINOUS_WIND
	dbw 36, SUBSTITUTE
	dbw 43, CHARGE
	dbw 50, DISCHARGE
	db 0 ; no more level-up moves

GiratinaOriginEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, SCARY_FACE
	dbw 1, DRAGONBREATH
	dbw 10, OMINOUS_WIND
	dbw 20, ANCIENTPOWER
	dbw 30, DRAGON_CLAW
	dbw 40, SHADOW_FORCE
	dbw 50, HEAL_BLOCK
	dbw 60, EARTH_POWER
	dbw 70, SLASH
	dbw 80, SHADOW_CLAW
	dbw 90, AURA_SPHERE
	db 0 ; no more level-up moves

ShayminSkyEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, GROWTH
	dbw 10, MAGICAL_LEAF
	dbw 19, LEECH_SEED
	dbw 28, QUICK_ATTACK
	dbw 37, SWEET_SCENT
	dbw 46, NATURAL_GIFT
	dbw 55, WORRY_SEED
	dbw 64, AIR_SLASH
	dbw 73, ENERGY_BALL
	dbw 82, SWEET_KISS
	dbw 91, LEAF_STORM
	dbw 100, SEED_FLARE
	db 0 ; no more level-up moves

CastformRnEvosAttacks:
CastformSnEvosAttacks:
CastformSwEvosAttacks:
CherrimSEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, POUND
	db 0 ; no more level-up moves
