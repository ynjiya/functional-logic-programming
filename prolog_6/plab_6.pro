PREDICATES
	fact(integer, integer)
	fact(integer, integer, integer)
	
	fibo(integer, integer)
	fibo(integer, integer, integer, integer)
CLAUSES
	fact(1, F1, F1) :- !.
	fact(X, F1, F) :- 
		Xx = X - 1,
		Ff = F1 * X,
		fact(Xx, Ff, F).
	
	fact(X, F) :- fact(X, 1, F).

	
	fibo(0, A, _, F) :- F = A, !.
	fibo(1, _, B, F) :- F = B, !.
	
	fibo(N, A, B, F) :- 
		Nn = N - 1,
		Bb = A + B,
		fibo(Nn, B, Bb, F).
	
	fibo(N, F) :- fibo(N, 0, 1, F).
		
GOAL
	%fact(4, F). % 24
	fibo(4, F). % 3