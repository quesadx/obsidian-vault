---
Fecha: 2026-02-23
Tags:
  - "#UNA"
---

**Gestión humana dentro de la base**

1. El sistema debe permitir acceso solo a personas con un rol específico. La sesión debe bloquearse tras 20 minutos de inactividad.
2. Para el ingreso de una nueva persona se debe recopilar información relevante al contexto (definida y argumentada por el estudiante), permitir agregar imágenes y tarjeta de identificación. Una IA debe procesar esta información de forma automática y transparente, basándose en reglas del campamento para permitir o denegar el ingreso, generando un reporte que el usuario final pueda aceptar o corregir manualmente.
3. Al ingresar una persona se le debe asignar automáticamente una identificación y un cargo o profesión mediante IA, basándose en reglas específicas **y en registros previos del campamento**. Los cargos/roles deben ser definidos por el estudiante.
4. El sistema debe gestionar las condiciones de las personas (enferma, herida, fuera del campamento, entre otros). Según su estado no podrá realizar su trabajo. Si un cargo se queda sin trabajadores disponibles, se debe poder mover temporalmente personas de otro cargo al que quedó vacío.

---

**Gestión de recursos**

1. Se debe mantener en bodega un conteo de todos los recursos existentes, consultable en cualquier momento.
2. Se deben generar alertas cuando un recurso esté por debajo de un mínimo establecido.
3. La comida y el agua deben conseguirse a diario. Esto se refleja en el trabajo de cada integrante del campamento — su trabajo indica cuánta comida o agua consigue diariamente. A diario también se le da una ración a cada persona. Ambos movimientos deben contabilizarse automáticamente en la bodega. Debe existir un apartado para registrar manualmente un cambio en caso de que una persona no pueda cumplir su objetivo diario.
4. El sistema debe gestionar exploraciones: un grupo de personas con ese trabajo puede salir a buscar recursos. Las exploraciones consumen raciones adicionales, se deben agendar con control de los días estimados que tomará la exploración y algunos días extra como último recurso. Al regresar al campamento se debe hacer un recuento de las provisiones traídas y contabilizarlas en la bodega.

---

**Otros campamentos**

1. El sistema debe manejar más de un campamento, gestionando la información de manera separada, similar a un sistema multiempresa.
2. Los campamentos pueden enviarse solicitudes de recursos o ayuda a campamentos vecinos. Estas pueden aprobarse o rechazarse. Si se aprueban, los cambios deben reflejarse en la bodega. Debe haber información de auditoría siempre disponible para estas operaciones ya que son vitales.
3. Si se aprueban solicitudes que implican envío de personas, se debe crear un grupo con personas que tengan ese rol, y deben llevar raciones para su viaje. Si se prestan raciones a otra base, se debe agendar la entrega y debe ser aprobada por **ambos campamentos**, tanto al momento de salir como al momento de ingresar, para contabilizar correctamente el manejo de la bodega.

---

**Generales**

1. Dashboard con métricas importantes sobre datos del campamento y la bodega para el gestor de recursos y el administrador del sistema. Los demás roles solo ven los recursos asignados a su propia persona.
2. Al cambiar de campamento el sistema debe volver al inicio y permitir solo el acceso a la información autorizada para ese campamento.
3. Se debe implementar un diseño, animaciones y estilos acordes al contexto del proyecto, sin dejar de lado las mejores prácticas de UI/UX para aplicaciones web.
4. Se debe manejar una sola hora centralizada en el servidor central para controlar flujos críticos y asegurar la supervivencia de todos.
5. Roles definidos:
    - **Administrador del sistema:** Ve todo el sistema pero solo gestiona el ingreso de personas.
    - **Trabajador:** Solo puede hacer cambios de inventario autorizados por el gestor de recursos.
    - **Gestor de recursos:** Encargado general de traslados y envíos de recursos.
    - **Encargado de viajes y comunicación:** Realiza expediciones y negociaciones con otros campamentos.
    - Se puede incluir otro rol si el estudiante lo encuentra necesario y lo justifica.

---

**Requerimientos no funcionales**

1. Arquitectura moderna orientada a servicios con separación clara entre frontend y backend. API versionada y documentada que permita escalabilidad y mantenimiento.
2. Frontend en React 18, TypeScript y Vite, organizado por capas o por funcionalidades, con patrones de diseño apropiados debidamente justificados por el estudiante.
3. Uso explícito y documentado de IA en el desarrollo. Las decisiones automatizadas relevantes deben ser explicables y trazables, permitiendo al usuario revisarlas y aceptarlas o corregirlas.
4. Código con estándares profesionales: ESLint, Prettier, CSpell y configuraciones estrictas de TypeScript. Componentes reutilizables, separación de responsabilidades y manejo adecuado del estado y efectos en React.
5. Animaciones avanzadas, microinteracciones y elementos de gamificación (progresos, niveles, logros o recompensas visuales) integrados de forma funcional a los procesos del sistema.
6. Paginación, carga diferida y manejo eficiente de procesos asíncronos. Diseño responsive para móviles y escritorio.
7. Autenticación y autorización por roles con acceso restringido según perfil. Sesión expira tras inactividad.
8. Hora única centralizada del servidor para todas las operaciones críticas: consumo de recursos, exploraciones y transferencias entre campamentos.
9. Pruebas E2E con Playwright cubriendo flujos críticos, ejecutadas automáticamente en el proceso de integración continua.
10. Despliegue en servicios en la nube en capa gratuita. Repositorio público en GitHub, frontend desplegado en Vercel.