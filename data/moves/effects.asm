INCLUDE "data/moves/effects_pointers.asm"

MoveEffects: ; used only for BANK(MoveEffects)

NormalHit:
	checkobedience
	usedmovetext
	doturn
	critical
	damagestats
	damagecalc
	stab
	damagevariation
	checkhit
	moveanim
	failuretext
	applydamage
	criticaltext
	supereffectivetext
	checkfaint
	buildopponentrage
	heldflinch
	endmove

DoSleep:
	checkobedience
	usedmovetext
	doturn
	checkhit
	checksafeguard
	sleeptarget
	endmove

PoisonFang:
PoisonHit:
	checkobedience
	usedmovetext
	doturn
	critical
	damagestats
	damagecalc
	stab
	damagevariation
	checkhit
	effectchance
	moveanim
	failuretext
	applydamage
	criticaltext
	supereffectivetext
	checkfaint
	buildopponentrage
	poisontarget
	endmove

LeechHit:
	checkobedience
	usedmovetext
	doturn
	critical
	damagestats
	damagecalc
	stab
	damagevariation
	checkhit
	moveanim
	failuretext
	applydamage
	criticaltext
	supereffectivetext
	draintarget
	checkfaint
	buildopponentrage
	heldflinch
	endmove

BurnHit:
	checkobedience
	usedmovetext
	doturn
	critical
	damagestats
	damagecalc
	stab
	damagevariation
	checkhit
	effectchance
	moveanim
	failuretext
	applydamage
	criticaltext
	supereffectivetext
	checkfaint
	buildopponentrage
	burntarget
	endmove

FreezeHit:
	checkobedience
	usedmovetext
	doturn
	critical
	damagestats
	damagecalc
	stab
	damagevariation
	checkhit
	effectchance
	moveanim
	failuretext
	applydamage
	criticaltext
	supereffectivetext
	checkfaint
	buildopponentrage
	freezetarget
	endmove

ParalyzeHit:
	checkobedience
	usedmovetext
	doturn
	critical
	damagestats
	damagecalc
	stab
	damagevariation
	checkhit
	effectchance
	moveanim
	failuretext
	applydamage
	criticaltext
	supereffectivetext
	checkfaint
	buildopponentrage
	paralyzetarget
	endmove

Selfdestruct:
	checkobedience
	usedmovetext
	doturn
	critical
	damagestats
	damagecalc
	stab
	damagevariation
	checkhit
	selfdestruct
	moveanimnosub
	failuretext
	applydamage
	criticaltext
	supereffectivetext
	checkfaint
	buildopponentrage
	heldflinch
	endmove

DreamEater:
	checkobedience
	usedmovetext
	doturn
	critical
	damagestats
	damagecalc
	stab
	damagevariation
	checkhit
	moveanim
	failuretext
	applydamage
	criticaltext
	supereffectivetext
	eatdream
	checkfaint
	buildopponentrage
	endmove

MirrorMove:
	checkobedience
	usedmovetext
	doturn
	mirrormove
	endmove

AttackUp:
	checkobedience
	usedmovetext
	doturn
	forceraisestat ATTACK
	endmove

DefenseUp:
	checkobedience
	usedmovetext
	doturn
	forceraisestat DEFENSE
	endmove

SpeedUp:
	checkobedience
	usedmovetext
	doturn
	forceraisestat SPEED
	endmove

SpecialAttackUp:
	checkobedience
	usedmovetext
	doturn
	forceraisestat SP_ATTACK
	endmove

SpecialDefenseUp:
	checkobedience
	usedmovetext
	doturn
	forceraisestat SP_DEFENSE
	endmove

AccuracyUp:
	checkobedience
	usedmovetext
	doturn
	forceraisestat ACCURACY
	endmove

EvasionUp:
	checkobedience
	usedmovetext
	doturn
	lowersub
	forceraisestat EVASION
	endmove

AttackUp2:
	checkobedience
	usedmovetext
	doturn
	forceraisestat $10 | ATTACK
	endmove

DefenseUp2:
	checkobedience
	usedmovetext
	doturn
	forceraisestat $10 | DEFENSE
	endmove

SpeedUp2:
	checkobedience
	usedmovetext
	doturn
	forceraisestat $10 | SPEED
	endmove

SpecialAttackUp2:
	checkobedience
	usedmovetext
	doturn
	forceraisestat $10 | SP_ATTACK
	endmove

SpecialDefenseUp2:
	checkobedience
	usedmovetext
	doturn
	forceraisestat $10 | SP_DEFENSE
	endmove

AccuracyUp2:
	checkobedience
	usedmovetext
	doturn
	forceraisestat $10 | ACCURACY
	endmove

EvasionUp2:
	checkobedience
	usedmovetext
	doturn
	forceraisestat $10 | EVASION
	endmove

AttackDown:
	checkobedience
	usedmovetext
	doturn
	checkhit
	loweroppstat ATTACK
	endmove

DefenseDown:
	checkobedience
	usedmovetext
	doturn
	checkhit
	loweroppstat DEFENSE
	endmove

SpeedDown:
	checkobedience
	usedmovetext
	doturn
	checkhit
	loweroppstat SPEED
	endmove

SpecialAttackDown:
	checkobedience
	usedmovetext
	doturn
	checkhit
	loweroppstat SP_ATTACK
	endmove

SpecialDefenseDown:
	checkobedience
	usedmovetext
	doturn
	checkhit
	loweroppstat SP_DEFENSE
	endmove

AccuracyDown:
	checkobedience
	usedmovetext
	doturn
	checkhit
	loweroppstat ACCURACY
	endmove

EvasionDown:
	checkobedience
	usedmovetext
	doturn
	checkhit
	loweroppstat EVASION
	endmove

AttackDown2:
	checkobedience
	usedmovetext
	doturn
	checkhit
	loweroppstat $10 | ATTACK
	endmove

DefenseDown2:
	checkobedience
	usedmovetext
	doturn
	checkhit
	loweroppstat $10 | DEFENSE
	endmove

SpeedDown2:
	checkobedience
	usedmovetext
	doturn
	checkhit
	loweroppstat $10 | SPEED
	endmove

SpecialAttackDown2:
	checkobedience
	usedmovetext
	doturn
	checkhit
	loweroppstat $10 | SP_ATTACK
	endmove

SpecialDefenseDown2:
	checkobedience
	usedmovetext
	doturn
	checkhit
	loweroppstat $10 | SP_DEFENSE
	endmove

AccuracyDown2:
	checkobedience
	usedmovetext
	doturn
	checkhit
	loweroppstat $10 | ACCURACY
	endmove

EvasionDown2:
	checkobedience
	usedmovetext
	doturn
	checkhit
	loweroppstat $10 | EVASION
	endmove

AttackDownHit:
	checkobedience
	usedmovetext
	doturn
	critical
	damagestats
	damagecalc
	stab
	damagevariation
	checkhit
	effectchance
	moveanim
	failuretext
	applydamage
	criticaltext
	supereffectivetext
	checkfaint
	buildopponentrage
	loweroppstathit ATTACK
	endmove

DefenseDownHit:
	checkobedience
	usedmovetext
	doturn
	critical
	damagestats
	damagecalc
	stab
	damagevariation
	checkhit
	effectchance
	moveanim
	failuretext
	applydamage
	criticaltext
	supereffectivetext
	checkfaint
	buildopponentrage
	loweroppstathit DEFENSE
	endmove

SpeedDownHit:
	checkobedience
	usedmovetext
	doturn
	critical
	damagestats
	damagecalc
	stab
	damagevariation
	checkhit
	effectchance
	moveanim
	failuretext
	applydamage
	criticaltext
	supereffectivetext
	checkfaint
	buildopponentrage
	loweroppstathit SPEED
	endmove

SpecialAttackDownHit:
	checkobedience
	usedmovetext
	doturn
	critical
	damagestats
	damagecalc
	stab
	damagevariation
	checkhit
	effectchance
	moveanim
	failuretext
	applydamage
	criticaltext
	supereffectivetext
	checkfaint
	buildopponentrage
	loweroppstathit SP_ATTACK
	endmove

SpecialDefenseDownHit:
	checkobedience
	usedmovetext
	doturn
	critical
	damagestats
	damagecalc
	stab
	damagevariation
	checkhit
	effectchance
	moveanim
	failuretext
	applydamage
	criticaltext
	supereffectivetext
	checkfaint
	buildopponentrage
	loweroppstathit SP_DEFENSE
	endmove

AccuracyDownHit:
	checkobedience
	usedmovetext
	doturn
	critical
	damagestats
	damagecalc
	stab
	damagevariation
	checkhit
	effectchance
	moveanim
	failuretext
	applydamage
	criticaltext
	supereffectivetext
	checkfaint
	buildopponentrage
	loweroppstathit ACCURACY
	endmove

EvasionDownHit:
	checkobedience
	usedmovetext
	doturn
	critical
	damagestats
	damagecalc
	stab
	damagevariation
	checkhit
	effectchance
	moveanim
	failuretext
	applydamage
	criticaltext
	supereffectivetext
	checkfaint
	buildopponentrage
	loweroppstathit EVASION
	endmove

DefenseUpHit:
	checkobedience
	usedmovetext
	doturn
	critical
	damagestats
	damagecalc
	stab
	damagevariation
	checkhit
	effectchance
	moveanim
	failuretext
	applydamage
	criticaltext
	supereffectivetext
	checkfaint
	buildopponentrage
	raisestathit DEFENSE
	endmove

AttackUpHit:
	checkobedience
	usedmovetext
	doturn
	critical
	damagestats
	damagecalc
	stab
	damagevariation
	checkhit
	effectchance
	moveanim
	failuretext
	applydamage
	criticaltext
	supereffectivetext
	checkfaint
	buildopponentrage
	raisestathit ATTACK
	endmove

AllUpHit:
	checkobedience
	usedmovetext
	doturn
	critical
	damagestats
	damagecalc
	stab
	damagevariation
	checkhit
	effectchance
	moveanim
	failuretext
	applydamage
	criticaltext
	supereffectivetext
	checkfaint
	buildopponentrage
	raisestathit ATTACK
	raisestathit DEFENSE
	raisestathit SPEED
	raisestathit SP_ATTACK
	raisestathit SP_DEFENSE
	endmove

PayDay:
	checkobedience
	usedmovetext
	doturn
	critical
	damagestats
	damagecalc
	stab
	damagevariation
	checkhit
	moveanim
	failuretext
	applydamage
	criticaltext
	supereffectivetext
	payday
	checkfaint
	buildopponentrage
	heldflinch
	endmove

Conversion:
	checkobedience
	usedmovetext
	doturn
	conversion
	endmove

ResetStats:
	checkobedience
	usedmovetext
	doturn
	resetstats
	endmove

Bide:
	storeenergy
	checkobedience
	doturn
	usedmovetext
	unleashenergy
	resettypematchup
	checkhit
	moveanim
	bidefailtext
	applydamage
	checkfaint
	buildopponentrage
	heldflinch
	endmove

Rampage:
	checkrampage
	checkobedience
	doturn
	rampage
	usedmovetext
	checkhit
	critical
	damagestats
	damagecalc
	stab
	damagevariation
	clearmissdamage
	moveanim
	failuretext
	applydamage
	criticaltext
	supereffectivetext
	checkfaint
	buildopponentrage
	heldflinch
	endmove

ForceSwitch:
	checkobedience
	usedmovetext
	doturn
	checkhit
	forceswitch
	endmove

MultiHit:
	checkobedience
	usedmovetext
	doturn
	startloop
	lowersub
	checkhit
	critical
	damagestats
	damagecalc
	stab
	damagevariation
	clearmissdamage
	moveanimnosub
	failuretext
	applydamage
	criticaltext
	cleartext
	supereffectivelooptext
	checkfaint
	buildopponentrage
	endloop
	raisesub
	heldflinch
	endmove

PoisonMultiHit:
	checkobedience
	usedmovetext
	doturn
	startloop
	lowersub
	checkhit
	effectchance
	critical
	damagestats
	damagecalc
	stab
	damagevariation
	clearmissdamage
	moveanimnosub
	failuretext
	applydamage
	criticaltext
	cleartext
	supereffectivelooptext
	checkfaint
	buildopponentrage
	endloop
	raisesub
	heldflinch
	poisontarget
	endmove

FlinchHit:
	checkobedience
	usedmovetext
	doturn
	critical
	damagestats
	damagecalc
	stab
	damagevariation
	checkhit
	effectchance
	moveanim
	failuretext
	applydamage
	criticaltext
	supereffectivetext
	checkfaint
	buildopponentrage
	flinchtarget
	endmove

OHKOHit:
	checkobedience
	usedmovetext
	doturn
	stab
	ohko
	moveanim
	failuretext
	applydamage
	criticaltext
	supereffectivetext
	checkfaint
	buildopponentrage
	endmove

RecoilHit:
	checkobedience
	usedmovetext
	doturn
	critical
	damagestats
	damagecalc
	stab
	damagevariation
	checkhit
	moveanim
	failuretext
	applydamage
	criticaltext
	supereffectivetext
	recoil RECOIL_1_3
	checkfaint
	buildopponentrage
	heldflinch
	endmove

Mist:
	checkobedience
	usedmovetext
	doturn
	mist
	endmove

FocusEnergy:
	checkobedience
	usedmovetext
	doturn
	focusenergy
	endmove

DoConfuse:
	checkobedience
	usedmovetext
	doturn
	checkhit
	checksafeguard
	confuse
	endmove

ConfuseHit:
	checkobedience
	usedmovetext
	doturn
	critical
	damagestats
	damagecalc
	stab
	damagevariation
	checkhit
	effectchance
	moveanim
	failuretext
	applydamage
	criticaltext
	supereffectivetext
	checkfaint
	buildopponentrage
	confusetarget
	endmove

Heal:
	checkobedience
	usedmovetext
	doturn
	heal
	endmove

Transform:
	checkobedience
	usedmovetext
	doturn
	transform
	endmove

LightScreen:
Reflect:
	checkobedience
	usedmovetext
	doturn
	screen
	endmove

TriAttack:
	checkobedience
	usedmovetext
	doturn
	critical
	damagestats
	damagecalc
	stab
	damagevariation
	checkhit
	moveanim
	failuretext
	applydamage
	criticaltext
	supereffectivetext
	checkfaint
	buildopponentrage
	tristatuschance
	endmove

Toxic:
DoPoison:
	checkobedience
	usedmovetext
	doturn
	checkhit
	stab
	checksafeguard
	poison
	endmove

DoParalyze:
	checkobedience
	usedmovetext
	doturn
	stab
	checkhit
	checksafeguard
	paralyze
	endmove

SkyAttack:
	checkcharge
	checkobedience
	doturn
	charge
	usedmovetext
	critical
	damagestats
	damagecalc
	stab
	damagevariation
	checkhit
	effectchance
	moveanim
	failuretext
	applydamage
	criticaltext
	supereffectivetext
	checkfaint
	buildopponentrage
	flinchtarget
	heldflinch
	endmove

Substitute:
	checkobedience
	usedmovetext
	doturn
	substitute
	endmove

HyperBeam:
	checkobedience
	usedmovetext
	doturn
	critical
	damagestats
	damagecalc
	stab
	damagevariation
	checkhit
	moveanim
	failuretext
	applydamage
	criticaltext
	supereffectivetext
	rechargenextturn
	checkfaint
	buildopponentrage
	endmove

Rage:
	checkobedience
	usedmovetext
	doturn
	critical
	damagestats
	damagecalc
	stab
	checkhit
	ragedamage
	damagevariation
	moveanim
	failuretext
	rage
	applydamage
	criticaltext
	supereffectivetext
	checkfaint
	buildopponentrage
	heldflinch
	endmove

Mimic:
	checkobedience
	usedmovetext
	doturn
	checkhit
	mimic
	endmove

Metronome:
	checkobedience
	usedmovetext
	doturn
	metronome
	endmove

LeechSeed:
	checkobedience
	usedmovetext
	doturn
	checkhit
	leechseed
	endmove

Splash:
	checkobedience
	usedmovetext
	doturn
	splash
	endmove

Disable:
	checkobedience
	usedmovetext
	doturn
	checkhit
	disable
	endmove

RazorWind:
	checkcharge
	checkobedience
	doturn
	charge
	usedmovetext
	critical
	damagestats
	damagecalc
	stab
	damagevariation
	checkhit
	moveanim
	failuretext
	applydamage
	criticaltext
	supereffectivetext
	checkfaint
	buildopponentrage
	heldflinch
	endmove

Fly:
	checkcharge
	checkobedience
	doturn
	charge
	usedmovetext
	critical
	damagestats
	damagecalc
	stab
	damagevariation
	checkhit
	moveanimnosub
	raisesub
	failuretext
	applydamage
	criticaltext
	supereffectivetext
	checkfaint
	buildopponentrage
	heldflinch
	endmove

Whirlpool:
	checkobedience
	usedmovetext
	doturn
	checkhit
	critical
	damagestats
	damagecalc
	stab
	damagevariation
	doubleunderwaterdamage
	clearmissdamage
	moveanim
	failuretext
	applydamage
	criticaltext
	supereffectivetext
	checkfaint
	buildopponentrage
	traptarget
	endmove

TrapTarget:
	checkobedience
	usedmovetext
	doturn
	checkhit
	critical
	damagestats
	damagecalc
	stab
	damagevariation
	clearmissdamage
	moveanim
	failuretext
	applydamage
	criticaltext
	supereffectivetext
	checkfaint
	buildopponentrage
	traptarget
	endmove

SuperFang:
Psywave:
StaticDamage:
	checkobedience
	usedmovetext
	doturn
	constantdamage
	checkhit
	resettypematchup
	moveanim
	failuretext
	applydamage
	checkfaint
	buildopponentrage
	heldflinch
	endmove

Reversal:
	checkobedience
	usedmovetext
	doturn
	constantdamage
	stab
	checkhit
	moveanim
	failuretext
	applydamage
	supereffectivetext
	checkfaint
	buildopponentrage
	heldflinch
	endmove

Counter:
	checkobedience
	usedmovetext
	doturn
	counter
	moveanim
	failuretext
	applydamage
	checkfaint
	buildopponentrage
	heldflinch
	endmove

Encore:
	checkobedience
	usedmovetext
	doturn
	checkhit
	encore
	endmove

PainSplit:
	checkobedience
	usedmovetext
	doturn
	checkhit
	painsplit
	endmove

Snore:
	checkobedience
	usedmovetext
	doturn
	critical
	damagestats
	damagecalc
	stab
	damagevariation
	checkhit
	effectchance
	snore
	moveanim
	failuretext
	applydamage
	criticaltext
	supereffectivetext
	checkfaint
	buildopponentrage
	flinchtarget
	heldflinch
	endmove

Conversion2:
	checkobedience
	usedmovetext
	doturn
	checkhit
	conversion2
	endmove

LockOn:
	checkobedience
	usedmovetext
	doturn
	checkhit
	lockon
	endmove

Sketch:
	checkobedience
	usedmovetext
	doturn
	sketch
	endmove

;DefrostOpponent:
;	checkobedience
;	usedmovetext
;	doturn
;	defrostopponent
;	endmove

SleepTalk:
	checkobedience
	usedmovetext
	doturn
	sleeptalk
	endmove

DestinyBond:
	checkobedience
	usedmovetext
	doturn
	destinybond
	endmove

Spite:
	checkobedience
	usedmovetext
	doturn
	checkhit
	spite
	endmove

FalseSwipe:
	checkobedience
	usedmovetext
	doturn
	critical
	damagestats
	damagecalc
	stab
	damagevariation
	falseswipe
	checkhit
	moveanim
	failuretext
	applydamage
	criticaltext
	supereffectivetext
	checkfaint
	buildopponentrage
	heldflinch
	endmove

HealBell:
	checkobedience
	usedmovetext
	doturn
	healbell
	endmove

TripleKick:
	checkobedience
	usedmovetext
	doturn
	startloop
	lowersub
	checkhit
	critical
	damagestats
	damagecalc
	triplekick
	stab
	damagevariation
	clearmissdamage
	moveanimnosub
	failuretext
	applydamage
	criticaltext
	cleartext
	supereffectivelooptext
	checkfaint
	buildopponentrage
	kickcounter
	endloop
	raisesub
	heldflinch
	endmove

Thief:
	checkobedience
	usedmovetext
	doturn
	critical
	damagestats
	damagecalc
	stab
	damagevariation
	checkhit
	effectchance
	moveanim
	failuretext
	applydamage
	criticaltext
	supereffectivetext
	thief
	checkfaint
	buildopponentrage
	heldflinch
	endmove

MeanLook:
	checkobedience
	usedmovetext
	doturn
	arenatrap
	endmove

Nightmare:
	checkobedience
	usedmovetext
	doturn
	nightmare
	endmove

FlameWheel:
	checkobedience
	usedmovetext
	doturn
	critical
	damagestats
	damagecalc
	stab
	damagevariation
	checkhit
	effectchance
	moveanim
	failuretext
	applydamage
	criticaltext
	supereffectivetext
	defrost
	checkfaint
	buildopponentrage
	burntarget
	endmove

Curse:
	checkobedience
	usedmovetext
	doturn
	curse
	endmove

Protect:
	checkobedience
	usedmovetext
	doturn
	protect
	endmove

Spikes:
	checkobedience
	usedmovetext
	doturn
	spikes
	endmove

ToxicSpikes:
	checkobedience
	usedmovetext
	doturn
	toxicspikes
	endmove

StealthRock:
	checkobedience
	usedmovetext
	doturn
	stealthrock
	endmove

Foresight:
	checkobedience
	usedmovetext
	doturn
	checkhit
	foresight
	endmove

PerishSong:
	checkobedience
	usedmovetext
	doturn
	perishsong
	endmove

Sandstorm:
	checkobedience
	usedmovetext
	doturn
	startsandstorm
	endmove

Endure:
	checkobedience
	usedmovetext
	doturn
	endure
	endmove

Rollout:
	checkcurl
	checkobedience
	doturn
	usedmovetext
	critical
	damagestats
	damagecalc
	stab
	checkhit
	rolloutpower
	damagevariation
	moveanim
	failuretext
	applydamage
	criticaltext
	supereffectivetext
	checkfaint
	buildopponentrage
	heldflinch
	endmove

Flatter:
	checkobedience
	usedmovetext
	doturn
	checkhit
	raiseoppstat SP_ATTACK
	confuse
	endmove

Swagger:
	checkobedience
	usedmovetext
	doturn
	checkhit
	raiseoppstat $10 | ATTACK
	confuse
	endmove

FuryCutter:
	checkobedience
	usedmovetext
	doturn
	critical
	damagestats
	damagecalc
	stab
	checkhit
	furycutter
	damagevariation
	moveanim
	failuretext
	applydamage
	criticaltext
	supereffectivetext
	checkfaint
	buildopponentrage
	heldflinch
	endmove

Attract:
	checkobedience
	usedmovetext
	doturn
	checkhit
	attract
	endmove

Return:
	checkobedience
	usedmovetext
	doturn
	critical
	damagestats
	happinesspower
	damagecalc
	stab
	damagevariation
	checkhit
	moveanim
	failuretext
	applydamage
	criticaltext
	supereffectivetext
	checkfaint
	buildopponentrage
	heldflinch
	endmove

Present:
	checkobedience
	usedmovetext
	doturn
	checkhit
	critical
	damagestats
	present
	damagecalc
	stab
	damagevariation
	clearmissdamage
	failuretext
	applydamage
	criticaltext
	supereffectivetext
	checkfaint
	buildopponentrage
	heldflinch
	endmove

Frustration:
	checkobedience
	usedmovetext
	doturn
	critical
	damagestats
	frustrationpower
	damagecalc
	stab
	damagevariation
	checkhit
	moveanim
	failuretext
	applydamage
	criticaltext
	supereffectivetext
	checkfaint
	buildopponentrage
	heldflinch
	endmove

Safeguard:
	checkobedience
	usedmovetext
	doturn
	safeguard
	endmove

SacredFire:
	checkobedience
	usedmovetext
	doturn
	critical
	damagestats
	damagecalc
	stab
	damagevariation
	checkhit
	effectchance
	moveanim
	failuretext
	applydamage
	criticaltext
	supereffectivetext
	defrost
	checkfaint
	buildopponentrage
	burntarget
	endmove

Magnitude:
	checkobedience
	usedmovetext
	doturn
	critical
	damagestats
	getmagnitude
	damagecalc
	stab
	damagevariation
	checkhit
	doubleundergrounddamage
	moveanim
	failuretext
	applydamage
	criticaltext
	supereffectivetext
	checkfaint
	buildopponentrage
	heldflinch
	endmove

BatonPass:
	checkobedience
	usedmovetext
	doturn
	batonpass
	endmove

Pursuit:
	checkobedience
	usedmovetext
	doturn
	critical
	damagestats
	damagecalc
	stab
	damagevariation
	pursuit
	checkhit
	moveanim
	failuretext
	applydamage
	criticaltext
	supereffectivetext
	checkfaint
	buildopponentrage
	heldflinch
	endmove

RapidSpin:
	checkobedience
	usedmovetext
	doturn
	critical
	damagestats
	damagecalc
	stab
	damagevariation
	checkhit
	moveanim
	failuretext
	applydamage
	criticaltext
	supereffectivetext
	clearhazards
	checkfaint
	buildopponentrage
	heldflinch
	endmove

MorningSun:
	checkobedience
	usedmovetext
	doturn
	healmorn
	endmove

Synthesis:
	checkobedience
	usedmovetext
	doturn
	healday
	endmove

Moonlight:
	checkobedience
	usedmovetext
	doturn
	healnite
	endmove

HiddenPower:
	checkobedience
	usedmovetext
	doturn
	critical
	hiddenpower
	damagecalc
	stab
	damagevariation
	checkhit
	moveanim
	failuretext
	applydamage
	criticaltext
	supereffectivetext
	checkfaint
	buildopponentrage
	heldflinch
	endmove

RainDance:
	checkobedience
	usedmovetext
	doturn
	startrain
	endmove

SunnyDay:
	checkobedience
	usedmovetext
	doturn
	startsun
	endmove

Hail:
	checkobedience
	usedmovetext
	doturn
	starthail
	endmove

FakeOut:
	checkobedience
	usedmovetext
	doturn
	fakeout
	critical
	damagestats
	damagecalc
	stab
	damagevariation
	checkhit
	moveanim
	failuretext
	applydamage
	criticaltext
	supereffectivetext
	checkfaint
	buildopponentrage
	flinchtarget
	endmove

BellyDrum:
	checkobedience
	usedmovetext
	doturn
	bellydrum
	endmove

PsychUp:
	checkobedience
	usedmovetext
	doturn
	psychup
	endmove

MirrorCoat:
	checkobedience
	usedmovetext
	doturn
	mirrorcoat
	moveanim
	failuretext
	applydamage
	checkfaint
	buildopponentrage
	heldflinch
	endmove

SkullBash:
	checkcharge
	checkobedience
	doturn
	charge
	usedmovetext
	critical
	damagestats
	damagecalc
	stab
	damagevariation
	checkhit
	moveanim
	failuretext
	applydamage
	criticaltext
	supereffectivetext
	checkfaint
	buildopponentrage
	heldflinch
	endturn
	forceraisestat DEFENSE
	endmove

Twister:
	checkobedience
	usedmovetext
	doturn
	critical
	damagestats
	damagecalc
	stab
	damagevariation
	doubleflyingdamage
	checkhit
	effectchance
	moveanim
	failuretext
	applydamage
	criticaltext
	supereffectivetext
	checkfaint
	buildopponentrage
	flinchtarget
	endmove

Earthquake:
	checkobedience
	usedmovetext
	doturn
	critical
	damagestats
	damagecalc
	stab
	damagevariation
	doubleundergrounddamage
	checkhit
	effectchance
	moveanim
	failuretext
	applydamage
	criticaltext
	supereffectivetext
	checkfaint
	buildopponentrage
	endmove

FutureSight:
	checkfuturesight
	checkobedience
	usedmovetext
	doturn
	damagestats
	damagecalc
	futuresight
	damagevariation ; skip here if last turn
	checkhit
	moveanimnosub
	failuretext
	applydamage
	checkfaint
	buildopponentrage
	endmove

Gust:
	checkobedience
	usedmovetext
	doturn
	critical
	damagestats
	damagecalc
	stab
	damagevariation
	doubleflyingdamage
	checkhit
	moveanim
	failuretext
	applydamage
	criticaltext
	supereffectivetext
	checkfaint
	buildopponentrage
	endmove

Stomp:
	checkobedience
	usedmovetext
	doturn
	critical
	damagestats
	damagecalc
	stab
	damagevariation
	doubleminimizedamage
	checkhit
	effectchance
	moveanim
	failuretext
	applydamage
	criticaltext
	supereffectivetext
	checkfaint
	buildopponentrage
	flinchtarget
	endmove

Solarbeam:
	checkcharge
	checkobedience
	doturn
	skipsuncharge
	charge
	usedmovetext
	critical
	damagestats
	damagecalc
	stab
	damagevariation
	checkhit
	moveanim
	failuretext
	applydamage
	criticaltext
	supereffectivetext
	checkfaint
	buildopponentrage
	heldflinch
	endmove

Thunder:
	checkobedience
	usedmovetext
	doturn
	critical
	damagestats
	damagecalc
	thunderaccuracy
	checkhit
	effectchance
	stab
	damagevariation
	moveanim
	failuretext
	applydamage
	criticaltext
	supereffectivetext
	checkfaint
	buildopponentrage
	paralyzetarget
	endmove

Teleport:
	checkobedience
	usedmovetext
	doturn
	teleport
	endmove

BeatUp:
	checkobedience
	usedmovetext
	movedelay
	doturn
	startloop
	lowersub
	checkhit
	critical
	beatup
	damagecalc
	damagevariation
	clearmissdamage
	moveanimnosub
	failuretext
	applydamage
	criticaltext
	cleartext
	supereffectivetext
	checkfaint
	buildopponentrage
	endloop
	beatupfailtext
	raisesub
	heldflinch
	endmove

DefenseCurl:
	checkobedience
	usedmovetext
	doturn
	forceraisestat DEFENSE
	curl
	endmove

WillOWisp:
	checkobedience
	usedmovetext
	doturn
	checkhit
	checksafeguard
	burn
	endmove

Superpower:
	checkobedience
	usedmovetext
	doturn
	critical
	damagestats
	damagecalc
	stab
	damagevariation
	checkhit
	moveanim
	failuretext
	applydamage
	criticaltext
	supereffectivetext
	checkfaint
	buildopponentrage
	forcelowerstat ATTACK
	forcelowerstat DEFENSE
	endmove

SpecialAttackDown2Hit:
	checkobedience
	usedmovetext
	doturn
	critical
	damagestats
	damagecalc
	stab
	damagevariation
	checkhit
	moveanim
	failuretext
	applydamage
	criticaltext
	supereffectivetext
	checkfaint
	buildopponentrage
	forcelowerstat $10 | SP_ATTACK
	endmove

AttackDefenseDown:
	checkobedience
	usedmovetext
	doturn
	checkhit
	loweroppstat ATTACK
	loweroppstat DEFENSE
	endmove

DefenseSpecialDefenseUp:
	checkobedience
	usedmovetext
	doturn
	forceraisestat DEFENSE
	forceraisestat SP_DEFENSE
	endmove

AttackDefenseUp:
	checkobedience
	usedmovetext
	doturn
	forceraisestat ATTACK
	forceraisestat DEFENSE
	endmove

SpecialAttackSpecialDefenseUp:
	checkobedience
	usedmovetext
	doturn
	forceraisestat SP_ATTACK
	forceraisestat SP_DEFENSE
	endmove

AttackSpeedUp:
	checkobedience
	usedmovetext
	doturn
	forceraisestat ATTACK
	forceraisestat SPEED
	endmove

ThunderFang:
	checkobedience
	usedmovetext
	doturn
	critical
	damagestats
	damagecalc
	stab
	damagevariation
	checkhit
	effectchance
	moveanim
	failuretext
	applydamage
	criticaltext
	supereffectivetext
	checkfaint
	buildopponentrage
	flinchtarget
	effectchance
	paralyzetarget
	endmove

FireFang:
	checkobedience
	usedmovetext
	doturn
	critical
	damagestats
	damagecalc
	stab
	damagevariation
	checkhit
	effectchance
	moveanim
	failuretext
	applydamage
	criticaltext
	supereffectivetext
	checkfaint
	buildopponentrage
	flinchtarget
	effectchance
	burntarget
	endmove

IceFang:
	checkobedience
	usedmovetext
	doturn
	critical
	damagestats
	damagecalc
	stab
	damagevariation
	checkhit
	effectchance
	moveanim
	failuretext
	applydamage
	criticaltext
	supereffectivetext
	checkfaint
	buildopponentrage
	flinchtarget
	effectchance
	freezetarget
	endmove

SpecialDefenseDown2Hit:
	checkobedience
	usedmovetext
	doturn
	critical
	damagestats
	damagecalc
	stab
	damagevariation
	checkhit
	effectchance
	moveanim
	failuretext
	applydamage
	criticaltext
	supereffectivetext
	checkfaint
	buildopponentrage
	loweroppstathit $10 | SP_DEFENSE
	endmove

HPScaleHit:
	checkobedience
	usedmovetext
	doturn
	critical
	damagestats
	lifepower
	damagecalc
	stab
	damagevariation
	checkhit
	moveanim
	failuretext
	applydamage
	criticaltext
	supereffectivetext
	checkfaint
	buildopponentrage
	heldflinch
	endmove

Facade:
	checkobedience
	usedmovetext
	doturn
	critical
	damagestats
	facade
	damagecalc
	stab
	damagevariation
	checkhit
	moveanim
	failuretext
	applydamage
	criticaltext
	supereffectivetext
	checkfaint
	buildopponentrage
	heldflinch
	endmove

Bounce:
	checkcharge
	checkobedience
	doturn
	charge
	usedmovetext
	critical
	damagestats
	damagecalc
	stab
	damagevariation
	checkhit
	effectchance
	moveanimnosub
	raisesub
	failuretext
	applydamage
	criticaltext
	supereffectivetext
	checkfaint
	buildopponentrage
	paralyzetarget
	endmove

BrickBreak:
	checkobedience
	usedmovetext
	doturn
	critical
	damagestats
	damagecalc
	stab
	damagevariation
	checkhit
	moveanim
	failuretext
	applydamage
	criticaltext
	supereffectivetext
	checkfaint
	buildopponentrage
	heldflinch
	breakscreens
	endmove

RecoilHit1_2:
	checkobedience
	usedmovetext
	doturn
	critical
	damagestats
	damagecalc
	stab
	damagevariation
	checkhit
	moveanim
	failuretext
	applydamage
	criticaltext
	supereffectivetext
	recoil RECOIL_1_2
	checkfaint
	buildopponentrage
	heldflinch
	endmove

RecoilHit1_4:
	checkobedience
	usedmovetext
	doturn
	critical
	damagestats
	damagecalc
	stab
	damagevariation
	checkhit
	moveanim
	failuretext
	applydamage
	criticaltext
	supereffectivetext
	recoil RECOIL_1_4
	checkfaint
	buildopponentrage
	heldflinch
	endmove

VoltTackle:
	checkobedience
	usedmovetext
	doturn
	critical
	damagestats
	damagecalc
	stab
	damagevariation
	checkhit
	effectchance
	moveanim
	failuretext
	applydamage
	criticaltext
	supereffectivetext
	recoil RECOIL_1_3
	checkfaint
	buildopponentrage
	paralyzetarget
	endmove

FlareBlitz:
	checkobedience
	usedmovetext
	doturn
	critical
	damagestats
	damagecalc
	stab
	damagevariation
	checkhit
	effectchance
	moveanim
	failuretext
	applydamage
	criticaltext
	supereffectivetext
	recoil RECOIL_1_3
	checkfaint
	buildopponentrage
	burntarget
	endmove

WeightDamage:
	checkobedience
	usedmovetext
	doturn
	critical
	damagestats
	weightdamage
	damagecalc
	stab
	damagevariation
	checkhit
	moveanim
	failuretext
	applydamage
	criticaltext
	supereffectivetext
	checkfaint
	buildopponentrage
	heldflinch
	endmove

NaturePower:
	checkobedience
	usedmovetext
	doturn
	naturepower
	endmove

Camouflage:
	checkobedience
	usedmovetext
	doturn
	camouflage
	endmove

Memento:
	checkobedience
	usedmovetext
	doturn
	moveanim
	loweroppstat $10 | ATTACK
	loweroppstat $10 | SP_ATTACK
	kouser
	endmove

Endeavor:
	checkobedience
	usedmovetext
	doturn
	endeavor
	checkhit
	resettypematchup
	moveanim
	failuretext
	applydamage
	checkfaint
	buildopponentrage
	heldflinch
	endmove

HammerArm:
	checkobedience
	usedmovetext
	doturn
	critical
	damagestats
	damagecalc
	stab
	damagevariation
	checkhit
	moveanim
	failuretext
	applydamage
	criticaltext
	supereffectivetext
	checkfaint
	buildopponentrage
	forcelowerstat SPEED
	endmove

CloseCombat:
	checkobedience
	usedmovetext
	doturn
	critical
	damagestats
	damagecalc
	stab
	damagevariation
	checkhit
	moveanim
	failuretext
	applydamage
	criticaltext
	supereffectivetext
	checkfaint
	buildopponentrage
	forcelowerstat DEFENSE
	forcelowerstat SP_DEFENSE
	endmove

CrushGrip:
	checkobedience
	usedmovetext
	doturn
	critical
	damagestats
	switchturn
	lifepower
	switchturn
	damagecalc
	stab
	damagevariation
	checkhit
	moveanim
	failuretext
	applydamage
	criticaltext
	supereffectivetext
	checkfaint
	buildopponentrage
	heldflinch
	endmove

Brine:
	checkobedience
	usedmovetext
	doturn
	critical
	damagestats
	brine
	damagecalc
	stab
	damagevariation
	checkhit
	moveanim
	failuretext
	applydamage
	criticaltext
	supereffectivetext
	checkfaint
	buildopponentrage
	heldflinch
	endmove

Trick:
	checkobedience
	usedmovetext
	doturn
	trick
	endmove

Taunt:
	checkobedience
	usedmovetext
	doturn
	checkhit
	taunt
	endmove

TrumpCard:
	checkobedience
	usedmovetext
	doturn
	critical
	damagestats
	trumpcard
	damagecalc
	stab
	damagevariation
	checkhit
	moveanim
	failuretext
	applydamage
	criticaltext
	supereffectivetext
	checkfaint
	buildopponentrage
	heldflinch
	endmove

Refresh:
	checkobedience
	usedmovetext
	doturn
	refresh
	endmove

WakeUpSlap:
	checkobedience
	usedmovetext
	doturn
	critical
	damagestats
	wakeupslap
	damagecalc
	stab
	damagevariation
	checkhit
	moveanim
	failuretext
	applydamage
	criticaltext
	supereffectivetext
	checkfaint
	buildopponentrage
	heldflinch
	endmove

SmellingSalt:
	checkobedience
	usedmovetext
	doturn
	critical
	damagestats
	smellingsalt
	damagecalc
	stab
	damagevariation
	checkhit
	moveanim
	failuretext
	applydamage
	criticaltext
	supereffectivetext
	checkfaint
	buildopponentrage
	heldflinch
	endmove

Imprison:
	checkobedience
	usedmovetext
	doturn
	imprison
	endmove

Torment:
	checkobedience
	usedmovetext
	doturn
	checkhit
	torment
	endmove

Charge:
	checkobedience
	usedmovetext
	doturn
	movecharge
	forceraisestat SP_DEFENSE
	endmove

WaterSport:
	checkobedience
	usedmovetext
	doturn
	watersport
	endmove

MudSport:
	checkobedience
	usedmovetext
	doturn
	mudsport
	endmove

Ingrain:
	checkobedience
	usedmovetext
	doturn
	ingrain
	endmove

Assist:
	checkobedience
	usedmovetext
	doturn
	assist
	endmove

AquaRing:
	checkobedience
	usedmovetext
	doturn
	aquaring
	endmove

Uproar:
	checkuproar
	checkobedience
	doturn
	usedmovetext
	checkhit
	critical
	damagestats
	damagecalc
	stab
	damagevariation
	clearmissdamage
	moveanim
	failuretext
	applydamage
	criticaltext
	supereffectivetext
	uproar
	checkfaint
	buildopponentrage
	heldflinch
	endmove

Stockpile:
	checkobedience
	usedmovetext
	doturn
	stockpile
	forceraisestat DEFENSE
	forceraisestat SP_DEFENSE
	endmove

SpitUp:
	checkobedience
	usedmovetext
	doturn
	critical
	damagestats
	spitup
	damagecalc
	stab
	damagevariation
	checkhit
	moveanim
	failuretext
	applydamage
	criticaltext
	supereffectivetext
	removestockpile
	checkfaint
	buildopponentrage
	heldflinch
	endmove

Swallow:
	checkobedience
	usedmovetext
	doturn
	swallow
	removestockpile
	endmove

Acupressure:
	checkobedience
	usedmovetext
	doturn
	acupressure
	endmove

Recycle:
	checkobedience
	usedmovetext
	doturn
	recycle
	endmove

KnockOff:
	checkobedience
	usedmovetext
	doturn
	critical
	damagestats
	damagecalc
	stab
	damagevariation
	checkhit
	moveanim
	failuretext
	applydamage
	criticaltext
	supereffectivetext
	checkfaint
	knockoff
	buildopponentrage
	heldflinch
	endmove

Captivate:
	checkobedience
	usedmovetext
	doturn
	checkhit
	captivate
	loweroppstat $10 | SP_ATTACK
	endmove

GyroBall:
	checkobedience
	usedmovetext
	doturn
	critical
	damagestats
	gyroball
	damagecalc
	stab
	damagevariation
	checkhit
	moveanim
	failuretext
	applydamage
	criticaltext
	supereffectivetext
	checkfaint
	buildopponentrage
	heldflinch
	endmove

Tailwind:
	checkobedience
	usedmovetext
	doturn
	tailwind
	endmove

LastResort:
	checkobedience
	usedmovetext
	doturn
	lastresort
	critical
	damagestats
	damagecalc
	stab
	damagevariation
	checkhit
	moveanim
	failuretext
	applydamage
	criticaltext
	supereffectivetext
	checkfaint
	buildopponentrage
	heldflinch
	endmove

FocusPunch:
	checkobedience
	usedmovetext
	doturn
	focuspunch
	critical
	damagestats
	damagecalc
	stab
	damagevariation
	checkhit
	moveanim
	failuretext
	applydamage
	criticaltext
	supereffectivetext
	checkfaint
	buildopponentrage
	heldflinch
	endmove

Revenge:
	checkobedience
	usedmovetext
	doturn
	critical
	damagestats
	revenge
	damagecalc
	stab
	damagevariation
	checkhit
	moveanim
	failuretext
	applydamage
	criticaltext
	supereffectivetext
	checkfaint
	buildopponentrage
	heldflinch
	endmove

PowerSwap:
	checkobedience
	usedmovetext
	doturn
	powerswap
	endmove

GuardSwap:
	checkobedience
	usedmovetext
	doturn
	guardswap
	endmove

HeartSwap:
	checkobedience
	usedmovetext
	doturn
	heartswap
	endmove

Surf:
	checkobedience
	usedmovetext
	doturn
	critical
	damagestats
	damagecalc
	stab
	damagevariation
	doubleunderwaterdamage
	checkhit
	effectchance
	moveanim
	failuretext
	applydamage
	criticaltext
	supereffectivetext
	checkfaint
	buildopponentrage
	endmove

MetalBurst:
	checkobedience
	usedmovetext
	doturn
	metalburst
	moveanim
	failuretext
	applydamage
	checkfaint
	buildopponentrage
	heldflinch
	endmove

MiracleEye:
	checkobedience
	usedmovetext
	doturn
	checkhit
	miracleeye
	endmove

MagnetRise:
	checkobedience
	usedmovetext
	doturn
	magnetrise
	endmove

Gravity:
	checkobedience
	usedmovetext
	doturn
	gravity
	endmove

TrickRoom:
	checkobedience
	usedmovetext
	doturn
	trickroom
	endmove

HealBlock:
	checkobedience
	usedmovetext
	doturn
	healblock
	endmove

Payback:
	checkobedience
	usedmovetext
	doturn
	critical
	damagestats
	payback
	damagecalc
	stab
	damagevariation
	checkhit
	moveanim
	failuretext
	applydamage
	criticaltext
	supereffectivetext
	checkfaint
	buildopponentrage
	heldflinch
	endmove
