#!/usr/bin/env bash
set -euo pipefail

mkdir -p "${GUACAMOLE_HOME}/extensions" "${GUACAMOLE_HOME}/lib"

: "${GUACD_HOSTNAME:?GUACD_HOSTNAME is required}"
: "${GUACD_PORT:=4822}"

: "${MYSQL_HOSTNAME:?MYSQL_HOSTNAME is required}"
: "${MYSQL_PORT:=3306}"
: "${MYSQL_DATABASE:?MYSQL_DATABASE is required}"
: "${MYSQL_USERNAME:?MYSQL_USERNAME is required}"
: "${MYSQL_PASSWORD:?MYSQL_PASSWORD is required}"

cat > "${GUACAMOLE_HOME}/guacamole.properties" <<EOF
guacd-hostname: ${GUACD_HOSTNAME}
guacd-port: ${GUACD_PORT}

mysql-hostname: ${MYSQL_HOSTNAME}
mysql-port: ${MYSQL_PORT}
mysql-database: ${MYSQL_DATABASE}
mysql-username: ${MYSQL_USERNAME}
mysql-password: ${MYSQL_PASSWORD}
EOF

exec "$@"

