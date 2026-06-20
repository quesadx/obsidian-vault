---
Fecha: 07-06-2026
moc: "[[moc-ingenieria-sistemas-i]]"
---
A continuación, presento el documento en formato Markdown (`.md`) estructurado y optimizado específicamente para la configuración de un proyecto en **Azure DevOps (ADO)** utilizando el proceso **Scrum**. 

Este documento ha pasado por una rigurosa ronda de revisión cruzada con el diccionario de base de datos, la WBS (EDT) y los estándares definidos en el documento original, asegurando que la jerarquía de ADO (**Epics -> Features -> Product Backlog Items / User Stories**) esté lista para ser importada o transcripta.

***

```markdown
# 🚀 Guía de Configuración de Backlog en Azure DevOps (Scrum)
**Proyecto:** SIGLAB (Sistema Integral de Gestión Operativa para Laboratorio Universitario)
**Cliente:** LINC Corredores (UNA) / MICITT
**Framework:** Scrum (Proceso nativo de Azure DevOps)

---

## ⚙️ 1. Configuración Inicial del Proyecto en ADO
1. **Crear Proyecto:** Nombre `SIGLAB`, Visibilidad `Privado`.
2. **Proceso de Trabajo (Process):** Seleccionar **Scrum** (Utiliza *Product Backlog Item* en lugar de *User Story*, e incluye *Impediment* y *Risk* nativos).
3. **Area Paths:** 
   - `SIGLAB\Backend` (Node.js/TS, Prisma)
   - `SIGLAB\Frontend` (React/TS)
   - `SIGLAB\BaseDeDatos` (PostgreSQL)
   - `SIGLAB\Infraestructura` (Docker, Servidores UNA)
4. **Iteration Paths (Sprints):** Configurar según el Cronograma (Fase 1: Feb-Jun 2026, Fase 2: Jul-Nov 2026, Fase 3: Feb-Jun 2027).
5. **Tags Recomendados:** `MICITT`, `SmartCities`, `Inventario`, `Académico`, `Seguridad`, `API`, `UI/UX`.

---

## 📊 2. Jerarquía del Product Backlog (Epics y Features)
*En ADO, los Epics agrupan Features, y los Features agrupan Product Backlog Items (PBIs).*

### 🟣 Epic 1: Gestión de Identidad, Roles y Auditoría
- **Feature 1.1:** Autenticación y Control de Acceso (RBAC)
- **Feature 1.2:** Bitácora de Trazabilidad (Audit Logs)

### 🟣 Epic 2: Gestión Académica y Formativa
- **Feature 2.1:** Catálogo de Programas y Capacitaciones
- **Feature 2.2:** Gestión de Facilitadores y Participantes
- **Feature 2.3:** Matrículas y Control de Asistencia

### 🟣 Epic 3: Certificación y Evidencias Documentales
- **Feature 3.1:** Motor de Certificados Automatizados (HTML/JSONB)
- **Feature 3.2:** Repositorio de Evidencias MICITT

### 🟣 Epic 4: Control de Inventario, Equipos y Mantenimiento
- **Feature 4.1:** Trazabilidad de Equipos y Códigos QR
- **Feature 4.2:** Gestión de Insumos, Lotes y Mantenimientos

### 🟣 Epic 5: Servicios de Impresión 3D
- **Feature 5.1:** Cola de Solicitudes y Costos
- **Feature 5.2:** Descuento Automático de Insumos (Filamentos)

### 🟣 Epic 6: Evaluación MICITT / SmartCities Latam
- **Feature 6.1:** Motor de Métricas y Dimensiones SCL
- **Feature 6.2:** Reportería y Exportación Excel Oficial

---

## 📝 3. Product Backlog Items (PBIs / User Stories) y Criterios de Aceptación
*Listos para ser creados en el Backlog de ADO. Formato: Título | Descripción | Criterios de Aceptación (Given-When-Then).*

### 📌 PBI-01: Registro de Bitácora de Auditoría (Audit Logs)
- **Descripción:** Como *Administrador*, quiero que el sistema registre automáticamente cualquier cambio crítico en formato JSONB, para garantizar la trazabilidad ante auditorías del MICITT.
- **Criterios de Aceptación:**
  - **Given** un usuario autenticado realiza una acción `UPDATE` o `DELETE` en tablas críticas (ej. `enrollments`, `equipment`).
  - **When** la transacción se confirma en la base de datos.
  - **Then** el sistema inserta un registro en `audit_logs` guardando `entity`, `entity_id`, `action`, `old_data` (JSONB), `new_data` (JSONB) y `performed_by`.

### 📌 PBI-02: Generación de Certificados con Consecutivo Único
- **Descripción:** Como *Asistente*, quiero generar un certificado en PDF basado en una plantilla HTML con variables dinámicas, para entregarlo al participante con un consecutivo oficial irrepetible.
- **Criterios de Aceptación:**
  - **Given** un participante con estado de matrícula "Confirmada" y asistencia >= 80%.
  - **When** se ejecuta la generación del certificado.
  - **Then** el sistema renderiza el `html_content` de `certificate_templates` usando el `dynamic_variables` (JSONB), genera un `consecutive` único (UNIQUE constraint) y guarda el registro en `certificates`.

### 📌 PBI-03: Carga de Evidencias para Métricas SmartCities
- **Descripción:** Como *Coordinador*, quiero cargar archivos PDF y vincularlos a una métrica MICITT, para sustentar el puntaje anual del laboratorio.
- **Criterios de Aceptación:**
  - **Given** el usuario está en el módulo de Evaluación MICITT.
  - **When** sube un archivo y lo vincula a un `metric_id`.
  - **Then** el sistema guarda el archivo, registra la ruta en `evidences` (o tabla de enlace MICITT), almacena metadatos en formato JSONB y actualiza el dashboard a estado "Verde".

### 📌 PBI-04: Descuento Automático de Insumos en Impresión 3D
- **Descripción:** Como *Gestor*, quiero que al finalizar una impresión 3D, el sistema descuente automáticamente los gramos utilizados del lote de filamento correspondiente.
- **Criterios de Aceptación:**
  - **Given** una `print_request` en estado "Aprobada" y stock suficiente en `supply_batches`.
  - **When** se registra el consumo real en `print_consumptions`.
  - **Then** el sistema descuenta la `quantity_used` del lote, registra el movimiento en `supply_inventory_history` y actualiza el stock total.

### 📌 PBI-05: Motor de Cálculo de Evaluación MICITT Anual
- **Descripción:** Como *Director*, quiero que el sistema calcule los valores (numerador/denominador) de las métricas SCL por periodo anual, para congelar el histórico de madurez del laboratorio.
- **Criterios de Aceptación:**
  - **Given** un `micitt_evaluations` creado para el `year` y `period` actual.
  - **When** se ingresan los valores de las métricas.
  - **Then** el sistema valida que no exista duplicidad (UNIQUE `evaluation_id`, `metric_id`), calcula el `value` y lo almacena en `micitt_metric_values`.

---

## 🛡️ 4. Requisitos No Funcionales (RNF) - Definición de Hecho (DoD)
*En ADO, estos se configuran como **Wiki del Proyecto** o como **Tasks** recurrentes en cada Sprint para asegurar el cumplimiento.*

1. **Arquitectura y Despliegue:** Todo módulo debe estar contenerizado (Docker) y desacoplado (API REST + SPA).
2. **Base de Datos:** Cumplimiento estricto de 3FN. Uso obligatorio de `JSONB` para metadatos flexibles (evidencias, plantillas). Restricciones `UNIQUE` y `CHECK` a nivel de BD (no solo en backend).
3. **Rendimiento (UX/UI):** Implementación de *Lazy Loading* y paginación obligatoria para listados > 15 items (ej. `attendance_details`, `audit_logs`).
4. **Accesibilidad:** Contraste WCAG 2.1 AA y diseño *Mobile-First* para uso en tablets dentro del laboratorio.
5. **Código:** Principios Clean Code, DRY, KISS. Commits ligados a Work Items de ADO (`git commit -m "PBI-01: Implementación de trigger JSONB"`).

---

## ⚠️ 5. Registro de Riesgos (ADO Work Item Type: Risk)
*Crear estos items en ADO como "Risk" y vincularlos a los Epics correspondientes mediante enlaces de "Affects" o "Impacts".*

| ID | Título del Riesgo (ADO Title) | Probabilidad | Impacto | Mitigación (Action Plan) | Epic Vinculado |
|---|---|---|---|---|---|
| **RT-01** | Complejidad en motor de cálculo SCL (Fórmulas anidadas) | Alta | Alta | Prototipar motor de cálculo en Sprint 1 usando datos dummy. | Epic 6 |
| **RT-04** | Vulnerabilidades en endpoints (CORS, JWT) | Baja | Alta | Implementar middlewares de validación y tests de integración automatizados. | Epic 1 |
| **RO-01** | Cambios en requisitos por contraparte (UNA/MICITT) | Alta | Alta | Usar Scrum. Congelar alcance del Sprint. Cambios van al Backlog. | Todos |
| **RO-03** | Actualización del modelo SmartCities Latam | Baja | Alta | Diseñar BD con catálogos dinámicos y JSONB para absorber cambios sin alterar schema. | Epic 6 |
| **ROP-01** | Scope Creep (Expansión no controlada) | Alta | Alta | Product Owner estricto. Rechazo de peticiones informales fuera de Sprint Planning. | Todos |
| **ROP-04** | Resistencia al cambio del personal (Cultura Excel) | Media | Media | Involucrar a usuarios clave en Sprint Reviews desde la Fase 1. | Todos |

---

## 🔗 6. Gestión de Dependencias (ADO Links)
*Utilizar los tipos de enlace nativos de ADO (Predecessor / Successor / Blocked By) entre los Work Items.*

### Dependencias Externas (Bloqueantes)
1. **Infraestructura UNA:** El despliegue de los contenedores Docker en producción depende de la asignación de recursos del servidor en la Sede Pérez Zeledón / Coto. *(Crear como Work Item Type: Impediment)*.
2. **Modelo SmartCities Latam:** La estructura de las tablas `micitt_dimensions`, `micitt_subdimensions` y `micitt_metrics` depende de la documentación oficial vigente del MICITT.

### Dependencias Internas (Técnicas - Predecessor/Successor)
1. **Catálogos Base (Bloqueante):** La creación de catálogos (`roles`, `permissions`, `locations`, `equipment_categories`) es **Predecessor** de cualquier módulo transaccional.
2. **Módulo de Usuarios (Bloqueante):** La tabla `users` y `audit_logs` es **Predecessor** obligatoria para el desarrollo de los módulos de Inventario y Matrículas (debido a las Foreign Keys de `created_by`, `performed_by`).
3. **Inventario de Insumos (Predecessor):** El módulo de `supplies` y `supply_batches` debe estar terminado antes de iniciar el desarrollo del módulo de `print_consumptions` (Impresión 3D).

---

## 📥 7. Estrategia de Importación a Azure DevOps
Para cargar este backlog masivamente en ADO, se recomienda:
1. **Opción A (Excel):** Exportar la sección 2 y 3 a un CSV con las columnas: `Work Item Type`, `Title`, `Description`, `Acceptance Criteria`, `Tags`, `Parent`. Utilizar el plugin oficial de *Azure DevOps Office Integration*.
2. **Opción B (Manual Grid View):** Crear primero los **Epics**, luego usar la vista de *Backlog -> Features* para crear los Features, y finalmente usar el signo `+` para agregar los **PBIs** directamente bajo cada Feature, copiando y pegando los Criterios de Aceptación.
3. **Wiki de ADO:** Copiar las secciones **4 (RNF)**, **5 (Riesgos)** y **6 (Dependencias)** directamente a la Wiki del proyecto en ADO bajo la página `Project Governance & Architecture`.
```

### 💡 Notas para el Scrum Master / Product Owner al usar este documento:
1. **Work Item Types (WIT):** El proceso *Scrum* nativo de ADO usa **Product Backlog Item (PBI)**. Si tu organización cambió el proceso a *Agile*, el WIT se llamará **User Story**. El contenido es exactamente el mismo.
2. **JSONB como Estrategia:** Se ha hecho mucho énfasis en los campos `JSONB` (Audit Logs, Metadatos de Evidencias, Plantillas de Certificados). Esto es vital porque mitiga el riesgo **RO-03** (Cambios en el modelo MICITT) sin necesidad de hacer migraciones de base de datos destructivas.
3. **Definition of Done (DoD):** Los Requisitos No Funcionales (Sección 4) deben pegarse en la configuración del *Sprint Board* de ADO como checklist obligatorio para que una PBI pase a la columna "Done".


