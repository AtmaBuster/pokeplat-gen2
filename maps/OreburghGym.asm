	object_const_def ; object_event constants

OreburghGym_MapScripts:
	db 2 ; scene scripts
	scene_script .Dummy ; SCENE_DEFAULT
	scene_script .Dummy ; SCENE_FINISHED

	db 0 ; callbacks

.Dummy:
	end

OreburghGym_BridgeOn:
	callasm .Bridge
	setscene SCENE_FINISHED
	end

.Bridge:
	changebridgeblock 2, 12, $2c, OREBURGH_GYM
	changebridgeblock 4, 12, $2d, OREBURGH_GYM
	changebridgeblock 6, 12, $2e, OREBURGH_GYM
	bridgeon

OreburghGym_BridgeOff:
	callasm .Bridge
	setscene SCENE_DEFAULT
	end

.Bridge:
	changebridgeblock 2, 12, $0c, OREBURGH_GYM
	changebridgeblock 4, 12, $0d, OREBURGH_GYM
	changebridgeblock 6, 12, $0e, OREBURGH_GYM
	bridgeoff

OreburghGym_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4, 19, OREBURGH_CITY, 14
	warp_event  5, 19, OREBURGH_CITY, 14

	db 8 ; coord events
	coord_event  1, 14, SCENE_DEFAULT, OreburghGym_BridgeOn
	coord_event  7, 10, SCENE_DEFAULT, OreburghGym_BridgeOn
	coord_event  8, 10, SCENE_DEFAULT, OreburghGym_BridgeOn
	coord_event  9, 10, SCENE_DEFAULT, OreburghGym_BridgeOn
	coord_event  1, 15, SCENE_FINISHED, OreburghGym_BridgeOff
	coord_event  7,  9, SCENE_FINISHED, OreburghGym_BridgeOff
	coord_event  8,  9, SCENE_FINISHED, OreburghGym_BridgeOff
	coord_event  9,  9, SCENE_FINISHED, OreburghGym_BridgeOff

	db 0 ; bg events

	db 0 ; object events
