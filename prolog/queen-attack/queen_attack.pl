create((DimX, DimY)) :-
	maplist(between(0,7), [DimX, DimY]).

attack((X, _), (X, _)):-
	!.

attack((_,Y), (_, Y)):-
	!.

attack((FromX, FromY), (ToX, ToY)):-
	abs(FromX - ToX) =:= abs(FromY - ToY).
