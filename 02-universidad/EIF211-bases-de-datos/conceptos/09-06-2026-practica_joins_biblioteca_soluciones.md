---
Fecha: 09-06-2026
moc: "[[moc-bases-de-datos]]"
---
# Práctica de JOINS en Oracle SQL + soluciones

Contexto nuevo: estudiantes y préstamos de libros.


La práctica está diseñada para evaluar lo mismo que los documentos adjuntos: JOIN implícito, INNER JOIN, LEFT JOIN, RIGHT JOIN, FULL JOIN y uso de NVL para sustituir valores NULL.

## Script base

```sql
CREATE TABLE tbl_estudiantes (
    est_carnet NUMBER PRIMARY KEY,
    est_nombre VARCHAR2(50),
    est_carrera VARCHAR2(60)
);

CREATE TABLE tbl_prestamos (
    pre_id NUMBER PRIMARY KEY,
    pre_libro VARCHAR2(80),
    pre_estado VARCHAR2(30),
    pre_carnet NUMBER
);

INSERT INTO tbl_estudiantes VALUES (101, 'Ana Rojas', 'Ingeniería en Sistemas');
INSERT INTO tbl_estudiantes VALUES (102, 'Carlos Mora', 'Administración');
INSERT INTO tbl_estudiantes VALUES (103, 'Lucía Pérez', 'Diseño');
INSERT INTO tbl_estudiantes VALUES (104, 'Marcos Solano', 'Ingeniería Industrial');
INSERT INTO tbl_estudiantes VALUES (105, 'Sofía Vargas', 'Contabilidad');

INSERT INTO tbl_prestamos VALUES (1, 'Bases de Datos I', 'ACTIVO', 101);
INSERT INTO tbl_prestamos VALUES (2, 'Redes de Computadoras', 'DEVUELTO', 101);
INSERT INTO tbl_prestamos VALUES (3, 'Contabilidad Básica', 'ACTIVO', 105);
INSERT INTO tbl_prestamos VALUES (4, 'Diseño UX', 'ATRASADO', 103);
INSERT INTO tbl_prestamos VALUES (5, 'Libro sin estudiante registrado', 'ACTIVO', 999);

COMMIT;
```

## Ejercicios

### Ejercicio 1
Muestre el carnet, nombre del estudiante, libro prestado y estado del préstamo, únicamente cuando exista relación entre estudiante y préstamo. Use sintaxis antigua de JOIN.

### Ejercicio 2
Repita el ejercicio anterior usando INNER JOIN moderno.

### Ejercicio 3
Muestre todos los estudiantes, aunque no tengan préstamos. Cuando no tengan préstamo, muestre `NO TIENE` en el libro y `NO DEFINIDO` en el estado.

### Ejercicio 4
Muestre todos los préstamos, aunque el carnet asociado no exista en estudiantes. Cuando no exista estudiante, conserve el libro y estado del préstamo.

### Ejercicio 5
Muestre todos los estudiantes y todos los préstamos, aunque no exista relación. Use FULL JOIN.

### Ejercicio 6
Repita el FULL JOIN anterior, pero invirtiendo el orden de las tablas en el FROM.

## Soluciones

### Solución 1

```sql
SELECT e.est_carnet, e.est_nombre, p.pre_libro, p.pre_estado
FROM tbl_estudiantes e,
     tbl_prestamos p
WHERE e.est_carnet = p.pre_carnet;
```

### Solución 2

```sql
SELECT e.est_carnet, e.est_nombre, p.pre_libro, p.pre_estado
FROM tbl_estudiantes e
INNER JOIN tbl_prestamos p
ON e.est_carnet = p.pre_carnet;
```

### Solución 3

```sql
SELECT e.est_carnet,
       e.est_nombre,
       NVL(p.pre_libro, 'NO TIENE') AS libro,
       NVL(p.pre_estado, 'NO DEFINIDO') AS estado
FROM tbl_estudiantes e
LEFT JOIN tbl_prestamos p
ON e.est_carnet = p.pre_carnet;
```

### Solución 4

```sql
SELECT e.est_carnet,
       e.est_nombre,
       NVL(p.pre_libro, 'NO TIENE') AS libro,
       NVL(p.pre_estado, 'NO DEFINIDO') AS estado
FROM tbl_estudiantes e
RIGHT JOIN tbl_prestamos p
ON e.est_carnet = p.pre_carnet;
```

### Solución 5

```sql
SELECT e.est_carnet,
       e.est_nombre,
       NVL(p.pre_libro, 'NO TIENE') AS libro,
       NVL(p.pre_estado, 'NO DEFINIDO') AS estado
FROM tbl_estudiantes e
FULL JOIN tbl_prestamos p
ON e.est_carnet = p.pre_carnet;
```

### Solución 6

```sql
SELECT e.est_carnet,
       e.est_nombre,
       NVL(p.pre_libro, 'NO TIENE') AS libro,
       NVL(p.pre_estado, 'NO DEFINIDO') AS estado
FROM tbl_prestamos p
FULL JOIN tbl_estudiantes e
ON e.est_carnet = p.pre_carnet;
```

## Resultados esperados aproximados

### INNER JOIN
Devuelve solamente coincidencias:

| est_carnet | est_nombre | pre_libro | pre_estado |
|---:|---|---|---|
| 101 | Ana Rojas | Bases de Datos I | ACTIVO |
| 101 | Ana Rojas | Redes de Computadoras | DEVUELTO |
| 103 | Lucía Pérez | Diseño UX | ATRASADO |
| 105 | Sofía Vargas | Contabilidad Básica | ACTIVO |

### LEFT JOIN
Devuelve todos los estudiantes:

| est_carnet | est_nombre | libro | estado |
|---:|---|---|---|
| 101 | Ana Rojas | Bases de Datos I | ACTIVO |
| 101 | Ana Rojas | Redes de Computadoras | DEVUELTO |
| 102 | Carlos Mora | NO TIENE | NO DEFINIDO |
| 103 | Lucía Pérez | Diseño UX | ATRASADO |
| 104 | Marcos Solano | NO TIENE | NO DEFINIDO |
| 105 | Sofía Vargas | Contabilidad Básica | ACTIVO |

### RIGHT JOIN
Devuelve todos los préstamos:

| est_carnet | est_nombre | libro | estado |
|---:|---|---|---|
| 101 | Ana Rojas | Bases de Datos I | ACTIVO |
| 101 | Ana Rojas | Redes de Computadoras | DEVUELTO |
| 105 | Sofía Vargas | Contabilidad Básica | ACTIVO |
| 103 | Lucía Pérez | Diseño UX | ATRASADO |
| NULL | NULL | Libro sin estudiante registrado | ACTIVO |

### FULL JOIN
Devuelve todo de ambas tablas:

| est_carnet | est_nombre | libro | estado |
|---:|---|---|---|
| 101 | Ana Rojas | Bases de Datos I | ACTIVO |
| 101 | Ana Rojas | Redes de Computadoras | DEVUELTO |
| 102 | Carlos Mora | NO TIENE | NO DEFINIDO |
| 103 | Lucía Pérez | Diseño UX | ATRASADO |
| 104 | Marcos Solano | NO TIENE | NO DEFINIDO |
| 105 | Sofía Vargas | Contabilidad Básica | ACTIVO |
| NULL | NULL | Libro sin estudiante registrado | ACTIVO |
```
