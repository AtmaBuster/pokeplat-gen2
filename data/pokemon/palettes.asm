; Eggs are negative now
INCBIN "gfx/pokemon/egg/front.gbcpal", middle_colors
INCLUDE "gfx/pokemon/egg/shiny.pal"

; -2
	RGB 30, 26, 11
	RGB 23, 16, 00
; -2 shiny
	RGB 30, 26, 11
	RGB 23, 16, 00

; -1
	RGB 23, 23, 23
	RGB 17, 17, 17
; -1 shiny
	RGB 23, 23, 23
	RGB 17, 17, 17

PokemonPalettes:
; entries correspond to Pokémon species, two apiece

; Each front.gbcpal is generated from the corresponding .png, and
; only the middle two colors are included, not black or white.
; Shiny palettes are defined directly, not generated.

; 000
	RGB 30, 22, 17
	RGB 16, 14, 19
; 000 shiny
	RGB 30, 22, 17
	RGB 16, 14, 19

BulbasaurPal:       INCBIN "gfx/pokemon/bulbasaur/front.gbcpal", middle_colors
BulbasaurShinyPal:  INCLUDE "gfx/pokemon/bulbasaur/shiny.pal"
IvysaurPal:         INCBIN "gfx/pokemon/ivysaur/front.gbcpal", middle_colors
IvysaurShinyPal:    INCLUDE "gfx/pokemon/ivysaur/shiny.pal"
VenusaurPal:        INCBIN "gfx/pokemon/venusaur/front.gbcpal", middle_colors
VenusaurShinyPal:   INCLUDE "gfx/pokemon/venusaur/shiny.pal"
CharmanderPal:      INCBIN "gfx/pokemon/charmander/front.gbcpal", middle_colors
CharmanderShinyPal: INCLUDE "gfx/pokemon/charmander/shiny.pal"
CharmeleonPal:      INCBIN "gfx/pokemon/charmeleon/front.gbcpal", middle_colors
CharmeleonShinyPal: INCLUDE "gfx/pokemon/charmeleon/shiny.pal"
CharizardPal:       INCBIN "gfx/pokemon/charizard/front.gbcpal", middle_colors
CharizardShinyPal:  INCLUDE "gfx/pokemon/charizard/shiny.pal"
SquirtlePal:        INCBIN "gfx/pokemon/squirtle/front.gbcpal", middle_colors
SquirtleShinyPal:   INCLUDE "gfx/pokemon/squirtle/shiny.pal"
WartortlePal:       INCBIN "gfx/pokemon/wartortle/front.gbcpal", middle_colors
WartortleShinyPal:  INCLUDE "gfx/pokemon/wartortle/shiny.pal"
BlastoisePal:       INCBIN "gfx/pokemon/blastoise/front.gbcpal", middle_colors
BlastoiseShinyPal:  INCLUDE "gfx/pokemon/blastoise/shiny.pal"
CaterpiePal:        INCBIN "gfx/pokemon/caterpie/front.gbcpal", middle_colors
CaterpieShinyPal:   INCLUDE "gfx/pokemon/caterpie/shiny.pal"
MetapodPal:         INCBIN "gfx/pokemon/metapod/front.gbcpal", middle_colors
MetapodShinyPal:    INCLUDE "gfx/pokemon/metapod/shiny.pal"
ButterfreePal:      INCBIN "gfx/pokemon/butterfree/front.gbcpal", middle_colors
ButterfreeShinyPal: INCLUDE "gfx/pokemon/butterfree/shiny.pal"
WeedlePal:          INCBIN "gfx/pokemon/weedle/front.gbcpal", middle_colors
WeedleShinyPal:     INCLUDE "gfx/pokemon/weedle/shiny.pal"
KakunaPal:          INCBIN "gfx/pokemon/kakuna/front.gbcpal", middle_colors
KakunaShinyPal:     INCLUDE "gfx/pokemon/kakuna/shiny.pal"
BeedrillPal:        INCBIN "gfx/pokemon/beedrill/front.gbcpal", middle_colors
BeedrillShinyPal:   INCLUDE "gfx/pokemon/beedrill/shiny.pal"
PidgeyPal:          INCBIN "gfx/pokemon/pidgey/front.gbcpal", middle_colors
PidgeyShinyPal:     INCLUDE "gfx/pokemon/pidgey/shiny.pal"
PidgeottoPal:       INCBIN "gfx/pokemon/pidgeotto/front.gbcpal", middle_colors
PidgeottoShinyPal:  INCLUDE "gfx/pokemon/pidgeotto/shiny.pal"
PidgeotPal:         INCBIN "gfx/pokemon/pidgeot/front.gbcpal", middle_colors
PidgeotShinyPal:    INCLUDE "gfx/pokemon/pidgeot/shiny.pal"
RattataPal:         INCBIN "gfx/pokemon/rattata/front.gbcpal", middle_colors
RattataShinyPal:    INCLUDE "gfx/pokemon/rattata/shiny.pal"
RaticatePal:        INCBIN "gfx/pokemon/raticate/front.gbcpal", middle_colors
RaticateShinyPal:   INCLUDE "gfx/pokemon/raticate/shiny.pal"
SpearowPal:         INCBIN "gfx/pokemon/spearow/front.gbcpal", middle_colors
SpearowShinyPal:    INCLUDE "gfx/pokemon/spearow/shiny.pal"
FearowPal:          INCBIN "gfx/pokemon/fearow/front.gbcpal", middle_colors
FearowShinyPal:     INCLUDE "gfx/pokemon/fearow/shiny.pal"
EkansPal:           INCBIN "gfx/pokemon/ekans/front.gbcpal", middle_colors
EkansShinyPal:      INCLUDE "gfx/pokemon/ekans/shiny.pal"
ArbokPal:           INCBIN "gfx/pokemon/arbok/front.gbcpal", middle_colors
ArbokShinyPal:      INCLUDE "gfx/pokemon/arbok/shiny.pal"
PikachuPal:         INCBIN "gfx/pokemon/pikachu/front.gbcpal", middle_colors
PikachuShinyPal:    INCLUDE "gfx/pokemon/pikachu/shiny.pal"
RaichuPal:          INCBIN "gfx/pokemon/raichu/front.gbcpal", middle_colors
RaichuShinyPal:     INCLUDE "gfx/pokemon/raichu/shiny.pal"
SandshrewPal:       INCBIN "gfx/pokemon/sandshrew/front.gbcpal", middle_colors
SandshrewShinyPal:  INCLUDE "gfx/pokemon/sandshrew/shiny.pal"
SandslashPal:       INCBIN "gfx/pokemon/sandslash/front.gbcpal", middle_colors
SandslashShinyPal:  INCLUDE "gfx/pokemon/sandslash/shiny.pal"
NidoranFPal:        INCBIN "gfx/pokemon/nidoran_f/front.gbcpal", middle_colors
NidoranFShinyPal:   INCLUDE "gfx/pokemon/nidoran_f/shiny.pal"
NidorinaPal:        INCBIN "gfx/pokemon/nidorina/front.gbcpal", middle_colors
NidorinaShinyPal:   INCLUDE "gfx/pokemon/nidorina/shiny.pal"
NidoqueenPal:       INCBIN "gfx/pokemon/nidoqueen/front.gbcpal", middle_colors
NidoqueenShinyPal:  INCLUDE "gfx/pokemon/nidoqueen/shiny.pal"
NidoranMPal:        INCBIN "gfx/pokemon/nidoran_m/front.gbcpal", middle_colors
NidoranMShinyPal:   INCLUDE "gfx/pokemon/nidoran_m/shiny.pal"
NidorinoPal:        INCBIN "gfx/pokemon/nidorino/front.gbcpal", middle_colors
NidorinoShinyPal:   INCLUDE "gfx/pokemon/nidorino/shiny.pal"
NidokingPal:        INCBIN "gfx/pokemon/nidoking/front.gbcpal", middle_colors
NidokingShinyPal:   INCLUDE "gfx/pokemon/nidoking/shiny.pal"
ClefairyPal:        INCBIN "gfx/pokemon/clefairy/front.gbcpal", middle_colors
ClefairyShinyPal:   INCLUDE "gfx/pokemon/clefairy/shiny.pal"
ClefablePal:        INCBIN "gfx/pokemon/clefable/front.gbcpal", middle_colors
ClefableShinyPal:   INCLUDE "gfx/pokemon/clefable/shiny.pal"
VulpixPal:          INCBIN "gfx/pokemon/vulpix/front.gbcpal", middle_colors
VulpixShinyPal:     INCLUDE "gfx/pokemon/vulpix/shiny.pal"
NinetalesPal:       INCBIN "gfx/pokemon/ninetales/front.gbcpal", middle_colors
NinetalesShinyPal:  INCLUDE "gfx/pokemon/ninetales/shiny.pal"
JigglypuffPal:      INCBIN "gfx/pokemon/jigglypuff/front.gbcpal", middle_colors
JigglypuffShinyPal: INCLUDE "gfx/pokemon/jigglypuff/shiny.pal"
WigglytuffPal:      INCBIN "gfx/pokemon/wigglytuff/front.gbcpal", middle_colors
WigglytuffShinyPal: INCLUDE "gfx/pokemon/wigglytuff/shiny.pal"
ZubatPal:           INCBIN "gfx/pokemon/zubat/front.gbcpal", middle_colors
ZubatShinyPal:      INCLUDE "gfx/pokemon/zubat/shiny.pal"
GolbatPal:          INCBIN "gfx/pokemon/golbat/front.gbcpal", middle_colors
GolbatShinyPal:     INCLUDE "gfx/pokemon/golbat/shiny.pal"
OddishPal:          INCBIN "gfx/pokemon/oddish/front.gbcpal", middle_colors
OddishShinyPal:     INCLUDE "gfx/pokemon/oddish/shiny.pal"
GloomPal:           INCBIN "gfx/pokemon/gloom/front.gbcpal", middle_colors
GloomShinyPal:      INCLUDE "gfx/pokemon/gloom/shiny.pal"
VileplumePal:       INCBIN "gfx/pokemon/vileplume/front.gbcpal", middle_colors
VileplumeShinyPal:  INCLUDE "gfx/pokemon/vileplume/shiny.pal"
ParasPal:           INCBIN "gfx/pokemon/paras/front.gbcpal", middle_colors
ParasShinyPal:      INCLUDE "gfx/pokemon/paras/shiny.pal"
ParasectPal:        INCBIN "gfx/pokemon/parasect/front.gbcpal", middle_colors
ParasectShinyPal:   INCLUDE "gfx/pokemon/parasect/shiny.pal"
VenonatPal:         INCBIN "gfx/pokemon/venonat/front.gbcpal", middle_colors
VenonatShinyPal:    INCLUDE "gfx/pokemon/venonat/shiny.pal"
VenomothPal:        INCBIN "gfx/pokemon/venomoth/front.gbcpal", middle_colors
VenomothShinyPal:   INCLUDE "gfx/pokemon/venomoth/shiny.pal"
DiglettPal:         INCBIN "gfx/pokemon/diglett/front.gbcpal", middle_colors
DiglettShinyPal:    INCLUDE "gfx/pokemon/diglett/shiny.pal"
DugtrioPal:         INCBIN "gfx/pokemon/dugtrio/front.gbcpal", middle_colors
DugtrioShinyPal:    INCLUDE "gfx/pokemon/dugtrio/shiny.pal"
MeowthPal:          INCBIN "gfx/pokemon/meowth/front.gbcpal", middle_colors
MeowthShinyPal:     INCLUDE "gfx/pokemon/meowth/shiny.pal"
PersianPal:         INCBIN "gfx/pokemon/persian/front.gbcpal", middle_colors
PersianShinyPal:    INCLUDE "gfx/pokemon/persian/shiny.pal"
PsyduckPal:         INCBIN "gfx/pokemon/psyduck/front.gbcpal", middle_colors
PsyduckShinyPal:    INCLUDE "gfx/pokemon/psyduck/shiny.pal"
GolduckPal:         INCBIN "gfx/pokemon/golduck/front.gbcpal", middle_colors
GolduckShinyPal:    INCLUDE "gfx/pokemon/golduck/shiny.pal"
MankeyPal:          INCBIN "gfx/pokemon/mankey/front.gbcpal", middle_colors
MankeyShinyPal:     INCLUDE "gfx/pokemon/mankey/shiny.pal"
PrimeapePal:        INCBIN "gfx/pokemon/primeape/front.gbcpal", middle_colors
PrimeapeShinyPal:   INCLUDE "gfx/pokemon/primeape/shiny.pal"
GrowlithePal:       INCBIN "gfx/pokemon/growlithe/front.gbcpal", middle_colors
GrowlitheShinyPal:  INCLUDE "gfx/pokemon/growlithe/shiny.pal"
ArcaninePal:        INCBIN "gfx/pokemon/arcanine/front.gbcpal", middle_colors
ArcanineShinyPal:   INCLUDE "gfx/pokemon/arcanine/shiny.pal"
PoliwagPal:         INCBIN "gfx/pokemon/poliwag/front.gbcpal", middle_colors
PoliwagShinyPal:    INCLUDE "gfx/pokemon/poliwag/shiny.pal"
PoliwhirlPal:       INCBIN "gfx/pokemon/poliwhirl/front.gbcpal", middle_colors
PoliwhirlShinyPal:  INCLUDE "gfx/pokemon/poliwhirl/shiny.pal"
PoliwrathPal:       INCBIN "gfx/pokemon/poliwrath/front.gbcpal", middle_colors
PoliwrathShinyPal:  INCLUDE "gfx/pokemon/poliwrath/shiny.pal"
AbraPal:            INCBIN "gfx/pokemon/abra/front.gbcpal", middle_colors
AbraShinyPal:       INCLUDE "gfx/pokemon/abra/shiny.pal"
KadabraPal:         INCBIN "gfx/pokemon/kadabra/front.gbcpal", middle_colors
KadabraShinyPal:    INCLUDE "gfx/pokemon/kadabra/shiny.pal"
AlakazamPal:        INCBIN "gfx/pokemon/alakazam/front.gbcpal", middle_colors
AlakazamShinyPal:   INCLUDE "gfx/pokemon/alakazam/shiny.pal"
MachopPal:          INCBIN "gfx/pokemon/machop/front.gbcpal", middle_colors
MachopShinyPal:     INCLUDE "gfx/pokemon/machop/shiny.pal"
MachokePal:         INCBIN "gfx/pokemon/machoke/front.gbcpal", middle_colors
MachokeShinyPal:    INCLUDE "gfx/pokemon/machoke/shiny.pal"
MachampPal:         INCBIN "gfx/pokemon/machamp/front.gbcpal", middle_colors
MachampShinyPal:    INCLUDE "gfx/pokemon/machamp/shiny.pal"
BellsproutPal:      INCBIN "gfx/pokemon/bellsprout/front.gbcpal", middle_colors
BellsproutShinyPal: INCLUDE "gfx/pokemon/bellsprout/shiny.pal"
WeepinbellPal:      INCBIN "gfx/pokemon/weepinbell/front.gbcpal", middle_colors
WeepinbellShinyPal: INCLUDE "gfx/pokemon/weepinbell/shiny.pal"
VictreebelPal:      INCBIN "gfx/pokemon/victreebel/front.gbcpal", middle_colors
VictreebelShinyPal: INCLUDE "gfx/pokemon/victreebel/shiny.pal"
TentacoolPal:       INCBIN "gfx/pokemon/tentacool/front.gbcpal", middle_colors
TentacoolShinyPal:  INCLUDE "gfx/pokemon/tentacool/shiny.pal"
TentacruelPal:      INCBIN "gfx/pokemon/tentacruel/front.gbcpal", middle_colors
TentacruelShinyPal: INCLUDE "gfx/pokemon/tentacruel/shiny.pal"
GeodudePal:         INCBIN "gfx/pokemon/geodude/front.gbcpal", middle_colors
GeodudeShinyPal:    INCLUDE "gfx/pokemon/geodude/shiny.pal"
GravelerPal:        INCBIN "gfx/pokemon/graveler/front.gbcpal", middle_colors
GravelerShinyPal:   INCLUDE "gfx/pokemon/graveler/shiny.pal"
GolemPal:           INCBIN "gfx/pokemon/golem/front.gbcpal", middle_colors
GolemShinyPal:      INCLUDE "gfx/pokemon/golem/shiny.pal"
PonytaPal:          INCBIN "gfx/pokemon/ponyta/front.gbcpal", middle_colors
PonytaShinyPal:     INCLUDE "gfx/pokemon/ponyta/shiny.pal"
RapidashPal:        INCBIN "gfx/pokemon/rapidash/front.gbcpal", middle_colors
RapidashShinyPal:   INCLUDE "gfx/pokemon/rapidash/shiny.pal"
SlowpokePal:        INCBIN "gfx/pokemon/slowpoke/front.gbcpal", middle_colors
SlowpokeShinyPal:   INCLUDE "gfx/pokemon/slowpoke/shiny.pal"
SlowbroPal:         INCBIN "gfx/pokemon/slowbro/front.gbcpal", middle_colors
SlowbroShinyPal:    INCLUDE "gfx/pokemon/slowbro/shiny.pal"
MagnemitePal:       INCBIN "gfx/pokemon/magnemite/front.gbcpal", middle_colors
MagnemiteShinyPal:  INCLUDE "gfx/pokemon/magnemite/shiny.pal"
MagnetonPal:        INCBIN "gfx/pokemon/magneton/front.gbcpal", middle_colors
MagnetonShinyPal:   INCLUDE "gfx/pokemon/magneton/shiny.pal"
FarfetchdPal:       INCBIN "gfx/pokemon/farfetch_d/front.gbcpal", middle_colors
FarfetchdShinyPal:  INCLUDE "gfx/pokemon/farfetch_d/shiny.pal"
DoduoPal:           INCBIN "gfx/pokemon/doduo/front.gbcpal", middle_colors
DoduoShinyPal:      INCLUDE "gfx/pokemon/doduo/shiny.pal"
DodrioPal:          INCBIN "gfx/pokemon/dodrio/front.gbcpal", middle_colors
DodrioShinyPal:     INCLUDE "gfx/pokemon/dodrio/shiny.pal"
SeelPal:            INCBIN "gfx/pokemon/seel/front.gbcpal", middle_colors
SeelShinyPal:       INCLUDE "gfx/pokemon/seel/shiny.pal"
DewgongPal:         INCBIN "gfx/pokemon/dewgong/front.gbcpal", middle_colors
DewgongShinyPal:    INCLUDE "gfx/pokemon/dewgong/shiny.pal"
GrimerPal:          INCBIN "gfx/pokemon/grimer/front.gbcpal", middle_colors
GrimerShinyPal:     INCLUDE "gfx/pokemon/grimer/shiny.pal"
MukPal:             INCBIN "gfx/pokemon/muk/front.gbcpal", middle_colors
MukShinyPal:        INCLUDE "gfx/pokemon/muk/shiny.pal"
ShellderPal:        INCBIN "gfx/pokemon/shellder/front.gbcpal", middle_colors
ShellderShinyPal:   INCLUDE "gfx/pokemon/shellder/shiny.pal"
CloysterPal:        INCBIN "gfx/pokemon/cloyster/front.gbcpal", middle_colors
CloysterShinyPal:   INCLUDE "gfx/pokemon/cloyster/shiny.pal"
GastlyPal:          INCBIN "gfx/pokemon/gastly/front.gbcpal", middle_colors
GastlyShinyPal:     INCLUDE "gfx/pokemon/gastly/shiny.pal"
HaunterPal:         INCBIN "gfx/pokemon/haunter/front.gbcpal", middle_colors
HaunterShinyPal:    INCLUDE "gfx/pokemon/haunter/shiny.pal"
GengarPal:          INCBIN "gfx/pokemon/gengar/front.gbcpal", middle_colors
GengarShinyPal:     INCLUDE "gfx/pokemon/gengar/shiny.pal"
OnixPal:            INCBIN "gfx/pokemon/onix/front.gbcpal", middle_colors
OnixShinyPal:       INCLUDE "gfx/pokemon/onix/shiny.pal"
DrowzeePal:         INCBIN "gfx/pokemon/drowzee/front.gbcpal", middle_colors
DrowzeeShinyPal:    INCLUDE "gfx/pokemon/drowzee/shiny.pal"
HypnoPal:           INCBIN "gfx/pokemon/hypno/front.gbcpal", middle_colors
HypnoShinyPal:      INCLUDE "gfx/pokemon/hypno/shiny.pal"
KrabbyPal:          INCBIN "gfx/pokemon/krabby/front.gbcpal", middle_colors
KrabbyShinyPal:     INCLUDE "gfx/pokemon/krabby/shiny.pal"
KinglerPal:         INCBIN "gfx/pokemon/kingler/front.gbcpal", middle_colors
KinglerShinyPal:    INCLUDE "gfx/pokemon/kingler/shiny.pal"
VoltorbPal:         INCBIN "gfx/pokemon/voltorb/front.gbcpal", middle_colors
VoltorbShinyPal:    INCLUDE "gfx/pokemon/voltorb/shiny.pal"
ElectrodePal:       INCBIN "gfx/pokemon/electrode/front.gbcpal", middle_colors
ElectrodeShinyPal:  INCLUDE "gfx/pokemon/electrode/shiny.pal"
ExeggcutePal:       INCBIN "gfx/pokemon/exeggcute/front.gbcpal", middle_colors
ExeggcuteShinyPal:  INCLUDE "gfx/pokemon/exeggcute/shiny.pal"
ExeggutorPal:       INCBIN "gfx/pokemon/exeggutor/front.gbcpal", middle_colors
ExeggutorShinyPal:  INCLUDE "gfx/pokemon/exeggutor/shiny.pal"
CubonePal:          INCBIN "gfx/pokemon/cubone/front.gbcpal", middle_colors
CuboneShinyPal:     INCLUDE "gfx/pokemon/cubone/shiny.pal"
MarowakPal:         INCBIN "gfx/pokemon/marowak/front.gbcpal", middle_colors
MarowakShinyPal:    INCLUDE "gfx/pokemon/marowak/shiny.pal"
HitmonleePal:       INCBIN "gfx/pokemon/hitmonlee/front.gbcpal", middle_colors
HitmonleeShinyPal:  INCLUDE "gfx/pokemon/hitmonlee/shiny.pal"
HitmonchanPal:      INCBIN "gfx/pokemon/hitmonchan/front.gbcpal", middle_colors
HitmonchanShinyPal: INCLUDE "gfx/pokemon/hitmonchan/shiny.pal"
LickitungPal:       INCBIN "gfx/pokemon/lickitung/front.gbcpal", middle_colors
LickitungShinyPal:  INCLUDE "gfx/pokemon/lickitung/shiny.pal"
KoffingPal:         INCBIN "gfx/pokemon/koffing/front.gbcpal", middle_colors
KoffingShinyPal:    INCLUDE "gfx/pokemon/koffing/shiny.pal"
WeezingPal:         INCBIN "gfx/pokemon/weezing/front.gbcpal", middle_colors
WeezingShinyPal:    INCLUDE "gfx/pokemon/weezing/shiny.pal"
RhyhornPal:         INCBIN "gfx/pokemon/rhyhorn/front.gbcpal", middle_colors
RhyhornShinyPal:    INCLUDE "gfx/pokemon/rhyhorn/shiny.pal"
RhydonPal:          INCBIN "gfx/pokemon/rhydon/front.gbcpal", middle_colors
RhydonShinyPal:     INCLUDE "gfx/pokemon/rhydon/shiny.pal"
ChanseyPal:         INCBIN "gfx/pokemon/chansey/front.gbcpal", middle_colors
ChanseyShinyPal:    INCLUDE "gfx/pokemon/chansey/shiny.pal"
TangelaPal:         INCBIN "gfx/pokemon/tangela/front.gbcpal", middle_colors
TangelaShinyPal:    INCLUDE "gfx/pokemon/tangela/shiny.pal"
KangaskhanPal:      INCBIN "gfx/pokemon/kangaskhan/front.gbcpal", middle_colors
KangaskhanShinyPal: INCLUDE "gfx/pokemon/kangaskhan/shiny.pal"
HorseaPal:          INCBIN "gfx/pokemon/horsea/front.gbcpal", middle_colors
HorseaShinyPal:     INCLUDE "gfx/pokemon/horsea/shiny.pal"
SeadraPal:          INCBIN "gfx/pokemon/seadra/front.gbcpal", middle_colors
SeadraShinyPal:     INCLUDE "gfx/pokemon/seadra/shiny.pal"
GoldeenPal:         INCBIN "gfx/pokemon/goldeen/front.gbcpal", middle_colors
GoldeenShinyPal:    INCLUDE "gfx/pokemon/goldeen/shiny.pal"
SeakingPal:         INCBIN "gfx/pokemon/seaking/front.gbcpal", middle_colors
SeakingShinyPal:    INCLUDE "gfx/pokemon/seaking/shiny.pal"
StaryuPal:          INCBIN "gfx/pokemon/staryu/front.gbcpal", middle_colors
StaryuShinyPal:     INCLUDE "gfx/pokemon/staryu/shiny.pal"
StarmiePal:         INCBIN "gfx/pokemon/starmie/front.gbcpal", middle_colors
StarmieShinyPal:    INCLUDE "gfx/pokemon/starmie/shiny.pal"
MrMimePal:          INCBIN "gfx/pokemon/mr__mime/front.gbcpal", middle_colors
MrMimeShinyPal:     INCLUDE "gfx/pokemon/mr__mime/shiny.pal"
ScytherPal:         INCBIN "gfx/pokemon/scyther/front.gbcpal", middle_colors
ScytherShinyPal:    INCLUDE "gfx/pokemon/scyther/shiny.pal"
JynxPal:            INCBIN "gfx/pokemon/jynx/front.gbcpal", middle_colors
JynxShinyPal:       INCLUDE "gfx/pokemon/jynx/shiny.pal"
ElectabuzzPal:      INCBIN "gfx/pokemon/electabuzz/front.gbcpal", middle_colors
ElectabuzzShinyPal: INCLUDE "gfx/pokemon/electabuzz/shiny.pal"
MagmarPal:          INCBIN "gfx/pokemon/magmar/front.gbcpal", middle_colors
MagmarShinyPal:     INCLUDE "gfx/pokemon/magmar/shiny.pal"
PinsirPal:          INCBIN "gfx/pokemon/pinsir/front.gbcpal", middle_colors
PinsirShinyPal:     INCLUDE "gfx/pokemon/pinsir/shiny.pal"
TaurosPal:          INCBIN "gfx/pokemon/tauros/front.gbcpal", middle_colors
TaurosShinyPal:     INCLUDE "gfx/pokemon/tauros/shiny.pal"
MagikarpPal:        INCBIN "gfx/pokemon/magikarp/front.gbcpal", middle_colors
MagikarpShinyPal:   INCLUDE "gfx/pokemon/magikarp/shiny.pal"
GyaradosPal:        INCBIN "gfx/pokemon/gyarados/front.gbcpal", middle_colors
GyaradosShinyPal:   INCLUDE "gfx/pokemon/gyarados/shiny.pal"
LaprasPal:          INCBIN "gfx/pokemon/lapras/front.gbcpal", middle_colors
LaprasShinyPal:     INCLUDE "gfx/pokemon/lapras/shiny.pal"
DittoPal:           INCBIN "gfx/pokemon/ditto/front.gbcpal", middle_colors
DittoShinyPal:      INCLUDE "gfx/pokemon/ditto/shiny.pal"
EeveePal:           INCBIN "gfx/pokemon/eevee/front.gbcpal", middle_colors
EeveeShinyPal:      INCLUDE "gfx/pokemon/eevee/shiny.pal"
VaporeonPal:        INCBIN "gfx/pokemon/vaporeon/front.gbcpal", middle_colors
VaporeonShinyPal:   INCLUDE "gfx/pokemon/vaporeon/shiny.pal"
JolteonPal:         INCBIN "gfx/pokemon/jolteon/front.gbcpal", middle_colors
JolteonShinyPal:    INCLUDE "gfx/pokemon/jolteon/shiny.pal"
FlareonPal:         INCBIN "gfx/pokemon/flareon/front.gbcpal", middle_colors
FlareonShinyPal:    INCLUDE "gfx/pokemon/flareon/shiny.pal"
PorygonPal:         INCBIN "gfx/pokemon/porygon/front.gbcpal", middle_colors
PorygonShinyPal:    INCLUDE "gfx/pokemon/porygon/shiny.pal"
OmanytePal:         INCBIN "gfx/pokemon/omanyte/front.gbcpal", middle_colors
OmanyteShinyPal:    INCLUDE "gfx/pokemon/omanyte/shiny.pal"
OmastarPal:         INCBIN "gfx/pokemon/omastar/front.gbcpal", middle_colors
OmastarShinyPal:    INCLUDE "gfx/pokemon/omastar/shiny.pal"
KabutoPal:          INCBIN "gfx/pokemon/kabuto/front.gbcpal", middle_colors
KabutoShinyPal:     INCLUDE "gfx/pokemon/kabuto/shiny.pal"
KabutopsPal:        INCBIN "gfx/pokemon/kabutops/front.gbcpal", middle_colors
KabutopsShinyPal:   INCLUDE "gfx/pokemon/kabutops/shiny.pal"
AerodactylPal:      INCBIN "gfx/pokemon/aerodactyl/front.gbcpal", middle_colors
AerodactylShinyPal: INCLUDE "gfx/pokemon/aerodactyl/shiny.pal"
SnorlaxPal:         INCBIN "gfx/pokemon/snorlax/front.gbcpal", middle_colors
SnorlaxShinyPal:    INCLUDE "gfx/pokemon/snorlax/shiny.pal"
ArticunoPal:        INCBIN "gfx/pokemon/articuno/front.gbcpal", middle_colors
ArticunoShinyPal:   INCLUDE "gfx/pokemon/articuno/shiny.pal"
ZapdosPal:          INCBIN "gfx/pokemon/zapdos/front.gbcpal", middle_colors
ZapdosShinyPal:     INCLUDE "gfx/pokemon/zapdos/shiny.pal"
MoltresPal:         INCBIN "gfx/pokemon/moltres/front.gbcpal", middle_colors
MoltresShinyPal:    INCLUDE "gfx/pokemon/moltres/shiny.pal"
DratiniPal:         INCBIN "gfx/pokemon/dratini/front.gbcpal", middle_colors
DratiniShinyPal:    INCLUDE "gfx/pokemon/dratini/shiny.pal"
DragonairPal:       INCBIN "gfx/pokemon/dragonair/front.gbcpal", middle_colors
DragonairShinyPal:  INCLUDE "gfx/pokemon/dragonair/shiny.pal"
DragonitePal:       INCBIN "gfx/pokemon/dragonite/front.gbcpal", middle_colors
DragoniteShinyPal:  INCLUDE "gfx/pokemon/dragonite/shiny.pal"
MewtwoPal:          INCBIN "gfx/pokemon/mewtwo/front.gbcpal", middle_colors
MewtwoShinyPal:     INCLUDE "gfx/pokemon/mewtwo/shiny.pal"
MewPal:             INCBIN "gfx/pokemon/mew/front.gbcpal", middle_colors
MewShinyPal:        INCLUDE "gfx/pokemon/mew/shiny.pal"
ChikoritaPal:       INCBIN "gfx/pokemon/chikorita/front.gbcpal", middle_colors
ChikoritaShinyPal:  INCLUDE "gfx/pokemon/chikorita/shiny.pal"
BayleefPal:         INCBIN "gfx/pokemon/bayleef/front.gbcpal", middle_colors
BayleefShinyPal:    INCLUDE "gfx/pokemon/bayleef/shiny.pal"
MeganiumPal:        INCBIN "gfx/pokemon/meganium/front.gbcpal", middle_colors
MeganiumShinyPal:   INCLUDE "gfx/pokemon/meganium/shiny.pal"
CyndaquilPal:       INCBIN "gfx/pokemon/cyndaquil/front.gbcpal", middle_colors
CyndaquilShinyPal:  INCLUDE "gfx/pokemon/cyndaquil/shiny.pal"
QuilavaPal:         INCBIN "gfx/pokemon/quilava/front.gbcpal", middle_colors
QuilavaShinyPal:    INCLUDE "gfx/pokemon/quilava/shiny.pal"
TyphlosionPal:      INCBIN "gfx/pokemon/typhlosion/front.gbcpal", middle_colors
TyphlosionShinyPal: INCLUDE "gfx/pokemon/typhlosion/shiny.pal"
TotodilePal:        INCBIN "gfx/pokemon/totodile/front.gbcpal", middle_colors
TotodileShinyPal:   INCLUDE "gfx/pokemon/totodile/shiny.pal"
CroconawPal:        INCBIN "gfx/pokemon/croconaw/front.gbcpal", middle_colors
CroconawShinyPal:   INCLUDE "gfx/pokemon/croconaw/shiny.pal"
FeraligatrPal:      INCBIN "gfx/pokemon/feraligatr/front.gbcpal", middle_colors
FeraligatrShinyPal: INCLUDE "gfx/pokemon/feraligatr/shiny.pal"
SentretPal:         INCBIN "gfx/pokemon/sentret/front.gbcpal", middle_colors
SentretShinyPal:    INCLUDE "gfx/pokemon/sentret/shiny.pal"
FurretPal:          INCBIN "gfx/pokemon/furret/front.gbcpal", middle_colors
FurretShinyPal:     INCLUDE "gfx/pokemon/furret/shiny.pal"
HoothootPal:        INCBIN "gfx/pokemon/hoothoot/front.gbcpal", middle_colors
HoothootShinyPal:   INCLUDE "gfx/pokemon/hoothoot/shiny.pal"
NoctowlPal:         INCBIN "gfx/pokemon/noctowl/front.gbcpal", middle_colors
NoctowlShinyPal:    INCLUDE "gfx/pokemon/noctowl/shiny.pal"
LedybaPal:          INCBIN "gfx/pokemon/ledyba/front.gbcpal", middle_colors
LedybaShinyPal:     INCLUDE "gfx/pokemon/ledyba/shiny.pal"
LedianPal:          INCBIN "gfx/pokemon/ledian/front.gbcpal", middle_colors
LedianShinyPal:     INCLUDE "gfx/pokemon/ledian/shiny.pal"
SpinarakPal:        INCBIN "gfx/pokemon/spinarak/front.gbcpal", middle_colors
SpinarakShinyPal:   INCLUDE "gfx/pokemon/spinarak/shiny.pal"
AriadosPal:         INCBIN "gfx/pokemon/ariados/front.gbcpal", middle_colors
AriadosShinyPal:    INCLUDE "gfx/pokemon/ariados/shiny.pal"
CrobatPal:          INCBIN "gfx/pokemon/crobat/front.gbcpal", middle_colors
CrobatShinyPal:     INCLUDE "gfx/pokemon/crobat/shiny.pal"
ChinchouPal:        INCBIN "gfx/pokemon/chinchou/front.gbcpal", middle_colors
ChinchouShinyPal:   INCLUDE "gfx/pokemon/chinchou/shiny.pal"
LanturnPal:         INCBIN "gfx/pokemon/lanturn/front.gbcpal", middle_colors
LanturnShinyPal:    INCLUDE "gfx/pokemon/lanturn/shiny.pal"
PichuPal:           INCBIN "gfx/pokemon/pichu/front.gbcpal", middle_colors
PichuShinyPal:      INCLUDE "gfx/pokemon/pichu/shiny.pal"
CleffaPal:          INCBIN "gfx/pokemon/cleffa/front.gbcpal", middle_colors
CleffaShinyPal:     INCLUDE "gfx/pokemon/cleffa/shiny.pal"
IgglybuffPal:       INCBIN "gfx/pokemon/igglybuff/front.gbcpal", middle_colors
IgglybuffShinyPal:  INCLUDE "gfx/pokemon/igglybuff/shiny.pal"
TogepiPal:          INCBIN "gfx/pokemon/togepi/front.gbcpal", middle_colors
TogepiShinyPal:     INCLUDE "gfx/pokemon/togepi/shiny.pal"
TogeticPal:         INCBIN "gfx/pokemon/togetic/front.gbcpal", middle_colors
TogeticShinyPal:    INCLUDE "gfx/pokemon/togetic/shiny.pal"
NatuPal:            INCBIN "gfx/pokemon/natu/front.gbcpal", middle_colors
NatuShinyPal:       INCLUDE "gfx/pokemon/natu/shiny.pal"
XatuPal:            INCBIN "gfx/pokemon/xatu/front.gbcpal", middle_colors
XatuShinyPal:       INCLUDE "gfx/pokemon/xatu/shiny.pal"
MareepPal:          INCBIN "gfx/pokemon/mareep/front.gbcpal", middle_colors
MareepShinyPal:     INCLUDE "gfx/pokemon/mareep/shiny.pal"
FlaaffyPal:         INCBIN "gfx/pokemon/flaaffy/front.gbcpal", middle_colors
FlaaffyShinyPal:    INCLUDE "gfx/pokemon/flaaffy/shiny.pal"
AmpharosPal:        INCBIN "gfx/pokemon/ampharos/front.gbcpal", middle_colors
AmpharosShinyPal:   INCLUDE "gfx/pokemon/ampharos/shiny.pal"
BellossomPal:       INCBIN "gfx/pokemon/bellossom/front.gbcpal", middle_colors
BellossomShinyPal:  INCLUDE "gfx/pokemon/bellossom/shiny.pal"
MarillPal:          INCBIN "gfx/pokemon/marill/front.gbcpal", middle_colors
MarillShinyPal:     INCLUDE "gfx/pokemon/marill/shiny.pal"
AzumarillPal:       INCBIN "gfx/pokemon/azumarill/front.gbcpal", middle_colors
AzumarillShinyPal:  INCLUDE "gfx/pokemon/azumarill/shiny.pal"
SudowoodoPal:       INCBIN "gfx/pokemon/sudowoodo/front.gbcpal", middle_colors
SudowoodoShinyPal:  INCLUDE "gfx/pokemon/sudowoodo/shiny.pal"
PolitoedPal:        INCBIN "gfx/pokemon/politoed/front.gbcpal", middle_colors
PolitoedShinyPal:   INCLUDE "gfx/pokemon/politoed/shiny.pal"
HoppipPal:          INCBIN "gfx/pokemon/hoppip/front.gbcpal", middle_colors
HoppipShinyPal:     INCLUDE "gfx/pokemon/hoppip/shiny.pal"
SkiploomPal:        INCBIN "gfx/pokemon/skiploom/front.gbcpal", middle_colors
SkiploomShinyPal:   INCLUDE "gfx/pokemon/skiploom/shiny.pal"
JumpluffPal:        INCBIN "gfx/pokemon/jumpluff/front.gbcpal", middle_colors
JumpluffShinyPal:   INCLUDE "gfx/pokemon/jumpluff/shiny.pal"
AipomPal:           INCBIN "gfx/pokemon/aipom/front.gbcpal", middle_colors
AipomShinyPal:      INCLUDE "gfx/pokemon/aipom/shiny.pal"
SunkernPal:         INCBIN "gfx/pokemon/sunkern/front.gbcpal", middle_colors
SunkernShinyPal:    INCLUDE "gfx/pokemon/sunkern/shiny.pal"
SunfloraPal:        INCBIN "gfx/pokemon/sunflora/front.gbcpal", middle_colors
SunfloraShinyPal:   INCLUDE "gfx/pokemon/sunflora/shiny.pal"
YanmaPal:           INCBIN "gfx/pokemon/yanma/front.gbcpal", middle_colors
YanmaShinyPal:      INCLUDE "gfx/pokemon/yanma/shiny.pal"
WooperPal:          INCBIN "gfx/pokemon/wooper/front.gbcpal", middle_colors
WooperShinyPal:     INCLUDE "gfx/pokemon/wooper/shiny.pal"
QuagsirePal:        INCBIN "gfx/pokemon/quagsire/front.gbcpal", middle_colors
QuagsireShinyPal:   INCLUDE "gfx/pokemon/quagsire/shiny.pal"
EspeonPal:          INCBIN "gfx/pokemon/espeon/front.gbcpal", middle_colors
EspeonShinyPal:     INCLUDE "gfx/pokemon/espeon/shiny.pal"
UmbreonPal:         INCBIN "gfx/pokemon/umbreon/front.gbcpal", middle_colors
UmbreonShinyPal:    INCLUDE "gfx/pokemon/umbreon/shiny.pal"
MurkrowPal:         INCBIN "gfx/pokemon/murkrow/front.gbcpal", middle_colors
MurkrowShinyPal:    INCLUDE "gfx/pokemon/murkrow/shiny.pal"
SlowkingPal:        INCBIN "gfx/pokemon/slowking/front.gbcpal", middle_colors
SlowkingShinyPal:   INCLUDE "gfx/pokemon/slowking/shiny.pal"
MisdreavusPal:      INCBIN "gfx/pokemon/misdreavus/front.gbcpal", middle_colors
MisdreavusShinyPal: INCLUDE "gfx/pokemon/misdreavus/shiny.pal"
UnownPal:           INCLUDE "gfx/pokemon/unown/normal.pal" ; not front.gbcpal
UnownShinyPal:      INCLUDE "gfx/pokemon/unown/shiny.pal"
WobbuffetPal:       INCBIN "gfx/pokemon/wobbuffet/front.gbcpal", middle_colors
WobbuffetShinyPal:  INCLUDE "gfx/pokemon/wobbuffet/shiny.pal"
GirafarigPal:       INCBIN "gfx/pokemon/girafarig/front.gbcpal", middle_colors
GirafarigShinyPal:  INCLUDE "gfx/pokemon/girafarig/shiny.pal"
PinecoPal:          INCBIN "gfx/pokemon/pineco/front.gbcpal", middle_colors
PinecoShinyPal:     INCLUDE "gfx/pokemon/pineco/shiny.pal"
ForretressPal:      INCBIN "gfx/pokemon/forretress/front.gbcpal", middle_colors
ForretressShinyPal: INCLUDE "gfx/pokemon/forretress/shiny.pal"
DunsparcePal:       INCBIN "gfx/pokemon/dunsparce/front.gbcpal", middle_colors
DunsparceShinyPal:  INCLUDE "gfx/pokemon/dunsparce/shiny.pal"
GligarPal:          INCBIN "gfx/pokemon/gligar/front.gbcpal", middle_colors
GligarShinyPal:     INCLUDE "gfx/pokemon/gligar/shiny.pal"
SteelixPal:         INCBIN "gfx/pokemon/steelix/front.gbcpal", middle_colors
SteelixShinyPal:    INCLUDE "gfx/pokemon/steelix/shiny.pal"
SnubbullPal:        INCBIN "gfx/pokemon/snubbull/front.gbcpal", middle_colors
SnubbullShinyPal:   INCLUDE "gfx/pokemon/snubbull/shiny.pal"
GranbullPal:        INCBIN "gfx/pokemon/granbull/front.gbcpal", middle_colors
GranbullShinyPal:   INCLUDE "gfx/pokemon/granbull/shiny.pal"
QwilfishPal:        INCBIN "gfx/pokemon/qwilfish/front.gbcpal", middle_colors
QwilfishShinyPal:   INCLUDE "gfx/pokemon/qwilfish/shiny.pal"
ScizorPal:          INCBIN "gfx/pokemon/scizor/front.gbcpal", middle_colors
ScizorShinyPal:     INCLUDE "gfx/pokemon/scizor/shiny.pal"
ShucklePal:         INCBIN "gfx/pokemon/shuckle/front.gbcpal", middle_colors
ShuckleShinyPal:    INCLUDE "gfx/pokemon/shuckle/shiny.pal"
HeracrossPal:       INCBIN "gfx/pokemon/heracross/front.gbcpal", middle_colors
HeracrossShinyPal:  INCLUDE "gfx/pokemon/heracross/shiny.pal"
SneaselPal:         INCBIN "gfx/pokemon/sneasel/front.gbcpal", middle_colors
SneaselShinyPal:    INCLUDE "gfx/pokemon/sneasel/shiny.pal"
TeddiursaPal:       INCBIN "gfx/pokemon/teddiursa/front.gbcpal", middle_colors
TeddiursaShinyPal:  INCLUDE "gfx/pokemon/teddiursa/shiny.pal"
UrsaringPal:        INCBIN "gfx/pokemon/ursaring/front.gbcpal", middle_colors
UrsaringShinyPal:   INCLUDE "gfx/pokemon/ursaring/shiny.pal"
SlugmaPal:          INCBIN "gfx/pokemon/slugma/front.gbcpal", middle_colors
SlugmaShinyPal:     INCLUDE "gfx/pokemon/slugma/shiny.pal"
MagcargoPal:        INCBIN "gfx/pokemon/magcargo/front.gbcpal", middle_colors
MagcargoShinyPal:   INCLUDE "gfx/pokemon/magcargo/shiny.pal"
SwinubPal:          INCBIN "gfx/pokemon/swinub/front.gbcpal", middle_colors
SwinubShinyPal:     INCLUDE "gfx/pokemon/swinub/shiny.pal"
PiloswinePal:       INCBIN "gfx/pokemon/piloswine/front.gbcpal", middle_colors
PiloswineShinyPal:  INCLUDE "gfx/pokemon/piloswine/shiny.pal"
CorsolaPal:         INCBIN "gfx/pokemon/corsola/front.gbcpal", middle_colors
CorsolaShinyPal:    INCLUDE "gfx/pokemon/corsola/shiny.pal"
RemoraidPal:        INCBIN "gfx/pokemon/remoraid/front.gbcpal", middle_colors
RemoraidShinyPal:   INCLUDE "gfx/pokemon/remoraid/shiny.pal"
OctilleryPal:       INCBIN "gfx/pokemon/octillery/front.gbcpal", middle_colors
OctilleryShinyPal:  INCLUDE "gfx/pokemon/octillery/shiny.pal"
DelibirdPal:        INCBIN "gfx/pokemon/delibird/front.gbcpal", middle_colors
DelibirdShinyPal:   INCLUDE "gfx/pokemon/delibird/shiny.pal"
MantinePal:         INCBIN "gfx/pokemon/mantine/front.gbcpal", middle_colors
MantineShinyPal:    INCLUDE "gfx/pokemon/mantine/shiny.pal"
SkarmoryPal:        INCBIN "gfx/pokemon/skarmory/front.gbcpal", middle_colors
SkarmoryShinyPal:   INCLUDE "gfx/pokemon/skarmory/shiny.pal"
HoundourPal:        INCBIN "gfx/pokemon/houndour/front.gbcpal", middle_colors
HoundourShinyPal:   INCLUDE "gfx/pokemon/houndour/shiny.pal"
HoundoomPal:        INCBIN "gfx/pokemon/houndoom/front.gbcpal", middle_colors
HoundoomShinyPal:   INCLUDE "gfx/pokemon/houndoom/shiny.pal"
KingdraPal:         INCBIN "gfx/pokemon/kingdra/front.gbcpal", middle_colors
KingdraShinyPal:    INCLUDE "gfx/pokemon/kingdra/shiny.pal"
PhanpyPal:          INCBIN "gfx/pokemon/phanpy/front.gbcpal", middle_colors
PhanpyShinyPal:     INCLUDE "gfx/pokemon/phanpy/shiny.pal"
DonphanPal:         INCBIN "gfx/pokemon/donphan/front.gbcpal", middle_colors
DonphanShinyPal:    INCLUDE "gfx/pokemon/donphan/shiny.pal"
Porygon2Pal:        INCBIN "gfx/pokemon/porygon2/front.gbcpal", middle_colors
Porygon2ShinyPal:   INCLUDE "gfx/pokemon/porygon2/shiny.pal"
StantlerPal:        INCBIN "gfx/pokemon/stantler/front.gbcpal", middle_colors
StantlerShinyPal:   INCLUDE "gfx/pokemon/stantler/shiny.pal"
SmearglePal:        INCBIN "gfx/pokemon/smeargle/front.gbcpal", middle_colors
SmeargleShinyPal:   INCLUDE "gfx/pokemon/smeargle/shiny.pal"
TyroguePal:         INCBIN "gfx/pokemon/tyrogue/front.gbcpal", middle_colors
TyrogueShinyPal:    INCLUDE "gfx/pokemon/tyrogue/shiny.pal"
HitmontopPal:       INCBIN "gfx/pokemon/hitmontop/front.gbcpal", middle_colors
HitmontopShinyPal:  INCLUDE "gfx/pokemon/hitmontop/shiny.pal"
SmoochumPal:        INCBIN "gfx/pokemon/smoochum/front.gbcpal", middle_colors
SmoochumShinyPal:   INCLUDE "gfx/pokemon/smoochum/shiny.pal"
ElekidPal:          INCBIN "gfx/pokemon/elekid/front.gbcpal", middle_colors
ElekidShinyPal:     INCLUDE "gfx/pokemon/elekid/shiny.pal"
MagbyPal:           INCBIN "gfx/pokemon/magby/front.gbcpal", middle_colors
MagbyShinyPal:      INCLUDE "gfx/pokemon/magby/shiny.pal"
MiltankPal:         INCBIN "gfx/pokemon/miltank/front.gbcpal", middle_colors
MiltankShinyPal:    INCLUDE "gfx/pokemon/miltank/shiny.pal"
BlisseyPal:         INCBIN "gfx/pokemon/blissey/front.gbcpal", middle_colors
BlisseyShinyPal:    INCLUDE "gfx/pokemon/blissey/shiny.pal"
RaikouPal:          INCBIN "gfx/pokemon/raikou/front.gbcpal", middle_colors
RaikouShinyPal:     INCLUDE "gfx/pokemon/raikou/shiny.pal"
EnteiPal:           INCBIN "gfx/pokemon/entei/front.gbcpal", middle_colors
EnteiShinyPal:      INCLUDE "gfx/pokemon/entei/shiny.pal"
SuicunePal:         INCBIN "gfx/pokemon/suicune/front.gbcpal", middle_colors
SuicuneShinyPal:    INCLUDE "gfx/pokemon/suicune/shiny.pal"
LarvitarPal:        INCBIN "gfx/pokemon/larvitar/front.gbcpal", middle_colors
LarvitarShinyPal:   INCLUDE "gfx/pokemon/larvitar/shiny.pal"
PupitarPal:         INCBIN "gfx/pokemon/pupitar/front.gbcpal", middle_colors
PupitarShinyPal:    INCLUDE "gfx/pokemon/pupitar/shiny.pal"
TyranitarPal:       INCBIN "gfx/pokemon/tyranitar/front.gbcpal", middle_colors
TyranitarShinyPal:  INCLUDE "gfx/pokemon/tyranitar/shiny.pal"
LugiaPal:           INCBIN "gfx/pokemon/lugia/front.gbcpal", middle_colors
LugiaShinyPal:      INCLUDE "gfx/pokemon/lugia/shiny.pal"
Ho_ohPal:           INCBIN "gfx/pokemon/ho_oh/front.gbcpal", middle_colors
Ho_ohShinyPal:      INCLUDE "gfx/pokemon/ho_oh/shiny.pal"
CelebiPal:          INCBIN "gfx/pokemon/celebi/front.gbcpal", middle_colors
CelebiShinyPal:     INCLUDE "gfx/pokemon/celebi/shiny.pal"
FlambearPal:        INCBIN "gfx/pokemon/flambear/front.gbcpal", middle_colors
FlambearShinyPal:   INCLUDE "gfx/pokemon/flambear/shiny.pal"
VolbearPal:         INCBIN "gfx/pokemon/volbear/front.gbcpal", middle_colors
VolbearShinyPal:    INCLUDE "gfx/pokemon/volbear/shiny.pal"
DynabearPal:        INCBIN "gfx/pokemon/dynabear/front.gbcpal", middle_colors
DynabearShinyPal:   INCLUDE "gfx/pokemon/dynabear/shiny.pal"
CruizePal:          INCBIN "gfx/pokemon/cruize/front.gbcpal", middle_colors
CruizeShinyPal:     INCLUDE "gfx/pokemon/cruize/shiny.pal"
AqualloPal:         INCBIN "gfx/pokemon/aquallo/front.gbcpal", middle_colors
AqualloShinyPal:    INCLUDE "gfx/pokemon/aquallo/shiny.pal"
AquariusPal:        INCBIN "gfx/pokemon/aquarius/front.gbcpal", middle_colors
AquariusShinyPal:   INCLUDE "gfx/pokemon/aquarius/shiny.pal"
KotoraPal:          INCBIN "gfx/pokemon/kotora/front.gbcpal", middle_colors
KotoraShinyPal:     INCLUDE "gfx/pokemon/kotora/shiny.pal"
RaitoraPal:         INCBIN "gfx/pokemon/raitora/front.gbcpal", middle_colors
RaitoraShinyPal:    INCLUDE "gfx/pokemon/raitora/shiny.pal"
BomshealPal:        INCBIN "gfx/pokemon/bomsheal/front.gbcpal", middle_colors
BomshealShinyPal:   INCLUDE "gfx/pokemon/bomsheal/shiny.pal"
CorasunPal:         INCBIN "gfx/pokemon/corasun/front.gbcpal", middle_colors
CorasunShinyPal:    INCLUDE "gfx/pokemon/corasun/shiny.pal"
CoramolaPal:        INCBIN "gfx/pokemon/coramola/front.gbcpal", middle_colors
CoramolaShinyPal:   INCLUDE "gfx/pokemon/coramola/shiny.pal"
MambokingPal:       INCBIN "gfx/pokemon/mamboking/front.gbcpal", middle_colors
MambokingShinyPal:  INCLUDE "gfx/pokemon/mamboking/shiny.pal"
BiteelPal:          INCBIN "gfx/pokemon/biteel/front.gbcpal", middle_colors
BiteelShinyPal:     INCLUDE "gfx/pokemon/biteel/shiny.pal"
GrotessPal:         INCBIN "gfx/pokemon/grotess/front.gbcpal", middle_colors
GrotessShinyPal:    INCLUDE "gfx/pokemon/grotess/shiny.pal"
RinringPal:         INCBIN "gfx/pokemon/rinring/front.gbcpal", middle_colors
RinringShinyPal:    INCLUDE "gfx/pokemon/rinring/shiny.pal"
BellrunPal:         INCBIN "gfx/pokemon/bellrun/front.gbcpal", middle_colors
BellrunShinyPal:    INCLUDE "gfx/pokemon/bellrun/shiny.pal"
BlottlePal:         INCBIN "gfx/pokemon/blottle/front.gbcpal", middle_colors
BlottleShinyPal:    INCLUDE "gfx/pokemon/blottle/shiny.pal"
PendrakenPal:       INCBIN "gfx/pokemon/pendraken/front.gbcpal", middle_colors
PendrakenShinyPal:  INCLUDE "gfx/pokemon/pendraken/shiny.pal"
KurstrawPal:        INCBIN "gfx/pokemon/kurstraw/front.gbcpal", middle_colors
KurstrawShinyPal:   INCLUDE "gfx/pokemon/kurstraw/shiny.pal"
PangshiPal:         INCBIN "gfx/pokemon/pangshi/front.gbcpal", middle_colors
PangshiShinyPal:    INCLUDE "gfx/pokemon/pangshi/shiny.pal"
WolfanPal:          INCBIN "gfx/pokemon/wolfan/front.gbcpal", middle_colors
WolfanShinyPal:     INCLUDE "gfx/pokemon/wolfan/shiny.pal"
WarwolfPal:         INCBIN "gfx/pokemon/warwolf/front.gbcpal", middle_colors
WarwolfShinyPal:    INCLUDE "gfx/pokemon/warwolf/shiny.pal"
CheepPal:           INCBIN "gfx/pokemon/cheep/front.gbcpal", middle_colors
CheepShinyPal:      INCLUDE "gfx/pokemon/cheep/shiny.pal"
JabettaPal:         INCBIN "gfx/pokemon/jabetta/front.gbcpal", middle_colors
JabettaShinyPal:    INCLUDE "gfx/pokemon/jabetta/shiny.pal"
SnobitPal:          INCBIN "gfx/pokemon/snobit/front.gbcpal", middle_colors
SnobitShinyPal:     INCLUDE "gfx/pokemon/snobit/shiny.pal"
BlizbitPal:         INCBIN "gfx/pokemon/blizbit/front.gbcpal", middle_colors
BlizbitShinyPal:    INCLUDE "gfx/pokemon/blizbit/shiny.pal"
GlaciharePal:       INCBIN "gfx/pokemon/glacihare/front.gbcpal", middle_colors
GlacihareShinyPal:  INCLUDE "gfx/pokemon/glacihare/shiny.pal"
StemineelPal:       INCBIN "gfx/pokemon/stemineel/front.gbcpal", middle_colors
StemineelShinyPal:  INCLUDE "gfx/pokemon/stemineel/shiny.pal"
ArskeedPal:         INCBIN "gfx/pokemon/arskeed/front.gbcpal", middle_colors
ArskeedShinyPal:    INCLUDE "gfx/pokemon/arskeed/shiny.pal"
DrakarvePal:        INCBIN "gfx/pokemon/drakarve/front.gbcpal", middle_colors
DrakarveShinyPal:   INCLUDE "gfx/pokemon/drakarve/shiny.pal"
PeticornPal:        INCBIN "gfx/pokemon/peticorn/front.gbcpal", middle_colors
PeticornShinyPal:   INCLUDE "gfx/pokemon/peticorn/shiny.pal"
GupgoldPal:         INCBIN "gfx/pokemon/gupgold/front.gbcpal", middle_colors
GupgoldShinyPal:    INCLUDE "gfx/pokemon/gupgold/shiny.pal"
TritalesPal:        INCBIN "gfx/pokemon/tritales/front.gbcpal", middle_colors
TritalesShinyPal:   INCLUDE "gfx/pokemon/tritales/shiny.pal"
GrimbyPal:          INCBIN "gfx/pokemon/grimby/front.gbcpal", middle_colors
GrimbyShinyPal:     INCLUDE "gfx/pokemon/grimby/shiny.pal"
ParamitePal:        INCBIN "gfx/pokemon/paramite/front.gbcpal", middle_colors
ParamiteShinyPal:   INCLUDE "gfx/pokemon/paramite/shiny.pal"
NyanyaPal:          INCBIN "gfx/pokemon/nyanya/front.gbcpal", middle_colors
NyanyaShinyPal:     INCLUDE "gfx/pokemon/nyanya/shiny.pal"
PuddipupPal:        INCBIN "gfx/pokemon/puddipup/front.gbcpal", middle_colors
PuddipupShinyPal:   INCLUDE "gfx/pokemon/puddipup/shiny.pal"
ChixPal:            INCBIN "gfx/pokemon/chix/front.gbcpal", middle_colors
ChixShinyPal:       INCLUDE "gfx/pokemon/chix/shiny.pal"
KatuPal:            INCBIN "gfx/pokemon/katu/front.gbcpal", middle_colors
KatuShinyPal:       INCLUDE "gfx/pokemon/katu/shiny.pal"
TangtripPal:        INCBIN "gfx/pokemon/tangtrip/front.gbcpal", middle_colors
TangtripShinyPal:   INCLUDE "gfx/pokemon/tangtrip/shiny.pal"
GelaniaPal:         INCBIN "gfx/pokemon/gelania/front.gbcpal", middle_colors
GelaniaShinyPal:    INCLUDE "gfx/pokemon/gelania/shiny.pal"
BelmittPal:         INCBIN "gfx/pokemon/belmitt/front.gbcpal", middle_colors
BelmittShinyPal:    INCLUDE "gfx/pokemon/belmitt/shiny.pal"
TurbanPal:          INCBIN "gfx/pokemon/turban/front.gbcpal", middle_colors
TurbanShinyPal:     INCLUDE "gfx/pokemon/turban/shiny.pal"
PraxePal:           INCBIN "gfx/pokemon/praxe/front.gbcpal", middle_colors
PraxeShinyPal:      INCLUDE "gfx/pokemon/praxe/shiny.pal"
NumbpuffPal:        INCBIN "gfx/pokemon/numbpuff/front.gbcpal", middle_colors
NumbpuffShinyPal:   INCLUDE "gfx/pokemon/numbpuff/shiny.pal"
MettoPal:           INCBIN "gfx/pokemon/metto/front.gbcpal", middle_colors
MettoShinyPal:      INCLUDE "gfx/pokemon/metto/shiny.pal"
MadamePal:          INCBIN "gfx/pokemon/madame/front.gbcpal", middle_colors
MadameShinyPal:     INCLUDE "gfx/pokemon/madame/shiny.pal"
GuardiaPal:         INCBIN "gfx/pokemon/guardia/front.gbcpal", middle_colors
GuardiaShinyPal:    INCLUDE "gfx/pokemon/guardia/shiny.pal"
OhmegaPal:          INCBIN "gfx/pokemon/ohmega/front.gbcpal", middle_colors
OhmegaShinyPal:     INCLUDE "gfx/pokemon/ohmega/shiny.pal"
TreeckoPal:         INCBIN "gfx/pokemon/treecko/front.gbcpal", middle_colors
TreeckoShinyPal:    INCLUDE "gfx/pokemon/treecko/shiny.pal"
GrovylePal:         INCBIN "gfx/pokemon/grovyle/front.gbcpal", middle_colors
GrovyleShinyPal:    INCLUDE "gfx/pokemon/grovyle/shiny.pal"
SceptilePal:        INCBIN "gfx/pokemon/sceptile/front.gbcpal", middle_colors
SceptileShinyPal:   INCLUDE "gfx/pokemon/sceptile/shiny.pal"
TorchicPal:         INCBIN "gfx/pokemon/torchic/front.gbcpal", middle_colors
TorchicShinyPal:    INCLUDE "gfx/pokemon/torchic/shiny.pal"
CombuskenPal:       INCBIN "gfx/pokemon/combusken/front.gbcpal", middle_colors
CombuskenShinyPal:  INCLUDE "gfx/pokemon/combusken/shiny.pal"
BlazikenPal:        INCBIN "gfx/pokemon/blaziken/front.gbcpal", middle_colors
BlazikenShinyPal:   INCLUDE "gfx/pokemon/blaziken/shiny.pal"
MudkipPal:          INCBIN "gfx/pokemon/mudkip/front.gbcpal", middle_colors
MudkipShinyPal:     INCLUDE "gfx/pokemon/mudkip/shiny.pal"
MarshtompPal:       INCBIN "gfx/pokemon/marshtomp/front.gbcpal", middle_colors
MarshtompShinyPal:  INCLUDE "gfx/pokemon/marshtomp/shiny.pal"
SwampertPal:        INCBIN "gfx/pokemon/swampert/front.gbcpal", middle_colors
SwampertShinyPal:   INCLUDE "gfx/pokemon/swampert/shiny.pal"
PoochyenaPal:       INCBIN "gfx/pokemon/poochyena/front.gbcpal", middle_colors
PoochyenaShinyPal:  INCLUDE "gfx/pokemon/poochyena/shiny.pal"
MightyenaPal:       INCBIN "gfx/pokemon/mightyena/front.gbcpal", middle_colors
MightyenaShinyPal:  INCLUDE "gfx/pokemon/mightyena/shiny.pal"
ZigzagoonPal:       INCBIN "gfx/pokemon/zigzagoon/front.gbcpal", middle_colors
ZigzagoonShinyPal:  INCLUDE "gfx/pokemon/zigzagoon/shiny.pal"
LinoonePal:         INCBIN "gfx/pokemon/linoone/front.gbcpal", middle_colors
LinooneShinyPal:    INCLUDE "gfx/pokemon/linoone/shiny.pal"
WurmplePal:         INCBIN "gfx/pokemon/wurmple/front.gbcpal", middle_colors
WurmpleShinyPal:    INCLUDE "gfx/pokemon/wurmple/shiny.pal"
SilcoonPal:         INCBIN "gfx/pokemon/silcoon/front.gbcpal", middle_colors
SilcoonShinyPal:    INCLUDE "gfx/pokemon/silcoon/shiny.pal"
BeautiflyPal:       INCBIN "gfx/pokemon/beautifly/front.gbcpal", middle_colors
BeautiflyShinyPal:  INCLUDE "gfx/pokemon/beautifly/shiny.pal"
CascoonPal:         INCBIN "gfx/pokemon/cascoon/front.gbcpal", middle_colors
CascoonShinyPal:    INCLUDE "gfx/pokemon/cascoon/shiny.pal"
DustoxPal:          INCBIN "gfx/pokemon/dustox/front.gbcpal", middle_colors
DustoxShinyPal:     INCLUDE "gfx/pokemon/dustox/shiny.pal"
LotadPal:           INCBIN "gfx/pokemon/lotad/front.gbcpal", middle_colors
LotadShinyPal:      INCLUDE "gfx/pokemon/lotad/shiny.pal"
LombrePal:          INCBIN "gfx/pokemon/lombre/front.gbcpal", middle_colors
LombreShinyPal:     INCLUDE "gfx/pokemon/lombre/shiny.pal"
LudicoloPal:        INCBIN "gfx/pokemon/ludicolo/front.gbcpal", middle_colors
LudicoloShinyPal:   INCLUDE "gfx/pokemon/ludicolo/shiny.pal"
SeedotPal:          INCBIN "gfx/pokemon/seedot/front.gbcpal", middle_colors
SeedotShinyPal:     INCLUDE "gfx/pokemon/seedot/shiny.pal"
NuzleafPal:         INCBIN "gfx/pokemon/nuzleaf/front.gbcpal", middle_colors
NuzleafShinyPal:    INCLUDE "gfx/pokemon/nuzleaf/shiny.pal"
ShiftryPal:         INCBIN "gfx/pokemon/shiftry/front.gbcpal", middle_colors
ShiftryShinyPal:    INCLUDE "gfx/pokemon/shiftry/shiny.pal"
TaillowPal:         INCBIN "gfx/pokemon/taillow/front.gbcpal", middle_colors
TaillowShinyPal:    INCLUDE "gfx/pokemon/taillow/shiny.pal"
SwellowPal:         INCBIN "gfx/pokemon/swellow/front.gbcpal", middle_colors
SwellowShinyPal:    INCLUDE "gfx/pokemon/swellow/shiny.pal"
WingullPal:         INCBIN "gfx/pokemon/wingull/front.gbcpal", middle_colors
WingullShinyPal:    INCLUDE "gfx/pokemon/wingull/shiny.pal"
PelipperPal:        INCBIN "gfx/pokemon/pelipper/front.gbcpal", middle_colors
PelipperShinyPal:   INCLUDE "gfx/pokemon/pelipper/shiny.pal"
RaltsPal:           INCBIN "gfx/pokemon/ralts/front.gbcpal", middle_colors
RaltsShinyPal:      INCLUDE "gfx/pokemon/ralts/shiny.pal"
KirliaPal:          INCBIN "gfx/pokemon/kirlia/front.gbcpal", middle_colors
KirliaShinyPal:     INCLUDE "gfx/pokemon/kirlia/shiny.pal"
GardevoirPal:       INCBIN "gfx/pokemon/gardevoir/front.gbcpal", middle_colors
GardevoirShinyPal:  INCLUDE "gfx/pokemon/gardevoir/shiny.pal"
SurskitPal:         INCBIN "gfx/pokemon/surskit/front.gbcpal", middle_colors
SurskitShinyPal:    INCLUDE "gfx/pokemon/surskit/shiny.pal"
MasquerainPal:      INCBIN "gfx/pokemon/masquerain/front.gbcpal", middle_colors
MasquerainShinyPal: INCLUDE "gfx/pokemon/masquerain/shiny.pal"
ShroomishPal:       INCBIN "gfx/pokemon/shroomish/front.gbcpal", middle_colors
ShroomishShinyPal:  INCLUDE "gfx/pokemon/shroomish/shiny.pal"
BreloomPal:         INCBIN "gfx/pokemon/breloom/front.gbcpal", middle_colors
BreloomShinyPal:    INCLUDE "gfx/pokemon/breloom/shiny.pal"
SlakothPal:         INCBIN "gfx/pokemon/slakoth/front.gbcpal", middle_colors
SlakothShinyPal:    INCLUDE "gfx/pokemon/slakoth/shiny.pal"
VigorothPal:        INCBIN "gfx/pokemon/vigoroth/front.gbcpal", middle_colors
VigorothShinyPal:   INCLUDE "gfx/pokemon/vigoroth/shiny.pal"
SlakingPal:         INCBIN "gfx/pokemon/slaking/front.gbcpal", middle_colors
SlakingShinyPal:    INCLUDE "gfx/pokemon/slaking/shiny.pal"
NincadaPal:         INCBIN "gfx/pokemon/nincada/front.gbcpal", middle_colors
NincadaShinyPal:    INCLUDE "gfx/pokemon/nincada/shiny.pal"
NinjaskPal:         INCBIN "gfx/pokemon/ninjask/front.gbcpal", middle_colors
NinjaskShinyPal:    INCLUDE "gfx/pokemon/ninjask/shiny.pal"
ShedinjaPal:        INCBIN "gfx/pokemon/shedinja/front.gbcpal", middle_colors
ShedinjaShinyPal:   INCLUDE "gfx/pokemon/shedinja/shiny.pal"
WhismurPal:         INCBIN "gfx/pokemon/whismur/front.gbcpal", middle_colors
WhismurShinyPal:    INCLUDE "gfx/pokemon/whismur/shiny.pal"
LoudredPal:         INCBIN "gfx/pokemon/loudred/front.gbcpal", middle_colors
LoudredShinyPal:    INCLUDE "gfx/pokemon/loudred/shiny.pal"
ExploudPal:         INCBIN "gfx/pokemon/exploud/front.gbcpal", middle_colors
ExploudShinyPal:    INCLUDE "gfx/pokemon/exploud/shiny.pal"
MakuhitaPal:        INCBIN "gfx/pokemon/makuhita/front.gbcpal", middle_colors
MakuhitaShinyPal:   INCLUDE "gfx/pokemon/makuhita/shiny.pal"
HariyamaPal:        INCBIN "gfx/pokemon/hariyama/front.gbcpal", middle_colors
HariyamaShinyPal:   INCLUDE "gfx/pokemon/hariyama/shiny.pal"
