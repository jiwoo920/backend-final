#!/bin/sh
set -e

if [ -n "$DATABASE_URL" ]; then
  db_uri="${DATABASE_URL#postgresql://}"
  db_auth="${db_uri%@*}"
  db_host_path="${db_uri#*@}"
  db_host_port="${db_host_path%%/*}"
  db_name="${db_host_path#*/}"

  export DB_USER="${db_auth%%:*}"
  export DB_PASSWORD="${db_auth#*:}"
  export DB_HOST="${db_host_port%%:*}"
  export DB_PORT="${db_host_port#*:}"
  export DB_NAME="$db_name"
fi

exec java -Dserver.port="${PORT:-8080}" -jar app.jar
