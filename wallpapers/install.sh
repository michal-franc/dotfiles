#!/bin/bash
(crontab -l ; echo "*/10 * * * * DISPLAY=:0 feh --randomize --bg-scale $HOME/dotfiles/unix/wallpapers/*.jpg >> $HOME/cron.log")| crontab -
