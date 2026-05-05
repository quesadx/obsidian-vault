---
Fecha: 03-05-2026
moc: "[[moc-bases-de-datos]]"
---
# Notas del laboratorio de SQL

Refiere a [[03-05-2026-setup-oracle-docker]].

> Detalle:
> A la hora de insertar los datos, tuve que cambiar scl_detalle_citas a scl_det_citas para que se inserten bien los datos.


## Consulta 1

### Enunciado

Se requiere obtener un listado que muestre el nombre y apellidos de cada persona, junto con el identificador del paciente y la cantidad total de citas que ha registrado en el sistema. El resultado debe incluir únicamente aquellos pacientes que tengan más de una cita registrada. Finalmente, la información debe ordenarse de forma descendente según la cantidad de citas.

``` sql
SELECT pa.ID_PACIENTE,
       p.NOMBRE,
       p.P_APELLIDO,
       p.S_APELLIDO,
       COUNT(pa.ID_PACIENTE) AS TOTAL_CITAS
FROM SCL_PERSONAS p
JOIN SCL_PACIENTES pa
    ON p.ID_PERSONA = pa.ID_PERSONA
JOIN SCL_CITAS c
    ON pa.ID_PACIENTE = c.ID_PACIENTE
GROUP BY pa.ID_PACIENTE,
         p.NOMBRE,
         p.P_APELLIDO,
         p.S_APELLIDO
HAVING COUNT(c.ID_CITA) > 1
ORDER BY TOTAL_CITAS DESC;
```
![[Pasted image 20260503220627.png]]

---

## Consulta 2

Se solicita mostrar la información detallada por el nombre y apellidos de cada paciente, junto con su identificador y el monto total pagado por concepto de citas. El resultado debe incluir únicamente aquellos pacientes cuyo total pagado sea mayor a 100.000 colones. La información debe ordenarse de forma descendente según el total pagado.

``` sql
SELECT p.CEDULA, p.NOMBRE, p.P_APELLIDO, p.S_APELLIDO, SUM(pg.MONTO) AS TOTAL_PAGADO
FROM SCL_PERSONAS p
JOIN SCL_PACIENTES pa
	ON pa.ID_PERSONA = p.ID_PERSONA
JOIN SCL_CITAS c
	ON c.ID_PACIENTE = pa.ID_PACIENTE
JOIN SCL_PAGOS pg
	ON c.ID_CITA = pg.ID_CITA
GROUP BY p.CEDULA,
		 p.NOMBRE,
		 p.P_APELLIDO,
		 p.S_APELLIDO
HAVING SUM(pg.MONTO) > 100000
ORDER BY TOTAL_PAGADO DESC
```
![[Pasted image 20260503220651.png]]

---

## Consulta 3

Se requiere obtener la información detallada por el identificador del doctor, su nombre y apellidos, junto con la cantidad total de tratamientos realizados. El resultado debe mostrar únicamente aquellos doctores que hayan realizado más de un tratamiento, y debe ordenarse de forma descendente según la cantidad de tratamientos realizados.

``` sql
SELECT d.ID_DOCTOR, p.NOMBRE, p.P_APELLIDO, p.S_APELLIDO, p.TELEFONO, COUNT(t.ID_TRATAMIENTO) AS TOTAL_TRATAMIENTOS
FROM SCL_DOCTORES d
JOIN SCL_PERSONAS p
	ON p.ID_PERSONA = d.ID_PERSONA
JOIN SCL_CITAS c
	ON c.ID_DOCTOR  = d.ID_DOCTOR 
JOIN SCL_DET_CITA de
	ON de.ID_CITA  = c.ID_CITA
JOIN SCL_TRATAMIENTOS t
	ON t.ID_TRATAMIENTO = de.ID_TRATAMIENTO
GROUP BY d.ID_DOCTOR, p.NOMBRE, p.P_APELLIDO, p.S_APELLIDO, p.TELEFONO
HAVING COUNT(t.ID_TRATAMIENTO) > 1
ORDER BY TOTAL_TRATAMIENTOS DESC
```
![[Pasted image 20260503223308.png]]

---

## Consulta 4

Se solicita mostrar la información detallada por nombre de la clínica, su identificador y el total de ingresos generados. El resultado debe incluir únicamente aquellas clínicas cuyos ingresos sean mayores a 200.000 colones. Además, los resultados deben ordenarse de forma descendente según el total de ingresos.

``` sql
SELECT cl.ID_CLINICA,
       cl.NOMBRE,
       SUM(pg.MONTO) AS TOTAL_INGRESOS
FROM SCL_CLINICA cl
JOIN SCL_DOCTORES d
    ON d.ID_CLINICA = cl.ID_CLINICA
JOIN SCL_CITAS c
    ON c.ID_DOCTOR = d.ID_DOCTOR
JOIN SCL_PAGOS pg
    ON pg.ID_CITA = c.ID_CITA
GROUP BY cl.ID_CLINICA,
         cl.NOMBRE
HAVING SUM(pg.MONTO) > 200000
ORDER BY TOTAL_INGRESOS DESC;
```
![[Pasted image 20260503224453.png]]

---

## Consulta 5

``` sql
SELECT pa.ID_PACIENTE,
       p.NOMBRE,
       p.P_APELLIDO,
       p.S_APELLIDO,
       COUNT(de.ID_TRATAMIENTO) AS TOTAL_TRATAMIENTOS
FROM SCL_PERSONAS p
JOIN SCL_PACIENTES pa
    ON pa.ID_PERSONA = p.ID_PERSONA
JOIN SCL_CITAS c
    ON c.ID_PACIENTE = pa.ID_PACIENTE
JOIN SCL_DET_CITA de
    ON de.ID_CITA = c.ID_CITA
GROUP BY pa.ID_PACIENTE,
         p.NOMBRE,
         p.P_APELLIDO,
         p.S_APELLIDO
HAVING COUNT(de.ID_TRATAMIENTO) > 2
ORDER BY TOTAL_TRATAMIENTOS DESC;
```
![[Pasted image 20260503224614.png]]