#!/bin/bash

xrandr --output HDMI-0 --auto
xrandr --output HDMI-0 --above eDP-1-1
xrandr --output DP-1-1 --auto
xrandr --output DP-1-1 --left-of HDMI-0
xrandr --output DP-1-1 --brightness 0.9
xrandr --output HDMI-0 --brightness 0.9
xrandr --output eDP-1-1 --brightness 0.9

echo monitors set

setxkbmap -option caps:backspace
setxkbmap -option shift:both_capslock

xmodmap -e "clear Lock"
# just in case caps lock on ctrl r
xmodmap -e "keycode 110 = Caps_Lock"

xmodmap -e "keycode 108 = space"
xmodmap -e "clear mod1"

xset r rate 200 70
xset s off -dpms

# lowering mouse acceleration
xinput --set-prop "Logitech Wireless Mouse" "Coordinate Transformation Matrix" 0.5 0 0 0 0.5 0 0 0 1

echo keyboard settings set

touch $HOME/.dbus/Xdbus
chmod 666 $HOME/.dbus/Xdbus
env | grep DBUS_SESSION_BUS_ADDRESS > $HOME/.dbus/Xdbus
echo 'export DBUS_SESSION_BUS_ADDRESS' >> $HOME/.dbus/Xdbus

exit 0
