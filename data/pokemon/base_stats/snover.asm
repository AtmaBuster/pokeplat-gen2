	db 0 ; species ID placeholder

	db  60,  62,  50,  40,  62,  60
	;   hp  atk  def  spd  sat  sdf

	db GRASS, ICE ; type
	db 120 ; catch rate
	db 67 ; base exp
	db NO_ITEM, NEVERMELTICE ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/snover/front.dimensions"
	db GROWTH_SLOW ; growth rate
	dn EGG_PLANT, EGG_MONSTER ; egg groups
	db 70 ; happiness

	; tm/hm learnset
	tmhm WATER_PULSE, TOXIC, HAIL, BULLET_SEED, HIDDEN_POWER, ICE_BEAM, BLIZZARD, LIGHT_SCREEN, PROTECT, RAIN_DANCE, GIGA_DRAIN, SAFEGUARD, FRUSTRATION, SOLARBEAM, IRON_TAIL, RETURN, SHADOW_BALL, DOUBLE_TEAM, FACADE, SECRET_POWER, REST, ATTRACT, ENERGY_BALL, ENDURE, FLASH, AVALANCHE, SWORDS_DANCE, CAPTIVATE, SLEEP_TALK, NATURAL_GIFT, GRASS_KNOT, SWAGGER, SUBSTITUTE, ICE_PUNCH, ICY_WIND, MUD_SLAP, SEED_BOMB, SNORE, SYNTHESIS 
	; end
