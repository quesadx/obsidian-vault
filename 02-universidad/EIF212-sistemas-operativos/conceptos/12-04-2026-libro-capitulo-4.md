---
Fecha: 13-04-2026
moc: "[[moc-sistemas-operativos]]"
---

# Capítulo 4

## Hilo

Un hilo es la unidad básica de utilización de la CPU. Comprende:

- ID de hebra
- Contador de programa
- Conjunto de registros
- Pila

Características clave: Los hilos de un mismo proceso comparten:

- Sección de código
- Sección de datos
- Recursos del SO (archivos abiertos, señales)

Diferencia proceso/hilo: Un proceso tradicional tiene un solo hilo; un proceso multihilo puede ejecutar múltiples tareas concurrentemente dentro de un mismo espacio de direcciones.

### Motivación y Ventajas

Casos de uso típicos:
- Navegadores web (un hilo para UI, otra para carga de red)
- Servidores web atendiendo múltiples clientes concurrentes
- Servidores RPC/RMI
- kernels multihilo

---

## Posibles preguntas

