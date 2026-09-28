#!/usr/bin/env bash
set -e

# Railway / PasarGuard network settings. Keep an explicitly configured UVICORN_PORT.
export UVICORN_HOST="${UVICORN_HOST:-0.0.0.0}"
export UVICORN_PORT="${UVICORN_PORT:-${PORT:-8000}}"

# Database / role defaults
export SQLALCHEMY_DATABASE_URL="${SQLALCHEMY_DATABASE_URL:-sqlite+aiosqlite:///db.sqlite3}"
export ROLE="${ROLE:-all-in-one}"

# PRIMEVPN browser subscription template
export CUSTOM_TEMPLATES_DIRECTORY="/code/primevpn-templates"
export SUBSCRIPTION_PAGE_TEMPLATE="subscription/index.html"

# Railway proxy headers
export UVICORN_PROXY_HEADERS="${UVICORN_PROXY_HEADERS:-true}"
export UVICORN_FORWARDED_ALLOW_IPS="${UVICORN_FORWARDED_ALLOW_IPS:-*}"

test -s /code/primevpn-templates/subscription/index.html
echo "Starting PasarGuard panel with PRIMEVPN subscription template on port ${UVICORN_PORT}..."
exec /code/start.sh
