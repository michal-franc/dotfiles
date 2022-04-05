#!/bin/bash
# if ad2p sink unavailabe - sudo /etc/init.d/bluetooth restart
bluetoothctl disconnect 04:5D:4B:DD:9F:48
bluetoothctl connect 04:5D:4B:DD:9F:48
