translate(49, 1).
translate(48, 0).

binary(Str, Dec) :-
  atom_codes(Str, Codes),
  maplist(translate,Codes, Numbers),
  print(Numbers),
  sumlist(Numbers,Dec),
  print(Dec).


