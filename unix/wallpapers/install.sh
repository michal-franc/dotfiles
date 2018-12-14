#!/bin/bash
(crontab -l ; echo "*/10 * * * * DISPLAY=:0 feh --randomize --bg-scale ~/dotfiles/unix/wallpapers/*.jpg >> ~/cron.log")| crontab -
