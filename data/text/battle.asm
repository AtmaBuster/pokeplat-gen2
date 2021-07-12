BattleText:: ; used only for BANK(BattleText)

BattleText_PlayerPickedUpPayDayMoney:
	text "<PLAYER> picked up"
	line "¥@"
	text_decimal wPayDayMoney, 3, 6
	text "!"
	prompt

WildPokemonAppearedText:
	text "Wild @"
	text_ram wEnemyMonNick
	text_start
	line "appeared!"
	prompt

HookedPokemonAttackedText:
	text "The hooked"
	line "@"
	text_ram wEnemyMonNick
	text_start
	cont "attacked!"
	prompt

PokemonFellFromTreeText:
	text_ram wEnemyMonNick
	text " fell"
	line "out of the tree!"
	prompt

WildCelebiAppearedText:
	text "Wild @"
	text_ram wEnemyMonNick
	text_start
	line "appeared!"
	prompt

WantsToBattleText::
	text "<ENEMY>"
	line "wants to battle!"
	prompt

BattleText_WildFled:
	text "Wild @"
	text_ram wEnemyMonNick
	text_start
	line "fled!"
	prompt

BattleText_EnemyFled:
	text "Enemy @"
	text_ram wEnemyMonNick
	text_start
	line "fled!"
	prompt

HurtByPoisonText:
	text "<USER>"
	line "is hurt by poison!"
	prompt

HurtByBurnText:
	text "<USER>'s"
	line "hurt by its burn!"
	prompt

LeechSeedSapsText:
	text "LEECH SEED saps"
	line "<USER>!"
	prompt

HasANightmareText:
	text "<USER>"
	line "has a NIGHTMARE!"
	prompt

HurtByCurseText:
	text "<USER>'s"
	line "hurt by the CURSE!"
	prompt

SandstormHitsText:
	text "The SANDSTORM hits"
	line "<USER>!"
	prompt

HailHitsText:
	text "<USER>"
	line "is pelted by HAIL!"
	prompt

PerishCountText:
	text "<USER>'s"
	line "PERISH count is @"
	text_decimal wDeciramBuffer, 1, 1
	text "!"
	prompt

BattleText_TargetRecoveredWithItem:
	text "<TARGET>"
	line "recovered with"
	cont "@"
	text_ram wStringBuffer1
	text "."
	prompt

BattleText_UserRecoveredPPUsing:
	text "<USER>"
	line "recovered PP using"
	cont "@"
	text_ram wStringBuffer1
	text "."
	prompt

BattleText_TargetWasHitByFutureSight:
	text "<TARGET>"
	line "was hit by"
	cont "@"
	text_ram wStringBuffer1
	text "!"
	prompt

BattleText_SafeguardFaded:
	text "<USER>'s"
	line "SAFEGUARD faded!"
	prompt

BattleText_MonsLightScreenFell:
	text_ram wStringBuffer1
	text " #MON's"
	line "LIGHT SCREEN fell!"
	prompt

BattleText_MonsReflectFaded:
	text_ram wStringBuffer1
	text " #MON's"
	line "REFLECT faded!"
	prompt

BattleText_RainContinuesToFall:
	text "Rain continues to"
	line "fall."
	prompt

BattleText_TheSunlightIsStrong:
	text "The sunlight is"
	line "strong."
	prompt

BattleText_TheSandstormRages:
	text "The SANDSTORM"
	line "rages."
	prompt

BattleText_HailContinuesToFall:
	text "Hail continues to"
	line "fall."
	prompt

BattleText_TheRainStopped:
	text "The rain stopped."
	prompt

BattleText_TheSunlightFaded:
	text "The sunlight"
	line "faded."
	prompt

BattleText_TheSandstormSubsided:
	text "The SANDSTORM"
	line "subsided."
	prompt

BattleText_TheHailStopped:
	text "The hail stopped."
	prompt

BattleText_EnemyMonFainted:
	text "Enemy @"
	text_ram wEnemyMonNick
	text_start
	line "fainted!"
	prompt

GotMoneyForWinningText:
	text "<PLAYER> got ¥@"
	text_decimal wBattleReward, 3, 6
	text_start
	line "for winning!"
	prompt

BattleText_EnemyWasDefeated:
	text "<ENEMY>"
	line "was defeated!"
	prompt

TiedAgainstText:
	text "Tied against"
	line "<ENEMY>!"
	prompt

SentSomeToMomText:
	text "<PLAYER> got ¥@"
	text_decimal wBattleReward, 3, 6
	text_start
	line "for winning!"
	cont "Sent some to MOM!"
	prompt

SentHalfToMomText:
	text "Sent half to MOM!"
	prompt

SentAllToMomText:
	text "Sent all to MOM!"
	prompt

BattleText_0x80a4f:
	text "<RIVAL>: Huh? I"
	line "should've chosen"
	cont "your #MON!"
	prompt

BattleText_MonFainted:
	text_ram wBattleMonNick
	text_start
	line "fainted!"
	prompt

BattleText_UseNextMon:
	text "Use next #MON?"
	done

BattleText_0x80a93:
	text "<RIVAL>: Yes!"
	line "I guess I chose a"
	cont "good #MON!"
	prompt

LostAgainstText:
	text "Lost against"
	line "<ENEMY>!"
	prompt

BattleText_EnemyIsAboutToUseWillPlayerChangeMon:
	text "<ENEMY>"
	line "is about to use"
	cont "@"
	text_ram wEnemyMonNick
	text "."

	para "Will <PLAYER>"
	line "change #MON?"
	done

BattleText_EnemySentOut:
	text "<ENEMY>"
	line "sent out"
	cont "@"
	text_ram wEnemyMonNick
	text "!"
	done

BattleText_TheresNoWillToBattle:
	text "There's no will to"
	line "battle!"
	prompt

BattleText_AnEGGCantBattle:
	text "An EGG can't"
	line "battle!"
	prompt

BattleText_CantEscape2:
	text "Can't escape!"
	prompt

BattleText_TheresNoEscapeFromTrainerBattle:
	text "No! There's no"
	line "running from a"
	cont "trainer battle!"
	prompt

BattleText_GotAwaySafely:
	text "Got away safely!"
	prompt

BattleText_UserFledUsingAStringBuffer1:
	text "<USER>"
	line "fled using a"
	cont "@"
	text_ram wStringBuffer1
	text "!"
	prompt

BattleText_CantEscape:
	text "Can't escape!"
	prompt

BattleText_UserHurtBySpikes:
	text "<USER>'s"
	line "hurt by SPIKES!"
	prompt

BattleText_UserHurtByStealthRock:
	text "<USER>'s"
	line "hurt by rocks!"
	prompt

RecoveredUsingText:
	text "<TARGET>"
	line "recovered using a"
	cont "@"
	text_ram wStringBuffer1
	text "!"
	prompt

BattleText_UsersStringBuffer1Activated:
	text "<USER>'s"
	line "@"
	text_ram wStringBuffer1
	text_start
	cont "activated!"
	prompt

BattleText_ItemsCantBeUsedHere:
	text "Items can't be"
	line "used here."
	prompt

BattleText_MonIsAlreadyOut:
	text_ram wBattleMonNick
	text_start
	line "is already out."
	prompt

BattleText_MonCantBeRecalled:
	text_ram wBattleMonNick
	text_start
	line "can't be recalled!"
	prompt

BattleText_TheresNoPPLeftForThisMove:
	text "There's no PP left"
	line "for this move!"
	prompt

BattleText_TheMoveIsDisabled:
	text "The move is"
	line "DISABLED!"
	prompt

BattleText_TheMoveCantBeSelected:
	text "The move can't be"
	line "selected!"
	prompt

BattleText_MonHasNoMovesLeft:
	text_ram wBattleMonNick
	text_start
	line "has no moves left!"
	done

BattleText_TargetsEncoreEnded:
	text "<TARGET>'s"
	line "ENCORE ended!"
	prompt

BattleText_StringBuffer1GrewToLevel:
	text_ram wStringBuffer1
	text " grew to"
	line "level @"
	text_decimal wCurPartyLevel, 1, 3
	text "!@"
	sound_dex_fanfare_50_79
	text_end

	text_end ; unused

BattleText_WildMonIsEating:
	text "Wild @"
	text_ram wEnemyMonNick
	text_start
	line "is eating!"
	prompt

BattleText_WildMonIsAngry:
	text "Wild @"
	text_ram wEnemyMonNick
	text_start
	line "is angry!"
	prompt

FastAsleepText:
	text "<USER>"
	line "is fast asleep!"
	prompt

WokeUpText:
	text "<USER>"
	line "woke up!"
	prompt

FrozenSolidText:
	text "<USER>"
	line "is frozen solid!"
	prompt

FlinchedText:
	text "<USER>"
	line "flinched!"
	prompt

MustRechargeText:
	text "<USER>"
	line "must recharge!"
	prompt

DisabledNoMoreText:
	text "<USER>'s"
	line "disabled no more!"
	prompt

IsConfusedText:
	text "<USER>"
	line "is confused!"
	prompt

HurtItselfText:
	text "It hurt itself in"
	line "its confusion!"
	prompt

ConfusedNoMoreText:
	text "<USER>'s"
	line "confused no more!"
	prompt

BecameConfusedText:
	text "<TARGET>"
	line "became confused!"
	prompt

BattleText_ItemHealedConfusion:
	text "A @"
	text_ram wStringBuffer1
	text " rid"
	line "<TARGET>"
	cont "of its confusion."
	prompt

AlreadyConfusedText:
	text "<TARGET>'s"
	line "already confused!"
	prompt

BattleText_UsersHurtByStringBuffer1:
	text "<USER>'s"
	line "hurt by"
	cont "@"
	text_ram wStringBuffer1
	text "!"
	prompt

BattleText_UserWasReleasedFromStringBuffer1:
	text "<USER>"
	line "was released from"
	cont "@"
	text_ram wStringBuffer1
	text "!"
	prompt

UsedBindText:
	text "<USER>"
	line "used BIND on"
	cont "<TARGET>!"
	prompt

WhirlpoolTrapText:
	text "<TARGET>"
	line "was trapped!"
	prompt

FireSpinTrapText:
	text "<TARGET>"
	line "was trapped!"
	prompt

WrappedByText:
	text "<TARGET>"
	line "was WRAPPED by"
	cont "<USER>!"
	prompt

ClampedByText:
	text "<TARGET>"
	line "was CLAMPED by"
	cont "<USER>!"
	prompt

StoringEnergyText:
	text "<USER>"
	line "is storing energy!"
	prompt

UnleashedEnergyText:
	text "<USER>"
	line "unleashed energy!"
	prompt

HungOnText:
	text "<TARGET>"
	line "hung on with"
	cont "@"
	text_ram wStringBuffer1
	text "!"
	prompt

EnduredText:
	text "<TARGET>"
	line "ENDURED the hit!"
	prompt

InLoveWithText:
	text "<USER>"
	line "is in love with"
	cont "<TARGET>!"
	prompt

InfatuationText:
	text "<USER>'s"
	line "infatuation kept"
	cont "it from attacking!"
	prompt

DisabledMoveText:
	text "<USER>'s"
	line "@"
	text_ram wStringBuffer1
	text " is"
	cont "DISABLED!"
	prompt

LoafingAroundText:
	text_ram wBattleMonNick
	text " is"
	line "loafing around."
	prompt

BeganToNapText:
	text_ram wBattleMonNick
	text " began"
	line "to nap!"
	prompt

WontObeyText:
	text_ram wBattleMonNick
	text " won't"
	line "obey!"
	prompt

TurnedAwayText:
	text_ram wBattleMonNick
	text " turned"
	line "away!"
	prompt

IgnoredOrdersText:
	text_ram wBattleMonNick
	text " ignored"
	line "orders!"
	prompt

IgnoredSleepingText:
	text_ram wBattleMonNick
	text " ignored"
	line "orders…sleeping!"
	prompt

NoPPLeftText:
	text "But no PP is left"
	line "for the move!"
	prompt

HasNoPPLeftText:
	text "<USER>"
	line "has no PP left for"
	cont "@"
	text_ram wStringBuffer2
	text "!"
	prompt

WentToSleepText:
	text "<USER>"
	line "went to sleep!"
	done

RestedText:
	text "<USER>"
	line "fell asleep and"
	cont "became healthy!"
	done

RegainedHealthText:
	text "<USER>"
	line "regained health!"
	prompt

AttackMissedText:
	text "<USER>'s"
	line "attack missed!"
	prompt

AttackMissed2Text:
	text "<USER>'s"
	line "attack missed!"
	prompt

CrashedText:
	text "<USER>"
	line "kept going and"
	cont "crashed!"
	prompt

UnaffectedText:
	text "<TARGET>'s"
	line "unaffected!"
	prompt

DoesntAffectText:
	text "It doesn't affect"
	line "<TARGET>!"
	prompt

CriticalHitText:
	text "A critical hit!"
	prompt

OneHitKOText:
	text "It's a one-hit KO!"
	prompt

SuperEffectiveText:
	text "It's super-"
	line "effective!"
	prompt

NotVeryEffectiveText:
	text "It's not very"
	line "effective…"
	prompt

TookDownWithItText:
	text "<TARGET>"
	line "took down with it,"
	cont "<USER>!"
	prompt

RageBuildingText:
	text "<USER>'s"
	line "RAGE is building!"
	prompt

GotAnEncoreText:
	text "<TARGET>"
	line "got an ENCORE!"
	prompt

SharedPainText:
	text "The battlers"
	line "shared pain!"
	prompt

TookAimText:
	text "<USER>"
	line "took aim!"
	prompt

SketchedText:
	text "<USER>"
	line "SKETCHED"
	cont "@"
	text_ram wStringBuffer1
	text "!"
	prompt

DestinyBondEffectText:
	text "<USER>'s"
	line "trying to take its"
	cont "opponent with it!"
	prompt

SpiteEffectText:
	text "<TARGET>'s"
	line "@"
	text_ram wStringBuffer1
	text " was"
	cont "reduced by @"
	text_decimal wDeciramBuffer, 1, 1
	text "!"
	prompt

BellChimedText:
	text "A bell chimed!"
	line ""
	prompt

FellAsleepText:
	text "<TARGET>"
	line "fell asleep!"
	prompt

AlreadyAsleepText:
	text "<TARGET>'s"
	line "already asleep!"
	prompt

WasPoisonedText:
	text "<TARGET>"
	line "was poisoned!"
	prompt

BadlyPoisonedText:
	text "<TARGET>'s"
	line "badly poisoned!"
	prompt

AlreadyPoisonedText:
	text "<TARGET>'s"
	line "already poisoned!"
	prompt

AbsorbedToxicSpikesText:
	text "The poison spikes"
	line "disappeared around"
	cont "<USER>!"
	prompt

SuckedHealthText:
	text "Sucked health from"
	line "<TARGET>!"
	prompt

DreamEatenText:
	text "<TARGET>'s"
	line "dream was eaten!"
	prompt

WasBurnedText:
	text "<TARGET>"
	line "was burned!"
	prompt

DefrostedOpponentText:
	text "<TARGET>"
	line "was defrosted!"
	prompt

WasFrozenText:
	text "<TARGET>"
	line "was frozen solid!"
	prompt

WontRiseAnymoreText:
	text "<USER>'s"
	line "@"
	text_ram wStringBuffer2
	text " won't"
	cont "rise anymore!"
	prompt

WontDropAnymoreText:
	text "<TARGET>'s"
	line "@"
	text_ram wStringBuffer2
	text " won't"
	cont "drop anymore!"
	prompt

FledFromBattleText::
	text "<USER>"
	line "fled from battle!"
	prompt

FledInFearText:
	text "<TARGET>"
	line "fled in fear!"
	prompt

BlownAwayText:
	text "<TARGET>"
	line "was blown away!"
	prompt

PlayerHitTimesText:
	text "Hit @"
	text_decimal wPlayerDamageTaken, 1, 1
	text " times!"
	prompt

EnemyHitTimesText:
	text "Hit @"
	text_decimal wEnemyDamageTaken, 1, 1
	text " times!"
	prompt

MistText:
	text "<USER>'s"
	line "shrouded in MIST!"
	prompt

ProtectedByMistText:
	text "<TARGET>'s"
	line "protected by MIST."
	prompt

GettingPumpedText:
	text_pause
	text "<USER>'s"
	line "getting pumped!"
	prompt

RecoilText:
	text "<USER>'s"
	line "hit with recoil!"
	prompt

MadeSubstituteText:
	text "<USER>"
	line "made a SUBSTITUTE!"
	prompt

HasSubstituteText:
	text "<USER>"
	line "has a SUBSTITUTE!"
	prompt

TooWeakSubText:
	text "Too weak to make"
	line "a SUBSTITUTE!"
	prompt

SubTookDamageText:
	text "The SUBSTITUTE"
	line "took damage for"
	cont "<TARGET>!"
	prompt

SubFadedText:
	text "<TARGET>'s"
	line "SUBSTITUTE faded!"
	prompt

LearnedMoveText:
	text "<USER>"
	line "learned"
	cont "@"
	text_ram wStringBuffer1
	text "!"
	prompt

WasSeededText:
	text "<TARGET>"
	line "was seeded!"
	prompt

EvadedText:
	text "<TARGET>"
	line "evaded the attack!"
	prompt

WasDisabledText:
	text "<TARGET>'s"
	line "@"
	text_ram wStringBuffer1
	text " was"
	cont "DISABLED!"
	prompt

CoinsScatteredText:
	text "Coins scattered"
	line "everywhere!"
	prompt

TransformedTypeText:
	text "<USER>"
	line "transformed into"
	cont "the @"
	text_ram wStringBuffer1
	text "-type!"
	prompt

EliminatedStatsText:
	text "All stat changes"
	line "were eliminated!"
	prompt

TransformedText:
	text "<USER>"
	line "TRANSFORMED into"
	cont "@"
	text_ram wStringBuffer1
	text "!"
	prompt

LightScreenEffectText:
	text "<USER>'s"
	line "SPCL.DEF rose!"
	prompt

ReflectEffectText:
	text "<USER>'s"
	line "DEFENSE rose!"
	prompt

NothingHappenedText:
	text "But nothing"
	line "happened."
	prompt

ButItFailedText::
	text "But it failed!"
	prompt

ItFailedText:
	text "It failed!"
	prompt

DidntAffect1Text:
	text "It didn't affect"
	line "<TARGET>!"
	prompt

DidntAffect2Text:
	text "It didn't affect"
	line "<TARGET>!"
	prompt

HPIsFullText:
	text "<USER>'s"
	line "HP is full!"
	prompt

DraggedOutText:
	text "<USER>"
	line "was dragged out!"
	prompt

ParalyzedText:
	text "<TARGET>'s"
	line "paralyzed! Maybe"
	cont "it can't attack!"
	prompt

FullyParalyzedText:
	text "<USER>'s"
	line "fully paralyzed!"
	prompt

AlreadyParalyzedText:
	text "<TARGET>'s"
	line "already paralyzed!"
	prompt

ProtectedByText:
	text "<TARGET>'s"
	line "protected by"
	cont "@"
	text_ram wStringBuffer1
	text "!"
	prompt

MirrorMoveFailedText:
	text "The MIRROR MOVE"
	next "failed!"
	prompt

StoleText:
	text "<USER>"
	line "stole @"
	text_ram wStringBuffer1
	text_start
	cont "from its foe!"
	prompt

CantEscapeNowText:
	text "<TARGET>"
	line "can't escape now!"
	prompt

StartedNightmareText:
	text "<TARGET>"
	line "started to have a"
	cont "NIGHTMARE!"
	prompt

WasDefrostedText:
	text "<USER>"
	line "was defrosted!"
	prompt

PutACurseText:
	text "<USER>"
	line "cut its own HP and"

	para "put a CURSE on"
	line "<TARGET>!"
	prompt

ProtectedItselfText:
	text "<USER>"
	line "PROTECTED itself!"
	prompt

ProtectingItselfText:
	text "<TARGET>'s"
	line "PROTECTING itself!"
	done

SpikesText:
	text "SPIKES scattered"
	line "all around"
	cont "<TARGET>!"
	prompt

StealthRockText:
	text "Pointed stones are"
	line "floating around"
	cont "<TARGET>!"
	prompt

ToxicSpikesText:
	text "Poison spikes were"
	line "scattered around"
	cont "<TARGET>!"
	prompt

IdentifiedText:
	text "<USER>"
	line "identified"
	cont "<TARGET>!"
	prompt

StartPerishText:
	text "Both #MON will"
	line "faint in 3 turns!"
	prompt

SandstormBrewedText:
	text "A SANDSTORM"
	line "brewed!"
	prompt

BracedItselfText:
	text "<USER>"
	line "braced itself!"
	prompt

FellInLoveText:
	text "<TARGET>"
	line "fell in love!"
	prompt

CoveredByVeilText:
	text "<USER>'s"
	line "covered by a veil!"
	prompt

SafeguardProtectText:
	text "<TARGET>"
	line "is protected by"
	cont "SAFEGUARD!"
	prompt

MagnitudeText:
	text "Magnitude @"
	text_decimal wDeciramBuffer, 1, 1
	text "!"
	prompt

ReleasedByText:
	text "<USER>"
	line "was released by"
	cont "<TARGET>!"
	prompt

ShedLeechSeedText:
	text "<USER>"
	line "shed LEECH SEED!"
	prompt

ClearedHazardsText:
	text "<USER>"
	line "cleared away"
	cont "hazards!"
	prompt

DownpourText:
	text "A downpour"
	line "started!"
	prompt

SunGotBrightText:
	text "The sunlight got"
	line "bright!"
	prompt

StartedToHailText:
	text "It started to"
	line "hail!"
	prompt

BellyDrumText:
	text "<USER>"
	line "cut its HP and"
	cont "maximized ATTACK!"
	prompt

CopiedStatsText:
	text "<USER>"
	line "copied the stat"

	para "changes of"
	line "<TARGET>!"
	prompt

ForesawAttackText:
	text "<USER>"
	line "foresaw an attack!"
	prompt

BeatUpAttackText:
	text_ram wStringBuffer1
	text "'s"
	line "attack!"
	done

RefusedGiftText:
	text "<TARGET>"
	line "refused the gift!"
	prompt

IgnoredOrders2Text:
	text "<USER>"
	line "ignored orders!"
	prompt

BattleText_LinkErrorBattleCanceled:
	text "Link error…"

	para "The battle has"
	line "been canceled…"
	prompt

BattleText_0x8188e:
	text "There is no time"
	line "left today!"
	done

StatRoseText:
	text "<USER>'s"
	line "@"
	text_ram wStringBuffer2
	text " went up!"
	prompt

StatFellText:
	text "<USER>'s"
	line "@"
	text_ram wStringBuffer2
	text " fell!"
	prompt

StatRoseSharplyText:
	text "<USER>'s"
	line "@"
	text_ram wStringBuffer2
	text_pause
	text "<SCROLL>went way up!"
	prompt

StatHarshlyFellText:
	text "<USER>'s"
	line "@"
	text_ram wStringBuffer2
	text_pause
	text "<SCROLL>sharply fell!"
	prompt

BrokeScreensText:
	text "It shattered the"
	line "barrier!"
	prompt

LightScreenWoreOffText:
	text "<TARGET>'s"
	line "LIGHT SCREEN fell!"
	prompt

ReflectWoreOffText:
	text "<TARGET>'s"
	line "REFLECT faded!"
	prompt

RevertedFormText:
	text "<TARGET>"
	line "reverted to its"
	cont "original forme!"
	prompt

ChangedFormBattleText:
	text "<USER>"
	line "changed form!"
	prompt

NaturePowerText:
	text "NATURE POWER"
	line "turned into"
	cont "@"
	text_ram wStringBuffer1
	text "!"
	prompt

CamouflageText:
	text "<USER>"
	line "transformed into"
	cont "@"
	text_ram wStringBuffer1
	text " type!"
	prompt

TrickText:
	text "<USER>"
	line "switched items"
	cont "with its foe!"
	prompt

UserGotItemText:
	text "<USER>"
	line "got @"
	text_ram wStringBuffer1
	text "!"
	prompt

TargetGotItemText:
	text "<TARGET>"
	line "got @"
	text_ram wStringBuffer1
	text "!"
	prompt

FellForTauntText:
	text "<TARGET>"
	line "fell for the"
	cont "TAUNT!"
	prompt

BattleText_TauntWoreOff:
	text "<USER>'s"
	line "TAUNT wore off!"
	prompt

StatusHealText:
	text "<USER>'s"
	line "status returned"
	cont "to normal!"
	prompt

TormentText:
	text "<TARGET>"
	line "was subjected to"
	cont "TORMENT!"
	prompt

ImprisonText:
	text "<USER>"
	line "sealed the move(s)"
	cont "of its opponent!"
	prompt

WaterSportText:
	text "Electricity's power"
	line "was weakened!"
	prompt

MudSportText:
	text "Fire's power was"
	line "weakened!"
	prompt

IngrainText:
	text "<USER>"
	line "planted its roots!"
	prompt

AbsorbedNutrientsText:
	text "<TARGET>"
	line "absorbed nutrients"
	cont "with its roots!"
	prompt

AquaRingText:
	text "<USER>"
	line "surrounded itself"
	cont "with a water veil!"
	prompt

RestoredHPText:
	text "<TARGET>"
	line "restored HP from"
	cont "the veil of water!"
	prompt

CausedAnUproarText:
	text "<USER>"
	line "caused an uproar!"
	prompt

MakingAnUproarText:
	text "<USER>"
	line "is making an"
	cont "uproar!"
	prompt

UproarCalmedDownText:
	text "<TARGET>"
	line "calmed down."
	prompt

UproarWokeUpText:
	text "<USER>"
	line "woke up from the"
	cont "uproar!"
	prompt

StockpileText:
	text "<USER>"
	line "STOCKPILED @"
	text_decimal wStringBuffer1, 1, 1
	text "!"
	prompt

StockpileWoreOffText:
	text "STOCKPILE's effect"
	line "wore off."
	prompt

RecycleText:
	text "<USER>"
	line "found one"
	cont "@"
	text_ram wStringBuffer1
	text "!"
	prompt

KnockOffText:
	text "<TARGET>'s"
	line "@"
	text_ram wStringBuffer1
	text " was"
	cont "knocked off!"
	prompt

SlowStartActivateText:
	text "<USER>"
	line "can't get it going!"
	prompt

SlowStartFinishText:
	text "<USER>"
	line "finally got its"
	cont "act together!"
	prompt

SlowStartActivateText2:
	text "Wild @"
	text_ram wEnemyMonNick
	text_start
	line "can't get it going!"
	prompt

TailwindPeteredOutText:
	text "<USER>'s"
	line "TAILWIND petered"
	cont "out!"
	prompt

TailwindText:
	text "<USER>"
	line "blew a TAILWIND!"
	prompt

TightenFocusText:
	text "<USER>"
	line "is tightening its"
	cont "focus!"
	prompt

LostFocusText:
	text "<USER>"
	line "lost its focus and"
	cont "couldn't move!"
	prompt

SwitchedStatChangesText:
	text "<USER>"
	line "switched stat"
	cont "changes with the"
	cont "target!"
	prompt

GravityReturnedText:
	text "Gravity returned"
	line "to normal!"
	prompt

GravityText:
	text "Gravity"
	line "intensified!"
	prompt

MagnetRiseText:
	text "<USER>"
	line "levitated on"
	cont "electromagnetism!"
	prompt

MagnetRiseWoreOffText:
	text "<USER>'s"
	line "electromagnetism"
	cont "wore off!"
	prompt

CouldntStayAirborneText:
	text "<TARGET>"
	line "couldn't stay in"
	cont "the air because of"
	cont "GRAVITY!"
	prompt

UserTwistedDimensionText:
	text "<USER>"
	line "twisted the"
	cont "dimension!"
	prompt

UserRestoredDimensionText:
	text "<USER>"
	line "restored the"
	cont "twisted dimension!"
	prompt

TrickRoomEndedText:
	text "The twisted"
	line "dimension returned"
	cont "to normal!"
	prompt

HealBlockText:
	text "<TARGET>"
	line "was prevented from"
	cont "healing!"
	prompt

HealBlockWoreOffText:
	text "<TARGET>'s"
	line "HEAL BLOCK wore"
	cont "off!"
	prompt

AlreadyBurnedText:
	text "<TARGET>'s"
	line "already burned!"
	prompt

SandTombTrapText:
	text "<TARGET>"
	line "was trapped by"
	cont "SAND TOMB!"
	prompt

MagmaStormTrapText:
	text "<TARGET>"
	line "became trapped by"
	cont "swirling magma!"
	prompt

ChargeText:
	text "<USER>"
	line "is charging power!"
	prompt

WonderGuardMissText:
	text "<TARGET>"
	line "was protected by"
	cont "WONDER GUARD!"
	prompt

MadeDrowsyText:
	text "<USER>"
	line "made"
	cont "<TARGET>"
	cont "drowsy!"
	prompt

BearAGrudgeText:
	text "<USER>"
	line "wants the foe to"
	cont "bear a grudge!"
	prompt

LostPPDueToGrudgeText:
	text "<USER>'s"
	line "@"
	text_ram wStringBuffer1
	text " lost"
	cont "all its PP due to"
	cont "the grudge!"
	prompt

DoomDesireText:
	text "<USER>"
	line "chose DOOM DESIRE"
	cont "as its destiny!"
	prompt

TruantText:
	text "<USER>"
	line "is loafing around!"
	prompt
