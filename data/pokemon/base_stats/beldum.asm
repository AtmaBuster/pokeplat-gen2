	db 0 ; species ID placeholder

	db  40,  55,  80,  30,  35,  60
	;   hp  atk  def  spd  sat  sdf

	db STEEL, PSYCHIC ; type
	db 3 ; catch rate
	db 103 ; base exp
	db NO_ITEM, METAL_COAT ; items
	db GENDER_UNKNOWN ; gender ratio
	db 40 ; step cycles to hatch
	INCBIN "gfx/pokemon/beldum/front.dimensions"
	db GROWTH_SLOW ; growth rate
	dn EGG_MINERAL, EGG_MINERAL ; egg groups
	db 70 ; happiness

	; tm/hm learnset
	tmhm IRON_DEFENSE, IRON_HEAD, ZEN_HEADBUTT 
	; end
