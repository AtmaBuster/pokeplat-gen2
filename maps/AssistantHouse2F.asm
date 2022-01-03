	object_const_def ; object_event constants

AssistantHouse2F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

AssistantHouse2F_ComputerScript:
	jumptext .Text
.Text:
	text "<PLAYER> checked"
	line "the PC screen."

	para "Adventure Rule"
	line "No. 1"

	para "The START Button"
	line "opens the menu!"

	para "Adventure Rule"
	line "No. 2"

	para "Record your prog-"
	line "ress with SAVE."

	para "There is nothing"
	line "else on here…"
	done

AssistantHouse2F_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  5,  0, ASSISTANT_HOUSE_1F, 3

	db 0 ; coord events

	db 1 ; bg events
	bg_event  1,  1, BGEVENT_READ, AssistantHouse2F_ComputerScript

	db 0 ; object events
