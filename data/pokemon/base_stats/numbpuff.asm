	db 0 ; species ID placeholder

	db  90, 112, 100,  75,  85,  65
	;   hp  atk  def  spd  sat  sdf

	db WATER, ELECTRIC ; type
	db 35 ; catch rate
	db 190 ; base exp
	db NO_ITEM, POISON_BARB ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/numbpuff/front.dimensions"
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_WATER_2, EGG_WATER_2 ; egg groups
	db 70 ; happiness

	; tm/hm learnset
	tmhm 
	; end
