---
Fecha: 18-03-2026
moc: "[[moc-comunicaciones-redes]]"
---

# Capa de enlace de datos (Layer 2)

La capa física prepara el canal; la **capa de enlace de datos** se encarga de formar tramas, detectar/corregir errores y controlar el acceso al medio. Actúa como intermediario para las capas superiores y el medio físico.

La capa de enlace de datos elije un protocolo para ser usado durante el enlace de datos en función al medio. Actúa como un traductor universal entre las capas superiores y los medios físicos

**La capa de enlace de datos se encarga de adaptar esa comunicación al medio que corresponda en cada tramo.**

---

## ¿Qué hace la capa de enlace de datos?

1. **Tramado:** Toma la PDU de la Capa 3 (paquete IP) y la encapsula en una trama, agregando direcciones MAC de origen y destino, y un campo de detección de errores (FCS).
2. **Control de acceso al medio (MAC):** Define las reglas para que los dispositivos acceder al medio sin colisionar. Pueden ser:
	1. Determinista: por turno. Ejemplo: Token Ring, FDDI.
	2. No determinista: Permite que cualquier dispositivo intente acceder al medio. Se usa CSMA para detectar si los medios están transportando una señal portadora. Ejemplo: Ethernet e inalámbricas.
3. **Detección de errores:** Al recibir una trama, verifica mediante el campo FCS si hubo errores de transmisión. Si es que hubieron, se manda para la pinga.

> **CSMA/CD:**
> Corresponde a una detección de colisión. El dispositivo controla los medios para detectar la presencia de una señal de datos. Si no hay una señal de datos, indica que el medio está libre, el dispositivo transmite los datos.

>**CSMA/CA:**
>El dispositivo controla los medios para detectar la presencia de una señal de datos. Si el medio está libre, el dispositivo envía una notificación a través del medio, sobre su intención de utilizarlo.

Su rol es fundamental porque **releva a las capas superiores** de la responsabilidad de gestionar el acceso a los diferentes tipos de medios de red.

> **Aclaración:**
> Es la capa del modelo OSI responsable de la comunicación **nodo a nodo** (de un dispositivo al siguiente dentro del mismo medio). No se encarga del viaje completo de los datos, solo del tramo local.

### Su rol frente a otras capas

Hacia arriba, abstrae el medio físico para que la Capa 3 no tenga que preocuparse por si el medio es Ethernet, WiFi u otro. Hacia abajo, entrega las tramas a la Capa 1 para que las convierta en señales.

---

## El NIC (tarjeta de red)

Es el punto de contacto entre el software (capas superiores) y el medio físico. Sin el NIC, el dispositivo no tiene forma de interactuar con la red en ningún nivel.

> **Importante:**
> No confundir con el MAC (de "dirección MAC", por ejemplo: `00:1A:2B:3C:4D:5E`). 

## ¿De qué depende cuál técnica se usa?

De dos factores: si los nodos **comparten el medio** entre sí, y la **topología** de la red.

---

## LLC y MAC en conjunto

- La **LLC (Logical Link Control)** se encarga de la comunicación con las capas superiores. Identifica qué protocolo de capa 3 se está usando (IPv4, IPv6) para entregar correctamente. 
- La **MAC (Media Access Control)** construye las tramas y controla cuándo y cómo se transmiten por el medio.

> **Aclaración:**
> LLC -> puente hacia Capa 3
> MAC -> puente hacia Capa 1

---

## Comparación entre topología física y lógica


| **Topología** | **Descripción**                                                                                                                                         |
| ------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Física        | Configuración entre nodos y las conexiones físicas entre ellos                                                                                          |
| Lógica        | Es la forma en que una red transfiere tramas de un nodo al siguiente. Esta es la vista por la capa lógica al controlar el acceso de datos a los medios. |

---

## Topología punto a punto y multiacceso

- Una **topología punto a punto conecta dos nodos directamente entre sí**. El protocolo de acceso suele ser muy simple. **Agregar conexiones físicas intermedias puede no cambiar la topología lógica.**
- La topología multiacceso es aquella donde cada nodo ve las tramas que se encuentran en el medio, pero solamente el nodo al cual se dirige la trama procesa sus contenidos. **Son generalmente CSMA/CD o CSMA/CA**.

---

![[Pasted image 20260319000413.png]]

Dependiendo del protocolo utilizado, la estructura de la trama y campos de contenidos en el encabezado y trailer varían:

- **En un ambiente frágil** se necesita mayor control para asegurar la entrega, lo que produce campos de **encabezado y trailer grandes para más información de control**.
- **En un ambiente protegido** estos se reducen, **aumentando la velocidad de transmisión**.

> **Detalle:**
> Las direcciones en esta capa (dentro de la cabecera de la trama) son solamente físicas, pues sólo se utilizan para transportar datos entre nodos a través del medio local.


![[Pasted image 20260319000556.png]]

