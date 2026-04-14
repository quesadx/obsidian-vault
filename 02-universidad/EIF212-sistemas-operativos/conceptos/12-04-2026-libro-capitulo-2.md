---
Fecha: 13-04-2026
moc: "[[moc-sistemas-operativos]]"
---

# Capítulo 1

## Servicios del SO
Los servicios del sistema operativo se pueden agrupar en dos objetivos principales: ayudar al usuario y mantener la eficiencia del sistema.

### Para ayudar al usuario

- Interfaz de usuario: provee una forma de interacción, ya sea mediante CLI (línea de comandos) o GUI (interfaz gráfica).
- Ejecución de programas: carga programas en memoria, los ejecuta y finaliza su proceso de forma controlada.
- E/S (I/O): administra el acceso a dispositivos de entrada/salida para usar el hardware de forma segura y ordenada.
- Archivos: permite crear, leer, actualizar y eliminar archivos y directorios, además de gestionar permisos y organización.
- Comunicaciones: habilita el intercambio de información entre procesos locales o entre sistemas conectados por red.
- Detección de errores: identifica y reporta fallos de CPU, memoria, dispositivos y software para mantener la estabilidad.

### Para asegurar eficiencia

- Asignación de recursos: distribuye CPU, memoria, almacenamiento y dispositivos entre procesos según prioridad y disponibilidad.
- Contabilidad del sistema: registra el uso de recursos para análisis de rendimiento, control y planificación.
- Protección y seguridad: controla accesos mediante permisos, aislamiento y autenticación para prevenir usos no autorizados.

---

## Interfaz de usuario y llamadas del sistema

### Intérprete de comandos

Es el programa que recibe comandos del usuario y solicita al sistema operativo su ejecución.

- También se conoce como `shell`.
- Puede ser de línea de comandos (por ejemplo, `bash`) o gráfico.
- Su función principal es traducir acciones del usuario en operaciones que el SO entiende.

### Llamadas al sistema

Es el mecanismo mediante el cual un programa en modo usuario solicita servicios al SO (modo kernel).

- Se usan `syscalls` como interfaz para operaciones privilegiadas, por ejemplo:
	- Crear y finalizar procesos.
	- Leer y escribir archivos.
	- Solicitar memoria.
	- Comunicarse con dispositivos.

### Flujo básico de una llamada al sistema

1. El programa de usuario invoca una función de biblioteca (wrapper), como `read()` o `write()`.
2. El wrapper prepara los argumentos y ejecuta una instrucción de trampa (`trap`) para cambiar a modo kernel.
3. El kernel identifica la syscall solicitada y valida permisos/parámetros.
4. El kernel ejecuta el servicio y retorna un resultado (valor de retorno o código de error).
5. El proceso vuelve a modo usuario y continúa su ejecución.

### Métodos de paso de parámetros

- Registros:
	- Los argumentos se colocan en registros de CPU.
	- Es rápido, pero está limitado por la cantidad de registros disponibles.

- Bloque o tabla en memoria:
	- Se guarda la dirección de una estructura en memoria que contiene los parámetros.
	- Permite pasar más información y estructuras complejas.

- Pila de parámetros:
	- Los argumentos se colocan en la pila del proceso.
	- Es flexible y simple de implementar, aunque puede tener más sobrecarga que registros.

### Idea clave

Las llamadas al sistema son la frontera controlada entre programas de usuario y recursos del hardware: permiten funcionalidad avanzada sin comprometer protección ni estabilidad.

---

## Estructura del SO

### Simple o monolítico

Todo el sistema operativo corre principalmente en modo kernel y en un solo espacio de direcciones.

- Característica clave: los componentes (gestión de memoria, archivos, planificador, drivers) están fuertemente integrados.
- Ventaja: alto rendimiento por comunicación directa entre componentes.
- Desventaja: menor aislamiento; un fallo en un componente puede afectar todo el sistema.

### No monolítico

Separa funciones del sistema en componentes más aislados, reduciendo el acoplamiento interno.

- Idea principal: no todo vive dentro de un único bloque de kernel.
- Ventaja: mejor mantenibilidad, depuración y tolerancia a fallos.
- Desventaja: puede introducir más costo de comunicación entre componentes.

### Modular

El SO se construye como un núcleo base con módulos que pueden cargarse o descargarse según necesidad.

- Permite agregar funcionalidades (por ejemplo, drivers o sistemas de archivos) sin recompilar todo el kernel.
- Ofrece buen equilibrio entre rendimiento y flexibilidad.
- Ejemplo típico: kernels con módulos dinámicos.

### No modular

El sistema no está dividido en módulos independientes; sus partes están más rígidamente unidas.

- Los cambios suelen requerir recompilación o reinicio del sistema completo.
- Menor flexibilidad para mantenimiento y evolución.
- Puede ser más simple de entender en diseños pequeños, pero escala peor.

### Diferencia clave

- Monolítico vs no monolítico: describe cuánto se concentra la lógica del SO en un único bloque de kernel.
- Modular vs no modular: describe si el sistema puede extenderse mediante piezas independientes sin rehacer todo.

---

## VMs

Las máquinas virtuales (`VMs`) permiten ejecutar varios sistemas operativos aislados sobre un mismo `hardware` físico.

### Concepto base

- Una `VM` es una computadora lógica con `CPU`, memoria, disco y red virtualizados.
- Cada `VM` tiene su propio sistema operativo invitado (`guest OS`).
- El `aislamiento` evita que fallos en una `VM` afecten directamente a las demás.

### Arquitectura general

1. `Hardware` físico (`CPU`, `RAM`, disco, red).
2. `Hipervisor` (capa de virtualización).
3. Máquinas virtuales invitadas (`guest VMs`).
4. Aplicaciones dentro de cada VM.

### Tipos de hipervisor


- Tipo 1 (`bare-metal`):
	- Corre directamente sobre el hardware.
	- Mejor rendimiento y control de recursos.
	- Común en centros de datos y nube.

- Tipo 2 (`hosted`):
	- Corre sobre un sistema operativo anfitrión.
	- Más simple para uso personal o pruebas.
	- Suele tener más sobrecarga que tipo 1.

### Ventajas

- `Consolidación`: varios servidores lógicos en una sola máquina física.
- `Aislamiento`: mejora seguridad y estabilidad entre cargas de trabajo.
- `Portabilidad`: una VM puede moverse entre hosts compatibles.
- `Recuperación`: `snapshots` y respaldo más sencillos.
- Entornos de prueba: facilita laboratorio y experimentación sin afectar el sistema principal.

### Desventajas

- `Sobrecarga` de virtualización frente a ejecución nativa.
- Mayor consumo de memoria y almacenamiento si hay muchas `VMs`.
- Administración más compleja si no hay buena planificación de recursos.

### VM vs contenedores


- `VM`:
	- Virtualiza hardware completo.
	- Incluye un sistema operativo por instancia.
	- Más aislamiento, mayor costo en recursos.

- `Contenedor`:
	- Comparte el kernel del host.
	- Es más ligero y arranca más rápido.
	- Menor aislamiento que una `VM` completa.

### Casos de uso comunes

- `Infraestructura` en la nube.
- Laboratorios de sistemas operativos y redes.
- Ejecución de software legado.
- Entornos separados para `desarrollo`, `pruebas` y `producción`.

### Idea clave

Las `VMs` equilibran `aislamiento` y `flexibilidad`, permitiendo ejecutar múltiples entornos en un solo `hardware` con control centralizado de recursos.

---

## Diseño, Generación y Arranque

### Políticas vs. Mecanismos

- `Mecanismo`: el cómo. Es la herramienta técnica que permite realizar una tarea y normalmente es estable.
- `Política`: el qué. Es la regla o decisión que usa el mecanismo para definir el comportamiento del sistema.

### SYSGEN

- Es la generación de la configuración del sistema operativo para el hardware específico donde se va a instalar.
- Incluye selección de controladores, opciones de kernel y parámetros de arranque.
- Su objetivo es adaptar el SO al equipo físico para optimizar compatibilidad y rendimiento.

### Booting

El `booting` es el proceso completo de arranque desde que se enciende el equipo hasta que el sistema operativo está listo.

#### Fases del arranque

1. `POST` y firmware
   - El firmware (BIOS/UEFI) inicializa el hardware básico: CPU, memoria, chipset y dispositivos.
   - Se ejecuta el POST (Power-On Self Test) para verificar que los componentes esenciales funcionen.
   - Busca un dispositivo de arranque válido según el orden configurado.

2. `Bootloader`
   - Se carga el primer programa desde el dispositivo de arranque.
   - Su función es presentar opciones de arranque y preparar el entorno para el kernel.
   - Ejemplos comunes: GRUB, LILO, el gestor de arranque de Windows.

3. `Carga del kernel`
   - El bootloader carga el kernel en memoria.
   - El kernel inicializa estructuras internas, controladores básicos y la gestión de memoria.
   - Activa el modo protegido/long mode si es necesario.

4. `Ejecución`
   - El kernel arranca los procesos del sistema, como el `init` o el gestor de servicios.
   - Se monta el sistema de archivos raíz y se pasan los controles a los servicios del usuario.
   - El sistema queda listo para iniciar sesión y ejecutar aplicaciones.

#### Idea clave

- El booting es la secuencia ordenada que lleva al control del hardware desde el firmware hasta el sistema operativo.
- `SYSGEN` prepara el kernel y sus opciones para el hardware objetivo.
- Cada fase del arranque tiene un rol específico: verificación, carga, inicialización y puesta en marcha.

---



