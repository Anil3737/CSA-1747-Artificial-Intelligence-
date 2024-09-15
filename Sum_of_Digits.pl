sum(1,1).
sum(N,Result):-
    N>1,
    N1 is N-1,
    sum(N1,Subsum),
   Result is N+Subsum.
