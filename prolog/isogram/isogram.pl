checkletter(Char) :-
char_type(Char, alpha).

isogram(""):- !.

isogram(Phrase) :-
string_lower(Phrase, LwrPhrase),
string_chars(LwrPhrase, Chars),
msort(Chars, Sorted),
include(checkletter, Sorted, Remaining),
is_set(Remaining).


