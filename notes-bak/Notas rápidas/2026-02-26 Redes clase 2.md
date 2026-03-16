---
Fecha: 2026-02-26
Tags:
  - Redes
  - UNA
---

# 2026-02-26

## Estructura de la red

La comunicación comienza con un mensaje o información que es transmitido.

---
### Estructura

Las redes y su comunicación constan de una **serie de protocolos** y **pasos precisamente definidos**.
#### Conexión lógica

Los **procesos** usuales **consisten** de:
* Origen del mensaje.
* Codificador.
* Transmisor.
* Medio de transmisión.
* Receptor.
* Decodificador.
* Destino del mensaje.
##### Segmentos

Los datos (**Stream**) se envían a través de la red en pequeños "**bloques**" denominados **segmentos**.
La segmentación tiene dos **beneficios principales**:
* Al enviar partes individuales más pequeñas del origen al destino, se pueden intercalar diversas conversaciones en la red. El proceso que se utiliza para intercalar las piezas de conversaciones separadas en la red se denomina multiplexación.
* Puede aumentar la confiabilidad de las comunicaciones de red. Noes necesario que las partes separadas de cada mensaje sigan el mismo recorrido a través de la red desde el origen hasta el destino.
**Desventaja:** Nivel de complejidad que agrega el proceso.
#### Intermediarios

Los dispositivos finales y su función: son los hosts.
Proporciona conectividad y garantiza el flujo de datos a través de la red.
**Ejemplos:**
* Hubs, switches y puntos de acceso inhalambricos.
* Internetwork (routers).
* Servidores.
* Firewalls.

**Tienen como funciones principales:**
* Volver a **generar** y **transmitir** señales de datos.
* **Notificar** a otros dispositivos los **errores**.
* QoS: **Garantizar** que la información llegue
* **Permitir** o **denegar** el flujo de datos.
#### Medios de red

Es el canal por el cual se transmite el mensaje.
##### Criterios
* **Distancia** en el cual el medio puede transportar una señal.
* El **ambiente** en el cual se instalará el medio.
* La **cantidad de datos** y la **velocidad** a la que se deben transmitir.
* El **costo del medio** y de la **instalación**.

---
## Tipos de red

Existen diferentes tipos de redes.
### LAN
Redes de area local.

### WAN
Conexión de LANs.

### Internet
Entramado global de redes intercontectadas. Internet se crea por la interconexión de redes que pertenecen los Proveedores de Servicios de Internet (ISP).

### ARPANET

## Modelo OSI

### Capa física
Sigue estándares:
* propiedades físicas y eléctricas
* Propiedades mecánicas (materiales, dimensiones, diagrama de pines) de los conectores
* Representación de los bits mediante señales (codificación)
#### Trama
Es definida por un patrón de inicio y de finalización.

