FormChangeMons:
	dw FormDataDeoxys
	dw FormDataDeoxysA
	dw FormDataDeoxysD
	dw FormDataDeoxysS
	dw FormDataRotom
	dw FormDataRotomFly
	dw FormDataRotomFre
	dw FormDataRotomGrs
	dw FormDataRotomIce
	dw FormDataRotomWtr
	dw FormDataShaymin
	dw FormDataShayminS

FormDataDeoxys:
	dw DEOXYS
	dw DEOXYS_A, DEOXYS_D, DEOXYS_S
	dw -1

FormDataDeoxysA:
	dw DEOXYS_A
	dw DEOXYS, DEOXYS_D, DEOXYS_S
	dw -1

FormDataDeoxysD:
	dw DEOXYS_D
	dw DEOXYS, DEOXYS_A, DEOXYS_S
	dw -1

FormDataDeoxysS:
	dw DEOXYS_S
	dw DEOXYS, DEOXYS_A, DEOXYS_D
	dw -1

FormDataRotom:
	dw ROTOM
	dw ROTOM_FLY, ROTOM_FRE, ROTOM_GRS, ROTOM_ICE, ROTOM_WTR
	dw -1

FormDataRotomFly:
	dw ROTOM_FLY
	dw ROTOM, ROTOM_FRE, ROTOM_GRS, ROTOM_ICE, ROTOM_WTR
	dw -1

FormDataRotomFre:
	dw ROTOM_FRE
	dw ROTOM, ROTOM_FLY, ROTOM_GRS, ROTOM_ICE, ROTOM_WTR
	dw -1

FormDataRotomGrs:
	dw ROTOM_GRS
	dw ROTOM, ROTOM_FLY, ROTOM_FRE, ROTOM_ICE, ROTOM_WTR
	dw -1

FormDataRotomIce:
	dw ROTOM_ICE
	dw ROTOM, ROTOM_FLY, ROTOM_FRE, ROTOM_GRS, ROTOM_WTR
	dw -1

FormDataRotomWtr:
	dw ROTOM_WTR
	dw ROTOM, ROTOM_FLY, ROTOM_FRE, ROTOM_GRS, ROTOM_ICE
	dw -1

FormDataShaymin:
	dw SHAYMIN
	dw SHAYMIN_S
	dw -1

FormDataShayminS:
	dw SHAYMIN_S
	dw SHAYMIN
	dw -1
