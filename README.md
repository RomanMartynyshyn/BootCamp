# Docker — `docker` branch

This branch contains the **Dockerfile** configurations for containerising the
backend and frontend components of the BootCamp project.

---

## Architecture Overview

```
docker/
│
├── backend/
│   └── dockerfile        — Multi-stage Python 3.11 image (FastAPI / any Python app)
│
└── frontend/
    ├── dockerfile        — nginx:stable-alpine image
    ├── nginx.conf        — Custom Nginx server configuration
    └── public/           — Static build output served by Nginx
```

The backend uses a **multi-stage build** to keep the final image small and
production-ready. The frontend is served by **Nginx** configured for
Single Page Applications (SPA) with static asset caching.

---

## File Structure

| File | Purpose |
|------|---------|
| `backend/dockerfile` | Multi-stage Dockerfile: builder stage (gcc, pip) + slim runtime |
| `frontend/dockerfile` | Nginx Alpine image that serves static files from `public/` |
| `frontend/nginx.conf` | Nginx config with SPA fallback and 30-day static asset cache |
| `frontend/public/` | Directory for the compiled frontend build artifacts |

---

## Related Branches

| Branch | Contents |
|--------|---------|
| [`docker`](../../tree/docker) | ← **you are here** — Dockerfiles for backend and frontend |
| [`pipeline`](../../tree/pipeline) | GitHub Actions CI configuration |
| [`infra`](../../tree/infra) | Terraform AWS infrastructure |
| [`free`](../../tree/free) | Another technology stack for infrastructure deployment  |