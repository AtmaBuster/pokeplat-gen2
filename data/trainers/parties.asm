; Trainer data structure:
; - db "NAME@", TRAINERTYPE_* constant
; - 1 to 6 Pokémon:
;    * for TRAINERTYPE_NORMAL:     db level, species
;    * for TRAINERTYPE_MOVES:      db level, species, 4 moves
;    * for TRAINERTYPE_ITEM:       db level, species, item
;    * for TRAINERTYPE_ITEM_MOVES: db level, species, item, 4 moves
; - db -1 ; end

trainermon_normal: MACRO
	db \1
	dw \2
ENDM
trainermon_moves: MACRO
	trainermon_normal \1, \2
	dw \3
IF _NARG > 3
	dw \4
ELSE
	dw NO_MOVE
ENDC
IF _NARG > 4
	dw \5
ELSE
	dw NO_MOVE
ENDC
IF _NARG > 5
	dw \6
ELSE
	dw NO_MOVE
ENDC
ENDM
trainermon_item: MACRO
	trainermon_normal \1, \2
	db \3
ENDM
trainermon_full: MACRO
	trainermon_item \1, \2, \3
	dw \4
IF _NARG > 4
	dw \5
ELSE
	dw NO_MOVE
ENDC
IF _NARG > 5
	dw \6
ELSE
	dw NO_MOVE
ENDC
IF _NARG > 6
	dw \7
ELSE
	dw NO_MOVE
ENDC
ENDM

SECTION "Enemy Trainer Parties 1", ROMX

RoarkGroup:
	next_list_item ; ROARK (1)
	db "ROARK@", TRAINERTYPE_MOVES
	trainermon_moves 12, GEODUDE,  ROCK_THROW, STEALTH_ROCK
	trainermon_moves 12, ONIX,     ROCK_THROW, SCREECH,     STEALTH_ROCK
	trainermon_moves 14, CRANIDOS, HEADBUTT,   PURSUIT,     LEER
	db -1 ; end

	next_list_item ; ROARK (2)
	db "ROARK@", TRAINERTYPE_ITEM_MOVES
	trainermon_full 62, AERODACTYL, NO_ITEM,    STONE_EDGE, EARTHQUAKE,  DRAGON_CLAW,  AERIAL_ACE
	trainermon_full 61, PROBOPASS,  NO_ITEM,    STONE_EDGE, EARTH_POWER, DISCHARGE,    STEALTH_ROCK
	trainermon_full 61, GOLEM,      NO_ITEM,    STONE_EDGE, EARTHQUAKE,  BRICK_BREAK,  FLAMETHROWER
	trainermon_full 63, RAMPARDOS,  NO_ITEM,    HEAD_SMASH, EARTHQUAKE,  ZEN_HEADBUTT, AVALANCHE
	trainermon_full 65, TYRANITAR,  GOLD_BERRY, STONE_EDGE, CRUNCH,      FIRE_FANG,    AERIAL_ACE
	db -1 ; end
	end_list_items

GardeniaGroup:
	next_list_item ; GARDENIA (1)
	db "GARDENIA@", TRAINERTYPE_ITEM_MOVES
	trainermon_full 20, TURTWIG,  NO_ITEM,    GRASS_KNOT, RAZOR_LEAF,   SUNNY_DAY,    REFLECT
	trainermon_full 20, CHERRIM,  NO_ITEM,    GRASS_KNOT, MAGICAL_LEAF, LEECH_SEED,   SAFEGUARD
	trainermon_full 22, ROSERADE, GOLD_BERRY, GRASS_KNOT, MAGICAL_LEAF, POISON_STING, STUN_SPORE
	db -1 ; end

	next_list_item ; GARDENIA (2)
	db "GARDENIA@", TRAINERTYPE_ITEM_MOVES
	trainermon_full 61, JUMPLUFF,  NO_ITEM,    SUNNY_DAY,   TOXIC,       SILVER_WIND, BOUNCE
	trainermon_full 62, CHERRIM,   NO_ITEM,    TOXIC,       LEECH_SEED,  SUNNY_DAY,   SOLARBEAM
	trainermon_full 61, BELLOSSOM, NO_ITEM,    SUNNY_DAY,   INGRAIN,     GIGA_DRAIN,  DRAIN_PUNCH
	trainermon_full 63, TORTERRA,  NO_ITEM,    WOOD_HAMMER, EARTHQUAKE,  STONE_EDGE,  CRUNCH
	trainermon_full 65, ROSERADE,  GOLD_BERRY, SLUDGE_BOMB, SHADOW_BALL, HYPER_BEAM,  LEAF_STORM
	db -1 ; end
	end_list_items

MayleneGroup:
	next_list_item ; MAYLENE (1)
	db "MAYLENE@", TRAINERTYPE_MOVES
	trainermon_moves 28, MEDITITE, DRAIN_PUNCH, CONFUSION,  FAKE_OUT,     ROCK_TOMB
	trainermon_moves 29, MACHOKE,  KARATE_CHOP, STRENGTH,   FOCUS_ENERGY, ROCK_TOMB
	trainermon_moves 32, LUCARIO,  DRAIN_PUNCH, METAL_CLAW, BONE_RUSH,    FORCE_PALM
	db -1 ; end

	next_list_item ; MAYLENE (2)
	db "MAYLENE@", TRAINERTYPE_MOVES
	trainermon_moves 62, HITMONTOP, FAKE_OUT,     TRIPLE_KICK,  AERIAL_ACE,  QUICK_ATTACK
	trainermon_moves 63, MEDICHAM,  HI_JUMP_KICK, THUNDERPUNCH, ICE_PUNCH,   FIRE_PUNCH
	trainermon_moves 62, BRELOOM,   SPORE,        MACH_PUNCH,   SEED_BOMB,   STONE_EDGE
	trainermon_moves 64, MACHAMP,   CROSS_CHOP,   ROCK_CLIMB,   STONE_EDGE,  EARTHQUAKE
	trainermon_moves 66, LUCARIO,   CLOSE_COMBAT, EXTREMESPEED, DRAIN_PUNCH, BONE_RUSH
	db -1 ; end
	end_list_items

CrasherWakeGroup:
	next_list_item ; WAKE (1)
	db "WAKE@", TRAINERTYPE_ITEM_MOVES
	trainermon_full 33, GYARADOS, NO_ITEM,    BRINE,       WATERFALL, BITE,      TWISTER
	trainermon_full 34, QUAGSIRE, NO_ITEM,    WATER_PULSE, MUD_SHOT,  ROCK_TOMB, YAWN
	trainermon_full 37, FLOATZEL, GOLD_BERRY, BRINE,       CRUNCH,    ICE_FANG,  AQUA_JET
	db -1 ; end

	next_list_item ; WAKE (2)
	db "WAKE@", TRAINERTYPE_ITEM_MOVES
	trainermon_full 61, SHARPEDO, NO_ITEM,    NIGHT_SLASH, SLASH,       AQUA_JET,   ENDURE
	trainermon_full 61, QUAGSIRE, NO_ITEM,    SURF,        EARTHQUAKE,  STONE_EDGE, YAWN
	trainermon_full 63, FLOATZEL, NO_ITEM,    BRINE,       CRUNCH,      ICE_FANG,   AQUA_JET
	trainermon_full 62, GYARADOS, NO_ITEM,    BITE,        AVALANCHE,   AQUA_TAIL,  GIGA_IMPACT
	trainermon_full 65, LUDICOLO, GOLD_BERRY, SURF,        ENERGY_BALL, ICE_BEAM,   FOCUS_BLAST
	db -1 ; end
	end_list_items

FantinaGroup:
	next_list_item ; FANTINA (1)
	db "FANTINA@", TRAINERTYPE_ITEM_MOVES
	trainermon_full 24, DUSKULL,   NO_ITEM,    WILL_O_WISP, FUTURE_SIGHT, SHADOW_SNEAK, PURSUIT
	trainermon_full 24, HAUNTER,   NO_ITEM,    SHADOW_CLAW, SUCKER_PUNCH, CONFUSE_RAY,  HYPNOSIS
	trainermon_full 26, MISMAGIUS, GOLD_BERRY, SHADOW_BALL, PSYBEAM,      MAGICAL_LEAF, CONFUSE_RAY
	db -1 ; end

	next_list_item ; FANTINA (2)
	db "FANTINA@", TRAINERTYPE_ITEM_MOVES
	trainermon_full 61, BANETTE,   NO_ITEM,    SHADOW_CLAW,  FAINT_ATTACK, THUNDERBOLT,  WILL_O_WISP
	trainermon_full 63, MISMAGIUS, NO_ITEM,    SHADOW_BALL,  THUNDERBOLT,  PSYCHIC_M,    MAGICAL_LEAF
	trainermon_full 61, DRIFBLIM,  NO_ITEM,    PSYCHIC_M,    SILVER_WIND,  OMINOUS_WIND, BATON_PASS
	trainermon_full 62, DUSKNOIR,  NO_ITEM,    SHADOW_PUNCH, ROCK_SLIDE,   DOUBLE_TEAM,  PROTECT
	trainermon_full 65, GENGAR,    GOLD_BERRY, FOCUS_BLAST,  THUNDER,      SHADOW_BALL,  PSYCHIC_M
	db -1 ; end
	end_list_items

ByronGroup:
	next_list_item ; BYRON (1)
	db "BYRON@", TRAINERTYPE_ITEM_MOVES
	trainermon_full 37, MAGNETON,  NO_ITEM,    FLASH_CANNON, THUNDERBOLT, TRI_ATTACK,   METAL_SOUND
	trainermon_full 38, STEELIX,   NO_ITEM,    FLASH_CANNON, EARTHQUAKE,  ICE_FANG,     SANDSTORM
	trainermon_full 41, BASTIODON, GOLD_BERRY, METAL_BURST,  STONE_EDGE,  IRON_DEFENSE, TAUNT
	db -1 ; end

	next_list_item ; BYRON (2)
	db "BYRON@", TRAINERTYPE_ITEM_MOVES
	trainermon_full 61, SKARMORY,  NO_ITEM,    DRILL_PECK,  NIGHT_SLASH,  ROCK_TOMB,    STEALTH_ROCK
	trainermon_full 62, MAGNEZONE, NO_ITEM,    THUNDERBOLT, FLASH_CANNON, THUNDER_WAVE, SUPERSONIC
	trainermon_full 61, STEELIX,   NO_ITEM,    GYRO_BALL,   ICE_FANG,     DRAGONBREATH, SANDSTORM
	trainermon_full 63, BASTIODON, NO_ITEM,    METAL_BURST, ANCIENTPOWER, IRON_DEFENSE, REST
	trainermon_full 65, AGGRON,    GOLD_BERRY, METAL_BURST, STONE_EDGE,   EARTHQUAKE,   AVALANCHE
	db -1 ; end
	end_list_items

CandiceGroup:
	next_list_item ; CANDICE (1)
	db "CANDICE@", TRAINERTYPE_ITEM_MOVES
	trainermon_full 40, SNEASEL,   NO_ITEM,    FAINT_ATTACK, ICE_SHARD,   SLASH,       AERIAL_ACE
	trainermon_full 40, PILOSWINE, NO_ITEM,    HAIL,         EARTHQUAKE,  STONE_EDGE,  AVALANCHE
	trainermon_full 42, ABOMASNOW, NO_ITEM,    WOOD_HAMMER,  FOCUS_BLAST, WATER_PULSE, AVALANCHE
	trainermon_full 44, FROSLASS,  GOLD_BERRY, SHADOW_BALL,  DOUBLE_TEAM, PSYCHIC_M,   BLIZZARD
	db -1 ; end

	next_list_item ; CANDICE (2)
	db "CANDICE@", TRAINERTYPE_ITEM_MOVES
	trainermon_full 62, WEAVILE,   NO_ITEM,    FAINT_ATTACK, SLASH,        TAUNT,        AVALANCHE
	trainermon_full 61, MAMOSWINE, NO_ITEM,    HAIL,         EARTHQUAKE,   ANCIENTPOWER, AVALANCHE
	trainermon_full 61, ABOMASNOW, NO_ITEM,    WOOD_HAMMER,  INGRAIN,      GRASSWHISTLE, AVALANCHE
	trainermon_full 63, FROSLASS,  NO_ITEM,    HAIL,         OMINOUS_WIND, CONFUSE_RAY,  BLIZZARD
	trainermon_full 65, GLACEON,   GOLD_BERRY, BLIZZARD,     SHADOW_BALL,  WATER_PULSE,  MIRROR_COAT
	db -1 ; end
	end_list_items

VolknerGroup:
	next_list_item ; VOLKNER (1)
	db "VOLKNER@", TRAINERTYPE_ITEM_MOVES
	trainermon_full 46, JOLTEON,    NO_ITEM,    CHARGE_BEAM,  THUNDER_WAVE, IRON_TAIL,   QUICK_ATTACK
	trainermon_full 46, RAICHU,     NO_ITEM,    CHARGE_BEAM,  SIGNAL_BEAM,  FOCUS_BLAST, QUICK_ATTACK
	trainermon_full 48, LUXRAY,     NO_ITEM,    THUNDER_FANG, ICE_FANG,     FIRE_FANG,   CRUNCH
	trainermon_full 50, ELECTIVIRE, GOLD_BERRY, THUNDERPUNCH, FIRE_PUNCH,   GIGA_IMPACT, QUICK_ATTACK
	db -1 ; end

	next_list_item ; VOLKNER (2)
	db "VOLKNER@", TRAINERTYPE_ITEM_MOVES
	trainermon_full 61, JOLTEON,    NO_ITEM,    CHARGE_BEAM,  DOUBLE_KICK, PIN_MISSILE,  QUICK_ATTACK
	trainermon_full 61, RAICHU,     NO_ITEM,    CHARGE_BEAM,  BRICK_BREAK, LIGHT_SCREEN, THUNDER_WAVE
	trainermon_full 62, LUXRAY,     NO_ITEM,    THUNDER_FANG, ICE_FANG,    FIRE_FANG,    CRUNCH
	trainermon_full 63, LANTURN,    NO_ITEM,    SURF,         DISCHARGE,   ICE_BEAM,     SIGNAL_BEAM
	trainermon_full 65, ELECTIVIRE, GOLD_BERRY, THUNDERPUNCH, FIRE_PUNCH,  BRICK_BREAK,  GIGA_IMPACT
	db -1 ; end
	end_list_items

Rival1Group:
	next_list_item ; RIVAL1 (1)
	db "BARRY@", TRAINERTYPE_NORMAL
	trainermon_normal  5, TURTWIG
	db -1 ; end

	next_list_item ; RIVAL1 (2)
	db "BARRY@", TRAINERTYPE_NORMAL
	trainermon_normal  5, CHIMCHAR
	db -1 ; end

	next_list_item ; RIVAL1 (3)
	db "BARRY@", TRAINERTYPE_NORMAL
	trainermon_normal  5, PIPLUP
	db -1 ; end

	next_list_item ; RIVAL1 (4)
	db "BARRY@", TRAINERTYPE_NORMAL
	trainermon_normal  7, STARLY
	trainermon_normal  9, TURTWIG
	db -1 ; end

	next_list_item ; RIVAL1 (5)
	db "BARRY@", TRAINERTYPE_NORMAL
	trainermon_normal  7, STARLY
	trainermon_normal  9, CHIMCHAR
	db -1 ; end

	next_list_item ; RIVAL1 (6)
	db "BARRY@", TRAINERTYPE_NORMAL
	trainermon_normal  7, STARLY
	trainermon_normal  9, PIPLUP
	db -1 ; end
	end_list_items

PokemonProfGroup:
	end_list_items

AaronGroup:
	next_list_item ; AARON (1)
	db "AARON@", TRAINERTYPE_ITEM_MOVES
	trainermon_full 49, YANMEGA,   NO_ITEM,    BUG_BUZZ,     AIR_SLASH,    U_TURN,      DOUBLE_TEAM
	trainermon_full 49, SCIZOR,    NO_ITEM,    X_SCISSOR,    IRON_HEAD,    NIGHT_SLASH, QUICK_ATTACK
	trainermon_full 51, HERACROSS, NO_ITEM,    MEGAHORN,     CLOSE_COMBAT, NIGHT_SLASH, STONE_EDGE
	trainermon_full 50, VESPIQUEN, NO_ITEM,    ATTACK_ORDER, DEFEND_ORDER, HEAL_ORDER,  POWER_GEM
	trainermon_full 53, DRAPION,   GOLD_BERRY, X_SCISSOR,    CROSS_POISON, ICE_FANG,    AERIAL_ACE
	db -1 ; end

	next_list_item ; AARON (2)
	db "AARON@", TRAINERTYPE_ITEM_MOVES
	trainermon_full 65, YANMEGA,   NO_ITEM,    BUG_BUZZ,     AIR_SLASH,    U_TURN,      DOUBLE_TEAM
	trainermon_full 65, SCIZOR,    NO_ITEM,    X_SCISSOR,    IRON_HEAD,    NIGHT_SLASH, QUICK_ATTACK
	trainermon_full 67, HERACROSS, NO_ITEM,    MEGAHORN,     CLOSE_COMBAT, NIGHT_SLASH, STONE_EDGE
	trainermon_full 66, VESPIQUEN, NO_ITEM,    ATTACK_ORDER, DEFEND_ORDER, HEAL_ORDER,  POWER_GEM
	trainermon_full 69, DRAPION,   GOLD_BERRY, X_SCISSOR,    CROSS_POISON, ICE_FANG,    AERIAL_ACE
	db -1 ; end
	end_list_items

BerthaGroup:
	next_list_item ; BERTHA (1)
	db "BERTHA@", TRAINERTYPE_ITEM_MOVES
	trainermon_full 50, WHISCASH,  NO_ITEM,    EARTH_POWER, AQUA_TAIL,    ZEN_HEADBUTT, SANDSTORM
	trainermon_full 53, GLISCOR,   NO_ITEM,    EARTHQUAKE,  ICE_FANG,     FIRE_FANG,    THUNDER_FANG
	trainermon_full 52, HIPPOWDON, NO_ITEM,    EARTHQUAKE,  STONE_EDGE,   CRUNCH,       YAWN
	trainermon_full 52, GOLEM,     NO_ITEM,    EARTHQUAKE,  FIRE_PUNCH,   THUNDERPUNCH, SANDSTORM
	trainermon_full 55, RHYPERIOR, GOLD_BERRY, EARTHQUAKE,  ROCK_WRECKER, MEGAHORN,     AVALANCHE
	db -1 ; end

	next_list_item ; BERTHA (2)
	db "BERTHA@", TRAINERTYPE_ITEM_MOVES
	trainermon_full 66, WHISCASH,  NO_ITEM,    EARTH_POWER, AQUA_TAIL,    ZEN_HEADBUTT, SANDSTORM
	trainermon_full 69, GLISCOR,   NO_ITEM,    EARTHQUAKE,  ICE_FANG,     FIRE_FANG,    THUNDER_FANG
	trainermon_full 68, HIPPOWDON, NO_ITEM,    EARTHQUAKE,  STONE_EDGE,   CRUNCH,       YAWN
	trainermon_full 68, GOLEM,     NO_ITEM,    EARTHQUAKE,  FIRE_PUNCH,   THUNDERPUNCH, SANDSTORM
	trainermon_full 71, RHYPERIOR, GOLD_BERRY, EARTHQUAKE,  ROCK_WRECKER, MEGAHORN,     AVALANCHE
	db -1 ; end
	end_list_items

FlintGroup:
	next_list_item ; FLINT (1)
	db "FLINT@", TRAINERTYPE_ITEM_MOVES
	trainermon_full 52, HOUNDOOM,  NO_ITEM,    FLAMETHROWER, SLUDGE_BOMB,  DARK_PULSE,   SUNNY_DAY
	trainermon_full 55, FLAREON,   NO_ITEM,    OVERHEAT,     GIGA_IMPACT,  QUICK_ATTACK, WILL_O_WISP
	trainermon_full 53, RAPIDASH,  NO_ITEM,    FLARE_BLITZ,  SOLARBEAM,    BOUNCE,       SUNNY_DAY
	trainermon_full 55, INFERNAPE, NO_ITEM,    FLARE_BLITZ,  THUNDERPUNCH, MACH_PUNCH,   EARTHQUAKE
	trainermon_full 57, MAGMORTAR, GOLD_BERRY, FLAMETHROWER, THUNDERBOLT,  SOLARBEAM,    HYPER_BEAM
	db -1 ; end

	next_list_item ; FLINT (2)
	db "FLINT@", TRAINERTYPE_ITEM_MOVES
	trainermon_full 68, HOUNDOOM,  NO_ITEM,    FLAMETHROWER, SLUDGE_BOMB,  DARK_PULSE,   SUNNY_DAY
	trainermon_full 71, FLAREON,   NO_ITEM,    OVERHEAT,     GIGA_IMPACT,  QUICK_ATTACK, WILL_O_WISP
	trainermon_full 69, RAPIDASH,  NO_ITEM,    FLARE_BLITZ,  SOLARBEAM,    BOUNCE,       SUNNY_DAY
	trainermon_full 71, INFERNAPE, NO_ITEM,    FLARE_BLITZ,  THUNDERPUNCH, MACH_PUNCH,   EARTHQUAKE
	trainermon_full 73, MAGMORTAR, GOLD_BERRY, FLAMETHROWER, THUNDERBOLT,  SOLARBEAM,    HYPER_BEAM
	db -1 ; end
	end_list_items

LucianGroup:
	next_list_item ; LUCIAN (1)
	db "LUCIAN@", TRAINERTYPE_ITEM_MOVES
	trainermon_full 53, MR__MIME, NO_ITEM, PSYCHIC_M,   THUNDERBOLT, REFLECT,      LIGHT_SCREEN
	trainermon_full 55, ESPEON,   NO_ITEM, PSYCHIC_M,   SHADOW_BALL, QUICK_ATTACK, SIGNAL_BEAM
	trainermon_full 54, BRONZONG, NO_ITEM, PSYCHIC_M,   GYRO_BALL,   EARTHQUAKE,   CALM_MIND
	trainermon_full 56, ALAKAZAM, NO_ITEM, PSYCHIC_M,   ENERGY_BALL, FOCUS_BLAST,  RECOVER
	trainermon_full 59, GALLADE,  NO_ITEM, DRAIN_PUNCH, PSYCHO_CUT,  LEAF_BLADE,   STONE_EDGE
	db -1 ; end

	next_list_item ; LUCIAN (2)
	db "LUCIAN@", TRAINERTYPE_ITEM_MOVES
	trainermon_full 69, MR__MIME, NO_ITEM, PSYCHIC_M,   THUNDERBOLT, REFLECT,      LIGHT_SCREEN
	trainermon_full 71, ESPEON,   NO_ITEM, PSYCHIC_M,   SHADOW_BALL, QUICK_ATTACK, SIGNAL_BEAM
	trainermon_full 70, BRONZONG, NO_ITEM, PSYCHIC_M,   GYRO_BALL,   EARTHQUAKE,   CALM_MIND
	trainermon_full 72, ALAKAZAM, NO_ITEM, PSYCHIC_M,   ENERGY_BALL, FOCUS_BLAST,  RECOVER
	trainermon_full 75, GALLADE,  NO_ITEM, DRAIN_PUNCH, PSYCHO_CUT,  LEAF_BLADE,   STONE_EDGE
	db -1 ; end
	end_list_items

PKMNTrainerGroup:
	end_list_items

ChampionGroup:
	next_list_item ; CHAMPION (1)
	db "CYNTHIA@", TRAINERTYPE_ITEM_MOVES
	trainermon_full 58, SPIRITOMB, NO_ITEM,    DARK_PULSE,  PSYCHIC_M,    SILVER_WIND,  SHADOW_BALL
	trainermon_full 58, ROSERADE,  NO_ITEM,    ENERGY_BALL, SLUDGE_BOMB,  TOXIC,        EXTRASENSORY
	trainermon_full 60, TOGEKISS,  NO_ITEM,    AIR_SLASH,   AURA_SPHERE,  WATER_PULSE,  SHOCK_WAVE
	trainermon_full 60, LUCARIO,   NO_ITEM,    AURA_SPHERE, EXTREMESPEED, SHADOW_BALL,  STONE_EDGE
	trainermon_full 58, MILOTIC,   NO_ITEM,    SURF,        ICE_BEAM,     MIRROR_COAT,  DRAGON_PULSE
	trainermon_full 62, GARCHOMP,  GOLD_BERRY, DRAGON_RUSH, EARTHQUAKE,   FLAMETHROWER, GIGA_IMPACT
	db -1 ; end

	next_list_item ; CHAMPION (1)
	db "CYNTHIA@", TRAINERTYPE_ITEM_MOVES
	trainermon_full 74, SPIRITOMB, NO_ITEM,    DARK_PULSE,  PSYCHIC_M,    SILVER_WIND, OMINOUS_WIND
	trainermon_full 74, ROSERADE,  NO_ITEM,    ENERGY_BALL, SLUDGE_BOMB,  SHADOW_BALL, EXTRASENSORY
	trainermon_full 76, TOGEKISS,  NO_ITEM,    AIR_SLASH,   AURA_SPHERE,  WATER_PULSE, PSYCHIC_M
	trainermon_full 76, LUCARIO,   NO_ITEM,    AURA_SPHERE, DRAGON_PULSE, PSYCHIC_M,   EARTHQUAKE
	trainermon_full 74, MILOTIC,   NO_ITEM,    SURF,        ICE_BEAM,     MIRROR_COAT, AQUA_RING
	trainermon_full 78, GARCHOMP,  GOLD_BERRY, DRAGON_RUSH, EARTHQUAKE,   BRICK_BREAK, GIGA_IMPACT
	db -1 ; end
	end_list_items

WorkerGroup:
	next_list_item ; WORKER (1)
	db "MASON@", TRAINERTYPE_NORMAL
	trainermon_normal  9, GEODUDE
	db -1 ; end

	next_list_item ; WORKER (2)
	db "COLIN@", TRAINERTYPE_NORMAL
	trainermon_normal  6, GEODUDE
	trainermon_normal  8, MACHOP
	db -1 ; end
	end_list_items

MistyGroup:
	end_list_items

LtSurgeGroup:
	end_list_items

ScientistGroup:
	end_list_items

ErikaGroup:
	end_list_items

YoungsterGroup:
	next_list_item ; YOUNGSTER (1)
	db "TRISTAN@", TRAINERTYPE_NORMAL
	trainermon_normal  5, STARLY
	db -1 ; end

	next_list_item ; YOUNGSTER (2)
	db "TRISTAN@", TRAINERTYPE_NORMAL
	trainermon_normal 24, STARAVIA
	db -1 ; end

	next_list_item ; YOUNGSTER (3)
	db "TRISTAN@", TRAINERTYPE_NORMAL
	trainermon_normal 35, STARAPTOR
	db -1 ; end

	next_list_item ; YOUNGSTER (4)
	db "TRISTAN@", TRAINERTYPE_NORMAL
	trainermon_normal 45, STARAPTOR
	db -1 ; end

	next_list_item ; YOUNGSTER (5)
	db "LOGAN@", TRAINERTYPE_MOVES
	trainermon_moves  5, BURMY, TACKLE
	db -1 ; end

	next_list_item ; YOUNGSTER (6)
	db "MICHAEL@", TRAINERTYPE_NORMAL
	trainermon_normal  7, KRICKETOT
	trainermon_normal  6, ZUBAT
	db -1 ; end

	next_list_item ; YOUNGSTER (7)
	db "DALLAS@", TRAINERTYPE_NORMAL
	trainermon_normal  8, SHINX
	db -1 ; end

	next_list_item ; YOUNGSTER (8)
	db "DALLAS@", TRAINERTYPE_NORMAL
	trainermon_normal 22, LUXIO
	trainermon_normal 22, BIBAREL
	db -1 ; end

	next_list_item ; YOUNGSTER (9)
	db "DALLAS@", TRAINERTYPE_NORMAL
	trainermon_normal 32, LUXIO
	trainermon_normal 32, BIBAREL
	trainermon_normal 32, GRAVELER
	db -1 ; end

	next_list_item ; YOUNGSTER (10)
	db "DALLAS@", TRAINERTYPE_NORMAL
	trainermon_normal 50, LUXRAY
	trainermon_normal 50, BIBAREL
	trainermon_normal 50, GOLEM
	trainermon_normal 50, STARAPTOR
	db -1 ; end

	next_list_item ; YOUNGSTER (11)
	db "BASTIAN@", TRAINERTYPE_NORMAL
	trainermon_normal  8, MACHOP
	db -1 ; end
	end_list_items

SECTION "Enemy Trainer Parties 2", ROMX

SchoolboyGroup:
	next_list_item ; SCHOOLBOY (1)
	db "HARRISON@", TRAINERTYPE_MOVES
	trainermon_moves  6, STARLY, QUICK_ATTACK
	db -1 ; end
	end_list_items

BirdKeeperGroup:
	end_list_items

LassGroup:
	next_list_item ; LASS (1)
	db "NATALIE@", TRAINERTYPE_NORMAL
	trainermon_normal  5, BIDOOF
	db -1 ; end

	next_list_item ; LASS (2)
	db "KAITLIN@", TRAINERTYPE_NORMAL
	trainermon_normal  4, BIDOOF
	trainermon_normal  4, BUDEW
	trainermon_normal  4, STARLY
	trainermon_normal  4, ABRA
	db -1 ; end

	next_list_item ; LASS (3)
	db "MADELINE@", TRAINERTYPE_NORMAL
	trainermon_normal  8, PSYDUCK
	db -1 ; end

	next_list_item ; LASS (4)
	db "MADELINE@", TRAINERTYPE_NORMAL
	trainermon_normal 22, PSYDUCK
	trainermon_normal 22, BUNEARY
	db -1 ; end

	next_list_item ; LASS (5)
	db "MADELINE@", TRAINERTYPE_NORMAL
	trainermon_normal 33, GOLDUCK
	trainermon_normal 33, BUNEARY
	db -1 ; end

	next_list_item ; LASS (6)
	db "MADELINE@", TRAINERTYPE_NORMAL
	trainermon_normal 43, GOLDUCK
	trainermon_normal 43, LOPUNNY
	db -1 ; end
	end_list_items

JanineGroup:
	end_list_items

CooltrainerMGroup:
	end_list_items

CooltrainerFGroup:
	end_list_items

BeautyGroup:
	end_list_items

PokemaniacGroup:
	end_list_items

GruntMGroup:
	end_list_items

GentlemanGroup:
	end_list_items

SkierGroup:
	end_list_items

TeacherGroup:
	end_list_items

SabrinaGroup:
	end_list_items

BugCatcherGroup:
	end_list_items

FisherGroup:
	end_list_items

SwimmerMGroup:
	end_list_items

SwimmerFGroup:
	end_list_items

SailorGroup:
	end_list_items

SuperNerdGroup:
	end_list_items

Rival2Group:
	end_list_items

GuitaristGroup:
	end_list_items

HikerGroup:
	end_list_items

BikerGroup:
	end_list_items

BlaineGroup:
	end_list_items

BurglarGroup:
	end_list_items

FirebreatherGroup:
	end_list_items

JugglerGroup:
	end_list_items

BlackbeltGroup:
	end_list_items

ExecutiveMGroup:
	end_list_items

PsychicGroup:
	end_list_items

PicnickerGroup:
	next_list_item ; PICNICKER (1)
	db "DIANA@", TRAINERTYPE_NORMAL
	trainermon_normal  9, BIDOOF
	db -1 ; end
	end_list_items

CamperGroup:
	next_list_item ; CAMPER (1)
	db "CURTIS@", TRAINERTYPE_NORMAL
	trainermon_normal  7, STARLY
	trainermon_normal  7, SHINX
	db -1 ; end
	end_list_items

ExecutiveFGroup:
	end_list_items

SageGroup:
	end_list_items

MediumGroup:
	end_list_items

BoarderGroup:
	end_list_items

PokefanMGroup:
	end_list_items

KimonoGirlGroup:
	end_list_items

TwinsGroup:
	end_list_items

PokefanFGroup:
	end_list_items

RedGroup:
	end_list_items

BlueGroup:
	end_list_items

OfficerGroup:
	end_list_items

GruntFGroup:
	end_list_items

MysticalmanGroup:
	end_list_items

SchoolgirlGroup:
	next_list_item ; SCHOOLGIRL (1)
	db "KRISTIN@", TRAINERTYPE_NORMAL
	trainermon_normal  6, BIDOOF
	db -1 ; end
	end_list_items
