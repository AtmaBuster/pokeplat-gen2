	object_const_def ; object_event constants

AssistantHouse1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

AssistantHouse1F_GrandpaScript:
	faceplayer
	jumptext .RowanBackText

.RowanBackText:
	text "Ah, so that ROWAN"
	line "fellow is back?"

	para "He's quite the"
	line "remarkable man."

	para "He's been studying"
	line "#MON since way"
	cont "back."

	para "My son and grand-"
	line "child help ROWAN"
	cont "with his studies"
	cont "now."
	done

AssistantHouse1F_SisterScript:
	faceplayer
	opentext
	writetextgender .DawnSisterText, .LucasSisterText
	waitbutton
	closetext
	end

.DawnSisterText:
	text "Who are you?"

	para "…"

	para "Oh… You're <PLAYER>?"

	para "Hey, you're doing"
	line "that #DEX thing"
	cont "for the PROFESSOR!"

	para "Wow! That's the"
	line "same as my big"
	cont "sister!"

	para "Go for it!"
	done

.LucasSisterText:
	text "Who are you?"

	para "…"

	para "Oh… You're <PLAYER>?"

	para "Hey, you're doing"
	line "that #DEX thing"
	cont "for the PROFESSOR!"

	para "Wow! That's the"
	line "same as my big"
	cont "brother!"

	para "Go for it!"
	done

AssistantHouse1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  6,  7, SANDGEM_TOWN, 3
	warp_event  7,  7, SANDGEM_TOWN, 3
	warp_event  5,  0, ASSISTANT_HOUSE_2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  4,  6, SPRITE_GRAMPS, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AssistantHouse1F_GrandpaScript, -1
	object_event  7,  4, SPRITE_TWIN, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AssistantHouse1F_SisterScript, -1
