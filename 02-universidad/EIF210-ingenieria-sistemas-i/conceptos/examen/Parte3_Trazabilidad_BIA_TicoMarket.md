# Parte 3 – Integración: Trazabilidad y Continuidad
## Proyecto: TicoMarket Mobile – I Ciclo 2026

---

## 3.1 Matriz de Trazabilidad Requerimientos ↔ Riesgos

### Selección de requerimientos críticos

Los cinco requerimientos críticos seleccionados son aquellos que sustentan directamente la promesa de valor del producto (ventas en línea, seguridad y cumplimiento legal) y que concentran el mayor número de dependencias externas.

| ID Req. | Descripción del requerimiento | Tipo |
|---|---|---|
| RF-03 | El sistema debe permitir al cliente agregar productos al carrito, verificar stock en tiempo real con el POS y confirmar el pedido | Funcional |
| RF-04 | El sistema debe procesar pagos con tarjeta de crédito/débito y SINPE Móvil mediante la pasarela contratada | Funcional |
| RF-10 | El sistema debe generar y transmitir facturas electrónicas válidas ante la DGT en un máximo de 2 horas tras confirmar la transacción | Funcional |
| RF-11 | El sistema debe sincronizar el inventario con el POS heredado en tiempo real (latencia máxima de 30 segundos) | Funcional |
| RNF-06 | El sistema debe mantener disponibilidad del 99,5 % mensual en horario pico | No Funcional |

### Matriz de trazabilidad

| Requerimiento                              | R-01: API POS no entregado | R-02: Caída pasarela pagos | R-03: Cambios de requerimientos | R-08: Brecha de seguridad en pagos | R-09: Crash por pico de demanda |
| ------------------------------------------ | -------------------------- | -------------------------- | ------------------------------- | ---------------------------------- | ------------------------------- |
| **RF-03** (Carrito + stock en tiempo real) | ✅ Afectado                 | —                          | ✅ Afectado                      | —                                  | ✅ Afectado                      |
| **RF-04** (Procesamiento de pagos)         | —                          | ✅ Afectado                 | ✅ Afectado                      | ✅ Afectado                         | ✅ Afectado                      |
| **RF-10** (Facturación electrónica DGT)    | —                          | ✅ Afectado                 | ✅ Afectado                      | —                                  | ✅ Afectado                      |
| **RF-11** (Sincronización inventario POS)  | ✅ Afectado                 | —                          | ✅ Afectado                      | —                                  | ✅ Afectado                      |
| **RNF-06** (Disponibilidad 99,5 %)         | ✅ Afectado                 | ✅ Afectado                 | —                               | ✅ Afectado                         | ✅ Afectado                      |

### Análisis de impacto por vínculo

**RF-03 ↔ R-01:** Si el API del POS no se entrega a tiempo, la verificación de stock en tiempo real no puede implementarse, haciendo imposible completar la funcionalidad del carrito y obligando a operar con inventario estático desactualizado, lo que generaría ventas de productos sin existencia.

**RF-03 ↔ R-09:** Si el sistema sufre un crash por pico de demanda en el lanzamiento, el proceso de agregar al carrito fallará para todos los usuarios concurrentes, destruyendo la primera impresión del producto en su ventana comercial más importante.

**RF-04 ↔ R-02:** Si la pasarela de pagos cae durante operación, ninguna transacción puede completarse, convirtiendo el sistema en un catálogo visual sin capacidad transaccional y anulando el objetivo central del proyecto.

**RF-04 ↔ R-08:** Si ocurre una brecha de seguridad en el módulo de pagos, los datos financieros de los clientes quedarán expuestos, generando responsabilidades legales bajo la Ley 8968 y destruyendo la confianza de los usuarios en la plataforma.

**RF-10 ↔ R-02:** Si la pasarela cae y las transacciones quedan en estado ambiguo (ni aprobadas ni rechazadas), el sistema no puede determinar si debe emitir la factura electrónica, generando incumplimiento fiscal por omisión o emisión incorrecta.

**RF-11 ↔ R-01:** Si el API del POS no está disponible, la sincronización de inventario se interrumpe completamente, haciendo que el catálogo muestre datos de stock obsoletos e incorrectos, lo que puede llevar a sobreventas de productos sin existencia.

**RNF-06 ↔ R-02:** Si la pasarela de pagos sufre caídas frecuentes, el servicio transaccional se interrumpe y la disponibilidad del sistema cae por debajo del 99,5 % comprometido, incumpliendo el SLA establecido.

**RNF-06 ↔ R-09:** Si el sistema no escala adecuadamente ante la demanda del lanzamiento, los servidores colapsan y la disponibilidad cae a cero durante el evento comercial más importante, incumpliendo la meta de disponibilidad en el peor momento posible.

---

## 3.2 Análisis de Impacto al Negocio (BIA) y Plan de Continuidad

### Escenario planteado

> El sistema TicoMarket Mobile está en producción, en plena temporada alta (campaña comercial del segundo semestre). La integración con la pasarela de pagos falla durante **48 horas consecutivas**. Ninguna transacción de compra puede completarse.

---

### Impacto estimado en el negocio

| Dimensión | Impacto cuantificado | Descripción |
|---|---|---|
| **Pérdida de ingresos directos** | ~₡12–18 millones (estimación) | Asumiendo que el 25 % de ventas proyectadas a través del canal digital en temporada alta; 2 días sin transacciones en el canal de mayor crecimiento |
| **Pérdida de clientes** | Estimado 15–25 % de usuarios activos no retornan | Primera experiencia negativa en temporada alta genera abandono de la plataforma; efecto amplificado por redes sociales |
| **Impacto reputacional** | Alto | Campaña comercial activa con publicidad; el fallo es visible públicamente y coincide con el período de mayor expectativa |
| **Impacto en programa de fidelización** | Moderado | Puntos no acumulados durante 48 h; usuarios con compras pendientes en carrito pierden reservas de stock |
| **Impacto en facturación electrónica** | Bajo (diferido) | Las transacciones no se generan, por lo que no hay facturas incorrectas; el riesgo es la percepción negativa de la marca |
| **Impacto en operación de sucursales** | Bajo | El canal físico (POS) continúa operando sin afectación |

**RTO (Recovery Time Objective):** 4 horas desde detección del incidente. El servicio de pagos debe restaurarse en no más de 4 horas para limitar el daño reputacional a un impacto recuperable.

**RPO (Recovery Point Objective):** 0 minutos. No se aceptan pérdidas de transacciones; el sistema debe poder determinar exactamente el estado de cada transacción al momento de la falla para retomar sin duplicados ni omisiones.

---

### Medidas preventivas previas al incidente

| ID | Medida preventiva | Responsable | Plazo de implementación |
|---|---|---|---|
| MP-01 | Negociar SLA contractual con la pasarela de pagos con disponibilidad garantizada ≥ 99,5 % y penalidades económicas por incumplimiento | PM + Área Legal | Antes del lanzamiento (mes 11) |
| MP-02 | Implementar integración con una pasarela de pagos secundaria (respaldo), activable en modo automático o manual en < 30 minutos | Equipo Backend | Mes 9 del proyecto |
| MP-03 | Configurar monitoreo proactivo de la pasarela con alertas automáticas (SMS + correo) ante latencia > 3 s o tasa de error > 1 % | DevOps / TI Interno | Antes del lanzamiento |
| MP-04 | Implementar patrón de diseño Circuit Breaker en el módulo de pagos para detectar fallos y activar el respaldo automáticamente sin intervención humana | Arquitecto de software | Mes 8 del proyecto |
| MP-05 | Mantener un fondo de contingencia de ₡5 millones dentro del presupuesto específicamente para incidentes de producción críticos | PM + Gerencia Comercial | Definir antes del lanzamiento |
| MP-06 | Realizar simulacros de failover de pasarela de pagos durante el período de pruebas de aceptación (UAT) | QA + DevOps | Mes 11 del proyecto |

---

### Plan de respuesta a incidentes

#### Fase 1: Detección (0–15 minutos)

1. El sistema de monitoreo detecta tasa de error en pasarela de pagos > 10 % y genera alerta automática.
2. El ingeniero de guardia (on-call) recibe alerta vía SMS/PagerDuty y confirma el incidente.
3. Se activa el *war room* del equipo: PM + backend + TI interno en canal de comunicación de emergencia.
4. Se evalúa si el Circuit Breaker ya activó el respaldo automático o si se requiere intervención manual.

#### Fase 2: Contención (15 minutos – 1 hora)

5. **Alternativa transaccional inmediata:** Activar la pasarela de pagos secundaria (si implementada) o habilitar temporalmente el canal de SINPE Móvil directo mediante número de cuenta publicado en la app con mensaje de "modo contingencia".
6. Mostrar en la app un banner de alerta: *"Estamos experimentando dificultades técnicas con nuestro servicio de pagos. Puedes completar tu compra en tienda o intentar nuevamente en 30 minutos."*
7. Deshabilitar el proceso de checkout para nuevos pedidos mientras la falla persiste (evitar colas de transacciones fallidas).
8. Preservar carritos activos en base de datos por 72 horas para que los clientes puedan retomar.

#### Fase 3: Comunicación al cliente

| Canal | Mensaje | Momento |
|---|---|---|
| Notificación push | "Estamos resolviendo un problema técnico. Tu carrito está guardado. Te avisaremos cuando esté listo." | Al inicio del incidente (hora 0) |
| Correo electrónico | Explicación detallada, disculpa, opciones alternativas (tienda física, SINPE) y compensación (puntos dobles al retomar) | Hora 1 del incidente |
| Redes sociales (Instagram, Facebook) | Comunicado público breve, tono empático, sin tecnicismos; hora estimada de restauración | Hora 2 si no se restaura en 1h |
| App – banner en home | "Pagos temporalmente no disponibles. Trabajamos para resolverlo. Estimamos restauración a las [hora]." | Mientras dure el incidente |

#### Fase 4: Resolución y restauración (según RTO: < 4 horas)

9. El equipo contacta al soporte técnico de la pasarela de pagos primaria y documenta el incidente (ticket).
10. Si la pasarela primaria no se restaura en 2 horas, se activa definitivamente la pasarela secundaria.
11. Se realizan 20 transacciones de prueba de extremo a extremo antes de reactivar el checkout para usuarios.
12. Se reactiva gradualmente el servicio (canary release): 10 % de usuarios → 50 % → 100 %, monitoreando tasas de error.

#### Fase 5: Cierre del incidente

**Criterios de cierre:**
- Tasa de error en pasarela < 0,5 % durante 30 minutos consecutivos.
- Al menos 50 transacciones de usuarios reales completadas exitosamente post-restauración.
- El monitoreo muestra latencia < 2 s en percentil 95.

**Acciones post-incidente:**
- Publicar postmortem interno en las 48 horas siguientes (causa raíz, timeline, lecciones aprendidas).
- Compensar a usuarios afectados (ej. puntos dobles en siguiente compra o descuento).
- Revisar y actualizar el plan de continuidad con las lecciones del incidente.
- Escalar con el proveedor de la pasarela para exigir créditos por SLA incumplido.

---

*Fin de Parte 3 – Integración: Trazabilidad y Continuidad*
