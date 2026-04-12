---
Fecha: 10-03-2026
moc: "[[moc-bases-de-datos]]"
Tags:
---

# 2026-03-10

## Normalización

### 1FN
Atributos **indivisibles**, **atómicos**, distintos.

### 2FN
**1FN** + **no dependencias parciales**.

### 3FN
**1FN** + **2FN** + no dependencias transitivas. El atributo depende de la clave, toda la clave y nada más de la clave

### 3FNBC
Que todo lo de la tabla **dependa** de la **llave** **primaria** de la tabla como tal.

### 4FN
**3FN** + **3FNBC** + no dependencias multievaluadas.

## 5FN
Regla de integridad avanzada. Garantiza que si troceamos la información y volvemos a juntarla, que no hayan registros falsos.

