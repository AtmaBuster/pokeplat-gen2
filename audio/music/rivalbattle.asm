Music_RivalBattle:
	channel_count 3
	channel 1, Music_RivalBattle_Ch1
	channel 2, Music_RivalBattle_Ch2
	channel 3, Music_RivalBattle_Ch3

Music_RivalBattle_Ch1_sub_0:
	volume_envelope 11, 2
	note G_, 4
	note G_, 4
	note G_, 4
	note E_, 4
	note G_, 4
	note G_, 4
	sound_ret
Music_RivalBattle_Ch1_sub_1:
	volume_envelope 11, 2
	note F#, 4
	note F#, 4
	note F#, 4
	note D#, 4
	note F#, 4
	note F#, 4
	note F#, 2
	volume_envelope 11, 4
	note B_, 6
	sound_ret
Music_RivalBattle_Ch1_sub_2:
	note G_, 16
	note G_, 1
	rest 1
	note E_, 6
	note G_, 2
	rest 2
	octave 4
	note C_, 2
	rest 2
	sound_ret
Music_RivalBattle_Ch1::
	tempo 105
	volume 7, 7
	duty_cycle 3
	pitch_offset 1
	vibrato 8, 1, 5
	note_type 12, 11, 2
	octave 4
	note G_, 1
	note A_, 1
	note G_, 1
	note A_, 1
	octave 3
	note A#, 1
	note A_, 1
	note G#, 1
	note G_, 1
	note G#, 1
	note G_, 1
	note F#, 1
	note F_, 1
	note F#, 1
	note F_, 1
	note E_, 1
	note D#, 1
	note E_, 1
	note D#, 1
	note D_, 1
	note C#, 1
	note D_, 1
	note C#, 1
	note C_, 1
	octave 2
	note B_, 1
	octave 3
	note C_, 1
	octave 2
	note B_, 1
	note A#, 1
	note A_, 1
	note A#, 1
	note A_, 1
	note G#, 1
	note G_, 1
	rest 2
	octave 3
	sound_call Music_RivalBattle_Ch1_sub_1
	sound_call Music_RivalBattle_Ch1_sub_1
	sound_call Music_RivalBattle_Ch1_sub_0
	note G_, 2
	octave 4
	volume_envelope 11, 4
	note C_, 6
	octave 3
	sound_call Music_RivalBattle_Ch1_sub_0
	note G_, 2
	octave 4
	volume_envelope 11, 4
	note C_, 4
	octave 3
.loop
	octave 3
	volume_envelope 11, 7
	sound_call Music_RivalBattle_Ch1_sub_2
	octave 3
	note A#, 16
	note G_, 8
	note A#, 8
	sound_call Music_RivalBattle_Ch1_sub_2
	note D#, 16
	note F_, 6
	note D#, 4
	octave 3
	note A#, 2
	note A#, 2
	octave 4
	note D_, 2
	note C_, 12
	note D_, 4
	note C_, 16
	octave 3
	note G_, 4
	note A#, 4
	octave 4
	note D_, 4
	note F_, 4
	octave 3
	note A#, 4
	octave 4
	note D_, 4
	note F_, 6
	note A#, 2
	note G_, 14
	note G_, 1
	note E_, 1
	note C_, 16
	note F_, 4
	note D_, 4
	octave 3
	note A#, 4
	note F_, 4
	octave 4
	note A#, 4
	note F_, 4
	note D_, 4
	octave 3
	note A#, 2
	note B_, 2
	octave 4
	note C_, 16
	note E_, 6
	note D_, 6
	note C_, 4
	note F_, 1
	rest 1
	note F_, 1
	rest 1
	note D_, 12
	note D_, 1
	rest 1
	note D_, 1
	rest 1
	octave 3
	note A#, 8
	note A#, 2
	note B_, 2
	octave 4
	note C_, 6
	octave 3
	note G_, 6
	note F_, 4
	note E_, 6
	note F_, 6
	note E_, 4
	note A#, 1
	rest 1
	note A#, 1
	rest 1
	octave 4
	note D_, 12
	note D_, 1
	rest 1
	note D_, 1
	rest 1
	note F_, 8
	note F_, 2
	note F#, 2
	note G_, 6
	note D_, 6
	note C_, 4
	note E_, 6
	note D_, 6
	note C_, 4
	octave 3
	note G_, 8
	octave 4
	note C_, 4
	octave 3
	note G_, 16
	octave 4
	note C_, 4
	octave 3
	note G#, 8
	octave 4
	note C#, 4
	octave 3
	note G#, 16
	octave 4
	note C#, 4
	octave 3
	note A_, 8
	octave 4
	note D_, 4
	octave 3
	note A_, 16
	octave 4
	note D_, 4
	octave 3
	note B_, 8
	octave 4
	note E_, 4
	octave 3
	note B_, 16
	octave 4
	note E_, 4
	octave 3
	volume_envelope 7, -7
	note F#, 16
	volume_envelope 11, 0
	note F#, 16
	volume_envelope 11, 0
	note F#, 16
	volume_envelope 11, 7
	note F#, 16
	rest 2
	volume_envelope 11, 2
	sound_call Music_RivalBattle_Ch1_sub_0
	note G_, 4
	octave 4
	note C_, 2
	sound_loop 0, .loop
Music_RivalBattle_Ch2_sub_0:
	note F#, 2
	note F_, 2
	note D#, 2
	note C#, 2
	octave 3
	note B_, 2
	octave 4
	note C#, 2
	note D#, 2
	sound_ret
Music_RivalBattle_Ch2_sub_1:
	octave 5
	note C#, 1
	octave 4
	note B_, 1
	octave 5
	note C#, 1
	octave 4
	note B_, 4
	sound_ret
Music_RivalBattle_Ch2_sub_2:
	volume_envelope 12, 2
	note C_, 4
	note C_, 4
	note C_, 2
	octave 3
	note G_, 2
	octave 4
	note C_, 4
	note C_, 4
	sound_ret
Music_RivalBattle_Ch2_sub_3:
	volume_envelope 12, 2
	octave 3
	note B_, 4
	note B_, 4
	note B_, 2
	note F#, 2
	note B_, 4
	note B_, 4
	sound_ret
Music_RivalBattle_Ch2_sub_4:
	note C_, 16
	note C_, 1
	rest 1
	octave 3
	note G_, 6
	octave 4
	note C_, 2
	rest 2
	note G_, 2
	rest 2
	sound_ret
Music_RivalBattle_Ch2::
	duty_cycle 3
	vibrato 8, 3, 6
	note_type 12, 12, 2
	octave 4
	note B_, 1
	sound_call Music_RivalBattle_Ch2_sub_1
	note B_, 1
	sound_call Music_RivalBattle_Ch2_sub_1
	note B_, 1
	sound_call Music_RivalBattle_Ch2_sub_1
	note B_, 1
	sound_call Music_RivalBattle_Ch2_sub_1
	rest 2
	sound_call Music_RivalBattle_Ch2_sub_3
	note B_, 4
	note B_, 2
	volume_envelope 12, 4
	octave 4
	note D#, 6
	sound_call Music_RivalBattle_Ch2_sub_3
	note B_, 2
	note F#, 2
	note B_, 2
	volume_envelope 12, 4
	octave 4
	note D#, 6
	sound_call Music_RivalBattle_Ch2_sub_2
	note C_, 4
	note C_, 2
	volume_envelope 12, 4
	note E_, 6
	sound_call Music_RivalBattle_Ch2_sub_2
	note C_, 2
	octave 3
	note G_, 2
	octave 4
	note C_, 2
	volume_envelope 12, 4
	note E_, 4
.loop
	volume_envelope 12, 7
	sound_call Music_RivalBattle_Ch2_sub_4
	note F_, 14
	note F_, 1
	note D#, 1
	note D_, 16
	sound_call Music_RivalBattle_Ch2_sub_4
	note G#, 16
	note A#, 6
	note G#, 4
	note G_, 2
	note F_, 2
	note G#, 2
	note G_, 12
	note F_, 4
	note E_, 16
	octave 3
	note A#, 4
	octave 4
	note D_, 4
	note F_, 4
	note A#, 4
	note D_, 4
	note F_, 4
	note A#, 6
	octave 5
	note D_, 2
	note C_, 14
	note C_, 1
	octave 4
	note G_, 1
	note E_, 16
	note A#, 4
	note F_, 4
	note D_, 4
	octave 3
	note A#, 4
	octave 5
	note D_, 4
	octave 4
	note A#, 4
	note F_, 4
	note D_, 2
	note D#, 2
	note E_, 14
	note E_, 1
	note G_, 1
	octave 5
	note C_, 16
	octave 4
	note A#, 1
	rest 1
	note A#, 1
	rest 1
	note F_, 12
	note F_, 1
	rest 1
	note F_, 1
	rest 1
	note D_, 8
	note D_, 2
	note D#, 2
	volume_envelope 12, -7
	note E_, 16
	volume_envelope 12, 7
	note E_, 16
	note D_, 1
	rest 1
	note D_, 1
	rest 1
	note F_, 12
	note F_, 1
	rest 1
	note F_, 1
	rest 1
	note A#, 8
	note A#, 2
	note B_, 2
	volume_envelope 12, -7
	octave 5
	note C_, 16
	volume_envelope 12, 7
	note C_, 16
	octave 4
	note C_, 8
	note E_, 4
	note C_, 16
	note E_, 4
	note C#, 8
	note F_, 4
	note C#, 16
	note F_, 4
	note D_, 8
	note F#, 4
	note D_, 16
	note F#, 4
	note E_, 8
	note G#, 4
	note E_, 16
	note G#, 4
	volume_envelope 12, 2
	sound_call Music_RivalBattle_Ch2_sub_0
	note F_, 2
	sound_call Music_RivalBattle_Ch2_sub_0
	note F_, 2
	sound_call Music_RivalBattle_Ch2_sub_0
	note F_, 2
	sound_call Music_RivalBattle_Ch2_sub_0
	note F#, 2
	note G_, 2
	note C_, 4
	note C_, 4
	note C_, 4
	octave 3
	note G_, 4
	octave 4
	note C_, 4
	note C_, 4
	note C_, 4
	note E_, 2
	sound_loop 0, .loop
Music_RivalBattle_Ch3_sub_0:
	note C_, 2
	octave 3
	note C_, 2
	octave 2
	note C_, 2
	octave 3
	note C_, 2
	octave 2
	note C_, 2
	octave 3
	note C_, 2
	octave 2
	note C_, 2
	octave 3
	note C_, 2
	sound_ret
Music_RivalBattle_Ch3_sub_1:
	octave 1
	note A#, 2
	octave 2
	note A#, 2
	octave 1
	note A#, 2
	octave 2
	note A#, 2
	octave 1
	note A#, 2
	octave 2
	note A#, 2
	octave 1
	note A#, 2
	octave 2
	sound_ret
Music_RivalBattle_Ch3_sub_2:
	note B_, 2
	octave 1
	note B_, 2
	octave 2
	note B_, 2
	octave 1
	note B_, 2
	octave 2
	note B_, 2
	octave 1
	note B_, 2
	octave 2
	sound_ret
Music_RivalBattle_Ch3_sub_3:
	octave 1
	note A#, 1
	rest 1
	note A#, 1
	rest 1
	octave 2
	note F_, 2
	octave 1
	note A#, 2
	octave 2
	note F_, 2
	octave 1
	note A#, 2
	octave 2
	note F_, 2
	octave 1
	note A#, 2
	note A#, 1
	rest 1
	note A#, 1
	rest 1
	octave 2
	note A#, 2
	octave 1
	note A#, 2
	octave 2
	note A#, 2
	octave 1
	note A#, 2
	octave 2
	note A#, 2
	octave 1
	note B_, 2
	octave 2
	sound_ret
Music_RivalBattle_Ch3_sub_4:
	note F#, 2
	octave 3
	note C#, 2
	octave 2
	note F#, 2
	octave 3
	note F#, 2
	octave 2
	note F#, 2
	octave 3
	note F#, 2
	octave 2
	sound_ret
Music_RivalBattle_Ch3_sub_5:
	octave 3
	note E_, 2
	octave 4
	note E_, 2
	octave 3
	note E_, 2
	octave 4
	note E_, 2
	sound_ret
Music_RivalBattle_Ch3_sub_6:
	octave 3
	note C#, 2
	octave 4
	note C#, 2
	octave 3
	note C#, 2
	octave 4
	note C#, 2
	sound_ret
Music_RivalBattle_Ch3_sub_7:
	note D_, 2
	octave 4
	note D_, 2
	octave 3
	note D_, 2
	octave 4
	note D_, 2
	octave 3
	note D_, 2
	octave 4
	note D_, 2
	octave 3
	note D_, 2
	octave 4
	note D_, 2
	sound_ret
Music_RivalBattle_Ch3_sub_8:
	octave 3
	note C_, 2
	octave 4
	note C_, 2
	octave 3
	note C_, 2
	octave 4
	note C_, 2
	octave 3
	note C_, 2
	octave 4
	note C_, 2
	octave 3
	note C_, 2
	sound_ret
Music_RivalBattle_Ch3_sub_9:
	octave 3
	note C_, 2
	note G_, 2
	octave 4
	note C_, 2
	note D_, 2
	note E_, 2
	note C_, 2
	octave 3
	note G_, 2
	note E_, 2
	sound_ret
Music_RivalBattle_Ch3::
	note_type 12, 1, -1
	octave 4
	note G_, 1
	note A_, 1
	note G_, 1
	note A_, 1
	note G_, 4
	note F#, 1
	note G_, 1
	note F#, 1
	note G_, 1
	note F#, 4
	octave 3
	note F#, 4
	note F_, 2
	note E_, 2
	note D#, 2
	note D_, 2
	note C#, 2
	note C_, 2
	octave 2
	note B_, 2
	octave 3
	sound_call Music_RivalBattle_Ch3_sub_2
	sound_call Music_RivalBattle_Ch3_sub_2
	sound_call Music_RivalBattle_Ch3_sub_2
	sound_call Music_RivalBattle_Ch3_sub_2
	sound_call Music_RivalBattle_Ch3_sub_2
	note B_, 2
	sound_call Music_RivalBattle_Ch3_sub_0
	octave 3
	sound_call Music_RivalBattle_Ch3_sub_0
	octave 4
	sound_call Music_RivalBattle_Ch3_sub_0
	note C_, 2
	octave 3
	note C_, 2
	note C_, 2
	octave 4
	note C_, 2
	octave 3
	note B_, 2
	note A_, 2
	note B_, 2
	note G_, 2
.loop
	sound_call Music_RivalBattle_Ch3_sub_0
	octave 3
	sound_call Music_RivalBattle_Ch3_sub_0
	sound_call Music_RivalBattle_Ch3_sub_1
	note A#, 2
	octave 2
	note G_, 2
	octave 3
	note G_, 2
	octave 2
	note G_, 2
	octave 3
	note G_, 2
	octave 2
	note G_, 2
	octave 3
	note G_, 2
	octave 2
	note G_, 2
	octave 3
	note B_, 2
	sound_call Music_RivalBattle_Ch3_sub_0
	octave 3
	sound_call Music_RivalBattle_Ch3_sub_0
	octave 2
	note G#, 2
	octave 3
	note G#, 2
	octave 2
	note G#, 2
	octave 3
	note G#, 2
	octave 2
	note G#, 2
	octave 3
	note G#, 2
	octave 2
	note G#, 2
	octave 3
	note G#, 2
	sound_call Music_RivalBattle_Ch3_sub_1
	note B_, 2
	sound_call Music_RivalBattle_Ch3_sub_0
	sound_call Music_RivalBattle_Ch3_sub_8
	note A_, 2
	sound_call Music_RivalBattle_Ch3_sub_1
	note A#, 2
	sound_call Music_RivalBattle_Ch3_sub_1
	note B_, 2
	sound_call Music_RivalBattle_Ch3_sub_0
	octave 3
	sound_call Music_RivalBattle_Ch3_sub_0
	sound_call Music_RivalBattle_Ch3_sub_1
	note A#, 2
	sound_call Music_RivalBattle_Ch3_sub_1
	note B_, 2
	sound_call Music_RivalBattle_Ch3_sub_0
	octave 3
	sound_call Music_RivalBattle_Ch3_sub_0
	sound_call Music_RivalBattle_Ch3_sub_3
	sound_call Music_RivalBattle_Ch3_sub_0
	sound_call Music_RivalBattle_Ch3_sub_9
	sound_call Music_RivalBattle_Ch3_sub_3
	sound_call Music_RivalBattle_Ch3_sub_0
	sound_call Music_RivalBattle_Ch3_sub_9
	sound_call Music_RivalBattle_Ch3_sub_0
	octave 3
	sound_call Music_RivalBattle_Ch3_sub_0
	sound_call Music_RivalBattle_Ch3_sub_6
	sound_call Music_RivalBattle_Ch3_sub_6
	sound_call Music_RivalBattle_Ch3_sub_6
	sound_call Music_RivalBattle_Ch3_sub_6
	octave 3
	sound_call Music_RivalBattle_Ch3_sub_7
	octave 3
	sound_call Music_RivalBattle_Ch3_sub_7
	sound_call Music_RivalBattle_Ch3_sub_5
	sound_call Music_RivalBattle_Ch3_sub_5
	sound_call Music_RivalBattle_Ch3_sub_5
	sound_call Music_RivalBattle_Ch3_sub_5
	octave 3
	sound_call Music_RivalBattle_Ch3_sub_4
	sound_call Music_RivalBattle_Ch3_sub_4
	note F#, 2
	octave 4
	note F#, 2
	octave 3
	note F#, 2
	octave 4
	note F#, 2
	octave 3
	sound_call Music_RivalBattle_Ch3_sub_4
	sound_call Music_RivalBattle_Ch3_sub_4
	note F#, 2
	octave 4
	note F#, 2
	octave 3
	note C_, 2
	note B_, 2
	sound_call Music_RivalBattle_Ch3_sub_0
	sound_call Music_RivalBattle_Ch3_sub_8
	octave 4
	note C_, 2
	sound_loop 0, .loop