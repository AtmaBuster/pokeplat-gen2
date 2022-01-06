Music_SpecialProgram:
	channel_count 4
	channel 1, Music_SpecialProgram_Ch1
	channel 2, Music_SpecialProgram_Ch2
	channel 3, Music_SpecialProgram_Ch3
    channel 4, Music_SpecialProgram_Ch4

Music_SpecialProgram_Ch1::
	tempo 155
	volume 7, 7
	stereo_panning TRUE, FALSE
	duty_cycle 1
	note_type 12, 5, 6
.loop
	octave 4
	note D_, 1
	rest 3
	note D_, 1
	rest 1
	note D_, 4
	note D_, 1
	rest 1
	note D_, 1
	note D_, 1
	rest 2
	octave 3
	note A_, 1
	rest 3
	note A_, 1
	rest 1
	note A_, 4
	note A_, 1
	rest 1
	note A_, 1
	note A_, 1
	rest 2
	octave 4
	note F_, 1
	note F_, 1
	note F_, 1
	rest 1
	note F_, 1
	note F_, 1
	note D_, 1
	rest 3
	note D_, 1
	rest 1
	note F_, 1
	note F_, 1
	rest 2
	note E_, 4
	note E_, 1
	note E_, 1
	rest 4
	note C_, 4
	note E_, 2
	sound_loop 0, .loop
Music_SpecialProgram_Ch2::
	stereo_panning FALSE, TRUE
	duty_cycle 2
	note_type 12, 12, 3
.loop
	volume_envelope 12, 2
	octave 4
	note G_, 2
	octave 3
	note A_, 2
	octave 4
	note G_, 2
	note F_, 4
	note G_, 2
	note A_, 2
	note C_, 2
	note D#, 2
	note D_, 2
	note C#, 2
	note D_, 4
	note C_, 2
	note D_, 2
	note F#, 2
	note A_, 2
	note G#, 2
	note A_, 2
	octave 5
	note C_, 4
	octave 4
	note G#, 2
	note A_, 2
	note C_, 2
	volume_envelope 12, 4
	note G#, 6
	note G#, 4
	volume_envelope 12, 2
	note G#, 2
	note A_, 2
	note C_, 2
	sound_loop 0, .loop
Music_SpecialProgram_Ch3::
	vibrato 8, 3, 4
	note_type 12, 2, 5
.loop
	octave 3
	note F_, 4
	rest 2
	note F_, 2
	octave 4
	note C_, 4
	rest 2
	note C_, 2
	note D_, 4
	rest 2
	note D_, 2
	octave 3
	note F#, 4
	rest 2
	note F#, 2
	note G_, 1
	rest 1
	note G_, 1
	rest 1
	note G_, 1
	rest 5
	note G_, 1
	rest 1
	note G_, 2
	rest 2
	octave 4
	note C_, 1
	rest 1
	note C_, 1
	rest 3
	octave 3
	note C_, 1
	rest 3
	note C_, 1
	rest 1
	note G_, 2
	note C_, 2
	sound_loop 0, .loop
Music_SpecialProgram_Ch4_sub_0:
	drum_note 4, 2
	drum_note 4, 2
	drum_note 3, 2
	drum_note 4, 2
	drum_note 4, 2
	drum_note 3, 2
	drum_note 3, 2
	drum_note 4, 2
	sound_ret
Music_SpecialProgram_Ch4::
	toggle_noise 3
	drum_speed 12
.loop
	sound_call Music_SpecialProgram_Ch4_sub_0
	sound_call Music_SpecialProgram_Ch4_sub_0
	sound_call Music_SpecialProgram_Ch4_sub_0
	sound_call Music_SpecialProgram_Ch4_sub_0
	sound_loop 0, .loop