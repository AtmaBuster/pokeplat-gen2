Music_SinnohGymBattle:
	channel_count 3
	channel 1, Music_SinnohGymBattle_Ch1
	channel 2, Music_SinnohGymBattle_Ch2
	channel 3, Music_SinnohGymBattle_Ch3

Music_SinnohGymBattle_Ch1_sub_0:
	rest 8
	octave 2
	note G_, 4
	note G#, 3
	note G_, 3
	note F_, 3
	note G#, 11
	rest 8
	octave 4
	note C#, 4
	note C_, 3
	note C#, 3
	note C_, 2
	note E_, 12
	rest 4
	octave 3
	note C#, 3
	note C_, 3
	octave 2
	note A#, 2
	octave 3
	note F_, 3
	note D#, 3
	note C#, 2
	octave 2
	note A#, 3
	octave 3
	note C_, 3
	note C#, 2
	note E_, 12
	note C#, 4
	note C_, 16
	rest 16
	rest 16
	rest 16
	rest 16
	sound_ret
Music_SinnohGymBattle_Ch1_sub_1:
	rest 2
	note E_, 4
	rest 2
	note E_, 4
	rest 2
	note E_, 4
	rest 2
	volume_envelope 11, 4
	note G#, 4
	note F_, 4
	volume_envelope 11, 2
	note E_, 4
	rest 2
	note E_, 4
	rest 2
	note E_, 4
	rest 2
	note E_, 4
	rest 2
	volume_envelope 11, 4
	note C#, 4
	note F_, 4
	sound_ret
Music_SinnohGymBattle_Ch1_sub_2:
	note E_, 1
	octave 5
	note C#, 1
	note C_, 1
	note C#, 1
	octave 4
	note E_, 1
	octave 5
	note C#, 1
	note C_, 1
	note C#, 1
	sound_ret
Music_SinnohGymBattle_Ch1_sub_3:
	note E_, 6
	note G_, 6
	note F_, 2
	note G_, 2
	note G#, 6
	octave 4
	note C#, 4
	note C_, 2
	octave 3
	note A#, 2
	octave 4
	note C#, 2
	note C_, 6
	sound_ret
Music_SinnohGymBattle_Ch1_sub_4:
	octave 3
	note G_, 6
	note G_, 1
	octave 4
	note D_, 1
	note F_, 1
	rest 1
	note E_, 6
	octave 3
	note G_, 10
	sound_ret
Music_SinnohGymBattle_Ch1_sub_5:
	note G#, 1
	note F_, 1
	note C#, 1
	octave 3
	note A#, 1
	note F_, 1
	note G#, 1
	octave 4
	note C#, 1
	sound_ret
Music_SinnohGymBattle_Ch1::
	tempo 104
	volume 7, 7
	duty_cycle 3
	vibrato 18, 1, 5
	note_type 12, 9, 2
	octave 4
	sound_call Music_SinnohGymBattle_Ch1_sub_2
	octave 4
	sound_call Music_SinnohGymBattle_Ch1_sub_2
	octave 4
	sound_call Music_SinnohGymBattle_Ch1_sub_2
	octave 4
	sound_call Music_SinnohGymBattle_Ch1_sub_2
	volume_envelope 11, 2
	octave 3
	note E_, 4
	sound_call Music_SinnohGymBattle_Ch1_sub_1
	volume_envelope 11, 2
	octave 4
	note E_, 4
	sound_call Music_SinnohGymBattle_Ch1_sub_1
.loop
	volume_envelope 11, 7
	octave 3
	sound_call Music_SinnohGymBattle_Ch1_sub_3
	sound_call Music_SinnohGymBattle_Ch1_sub_4
	sound_call Music_SinnohGymBattle_Ch1_sub_3
	octave 3
	note E_, 16
	rest 6
	volume_envelope 6, 5
	note E_, 8
	volume_envelope 11, 7
	sound_call Music_SinnohGymBattle_Ch1_sub_0
	rest 16
	rest 16
	rest 16
	rest 16
	rest 16
	rest 16
	rest 16
	rest 16
	volume_envelope 11, 2
	note E_, 4
	sound_call Music_SinnohGymBattle_Ch1_sub_1
	volume_envelope 11, 2
	note E_, 4
	rest 2
	note E_, 4
	rest 2
	note E_, 4
	rest 2
	note E_, 4
	rest 2
	octave 4
	sound_call Music_SinnohGymBattle_Ch1_sub_5
	volume_envelope 11, 7
	octave 3
	note A#, 1
	note E_, 2
	note D_, 2
	note E_, 2
	note G_, 6
	note F_, 2
	note G_, 2
	note G#, 2
	note G_, 2
	note F_, 3
	note A#, 1
	octave 4
	note C#, 2
	note C_, 2
	octave 3
	note A#, 2
	octave 4
	note C#, 2
	note C_, 2
	rest 2
	note C_, 2
	sound_call Music_SinnohGymBattle_Ch1_sub_4
	note E_, 1
	note D_, 1
	note E_, 1
	rest 1
	note E_, 1
	rest 1
	note G_, 6
	note F_, 2
	note G_, 2
	note G#, 2
	note G_, 4
	note A#, 1
	octave 4
	note C_, 1
	note C#, 2
	note C_, 2
	octave 3
	note A#, 2
	octave 4
	note C#, 2
	note C_, 1
	octave 3
	note A#, 1
	octave 4
	note C_, 1
	rest 1
	note C_, 1
	rest 1
	note E_, 10
	note C_, 1
	octave 3
	note A#, 1
	octave 4
	note C_, 1
	rest 1
	note C_, 1
	rest 1
	note E_, 6
	octave 3
	volume_envelope 6, 5
	note G_, 8
	volume_envelope 11, 7
	sound_call Music_SinnohGymBattle_Ch1_sub_0
	volume_envelope 11, 2
	octave 4
	note C_, 4
	rest 2
	note C_, 4
	rest 16
	rest 6
	note C_, 4
	rest 2
	note C_, 4
	note C_, 4
	rest 16
	rest 10
	sound_call Music_SinnohGymBattle_Ch1_sub_5
	octave 3
	note A#, 1
	sound_loop 0, .loop
Music_SinnohGymBattle_Ch2_sub_0:
	note G_, 16
	rest 6
	note G_, 4
	note G#, 3
	note G_, 3
	note F_, 3
	note C#, 16
	rest 1
	note F_, 6
	note E_, 3
	note F_, 3
	note G_, 3
	note G_, 16
	rest 3
	note G_, 4
	note G#, 3
	note G_, 3
	note F_, 2
	note C#, 16
	note F_, 8
	note E_, 3
	note F_, 3
	note G_, 2
	note G_, 16
	sound_ret
Music_SinnohGymBattle_Ch2_sub_1:
	volume_envelope 11, 2
	note C_, 4
	rest 2
	note C_, 4
	rest 2
	note C_, 4
	rest 2
	note C_, 4
	rest 2
	volume_envelope 11, 4
	note F_, 4
	note C#, 4
	volume_envelope 11, 2
	note C_, 4
	rest 2
	note C_, 4
	rest 2
	note C_, 4
	rest 2
	note C_, 4
	rest 2
	sound_ret
Music_SinnohGymBattle_Ch2_sub_2:
	note C_, 2
	octave 4
	note C_, 2
	octave 3
	note C_, 2
	octave 4
	note C#, 6
	note C#, 2
	octave 3
	note A#, 2
	sound_ret
Music_SinnohGymBattle_Ch2_sub_3:
	note D_, 2
	octave 4
	note D_, 2
	octave 3
	note D_, 2
	octave 4
	note D#, 6
	note D#, 2
	note C_, 2
	sound_ret
Music_SinnohGymBattle_Ch2_sub_4:
	octave 3
	note G_, 6
	octave 4
	note C_, 6
	octave 3
	note A#, 2
	octave 4
	note C_, 2
	note C#, 6
	note F_, 4
	note D#, 2
	note C#, 2
	note F_, 2
	note E_, 6
	sound_ret
Music_SinnohGymBattle_Ch2_sub_5:
	octave 3
	note G_, 2
	note F_, 2
	note G_, 2
	note G#, 4
	note G_, 2
	note F_, 2
	note G#, 2
	note G_, 1
	note G_, 1
	note F_, 2
	note G_, 2
	note G#, 2
	note G_, 1
	note G_, 1
	note F_, 2
	note C#, 2
	note G#, 2
	note G_, 2
	note F_, 2
	note G_, 2
	note G#, 4
	note G_, 2
	note F_, 2
	note G#, 2
	note G_, 1
	note G_, 1
	note F_, 2
	note G_, 2
	note G#, 2
	note G#, 1
	octave 4
	note C_, 1
	octave 3
	note G#, 2
	note F_, 2
	note G#, 2
	sound_ret
Music_SinnohGymBattle_Ch2::
	duty_cycle 3
	vibrato 8, 3, 6
	note_type 12, 10, 5
	pitch_offset 0
	octave 2
	note A#, 8
	note B_, 8
	octave 3
	note C_, 8
	note C#, 8
	sound_call Music_SinnohGymBattle_Ch2_sub_1
	volume_envelope 11, 4
	octave 2
	note A#, 4
	octave 3
	note C#, 4
	octave 4
	sound_call Music_SinnohGymBattle_Ch2_sub_1
	volume_envelope 11, 4
	octave 3
	note A#, 4
	octave 4
	note C#, 4
.loop
	volume_envelope 11, 7
	sound_call Music_SinnohGymBattle_Ch2_sub_4
	note C_, 16
	note C_, 10
	sound_call Music_SinnohGymBattle_Ch2_sub_4
	sound_call Music_SinnohGymBattle_Ch2_sub_0
	rest 8
	volume_envelope 11, 4
	octave 3
	pitch_offset 1
	sound_call Music_SinnohGymBattle_Ch2_sub_2
	sound_call Music_SinnohGymBattle_Ch2_sub_2
	sound_call Music_SinnohGymBattle_Ch2_sub_2
	sound_call Music_SinnohGymBattle_Ch2_sub_2
	sound_call Music_SinnohGymBattle_Ch2_sub_3
	octave 3
	sound_call Music_SinnohGymBattle_Ch2_sub_3
	octave 3
	sound_call Music_SinnohGymBattle_Ch2_sub_3
	octave 3
	sound_call Music_SinnohGymBattle_Ch2_sub_3
	sound_call Music_SinnohGymBattle_Ch2_sub_5
	pitch_offset 0
	volume_envelope 11, 2
	octave 3
	sound_call Music_SinnohGymBattle_Ch2_sub_1
	volume_envelope 11, 4
	octave 2
	note A#, 4
	octave 3
	note C#, 4
	volume_envelope 11, 2
	note C_, 4
	rest 2
	note C_, 4
	rest 2
	note C_, 4
	rest 2
	note C_, 4
	rest 10
	volume_envelope 11, 7
	note G_, 2
	note F_, 2
	note G_, 2
	octave 4
	note C_, 6
	octave 3
	note A#, 2
	octave 4
	note C_, 2
	note C#, 2
	note C_, 2
	octave 3
	note A#, 2
	octave 4
	note C#, 1
	note D#, 1
	note F_, 2
	note D#, 2
	note C#, 2
	note F_, 2
	note E_, 2
	rest 2
	note E_, 2
	note C_, 16
	note C_, 10
	octave 3
	note G_, 1
	note F_, 1
	note G_, 1
	rest 1
	note G_, 1
	rest 1
	octave 4
	note C_, 6
	octave 3
	note A#, 2
	octave 4
	note C_, 2
	note C#, 2
	note C_, 4
	note C#, 1
	note D#, 1
	note F_, 2
	note D#, 2
	note C#, 2
	note F_, 2
	note E_, 1
	note D_, 1
	note E_, 1
	rest 1
	note E_, 1
	rest 1
	sound_call Music_SinnohGymBattle_Ch2_sub_0
	pitch_offset 1
	rest 8
	volume_envelope 11, 4
	sound_call Music_SinnohGymBattle_Ch2_sub_5
	pitch_offset 0
	volume_envelope 11, 2
	note E_, 4
	rest 2
	note E_, 4
	rest 16
	rest 6
	note E_, 4
	rest 2
	note E_, 4
	note E_, 4
	rest 16
	rest 2
	volume_envelope 11, -2
	octave 3
	note F_, 4
	note A#, 4
	octave 4
	note F_, 1
	rest 7
	sound_loop 0, .loop
Music_SinnohGymBattle_Ch3_sub_0:
	note G_, 2
	note C_, 2
	note G_, 2
	note C_, 2
	note G_, 2
	note C_, 2
	note G_, 2
	note C_, 2
	note G_, 2
	note C#, 2
	note G#, 2
	note C#, 2
	note G#, 2
	note C#, 2
	note G#, 2
	note C#, 2
	note G#, 2
	note C_, 2
	note G_, 2
	note C_, 2
	note G_, 2
	note C_, 2
	note G_, 2
	note C_, 2
	note G_, 2
	note C_, 2
	note G_, 2
	note C_, 2
	note G_, 2
	note C_, 2
	note G_, 2
	note C_, 2
	note G_, 2
	note C#, 2
	note G#, 2
	octave 4
	note C#, 2
	octave 3
	note G#, 2
	note C#, 2
	note G#, 2
	note C#, 2
	note G#, 2
	note C#, 2
	note G#, 2
	octave 4
	note C#, 2
	octave 3
	note G#, 2
	note C#, 2
	note G#, 2
	note F_, 2
	note G#, 2
	note C_, 2
	note G_, 2
	octave 4
	note C_, 2
	octave 3
	note G_, 2
	note C_, 2
	note G_, 2
	note C_, 2
	note G_, 2
	note C_, 2
	note G_, 2
	octave 4
	note C_, 2
	octave 3
	note G_, 2
	note C_, 2
	note G_, 2
	note E_, 2
	note G_, 2
	note C#, 2
	note G#, 2
	note C#, 2
	note G#, 2
	note C#, 2
	note G#, 2
	note C#, 2
	note G#, 2
	note C#, 2
	note G#, 2
	note C#, 2
	note G#, 2
	note C#, 2
	note G#, 2
	note C#, 2
	note G#, 2
	note C_, 2
	note G_, 2
	note C_, 2
	note G_, 2
	note C_, 2
	note G_, 2
	note C_, 2
	note G_, 2
	note C_, 2
	note G_, 2
	note C_, 2
	note G_, 2
	note C_, 2
	note G_, 2
	note C_, 2
	note G_, 2
	sound_ret
Music_SinnohGymBattle_Ch3_sub_1:
	note G_, 2
	note F_, 2
	note G_, 2
	note G#, 4
	note G_, 2
	note F_, 2
	note G#, 2
	note G_, 1
	note G_, 1
	note F_, 2
	note G_, 2
	note G#, 2
	note G_, 1
	note G_, 1
	note F_, 2
	note C#, 2
	note G#, 2
	note G_, 2
	note F_, 2
	note G_, 2
	note G#, 4
	note G_, 2
	note F_, 2
	note G#, 2
	note G_, 1
	note G_, 1
	note F_, 2
	note G_, 2
	note G#, 2
	note G#, 1
	octave 4
	note C_, 1
	octave 3
	note G#, 2
	note F_, 2
	note G#, 2
	sound_ret
Music_SinnohGymBattle_Ch3_sub_2:
	note G_, 2
	note F_, 2
	note G_, 2
	note G#, 4
	note G_, 2
	note F_, 2
	note G#, 2
	note G_, 2
	note F_, 2
	note G_, 2
	note G#, 4
	note G_, 2
	note F_, 2
	sound_ret
Music_SinnohGymBattle_Ch3_sub_3:
	note D_, 2
	octave 4
	note D_, 2
	octave 3
	note D_, 2
	octave 4
	note D#, 6
	note D#, 2
	note C_, 2
	octave 3
	sound_ret
Music_SinnohGymBattle_Ch3_sub_4:
	note C_, 2
	octave 4
	note C_, 2
	octave 3
	note C_, 2
	octave 4
	note C#, 6
	note C#, 2
	octave 3
	note A#, 2
	sound_ret
Music_SinnohGymBattle_Ch3_sub_5:
	note C_, 2
	note G_, 2
	note C_, 2
	note G_, 2
	note C_, 2
	note G_, 2
	note C_, 2
	note G_, 2
	note C#, 2
	note G#, 2
	note C#, 2
	note G#, 2
	note C#, 2
	note G#, 2
	note C#, 2
	note G#, 2
	note C_, 2
	note G_, 2
	sound_ret
Music_SinnohGymBattle_Ch3_sub_6:
	note G_, 2
	note C_, 2
	note G_, 2
	note C_, 2
	note G_, 2
	note C_, 2
	sound_ret
Music_SinnohGymBattle_Ch3::
	vibrato 0, 0, 0
	note_type 12, 1, -1
	octave 2
	note A#, 8
	note B_, 8
	octave 3
	note C_, 8
	note C#, 4
	octave 4
	note C_, 1
	octave 3
	note F_, 1
	note G_, 1
	note G#, 1
	sound_call Music_SinnohGymBattle_Ch3_sub_2
	note G#, 2
	sound_call Music_SinnohGymBattle_Ch3_sub_2
	note G#, 2
	sound_call Music_SinnohGymBattle_Ch3_sub_2
	note G_, 1
	note G#, 1
	sound_call Music_SinnohGymBattle_Ch3_sub_2
	note G#, 2
.loop
	sound_call Music_SinnohGymBattle_Ch3_sub_5
	note C_, 2
	sound_call Music_SinnohGymBattle_Ch3_sub_6
	sound_call Music_SinnohGymBattle_Ch3_sub_6
	sound_call Music_SinnohGymBattle_Ch3_sub_0
	sound_call Music_SinnohGymBattle_Ch3_sub_4
	sound_call Music_SinnohGymBattle_Ch3_sub_4
	sound_call Music_SinnohGymBattle_Ch3_sub_4
	sound_call Music_SinnohGymBattle_Ch3_sub_4
	sound_call Music_SinnohGymBattle_Ch3_sub_3
	sound_call Music_SinnohGymBattle_Ch3_sub_3
	sound_call Music_SinnohGymBattle_Ch3_sub_3
	sound_call Music_SinnohGymBattle_Ch3_sub_3
	sound_call Music_SinnohGymBattle_Ch3_sub_1
	sound_call Music_SinnohGymBattle_Ch3_sub_2
	note G_, 1
	note G#, 1
	sound_call Music_SinnohGymBattle_Ch3_sub_2
	note G#, 2
	sound_call Music_SinnohGymBattle_Ch3_sub_2
	note D#, 1
	note C#, 1
	sound_call Music_SinnohGymBattle_Ch3_sub_5
	octave 4
	note C_, 2
	octave 3
	sound_call Music_SinnohGymBattle_Ch3_sub_6
	note G_, 2
	octave 4
	note C_, 2
	octave 3
	note G_, 2
	note C_, 2
	note G_, 2
	note E_, 2
	sound_call Music_SinnohGymBattle_Ch3_sub_0
	sound_call Music_SinnohGymBattle_Ch3_sub_1
	sound_call Music_SinnohGymBattle_Ch3_sub_1
	note C#, 4
	note F_, 4
	octave 4
	note C#, 1
	rest 1
	octave 3
	note A#, 2
	note F#, 2
	note D#, 2
	sound_loop 0, .loop