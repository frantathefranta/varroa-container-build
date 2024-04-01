#!/usr/bin/env bash
# Replace env vars
[[ -n "${RED_API_KEY}" ]] && sed -i "s/{RED_API_KEY}/${RED_API_KEY}/g" /config/config.yaml
[[ -n "${RED_USER_NAME}" ]] && sed -i "s/{RED_USER_NAME}/${RED_USER_NAME}/g" /config/config.yaml
[[ -n "${RED_IRC_KEY}" ]] && sed -i "s/{RED_IRC_KEY}/${RED_IRC_KEY}/g" /config/config.yaml
[[ -n "${RED_NICKSERV_PASS}" ]] && sed -i "s/{RED_NICKSERV_PASS}/${RED_NICKSERV_PASS}/g" /config/config.yaml
[[ -n "${RED_BOT_NAME}" ]] && sed -i "s/{RED_BOT_NAME}/${RED_BOT_NAME}/g" /config/config.yaml
[[ -n "${PUSHOVER_USER}" ]] && sed -i "s/{PUSHOVER_USER}/${PUSHOVER_USER}/g" /config/config.yaml
[[ -n "${PUSHOVER_TOKEN}" ]] && sed -i "s/{PUSHOVER_TOKEN}/${PUSHOVER_TOKEN}/g" /config/config.yaml
[[ -n "${WEBSERVER_STATS_USER}" ]] && sed -i "s/{WEBSERVER_STATS_USER}/${WEBSERVER_STATS_USER}/g" /config/config.yaml
[[ -n "${WEBSERVER_STATS_PASSWORD}" ]] && sed -i "s/{WEBSERVER_STATS_PASSWORD}/${WEBSERVER_STATS_PASSWORD}/g" /config/config.yaml
[[ -n "${WEBSERVER_STATS_TOKEN}" ]] && sed -i "s/{WEBSERVER_STATS_TOKEN}/${WEBSERVER_STATS_TOKEN}/g" /config/config.yaml

# Start varroa
exec /usr/bin/varroa start --no-daemon
