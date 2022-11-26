DOMAINS
	name = symbol
	university = symbol
	phone = integer

PREDICATES
	student(name, university, phone)

CLAUSES
	student("John", "MIT", 111).
	student("Steve", "MIT", 99).
	student("Steve", "Harvard", 222).
	student("Wozniak", "UCLA", 321).
	student("Ivanov", "BMSTU", 976).
	student("John", "UCLA", 111).
	student("Gates", "Stanford", 888). 

	student("Melinda", University, 123) :- student("Gates", University, _).

GOAL
	% students of MIT
	student(Name, "MIT", Phone).
/*
X=John, Y=111
X=Steve, Y=99
2 Solutions
*/
	% universities of Steve
	%student("Steve", Steve_universities, _).
/*
Steve_universities=MIT
Steve_universities=Harvard
2 Solutions
*/
	% Melinda's University
	%student("Melinda", Melinda_uni, _).
/*
Melinda_uni=Stanford
1 Solution
*/

