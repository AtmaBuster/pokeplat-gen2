battlecmd: MACRO
	dba BattleCommand_\1
\1 EQUS "db \1_command"
	enum \1_command
ENDM

battlecmd2: MACRO
	dba BattleCommand_\1
\1 EQUS "db \1_command,"
	enum \1_command
ENDM

battlecmd3: MACRO
	enum \1_command
\1 EQUS "db \1_command"
ENDM

; battle commands are defined in engine/battle/effect_commands.asm

	dw 0 ; padding

BattleCommandPointers:
; entries correspond to macros/scripts/battle_commands.asm
	enum_start 1
	battlecmd checkturn               ; 01
	battlecmd checkobedience          ; 02
	battlecmd usedmovetext            ; 03
	battlecmd doturn                  ; 04
	battlecmd critical                ; 05
	battlecmd damagestats             ; 06
	battlecmd stab                    ; 07
	battlecmd damagevariation         ; 08
	battlecmd checkhit                ; 09
	battlecmd lowersub                ; 0a
	battlecmd moveanimnosub           ; 0b
	battlecmd raisesub                ; 0c
	battlecmd failuretext             ; 0d
	battlecmd applydamage             ; 0e
	battlecmd criticaltext            ; 0f
	battlecmd supereffectivetext      ; 10
	battlecmd checkfaint              ; 11
	battlecmd buildopponentrage       ; 12
	battlecmd poisontarget            ; 13
	battlecmd sleeptarget             ; 14
	battlecmd draintarget             ; 15
	battlecmd eatdream                ; 16
	battlecmd burntarget              ; 17
	battlecmd freezetarget            ; 18
	battlecmd paralyzetarget          ; 19
	battlecmd selfdestruct            ; 1a
	battlecmd mirrormove              ; 1b
	battlecmd payday                  ; 1c
	battlecmd conversion              ; 1d
	battlecmd resetstats              ; 1e
	battlecmd storeenergy             ; 1f
	battlecmd unleashenergy           ; 20
	battlecmd forceswitch             ; 21
	battlecmd endloop                 ; 22
	battlecmd flinchtarget            ; 23
	battlecmd ohko                    ; 24
	battlecmd mist                    ; 25
	battlecmd focusenergy             ; 26
	battlecmd confuse                 ; 27
	battlecmd confusetarget           ; 28
	battlecmd heal                    ; 1a
	battlecmd transform               ; 1b
	battlecmd screen                  ; 1c
	battlecmd poison                  ; 1d
	battlecmd paralyze                ; 1e
	battlecmd substitute              ; 1f
	battlecmd rechargenextturn        ; 29
	battlecmd mimic                   ; 30
	battlecmd metronome               ; 31
	battlecmd leechseed               ; 32
	battlecmd splash                  ; 33
	battlecmd disable                 ; 34
	battlecmd cleartext               ; 35
	battlecmd charge                  ; 36
	battlecmd checkcharge             ; 37
	battlecmd traptarget              ; 38
	battlecmd rampage                 ; 2b
	battlecmd checkrampage            ; 2c
	battlecmd constantdamage          ; 2d
	battlecmd counter                 ; 2e
	battlecmd encore                  ; 2f
	battlecmd painsplit               ; 39
	battlecmd snore                   ; 40
	battlecmd conversion2             ; 41
	battlecmd lockon                  ; 42
	battlecmd sketch                  ; 43
	battlecmd sleeptalk               ; 44
	battlecmd destinybond             ; 45
	battlecmd spite                   ; 46
	battlecmd falseswipe              ; 47
	battlecmd healbell                ; 48
	battlecmd heldflinch              ; 3a
	battlecmd triplekick              ; 3b
	battlecmd kickcounter             ; 3c
	battlecmd thief                   ; 3d
	battlecmd arenatrap               ; 3e
	battlecmd nightmare               ; 3f
	battlecmd defrost                 ; 49
	battlecmd curse                   ; 50
	battlecmd protect                 ; 51
	battlecmd spikes                  ; 52
	battlecmd foresight               ; 53
	battlecmd perishsong              ; 54
	battlecmd startsandstorm          ; 55
	battlecmd endure                  ; 56
	battlecmd checkcurl               ; 57
	battlecmd rolloutpower            ; 58
	battlecmd furycutter              ; 4b
	battlecmd attract                 ; 4c
	battlecmd happinesspower          ; 4d
	battlecmd present                 ; 4e
	battlecmd damagecalc              ; 4f
	battlecmd frustrationpower        ; 59
	battlecmd safeguard               ; 60
	battlecmd checksafeguard          ; 61
	battlecmd getmagnitude            ; 62
	battlecmd batonpass               ; 63
	battlecmd pursuit                 ; 64
	battlecmd clearhazards            ; 65
	battlecmd healmorn                ; 66
	battlecmd healday                 ; 67
	battlecmd healnite                ; 68
	battlecmd hiddenpower             ; 5a
	battlecmd startrain               ; 5b
	battlecmd startsun                ; 5c
	battlecmd effectchance            ; 5d
	battlecmd switchturn              ; 5e
	battlecmd fakeout                 ; 5f
	battlecmd bellydrum               ; 69
	battlecmd psychup                 ; 70
	battlecmd rage                    ; 71
	battlecmd doubleflyingdamage      ; 72
	battlecmd doubleundergrounddamage ; 73
	battlecmd mirrorcoat              ; 74
	battlecmd checkfuturesight        ; 75
	battlecmd futuresight             ; 76
	battlecmd doubleminimizedamage    ; 77
	battlecmd skipsuncharge           ; 78
	battlecmd thunderaccuracy         ; 6a
	battlecmd teleport                ; 6b
	battlecmd beatup                  ; 6c
	battlecmd ragedamage              ; 6d
	battlecmd resettypematchup        ; 6e
	battlecmd bidefailtext            ; 6f
	battlecmd raisesubnoanim          ; 79
	battlecmd lowersubnoanim          ; 80
	battlecmd beatupfailtext          ; 81
	battlecmd clearmissdamage         ; 82
	battlecmd movedelay               ; 83
	battlecmd moveanim                ; 84
	battlecmd tristatuschance         ; 85
	battlecmd supereffectivelooptext  ; 86
	battlecmd startloop               ; 87
	battlecmd curl                    ; 88
	battlecmd lifepower               ; 7a
	battlecmd facade                  ; 7b
	battlecmd starthail               ; 7c
	battlecmd breakscreens            ; 7d
	battlecmd weightdamage            ; 7e
	battlecmd stealthrock             ; 7f
	battlecmd toxicspikes             ; 80
	battlecmd camouflage              ; 81
	battlecmd naturepower             ; 82
	battlecmd kouser                  ; 83
	battlecmd endeavor                ; 84
	battlecmd brine                   ; 85
	battlecmd trick                   ; 86
	battlecmd taunt                   ; 87
	battlecmd trumpcard               ; 88
	battlecmd refresh                 ; 89
	battlecmd wakeupslap              ; 8a
	battlecmd smellingsalt            ; 8b
	battlecmd imprison                ; 8c
	battlecmd torment                 ; 8d
	battlecmd movecharge              ; 8e
	battlecmd watersport              ; 8f
	battlecmd mudsport                ; 90
	battlecmd ingrain                 ; 91
	battlecmd assist                  ; 92
	battlecmd aquaring                ; 93
	battlecmd checkuproar             ; 94
	battlecmd uproar                  ; 95
	battlecmd stockpile               ; 96
	battlecmd spitup                  ; 97
	battlecmd swallow                 ; 98
	battlecmd removestockpile         ; 99
	battlecmd acupressure             ; 9a
	battlecmd recycle                 ; 9b
	battlecmd knockoff                ; 9c
	battlecmd captivate               ; 9d
	battlecmd gyroball                ; 9e
	battlecmd tailwind                ; 9f
	battlecmd lastresort              ; a0
	battlecmd focuspunch              ; a1
	battlecmd revenge                 ; a2
	battlecmd powerswap               ; a3
	battlecmd guardswap               ; a4
	battlecmd heartswap               ; a5
	battlecmd doubleunderwaterdamage  ; a6
	battlecmd metalburst              ; a7
	battlecmd magnetrise              ; a8
	battlecmd gravity                 ; a9
	battlecmd miracleeye              ; aa
	battlecmd trickroom               ; ab
	battlecmd healblock               ; ac
	battlecmd payback                 ; ad
	battlecmd burn                    ; ae
	battlecmd crushgrip               ; af
	battlecmd yawn                    ; b0
	battlecmd grudge                  ; b1
	battlecmd uturn                   ; b2
	battlecmd secretpoweranim         ; b3
	battlecmd secretpowereffect       ; b4
	battlecmd checkwish               ; b5
	battlecmd wish                    ; b6
	battlecmd checkmagiccoat          ; b7
	battlecmd magiccoat               ; b8
	battlecmd checksnatch             ; b9
	battlecmd snatch                  ; ba
	battlecmd suckerpunch             ; bb
	battlecmd luckychant              ; bc

	battlecmd2 raisestat
	battlecmd2 lowerstat
	battlecmd2 forceraisestat
	battlecmd2 forcelowerstat
	battlecmd2 raisestathit
	battlecmd2 lowerstathit
	battlecmd2 raiseoppstat
	battlecmd2 loweroppstat
	battlecmd2 forceraiseoppstat
	battlecmd2 forceloweroppstat
	battlecmd2 raiseoppstathit
	battlecmd2 loweroppstathit
	battlecmd2 recoil

	enum_start $fe
	battlecmd3 endturn
	battlecmd3 endmove
