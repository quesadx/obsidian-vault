---
Fecha: 23-04-2026
moc: "[[moc-sistemas-operativos]]"
---
# Segmentación

## 1. Concepto
 
La segmentación organiza la memoria basándose en la visión del programador. En ese sentido, la memoria no se analiza como una lista infinita de bytes, sino como:

- Un programa
- Una función
- Bloques para variables locales y globales

Cada uno de esos bloques es un segmento, y cada segmento puede tener un tamaño distinto. Esto significa que la memoria se divide en partes lógicas que reflejan la estructura del programa.

En contraste, la paginación utiliza unidades de tamaño fijo llamadas páginas, mientras que en segmentación la unidad lógica del programa puede ser de tamaño variable.

## 2. La Dirección Lógica

Para acceder a datos en un sistema segmentado se usan dos componentes: el `Número de segmento (s)` y el `Desplazamiento (d)`.

- Número de segmento (s): Es un entero que identifica una entrada en la Tabla de Segmentos.
	- Función: Seleccionar la fila correspondiente en la tabla.
	- Contenido: Esa fila indica la dirección física donde comienza el segmento (base) y su tamaño máximo (límite).
	- Limitación: La cantidad de bits reservados para s en el procesador define cuántos segmentos puede tener un proceso.

- Desplazamiento (d): Es la posición del dato dentro del segmento seleccionado.
	- Rango: Debe estar entre `0` y `límite - 1`.
	- Función: Se suma a la dirección base para obtener la dirección física final.
	- Seguridad: Antes de sumar, la Unidad de Gestión de Memoria (MMU) compara d con el límite del segmento. Si d es mayor o igual al límite, el hardware produce una excepción de segmentación y bloquea el acceso.

![[Pasted image 20260423180636.png]]