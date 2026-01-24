# Dictation

Voice-to-text using Deepgram API with optional Claude integration.

## Components

| File | Description |
|------|-------------|
| `scripts/deepgram-dictation` | Main dictation script using Deepgram Nova-3 |
| `scripts/deepgram-dictation-toggle` | Toggle dictation on/off |
| `scripts/deepgram-dictation-claude-toggle` | Toggle dictation with Claude mode |
| `scripts/google-dictation` | Alternative using Google Speech API |
| `scripts/google-dictation-toggle` | Toggle Google dictation |

## Features

### Deepgram Dictation
- Real-time speech-to-text using Deepgram Nova-3 model
- Auto-types text into focused window using xdotool
- Auto-stops after 10 seconds of silence
- Claude mode: accumulates transcript and sends to Claude CLI on stop

### Two Modes
1. **Type mode** (default): Types directly into active window
2. **Claude mode** (`--claude`): Buffers transcript, opens Claude with text on stop

## Dependencies

- Python 3.x
- deepgram-sdk (`pip install deepgram-sdk`)
- pyaudio (`pip install pyaudio`)
- xdotool
- alacritty (for Claude mode terminal)

## Setup

1. Get Deepgram API key from https://console.deepgram.com/
2. Save key to `/tmp/deepgram_api_key`:
   ```bash
   echo "your-api-key-here" > /tmp/deepgram_api_key
   ```

## Keybindings (i3)

```
# Toggle dictation (type mode)
bindsym $mod+d exec --no-startup-id ~/scripts/deepgram-dictation-toggle

# Toggle dictation (Claude mode)
bindsym $mod+Shift+d exec --no-startup-id ~/scripts/deepgram-dictation-claude-toggle
```

## Usage

```bash
# Start dictation (types into focused window)
deepgram-dictation

# Start dictation (sends to Claude on stop)
deepgram-dictation --claude

# Toggle on/off
deepgram-dictation-toggle
deepgram-dictation-claude-toggle
```

## How It Works

1. Opens microphone stream
2. Sends audio chunks to Deepgram WebSocket
3. Receives transcribed text in real-time
4. Types text using xdotool (or buffers for Claude)
5. Auto-stops after silence timeout
