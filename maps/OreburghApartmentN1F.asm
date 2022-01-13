	object_const_def ; object_event constants

OreburghApartmentN1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

OreburghApartmentN1F_GiftManScript:
	jumptextfaceplayer .Text
.Text:
	text "When you trade a"
	line "#MON, the item"
	cont "it's holding is"
	cont "traded as well."

	para "That's pretty cool,"
	line "huh?"

	para "It means you can"
	line "send an item as a"
	cont "gift along with"
	cont "your #MON in a"
	cont "trade!"
	done

OreburghApartmentN1F_HilaryScript:
	faceplayer
	opentext
	trade NPC_TRADE_HILARY
	waitbutton
	closetext
	end

OreburghApartmentN1F_GrowthWomanScript:
	jumptextfaceplayer .Text
.Text:
	text "A #MON obtained"
	line "in a trade grows"
	cont "quickly."

	para "But if a #MON"
	line "grows too much, it"
	cont "may ignore the"
	cont "TRAINER."

	para "Of course, it won't"
	line "matter if you have"
	cont "lots of GYM"
	cont "BADGES."
	done

OreburghApartmentN1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  6,  7, OREBURGH_CITY, 9
	warp_event  7,  7, OREBURGH_CITY, 9
	warp_event  8,  1, OREBURGH_APARTMENT_N_2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  4,  6, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OreburghApartmentN1F_GiftManScript, -1
	object_event  6,  3, SPRITE_TEACHER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OreburghApartmentN1F_HilaryScript, -1
	object_event  9,  4, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OreburghApartmentN1F_GrowthWomanScript, -1
