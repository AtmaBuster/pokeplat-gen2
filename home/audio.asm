; Audio interfaces.

MapSetup_Sound_Off::
	push hl
	push de
	push bc
	push af

	ldh a, [hROMBank]
	push af
	ld a, BANK(_MapSetup_Sound_Off)
	ldh [hROMBank], a
	ld [MBC3RomBank], a

	call _MapSetup_Sound_Off

	pop af
	ldh [hROMBank], a
	ld [MBC3RomBank], a

	pop af
	pop bc
	pop de
	pop hl
	ret

UpdateSound::
	push hl
	push de
	push bc
	push af

	ldh a, [hROMBank]
	push af
	ld a, BANK(_UpdateSound)
	ldh [hROMBank], a
	ld [MBC3RomBank], a

	call _UpdateSound

	pop af
	ldh [hROMBank], a
	ld [MBC3RomBank], a

	pop af
	pop bc
	pop de
	pop hl
	ret

_LoadMusicByte::
; wCurMusicByte = [a:de]
	ldh [hROMBank], a
	ld [MBC3RomBank], a

	ld a, [de]
	ld [wCurMusicByte], a
	ld a, BANK(LoadMusicByte)

	ldh [hROMBank], a
	ld [MBC3RomBank], a
	ret

PlayMusic::
; Play music de.

	push hl
	push de
	push bc
	push af

	ldh a, [hROMBank]
	push af
	ld a, BANK(_PlayMusic) ; aka BANK(_MapSetup_Sound_Off)
	ldh [hROMBank], a
	ld [MBC3RomBank], a

	ld a, e
	and a
	jr z, .nomusic

	call _PlayMusic
	jr .end

.nomusic
	call _MapSetup_Sound_Off

.end
	pop af
	ldh [hROMBank], a
	ld [MBC3RomBank], a
	pop af
	pop bc
	pop de
	pop hl
	ret

PlayMusic2::
; Stop playing music, then play music de.

	push hl
	push de
	push bc
	push af

	ldh a, [hROMBank]
	push af
	ld a, BANK(_PlayMusic)
	ldh [hROMBank], a
	ld [MBC3RomBank], a

	push de
	ld de, MUSIC_NONE
	call _PlayMusic
	call DelayFrame
	pop de
	call _PlayMusic

	pop af
	ldh [hROMBank], a
	ld [MBC3RomBank], a

	pop af
	pop bc
	pop de
	pop hl
	ret

PlayCry::
; Play cry de.

	push hl
	push de
	push bc
	push af

	ldh a, [hROMBank]
	push af

	; Cries are stuck in one bank.
	ld a, BANK(PokemonCries)
	ldh [hROMBank], a
	ld [MBC3RomBank], a

	ld hl, PokemonCries
rept 6 ; sizeof(mon_cry)
	add hl, de
endr

	ldi a, [hl]
	cp CRY_SAMPLED
	jr z, .sampled_cry

	ld e, a
	ld d, [hl]
	inc hl

	ld a, [hli]
	ld [wCryPitch], a
	ld a, [hli]
	ld [wCryPitch + 1], a
	ld a, [hli]
	ld [wCryLength], a
	ld a, [hl]
	ld [wCryLength + 1], a

	ld a, BANK(_PlayCry)
	ldh [hROMBank], a
	ld [MBC3RomBank], a

	call _PlayCry

	pop af
	ldh [hROMBank], a
	ld [MBC3RomBank], a

	pop af
	pop bc
	pop de
	pop hl
	ret

.sampled_cry
	call PlaySample

	pop af
	ldh [hROMBank], a
	ld [MBC3RomBank], a

	pop af
	pop bc
	pop de
	pop hl
	ret
	ret

PlaySFX::
; Play sound effect de.
; Sound effects are ordered by priority (highest to lowest)

	push hl
	push de
	push bc
	push af

	; Is something already playing?
	call CheckSFX
	jr nc, .play

	; Does it have priority?
	ld a, [wCurSFX]
	cp e
	jr c, .done

.play
	ldh a, [hROMBank]
	push af
	ld a, BANK(_PlaySFX)
	ldh [hROMBank], a
	ld [MBC3RomBank], a

	ld a, e
	ld [wCurSFX], a
	call _PlaySFX

	pop af
	ldh [hROMBank], a
	ld [MBC3RomBank], a

.done
	pop af
	pop bc
	pop de
	pop hl
	ret

WaitPlaySFX::
	call WaitSFX
	jp PlaySFX

WaitSFX::
; infinite loop until sfx is done playing

	push af
	push hl

.wait
	ldh a, [hSamplePlaying]
	and a
	jr nz, .wait
	ld hl, wChannel5Flags1
	bit 0, [hl]
	jr nz, .wait
	ld hl, wChannel6Flags1
	bit 0, [hl]
	jr nz, .wait
	ld hl, wChannel7Flags1
	bit 0, [hl]
	jr nz, .wait
	ld hl, wChannel8Flags1
	bit 0, [hl]
	jr nz, .wait

	pop hl
	pop af
	ret

IsSFXPlaying::
; Return carry if no sound effect is playing.
; The inverse of CheckSFX.
; First, check if sampled sound is playing
	ldh a, [hSamplePlaying]
	and a
	jr nz, .playing
; Then, check other
	push hl

	ld hl, wChannel5Flags1
	bit 0, [hl]
	jr nz, .playing
	ld hl, wChannel6Flags1
	bit 0, [hl]
	jr nz, .playing
	ld hl, wChannel7Flags1
	bit 0, [hl]
	jr nz, .playing
	ld hl, wChannel8Flags1
	bit 0, [hl]
	jr nz, .playing

	pop hl
	scf
	ret

.playing
	pop hl
	and a
	ret

MaxVolume::
	ld a, MAX_VOLUME
	ld [wVolume], a
	ret

LowVolume::
	ld a, $33 ; 40%
	ld [wVolume], a
	ret

VolumeOff::
	xor a
	ld [wVolume], a
	ret

Unused_FadeOutMusic::
	ld a, 4
	ld [wMusicFade], a
	ret

FadeInMusic::
	ld a, 4 | (1 << MUSIC_FADE_IN_F)
	ld [wMusicFade], a
	ret

SkipMusic::
; Skip a frames of music.
.loop
	and a
	ret z
	dec a
	call UpdateSound
	jr .loop

FadeToMapMusic::
	push hl
	push de
	push bc
	push af

	call GetMapMusic_MaybeSpecial
	ld a, [wMapMusic]
	cp e
	jr z, .done

	ld a, 8
	ld [wMusicFade], a
	ld a, e
	ld [wMusicFadeID], a
	ld a, d
	ld [wMusicFadeID + 1], a
	ld a, e
	ld [wMapMusic], a

.done
	pop af
	pop bc
	pop de
	pop hl
	ret

PlayMapMusic::
	push hl
	push de
	push bc
	push af

	call GetMapMusic_MaybeSpecial
	ld a, [wMapMusic]
	cp e
	jr z, .done

	push de
	ld de, MUSIC_NONE
	call PlayMusic
	call DelayFrame
	pop de
	ld a, e
	ld [wMapMusic], a
	call PlayMusic

.done
	pop af
	pop bc
	pop de
	pop hl
	ret

EnterMapMusic::
	push hl
	push de
	push bc
	push af

	xor a
	ld [wDontPlayMapMusicOnReload], a
	ld de, MUSIC_BICYCLE
	ld a, [wPlayerState]
	cp PLAYER_BIKE
	jr z, .play
	call GetMapMusic_MaybeSpecial
.play
	push de
	ld de, MUSIC_NONE
	call PlayMusic
	call DelayFrame
	pop de

	ld a, e
	ld [wMapMusic], a
	call PlayMusic

	pop af
	pop bc
	pop de
	pop hl
	ret

TryRestartMapMusic::
	ld a, [wDontPlayMapMusicOnReload]
	and a
	jr z, RestartMapMusic
	xor a
	ld [wMapMusic], a
	ld de, MUSIC_NONE
	call PlayMusic
	call DelayFrame
	xor a
	ld [wDontPlayMapMusicOnReload], a
	ret

RestartMapMusic::
	push hl
	push de
	push bc
	push af
	ld de, MUSIC_NONE
	call PlayMusic
	call DelayFrame
	ld a, [wMapMusic]
	ld e, a
	ld d, 0
	call PlayMusic
	pop af
	pop bc
	pop de
	pop hl
	ret

SpecialMapMusic::
	ld a, [wPlayerState]
	cp PLAYER_SURF
	jr z, .surf
	cp PLAYER_SURF_PIKA
	jr z, .surf

	ld a, [wStatusFlags2]
	bit STATUSFLAGS2_BUG_CONTEST_TIMER_F, a
	jr nz, .contest

.no
	and a
	ret

.bike
	ld de, MUSIC_BICYCLE
	scf
	ret

.surf
	ld de, MUSIC_SURF
	scf
	ret

.contest
;	ld a, [wMapGroup]
;	cp GROUP_ROUTE_35_NATIONAL_PARK_GATE
;	jr nz, .no
;	ld a, [wMapNumber]
;	cp MAP_ROUTE_35_NATIONAL_PARK_GATE
;	jr z, .ranking
;	cp MAP_ROUTE_36_NATIONAL_PARK_GATE
;	jr nz, .no
;
;.ranking
;	ld de, MUSIC_BUG_CATCHING_CONTEST_RANKING
;	scf
;	ret

GetMapMusic_MaybeSpecial::
	call SpecialMapMusic
	ret c
	jp GetMapMusic

CheckSFX::
; Return carry if any SFX channels are active.
; First, check if sampled sound is playing
	ldh a, [hSamplePlaying]
	and a
	jr nz, .playing
; Then, check other
	ld a, [wChannel5Flags1]
	bit 0, a
	jr nz, .playing
	ld a, [wChannel6Flags1]
	bit 0, a
	jr nz, .playing
	ld a, [wChannel7Flags1]
	bit 0, a
	jr nz, .playing
	ld a, [wChannel8Flags1]
	bit 0, a
	jr nz, .playing
	and a
	ret
.playing
	scf
	ret

TerminateExpBarSound::
	xor a
	ld [wChannel5Flags1], a
	ld [wSoundInput], a
	ldh [rNR10], a
	ldh [rNR11], a
	ldh [rNR12], a
	ldh [rNR13], a
	ldh [rNR14], a
	ret

ChannelsOff::
; Quickly turn off music channels
	xor a
	ld [wChannel1Flags1], a
	ld [wChannel2Flags1], a
	ld [wChannel3Flags1], a
	ld [wChannel4Flags1], a
	ld [wSoundInput], a
	ret

SFXChannelsOff::
; Quickly turn off sound effect channels
	xor a
	ld [wChannel5Flags1], a
	ld [wChannel6Flags1], a
	ld [wChannel7Flags1], a
	ld [wChannel8Flags1], a
	ld [wSoundInput], a
	ret

PlaySample::
	; setup timer interrupt
	xor a
	ldh [rTMA], a
	ld a, %110
	ldh [rTAC], a
	; loads sample header at hl and queues the sample to play
	ld c, LOW(rNR51)
	ld a, $ff
	ld [c], a
	dec c
	ld a, $77
	ld [c], a
	ld a, $20
	ldh [rNR32], a

	ld de, wSampleData
	ld bc, 5 ; size of sample header
	call CopyBytes
;	ldi a, [hl]
;	ld [wSamplePointer], a
;	ldi a, [hl]
;	ld [wSamplePointer + 1], a
;	ldi a, [hl]
;	ld [wSampleSize], a
;	ldi a, [hl]
;	ld [wSampleSize + 1], a
;	ld a, [hl]
;	ld [wSampleBank], a
	ld a, 1
	ldh [hSamplePlaying], a
	ret

Timer::
	push af
	push bc
	push de
	push hl
	ldh a, [hSamplePlaying]
	and a
	jr nz, .play_sample
	xor a
	ldh [hSampleVolume], a
	inc a
	ldh [hTimerInterrupt], a
	pop hl
	pop de
	pop bc
	pop af
	reti

.play_sample
	ld hl, wSampleSize
	ldi a, [hl]
	ld d, [hl]
	ld e, a
	ld hl, wSamplePointer
	ldi a, [hl]
	ld h, [hl]
	ld l, a
	ld a, [wSampleBank]
	ld [MBC3RomBank], a
	ldh a, [rNR51]
	ld c, a
	and %10111011
	ldh [rNR51], a
	xor a
	ldh [rNR30], a
	ldi a, [hl]
	push af
	ldh [rWave_0], a
wave=rWave_1
rept 15
	ldi a, [hl]
	ldh [wave], a
wave=wave+1
endr
	ld a, %10000000
	ldh [rNR30], a
	ld a, c
	ldh [rNR51], a
	ld a, $80
	;xor a
	ldh [rNR33], a
	ld a, $87
	ldh [rNR34], a

	ld a, e
	sub $10
	ld e, a
	jr nc, .nc
	dec d
.nc
	ld a, h
	ld [wSamplePointer + 1], a
	ld a, l
	ld [wSamplePointer], a

	ld a, d
	cp -1
	jr nz, .no_reset2
	xor a
	ldh [hSamplePlaying], a
	ldh [rNR30], a
.no_reset2
	ld a, d
	ld [wSampleSize + 1], a
	ld a, e
	ld [wSampleSize], a

	pop af
	swap a
	and $0f
	ldh [hSampleVolume], a
	ld a, 1
	ld [hTimerInterrupt], a

	ldh a, [hROMBank]
	ld [MBC3RomBank], a
	pop hl
	pop de
	pop bc
	pop af
	reti
