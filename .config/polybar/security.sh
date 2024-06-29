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
check_service ufw Firewall
#check_service unattended-upgrades "Automatic Updates"

# Check for disk encryption
#if [[ "$(cat /etc/crypttab)" == "" ]]; then
#    echo "%{F#f00} Disk Encryption%{F-}"
#    exit -1
#fi

# Check if uptime less than 2 weeks
if uptime -p | grep -P '[2-9][0-9]?\sweek[s]?'; then 
    echo "%{F#f00} UPTIME%{F-}"
    exit -1
fi

echo "%{F#0f0}%{U#0f0}  Protected%{U-}%{F-}"
