---
Fecha: 2026-03-16
moc: "[[moc-programacion-iv]]"
---
# Clase 4 - Frameworks Frontend

## SPA vs MPA

**MPA (Multi-Page App)**:

- Cada navegación carga una nueva página HTML desde el servidor.
- El navegador se recarga completamente, y el estado se reinicia por página.

**SPA (Single-Page App)**:

- Se carga una sola página HTML y el JS maneja la navegación internamente.
- Solo se solicita/actualiza data al servidor; la vista se actualiza sin refrescar.

---

## SSR vs SSG

**SSR (Server-side rendering**:

- El servidor genera HTML en cada petición y lo envía al cliente.
- Ideal para contenido dinámico y SEO, pero requiere trabajo por solicitud.

**SSG (Static site generation)**:

- El HTML se construye en el momento de build y se sirve como archivos estáticos.
- Muy rápido y cacheable, pero necesita rebuild para actualizar contenido.

---

## Angular vs React

### React

**Props**: Datos que vienen de arriba, parámetros, información inicial
**State**: Información que tiene un prop en un momento dado

### Angular

**Virtual DOM**:

## Componentes web: la unidad básica

Un componente:
- Recibe props (entradas)
- Mantiene state (memoria interna)
- Emite eventos/handlers (salidas)
**Beneficio**: re utilización y separación por responsabilidades.

---

### Buenas prácticas

- Reusabilidad
- Composición
- Atomic design
- Design systems
- Component libraries

## Estados

**UI-state:** Modales, tabs, filtros (local)
**App state:** Usuario autenticado, permisos (global)
**Server state:** Datos que vienen de API (cache, reintentos, sincronización)

### Gestión de estado

Cómo manejar el estado en aplicaciones complejas:

1. Estado local vs global
2. Redux, Zustand, MobX
3. Server state (React Query, SWR)
4. Estado derivado

---

## Nota (resumen)

- En frontend hoy se usa **SPA** con rutas controladas en el cliente, y se elige **SSR/SSG** según SEO y frecuencia de datos.
- Frameworks principales: **React** (flexible, librería UI + ecosistema), **Angular** (framework completo), **Vue** (sintaxis declarativa, progresivo).
- Los conceptos clave son: componentes reutilizables, separación de responsabilidades, y un modelo de estado claro (local vs global vs servidor).
- En la práctica, se busca: entrega rápida (SSG/caching), experiencia fluida (SPA), y datos consistentes (server state + reintentos).

---

## Glosario rápido

- **SPA:** Single-Page App. Una sola página HTML; el JS actualiza vistas sin recargar.
- **MPA:** Multi-Page App. Cada ruta pide una página nueva al servidor.
- **SSR:** Server-Side Rendering. El servidor genera HTML cada vez que se solicita.
- **SSG:** Static Site Generation. El HTML se construye en build y se sirve estático.
- **API:** Interfaz para recuperar datos (JSON, GraphQL, REST).
- **Hydration:** Proceso donde el JS “activa” el HTML prerenderizado (SSR/SSG) en el cliente.
- **Estado local:** Es el estado encapsulado dentro de un componente/módulo específico. Solo afecta su propio render y comportamiento.
- **Estado global:** Es estado compartido por múltiples partes de la aplicación. Representa información transversal.

