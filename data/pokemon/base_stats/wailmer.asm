	db 0 ; species ID placeholder

	db 130,  70,  35,  60,  70,  35
	;   hp  atk  def  spd  sat  sdf

	db WATER, WATER ; type
	db 125 ; catch rate
	db 137 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 40 ; step cycles to hatch
	INCBIN "gfx/pokemon/wailmer/front.dimensions"
	db GROWTH_FLUCTUATING ; growth rate
	dn EGG_GROUND, EGG_WATER_2 ; egg groups
	db 70 ; happiness
	
	; tm/hm learnset
	tmhm WATER_PULSE, ROAR, TOXIC, HAIL, HIDDEN_POWER, ICE_BEAM, BLIZZARD, PROTECT, RAIN_DANCE, FRUSTRATION, EARTHQUAKE, RETURN, DOUBLE_TEAM, ROCK_TOMB, FACADE, SECRET_POWER, REST, ATTRACT, BRINE, ENDURE, AVALANCHE, CAPTIVATE, SLEEP_TALK, NATURAL_GIFT, SWAGGER, SUBSTITUTE, SURF, STRENGTH, ROCK_SMASH, WATERFALL, BOUNCE, DIVE, ICY_WIND, ROLLOUT, SNORE 
	; end
