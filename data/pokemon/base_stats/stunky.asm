	db 0 ; species ID placeholder

	db  63,  63,  47,  74,  41,  41
	;   hp  atk  def  spd  sat  sdf

	db POISON, DARK ; type
	db 225 ; catch rate
	db 66 ; base exp
	db NO_ITEM, PSNCUREBERRY ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/stunky/front.dimensions"
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_GROUND, EGG_GROUND ; egg groups
	db 70 ; happiness

	; tm/hm learnset
	tmhm ROAR, TOXIC, HIDDEN_POWER, SUNNY_DAY, TAUNT, PROTECT, RAIN_DANCE, FRUSTRATION, IRON_TAIL, RETURN, DIG, SHADOW_BALL, DOUBLE_TEAM, FLAMETHROWER, SLUDGE_BOMB, FIRE_BLAST, TORMENT, FACADE, SECRET_POWER, REST, ATTRACT, THIEF, SNATCH, ENDURE, EXPLOSION, SHADOW_CLAW, PAYBACK, CAPTIVATE, DARK_PULSE, SLEEP_TALK, NATURAL_GIFT, SWAGGER, SUBSTITUTE, CUT, DEFOG, ROCK_SMASH, FURY_CUTTER, MUD_SLAP, SNORE, SUCKER_PUNCH, SWIFT 
	; end
