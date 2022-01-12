Script_AbortBugContest:
	checkflag ENGINE_BUG_CONTEST_TIMER
	iffalse .finish
	setflag ENGINE_DAILY_BUG_CONTEST
	special ContestReturnMons
.finish
	end

FindItemInBallScript::
	callasm .TryReceiveItem
	iffalse .no_room
	disappear LAST_TALKED
	opentext
	writetext .text_found
	playsound SFX_ITEM
	pause 60
	callasm .CheckIfPlate
	iffalse .SkipPlate
	scall PlateEngravingScript
	buttonsound
.SkipPlate:
	itemnotify
	closetext
	end

.no_room
	opentext
	writetext .text_found
	waitbutton
	writetext .text_bag_full
	waitbutton
	closetext
	end

.text_found
	; found @ !
	text_far UnknownText_0x1c0a1c
	text_end

.text_bag_full
	; But   can't carry any more items.
	text_far UnknownText_0x1c0a2c
	text_end

.TryReceiveItem:
	xor a
	ld [wScriptVar], a
	ld a, [wItemBallItemID]
	ld [wNamedObjectIndexBuffer], a
	call GetItemName
	ld hl, wStringBuffer3
	call CopyName2
	ld a, [wItemBallItemID]
	ld [wCurItem], a
	ld a, [wItemBallQuantity]
	ld [wItemQuantityChangeBuffer], a
	ld hl, wNumItems
	call ReceiveItem
	ret nc
	ld a, $1
	ld [wScriptVar], a
	ret

.CheckIfPlate:
	xor a
	ld [wScriptVar], a
	ld a, [wItemBallItemID]
	ld b, BANK(PlateItems)
	ld hl, PlateItems
	ld de, 2
	call IsInFarArray
	ret nc
	ld hl, wNumPlatesFound
	inc [hl]
	ld a, [hl]
	ld [wScriptVar], a
	ret

PlateEngravingScript:
	writetext .IntroText
	buttonsound
	ifequal 1, .One
	ifequal 2, .Two
	ifequal 3, .Three
	ifequal 4, .Four
	ifequal 5, .Five
	ifequal 6, .Six
	ifequal 7, .Seven
	ifequal 8, .Eight
.One:
	writetext .OneText
	end

.Two:
	writetext .TwoText
	end

.Three:
	writetext .ThreeText
	end

.Four:
	writetext .FourText
	end

.Five:
	writetext .FiveText
	end

.Six:
	writetext .SixText
	end

.Seven:
	writetext .SevenText
	end

.Eight:
	writetext .EightText
	end

.IntroText:
	text "There is text"
	line "engraved in the"
	cont "back of the PLATE…"
	done

.OneText:
	text "“When the universe"
	line "was created, its"
	cont "shards became this"
	cont "PLATE.”"
	done

.TwoText:
	text "“The power of"
	line "defeated giants"
	cont "infuses this"
	cont "PLATE.”"
	done

.ThreeText:
	text "“Two beings of"
	line "time and space set"
	cont "free from the"
	cont "ORIGINAL ONE.”"
	done

.FourText:
	text "“Three beings were"
	line "born to bind time"
	cont "and space.”"
	done

.FiveText:
	text "“Two make matter"
	line "and three make"
	cont "spirit, shaping"
	cont "the world.”"
	done

.SixText:
	text "“The ORIGINAL ONE"
	line "breathed alone"
	cont "before the"
	cont "universe came.”"
	done

.SevenText:
	text "“The powers of the"
	line "PLATES are shared"
	cont "among #MON.”"
	done

.EightText:
	text "“The rightful"
	line "bearer of a PLATE"
	cont "draws from the"
	cont "PLATE it holds.”"
	done

FindTMHMInBallScript::
	callasm .TryReceiveItem
	iffalse .no_room
	disappear LAST_TALKED
	opentext
	writetext .text_found
	playsound SFX_ITEM
	pause 60
	tmhmnotify
	closetext
	end

.no_room
	opentext
	writetext .text_found
	waitbutton
	writetext .text_bag_full
	waitbutton
	closetext
	end

.text_found
	; found @ !
	text_far TextFoundTMHM
	text_end

.text_bag_full
	; But   can't carry any more items.
	text_far UnknownText_0x1c0a2c
	text_end

.TryReceiveItem:
	xor a
	ld [wScriptVar], a
	ld a, [wItemBallItemID]
	ld [wNamedObjectIndexBuffer], a
	call GetTMHMName
	ld de, wStringBuffer1
	ld hl, wStringBuffer4
	call CopyName2
	predef GetTMHMMove
	call GetMoveName
	ld a, [wItemBallItemID]
	ld [wCurItem], a
	ld a, [wItemBallQuantity]
	ld [wItemQuantityChangeBuffer], a
	call ReceiveTMHM
	ret nc
	ld a, $1
	ld [wScriptVar], a
	ret
