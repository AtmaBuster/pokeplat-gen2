map_attributes: MACRO
;\1: map name
;\2: map id
;\3: border block
;\4: connections: combo of NORTH, SOUTH, WEST, and/or EAST, or 0 for none
CURRENT_MAP_WIDTH = \2_WIDTH
CURRENT_MAP_HEIGHT = \2_HEIGHT
\1_MapAttributes::
	db \3
	db CURRENT_MAP_HEIGHT, CURRENT_MAP_WIDTH
	db BANK(\1_Blocks)
	dw \1_Blocks
	db BANK(\1_MapScripts) ; aka BANK(\1_MapEvents)
	dw \1_MapScripts
	dw \1_MapEvents
	db \4
ENDM

; Connections go in order: north, south, west, east
connection: MACRO
;\1: direction
;\2: map name
;\3: map id
;\4: offset of the target map relative to the current map
;    (x offset for east/west, y offset for north/south)

; LEGACY: Support for old connection macro
if _NARG == 6
	connection \1, \2, \3, (\4) - (\5)
else

; Calculate tile offsets for source (current) and target maps
_src = 0
_tgt = (\4) + 3
if _tgt < 0
_src = -_tgt
_tgt = 0
endc

if "\1" == "north"
_blk = \3_WIDTH * (\3_HEIGHT + -3) + _src
_map = _tgt
_win = (\3_WIDTH + 6) * \3_HEIGHT + 1
_y = \3_HEIGHT * 2 - 1
_x = (\4) * -2
_len = CURRENT_MAP_WIDTH + 3 - (\4)
if _len > \3_WIDTH
_len = \3_WIDTH
endc

elif "\1" == "south"
_blk = _src
_map = (CURRENT_MAP_WIDTH + 6) * (CURRENT_MAP_HEIGHT + 3) + _tgt
_win = \3_WIDTH + 7
_y = 0
_x = (\4) * -2
_len = CURRENT_MAP_WIDTH + 3 - (\4)
if _len > \3_WIDTH
_len = \3_WIDTH
endc

elif "\1" == "west"
_blk = (\3_WIDTH * _src) + \3_WIDTH + -3
_map = (CURRENT_MAP_WIDTH + 6) * _tgt
_win = (\3_WIDTH + 6) * 2 + -6
_y = (\4) * -2
_x = \3_WIDTH * 2 - 1
_len = CURRENT_MAP_HEIGHT + 3 - (\4)
if _len > \3_HEIGHT
_len = \3_HEIGHT
endc

elif "\1" == "west2"
_blk = (\3_WIDTH * _src) + \3_WIDTH + -3
_map = (CURRENT_MAP_WIDTH + 6) * _tgt
_win = (\3_WIDTH + 6) * 2 + -6
_y = (\4) * -2
_x = \3_WIDTH * 2 - 1
_len = CURRENT_MAP_HEIGHT + 3 - (\4)
if _len > \3_HEIGHT
_len = \3_HEIGHT
endc

elif "\1" == "east"
_blk = (\3_WIDTH * _src)
_map = (CURRENT_MAP_WIDTH + 6) * _tgt + CURRENT_MAP_WIDTH + 3
_win = \3_WIDTH + 7
_y = (\4) * -2
_x = 0
_len = CURRENT_MAP_HEIGHT + 3 - (\4)
if _len > \3_HEIGHT
_len = \3_HEIGHT
endc

else
fail "Invalid direction for 'connection'."
endc

	map_id \3
	dw \2_Blocks + _blk
	dw wOverworldMapBlocks + _map
	db _len - _src
	db \3_WIDTH
	db _y, _x
	dw wOverworldMapBlocks + _win
endc
ENDM

; connections
	map_attributes TwinleafTown, TWINLEAF_TOWN, $01, NORTH
	connection north, Route201, ROUTE_201, -4

	map_attributes JubilifeCity, JUBILIFE_CITY, $01, NORTH | SOUTH | WEST | EAST
	connection north, Route204S, ROUTE_204_S, 9
	connection south, Route202, ROUTE_202, 9
	connection west, Route218, ROUTE_218, 0
	connection east, Route203, ROUTE_203, 0

	map_attributes Route201, ROUTE_201, $01, SOUTH | EAST
	connection south, TwinleafTown, TWINLEAF_TOWN, 4
	connection east, SandgemTown, SANDGEM_TOWN, -1

	map_attributes SandgemTown, SANDGEM_TOWN, $01, NORTH | SOUTH | WEST
	connection north, Route202, ROUTE_202, 1
	connection south, Route219, ROUTE_219, 2
	connection west, Route201, ROUTE_201, 1

	map_attributes Route202, ROUTE_202, $01, NORTH | SOUTH
	connection north, JubilifeCity, JUBILIFE_CITY, -9
	connection south, SandgemTown, SANDGEM_TOWN, -1
	
	map_attributes Route219, ROUTE_219, $41, NORTH
	connection north, SandgemTown, SANDGEM_TOWN, -2

	map_attributes Route203, ROUTE_203, $01, WEST | EAST
	connection west, JubilifeCity, JUBILIFE_CITY, 0
	connection east, OreburghCity, OREBURGH_CITY, 2
	
	map_attributes Route204S, ROUTE_204_S, $1, NORTH | SOUTH
	connection north, FloaromaTown, FLOAROMA_TOWN, 0
	connection south, JubilifeCity, JUBILIFE_CITY, -9
	
	map_attributes Route218, ROUTE_218, $1, EAST
	connection east, JubilifeCity, JUBILIFE_CITY, 0
	
	map_attributes OreburghCity, OREBURGH_CITY, $09, NORTH | WEST
	connection north, Route207, ROUTE_207, 12
	connection west, Route203, ROUTE_203, -2

	map_attributes Route207, ROUTE_207, $09, SOUTH
	connection south, OreburghCity, OREBURGH_CITY, -12
	
	map_attributes Route204N, ROUTE_204_N, $01, NORTH | SOUTH
	connection north, FloaromaTown, FLOAROMA_TOWN, 0
	connection south, JubilifeCity, JUBILIFE_CITY, 9

	map_attributes FloaromaTown, FLOAROMA_TOWN, $01, NORTH | SOUTH | EAST
	connection north, FuegoIronworksExt, FUEGO_IRONWORKS_EXT, 0
	connection south, Route204N, ROUTE_204_N, 0
	connection east, Route205S, ROUTE_205_S, -13
	
	map_attributes Route205S, ROUTE_205_S, $01, NORTH | WEST | EAST | WEST2
	connection north, EternaForestExt, ETERNA_FOREST_EXT, 7
	connection west, FloaromaTown, FLOAROMA_TOWN, 13
	connection west2, FuegoIronworksExt, FUEGO_IRONWORKS_EXT, 2
	connection east, ValleyWindworksExt, VALLEY_WINDWORKS_EXT, 12
	
	map_attributes ValleyWindworksExt, VALLEY_WINDWORKS_EXT, $4E, WEST
	connection west, Route205S, ROUTE_205_S, -12
	
	map_attributes FuegoIronworksExt, FUEGO_IRONWORKS_EXT, $01, SOUTH | EAST
	connection south, FloaromaTown, FLOAROMA_TOWN, 0
	connection east, Route205S, ROUTE_205_S, -2
	
	map_attributes EternaForestExt, ETERNA_FOREST_EXT, $4E, SOUTH | EAST
	connection south, Route205S, ROUTE_205_S, -7
	connection east, Route205N, ROUTE_205_N, -5
	
	map_attributes Route205N, ROUTE_205_N, $4E, WEST | EAST
	connection west, EternaForestExt, ETERNA_FOREST_EXT, 5
	connection east, EternaCity, ETERNA_CITY, 0
	
	map_attributes EternaCity, ETERNA_CITY, $4E, WEST | EAST
	connection west, Route205N, ROUTE_205_N, 0
	connection east, Route211W, ROUTE_211_W, 1
	
	map_attributes Route211W, ROUTE_211_W, $4E, WEST
	connection west, EternaCity, ETERNA_CITY, -1
	
; no connections
	
	
	map_attributes DebugRoom, DEBUG_ROOM, $13, 0
	map_attributes Pokecenter2F, POKECENTER_2F, $00, 0
	map_attributes TradeCenter, TRADE_CENTER, $00, 0
	map_attributes Colosseum, COLOSSEUM, $00, 0
	map_attributes TimeCapsule, TIME_CAPSULE, $00, 0
	map_attributes MobileTradeRoom, MOBILE_TRADE_ROOM, $00, 0
	map_attributes MobileBattleRoom, MOBILE_BATTLE_ROOM, $00, 0
	map_attributes PlayersHouse1F, PLAYERS_HOUSE_1F, $00, 0
	map_attributes PlayersHouse2F, PLAYERS_HOUSE_2F, $00, 0
	map_attributes RivalHouse1F, RIVAL_HOUSE_1F, $00, 0
	map_attributes RivalHouse2F, RIVAL_HOUSE_2F, $00, 0
	map_attributes TwinleafHouse1, TWINLEAF_HOUSE_1, $00, 0
	map_attributes TwinleafHouse2, TWINLEAF_HOUSE_2, $00, 0
	map_attributes LakeVerityLow, LAKE_VERITY_LOW, $01, 0
	map_attributes LakeVerityHigh, LAKE_VERITY_HIGH, $01, 0
	map_attributes LakeVerityCavern, LAKE_VERITY_CAVERN, $09, 0
	map_attributes RowansLab, ROWANS_LAB, $00, 0
	map_attributes SandgemHouse1, SANDGEM_HOUSE_1, $00, 0
	map_attributes AssistantHouse1F, ASSISTANT_HOUSE_1F, $00, 0
	map_attributes AssistantHouse2F, ASSISTANT_HOUSE_2F, $00, 0
	map_attributes SandgemPokemonCenter1F, SANDGEM_POKEMON_CENTER_1F, $00, 0
	map_attributes SandgemPokeMart, SANDGEM_POKEMART, $00, 0
	map_attributes JubilifeApartmentSE1F, JUBILIFE_APARTMENT_SE_1F, $00, 0
	map_attributes JubilifeApartmentSE2F, JUBILIFE_APARTMENT_SE_2F, $00, 0
	map_attributes JubilifeApartmentNE1F, JUBILIFE_APARTMENT_NE_1F, $00, 0
	map_attributes JubilifeApartmentNE2F, JUBILIFE_APARTMENT_NE_2F, $00, 0
	map_attributes JubilifeApartmentSW1F, JUBILIFE_APARTMENT_SW_1F, $00, 0
	map_attributes JubilifeApartmentSW2F, JUBILIFE_APARTMENT_SW_2F, $00, 0
	map_attributes TrainersSchool, TRAINERS_SCHOOL, $00, 0
	map_attributes PoketchCompany1F, POKETCH_COMPANY_1F, $00, 0
	map_attributes PoketchCompany2F, POKETCH_COMPANY_2F, $00, 0
	map_attributes PoketchCompany3F, POKETCH_COMPANY_3F, $00, 0
	map_attributes TVStation1F, TV_STATION_1F, $00, 0
	map_attributes TVStation2F, TV_STATION_2F, $00, 0
	map_attributes TVStation2F2, TV_STATION_2F2, $00, 0
	map_attributes TVStation3F, TV_STATION_3F, $00, 0
	map_attributes TVStation3F2, TV_STATION_3F2, $00, 0
	map_attributes TVStation3F3, TV_STATION_3F3, $00, 0
	map_attributes TVStation4F, TV_STATION_4F, $00, 0
	map_attributes TVStationElevator, TV_STATION_ELEVATOR, $00, 0
	map_attributes PokemonCommunicationCenter, POKEMON_COMMUNICATION_CENTER, $00, 0
	map_attributes JubilifePokemonCenter1F, JUBILIFE_POKEMON_CENTER_1F, $00, 0
	map_attributes JubilifePokeMart, JUBILIFE_POKEMART, $00, 0
	map_attributes JubilifeWestGate, JUBILIFE_WEST_GATE, $00, 0
	map_attributes RavagedPath, RAVAGED_PATH, $09, 0
	map_attributes OreburghGate1F, OREBURGH_GATE_1F, $09, 0
	map_attributes OreburghGateB1F, OREBURGH_GATE_B1F, $09, 0
	map_attributes OreburghPokemonCenter1F, OREBURGH_POKEMON_CENTER_1F, $00, 0
	map_attributes OreburghPokeMart, OREBURGH_POKEMART, $00, 0
	map_attributes OreburghGym, OREBURGH_GYM, $00, 0
	map_attributes OreburghApartmentNW1F, OREBURGH_APARTMENT_NW_1F, $00, 0
	map_attributes OreburghApartmentNW2F, OREBURGH_APARTMENT_NW_2F, $00, 0
	map_attributes OreburghApartmentN1F, OREBURGH_APARTMENT_N_1F, $00, 0
	map_attributes OreburghApartmentN2F, OREBURGH_APARTMENT_N_2F, $00, 0
	map_attributes OreburghApartmentE1F, OREBURGH_APARTMENT_E_1F, $00, 0
	map_attributes OreburghApartmentE2F, OREBURGH_APARTMENT_E_2F, $00, 0
	map_attributes OreburghHouseW, OREBURGH_HOUSE_W, $00, 0
	map_attributes OreburghHouseN, OREBURGH_HOUSE_N, $00, 0
	map_attributes OreburghHouseE, OREBURGH_HOUSE_E, $00, 0
	map_attributes OreburghMuseum, OREBURGH_MUSEUM, $00, 0
	map_attributes OreburghMineB1F, OREBURGH_MINE_B1F, $09, 0
	map_attributes OreburghMineB2F, OREBURGH_MINE_B2F, $09, 0
	map_attributes CanalaveEastGate, CANALAVE_EAST_GATE, $00, 0
	map_attributes FloaromaPokemonCenter1F, FLOAROMA_POKEMON_CENTER_1F, $00, 0
	map_attributes FloaromaPokeMart, FLOAROMA_POKEMART, $00, 0
	map_attributes FloaromaHouseW, FLOAROMA_HOUSE_W, $00, 0
	map_attributes FloaromaHouseE, FLOAROMA_HOUSE_E, $00, 0
	map_attributes FloaromaFlowerShop, FLOAROMA_FLOWER_SHOP, $00, 0
	map_attributes EternaForestInt, ETERNA_FOREST_INT, $06, 0
	map_attributes FloaromaMeadow, FLOAROMA_MEADOW, $02, 0
	map_attributes FloaromaMeadowHouse, FLOAROMA_MEADOW_HOUSE, $00, 0
	map_attributes Route205House, ROUTE_205_HOUSE, $00, 0
	map_attributes ValleyWindworksInt, VALLEY_WINDWORKS_INT, $00, 0
	