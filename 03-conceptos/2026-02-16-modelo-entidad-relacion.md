---
tags: [concepto, bases-datos]
created: 2026-02-16
updated: 2026-03-06
moc: "[[moc-bases-de-datos]]"
---

# Modelo Entidad-Relación

El Modelo Entidad-Relación (ER) es una representación **conceptual** que define la estructura lógica de la información en una base de datos.

## Propósito

El modelado es el paso **indispensable** entre:
1. Comprender un problema real
2. Diseñar una solución de base de datos

No es solo burocracia, es la **arquitectura de la información**.

## Componentes del Modelo ER

### Entidades

Una **entidad** es un objeto del mundo real que se desea representar.

- **Características:**
  - Posee un identificador único
  - Ejemplos: estudiante, profesor, curso, producto

- **Tipos:**
  - **Entidad fuerte**: Tiene atributos y no depende de otra
  - **Entidad débil**: Depende de otra entidad para identificarse
  - Cuando existe una entidad débil, al convertirla a tabla recoge todo

### Atributos

Los **atributos** son características que describen a una entidad.

- **Identificador único (PK)**:
  - Se convierte en **clave primaria** en la tabla
  - Identifica uniquely cada instancia de la entidad

### Relaciones

Una **relación** es un vínculo lógico entre dos o más entidades.

- **Ejemplo**: Matrícula conecta a un estudiante con un curso

- **Tipos de relaciones por cardinalidad:**
  - **1:1** (uno a uno): Para cada objeto, existe exactamente uno al otro lado
  - **1:N** (uno a muchos): Para un objeto, hay muchos al otro lado
  - **N:1** (muchos a uno): Para muchos objetos, hay solo uno al otro lado
  - **N:N** (muchos a muchos): Para muchos objetos, hay muchos al otro lado

- **Nota**: Las relaciones solo se vuelven tabla cuando son de tipo **N:N**

### Claves

- **Clave Primaria (PK)**: Identifica uniquely una tupla en la tabla
- **Clave Foránea (FK)**: Referencia la PK de otra tabla
  - Establece la relación entre tablas

## Relación con el Modelo Relacional

El Modelo ER es **conceptual**, mientras que el [[Modelo-Relacional]] es la **implementación** en tablas.

- Cada entidad → tabla
- Cada atributo → columna
- Cada relación N:N → tabla intermedia

## Ventajas

- Independencia de la implementación
- Comunicación clara con stakeholders
- Base para normalización
- Identificación temprana de problemas
