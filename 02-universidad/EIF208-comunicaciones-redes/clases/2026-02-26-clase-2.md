---
tipo: "[[Universidad]]"
fecha: 2026-02-26
tags:
  - UNA
  - Redes
---
##  Comunicación a través de la red
### Estructura de la red
La comunicación 
Origen del mensaje -> Codificador -> Transmisor -> Medio de transmisión -> Receptor -> Decodificador -> Destino 
Los datos (stream) se envían a través de la red en pequeños bloques llamados segmentos, lo cual permite: 
- Intercalar diversas conversaciones en la red. El proceso usado para intercalar piezas de conversaciones separadas se llama multiplexación. 
- Aumenta la confiabilidad de las comunicaciones 
- Pero le agrega nivel de complejidad al proceso. 
#### Componentes de red:
- Hardware.
- Software.
- Medios. 
#### Dispositivos finales
Permiten la interacción entre la red humana y la red de comunicaciones. Son el cliente y servidor. 
#### Dispositivos intermediarios
Proporcionan conectividad y garantizan el flujo de los datos a través de la red. 
- Dispositivos de acceso a la red: hubs, switches, puntos de acceso inalámbricos.
- Dispositivos de inernetwork: Routers.
- Servidores.
- Dispositivos de seguridad: Firewalls. 
La administración de datos es también es trabajo de los dispositivos intermediarios. Estos dispositivos s encargan de:
- Volver a generar y transmitir señales de error.
- Notificar a otros dispositivos sobre los errores.
- Dirigir los datos a lo largo de las rutas alternativas. 
- QoS (asegurar que los paquetes lleguen bien).
- Permitir o denegar el flujo de datos. 
### Medios de red
Canal por el cual se transmite el mensaje.
Criterios para elegir un medio de red:
- Distancia. 
- Ambiente.
- Cantidad de datos y la velocidad. 
- Costo.
### LAN 
Red de área local
### WAN 
Redes de área extensa. Son redes LAN separadas por una distancia geográfica (kilómetros), que se conectan entre sí. 
### Internet 
Una red global de redes interconectadas. Se crea por la interconexión de redes que pertenecen a los Proveedores de Servicios de Internet (ISP). 
### Símbolos de Red
- Router:
- Switch LAN:
- Hub LAN (tonto):
- Servidor:
- Computadora de escritorio:
- Computador Portátil:
- Firewall:
- Teléfono:
- Punto de acceso inalámnrico:
- Medios WAN:
- Medios LAN:
- Medios inalámbricos:
### Protocolo
Son el conjunto de reglas que se establecen en el proceso de comunicación entre dos sistemas. La comunicación exitosa entre los host de una red requieren de varios protocolos. Un grupo de protocolos interrelacionados se llama un stack/suite de protocolos, los cuales describen procesos como:
- Formato o estructura del mensaje. 
- Método por el cual los dispositivos comparten información.
- Cómo y cuando se transmiten mensajes de error. 
- La configuración y la terminación de sesiones  
La función de los protocolos son da un estándar. 
### Capas con modelos TCP/IO y OSI
Un modelo de protocolo: Proporciona un modelo que coincide 

Un proceso de comunicación completo incluye:
1. Creación de datos.
2. Segmentación y encapsulación 
3. Generación de datos en los medios 
4. Transporte de datos en los medios 
5. ...
Todas las criticas se las saltó 

### Modelo OSI
Algunas personas solo toman ron en fiestas
### Capa Física
Crea la señal óptica, eléctrica o de microondas que representa a los bits en cada trama.El envío de tramas a través de medios locales requiere:
- Medios físicos y conectores asociados.
- Una representación de los bits en los medios.
- Codificación de los datos y de la información de control.
- Sistema de circuitos del receptor. 
Un PDU es la unidad de protocolo. 