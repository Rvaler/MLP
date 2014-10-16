gosta(pedro, leitura).
gosta(maria, leitura).
gosta(paulo, leitura).
gosta(pedro, cinema).
gosta(paulo, cinema).
gosta(vera, cinema).
gosta(paulo, boliche).
gosta(maria, boliche).
gosta(vera, boliche).
gosta(pedro, boliche).

gosta(paulo, X) :- gosta(maria, X).			% (1)
gosta(pedro, X) :- gosta(X, boliche).		% (2)
gosta(pedro, X) :- gosta(X, X).				% (3)

combina(X,Y,Z) :- gosta(X, Z), gosta(Y, Z), X\=Y, lista(X,Y,Z).
lista(X,Y,Z) :- write(X),
				write(' e '),
				write(Y),
				write(' gostam de '),
				write(Z),
				nl.

lista_todos :- gosta(X,Y), write(X), write(' gosta de '), write(Y), nl, fail.

preco(cinema, 11.0).
preco(leitura, 0).
preco(boliche, 15.0).

gasto(X,Y,Z) :- gosta(X, Z), gosta(Y, Z), X \= Y,
				preco(Z, P), T is P*2, write('Gasto para dois = '), write(T), nl.

custo(Pessoa, Activ) :- gosta(Pessoa, Activ), preco(Activ, Price),
						write('Gasto = '), write(Price), nl.
						

convidar(X,Y,Z,V) :- gosta(X, Z), gosta(Y, Z), X \= Y, 
					 preco(Z, P), T is P*2, T < V,
					 write('Ok, o valor para dois = '), write(T), nl.
