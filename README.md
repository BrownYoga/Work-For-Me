# Work For Me (WFM)

Initial scaffolding for the Work For Me platform using Go (REST), Angular with Tailwind, MongoDB, and an OpenTelemetry/Grafana observability stack.

## Structure
- `backend/` – Go service with clean architecture layout, REST worker onboarding endpoint, and BDD specs via Godog.
- `frontend/` – Angular 17 standalone app with Tailwind styling, Playwright e2e skeleton, and BDD feature file for UX flows.
- `observability/` – Alloy (OpenTelemetry Collector), Tempo, Prometheus, Loki, and Grafana configs.
- `docker-compose.yml` – Main compose file that includes the backend, frontend, and observability stacks.
- `docker-compose.backend.yml` – MongoDB and API services.
- `docker-compose.frontend.yml` – Angular frontend service.
- `docker-compose.observability.yml` – Alloy/OTel collector, Grafana, Prometheus, Tempo, and Loki.
- `setup.ps1` – Windows helper to verify local prerequisites.

## Quick start
1. Ensure Docker, Go 1.22+, Node 20+, and npm are installed.
2. `docker compose up --build` (Compose V2) to launch backend + frontend + observability via the included compose files.
3. Backend BDD tests: `(cd backend && go test ./features)` (requires Go modules).
4. Frontend e2e tests: `(cd frontend && npm install && npx playwright test)`.

## Next steps
- Wire MongoDB repositories and persistence models.
- Add auth (JWT now; SSO/Google later).
- Expand worker/client dashboards and payment integrations.
- Connect frontend HTTP client to backend endpoints and harden API contract.
