# Parte 1 – Especificación de Requerimientos de Software (SRS)
## Sistema: TicoMarket Mobile – Versión 1.0
### Universidad Nacional de Costa Rica · Sede Regional Brunca · Ingeniería en Sistemas
**Curso:** Ingeniería de Software I · I Ciclo 2026

---

## 1. Introducción

### 1.1 Propósito

Este documento constituye la Especificación de Requerimientos de Software (SRS) del sistema **TicoMarket Mobile v1.0**, elaborado conforme a la norma IEEE 830 y adaptado al contexto de la metodología RUP. Su propósito es describir de forma precisa, completa y verificable el comportamiento esperado del sistema, establecer los límites del producto y servir como contrato técnico entre la organización TicoMarket S.A. y el equipo de desarrollo.

**Audiencia esperada:**
- Equipo de desarrollo (backend, frontend móvil, QA)
- Project Manager del proyecto
- Gerencia Comercial (patrocinador y dueño del producto)
- Equipo de TI interno (responsable de integraciones)
- Auditores de calidad y probidad académica

### 1.2 Alcance del producto

**TicoMarket Mobile** es una plataforma digital compuesta por una aplicación móvil (Android e iOS) y un portal web transaccional, cuyo propósito es habilitar la compra en línea de productos de supermercado a los clientes de TicoMarket S.A., integrando el inventario en tiempo real con el sistema POS heredado y cumpliendo la normativa de facturación electrónica costarricense.

**Qué hará la versión 10:**
- Permitir la navegación de catálogo con disponibilidad por sucursal
- Procesar transacciones con tarjeta de crédito/débito y SINPE Móvil
- Gestionar entregas a domicilio y modalidad pick-up
- Ofrecer programa de fidelización con acumulación y canje de puntos
- Proveer panel administrativo para gerentes de sucursal
- Generar facturas electrónicas conforme a la DGT
- Integrar inventario en tiempo real con el sistema POS existente

**Qué NO hará la versión 10:**
- No incluirá motor de recomendaciones inteligente (pospuesto a v20)
- No tendrá portal para proveedores externos (pospuesto a v20)
- No operará fuera del territorio nacional de Costa Rica
- No gestionará devoluciones ni cambios en línea
- No integrará métodos de pago internacionales (PayPal, Stripe, etc.)
- No tendrá funcionalidad de chat o soporte en tiempo real

### 1.3 Definiciones, siglas y abreviaturas

| Término     | Definición                                                                         |
| ----------- | ---------------------------------------------------------------------------------- |
| SRS         | Software Requirements Specification (Especificación de Requerimientos de Software) |
| POS         | Point of Sale – sistema de punto de venta heredado en Visual Basic 6               |
| DGT         | Dirección General de Tributación de Costa Rica                                     |
| SINPE Móvil | Sistema Nacional de Pagos Electrónicos del Banco Central de Costa Rica             |
| API REST    | Interfaz de programación de aplicaciones basada en el estilo arquitectónico REST   |
| RF          | Requerimiento Funcional                                                            |
| RNF         | Requerimiento No Funcional                                                         |
| CU          | Caso de Uso                                                                        |
| UX/UI       | User Experience / User Interface                                                   |
| GPS         | Global Positioning System                                                          |
| RUP         | Rational Unified Process                                                           |
| BIA         | Business Impact Analysis – Análisis de Impacto al Negocio                          |
| NPR         | Número de Prioridad del Riesgo                                                     |
| GAM         | Gran Área Metropolitana                                                            |
| Pick-up     | Modalidad de retiro en tienda por parte del cliente                                |

### 1.4 Visión general del documento

El presente documento se organiza en tres secciones principales:
- **Sección 1 (Introducción):** propósito, alcance, terminología y estructura.
- **Sección 2 (Descripción General):** perspectiva del producto, funciones de alto nivel, perfiles de usuario, restricciones y dependencias.
- **Sección 3 (Requerimientos Específicos):** modelos de casos de uso, especificaciones detalladas y requerimientos suplementarios.

---

## 2. Descripción General

### 2.1 Perspectiva del producto

TicoMarket Mobile es un sistema nuevo que se integra con infraestructura existente. No reemplaza al POS heredado; actúa como capa digital de cara al cliente que consume servicios del POS mediante un API REST.

**Interfaces previstas:**

| Tipo de interfaz                             | Descripción                                                                           | Justificación                                                          |
| -------------------------------------------- | ------------------------------------------------------------------------------------- | ---------------------------------------------------------------------- |
| **Interfaz de usuario – Móvil**              | App nativa Android (API 26+) e iOS (14+)                                              | Cobertura del 95 %+ del mercado costarricense de smartphones           |
| **Interfaz de usuario – Web**                | Portal responsive (React + PWA)                                                       | Acceso desde computadores de escritorio y navegadores sin instalar app |
| **Interfaz de hardware**                     | Cámara del dispositivo para escaneo de QR (pick-up) y GPS para seguimiento de entrega | Funcionalidades logísticas requieren sensores del dispositivo          |
| **Interfaz de software – POS**               | API REST provista por TI interno (JSON sobre HTTPS)                                   | Sincronización de inventario en tiempo real con el sistema heredado    |
| **Interfaz de software – Pasarela de pagos** | SDK del proveedor local de pagos (tarjeta y SINPE Móvil)                              | Procesamiento seguro de transacciones financieras                      |
| **Interfaz de software – DGT**               | Servicio web de Hacienda para facturación electrónica XML                             | Obligación legal; multas por incumplimiento                            |
| **Interfaz de comunicación**                 | HTTPS/TLS 1.3 para todas las comunicaciones cliente–servidor                          | Confidencialidad e integridad de datos en tránsito                     |

### 2.2 Funciones del producto – Modelo de casos de uso de alto nivel

Los siguientes casos de uso representan las funciones principales del sistema agrupadas por actor:

| ID    | Caso de Uso                                            | Actor Principal                  |
| ----- | ------------------------------------------------------ | -------------------------------- |
| CU-01 | Registrarse y autenticarse                             | Cliente final                    |
| CU-02 | Navegar catálogo y buscar productos                    | Cliente final                    |
| CU-03 | Gestionar carrito y realizar pedido                    | Cliente final                    |
| CU-04 | Procesar pago (tarjeta / SINPE Móvil)                  | Cliente final, Pasarela de pagos |
| CU-05 | Seleccionar modalidad de entrega (domicilio / pick-up) | Cliente final                    |
| CU-06 | Seguir pedido en tiempo real                           | Cliente final                    |
| CU-07 | Acumular y canjear puntos de fidelización              | Cliente final                    |
| CU-08 | Gestionar catálogo y precios por sucursal              | Gerente de sucursal              |
| CU-09 | Consultar reportes de ventas y stock                   | Gerente de sucursal              |
| CU-10 | Generar factura electrónica                            | Sistema, DGT                     |
| CU-11 | Sincronizar inventario con POS                         | Sistema, POS heredado            |

### 2.3 Características de los usuarios

**Perfil 1: Cliente Final (Consumidor)**
- **Descripción:** Persona mayor de 18 años, habitante de la GAM o la Zona Sur, con smartphone Android/iOS o acceso a computadora.
- **Experiencia técnica:** Baja a media; familiarizado con apps de compra como Uber Eats o Amazon.
- **Necesidades principales:** Facilidad de compra, precios visibles, trazabilidad del pedido, opciones de pago flexibles.
- **Frecuencia de uso:** Varias veces por semana.

**Perfil 2: Gerente de Sucursal**
- **Descripción:** Empleado de TicoMarket, encargado operativo de una sucursal específica.
- **Experiencia técnica:** Media; maneja el POS actual y herramientas de oficina.
- **Necesidades principales:** Visibilidad del inventario en línea, gestión de pedidos pick-up, reportes operativos.
- **Frecuencia de uso:** Diaria, durante el horario laboral.

**Perfil 3: Administrador del Sistema (TI Interno)**
- **Descripción:** Ingeniero del equipo de TI de TicoMarket, responsable de la operación de la plataforma.
- **Experiencia técnica:** Alta; maneja bases de datos, APIs y despliegues.
- **Necesidades principales:** Monitoreo de integraciones, gestión de usuarios, diagnóstico de errores.
- **Frecuencia de uso:** Diaria; con picos ante incidentes.

**Perfil 4: Repartidor / Personal Logístico**
- **Descripción:** Empleado o contratista encargado de efectuar entregas a domicilio.
- **Experiencia técnica:** Baja; usa smartphone para recibir órdenes y actualizar estado.
- **Necesidades principales:** Listado de entregas asignadas, navegación GPS, confirmación de entrega.
- **Frecuencia de uso:** Diaria durante turno.

### 2.4 Restricciones de diseño

| ID    | Restricción                                                                      | Tipo                | Justificación                                                                                              |
| ----- | -------------------------------------------------------------------------------- | ------------------- | ---------------------------------------------------------------------------------------------------------- |
| RD-01 | El sistema debe operar con el API REST del POS sin modificar el sistema heredado | Tecnológica         | El POS en VB6 no puede ser alterado; la integración es unidireccional de lectura/escritura mediante API    |
| RD-02 | El módulo de pagos debe cumplir PCI-DSS nivel 1                                  | Normativa/Seguridad | Exigencia del proveedor de pasarela de pagos y buenas prácticas para manejo de datos de tarjetas           |
| RD-03 | La factura electrónica debe seguir el esquema XML v4.4 de la DGT                 | Normativa/Legal     | Obligación tributaria costarricense; incumplimiento implica sanciones económicas                           |
| RD-04 | El presupuesto total es de ₡120 millones sin posibilidad de ampliación           | Organizacional      | Aprobado por junta directiva; toda decisión tecnológica debe valorar costo-beneficio dentro de este límite |
| RD-05 | El sistema debe soportar Android API 26+ e iOS 14+                               | Tecnológica         | Cubre el 90 %+ de los dispositivos activos en el mercado costarricense según datos de mercado              |
| RD-06 | Todas las comunicaciones deben cifrase con TLS 1.3                               | Seguridad           | Protección de datos personales y financieros conforme a la Ley 8968 de Protección de Datos de Costa Rica   |
| RD-07 | El cronograma no puede exceder 12 meses                                          | Organizacional      | Condicionado por campaña comercial del segundo semestre; retrasos implican pérdida de ventana comercial    |

### 2.5 Supuestos y dependencias críticas

| ID    | Supuesto / Dependencia                                                                           | Impacto si falla                                                                       |
| ----- | ------------------------------------------------------------------------------------------------ | -------------------------------------------------------------------------------------- |
| SD-01 | El área de TI interno entregará el API REST del POS en las primeras 8 semanas del proyecto       | Bloqueo de sincronización de inventario; imposibilita pruebas de integración en tiempo |
| SD-02 | El proveedor de la pasarela de pagos estabilizará su servicio antes del lanzamiento              | Imposibilidad de procesar transacciones; inviabiliza el producto                       |
| SD-03 | La Gerencia Comercial congelará requerimientos en el sprint de revisión final (mes 10)           | Cambios tardíos generan retrabajo que excede presupuesto y cronograma                  |
| SD-04 | Los gerentes de sucursal recibirán capacitación en el panel administrativo antes del lanzamiento | Adopción deficiente del sistema; datos de inventario inconsistentes                    |
| SD-05 | La DGT no realizará cambios mayores al esquema de facturación electrónica durante el proyecto    | Cambios de esquema obligarían a re-trabajo en el módulo de facturación                 |

---

## 3. Requerimientos Específicos

### 3.1 Modelo de caso de uso de negocio

El modelo de negocio describe la interacción del sistema con los actores externos a nivel de proceso empresarial:

| Actor de negocio    | Caso de uso de negocio                   | Descripción resumida                                               |
| ------------------- | ---------------------------------------- | ------------------------------------------------------------------ |
| Cliente final       | Comprar en línea                         | El cliente navega, selecciona productos, paga y recibe su pedido   |
| Gerente de sucursal | Gestionar operación de sucursal en línea | El gerente administra inventario, precios y pedidos desde el panel |
| DGT                 | Cumplir obligaciones fiscales            | El sistema emite facturas electrónicas válidas ante Hacienda       |
| POS Heredado        | Sincronizar inventario                   | El sistema consulta y actualiza stock en el POS en tiempo real     |
| Pasarela de pagos   | Procesar transacciones financieras       | El sistema delega el cobro al proveedor de pagos externo           |

### 3.2 Modelo de caso de uso de sistema

*(Ver diagrama de casos de uso en Anexo A del documento final)*

**Actores del sistema:**
- **Cliente Final** – usuario primario de app y portal
- **Gerente de Sucursal** – usuario del panel administrativo
- **Sistema POS** – actor externo de integración
- **Pasarela de Pagos** – actor externo financiero
- **DGT** – actor externo regulatorio
- **Repartidor** – usuario logístico

**Relaciones de inclusión y extensión relevantes:**
- CU-03 (Gestionar carrito) *incluye* CU-04 (Procesar pago)
- CU-03 *incluye* CU-05 (Seleccionar modalidad de entrega)
- CU-04 *incluye* CU-10 (Generar factura electrónica)
- CU-11 (Sincronizar inventario) *extiende* CU-02 (Navegar catálogo)

---

### 3.3 Especificación detallada de casos de uso prioritarios

**Criterio de selección:** Se seleccionaron los casos de uso CU-03 y CU-04 por ser los de mayor valor de negocio (generan el ingreso directo) y mayor riesgo técnico (dependencia de pasarela de pagos e integración con POS). Son también los que concentran más requerimientos funcionales y no funcionales verificables.

---

#### CU-03: Gestionar Carrito y Realizar Pedido

| Campo                   | Detalle                                                                                                                                                                                                       |
| ----------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Identificador**       | CU-03                                                                                                                                                                                                         |
| **Nombre**              | Gestionar Carrito y Realizar Pedido                                                                                                                                                                           |
| **Actor principal**     | Cliente Final                                                                                                                                                                                                 |
| **Actores secundarios** | Sistema POS (verificación de stock), Pasarela de Pagos                                                                                                                                                        |
| **Descripción**         | Permite al cliente agregar productos al carrito, revisar el resumen del pedido, seleccionar la modalidad de entrega y confirmar la orden para proceder al pago.                                               |
| **Precondiciones**      | 1. El cliente está autenticado en el sistema. 2. Al menos un producto ha sido seleccionado del catálogo. 3. La sucursal de origen tiene stock disponible del producto (verificado en tiempo real con el POS). |
| **Postcondiciones**     | 1. La orden queda registrada en el sistema con estado "Pendiente de pago". 2. El stock del producto queda reservado en el POS durante 15 minutos. 3. El sistema redirige al CU-04 (Procesar Pago).            |

**Flujo principal:**

| Paso | Actor   | Acción                                                                                      |
| ---- | ------- | ------------------------------------------------------------------------------------------- |
| 1    | Cliente | Selecciona un producto en el catálogo y presiona "Agregar al carrito"                       |
| 2    | Sistema | Verifica disponibilidad de stock en tiempo real con el POS. Actualiza contador del carrito. |
| 3    | Cliente | Navega al carrito; visualiza listado de productos, cantidades y subtotales                  |
| 4    | Cliente | Modifica cantidades o elimina productos según necesidad                                     |
| 5    | Sistema | Recalcula totales, aplica descuentos vigentes y muestra ITBIS                               |
| 6    | Cliente | Selecciona sucursal de origen (en caso de múltiples opciones con stock)                     |
| 7    | Cliente | Selecciona modalidad de entrega: domicilio o pick-up                                        |
| 8    | Cliente | Confirma dirección de entrega o sucursal de retiro                                          |
| 9    | Cliente | Presiona "Proceder al pago"                                                                 |
| 10   | Sistema | Reserva el stock en el POS (timeout: 15 min), crea registro de orden y redirige a CU-04     |

**Flujos alternos:**

| ID   | Condición                                                                                    | Acción alternativa                                                                                                  |
| ---- | -------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| FA-1 | En paso 2: el producto no tiene stock disponible                                             | El sistema muestra "Producto no disponible en esta sucursal" y sugiere sucursales alternativas con stock            |
| FA-2 | En paso 4: la cantidad solicitada supera el stock                                            | El sistema ajusta automáticamente la cantidad al máximo disponible y notifica al cliente                            |
| FA-3 | En paso 7: el cliente selecciona entrega a domicilio pero está fuera de la zona de cobertura | El sistema notifica la restricción y ofrece pick-up como alternativa                                                |
| FA-4 | En paso 9: el stock fue reservado por otro usuario durante el proceso                        | El sistema notifica al cliente, actualiza el carrito y solicita confirmación para continuar con el stock disponible |

**Excepciones:**

| ID   | Condición                                       | Manejo                                                                                                                                          |
| ---- | ----------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------- |
| EX-1 | El API del POS no responde en más de 3 segundos | El sistema muestra mensaje de error "No se puede verificar disponibilidad en este momento. Intente de nuevo." y registra el incidente en el log |
| EX-2 | La sesión del cliente expira durante el proceso | El sistema guarda el carrito en estado temporal por 24 horas y solicita re-autenticación                                                        |
| EX-3 | Error de red en el dispositivo del cliente      | El sistema detecta la desconexión y muestra indicador de "Sin conexión"; reanuda cuando se restaura                                             |

---

#### CU-04: Procesar Pago

| Campo                   | Detalle                                                                                                                                                                                                                                                                                                    |
| ----------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Identificador**       | CU-04                                                                                                                                                                                                                                                                                                      |
| **Nombre**              | Procesar Pago                                                                                                                                                                                                                                                                                              |
| **Actor principal**     | Cliente Final                                                                                                                                                                                                                                                                                              |
| **Actores secundarios** | Pasarela de Pagos, DGT (generación de factura electrónica)                                                                                                                                                                                                                                                 |
| **Descripción**         | Permite al cliente seleccionar un método de pago, ingresar los datos requeridos y completar la transacción económica de un pedido. Incluye la generación de la factura electrónica ante la DGT.                                                                                                            |
| **Precondiciones**      | 1. El cliente tiene una orden en estado "Pendiente de pago". 2. El tiempo de reserva de stock no ha expirado (< 15 min). 3. La pasarela de pagos está operativa.                                                                                                                                           |
| **Postcondiciones**     | 1. La transacción queda registrada como "Aprobada" o "Rechazada". 2. Si aprobada: el estado de la orden cambia a "Confirmada", el stock se descuenta en el POS, y se genera la factura electrónica ante la DGT. 3. Se envía notificación push y correo electrónico al cliente con el resumen de la compra. |

**Flujo principal:**

| Paso | Actor    | Acción                                                                                                                                |
| ---- | -------- | ------------------------------------------------------------------------------------------------------------------------------------- |
| 1    | Sistema  | Muestra resumen del pedido: productos, total, ITBIS, modalidad de entrega                                                             |
| 2    | Cliente  | Selecciona método de pago: tarjeta de crédito/débito o SINPE Móvil                                                                    |
| 3a   | Cliente  | (Si tarjeta) Ingresa número de tarjeta, fecha de vencimiento y CVV en formulario cifrado del SDK de la pasarela                       |
| 3b   | Cliente  | (Si SINPE Móvil) Ingresa número de teléfono asociado a la cuenta SINPE                                                                |
| 4    | Sistema  | Envía solicitud de cobro a la pasarela de pagos mediante API                                                                          |
| 5    | Pasarela | Procesa la transacción y retorna código de aprobación/rechazo                                                                         |
| 6    | Sistema  | Recibe respuesta de la pasarela; si aprobada: actualiza estado de la orden, descuenta stock en POS, genera factura electrónica en DGT |
| 7    | DGT      | Valida y devuelve clave de confirmación de la factura electrónica                                                                     |
| 8    | Sistema  | Envía notificación push y correo electrónico con número de orden y factura electrónica en PDF                                         |

**Flujos alternos:**

| ID   | Condición                                                                | Acción alternativa                                                                                                                         |
| ---- | ------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------ |
| FA-1 | En paso 5: la pasarela rechaza la transacción por fondos insuficientes   | El sistema notifica al cliente "Pago rechazado: fondos insuficientes". La reserva de stock permanece 5 minutos adicionales para reintentar |
| FA-2 | En paso 5: el cliente selecciona una tarjeta guardada previamente        | El sistema muestra las tarjetas guardadas (enmascaradas) y el cliente selecciona sin reingresar datos                                      |
| FA-3 | En paso 3b: el número de SINPE no está registrado en el sistema bancario | La pasarela retorna error específico; el sistema sugiere verificar el número o cambiar método de pago                                      |

**Excepciones:**

| ID   | Condición                                                       | Manejo                                                                                                                                                                      |
| ---- | --------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| EX-1 | La pasarela de pagos no responde en más de 10 segundos          | El sistema cancela la solicitud, notifica al cliente "El servicio de pago no está disponible" y mantiene la reserva de stock 10 minutos adicionales. Registra el incidente. |
| EX-2 | La DGT no responde para emitir la factura electrónica           | El pago se confirma; la factura se encola para reintento automático en los próximos 30 minutos. Se notifica al cliente que la factura llegará por correo                    |
| EX-3 | La actualización de stock en el POS falla tras un pago aprobado | El sistema registra la inconsistencia en una cola de reconciliación. El equipo de TI recibe alerta automática para resolución manual en no más de 2 horas                   |
| EX-4 | El tiempo de reserva de stock expiró durante el proceso de pago | El sistema cancela la transacción, notifica al cliente y redirige al carrito con indicación de los productos afectados                                                      |

---

### 3.4 Requerimientos Suplementarios (No Funcionales)

| ID     | Categoría                  | Descripción                                                                                                                                                           | Criterio de verificación medible                                                                                                                      |
| ------ | -------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------- |
| RNF-01 | **Rendimiento**            | El tiempo de respuesta del catálogo de productos (carga inicial y búsqueda) no debe superar 2 segundos bajo carga normal                                              | Prueba de carga con 500 usuarios concurrentes; percentil 95 de latencia ≤ 2 s medido con JMeter                                                       |
| RNF-02 | **Rendimiento**            | El procesamiento de pago (desde envío a pasarela hasta confirmación al usuario) no debe superar 5 segundos en el 95 % de las transacciones                            | Prueba de integración con pasarela; 95th percentile de tiempo de transacción ≤ 5 s en 1000 ejecuciones                                                |
| RNF-03 | **Seguridad**              | Los datos de tarjetas de crédito nunca deben almacenarse en servidores propios de TicoMarket; toda tokenización debe realizarse en el servidor del proveedor de pagos | Auditoría de código y revisión de arquitectura confirman ausencia de almacenamiento local de PAN; certificación PCI-DSS del flujo                     |
| RNF-04 | **Seguridad**              | El sistema debe implementar autenticación de dos factores (2FA) para el acceso al panel administrativo de gerentes de sucursal                                        | Prueba funcional: el acceso al panel sin 2FA debe ser rechazado en el 100 % de los intentos                                                           |
| RNF-05 | **Usabilidad**             | Un usuario nuevo debe poder completar su primera compra sin necesidad de consultar ayuda externa en no más de 5 minutos                                               | Prueba de usabilidad con 10 usuarios no técnicos; tiempo promedio de primera compra ≤ 5 min; tasa de éxito ≥ 80 %                                     |
| RNF-06 | **Disponibilidad**         | El sistema debe mantener una disponibilidad del 99,5 % mensual en horario pico (7:00 a.m. – 10:00 p.m.)                                                               | Monitoreo con herramienta de uptime (ej. UptimeRobot); métricas mensuales deben mostrar ≥ 99,5 %                                                      |
| RNF-07 | **Mantenibilidad**         | El código fuente debe seguir las convenciones de estilo definidas en el documento de estándares del equipo, con cobertura mínima de pruebas unitarias del 70 %        | Ejecución de linter automatizado en CI/CD sin errores críticos; reporte de cobertura de pruebas ≥ 70 % generado en pipeline                           |
| RNF-08 | **Compatibilidad**         | La aplicación móvil debe funcionar correctamente en Android API 26+ e iOS 14+, representando al menos el 90 % del parque de dispositivos costarricense                | Pruebas en dispositivos físicos y emuladores de al menos 6 modelos representativos (3 Android, 3 iOS); cero errores críticos en pruebas de aceptación |
| RNF-09 | **Escalabilidad**          | La arquitectura del backend debe soportar el crecimiento hasta 50 000 usuarios registrados activos sin cambios estructurales                                          | Prueba de carga con datos de 50 000 usuarios simulados; tiempos de respuesta deben mantenerse dentro de los límites de RNF-01                         |
| RNF-10 | **Cumplimiento normativo** | Toda factura electrónica generada debe ser válida ante la DGT y transmitida en un plazo máximo de 2 horas desde confirmada la transacción                             | Revisión de logs de transmisión a DGT; 100 % de facturas transmitidas en ≤ 2 horas durante período de prueba de 30 días                               |

---

*Fin de Parte 1 – SRS*
