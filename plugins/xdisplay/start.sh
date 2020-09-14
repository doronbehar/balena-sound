#!/usr/bin/bash

export DBUS_SYSTEM_BUS_ADDRESS=unix:path=/host/run/dbus/system_bus_socket

# sed -i -e 's/console/anybody/g' /etc/X11/Xwrapper.config
# echo "needs_root_rights=yes" >> /etc/X11/Xwrapper.config

pkill xinit

sleep 3

env DISPLAY=:0 startx
