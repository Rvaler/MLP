
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


lista_todos:-gosta(X,Y),write(X),write('_e_'),write(Y),nl,fail.

/* ------ FIM BASE DE DADOS ------- */


/*

 1.2.3)  gosta(pedro,X).
O programa entra em loop porque pedro gosta de si mesmo ao gostar de
boliche

1.2.5
Entra novamente em loop ao identificar X e Y como iguais a Pedro,
identificar um gosto comum (Z) também igual a pedro.

1.2.7
Na minha maquina explode a memoria, entra em loop também, no entanto
mostra resultados de pares de pssoas que gostam da mesma coisa, não
podendo ser X=Y.

1.3.2
Agora vai armazenando o X,Y e Z em uma lista, e apoós achar a relação
das 3 variáveis que são aceitas para essa consulta libera na tela várias
mensagens que explicam o valor das variáveis

1.3.4
Agora o resultado é somente um valor booleano, indicando se ele consegue encontrar um resultado que satisfaça a premissa

1.3.5
Ocorre erro, visto que lista_todos definido até o momento não espera a passagem de nenhum "argumento", sua chamada ocorre somente com "lista_todos." e não "lista_todos(X,Y)."

1.3.6
O uso de fail irá provocar uma premissa falha, fazendo com que sem que o usuário precise apertar a tecla espaço, ele retorne buscando uma resultado que satisfaça

*/
