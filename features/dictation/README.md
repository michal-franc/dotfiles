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

## Streaming Configuration

The script is tuned for low-latency, raw streaming:

| Setting | Value | Why |
|---------|-------|-----|
| `interim_results` | `true` | Words appear as you speak, not after a pause |
| `smart_format` | `false` | No auto-capitalization or number formatting |
| `punctuate` | `false` | No punctuation inserted |
| `endpointing` | `100ms` | Fast segment finalization |
| `CHUNK` | `2000` (125ms) | Audio sent frequently for low latency |

Interim results work by typing partial text immediately, then backspacing and replacing it when a more complete transcript arrives. Once a segment is finalized (`is_final=True`), the text is committed with a trailing space.

## How It Works

1. Opens microphone stream
2. Sends small audio chunks (125ms) to Deepgram WebSocket
3. Receives interim transcripts immediately as you speak
4. Types interim text, backspaces and replaces as transcript refines
5. Commits finalized text with a space
6. Auto-stops after silence timeout
