	db 0 ; species ID placeholder

	db 103,  93,  67,  84,  71,  61
	;   hp  atk  def  spd  sat  sdf

	db POISON, DARK ; type
	db 60 ; catch rate
	db 168 ; base exp
	db NO_ITEM, PSNCUREBERRY ; items
	db GENDER_F50 ; gender ratio
	db 100 ; unknown 1
	db 20 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/skuntank/front.dimensions"
	db 0, 0, 0, 0 ; padding
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_GROUND, EGG_GROUND ; egg groups

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, ROAR, TOXIC, ROCK_SMASH, HIDDEN_POWER, SUNNY_DAY, SNORE, HYPER_BEAM, PROTECT, RAIN_DANCE, ENDURE, FRUSTRATION, IRON_TAIL, RETURN, DIG, SHADOW_BALL, MUD_SLAP, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, SLUDGE_BOMB, FIRE_BLAST, SWIFT, DETECT, REST, ATTRACT, THIEF, FURY_CUTTER, NIGHTMARE, CUT, STRENGTH, FLAMETHROWER
	; end
