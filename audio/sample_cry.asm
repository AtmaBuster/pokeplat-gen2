SECTION "Sampled Cries", ROMX

samplecry: MACRO
\1:: INCBIN \2
\1_End::
ENDM

;	samplecry TestSampledCry, "audio/samples/sega_hq.aud"
