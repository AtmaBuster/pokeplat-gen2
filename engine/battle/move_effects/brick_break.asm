BattleCommand_breakscreens:
; breakscreens
	ld hl, wEnemyScreens
	ld bc, wEnemyLightScreenCount
	ldh a, [hBattleTurn]
	and a
	jr z, .ok
	ld hl, wPlayerScreens
	ld bc, wPlayerLightScreenCount
.ok
	ld a, [hl]
	and (1 << SCREENS_REFLECT) | (1 << SCREENS_LIGHT_SCREEN)
	ret z
	push af
	res SCREENS_REFLECT, [hl]
	res SCREENS_LIGHT_SCREEN, [hl]
	xor a
	ld [bc], a
	inc bc
	ld [bc], a
	ld hl, BrokeScreensText
	call StdBattleTextbox
	pop af
	push af
	bit SCREENS_REFLECT, a
	call nz, .reflect
	pop af
	bit SCREENS_LIGHT_SCREEN, a
	call nz, .light_screen
	ret

.light_screen
	ld hl, LightScreenWoreOffText
	jp StdBattleTextbox

.reflect
	ld hl, ReflectWoreOffText
	jp StdBattleTextbox
