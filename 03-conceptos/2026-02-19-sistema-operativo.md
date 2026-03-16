---
tags: [concepto, sistemas-operativos]
created: 2026-02-19
updated: 2026-03-06
---

# Sistema Operativo

Un **Sistema Operativo** es un asignador de recursos, además de ser un programa de control que gestiona la ejecución de programas.

## Definición

El SO es **software fundamental** que actúa como intermediario entre:
- Los usuarios
- Los programas de aplicación
- El hardware

## Funciones Principales

1. **Asignación de recursos**
   - Procesador (CPU)
   - Memoria
   - Dispositivos E/S

2. **Control de procesos**
   - Creación, suspensión, terminación
   - Planificación

3. **Gestión de memoria**
   - Asignación
   - Protección
   - [[Memoria-Virtual|Memoria virtual]]

4. **Gestión de E/S**
   - Controladores de dispositivos
   - Drivers

5. **Seguridad**
   - Control de acceso
   - Aislamiento de procesos

## Características

- Se ejecuta **constantemente** en la computadora (kernel)
- Se ejecuta en **modo kernel** (acceso total al hardware)
- No se reescribe desde cero, **evoluciona** y se actualiza
- **Protege** operaciones críticas con hardware dedicado

## Modos de Ejecución

### Modo Kernel
- Acceso total al hardware
- Puede ejecutar todas las instrucciones
- Se ejecuta constantemente (kernel)

### Modo Usuario
- Conjunto limitado de instrucciones
- Sin acceso directo a funciones críticas
- Donde corren los programas de usuario

## Capas del Sistema Informático

```
┌──────────────────────────┐
│  Interfaz de Usuario     │ (GUI, Shell)
├──────────────────────────┤
│  Sistema Operativo       │ (Kernel)
├──────────────────────────┤
│  Hardware                │ (CPU, Memoria, E/S)
└──────────────────────────┘
```

## Componentes del SO

### Interfaz de Usuario
- GUI (Graphical User Interface)
- Shell (Command Line Interface)

### Kernel
- Control del hardware
- Manejo de interrupciones
- Control del reloj del sistema
- Protección de operaciones críticas

## Relación con Otros Conceptos

- [[Proceso|Procesos]]
- [[Kernel]]
- [[Interruption|Interrupciones]]
- [[Memory-Management|Gestión de memoria]]
- [[Process-Scheduling|Planificación de procesos]]
