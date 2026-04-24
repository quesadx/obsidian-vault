---
Fecha: 20-04-2026
moc: "[[moc-comunicaciones-redes]]"
---
# Modelo OSI: Capa 1
 
## 1. Modelos y protocolos

El objetivo de la capa física es la señal óptica, eléctrica o de microondas que representa a los bits en cada trama.

---
### 1.1 Funcionamiento

Los medios no transportan la trama como una única entidad. Los medios representan señales, una por vez, para represntar los bits que conforman la trama.

---

### 1.2 Estándares

En esta capa los estándares están implementados por hardware.

Las tecnologías definidas por estas organizaciones incluyen cuatro áreas de
estándares de la capa física:

- `Propiedades físicas` y `eléctricas de los medios`
- Propiedades `mecánicas` (materiales, dimensiones, diagrama de pines) de los conectores
- Representación de los bits mediante señales (`codificación`)
- Definición de las señales de la `información de control`

---

### 1.3 Principios fundamentales

Las tres funciones esenciales de la capa Física son:

- Los componentes físicos
- Codificación de datos
- Señalización

> La capa física se encarga de la codificación y señalización de datos, junto al concepto de componentes físicos.

Existen diferentes métodos de señalización, y cada uno se distingue con:

- Amplitud
- Frecuencia
- Etapa

---

### 1.4 Señalización

Se alteran variables para proyectar bits en el medio.

#### 1.4.1 NRZ (Non-Return to Zero)

Un valor de voltaje bajo representa un 0 lógico y un valor alto un 1 lógico.

Se llama Non-Return to Zero porque la señal no regresa a un nivel base (cero) entre bits.

![[Pasted image 20260420142426.png]]

#### 1.4.2 RZ (Return to Zero)

En `RZ` la señal regresa a nivel cero en la mitad del período de cada bit.

- Un `1` se representa con un pulso positivo en la primera mitad del intervalo, luego vuelve a cero.
- Un `0` se representa con un pulso nulo o a cero durante todo el intervalo.

Esto facilita la sincronización porque hay una transición en cada bit, pero requiere más ancho de banda que NRZ.

Ejemplo:
- `1` → +V durante la primera mitad, 0 durante la segunda mitad.
- `0` → 0 durante todo el bit.

#### 1.4.3 RZ-AMI (Return to Zero - Alternate Mark Inversion)

`RZ-AMI` combina retorno a cero con inversión alternada para los `1`.

- Los `0` se representan con nivel cero durante todo el intervalo.
- Los `1` se representan con pulsos positivos y negativos alternados en la primera mitad del bit, y luego regresan a cero en la segunda mitad.

Beneficios:
- Mantiene balance DC porque los pulsos `1` alternan polaridad.
- Facilita la detección de errores de pérdida de sincronización en largas secuencias de `1`.

Limitaciones:
- Requiere ancho de banda adicional respecto a NRZ por el retorno a cero.
- Si hay muchos ceros, la sincronización puede degradarse sin otras técnicas adicionales.

#### 1.4.4 Manchester

En Manchester, cada bit se representa mediante una transición de voltaje en el medio del intervalo del bit:

- `0` → transición de alto a bajo.
- `1` → transición de bajo a alto.

Esto garantiza al menos una transición por bit, lo que facilita la sincronización, pero dobla el número de cambios en la señal comparado con NRZ.

![[Pasted image 20260420143251.png]]

---

### 1.5 Agrupación

Un grupo de códigos es una secuencia consecutiva de bits de código que se
interpretan y asignan como patrones de bits de datos.

- Un patrón de señales físicas específicas denota el comienzo de la trama
- Señales físicas que representan el contenido del frame se posicionan en el medio
- Un patrón de señales denota el final de la trama

---

### 1.6 Capacidad de transportar datos

La transferencia de datos puede medirse de tres formas:

- `Ancho de banda (bandwidth)`: capacidad teórica máxima del canal (límite superior)
- `Rendimiento (throughput)`: tasa real a la que se transmiten datos a través del sistema (incluye pérdidas, congestión, etc.)
- `Capacidad de transferencia útil (goodput)`: parte del throughput que corresponde solo a datos útiles, excluyendo overhead, retransmisiones y control

---

## 2. Medios

### 2.1 Medios de cobre

Los tipos de cable con blindaje o trenzado de pares de alambre están diseñados para minimizar la degradación de señales debido al ruido electrónico. Constan de:

- Categoría
- Diseño Infraestructura
- Técnicas de cableado


> No interpreta datos, no maneja direcciones (como MAC), ni se preocupa por el contenido.
> Solo ve una **corriente de bits** y la transforma en señales.

> Corresponde a componentes físicos (cables, conectores, dispositivos como NICs, hubs y repetidores), codificación de datos y señalización de bits.

> La **capa física** opera con **señales**, no con datos estructurados. 
> Sus tres pilares son: **componentes físicos**, **codificación** y **señalización**.  
> Su trabajo termina cuando los bits llegan al medio… ¡y empieza cuando los recibe del medio!