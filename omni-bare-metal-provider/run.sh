#!/usr/bin/with-contenv bashio
set -euo pipefail

OMNI_KEY="$(bashio::config 'omni_service_account_key')"
if [ -z "${OMNI_KEY}" ]; then
  bashio::log.fatal "omni_service_account_key is required."
  exit 1
fi
export OMNI_SERVICE_ACCOUNT_KEY="${OMNI_KEY}"

OMNI_ENDPOINT="$(bashio::config 'omni_endpoint')"
if [ -z "${OMNI_ENDPOINT}" ]; then
  bashio::log.fatal "omni_endpoint is required."
  exit 1
fi

API_ADV="$(bashio::config 'api_advertise_address')"
if [ -z "${API_ADV}" ]; then
  bashio::log.fatal "api_advertise_address is required for agents to reach this provider."
  exit 1
fi

ARGS=(
  --id="$(bashio::config 'provider_id')"
  --provider-name="$(bashio::config 'provider_name')"
  --omni-api-endpoint="${OMNI_ENDPOINT}"
  --api-advertise-address="${API_ADV}"
  --dhcp-proxy-port="$(bashio::config 'dhcp_proxy_port')"
)

if bashio::config.true 'insecure_skip_tls_verify'; then
  ARGS+=(--insecure-skip-tls-verify)
fi

if bashio::config.true 'disable_dhcp_proxy'; then
  ARGS+=(--disable-dhcp-proxy)
fi

DHCP_IFACE="$(bashio::config 'dhcp_proxy_interface' || true)"
if [ -n "${DHCP_IFACE}" ]; then
  ARGS+=(--dhcp-proxy-iface-or-ip="${DHCP_IFACE}")
fi

if bashio::config.true 'debug'; then
  ARGS+=(--debug)
fi

bashio::log.info "Starting Omni bare metal infrastructure provider..."
exec /usr/local/bin/provider "${ARGS[@]}"
