	db 0 ; species ID placeholder

	db  43,  30,  55,  97,  40,  65
	;   hp  atk  def  spd  sat  sdf

	db WATER, WATER ; type
	db 225 ; catch rate
	db 110 ; base exp
	db STAR_PIECE, STAR_PIECE ; items (Should be Heart Scale, not sure if including)
	db GENDER_F75 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/luvdisc/front.dimensions"
	db GROWTH_FAST ; growth rate
	dn EGG_WATER_2, EGG_WATER_2 ; egg groups
	db 70 ; happiness

	; tm/hm learnset
	tmhm WATER_PULSE, TOXIC, HAIL, HIDDEN_POWER, ICE_BEAM, BLIZZARD, PROTECT, RAIN_DANCE, SAFEGUARD, FRUSTRATION, RETURN, DOUBLE_TEAM, FACADE, SECRET_POWER, REST, ATTRACT, BRINE, ENDURE, PSYCH_UP, CAPTIVATE, SLEEP_TALK, NATURAL_GIFT, SWAGGER, SUBSTITUTE, SURF, WATERFALL, BOUNCE, DIVE, ICY_WIND, SNORE, SWIFT 
	; end
