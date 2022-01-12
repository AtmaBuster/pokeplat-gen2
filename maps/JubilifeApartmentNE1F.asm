	object_const_def ; object_event constants

JubilifeApartmentNE1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

JubilifeApartmentNE1F_WomanScript:
	faceplayer
	checkevent EVENT_JUBILIFE_GOT_QUICK_CLAW
	iftrue .After
	opentext
	writetext .HaveThisText
	waitbutton
	verbosegiveitem QUICK_CLAW
	iffalse .BagFull
	setevent EVENT_JUBILIFE_GOT_QUICK_CLAW
.BagFull:
	closetext
	end

.After:
	jumptext .QuickClawText

.HaveThisText:
	text "Oh, your #MON"
	line "is quite adorable!"

	para "Here, try making"
	line "it hold this"
	cont "QUICK CLAW."
	done

.QuickClawText:
	text "A #MON holding"
	line "a QUICK CLAW can"
	cont "sometimes attack"
	cont "first, even if it"
	cont "is normally a"
	cont "little bit slow."

	para "There are other"
	line "items that are"
	cont "only useful when"
	cont "given to a"
	cont "#MON."

	para "Try finding other"
	line "items that you can"
	cont "make your #MON"
	cont "hold."

	para "…I sound like a"
	line "teacher or"
	cont "something."
	done

JubilifeApartmentNE1F_GrannyScript:
	jumptextfaceplayer .Text
.Text:
	text "Oh, hello,"
	line "darlings."

	para "Isn't my #TCH"
	line "quite fetching?"

	para "It's the latest"
	line "design that just"
	cont "came out."

	para "I obtained it"
	line "instantly, of"
	cont "course."

	para "A TRAINER would be"
	line "simply lost"
	cont "without a #TCH,"
	cont "after all."
	done

JubilifeApartmentNE1F_PikachuScript:
	faceplayer
	opentext
	writetext .Text
	cry PIKACHU
	waitsfx
	closetext
	end

.Text:
	text "PIKACHU: Piika pi!"
	done

JubilifeApartmentNE1F_PachirisuScript:
	faceplayer
	opentext
	writetext .Text
	cry PACHIRISU
	waitsfx
	closetext
	end

.Text:
	text "PACHIRISU:"
	line "Pachipachii?"
	done

JubilifeApartmentNE1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  6,  7, JUBILIFE_CITY, 1
	warp_event  7,  7, JUBILIFE_CITY, 1
	warp_event  8,  1, JUBILIFE_APARTMENT_NE_2F, 1
	
	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	object_event  4,  3, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, JubilifeApartmentNE1F_WomanScript, -1
	object_event  9,  5, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, JubilifeApartmentNE1F_GrannyScript, -1
	object_event  6,  4, SPRITE_PIKACHU, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, JubilifeApartmentNE1F_PikachuScript, -1
	object_event  5,  3, SPRITE_CLEFAIRY, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, JubilifeApartmentNE1F_PachirisuScript, -1
