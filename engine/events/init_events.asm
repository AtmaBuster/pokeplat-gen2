InitializeEvents:
; initialize events
	ld hl, InitialEvents
.events_loop
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	and a
	cp -1
	jr z, .done_events
	ld b, SET_FLAG
	push hl
	call EventFlagAction
	pop hl
	jr .events_loop

.done_events
; initialize engine flags
	ld hl, InitialEngineFlags
.flags_loop
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	and e
	cp -1
	jr z, .done_flags
	ld b, SET_FLAG
	push hl
	farcall EngineFlagAction
	pop hl
	jr .flags_loop

.done_flags
; initialize variable sprites
	ld hl, InitialVariableSprites
.sprites_loop
	ld a, [hli]
	ld e, a
	ld d, 0
	cp -1
	ret z ; done
	ld a, [hli]
	push hl
	ld hl, wVariableSprites
	add hl, de
	ld [hl], a
	pop hl
	jr .sprites_loop

INCLUDE "data/events/init_events.asm"
