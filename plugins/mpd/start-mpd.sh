#!/bin/bash

# Run in the background
/usr/src/mount-cifs.sh &

mpd --no-daemon --stderr /etc/mpd.conf
