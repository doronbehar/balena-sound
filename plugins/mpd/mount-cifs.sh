#!/bin/bash

mkdir -p /mnt/ZENIX_MUSIC
while ((1)); do
	mount.cifs -o ro,guest,noperm //192.168.14.90/Music /mnt/ZENIX_MUSIC
	mount_success=$?
	if [[ $mount_success == 0 ]]; then
		break
	else
		echo failed to mount.cifs //192.168.14.90/Music /mnt/ZENIX_MUSIC >&2
		echo trying againg in 1 second >&2
		sleep 1
	fi
done

FOUND_FILES="$(ls /mnt/ZENIX_MUSIC | wc -l)"
echo There are $FOUND_FILES files/folders in /mnt/ZENIX_MUSIC
