	db 0 ; species ID placeholder

	db  76,  65,  45,  91,  92,  42
	;   hp  atk  def  spd  sat  sdf

	db NORMAL, FLYING ; type
	db 30 ; catch rate
	db 144 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/chatot/front.dimensions"
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_FLYING, EGG_FLYING ; egg groups
	db 70 ; happiness

	; tm/hm learnset
	tmhm TOXIC, HIDDEN_POWER, SUNNY_DAY, TAUNT, PROTECT, RAIN_DANCE, FRUSTRATION, RETURN, DOUBLE_TEAM, AERIAL_ACE, TORMENT, FACADE, SECRET_POWER, REST, ATTRACT, THIEF, STEEL_WING, ROOST, ENDURE, CAPTIVATE, SLEEP_TALK, NATURAL_GIFT, SWAGGER, PLUCK, U_TURN, SUBSTITUTE, FLY, DEFOG, AIR_CUTTER, HEAT_WAVE, MUD_SLAP, OMINOUS_WIND, SNORE, SWIFT, TWISTER, UPROAR 
	; end
