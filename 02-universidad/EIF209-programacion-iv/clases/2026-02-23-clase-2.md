---
fecha: 2026-02-23
moc: "[[moc-programacion-iv]]"
tipo: "[[Universidad]]"
tags:
  - UNA
  - ProgramaciónIV
---
## Desarrollo de Interfaces Web
Involucra diversas áreas, es un contrato visual e interactivo entre lo que espera el usuario y una aplicación. Combina 3 pilares: Estructura (HTML), presentación (CSS) y comportamiento (JS). Es donde más se perciben calidad, accesibilidad  confianza. 
Analogía: La tienda
- HTML: Paredes, pasillos,, etiquetas de secciones.
- CSS: Decoración, señalización e iluminación.
- Accesibilidad: Rampas, letreros claros.
Importancia en el mundo real
- Conversión: Ventas y registros.
- Productividad: Apps internas
- Riesgo legal: Accesibilidad.
- Costo de soporte: Usabilidad. 
Un flujo típico es:
1. Diseño (Figma)
2. Implementación (HTML, CSS, JS)
3. Revisión (QA/UX)
4. Métricas (Análisis)
### HTML 
Lenguaje de estructura de la web. No se programa, no da estilos y no maneja lógica.  Está compuesto por elementos que tienen atributos, los elementos más importantes son:
- Título 
- Párrafo 
- Imagen 
- Formulario
#### HTML5 Semántico
Semántica = usar la etiqueta correcta (header, nav, main, section, article) . Beneficios:
- Accesibilidad
- SEO (search engine optimization)
- Mantenibilidad
- Nuevos tipos de inputs
- Validaciones en html
- Multimedia nativo
- Nuevas APIS. 
![[Pasted image 20260223180726.png]]
### CSS
Es el lenguaje para dar estilo y diseño a páginas web creado con HTML. Sirve para:
- Colores, fondos y tipografía
- Espaciado, márgenes y alineación
- Diseño de layouts
- Diseño responsive
- Animaciones y transiciones. 
#### CSS 3 moderno 
Se centra en:
- **Layouts robustos:** Flexbox (1 dimensión), grid (más complejo). 
- **Responsividad real:** Adaptabilidad a dispositivos. 
- **Mantenibilidad:** Variables y composición 
- **Consistencia:** Design tokens
## Diseño Responsive
Es más que verse bien, significa que el contenido sea legible sin zoom, tenga controles tocables y layout que cambia con intención. En equipos reales se define por breakpoints + comportamiento. 
### Accesibilidad (A11y) en UI web
Que la app sea usable por personas con diversas capacidades. Cada input debe tener label asociado. Es parte del "Definition of Done"
- Contrastre
### Usabilidad: Reglas que sí aplican 
- Claridad gana a creatividad. 
- Feedback inmediato
- Constancia reduce aprendizaje 
- Estados vacíos explican qué hacer
### Frameworks y utilidades CSS
Tienen dos enfoques frecuentes:
- Component-first
- Utility-first
Se usan cuando n