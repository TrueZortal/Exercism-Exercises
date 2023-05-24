create((DimX, DimY)) :-
	maplist(between(0,7), [DimX, DimY]).

attack((FromX, FromY), (ToX, ToY)):-
	FromX =:= ToX,
	!.

attack((FromX, FromY), (ToX, ToY)):-
	FromY =:= ToY,
	!.

attack((FromX, FromY), (ToX, ToY)):-
	(FromX + FromY) =:= (ToX + ToY),
	!.