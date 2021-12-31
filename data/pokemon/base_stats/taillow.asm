	db 0 ; species ID placeholder

	db  40,  55,  30,  85,  30,  30
	;   hp  atk  def  spd  sat  sdf

	db NORMAL, FLYING ; type
	db 200 ; catch rate
	db 59 ; base exp
	db NO_ITEM, BERRY ; items
	db GENDER_F50 ; gender ratio
	db 15 ; step cycles to hatch
	INCBIN "gfx/pokemon/taillow/front.dimensions"
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_FLYING, EGG_FLYING ; egg groups
	db 70 ; happiness

	; tm/hm learnset
	tmhm TOXIC, HIDDEN_POWER, SUNNY_DAY, PROTECT, RAIN_DANCE, FRUSTRATION, RETURN, DOUBLE_TEAM, AERIAL_ACE, FACADE, SECRET_POWER, REST, ATTRACT, THIEF, STEEL_WING, ROOST, ENDURE, CAPTIVATE, SLEEP_TALK, NATURAL_GIFT, SWAGGER, PLUCK, U_TURN, SUBSTITUTE, FLY, DEFOG, AIR_CUTTER, ENDEAVOR, HEAT_WAVE, MUD_SLAP, OMINOUS_WIND, SNORE, SWIFT, TWISTER 
	; end
