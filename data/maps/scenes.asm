scene_var: MACRO
; map, variable
	map_id \1
	dw \2
ENDM

MapScenes::
	scene_var POKECENTER_2F,      wPokecenter2FSceneID
	scene_var TRADE_CENTER,       wTradeCenterSceneID
	scene_var COLOSSEUM,          wColosseumSceneID
	scene_var TIME_CAPSULE,       wTimeCapsuleSceneID
	scene_var MOBILE_TRADE_ROOM,  wMobileTradeRoomSceneID
	scene_var MOBILE_BATTLE_ROOM, wMobileBattleRoomSceneID
	scene_var PLAYERS_HOUSE_2F,   wPlayersHouse2FSceneID
	scene_var PLAYERS_HOUSE_1F,   wPlayersHouse1FSceneID
	scene_var TWINLEAF_TOWN,      wTwinleafTownSceneID
	scene_var RIVAL_HOUSE_2F,     wRivalHouse2FSceneID
	scene_var ROUTE_201,          wRoute201SceneID
	scene_var LAKE_VERITY_LOW,    wLakeVerityLowSceneID
	scene_var SANDGEM_TOWN,       wSandgemTownSceneID
	scene_var ROWANS_LAB,         wRowansLabSceneID
	db -1 ; end
