---
Fecha: 13-04-2026
moc: "[[moc-sistemas-operativos]]"
---

# Capítulo 3

Un proceso es un programa cargado en memoria y en ejecución. Un programa es una entidad pasiva.

## PCB

- `PCB` significa `Process Control Block`.
- Es la estructura de datos que el sistema operativo usa para representar y controlar cada proceso.
- Contiene toda la información necesaria para gestionar la ejecución, cambiar de contexto y reanudar el proceso.

### Campos principales del PCB

- `PID` (Process ID): identificador único del proceso.
- `Estado`: estado actual del proceso, por ejemplo `new`, `ready`, `running`, `waiting` o `terminated`.
- `Contadores de programas`: dirección de la siguiente instrucción a ejecutar.
- `Registros de CPU`: valores de los registros cuando el proceso está en espera.
- `Información de memoria`: tablas de páginas, segmentos, límites y punteros al espacio de direcciones.
- `Información de E/S`: dispositivos abiertos, solicitudes pendientes y colas de E/S.
- `Información de contabilidad`: uso de CPU, tiempo de inicio, tiempo de ejecución y límites.
- `Prioridad`: valor que ayuda al planificador a decidir qué proceso ejecutar.

### Función del PCB

- Permite al sistema operativo hacer `cambio de contexto` entre procesos.
- Mantiene el estado completo del proceso cuando es interrumpido.
- Guarda la información que necesita el planificador para ordenar la ejecución.
- Facilita la `administración de procesos`, la E/S y el error control.

### Idea clave

El `PCB` es la ficha del proceso dentro del SO: sin él, el kernel no podría seguir el estado ni reanudar correctamente un proceso.


