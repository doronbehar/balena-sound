#!/bin/bash

while ((1)); do
	# 2nd level verbosity is used so we'll know it's doing something
	mpdscribble --no-daemon --log=- --verbose=3
	echo mpdscribble stopped monitoring mpd, probably due to mpd restarted or failing >&2
	echo Trying again in 2 seconds >&2
	sleep 2
done
