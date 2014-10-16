star(sirius).
star(sol).
star(vega).
orbita(mercurio, sol).
orbita(venus, sol).
orbita(terra, sol).
orbita(marte, sol).
orbita(lua, terra).
orbita(phobos, marte).
orbita(deimos, marte).
planeta(B) :- orbita(B,sol).
satelite(B) :- orbita(B, P), planeta(P).

cometa(B) :- not(star(B)), not(planeta(B)), not(satelite(B)).
