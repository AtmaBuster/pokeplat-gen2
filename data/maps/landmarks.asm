landmark: MACRO
; x, y, name
	db \1 + 8, \2 + 16
	dw \3
ENDM

Landmarks:
; entries correspond to constants/landmark_constants.asm
	dbbw       0,   0, SpecialMapName
	landmark  20, 124, TwinleafTownName
	landmark  24, 116, Route201Name
	landmark  12, 116, LakeVerityName
	landmark  36, 116, SandgemTownName
	landmark  36, 108, Route202Name
	landmark  36, 100, JubilifeCityName
	landmark  48, 100, Route203Name
	landmark  56, 100, OreburghGateName
	landmark  60, 100, OreburghCityName
	landmark  36,  88, Route204Name
	landmark  36,  90, RavagedPathName
	landmark  36,  76, FloaromaTownName
	landmark  44,  76, ValleyWindworksName
	landmark  44,  68, Route205Name
	landmark  36,  68, FloaromaMeadowName
	landmark  44,  60, EternaForestName
	landmark  60,  60, EternaCityName
	landmark  68,  60, Route211Name
	landmark  60,  80, Route206Name
	landmark  60,  68, WaywardCaveName
	landmark  68, 100, Route207Name
	landmark  76,  84, MtCoronetName
	landmark  84, 100, Route208Name
	landmark  92, 100, HearthomeCityName
	landmark  92,  96, AmitySquareName
	landmark 108, 100, Route209Name
	landmark 108,  84, SolaceonTownName
	landmark 112,  84, SolaceonRuinsName
	landmark 108,  68, Route210Name
	landmark 116,  68, Route215Name
	landmark 124,  68, VeilstoneCityName
	landmark 124,  88, Route214Name
	landmark 120,  84, ManiacTunnelName
	landmark 116, 108, LakeValorName
	landmark 120, 116, Route213Name
	landmark 108, 116, PastoriaCityName
	landmark 108, 112, GreatMarshName
	landmark  92, 116, Route212Name
	landmark  94, 108, PokemonMansionName
	landmark  24, 100, Route218Name
	landmark  12, 100, CanalaveCityName
	landmark  28,  52, IronIslandName
	landmark  68,  44, Route216Name
	landmark  60,  36, Route217Name
	landmark  52,  28, LakeAcuityName
	landmark  68,  28, SnowpointCityName
	landmark  68,  24, SnowpointTempleName
	landmark  76,  84, SpearPillarName
	landmark 132, 108, Route222Name
	landmark 140, 108, SunyshoreCityName
	landmark 140,  92, Route223Name
	landmark 140,  76, VictoryRoadName
	landmark 140,  68, PokemonLeagueName
	landmark  36, 124, Route219Name
	landmark  36, 132, Route220Name
	landmark  48, 132, Route221Name
	landmark  60, 132, PalParkName
	landmark 148,  64, Route224Name
	landmark 108,  44, FightAreaName
	landmark 112,  40, BattleFrontierName
	landmark 108,  36, Route225Name
	landmark 108,  28, SurvivalAreaName
	landmark 116,  28, Route226Name
	landmark 124,  28, Route227Name
	landmark 124,  24, StarkMountainName
	landmark 132,  28, Route228Name
	landmark 132,  36, Route229Name
	landmark 132,  44, ResortAreaName
	landmark 120,  44, Route230Name

TwinleafTownName:    db "TWINLEAF¯TOWN@"
SandgemTownName:     db "SANDGEM¯TOWN@"
JubilifeCityName:    db "JUBILIFE¯CITY@"
OreburghCityName:    db "OREBURGH¯CITY@"
FloaromaTownName:    db "FLOAROMA¯TOWN@"
EternaCityName:      db "ETERNA CITY@"
HearthomeCityName:   db "HEARTHOME¯CITY@"
SolaceonTownName:    db "SOLACEON¯TOWN@"
VeilstoneCityName:   db "VEILSTONE¯CITY@"
PastoriaCityName:    db "PASTORIA¯CITY@"
CanalaveCityName:    db "CANALAVE¯CITY@"
SnowpointCityName:   db "SNOWPOINT¯CITY@"
SunyshoreCityName:   db "SUNYSHORE¯CITY@"
PokemonLeagueName:   db "#MON¯LEAGUE@"
FightAreaName:       db "FIGHT AREA@"
SurvivalAreaName:    db "SURVIVAL¯AREA@"
ResortAreaName:      db "RESORT AREA@"
LakeVerityName:      db "LAKE VERITY@"
OreburghGateName:    db "OREBURGH¯GATE@"
RavagedPathName:     db "RAVAGED¯PATH@"
FloaromaMeadowName:  db "FLOAROMA¯MEADOW@"
ValleyWindworksName: db "VALLEY¯WINDWORKS@"
EternaForestName:    db "ETERNA¯FOREST@"
WaywardCaveName:     db "WAYWARD¯CAVE@"
MtCoronetName:       db "MT.CORONET@"
AmitySquareName:     db "AMITY¯SQUARE@"
SolaceonRuinsName:   db "SOLACEON¯RUINS@"
ManiacTunnelName:    db "MANAIC¯TUNNEL@"
LakeValorName:       db "LAKE VALOR@"
GreatMarshName:      db "GREAT MARSH@"
PokemonMansionName:  db "#MON¯MANSION@"
IronIslandName:      db "IRON ISLAND@"
LakeAcuityName:      db "LAKE ACUITY@"
SpearPillarName:     db "SPEAR¯PILLAR@"
VictoryRoadName:     db "VICTORY¯ROAD@"
PalParkName:         db "PAL PARK@"
BattleFrontierName:  db "BATTLE¯FRONTIER@"
StarkMountainName:   db "STARK¯MOUNTAIN@"
SnowpointTempleName: db "SNOWPOINT¯TEMPLE@"
TurnbackCaveName:    db "TURNBACK¯CAVE@"
SendoffSpringName:   db "SENDOFF¯SPRING@"
FullmoonIslandName:  db "FULLMOON¯ISLAND@"
NewmoonIslandName:   db "NEWMOON¯ISLAND@"
SeabreakPathName:    db "SEABREAK¯PATH@"
FlowerParadiseName:  db "FLOWER PARADISE@"
HallOfOriginName:    db "HALL OF¯ORIGIN@"
Route201Name:        db "ROUTE 201@"
Route202Name:        db "ROUTE 202@"
Route203Name:        db "ROUTE 203@"
Route204Name:        db "ROUTE 204@"
Route205Name:        db "ROUTE 205@"
Route206Name:        db "ROUTE 206@"
Route207Name:        db "ROUTE 207@"
Route208Name:        db "ROUTE 208@"
Route209Name:        db "ROUTE 209@"
Route210Name:        db "ROUTE 210@"
Route211Name:        db "ROUTE 211@"
Route212Name:        db "ROUTE 212@"
Route213Name:        db "ROUTE 213@"
Route214Name:        db "ROUTE 214@"
Route215Name:        db "ROUTE 215@"
Route216Name:        db "ROUTE 216@"
Route217Name:        db "ROUTE 217@"
Route218Name:        db "ROUTE 218@"
Route219Name:        db "ROUTE 219@"
Route220Name:        db "ROUTE 220@"
Route221Name:        db "ROUTE 221@"
Route222Name:        db "ROUTE 222@"
Route223Name:        db "ROUTE 223@"
Route224Name:        db "ROUTE 224@"
Route225Name:        db "ROUTE 225@"
Route226Name:        db "ROUTE 226@"
Route227Name:        db "ROUTE 227@"
Route228Name:        db "ROUTE 228@"
Route229Name:        db "ROUTE 229@"
Route230Name:        db "ROUTE 230@"
SpecialMapName:      db "SPECIAL@"
