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
SilcoonEvosAttacks:
BeautiflyEvosAttacks:
CascoonEvosAttacks:
DustoxEvosAttacks:
LotadEvosAttacks:
LombreEvosAttacks:
LudicoloEvosAttacks:
SeedotEvosAttacks:
NuzleafEvosAttacks:
ShiftryEvosAttacks:
TaillowEvosAttacks:
SwellowEvosAttacks:
WingullEvosAttacks:
PelipperEvosAttacks:
RaltsEvosAttacks:
KirliaEvosAttacks:
GardevoirEvosAttacks:
SurskitEvosAttacks:
MasquerainEvosAttacks:
ShroomishEvosAttacks:
BreloomEvosAttacks:
SlakothEvosAttacks:
VigorothEvosAttacks:
SlakingEvosAttacks:
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
