_cur_rock_layer_line = 0
rock_layer_line: MACRO
if _cur_rock_layer_line == 0
_rock_line_0 = \1
elif _cur_rock_layer_line == 1
_rock_line_1 = \1
elif _cur_rock_layer_line == 2
_rock_line_2 = \1
elif _cur_rock_layer_line == 3
_rock_line_3 = \1
elif _cur_rock_layer_line == 4
_rock_line_4 = \1
elif _cur_rock_layer_line == 5
_rock_line_5 = \1
elif _cur_rock_layer_line == 6
_rock_line_6 = \1
elif _cur_rock_layer_line == 7
_rock_line_7 = \1
elif _cur_rock_layer_line == 8
_rock_line_8 = \1
else
_rock_line_9 = \1
endc
_cur_rock_layer_line = _cur_rock_layer_line + 1
if _cur_rock_layer_line == 10
_cur_rock_layer_line = 0
endc
ENDM

end_rock_layer: MACRO
	db (((_rock_line_0 >> 12) & 1) << 0) | (((_rock_line_0 >> 11) & 1) << 1) | (((_rock_line_0 >> 10) & 1) << 2) | (((_rock_line_0 >> 9) & 1) << 3) | (((_rock_line_0 >> 8) & 1) << 4) | (((_rock_line_0 >> 7) & 1) << 5) | (((_rock_line_0 >> 6) & 1) << 6) | (((_rock_line_0 >> 5) & 1) << 7)
	db (((_rock_line_0 >> 4) & 1) << 0) | (((_rock_line_0 >> 3) & 1) << 1) | (((_rock_line_0 >> 2) & 1) << 2) | (((_rock_line_0 >> 1) & 1) << 3) | (((_rock_line_0 >> 0) & 1) << 4) | (((_rock_line_1 >> 12) & 1) << 5) | (((_rock_line_1 >> 11) & 1) << 6) | (((_rock_line_1 >> 10) & 1) << 7)
	db (((_rock_line_1 >> 9) & 1) << 0) | (((_rock_line_1 >> 8) & 1) << 1) | (((_rock_line_1 >> 7) & 1) << 2) | (((_rock_line_1 >> 6) & 1) << 3) | (((_rock_line_1 >> 5) & 1) << 4) | (((_rock_line_1 >> 4) & 1) << 5) | (((_rock_line_1 >> 3) & 1) << 6) | (((_rock_line_1 >> 2) & 1) << 7)
	db (((_rock_line_1 >> 1) & 1) << 0) | (((_rock_line_1 >> 0) & 1) << 1) | (((_rock_line_2 >> 12) & 1) << 2) | (((_rock_line_2 >> 11) & 1) << 3) | (((_rock_line_2 >> 10) & 1) << 4) | (((_rock_line_2 >> 9) & 1) << 5) | (((_rock_line_2 >> 8) & 1) << 6) | (((_rock_line_2 >> 7) & 1) << 7)
	db (((_rock_line_2 >> 6) & 1) << 0) | (((_rock_line_2 >> 5) & 1) << 1) | (((_rock_line_2 >> 4) & 1) << 2) | (((_rock_line_2 >> 3) & 1) << 3) | (((_rock_line_2 >> 2) & 1) << 4) | (((_rock_line_2 >> 1) & 1) << 5) | (((_rock_line_2 >> 0) & 1) << 6) | (((_rock_line_3 >> 12) & 1) << 7)
	db (((_rock_line_3 >> 11) & 1) << 0) | (((_rock_line_3 >> 10) & 1) << 1) | (((_rock_line_3 >> 9) & 1) << 2) | (((_rock_line_3 >> 8) & 1) << 3) | (((_rock_line_3 >> 7) & 1) << 4) | (((_rock_line_3 >> 6) & 1) << 5) | (((_rock_line_3 >> 5) & 1) << 6) | (((_rock_line_3 >> 4) & 1) << 7)
	db (((_rock_line_3 >> 3) & 1) << 0) | (((_rock_line_3 >> 2) & 1) << 1) | (((_rock_line_3 >> 1) & 1) << 2) | (((_rock_line_3 >> 0) & 1) << 3) | (((_rock_line_4 >> 12) & 1) << 4) | (((_rock_line_4 >> 11) & 1) << 5) | (((_rock_line_4 >> 10) & 1) << 6) | (((_rock_line_4 >> 9) & 1) << 7)
	db (((_rock_line_4 >> 8) & 1) << 0) | (((_rock_line_4 >> 7) & 1) << 1) | (((_rock_line_4 >> 6) & 1) << 2) | (((_rock_line_4 >> 5) & 1) << 3) | (((_rock_line_4 >> 4) & 1) << 4) | (((_rock_line_4 >> 3) & 1) << 5) | (((_rock_line_4 >> 2) & 1) << 6) | (((_rock_line_4 >> 1) & 1) << 7)
	db (((_rock_line_4 >> 0) & 1) << 0) | (((_rock_line_5 >> 12) & 1) << 1) | (((_rock_line_5 >> 11) & 1) << 2) | (((_rock_line_5 >> 10) & 1) << 3) | (((_rock_line_5 >> 9) & 1) << 4) | (((_rock_line_5 >> 8) & 1) << 5) | (((_rock_line_5 >> 7) & 1) << 6) | (((_rock_line_5 >> 6) & 1) << 7)
	db (((_rock_line_5 >> 5) & 1) << 0) | (((_rock_line_5 >> 4) & 1) << 1) | (((_rock_line_5 >> 3) & 1) << 2) | (((_rock_line_5 >> 2) & 1) << 3) | (((_rock_line_5 >> 1) & 1) << 4) | (((_rock_line_5 >> 0) & 1) << 5) | (((_rock_line_6 >> 12) & 1) << 6) | (((_rock_line_6 >> 11) & 1) << 7)
	db (((_rock_line_6 >> 10) & 1) << 0) | (((_rock_line_6 >> 9) & 1) << 1) | (((_rock_line_6 >> 8) & 1) << 2) | (((_rock_line_6 >> 7) & 1) << 3) | (((_rock_line_6 >> 6) & 1) << 4) | (((_rock_line_6 >> 5) & 1) << 5) | (((_rock_line_6 >> 4) & 1) << 6) | (((_rock_line_6 >> 3) & 1) << 7)
	db (((_rock_line_6 >> 2) & 1) << 0) | (((_rock_line_6 >> 1) & 1) << 1) | (((_rock_line_6 >> 0) & 1) << 2) | (((_rock_line_7 >> 12) & 1) << 3) | (((_rock_line_7 >> 11) & 1) << 4) | (((_rock_line_7 >> 10) & 1) << 5) | (((_rock_line_7 >> 9) & 1) << 6) | (((_rock_line_7 >> 8) & 1) << 7)
	db (((_rock_line_7 >> 7) & 1) << 0) | (((_rock_line_7 >> 6) & 1) << 1) | (((_rock_line_7 >> 5) & 1) << 2) | (((_rock_line_7 >> 4) & 1) << 3) | (((_rock_line_7 >> 3) & 1) << 4) | (((_rock_line_7 >> 2) & 1) << 5) | (((_rock_line_7 >> 1) & 1) << 6) | (((_rock_line_7 >> 0) & 1) << 7)
	db (((_rock_line_8 >> 12) & 1) << 0) | (((_rock_line_8 >> 11) & 1) << 1) | (((_rock_line_8 >> 10) & 1) << 2) | (((_rock_line_8 >> 9) & 1) << 3) | (((_rock_line_8 >> 8) & 1) << 4) | (((_rock_line_8 >> 7) & 1) << 5) | (((_rock_line_8 >> 6) & 1) << 6) | (((_rock_line_8 >> 5) & 1) << 7)
	db (((_rock_line_8 >> 4) & 1) << 0) | (((_rock_line_8 >> 3) & 1) << 1) | (((_rock_line_8 >> 2) & 1) << 2) | (((_rock_line_8 >> 1) & 1) << 3) | (((_rock_line_8 >> 0) & 1) << 4) | (((_rock_line_9 >> 12) & 1) << 5) | (((_rock_line_9 >> 11) & 1) << 6) | (((_rock_line_9 >> 10) & 1) << 7)
	db (((_rock_line_9 >> 9) & 1) << 0) | (((_rock_line_9 >> 8) & 1) << 1) | (((_rock_line_9 >> 7) & 1) << 2) | (((_rock_line_9 >> 6) & 1) << 3) | (((_rock_line_9 >> 5) & 1) << 4) | (((_rock_line_9 >> 4) & 1) << 5) | (((_rock_line_9 >> 3) & 1) << 6) | (((_rock_line_9 >> 2) & 1) << 7)
	db (((_rock_line_9 >> 1) & 1) << 0) | (((_rock_line_9 >> 0) & 1) << 1)
ENDM

	rock_layer_line %1111100000000
	rock_layer_line %1111110000000
	rock_layer_line %1111111000000
	rock_layer_line %1111111000000
	rock_layer_line %1111111000000
	rock_layer_line %1111110000000
	rock_layer_line %0111100000110
	rock_layer_line %0000000001110
	rock_layer_line %0000000001111
	rock_layer_line %0000000000111
	end_rock_layer

	rock_layer_line %0000000000000
	rock_layer_line %0010000011100
	rock_layer_line %0011000011100
	rock_layer_line %0011110011110
	rock_layer_line %0111110011110
	rock_layer_line %0111110001110
	rock_layer_line %0011100001100
	rock_layer_line %0011000000000
	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	end_rock_layer

	rock_layer_line %1111111111111
	rock_layer_line %1111111111111
	rock_layer_line %1111111111111
	rock_layer_line %1111111111111
	rock_layer_line %1111111111111
	rock_layer_line %1111111111111
	rock_layer_line %1111111111111
	rock_layer_line %1111111111111
	rock_layer_line %1111111111111
	rock_layer_line %1111111111111
	end_rock_layer

	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	rock_layer_line %0000111111110
	rock_layer_line %0001111111111
	rock_layer_line %0011111111111
	rock_layer_line %0011111111111
	rock_layer_line %0011111111111
	rock_layer_line %0001111111100
	rock_layer_line %0000011111000
	rock_layer_line %0000000000000
	end_rock_layer

	rock_layer_line %0000000000000
	rock_layer_line %0001100000000
	rock_layer_line %0011100001100
	rock_layer_line %0111100011110
	rock_layer_line %0111000011110
	rock_layer_line %0000000011110
	rock_layer_line %0000010011100
	rock_layer_line %0011110001100
	rock_layer_line %0111100001100
	rock_layer_line %0110000000000
	end_rock_layer

	rock_layer_line %0000001100000
	rock_layer_line %0000011100000
	rock_layer_line %0000011110000
	rock_layer_line %0000111111000
	rock_layer_line %1111111111110
	rock_layer_line %1111111111111
	rock_layer_line %0111111111111
	rock_layer_line %0111111111000
	rock_layer_line %0000111100000
	rock_layer_line %0000011000000
	end_rock_layer

	rock_layer_line %0000000000000
	rock_layer_line %0000000111110
	rock_layer_line %0000011111111
	rock_layer_line %0001111111111
	rock_layer_line %0011111111000
	rock_layer_line %1111111110000
	rock_layer_line %1111110000000
	rock_layer_line %0111100000000
	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	end_rock_layer

	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	rock_layer_line %0000000000110
	rock_layer_line %0000000000110
	rock_layer_line %0000000001110
	rock_layer_line %0000111111110
	rock_layer_line %0000111111100
	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	end_rock_layer

	rock_layer_line %0000000000000
	rock_layer_line %0110000011000
	rock_layer_line %0100010000000
	rock_layer_line %0000110000100
	rock_layer_line %0000100001100
	rock_layer_line %0000000000000
	rock_layer_line %0110000000000
	rock_layer_line %0110011000010
	rock_layer_line %0000010000110
	rock_layer_line %0000000000000
	end_rock_layer

	rock_layer_line %0001111100000
	rock_layer_line %0111111111000
	rock_layer_line %0111000111100
	rock_layer_line %0110000001110
	rock_layer_line %1110000001110
	rock_layer_line %1110000000110
	rock_layer_line %1110000000110
	rock_layer_line %1111000011110
	rock_layer_line %0111111111100
	rock_layer_line %0011111100000
	end_rock_layer

	rock_layer_line %0000000000000
	rock_layer_line %0000111110000
	rock_layer_line %0001111111000
	rock_layer_line %0011111001100
	rock_layer_line %0011111111100
	rock_layer_line %0011111111100
	rock_layer_line %0011111111100
	rock_layer_line %0011110111100
	rock_layer_line %0011100011100
	rock_layer_line %0000000000000
	end_rock_layer

	rock_layer_line %0000000000000
	rock_layer_line %0000111110000
	rock_layer_line %0001111111000
	rock_layer_line %0011111111100
	rock_layer_line %0011111111100
	rock_layer_line %0011111111100
	rock_layer_line %0011111111100
	rock_layer_line %0001111111000
	rock_layer_line %0000111110000
	rock_layer_line %0000000000000
	end_rock_layer

	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	rock_layer_line %0000010001000
	rock_layer_line %0000111001000
	rock_layer_line %0001110001100
	rock_layer_line %0011100011100
	rock_layer_line %0011000011100
	rock_layer_line %0110000001110
	rock_layer_line %0000000000100
	rock_layer_line %0000000000000
	end_rock_layer

	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	rock_layer_line %1111111111000
	rock_layer_line %1111111111111
	rock_layer_line %1111111111111
	rock_layer_line %1111111111111
	rock_layer_line %0001111111111
	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	end_rock_layer

	rock_layer_line %0000011100000
	rock_layer_line %0000011100000
	rock_layer_line %0000011100000
	rock_layer_line %0000111100000
	rock_layer_line %0000111100000
	rock_layer_line %0000111100000
	rock_layer_line %0000111100000
	rock_layer_line %0000111100000
	rock_layer_line %0000111100000
	rock_layer_line %0000111000000
	end_rock_layer

	rock_layer_line %0000011110000
	rock_layer_line %0000010001000
	rock_layer_line %0000101101000
	rock_layer_line %0000100001000
	rock_layer_line %0000100001000
	rock_layer_line %0000100001000
	rock_layer_line %0011011101000
	rock_layer_line %0010010101000
	rock_layer_line %0011101001000
	rock_layer_line %0000000110000
	end_rock_layer

	rock_layer_line %0000000000000
	rock_layer_line %0011111110000
	rock_layer_line %0111111111000
	rock_layer_line %0111111111000
	rock_layer_line %0111111110100
	rock_layer_line %0111111110100
	rock_layer_line %0111111110100
	rock_layer_line %0011111111000
	rock_layer_line %0001111111000
	rock_layer_line %0000111110000
	end_rock_layer

	rock_layer_line %0000110011100
	rock_layer_line %0000111111000
	rock_layer_line %0000011010000
	rock_layer_line %0001111111000
	rock_layer_line %0001111111000
	rock_layer_line %0001111111000
	rock_layer_line %0000111110000
	rock_layer_line %0001111111000
	rock_layer_line %0011111111100
	rock_layer_line %0101011001100
	end_rock_layer

	rock_layer_line %0000001000000
	rock_layer_line %1110011100111
	rock_layer_line %0011011101100
	rock_layer_line %1111101011111
	rock_layer_line %0000111110000
	rock_layer_line %0000001000000
	rock_layer_line %0000101010000
	rock_layer_line %0000011100000
	rock_layer_line %0000001000000
	rock_layer_line %0000001000000
	end_rock_layer

	rock_layer_line %0000010000000
	rock_layer_line %0000111101110
	rock_layer_line %0010111111110
	rock_layer_line %0111111111110
	rock_layer_line %0111111011110
	rock_layer_line %0111111011110
	rock_layer_line %0011111111000
	rock_layer_line %0001111111000
	rock_layer_line %0000111100000
	rock_layer_line %0000011100000
	end_rock_layer

	rock_layer_line %0000000000000
	rock_layer_line %0001000001000
	rock_layer_line %0010100010100
	rock_layer_line %0100011110010
	rock_layer_line %0100000000010
	rock_layer_line %0100100001010
	rock_layer_line %0100001100010
	rock_layer_line %0010011110010
	rock_layer_line %0001100000100
	rock_layer_line %0000011111100
	end_rock_layer

	rock_layer_line %0010000000100
	rock_layer_line %0101000001010
	rock_layer_line %0100111110010
	rock_layer_line %0100000000010
	rock_layer_line %0100100010010
	rock_layer_line %0100100010010
	rock_layer_line %0100001000010
	rock_layer_line %0010010100100
	rock_layer_line %0010000000100
	rock_layer_line %0001111111000
	end_rock_layer

	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	rock_layer_line %0000001111000
	rock_layer_line %0000011111100
	rock_layer_line %1110110111100
	rock_layer_line %0110111111100
	rock_layer_line %0000011111000
	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	end_rock_layer

	rock_layer_line %0001100000111
	rock_layer_line %0010100011001
	rock_layer_line %0111111100001
	rock_layer_line %0100000000110
	rock_layer_line %1111011100100
	rock_layer_line %1110011001000
	rock_layer_line %1000000001000
	rock_layer_line %1000000001000
	rock_layer_line %0100000010000
	rock_layer_line %0011111100000
	end_rock_layer

	rock_layer_line %0011111111100
	rock_layer_line %0111111111110
	rock_layer_line %0100000000010
	rock_layer_line %1100000000011
	rock_layer_line %1100000000011
	rock_layer_line %1100011100011
	rock_layer_line %1111110111111
	rock_layer_line %1100000000011
	rock_layer_line %1100011100011
	rock_layer_line %0110000000110
	end_rock_layer

	rock_layer_line %1011111100000
	rock_layer_line %0011111110000
	rock_layer_line %0001111111000
	rock_layer_line %0001110011110
	rock_layer_line %0011100001110
	rock_layer_line %1111000011100
	rock_layer_line %1111100111100
	rock_layer_line %0011111111110
	rock_layer_line %0000001111111
	rock_layer_line %0000000111111
	end_rock_layer

	rock_layer_line %1111111011111
	rock_layer_line %1111110111111
	rock_layer_line %1111000001111
	rock_layer_line %1110000010111
	rock_layer_line %1100000001011
	rock_layer_line %1100000000011
	rock_layer_line %1100000000011
	rock_layer_line %1100000000011
	rock_layer_line %1110000000111
	rock_layer_line %1111001001111
	end_rock_layer

	rock_layer_line %1111111111111
	rock_layer_line %1111000001111
	rock_layer_line %1110011100111
	rock_layer_line %1100000000011
	rock_layer_line %1101000001011
	rock_layer_line %1101000001011
	rock_layer_line %1111000001111
	rock_layer_line %1111011101111
	rock_layer_line %1111011101111
	rock_layer_line %1110011100111
	end_rock_layer

	rock_layer_line %1111111111111
	rock_layer_line %1010101010101
	rock_layer_line %1000000000001
	rock_layer_line %1011001010101
	rock_layer_line %1010110111101
	rock_layer_line %1011010110101
	rock_layer_line %1010101010101
	rock_layer_line %1000000000001
	rock_layer_line %1010101010101
	rock_layer_line %1111111111111
	end_rock_layer

	rock_layer_line %1111111111111
	rock_layer_line %1110111110111
	rock_layer_line %1111011101111
	rock_layer_line %1110000000111
	rock_layer_line %1100100010011
	rock_layer_line %1000000000001
	rock_layer_line %1010000000101
	rock_layer_line %1010111110101
	rock_layer_line %1111001001111
	rock_layer_line %1111111111111
	end_rock_layer

	rock_layer_line %1110000111111
	rock_layer_line %1110110101111
	rock_layer_line %0000000001110
	rock_layer_line %1100001111110
	rock_layer_line %1000100111101
	rock_layer_line %1100000011001
	rock_layer_line %1100001111011
	rock_layer_line %1100010010001
	rock_layer_line %1100000011000
	rock_layer_line %1110011111001
	end_rock_layer

	rock_layer_line %0000000000000
	rock_layer_line %0001111111110
	rock_layer_line %0011111111110
	rock_layer_line %0110010010010
	rock_layer_line %0110010010010
	rock_layer_line %0111111111110
	rock_layer_line %0011111111110
	rock_layer_line %0001100001100
	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	end_rock_layer

	rock_layer_line %1100000000011
	rock_layer_line %1001000000001
	rock_layer_line %1000000000001
	rock_layer_line %1000000000001
	rock_layer_line %1000000000001
	rock_layer_line %1000000000001
	rock_layer_line %1000000111111
	rock_layer_line %1000000111111
	rock_layer_line %1000000000111
	rock_layer_line %1000001111111
	end_rock_layer

	rock_layer_line %0000001000000
	rock_layer_line %0000001000000
	rock_layer_line %0011101011100
	rock_layer_line %0100011100010
	rock_layer_line %1001000001001
	rock_layer_line %1011101010101
	rock_layer_line %1001000001001
	rock_layer_line %0100011100010
	rock_layer_line %0011100011100
	rock_layer_line %0000000000000
	end_rock_layer

	rock_layer_line %1111100001111
	rock_layer_line %1111000000111
	rock_layer_line %1110000000011
	rock_layer_line %1000000000001
	rock_layer_line %1000000000001
	rock_layer_line %1110000000001
	rock_layer_line %1111100000001
	rock_layer_line %1111110000001
	rock_layer_line %1110000000011
	rock_layer_line %1111000000111
	end_rock_layer

	rock_layer_line %1111111111111
	rock_layer_line %1111111111111
	rock_layer_line %1000100010001
	rock_layer_line %1110101010101
	rock_layer_line %1110101010101
	rock_layer_line %1101101010101
	rock_layer_line %1101101010101
	rock_layer_line %1101100010001
	rock_layer_line %1111111111111
	rock_layer_line %1111111111111
	end_rock_layer

	rock_layer_line %1111111111111
	rock_layer_line %1111111111111
	rock_layer_line %1011111111101
	rock_layer_line %0111010111010
	rock_layer_line %0110011010010
	rock_layer_line %0111110111110
	rock_layer_line %1011011101101
	rock_layer_line %1111100011111
	rock_layer_line %1111111111111
	rock_layer_line %1111111111111
	end_rock_layer

	rock_layer_line %1010110000001
	rock_layer_line %0100110101010
	rock_layer_line %0110110101010
	rock_layer_line %0110110101010
	rock_layer_line %0010010101010
	rock_layer_line %1100100000010
	rock_layer_line %1100110101010
	rock_layer_line %0100110101010
	rock_layer_line %0100110101010
	rock_layer_line %1010110000001
	end_rock_layer

	rock_layer_line %1111111111110
	rock_layer_line %1111110111110
	rock_layer_line %1111111111110
	rock_layer_line %1111110111111
	rock_layer_line %1111111110111
	rock_layer_line %1111110111111
	rock_layer_line %0111111111111
	rock_layer_line %0111110111111
	rock_layer_line %0111111111111
	rock_layer_line %0111110111111
	end_rock_layer

	rock_layer_line %0001111111000
	rock_layer_line %0010000000100
	rock_layer_line %0011111111100
	rock_layer_line %0010000000100
	rock_layer_line %0010101010100
	rock_layer_line %0011010101100
	rock_layer_line %0010000000100
	rock_layer_line %0010000010100
	rock_layer_line %0010111110100
	rock_layer_line %0001111111000
	end_rock_layer

	rock_layer_line %0000000000000
	rock_layer_line %0001000001110
	rock_layer_line %0001001001000
	rock_layer_line %0011111111000
	rock_layer_line %0011111111110
	rock_layer_line %0011111111110
	rock_layer_line %0011111111110
	rock_layer_line %0110100100100
	rock_layer_line %1101111111110
	rock_layer_line %0000100100100
	end_rock_layer

	rock_layer_line %1111111111111
	rock_layer_line %1111110111111
	rock_layer_line %1111100011111
	rock_layer_line %1111100011111
	rock_layer_line %1111100011111
	rock_layer_line %1111100011111
	rock_layer_line %1110001000111
	rock_layer_line %1110001000111
	rock_layer_line %1110001000111
	rock_layer_line %1111111111111
	end_rock_layer

	rock_layer_line %1111111111111
	rock_layer_line %1111000011111
	rock_layer_line %1110000001111
	rock_layer_line %1110111101111
	rock_layer_line %1110000000111
	rock_layer_line %1110000000111
	rock_layer_line %1110000001111
	rock_layer_line %1110011001111
	rock_layer_line %1110011001111
	rock_layer_line %1111111111111
	end_rock_layer

	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	end_rock_layer

	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	end_rock_layer

	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	end_rock_layer

	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	end_rock_layer

	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	end_rock_layer

	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	end_rock_layer

	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	end_rock_layer

	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	end_rock_layer

	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	end_rock_layer

	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	end_rock_layer

	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	end_rock_layer

	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	end_rock_layer

	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	end_rock_layer

	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	end_rock_layer

	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	end_rock_layer

	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	end_rock_layer

	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	end_rock_layer

	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	end_rock_layer

	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	end_rock_layer

	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	end_rock_layer

	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	rock_layer_line %0000000000000
	end_rock_layer


