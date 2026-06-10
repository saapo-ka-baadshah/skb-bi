#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

find_repo_root() {
    git -C "$SCRIPT_DIR" rev-parse --show-toplevel 2>/dev/null
}

REPO_ROOT="$(find_repo_root)"
ENV_FILE="$REPO_ROOT/.env"

add_env_var() {
    local var_name="$1"
    local var_value
    var_value="$(openssl rand -base64 32 | tr -dc 'a-zA-Z0-9' | head -c 32)"

    if grep -q "^${var_name}=" "$ENV_FILE" 2>/dev/null; then
        sed -i '' "s|^${var_name}=.*|${var_name}=${var_value}|" "$ENV_FILE"
    else
        echo "${var_name}=${var_value}" >> "$ENV_FILE"
    fi
}

# GRAFANA credentials
add_env_var GRAFANA_SECURE_PASS
