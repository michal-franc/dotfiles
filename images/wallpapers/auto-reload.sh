#!/bin/bash
(crontab -l ; echo "*/10 * * * * DISPLAY=:0 feh --randomize --bg-fill $HOME/dotfiles/unix/wallpapers/* >> $HOME/cron.log")| crontab -
