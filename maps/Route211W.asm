	object_const_def ; object_event constants

Route211W_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	
; Route211W_BridgeOn:
	; callasm .Bridge
	; setscene SCENE_FINISHED
	; end

; .Bridge:
	; changebridgeblock 11, 14, $128, ROUTE_211_W
	; changebridgeblock 11, 15, $128, ROUTE_211_W
	
	; bridgeon

; Route211W_BridgeOff:
	; callasm .Bridge
	; setscene SCENE_DEFAULT
	; end

; .Bridge:
	; changebridgeblock 11, 14, $128, ROUTE_211_W
	; changebridgeblock 11, 15, $128, ROUTE_211_W
	; bridgeoff


Route211W_MapEvents:
	db 0, 0 ; filler

	db 0 ; warp events

	db 0 ; coord events
	; coord_event 11, 13, SCENE_DEFAULT, Route211W_BridgeOn
	; coord_event 11, 16, SCENE_DEFAULT, Route211W_BridgeOn
	; coord_event  9, 10, SCENE_DEFAULT, Route211W_BridgeOn
	; coord_event  8, 10, SCENE_DEFAULT, Route211W_BridgeOn
	; coord_event 11, 12, SCENE_FINISHED, Route211W_BridgeOff
	; coord_event 11, 17, SCENE_FINISHED, Route211W_BridgeOff
	; coord_event  8,  9, SCENE_FINISHED, Route211W_BridgeOff
	; coord_event  9,  9, SCENE_FINISHED, Route211W_BridgeOff

	db 0 ; bg events

	db 0 ; object events
