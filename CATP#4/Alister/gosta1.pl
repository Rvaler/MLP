gosta(pedro, leitura).
gosta(maria, leitura).
gosta(paulo, leitura).
gosta(pedro, cinema).
gosta(paulo, cinema).
gosta(vera, cinema).
gosta(paulo, boliche).
gosta(maria, boliche).
gosta(vera, boliche).

gosta(paulo, X) :- gosta(maria, X).			% (1)
gosta(pedro, X) :- gosta(X, boliche).		% (2)
