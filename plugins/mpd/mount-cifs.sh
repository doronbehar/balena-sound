#!/bin/bash

mkdir -p /mnt/ZENIX_MUSIC
while ((1)); do
	found_files="$(ls /mnt/ZENIX_MUSIC | wc -l)"
	if [[ $found_files > 1 ]]; then
		echo There are $found_files files/folders in /mnt/ZENIX_MUSIC
		# Wait 5 minutes before the next check
		sleep 300
	else
		echo $found_files files were found in /mnt/ZENIX_MUSIC, trying to mount
		## MOUNT COMMAND
		mount.cifs -o ro,guest,noperm //192.168.14.90/Music /mnt/ZENIX_MUSIC
		##
		mount_success=$?
		if [[ $mount_success == 0 ]]; then
			found_files="$(ls /mnt/ZENIX_MUSIC | wc -l)"
		else
			echo failed to mount.cifs //192.168.14.90/Music /mnt/ZENIX_MUSIC >&2
			echo trying againg in 1 second >&2
			sleep 1
		fi
	fi
done

