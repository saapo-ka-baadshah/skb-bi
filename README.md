# skb-bi
A BI tool with custom plugins and configurations for analytics usage.

## Getting Started

### Prerequisites
- Docker & Docker Compose

### Running Grafana
```bash
docker compose up -d
```

Grafana will be available at `http://localhost:3000` (default login: `admin` / `admin`).

### Scripts
- `scripts/00_create_env.sh` — Helper script with functions to manage environment variables. Run `source scripts/00_create_env.sh` to load functions like `add_env_var` in your shell.
