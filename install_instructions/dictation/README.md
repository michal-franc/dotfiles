# Dictation Setup

## Deepgram

Deepgram is a cloud-based speech-to-text API that uses WebSocket streaming for real-time transcription. Audio is captured from the microphone, sent to Deepgram's servers, and transcripts are returned as you speak. The script outputs text directly to stdout, which can be piped to other tools or captured. Features include automatic punctuation, smart formatting, and low-latency streaming with the Nova-2 model.

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

The script automatically stops after 3 seconds of silence. It works based on transcript timing:

1. Start speaking → transcripts come in → timer resets
2. Stop speaking → no new transcripts → 3 seconds pass → script exits

How it works:
- After you speak and get a transcript, `has_received_speech` becomes `True`
- `last_speech_time` updates with each transcript
- When no transcript for 3 seconds (`SILENCE_TIMEOUT`), it exits

To adjust the timeout, modify `SILENCE_TIMEOUT` in `~/scripts/deepgram-dictation`:

```python
SILENCE_TIMEOUT = 3.0  # seconds of silence before auto-stop
```

---

## i3 Keybindings

- `Ctrl+grave` - Enable dictation
- `Ctrl+'` - Enable command-based system

---

## Model Configuration

The Deepgram script uses `nova-2` model by default. You can change the model in the script by modifying the `LiveOptions`:

```python
options = LiveOptions(
    model="nova-2",  # Change to other models: nova, enhanced, base
    ...
)
```

Available models: `nova-2`, `nova`, `enhanced`, `base`
