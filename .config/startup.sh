#!/bin/bash

xrandr --output DP-1-1 --right-of eDP-1-1
xrandr --output DP-1-1 --brightness 0.7

setxkbmap -option caps:backspace
setxkbmap -option shift:both_capslock

xmodmap -e "clear Lock"

xmodmap -e "keycode 108 = space"
xmodmap -e "clear mod1"
