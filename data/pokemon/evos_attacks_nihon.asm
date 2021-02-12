SECTION "Evolutions and Attacks 3", ROMX

EvosAttacksPointers3::
	dw FlambearEvosAttacks
	dw VolbearEvosAttacks
	dw DynabearEvosAttacks
	dw CruizeEvosAttacks
	dw AqualloEvosAttacks
	dw AquariusEvosAttacks
	dw KotoraEvosAttacks
	dw RaitoraEvosAttacks
	dw BomshealEvosAttacks
	dw CorasunEvosAttacks
	dw CoramolaEvosAttacks
	dw MambokingEvosAttacks
	dw BiteelEvosAttacks
	dw GrotessEvosAttacks
	dw RinringEvosAttacks
	dw BellrunEvosAttacks
	dw BlottleEvosAttacks
	dw PendrakenEvosAttacks
	dw KurstrawEvosAttacks
	dw PangshiEvosAttacks
	dw WolfanEvosAttacks
	dw WarwolfEvosAttacks
	dw CheepEvosAttacks
	dw JabettaEvosAttacks
	dw SnobitEvosAttacks
	dw BlizbitEvosAttacks
	dw GlacihareEvosAttacks
	dw StemineelEvosAttacks
	dw ArskeedEvosAttacks
	dw DrakarveEvosAttacks
	dw PeticornEvosAttacks
	dw GupgoldEvosAttacks
	dw TritalesEvosAttacks
	dw GrimbyEvosAttacks
	dw ParamiteEvosAttacks
	dw NyanyaEvosAttacks
	dw PuddipupEvosAttacks
	dw ChixEvosAttacks
	dw KatuEvosAttacks
	dw TangtripEvosAttacks
	dw GelaniaEvosAttacks
	dw BelmittEvosAttacks
	
FlambearEvosAttacks:
	dbbw EVOLVE_LEVEL, 14, VOLBEAR
	db 0 ; no more evolutions
	dbw 1, SCRATCH
	dbw 1, LEER
	dbw 6, SAND_ATTACK
	dbw 11, EMBER
	dbw 15, BITE
	dbw 20, FLAME_WHEEL
	dbw 25, SCARY_FACE
	dbw 29, FURY_SWIPES
	dbw 34, REST
	dbw 39, SLASH
	dbw 43, FLAMETHROWER
	db 0 ; no more level-up moves

VolbearEvosAttacks:
	dbbw EVOLVE_LEVEL, 36, DYNABEAR
	db 0 ; no more evolutions
	dbw 1, SCRATCH
	dbw 1, LEER
	dbw 1, SAND_ATTACK
	dbw 1, EMBER
	dbw 6, SAND_ATTACK
	dbw 11, EMBER
	dbw 17, BITE
	dbw 22, FLAME_WHEEL
	dbw 28, SCARY_FACE
	dbw 33, FURY_SWIPES
	dbw 39, REST
	dbw 44, SLASH
	dbw 50, FLAMETHROWER
	db 0 ; no more level-up moves

DynabearEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, SCRATCH
	dbw 1, LEER
	dbw 1, SAND_ATTACK
	dbw 1, EMBER
	dbw 6, SAND_ATTACK
	dbw 11, EMBER
	dbw 17, BITE
	dbw 22, FLAME_WHEEL
	dbw 28, SCARY_FACE
	dbw 33, FURY_SWIPES
	dbw 36, CRUNCH
	dbw 43, REST
	dbw 51, SLASH
	dbw 58, FLAMETHROWER
	db 0 ; no more level-up moves

CruizeEvosAttacks:
	dbbw EVOLVE_LEVEL, 18, AQUALLO
	db 0 ; no more evolutions
	dbw 1, POUND
	dbw 1, GROWL
	dbw 7, MIST
	dbw 10, WATER_GUN
	dbw 13, POWDER_SNOW
	dbw 19, SWIFT
	dbw 22, BUBBLEBEAM
	dbw 25, AURORA_BEAM
	dbw 31, SAFEGUARD
	dbw 34, HAZE
	dbw 37, BODY_SLAM
	dbw 43, ICE_BEAM
	dbw 50, HYDRO_PUMP
	db 0 ; no more level-up moves

AqualloEvosAttacks:
	dbbw EVOLVE_LEVEL, 32, AQUARIUS
	db 0 ; no more evolutions
	dbw 1, POUND
	dbw 1, GROWL
	dbw 1, BUBBLE
	dbw 1, MIST
	dbw 7, WATER_GUN
	dbw 10, WATER_GUN
	dbw 13, POWDER_SNOW
	dbw 20, SWIFT
	dbw 24, BUBBLEBEAM
	dbw 28, AURORA_BEAM
	dbw 35, SAFEGUARD
	dbw 39, HAZE
	dbw 43, BODY_SLAM
	dbw 49, ICE_BEAM
	dbw 56, HYDRO_PUMP
	db 0 ; no more level-up moves

AquariusEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, POUND
	dbw 1, GROWL
	dbw 1, BUBBLE
	dbw 1, MIST
	dbw 7, WATER_GUN
	dbw 10, WATER_GUN
	dbw 13, POWDER_SNOW
	dbw 20, SWIFT
	dbw 24, BUBBLEBEAM
	dbw 28, AURORA_BEAM
	dbw 36, SAFEGUARD
	dbw 41, HAZE
	dbw 46, BODY_SLAM
	dbw 52, ICE_BEAM
	dbw 60, HYDRO_PUMP
	db 0 ; no more level-up moves

KotoraEvosAttacks:
	dbbw EVOLVE_LEVEL, 31, RAITORA
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, TAIL_WHIP
	dbw 6, THUNDERSHOCK
	dbw 10, BITE
	dbw 15, THUNDER_WAVE
	dbw 19, SCARY_FACE
	dbw 24, SPARK
	dbw 28, TAKE_DOWN
	dbw 33, SLASH
	dbw 37, CRUNCH
	dbw 42, THUNDERBOLT
	dbw 46, AGILITY
	db 0 ; no more level-up moves

RaitoraEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, TAIL_WHIP
	dbw 6, THUNDERSHOCK
	dbw 10, BITE
	dbw 15, THUNDER_WAVE
	dbw 19, SCARY_FACE
	dbw 24, SPARK
	dbw 28, TAKE_DOWN
	dbw 35, SLASH
	dbw 42, CRUNCH
	dbw 49, THUNDERBOLT
	dbw 56, AGILITY
	db 0 ; no more level-up moves
	
BomshealEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, TAIL_WHIP
	dbw 1, SMOG
	dbw 7, EMBER
	dbw 12, WATER_GUN
	dbw 18, ENCORE
	dbw 23, SUPERSONIC
	dbw 29, FLAME_WHEEL
	dbw 34, BUBBLEBEAM
	dbw 40, MIMIC
	dbw 45, BODY_SLAM
	dbw 51, FIRE_BLAST
	dbw 56, HYDRO_PUMP
	db 0 ; no more level-up moves

CorasunEvosAttacks:
	dbbw EVOLVE_LEVEL, 28, CORAMOLA
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, GROWL
	dbw 1, BUBBLE
	dbw 6, DEFENSE_CURL
	dbw 10, RAGE
	dbw 15, SUPERSONIC
	dbw 19, BUBBLEBEAM
	dbw 24, SCREECH
	dbw 28, SLAM
	dbw 33, ACID_ARMOR
	dbw 37, CONFUSE_RAY
	dbw 42, DOUBLE_EDGE
	dbw 46, HYDRO_PUMP
	db 0 ; no more level-up moves
	
CoramolaEvosAttacks:
	dbbw EVOLVE_LEVEL, 39, MAMBOKING
	db 0 ; no more evolutions
	db 0 ; no more level-up moves

MambokingEvosAttacks:
	db 0 ; no more evolutions
	db 0 ; no more level-up moves
	
BiteelEvosAttacks:
	dbbw EVOLVE_LEVEL, 28, GROTESS
	dbw 1, TACKLE
	dbw 1, GROWL
	db 0 ; no more level-up moves
	
GrotessEvosAttacks: ;Change moveset to reflect line
	db 0 ; no more evolutions
	dbw 1, TACKLE 
	dbw 1, GROWL
	dbw 1, BUBBLE
	dbw 6, DEFENSE_CURL
	dbw 10, RAGE
	dbw 15, SUPERSONIC
	dbw 19, BUBBLEBEAM
	dbw 24, SCREECH
	dbw 28, IRON_TAIL
	dbw 34, ACID_ARMOR
	dbw 39, SCARY_FACE
	dbw 46, CRUNCH
	dbw 52, HYDRO_PUMP
	db 0 ; no more level-up moves
	
RinringEvosAttacks:
	dbbw EVOLVE_LEVEL, 28, BELLRUN
	db 0 ; no more evolutions
	dbw 1, SCRATCH
	dbw 1, GROWL
	dbw 7, PURSUIT
	dbw 12, DISABLE
	dbw 18, PAY_DAY
	dbw 23, FURY_SWIPES
	dbw 29, FAINT_ATTACK
	dbw 34, CONFUSE_RAY
	dbw 40, SLASH
	dbw 45, ATTRACT
	db 0 ; no more level-up moves

BellrunEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, SCRATCH
	dbw 1, GROWL
	dbw 7, PURSUIT
	dbw 12, DISABLE
	dbw 18, PAY_DAY
	dbw 23, FURY_SWIPES
	dbw 31, FAINT_ATTACK
	dbw 39, CONFUSE_RAY
	dbw 47, SLASH
	dbw 56, ATTRACT
	db 0 ; no more level-up moves
	

BlottleEvosAttacks:
	dbbw EVOLVE_LEVEL, 32, PENDRAKEN
	dbw 1, BUBBLE
	dbw 1, SMOKESCREEN
	dbw 6, HARDEN
	dbw 13, CONSTRICT
	dbw 20, BUBBLEBEAM
	dbw 27, BARRIER
	dbw 34, SCREECH
	dbw 41, WRAP
	dbw 48, HYDRO_PUMP
	db 0 ; no more level-up moves

PendrakenEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, BUBBLE
	dbw 1, SMOKESCREEN
	dbw 1, HARDEN
	dbw 13, CONSTRICT
	dbw 20, BUBBLEBEAM
	dbw 27, BARRIER
	dbw 36, SCREECH
	dbw 43, WRAP
	dbw 50, HYDRO_PUMP
	db 0 ; no more level-up moves

KurstrawEvosAttacks:
	dbbw EVOLVE_LEVEL, 29, PANGSHI
	db 0 ; no more evolutions
	dbw 1, GROWL
	dbw 1, TACKLE
	dbw 1, PSYWAVE
	dbw 6, SPITE
	dbw 10, FAINT_ATTACK
	dbw 15, CURSE
	dbw 19, MEAN_LOOK
	dbw 24, PSYBEAM
	dbw 28, CONFUSE_RAY
	dbw 33, NIGHT_SHADE
	dbw 37, BODY_SLAM
	dbw 32, PAIN_SPLIT
	dbw 46, SHADOW_BALL
	dbw 51, PERISH_SONG
	db 0 ; no more level-up moves

PangshiEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, GROWL
	dbw 1, TACKLE
	dbw 1, PSYWAVE
	dbw 6, SPITE
	dbw 10, FAINT_ATTACK
	dbw 15, CURSE
	dbw 19, MEAN_LOOK
	dbw 24, PSYBEAM
	dbw 28, CONFUSE_RAY
	dbw 29, CRUNCH
	dbw 35, NIGHT_SHADE
	dbw 42, BODY_SLAM
	dbw 48, PAIN_SPLIT
	dbw 55, SHADOW_BALL
	dbw 61, PERISH_SONG
	db 0 ; no more level-up moves
	
WolfanEvosAttacks:
	dbbw EVOLVE_LEVEL, 31, WARWOLF
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, LEER
	dbw 7, POWDER_SNOW
	dbw 12, FURY_SWIPES
	dbw 18, SAFEGUARD
	dbw 23, LOW_KICK
	dbw 29, ICY_WIND
	dbw 34, SLASH
	dbw 40, SCREECH
	dbw 45, CONFUSE_RAY
	dbw 51, BLIZZARD
	db 0 ; no more level-up moves

WarwolfEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, LEER
	dbw 7, POWDER_SNOW
	dbw 12, FURY_SWIPES
	dbw 18, SAFEGUARD
	dbw 23, LOW_KICK
	dbw 29, ICY_WIND
	dbw 31, ICE_PUNCH
	dbw 35, SLASH
	dbw 41, SCREECH
	dbw 49, CONFUSE_RAY
	dbw 56, BLIZZARD
	db 0 ; no more level-up moves
	
CheepEvosAttacks:
	dbbw EVOLVE_LEVEL, 28, JABETTA
	db 0 ; no more evolutions
	dbw 1, POUND
	dbw 1, GROWL
	dbw 14, BUBBLE
	dbw 17, SING
	dbw 22, DOUBLESLAP
	db 0 ; no more level-up moves

JabettaEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, POUND
	dbw 1, GROWL
	dbw 1, BUBBLE
	dbw 28, DIZZY_PUNCH
	dbw 30, MACH_PUNCH
	dbw 34, HYDRO_PUMP
	dbw 40, SCREECH
	dbw 48, HI_JUMP_KICK
	db 0 ; no more level-up moves

SnobitEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, TACKLE
	db 0 ; no more level-up moves
	
BlizbitEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, TACKLE
	db 0 ; no more level-up moves
	
GlacihareEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, TACKLE
	db 0 ; no more level-up moves
	
StemineelEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, TACKLE
	db 0 ; no more level-up moves
	
ArskeedEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, TACKLE
	db 0 ; no more level-up moves
	
DrakarveEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, TACKLE
	db 0 ; no more level-up moves
	
PeticornEvosAttacks:
	dbbw EVOLVE_HAPPINESS, TR_ANYTIME, PONYTA
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, CHARM
	dbw 6, TAIL_WHIP
	dbw 10, EMBER
	dbw 15, FLAME_WHEEL
	dbw 19, HEADBUTT
	dbw 25, FIRE_SPIN
	dbw 31, TAKE_DOWN
	dbw 36, AGILITY
	dbw 42, FIRE_BLAST
	db 0 ; no more level-up moves

GupgoldEvosAttacks:
	dbbw EVOLVE_LEVEL, 18, GOLDEEN
	db 0 ; no more evolutions
	dbw 1, PECK
	dbw 1, TAIL_WHIP
	dbw 8, SUPERSONIC
	dbw 12, HORN_ATTACK
	dbw 20, TACKLE
	dbw 25, FURY_ATTACK
	dbw 32, WATERFALL
	dbw 36, HORN_DRILL
	dbw 41, AGILITY
	db 0 ; no more level-up moves

TritalesEvosAttacks:
	dbbw EVOLVE_HAPPINESS, TR_ANYTIME, VULPIX
	db 0 ; no more evolutions
	dbw 1, EMBER
	dbw 1, TAIL_WHIP
	dbw 1, CHARM
	dbw 7, DISABLE
	dbw 11, QUICK_ATTACK
	dbw 14, CONFUSE_RAY
	dbw 20, FIRE_SPIN
	dbw 24, SPITE
	dbw 27, FAINT_ATTACK
	dbw 33, FLAMETHROWER
	dbw 37, SAFEGUARD
	dbw 40, FIRE_BLAST
	db 0 ; no more level-up moves
	
GrimbyEvosAttacks:
	dbbw EVOLVE_LEVEL, 20, GRIMER
	db 0 ; no more evolutions
	dbw 1, POISON_GAS
	dbw 1, POUND
	dbw 7, HARDEN
	dbw 11, MUD_SLAP
	dbw 15, DISABLE
	dbw 21, SLUDGE
	dbw 25, MINIMIZE
	dbw 30, SCREECH
	dbw 36, ACID_ARMOR
	dbw 40, SLUDGE_BOMB
	dbw 45, TOXIC
	db 0 ; no more level-up moves

ParamiteEvosAttacks:
	dbbw EVOLVE_LEVEL, 14, PARAS
	db 0 ; no more evolutions
	dbw 1, SCRATCH
	dbw 6, STUN_SPORE
	dbw 6, POISONPOWDER
	dbw 11, ABSORB
	dbw 13, LEECH_LIFE
	dbw 17, FURY_CUTTER
	dbw 22, SPORE
	dbw 27, SLASH
	dbw 33, GROWTH
	dbw 38, GIGA_DRAIN
	db 0 ; no more level-up moves

NyanyaEvosAttacks:
	dbbw EVOLVE_LEVEL, 15, MEOWTH
	db 0 ; no more evolutions
	dbw 1, SCRATCH
	dbw 1, GROWL
	dbw 7, BITE
	dbw 13, PAY_DAY
	dbw 19, FURY_SWIPES
	dbw 25, FAINT_ATTACK
	dbw 37, SCREECH
	dbw 43, SLASH
	db 0 ; no more level-up moves
	
PuddipupEvosAttacks:
	dbbw EVOLVE_HAPPINESS, TR_ANYTIME, GROWLITHE
	db 0 ; no more evolutions
	dbw 1, BITE
	dbw 1, CHARM
	dbw 6, EMBER
	dbw 12, LEER
	dbw 17, FLAME_WHEEL
	dbw 23, REVERSAL
	dbw 28, TAKE_DOWN
	dbw 34, FLAMETHROWER
	dbw 39, AGILITY
	dbw 45, CRUNCH
	dbw 50, OUTRAGE
	dbw 56, FIRE_BLAST
	db 0 ; no more level-up moves

ChixEvosAttacks:
	dbbw EVOLVE_LEVEL, 18, DODUO
	db 0 ; no more evolutions
	dbw 1, PECK
	dbw 1, CHARM
	dbw 5, QUICK_ATTACK
	dbw 10, RAGE
	dbw 14, FURY_ATTACK
	dbw 19, PURSUIT
	dbw 25, AGILITY
	dbw 31, SWORDS_DANCE
	dbw 36, DRILL_PECK
	dbw 42, JUMP_KICK
	dbw 47, THRASH
	db 0 ; no more level-up moves
	
KatuEvosAttacks:
	dbbw EVOLVE_LEVEL, 25, XATU
	db 0 ; no more evolutions
	dbw 1, PECK
	dbw 1, LEER
	dbw 1, NIGHT_SHADE
	dbw 10, NIGHT_SHADE
	dbw 15, TELEPORT
	dbw 25, FUTURE_SIGHT
	dbw 45, CONFUSE_RAY
	dbw 55, PSYCHIC_M
	db 0 ; no more level-up moves
	
TangtripEvosAttacks:
	dbbw EVOLVE_LEVEL, 15, TANGELA
	db 0 ; no more evolutions
	dbw 1, ABSORB
	dbw 1, CONSTRICT
	dbw 4, STUN_SPORE
	dbw 7, GROWTH
	dbw 10, MEGA_DRAIN
	dbw 13, BIND
	dbw 19, VINE_WHIP
	dbw 25, POISONPOWDER
	dbw 31, GIGA_DRAIN
	dbw 34, SLEEP_POWDER
	dbw 40, ANCIENTPOWER
	dbw 46, SLAM
	db 0 ; no more level-up moves

GelaniaEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, ABSORB
	dbw 1, CONSTRICT
	dbw 4, STUN_SPORE
	dbw 7, GROWTH
	dbw 10, MEGA_DRAIN
	dbw 13, BIND
	dbw 19, VINE_WHIP
	dbw 25, POISONPOWDER
	dbw 31, GIGA_DRAIN
	dbw 34, SLEEP_POWDER
	dbw 40, ANCIENTPOWER
	dbw 50, SLAM
	db 0 ; no more level-up moves
	
BelmittEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, VINE_WHIP
	dbw 1, SLEEP_POWDER
	dbw 1, SWEET_SCENT
	dbw 1, RAZOR_LEAF
	dbw 55, GIGA_DRAIN
	db 0 ; no more level-up moves
