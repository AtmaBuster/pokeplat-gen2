	db 0 ; species ID placeholder

	db  40,  30,  32,  65,  50,  52
	;   hp  atk  def  spd  sat  sdf

	db BUG, WATER ; type
	db 200 ; catch rate
	db 63 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 15 ; step cycles to hatch
	INCBIN "gfx/pokemon/surskit/front.dimensions"
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_WATER_1, EGG_BUG ; egg groups
	db 70 ; happiness

	; tm/hm learnset
	tmhm WATER_PULSE, TOXIC, HIDDEN_POWER, SUNNY_DAY, ICE_BEAM, BLIZZARD, PROTECT, RAIN_DANCE, GIGA_DRAIN, FRUSTRATION, SOLARBEAM, RETURN, SHADOW_BALL, DOUBLE_TEAM, FACADE, SECRET_POWER, REST, ATTRACT, THIEF, ENDURE, FLASH, PSYCH_UP, CAPTIVATE, SLEEP_TALK, NATURAL_GIFT, SWAGGER, SUBSTITUTE, ICY_WIND, MUD_SLAP, SIGNAL_BEAM, SNORE, SWIFT 
	; end
