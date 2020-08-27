GRAFANA_SERVER_HTTP_PORT="${grafana_port}"
GRAFANA_SERVER_ROOT_URL="https://${grafana_dns_name}"

GRAFANA_SECURITY_ADMIN_USER="${grafana_admin_user}"
GRAFANA_SECURITY_ADMIN_PASSWORD="${grafana_admin_password}"

GRAFANA_DATABASE_TYPE="postgres"
GRAFANA_DATABASE_URL="${database_url}"
GRAFANA_DATABASE_HOST="${database_host}"
GRAFANA_DATABASE_NAME="${database_name}"
GRAFANA_DATABASE_USER="${database_user}"
GRAFANA_DATABASE_PASSWORD="${database_password}"

GRAFANA_SESSION_PROVIDER="postgres"
GRAFANA_SESSION_PROVIDER_CONFIG="user=${database_user} password=${database_password} host=${database_host} dbname=${database_name} sslmode=require"
GRAFANA_SESSION_COOKIE_SECURE="true"
GRAFANA_SESSION_COOKIE_NAME="grafana_session"

GRAFANA_LOG_LEVEL="info"