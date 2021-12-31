	db 0 ; species ID placeholder

	db  80,  60,  62,  60,  80,  82
	;   hp  atk  def  spd  sat  sdf

	db BUG, FLYING ; type
	db 75 ; catch rate
	db 128 ; base exp
	db NO_ITEM, SILVERPOWDER ; items
	db GENDER_F50 ; gender ratio
	db 15 ; step cycles to hatch
	INCBIN "gfx/pokemon/masquerain/front.dimensions"
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_WATER_1, EGG_BUG ; egg groups
	db 70 ; happiness

	; tm/hm learnset
	tmhm WATER_PULSE, TOXIC, HIDDEN_POWER, SUNNY_DAY, ICE_BEAM, BLIZZARD, HYPER_BEAM, PROTECT, RAIN_DANCE, GIGA_DRAIN, FRUSTRATION, SOLARBEAM, RETURN, SHADOW_BALL, DOUBLE_TEAM, AERIAL_ACE, FACADE, SECRET_POWER, REST, ATTRACT, THIEF, ROOST, ENERGY_BALL, ENDURE, SILVER_WIND, GIGA_IMPACT, FLASH, PSYCH_UP, CAPTIVATE, SLEEP_TALK, NATURAL_GIFT, SWAGGER, U_TURN, SUBSTITUTE, DEFOG, AIR_CUTTER, ICY_WIND, MUD_SLAP, OMINOUS_WIND, SIGNAL_BEAM, SNORE, SWIFT, TWISTER 
	; end
