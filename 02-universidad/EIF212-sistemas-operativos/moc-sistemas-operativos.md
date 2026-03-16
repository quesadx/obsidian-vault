---
tags: [universidad, sistemas-operativos, eif212, moc]
created: 2026-02-19
updated: 2026-03-06
---

# EIF212 - Sistemas Operativos

Mapa de contenidos para el curso de Sistemas Operativos en la Universidad Nacional.

## Conceptos Fundamentales

- [[Sistema-Operativo]]
- [[Kernel]]
- [[Procesos]]
- [[Planificacion-CPU]]
- [[Memoria-Virtual]]
- [[Interrupcion]]
- [[DMA-Acceso-Directo-Memoria]]

## Clases

- [[2026-02-19-clase-1]]
- [[2026-02-26-clase-2]]

## Capas del Sistema Informático

### 1. Interfaz de Usuario
- GUI (Interfaz Gráfica)
- Shell (Línea de comandos)

### 2. Software
- Sistema Operativo

### 3. Hardware
- Componentes físicos

## Componentes del Sistema Informático

### Hardware
- Recursos físicos del sistema

### Sistema Operativo
- Control de hardware
- Asignación de recursos
- Control de procesos
- Protección y seguridad

### Programas de Aplicación
- Utilizan recursos del SO
- Se ejecutan en modo usuario

### Usuarios
- Interactúan con el sistema

## Funciones del Sistema Operativo

- Control de acceso al hardware
- Gestión de interrupciones
- Manejo del reloj del sistema
- Protección del hardware (operaciones críticas)
- Evolución constante (no reescritura desde cero)

## Estructura del Sistema

### Arquitectura de Computadora

- CPU
- Memoria (volatil)
- Dispositivos de E/S
- Bus común

### Jerarquía de Almacenamiento

**Volátil:**
- Registros
- Caché
- Memoria principal
- Disco electrónico

**No Volátil:**
- Disco óptico
- Disco magnético
- Cintas magnéticas

**NV-RAM:**
- DRAM con batería de respaldo

## Entrada y Salida (E/S)

- Controladores de dispositivos
- Drivers
- [[DMA-Acceso-Directo-Memoria]] (para transferencias grandes)
- Interrupciones

## Modos de Ejecución

### Modo Kernel
- Acceso total al hardware
- Puede ejecutar todas las instrucciones del sistema
- Se ejecuta constantemente

### Modo Usuario
- Conjunto limitado de instrucciones
- Sin acceso directo a funciones críticas
- Donde se ejecutan los programas

## Arranque del Sistema

1. Programa de arranque en ROM/EEPROM
2. Diagnósticos
3. Inicialización
4. Carga del kernel
5. Ejecución del primer proceso (INIT)

## Conceptos Relacionados

- [[Proceso]]
- [[Contexto-de-ejecucion]]
- [[Cambio-de-contexto]]
- [[Planificacion-de-procesos]]
- [[Sincronizacion]]
- [[Deadlock]]
