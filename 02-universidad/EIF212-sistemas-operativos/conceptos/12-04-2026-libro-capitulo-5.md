---
Fecha: 13-04-2026
moc: "[[moc-sistemas-operativos]]"
---

# Capítulo 5

## 1. CONCEPTOS BÁSICOS

### Ciclo de Ráfagas CPU/I/O

Los procesos alternan entre ráfagas de ejecución y ráfagas de I/O (espera). Suelen ser en distribución exponencial: muchas cortas, pocas largas.

- Objetivo (`multiprogramación`): Mantener la CPU ocupada asignándole procesos que estaban listos mientras otros esperan.

### Planficador a corto plazo

- Contiene los PCBs listos para ejecutarse (en FIFO, Árbol, etc...)
- Selecciona qué proesos de esa cola obtienen el CPU
- Da control al CPU haciendo el context switch

#### Apropativa vs. No-apropiativa

- No-apropiativa:
  - El proceso en ejecución mantiene la CPU hasta que termina su ráfaga o pasa a espera por I/O.
  - El planificador no retira la CPU de un proceso activo aunque llegue uno nuevo más corto o de mayor prioridad.
  - Ejemplos: FCFS, SJF no-apropiativa, prioridad no-apropiativa.
  - Ventaja: menos cambios de contexto y menor sobrecarga.
  - Desventaja: puede causar tiempos de espera largos y efecto convoy cuando un proceso largo bloquea a los demás.

- Apropativa:
  - El planificador puede interrumpir un proceso en ejecución para asignar la CPU a otro listo.
  - La interrupción ocurre cuando llega un proceso nuevo, se completa una ráfaga de I/O, expira un quantum, o cambia la prioridad.
  - Ejemplos: Round Robin, SJF apropativa, prioridad apropativa, Multilevel Feedback Queue.
  - Ventaja: mejor tiempo de respuesta y menos latencia para procesos cortos o interactivos.
  - Desventaja: más cambios de contexto y mayor overhead del planificador.

Comparación clave:
- La planificación no-apropiativa es más simple y estable, pero puede ser injusta para procesos cortos.
- La aproximativa permite mayor reactividad y utiliza mejor la multiprogramación, pero requiere más cuidado con la inanición y el coste de context switch.

---

## 2. Algoritmos de Planificación (Apropiativos y No-apropiativos)

- FCFS (First-Come, First-Served): no-apropiativo
- SJF (Shortest Job First): puede ser no-apropiativo o apropativo
- Round Robin: apropativo
- Prioridad: puede ser no-apropiativo o apropativo

---

## 3. Colas Multinivel
Una cola multinivel divide los procesos en varios grupos (colas) con distinta prioridad. La CPU siempre atiende primero las colas de mayor prioridad.

### Multilevel Queue (MLQ)

Cada proceso se asigna a una cola fija (no cambia).
Ejemplo: interactivos, sistema, batch.
Cada cola puede usar su propio algoritmo (RR, FCFS, etc.).
Las colas altas pueden bloquear completamente a las bajas.

### Multilevel Feedback Queue (MLFQ)

Los procesos sí se mueven entre colas.
Si usan mucho CPU → bajan de prioridad.
Si esperan mucho → suben de prioridad.
Favorece procesos cortos/interactivos y evita que otros queden olvidados.

### Resumen rápido

MLQ: estático, simple, menos flexible.
MLFQ: dinámico, más complejo, mejor comportamiento general.

---

## 4. Planificación Multiprocesador

### Asimétrica

Corresponde a la definición maestro-exclavos. Donde, un procesador actúa como maestro, orquestrando a los demás.

### Simétrica (SMP)

Adjunta consigo a la definción de que, cada procesador se autoplanifica. Es escalable y usado en sistemas modernos.

#### Afinidad

- Problema al migrar procesos entre CPUs:
  - Si un proceso se mueve de CPU1 a CPU2, la caché de CPU1 queda inválida.
  - La caché de CPU2 debe rellenarse con los datos del proceso.
  - Esto provoca un costo de rendimiento alto por pérdida de localidad de referencia.

- Solución: afinidad al procesador
  - Afinidad suave (soft affinity): el sistema trata de mantener el proceso en la misma CPU cuando sea posible, pero no lo obliga.
    - Ventaja: flexibilidad y mejor balance de carga.
    - Desventaja: el proceso aún puede migrar si el sistema lo necesita.
  - Afinidad dura (hard affinity): el proceso declara que no debe migrar de CPU.
    - En Linux se hace con llamadas al sistema que fijan el proceso a un conjunto de CPUs.
    - Ventaja: mantiene la caché caliente y evita migraciones costosas.
    - Desventaja: reduce la capacidad del planificador para distribuir carga.

- Cuando usar cada una:
  - Afinidad suave: útil en sistemas SMP donde la carga puede cambiar, pero se quiere preferir la misma CPU.
  - Afinidad dura: útil para procesos críticos de rendimiento que requieren datos en caché o control estricto de CPU.


