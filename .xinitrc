exec /usr/bin/i3

while inotifywait /tmp/keyboard.lock; do { bash $HOME/.config/keyboard.sh; }; done&

xset r rate 150 40
