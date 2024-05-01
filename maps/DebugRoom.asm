DebugRoom_MapScripts:
	def_scene_scripts

	def_callbacks

DebugRoom_BigTextTestScript:
	opentext
	writetext .BigTextTest
	closetext
	end

.BigTextTest:
	text_big "Longer test :3@"

DebugRoom_BridgeOnScript:
	callasm .BridgeOn
	setscene SCENE_FINISHED
	end

.BridgeOn:
	changebridgeblock 12, 6, $45, DEBUG_ROOM
	changebridgeblock 14, 6, $45, DEBUG_ROOM
	changebridgeblock 16, 6, $45, DEBUG_ROOM
	bridgeon

DebugRoom_BridgeOffScript:
	callasm .BridgeOff
	setscene SCENE_DEFAULT
	end

.BridgeOff:
	changebridgeblock 12, 6, $44, DEBUG_ROOM
	changebridgeblock 14, 6, $44, DEBUG_ROOM
	changebridgeblock 16, 6, $44, DEBUG_ROOM
	bridgeoff

DebugRoom_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  7, 11, TWINLEAF_TOWN, 1
	warp_event  6, 11, TWINLEAF_TOWN, 1

	def_coord_events
	coord_event 10,  9, SCENE_DEFAULT, DebugRoom_BridgeOnScript
	coord_event 19,  9, SCENE_DEFAULT, DebugRoom_BridgeOnScript
	coord_event 10, 10, SCENE_FINISHED, DebugRoom_BridgeOffScript
	coord_event 19, 10, SCENE_FINISHED, DebugRoom_BridgeOffScript

	def_bg_events
	bg_event  7,  5, BGEVENT_READ, DebugRoom_BigTextTestScript

	def_object_events
