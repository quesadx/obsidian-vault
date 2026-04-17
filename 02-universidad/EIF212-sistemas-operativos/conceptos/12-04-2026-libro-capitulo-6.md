---
Fecha: 15-04-2026
moc: "[[moc-sistemas-operativos]]"
---

# Capítulo 6

Concurrencia. Condiciones de carrera (race conditions). Sincronización. Acceso a recursos. 

## 1. Problema de la sección crítica

Es la parte de código de un proceso donde se acceden a recursos compartidos. Para que este sistema funcione, se tine que regir un protocolo:

- Exclusión mutua: si un proceso está en su sección crítica, ningún otro proceso puede estarlo.
- Progreso: Si no hay nadie en la sección crítica, la desición de quién entra tiene que ser tomada de inmediado y solo por procesos.
- Espera limitada: No puede haber procesos esperando indefinidamente.

---

## 2. Soluciones de software y hardware

La solución de software refiere a la `solución de Peterson`:

### Peterson

La solución de Peterson es un algoritmo clásico para lograr exclusión mutua entre dos procesos sin utilizar hardware especial. Cada proceso mantiene dos variables compartidas:

- `flag[i]`: indica si el proceso `i` desea entrar a la sección crítica.
- `turn`: indica de quién es el turno para entrar si ambos quieren acceder al recurso.

El protocolo general es:

1. El proceso `i` pone `flag[i] = true` para indicar intención.
2. Fija `turn = j` para ceder el paso al otro proceso.
3. Espera mientras `flag[j]` sea verdadero y `turn == j`.
4. Entra a la sección crítica cuando la condición de espera ya no se cumple.
5. Al salir, pone `flag[i] = false`.

Con esto, Peterson cumple:

- Exclusión mutua: nunca hay dos procesos en la sección crítica al mismo tiempo.
- Progreso: si un proceso quiere entrar y el otro no está interesado, el primero entra rápidamente.
- Espera limitada: un proceso no se queda esperando indefinidamente porque el turno alterna y el otro proceso debe salir.

Esta solución es importante porque demuestra que se puede sincronizar correctamente con comunicación simple entre procesos y sin instrucciones de hardware especiales.

### Hardware de sync

Instrucciones que permiten leer o escribir atómicamente. Son herramientas de hardware que el SO utiliza para crear locks.
- Swap() = `caja fuerte`
- TestAndSet()

---

## 3. Semáforos

Es un gestor de colas, que evita la espera activa y organiza los procesos en una espera activa, apagándolos hasta que llegan a su turno.

- `Espera activa`: Tiempo en el que un proceso usa el CPU mientras está esperando a ser ejecutado. Básicamete preguntándole a ver si puede ser ejecutado. 

El semáforo les avisa cuando ya pueden ser ejecutados.

### Mutex

Es un semáfoto binario. Funciona como una llave de acceso para que un proceso entre a su sección crítica. 

---

## 4. Monitores

Son la evolución de los semáforos. Estructuras de alto nivel que el compilador maneja para asegurar la exclusión mutua. Asegura que solo haya un proceso activo en él a la vez.

- Datos compartidos
- Métodos de sincronización
- Operaciones atómicas sobre estos datos

## 5. Condiciones de carrera

Cuandos varios procesos acceder o manipulan los datos de forma concurrente, el resultado depende del orden de ejecución.

Es una falla que ocurre cuando el resultado final de un proceso depende del orden específico o de la velocidad en la que se ejecutan hilos o procesos. Ocurren cuando dos o más procesos intentan tocar un recurso compartido.

---

# “El Rey Nunca Comparte”

- **E** → Exclusión mutua
- **R** → Retención y espera
- **N** → No apropiación
- **C** → Circular

Generalmente se quita la circular para proponer un orden gerárquico.