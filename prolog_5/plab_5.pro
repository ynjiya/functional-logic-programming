DOMAINS
	num = integer
	
	name = symbol
PREDICATES
	max2(num, num, num)
	max22(num, num, num)
	
	max3(num, num, num, num)
	max33(num, num, num, num)
	max333(num, num, num, num)
	
	loves(name, name)
	jealous(name, name)
CLAUSES
/*
if A >= B (unnecessary backtracking occurs)
max2(A, B, A) is true
max2(A, B, B) will be checked too
*/
	max2(A, B, A) :- A >= B.
	max2(A, B, B) :- B >= A.
/*
if A >= B 
max2(A, B, A) is true
max2(A, B, B) will NOT be checked
*/
	max22(A, B, A) :- A >= B, !. %if true, don't try the next rule 
	max22(_, B, B). %else, check this rule
	
%-----------------------------------------------------------------
	max3(A, B, C, A) :- A >= B, A >= C.
	max3(A, B, C, B) :- B >= A, B >= C.
	max3(A, B, C, C) :- C >= A, C >= B.
	
	max33(A, B, C, A) :- A >= B, A >= C, !.
	max33(_, B, C, B) :- B >= C, !.
	max33(_, _, C, C).
	
	max333(A, B, C, A) :- A >= B, A >= C, !.
	max333(_, B, C, Max) :- max22(B, C, Max).
	
	
	
	loves(vincent,mia).
	loves(marcellus,mia).

	jealous(A,B):- loves(A,C), loves(B,C).
	
GOAL
	%max2(1, 9, Max).
	%max3(3, 2, 9, Max).
	
	jealous(X, Y).
