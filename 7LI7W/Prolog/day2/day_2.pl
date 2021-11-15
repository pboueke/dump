fibonacci(1,1).
fibonacci(2,1).
fibonacci(N,F) :- succ(N1,N), succ(N2,N1), fibonacci(N1,F1), fibonacci(N2,F2), F is F1 + F2.

factorial(0,1).
factorial(N,F) :- succ(N1,N), factorial(N1,F1), F is N * F1.

% 1.
reversed([],[]).
reversed([A],[A]).
reversed(L,[H|T]) :- append(R,[H],L), reversed(R,T).

% 2.
minl([M],M).
% The operator <= causes an error...
minl([H,S|T],M) :- H = S, minl([H|T],M).
minl([H,S|T],M) :- H < S, minl([H|T],M).
minl([H,S|T],M) :- H > S, minl([S|T],M).

% 3.
my_sort([],[]).
my_sort(L,[H|T]) :- minl(L,M), H = M, select(M,L,N), my_sort(N,T).