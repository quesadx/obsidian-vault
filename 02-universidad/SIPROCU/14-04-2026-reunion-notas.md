---
tags:
  - SIPROCU
  - notas
  - universidad
created: 14-04-2026
updated: 14-04-2026
---
# Notas Reunión SIPROCU #1

## Control de Versiones
- Git branches: Se está considerando comenzar a usar branches en SIPROCU (anteriormente no se usaba)
- Explorar con Arturo el deployment

## SIPROCU - Gestión Curricular

### Registro de Aprobados
- Ejecutar acción: número de cursos a abrir el siguiente ciclo basado en cantidad de aprobados
- Cargar mallas de carreras con requisitos y correquisitos
- Crear historial de estudiantes (aprobados vs no aprobados)

### Requerimiento General
- Capacidad de modificación de datos en el sistema

## Proyectos / Trabajos a Realizar

### 1. Cálculo de Jornadas y Horas
- Diferentes tipos de nombramiento (categorías: instructor, profesor 1, 2, 2.5, etc.)
- Cálculo flexible: mismo curso para profesor A = tiempo completo, para profesor B = 3/4 tiempo
- Entregable: Reporte de jornadas y horas
- Prioridad: Alta

### 2. Análisis de Patrones en Personas (Machine Learning)
- Detección de patrones: análisis de sentimientos, PLN
- Investigación de artículos ACM (Association for Computing Machinery)
- Recurso: ACM Digital Library
- Responsabilidad: Uno del equipo
- Entregable: Compartir hallazgos con profesor

### 3. Sismología - Red Neuronal con PyTorch
- Clasificación de sismos usando datasets de OVSICORI
- Problema: Detectar sismos no apreciables a simple vista (ruido de fondo)
- Dataset ya montado disponible
- Referencia: Kabre

### 4. Detección de SDC (Silent Data Corruption)
- Colaboración con Elvis: búsqueda de información sobre SDC
- Identificar fallos no evidentes (cuando el sistema falla pero no se cae)
- Investigación: impacto de bit flips
- Asistente: Ya está encargado de esta tarea

### 5. Análisis de Emociones en Tiempo Real (IA/Visión)
- Red neuronal con cámara grabando clase (ej: Sistemas Operativos)
- Detección facial automática
- Análisis multi-parámetro: satisfacción, distracción, etc.
- Correlación: actividades del profesor ↔ emociones estudiantes (4 horas de clase)
- Desafío: Implementación, tools, lenguaje (Python + librerías bajo nivel)
- Objetivo: Nivel de satisfacción por estudiante

## Notas Adicionales

### Tecnologías de Interés
- SLURM (cluster management): Resource management - distribuye recursos en cluster
- Interesante para poder escalar computación

### Ideas Futuro (Opcional)
- Pantalla táctil en entrada de universidad
- Visualización 3D de campus
- Navegación interactiva para guiar visitantes

