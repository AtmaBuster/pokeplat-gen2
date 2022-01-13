	object_const_def ; object_event constants

OreburghApartmentN2F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

OreburghApartmentN2F_AbilityGuyScript:
	jumptextfaceplayer .Text
.Text:
	text "A few #MON have"
	line "a special power"
	cont "called an ability."
	done

OreburghApartmentN2F_PikcupGirlScript:
	jumptextfaceplayer .Text
.Text:
	text "My favorite"
	line "#MON ability is"
	cont "my PACHIRISU's"
	cont "PICKUP."

	para "My darling picks"
	line "up a lot of"
	cont "dropped items"
	cont "without me even"
	cont "noticing!"
	done

OreburghApartmentN2F_GeodudeGuyScript:
	faceplayer
	checkevent EVENT_OREBURGH_GOT_HEAL_BALL
	iftrue .After
	checkpoke GEODUDE
	iftrue .HaveGeodude
	jumptext .IntroText

.HaveGeodude:
	opentext
	writetext .IntroText
	buttonsound
	writetext .ThatsGeodudeText
	waitbutton
	verbosegiveitem HEAL_BALL
	iffalse .BagFull
	setevent EVENT_OREBURGH_GOT_HEAL_BALL
.BagFull:
	closetext
	end

.After:
	jumptext .AfterText

.IntroText:
	text "The view is good"
	line "from the second"
	cont "floor, but it's a"
	cont "pain going"
	cont "outside."

	para "If you don't mind,"
	line "how about showing"
	cont "me a #MON"
	cont "called GEODUDE?"
	done

.ThatsGeodudeText:
	text "Oh! That #MON!"
	line "That's a GEODUDE!"

	para "Wow, that's cool…"
	line "It's so cute…"

	para "That does it!"

	para "I'll go out and"
	line "catch #MON too!"

	para "Thank you, my"
	line "friend! This is a"
	cont "token of my"
	cont "thanks!"
	done

.AfterText:
	text "Yeah, there are so"
	line "many kinds of"
	cont "#MON out in the"
	cont "world."

	para "I want to see them"
	line "all now!"
	done

OreburghApartmentN2F_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  5,  1, OREBURGH_APARTMENT_N_1F, 3

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  2,  3, SPRITE_ROCKER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OreburghApartmentN2F_AbilityGuyScript, -1
	object_event  5,  6, SPRITE_TEACHER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OreburghApartmentN2F_PikcupGirlScript, -1
	object_event  9,  2, SPRITE_FISHER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OreburghApartmentN2F_GeodudeGuyScript, -1
