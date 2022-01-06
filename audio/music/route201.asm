Music_Route201:
	channel_count 4
	channel 1, Music_Route201_Ch1
	channel 2, Music_Route201_Ch2
	channel 3, Music_Route201_Ch3
	channel 4, Music_Route201_Ch4

Music_Route201_Ch1_sub_0:
	note C_, 2
	note F_, 2
	note C_, 2
	note E_, 2
	note C_, 2
	note E_, 2
	note C_, 2
	note G_, 2
	octave 2
	note G_, 2
	note A_, 2
	note B_, 2
	octave 3
	note C_, 2
	octave 2
	note G_, 2
	octave 3
	note E_, 2
	note C_, 2
	sound_ret
Music_Route201_Ch1_sub_1:
	stereo_panning TRUE, TRUE
	octave 2
	note C_, 1
	rest 1
	note C_, 2
	octave 3
	stereo_panning TRUE, FALSE
	note C_, 4
	sound_ret
Music_Route201_Ch1::
	tempo 160
	volume 7, 7
	stereo_panning TRUE, FALSE
	vibrato 18, 2, 2
	duty_cycle 3
	note_type 12, 9, 2
	rest 4
	octave 3
	note C_, 4
	rest 4
	note C_, 4
	rest 4
	note D_, 4
	rest 4
	note C_, 4
.loop
	rest 4
	volume_envelope 10, 2
	note E_, 2
	octave 2
	note G_, 3
	rest 3
	octave 3
	note E_, 2
	octave 2
	note G_, 3
	rest 3
	octave 3
	note F_, 2
	octave 2
	note A_, 3
	rest 3
	octave 3
	note E_, 2
	octave 2
	note G_, 3
	rest 1
	note A_, 2
	octave 3
	note F_, 2
	octave 2
	note A_, 2
	rest 2
	note G_, 2
	octave 3
	note E_, 2
	octave 2
	note G_, 2
	rest 2
	note A_, 2
	octave 3
	note F_, 2
	note F#, 2
	rest 2
	octave 2
	note A_, 2
	octave 3
	note A_, 2
	note G_, 2
	note F_, 2
	sound_call Music_Route201_Ch1_sub_0
	note F_, 2
	sound_call Music_Route201_Ch1_sub_0
	volume_envelope 10, 6
	note C_, 6
	note E_, 6
	note D_, 4
	note C_, 2
	note D_, 2
	note C_, 2
	octave 2
	note G_, 2
	octave 3
	note C_, 2
	octave 2
	note E_, 4
	octave 3
	note C_, 2
	note C_, 6
	note E_, 6
	note D_, 4
	volume_envelope 10, 2
	note C_, 4
	note C_, 4
	note C_, 4
	note D_, 4
	volume_envelope 10, 2
	sound_call Music_Route201_Ch1_sub_1
	sound_call Music_Route201_Ch1_sub_1
	rest 4
	stereo_panning TRUE, FALSE
	note D_, 4
	rest 4
	note C_, 4
	sound_loop 0, .loop
Music_Route201_Ch2_sub_0:
	octave 3
	note E_, 2
	octave 2
	note G_, 6
	octave 3
	note F_, 2
	octave 2
	note A_, 6
	octave 3
	stereo_panning FALSE, TRUE
	note G_, 2
	octave 2
	note B_, 6
	octave 3
	note F_, 2
	octave 2
	note A_, 2
	sound_ret
Music_Route201_Ch2::
	stereo_panning FALSE, TRUE
	vibrato 22, 1, 1
	duty_cycle 3
	note_type 12, 11, 2
	rest 4
	sound_call Music_Route201_Ch2_sub_0
.loop
	note_type 12, 10, 4
	octave 4
	note G_, 2
	note F_, 2
	note E_, 2
	note F_, 2
	note E_, 2
	note C_, 2
	octave 3
	note G_, 4
	note A_, 2
	note G_, 2
	note A_, 2
	note B_, 2
	octave 4
	note C_, 2
	note G_, 6
	note A_, 2
	note G_, 2
	note A_, 2
	note B_, 2
	octave 5
	note C_, 2
	octave 4
	note G_, 6
	note F_, 2
	note E_, 2
	note D_, 2
	note C_, 2
	volume_envelope 10, 2
	note A_, 4
	note G_, 4
	duty_cycle 0
	volume_envelope 11, 4
	note C_, 2
	rest 2
	note C_, 2
	rest 2
	note C_, 2
	rest 2
	note C_, 2
	rest 2
	note G_, 2
	note F_, 2
	note E_, 2
	note D_, 2
	note E_, 2
	note C_, 2
	octave 3
	note G_, 2
	octave 4
	note D_, 2
	note C_, 2
	rest 2
	note C_, 2
	rest 2
	note C_, 2
	rest 2
	note C_, 2
	rest 2
	octave 3
	note G_, 2
	octave 4
	note D_, 2
	note E_, 2
	note D_, 2
	rest 2
	note C_, 6
	stereo_panning TRUE, TRUE
	volume_envelope 8, 5
	duty_cycle 2
	octave 2
	note F_, 6
	note F_, 2
	note G_, 2
	note G_, 4
	note G_, 2
	note E_, 6
	note E_, 2
	note C_, 2
	note C_, 4
	note E_, 2
	note F_, 6
	note F_, 2
	note C_, 2
	note C_, 4
	note C_, 2
	note F_, 6
	note F_, 2
	note C_, 2
	note F_, 2
	note G_, 2
	note B_, 2
	rest 4
	duty_cycle 3
	volume_envelope 12, 2
	sound_call Music_Route201_Ch2_sub_0
	sound_loop 0, .loop
Music_Route201_Ch3_sub_0:
	rest 3
	note F_, 1
	rest 3
	note C_, 1
	rest 3
	note C_, 1
	rest 3
	note G_, 2
	rest 4
	note G_, 2
	note C_, 2
	rest 4
	note C_, 2
	sound_ret
Music_Route201_Ch3_sub_1:
	note C_, 1
	rest 1
	note C_, 5
	rest 1
	note C_, 1
	rest 1
	note C_, 5
	sound_ret
Music_Route201_Ch3_sub_2:
	note G_, 6
	octave 6
	note C_, 6
	octave 5
	note B_, 4
	note A_, 2
	note G_, 2
	note E_, 2
	sound_ret
Music_Route201_Ch3_sub_3:
	note F_, 5
	rest 1
	note C_, 1
	rest 1
	note C_, 5
	rest 1
	note F_, 1
	rest 1
	sound_ret
Music_Route201_Ch3::
	stereo_panning TRUE, TRUE
	vibrato 16, 2, 3
	note_type 12, 2, 5
	octave 3
	sound_call Music_Route201_Ch3_sub_1
	rest 1
	sound_call Music_Route201_Ch3_sub_1
	rest 1
.loop
	note C_, 1
	rest 1
	note C_, 5
	rest 1
	note E_, 1
	rest 1
	note E_, 5
	rest 1
	note F_, 1
	rest 1
	sound_call Music_Route201_Ch3_sub_3
	sound_call Music_Route201_Ch3_sub_3
	note F_, 5
	rest 1
	note G_, 1
	rest 1
	note G_, 5
	rest 1
	note F_, 1
	sound_call Music_Route201_Ch3_sub_0
	note F_, 1
	sound_call Music_Route201_Ch3_sub_0
	stereo_panning FALSE, TRUE
	octave 5
	sound_call Music_Route201_Ch3_sub_2
	note D_, 2
	note E_, 2
	note C_, 4
	note A_, 2
	sound_call Music_Route201_Ch3_sub_2
	note C_, 4
	octave 4
	note G_, 2
	octave 5
	note D_, 2
	note C_, 2
	note C_, 16
	octave 3
	stereo_panning TRUE, TRUE
	sound_call Music_Route201_Ch3_sub_1
	rest 1
	sound_loop 0, .loop
Music_Route201_Ch4_sub_0:
	drum_note 3, 2
	drum_note 3, 2
	drum_note 7, 4
	sound_ret
Music_Route201_Ch4_sub_1:
	drum_note 3, 2
	drum_note 3, 2
	drum_note 7, 2
	drum_note 7, 2
	sound_ret
Music_Route201_Ch4_sub_2:
	drum_note 7, 4
	drum_note 7, 4
	drum_note 7, 4
	drum_note 7, 4
	sound_ret
Music_Route201_Ch4_sub_3:
	drum_note 7, 3
	drum_note 7, 1
	drum_note 3, 3
	drum_note 3, 1
	drum_note 7, 1
	drum_note 7, 2
	drum_note 7, 1
	drum_note 3, 3
	drum_note 3, 1
	sound_ret
Music_Route201_Ch4::
	toggle_noise 3
	drum_speed 12
	sound_call Music_Route201_Ch4_sub_0
	sound_call Music_Route201_Ch4_sub_0
	sound_call Music_Route201_Ch4_sub_0
	sound_call Music_Route201_Ch4_sub_0
.loop
	drum_note 3, 4
	drum_note 7, 4
	drum_note 3, 2
	drum_note 3, 2
	drum_note 7, 4
	sound_call Music_Route201_Ch4_sub_1
	drum_note 3, 2
	drum_note 7, 6
	sound_call Music_Route201_Ch4_sub_1
	sound_call Music_Route201_Ch4_sub_1
	sound_call Music_Route201_Ch4_sub_1
	drum_note 3, 2
	drum_note 7, 2
	drum_note 7, 4
	sound_call Music_Route201_Ch4_sub_2
	sound_call Music_Route201_Ch4_sub_2
	sound_call Music_Route201_Ch4_sub_2
	sound_call Music_Route201_Ch4_sub_2
	sound_call Music_Route201_Ch4_sub_3
	sound_call Music_Route201_Ch4_sub_3
	sound_call Music_Route201_Ch4_sub_3
	drum_note 3, 1
	drum_note 3, 2
	drum_note 3, 1
	drum_note 3, 1
	drum_note 3, 2
	drum_note 3, 1
	drum_note 7, 2
	drum_note 7, 2
	drum_note 3, 2
	drum_note 3, 2
	sound_call Music_Route201_Ch4_sub_0
	sound_call Music_Route201_Ch4_sub_0
	sound_call Music_Route201_Ch4_sub_0
	sound_call Music_Route201_Ch4_sub_0
	sound_loop 0, .loop