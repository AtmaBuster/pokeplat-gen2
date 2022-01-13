	object_const_def ; object_event constants

OreburghApartmentE2F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

OreburghApartmentE2F_GreatBallKidScript:
	faceplayer
	checkevent EVENT_OREBURGH_GOT_GREAT_BALL
	iftrue .After
	opentext
	writetext .IntroText
	waitbutton
	verbosegiveitem GREAT_BALL
	iffalse .BagFull
	setevent EVENT_OREBURGH_GOT_GREAT_BALL
	writetext .AfterText
	waitbutton
.BagFull:
	closetext
	end

.After:
	jumptext .AfterText

.IntroText:
	text "Wow… Your #MON's"
	line "eyes are sparkling"
	cont "brightly!"

	para "Seeing that makes"
	line "me happy!"

	para "Here, I want you"
	line "to have this!"
	done

.AfterText:
	text "You know how"
	line "#MON stay"
	cont "inside their"
	cont "# BALLS?"

	para "I try to think"
	line "about what would"
	cont "be the best"
	cont "# BALLS for"
	cont "them."
	done

OreburghApartmentE2F_UtmostCareGuyScript:
	jumptextfaceplayer .Text
.Text:
	text "The OREBURGH MINE"
	line "is operated with"
	cont "the utmost care."

	para "We avoid causing"
	line "damage to the"
	cont "natural habitats"
	cont "of #MON."
	done

OreburghApartmentE2F_MachineGuyScript:
	jumptextfaceplayer .Text
.Text:
	text "Coal is carried"
	line "out of OREBURGH"
	cont "MINE on a fully"
	cont "automated system."

	para "Machines do all"
	line "the work"
	cont "automatically."

	para "So, it's all very"
	line "easy."
	done

OreburghApartmentE2F_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  5,  1, OREBURGH_APARTMENT_E_1F, 3

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  1,  4, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OreburghApartmentE2F_GreatBallKidScript, -1
	object_event  6,  6, SPRITE_GENTLEMAN, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OreburghApartmentE2F_UtmostCareGuyScript, -1
	object_event  9,  2, SPRITE_SCIENTIST, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OreburghApartmentE2F_MachineGuyScript, -1
