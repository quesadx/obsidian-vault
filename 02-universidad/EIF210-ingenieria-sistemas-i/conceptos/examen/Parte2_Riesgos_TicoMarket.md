# Parte 2 – Plan de Gestión del Riesgo
## Proyecto: TicoMarket Mobile – I Ciclo 2026

---

## 2.1 Identificación de Riesgos

**Técnica aplicada:** Tormenta de ideas estructurada, organizada por taxonomía del Tema 8 (ISO 31000 / PMBOK / ISO/IEC 27005). El equipo revisó las restricciones, supuestos y stakeholders del caso para generar riesgos por categoría.

### Registro de Riesgos

| ID   | Descripción del riesgo                                                                                                           | Categoría      | Tipo        | Nivel del activo afectado | Causa probable                                                                                                           | Documentado por |
| ---- | -------------------------------------------------------------------------------------------------------------------------------- | -------------- | ----------- | ------------------------- | ------------------------------------------------------------------------------------------------------------------------ | --------------- |
| R-01 | El equipo de TI interno no entrega el API REST del POS en el plazo acordado, bloqueando la sincronización de inventario          | Recursos       | Amenaza     | Proceso                   | Historial de postergaciones en proyectos anteriores del equipo de TI                                                     | Integrante A    |
| R-02 | La pasarela de pagos contratada presenta caídas en producción durante el lanzamiento, impidiendo transacciones                   | Tecnología     | Amenaza     | Lógico                    | El proveedor reportó caídas en el último trimestre; infraestructura inestable                                            | Integrante B    |
| R-03 | La Gerencia Comercial cambia los requerimientos en etapas tardías del proyecto, generando retrabajo que supera el presupuesto    | Requerimientos | Amenaza     | Proceso                   | Comportamiento documentado: cambios de prioridad cada 2-3 semanas según resultados de marketing                          | Integrante A    |
| R-04 | Los desarrolladores backend no logran integrar correctamente la pasarela de pagos por falta de experiencia previa                | Recursos       | Amenaza     | Humano                    | Ninguno de los dos desarrolladores backend tiene experiencia en integraciones con pasarelas de pago                      | Integrante C    |
| R-05 | Incumplimiento de la normativa de facturación electrónica de la DGT, generando sanciones legales                                 | Entorno        | Amenaza     | Proceso                   | Cambios potenciales en el esquema XML de la DGT; curva de aprendizaje del equipo en normativa fiscal costarricense       | Integrante B    |
| R-06 | El presupuesto de ₡120 millones resulta insuficiente para completar todas las funcionalidades de v1.0                            | Gestión        | Amenaza     | Proceso                   | Estimación inicial sin holgura de contingencia; dependencias externas con costo variable                                 | Integrante C    |
| R-07 | La aplicación móvil no es adoptada por los clientes esperados (< 50 000 usuarios en 6 meses)                                     | Aceptación     | Amenaza     | Humano                    | Usuarios no familiarizados con la app; experiencia de usuario deficiente; competencia consolidada (Walmart, AutoMercado) | Integrante A    |
| R-08 | Brecha de seguridad en el módulo de pagos que expone datos financieros de los clientes                                           | Tecnología     | Amenaza     | Lógico                    | Desarrolladores sin certificación en seguridad financiera; posibles vulnerabilidades en integración con SDK de pagos     | Integrante B    |
| R-09 | La campaña de marketing al segundo semestre genera un pico de demanda que supera la capacidad del sistema (crash en lanzamiento) | Tecnología     | Amenaza     | Lógico                    | Arquitectura no dimensionada para alta concurrencia; pruebas de carga insuficientes                                      | Integrante C    |
| R-10 | Alianza estratégica con proveedor de logística reconocido que mejora tiempos de entrega y diferencia la propuesta de valor       | Entorno        | Oportunidad | Proceso                   | Crecimiento del mercado de e-commerce en Costa Rica; interés de empresas logísticas en alianzas con supermercados        | Integrante A    |

---

## 2.2 Análisis Cualitativo – Matriz Probabilidad × Impacto (5×5)

**Escala utilizada:**
- **Probabilidad:** 1 = Muy baja, 2 = Baja, 3 = Media, 4 = Alta, 5 = Muy alta
- **Impacto:** 1 = Insignificante, 2 = Menor, 3 = Moderado, 4 = Mayor, 5 = Catastrófico

### Tabla de valoración de riesgos

| ID   | Probabilidad (P) | Impacto (I) | P × I | Nivel de riesgo |
| ---- | ---------------- | ----------- | ----- | --------------- |
| R-01 | 4                | 5           | 20    | **Crítico**     |
| R-02 | 4                | 5           | 20    | **Crítico**     |
| R-03 | 5                | 4           | 20    | **Crítico**     |
| R-04 | 3                | 4           | 12    | **Alto**        |
| R-05 | 2                | 5           | 10    | **Alto**        |
| R-06 | 3                | 4           | 12    | **Alto**        |
| R-07 | 3                | 3           | 9     | **Moderado**    |
| R-08 | 2                | 5           | 10    | **Alto**        |
| R-09 | 3                | 5           | 15    | **Crítico**     |
| R-10 | 2                | 3           | 6     | **Bajo**        |

### Matriz 5×5

```
IMPACTO →
         1-Insign.  2-Menor   3-Moderado  4-Mayor   5-Catast.
P  5     |          |          |           | R-03     |
R  4     |          |          |           |          | R-01, R-02
O  3     |          |          | R-07      | R-04,R-06| R-09
B  2     |          |          | R-10      |          | R-05, R-08
A  1     |          |          |           |          |
B
```

| Zona | Descripción |
|---|---|
| 🔴 Crítico (≥15) | R-01, R-02, R-03, R-09 |
| 🟠 Alto (10–14) | R-04, R-05, R-06, R-08 |
| 🟡 Moderado (6–9) | R-07, R-10 |

### Justificación por riesgo

**R-01 (P=4, I=5):** Probabilidad alta porque el equipo de TI tiene historial documentado de postergaciones. Impacto catastrófico porque sin el API del POS, la sincronización de inventario —funcionalidad central— no puede implementarse ni probarse.

**R-02 (P=4, I=5):** Probabilidad alta dado que el proveedor registró caídas en producción en el trimestre inmediatamente anterior. Impacto catastrófico porque sin pasarela operativa el sistema no puede procesar ninguna transacción, haciendo el producto inútil.

**R-03 (P=5, I=4):** Probabilidad muy alta porque la conducta de cambios frecuentes está documentada en el enunciado del caso. Impacto mayor porque cambios tardíos en requerimientos generan retrabajo que puede consumir el presupuesto restante y retrasar el lanzamiento.

**R-04 (P=3, I=4):** Probabilidad media; la falta de experiencia es un hecho, pero con capacitación y documentación del proveedor puede mitigarse. Impacto mayor porque errores en la integración de pagos comprometen seguridad y funcionalidad central.

**R-05 (P=2, I=5):** Probabilidad baja porque la DGT generalmente avisa cambios con antelación. Impacto catastrófico porque el incumplimiento de facturación electrónica implica sanciones legales que pueden suspender operaciones.

**R-06 (P=3, I=4):** Probabilidad media; el presupuesto sin holgura combinado con dependencias externas de costo variable hace plausible el exceso. Impacto mayor porque podría obligar a recortar funcionalidades clave o comprometer la calidad.

**R-07 (P=3, I=3):** Probabilidad media; el mercado costarricense de apps de supermercado es competitivo. Impacto moderado porque afecta el objetivo de 50 000 usuarios pero no paraliza el sistema.

**R-08 (P=2, I=5):** Probabilidad baja si se implementan controles adecuados. Impacto catastrófico porque una brecha de datos financieros destruye la reputación de la empresa y genera responsabilidades legales bajo la Ley 8968.

**R-09 (P=3, I=5):** Probabilidad media; el lanzamiento en campaña comercial es de alto volumen por diseño. Impacto catastrófico porque un crash en el lanzamiento invalida la ventana comercial y destruye la confianza inicial.

**R-10 (P=2, I=3):** Probabilidad baja pero el contexto de crecimiento de e-commerce en CR hace posible el acercamiento de proveedores. Impacto moderado como oportunidad de diferenciación.

---

## 2.3 Análisis Cuantitativo (NPR) – Cuatro Riesgos Prioritarios

**Fórmula:** `NPR = Gravedad × Importancia × Probabilidad × Impacto`

**Escalas (1–5 en cada dimensión):**
- **Gravedad:** severidad del efecto si el riesgo se materializa
- **Importancia:** relevancia del activo afectado para el éxito del proyecto
- **Probabilidad:** likelihhod de ocurrencia
- **Impacto:** consecuencia sobre alcance, costo, tiempo o calidad

### Tabla de NPR

| ID       | Riesgo                                                   | Gravedad (G) | Importancia (I) | Probabilidad (P) | Impacto (Im) | **NPR** |
| -------- | -------------------------------------------------------- | ------------ | --------------- | ---------------- | ------------ | ------- |
| **R-02** | Caídas de la pasarela de pagos en producción             | 5            | 5               | 4                | 5            | **500** |
| **R-01** | API REST del POS no entregado a tiempo                   | 5            | 5               | 4                | 4            | **400** |
| **R-09** | Crash del sistema por pico de demanda en lanzamiento     | 5            | 4               | 3                | 5            | **300** |
| **R-03** | Cambios tardíos de requerimientos por Gerencia Comercial | 4            | 4               | 5                | 4            | **320** |

**Tabla ordenada por NPR (mayor a menor):**

| Posición | ID   | NPR | Descripción                       |
| -------- | ---- | --- | --------------------------------- |
| 1°       | R-02 | 500 | Caídas de pasarela de pagos       |
| 2°       | R-03 | 320 | Cambios tardíos de requerimientos |
| 3°       | R-01 | 400 | API del POS no entregado a tiempo |
| 4°       | R-09 | 300 | Crash por pico de demanda         |

> **Nota:** En la tabla de NPR se priorizan los cuatro riesgos que en conjunto superaron puntuación 300. R-01 obtuvo NPR=400 porque aunque su probabilidad e impacto son altos, su Importancia se califica 5 (el POS es el activo central del negocio). R-03 obtuvo 320 por tener probabilidad 5 (casi certeza), compensando gravedad e importancia levemente menores. R-09 obtuvo 300 por gravedad máxima e impacto catastrófico pero probabilidad media.

**Justificación de valores asignados:**

- **R-02:** Gravedad=5 porque sin pagos el sistema no genera ingresos. Importancia=5 porque es el módulo central. Probabilidad=4 por caídas documentadas. Impacto=5 porque afecta reputación, ingresos y cronograma.
- **R-01:** Gravedad=5 porque bloquea la integración principal. Importancia=5 porque el inventario sincronizado es diferenciador clave. Probabilidad=4 por historial del equipo de TI. Impacto=4 (catastrófico pero recuperable con plan B).
- **R-03:** Gravedad=4 porque el retrabajo es costoso pero no destruye el producto. Importancia=4 porque el alcance es manejable si se controla. Probabilidad=5 porque la conducta está documentada. Impacto=4 por efecto sobre costo y cronograma.
- **R-09:** Gravedad=5 por efecto devastador en lanzamiento público. Importancia=4 porque la arquitectura es central pero ajustable antes del lanzamiento. Probabilidad=3 (mitigable con pruebas de carga). Impacto=5 catastrófico sobre reputación.

---

## 2.4 Plan de Respuesta – Cuatro Riesgos Prioritarios

| ID       | Estrategia               | Plan concreto                                                                                                                                                                                                                                                                                                                                                                                                  | Responsable                                                        | Costo / Esfuerzo estimado                                                                                               |
| -------- | ------------------------ | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------ | ----------------------------------------------------------------------------------------------------------------------- |
| **R-02** | **Transferir + Mitigar** | 1. Transferir: negociar SLA contractual con la pasarela de pagos con penalidades por tiempo de inactividad y cláusulas de garantía de disponibilidad ≥ 99,5 %. 2. Mitigar: implementar integración con un segundo proveedor de pagos como respaldo (SINPE Directo o pasarela alternativa), activable en < 30 minutos ante caída del proveedor primario                                                         | Project Manager + Área Legal de TicoMarket                         | ~₡3–5 millones en horas de desarrollo del módulo de respaldo + costo de licencia de pasarela secundaria (~₡500K/año)    |
| **R-01** | **Evitar + Mitigar**     | 1. Evitar: formalizar el API del POS como entregable con fecha, responsables nominados y consecuencias contractuales en un acuerdo de nivel de servicio interno (SLA interno). 2. Mitigar: desarrollar un stub (mock) del API del POS para que el equipo de desarrollo no se bloquee mientras TI entrega el API real; planificar integración real en sprint 6                                                  | Project Manager                                                    | ~₡800K en horas de desarrollo del mock API; tiempo del PM para gestionar el acuerdo interno                             |
| **R-03** | **Mitigar**              | 1. Implementar metodología ágil con sprints de 2 semanas y sesiones formales de revisión de requerimientos al final de cada sprint. 2. Definir un proceso de control de cambios que requiera aprobación escrita de Gerencia Comercial con 5 días hábiles de anticipación antes de incorporar un cambio. 3. Congelar requerimientos al inicio del sprint 10 (mes 10); cambios posteriores se agendan para v2.0. | Project Manager + Gerencia Comercial                               | Sin costo directo; requiere ~4 horas/sprint de PM para gestión de cambios                                               |
| **R-09** | **Mitigar**              | 1. Diseñar arquitectura backend con auto-escalamiento horizontal en la nube (ej. AWS Auto Scaling o Google Cloud Run). 2. Ejecutar pruebas de carga (load testing) simulando 5× la concurrencia esperada antes del lanzamiento. 3. Establecer un plan de capacidad mínima garantizada 2 semanas antes del lanzamiento comercial.                                                                               | Arquitecto de software (desarrollador backend senior) + TI interno | ~₡2 millones en infraestructura de nube adicional para pruebas y capacidad base; 1 semana de trabajo del equipo backend |

**Estrategias utilizadas:** Transferir (R-02), Evitar (R-01), Mitigar (R-01, R-02, R-03, R-09) → 3 estrategias distintas cumplidas ✓

---

## 2.5 Plan de Monitoreo y Control

### Frecuencia de revisión

| Tipo de revisión                             | Frecuencia                          | Participantes              |
| -------------------------------------------- | ----------------------------------- | -------------------------- |
| Revisión operativa del registro de riesgos   | Semanal (cada lunes, 30 min)        | PM + líderes técnicos      |
| Revisión de métricas e indicadores de alerta | Quincenal (al final de cada sprint) | Todo el equipo de proyecto |
| Revisión estratégica con patrocinador        | Mensual                             | PM + Gerencia Comercial    |
| Revisión completa del plan de riesgos        | Al inicio de cada fase del proyecto | PM + equipo completo       |

### Indicadores de alerta temprana

| ID | Indicador | Umbral de alerta | Riesgo asociado |
|---|---|---|---|
| IAT-01 | Porcentaje de avance del API del POS según cronograma acordado | < 50 % a semana 6 | R-01 |
| IAT-02 | Número de incidentes reportados por la pasarela de pagos en el mes anterior | ≥ 2 incidentes/mes | R-02 |
| IAT-03 | Número de solicitudes de cambio de requerimientos en el sprint actual | ≥ 3 cambios/sprint | R-03 |
| IAT-04 | Tiempo de respuesta del sistema bajo carga de prueba | > 4 segundos en percentil 95 | R-09 |
| IAT-05 | Porcentaje de presupuesto consumido vs. avance del proyecto (EVM – CPI) | CPI < 0.85 | R-06 |

### Criterios para escalar al patrocinador

Se escala a Gerencia Comercial cuando se cumple al menos uno de los siguientes criterios:
1. Un riesgo de nivel **Crítico** (P×I ≥ 15) se materializa o su probabilidad aumenta en 2 puntos.
2. El índice de desempeño del costo (CPI) cae por debajo de 0,80.
3. El calendario acumula un retraso de más de 2 semanas respecto al plan base.
4. Se detecta un nuevo riesgo con NPR estimado superior a 250.
5. La pasarela de pagos reporta una caída superior a 4 horas en producción.

### Mecanismo de actualización del registro de riesgos

1. **Identificación continua:** cualquier miembro del equipo puede proponer nuevos riesgos usando el formulario digital del proyecto en Confluence/Jira.
2. **Triaje semanal:** el PM evalúa nuevos riesgos propuestos en la reunión semanal y asigna clasificación provisional.
3. **Actualización formal:** al cierre de cada sprint, el PM actualiza el registro con: nuevos riesgos identificados, riesgos materializados (cerrados con lección aprendida), cambios en probabilidad o impacto de riesgos existentes, efectividad de los planes de respuesta aplicados.
4. **Control de versiones:** el registro de riesgos se versiona con cada actualización (ej. v1.0, v1.1) y se almacena en el repositorio del proyecto con acceso de todo el equipo.
5. **Cierre de riesgos:** un riesgo se cierra cuando ya no es posible que ocurra (fase superada) o cuando se ha materializado y el plan de respuesta fue aplicado.

---

*Fin de Parte 2 – Plan de Gestión del Riesgo*
