#!/usr/bin/env bash
set -euo pipefail

if [[ "${1:-}" != "--foreground" ]]; then
    exec sudo supervisorctl restart visomaster
fi

export DISPLAY="${DISPLAY:-:20}"
export HOME="${HOME:-/home/user}"
export XDG_RUNTIME_DIR="${XDG_RUNTIME_DIR:-/run/user/1001}"
export DBUS_SESSION_BUS_ADDRESS="${DBUS_SESSION_BUS_ADDRESS:-unix:path=/run/user/1001/dbus/session_bus_socket}"
export QT_X11_NO_MITSHM=1

until [[ -S /tmp/.X11-unix/X20 ]]; do sleep 1; done
until wmctrl -m >/dev/null 2>&1; do sleep 1; done

cd /opt/visomaster
exec /opt/visomaster/.venv/bin/python main.py --gpu-id 0
