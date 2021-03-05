SECTION "Evolutions and Attacks 4", ROMX

EvosAttacksPointers4::
	dw TreeckoEvosAttacks
	dw GrovyleEvosAttacks
	dw SceptileEvosAttacks
	dw TorchicEvosAttacks
	dw CombuskenEvosAttacks
	dw BlazikenEvosAttacks
	dw MudkipEvosAttacks
	dw MarshtompEvosAttacks
	dw SwampertEvosAttacks
	dw PoochyenaEvosAttacks
	dw MightyenaEvosAttacks
	dw ZigzagoonEvosAttacks
	dw LinooneEvosAttacks
	dw WurmpleEvosAttacks
	dw SilcoonEvosAttacks
	dw BeautiflyEvosAttacks
	dw CascoonEvosAttacks
	dw DustoxEvosAttacks
	dw LotadEvosAttacks
	dw LombreEvosAttacks
	dw LudicoloEvosAttacks
	dw SeedotEvosAttacks
	dw NuzleafEvosAttacks
	dw ShiftryEvosAttacks
	dw TaillowEvosAttacks
	dw SwellowEvosAttacks
	dw WingullEvosAttacks
	dw PelipperEvosAttacks
	dw RaltsEvosAttacks
	dw KirliaEvosAttacks
	dw GardevoirEvosAttacks
	dw SurskitEvosAttacks
	dw MasquerainEvosAttacks
	dw ShroomishEvosAttacks
	dw BreloomEvosAttacks
	dw SlakothEvosAttacks
	dw VigorothEvosAttacks
	dw SlakingEvosAttacks
	dw NincadaEvosAttacks
	dw NinjaskEvosAttacks
	dw ShedinjaEvosAttacks
	dw WhismurEvosAttacks
	dw LoudredEvosAttacks
	dw ExploudEvosAttacks
	dw MakuhitaEvosAttacks
	dw HariyamaEvosAttacks
	dw AzurillEvosAttacks
	dw NosepassEvosAttacks
	dw SkittyEvosAttacks
	dw DelcattyEvosAttacks
	dw SableyeEvosAttacks
	dw MawileEvosAttacks
	dw AronEvosAttacks
	dw LaironEvosAttacks
	dw AggronEvosAttacks
	dw MedititeEvosAttacks
	dw MedichamEvosAttacks
	dw ElectrikeEvosAttacks
	dw ManectricEvosAttacks
	dw PlusleEvosAttacks
	dw MinunEvosAttacks
	dw VolbeatEvosAttacks
	dw IllumiseEvosAttacks
	dw RoseliaEvosAttacks
	dw GulpinEvosAttacks
	dw SwalotEvosAttacks
	dw CarvanhaEvosAttacks
	dw SharpedoEvosAttacks
	dw WailmerEvosAttacks
	dw WailordEvosAttacks
	dw NumelEvosAttacks
	dw CameruptEvosAttacks
	dw TorkoalEvosAttacks
	dw SpoinkEvosAttacks
	dw GrumpigEvosAttacks
	dw SpindaEvosAttacks
	dw TrapinchEvosAttacks
	dw VibravaEvosAttacks
	dw FlygonEvosAttacks
	dw CacneaEvosAttacks
	dw CacturneEvosAttacks
	dw SwabluEvosAttacks
	dw AltariaEvosAttacks
	dw ZangooseEvosAttacks
	dw SeviperEvosAttacks
	dw LunatoneEvosAttacks
	dw SolrockEvosAttacks
	dw BarboachEvosAttacks
	dw WhiscashEvosAttacks
	dw CorphishEvosAttacks
	dw CrawdauntEvosAttacks
	dw BaltoyEvosAttacks
	dw ClaydolEvosAttacks
	dw LileepEvosAttacks
	dw CradilyEvosAttacks
	dw AnorithEvosAttacks
	dw ArmaldoEvosAttacks
	dw FeebasEvosAttacks
	dw MiloticEvosAttacks
	dw CastformEvosAttacks
	dw KecleonEvosAttacks
	dw ShuppetEvosAttacks
	dw BanetteEvosAttacks
	dw DuskullEvosAttacks
	dw DusclopsEvosAttacks
	dw TropiusEvosAttacks
	dw ChimechoEvosAttacks
	dw AbsolEvosAttacks
	dw WynautEvosAttacks
	dw SnoruntEvosAttacks
	dw GlalieEvosAttacks
	dw SphealEvosAttacks
	dw SealeoEvosAttacks
	dw WalreinEvosAttacks
	dw ClamperlEvosAttacks
	dw HuntailEvosAttacks
	dw GorebyssEvosAttacks
	dw RelicanthEvosAttacks
	dw LuvdiscEvosAttacks
	dw BagonEvosAttacks
	dw ShelgonEvosAttacks
	dw SalamenceEvosAttacks
	dw BeldumEvosAttacks
	dw MetangEvosAttacks
	dw MetagrossEvosAttacks
	dw RegirockEvosAttacks
	dw RegiceEvosAttacks
	dw RegisteelEvosAttacks
	dw LatiasEvosAttacks
	dw LatiosEvosAttacks
	dw KyogreEvosAttacks
	dw GroudonEvosAttacks
	dw RayquazaEvosAttacks
	dw JirachiEvosAttacks
	dw DeoxysEvosAttacks

TreeckoEvosAttacks:
	dbbw EVOLVE_LEVEL, 16, GROVYLE
	db 0 ; no more evolutions
	dbw 1, LEER
	dbw 1, POUND
	dbw 6, ABSORB
	dbw 11, QUICK_ATTACK
	dbw 16, PURSUIT
	dbw 21, SCREECH
	dbw 26, MEGA_DRAIN
	dbw 31, AGILITY
	dbw 36, SLAM
	dbw 41, DETECT
	dbw 46, GIGA_DRAIN
	dbw 51, ENERGY_BALL
	db 0 ; no more level-up moves

GrovyleEvosAttacks:
	dbbw EVOLVE_LEVEL, 36, SCEPTILE
	db 0 ; no more evolutions
	dbw 1, ABSORB
	dbw 1, LEER
	dbw 1, POUND
	dbw 1, QUICK_ATTACK
	dbw 6, ABSORB
	dbw 11, QUICK_ATTACK
	dbw 16, FURY_CUTTER
	dbw 17, PURSUIT
	dbw 23, SCREECH
	dbw 29, LEAF_BLADE
	dbw 35, AGILITY
	dbw 41, SLAM
	dbw 47, DETECT
	dbw 53, FALSE_SWIPE
	dbw 59, LEAF_STORM
	db 0 ; no more level-up moves
	
SceptileEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, ABSORB
	dbw 1, LEER
	dbw 1, NIGHT_SLASH
	dbw 1, POUND
	dbw 1, QUICK_ATTACK
	dbw 6, ABSORB
	dbw 11, QUICK_ATTACK
	dbw 16, X_SCISSOR
	dbw 17, PURSUIT
	dbw 23, SCREECH
	dbw 29, LEAF_BLADE
	dbw 35, AGILITY
	dbw 43, SLAM
	dbw 51, DETECT
	dbw 59, FALSE_SWIPE
	dbw 67, LEAF_STORM
	db 0 ; no more level-up moves
	
TorchicEvosAttacks:
	dbbw EVOLVE_LEVEL, 16, COMBUSKEN
	db 0 ; no more evolutions
	dbw 1, GROWL
	dbw 1, SCRATCH
	dbw 7, FOCUS_ENERGY
	dbw 10, EMBER
	dbw 16, PECK
	dbw 19, SAND_ATTACK
	dbw 25, FIRE_SPIN
	dbw 28, QUICK_ATTACK
	dbw 34, SLASH
	dbw 37, MIRROR_MOVE
	dbw 43, FLAMETHROWER
	db 0 ; no more level-up moves

CombuskenEvosAttacks:
	dbbw EVOLVE_LEVEL, 36, BLAZIKEN
	db 0 ; no more evolutions
	dbw 1, EMBER
	dbw 1, FOCUS_ENERGY
	dbw 1, GROWL
	dbw 1, SCRATCH
	dbw 7, FOCUS_ENERGY
	dbw 13, EMBER
	dbw 16, DOUBLE_KICK
	dbw 17, PECK
	dbw 21, SAND_ATTACK
	dbw 28, BULK_UP
	dbw 32, QUICK_ATTACK
	dbw 39, SLASH
	dbw 43, MIRROR_MOVE
	dbw 50, SKY_UPPERCUT
	dbw 54, FLARE_BLITZ
	db 0 ; no more level-up moves
	
BlazikenEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, EMBER
	dbw 1, FIRE_PUNCH
	dbw 1, FOCUS_ENERGY
	dbw 1, GROWL
	dbw 1, SCRATCH
	dbw 7, FOCUS_ENERGY
	dbw 13, EMBER
	dbw 16, DOUBLE_KICK
	dbw 17, PECK
	dbw 21, SAND_ATTACK
	dbw 28, BULK_UP
	dbw 32, QUICK_ATTACK
	dbw 36, BLAZE_KICK
	dbw 42, SLASH
	dbw 49, BRAVE_BIRD
	dbw 59, SKY_UPPERCUT
	dbw 66, FLARE_BLITZ
	db 0 ; no more level-up moves

MudkipEvosAttacks:
	dbbw EVOLVE_LEVEL, 16, MARSHTOMP
	db 0 ; no more evolutions
	dbw 1, GROWL
	dbw 1, TACKLE
	dbw 6, MUD_SLAP
	dbw 10, WATER_GUN
	dbw 15, BIDE
	dbw 19, FORESIGHT
	dbw 24, MUD_SPORT
	dbw 28, TAKE_DOWN
	dbw 33, WHIRLPOOL
	dbw 37, PROTECT
	dbw 42, HYDRO_PUMP
	dbw 46, ENDEAVOR
	db 0 ; no more level-up moves
	
MarshtompEvosAttacks:
	dbbw EVOLVE_LEVEL, 36, SWAMPERT
	db 0 ; no more evolutions
	dbw 1, GROWL
	dbw 1, MUD_SLAP
	dbw 1, TACKLE
	dbw 1, WATER_GUN
	dbw 6, MUD_SLAP
	dbw 10, WATER_GUN
	dbw 15, BIDE
	dbw 16, MUD_SHOT
	dbw 20, FORESIGHT
	dbw 25, MUD_BOMB
	dbw 31, TAKE_DOWN
	dbw 37, MUDDY_WATER
	dbw 42, PROTECT
	dbw 46, EARTHQUAKE
	dbw 53, ENDEAVOR
	db 0 ; no more level-up moves
	
SwampertEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, GROWL
	dbw 1, MUD_SLAP
	dbw 1, TACKLE
	dbw 1, WATER_GUN
	dbw 6, MUD_SLAP
	dbw 10, WATER_GUN
	dbw 15, BIDE
	dbw 16, MUD_SHOT
	dbw 20, FORESIGHT
	dbw 25, MUD_BOMB
	dbw 31, TAKE_DOWN
	dbw 39, MUDDY_WATER
	dbw 46, PROTECT
	dbw 52, EARTHQUAKE
	dbw 61, ENDEAVOR
	dbw 69, HAMMER_ARM
	db 0 ; no more level-up moves

PoochyenaEvosAttacks:
	dbbw EVOLVE_LEVEL, 18, MIGHTYENA
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 5, HOWL
	dbw 9, SAND_ATTACK
	dbw 13, BITE
	dbw 17, ODOR_SLEUTH
	dbw 21, ROAR
	dbw 25, SWAGGER
	dbw 29, ASSURANCE
	dbw 33, SCARY_FACE
	dbw 37, TAUNT
	dbw 41, EMBARGO
	dbw 45, TAKE_DOWN
	dbw 49, SUCKER_PUNCH
	dbw 53, CRUNCH
	db 0 ; no more level-up moves

MightyenaEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, BITE
	dbw 1, HOWL
	dbw 1, SAND_ATTACK
	dbw 1, TACKLE
	dbw 5, HOWL
	dbw 9, SAND_ATTACK
	dbw 13, BITE
	dbw 17, ODOR_SLEUTH
	dbw 22, ROAR
	dbw 27, SWAGGER
	dbw 32, ASSURANCE
	dbw 37, SCARY_FACE
	dbw 42, TAUNT
	dbw 47, EMBARGO
	dbw 52, TAKE_DOWN
	dbw 57, THIEF
	dbw 62, SUCKER_PUNCH
	db 0 ; no more level-up moves

ZigzagoonEvosAttacks:
	dbbw EVOLVE_LEVEL, 20, LINOONE
	db 0 ; no more evolutions
	dbw 1, GROWL
	dbw 1, TACKLE
	dbw 5, TAIL_WHIP
	dbw 9, HEADBUTT
	dbw 13, SAND_ATTACK
	dbw 17, ODOR_SLEUTH
	dbw 21, MUD_SPORT
	dbw 25, PIN_MISSILE
	dbw 29, COVET
	dbw 33, FLAIL
	dbw 37, REST
	dbw 41, BELLY_DRUM
	dbw 45, FLING
	db 0 ; no more level-up moves

LinooneEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, GROWL
	dbw 1, HEADBUTT
	dbw 1, SWITCHEROO
	dbw 1, TACKLE
	dbw 1, TAIL_WHIP
	dbw 5, TAIL_WHIP
	dbw 9, HEADBUTT
	dbw 13, SAND_ATTACK
	dbw 17, ODOR_SLEUTH
	dbw 23, MUD_SPORT
	dbw 29, FURY_SWIPES
	dbw 35, COVET
	dbw 41, SLASH
	dbw 47, REST
	dbw 53, BELLY_DRUM
	dbw 59, FLING
	db 0 ; no more level-up moves

WurmpleEvosAttacks:
	dbbw EVOLVE_LEVEL, 7, SILCOON
	dbbw EVOLVE_ITEM, MOON_STONE, CASCOON
	db 0 ; no more evolutions
	dbw 1, STRING_SHOT
	dbw 1, TACKLE
	dbw 5, POISON_STING
	dbw 15, BUG_BITE
	db 0 ; no more level-up moves

SilcoonEvosAttacks:
	dbbw EVOLVE_LEVEL, 10, BEAUTIFLY
	db 0 ; no more evolutions
	dbw 1, HARDEN
	dbw 7, HARDEN
	db 0 ; no more level-up moves

BeautiflyEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, ABSORB
	dbw 10, ABSORB
	dbw 13, GUST
	dbw 17, STUN_SPORE
	dbw 20, MORNING_SUN
	dbw 24, MEGA_DRAIN
	dbw 27, WHIRLWIND
	dbw 31, ATTRACT
	dbw 34, SILVER_WIND
	dbw 38, GIGA_DRAIN
	dbw 41, BUG_BUZZ
	db 0 ; no more level-up moves
	
CascoonEvosAttacks:
	dbbw EVOLVE_LEVEL, 10, DUSTOX
	db 0 ; no more evolutions
	dbw 1, HARDEN
	dbw 7, HARDEN
	db 0 ; no more level-up moves
	
DustoxEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, CONFUSION
	dbw 10, CONFUSION
	dbw 13, GUST
	dbw 17, PROTECT
	dbw 20, MOONLIGHT
	dbw 24, PSYBEAM
	dbw 27, WHIRLWIND
	dbw 31, LIGHT_SCREEN
	dbw 34, SILVER_WIND
	dbw 38, TOXIC
	dbw 41, BUG_BUZZ
	db 0 ; no more level-up moves
	
LotadEvosAttacks:
	dbbw EVOLVE_LEVEL, 14, LOMBRE
	db 0 ; no more evolutions
	dbw 1, ASTONISH
	dbw 3, GROWL
	dbw 5, ABSORB
	dbw 7, NATURE_POWER
	dbw 11, MIST
	dbw 15, NATURAL_GIFT
	dbw 19, MEGA_DRAIN
	dbw 25, BUBBLEBEAM
	dbw 31, ZEN_HEADBUTT
	dbw 37, RAIN_DANCE
	dbw 45, ENERGY_BALL
	db 0 ; no more level-up moves
	
LombreEvosAttacks:
	dbbw EVOLVE_ITEM, WATER_STONE, LUDICOLO
	db 0 ; no more evolutions
	dbw 1, ASTONISH
	dbw 3, GROWL
	dbw 5, ABSORB
	dbw 7, NATURE_POWER
	dbw 11, FAKE_OUT
	dbw 15, FURY_SWIPES
	dbw 19, WATER_SPORT
	dbw 25, BUBBLEBEAM
	dbw 31, ZEN_HEADBUTT
	dbw 37, UPROAR
	dbw 45, HYDRO_PUMP
	db 0 ; no more level-up moves

LudicoloEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, ASTONISH
	dbw 1, GROWL
	dbw 1, MEGA_DRAIN
	dbw 1, NATURE_POWER
	db 0 ; no more level-up moves
	
SeedotEvosAttacks:
	dbbw EVOLVE_LEVEL, 14, NUZLEAF
	db 0 ; no more evolutions
	dbw 1, BIDE
	dbw 3, HARDEN
	dbw 7, GROWTH
	dbw 13, NATURE_POWER
	dbw 21, SYNTHESIS
	dbw 31, SUNNY_DAY
	dbw 43, EXPLOSION
	db 0 ; no more level-up moves
	
NuzleafEvosAttacks:
	dbbw EVOLVE_ITEM, LEAF_STONE, SHIFTRY
	db 0 ; no more evolutions
	dbw 1, POUND
	dbw 1, RAZOR_LEAF
	dbw 3, HARDEN
	dbw 7, GROWTH
	dbw 13, NATURE_POWER
	dbw 19, FAKE_OUT
	dbw 25, TORMENT
	dbw 31, FAINT_ATTACK
	dbw 37, RAZOR_WIND
	dbw 43, SWAGGER
	dbw 49, EXTRASENSORY
	db 0 ; no more level-up moves
	
ShiftryEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, FAINT_ATTACK
	dbw 1, NASTY_PLOT
	dbw 1, RAZOR_LEAF
	dbw 1, WHIRLWIND
	dbw 49, LEAF_STORM
	db 0 ; no more level-up moves
	
TaillowEvosAttacks:
	dbbw EVOLVE_LEVEL, 22, SWELLOW
	db 0 ; no more evolutions
	dbw 1, GROWL
	dbw 1, PECK
	dbw 4, FOCUS_ENERGY
	dbw 8, QUICK_ATTACK
	dbw 13, WING_ATTACK
	dbw 19, DOUBLE_TEAM
	dbw 26, ENDEAVOR
	dbw 34, AERIAL_ACE
	dbw 43, AGILITY
	dbw 53, AIR_SLASH
	db 0 ; no more level-up moves
	
SwellowEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, FOCUS_ENERGY
	dbw 1, GROWL
	dbw 1, PECK
	dbw 1, PLUCK
	dbw 1, QUICK_ATTACK
	dbw 4, FOCUS_ENERGY
	dbw 8, QUICK_ATTACK
	dbw 13, WING_ATTACK
	dbw 19, DOUBLE_TEAM
	dbw 28, ENDEAVOR
	dbw 38, AERIAL_ACE
	dbw 49, AGILITY
	dbw 61, AIR_SLASH 
	db 0 ; no more level-up moves
	
WingullEvosAttacks:
	dbbw EVOLVE_LEVEL, 25, PELIPPER
	db 0 ; no more evolutions
	dbw 1, GROWL
	dbw 1, WATER_GUN
	dbw 6, SUPERSONIC
	dbw 11, WING_ATTACK
	dbw 16, MIST
	dbw 19, WATER_PULSE
	dbw 24, QUICK_ATTACK
	dbw 29, ROOST
	dbw 34, PURSUIT
	dbw 37, AGILITY
	dbw 42, AERIAL_ACE
	dbw 47, AIR_SLASH
	db 0 ; no more level-up moves
	
PelipperEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, GROWL
	dbw 1, WATER_GUN
	dbw 1, WATER_SPORT
	dbw 1, WING_ATTACK
	dbw 6, SUPERSONIC
	dbw 11, WING_ATTACK
	dbw 16, MIST
	dbw 19, WATER_PULSE
	dbw 24, PAYBACK
	dbw 25, PROTECT
	dbw 31, ROOST
	dbw 38, SPIT_UP
	dbw 38, STOCKPILE
	dbw 38, SWALLOW
	dbw 43, FLING
	dbw 50, TAILWIND
	dbw 57, HYDRO_PUMP
	db 0 ; no more level-up moves
	
RaltsEvosAttacks:
	dbbw EVOLVE_LEVEL, 20, KIRLIA
	db 0 ; no more evolutions
	dbw 1, GROWL
	dbw 6, CONFUSION
	dbw 10, DOUBLE_TEAM
	dbw 12, TELEPORT
	dbw 17, LUCKY_CHANT
	dbw 21, MAGICAL_LEAF
	dbw 23, CALM_MIND
	dbw 28, PSYCHIC
	dbw 32, IMPRISON
	dbw 34, FUTURE_SIGHT
	dbw 39, CHARM
	dbw 43, HYPNOSIS
	dbw 45, DREAM_EATER
	db 0 ; no more level-up moves
	
KirliaEvosAttacks:
	dbbw EVOLVE_LEVEL, 30, GARDEVOIR
	db 0 ; no more evolutions
	dbw 1, CONFUSION
	dbw 1, DOUBLE_TEAM
	dbw 1, GROWL
	dbw 1, TELEPORT
	dbw 6, CONFUSION
	dbw 10, DOUBLE_TEAM
	dbw 12, TELEPORT
	dbw 17, LUCKY_CHANT
	dbw 22, MAGICAL_LEAF
	dbw 25, CALM_MIND
	dbw 31, PSYCHIC_M
	dbw 36, IMPRISON
	dbw 39, FUTURE_SIGHT
	dbw 45, CHARM
	dbw 50, HYPNOSIS
	dbw 53, DREAM_EATER
	db 0 ; no more level-up moves
	
GardevoirEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, CONFUSION
	dbw 1, DOUBLE_TEAM
	dbw 1, GROWL
	dbw 1, HEALING_WISH
	dbw 1, TELEPORT
	dbw 6, CONFUSION
	dbw 10, DOUBLE_TEAM
	dbw 12, TELEPORT
	dbw 17, WISH
	dbw 22, MAGICAL_LEAF
	dbw 25, CALM_MIND
	dbw 33, PSYCHIC_M
	dbw 40, IMPRISON
	dbw 45, FUTURE_SIGHT
	dbw 53, CAPTIVATE
	dbw 60, HYPNOSIS
	dbw 65, DREAM_EATER
	db 0 ; no more level-up moves
	
SurskitEvosAttacks:
	dbbw EVOLVE_LEVEL, 22, MASQUERAIN
	db 0 ; no more evolutions
	dbw 1, BUBBLE
	dbw 7, QUICK_ATTACK
	dbw 13, SWEET_SCENT
	dbw 19, WATER_SPORT
	dbw 25, BUBBLEBEAM
	dbw 31, AGILITY
	dbw 37, HAZE
	dbw 37, MIST
	dbw 43, BATON_PASS
	db 0 ; no more level-up moves
	
MasquerainEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, BUBBLE
	dbw 1, OMINOUS_WIND
	dbw 1, QUICK_ATTACK
	dbw 1, SWEET_SCENT
	dbw 1, WATER_SPORT
	dbw 7, QUICK_ATTACK
	dbw 13, SWEET_SCENT
	dbw 19, WATER_SPORT
	dbw 22, GUST
	dbw 26, SCARY_FACE
	dbw 33, STUN_SPORE
	dbw 40, SILVER_WIND
	dbw 47, AIR_SLASH
	dbw 54, WHIRLWIND
	dbw 61, BUG_BUZZ
	db 0 ; no more level-up moves
	
ShroomishEvosAttacks:
	dbbw EVOLVE_LEVEL, 23, BRELOOM
	db 0 ; no more evolutions
	dbw 1, ABSORB
	dbw 5, TACKLE
	dbw 9, STUN_SPORE
	dbw 13, LEECH_SEED
	dbw 17, MEGA_DRAIN
	dbw 21, HEADBUTT
	dbw 25, POISONPOWDER
	dbw 29, WORRY_SEED
	dbw 33, GROWTH
	dbw 37, GIGA_DRAIN
	dbw 41, SEED_BOMB
	dbw 45, SPORE
	db 0 ; no more level-up moves
	
BreloomEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, ABSORB
	dbw 1, LEECH_SEED
	dbw 1, STUN_SPORE
	dbw 1, TACKLE
	dbw 5, TACKLE
	dbw 9, STUN_SPORE
	dbw 13, LEECH_SEED
	dbw 17, MEGA_DRAIN
	dbw 21, HEADBUTT
	dbw 23, MACH_PUNCH
	dbw 25, COUNTER
	dbw 29, FORCE_PALM
	dbw 33, SKY_UPPERCUT
	dbw 37, MIND_READER
	dbw 41, SEED_BOMB
	dbw 45, DYNAMICPUNCH
	db 0 ; no more level-up moves
	
SlakothEvosAttacks:
	db 0 ; no more evolutions
	db 0 ; no more level-up moves
	
VigorothEvosAttacks:
	db 0 ; no more evolutions
	db 0 ; no more level-up moves
	
SlakingEvosAttacks:
	db 0 ; no more evolutions
	db 0 ; no more level-up moves
	
NincadaEvosAttacks:
NinjaskEvosAttacks:
ShedinjaEvosAttacks:
WhismurEvosAttacks:
LoudredEvosAttacks:
ExploudEvosAttacks:
MakuhitaEvosAttacks:
HariyamaEvosAttacks:
AzurillEvosAttacks:
NosepassEvosAttacks:
SkittyEvosAttacks:
DelcattyEvosAttacks:
SableyeEvosAttacks:
MawileEvosAttacks:
AronEvosAttacks:
LaironEvosAttacks:
AggronEvosAttacks:
MedititeEvosAttacks:
MedichamEvosAttacks:
ElectrikeEvosAttacks:
ManectricEvosAttacks:
PlusleEvosAttacks:
MinunEvosAttacks:
VolbeatEvosAttacks:
IllumiseEvosAttacks:
RoseliaEvosAttacks:
GulpinEvosAttacks:
SwalotEvosAttacks:
CarvanhaEvosAttacks:
SharpedoEvosAttacks:
WailmerEvosAttacks:
WailordEvosAttacks:
NumelEvosAttacks:
CameruptEvosAttacks:
TorkoalEvosAttacks:
SpoinkEvosAttacks:
GrumpigEvosAttacks:
SpindaEvosAttacks:
TrapinchEvosAttacks:
VibravaEvosAttacks:
FlygonEvosAttacks:
CacneaEvosAttacks:
CacturneEvosAttacks:
SwabluEvosAttacks:
AltariaEvosAttacks:
ZangooseEvosAttacks:
SeviperEvosAttacks:
LunatoneEvosAttacks:
SolrockEvosAttacks:
BarboachEvosAttacks:
WhiscashEvosAttacks:
CorphishEvosAttacks:
CrawdauntEvosAttacks:
BaltoyEvosAttacks:
ClaydolEvosAttacks:
LileepEvosAttacks:
CradilyEvosAttacks:
AnorithEvosAttacks:
ArmaldoEvosAttacks:
FeebasEvosAttacks:
MiloticEvosAttacks:
CastformEvosAttacks:
KecleonEvosAttacks:
ShuppetEvosAttacks:
BanetteEvosAttacks:
DuskullEvosAttacks:
DusclopsEvosAttacks:
TropiusEvosAttacks:
ChimechoEvosAttacks:
AbsolEvosAttacks:
WynautEvosAttacks:
SnoruntEvosAttacks:
GlalieEvosAttacks:
SphealEvosAttacks:
SealeoEvosAttacks:
WalreinEvosAttacks:
ClamperlEvosAttacks:
HuntailEvosAttacks:
GorebyssEvosAttacks:
RelicanthEvosAttacks:
LuvdiscEvosAttacks:
BagonEvosAttacks:
ShelgonEvosAttacks:
SalamenceEvosAttacks:
BeldumEvosAttacks:
MetangEvosAttacks:
MetagrossEvosAttacks:
RegirockEvosAttacks:
RegiceEvosAttacks:
RegisteelEvosAttacks:
LatiasEvosAttacks:
LatiosEvosAttacks:
KyogreEvosAttacks:
GroudonEvosAttacks:
RayquazaEvosAttacks:
JirachiEvosAttacks:
DeoxysEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, SPLASH
	db 0 ; no more level-up moves
