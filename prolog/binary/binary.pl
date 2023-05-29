translate(49, 1).
translate(48, 0).

binary(Str, Dec) :-
  atom_codes(Str, Codes),
  maplist(translate,Codes, Numbers),
  binarize(Numbers,0,Dec).


binarize([],Accumulator, Accumulator).
binarize([Head | Tail], Accumulator, Result):-
  length(Tail, N),
  TemporaryAccumulator is Accumulator + Head * 2^N,
  binarize(Tail, TemporaryAccumulator, Result).





