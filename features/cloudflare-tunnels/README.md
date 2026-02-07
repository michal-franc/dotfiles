# Cloudflare Tunnels

Two `cloudflared` tunnels expose local services via Cloudflare.

## Tunnels

| Tunnel | Hostname | Service | Systemd Unit |
|--------|----------|---------|--------------|
| toadie | `toadie.mfranc.com/viewer` | `http://localhost:5566` | `cloudflared.service` |
| toadie | `toadie.mfranc.com/ws` | `http://localhost:5567` | `cloudflared.service` |
| ssh-tunnel | `ssh.mfranc.com` | `ssh://localhost:22` | `cloudflared-ssh.service` |

Configs live in `~/.cloudflared/` (not in repo - contain credentials):
- `config.yml` - toadie tunnel
- `config-ssh.yml` - ssh tunnel

## Setup

```bash
cloudflared tunnel login
cloudflared tunnel create <name>
cloudflared tunnel route dns <name> <hostname>
```

### Config Templates

**Toadie** (`~/.cloudflared/config.yml`):
```yaml
tunnel: <TUNNEL_ID>
credentials-file: /home/mfranc/.cloudflared/<TUNNEL_ID>.json
ingress:
  - hostname: toadie.mfranc.com
    path: ^/viewer$
    service: http://localhost:5566
  - hostname: toadie.mfranc.com
    path: ^/ws$
    service: http://localhost:5567
  - service: http_status:403
```

**SSH** (`~/.cloudflared/config-ssh.yml`):
```yaml
tunnel: <TUNNEL_ID>
credentials-file: /home/mfranc/.cloudflared/<TUNNEL_ID>.json
ingress:
  - hostname: ssh.mfranc.com
    service: ssh://localhost:22
  - service: http_status:404
```

### Systemd

Toadie uses the default service installed via `cloudflared service install`.

SSH needs a custom unit - copy and modify:
```bash
sudo cp /etc/systemd/system/cloudflared.service /etc/systemd/system/cloudflared-ssh.service
# Change ExecStart to:
# ExecStart=/usr/bin/cloudflared tunnel --no-autoupdate --config /home/mfranc/.cloudflared/config-ssh.yml run ssh-tunnel
sudo systemctl daemon-reload
sudo systemctl enable --now cloudflared-ssh
```

## Browser SSH (Zero Trust)

In the [Zero Trust dashboard](https://one.dash.cloudflare.com): **Access > Applications > Add Self-hosted** with domain `ssh.mfranc.com`, add an access policy, then set **Browser rendering > SSH**.

For CLI access, add to client `~/.ssh/config`:
```
Host ssh.mfranc.com
  ProxyCommand cloudflared access ssh --hostname %h
```

## Management

```bash
systemctl status cloudflared cloudflared-ssh
journalctl -u cloudflared -u cloudflared-ssh -f
cloudflared tunnel list
```
