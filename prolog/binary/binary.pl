binary(Str, Dec) :-
 string_chars(Str, chars),
 maplist(number_chars,numbers,chars),
 sumlist(numbers,Dec).


