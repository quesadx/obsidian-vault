---
Fecha: 2026-03-22
moc: "[[moc-bases-de-datos]]"
---
# 1. i-examen

## 1.1 Explique en qué consiste un gestor de bases de datos

Un gestor gestor de bases de datos (DBMS) es un software que permite crear, administrar, manipular y controlar el acceso a una base de datos.

## 1.2 Explique qué son los DML y los DDL, dé un ejemplo de cada uno de ellos

DML es el lenguaje de definición de datos, permite hacer consultas y manipular los datos contenidos en las estructuras de datos: `INSERT, DELETE, UPDATE`.

DDL corresponde al lenguaje de modelado de datos. Permite, como tal, modelar la estructura de la base de datos: `CREATE, ALTER, DROP`.

## 1.3 Explique qué es la arquitectura de la base de datos

- Externo: la parte con la que interactúa el usuario.
- Conceptual: la estructura lógica global.
- Interno: cómo se almacenan físicamente los datos.

## 1.4 Explique tres tipos de usuarios, que pueden definirse en base de datos

- DBA: gestiona y controla toda la BD.
- Desarrollador: crea consultas y aplicaciones.
- Usuario final: solo consulta o ingresa datos.

## 1.5 Explique la importancia del Gestor de Transacciones

Proporciona seguridad, atomicidad y manejo de concurrencia (+ aislamiento) a la hora de ejecutar cargas transaccionales en la base de datos.

Garantiza que las operaciones se completen de forma segura, consistente y completa, siguiento las propiedades ACID:

- Atomicidad
- Consistencia
- Isolamiento
- Durabilidad

## 1.6 Explique la importancia del Gestor de Almacenamiento

Gestiona cómo se leen y guardan los datos en el disco, garantizando eficiencia, uso óptimo del espacio y velocidad de las operaciones de lectura/escritura.
# 2. examen-2024

Uno de los problemas previo a los gestores de bases de datos correspondía  a la actualización por medio de los procedimientos almacenados.
Un DBA es encagado de monitorear el espacio libre en el disco, supervisión y revisión de las copias y/o respaldos de la B.D.

El gestor de recuperación es el encargado de garantizar que la base de datos permanezca en un estado consistente (correcto) a pesar de los fallos del sistema.

Una base de datos engloba el concepto de ser un dispositivo de almacenamiento masivo que está disponible para un número de usuarios autorizados en un tiempo pertinente.













