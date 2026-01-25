# Microphone Toggle

Toggle between Sony WH-1000XM4 headset microphone and Blue Yeti USB microphone, with polybar status display.

## Components

| File | Description |
|------|-------------|
| `scripts/toggle-headphone-mic` | Toggle between A2DP (high quality) and HSP/HFP (mic enabled) |
| `.config/polybar/microphone.sh` | Polybar module showing active microphone |

## Features

- Toggle Sony WH-1000XM4 between audio profiles
- Automatic default source switching
- Desktop notifications on toggle
- Polybar indicator with click-to-toggle

## Bluetooth Profiles

| Profile | Audio Quality | Microphone |
|---------|---------------|------------|
| A2DP (LDAC) | High fidelity stereo | No |
| HSP/HFP (mSBC) | Telephony quality mono | Yes |

## Polybar Module

Shows current active microphone:
- **Yeti** (green) - Blue Yeti USB microphone
- **XM4** (blue) - Sony WH-1000XM4 headset mic
- **Built-in** (yellow) - Laptop internal mic

Click the module to toggle between modes.

## Dependencies

- PulseAudio/PipeWire with `pactl`
- libnotify (`notify-send`)

## Usage

```bash
# Toggle microphone mode
~/scripts/toggle-headphone-mic

# Or click the polybar microphone module
```

## Manual Commands

```bash
# Switch to headset mic (lower audio quality)
pactl set-card-profile bluez_card.AC_80_0A_5D_C1_97 headset-head-unit-msbc

# Switch to high quality audio (no mic, use Yeti)
pactl set-card-profile bluez_card.AC_80_0A_5D_C1_97 a2dp-sink

# Set default recording source
pactl set-default-source <source_name>

# List available sources
pactl list sources short
```
