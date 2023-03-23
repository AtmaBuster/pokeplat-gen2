map: MACRO
;\1: map name: for the MapAttributes pointer (see data/maps/attributes.asm)
;\2: tileset: a TILESET_* constant
;\3: environment: TOWN, ROUTE, INDOOR, CAVE, ENVIRONMENT_5, GATE, or DUNGEON
;\4: location: from constants/landmark_constants.asm
;\5: music: a MUSIC_* constant
;\6: phone service flag: TRUE to prevent phone calls
;\7: time of day: a PALETTE_* constant
;\8: fishing group: a FISHGROUP_* constant
	db BANK(\1_MapAttributes), \2, \3
	dw \1_MapAttributes
	db \4, \5
	dn \6, \7
	db \8
ENDM

MapGroupPointers::
; pointers to the first map of each map group
	dw MapGroup_CableClub   ;  1
	dw MapGroup_Twinleaf    ;  2
	dw MapGroup_Sandgem     ;  3
	dw MapGroup_Jubilife    ;  4
	dw MapGroup_Oreburgh    ;  5
	dw MapGroup_Canalave    ;  6
	dw MapGroup_Floaroma    ;  7
	dw MapGroup_Meadow      ;  8
	dw MapGroup_Lakes       ;  9
	dw MapGroup_Dungeons    ; 10

MapGroup_CableClub:
	map Pokecenter2F, TILESET_POKECENTER, INDOOR, SPECIAL_MAP, MUSIC_POKEMON_CENTER, TRUE, PALETTE_DAY, FISHGROUP_NONE
	map TradeCenter, TILESET_GATE, INDOOR, SPECIAL_MAP, MUSIC_SANDGEM_TOWN, TRUE, PALETTE_DAY, FISHGROUP_NONE
	map Colosseum, TILESET_GATE, INDOOR, SPECIAL_MAP, MUSIC_SANDGEM_TOWN, TRUE, PALETTE_DAY, FISHGROUP_NONE
	map TimeCapsule, TILESET_GATE, INDOOR, SPECIAL_MAP, MUSIC_SANDGEM_TOWN, TRUE, PALETTE_DAY, FISHGROUP_NONE
	map MobileTradeRoom, TILESET_MANSION, INDOOR, SPECIAL_MAP, MUSIC_SANDGEM_TOWN, TRUE, PALETTE_DAY, FISHGROUP_NONE
	map MobileBattleRoom, TILESET_MANSION, INDOOR, SPECIAL_MAP, MUSIC_SANDGEM_TOWN, TRUE, PALETTE_DAY, FISHGROUP_NONE
	map DebugRoom, TILESET_FACILITY, CAVE, TWINLEAF_TOWN, MUSIC_EVOLUTION, FALSE, PALETTE_AUTO, FISHGROUP_NONE

MapGroup_Twinleaf:
	map TwinleafTown, TILESET_SINNOH_1, TOWN, TWINLEAF_TOWN, MUSIC_TWINLEAF_TOWN, FALSE, PALETTE_AUTO, FISHGROUP_TWINLEAF
	map Route201, TILESET_SINNOH_1, ROUTE, ROUTE_201, MUSIC_ROUTE_201, FALSE, PALETTE_AUTO, FISHGROUP_NONE
	map PlayersHouse1F, TILESET_PLAYERS_HOUSE, INDOOR, TWINLEAF_TOWN, MUSIC_TWINLEAF_TOWN, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map PlayersHouse2F, TILESET_PLAYERS_ROOM, INDOOR, TWINLEAF_TOWN, MUSIC_TWINLEAF_TOWN, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map RivalHouse1F, TILESET_PLAYERS_HOUSE, INDOOR, TWINLEAF_TOWN, MUSIC_TWINLEAF_TOWN, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map RivalHouse2F, TILESET_PLAYERS_ROOM, INDOOR, TWINLEAF_TOWN, MUSIC_TWINLEAF_TOWN, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map TwinleafHouse1, TILESET_HOUSE, INDOOR, TWINLEAF_TOWN, MUSIC_TWINLEAF_TOWN, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map TwinleafHouse2, TILESET_HOUSE, INDOOR, TWINLEAF_TOWN, MUSIC_TWINLEAF_TOWN, FALSE, PALETTE_DAY, FISHGROUP_NONE
	
MapGroup_Sandgem:
	map SandgemTown, TILESET_SINNOH_1, TOWN, SANDGEM_TOWN, MUSIC_SANDGEM_TOWN, FALSE, PALETTE_AUTO, FISHGROUP_NONE
	map Route202, TILESET_SINNOH_1, ROUTE, ROUTE_202, MUSIC_ROUTE_201, FALSE, PALETTE_AUTO, FISHGROUP_NONE
	map Route219, TILESET_SINNOH_1, ROUTE, ROUTE_219, MUSIC_ROUTE_201, FALSE, PALETTE_AUTO, FISHGROUP_ROUTE_219
	map RowansLab, TILESET_LAB, INDOOR, SANDGEM_TOWN, MUSIC_PROF_ROWAN, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map SandgemHouse1, TILESET_HOUSE, INDOOR, SANDGEM_TOWN, MUSIC_SANDGEM_TOWN, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map AssistantHouse1F, TILESET_PLAYERS_HOUSE, INDOOR, SANDGEM_TOWN, MUSIC_SANDGEM_TOWN, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map AssistantHouse2F, TILESET_PLAYERS_HOUSE, INDOOR, SANDGEM_TOWN, MUSIC_SANDGEM_TOWN, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map SandgemPokemonCenter1F, TILESET_POKECENTER, INDOOR, SANDGEM_TOWN, MUSIC_POKEMON_CENTER, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map SandgemPokeMart, TILESET_MART, INDOOR, SANDGEM_TOWN, MUSIC_POKE_MART, FALSE, PALETTE_DAY, FISHGROUP_NONE

MapGroup_Jubilife:
	map JubilifeCity, TILESET_SINNOH_1, TOWN, JUBILIFE_CITY, MUSIC_VIOLET_CITY, FALSE, PALETTE_AUTO, FISHGROUP_NONE
	map Route203, TILESET_SINNOH_1, ROUTE, ROUTE_203, MUSIC_ROUTE_203, FALSE, PALETTE_AUTO, FISHGROUP_ROUTE_203
	map Route204S, TILESET_SINNOH_1, ROUTE, ROUTE_204, MUSIC_ROUTE_203, FALSE, PALETTE_AUTO, FISHGROUP_ROUTE_203
	map JubilifeApartmentSE1F, TILESET_MODERN_INTERIOR, INDOOR, JUBILIFE_CITY, MUSIC_VIOLET_CITY, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map JubilifeApartmentSE2F, TILESET_MODERN_INTERIOR, INDOOR, JUBILIFE_CITY, MUSIC_VIOLET_CITY, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map JubilifeApartmentNE1F, TILESET_MODERN_INTERIOR, INDOOR, JUBILIFE_CITY, MUSIC_VIOLET_CITY, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map JubilifeApartmentNE2F, TILESET_MODERN_INTERIOR, INDOOR, JUBILIFE_CITY, MUSIC_VIOLET_CITY, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map JubilifeApartmentSW1F, TILESET_MODERN_INTERIOR, INDOOR, JUBILIFE_CITY, MUSIC_VIOLET_CITY, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map JubilifeApartmentSW2F, TILESET_MODERN_INTERIOR, INDOOR, JUBILIFE_CITY, MUSIC_VIOLET_CITY, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map TrainersSchool, TILESET_LAB, INDOOR, JUBILIFE_CITY, MUSIC_VIOLET_CITY, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map PoketchCompany1F, TILESET_RADIO_TOWER, INDOOR, JUBILIFE_CITY, MUSIC_VIOLET_CITY, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map PoketchCompany2F, TILESET_RADIO_TOWER, INDOOR, JUBILIFE_CITY, MUSIC_VIOLET_CITY, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map PoketchCompany3F, TILESET_RADIO_TOWER, INDOOR, JUBILIFE_CITY, MUSIC_VIOLET_CITY, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map TVStation1F, TILESET_RADIO_TOWER, INDOOR, JUBILIFE_CITY, MUSIC_VIOLET_CITY, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map TVStation2F, TILESET_RADIO_TOWER, INDOOR, JUBILIFE_CITY, MUSIC_VIOLET_CITY, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map TVStation2F2, TILESET_RADIO_TOWER, INDOOR, JUBILIFE_CITY, MUSIC_VIOLET_CITY, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map TVStation3F, TILESET_RADIO_TOWER, INDOOR, JUBILIFE_CITY, MUSIC_VIOLET_CITY, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map TVStation3F2, TILESET_RADIO_TOWER, INDOOR, JUBILIFE_CITY, MUSIC_VIOLET_CITY, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map TVStation3F3, TILESET_RADIO_TOWER, INDOOR, JUBILIFE_CITY, MUSIC_VIOLET_CITY, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map TVStation4F, TILESET_RADIO_TOWER, INDOOR, JUBILIFE_CITY, MUSIC_VIOLET_CITY, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map TVStationElevator, TILESET_RADIO_TOWER, INDOOR, JUBILIFE_CITY, MUSIC_VIOLET_CITY, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map PokemonCommunicationCenter, TILESET_POKECOM_CENTER, INDOOR, JUBILIFE_CITY, MUSIC_POKEMON_CENTER, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map JubilifePokemonCenter1F, TILESET_POKECENTER, INDOOR, JUBILIFE_CITY, MUSIC_POKEMON_CENTER, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map JubilifePokeMart, TILESET_MART, INDOOR, JUBILIFE_CITY, MUSIC_POKE_MART, FALSE, PALETTE_DAY, FISHGROUP_NONE

MapGroup_Oreburgh:
	map OreburghCity, TILESET_SINNOH_2, TOWN, OREBURGH_CITY, MUSIC_OREBURGH_CITY, FALSE, PALETTE_AUTO, FISHGROUP_NONE
	map Route207, TILESET_SINNOH_2, ROUTE, ROUTE_207, MUSIC_ROUTE_206, FALSE, PALETTE_AUTO, FISHGROUP_NONE
	map OreburghPokemonCenter1F, TILESET_POKECENTER, INDOOR, OREBURGH_CITY, MUSIC_POKEMON_CENTER, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map OreburghPokeMart, TILESET_MART, INDOOR, OREBURGH_CITY, MUSIC_POKE_MART, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map OreburghGym, TILESET_GYM_1, INDOOR, OREBURGH_CITY, MUSIC_GYM, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map OreburghApartmentNW1F, TILESET_MODERN_INTERIOR, INDOOR, OREBURGH_CITY, MUSIC_OREBURGH_CITY, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map OreburghApartmentNW2F, TILESET_MODERN_INTERIOR, INDOOR, OREBURGH_CITY, MUSIC_OREBURGH_CITY, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map OreburghApartmentN1F, TILESET_MODERN_INTERIOR, INDOOR, OREBURGH_CITY, MUSIC_OREBURGH_CITY, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map OreburghApartmentN2F, TILESET_MODERN_INTERIOR, INDOOR, OREBURGH_CITY, MUSIC_OREBURGH_CITY, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map OreburghApartmentE1F, TILESET_MODERN_INTERIOR, INDOOR, OREBURGH_CITY, MUSIC_OREBURGH_CITY, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map OreburghApartmentE2F, TILESET_MODERN_INTERIOR, INDOOR, OREBURGH_CITY, MUSIC_OREBURGH_CITY, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map OreburghHouseW, TILESET_HOUSE, INDOOR, OREBURGH_CITY, MUSIC_OREBURGH_CITY, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map OreburghHouseN, TILESET_HOUSE, INDOOR, OREBURGH_CITY, MUSIC_OREBURGH_CITY, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map OreburghHouseE, TILESET_HOUSE, INDOOR, OREBURGH_CITY, MUSIC_OREBURGH_CITY, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map OreburghMuseum, TILESET_MUSEUM, INDOOR, OREBURGH_CITY, MUSIC_OREBURGH_CITY, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map Route206, TILESET_SINNOH_2, ROUTE, ROUTE_206, MUSIC_PLACEHOLDER, FALSE, PALETTE_AUTO, FISHGROUP_NONE
	map Route206SGate, TILESET_GATE, GATE, ROUTE_206, MUSIC_PLACEHOLDER, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map Route206NGate, TILESET_GATE, GATE, ROUTE_206, MUSIC_PLACEHOLDER, FALSE, PALETTE_DAY, FISHGROUP_NONE

MapGroup_Canalave:
	map JubilifeWestGate, TILESET_GATE, GATE, ROUTE_203, MUSIC_ROUTE_203, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map Route218, TILESET_SINNOH_1, ROUTE, ROUTE_203, MUSIC_ROUTE_203, FALSE, PALETTE_AUTO, FISHGROUP_ROUTE_218
	map CanalaveEastGate, TILESET_GATE, GATE, ROUTE_203, MUSIC_ROUTE_203, FALSE, PALETTE_DAY, FISHGROUP_NONE

MapGroup_Floaroma:
	map Route204N, TILESET_SINNOH_3, ROUTE, ROUTE_204, MUSIC_ROUTE_203, FALSE, PALETTE_AUTO, FISHGROUP_NONE
	map FloaromaTown, TILESET_SINNOH_3, TOWN, FLOAROMA_TOWN, MUSIC_PLACEHOLDER, FALSE, PALETTE_AUTO, FISHGROUP_NONE
	map FloaromaPokemonCenter1F, TILESET_POKECENTER, INDOOR, FLOAROMA_TOWN, MUSIC_POKEMON_CENTER, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map FloaromaPokeMart, TILESET_MART, INDOOR, FLOAROMA_TOWN, MUSIC_POKE_MART, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map FloaromaHouseW, TILESET_HOUSE, INDOOR, FLOAROMA_TOWN, MUSIC_PLACEHOLDER, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map FloaromaHouseE, TILESET_HOUSE, INDOOR, FLOAROMA_TOWN, MUSIC_PLACEHOLDER, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map FloaromaFlowerShop, TILESET_HOUSE, INDOOR, FLOAROMA_TOWN, MUSIC_PLACEHOLDER, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map Route205S, TILESET_SINNOH_3, ROUTE, ROUTE_205, MUSIC_PLACEHOLDER, FALSE, PALETTE_AUTO, FISHGROUP_NONE
	map Route205House, TILESET_MODERN_INTERIOR, INDOOR, ROUTE_205, MUSIC_PLACEHOLDER, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map ValleyWindworksExt, TILESET_SINNOH_3, ROUTE, VALLEY_WINDWORKS, MUSIC_PLACEHOLDER, FALSE, PALETTE_AUTO, FISHGROUP_NONE
	map ValleyWindworksInt, TILESET_FACILITY, INDOOR, VALLEY_WINDWORKS, MUSIC_PLACEHOLDER, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map EternaForestExt, TILESET_SINNOH_3, ROUTE, ETERNA_FOREST, MUSIC_PLACEHOLDER, FALSE, PALETTE_AUTO, FISHGROUP_NONE
	map Route205N, TILESET_SINNOH_3, ROUTE, ROUTE_205, MUSIC_PLACEHOLDER, FALSE, PALETTE_AUTO, FISHGROUP_NONE
	map FuegoIronworksExt, TILESET_SINNOH_3, ROUTE, FUEGO_IRONWORKS, MUSIC_PLACEHOLDER, FALSE, PALETTE_AUTO, FISHGROUP_NONE
	map EternaCity, TILESET_SINNOH_3, TOWN, ETERNA_CITY, MUSIC_PLACEHOLDER, FALSE, PALETTE_AUTO, FISHGROUP_NONE
	map EternaPokemonCenter1F, TILESET_POKECENTER, INDOOR, ETERNA_CITY, MUSIC_POKEMON_CENTER, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map EternaPokeMart, TILESET_MART, INDOOR, ETERNA_CITY, MUSIC_POKE_MART, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map EternaGym, TILESET_GYM_1, INDOOR, ETERNA_CITY, MUSIC_GYM, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map EternaBikeShop, TILESET_BIKE_SHOP, INDOOR, ETERNA_CITY, MUSIC_PLACEHOLDER, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map EternaHerbShop, TILESET_HOUSE, INDOOR, ETERNA_CITY, MUSIC_PLACEHOLDER, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map EternaUndergroundHouse, TILESET_MUSEUM, INDOOR, ETERNA_CITY, MUSIC_PLACEHOLDER, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map EternaApartment1F, TILESET_MODERN_INTERIOR, INDOOR, ETERNA_CITY, MUSIC_PLACEHOLDER, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map EternaApartment2F, TILESET_MODERN_INTERIOR, INDOOR, ETERNA_CITY, MUSIC_PLACEHOLDER, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map EternaApartment3F, TILESET_MODERN_INTERIOR, INDOOR, ETERNA_CITY, MUSIC_PLACEHOLDER, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map EternaHouseW, TILESET_HOUSE, INDOOR, ETERNA_CITY, MUSIC_PLACEHOLDER, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map EternaHouseE, TILESET_HOUSE, INDOOR, ETERNA_CITY, MUSIC_PLACEHOLDER, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map Route211W, TILESET_SINNOH_3, ROUTE, ROUTE_211, MUSIC_PLACEHOLDER, FALSE, PALETTE_AUTO, FISHGROUP_NONE
	
MapGroup_Meadow:
	map FloaromaMeadow, TILESET_MEADOW, ROUTE, FLOAROMA_MEADOW, MUSIC_PLACEHOLDER, FALSE, PALETTE_AUTO, FISHGROUP_NONE
	map FloaromaMeadowHouse, TILESET_HOUSE, INDOOR, FLOAROMA_MEADOW, MUSIC_PLACEHOLDER, FALSE, PALETTE_DAY, FISHGROUP_NONE
	
MapGroup_Lakes:
	map LakeVerityLow, TILESET_LAKE, ROUTE, LAKE_VERITY, MUSIC_UNION_CAVE, FALSE, PALETTE_AUTO, FISHGROUP_LAKE_VERITY
	map LakeVerityHigh, TILESET_LAKE, ROUTE, LAKE_VERITY, MUSIC_UNION_CAVE, FALSE, PALETTE_AUTO, FISHGROUP_LAKE_VERITY
	map LakeVerityCavern, TILESET_CAVE, CAVE, LAKE_VERITY, MUSIC_UNION_CAVE, TRUE, PALETTE_NITE, FISHGROUP_NONE

MapGroup_Dungeons:
	map RavagedPath, TILESET_CAVE, CAVE, RAVAGED_PATH, MUSIC_UNION_CAVE, FALSE, PALETTE_NITE, FISHGROUP_RAVAGED_PATH
	map OreburghGate1F, TILESET_CAVE, CAVE, OREBURGH_GATE, MUSIC_OREBURGH_GATE, FALSE, PALETTE_NITE, FISHGROUP_NONE
	map OreburghGateB1F, TILESET_CAVE, CAVE, OREBURGH_GATE, MUSIC_OREBURGH_GATE, FALSE, PALETTE_NITE, FISHGROUP_OREBURGH_GATE
	map OreburghMineB1F, TILESET_CAVE, CAVE, OREBURGH_MINE, MUSIC_UNION_CAVE, FALSE, PALETTE_NITE, FISHGROUP_NONE
	map OreburghMineB2F, TILESET_CAVE, CAVE, OREBURGH_MINE, MUSIC_UNION_CAVE, FALSE, PALETTE_NITE, FISHGROUP_NONE
	map EternaForestInt, TILESET_FOREST, ROUTE, ETERNA_FOREST, MUSIC_PLACEHOLDER, FALSE, PALETTE_NITE, FISHGROUP_NONE
	map EternaGalacticBuilding1F, TILESET_FACILITY, INDOOR, ETERNA_CITY, MUSIC_PLACEHOLDER, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map EternaGalacticBuilding2F, TILESET_FACILITY, INDOOR, ETERNA_CITY, MUSIC_PLACEHOLDER, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map EternaGalacticBuilding3F, TILESET_FACILITY, INDOOR, ETERNA_CITY, MUSIC_PLACEHOLDER, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map EternaGalacticBuilding4F, TILESET_FACILITY, INDOOR, ETERNA_CITY, MUSIC_PLACEHOLDER, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map OldChateauEntryway, TILESET_OLD_CHATEAU, DUNGEON, OLD_CHATEAU, MUSIC_PLACEHOLDER, FALSE, PALETTE_NITE, FISHGROUP_NONE
	map OldChateauDining, TILESET_OLD_CHATEAU, DUNGEON, OLD_CHATEAU, MUSIC_PLACEHOLDER, FALSE, PALETTE_NITE, FISHGROUP_NONE
	map OldChateauBedrooms, TILESET_OLD_CHATEAU, DUNGEON, OLD_CHATEAU, MUSIC_PLACEHOLDER, FALSE, PALETTE_NITE, FISHGROUP_NONE
	map FuegoIronworksInt, TILESET_FACILITY, INDOOR, FUEGO_IRONWORKS, MUSIC_PLACEHOLDER, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map WaywardCave1F, TILESET_CAVE_2, DUNGEON, WAYWARD_CAVE, MUSIC_OREBURGH_GATE, FALSE, PALETTE_NITE, FISHGROUP_NONE
	map WaywardCave1F2, TILESET_CAVE_2, DUNGEON, WAYWARD_CAVE, MUSIC_OREBURGH_GATE, FALSE, PALETTE_NITE, FISHGROUP_NONE
	map WaywardCaveB1F, TILESET_CAVE_2, DUNGEON, WAYWARD_CAVE, MUSIC_OREBURGH_GATE, FALSE, PALETTE_NITE, FISHGROUP_NONE
	