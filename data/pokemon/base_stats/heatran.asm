	db 0 ; species ID placeholder

	db  91,  90, 106,  77, 130, 106
	;   hp  atk  def  spd  sat  sdf

	db FIRE, STEEL ; type
	db 3 ; catch rate
	db 255 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 10 ; step cycles to hatch
	INCBIN "gfx/pokemon/heatran/front.dimensions"
	db GROWTH_SLOW ; growth rate
	dn EGG_NONE, EGG_NONE ; egg groups
	db 70 ; happiness

	; tm/hm learnset
	tmhm ROAR, TOXIC, HIDDEN_POWER, SUNNY_DAY, TAUNT, HYPER_BEAM, PROTECT, FRUSTRATION, SOLARBEAM, EARTHQUAKE, RETURN, DIG, DOUBLE_TEAM, FLAMETHROWER, FIRE_BLAST, ROCK_TOMB, TORMENT, FACADE, SECRET_POWER, REST, ATTRACT, OVERHEAT, ENDURE, DRAGON_PULSE, WILL_O_WISP, EXPLOSION, PAYBACK, GIGA_IMPACT, STONE_EDGE, STEALTH_ROCK, CAPTIVATE, DARK_PULSE, ROCK_SLIDE, SLEEP_TALK, NATURAL_GIFT, SWAGGER, SUBSTITUTE, FLASH_CANNON 
	; end
