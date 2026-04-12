---
Fecha: 25-02-2026
moc: "[[moc-programacion-iv]]"
Tags:
  - ProgramaciónIV
  - UNA
  - "#GestionDelFin"
---

# 2026-02-25
## Listado de comandos prefijos
### `npm init -y`

Crea el **`package.json`** con valores por defecto. Guarda nombre, scripts, dependencias y versión. Se agregó esto para arrancar el server en modo developer:

``` JSON
"scripts": {  
    "dev": "ts-node-dev --respawn src/index.ts"  
}
```

### `npm install -D ts-node-dev typescript @types/node`

- **`typescript`**: Permite escribir y compilar código TypeScript.
- **`ts-node-dev`**: Ejecuta TypeScript directamente, recargando el servidor cuando cambias código.
- **`@types/node`**: Tipos de Node para TypeScript (para usar `console`, `process`, etc.).
- `-D`: indica que son **devDependencies** (solo necesarias en desarrollo).

### `npm install express` y `npm install -D @types/express`

- **`express`**: Framework de Node.js para crear APIs y servidores.
- **`@types/express`**: Tipos de Express para TypeScript.
- Permite hacer cosas como `app.get("/", ...)` con tipado correcto.
## Listado de comandos usuales

### `npm run dev`

- Ejecuta el script `"dev"` definido en `package.json`.
- Usa `ts-node-dev` para compilar TypeScript y levantar el servidor en modo desarrollo.
- Permite que el servidor se recargue automáticamente si modificas código.