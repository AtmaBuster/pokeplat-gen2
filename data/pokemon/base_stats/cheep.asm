	db 0 ; species ID placeholder

	db  50,  55,  35,  75,  75,  60
	;   hp  atk  def  spd  sat  sdf

	db WATER, FLYING ; type
	db 180 ; catch rate
	db 88 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/cheep/front.dimensions"
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_WATER_1, EGG_HUMANSHAPE ; egg groups
	db 70 ; happiness

	; tm/hm learnset
	tmhm 
	; end
