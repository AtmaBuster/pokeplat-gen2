	db 0 ; species ID placeholder

	db  64,  51,  23,  28,  51,  23
	;   hp  atk  def  spd  sat  sdf

	db NORMAL, NORMAL ; type
	db 190 ; catch rate
	db 68 ; base exp
	db NO_ITEM, MINT_BERRY ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/whismur/front.dimensions"
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_MONSTER, EGG_GROUND ; egg groups
	db 70 ; happiness

	; tm/hm learnset
	tmhm WATER_PULSE, ROAR, TOXIC, HIDDEN_POWER, SUNNY_DAY, ICE_BEAM, BLIZZARD, PROTECT, RAIN_DANCE, FRUSTRATION, SOLARBEAM, RETURN, SHADOW_BALL, DOUBLE_TEAM, SHOCK_WAVE, FLAMETHROWER, FIRE_BLAST, FACADE, SECRET_POWER, REST, ATTRACT, FLING, ENDURE, CAPTIVATE, SLEEP_TALK, NATURAL_GIFT, SWAGGER, SUBSTITUTE, FIRE_PUNCH, ICE_PUNCH, ICY_WIND, MUD_SLAP, ROLLOUT, SNORE, THUNDERPUNCH, UPROAR, ZEN_HEADBUTT 
	; end
