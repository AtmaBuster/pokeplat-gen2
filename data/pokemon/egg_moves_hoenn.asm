SECTION "Egg Moves 4", ROMX

EggMovePointers4::
	dw TreeckoEggMoves
	dw NoEggMoves4
	dw NoEggMoves4
	dw TorchicEggMoves
	dw NoEggMoves4
	dw NoEggMoves4
	
TreeckoEggMoves:
	dw TACKLE
	dw -1 ; end
	
TorchicEggMoves:
	dw TACKLE
	dw -1 ; end
	
NoEggMoves4:
	dw -1 ; end
