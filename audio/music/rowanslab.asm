Music_RowansLab:
	channel_count 4
	channel 1, Music_RowansLab_Ch1
	channel 2, Music_RowansLab_Ch2
	channel 3, Music_RowansLab_Ch3
	channel 4, Music_RowansLab_Ch4

Music_RowansLab_Ch1_sub_0:
	note E_, 2
	note A_, 2
	note B_, 2
	note E_, 2
	note A_, 2
	note B_, 2
	note E_, 2
	note A_, 2
	note B_, 2
	note E_, 2
	note A_, 2
	note B_, 2
	note D#, 2
	note A_, 2
	octave 2
	note B_, 2
	octave 3
	note D#, 2
	note D_, 2
	note F#, 2
	note B_, 2
	note D_, 2
	note F#, 2
	note B_, 2
	note D_, 2
	note F#, 2
	note E_, 2
	note A_, 2
	note B_, 2
	note E_, 2
	note A_, 2
	note B_, 2
	note E_, 2
	note A_, 2
	note E_, 2
	note A_, 2
	note B_, 2
	note E_, 2
	note A_, 2
	note B_, 2
	note E_, 2
	note A_, 2
	note B_, 2
	note D#, 2
	note A_, 2
	note B_, 2
	note D#, 2
	note A_, 2
	note B_, 2
	note D#, 2
	note D_, 2
	note F#, 2
	note B_, 2
	note D_, 2
	note F#, 2
	note B_, 2
	note D_, 2
	note F#, 2
	note E_, 2
	octave 2
	note A_, 2
	note B_, 2
	octave 3
	note E_, 2
	octave 2
	note A_, 2
	note B_, 2
	octave 3
	note E_, 2
	octave 2
	note A_, 2
	sound_ret
Music_RowansLab_Ch1_sub_1:
	note E_, 6
	note E_, 1
	note E_, 1
	note E_, 2
	note E_, 2
	note E_, 4
	sound_ret
Music_RowansLab_Ch1::
	tempo 154
	volume 7, 7
	vibrato 16, 1, 5
	duty_cycle 3
	stereo_panning TRUE, FALSE
	note_type 12, 11, 2
	octave 3
	sound_call Music_RowansLab_Ch1_sub_1
	sound_call Music_RowansLab_Ch1_sub_1
.loop
	volume_envelope 10, 2
	sound_call Music_RowansLab_Ch1_sub_0
	octave 3
	sound_call Music_RowansLab_Ch1_sub_0
	volume_envelope 9, 5
	note A_, 4
	note F#, 4
	note B_, 4
	octave 3
	note D_, 4
	octave 2
	note B_, 4
	octave 3
	note E_, 4
	octave 2
	note B_, 4
	octave 3
	note D_, 4
	octave 2
	note A_, 4
	note G#, 4
	note B_, 4
	note G#, 4
	note A#, 4
	octave 3
	note C#, 4
	octave 2
	note G_, 4
	note A#, 4
	volume_envelope 9, 7
	note A_, 8
	note F#, 8
	note B_, 8
	octave 3
	note D_, 8
	volume_envelope 9, 0
	note C#, 16
	volume_envelope 9, 7
	note C#, 16
	volume_envelope 9, 5
	octave 2
	note A_, 4
	note F#, 4
	note B_, 4
	octave 3
	note E_, 4
	octave 2
	volume_envelope 9, 7
	note B_, 8
	note G#, 8
	octave 3
	volume_envelope 10, 2
	note E_, 2
	note B_, 2
	note E_, 2
	note B_, 2
	note E_, 2
	note B_, 2
	note E_, 2
	note B_, 2
	note E_, 2
	note B_, 2
	note E_, 2
	note B_, 2
	note E_, 2
	note B_, 2
	note E_, 2
	octave 2
	note B_, 2
	note_type 12, 11, 2
	octave 3
	sound_loop 0, .loop
Music_RowansLab_Ch2_sub_0:
	octave 4
	note C#, 12
	note E_, 3
	note D#, 1
	note D#, 6
	note C#, 1
	note C_, 1
	octave 3
	note B_, 6
	note B_, 1
	octave 4
	note C#, 1
	note D_, 14
	note C#, 1
	octave 3
	note B_, 1
	octave 4
	note C#, 12
	rest 4
	note C#, 12
	note E_, 2
	note D#, 1
	note E_, 1
	note F#, 1
	rest 1
	note D#, 10
	rest 2
	octave 3
	note B_, 1
	octave 4
	note C#, 1
	note D_, 8
	note E_, 6
	note C#, 1
	octave 3
	note B_, 1
	octave 4
	note C#, 1
	rest 1
	octave 3
	sound_ret
Music_RowansLab_Ch2_sub_1:
	note A_, 6
	note A_, 1
	note A_, 1
	note A_, 2
	note A_, 2
	note A_, 4
	note A_, 6
	note A_, 1
	note A_, 1
	note A_, 2
	note A_, 2
	note A_, 2
	sound_ret
Music_RowansLab_Ch2_sub_2:
	note A_, 1
	rest 5
	note A_, 1
	note A_, 1
	note A_, 1
	rest 1
	note A_, 1
	rest 1
	note A_, 1
	sound_ret
Music_RowansLab_Ch2::
	duty_cycle 3
	vibrato 18, 3, 6
	stereo_panning FALSE, TRUE
	note_type 12, 12, 2
	octave 3
	sound_call Music_RowansLab_Ch2_sub_1
	note A_, 1
	note B_, 1
.loop
	volume_envelope 12, 7
	sound_call Music_RowansLab_Ch2_sub_0
	note A_, 10
	rest 4
	sound_call Music_RowansLab_Ch2_sub_0
	note A_, 12
	rest 2
	stereo_panning TRUE, TRUE
	volume_envelope 7, 7
	octave 1
	note B_, 2
	rest 4
	note B_, 1
	note B_, 1
	octave 2
	note D_, 1
	rest 1
	octave 1
	note F#, 4
	note B_, 2
	octave 2
	note C#, 2
	rest 4
	note C#, 1
	note C#, 1
	note E_, 1
	rest 1
	octave 1
	note G#, 4
	octave 2
	note C#, 2
	note C#, 2
	rest 4
	note C#, 1
	note C#, 1
	note F#, 1
	rest 1
	octave 1
	note A#, 4
	octave 2
	note C#, 2
	note C#, 2
	rest 4
	note C#, 1
	note C#, 1
	note G_, 1
	rest 1
	octave 1
	note A#, 4
	octave 2
	note C#, 2
	note D_, 2
	octave 1
	note F#, 2
	note B_, 2
	octave 2
	note D_, 2
	octave 1
	note F#, 2
	note B_, 2
	octave 2
	note D_, 2
	note F#, 2
	note E_, 2
	octave 1
	note G#, 2
	note B_, 2
	octave 2
	note E_, 2
	octave 1
	note G#, 2
	note B_, 2
	octave 2
	note E_, 2
	octave 1
	note G#, 2
	octave 2
	note F#, 2
	note C#, 2
	octave 1
	note A_, 2
	note F#, 2
	octave 2
	note F_, 2
	note C_, 2
	octave 1
	note A_, 2
	note F_, 2
	octave 2
	note E_, 2
	note C#, 2
	octave 1
	note B_, 2
	note A_, 2
	octave 2
	note D#, 1
	rest 1
	note D#, 1
	note D#, 1
	octave 1
	note A_, 2
	octave 2
	note C#, 2
	octave 1
	note A_, 2
	note F#, 2
	note A_, 2
	note F#, 2
	note B_, 2
	octave 2
	note D_, 2
	octave 1
	note B_, 2
	note F#, 2
	note B_, 2
	note E_, 2
	note B_, 2
	note E_, 2
	note B_, 2
	octave 2
	note E_, 2
	octave 1
	note B_, 2
	note E_, 2
	sound_call Music_RowansLab_Ch2_sub_2
	rest 3
	sound_call Music_RowansLab_Ch2_sub_2
	rest 1
	stereo_panning FALSE, TRUE
	volume_envelope 12, 7
	octave 3
	note A_, 1
	note B_, 1
	sound_loop 0, .loop
Music_RowansLab_Ch3_sub_0:
	note A_, 1
	rest 5
	note A_, 1
	note A_, 1
	note A_, 1
	rest 1
	note A_, 1
	rest 1
	note A_, 1
	rest 2
	note A_, 1
	note A_, 1
	rest 5
	note A_, 1
	note A_, 1
	note A_, 1
	rest 1
	note A_, 1
	rest 1
	note A_, 1
	rest 2
	note A_, 1
	note A_, 1
	rest 5
	note A_, 1
	note A_, 1
	octave 3
	note E_, 1
	rest 1
	octave 2
	note E_, 2
	note A_, 2
	octave 3
	note D_, 2
	note C#, 1
	rest 5
	note C#, 1
	note C#, 1
	octave 2
	note E_, 1
	rest 1
	note E_, 2
	rest 2
	note E_, 1
	note G#, 1
	note A_, 1
	rest 5
	note A_, 1
	note A_, 1
	note A_, 1
	rest 1
	note A_, 1
	rest 1
	note A_, 1
	rest 2
	note A_, 1
	note A_, 1
	rest 5
	note A_, 1
	note A_, 1
	note A_, 1
	rest 1
	note A_, 1
	rest 1
	note A_, 1
	rest 2
	note A_, 1
	note A_, 1
	rest 5
	note A_, 1
	note A_, 1
	octave 3
	note E_, 1
	rest 1
	octave 2
	note E_, 4
	note E_, 2
	note A_, 1
	rest 5
	note A_, 1
	note A_, 1
	note A_, 1
	rest 1
	note A_, 2
	rest 2
	sound_ret
Music_RowansLab_Ch3_sub_1:
	note A_, 3
	rest 3
	note A_, 1
	note A_, 1
	note A_, 2
	note A_, 2
	note A_, 2
	rest 2
	sound_ret
Music_RowansLab_Ch3::
	stereo_panning TRUE, TRUE
	vibrato 0, 0, 0
	note_type 12, 2, 7
	octave 2
	sound_call Music_RowansLab_Ch3_sub_1
	sound_call Music_RowansLab_Ch3_sub_1
.loop
	sound_call Music_RowansLab_Ch3_sub_0
	note A_, 2
	sound_call Music_RowansLab_Ch3_sub_0
	octave 4
	stereo_panning FALSE, TRUE
	vibrato 24, 2, 3
	note_type 12, 1, 4
	note C#, 1
	note E_, 1
	note B_, 2
	note A_, 2
	octave 5
	note C#, 2
	octave 4
	note B_, 2
	octave 5
	note E_, 2
	note D_, 2
	octave 4
	note A_, 2
	note G#, 1
	note A_, 1
	octave 5
	note C#, 4
	octave 4
	note B_, 4
	octave 5
	note F#, 2
	note E_, 2
	octave 4
	note B_, 2
	octave 5
	note D_, 2
	note C#, 9
	note D_, 1
	note C#, 1
	note D_, 1
	note C#, 2
	octave 4
	note A#, 1
	note B_, 1
	octave 5
	note C#, 10
	note E_, 2
	note D_, 2
	note C#, 2
	octave 4
	note A_, 6
	note F#, 1
	note G#, 1
	note A_, 2
	octave 5
	note C#, 2
	octave 4
	note B_, 2
	note A_, 2
	octave 5
	note C#, 10
	octave 4
	note B_, 2
	octave 5
	note D_, 2
	note C#, 2
	octave 4
	note A_, 5
	note G#, 1
	note F#, 1
	note G#, 1
	note A_, 10
	note G#, 2
	note B_, 2
	note A_, 2
	octave 5
	note F#, 2
	note C#, 2
	octave 4
	note B_, 2
	octave 5
	note C#, 2
	octave 4
	note A_, 16
	note A_, 2
	note E_, 2
	note F#, 2
	note E_, 2
	note G#, 2
	note E_, 2
	note B_, 2
	octave 5
	note C#, 2
	octave 4
	note A_, 16
	note A_, 16
	octave 2
	stereo_panning TRUE, TRUE
	note_type 12, 2, 7
	vibrato 0, 0, 0
	sound_loop 0, .loop
Music_RowansLab_Ch4_sub_1:
	drum_note 3, 2
	drum_note 7, 2
	drum_note 7, 2
	drum_note 3, 1
	drum_note 3, 1
	drum_note 3, 2
	drum_note 3, 2
	drum_note 3, 4
	sound_ret
Music_RowansLab_Ch4_sub_2:
	drum_note 3, 2
	drum_note 7, 2
	drum_note 7, 2
	drum_note 3, 1
	drum_note 3, 1
	drum_note 3, 2
	drum_note 3, 2
	drum_note 3, 1
	drum_note 3, 1
	drum_note 3, 1
	drum_note 3, 1
	sound_ret
Music_RowansLab_Ch4_sub_3:
	drum_note 3, 2
	drum_note 7, 2
	drum_note 7, 2
	drum_note 3, 1
	drum_note 3, 1
	drum_note 3, 2
	drum_note 3, 2
	drum_note 3, 2
	drum_note 3, 2
	sound_ret
Music_RowansLab_Ch4_sub_4:
	drum_note 3, 2
	drum_note 7, 2
	drum_note 7, 2
	drum_note 3, 1
	drum_note 3, 1
	drum_note 3, 2
	drum_note 7, 2
	drum_note 3, 2
	drum_note 3, 2
	sound_ret
Music_RowansLab_Ch4_sub_5:
	drum_note 3, 2
	drum_note 7, 2
	drum_note 7, 2
	drum_note 3, 1
	drum_note 3, 1
	drum_note 3, 2
	drum_note 3, 2
	drum_speed 6
	drum_note 3, 1
	drum_note 3, 1
	drum_note 3, 1
	drum_note 3, 1
	drum_note 3, 1
	drum_note 3, 1
	drum_note 3, 1
	drum_note 3, 1
	drum_speed 12
	sound_ret
Music_RowansLab_Ch4::
	toggle_noise 3
	drum_speed 12
	sound_call Music_RowansLab_Ch4_sub_1
	sound_call Music_RowansLab_Ch4_sub_2
.loop
	sound_call Music_RowansLab_Ch4_sub_3
	sound_call Music_RowansLab_Ch4_sub_4
	sound_call Music_RowansLab_Ch4_sub_4
	sound_call Music_RowansLab_Ch4_sub_5
	sound_call Music_RowansLab_Ch4_sub_4
	sound_call Music_RowansLab_Ch4_sub_3
	sound_call Music_RowansLab_Ch4_sub_4
	sound_call Music_RowansLab_Ch4_sub_5
	sound_call Music_RowansLab_Ch4_sub_4
	sound_call Music_RowansLab_Ch4_sub_4
	sound_call Music_RowansLab_Ch4_sub_3
	sound_call Music_RowansLab_Ch4_sub_5
	sound_loop 0, .loop
