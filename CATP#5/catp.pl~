% Álister Machado dos Reis, 220494

print_list([]) :- nl, !.
print_list([H|T]) :-
	write(H),
	write(' '),
	print_list(T).
	
last([], _) :- !.
last([H|T], Last) :-
	(T \= [], last(T, Last), !);
	Last = H.

concat([], L2, L2).
concat(L1, [], L1).
concat([H|T], L2, [H|L3]) :-
	concat(T, L2, L3).
revert([], []) :- !.
revert([H|T], L3) :-
	revert(T, L2),
	concat(L2, [H], L3).
	
insert(Elem, [], [Elem]):- !.
insert(Elem, [H|T], L3) :-
	(Elem =< H, L3 = [Elem,H|T]);
	(insert(Elem,T,Aux), L3 = [H|Aux]).
	
remove_one(_, [], []) :- !.
remove_one(Elem, [Elem|T], T) :- !.
remove_one(Elem, [H|T], [H|L3]) :-
	remove_one(Elem, T, L3).
	
remove_all(_, [], []) :- !.
remove_all(Elem, [Elem|T], L3) :-
	remove_all(Elem, T, L3), !.
remove_all(Elem, [H|T], [H|L3]) :-
	remove_all(Elem, T, L3), !.
	
	
test_print_list :- 
	write('Testando print_list:'), nl,
		write_ln('print_list([1,2,34,3,2,3,5,6])'),
		print_list([1,2,34,3,2,3,5,6]),
		nl,
		write_ln('print_list([])'),
		print_list([]),
		write_ln('print_list([\'Aa\'])'),
		print_list(['Aa']), nl.
		
test_last :-
	write('Testando last (achar último elem da lista)'), nl,
	write_ln('last([], X)'),
	last([], X), write('X = '), write_ln(X),
	write_ln('last([1,2,3,4,2,1,23], Y)'),
	last([1,2,3,4,2,1,23], Y), write('Y = '), write_ln(Y), nl.

test_revert :-
	write('Testando revert'), nl,
	write_ln('revert([], X)'),
	revert([], X), write('X = '), write_ln(X),
	write_ln('revert([1,2,3], Y)'),
	revert([1,2,3], Y), write('Y = '), write_ln(Y),
	nl.

test_insert :- 
	write('Testando inserção em lista ordenada'), nl,
	write_ln('insert(2, [], X)'),
	insert(2,[],X), write('X = '), write_ln(X),
	write_ln('insert(7, [1,2,5,9,10], Y'),
	insert(7, [1,2,5,9,10], Y), write('Y = '), write_ln(Y), nl.

test_remove :-
	write('Testando remoção. Começando com função que remove somente UMA ocorrência'),
	nl,
	write_ln('remove_one(0, [], X)'),
	remove_one(0, [], X), write('X = '), write_ln(X),
	write_ln('remove_one(0, [1,2,3], Y)'),
	remove_one(0, [1,2,3], Y), write('Y = '), write_ln(Y),
	write_ln('remove_one(0, [1,2,0,2,3,1,0,10,20], Z'),
	remove_one(0, [1,2,0,2,3,1,0,10,20], Z), write('Z = '), write_ln(Z), nl,
	write('Função que remove todas as ocorrências'), nl,
	write_ln('remove_all(0, [], X2)'),
	remove_all(0, [], X2), write('X2 = '), write_ln(X2),
	write_ln('remove_all(0, [1,2,3], Y2)'),
	remove_all(0, [1,2,3], Y2), write('Y2 = '), write_ln(Y2),
	write_ln('remove_all(0, [1,2,0,2,3,1,0,10,20], Z2)'),
	remove_all(0, [1,2,0,2,3,1,0,10,20], Z2), write('Z2 = '), write_ln(Z2), nl.
	
	
:- test_print_list,
	test_last,
	test_revert,
	test_insert,
	test_remove.
	

		
