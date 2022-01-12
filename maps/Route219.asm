	object_const_def ; object_event constants

Route219_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route219_BeachSignScript:
	jumptextsign .Text
.Text:
	text "<SIGN|> ROUTE 219"
	line "<SIGND> SANDGEM BEACH"
	done

Route219_AntidoteScript:
	itemball ANTIDOTE

Route219_MapEvents:
	db 0, 0 ; filler

	db 0 ; warp events
	
	db 0 ; coord events

	db 1 ; bg events
	bg_event 10,  2, BGEVENT_READ, Route219_BeachSignScript

	db 1 ; object events
	object_event  6,  8, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route219_AntidoteScript, EVENT_ROUTE_219_ANTIDOTE
