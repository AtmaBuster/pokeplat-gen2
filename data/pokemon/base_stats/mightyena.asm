	db 0 ; species ID placeholder

	db  70,  90,  70,  70,  60,  60
	;   hp  atk  def  spd  sat  sdf

	db DARK, DARK ; type
	db 255 ; catch rate
	db 128 ; base exp
	db NO_ITEM, PSNCUREBERRY ; items
	db GENDER_F50 ; gender ratio
	db 15 ; step cycles to hatch
	INCBIN "gfx/pokemon/mightyena/front.dimensions"
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_GROUND, EGG_GROUND ; egg groups
	db 70 ; happiness

	; tm/hm learnset
	tmhm ROAR, TOXIC, HIDDEN_POWER, SUNNY_DAY, TAUNT, HYPER_BEAM, PROTECT, RAIN_DANCE, FRUSTRATION, IRON_TAIL, RETURN, DIG, SHADOW_BALL, DOUBLE_TEAM, TORMENT, FACADE, SECRET_POWER, REST, ATTRACT, THIEF, SNATCH, ENDURE, EMBARGO, PAYBACK, GIGA_IMPACT, CAPTIVATE, DARK_PULSE, SLEEP_TALK, NATURAL_GIFT, SWAGGER, SUBSTITUTE, STRENGTH, ROCK_SMASH, MUD_SLAP, SNORE, SPITE, SUCKER_PUNCH, UPROAR 
	; end
