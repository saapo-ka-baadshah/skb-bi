# skb-bi
A BI tool with custom plugins and configurations for analytics usage.

## Getting Started

### Prerequisites
- Docker & Docker Compose

### Running Grafana
#### 0. Creating environment
Ensure that you run `scripts/00_create_env.sh` before you reference any of the services.
```shell
bash ./scripts/00_create_env.sh
```

#### 1. Run the docker assembly
```bash
docker compose up -d
```

Grafana will be available at `http://localhost:3000` (default login: `admin` / password: result of `cat .env | grep GRAFANA_SECURE_PASS`).

### Running Jupyter
#### 1. Jupyter Token
```shell
cat .env | grep JUPYTER_TOKEN
```

#### 2. Open [Jupyter Notebook](http://localhost:8888)
Use the token from step 1.

### Scripts
- `scripts/00_create_env.sh` — Helper script with functions to manage environment variables. Run `source scripts/00_create_env.sh` to load functions like `add_env_var` in your shell.

### Services
#### 1. Postgres
Host: `localhost`
Post: `5432`
Database: result of `cat .env | grep POSTGRES_DB`
User: result of `cat .env | grep POSTGRES_USER`
Password: result of `cat .env | grep POSTGRES_PASS`

#### 2. Neo4j
Host: `localhost`
Port: `7474`
Database: result of `cat .env | grep NEO4J_DB`
User: result of `cat .env | grep NEO4J_USER`
Password: result of `cat .env | grep NEO4J_PASS`

#### 3. Jupyter
Host: `localhost`
Port: `8888`
Token: result of `cat .env | grep JUPYTER_TOKEN`

### Examples:
#### 1. Loading credentials in the python environment
```python
import os

CREDENTIALS = {
    "POSTGRES_USER": os.environ.get("POSTGRES_USER"),
    "POSTGRES_PASS": os.environ.get("POSTGRES_PASS"),
    "POSTGRES_DB": os.environ.get("POSTGRES_DB"),
    "POSTGRES_HOST": os.environ.get("POSTGRES_HOST"),
    "NEO4J_USER": os.environ.get("NEO4J_USER"),
    "NEO4J_PASS": os.environ.get("NEO4J_PASS"),
    "NEO4J_DB": os.environ.get("NEO4J_DB"),
    "NEO4J_HOST": os.environ.get("NEO4J_HOST")
}
```
