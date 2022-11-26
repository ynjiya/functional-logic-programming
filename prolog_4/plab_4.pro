DOMAINS
	name, sex = symbol
PREDICATES
	parent(name, name, sex).
	grandparent(name, name, sex, sex).
	nth_mom(integer, name, name).
	
CLAUSES
	parent("Liam", "Jim", "m").  % Liam's father is Jim
	parent("Liam", "Pam", "w").  % Liam's mother is Pam 1
	
	parent("Jim", "Steve", "m"). % Liam's paternal grandfather is Steve
	parent("Jim", "Katie", "w"). % Liam's paternal grandmother is Katie 2

	parent("Pam", "John", "m").  % Liam's maternal grandfather is John
	parent("Pam", "Sara", "w").  % Liam's maternal grandmother is Sara 2
	
		
	parent("Sara", "Kia", "w"). % Liam's  grandmother 3
	parent("Kia", "Mio", "w"). % Liam's  grandmother 4
	
	
	grandparent(Child, Grandparent, Sex, Side) :-
		parent(Child, Parent, Side),
		parent(Parent, Grandparent, Sex).
	
	nth_mom(1, Child, Nmom) :- parent(Child, Nmom, "w").
	nth_mom(N, Child, Nmom) :- 
		% N > 0, !,
		parent(Child, NNmom, _), % grandmothers from both side
		Nn = N - 1,
		nth_mom(Nn, NNmom, Nmom).

GOAL
	nth_mom(-4, "Liam", Nmom).
/*
all grandmothers
GM=Katie
GM=Sara
*/
	%grandparent("Liam", GM, "w", _).

/*
all grandfathers
GF=Steve
GF=John
*/
	%grandparent("Liam", GF, "m", _).
/*
all gps
GP=Steve
GP=Katie
GP=John
GP=Sara
*/	
	%grandparent("Liam", GP, _, _).
/*
maternal grandmother
GMM=Sara
*/	
	%grandparent("Liam", GMM, "w", "w").
	
/*
maternal gps
GPM=John
GPM=Sara
*/	
	%grandparent("Liam", GPM, _, "w").
	