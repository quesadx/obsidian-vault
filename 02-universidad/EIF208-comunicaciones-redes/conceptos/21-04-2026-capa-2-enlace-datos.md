---
Fecha: 21-04-2026
moc: "[[moc-comunicaciones-redes]]"
---

# Modelo OSI: Capa 2

Se encarga de dos funciones fundamentales:

- Acceso a medios: Permite a capas superiores acceder a los medios físicos mediante técnicas de entramado (framing)
- Regula cómo se colocan y reciben los datos en los medios usando MAC y CRC.

---

## Subcapa LLC (Logical Link Control)

- Interfaz con Capa 3
- Control de flujo y errores
- Identificación de protocolo superior

## Subcapa MAC (Media Access Control)

- Direccionamiento físico (MAC)
- Control de acceso al medio
- Delimitación de tramas

---

## Estructura detallada de una trama

La trama de la Capa 2 se divide en encabezado, campo de datos y tráiler. Cada campo tiene una función específica para el envío fiable en el medio compartido.

### Campos del encabezado (Header)

| Campo                    | Función técnica                                                 | Ejemplo / Valor        |
| ------------------------ | --------------------------------------------------------------- | ---------------------- |
| Inicio de trama (SFD)    | Delimita el comienzo real de la trama después de la preámbulo   | `10101011` en Ethernet |
| Dirección MAC Destino    | Identifica el receptor en el dominio de difusión local          | `00:1A:2B:3C:4D:5E`    |
| Dirección MAC Origen     | Identifica el emisor en el dominio de difusión local            | `AA:BB:CC:DD:EE:FF`    |
| Tipo / Longitud          | Indica el protocolo de capa superior o el tamaño de los datos   | `0x0800` = IPv4        |
| Prioridad / QoS (802.1p) | Define la clase de servicio para tráfico en redes con VLAN      | Valores `0-7`          |
| Control lógico (LLC)     | Establece la conexión lógica entre nodos y el servicio a Capa 3 | DSAP, SSAP, Control    |
| Control físico (MAC)     | Gestiona el acceso al medio compartido                          | CSMA/CD, CSMA/CA       |
| Control de flujo         | Regula la tasa de transmisión entre nodos                       | Ventana deslizante     |
| Control de congestión    | Señala saturación o prioridad en el medio                       | Bits ECN               |
|                          |                                                                 |                        |

### Campo de datos (Payload)

- Contiene la PDU de la Capa 3, por ejemplo un paquete IP.
- Tamaño variable según la MTU del medio: en Ethernet suele ser `46-1500 bytes`.
- Si la carga útil es menor al mínimo, se inserta relleno para alcanzar el tamaño mínimo de trama.

### Campo del tráiler (FCS - Frame Check Se
## Subcapa MAC (Media Access Control)

- Direccionamiento físico (MAC)
- Control de acceso al medio
- Delimitación de tramas

---

## Estructura detallada de una trama

La trama de la Capa 2 se divide en encabezado, campo de datos y tráiler. Cada campo tiene una función específica para el envío fiable en el medio compartido.

### Campos del encabezado (Header)

| Campo                    | Función técnica                                                 | Ejemplo / Valor        |
| ------------------------ | --------------------------------------------------------------- | ---------------------- |
| Inicio de trama (SFD)    | Delimita el comienzo real de la trama después de la preámbulo   | `10101011` en Ethernet |
| Dirección MAC Destino    | Identifica el receptor en el dominio de difusión local          | `00:1A:2B:3C:4D:5E`    |
| Dirección MAC Origen     | Identifica el emisor en el dominio de difusión local            | `AA:BB:CC:DD:EE:FF`    |
| Tipo / Longitud          | Indica el protocolo de capa superior o el tamaño de los datos   | `0x0800` = IPv4        |
| Prioridad / QoS (802.1p) | Define la clase de servicio para tráfico en redes con VLAN      | Valores `0-7`          |
| Control lógico (LLC)     | Establece la conexión lógica entre nodos y el servicio a Capa 3 | DSAP, SSAP, Control    |
| Control físico (MAC)     | Gestiona el acceso al medio compartido                          | CSMA/CD, CSMA/CA       |
| Control de flujo         | Regula la tasa de transmisión entre nodos                       | Ventana deslizante     |
| Control de congestión    | Señala saturación o prioridad en el medio                       | Bits ECN               |

### Campo de datos (Payload)

- Contiene la PDU de la Capa 3, por ejemplo un paquete IP.
- Tamaño variable según la MTU del medio: en Ethernet suele ser `46-1500 bytes`.
- Si la carga útil es menor al mínimo, se inserta relleno para alcanzar el tamaño mínimo de trama.

### Campo del tráiler (FCS - Frame Check Sequence)

- Función: detección de errores mediante CRC (Cyclic Redundancy Check).
- Proceso:
  1. El emisor calcula el CRC sobre el encabezado y los datos.
  2. Inserta el resultado en el campo FCS (`4 bytes` en Ethernet).
  3. El receptor recalcula el CRC y lo compara con el FCS recibido.
  4. Si difieren, la trama se descarta en Capa 2 (no hay retransmisión automática en esta capa).

---

## Cómo aprender la estructura de una trama de Capa 2

### Analogía central
- La trama es como un **sobre inteligente**.
- El contenido real es la **carta interior** (PDU de Capa 3).
- La Capa 2 solo se preocupa por la entrega **local** entre dispositivos conectados directamente.

### Propósitos principales de los campos
- **Delimitación**: SFD marca dónde comienza la trama.
- **Direccionamiento**: MAC Destino y Origen dicen a quién y de quién es la trama.
- **Identificación**: Type/Longitud y QoS indican qué lleva y qué prioridad tiene.
- **Control**: LLC, MAC, flujo y congestión regulan cómo se comparte el medio.
- **Integridad**: FCS verifica que la trama llegó sin errores.

### Núcleo esencial
Estos son los campos mínimos que siempre están en una trama Ethernet útil:
1. **SFD** → delimita la trama.
2. **MAC Destino / Origen** → direccionan localmente.
3. **Type** → identifica el protocolo de Capa 3.
4. **FCS** → verifica integridad.

### Cómo practicar
- Dibuja una trama con el **Core 4** y pregunta: ¿puede entregar datos localmente?
- Añade luego los campos de control según el caso: **CSMA/CD** o **CSMA/CA** para el acceso al medio, **QoS** para prioridades, **LLC** si hay conexión lógica.
- Repasa la diferencia: las **MAC cambian en cada salto local**, las **IP se mantienen**.

### Preguntas clave para entender la trama
- ¿Dónde empieza y termina la trama? → **SFD**
- ¿A quién va y de quién viene? → **MAC Destino / Origen**
- ¿Qué protocolo utiliza el contenido? → **Type**
- ¿Llegó bien? → **FCS / CRC**

### Idea central
La trama cuenta una historia local: entrega rápida y confiable dentro del segmento. La Capa 3 se encarga del destino final global. Aprende la trama como un sobre con dirección, etiqueta, reglas de tráfico y sello de verificación, no solo como una lista de campos.
