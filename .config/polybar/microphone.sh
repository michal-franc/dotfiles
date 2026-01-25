#!/bin/bash

# Show current active microphone source in polybar

default_source=$(pactl get-default-source 2>/dev/null)

if [[ -z "$default_source" ]]; then
    echo "%{T4}%{F#555}%{F-}%{T-}"
    exit 0
fi

if [[ "$default_source" == *"Yeti"* ]]; then
    echo "%{T4}%{F#00ff00}%{F-}%{T-} Yeti"
elif [[ "$default_source" == *"bluez"* ]]; then
    echo "%{T4}%{F#00bfff}%{F-}%{T-} XM4"
elif [[ "$default_source" == *"pci"* ]]; then
    echo "%{T4}%{F#ffb52a}%{F-}%{T-} Built-in"
else
    echo "%{T4}%{F#555}%{F-}%{T-}"
fi
