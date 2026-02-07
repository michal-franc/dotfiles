# Dictation Setup

## Deepgram

Deepgram is a cloud-based speech-to-text API that uses WebSocket streaming for real-time transcription. Audio is captured from the microphone, sent to Deepgram's servers, and transcripts are returned as you speak. The script types text directly into the focused window using xdotool. Configured for raw, low-latency streaming with the Nova-3 model — punctuation and smart formatting are disabled, interim results are enabled so words appear immediately as you speak.

### Dependencies

```bash
pip install deepgram-sdk pyaudio
```

### API Key Setup

1. Create a Deepgram account at https://deepgram.com
2. Generate an API key from the dashboard
3. Store the key in `/tmp/deepgram_api_key`:

```bash
echo "your-api-key-here" > /tmp/deepgram_api_key
```

### Scripts

- `~/scripts/deepgram-dictation` - Deepgram dictation script (reads key from `/tmp/deepgram_api_key`)
- `~/scripts/deepgram-dictation-toggle` - Toggle script for starting/stopping dictation

### Auto-Stop Feature

The script automatically stops after 10 seconds of silence. It works based on transcript timing:

1. Start speaking → transcripts come in → timer resets
2. Stop speaking → no new transcripts → 3 seconds pass → script exits

How it works:
- After you speak and get a transcript, `has_received_speech` becomes `True`
- `last_speech_time` updates with each transcript
- When no transcript for 10 seconds (`SILENCE_TIMEOUT`), it exits

To adjust the timeout, modify `SILENCE_TIMEOUT` in `~/scripts/deepgram-dictation`:

```python
SILENCE_TIMEOUT = 10.0  # seconds of silence before auto-stop
```

---

## i3 Keybindings

- `Ctrl+grave` - Enable dictation
- `Ctrl+'` - Enable command-based system

---

## Streaming Configuration

The script is tuned for low-latency raw streaming:

| Setting | Value | Effect |
|---------|-------|--------|
| `model` | `nova-3` | Latest model |
| `interim_results` | `true` | Words appear as you speak |
| `smart_format` | `false` | No auto-capitalization/number formatting |
| `punctuate` | `false` | No punctuation inserted |
| `endpointing` | `100ms` | Fast segment finalization |
| `CHUNK` | `2000` (125ms) | Audio sent frequently |

Interim results type partial text immediately, backspace it when a refined transcript arrives, and commit with a space when the segment is finalized.

## Model Configuration

The script uses `nova-3` by default. Change the `model` parameter in `~/scripts/deepgram-dictation`.

Available models: `nova-3`, `nova-2`, `nova`, `enhanced`, `base`
