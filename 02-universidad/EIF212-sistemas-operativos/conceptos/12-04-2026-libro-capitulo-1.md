---
Fecha: 12-04-2026
moc: "[[moc-sistemas-operativos]]"
---

# Capítulo 1

## Sistema Operativo

Un `sistema operativo` es el software base que gestiona el `hardware`, habilita la ejecución de aplicaciones y ofrece una interfaz abstracta al usuario.

- Administra recursos: entrada/salida, `memoria`, `CPU` y control de procesos.
- Proporciona servicios básicos como gestión de archivos, comunicación entre procesos y control de dispositivos.

## Kernel

El `kernel` es el componente central del `sistema operativo`. Es el único programa que se ejecuta de forma privilegiada y permanente, con acceso directo al `hardware`.

- Controla el acceso a `memoria` y registros del `CPU`.
- Gestiona interrupciones y llamadas al sistema (`syscalls`).
- Coordina la ejecución de procesos y el acceso a dispositivos.

### Interrupciones

Una interrupción es un evento que altera el flujo normal de ejecución del CPU.

Proceso típico de manejo de interrupciones:

1. Guardar el estado actual del procesador.
2. Consultar el vector de interrupciones.
3. Ejecutar la rutina asociada a la interrupción.
4. Restaurar el estado anterior y continuar la ejecución.

Tipos de interrupciones:

| Interrupción          | Descripción                                                                                                                                                                                                        |
| --------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| Hardware / Asíncrona  | Generada por dispositivos externos. Ocurre en cualquier momento y no está sincronizada con el flujo del programa en ejecución.                                                                                     |
| Software / Síncrona   | Producida por el propio programa, como traps o excepciones. Está sincronizada con la ejecución del código y se activa desde dentro del proceso.                                                                   |

### DMA (Direct Memory Access)

`DMA` permite la transferencia directa de datos entre un dispositivo y la `memoria RAM` sin intervención continua del `CPU`.

- Reduce la carga del procesador.
- Mejora el rendimiento en operaciones de `E/S` grandes.

---

## Organización y Arquitectura

### Jerarquía de almacenamiento

Los sistemas de almacenamiento se organizan según:

- Velocidad
- Costo
- Volatilidad

A mayor velocidad, generalmente mayor costo y menor capacidad. Por el contrario, los medios más lentos suelen ser más económicos y ofrecer mayor capacidad.

Orden típico de la jerarquía:

- `Registros` de `CPU`
- `Memoria caché` (`SRAM`)
- `Memoria principal` (`DRAM`)
- `Almacenamiento no volátil` (`SSD`/`HDD`)

### Sistemas multiprocesador

Un sistema `multiprocesador` contiene varias `CPU`s o núcleos capaces de ejecutar procesos en paralelo.

- Simétrico (`SMP`): todos los procesadores comparten `memoria` y recursos de forma uniforme.
  - Cada `CPU` puede ejecutar procesos simultáneamente.
  - Se utiliza `balanceo de carga` para distribuir el trabajo.
  - `Push migration`: un procesador con carga alta mueve procesos a otros menos ocupados.
  - `Pull migration`: un procesador ocioso toma procesos de la cola de otros procesadores.

- Asimétrico (`AMP`): los procesadores tienen funciones especializadas o roles fijos, y no siempre comparten la carga de trabajo de forma uniforme.

En sistemas SMP, el objetivo es maximizar el uso de todos los procesadores mientras se evita la congestión y el desequilibrio de carga.

### Clustering

Varias computadoras conectadas a través de `LAN` que comparten `memoria`. Usados para asegurar alta disponibilidad.

- Simétrico: Todos ejecutan en paralelo.
- Asimétrico: Un nodo en `hot-standby` que monitorea el nodo activo para hacerle `relay`.

---

## Conceptos de operación cruciales

### Multiprogramación

La `multiprogramación` permite que la `CPU` tenga siempre un proceso listo para ejecutar mientras otros están esperando `E/S`. Los procesos se mantienen en una cola de trabajos o `job pool` y el `sistema operativo` alterna entre ellos para maximizar el uso del procesador.

- Objetivo: reducir el tiempo de inactividad de la CPU.
- El sistema mantiene varios procesos en memoria principal y cambia rápidamente entre ellos.
- No garantiza respuesta interactiva rápida, pero sí mayor rendimiento global.

### Tiempo compartido

En un sistema de `tiempo compartido`, cada proceso recibe una porción fija de tiempo llamada `quantum`.

- El `CPU` ejecuta un proceso durante el `quantum` y luego cambia a otro proceso.
- Este cambio frecuente hace que varios procesos parezcan ejecutarse al mismo tiempo.
- El objetivo es mejorar la experiencia del usuario dando respuesta rápida y equitativa.

- Si un proceso no termina en su `quantum`, vuelve a la cola y espera su siguiente turno.
- Un `quantum` demasiado corto aumenta la sobrecarga de cambios de contexto; uno demasiado largo afecta la interactividad.

### Modo dual

El `hardware` utiliza un `modo dual` para proteger al `sistema operativo` y al `hardware` de las aplicaciones de usuario.

- `Modo usuario`: es el modo en que se ejecutan las aplicaciones normales. Tiene acceso limitado y no puede ejecutar instrucciones privilegiadas ni acceder directamente al `hardware`.
- `Modo kernel`: es el modo en el que se ejecuta el `núcleo` del `sistema operativo`. Tiene acceso completo a recursos del sistema, `memoria` protegida y dispositivos.

El cambio entre ambos modos se controla con un `bit` de estado interno del `CPU`. Cuando se ejecuta una `llamada al sistema` o ocurre una `interrupción`, el procesador cambia de `modo usuario` a `modo kernel`.

Ejemplos:

- Lectura de un archivo: un programa en modo usuario solicita la operación, pasa a modo kernel para que el sistema operativo lea el disco y luego vuelve a modo usuario con el resultado.
- Manejo de interrupciones: al recibir una interrupción de teclado, el CPU cambia a modo kernel para ejecutar el controlador y luego regresa al proceso de usuario.

Este mecanismo evita que un programa malicioso o defectuoso tome control completo del sistema o acceda a información protegida.

---

## Gestion de procesos y memoria

### Procesos

Programa en ejecución, con contador del programa y estado actual.

### Memoria virtual

Permite ejecutar procesos que no estan completamente cargados en la memoria física.

---

## Sistemas especializados

### Sistemas embebidos en tiempo real (`RTOS`)

Son sistemas con restricciones de tiempo estrictas: las respuestas deben completarse dentro de un plazo definido.

- Ejemplos: `marcapasos`, `frenos ABS`, control de motores en robots.
- Característica clave: predictibilidad y baja latencia, no solo velocidad.

### Sistemas multimedia

Están diseñados para procesar audio y video con restricciones de calidad y tiempo.

- Ejemplo: `decodificador de televisión`, reproductor de video, sistemas de videoconferencia.
- Deben garantizar entrega continua y sincronización entre audio y video.

### Hand-held systems

Son dispositivos móviles con recursos limitados y dependientes de batería.

- Ejemplo: `teléfonos móviles`, `tablets`, `relojes inteligentes`.
- Requieren optimización de `energía`, `memoria` y rendimiento en tiempo real.

---

## Entornos informáticos

### Cliente-Servidor

Arquitectura en la que un `cliente` solicita servicios a un `servidor` central.

- El servidor ofrece recursos, datos o funcionalidades.
- El cliente consume el servicio y presenta la información al usuario.
- Ejemplo: un navegador web (`cliente`) que carga páginas desde un servidor web.
- Otros ejemplos: `correo electrónico`, `bancos en línea`, `APIs REST`.

### P2P

Arquitectura `peer-to-peer` en la que cada nodo puede actuar como cliente y servidor a la vez.

- No hay un servidor central único.
- Cada participante comparte recursos directamente con otros nodos.
- Ejemplo: `BitTorrent` para intercambio de archivos.
- Ejemplo: redes de mensajería descentralizada o algunas aplicaciones de `VoIP`.

Ventajas:

- Mayor tolerancia a fallos.
- Escalabilidad horizontal.

Desventajas:

- Mayor complejidad de coordinación.
- Requiere mecanismos de seguridad y autenticación distribuidos.

### Sistemas distribuidos

Son sistemas formados por múltiples computadoras conectadas por una red que colaboran para resolver una tarea común.

- No comparten `memoria` física directamente.
- Cada nodo tiene su propia `memoria` local y se comunican mediante `mensajes` o `red`.
- La coherencia de datos se logra con protocolos de comunicación y sincronización, no con una memoria compartida común.

Ejemplos:

- `Cluster` de servidores web.
- Base de datos distribuida.
- Plataforma de microservicios.

Diferencia clave con `clustering` y `multiprocesador`:

- En un `multiprocesador` los núcleos pueden compartir `memoria` física directa.
- En un `cluster` puede haber memoria compartida si está basado en `shared memory` dentro de una red local, pero en general la colaboración se hace por red.
- En un `sistema distribuido` típico, cada máquina tiene su propia `memoria` y coopera usando `mensajes`.

### Entornos basados en la web

Son entornos en los que la `interfaz`, el `procesamiento` o los `datos` se entregan a través de un navegador web o de servicios HTTP.

- El cliente es generalmente un `navegador web` o una `app web`.
- El servidor expone interfaces mediante `HTTP`, `HTTPS` y APIs como `REST` o `GraphQL`.
- El sistema operativo en este contexto debe soportar navegación segura, gestión de sesiones y servicios de red.

Ejemplos:

- Sitios web dinámicos y aplicaciones web (`web apps`).
- Plataformas `SaaS` (Software as a Service).
- Servicios en la nube accesibles desde un navegador.

Características clave:

- Interacción basada en `requests`/`responses`.
- La lógica puede residir en el cliente (`frontend`) y/o en el servidor (`backend`).
- Escalabilidad y disponibilidad son importantes, ya que múltiples usuarios acceden simultáneamente.

Relación con otros entornos:

- Es una variante de `arquitectura cliente-servidor` donde el cliente principal es un navegador.
- Puede combinarse con sistemas `distribuidos` y `P2P` en la capa de servicio o contenido.

---

# Detalles técnicos

## Bootstrap

El `bootstrap` es el proceso de arranque del sistema operativo, iniciado por el firmware del equipo.

- El firmware (`BIOS` o `UEFI`) ejecuta un pequeño programa de inicio.
- Ese programa localiza el `kernel` en el dispositivo de arranque (por ejemplo, disco duro, SSD o USB).
- El `kernel` se carga en `memoria` y el control se transfiere a él.
- El kernel inicializa los componentes del sistema y lanza el proceso `init` o su equivalente.

En otras palabras, `bootstrap` es el primer paso para pasar del hardware apagado al `sistema operativo` en ejecución.

Ejemplo:

- En un PC moderno, el `UEFI` carga un `bootloader` como `GRUB`.
- El `bootloader` encuentra y carga el `kernel` de Linux, que luego continúa con el arranque del sistema.

---

## Protección por temporizador

Es un dispositivo de hardware que genera una interrupción después de un tiempo determinado. Evita que un proceso cuelgue el sistema.


