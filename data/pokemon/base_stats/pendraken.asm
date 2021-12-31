	db 0 ; species ID placeholder

	db  85,  80,  95,  80,  80, 115
	;   hp  atk  def  spd  sat  sdf

	db WATER, WATER ; type
	db 60 ; catch rate
	db 205 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/pendraken/front.dimensions"
	db GROWTH_SLOW ; growth rate
	dn EGG_WATER_3, EGG_WATER_3 ; egg groups
	db 70 ; happiness

	; tm/hm learnset
	tmhm 
	; end
