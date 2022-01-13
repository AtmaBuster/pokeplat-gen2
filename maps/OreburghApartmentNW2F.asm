	object_const_def ; object_event constants

OreburghApartmentNW2F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

OreburghApartmentNW2F_DuskBallGirlScript:
	faceplayer
	checkevent EVENT_OREBURGH_GOT_DUSK_BALL
	iftrue .After
	opentext
	writetext .IntroText
	waitbutton
	verbosegiveitem DUSK_BALL
	iffalse .BagFull
	setevent EVENT_OREBURGH_GOT_DUSK_BALL
.BagFull:
	closetext
	end

.After:
	jumptext .AfterText

.IntroText:
	text "Are you catching"
	line "#MON?"

	para "Here, that this if"
	line "you'd like."
	done

.AfterText:
	text "The DUSK BALL is"
	line "a # BALL"
	cont "designed for use"
	cont "in darkness."

	para "It works better if"
	line "you use it at"
	cont "night or in a"
	cont "cave."
	done

OreburghApartmentNW2F_NicknameGuyScript:
	jumptextfaceplayer .Text
.Text:
	text "Giving nicknames"
	line "to #MON is the"
	cont "way to go."

	para "It makes you feel"
	line "as if they're your"
	cont "very own."
	done

OreburghApartmentNW2F_NicknameWomanScript:
	jumptextfaceplayer .Text
.Text:
	text "But he named our"
	line "PSYDUCK “YELLOW”"
	cont "just because of"
	cont "its color…"

	para "I don't understand"
	line "the logic behind"
	cont "that at all."
	done

OreburghApartmentNW2F_PsyduckScript:
	faceplayer
	opentext
	writetext .Text
	cry PSYDUCK
	waitsfx
	closetext
	end

.Text:
	text "YELLOW: Duuuck?"
	done

OreburghApartmentNW2F_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  5,  1, OREBURGH_APARTMENT_NW_1F, 3

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	object_event  2,  3, SPRITE_LASS, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OreburghApartmentNW2F_DuskBallGirlScript, -1
	object_event  5,  5, SPRITE_WORKER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OreburghApartmentNW2F_NicknameGuyScript, -1
	object_event  7,  5, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OreburghApartmentNW2F_NicknameWomanScript, -1
	object_event  6,  5, SPRITE_RHYDON, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OreburghApartmentNW2F_PsyduckScript, -1
