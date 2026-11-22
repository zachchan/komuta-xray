#!/bin/sh
set -e
PORT="${PORT:-8080}"
sed "s/\${PORT}/$PORT/" /etc/xray/config.template.json > /etc/xray/config.json
exec /usr/local/bin/xray -config /etc/xray/config.json
