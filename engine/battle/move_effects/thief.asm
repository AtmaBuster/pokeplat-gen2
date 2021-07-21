BattleCommand_thief:
; thief

	ldh a, [hBattleTurn]
	and a
	jr nz, .enemy

; The player needs to be able to steal an item.

	call .playeritem
	ld a, [hl]
	and a
	ret nz

; The enemy needs to have an item to steal.

	call .enemyitem
	ld a, [hl]
	and a
	ret z

	ld d, h
	ld e, l
	call CheckStealableItem
	ret c

	ld a, [wEffectFailed]
	and a
	ret nz

	ld a, [wLinkMode]
	and a
	jr z, .stealenemyitem

	ld a, [wBattleMode]
	dec a
	ret z

.stealenemyitem
	call .enemyitem
	xor a
	ld [hl], a
	ld [de], a

	call .playeritem
	ld a, [wNamedObjectIndexBuffer]
	ld [hl], a
	ld [de], a
	jr .stole

.enemy

; Don't let wild mons steal.

	ld a, [wBattleMode]
	cp WILD_BATTLE
	ret z

; The enemy can't already have an item.

	call .enemyitem
	ld a, [hl]
	and a
	ret nz

; The player must have an item to steal.

	call .playeritem
	ld a, [hl]
	and a
	ret z

	ld d, h
	ld e, l
	call CheckStealableItem
	ret c

	ld a, [wEffectFailed]
	and a
	ret nz

; If the enemy steals your item,
; it's gone for good if you don't get it back.

	call .playeritem
	xor a
	ld [hl], a
	ld [de], a

	call .enemyitem
	ld a, [wNamedObjectIndexBuffer]
	ld [hl], a
	ld [de], a

.stole
	call GetItemName
	ld hl, StoleText
	jp StdBattleTextbox

.playeritem
	ld a, 1
	call BattlePartyAttr
	ld d, h
	ld e, l
	ld hl, wBattleMonItem
	ret

.enemyitem
	ld a, 1
	call OTPartyAttr
	ld d, h
	ld e, l
	ld hl, wEnemyMonItem
	ret

CheckStealableItem:
	ld a, [de]
; Can't steal mail.

	ld [wNamedObjectIndexBuffer], a
	push de
	ld d, a
	farcall ItemIsMail
	pop de
	ret c

; Can't steal Griseous Orb from Giratina
	ld a, [de]
	cp GRISEOUS_ORB
	jr nz, .arceus_check
	dec de
	ld a, [de]
	inc de
	call GetPokemonIndexFromID
	ld a, h
	cp HIGH(GIRATINA)
	jr nz, .check_giratina_o
	ld a, l
	cp LOW(GIRATINA)
	jr z, .cant
.check_giratina_o
	ld a, h
	cp HIGH(GIRATINA_O)
	jr z, .cant
	ld a, l
	cp LOW(GIRATINA_O)
	jr z, .cant

.arceus_check
; Can't steal Plate from Arceus
	ld a, [de]
	push de
	ld b, BANK(PlateItems)
	ld hl, PlateItems
	ld de, 2
	call IsInFarArray
	pop de
	ret nc
	dec de
	ld a, [de]
	call GetPokemonIndexFromID
	ld a, h
	cp HIGH(ARCEUS)
	jr nz, .ok
	ld a, l
	cp LOW(ARCEUS)
	jr z, .cant
.ok
	and a
	ret

.cant
	scf
	ret
