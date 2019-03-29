#!/bin/bash

xrandr --output DP-1-1 --right-of eDP-1-1
xrandr --output DP-1-1 --brightness 0.7

echo monitors set

setxkbmap -option caps:backspace
setxkbmap -option shift:both_capslock

xmodmap -e "clear Lock"
# just in case caps lock on ctrl r
xmodmap -e "keycode 78 = Caps_Lock"

xmodmap -e "keycode 108 = space"
xmodmap -e "clear mod1"

xset r rate 200 70

echo keyboard settings set
