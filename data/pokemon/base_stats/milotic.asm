	db 0 ; species ID placeholder

	db  95,  60,  79,  81, 100, 125
	;   hp  atk  def  spd  sat  sdf

	db WATER, WATER ; type
	db 60 ; catch rate
	db 213 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/milotic/front.dimensions"
	db GROWTH_ERRATIC ; growth rate
	dn EGG_WATER_1, EGG_DRAGON ; egg groups
	db 70 ; happiness

	; tm/hm learnset
	tmhm WATER_PULSE, TOXIC, HAIL, HIDDEN_POWER, ICE_BEAM, BLIZZARD, HYPER_BEAM, PROTECT, RAIN_DANCE, SAFEGUARD, FRUSTRATION, IRON_TAIL, RETURN, DOUBLE_TEAM, FACADE, SECRET_POWER, REST, ATTRACT, ENDURE, DRAGON_PULSE, GIGA_IMPACT, AVALANCHE, PSYCH_UP, CAPTIVATE, SLEEP_TALK, NATURAL_GIFT, SWAGGER, SUBSTITUTE, SURF, WATERFALL, AQUA_TAIL, DIVE, ICY_WIND, IRON_HEAD, MUD_SLAP, SNORE, SWIFT, TWISTER 
	; end
