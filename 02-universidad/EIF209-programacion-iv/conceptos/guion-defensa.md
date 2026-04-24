---
+:
---
Desde el inicio trabajé la autenticación pensando en dos piezas que debían funcionar juntas: la parte de Google como proveedor de identidad y la parte de JWT como token local para la API. El proyecto no solo tiene un login con Google, sino también una capa de seguridad propia que permite a la API validar usuarios sin tener que regresar a Google en cada petición.

  

La configuración está centralizada en `app/core/config.py`. Ahí definí `GOOGLE_CLIENT_ID`, `GOOGLE_CLIENT_SECRET` y `GOOGLE_REDIRECT_URI` como variables de entorno, junto con `GOOGLE_OAUTH_SCOPES` para solicitar `openid email profile`. La app usa `SECRET_KEY`, también desde el entorno, para firmar los JWT locales. Esa separación es importante porque el backend mantiene control de sus tokens y no depende únicamente del token de Google.

  

El flujo arranca en `GET /auth/google/login`, en `app/routers/auth_router.py`. Primero valido que las credenciales de Google estén disponibles, porque sin eso el flujo no puede arrancar. Luego genero un `state` seguro con `secrets.token_urlsafe(24)` y lo guardo en la sesión de Flask bajo `session["google_oauth_state"]`. Ese `state` protege contra ataques CSRF y hace que la callback solo sea válida si viene del mismo navegador que inició el login.

  

Construyo la URL de autorización de Google con los parámetros estándar de OAuth: `client_id`, `redirect_uri`, `response_type=code`, `scope`, `state`, `access_type=offline` y `prompt=consent`. Uso `access_type=offline` para que el flujo sea compatible con futuras ampliaciones que requieran refresh tokens, y `prompt=consent` para asegurar que el usuario vea la pantalla de permiso. Si el cliente pide `mode=json`, devuelvo la URL en JSON en lugar de redirigir, lo que facilita integraciones con frontends que manejan la redirección por su cuenta.

  

La segunda parte del flujo está en `GET /auth/google/callback`. Aquí vuelvo a validar la configuración de Google, compruebo si Google devolvió un error y, sobre todo, verifico que el `state` que retorna Google coincida con el que guardé en la sesión. Si el `state` no coincide, corto el proceso con un error de OAuth inválido.

  

Con el `code` de autorización hago un POST a `https://oauth2.googleapis.com/token`, usando `client_id`, `client_secret`, `redirect_uri` y `grant_type=authorization_code`. Esto intercambia el código por un `access_token` de Google. Si la petición falla, devuelvo un `502` con detalle del error, porque es un punto crítico del flujo.

  

Con el `access_token` consulto `https://openidconnect.googleapis.com/v1/userinfo` para obtener el perfil del usuario. De ahí saco el `sub` que es el identificador único de Google y el `email`, además de información opcional como `name` y `picture`. Si no llega ni `sub` ni `email`, la autenticación no es usable, porque no hay un identificador fiable.

  

El token local se crea en `_issue_local_jwt()` y lo firmo con `Config.SECRET_KEY` usando `HS256`. El payload incluye `sub`, `provider: "google"`, y cuando están disponibles también `email` y `google_sub`. Con eso puedo devolver un JWT propio que la API acepta como comprobante de identidad. La respuesta del callback entrega `access_token`, `token_type: bearer`, `provider: google` y un objeto `user` con la información básica de perfil.

  

Además de ese flujo de Google SSO, implementé un endpoint adicional `POST /auth/token` para emitir JWT cuando el cliente ya conoce un `user_id` en la base de datos. Ese endpoint valida el `user_id`, verifica que exista con `XRayRepository.get_by_id()` y genera un JWT con `sub` y `user_id`. Es una ruta más simple y complementaria para casos en que el usuario ya está registrado en el backend.

  

Para resolver la autenticación en las peticiones protegidas usé `app/core/security.py`. Ahí leo la cabecera `Authorization`, decodifico el bearer token con `jwt.decode(..., SECRET_KEY, algorithms=["HS256"])` y extraigo el `sub` o `user_id`. Si el token no es válido o si tiene un propósito distinto como `xray_image_access`, lanzo un error de seguridad. También dejé una compatibilidad secundaria con cabeceras `X-User-Id` o `X-User-Email` para facilitar algunas pruebas o integraciones internas.

  

En resumen, el enfoque fue construir un login de Google seguro y estándar, y a partir de ahí emitir un JWT local que la API pueda verificar de forma independiente. Eso permite aprovechar la experiencia de Google como proveedor de identidad, mientras el backend conserva control sobre la autorización y la validez de los tokens dentro del dominio de la aplicación.