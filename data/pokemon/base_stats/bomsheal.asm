	db 0 ; species ID placeholder

	db 65,  102,  67,  77,  112,  77
	;   hp  atk  def  spd  sat  sdf

	db FIRE, WATER ; type
	db 75 ; catch rate
	db 175 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/bomsheal/front.dimensions"
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_GROUND, EGG_WATER_1 ; egg groups
	db 70 ; happiness

	; tm/hm learnset
	tmhm 
	; end
