	db 0 ; species ID placeholder

	db  80,  80,  80,  80,  80,  80
	;   hp  atk  def  spd  sat  sdf

	db WATER, WATER ; type
	db 30 ; catch rate
	db 216 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_UNKNOWN ; gender ratio
	db 40 ; step cycles to hatch
	INCBIN "gfx/pokemon/phione/front.dimensions"
	db GROWTH_SLOW ; growth rate
	dn EGG_NONE, EGG_NONE ; egg groups
	db 70 ; happiness

	; tm/hm learnset
	tmhm WATER_PULSE, TOXIC, HAIL, HIDDEN_POWER, ICE_BEAM, BLIZZARD, PROTECT, RAIN_DANCE, SAFEGUARD, FRUSTRATION, RETURN, DOUBLE_TEAM, FACADE, SECRET_POWER, REST, BRINE, FLING, ENDURE, PSYCH_UP, SLEEP_TALK, NATURAL_GIFT, GRASS_KNOT, SWAGGER, U_TURN, SUBSTITUTE, SURF, WATERFALL, ANCIENTPOWER, BOUNCE, DIVE, HELPING_HAND, ICY_WIND, KNOCK_OFF, LAST_RESORT, MUD_SLAP, SIGNAL_BEAM, SNORE, SWIFT, UPROAR 
	; end
