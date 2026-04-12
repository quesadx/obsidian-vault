---
Fecha: 2026-03-26
moc: "[[moc-sistemas-operativos]]"
---
# Definiciones base

- **Tiempo de respuesta:** Calculado sumando tanto el tiempo de ejecución real junto al tiempo de espera desde que se hizo el llamado del proceso.
- **Tiempo de espera:** El tiempo de espera se calcula en base a los espacios en blanco que tuvo el proceso desde que se llamó -> hasta que se terminó.
- **Penalización:** Tiempo de respuesta / tiempo de ejecución asociado al proceso (el que está en la tablita).

## Parámetros y medidas a evaluar

- **Quantum (q):** intervalo de tiempo de ejecución.
- **Tiempo de creación (C):** tiempo que tarda un proces en pasar de 'Nuevo' a 'Listo'.
- **Tiempo o Ráfaga de CPU (t):** tiempo que un proceso está en 'Ejecutando'.

>**Nota**:
>Los promedios se sacan de forma usual. La idea principal de todo es minimizar los tiempos de respuesta, espera y penalización.

---
# Algoritmos de planificación apropiativos

Se proporciona acceso al recurso para un proceso, pero, en un determinado momento, se puede ceder el recurso para un proceso diferente.

## Round-Robin

El `q` o `quantum` representa el tiempo que consume un turno (en términos de ciclos de reloj). Existe, como tal, una cola de procesos en asociación a prioridad.

## SRTF (Short Remaining Time First)

Es una cola pero, se ejecuta el del menor tiempo de ejecución restante a continuación. 

termina en 86 es 4x4 y el otro 4x2

---

# Algoritmos de planificación no-apropiativos

Una vez que el proceso accede al recurso, se permite que haga uso de él hasta que ya no lo necesite.

## FCFS (First to Come, First to Serve)

Es el más simple. Llega el proceso y absorbe `t` tiempo de ejecución a medida que llegan (sin sobreponerse uno encima de otro). 

## SJF (Shortest Job First)

Es la misma filosofía de FCFS, pero, la cola de prioridad se ve adelantada para aquellos procesos que consumen menos tiempo.    k
## Asignación por prioridades

Tiene un tiempo de prioridad pre-asignado. Se hace una cola similar al FCFS pero, se ejecuta el proceso con más prioridad y, si hay más de uno igual, se ejecuta el que tenga menos tiempo de ejecución.



