#!/bin/bash

setxkbmap -option caps:backspace
setxkbmap -option shift:both_capslock
setxkbmap -layout us

xmodmap -e "clear Lock"
# just in case caps lock on ctrl r
xmodmap -e "keycode 110 = Caps_Lock"

# xmodmap -e "keycode 108 = space"
# xmodmap -e "clear mod1"

xset r rate 200 70
notify-send -t 1000 "keyboard settings set"
