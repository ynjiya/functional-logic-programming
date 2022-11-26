DOMAINS
	intlist = integer*
PREDICATES
	len(intlist, integer)
	len(intlist, integer, integer)
	
	sum(intlist, integer)
	sum(intlist, integer, integer)
	
	odd_pos_sum(intlist, integer)
	odd_pos_sum(intlist, integer, integer)
	
	lst_more_than(intlist, integer, intlist)
	
	odd_pos_lst(intlist, intlist)
	
	del_lst_elems(intlist, integer, intlist)
	del_lst_elem(intlist, integer, intlist)
	
	set_from_lst(intlist, intlist)
	
	member(intlist, integer)
	set_from_lst2(intlist, intlist)
CLAUSES
	len([_ | T], Tmp, L) :-
		Tmpp = Tmp + 1,
		len(T, Tmpp, L).
	len([], Tmp, Tmp).
	len(List, L) :- len(List, 0, L).
		
	% sum of elements
	sum([H | T], Tmp, S) :-
		Tmpp = Tmp + H,
		sum(T, Tmpp, S).
	sum([], Tmp, Tmp).
	sum(List, S) :- sum(List, 0, S).
		
	% sum of elements on odd position
	odd_pos_sum([_, H | T], Tmp, S) :-
		Tmpp = Tmp + H,
		odd_pos_sum(T, Tmpp, S).
	odd_pos_sum([_], S, S).
	odd_pos_sum([], S, S).
	odd_pos_sum(List, S) :- odd_pos_sum(List, 0, S).
	
	
	% create new list from lst with elements more than Num
	lst_more_than([H | T], Num, [H | Res]) :- 
		H > Num, !, 
		lst_more_than(T, Num, Res).
		
	lst_more_than([_ | T], Num, Res) :-
		lst_more_than(T, Num, Res).

	lst_more_than([], _, []).
	
	
	% create new list from lst with elements on odd position
	odd_pos_lst([_, H | T], [H | Res]):-
		odd_pos_lst(T, Res).
	odd_pos_lst([_], []).
	odd_pos_lst([], []).
	
	% delete all elements of list that equal Elem
	del_lst_elems([Elem | T], Elem, Res) :- !, 
		del_lst_elems(T, Elem, Res).
	del_lst_elems([H | T], Elem, [H | Res]) :- !,
		del_lst_elems(T, Elem, Res).
	del_lst_elems([], _, []).
	
	% delete first instance of Elem in list
	del_lst_elem([Elem | T], Elem, T) :- !.
	del_lst_elem([_ | T], Elem, Res) :-
		del_lst_elem(T, Elem, Res).
	del_lst_elem([], _, []).
		
	% create set from list using del_lst_elem
	set_from_lst([H | T], [H | Res]) :-
		del_lst_elems(T, H, CleanT),
		set_from_lst(CLeanT, Res).
	set_from_lst([], []).
	
	% create set from list using member
	
	member([Elem | _], Elem) :- !.
	member([_ | T], Elem) :- member(T, Elem).
	set_from_lst2([H | T], [H | Res]) :-
		member(T, H),
		set_from_lst2(T, Res).
	set_from_lst2([], []).
	
	
	%append([], L, L).
	%append([H1 | T1], L2, [H1 | T3]) :- append(T1, L2, T3).
	
	
GOAL
	%len([1, 2, 3], L).
	%sum([], S).
	%odd_pos_sum([], S). 
	%lst_more_than([8, 9, 3, 4, 7], 5, Res).   % [8, 9, 7]
	%odd_pos_lst([9, 8, 7, 6], Res).
	%del_lst_elems([1, 2, 3, 1, 1, 7], 1, Res).  % [2, 3, 7]
	%del_lst_elem([1, 2, 3, 1, 1, 7], 1, Res).  % [2, 3, 1, 1, 7]
	set_from_lst2([1, 2, 3, 1, 1, 7], Set).  % [1, 2, 3, 7]

