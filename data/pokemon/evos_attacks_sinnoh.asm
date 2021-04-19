SECTION "Evolutions and Attacks 5", ROMX

EvosAttacksPointers5::
	dw TurtwigEvosAttacks
	dw GrotleEvosAttacks
	dw TorterraEvosAttacks
	dw ChimcharEvosAttacks
	dw MonfernoEvosAttacks
	dw InfernapeEvosAttacks
	dw PiplupEvosAttacks
	dw PrinplupEvosAttacks
	dw EmpoleonEvosAttacks
	dw StarlyEvosAttacks
	dw StaraviaEvosAttacks
	dw StaraptorEvosAttacks
	dw BidoofEvosAttacks
	dw BibarelEvosAttacks
	dw KricketotEvosAttacks
	dw KricketuneEvosAttacks
	dw ShinxEvosAttacks
	dw LuxioEvosAttacks
	dw LuxrayEvosAttacks
	dw BudewEvosAttacks
	dw RoseradeEvosAttacks
	dw CranidosEvosAttacks
	dw RampardosEvosAttacks
	dw ShieldonEvosAttacks
	dw BastiodonEvosAttacks
	dw BurmyEvosAttacks
	dw WormadamEvosAttacks
	dw MothimEvosAttacks
	dw CombeeEvosAttacks
	dw VespiquenEvosAttacks
	dw PachirisuEvosAttacks
	dw BuizelEvosAttacks
	dw FloatzelEvosAttacks
	dw CherubiEvosAttacks
	dw CherrimEvosAttacks
	dw ShellosEvosAttacks
	dw GastrodonEvosAttacks
	dw AmbipomEvosAttacks
	dw DrifloonEvosAttacks
	dw DrifblimEvosAttacks
	dw BunearyEvosAttacks
	dw LopunnyEvosAttacks
	dw MismagiusEvosAttacks
	dw HonchkrowEvosAttacks
	dw GlameowEvosAttacks
	dw PuruglyEvosAttacks
	dw ChinglingEvosAttacks
	dw StunkyEvosAttacks
	dw SkuntankEvosAttacks
	dw BronzorEvosAttacks
	dw BronzongEvosAttacks
	dw BonslyEvosAttacks
	dw MimeJrEvosAttacks
	dw HappinyEvosAttacks
	dw ChatotEvosAttacks
	dw SpiritombEvosAttacks
	dw GibleEvosAttacks
	dw GabiteEvosAttacks
	dw GarchompEvosAttacks
	dw MunchlaxEvosAttacks
	dw RioluEvosAttacks
	dw LucarioEvosAttacks
	dw HippopotasEvosAttacks
	dw HippowdonEvosAttacks
	dw SkorupiEvosAttacks
	dw DrapionEvosAttacks
	dw CroagunkEvosAttacks
	dw ToxicroakEvosAttacks
	dw CarnivineEvosAttacks
	dw FinneonEvosAttacks
	dw LumineonEvosAttacks
	dw MantykeEvosAttacks
	dw SnoverEvosAttacks
	dw AbomasnowEvosAttacks
	dw WeavileEvosAttacks
	dw MagnezoneEvosAttacks
	dw LickilickyEvosAttacks
	dw RhyperiorEvosAttacks
	dw TangrowthEvosAttacks
	dw ElectivireEvosAttacks
	dw MagmortarEvosAttacks
	dw TogekissEvosAttacks
	dw YanmegaEvosAttacks
	dw LeafeonEvosAttacks
	dw GlaceonEvosAttacks
	dw GliscorEvosAttacks
	dw MamoswineEvosAttacks
	dw PorygonZEvosAttacks
	dw GalladeEvosAttacks
	dw ProbopassEvosAttacks
	dw DusknoirEvosAttacks
	dw FroslassEvosAttacks
	dw RotomEvosAttacks
	dw UxieEvosAttacks
	dw MespritEvosAttacks
	dw AzelfEvosAttacks
	dw DialgaEvosAttacks
	dw PalkiaEvosAttacks
	dw HeatranEvosAttacks
	dw RegigigasEvosAttacks
	dw GiratinaEvosAttacks
	dw CresseliaEvosAttacks
	dw PhioneEvosAttacks
	dw ManaphyEvosAttacks
	dw DarkraiEvosAttacks
	dw ShayminEvosAttacks
	dw ArceusEvosAttacks
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

TurtwigEvosAttacks:
	dbbw EVOLVE_LEVEL, 18, GROTLE
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 5, WITHDRAW
	dbw 9, ABSORB
	dbw 13, RAZOR_LEAF
	dbw 17, CURSE
	dbw 21, BITE
	dbw 25, MEGA_DRAIN
	dbw 29, LEECH_SEED
	dbw 33, SYNTHESIS
	dbw 37, CRUNCH
	dbw 41, GIGA_DRAIN
	dbw 45, LEAF_STORM
	db 0 ; no more level-up moves
	
GrotleEvosAttacks:
	dbbw EVOLVE_LEVEL, 32, TORTERRA
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, WITHDRAW
	dbw 5, WITHDRAW
	dbw 9, ABSORB
	dbw 13, RAZOR_LEAF
	dbw 17, CURSE
	dbw 22, BITE
	dbw 27, MEGA_DRAIN
	dbw 32, LEECH_SEED
	dbw 37, SYNTHESIS
	dbw 42, CRUNCH
	dbw 47, GIGA_DRAIN
	dbw 52, LEAF_STORM
	db 0 ; no more level-up moves
	
TorterraEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, ABSORB
	dbw 1, RAZOR_LEAF
	dbw 1, TACKLE
	dbw 1, WITHDRAW
	dbw 1, WOOD_HAMMER
	dbw 5, WITHDRAW
	dbw 9, ABSORB
	dbw 13, RAZOR_LEAF
	dbw 17, CURSE
	dbw 22, BITE
	dbw 27, MEGA_DRAIN
	dbw 32, EARTHQUAKE
	dbw 33, LEECH_SEED
	dbw 39, SYNTHESIS
	dbw 45, CRUNCH
	dbw 51, GIGA_DRAIN
	dbw 57, LEAF_STORM
	db 0 ; no more level-up moves
	
ChimcharEvosAttacks:
	dbbw EVOLVE_LEVEL, 14, MONFERNO
	db 0 ; no more evolutions
	dbw 1, LEER
	dbw 1, SCRATCH
	dbw 7, EMBER
	dbw 9, TAUNT
	dbw 15, FURY_SWIPES
	dbw 17, FLAME_WHEEL
	dbw 23, NASTY_PLOT
	dbw 25, TORMENT
	dbw 31, FACADE
	dbw 33, FIRE_SPIN
	dbw 39, SLACK_OFF
	dbw 41, FLAMETHROWER
	db 0 ; no more level-up moves
	
MonfernoEvosAttacks:
	dbbw EVOLVE_LEVEL, 36, INFERNAPE
	db 0 ; no more evolutions
	dbw 1, EMBER
	dbw 1, LEER
	dbw 1, SCRATCH
	dbw 7, EMBER
	dbw 9, TAUNT
	dbw 14, MACH_PUNCH
	dbw 16, FURY_SWIPES
	dbw 19, FLAME_WHEEL
	dbw 26, FEINT
	dbw 29, TORMENT
	dbw 36, CLOSE_COMBAT
	dbw 39, FIRE_SPIN
	dbw 46, SLACK_OFF
	dbw 49, FLARE_BLITZ
	db 0 ; no more level-up moves
	
InfernapeEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, EMBER
	dbw 1, LEER
	dbw 1, SCRATCH
	dbw 1, TAUNT
	dbw 7, EMBER
	dbw 9, TAUNT
	dbw 14, MACH_PUNCH
	dbw 17, FURY_SWIPES
	dbw 21, FLAME_WHEEL
	dbw 29, FEINT
	dbw 33, PUNISHMENT
	dbw 41, CLOSE_COMBAT
	dbw 45, FIRE_SPIN
	dbw 53, CALM_MIND
	dbw 57, FLARE_BLITZ
	db 0 ; no more level-up moves
	
PiplupEvosAttacks:
	dbbw EVOLVE_LEVEL, 16, PRINPLUP
	db 0 ; no more evolutions
	dbw 1, POUND
	dbw 4, GROWL
	dbw 8, BUBBLE
	dbw 11, WATER_SPORT
	dbw 15, PECK
	dbw 18, BUBBLEBEAM
	dbw 22, BIDE
	dbw 25, FURY_ATTACK
	dbw 29, BRINE
	dbw 32 WHIRLPOOL
	dbw 36, MIST
	dbw 39, DRILL_PECK
	dbw 43, HYDRO_PUMP
	db 0 ; no more level-up moves
	
PrinplupEvosAttacks:
	dbbw EVOLVE_LEVEL, 36, EMPOLEON
	db 0 ; no more evolutions
	dbw 1, GROWL
	dbw 1, TACKLE
	dbw 4, GROWL
	dbw 8, BUBBLE
	dbw 11, WATER_SPORT
	dbw 15, PECK
	dbw 16, METAL_CLAW
	dbw 19, BUBBLEBEAM
	dbw 24, BIDE
	dbw 28, FURY_ATTACK
	dbw 33, BRINE
	dbw 37, WHIRLPOOL
	dbw 42, MIST
	dbw 46, DRILL_PECK
	dbw 51, HYDRO_PUMP
	db 0 ; no more level-up moves
	
EmpoleonEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, BUBBLE
	dbw 1, GROWL
	dbw 1, TACKLE
	dbw 4, GROWL
	dbw 8, BUBBLE
	dbw 11, SWORDS_DANCE
	dbw 15, PECK
	dbw 16, METAL_CLAW
	dbw 19, BUBBLEBEAM
	dbw 24, SWAGGER
	dbw 28, FURY_ATTACK
	dbw 33, BRINE
	dbw 36, AQUA_JET
	dbw 39, WHIRLPOOL
	dbw 46, MIST
	dbw 52, DRILL_PECK
	dbw 59, HYDRO_PUMP
	db 0 ; no more level-up moves
	
StarlyEvosAttacks:
	dbbw EVOLVE_LEVEL, 14, STARAVIA
	db 0 ; no more evolutions
	dbw 1, GROWL
	dbw 1, TACKLE
	dbw 5, QUICK_ATTACK
	dbw 9, WING_ATTACK
	dbw 13, DOUBLE_TEAM
	dbw 17, ENDEAVOR
	dbw 21, WHIRLWIND
	dbw 25, AERIAL_ACE
	dbw 29, TAKE_DOWN
	dbw 33, AGILITY
	dbw 37, BRAVE_BIRD
	db 0 ; no more level-up moves
	
StaraviaEvosAttacks:
	dbbw EVOLVE_LEVEL, 34, STARAPTOR
	db 0 ; no more evolutions
	dbw 1, GROWL
	dbw 1, QUICK_ATTACK
	dbw 1, TACKLE
	dbw 5, QUICK_ATTACK
	dbw 9, WING_ATTACK
	dbw 13, DOUBLE_TEAM
	dbw 18, ENDEAVOR
	dbw 23, WHIRLWIND
	dbw 28, AERIAL_ACE
	dbw 33, TAKE_DOWN
	dbw 38, AGILITY
	dbw 43, BRAVE_BIRD
	db 0 ; no more level-up moves
	
StaraptorEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, GROWL
	dbw 1, QUICK_ATTACK
	dbw 1, TACKLE
	dbw 1, WING_ATTACK
	dbw 5, QUICK_ATTACK
	dbw 9, WING_ATTACK
	dbw 13, DOUBLE_TEAM
	dbw 18, ENDEAVOR
	dbw 23, WHIRLWIND
	dbw 28, AERIAL_ACE
	dbw 33, TAKE_DOWN
	dbw 34, CLOSE_COMBAT
	dbw 41, AGILITY
	dbw 49, BRAVE_BIRD
	db 0 ; no more level-up moves
	
BidoofEvosAttacks:
	dbbw EVOLVE_LEVEL, 15, BIBAREL
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 5, GROWL
	dbw 9, DEFENSE_CURL
	dbw 13, ROLLOUT
	dbw 17, HEADBUTT
	dbw 21, HYPER_FANG
	dbw 25, YAWN
	dbw 29, AMNESIA
	dbw 33, TAKE_DOWN
	dbw 37, SUPER_FANG
	dbw 41, SUPERPOWER
	dbw 45, CURSE
	db 0 ; no more level-up moves
	
BibarelEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, GROWL
	dbw 1, TACKLE
	dbw 5, GROWL
	dbw 9, DEFENSE_CURL
	dbw 13, ROLLOUT
	dbw 15, WATER_GUN
	dbw 18, HEADBUTT
	dbw 23, HYPER_FANG
	dbw 28, YAWN
	dbw 33, AMNESIA
	dbw 38, TAKE_DOWN
	dbw 43, SUPER_FANG
	dbw 48, SUPERPOWER
	dbw 53, CURSE
	db 0 ; no more level-up moves
	
KricketotEvosAttacks:
	dbbw EVOLVE_LEVEL, 10, BIBAREL
	db 0 ; no more evolutions
	dbw 1, BIDE
	dbw 1, GROWL
	dbw 16, BUG_BITE
	db 0 ; no more level-up moves
	
KricketuneEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, BIDE
	dbw 1, GROWL
	dbw 10, FURY_CUTTER
	dbw 14, LEECH_LIFE
	dbw 18, SING
	dbw 22, FOCUS_ENERGY
	dbw 26, SLASH
	dbw 30, X_SCISSOR
	dbw 34, SCREECH
	dbw 38, TAUNT
	dbw 42, NIGHT_SLASH
	dbw 46, BUG_BUZZ
	dbw 50, PERISH_SONG
	db 0 ; no more level-up moves
	
ShinxEvosAttacks:
	dbbw EVOLVE_LEVEL, 16, LUXIO
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 5, LEER
	dbw 9, CHARGE
	dbw 13, SPARK
	dbw 17, BITE
	dbw 21, ROAR
	dbw 25, SWAGGER
	dbw 29, THUNDER_FANG
	dbw 33, CRUNCH
	dbw 37, SCARY_FACE
	dbw 41, DISCHARGE
	db 0 ; no more level-up moves
	
LuxioEvosAttacks:
	dbbw EVOLVE_LEVEL, 30, LUXRAY
	db 0 ; no more evolutions
	dbw 1, LEER
	dbw 1, TACKLE
	dbw 5, LEER
	dbw 9, CHARGE
	dbw 13, SPARK
	dbw 18, BITE
	dbw 23, ROAR
	dbw 28, SWAGGER
	dbw 33, THUNDER_FANG
	dbw 38, CRUNCH
	dbw 43, SCARY_FACE
	dbw 48, DISCHARGE
	db 0 ; no more level-up moves
	
LuxrayEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, CHARGE
	dbw 1, LEER
	dbw 1, TACKLE
	dbw 5, LEER
	dbw 9, CHARGE
	dbw 13, SPARK
	dbw 18, BITE
	dbw 23, ROAR
	dbw 28, SWAGGER
	dbw 35, THUNDER_FANG
	dbw 42, CRUNCH
	dbw 49, SCARY_FACE
	dbw 56, DISCHARGE
	db 0 ; no more level-up moves
	
BudewEvosAttacks:
	dbbw EVOLVE_HAPPINESS, TR_ANYTIME, ROSELIA
	db 0 ; no more evolutions
	dbw 1, ABSORB
	dbw 4, GROWTH
	dbw 7, WATER_SPORT
	dbw 10, STUN_SPORE
	dbw 13, MEGA_DRAIN
	dbw 16, WORRY_SEED
	db 0 ; no more level-up moves
	
RoseradeEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, MAGICAL_LEAF
	dbw 1, MEGA_DRAIN
	dbw 1, POISON_STING
	dbw 1, SWEET_SCENT
	dbw 1, WEATHER_BALL
	db 0 ; no more level-up moves
	
CranidosEvosAttacks:
	dbbw EVOLVE_LEVEL, 30, RAMPARDOS
	db 0 ; no more evolutions
	dbw 1, HEADBUTT
	dbw 1, LEER
	dbw 6, FOCUS_ENERGY
	dbw 10, PURSUIT
	dbw 15, TAKE_DOWN
	dbw 19, SCARY_FACE
	dbw 24, ASSURANCE
	dbw 28, ANCIENTPOWER
	dbw 33, ZEN_HEADBUTT
	dbw 37, SCREECH
	dbw 43, HEAD_SMASH
	db 0 ; no more level-up moves
	
RampardosEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, HEADBUTT
	dbw 1, LEER
	dbw 6, FOCUS_ENERGY
	dbw 10, PURSUIT
	dbw 15, TAKE_DOWN
	dbw 19, SCARY_FACE
	dbw 24, ASSURANCE
	dbw 28, ANCIENTPOWER
	dbw 30, ENDEAVOR
	dbw 36, ZEN_HEADBUTT
	dbw 43, SCREECH
	dbw 52, HEAD_SMASH
	db 0 ; no more level-up moves
	
ShieldonEvosAttacks:
	dbbw EVOLVE_LEVEL, 30, BASTIODON
	db 0 ; no more evolutions
	dbw 1, PROTECT
	dbw 1, TACKLE
	dbw 6, TAUNT
	dbw 10, METAL_SOUND
	dbw 15, TAKE_DOWN
	dbw 19, IRON_DEFENSE
	dbw 24, SWAGGER
	dbw 28, ANCIENTPOWER
	dbw 33, ENDURE
	dbw 37, METAL_BURST
	dbw 43, IRON_HEAD
	db 0 ; no more level-up moves
	
BastiodonEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, METAL_SOUND
	dbw 1, PROTECT
	dbw 1, TACKLE
	dbw 1, TAUNT
	dbw 6, TAUNT
	dbw 10, METAL_SOUND
	dbw 15, TAKE_DOWN
	dbw 19, IRON_DEFENSE
	dbw 24, SWAGGER
	dbw 28, ANCIENTPOWER
	dbw 30, BLOCK
	dbw 36, ENDURE
	dbw 43, METAL_BURST
	dbw 52, IRON_HEAD
	db 0 ; no more level-up moves
	
BurmyEvosAttacks:
	; (If Female) dbbw EVOLVE_LEVEL, 20, WORMADAM
	; (If Male) dbbw EVOLVE_LEVEL, 20, MOTHIM
	db 0 ; no more evolutions
	dbw 1, PROTECT
	dbw 10, TACKLE
	dbw 15, BUG_BITE
	dbw 20, HIDDEN_POWER
	db 0 ; no more level-up moves
	
WormadamEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 10, PROTECT
	dbw 15, BUG_BITE
	dbw 20, HIDDEN_POWER
	dbw 23, CONFUSION
	dbw 26, RAZOR_LEAF
	dbw 29, GROWTH
	dbw 32, PSYBEAM
	dbw 35, CAPTIVATE
	dbw 38, FLAIL
	dbw 41, ATTRACT
	dbw 44, PSYCHIC_M
	dbw 47, LEAF_STORM
	db 0 ; no more level-up moves
	
MothimEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 10, PROTECT
	dbw 15, BUG_BITE
	dbw 20, HIDDEN_POWER
	dbw 23, CONFUSION
	dbw 26, GUST
	dbw 29, POISONPOWDER
	dbw 32, PSYBEAM
	dbw 35, CAMOUFLAGE
	dbw 38, SILVER_WIND
	dbw 41, AIR_SLASH
	dbw 44, PSYCHIC_M
	dbw 47, BUG_BUZZ
	db 0 ; no more level-up moves
	
CombeeEvosAttacks:
	; (If Female) dbbw EVOLVE_LEVEL, 21, VESPIQUEN
	db 0 ; no more evolutions
	dbw 1, GUST
	dbw 1, SWEET_SCENT
	dbw 13, BUG_BITE
	db 0 ; no more level-up moves
	
VespiquenEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, GUST
	dbw 1, SWEET_SCENT
	dbw 3, POISON_STING
	dbw 7, CONFUSE_RAY
	dbw 9, FURY_CUTTER
	dbw 13, DEFEND_ORDER
	dbw 15, PURSUIT
	dbw 19, FURY_SWIPES
	dbw 21, POWER_GEM
	dbw 25, HEAL_ORDER
	dbw 27, TOXIC
	dbw 31, SLASH
	dbw 33, CAPTIVATE
	dbw 37, ATTACK_ORDER
	dbw 39, SWAGGER
	dbw 43, DESTINY_BOND
	db 0 ; no more level-up moves
	
PachirisuEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, BIDE
	dbw 1, GROWL
	dbw 5, QUICK_ATTACK
	dbw 9, CHARM
	dbw 13, SPARK
	dbw 17, ENDURE
	dbw 21, SWIFT
	dbw 25, SWEET_KISS
	dbw 29, DISCHARGE
	dbw 33, SUPER_FANG
	dbw 37, LAST_RESORT
	db 0 ; no more level-up moves
	
BuizelEvosAttacks:
	dbbw EVOLVE_LEVEL, 26, FLOATZEL
	db 0 ; no more evolutions
	dbw 1, GROWL
	dbw 1, SONIC_BOOM
	dbw 1, WATER_SPORT
	dbw 3, QUICK_ATTACK
	dbw 6, WATER_GUN
	dbw 10, PURSUIT
	dbw 15, SWIFT
	dbw 21, AQUA_JET
	dbw 28, AGILITY
	dbw 36, WHIRLPOOL
	dbw 45, RAZOR_WIND
	db 0 ; no more level-up moves
	
FloatzelEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, GROWL
	dbw 1, ICE_FANG
	dbw 1, QUICK_ATTACK
	dbw 1, SONIC_BOOM
	dbw 1, WATER_SPORT
	dbw 3, QUICK_ATTACK
	dbw 6, WATER_GUN
	dbw 10, PURSUIT
	dbw 15, SWIFT
	dbw 21, AQUA_JET
	dbw 26, CRUNCH
	dbw 29, AGILITY
	dbw 39, WHIRLPOOL
	dbw 50, RAZOR_WIND
	db 0 ; no more level-up moves
	
CherubiEvosAttacks:
	dbbw EVOLVE_LEVEL, 25, CHERRIM
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 7, GROWTH
	dbw 10, LEECH_SEED
	dbw 13, HELPING_HAND
	dbw 19, MAGICAL_LEAF
	dbw 22, SUNNY_DAY
	dbw 28, WORRY_SEED
	dbw 31, TAKE_DOWN
	dbw 27, SOLARBEAM
	dbw 40, LUCKY_CHANT
	db 0 ; no more level-up moves
	
CherrimEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, GROWTH
	dbw 1, TACKLE
	dbw 7, GROWTH
	dbw 10, LEECH_SEED
	dbw 13, HELPING_HAND
	dbw 19, MAGICAL_LEAF
	dbw 22, SUNNY_DAY
	dbw 25, PETAL_DANCE
	dbw 30, WORRY_SEED
	dbw 35, TAKE_DOWN
	dbw 43, SOLARBEAM
	dbw 48, LUCKY_CHANT
	db 0 ; no more level-up moves
	
ShellosEvosAttacks:
	dbbw EVOLVE_LEVEL, 30, GASTRODON
	db 0 ; no more evolutions
	dbw 1, MUD_SLAP
	dbw 2, MUD_SPORT
	dbw 4, HARDEN
	dbw 7, WATER_PULSE
	dbw 11, MUD_BOMB
	dbw 16, HIDDEN_POWER
	dbw 22, RAIN_DANCE
	dbw 29, BODY_SLAM
	dbw 27, MUDDY_WATER
	dbw 46, RECOVER
	db 0 ; no more level-up moves
	
GastrodonEvosAttacks:
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
	
AmbipomEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, ASTONISH
	dbw 1, SAND_ATTACK
	dbw 1, SCRATCH
	dbw 1, TAIL_WHIP
	dbw 4, SAND_ATTACK
	dbw 8, ASTONISH
	dbw 11, BATON_PASS
	dbw 15, TICKLE
	dbw 18, FURY_SWIPES
	dbw 22, SWIFT
	dbw 25, SCREECH
	dbw 29, AGILITY
	dbw 32, DOUBLE_HIT
	dbw 36, FLING
	dbw 39, NASTY_PLOT
	dbw 43, LAST_RESORT
	db 0 ; no more level-up moves
	
DrifloonEvosAttacks:
	dbbw EVOLVE_LEVEL, 28, DRIFBLIM
	db 0 ; no more evolutions
	dbw 1, CONSTRICT
	dbw 1, MINIMIZE
	dbw 6, ASTONISH
	dbw 11, GUST
	dbw 14, FOCUS_ENERGY
	dbw 17, PAYBACK
	dbw 22, STOCKPILE
	dbw 27, SPIT_UP
	dbw 27, SWALLOW
	dbw 30, OMINOUS_WIND
	dbw 33, BATON_PASS
	dbw 38, SHADOW_BALL
	dbw 43, EXPLOSION
	db 0 ; no more level-up moves
	
DrifblimEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, ASTONISH
	dbw 1, CONSTRICT
	dbw 1, GUST
	dbw 1, MINIMIZE
	dbw 6, ASTONISH
	dbw 11, GUST
	dbw 14, FOCUS_ENERGY
	dbw 17, PAYBACK
	dbw 22, STOCKPILE
	dbw 27, SPIT_UP
	dbw 27, SWALLOW
	dbw 32, OMINOUS_WIND
	dbw 37, BATON_PASS
	dbw 44, SHADOW_BALL
	dbw 51, EXPLOSION
	db 0 ; no more level-up moves
	
BunearyEvosAttacks:
	dbbw EVOLVE_HAPPINESS, TR_ANYTIME, LOPUNNY
	db 0 ; no more evolutions
	dbw 1, DEFENSE_CURL
	dbw 1, FORESIGHT
	dbw 1, POUND
	dbw 1, SPLASH
	dbw 6, ENDURE
	dbw 13, FRUSTRATION
	dbw 16, QUICK_ATTACK
	dbw 23, JUMP_KICK
	dbw 26, BATON_PASS
	dbw 33, AGILITY
	dbw 36, DIZZY_PUNCH
	dbw 43, CHARM
	dbw 46, BOUNCE
	dbw 53, HEALING_WISH
	db 0 ; no more level-up moves
	
LopunnyEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, DEFENSE_CURL
	dbw 1, FORESIGHT
	dbw 1, MAGIC_COAT
	dbw 1, MIRROR_COAT
	dbw 1, POUND
	dbw 1, SPLASH
	dbw 6, ENDURE
	dbw 13, RETURN
	dbw 16, QUICK_ATTACK
	dbw 23, JUMP_KICK
	dbw 26, BATON_PASS
	dbw 33, AGILITY
	dbw 36, DIZZY_PUNCH
	dbw 43, CHARM
	dbw 46, BOUNCE
	dbw 53, HEALING_WISH
	db 0 ; no more level-up moves
	
MismagiusEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, ASTONISH
	dbw 1, GROWL
	dbw 1, LUCKY_CHANT
	dbw 1, MAGICAL_LEAF
	dbw 1, PSYWAVE
	dbw 1, SPITE
	db 0 ; no more level-up moves
	
HonchkrowEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, ASTONISH
	dbw 1, HAZE
	dbw 1, PURSUIT
	dbw 1, WING_ATTACK
	dbw 25, SWAGGER
	dbw 35, NASTY_PLOT
	dbw 45, NIGHT_SLASH
	dbw 55, DARK_PULSE
	db 0 ; no more level-up moves
	
GlameowEvosAttacks:
	dbbw EVOLVE_LEVEL, 38, PURUGLY
	db 0 ; no more evolutions
	dbw 1, FAKE_OUT
	dbw 5, SCRATCH
	dbw 8, GROWL
	dbw 13, HYPNOSIS
	dbw 17, FAINT_ATTACK
	dbw 20, FURY_SWIPES
	dbw 25, CHARM
	dbw 29, ASSIST
	dbw 32, CAPTIVATE
	dbw 27, SLASH
	dbw 41, SUCKER_PUNCH
	dbw 45, ATTRACT
	db 0 ; no more level-up moves
	
PuruglyEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, FAKE_OUT
	dbw 1, GROWL
	dbw 1, SCRATCH
	dbw 5, SCRATCH
	dbw 8, GROWL
	dbw 13, HYPNOSIS
	dbw 17, FAINT_ATTACK
	dbw 20, FURY_SWIPES
	dbw 25, CHARM
	dbw 29, ASSIST
	dbw 32, CAPTIVATE
	dbw 37, SLASH
	dbw 38, SWAGGER
	dbw 45, BODY_SLAM
	dbw 53, ATTRACT
	db 0 ; no more level-up moves
	
ChinglingEvosAttacks:
	dbbw EVOLVE_HAPPINESS, TR_NIGHT, CHIMECHO
	db 0 ; no more evolutions
	dbw 1, WRAP
	dbw 6, GROWL
	dbw 9, ASTONISH
	dbw 14, CONFUSION
	dbw 17, UPROAR
	dbw 22, LAST_RESORT
	db 0 ; no more level-up moves
	
StunkyEvosAttacks:
	dbbw EVOLVE_LEVEL, 34, SKUNTANK
	db 0 ; no more evolutions
	dbw 1, FOCUS_ENERGY
	dbw 1, SCRATCH
	dbw 4, POISON_GAS
	dbw 7, SCREECH
	dbw 10, FURY_SWIPES
	dbw 14, SMOKESCREEN
	dbw 18, FEINT
	dbw 22, SLASH
	dbw 27, TOXIC
	dbw 32, NIGHT_SLASH
	dbw 38, MEMENTO
	dbw 44, EXPLOSION
	db 0 ; no more level-up moves
	
SkuntankEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, FOCUS_ENERGY
	dbw 1, POISON_GAS
	dbw 1, SCRATCH
	dbw 4, POISON_GAS
	dbw 7, SCREECH
	dbw 10, FURY_SWIPES
	dbw 14, SMOKESCREEN
	dbw 18, FEINT
	dbw 22, SLASH
	dbw 27, TOXIC
	dbw 32, NIGHT_SLASH
	dbw 34, FLAMETHROWER
	dbw 42, MEMENTO
	dbw 52, EXPLOSION
	db 0 ; no more level-up moves
	
BronzorEvosAttacks:
	dbbw EVOLVE_LEVEL, 33, BRONZONG
	db 0 ; no more evolutions
	dbw 1, CONFUSION
	dbw 1, TACKLE
	dbw 7, HYPNOSIS
	dbw 12, IMPRISON
	dbw 14, CONFUSE_RAY
	dbw 19, EXTRASENSORY
	dbw 26, IRON_DEFENSE
	dbw 30, SAFEGUARD
	dbw 35, GYRO_BALL
	dbw 37, FUTURE_SIGHT
	dbw 41, FAINT_ATTACK
	dbw 49, PAYBACK
	dbw 52, HEAL_BLOCK
	db 0 ; no more level-up moves
	
BronzongEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, CONFUSION
	dbw 1, HYPNOSIS
	dbw 1, IMPRISON
	dbw 1, RAIN_DANCE
	dbw 1, SUNNY_DAY
	dbw 1, TACKLE
	dbw 7, HYPNOSIS
	dbw 12, IMPRISON
	dbw 14, CONFUSE_RAY
	dbw 19, EXTRASENSORY
	dbw 26, IRON_DEFENSE
	dbw 30, SAFEGUARD
	dbw 33, BLOCK
	dbw 38, GYRO_BALL
	dbw 43, FUTURE_SIGHT
	dbw 50, FAINT_ATTACK
	dbw 61, PAYBACK
	dbw 67, HEAL_BLOCK
	db 0 ; no more level-up moves
	
BonslyEvosAttacks:
	db 0 ; no more evolutions
	db 0 ; no more level-up moves
	
MimeJrEvosAttacks:
	db 0 ; no more evolutions
	db 0 ; no more level-up moves
	
HappinyEvosAttacks:
	db 0 ; no more evolutions
	db 0 ; no more level-up moves
	
ChatotEvosAttacks:
	db 0 ; no more evolutions
	db 0 ; no more level-up moves
	
SpiritombEvosAttacks:
	db 0 ; no more evolutions
	db 0 ; no more level-up moves
	
GibleEvosAttacks:
	db 0 ; no more evolutions
	db 0 ; no more level-up moves
	
GabiteEvosAttacks:
	db 0 ; no more evolutions
	db 0 ; no more level-up moves
	
GarchompEvosAttacks:
	db 0 ; no more evolutions
	db 0 ; no more level-up moves
	
MunchlaxEvosAttacks:
	db 0 ; no more evolutions
	db 0 ; no more level-up moves
	
RioluEvosAttacks:
	db 0 ; no more evolutions
	db 0 ; no more level-up moves
	
LucarioEvosAttacks:
	db 0 ; no more evolutions
	db 0 ; no more level-up moves
	
HippopotasEvosAttacks:
	db 0 ; no more evolutions
	db 0 ; no more level-up moves
	
HippowdonEvosAttacks:
	db 0 ; no more evolutions
	db 0 ; no more level-up moves
	
SkorupiEvosAttacks:
	db 0 ; no more evolutions
	db 0 ; no more level-up moves
	
DrapionEvosAttacks:
	db 0 ; no more evolutions
	db 0 ; no more level-up moves
	
CroagunkEvosAttacks:
	db 0 ; no more evolutions
	db 0 ; no more level-up moves
	
ToxicroakEvosAttacks:
	db 0 ; no more evolutions
	db 0 ; no more level-up moves
	
CarnivineEvosAttacks:
	db 0 ; no more evolutions
	db 0 ; no more level-up moves
	
FinneonEvosAttacks:
	db 0 ; no more evolutions
	db 0 ; no more level-up moves
	
LumineonEvosAttacks:
	db 0 ; no more evolutions
	db 0 ; no more level-up moves
	
MantykeEvosAttacks:
	db 0 ; no more evolutions
	db 0 ; no more level-up moves
	
SnoverEvosAttacks:
	db 0 ; no more evolutions
	db 0 ; no more level-up moves
	
AbomasnowEvosAttacks:
	db 0 ; no more evolutions
	db 0 ; no more level-up moves
	
WeavileEvosAttacks:
	db 0 ; no more evolutions
	db 0 ; no more level-up moves
	
MagnezoneEvosAttacks:
	db 0 ; no more evolutions
	db 0 ; no more level-up moves
	
LickilickyEvosAttacks:
	db 0 ; no more evolutions
	db 0 ; no more level-up moves
	
RhyperiorEvosAttacks:
	db 0 ; no more evolutions
	db 0 ; no more level-up moves
	
TangrowthEvosAttacks:
	db 0 ; no more evolutions
	db 0 ; no more level-up moves
	
ElectivireEvosAttacks:
	db 0 ; no more evolutions
	db 0 ; no more level-up moves
	
MagmortarEvosAttacks:
	db 0 ; no more evolutions
	db 0 ; no more level-up moves
	
TogekissEvosAttacks:
	db 0 ; no more evolutions
	db 0 ; no more level-up moves
	
YanmegaEvosAttacks:
	db 0 ; no more evolutions
	db 0 ; no more level-up moves
	
LeafeonEvosAttacks:
	db 0 ; no more evolutions
	db 0 ; no more level-up moves
	
GlaceonEvosAttacks:
	db 0 ; no more evolutions
	db 0 ; no more level-up moves
	
GliscorEvosAttacks:
	db 0 ; no more evolutions
	db 0 ; no more level-up moves
	
MamoswineEvosAttacks:
	db 0 ; no more evolutions
	db 0 ; no more level-up moves
	
PorygonZEvosAttacks:
	db 0 ; no more evolutions
	db 0 ; no more level-up moves
	
GalladeEvosAttacks:
	db 0 ; no more evolutions
	db 0 ; no more level-up moves
	
ProbopassEvosAttacks:
	db 0 ; no more evolutions
	db 0 ; no more level-up moves
	
DusknoirEvosAttacks:
	db 0 ; no more evolutions
	db 0 ; no more level-up moves
	
FroslassEvosAttacks:
	db 0 ; no more evolutions
	db 0 ; no more level-up moves
	
RotomEvosAttacks:
	db 0 ; no more evolutions
	db 0 ; no more level-up moves
	
UxieEvosAttacks:
	db 0 ; no more evolutions
	db 0 ; no more level-up moves
	
MespritEvosAttacks:
	db 0 ; no more evolutions
	db 0 ; no more level-up moves
	
AzelfEvosAttacks:
	db 0 ; no more evolutions
	db 0 ; no more level-up moves
	
DialgaEvosAttacks:
	db 0 ; no more evolutions
	db 0 ; no more level-up moves
	
PalkiaEvosAttacks:
	db 0 ; no more evolutions
	db 0 ; no more level-up moves
	
HeatranEvosAttacks:
	db 0 ; no more evolutions
	db 0 ; no more level-up moves
	
RegigigasEvosAttacks:
	db 0 ; no more evolutions
	db 0 ; no more level-up moves
	
GiratinaEvosAttacks:
	db 0 ; no more evolutions
	db 0 ; no more level-up moves
	
CresseliaEvosAttacks:
	db 0 ; no more evolutions
	db 0 ; no more level-up moves
	
PhioneEvosAttacks:
	db 0 ; no more evolutions
	db 0 ; no more level-up moves
	
ManaphyEvosAttacks:
	db 0 ; no more evolutions
	db 0 ; no more level-up moves
	
DarkraiEvosAttacks:
	db 0 ; no more evolutions
	db 0 ; no more level-up moves
	
ShayminEvosAttacks:
	db 0 ; no more evolutions
	db 0 ; no more level-up moves
	
ArceusEvosAttacks:
	db 0 ; no more evolutions
	db 0 ; no more level-up moves
	
PichuSpikyEvosAttacks:
	db 0 ; no more evolutions
	db 0 ; no more level-up moves
	
DeoxysAttackEvosAttacks:
	db 0 ; no more evolutions
	db 0 ; no more level-up moves
	
DeoxysDefenseEvosAttacks:
	db 0 ; no more evolutions
	db 0 ; no more level-up moves
	
DeoxysSpeedEvosAttacks:
	db 0 ; no more evolutions
	db 0 ; no more level-up moves
	
BurmySandEvosAttacks:
	; (If Female) dbbw EVOLVE_LEVEL, 20, WORMADAM_S
	; (If Male) dbbw EVOLVE_LEVEL, 20, MOTHIM
	db 0 ; no more evolutions
	dbw 1, PROTECT
	dbw 10, TACKLE
	dbw 15, BUG_BITE
	dbw 20, HIDDEN_POWER
	db 0 ; no more level-up moves
	
BurmyTrashEvosAttacks:
	; (If Female) dbbw EVOLVE_LEVEL, 20, WORMADAM_T
	; (If Male) dbbw EVOLVE_LEVEL, 20, MOTHIM
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
	dbw 27, MUDDY_WATER
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
	db 0 ; no more level-up moves
	
RotomHeatEvosAttacks:
	db 0 ; no more evolutions
	db 0 ; no more level-up moves
	
RotomMowEvosAttacks:
	db 0 ; no more evolutions
	db 0 ; no more level-up moves
	
RotomFridgeEvosAttacks:
	db 0 ; no more evolutions
	db 0 ; no more level-up moves
	
RotomWashEvosAttacks:
	db 0 ; no more evolutions
	db 0 ; no more level-up moves
	
GiratinaOriginEvosAttacks:
	db 0 ; no more evolutions
	db 0 ; no more level-up moves
	
ShayminSkyEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, TACKLE
	db 0 ; no more level-up moves
