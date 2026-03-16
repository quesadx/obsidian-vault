---
Fecha: 2026-02-23
Tags:
  - "#UNA"
---

# 1. ¿Qué es lo que vamos a construir? (Visión General)

**El Contexto:**
Vivimos en un apocalipsis zombie. Tu sistema será el "cerebro" digital para gestionar campamentos de supervivientes.
**El Producto:**
Una **Aplicación Web**. Esto significa que se accede desde un navegador (como Chrome) y tiene dos partes principales:
1.  **Frontend (Lo que se ve):** Los botones, formularios, colores y animaciones que usan los supervivientes.
2.  **Backend/API (Lo que no se ve):** El motor que procesa los datos, guarda la información y hace los cálculos.

**Tecnologías Obligatorias:**
*   **React 18:** Una herramienta para crear la parte visual (Frontend) de forma moderna.
*   **TypeScript:** Es JavaScript (el lenguaje de la web) pero con "reglas estrictas" para evitar errores tontos.
*   **Vite:** Una herramienta rápida para construir y probar tu proyecto.
*   **API:** El puente que permite que lo visual hable con la base de datos.

---

# 2. Requisitos Funcionales (¿Qué debe HACER el sistema?)

Estos son los comportamientos que tu programa debe tener. Los he dividido por módulos para que los entiendas mejor.

### A. Gestión Humana (Las Personas)
1.  **Login y Seguridad:**
    *   *Qué es:* Solo personas registradas pueden entrar.
    *   *Regla clave:* Si el usuario no toca el mouse por **20 minutos**, el sistema se bloquea automáticamente (por seguridad, para que ningún zombie o espía use la computadora desatendida).
2.  **Ingreso de Nuevos Supervivientes (Con IA):**
    *   *El Reto:* Cuando llega alguien nuevo, debes tomar sus datos (fotos, contexto).
    *   *El Uso de IA:* Aquí debes usar Inteligencia Artificial. La IA debe analizar los datos y decir: "Esta persona es útil" o "Esta persona es peligrosa".
    *   *Transparencia:* El sistema debe mostrar *por qué* la IA tomó esa decisión (ej: "Rechazado porque tiene una herida infectada"). El humano final puede aceptar o corregir a la IA.
3.  **Roles y Profesiones:**
    *   La IA también sugiere qué trabajo hará la persona (médico, constructor, explorador) basado en sus habilidades.
4.  **Estado de Salud:**
    *   Debes poder marcar si alguien está "Enfermo", "Herido" o "Fuera".
    *   *Regla de negocio:* Si alguien está enfermo, no trabaja. Si se quedan sin médicos, el sistema debe permitir mover a alguien de otro trabajo temporalmente para cubrir el hueco.

### B. Gestión de Recursos (La Bodega)
1.  **Inventario:** Contar comida, agua, munición, etc.
2.  **Alertas:** Si la comida baja de cierto nivel, el sistema debe avisar (como una luz roja).
3.  **Ciclo Diario (Automático):**
    *   Cada persona consume una ración diaria.
    *   Cada persona produce recursos según su trabajo (ej: un agricultor trae comida).
    *   El sistema debe hacer esta resta y suma automáticamente cada día.
4.  **Exploraciones:**
    *   Puedes enviar grupos a buscar recursos fuera.
    *   Esto gasta raciones extra (para el viaje).
    *   Debes agendar cuándo salen y cuándo vuelven. Al volver, registran lo que trajeron.

### C. Otros Campamentos (Multi-Empresa)
1.  **Varios Campamentos:**
    *   El sistema debe manejar más de un campamento a la vez. Imagina que es como un sistema que usa Coca-Cola y Pepsi por separado, pero en la misma web. Los datos de un campamento no deben mezclarse con otro.
2.  **Comercio y Ayuda:**
    *   Un campamento puede pedir ayuda a otro.
    *   Si se aprueba, los recursos se restan de uno y se suman al otro.
    *   **Auditoría:** Todo movimiento debe quedar registrado para saber quién dio qué y cuándo (vital para evitar robos).
3.  **Traslado de Personas:**
    *   Si envías personas a otro campamento, deben llevar su comida para el viaje.

### D. Roles de Usuarios (Permisos)
No todos pueden hacer todo. El sistema debe tener estos roles:
1.  **Administrador del Sistema:** Ve todo, pero solo gestiona ingresos de personas.
2.  **Trabajador:** Solo puede cambiar inventario si tiene permiso.
3.  **Gestor de Recursos:** Encargado de enviar cosas entre campamentos.
4.  **Encargado de Viajes:** Organiza las expediciones y negociaciones.
*(Puedes crear más roles si los justificas).*

### E. General
1.  **Dashboard:** Una pantalla principal con gráficos y números importantes (métricas) para los jefes.
2.  **Hora Centralizada:** Todos los campamentos usan la hora del servidor central. Esto evita que un campamento diga "es de día" y otro "es de noche" para trucar el sistema.
3.  **Diseño Temático:** La página debe verse "post-apocalíptica" pero ser fácil de usar (UI/UX).

---

# 3. Requisitos No Funcionales (¿CÓMO debe comportarse el sistema?)

Esto no es lo que hace el sistema, sino sus cualidades técnicas. Como eres principiante, presta mucha atención aquí porque son los criterios de aprobación técnica.

1.  **Arquitectura:**
    *   **Separación Clara:** El Frontend (React) y el Backend (API) deben ser proyectos separados que se comunican. No mezcles el código.
2.  **Inteligencia Artificial (IA):**
    *   **Obligatorio:** Debes usar IA (como ChatGPT, Copilot, o APIs de IA) para ayudar a diseñar o tomar decisiones (como la entrada de supervivientes).
    *   **Evidencia:** Debes documentar *cómo* usaste la IA. No ocultes que la usaste, muéstralo como una herramienta.
    *   **Explicabilidad:** Si la IA decide algo, el usuario debe poder entender por qué.
3.  **Calidad de Código:**
    *   **ESLint / Prettier:** Son herramientas que revisan automáticamente si tu código está "sucio" o mal escrito. Debes configurarlas para que te corrijan mientras escribes.
    *   **TypeScript Estricto:** No允许 (no permite) variables sin tipo definido. Ayuda a prevenir errores.
4.  **Experiencia de Usuario (UX) y Gamificación:**
    *   **Animaciones:** Los botones deben reaccionar, las cargas deben tener animaciones.
    *   **Gamificación:** Agrega elementos de juego. Ej: "Nivel del campamento", "Logros desbloqueados", "Barra de progreso de supervivencia". Esto hace la app más divertida.
5.  **Rendimiento:**
    *   **Responsive:** Debe verse bien en celular y en computadora.
    *   **Paginación:** Si hay 1000 supervivientes, no los muestres todos de golpe. Muestra 10 por página para que no sea lento.
6.  **Seguridad:**
    *   **Autenticación:** Login con contraseña.
    *   **Autorización:** Que un "Trabajador" no pueda borrar la base de datos solo porque quiere.
    *   **Timeout:** Cerrar sesión a los 20 minutos de inactividad.
7.  **Pruebas Automáticas (Testing):**
    *   **Playwright:** Es una herramienta que simula ser un usuario real. Debes escribir scripts que digan: "Entra al login, escribe usuario, escribe clave, verifica que entre". Esto se ejecuta automático.
8.  **Despliegue (Publicación):**
    *   **GitHub:** Tu código debe estar subido a internet en un repositorio público.
    *   **Vercel:** Es donde se publica la página web para que cualquiera pueda entrar con un link.
    *   **Cloud Gratuito:** La base de datos y API deben estar en servicios gratuitos (como Render, Railway, Supabase, etc.).

---

# 4. Glosario para Principiantes (Conceptos Clave)

Aquí aclaro los términos técnicos que aparecen en el documento:

*   **API (Application Programming Interface):** Es como un camarero en un restaurante. Tú (Frontend) le pides el menú al camarero (API), él va a la cocina (Base de Datos/Servidor), trae la comida y te la sirve. Tu página web no toca la base de datos directamente, habla con la API.
*   **Frontend:** Es todo lo que el usuario ve y toca en el navegador.
*   **Backend:** Es la lógica del servidor, donde se procesan los datos y se guardan.
*   **Repositorio GitHub:** Es una carpeta en internet donde se guarda el historial de tu código. Es como un "Google Drive" pero para programadores, que guarda cada cambio que haces.
*   **E2E (End to End):** Pruebas de extremo a extremo. Significa probar la aplicación completa desde que el usuario entra hasta que sale, automatizado.
*   **Linting (ESLint):** Un corrector ortográfico pero para código. Te dice "aquí faltó un punto y coma" o "esta variable no se usa".
*   **Multi-tenant (Multi-empresa):** Una sola instalación de software que sirve a varios clientes (campamentos) manteniendo sus datos separados.
*   **Gamificación:** Usar técnicas de videojuegos (puntos, niveles, medallas) en aplicaciones que no son juegos para motivar al usuario.
*   **Refactorización:** Mejorar el código sin cambiar lo que hace. Es como ordenar tu cuarto para encontrar las cosas más rápido, sin tirar nada.
*   **Mockup:** Un dibujo o diseño de cómo se verá la página antes de programarla.

---

# 5. Etapas y Evaluación (Tu Hoja de Ruta)

El proyecto no se entrega todo al final. Tiene 4 hitos. **Si fallas el primero, no puedes continuar.**

1.  **Base Inicial (Semana 10 - 8% de la nota):**
    *   **Qué entregar:** Planos (diagramas), diseño de pantallas (dibujos), diseño de datos (tablas) y una conexión básica entre tu web y la API.
    *   **Consejo:** No empieces a programar a lo loco. Dibuja primero qué vas a hacer.
2.  **Aplicación Base (Semana 14 - 10% de la nota):**
    *   **Qué entregar:** El sistema ya debe funcionar casi completo. Aquí se revisa seguridad y se limpia el código.
3.  **Defensa del Proyecto (Semana 15 - 14% de la nota):**
    *   **Qué entregar:** Pruebas de estrés (muchos datos), pruebas de integración.
    *   **¡CUIDADO!:** Si aquí no tienes el **80% del proyecto hecho**, **no puedes hacer la presentación final** y tu nota se queda truncada.
4.  **Presentación Final (Semana 17 - 8% de la nota):**
    *   **Qué entregar:** Exposición final, corrección de detalles finales, conclusiones.

**Nota Importante sobre la Defensa:**
Aunque trabajen en grupo (máximo 5 personas), **la nota es individual**. El profesor te preguntará a TI sobre el código. Si tu compañero hizo la API y tú no sabes cómo funciona, **reprobarás esa parte**. Deben documentar todo en GitHub y Drive.

---

# 6. Recomendaciones Estratégicas para ti (Siendo Principiante)

1.  **No copies:** El documento dice explícitamente: "Si se comprueba que existen dos o más proyectos similares... nota cero a todos". Usa la IA para aprender, no para que haga el trabajo por ti.
2.  **Empieza por la Arquitectura:** Antes de escribir una línea de código, dibuja en un papel o en [draw.io](https://draw.io) cómo se conectan las piezas. Esto es el 20% de tu nota inicial.
3.  **Domina la IA:** El proyecto pide usar IA. Úsala para que te explique errores, para que te genere estructuras de carpetas o para simular la lógica de "aceptar supervivientes". Pero **documenta** qué le pediste y qué te respondió.
4.  **GitHub desde el Día 1:** Crea tu repositorio hoy. Sube cambios pequeños cada día. Los profesores revisarán el historial para ver que trabajaste constantemente.
5.  **Enfócate en el "Feliz Camino" (Happy Path):** Primero haz que el sistema funcione cuando todo sale bien (login correcto, recursos suficientes). Luego agrega los errores (sin internet, datos incorrectos).
6.  **La Hora del Servidor:** Es un requisito crítico. Asegúrate de que todas las fechas y horas se guarden basadas en el servidor, no en la computadora del usuario (porque el usuario puede cambiar la hora de su PC para hacer trampa).
7.  **Pruebas Playwright:** No las dejes para el final. Escribe una prueba simple apenas tengas el login funcionando.

### Resumen de Éxito
Para aprobar con buena nota necesitas:
1.  Una web bonita y temática (Zombie).
2.  Una API segura y separada.
3.  Uso visible y documentado de IA.
4.  Código limpio (con ESLint).
5.  Pruebas automáticas que pasen.
6.  **Saber explicar todo lo que hay en el código en la defensa individual.**



