battlecmd: MACRO
	dw BattleCommand_\1
\1 EQUS "db \1_command"
	enum \1_command
ENDM

battlecmd2: MACRO
	dw BattleCommand_\1
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
	battlecmd recoil                  ; 25
	battlecmd mist                    ; 26
	battlecmd focusenergy             ; 27
	battlecmd confuse                 ; 28
	battlecmd confusetarget           ; 29
	battlecmd heal                    ; 2a
	battlecmd transform               ; 2b
	battlecmd screen                  ; 2c
	battlecmd poison                  ; 2d
	battlecmd paralyze                ; 2e
	battlecmd substitute              ; 2f
	battlecmd rechargenextturn        ; 30
	battlecmd mimic                   ; 31
	battlecmd metronome               ; 32
	battlecmd leechseed               ; 33
	battlecmd splash                  ; 34
	battlecmd disable                 ; 35
	battlecmd cleartext               ; 36
	battlecmd charge                  ; 37
	battlecmd checkcharge             ; 38
	battlecmd traptarget              ; 39
	battlecmd rampage                 ; 3b
	battlecmd checkrampage            ; 3c
	battlecmd constantdamage          ; 3d
	battlecmd counter                 ; 3e
	battlecmd encore                  ; 3f
	battlecmd painsplit               ; 40
	battlecmd snore                   ; 41
	battlecmd conversion2             ; 42
	battlecmd lockon                  ; 43
	battlecmd sketch                  ; 44
	battlecmd sleeptalk               ; 45
	battlecmd destinybond             ; 46
	battlecmd spite                   ; 47
	battlecmd falseswipe              ; 48
	battlecmd healbell                ; 49
	battlecmd heldflinch              ; 4a
	battlecmd triplekick              ; 4b
	battlecmd kickcounter             ; 4c
	battlecmd thief                   ; 4d
	battlecmd arenatrap               ; 4e
	battlecmd nightmare               ; 4f
	battlecmd defrost                 ; 50
	battlecmd curse                   ; 51
	battlecmd protect                 ; 52
	battlecmd spikes                  ; 53
	battlecmd foresight               ; 54
	battlecmd perishsong              ; 55
	battlecmd startsandstorm          ; 56
	battlecmd endure                  ; 57
	battlecmd checkcurl               ; 58
	battlecmd rolloutpower            ; 59
	battlecmd furycutter              ; 5b
	battlecmd attract                 ; 5c
	battlecmd happinesspower          ; 5d
	battlecmd present                 ; 5e
	battlecmd damagecalc              ; 5f
	battlecmd frustrationpower        ; 60
	battlecmd safeguard               ; 61
	battlecmd checksafeguard          ; 62
	battlecmd getmagnitude            ; 63
	battlecmd batonpass               ; 64
	battlecmd pursuit                 ; 65
	battlecmd clearhazards            ; 66
	battlecmd healmorn                ; 67
	battlecmd healday                 ; 68
	battlecmd healnite                ; 69
	battlecmd hiddenpower             ; 6a
	battlecmd startrain               ; 6b
	battlecmd startsun                ; 6c
	battlecmd effectchance            ; 6d
	battlecmd switchturn              ; 6e
	battlecmd fakeout                 ; 6f
	battlecmd bellydrum               ; 70
	battlecmd psychup                 ; 71
	battlecmd rage                    ; 72
	battlecmd doubleflyingdamage      ; 73
	battlecmd doubleundergrounddamage ; 74
	battlecmd mirrorcoat              ; 75
	battlecmd checkfuturesight        ; 76
	battlecmd futuresight             ; 77
	battlecmd doubleminimizedamage    ; 78
	battlecmd skipsuncharge           ; 79
	battlecmd thunderaccuracy         ; 7a
	battlecmd teleport                ; 7b
	battlecmd beatup                  ; 7c
	battlecmd ragedamage              ; 7d
	battlecmd resettypematchup        ; 7e
	battlecmd bidefailtext            ; 7f
	battlecmd raisesubnoanim          ; 80
	battlecmd lowersubnoanim          ; 81
	battlecmd beatupfailtext          ; 82
	battlecmd clearmissdamage         ; 83
	battlecmd movedelay               ; 84
	battlecmd moveanim                ; 85
	battlecmd tristatuschance         ; 86
	battlecmd supereffectivelooptext  ; 87
	battlecmd startloop               ; 88
	battlecmd curl                    ; 89
	battlecmd lifepower               ; 8a
	battlecmd facade                  ; 8b
	battlecmd starthail               ; 8c

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

	enum_start $fe
	battlecmd3 endturn
	battlecmd3 endmove
