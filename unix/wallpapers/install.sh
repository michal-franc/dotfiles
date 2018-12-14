#!/bin/bash
(crontab -l ; echo "5 * * * * feh --randomize --bg-scale ~/dotfiles/unix/wallpapers/*.jpg")| crontab -
