Music_LookYoungster:
	channel_count 3
	channel 1, Music_LookYoungster_Ch1
	channel 2, Music_LookYoungster_Ch2
	channel 3, Music_LookYoungster_Ch3

Music_LookYoungster_Ch1:
	tempo 124
	volume 7, 7
	sound_call .pattern0
.loop
	sound_call .pattern1
	sound_call .pattern3
	sound_loop 0, .loop

.pattern0
	duty_cycle 3
	note_type 12, 8, 1
	stereo_panning TRUE, FALSE
	octave 3
	note C_, 1
	octave 3
	note D#, 1
	note F#, 1
	note G#, 1
	octave 4
	note C_, 1
	note C_, 1
	rest 2
	stereo_panning FALSE, TRUE
	octave 2
	note A#, 1
	octave 3
	note C#, 1
	note E_, 1
	note G#, 1
	note_type 12, 9, 3
	stereo_panning TRUE, TRUE
	note F#, 1
	note G#, 1
	note A#, 1
	octave 4
	note C_, 1
	sound_ret

.pattern1
	stereo_panning TRUE, TRUE
	volume_envelope 9, 1
	octave 4
	note C#, 2
	octave 3
	note G#, 2
	note F_, 2
	note G#, 2
	note G#, 1
	note A#, 1
	note G#, 1
	note F#, 1
	volume_envelope 9, 3
	note F_, 4
	volume_envelope 9, 1
	note F_, 1
	note F#, 1
	note G#, 1
	note A#, 1
	volume_envelope 9, 3
	note G#, 4
	volume_envelope 9, 1
	note F#, 1
	note F#, 1
	note C#, 1
	rest 1
	volume_envelope 9, 3
	note F#, 2
	note A#, 2
	stereo_panning TRUE, FALSE
	duty_cycle 0
	volume_envelope 9, 2
	note G#, 1
	note G#, 1
	note C_, 2
	note D#, 1
	note D#, 1
	note G#, 2
	note G_, 1
	note F#, 1
	note E_, 1
	note D#, 1
	note E_, 1
	note E_, 1
	note D#, 1
	note E_, 1
	note F_, 1
	note F_, 1
	rest 2
	note E_, 1
	note E_, 1
	rest 2
	note D#, 1
	note D#, 1
	rest 1
	octave 4
	note C_, 1
	note C_, 1
	rest 1
	octave 3
	note G#, 2
	sound_ret

.pattern3
	stereo_panning FALSE, TRUE
	pitch_offset 1
	rest 6
	duty_cycle 3
	volume_envelope 9, 2
	octave 4
	note F_, 2
	note C#, 1
	rest 1
	octave 3
	note G#, 1
	octave 4
	note C#, 1
	octave 3
	note B_, 1
	octave 4
	note C#, 1
	octave 3
	note B_, 1
	note A#, 1
	note G#, 1
	rest 1
	note C#, 1
	rest 1
	note G#, 1
	note A#, 1
	note B_, 1
	octave 4
	note C#, 1
	octave 3
	note A#, 1
	rest 1
	note F#, 1
	rest 1
	note C#, 1
	rest 1
	note E_, 1
	rest 1
	note G#, 1
	note G#, 1
	note E_, 1
	note C_, 1
	note G#, 1
	note G#, 1
	note E_, 1
	note C_, 1
	note C_, 1
	note C_, 1
	note C#, 1
	note C#, 1
	note D_, 1
	note D_, 1
	note C#, 1
	note C#, 1
	volume_envelope 9, 1
	octave 4
	note C_, 1
	note C#, 1
	note D_, 1
	note D#, 1
	note E_, 1
	note D#, 1
	note D_, 1
	note C#, 1
	note C_, 1
	note D_, 1
	note D#, 2
	octave 3
	note C_, 1
	note C_, 1
	rest 1
	volume_envelope 9, 2
	note C_, 1
	sound_ret

Music_LookYoungster_Ch2:
	vibrato 11, 2, 6
	sound_call .pattern0
.loop
	sound_call .pattern1
	sound_call .pattern2
	sound_loop 0, .loop

.pattern0
	duty_cycle 2
	note_type 12, 11, 1
	octave 4
	note G#, 1
	note G#, 1
	rest 1
	note G#, 1
	volume_envelope 11, 3
	note G#, 4
	volume_envelope 11, 1
	note F#, 1
	note F#, 1
	rest 1
	note F#, 1
	volume_envelope 11, 3
	note F#, 4
	sound_ret

.pattern1
	stereo_panning TRUE, TRUE
	duty_cycle 3
	volume_envelope 12, 2
	octave 4
	note F_, 2
	note C#, 2
	octave 3
	note G#, 1
	note G#, 1
	octave 4
	note C#, 1
	note C#, 1
	octave 3
	note B_, 1
	octave 4
	note C#, 1
	octave 3
	note B_, 1
	note A#, 1
	volume_envelope 12, 3
	note G#, 3
	rest 1
	volume_envelope 12, 1
	note G#, 1
	note A#, 1
	note B_, 1
	octave 4
	note C#, 1
	volume_envelope 12, 3
	octave 3
	note B_, 4
	volume_envelope 12, 2
	note A#, 1
	note A#, 1
	octave 4
	note C#, 1
	rest 1
	octave 3
	note A#, 1
	note A#, 1
	octave 4
	note E_, 1
	note E_, 1
	note D#, 1
	note D#, 1
	octave 3
	note G#, 2
	octave 4
	note C_, 1
	note C_, 1
	note D#, 2
	note C#, 1
	octave 3
	note B_, 1
	note A#, 1
	note G#, 1
	note G_, 1
	note G_, 1
	note F#, 1
	note G_, 1
	note G#, 1
	note G#, 1
	rest 2
	note G#, 1
	note G#, 1
	rest 2
	note G#, 1
	note G#, 1
	rest 1
	octave 4
	note G#, 1
	note G#, 1
	rest 1
	note F#, 2
	sound_ret

.pattern2
	stereo_panning TRUE, FALSE
	duty_cycle 2
	volume_envelope 12, 2
	octave 4
	note F_, 2
	note C#, 2
	octave 3
	note G#, 2
	octave 4
	note C#, 2
	octave 3
	note B_, 1
	octave 4
	note C#, 1
	octave 3
	note B_, 1
	note A#, 1
	volume_envelope 12, 3
	note G#, 4
	volume_envelope 12, 1
	note G#, 1
	note A#, 1
	note B_, 1
	octave 4
	note C#, 1
	volume_envelope 12, 3
	octave 3
	note B_, 4
	note A#, 2
	octave 4
	note C#, 1
	rest 1
	octave 3
	note F#, 1
	rest 1
	note A#, 1
	rest 1
	stereo_panning TRUE, TRUE
	volume_envelope 12, 1
	note G#, 1
	note G#, 1
	rest 2
	note G#, 1
	note G#, 1
	rest 2
	note G_, 1
	note G_, 1
	note G#, 1
	note G#, 1
	note A_, 1
	note A_, 1
	note G#, 1
	note G#, 1
	rest 4
	volume_envelope 12, 1
	octave 4
	note E_, 1
	note F_, 1
	note F#, 1
	note G_, 1
	note G#, 1
	note G#, 1
	rest 1
	note G#, 1
	note F#, 1
	note F#, 1
	rest 1
	note F#, 1
	sound_ret

Music_LookYoungster_Ch3:
	vibrato 2, 2, 4
	sound_call .pattern0
.loop
	sound_call .pattern1
	sound_call .pattern2
	sound_loop 0, .loop

.pattern0
	note_type 12, 2, 5
	octave 3
	note G#, 1
	note G#, 1
	rest 1
	note G#, 1
	octave 2
	note G#, 1
	note G#, 3
	octave 3
	note F#, 1
	note F#, 1
	rest 1
	note F#, 1
	octave 2
	note F#, 4
	sound_ret

.pattern1
	volume_envelope 2, 5
	octave 2
	note G#, 1
	rest 1
	octave 3
	note C#, 1
	rest 1
	octave 2
	note G#, 1
	rest 1
	octave 3
	note F_, 1
	rest 1
	octave 2
	note B_, 1
	rest 1
	octave 3
	note D#, 1
	rest 1
	octave 2
	note B_, 1
	rest 1
	octave 3
	note F#, 1
	rest 1
	octave 2
	note G#, 1
	rest 1
	octave 3
	note C#, 1
	rest 1
	octave 2
	note G#, 1
	rest 1
	octave 3
	note F_, 1
	rest 1
	note F#, 2
	rest 1
	note F#, 3
	note A#, 2
	note G#, 2
	rest 1
	note G#, 2
	rest 1
	octave 4
	note C_, 1
	rest 1
	octave 2
	note G_, 1
	note G#, 1
	note A#, 1
	octave 3
	note C#, 1
	note D#, 1
	note E_, 1
	note F_, 1
	note G_, 1
	note G#, 1
	note G#, 1
	octave 2
	note G#, 1
	rest 1
	octave 3
	note G#, 1
	note G#, 1
	octave 2
	note G#, 1
	rest 1
	note G#, 1
	note A#, 1
	octave 3
	note C_, 1
	octave 2
	note C#, 1
	note D#, 1
	note F#, 1
	note G#, 1
	octave 3
	note C_, 1
	sound_ret

.pattern2
	volume_envelope 2, 4
	octave 2
	note C#, 2
	octave 3
	note C#, 1
	rest 1
	octave 2
	note C#, 2
	octave 3
	note C#, 1
	rest 1
	octave 2
	note D#, 2
	octave 3
	note D#, 1
	rest 1
	octave 2
	note D#, 2
	octave 3
	note D#, 1
	rest 1
	octave 2
	note C#, 2
	octave 3
	note C#, 1
	rest 1
	octave 2
	note C#, 2
	octave 3
	note C#, 1
	octave 2
	note C#, 1
	note F#, 4
	note A#, 1
	rest 1
	octave 3
	note C#, 1
	note E_, 1
	note G#, 2
	rest 1
	note G#, 1
	octave 2
	note G#, 4
	octave 3
	note A_, 2
	rest 1
	note A_, 1
	octave 2
	note A_, 4
	note G#, 1
	note A_, 1
	note A#, 1
	note B_, 1
	octave 3
	note C_, 1
	octave 2
	note B_, 1
	note A#, 1
	note A_, 1
	note G#, 1
	octave 3
	note D#, 2
	octave 2
	note G#, 1
	octave 3
	note G_, 1
	note G#, 1
	octave 2
	note G#, 1
	note C_, 1
	sound_ret
