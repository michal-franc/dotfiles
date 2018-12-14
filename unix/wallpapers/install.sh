#!/bin/bash
(crontab -l ; echo "*/1 * * * * DISPLAY=:0 feh --randomize --bg-scale ~/dotfiles/unix/wallpapers/*.jpg >> ~/cron.log")| crontab -
