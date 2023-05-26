recode('G','C').
recode('C','G').
recode('T','A').
recode('A','U').

rna_transcription(Rna, Dna) :-
  string_chars(Rna,RnaChars),
  maplist(recode, RnaChars, Recoded),
  string_chars(Dna,Recoded).
