BugContestantPointers:
; there are NUM_BUG_CONTESTANTS + 1 entries
	dw BugContestant_BugCatcherDon ; this reverts back to the player
	dw BugContestant_BugCatcherDon
	dw BugContestant_BugCatcherEd
	dw BugContestant_CooltrainerMNick
	dw BugContestant_PokefanMWilliam
	dw BugContestant_BugCatcherBenny
	dw BugContestant_CamperBarry
	dw BugContestant_PicnickerCindy
	dw BugContestant_BugCatcherJosh
	dw BugContestant_YoungsterSamuel
	dw BugContestant_SchoolboyKipp

; contestant format:
;   db class, id
;   dw 1st-place mon, score
;   dw 2nd-place mon, score
;   dw 3rd-place mon, score

BugContestant_BugCatcherDon:
BugContestant_BugCatcherEd:
BugContestant_CooltrainerMNick:
BugContestant_PokefanMWilliam:
BugContestant_BugCatcherBenny:
BugContestant_CamperBarry:
BugContestant_PicnickerCindy:
BugContestant_BugCatcherJosh:
BugContestant_YoungsterSamuel:
BugContestant_SchoolboyKipp:
