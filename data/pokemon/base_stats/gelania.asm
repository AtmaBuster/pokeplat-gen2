	db 0 ; species ID placeholder

	db  90, 85, 125,  75, 100, 60
	;   hp  atk  def  spd  sat  sdf

	db GRASS, GRASS ; type
	db 30 ; catch rate
	db 211 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/gelania/front.dimensions"
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_PLANT, EGG_PLANT ; egg groups
	db 70 ; happiness

	; tm/hm learnset
	tmhm 
	; end
