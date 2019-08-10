#!/bin/bash

# https://unix.stackexchange.com/questions/111188/using-notify-send-with-cron
if [ -r "$HOME/.dbus/Xdbus" ]; then
  . "$HOME/.dbus/Xdbus"
fi

BATTINFO=`acpi -b`
if [[ `echo $BATTINFO | grep Discharging` && `echo $BATTINFO | cut -f 5 -d " "` < 00:15:00 ]] ; then
    DISPLAY=:0.0 /usr/bin/notify-send -u critical "low battery" "$BATTINFO"
fi
