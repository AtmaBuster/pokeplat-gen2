	object_const_def ; object_event constants

OreburghMuseum_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

OreburghMuseum_ReceptionistScript:
	jumptextfaceplayer .Text
.Text:
	text "Hello! Welcome to"
	line "the OREBURGH"
	cont "MINING MUSEUM!"
	done

OreburghMuseum_FossilReviverScript:
	faceplayer
	jumptext .Text

.Text:
	text "Hello, hello!"
	line "How are you?"

	para "I study #MON"
	line "FOSSILS! Me! Right"
	cont "here and now!"

	para "On the verge of"
	line "a breakthrough, I"
	cont "am, to achieve"
	cont "extraction from"
	cont "FOSSILS."

	para "From FOSSILS I can"
	line "extract #MON,"
	cont "but not yet, not"
	cont "yet."
	done

OreburghMuseum_UndergroundWomanScript:
	jumptextfaceplayer .Text
.Text:
	text "It's a little far"
	line "from here, but"
	cont "there is a city"
	cont "that's called"
	cont "ETERNA CITY."

	para "I've heard a"
	line "curious person"
	cont "named the"
	cont "UNDERGROUND MAN"
	cont "lives there."

	para "With a name like"
	line "that, he must be"
	cont "an authority on"
	cont "the UNDERGROUND."
	done

OreburghMuseum_MineKidScript:
	jumptextfaceplayer .Text
.Text:
	text "Well, how about"
	line "that!"

	para "The OREBURGH MINE"
	line "extends under the"
	cont "seafloor!"
	done

OreburghMuseum_CoalGuyScript:
	jumptextfaceplayer .Text
.Text:
	text "Whoa! So this is"
	line "coal?"

	para "I never expected"
	line "something so big!"

	para "And that color! It"
	line "really is as black"
	cont "as they say!"
	done

OreburghMuseum_StrongMonGirlScript:
	jumptextfaceplayer .Text
.Text:
	text "Wow! The #MON"
	line "that carried this"
	cont "must be terribly"
	cont "strong!"
	done

OreburghMuseum_StrongMindGuyScript:
	jumptextfaceplayer .Text
.Text:
	text "Mining must take a"
	line "strong mind, not"
	cont "just a tough body."

	para "Think about it."
	line "You're in darkness,"
	cont "just desperately"
	cont "digging through"
	cont "rock."
	done

OreburghMuseum_HistoryManScript:
	jumptextfaceplayer .Text
.Text:
	text "The history of"
	line "OREBURGH MINE…"

	para "You could call it"
	line "a history of"
	cont "effort and friend-"
	cont "ship between"
	cont "people and"
	cont "#MON."
	done

OreburghMuseum_CoalSign1Script:
	jumptext .Text
.Text:
	text "How Coal is Made 1"

	para "“In a time long"
	line "before history,"
	cont "vegetative matter"
	cont "was swept along by"
	cont "rain and rivers."
	cont "It came to be"
	cont "buried under the"
	cont "ground.”"
	done

OreburghMuseum_CoalSign2Script:
	jumptext .Text
.Text:
	text "How Coal is Made 2"

	para "“The buried plant"
	line "matter was forced"
	cont "ever deeper under"
	cont "the ground due to"
	cont "tremors and"
	cont "fissures caused by"
	cont "shifting"
	cont "landmasses.”"
	done

OreburghMuseum_CoalSign3Script:
	jumptext .Text
.Text:
	text "How Coal is Made 3"

	para "“Deep under the"
	line "ground, the plant"
	cont "matter was"
	cont "subjected to heavy"
	cont "pressure and the"
	cont "heat of magma. It"
	cont "gradually turned"
	cont "into coal.”"
	done

OreburghMuseum_LampDisplayScript:
	jumptext .Text
.Text:
	text "Different kinds of"
	line "lamps are"
	cont "displayed."

	para "They appear to"
	line "have been worn on"
	cont "someone's head"
	cont "while underground."
	done

OreburghMuseum_DifferentCoalDisplayScript:
	jumptext .Text
.Text:
	text "Samples of coal"
	line "from different"
	cont "regions are"
	cont "displayed."
	done

OreburghMuseum_WoodenToolDisplayScript:
	jumptext .Text
.Text:
	text "Badly scarred"
	line "wooden tools are"
	cont "displayed."

	para "They apparently"
	line "dug out coal using"
	cont "these tools in the"
	cont "olden days."
	done

OreburghMuseum_CoalSampleDisplayScript:
	jumptext .Text
.Text:
	text "The box contains"
	line "categorized"
	cont "samples of coal."
	done

OreburghMuseum_EverydayItemDisplayScript:
	jumptext .Text
.Text:
	text "The everyday items"
	line "and tools of past"
	cont "mine workers are"
	cont "displayed."
	done

OreburghMuseum_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  9, OREBURGH_CITY, 15
	warp_event  3,  9, OREBURGH_CITY, 15

	db 0 ; coord events

	db 8 ; bg events
	bg_event  9,  1, BGEVENT_READ, OreburghMuseum_CoalSign1Script
	bg_event 11,  1, BGEVENT_READ, OreburghMuseum_CoalSign2Script
	bg_event 13,  1, BGEVENT_READ, OreburghMuseum_CoalSign3Script
	bg_event 10,  4, BGEVENT_READ, OreburghMuseum_LampDisplayScript
	bg_event 14,  4, BGEVENT_READ, OreburghMuseum_DifferentCoalDisplayScript
	bg_event 10,  7, BGEVENT_READ, OreburghMuseum_WoodenToolDisplayScript
	bg_event 13,  7, BGEVENT_READ, OreburghMuseum_CoalSampleDisplayScript
	bg_event 15,  7, BGEVENT_READ, OreburghMuseum_EverydayItemDisplayScript

	db 8 ; object events
	object_event  2,  1, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OreburghMuseum_ReceptionistScript, -1
	object_event  3,  1, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OreburghMuseum_FossilReviverScript, -1
	object_event  1,  4, SPRITE_TEACHER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OreburghMuseum_UndergroundWomanScript, -1
	object_event  5,  1, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OreburghMuseum_MineKidScript, -1
	object_event  5,  4, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OreburghMuseum_CoalGuyScript, -1
	object_event  6,  4, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OreburghMuseum_StrongMonGirlScript, -1
	object_event  5,  8, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OreburghMuseum_StrongMindGuyScript, -1
	object_event 11,  9, SPRITE_GRAMPS, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OreburghMuseum_HistoryManScript, -1
