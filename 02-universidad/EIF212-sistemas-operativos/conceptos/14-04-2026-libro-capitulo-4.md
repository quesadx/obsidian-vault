---
Fecha: 13-04-2026
moc: "[[moc-sistemas-operativos]]"
---

# Capítulo 4

## Hilo

Un hilo (thread) es la unidad básica de ejecución que utiliza la CPU dentro de un proceso. Cada hilo tiene su propio estado de ejecución y contiene:

- ID de hilo
- Contador de programa (PC)
- Conjunto de registros
- Pila propia

A diferencia de un proceso, un hilo no tiene su propio espacio de direcciones independiente: pertenece a un proceso y comparte con otros hilos del mismo proceso gran parte de su entorno.

### Hilo vs Proceso

- Proceso:
  - Tiene su propio espacio de memoria y recursos (código, datos, heap, pila principal).
  - Es una instancia de un programa en ejecución.
  - Puede contener uno o varios hilos.
  - El cambio de contexto entre procesos es más costoso.

- Hilo:
  - Comparte el espacio de direcciones del proceso padre.
  - Tiene su propia pila y registros.
  - Comparte con los otros hilos del mismo proceso:
    - Sección de código
    - Sección de datos
    - Recursos del SO (archivos abiertos, señales, descriptores, tablas de páginas)
  - No comparte la pila ni los registros con otros hilos.

### Qué comparte y qué no comparte un hilo

Comparte:
- Código ejecutable
- Datos globales y variables estáticas
- Recursos del sistema operativo (archivos abiertos, sockets, señales)
- Heap compartido

No comparte:
- Pila propia
- Contador de programa
- Registros CPU
- Contexto de ejecución local

### Motivación y ventajas de usar hilos

- Permitir concurrencia dentro del mismo proceso.
- Mejorar la capacidad de respuesta de aplicaciones interactivas.
- Aprovechar mejor CPUs multicore con paralelismo real.
- Reducir overhead de creación y cambio de contexto comparado con procesos.
- Facilitar la reutilización de datos y recursos sin necesidad de comunicación entre procesos.

---

### Modelos de hilos

#### Modelo muchos-a-uno

Es el contexto donde muchos hilos de usuario se mapean a un solo hilo de kernel. Si se bloquea un hilo, se bloquea todo.

#### Modelo uno-a-uno

Cada uno de los hilos de usuario van a tener un hilo de kernel mapeado, lo que logra una mayor concurrencia. Linux y Windows lo usan. Tiene un detalle: crear un hilo de usuario requiere crear un hilo de kernel.

#### Modelo muchos-a-muchos

Muchos hilos de usuario se mapean a muchos hilos de kernel; pero pueden haber menos de kernel que de usuario. Es el más complejo.

### Consideraciones en programación

#### Cancelación de hilos

Hay diferentes formas de cancelar hilos:
- Asincrónica:
- Diferida: El hilo revisa de forma periodica si puede terminar.

---

### Ejemplos reales

- Navegadores web:
  - Un hilo para la interfaz gráfica (UI)
  - Otro hilo para descargas y red
  - Otro hilo para ejecutar JavaScript
- Servidores web:
  - Cada petición HTTP puede ser atendida por un hilo diferente.
- Aplicaciones multimedia:
  - Un hilo para reproducción de audio
  - Otro hilo para decodificación de video
  - Otro hilo para eventos de usuario
- Bases de datos y servidores de aplicaciones:
  - Un hilo por conexión o transacción
- Sistemas operativos:
  - El kernel usa hilos para manejar interrupciones, planificador, drivers y servicios en paralelo.

---

### Posibles preguntas

- ¿Qué es un hilo y en qué se diferencia de un proceso?
- ¿Qué información guarda un hilo y qué recursos comparte con otros hilos?
- ¿Por qué un proceso multihilo puede ser más eficiente que varios procesos independientes?
- Da ejemplos de aplicaciones que se benefician de la multihilación.
- ¿Qué partes del proceso no se comparten entre hilos?
- ¿Qué ventaja tiene usar hilos para la interacción de un programa con el usuario?
- ¿Qué significa que un proceso multihilo tenga un mismo espacio de direcciones?
- ¿Cuál es la diferencia entre cambio de contexto de hilo y cambio de contexto de proceso?


