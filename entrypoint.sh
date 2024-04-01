#!/usr/bin/env bash
# Replace env vars
[[ -z "${RED_API_KEY}" ]] && sed "s/{RED_API_KEY}/${RED_API_KEY}/g" /config/config.yaml
[[ -z "${RED_USER_NAME}" ]] && sed "s/{RED_USER_NAME}/${RED_USER_NAME}/g" /config/config.yaml
[[ -z "${RED_IRC_KEY}" ]] && sed "s/{RED_IRC_KEY}/${RED_IRC_KEY}/g" /config/config.yaml
[[ -z "${RED_NICKSERV_PASS}" ]] && sed "s/{RED_NICKSERV_PASS}/${RED_NICKSERV_PASS}/g" /config/config.yaml
[[ -z "${RED_BOT_NAME}" ]] && sed "s/{RED_BOT_NAME}/${RED_BOT_NAME}/g" /config/config.yaml
[[ -z "${PUSHOVER_USER}" ]] && sed "s/{PUSHOVER_USER}/${PUSHOVER_USER}/g" /config/config.yaml
[[ -z "${PUSHOVER_TOKEN}" ]] && sed "s/{PUSHOVER_TOKEN}/${PUSHOVER_TOKEN}/g" /config/config.yaml
[[ -z "${WEBSERVER_STATS_USER}" ]] && sed "s/{WEBSERVER_STATS_USER}/${WEBSERVER_STATS_USER}/g" /config/config.yaml
[[ -z "${WEBSERVER_STATS_PASSWORD}" ]] && sed "s/{WEBSERVER_STATS_PASSWORD}/${WEBSERVER_STATS_PASSWORD}/g" /config/config.yaml
[[ -z "${WEBSERVER_STATS_TOKEN}" ]] && sed "s/{WEBSERVER_STATS_TOKEN}/${WEBSERVER_STATS_TOKEN}/g" /config/config.yaml

# Start varroa
exec /usr/bin/varroa start --no-daemon
