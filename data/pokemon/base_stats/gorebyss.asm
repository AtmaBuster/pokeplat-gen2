	db 0 ; species ID placeholder

	db  55,  84, 105,  52, 114,  75
	;   hp  atk  def  spd  sat  sdf

	db WATER, WATER ; type
	db 60 ; catch rate
	db 178 ; base exp
	db NO_ITEM, DEEPSEASCALE ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/gorebyss/front.dimensions"
	db GROWTH_ERRATIC ; growth rate
	dn EGG_WATER_1, EGG_WATER_1 ; egg groups
	db 70 ; happiness

	; tm/hm learnset
	tmhm WATER_PULSE, TOXIC, HAIL, HIDDEN_POWER, ICE_BEAM, BLIZZARD, HYPER_BEAM, PROTECT, RAIN_DANCE, SAFEGUARD, FRUSTRATION, RETURN, PSYCHIC_M, SHADOW_BALL, DOUBLE_TEAM, FACADE, SECRET_POWER, REST, ATTRACT, BRINE, ENDURE, GIGA_IMPACT, PSYCH_UP, CAPTIVATE, SLEEP_TALK, NATURAL_GIFT, SWAGGER, SUBSTITUTE, SURF, WATERFALL, AQUA_TAIL, BOUNCE, DIVE, ICY_WIND, MUD_SLAP, SIGNAL_BEAM, SNORE, SWIFT 
	; end
