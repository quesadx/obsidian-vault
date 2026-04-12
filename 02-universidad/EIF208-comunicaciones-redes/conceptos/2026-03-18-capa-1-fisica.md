---
Fecha: 2026-03-18
moc: "[[moc-comunicaciones-redes]]"
---

# Capa Física (Layer 1)

La **capa física** define la transmisión de **bits** a través de un medio físico. Su trabajo es convertir bits en señales (eléctricas, ópticas o de radio) y viceversa, y garantizar que ambos extremos puedan interpretar correctamente las variaciones del medio.

### ¿Qué hace la capa física?

- Concertar el medio de transmisión (cables, fibra, aire) y sus conectores.
- Definir cómo se representan los bits en señales físicas (codificación, señalización).
- Señalar el inicio y fin de una transmisión (sincronización).
- Coordinar las características eléctricas/ópticas/radio del enlace.

> **PDU (Protocol Data Unit)**
> La unidad de datos que maneja la capa física son los **bits**.

| **Capa**                         | **PDU**  |
| -------------------------------- | -------- |
| Aplicación, Presentación, Sesión | Datos    |
| Transporte                       | Segmento |
| Red                              | Paquete  |
| Enlace de datos                  | Trama    |
| Física                           | Bits     |

---

## Estándares de la capa física

Los estándares definen cómo deben ser los medios, los conectores, las señales y los códigos para lograr interoperabilidad.

### Áreas principales de estándares
- Propiedades **físicas** y **eléctricas** de los medios (impedancia, atenuación, ancho de banda).
- Propiedades mecánicas (dimensiones, diagrama de **pines**, **materiales**) de los **conectores**.
- Representación de **bits** en señales (codificación, line coding).
- Definición de señales de **control** (handshake, sincronización).

> Ejemplos:
> - IEEE 802.3 (Ethernet sobre cobre/fibra)
> - IEEE 802.11 (Wi‑Fi)
> - ITU‑T G.652/G.657 (fibra óptica)
> - TIA/EIA‑568 (cableado estructurado)

---

## Señalización y codificación

### Señalización

La señalización consiste en representar bits cambiando una o más propiedades de la señal:
- **Amplitud:** nivel de voltaje (o intensidad óptica).
- **Frecuencia:** número de ciclos por segundo.
- **Fase:** posición de la onda respecto a un punto de referencia.

### Codificación de línea (Line Coding)

Los códigos de línea definen cómo se convierten los bits en patrones de señal:

| **Tipo de codificación** | **Descripción** |
| ------------------------ | --------------- |
| **NRZ** (Non‑Return to Zero) | 0 = bajo voltaje, 1 = alto voltaje. Simple, pero sin transiciones puede perder sincronización. |
| **Manchester** | Cada bit contiene una transición; 0 = alto→bajo, 1 = bajo→alto (o viceversa según variante). Incluye sincronización local. |
| **4B/5B, 8B/10B** | Convierte bloques de bits en códigos balanceados (igual cantidad de 0s y 1s) para mantener DC balance y generar suficientes transiciones. |

> **Grupos de códigos:** bloques de bits que se transforman en patrones más largos y controlados para facilitar sincronización y detección de errores en la capa física.

---

## Medición del rendimiento de la capa física

La capacidad de transportar datos se describe con varias métricas:

- **Ancho de banda (bandwidth):** Capacidad teórica máxima del medio (Hz para señal, bps para datos).
- **Throughput:** Velocidad real de transmisión de datos en el enlace.
- **Goodput:** Velocidad de datos útiles recibidos, descontando encabezados, retransmisiones y sobrecarga.

> **Relación:**
> `goodput ≤ throughput ≤ ancho de banda`

---

## Medios físicos

### Modos de transmisión

- **Half‑duplex:** La transmisión se hace en un solo sentido a la vez; los extremos deben turnarse. Ej.: Ethernet clásico en bus coaxial.
- **Full‑duplex:** Transmisión simultánea en ambos sentidos (requiere medios separados o separación de frecuencia). Ej.: Ethernet sobre par trenzado (cada par transmite y recibe al mismo tiempo).

### Medios de cobre

Los cables de cobre forman el medio físico para muchas redes LAN. Los pares trenzados reducen la diafonía y el ruido.

- **UTP (Unshielded Twisted Pair):** Par trenzado sin blindaje adicional. Común en redes Ethernet (Cat5e/Cat6/Cat6a).
- **STP (Shielded Twisted Pair):** Similar al UTP pero con apantallamiento (hoja o trenza) alrededor de los pares o del cable completo para reducir interferencia.
- **Coaxial:** Conductor central, aislamiento dieléctrico, blindaje y cubierta. Usado históricamente en Ethernet y TV por cable.

### Medios de fibra óptica

- **Monomodo:** Núcleo estrecho que permite que la luz viaje en un único modo. Ideal para largas distancias y altas tasas.
- **Multimodo:** Núcleo más ancho que permite múltiples modos de propagación. Adecuado para distancias cortas (por ejemplo, dentro de un edificio).

### Medios inalámbricos

- **Wi‑Fi:** Redes LAN inalámbricas basadas en IEEE 802.11. Usa ondas de radio (2.4 GHz, 5 GHz, 6 GHz) y comparte el medio mediante CSMA/CA.
- **Bluetooth:** Enlace de corto alcance para dispositivos personales. Usa salto de frecuencia (FHSS) en 2.4 GHz y tiene modos de bajo consumo (BLE).
- **Satelital:** Comunicación de larga distancia via satélite. Ofrece cobertura amplia, pero tiene alta latencia y depende de antenas direccionales y enlaces uplink/downlink.

