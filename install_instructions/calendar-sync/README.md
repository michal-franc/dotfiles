# Calendar Sync (khal + vdirsyncer)

Terminal calendar with Google Calendar sync.

## Install

```bash
sudo apt install khal
pip install vdirsyncer
```

## Setup

1. Copy configs from `~/.config/khal/config` and `~/.config/vdirsyncer/config`
2. Create directories:
   ```bash
   mkdir -p ~/.local/share/khal/calendars/{private,work,concerts}
   mkdir -p ~/.local/share/vdirsyncer/status
   ```
3. Get Google Calendar secret iCal URL: Settings → Your calendar → "Secret address in iCal format"
4. Add URL to vdirsyncer config
5. Initial sync:
   ```bash
   vdirsyncer discover google_calendar
   vdirsyncer sync
   ```

## Auto-sync (every 30min)

Copy systemd files from `~/.config/systemd/user/vdirsyncer.*`

```bash
systemctl --user daemon-reload
systemctl --user enable --now vdirsyncer.timer
```

## Usage

```bash
ikhal                                    # interactive view
khal list DD/MM/YYYY DD/MM/YYYY          # list events
khal new -a private DD/MM/YYYY "Event"   # add event
vdirsyncer sync                          # manual sync
```
