---
Fecha: 13-06-2026
moc: "[[moc-programacion-iv]]"
---


# Turborepo + React + FastAPI + uv Monorepo Setup

This guide sets up a monorepo with:

- `apps/web`: React + Vite + TypeScript frontend
- `apps/api`: Python FastAPI backend
- `pnpm`: JavaScript package manager and workspace manager
- `turbo`: task orchestration for the monorepo
- `uv`: Python project, dependency, lockfile, and command runner

The important rule is:

```txt
pnpm manages JavaScript dependencies.
uv manages Python dependencies.
Turborepo only orchestrates tasks.
```

Do not try to make Turborepo manage Python packages. Make Turbo run `uv` commands through package scripts.

---

## 1. Requirements

Install or have available:

```bash
git
node
pnpm
uv
```

Recommended versions:

```bash
node --version
pnpm --version
uv --version
```

If using Nix/NixOS, use a dev shell instead of global installs.

Example temporary shell:

```bash
nix shell nixpkgs#git nixpkgs#nodejs_22 nixpkgs#pnpm nixpkgs#uv
```

---

## 2. Create the repository

```bash
mkdir siglab
cd siglab
git init
```

Initial structure:

```txt
siglab/
├─ apps/
│  ├─ web/
│  └─ api/
├─ packages/
├─ package.json
├─ pnpm-workspace.yaml
├─ turbo.json
├─ .gitignore
└─ README.md
```

Create directories:

```bash
mkdir -p apps packages
```

---

## 3. Initialize the root package

```bash
pnpm init
```

Edit the root `package.json`:

```json
{
  "name": "siglab",
  "private": true,
  "packageManager": "pnpm@10.0.0",
  "scripts": {
    "dev": "turbo dev",
    "build": "turbo build",
    "lint": "turbo lint",
    "check-types": "turbo check-types",
    "test": "turbo test",
    "format": "turbo format"
  },
  "devDependencies": {
    "turbo": "latest"
  }
}
```

If your installed PNPM version is different, replace `pnpm@10.0.0` with your actual version:

```bash
pnpm --version
```

Example:

```json
"packageManager": "pnpm@10.12.1"
```

Install Turbo in the repo:

```bash
pnpm add -D turbo -w
```

The `-w` flag installs it at the workspace root.

---

## 4. Configure PNPM workspaces

Create `pnpm-workspace.yaml`:

```yaml
packages:
  - "apps/*"
  - "packages/*"
```

This lets PNPM and Turbo detect `apps/web`, `apps/api`, and future shared packages.

---

## 5. Configure Turborepo

Create `turbo.json`:

```json
{
  "$schema": "https://turborepo.com/schema.json",
  "tasks": {
    "dev": {
      "cache": false,
      "persistent": true
    },
    "build": {
      "dependsOn": ["^build"],
      "outputs": ["dist/**", "build/**"]
    },
    "lint": {},
    "check-types": {
      "dependsOn": ["^check-types"]
    },
    "test": {},
    "format": {
      "cache": false
    }
  }
}
```

Notes:

- `dev` is marked `persistent` because Vite and FastAPI keep running.
- `dev` has `cache: false` because dev servers should not be cached.
- `build.outputs` includes common frontend output directories.
- `check-types` is separated from `build` so Turbo can run type checks independently.

---

## 6. Create the React frontend

From the repo root:

```bash
pnpm create vite apps/web --template react-ts
```

Edit `apps/web/package.json`:

```json
{
  "name": "@siglab/web",
  "private": true,
  "version": "0.0.0",
  "type": "module",
  "scripts": {
    "dev": "vite --host 0.0.0.0 --port 5173",
    "build": "vite build",
    "check-types": "tsc --noEmit",
    "lint": "eslint .",
    "test": "echo \"no tests yet\"",
    "format": "prettier --write ."
  },
  "dependencies": {
    "@vitejs/plugin-react": "latest",
    "vite": "latest",
    "typescript": "latest",
    "react": "latest",
    "react-dom": "latest"
  },
  "devDependencies": {}
}
```

If Vite generated a more complete `package.json`, do not delete useful dependencies. The important part is that the scripts exist:

```json
{
  "scripts": {
    "dev": "vite --host 0.0.0.0 --port 5173",
    "build": "vite build",
    "check-types": "tsc --noEmit",
    "lint": "eslint ."
  }
}
```

Run install after creating the app:

```bash
pnpm install
```

---

## 7. Create the FastAPI backend with uv

From the repo root:

```bash
mkdir -p apps/api
cd apps/api
uv init --app
uv add fastapi --extra standard
uv add --dev ruff pytest
```

This creates:

```txt
apps/api/
├─ .python-version
├─ README.md
├─ main.py
├─ pyproject.toml
└─ uv.lock
```

For a clean API layout, replace the default `main.py` with an `app/` package:

```bash
mkdir -p app
touch app/__init__.py
rm -f main.py
```

Create `apps/api/app/main.py`:

```python
from fastapi import FastAPI

app = FastAPI(title="SIGLAB API")


@app.get("/health")
def health() -> dict[str, str]:
    return {"status": "ok"}
```

Test it directly:

```bash
uv run fastapi dev app/main.py --host 0.0.0.0 --port 8000
```

Open:

```txt
http://localhost:8000/health
http://localhost:8000/docs
```

Expected health response:

```json
{"status":"ok"}
```

---

## 8. Add a package.json bridge for the Python API

Turbo discovers tasks from workspace packages. Since the API is Python, add a minimal `package.json` only to expose scripts to Turbo.

Create `apps/api/package.json`:

```json
{
  "name": "@siglab/api",
  "private": true,
  "scripts": {
    "dev": "uv run fastapi dev app/main.py --host 0.0.0.0 --port 8000",
    "build": "uv run python -m compileall app",
    "lint": "uv run ruff check .",
    "check-types": "echo \"no Python typecheck configured\"",
    "test": "uv run pytest",
    "format": "uv run ruff format ."
  }
}
```

Optional: if you later add `mypy` or `pyright`, replace `check-types`:

```bash
uv add --dev mypy
```

Then:

```json
"check-types": "uv run mypy app"
```

---

## 9. Root .gitignore

Create `.gitignore`:

```gitignore
# Node / JS
node_modules
dist
build

# Turborepo
.turbo

# Env
.env
.env.*
!.env.example

# Python
.venv
__pycache__
*.pyc
.pytest_cache
.ruff_cache
.mypy_cache

# OS/editor
.DS_Store
.vscode
.idea
```

Do commit `uv.lock` for the API because this is an application repo.

Do commit:

```txt
pnpm-lock.yaml
apps/api/uv.lock
```

Do not commit:

```txt
node_modules/
apps/api/.venv/
.turbo/
.env
```

---

## 10. Install everything

From the repo root:

```bash
pnpm install
```

Then sync Python dependencies:

```bash
cd apps/api
uv sync
cd ../..
```

You can usually skip manual `uv sync` because `uv run ...` will sync automatically, but running it once makes setup errors obvious.

---

## 11. Run the whole monorepo

From the repo root:

```bash
pnpm dev
```

This runs:

```txt
apps/web -> Vite dev server on port 5173
apps/api -> FastAPI dev server on port 8000
```

Useful commands:

```bash
pnpm build
pnpm lint
pnpm check-types
pnpm test
pnpm format
```

Run only frontend:

```bash
pnpm turbo dev --filter=@siglab/web
```

Run only backend:

```bash
pnpm turbo dev --filter=@siglab/api
```

---

## 12. Connect React to FastAPI

Create `apps/web/.env.example`:

```env
VITE_API_URL=http://localhost:8000
```

Create local env:

```bash
cp apps/web/.env.example apps/web/.env
```

Example frontend fetch:

```ts
const API_URL = import.meta.env.VITE_API_URL;

export async function getHealth() {
  const res = await fetch(`${API_URL}/health`);

  if (!res.ok) {
    throw new Error("API request failed");
  }

  return res.json();
}
```

---

## 13. Add CORS to FastAPI

Install nothing extra; CORS middleware comes from FastAPI/Starlette.

Edit `apps/api/app/main.py`:

```python
from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware

app = FastAPI(title="SIGLAB API")

app.add_middleware(
    CORSMiddleware,
    allow_origins=[
        "http://localhost:5173",
    ],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)


@app.get("/health")
def health() -> dict[str, str]:
    return {"status": "ok"}
```

For production, do not use `"*"` for origins if credentials/cookies are involved. Add the exact frontend URL.

---

## 14. Recommended backend structure

Use this once the API grows:

```txt
apps/api/
├─ app/
│  ├─ __init__.py
│  ├─ main.py
│  ├─ api/
│  │  ├─ __init__.py
│  │  └─ routes/
│  │     ├─ __init__.py
│  │     └─ health.py
│  ├─ core/
│  │  ├─ __init__.py
│  │  └─ config.py
│  ├─ db/
│  │  ├─ __init__.py
│  │  └─ session.py
│  ├─ models/
│  │  └─ __init__.py
│  └─ schemas/
│     └─ __init__.py
├─ tests/
├─ pyproject.toml
├─ uv.lock
└─ package.json
```

Example route split:

```bash
mkdir -p apps/api/app/api/routes
touch apps/api/app/api/__init__.py
touch apps/api/app/api/routes/__init__.py
```

Create `apps/api/app/api/routes/health.py`:

```python
from fastapi import APIRouter

router = APIRouter()


@router.get("/health")
def health() -> dict[str, str]:
    return {"status": "ok"}
```

Update `apps/api/app/main.py`:

```python
from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware

from app.api.routes.health import router as health_router

app = FastAPI(title="SIGLAB API")

app.add_middleware(
    CORSMiddleware,
    allow_origins=["http://localhost:5173"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

app.include_router(health_router)
```

---

## 15. Recommended frontend structure

Use this once the frontend grows:

```txt
apps/web/src/
├─ app/
│  └─ App.tsx
├─ components/
├─ features/
├─ lib/
│  └─ api.ts
├─ pages/
├─ routes/
├─ styles/
└─ main.tsx
```

Example `apps/web/src/lib/api.ts`:

```ts
const API_URL = import.meta.env.VITE_API_URL ?? "http://localhost:8000";

export async function apiGet<T>(path: string): Promise<T> {
  const res = await fetch(`${API_URL}${path}`);

  if (!res.ok) {
    throw new Error(`API error: ${res.status}`);
  }

  return res.json() as Promise<T>;
}
```

---

## 16. Optional: database dependencies

For PostgreSQL:

```bash
cd apps/api
uv add sqlalchemy alembic psycopg[binary] pydantic-settings
```

For MySQL/MariaDB:

```bash
cd apps/api
uv add sqlalchemy alembic pymysql pydantic-settings
```

For environment config:

```bash
cd apps/api
uv add pydantic-settings
```

Create `apps/api/.env.example`:

```env
DATABASE_URL=postgresql+psycopg://user:password@localhost:5432/siglab
```

Do not commit real `.env` files.

---

## 17. Optional: use a root uv workspace later

Do not start with a root uv workspace unless you have multiple Python packages.

Start simple:

```txt
apps/api/pyproject.toml
apps/api/uv.lock
```

Only introduce a root `pyproject.toml` with `[tool.uv.workspace]` if you later add more Python packages, for example:

```txt
apps/api/
packages/python-shared/
```

Then you can use a shared uv workspace lockfile. Until then, keeping uv isolated inside `apps/api` is cleaner.

---

## 18. Common issues and fixes

### `ERR_PNPM_ADDING_TO_ROOT`

Use `-w` when installing root dev dependencies:

```bash
pnpm add -D turbo -w
```

### `turbo: command not found`

Run through PNPM:

```bash
pnpm turbo dev
```

Or install dependencies:

```bash
pnpm install
```

### `--workspace-root may only be used inside a workspace`

Create `pnpm-workspace.yaml` before installing Turbo with `-w`.

### Turbo does not run the API

Check that `apps/api/package.json` exists and has:

```json
{
  "name": "@siglab/api",
  "private": true,
  "scripts": {
    "dev": "uv run fastapi dev app/main.py --host 0.0.0.0 --port 8000"
  }
}
```

Also check that `pnpm-workspace.yaml` includes:

```yaml
packages:
  - "apps/*"
```

### FastAPI command not found

From `apps/api`, run:

```bash
uv add fastapi --extra standard
uv run fastapi dev app/main.py
```

### `ModuleNotFoundError: app`

Make sure you run from `apps/api`, or through Turbo package scripts.

Correct:

```bash
cd apps/api
uv run fastapi dev app/main.py
```

Also correct from repo root:

```bash
pnpm turbo dev --filter=@siglab/api
```

### Frontend cannot reach API

Check:

```bash
curl http://localhost:8000/health
```

Check `apps/web/.env`:

```env
VITE_API_URL=http://localhost:8000
```

Restart Vite after changing `.env`.

### CORS error in browser

Add CORS middleware in FastAPI with the frontend origin:

```python
allow_origins=["http://localhost:5173"]
```

### `uv.lock` location confusion

If `uv init` was run inside `apps/api`, the lockfile belongs here:

```txt
apps/api/uv.lock
```

That is correct.

Do not move it to the repo root unless you intentionally create a uv workspace.

---

## 19. Final expected tree

```txt
siglab/
├─ apps/
│  ├─ api/
│  │  ├─ app/
│  │  │  ├─ __init__.py
│  │  │  └─ main.py
│  │  ├─ .python-version
│  │  ├─ package.json
│  │  ├─ pyproject.toml
│  │  └─ uv.lock
│  └─ web/
│     ├─ src/
│     ├─ index.html
│     ├─ package.json
│     ├─ tsconfig.json
│     └─ vite.config.ts
├─ packages/
├─ .gitignore
├─ package.json
├─ pnpm-lock.yaml
├─ pnpm-workspace.yaml
├─ turbo.json
└─ README.md
```

---

## 20. First commit

```bash
git add .
git commit -m "chore: initialize React and FastAPI monorepo"
```

---

## 21. Daily workflow

Start all apps:

```bash
pnpm dev
```

Run only frontend:

```bash
pnpm turbo dev --filter=@siglab/web
```

Run only API:

```bash
pnpm turbo dev --filter=@siglab/api
```

Before committing:

```bash
pnpm lint
pnpm check-types
pnpm test
pnpm build
```

---

## 22. Recommended stack decision

Use this stack:

```txt
React + Vite + TypeScript
FastAPI
uv
pnpm
Turborepo
SQLAlchemy + Alembic
PostgreSQL or MariaDB/MySQL
```

Avoid adding more monorepo tooling until the project needs it. Turborepo is enough for task orchestration; uv is enough for Python dependency management.
