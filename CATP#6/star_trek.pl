% Rafael Valer, 220489
aconselha('Spock','Kirk').
aconselha('Diana','Picard').


comanda('Archer','NX-01').
comanda('Kirk','NCC-1701').
comanda('Picard','NCC-1701-D').
comanda('Almak','Irwtmet').
comanda('Janeway','Voyager').

eh_um('NX-01','Enterprise').
eh_um('NCC-1701','Enterprise').
eh_um('NCC-1701-D','Enterprise').
eh_um('Voyager','Enterprise').
eh_um('Irwtmet','D-deridex').
eh_um('Enterprise','Nave').
eh_um('D-deridex','Nave').

pertence('Enterprise','Federação').
pertence('D-deridex','Império Romulano').
pertence('Voyager','Federação').

locomocao('Enterprise','Motor de Dobra').

% Predicado mágico pra andar na rede semântica.
getEquiv(X, Y) :-
	eh_um(X, Y) ;
	eh_um(X, Z), getEquiv(Z, Y).
	

comandante(Comm, Facc) :-
	comanda(Comm, Nave),
	(
		pertence(Nave, Facc) 
		;
	 	(
	 		not(pertence(Nave, Facc)), 
	 		getEquiv(Nave, Nave2),
	 		pertence(Nave2, Facc)
 		)
	).
	 
inimigos(Comm1, Comm2) :-
	comandante(Comm1, Faccao1),
	comandante(Comm2, Faccao2),
	Faccao1 \= Faccao2.

lista_inimigos(Comm1, List) :-
	findall(X, inimigos(Comm1,X), List).

lista_comandantes(Facc, List) :-
	findall(X, comandante(X, Facc), List).
	
nave(Nave, Facc) :-
	comanda(_, Nave),
	(
		pertence(Nave, Facc) 
		;
		getEquiv(Nave, Z), pertence(Z, Facc) 
	).

naves_por_faccao(Facc, Lista) :-
		setof(X, nave(X, Facc), Lista).

conta_naves :-
	write('Deseja contar as naves de qual faccao? '),
	read(Facc),
	naves_por_faccao(Facc, Ls),
	length(Ls, C),
	write('Possui '), write(C), write(' naves.'),
	nl.

comandantes_por_nave([], []).
comandantes_por_nave([Nave|Rest], [Comm|Rest2]) :-
	comanda(Comm, Nave),
	comandantes_por_nave(Rest, Rest2).
	

