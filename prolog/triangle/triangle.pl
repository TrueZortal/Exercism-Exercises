triangle(Arg, Arg, Arg, "equilateral") :-
  Arg > 0,
  !.

triangle(Arg1, Arg2, Arg3, "scalene") :-
  Arg1 > 0,
  Arg2 > 0,
  Arg3 > 0,
  Arg1 \== Arg2,
  Arg2 \== Arg3,
  Arg1 \== Arg3,
  Arg1 + Arg2 > Arg3,
  Arg1 + Arg3 > Arg2,
  Arg2 + Arg3 > Arg1,
  !.

triangle(Arg, Arg, Arg2, "isosceles") :-
  Arg > 0,
  Arg2 > 0,
  2 * Arg >= Arg2,
  !.

triangle(Arg, Arg2, Arg, "isosceles") :-
  Arg > 0,
  Arg2 > 0,
  2 * Arg >= Arg2,
  !.

triangle(Arg2, Arg, Arg, "isosceles") :-
  Arg > 0,
  Arg2 > 0,
  2 * Arg >= Arg2,
  !.