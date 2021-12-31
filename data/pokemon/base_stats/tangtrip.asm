	db 0 ; species ID placeholder

	db  40,  40,  70,  40,  70,  45
	;   hp  atk  def  spd  sat  sdf

	db GRASS, GRASS ; type
	db 140 ; catch rate
	db 85 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/tangtrip/front.dimensions"
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_NONE, EGG_NONE ; egg groups
	db 70 ; happiness

	; tm/hm learnset
	tmhm 
	; end
