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

; Can't steal mail.

	ld [wNamedObjectIndexBuffer], a
	ld d, a
	farcall ItemIsMail
	ret c

; Can't steal Griseous Orb from Giratina
	call .enemyitem
	ld a, [hld]
	cp GRISEOUS_ORB
	jr nz, .player_arceus_check
	ld a, [hl]
	call GetPokemonIndexFromID
	ld a, h
	cp HIGH(GIRATINA)
	jr nz, .player_check_giratina_o
	ld a, l
	cp LOW(GIRATINA)
	ret z
.player_check_giratina_o
	ld a, h
	cp HIGH(GIRATINA_O)
	ret z
	ld a, l
	cp LOW(GIRATINA_O)
	ret z

.player_arceus_check
; Can't steal Plate from Arceus
	call .enemyitem
	ld a, [hld]
	push hl
	ld hl, PlateItems
	ld de, 2
	call IsInArray
	pop hl
	jr nc, .player_can_steal
	ld a, [hl]
	call GetPokemonIndexFromID
	ld a, h
	cp HIGH(ARCEUS)
	jr nz, .player_can_steal
	ld a, l
	cp LOW(ARCEUS)
	ret z

.player_can_steal
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

; Can't steal mail!

	ld [wNamedObjectIndexBuffer], a
	ld d, a
	farcall ItemIsMail
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
