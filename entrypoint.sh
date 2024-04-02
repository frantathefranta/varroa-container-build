#!/usr/bin/env bash
# Replace env vars (has to be done in a way that k8s won't freak out)
cp /config/config.template.yaml /config/config.yaml
[[ -n "${RED_API_KEY}" ]] && echo "$(sed "s/{RED_API_KEY}/${RED_API_KEY}/g" /config/config.yaml)" > /config/config.yaml
[[ -n "${RED_USER_NAME}" ]] && echo "$(sed "s/{RED_USER_NAME}/${RED_USER_NAME}/g" /config/config.yaml)" > /config/config.yaml
[[ -n "${RED_IRC_KEY}" ]] && echo "$(sed "s/{RED_IRC_KEY}/${RED_IRC_KEY}/g" /config/config.yaml)" > /config/config.yaml
[[ -n "${RED_NICKSERV_PASS}" ]] && echo "$(sed "s/{RED_NICKSERV_PASS}/${RED_NICKSERV_PASS}/g" /config/config.yaml)" > /config/config.yaml
[[ -n "${RED_BOT_NAME}" ]] && echo "$(sed "s/{RED_BOT_NAME}/${RED_BOT_NAME}/g" /config/config.yaml)" > /config/config.yaml
[[ -n "${PUSHOVER_USER}" ]] && echo "$(sed "s/{PUSHOVER_USER}/${PUSHOVER_USER}/g" /config/config.yaml)" > /config/config.yaml
[[ -n "${PUSHOVER_TOKEN}" ]] && echo "$(sed "s/{PUSHOVER_TOKEN}/${PUSHOVER_TOKEN}/g" /config/config.yaml)" > /config/config.yaml
[[ -n "${WEBSERVER_STATS_USER}" ]] && echo "$(sed "s/{WEBSERVER_STATS_USER}/${WEBSERVER_STATS_USER}/g" /config/config.yaml)" > /config/config.yaml
[[ -n "${WEBSERVER_STATS_PASSWORD}" ]] && echo "$(sed "s/{WEBSERVER_STATS_PASSWORD}/${WEBSERVER_STATS_PASSWORD}/g" /config/config.yaml)" > /config/config.yaml
[[ -n "${WEBSERVER_STATS_TOKEN}" ]] && echo "$(sed "s/{WEBSERVER_STATS_TOKEN}/${WEBSERVER_STATS_TOKEN}/g" /config/config.yaml)" > /config/config.yaml

# Start varroa
exec /usr/bin/varroa start --no-daemon
