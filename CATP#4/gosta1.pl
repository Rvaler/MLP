/* BASE DE DADOS INICIAL */

gosta(pedro,leitura).
gosta(maria,leitura).
gosta(paulo,leitura).
gosta(pedro,cinema).
gosta(paulo,cinema).
gosta(vera,cinema).
gosta(paulo,boliche).
gosta(maria,boliche).
gosta(vera,boliche).

/* 1.1.3 */
gosta(paulo,X):-gosta(maria,X). /* Paulo gosta de tudo que Maria gosta */
/*paulo,leitura
paulo,boliche*/
gosta(pedro,X):-gosta(X,boliche). /* Pedro gosta de quem gosta de boliche */

/*pedro,paulo
pedro,maria
pedro,vera
pedro,paulo 
*/

/*1.1.4
Quando realizada a consulta "gosta(pedro,X).", seu retorno são todas as
atividades de que pedro gosta de realizar, além disso, retorna todas
pessoas que gostam de boliche. Depois disso retorna paulo mais uma vez,
já que este, assim como Maria, gosta de boliche */



