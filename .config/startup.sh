#!/bin/bash

xrandr --output DP-1 --primary --auto --brightness 1 --rotate normal 
xrandr --output DP-1-1 --auto --left-of DP-1 --brightness 1 --rotate left

#echo monitors set

# xset s off -dpms

bash $HOME/.config/keyboard.sh
#while inotifywait /tmp/keyboard.lock; do { bash $HOME/.config/keyboard.sh; }; done&

xinput --set-prop "Logitech Gaming Mouse G502" "Coordinate Transformation Matrix" 1.5 0 0 0 1.5 0 0 0 1

#xinput -set-button-map "ExpertBT5.0 Mouse" 1 1 1 4 5 6 7 3 9
#xinput --set-prop "ExpertBT5.0 Mouse" "Coordinate Transformation Matrix" 0.5 0 0 0 0.5 0 0 0 1

#touch $HOME/.dbus/Xdbus
#chmod 666 $HOME/.dbus/Xdbus
#env | grep DBUS_SESSION_BUS_ADDRESS > $HOME/.dbus/Xdbus
#echo 'export DBUS_SESSION_BUS_ADDRESS' >> $HOME/.dbus/Xdbus

exit 0
