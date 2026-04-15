---
Fecha: 15-04-2026
moc: "[[moc-sistemas-operativos]]"
---

# Capítulo 6

Concurrencia. Condiciones de carrera (race conditions). Sincronización. Acceso a recursos. 

## 1. Problema de la sección crítica

Es la parte de código de un proceso donde se acceden a recursos compartidos. Para que este sistema funcione, se tine que regir un protocolo:

- Exclusión mutua: si un proceso está en su sección crítica, ningún otro proceso puede estarlo.
- Progreso: Si no hay nadie en la sección crítica, la desición de quién entra tiene que ser tomada de inmediado y solo por procesos.
- Espera limitada: No puede haber procesos esperando indefinidamente.

---

## 2. Soluciones de software y hardware

La solución de software refiere a la `solución de Peterson`:

### Peterson

Dos procesos 