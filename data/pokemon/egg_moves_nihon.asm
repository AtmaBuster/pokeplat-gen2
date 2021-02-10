SECTION "Egg Moves 3", ROMX

EggMovePointers3::
	dw FlambearEggMoves
	dw NoEggMoves3
	dw NoEggMoves3
	dw CruizeEggMoves
	dw NoEggMoves3
	dw NoEggMoves3
	dw KotoraEggMoves
	dw NoEggMoves3
	dw BomshealEggMoves
	dw CorasunEggMoves
	dw NoEggMoves3
	dw NoEggMoves3
	dw BiteelEggMoves
	dw NoEggMoves3
	dw RinringEggMoves
	dw NoEggMoves3
	dw BlottleEggMoves
	dw NoEggMoves3
	dw KurstrawEggMoves
	dw NoEggMoves3
	dw WolfanEggMoves
	dw NoEggMoves3
	dw CheepEggMoves
	dw NoEggMoves3
	dw SnobitEggMoves
	dw NoEggMoves3
	dw NoEggMoves3
	dw NoEggMoves3
	dw ArskeedEggMoves
	dw NoEggMoves3
	dw PeticornEggMoves
	dw GupgoldEggMoves
	dw TritalesEggMoves
	dw GrimbyEggMoves
	dw ParamiteEggMoves
	dw NyanyaEggMoves

FlambearEggMoves:
	dw FURY_SWIPES
	dw QUICK_ATTACK
	dw REVERSAL
	dw THRASH
	dw FORESIGHT
	dw FAINT_ATTACK
	dw SUBMISSION
	dw -1 ; end
	
CruizeEggMoves:
	dw ICY_WIND
	dw BLIZZARD
	dw HYDRO_PUMP
	dw ANCIENTPOWER
	dw RAZOR_WIND
	dw ROCK_SLIDE
	dw -1 ; end
	
KotoraEggMoves:
	dw THUNDERBOLT
	dw TAKE_DOWN
	dw SCREECH
	dw -1 ; end

BomshealEggMoves:
	dw FLAMETHROWER
	dw FIRE_SPIN
	dw BUBBLEBEAM
	dw FIRE_BLAST
	dw SLAM
	dw THRASH
	dw -1 ; end

CorasunEggMoves:
	dw RAIN_DANCE
	dw REVERSAL
	dw SWAGGER
	dw -1 ; end

BiteelEggMoves:
	dw WATER_GUN
	dw -1 ; end

RinringEggMoves:
	db SPITE
	db CHARM
	db HYPNOSIS
	db AMNESIA
	db -1 ; end

BlottleEggMoves:
	db TOXIC
	db WRAP
	db PECK
	db ACID_ARMOR
	db AURORA_BEAM
	db -1 ; end
	
KurstrawEggMoves:
	db SCREECH
	db DESTINY_BOND
	db -1 ; end
	
WolfanEggMoves:
	db PURSUIT
	db OUTRAGE
	db MIST
	db DYNAMICPUNCH
	db -1 ; end
	
CheepEggMoves:
	db PECK
	db WATER_GUN
	db REVERSAL
	
SnobitEggMoves:
	db TACKLE
	
ArskeedEggMoves:
	db TACKLE
	
PeticornEggMoves:
	db FLAME_WHEEL
	db THRASH
	db DOUBLE_KICK
	db HYPNOSIS
	db CHARM
	db QUICK_ATTACK
	db -1 ; end
	
GupgoldEggMoves:
	db PSYBEAM
	db HAZE
	db HYDRO_PUMP
	db -1 ; end
	
TritalesEggMoves:
	db FAINT_ATTACK
	db HYPNOSIS
	db FLAIL
	db SPITE
	db DISABLE
	db -1 ; end
	
GrimbyEggMoves:
	db HAZE
	db MEAN_LOOK
	db LICK
	db -1 ; end
	
ParamiteEggMoves:
	db FALSE_SWIPE
	db SCREECH
	db COUNTER
	db PSYBEAM
	db FLAIL
	db SWEET_SCENT

NyanyaEggMoves:
	db SPITE
	db CHARM
	db HYPNOSIS
	db AMNESIA
	db -1 ; end

NoEggMoves3:
	dw -1 ; end
