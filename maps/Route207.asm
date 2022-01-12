	object_const_def ; object_event constants

Route207_MapScripts:
	db 0 ; scene scripts

	db 0 ; callback

Route207_BikerScript:
	jumptextfaceplayer .Text
.Text:
	text "That slope's too"
	line "slippery."

	para "You'll need a BIKE"
	line "to get up."

	para "You don't have a"
	line "BICYCLE? There's a"
	cont "CYCLE SHOP in"
	cont "ETERNA CITY."
	done

Route207_PokeBallScript:
	itemball POKE_BALL

Route207_SignScript:
	jumptextsign .Text
.Text:
	text "<SIGN|> ROUTE 207"
	line "<SIGND> OREBURGH CITY"
	done

Route207_MapEvents:
	db 0, 0 ; filler

	db 0 ; warp events

	db 0 ; coord events

	db 1 ; bg events
	bg_event 11, 16, BGEVENT_READ, Route207_SignScript

	db 2 ; object events
	object_event 19, 15, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route207_BikerScript, -1
	object_event  3,  7, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route207_PokeBallScript, EVENT_ROUTE_207_POKE_BALL
