Music_OreburghGate:
	channel_count 3
	channel 1, Music_OreburghGate_Ch1
	channel 2, Music_OreburghGate_Ch2
	channel 3, Music_OreburghGate_Ch3

Music_OreburghGate_Ch1_sub_0:
	note G_, 1
	note A#, 1
	octave 3
	note E_, 1
	octave 2
	note A#, 1
	note G_, 1
	sound_ret
Music_OreburghGate_Ch1_sub_1:
	note G_, 1
	note A#, 1
	octave 3
	note C#, 1
	note F#, 1
	note C#, 1
	octave 2
	note A#, 1
	sound_ret
Music_OreburghGate_Ch1_sub_2:
	note G_, 1
	note B_, 1
	octave 3
	note D#, 1
	octave 2
	note B_, 1
	note G_, 1
	note E_, 1
	sound_ret
Music_OreburghGate_Ch1_sub_3:
	note A#, 1
	octave 3
	note C#, 1
	note E_, 1
	note C#, 1
	octave 2
	note A#, 1
	note F#, 1
	sound_ret
Music_OreburghGate_Ch1::
	tempo 278
	duty_cycle 3
	pitch_offset 1
	vibrato 17, 1, 5
	stereo_panning TRUE, FALSE
	note_type 12, 10, 2
.loop
	octave 2
	sound_call Music_OreburghGate_Ch1_sub_1
	sound_call Music_OreburghGate_Ch1_sub_1
	sound_call Music_OreburghGate_Ch1_sub_1
	sound_call Music_OreburghGate_Ch1_sub_1
	note F#, 1
	sound_call Music_OreburghGate_Ch1_sub_3
	sound_call Music_OreburghGate_Ch1_sub_3
	note A_, 1
	octave 3
	note C_, 1
	note E_, 1
	note C_, 1
	octave 2
	note A_, 1
	note F#, 1
	note A_, 1
	octave 3
	note C_, 1
	note E_, 1
	note C_, 1
	octave 2
	note A_, 1
	note E_, 1
	sound_call Music_OreburghGate_Ch1_sub_2
	sound_call Music_OreburghGate_Ch1_sub_2
	sound_call Music_OreburghGate_Ch1_sub_0
	note E_, 1
	sound_call Music_OreburghGate_Ch1_sub_0
	note D#, 1
	sound_call Music_OreburghGate_Ch1_sub_0
	note D#, 1
	sound_call Music_OreburghGate_Ch1_sub_0
	note D#, 1
	note G_, 1
	note A#, 1
	octave 3
	note C#, 1
	octave 2
	note A#, 1
	note G_, 1
	note E_, 1
	sound_call Music_OreburghGate_Ch1_sub_0
	sound_loop 0, .loop
Music_OreburghGate_Ch2::
	pitch_offset 1
	duty_cycle 0
	vibrato 18, 3, 6
	stereo_panning FALSE, TRUE
	note_type 12, 10, 7
.loop
	octave 3
	note G_, 1
	octave 4
	note C#, 1
	note F#, 1
	note G_, 1
	note A#, 1
	octave 5
	note C#, 1
	note F#, 1
	note G_, 1
	note A#, 1
	note G_, 1
	note F#, 1
	note C#, 1
	octave 4
	note A#, 1
	note G_, 1
	note F#, 1
	note G_, 1
	note A#, 1
	octave 5
	note C#, 1
	octave 3
	note G_, 1
	octave 4
	note C#, 1
	note F#, 1
	note G_, 1
	note A#, 1
	note F#, 1
	octave 3
	note F#, 1
	note A#, 1
	octave 4
	note E_, 1
	note F#, 1
	note A#, 1
	octave 5
	note C#, 1
	note E_, 1
	note F#, 1
	note A#, 1
	note F#, 1
	note E_, 1
	note C#, 1
	octave 4
	note F#, 1
	note E_, 1
	note C_, 1
	note F#, 1
	note A_, 1
	octave 5
	note C_, 1
	octave 3
	note F#, 1
	octave 4
	note C_, 1
	note E_, 1
	note F#, 1
	note A_, 1
	note F#, 1
	octave 3
	note E_, 1
	note B_, 1
	octave 4
	note D#, 1
	note E_, 1
	note G_, 1
	note B_, 1
	octave 5
	note D#, 1
	note E_, 1
	note G_, 1
	note E_, 1
	note D#, 1
	octave 4
	note B_, 1
	note G_, 1
	note E_, 1
	note D#, 1
	note E_, 1
	note G_, 1
	note A#, 1
	octave 3
	note E_, 1
	note A#, 1
	octave 4
	note D#, 1
	note E_, 1
	note G_, 1
	note E_, 1
	octave 3
	note D#, 1
	note A#, 1
	octave 4
	note C#, 1
	note E_, 1
	note G_, 1
	note A#, 1
	octave 5
	note C#, 1
	note E_, 1
	note G_, 1
	note E_, 1
	note C#, 1
	octave 4
	note A#, 1
	note G_, 1
	note D#, 1
	note C#, 1
	note D#, 1
	note G_, 1
	octave 5
	note C#, 1
	octave 3
	note E_, 1
	note A#, 1
	octave 4
	note E_, 1
	note G_, 1
	note A#, 1
	octave 5
	note E_, 1
	sound_loop 0, .loop
Music_OreburghGate_Ch3::
	note_type 12, 1, 8
.loop
	octave 3
	note F#, 10
	note G_, 1
	note A_, 1
	note F#, 6
	note E_, 6
	note F#, 10
	note G_, 1
	note A_, 1
	note F#, 10
	octave 2
	note A_, 2
	octave 3
	note D#, 10
	note E_, 1
	note F#, 1
	note D#, 6
	note C#, 6
	note D#, 6
	note C#, 4
	note D#, 1
	note E_, 1
	note D#, 6
	note D_, 4
	note E_, 2
	sound_loop 0, .loop