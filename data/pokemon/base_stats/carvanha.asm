	db 0 ; species ID placeholder

	db  45,  90,  20,  65,  65,  20
	;   hp  atk  def  spd  sat  sdf

	db WATER, DARK ; type
	db 225 ; catch rate
	db 88 ; base exp
	db NO_ITEM, DEEPSEATOOTH ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/carvanha/front.dimensions"
	db GROWTH_SLOW ; growth rate
	dn EGG_WATER_2, EGG_WATER_2 ; egg groups
	db 35 ; happiness

	; tm/hm learnset
	tmhm WATER_PULSE, TOXIC, HAIL, HIDDEN_POWER, TAUNT, ICE_BEAM, BLIZZARD, PROTECT, RAIN_DANCE, FRUSTRATION, RETURN, DOUBLE_TEAM, TORMENT, FACADE, SECRET_POWER, REST, ATTRACT, THIEF, BRINE, ENDURE, PAYBACK, CAPTIVATE, DARK_PULSE, SLEEP_TALK, NATURAL_GIFT, SWAGGER, SUBSTITUTE, SURF, WATERFALL, ANCIENTPOWER, BOUNCE, DIVE, FURY_CUTTER, ICY_WIND, MUD_SLAP, SNORE, SPITE, SWIFT, UPROAR, ZEN_HEADBUTT 
	; end
