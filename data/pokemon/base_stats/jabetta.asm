	db 0 ; species ID placeholder

	db  75, 125,  60,  95,  80,  65
	;   hp  atk  def  spd  sat  sdf

	db WATER, FIGHTING ; type
	db 75 ; catch rate
	db 175 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/jabetta/front.dimensions"
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_WATER_1, EGG_HUMANSHAPE ; egg groups
	db 70 ; happiness

	; tm/hm learnset
	tmhm 
	; end
