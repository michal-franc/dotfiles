#!/bin/bash

xrandr --output Virtual1 --primary --auto --brightness 1 --rotate normal
xrandr --output Virtual2 --auto --left-of Virtual1 --brightness 1 --rotate normal 

echo monitors set

# xset s off -dpms

#bash $HOME/.config/keyboard.sh
#while inotifywait /tmp/keyboard.lock; do { bash $HOME/.config/keyboard.sh; }; done&

# lowering mouse acceleration
#xinput --set-prop "Logitech Wireless Mouse" "Coordinate Transformation Matrix" 0.5 0 0 0 0.5 0 0 0 1
#xinput --set-prop "Logitech M215" "Coordinate Transformation Matrix" 0.5 0 0 0 0.5 0 0 0 1

#xinput -set-button-map "ExpertBT5.0 Mouse" 1 1 1 4 5 6 7 3 9
#xinput --set-prop "ExpertBT5.0 Mouse" "Coordinate Transformation Matrix" 0.5 0 0 0 0.5 0 0 0 1

#touch $HOME/.dbus/Xdbus
#chmod 666 $HOME/.dbus/Xdbus
#env | grep DBUS_SESSION_BUS_ADDRESS > $HOME/.dbus/Xdbus
#echo 'export DBUS_SESSION_BUS_ADDRESS' >> $HOME/.dbus/Xdbus

exit 0
