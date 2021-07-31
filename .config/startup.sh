#!/bin/bash

xrandr --output DP-1 --primary --auto --brightness 1 --rotate normal
xrandr --output eDP-1 --auto --below DP-1 --rotate normal --brightness 1
xrandr --output DP-2 --auto --left-of DP-1 --brightness 1 --rotate normal 

echo monitors set

xset s off -dpms

bash $HOME/.config/keyboard.sh
while inotifywait /tmp/keyboard.lock; do { bash $HOME/.config/keyboard.sh; }; done&

# lowering mouse acceleration
xinput --set-prop "Logitech Wireless Mouse" "Coordinate Transformation Matrix" 0.5 0 0 0 0.5 0 0 0 1
xinput --set-prop "Logitech M215" "Coordinate Transformation Matrix" 0.5 0 0 0 0.5 0 0 0 1


touch $HOME/.dbus/Xdbus
chmod 666 $HOME/.dbus/Xdbus
env | grep DBUS_SESSION_BUS_ADDRESS > $HOME/.dbus/Xdbus
echo 'export DBUS_SESSION_BUS_ADDRESS' >> $HOME/.dbus/Xdbus

exit 0
