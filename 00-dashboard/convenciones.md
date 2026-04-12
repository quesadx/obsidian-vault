---
tags: [meta, referencia, convenciones]
created: 2026-03-06
updated: 2026-03-06
---

# 📋 Convenciones del Vault

Guía de referencia rápida para mantener la consistencia.

---

## 📝 Nombres de Archivos

### Formato Estándar
```
YYYY-MM-DD-descripcion-minuscula.md
```

### Ejemplos Correctos
✅ `2026-03-06-analisis-requisitos.md`  
✅ `2026-02-25-modelo-entidad-relacion.md`  
✅ `2026-03-01-quiz-1.md`  

### Ejemplos Incorrectos
❌ `Análisis Requisitos.md` (sin fecha, espacios)  
❌ `2026-03-06 - Análisis.md` (espacios alrededor del guión)  
❌ `Análisis Requisitos 2026-03-06.md` (fecha al final)  

---

## 🏷️ Tags (Etiquetas)

### Estructura de Tags
```yaml
tags: [categoria, subtema, curso-si-aplica]
```

### Tags por Categoría

#### Universidad
```yaml
# EIF208 - Comunicaciones y Redes
tags: [universidad, redes, eif208]

# EIF209 - Programación IV
tags: [universidad, programacion, eif209]

# EIF210 - Ingeniería de Sistemas I
tags: [universidad, ingenieria-sistemas, eif210]

# EIF211 - Bases de Datos
tags: [universidad, bases-datos, eif211]

# EIF212 - Sistemas Operativos
tags: [universidad, sistemas-operativos, eif212]
```

#### Otros Tipos
```yaml
# Conceptos
tags: [concepto, tema-relacionado]

# Proyectos
tags: [proyecto, nombre-proyecto]

# Recursos
tags: [recurso, tipo-recurso]

# Diario
tags: [diario]

# MOCs
tags: [moc, tema]

# Dashboard
tags: [dashboard, indice]
```

---

## 📄 Frontmatter Estándar

Todas las notas deben iniciar con:

```yaml
---
tags: [categoria, subcategoria]
created: YYYY-MM-DD
updated: YYYY-MM-DD
---
```

### Ejemplo Completo
```yaml
---
tags: [universidad, bases-datos, eif211]
created: 2026-02-16
updated: 2026-03-06
---

# Título de la Nota
```

---

## 🔗 Wikilinks

### Sintaxis
```
[[nombre-del-archivo]]
[[nombre-del-archivo|texto personalizado]]
[[nombre-del-archivo#seccion]]
```

### Ejemplos

```markdown
El [[2026-02-16-modelo-entidad-relacion]] es fundamental.

Ver [[moc-bases-de-datos|Mapa de BD]].

Lee más en [[2026-02-19-sistema-operativo#Capas del Sistema]].
```

### Cuándo Usarlos
✅ Para conectar conceptos relacionados  
✅ Para enlazar clases con MOCs  
✅ Para referencias a documentos  
❌ NO para enlaces externos (usa URLs normales)  

---

## 📁 Estructura de Carpetas

```
vault/
├── 00-dashboard/
│   ├── dashboard.md
│   ├── INICIO_RAPIDO.md
│   ├── REORGANIZACION_COMPLETADA.md
│   └── CONVENCIONES.md (este archivo)
│
├── 01-mocs/
│   ├── moc-universidad-2026.md
│   ├── moc-comunicaciones-redes.md
│   ├── moc-programacion-iv.md
│   ├── moc-ingenieria-sistemas-i.md
│   ├── moc-bases-de-datos.md
│   └── moc-sistemas-operativos.md
│
├── 02-universidad/
│   ├── EIF208-comunicaciones-redes/
│   │   ├── moc-comunicaciones-redes.md
│   │   ├── clases/
│   │   ├── conceptos/
│   │   └── tareas/
│   ├── EIF209-programacion-iv/
│   │   ├── moc-programacion-iv.md
│   │   ├── clases/
│   │   ├── conceptos/
│   │   └── tareas/
│   ├── EIF210-ingenieria-sistemas-i/
│   │   ├── moc-ingenieria-sistemas-i.md
│   │   ├── clases/
│   │   ├── conceptos/
│   │   └── tareas/
│   ├── EIF211-bases-de-datos/
│   │   ├── moc-bases-de-datos.md
│   │   ├── clases/
│   │   ├── conceptos/
│   │   └── tareas/
│   └── EIF212-sistemas-operativos/
│       ├── moc-sistemas-operativos.md
│       ├── clases/
│       ├── conceptos/
│       └── tareas/
│
├── 03-conceptos/
│   ├── 2026-02-16-modelo-entidad-relacion.md
│   ├── 2026-02-24-dbms-database-management-system.md
│   └── 2026-02-19-sistema-operativo.md
│
├── 04-proyectos/
│   ├── 2026-02-23-proyecto-programacion-iv-zombie.md
│   └── 2026-02-25-requerimientos-proyecto-1-programacion-iv.md
│
├── 05-recursos/
│   ├── 2026-02-25-fedora-setup.md
│   ├── 2026-02-25-nixos-setup.md
│   ├── 2026-02-25-git-setup.md
│   └── ... (otros recursos)
│
├── 06-diario/
│   ├── 2026-02-24-capacitacion.md
│   └── 2026-02-24-planeamiento-general.md
│
└── 99-archivadas/
    └── (para archivos antiguos o no usados)
```

---

## ✏️ Escribiendo Notas

### Estructura Recomendada

```markdown
---
tags: [categoria, subcategoria]
created: YYYY-MM-DD
updated: YYYY-MM-DD
---

# Título Principal

**Contexto:** [[Curso o concepto relacionado]] (si aplica)

## Introducción

Una o dos frases sobre qué es el tema.

## Conceptos Principales

### Subtema 1
- Punto importante
- [[Link a otro concepto]]

### Subtema 2
- Definición
- Ejemplos

## Resumen

Puntos clave.

## Links Relacionados

- [[concepto-relacionado]]
- [[otro-concepto]]
```

### Tips de Redacción
- Usa encabezados jerárquicos correctamente
- Conecta con `[[wikilinks]]` cuando sea relevante
- Actualiza la fecha `updated` al modificar
- Mantén las notas enfocadas (no demasiado largas)
- Agrega ejemplos cuando sea posible

---

## 🔄 Mantenimiento Regular

### Semanal
- [ ] Agrega nuevas notas de clases
- [ ] Actualiza MOCs si es necesario
- [ ] Revisa wikilinks rotos

### Mensual
- [ ] Archiva notas antiguas en `99-archivadas/`
- [ ] Revisa y actualiza conceptos
- [ ] Verifica consistencia de nombres

### Al Crear Nuevas Notas
- [ ] Usa formato `YYYY-MM-DD-slug.md`
- [ ] Agrega frontmatter con tags
- [ ] Conecta con wikilinks relevantes
- [ ] Actualiza MOC correspondiente

---

## 🚫 Errores Comunes a Evitar

| Error | Corrección |
|-------|-----------|
| Espacios en nombres | Usar guiones: `tema-importante` |
| Mayúsculas en slug | Todo minúscula: `analisis-requisitos` |
| Frontmatter incorrecto | Copiar ejemplo de nota existente |
| Sin wikilinks | Conectar 2-3 conceptos relevantes |
| Tags inconsistentes | Usar tags de referencia (arriba) |
| Archivos sin fecha | Siempre incluir `YYYY-MM-DD` al inicio |

---

## 📚 Referencias

- **Dashboard:** [[dashboard]]
- **MOC Central:** [[moc-universidad-2026]]
- **Inicio Rápido:** [[INICIO_RAPIDO]]
- **Reorganización:** [[REORGANIZACION_COMPLETADA]]

---

## ✅ Checklist para Nuevas Notas

Antes de guardar una nota nueva:

- [ ] Nombre correcto: `YYYY-MM-DD-slug.md`
- [ ] Frontmatter completo con tags, created, updated
- [ ] Título descriptivo con `#`
- [ ] Contexto claro (curso o tema)
- [ ] Al menos 2-3 wikilinks
- [ ] Sin ortografía
- [ ] Conectada con MOC correspondiente

---

*Documento de referencia - 2026-03-06*
