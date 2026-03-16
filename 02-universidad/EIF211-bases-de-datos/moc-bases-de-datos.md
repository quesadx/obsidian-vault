---
tags: [universidad, bases-datos, eif211, moc]
created: 2026-02-16
updated: 2026-03-06
---

# EIF211 - Bases de Datos

Mapa de contenidos para el curso de Diseño e Implementación de Bases de Datos en la Universidad Nacional.

## Conceptos Fundamentales

- [[DBMS]]
- [[Modelo-Entidad-Relacion]]
- [[Modelo-Relacional]]
- [[Abstraccion-de-datos]]
- [[Normalizacion]]
- [[Integridad-de-datos]]

## Clases

- [[2026-02-16-clase-1]]
- [[2026-02-24-leccion-2]]
- [[2026-03-02-leccion-3]]

## Tareas y Evaluaciones

- [[2026-03-01-quiz-1]]

## Razones de la Existencia de Bases de Datos

- Eliminar redundancia de datos e inconstencia
- Facilitar obtención de información
- Integrar datos aislados
- Garantizar problemas de integridad
- Garantizar atomicidad
- Controlar acceso simultáneo
- Establecer seguridad

## Modelos de Datos

### Modelo Jerárquico

- Estructura de árbol

### Modelo de Red

- Estructura de grafo

### Modelo Relacional

- Tablas, columnas, filas
- Claves primarias y foráneas

### Modelo Entidad-Relación

- Conceptual, no implementación directa
- Entidades y relaciones

### NoSQL

- Documentos (MongoDB)
- Clave-valor (Redis)
- Grafos
- Columnar

## Abstracción de Datos (ANSI/SPARC)

### Nivel Externo
- Vista abstracta para usuarios

### Nivel Conceptual
- Estructura lógica de datos

### Nivel Interno
- Almacenamiento físico (archivos, índices)

## Conceptos Clave

- [[Esquema]] vs [[Instancia]]
- [[Integridad-Referencial]]
- [[Normalizacion|Formas Normales]]
- [[Álgebra-Relacional]]
- SQL

## Operaciones de Álgebra Relacional

- Selección (filtrado de filas)
- Proyección (selección de columnas)
- Unión
- Intersección
- Join (natural, cartesiano, externo)

## NoSQL vs SQL

### SQL (Relacional)
- Esquema predefinido
- ACID (Atomicidad, Consistencia, Aislamiento, Durabilidad)
- Relaciones normalizadas
- Escalabilidad vertical

### NoSQL
- Schema-less o flexible
- BASE (Básicamente disponible, estado suave, consistencia eventual)
- Desnormalización
- Escalabilidad horizontal (sharding)
- Replicación automática
