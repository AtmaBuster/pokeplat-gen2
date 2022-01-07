; See data/maps/scenes.asm for which maps have scene variables.
; Each scene_script and coord_event is associated with a current scene ID.

; Scene variables default to 0.
SCENE_DEFAULT  EQU 0
; Often a map will have a one-time default event for scene 0, and switch to a
; do-nothing scene 1 when the event finishes.
SCENE_FINISHED EQU 1

; wPokecenter2FSceneID
	const_def 1
	const SCENE_POKECENTER2F_LEAVE_TRADE_CENTER       ; 1
	const SCENE_POKECENTER2F_LEAVE_COLOSSEUM          ; 2
	const SCENE_POKECENTER2F_LEAVE_TIME_CAPSULE       ; 3
	const SCENE_POKECENTER2F_LEAVE_MOBILE_TRADE_ROOM  ; 4
	const SCENE_POKECENTER2F_LEAVE_MOBILE_BATTLE_ROOM ; 5

; wPlayersHouse2FSceneID
	const_def
	const SCENE_PLAYERSHOUSE2F_INIT  ; 0
	const SCENE_PLAYERSHOUSE2F_RIVAL ; 1
	const SCENE_PLAYERSHOUSE2F_DONE  ; 2

; wPlayersHouse1FSceneID
	const_def
	const SCENE_PLAYERSHOUSE1F_FIRST_TIME          ; 0
	const SCENE_PLAYERSHOUSE1F_TRY_EXIT_FIRST_TIME ; 1
	const SCENE_PLAYERSHOUSE1F_NOTHING             ; 2
	const SCENE_PLAYERSHOUSE1F_AFTER_RIVAL1        ; 3

; wTwinleafTownSceneID
	const_def
	const SCENE_TWINLEAFTOWN_MEET_RIVAL ; 0
	const SCENE_TWINLEAFTOWN_CANT_LEAVE ; 1
	const SCENE_TWINLEAFTOWN_NOTHING    ; 2

; wRoute201SceneID
	const_def
	const SCENE_ROUTE201_FIND_RIVAL   ; 0
	const SCENE_ROUTE201_CANT_LEAVE   ; 1
	const SCENE_ROUTE201_NOTHING      ; 2
	const SCENE_ROUTE201_FIND_RIVAL_2 ; 3
	const SCENE_ROUTE201_RIVAL_FOLLOW ; 4

; wSandgemTownSceneID
	const_def
	const SCENE_SANDGEMTOWN_FIRST_VISIT ; 0
	const SCENE_SANDGEMTOWN_AFTER_LAB   ; 1
	const SCENE_SANDGEMTOWN_NOTHING     ; 2

; wJubilifeCitySceneID
	const_def
	const SCENE_JUBILIFECITY_FIRST_TIME         ; 0
	const SCENE_JUBILIFECITY_CANT_LEAVE_RIVAL   ; 1
	const SCENE_JUBILIFECITY_START_POKETCH      ; 2
	const SCENE_JUBILIFECITY_CANT_LEAVE_POKETCH ; 3
	const SCENE_JUBILIFECITY_NOTHING            ; 4
