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

NoEggMoves3:
	dw -1 ; end
