/* ------- BASE DE DADOS INICIAL -------- */

gosta(pedro,leitura).
gosta(maria,leitura).
gosta(paulo,leitura).
gosta(pedro,cinema).
gosta(paulo,cinema).
gosta(vera,cinema).
gosta(paulo,boliche).
gosta(maria,boliche).
gosta(vera,boliche).

gosta(paulo,X):-gosta(maria,X). /* Paulo gosta de tudo que Maria gosta */
/*paulo,leitura
paulo, boliche*/
gosta(pedro,X):-gosta(X,boliche). /* Pedro gosta de quem gosta de boliche */
/*pedro, paulo
pedro, maria
pedri,vera*/

gosta(pedro,boliche). /* Pedro gosta de boliche */
gosta(pedro,X):-gosta(X,X). /* Pedro gosta de qualquer um que goste de si mesmo */

combina(X,Y,Z):-gosta(X,Z),gosta(Y,Z), X\=Y,lista(X,Y,Z).
lista(X,Y,Z):-write(X), /* EXIBE RESULTADO DE UMA CONSULTA */
	write('_e_'),
	write(Y),
	write('_gostam_de_'),
	write(Z),
	nl. /*NL SIGNIFICA NOVA LINHA */


lista_todos:-gosta(X,Y), /*EXIBE RESULTADOS DE TODAS CONSULTAS*/
	write(X),
	write('_gosta_de_'),
	write(Y),nl,
	fail.

/* ------ FIM BASE DE DADOS ------- */

