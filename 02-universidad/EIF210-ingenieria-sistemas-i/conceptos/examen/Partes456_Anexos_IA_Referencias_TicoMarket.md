# Partes 4, 5 y 6 – Anexos, Declaración de IA y Referencias
## Proyecto: TicoMarket Mobile – I Ciclo 2026

---

# Parte 4 – Anexos del Documento

## Anexo A – Diagrama de Casos de Uso (descripción textual para diagramación)

> **Instrucción para diagramación:** Usar esta descripción para construir el diagrama UML en Draw.io, Lucidchart o StarUML antes de insertar en el PDF final.

### Actores del sistema

```
Actores principales:
  - Cliente Final
  - Gerente de Sucursal
  - Repartidor / Personal Logístico
  - Administrador del Sistema

Actores externos (sistemas):
  - Sistema POS (heredado, VB6)
  - Pasarela de Pagos
  - DGT (Dirección General de Tributación)
```

### Casos de uso por subsistema

**Subsistema: Módulo Cliente**
```
- CU-01: Registrarse y autenticarse
  Actor: Cliente Final
- CU-02: Navegar catálogo y buscar productos
  Actor: Cliente Final
  <<extend>> CU-11 (Sincronizar inventario)
- CU-03: Gestionar carrito y realizar pedido
  Actor: Cliente Final
  <<include>> CU-04 (Procesar pago)
  <<include>> CU-05 (Seleccionar modalidad de entrega)
- CU-04: Procesar pago
  Actor: Cliente Final, Pasarela de Pagos
  <<include>> CU-10 (Generar factura electrónica)
- CU-05: Seleccionar modalidad de entrega
  Actor: Cliente Final
- CU-06: Seguir pedido en tiempo real
  Actor: Cliente Final, Repartidor
- CU-07: Acumular y canjear puntos de fidelización
  Actor: Cliente Final
```

**Subsistema: Módulo Administrativo**
```
- CU-08: Gestionar catálogo y precios por sucursal
  Actor: Gerente de Sucursal
- CU-09: Consultar reportes de ventas y stock
  Actor: Gerente de Sucursal
```

**Subsistema: Integración**
```
- CU-10: Generar factura electrónica
  Actor: Sistema (automático), DGT
- CU-11: Sincronizar inventario con POS
  Actor: Sistema (automático), POS Heredado
```

---

## Anexo B – Tabla extendida de requerimientos funcionales

| ID | Nombre | Descripción | Actor | Prioridad | Módulo |
|---|---|---|---|---|---|
| RF-01 | Registro de usuario | El cliente puede crear una cuenta con correo, contraseña y datos personales verificados | Cliente Final | Alta | Autenticación |
| RF-02 | Autenticación | El sistema valida credenciales; soporta login social (Google) y recuperación de contraseña | Cliente Final | Alta | Autenticación |
| RF-03 | Carrito de compras | Agregar/eliminar productos, verificar stock en tiempo real, ver subtotales con ITBIS | Cliente Final | Alta | Compras |
| RF-04 | Procesamiento de pagos | Cobro con tarjeta de crédito/débito y SINPE Móvil; tokenización PCI-DSS | Cliente Final, Pasarela | Alta | Pagos |
| RF-05 | Modalidad de entrega | Selección de domicilio (con dirección GPS) o pick-up (con código QR de retiro) | Cliente Final | Alta | Logística |
| RF-06 | Seguimiento de pedido | Visualización en tiempo real del estado del pedido y ubicación del repartidor en mapa | Cliente Final, Repartidor | Media | Logística |
| RF-07 | Programa de fidelización | Acumulación de puntos por compra y canje en futuras transacciones; historial visible | Cliente Final | Media | Fidelización |
| RF-08 | Panel gerente de sucursal | Gestión de inventario, precios locales, pedidos pendientes de pick-up, reportes básicos | Gerente de Sucursal | Alta | Administración |
| RF-09 | Campañas personalizadas | Envío de notificaciones push segmentadas por comportamiento de compra del cliente | Admin Sistema | Media | Marketing |
| RF-10 | Facturación electrónica | Generación y transmisión de comprobantes XML v4.4 a la DGT post-transacción | Sistema, DGT | Alta | Fiscal |
| RF-11 | Sincronización con POS | Consulta y actualización de stock en POS heredado mediante API REST; latencia ≤ 30 s | Sistema, POS | Alta | Integración |
| RF-12 | Búsqueda y filtros de catálogo | Búsqueda por nombre, categoría, marca; filtros por precio, disponibilidad y sucursal | Cliente Final | Alta | Catálogo |

---

## Anexo C – Glosario extendido

| Término | Definición extendida |
|---|---|
| **Circuit Breaker** | Patrón de diseño de software que detecta fallos en servicios externos y "abre el circuito" para dejar de enviar solicitudes que fallarían, activando un comportamiento alternativo hasta que el servicio se restaure |
| **Canary Release** | Técnica de despliegue gradual donde una nueva versión se libera a un subconjunto pequeño de usuarios primero, monitoreando errores antes de extender a todos los usuarios |
| **PCI-DSS** | Payment Card Industry Data Security Standard; conjunto de normas de seguridad para el manejo de datos de tarjetas de pago |
| **SLA** | Service Level Agreement; acuerdo formal entre proveedor y cliente que especifica el nivel de servicio comprometido (disponibilidad, tiempos de respuesta, etc.) |
| **UAT** | User Acceptance Testing; pruebas de aceptación del usuario final que validan que el sistema cumple los requerimientos de negocio |
| **Stub / Mock** | Implementación simulada de un servicio externo utilizada durante el desarrollo para no depender del servicio real |
| **Postmortem** | Análisis post-incidente que documenta la causa raíz, el timeline y las lecciones aprendidas |
| **RTO** | Recovery Time Objective; tiempo máximo aceptable para restaurar un servicio tras una interrupción |
| **RPO** | Recovery Point Objective; cantidad máxima de pérdida de datos aceptable medida en tiempo |
| **EVM** | Earned Value Management; metodología de gestión de proyectos que integra alcance, costo y tiempo |
| **CPI** | Cost Performance Index; indicador de EVM que mide la eficiencia en el uso del presupuesto (CPI < 1 indica sobrecosto) |

---

# Parte 5 – Declaración de Uso de Inteligencia Artificial

## 5.1 Herramientas utilizadas y tareas específicas

| Herramienta            | Tareas en las que se utilizó                                                                                                                                                                    |
| ---------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Claude (Anthropic)** | Generación de borradores iniciales de la SRS, estructuración de tablas de riesgos, redacción de flujos de casos de uso, propuesta de estructura del BIA, revisión de coherencia entre secciones |
| **ChatGPT (OpenAI)**   | Consulta de definiciones de ISO 31000 y PMBOK para validar terminología de la gestión de riesgos; verificación de la fórmula del NPR                                                            |
| **Notion AI**          | Organización y outline inicial del documento antes de comenzar la redacción                                                                                                                     |

## 5.2 Decisiones tomadas por el equipo (no por la IA)

1. **Selección de CU-03 y CU-04 como casos de uso detallados:** La IA sugirió detallar CU-01 (Registro) y CU-02 (Catálogo) por ser los de mayor frecuencia de uso. El equipo rechazó esta sugerencia y eligió CU-03 y CU-04 porque estos representan el flujo crítico de negocio que genera ingresos directos y concentra las dependencias técnicas de mayor riesgo. Los casos de registro y catálogo, aunque frecuentes, son estándar y ofrecen menor complejidad de análisis.

2. **Inclusión de R-09 (crash por pico de demanda) como riesgo prioritario:** La IA no identificó inicialmente este riesgo en su primera iteración; fue el equipo quien lo incorporó al analizar la restricción del caso sobre la campaña comercial del segundo semestre y la ausencia de pruebas de carga mencionada en el perfil del equipo técnico. Este riesgo obtuvo NPR=300, quedando entre los cuatro prioritarios.

3. **Definición del RTO en 4 horas (no 24 horas como sugirió la IA):** La IA propuso un RTO de 24 horas para el escenario de falla de pasarela. El equipo lo redujo a 4 horas al considerar que el escenario ocurre en temporada alta durante una campaña activa, donde cada hora de inactividad implica pérdidas reputacionales y económicas desproporcionadas. Un RTO de 24 horas es inaceptable para un e-commerce en pleno lanzamiento.

4. **Restricción RD-07 sobre cronograma:** La IA no incluyó como restricción de diseño el cronograma de 12 meses. El equipo la incorporó explícitamente porque este límite condiciona decisiones técnicas reales: arquitecturas más simples pero entregables a tiempo son preferibles a soluciones óptimas que no se completen en el plazo.

## 5.3 Fragmentos revisados y corregidos por el equipo

| Sección                       | Qué generó la IA                                                                           | Qué cambió el equipo                                                                                                              | Por qué                                                                                                                                               |
| ----------------------------- | ------------------------------------------------------------------------------------------ | --------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------- |
| CU-03 – Excepciones           | La IA propuso solo 2 excepciones genéricas (error de red, sesión expirada)                 | El equipo agregó EX-4 (timeout de reserva de stock durante el pago) y detalló EX-1 con el tiempo específico de 3 segundos         | Las excepciones genéricas no reflejaban la lógica de negocio específica del sistema; el timeout de stock es crítico para consistencia de inventario   |
| RNF                           | La IA generó criterios de verificación vagos como "debe ser rápido" o "debe ser seguro"    | El equipo reescribió todos los criterios con herramientas, métricas y umbrales específicos (JMeter, percentil 95, cobertura 70 %) | Los criterios de verificación deben ser medibles para que sean útiles en pruebas de aceptación; criterios vagos no permiten verificar el cumplimiento |
| Plan de monitoreo             | La IA propuso una revisión mensual única del registro de riesgos                           | El equipo diseñó tres frecuencias distintas (semanal, quincenal, mensual) con participantes específicos en cada nivel             | Un solo ciclo mensual es insuficiente para un proyecto de 12 meses con riesgos de alta probabilidad activos desde el inicio                           |
| BIA – Comunicación al cliente | La IA generó mensajes técnicos con jerga como "servicio de procesamiento de pagos PCI-DSS" | El equipo reescribió los mensajes en lenguaje simple, empático y orientado al cliente no técnico                                  | Los mensajes de crisis deben ser comprensibles para el usuario general; el lenguaje técnico genera confusión y amplifica la percepción negativa       |

## 5.4 Sugerencias de la IA que el equipo rechazó

**Sugerencia rechazada:** En el plan de respuesta para R-03 (cambios de requerimientos), la IA recomendó como estrategia "transferir" el riesgo a la Gerencia Comercial mediante un contrato que la responsabilizara económicamente por los cambios.

**Razón del rechazo:** El equipo consideró que en el contexto costarricense de una empresa familiar como TicoMarket S.A., donde la Gerencia Comercial es el patrocinador del proyecto, un contrato de penalización interna generaría fricción relacional que dañaría más al proyecto que los propios cambios de requerimientos. La estrategia de mitigación mediante control de cambios formal y congelamiento consensuado es más apropiada para el contexto organizacional específico. La IA aplicó una solución genérica sin considerar el contexto cultural y organizacional del caso.

---

# Parte 6 – Referencias Bibliográficas

> Formato APA 7

---

Anthropic. (2025). *Claude (versión Sonnet 4.x)* [Modelo de lenguaje de inteligencia artificial]. https://www.anthropic.com

Castro, S., Mora, R., & Loaiza, G. (2026). *Tema 8: Gestión del riesgo en proyectos de software* [Presentación de clase]. Universidad Nacional de Costa Rica, Sede Regional Brunca, Ingeniería en Sistemas.

Castro, S., Mora, R., & Loaiza, G. (2026). *Anexo A: Plantilla de Especificación de Requerimientos de Software (SRS)* [Material de curso]. Universidad Nacional de Costa Rica, Sede Regional Brunca, Ingeniería en Sistemas.

Institute of Electrical and Electronics Engineers. (1998). *IEEE Std 830-1998: IEEE Recommended Practice for Software Requirements Specifications*. IEEE. https://doi.org/10.1109/IEEESTD.1998.88286

International Organization for Standardization. (2018). *ISO 31000:2018 – Risk management: Guidelines*. ISO. https://www.iso.org/standard/65694.html

International Organization for Standardization & International Electrotechnical Commission. (2011). *ISO/IEC 27005:2011 – Information technology – Security techniques – Information security risk management* (2.ª ed.). ISO/IEC. https://www.iso.org/standard/56742.html

Project Management Institute. (2021). *A guide to the Project Management Body of Knowledge (PMBOK® Guide)* (7.ª ed.). PMI. https://www.pmi.org/pmbok-guide-standards/foundational/pmbok

Ministerio de Hacienda de Costa Rica, Dirección General de Tributación. (2022). *Resolución MH-DGT-RES-0027-2022: Especificaciones técnicas para la emisión de comprobantes electrónicos* (versión 4.4). Hacienda CR. https://www.hacienda.go.cr/contenido/14350-factura-electronica

Pressman, R. S., & Maxim, B. R. (2021). *Ingeniería del software: Un enfoque práctico* (9.ª ed.). McGraw-Hill Education.

---

*Fin del documento – TicoMarket Mobile | Examen IS1 – I Ciclo 2026*
*Universidad Nacional de Costa Rica · Sede Regional Brunca · Campus Pérez Zeledón y Coto*
