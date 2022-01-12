	object_const_def ; object_event constants

Route218_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route218_XAccuracyScript:
	itemball X_ACCURACY

Route218_SignScript:
	jumptextsign .Text
.Text:
	text "    ROUTE 218"
	line "<SIGNR> JUBILIFE CITY"
	done

Route218_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event 41, 14, JUBILIFE_WEST_GATE, 3
	warp_event 41, 15, JUBILIFE_WEST_GATE, 4
	warp_event  6, 12, CANALAVE_EAST_GATE, 1
	warp_event  6, 13, CANALAVE_EAST_GATE, 2
	
	db 0 ; coord events

	db 1 ; bg events
	bg_event 39, 13, BGEVENT_READ, Route218_SignScript

	db 1 ; object events
	object_event 30,  8, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route218_XAccuracyScript, EVENT_ROUTE_218_X_ACCURACY
