Elias Valle
202173537-2


El codigo debe ser ejecutado usando SWI-Prolog, para llego abra SWI-Prolog, vaya a "file", seleccione "consult" y selecciones el codigo llamado "tarea.pl"

Posterior a eso se tendran los siguientes predicados a ejecutar:


-puedellegar(X, Y):

Descripción: Este predicado verifica si existe un camino desde el nodo X hasta el nodo Y en el grafo.

Funcionamiento: Utiliza el subpredicado camino(X, Y, Visitados) para determinar si hay un camino desde X hasta Y. El subpredicado se encarga de encontrar los vecinos del nodo actual X y realizar llamadas recursivas para explorar los posibles caminos hasta Y. Se evitan nodos repetidos utilizando la lista Visitados.


-vecinos(X, L):

Descripción: Este predicado devuelve en la lista L todos los vecinos del nodo X en el grafo.

Funcionamiento: Utiliza el predicado bagof/3 para recopilar en la lista L todos los nodos N para los cuales existe un camino desde X a N utilizando el predicado camino(X, N).


-caminovalido([_]) y caminovalido([X, Y | Resto]):

Descripción: Estos predicados verifican si una lista de nodos forma un camino válido en el grafo, es decir, si todos los nodos adyacentes en la lista son vecinos entre sí.

Funcionamiento: La primera regla, caminovalido([_]), establece que una lista de un solo elemento siempre se considera un camino válido. La segunda regla, caminovalido([X, Y | Resto]), verifica si el primer nodo X en la lista tiene vecinos, obtenidos mediante vecinos(X, Vecinos). Luego, verifica si el siguiente nodo Y en la lista es un miembro de la lista de vecinos Vecinos utilizando member(Y, Vecinos). Si se cumple esta condición, se realiza la llamada recursiva caminovalido([Y | Resto]) para verificar el resto de la lista. Este proceso se repite hasta que la lista se agota o se encuentra un par de nodos adyacentes que no son vecinos.