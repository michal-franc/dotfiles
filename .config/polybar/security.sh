#!/bin/bash

# Function to check the status of a systemd unit.
# Usage: check_service <unit-name> <friendly-name>
function check_service() {
    unit=$1
    name=$2
    if [[ "$(service $unit status | grep active)" == "" ]]; then
        echo " $name"
        exit -1
    fi
}

# Check systemd units
check_service osqueryd Alienvault
check_service ufw Firewall
check_service qualys-cloud-agent Qualys
check_service unattended-upgrades "Automatic Updates"

# Check for disk encryption
if [[ "$(cat /etc/crypttab)" == "" ]]; then
    echo "%{F#f00} Disk Encryption%{F-}"
    exit -1
fi

# Check for Global Protect
if [[ "$(curl https://hotmail.com?test_request_for_local_security_scan=true -v -w "STATUS:%{http_code}\n" 2> /dev/null | grep 503 | sed 's/.*STATUS://g')" != "503" ]]; then 
    echo "%{F#f00} Global Protect%{F-}"
    exit -1
fi

# Check if Gnome used - we can't use XFCE or KDE
if [[ ! -f "/usr/bin/gnome-session" ]]; then 
    echo "%{F#f00} Gnome%{F-}"
    exit -1
fi

# Check if DGM is use used - we can't disable GDM
if [[ "$(/usr/bin/cat /etc/X11/default-display-manager)" != "/usr/sbin/gdm3" ]]; then 
    echo "%{F#f00} GDM%{F-}"
    exit -1
fi

# Check if uptime less than 2 weeks
if uptime -p | grep -P '[2-9][0-9]?\sweek[s]?'; then 
    echo "%{F#f00} UPTIME%{F-}"
    exit -1
fi

echo "%{F#0f0}%{U#0f0}  Protected%{U-}%{F-}"
