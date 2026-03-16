---
tipo: "[[Universidad]]"
fecha: 2026-02-19
Pages: 01-
---
## Sistemas Operativos 
El sistema operativo es un asignador de recursos, además de ser un programa de control que gestiona la ejecución de programas. Se puede ejecutar en modo kernel, donde tiene acceso total al hardware y puede ejecutar todas las instrucciones del sistema. Mientras que los programas viven en el user space, donde solo pueden utilizar un conjunto limitado de instrucciones y no tienen acceso directo a funciones críticas como entrada y salida o el control de hardware. 
Un kernel es un programa que se ejecuta constantemente en la computadora. 
En una computadora existen 3 capas:
- **Interfaz de usuario:** GUI y shell
- **Software:** Sistema operativo. 
- **Hardware:** Componentes físicos
## Componentes del Sistema Informático. 
### Hardware
Conjunto de recursos físicos del sistema. 
### Sistema Operativo
 Es un conjunto de programas que se encargan de controlar el hardware, asignar recursos y controlar procesos. Es la capa intermedia entre usuario, programas de aplicación y hardware. 
Se ejecuta directamente sobre el hardware y proporciona la base necesaria para que los programas funcionen. Se encarga de manejar operaciones críticas del sistema, como las interrupciones o le manejo del reloj del sistema, que está protegidos por hardware. Los SO no se reescriben desde 0, si no que evolucionan y se actualizan. 
	**Interfaz de usuario**
	Permite la ejecución de programas en modo usuario como navegadores, lectores de correo o reproductores, estos programas utilizan constantemente el SO para poder funcionar.
Estructura del SO 

| Tipo       | Características           |
| ---------- | ------------------------- |
| Simple     | Sin separación en niveles |
| En niveles | Nivel 0->hardware         |
|            |                           |

### Programas de Aplicación
Utilizan los recursos del sistema para resolver problemas de los usuarios. 
### Usuarios
Interactúan con el sistema informático. 
### Organización de una computadora
Describe cómo están estructurados y cómo interactúan sus componentes internos, como la CPU, la memoria y los dispositivos de entrada y salida, para permitir el funcionamiento del sistema.
El CPU+Controladores de dispositivo pasan a través del bus común y una memoria compartida. Los controladores de memoria sincronizan el acceso a memoria compartida y el programa de arranque está almacenado en ROM/EEPROM e inicializan y cargan el kernel.  
	El programa de arranque que está en la ROM lleva a diagnósticos, lo cual conduce a inicialización, carga el kernel y ejecuta el primer proceso (INIT).
	Un disco de arranque es aquel que tiene una partición con un programa de arranque.
### Funcionamiento de una computadora
Una computadora moderna está formada por CPU, memoria y dispositivos controlados mediante controladoras y un bus común. Al encenderse, se ejecuta un programa de arranque que inicializa el sistema y carga el sistema operativo (grub). La comunicación entre dispositivos y la CPU se realiza mediante interrupciones. 
### Estructura de almacenamiento
Para un programa ejecutarse, debe estar en la memoria principal, al ser limitada y volátil, se usan almacenamientos secundarios. 
- **Volátiles:** Registros, caché, memoria principal, disco electrónico.
- **No Volátiles:** Disco óptimo, magnético, cintas magnéticas.
- **NV RAM:** DRAM con batería de reserva. 
Estructura de E/S
- **Controladores de dispositivos:** Software que entiende de hardware y presenta interfaz uniforme. 
- **Acceso directo a memoria (DMA):** Transfiere bloques completos de memoria sin intervención del CPU. 
### Estructura de Entrada y Salida
Los dispositivos de entrada y salida se comunican con el sistema mediante controladores y drivers. Las operaciones de E/S utilizan interrupciones y para grandes transferencias se puede habilitar el DMA (acceso directo a memoria), que mejora el rendimiento. 
### Arquitectura de un sistema informático
Se refiere a como se organizan los procesadores y como trabajan entre sí. 
#### Sistemas de un solo procesador
Son sistemas que cuentan que cuentan con una sola CPU principal que se encarga de ejecutar todos los programas. Tienen procesadores especializados (como discos, teclado, gráfica)
#### Sistemas multiprocesador
Poseen dos o más procesadores o núcleos, que trabajan juntos para repartir la carga de trabajo.  Dan mejor rendimiento, economía de escala y mayor fiabilidad. Pueden funcionar de forma:
- **Asimétrica:** Un procesador controla los demás
- **Simétrica (SMP):** Todos los procesadores trabajan en igualdad. 
#### Sistema en Cluster
Múltiples sistemas independientes conectados por red, que trabajan como si fueran un solo sistema. Usados principalmente para alta disponibilidad y tolerancia a fallos. 
- **Cluster asimétrico:** Un nodo de espera caliente monitoriza el activo
- **Cluster simétrico:** Todos los nodos ejecutan aplicaciones y se monitorizan entre sí
- **Cluster paralelo:** Múltiples  hosts acceden a mismos datos (requiere software especial)
## Operaciones del SO
Funciona principalmente mediante interrupciones, de manera que no está trabajando todo el tiempo, sino que permanece en espera hasta que ocurre algún evento (tecla presionada, programa solicite servicio, error).
### Interrupción
Señal generada por el hardware (teclado, mouse, disco)
### Excepción
Interrupción generada por software (división, acceso inválido)
### Operación dual 
La computadora tiene dos modos de operación:
- **Modo Usuario:** Ejecuta los programas de usuario sin acceso a hardware.
- **Modo kernel:** Se le brinda acceso total al hardware. Un bit de modo indica en que modo se encuentra el CPU. 
	La syscall/Windows API calls/NT system calls son API dadas por el SO para que los programas puedan realizar operaciones en modo kernel. 
### Temporizador
El sistema operativo debe asegurarse de que ningún programa use la CPU indefinidamente, por lo que genera interrupciones periódicas, usando un sistema temporizador (timeouts), esto principalmente en caso de que el programa no responda. Útil en multi-tarea o multi-usuario. 
## Gestión de Procesos
Un proceso es igual a un programa en ejecución. Un programa por si mismo no hace nada, solo cuando la CPU ejecuta sus instrucciones se convierte en un proceso. EL SO permite que varios procesos se ejecuten de forma concurrente. 
## Gestión de Memoria 
Es un recurso fundamental, en ella deben estar cargados los programas y los datos para que la CPU pueda ejecutarlos. El SO debe cargar el programa a memoria, le asigna un espacio y le permite acceder a instrucciones y datos, cuando el programa finaliza, ese espacio se libera para ser utilizado por otro proceso. El SO debe gestionar el uso de memoria, liberar, asignar y garantizar que ningún proceso interfiera entre sí. 
## Gestión de Almacenamiento
El SO se encarga de administrar la información que se guarda en la computadora, controla como se crean, eliminan y organizan los archivos, sus accesos, decide en qué dispositivos se almacena y realizar las copias de seguridad. Ofrece una vista lógica para que el usuario no deba preocuparse por el funcionamiento interno de los discos. Para agilizar procesos se usa el almacenamiento en caché. 
El almacenamiento terciario se encarga de montar.desmontar, asignación/ liberación de dispositivos y migración de datos. 
## Protección y Seguridad
- **Protección:** El SO limita el alcance de acceso a recursos y otros procesos a programas. 
- **Seguridad:** Se encarga de proteger al sistema en contra de ataques internos y externos, como virus, gusanos o robo de información. 
### Identificación de Usuarios
Para poder aplicar medidas de seguridad y protección, el SO debe identificar a cada usuario (mediante un id asociado a sus procesos). 
	**Escalamiento de procesos:** Cuando un usuario necesita permisos especiales para realizar ciertas tareas, se le asigna de forma controlada. 
## Sistemas distribuidos 
- **Red:** Cada computadora es autónoma, consiente de red.
- **Distribuido:** Ilusión de único SO, controlando la red.
## Sistemas de propósito Real
- **Embebidos en tiempo real:** Micro sistemas con plazos de tiempo estrictos y bien definidos (imágenes médicas, inyección gasolina)
- **Multimedia:** Datos deben suministrarse cumpliendo restricciones de tiempo (mp3, DVD, videoconferencia)
## Entornos informáticos 
Sistema cliente-servidor 
- **Servidor de cálculo:** Base de datos, ejecuta algo y devuelve una acción
- **Servidor de archivos:** Servidor web, proporciona una interfaz en un sistema de archivos
## Mecanismos vs Políticas
Los mecanismos son medios o herramientas que proporciona el SO sobre como hacer algo.
Las decisiones o reglas que determinan que acciones tomar usando los mecanismos disponibles. 
## Historia 
### Primera Generación (1945-1955): Tubos al vacío
Las computadoras no tenían SO, los programas manejaban un bit a la vez, representado a través de tarjetas perforadas. 
### Segunda Generación (1955-1965): Transistores
Nacimiento del transistor (unidad más pequeña del CPU), que permitió la creación de computadoras llamadas mainframes. Eran muy costosas, por lo que dio origen al procesamiento por lotes utilizando cintas magnéticas. 
	El procesamiento por lotes consistía en 3 computadoras donde la primera se encargaba de leer tarjetas perforadas, la segunda procesa la cinta de entrada y da una de salida, que es impresa por la tercera computadora. 
### Tercera Generación (1965-1980): Circuitos Integrados y Multiprogramación
Se introdujeron los circuitos integrados y surgieron SO más avanzados , como el OS/360 de IBM, que ya incluían manejo de memoria. También se implementó el spooling (encolado de trabajos) para optimizar la lectura y escritura de datos, pero se seguía trabajando principalmente por lotes.
### Cuarta Generación (1980-actualidad): Las Computadoras Personales
Surgen gracias al desarrollo de microprocesadores y los circuitos de integración a gran escala. Se consolidaron los SO modernos. Además, el uso de redes permitió la comunicación entre computadoras. 

Tiempo compartido: El CPU divide en intervalos pequeños de tiempo y cada proceso obtiene su "turno"
Multiprogramación: Todas las aplicaciones se cargan en memoria principal y el CPU cambia entre ellas para maximizar la utilización del procesador. 

## Máquinas Virtuales
Abstraen el hardware dando la ilusión de que cada entorno es una computadora privada, ofrece protección total entre VMs . Sin embargo resulta más lenta e impredecible. 
TRaen el beneficio del aislamiento y la ejecución concurrente. Ejemplos:
- VMware
- JVM

![[Pasted image 20260222215015.png]]