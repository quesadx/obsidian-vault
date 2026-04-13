# Agent: Estructura y formato de notas

Este archivo resume la estructura, el estilo y las convenciones utilizadas en las notas de este vault de Obsidian.

## Organización general

- `00-dashboard/`: notas rápidas y convenciones generales.
- `01-mocs/`: mapas mentales de alto nivel por tema o proyecto.
- `02-universidad/`: organización por curso, con subcarpetas `clases/`, `conceptos/`, `tareas/` y `moc-*`.
- `03-conceptos/`: notas de conceptos globales, guías y documentación técnica.
- `04-proyectos/`, `05-recursos/`, `06-diario/`, `07-excalidraw/`, `08-calcurse/`, `99-archivadas/`: se usan para proyectos, recursos, diario, diagramas, calendario y archivo.

## Formato de nota

Cada nota suele incluir:

- YAML frontmatter al inicio con campos clave como `Fecha` y `moc`.
- Encabezado principal `#` con el título de la nota o capítulo.
- Subsecciones con `##`, `###` para agrupar temas.
- Separadores `---` para dividir secciones mayores.

Ejemplo de metadatos:

```markdown
---
Fecha: 12-04-2026
moc: "[[moc-sistemas-operativos]]"
---
```

## Convenciones de estilo

- Usar lenguaje claro y directo.
- Mantener listas con viñetas para conceptos clave.
- Emplear párrafos cortos y oraciones precisas.
- Resaltar términos técnicos con comillas invertidas `` ` `` (inline code) cuando sea pertinente.
- Usar tablas para comparaciones o definiciones de tipos.
- Añadir ejemplos concretos cuando se define un concepto.

## Estructura de una nota técnica

Típicamente incluye:

1. Definición del concepto principal.
2. Lista de características o elementos clave.
3. Ejemplos prácticos.
4. Comparaciones o diferencias con otros conceptos relacionados.

## Ejemplos de formato

- `sistema operativo`, `kernel`, `DMA`, `CPU`, `E/S`, `SMP`, `AMP`, `quantum`.
- Listas claras para pasos, características y ventajas/desventajas.
- Subtemas como `Multiprogramación`, `Tiempo compartido`, `Modo dual`.
- Secciones de arquitectura y tipos de sistemas: `sistemas embebidos`, `sistemas multimedia`, `cliente-servidor`, `P2P`, `sistemas distribuidos`, `entornos basados en la web`.

## Estilo de escritura recomendado

- Evitar frases largas o redundantes.
- Corregir errores ortográficos y de redacción.
- Expandir conceptos cuando falte contexto.
- Mostrar las relaciones estrechas entre términos técnicos.
- Priorizar claridad sobre cantidad.

## Notas adicionales

- Incluir `moc` en las notas relevantes para vincular con mapas mentales.
- Mantener la estructura consistente entre notas de la misma materia.
- Usar ejemplos y analogías concretas para facilitar la comprensión.
