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

lista_todos :- gosta(X,Y), write(X), write(' e '), write(Y), nl, fail.
