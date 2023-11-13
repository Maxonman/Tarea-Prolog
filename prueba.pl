vecino(a, b).
vecino(a, c).
vecino(a, e).
vecino(b, c).
vecino(c, d).
vecino(c, e).
vecino(e, b).
vecino(f, b).
vecino(f, e).
vecino(f, g).
vecino(g, e).
vecino(h, i).
vecino(h, g).
vecino(h, j).
vecino(i, g).
vecino(j, g).
vecino(j, i).


% Descripción: Verifica si existe un camino desde el nodo X hasta el nodo Y en un grafo.
puedellegar(X, Y) :-
    setof(X, camino(X, Y, [X]), Resultado),
    member(E, Resultado),
    (E = X ; E = Y).

camino(X, Y, Visitados) :-
    vecino(X, Z),
    \+ member(Z, Visitados),
    (Z = Y ; camino(Z, Y, [Z|Visitados])).






% Descripción: Este predicado devuelve en la lista L todos los vecinos del nodo X en el grafo.
vecinos(X, L) :- bagof(N, vecino(X, N), L).




% Descripción: Estos predicados verifican si una lista de nodos forma un camino válido en el grafo, es decir, si todos los nodos adyacentes en la lista son vecinos entre sí.
caminovalido([_]).  

caminovalido([X, Y | Resto]) :- 
    vecinos(X, Vecinos),
    member(Y, Vecinos),
    caminovalido([Y | Resto]).




