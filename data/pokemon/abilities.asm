	const_def
	const ABILITY_NONE
	const ABILITY_WONDER_GUARD
	const ABILITY_LEVITATE
	const ABILITY_PICKUP
	const ABILITY_TRUANT
	const ABILITY_FORECAST
	const ABILITY_SLOW_START
	const ABILITY_MULTITYPE
	const ABILITY_FLOWER_GIFT

GetMonAbility:
	ld a, b
	call GetPokemonIndexFromID
	ld b, h
	ld c, l
	ld hl, PokemonAbilitiesList
	ld de, 3
.loop
	ld a, [hli]
	and [hl]
	inc a
	jr z, .not_in_list
	ld a, [hld]
	cp b
	jr nz, .next_item
	ld a, [hl]
	cp c
	jr nz, .next_item
	inc hl
	inc hl
	ld b, [hl]
	ret

.next_item
	add hl, de
	jr .loop

.not_in_list
	ld b, ABILITY_NONE
	ret

PokemonAbilitiesList:
	dwb MEOWTH,    ABILITY_PICKUP
	dwb AIPOM,     ABILITY_PICKUP
	dwb TEDDIURSA, ABILITY_PICKUP
	dwb PHANPY,    ABILITY_PICKUP
	dwb ZIGZAGOON, ABILITY_PICKUP
	dwb LINOONE,   ABILITY_PICKUP
	dwb SLAKOTH,   ABILITY_TRUANT
	dwb SLAKING,   ABILITY_TRUANT
	dwb SHEDINJA,  ABILITY_WONDER_GUARD
	dwb VIBRAVA,   ABILITY_LEVITATE
	dwb FLYGON,    ABILITY_LEVITATE
	dwb CASTFORM,  ABILITY_FORECAST
	dwb PACHIRISU, ABILITY_PICKUP
	dwb CHERRIM,   ABILITY_FLOWER_GIFT
	dwb AMBIPOM,   ABILITY_PICKUP
	dwb MUNCHLAX,  ABILITY_PICKUP
	dwb REGIGIGAS, ABILITY_SLOW_START
	dwb ARCEUS,    ABILITY_MULTITYPE
	dw -1

AbilityNames:
	db "---@"
	db "WONDER GUARD@"
	db "LEVITATE@"
	db "PICKUP@"
	db "TRUANT@"
	db "FORECAST@"
	db "SLOW START@"
	db "MULTITYPE@"
	db "FLOWER GIFT@"

AbilityDescriptions:
	db "No special ability@"
	db "Only super effect-││ive moves hit@"
	db "Not affected by   ││GROUND-type moves@"
	db "May pick up items@"
	db "Can't attack on   ││consecutive turns@"
	db "Changes form in   ││sun, rain, or hail@"
	db "Temporarily halves││ATTACK and SPEED@"
	db "Changes type to   ││match held PLATE@"
	db "Changes form in   ││sunny weather@"
