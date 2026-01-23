### TODO:
- todo.work is required as some scripts are attached to it



### Mint install process
Take the mint with xfce (not cinammon) image and install it just like usual.
Pick English US keyboard. Install third party software. Enable encryption - pick a passphrase.

### First Run after install if VBOX
- Enable 3d acceleration
- increase memory limits for graphic card
Add guest additions go to mounted drive folder `media/username/VBox*******`
```
sudo bash VBoxLinuxAdditions.run
reboot
```

## First step is to clone this repo

add new ssh key to github account

```
sudo apt-get upgrade
sudo apt-get install git
```
- git init in your home dir
- `git remote add origin git@github.com:michal-franc/dotfiles.git`
- `git fetch --all`
- `git checkout master --force`

### SETTINGS - TODO env variable passed by user or in config file:
- pick go version
- pick ripgrep version
  - https://github.com/BurntSushi/ripgrep/releases

### install_base.sh

Run install_base.sh. It does.
- upgrades the base kernel, distro
- installs xclip, git, zsh, vim, i3, termite, rofi, maim, zoom, chrome, slack, ohmyzsh and more

### Papirus Icon Theme
Install Papirus for rofi icons (used by task-menu scripts):
```bash
sudo apt install papirus-icon-theme
```

Paste the key from clipboard to github.

### Configure GIT

```bash
git config --global user.name "Michal Franc"
git config --global user.email "<email>"
```

# TODO race condition when to clone or not - there is no ohmyzsh installation that requires .zshrc
### Cloning doftiles
Clone dotfiles to main ~ by creatin empty repo and adding remote and feetching all :)

```bash
cd ~
git init
git remote add origin git@github.com:michal-franc/dotfiles.git
git fetch --all
git checkout master
```

### Bonus

clone todo and notes from private repos

For Chrome I usually install:
- 1password
- ublock origin
- lastpass
- vimium

Taskwarrior SH 
Install instructions
https://github.com/GothenburgBitFactory/taskwarrior/issues/2003
you will also need to install libreaddline7 deb - download it somewhere :)

### Installing VS code config
./.config/Code/install-vs-code-extensions.sh

### BlueTooth:
sudo bluetoothtc
scan on
pair <device>
connect <device>

### Troubleshooting

#### Down Below spam :)

### Node.js / fnm
Fast Node Manager - modern alternative to nvm
https://github.com/Schniz/fnm

```bash
curl -fsSL https://fnm.vercel.app/install | bash
# Add to your shell config (.zshrc):
# eval "$(fnm env --use-on-cd)"
source ~/.zshrc

fnm install --lts
fnm use lts-latest
```

### JAVA
Use SDkman to manage java
https://sdkman.io/install

IMPORTA NVIDIA GTX 670 -> nvidia-470
NVIDIA DRIVErs
sudo add-apt-repository ppa:graphics-drivers
sudo apt-get install nvidia-470

### GPG Key Setup for Commit Signing

1. **Export your GPG key from 1Password/LastPass** and save to `/tmp/gpg-key.asc`

2. **Import the key:**
   ```bash
   gpg --import /tmp/gpg-key.asc
   # Enter passphrase when prompted (stored in password manager)
   rm /tmp/gpg-key.asc  # Clean up
   ```

3. **Find your key ID:**
   ```bash
   gpg --list-secret-keys --keyid-format=long
   # Look for line like: sec   ed25519/E589B203D90A0978
   # The key ID is after the slash: E589B203D90A0978
   ```

4. **Configure Git to use GPG signing:**
   ```bash
   git config --global user.signingkey <KEY_ID>
   git config --global commit.gpgsign true
   git config --global user.name "Michal Franc"
   git config --global user.email "lam.michal.franc@gmail.com"
   git config --global core.editor vim
   ```

5. **Add public key to GitHub:**
   ```bash
   gpg --armor --export <KEY_ID> | xclip -selection clipboard
   ```
   Then paste in GitHub → Settings → SSH and GPG keys → New GPG key

6. **Test signing works:**
   ```bash
   echo "test" | gpg --clearsign
   # Should prompt for passphrase and output signed message
   ```

**Troubleshooting:**
- If GPG hangs, you may need: `export GPG_TTY=$(tty)`
- Add to `.zshrc` if needed permanently

#instlaling iptables
sudo apt-get install iptables-persistent
Yes, Yes

#git secrets
- git clone git@github.com:awslabs/git-secrets.git

# HACK font new one
https://github.com/source-foundry/Hack

### CRONTAB
~/scripts/cron should be in crontab running
add automated installation

### GVM
https://github.com/moovweb/gvm

### scrot  - required by lock functionality
sudo apt-get install scrot

### taskw_gcal_sync
https://github.com/bergercookie/taskw_gcal_sync
Create calendar go to settings get calendar id
Set cronjob to sync calendar or to remind about sync
use your own user to do that as root doesnt have this script installed
*/1 * * * * tw_gcal_sync -c <calendar> -t remind > ~/tw_remind_latest.log 2>&1
or
*/1 * * * * ~/.local/bin/tw_gcal_sync -c <calenda> -t remind > ~/tw_remind_latest.log2>&1

### tfenv
https://github.com/tfutils/tfenv

### fix problems with bluetooth connection 
https://askubuntu.com/questions/1086658/no-sound-audio-in-chrome-ubuntu-18-04lts

### anki droid
this doesnt work properly now on linux virtual box based machines
https://apps.ankiweb.net/

### xmind
xmind - https://www.xmind.net/download/
how to install rpm file - it takes some time to finish this
https://askubuntu.com/questions/30770/how-to-get-rpm-install-in-my-ubuntu-linux-system
then use `XMind`

### multi ssh key support
script description how to configure

add this to .ssh/config

```
Host github.com
	HostName github.com
	User git
	IdentityFile ~/.ssh/id_rsa

Host github.com-personal
	HostName github.com-michal-franc
	User git
	IdentityFile ~/.ssh/id_rsa_michal_franc
```
generate new key with id_rsa_michal_franc and add it in to github 

everytime you clone repo run `personal_git` command to configure local repo value correctly


### run keyboard  config script  on keyboard plugin 
sudo apt-get install inotify-tools
lsusb - find yourkeyboard and two ids

then create file 80-local.rules in rules.d
```
SUBSYSTEM=="usb", ATTRS{idVendor}=="045e", ATTRS{idProduct}=="00db", RUN+="/usr/local/bin/keyboard-udev"
```

then copy keyboard-udev

```
#!/bin/bash
# will wrtite to keyboard.lock on each keyboard plugin - executed by udev

echo '' > /tmp/keyboard.lock &
```
then configure inotify-tools and inotifywait to run .config/keyboard.sh everytime /tmp/keyboard.lock changes

# this should be added to xinitrc
while inotifywait -r /tmp/keyboard.lock; do { bash $HOME/.config/keyboard.sh; }; done

# zoxide
you need to install zoxide as this is what zsh expects

# taskwarrior-tui
https://github.com/kdheepak/taskwarrior-tui/

#pgrep
pip install pgrep

# Problem with left / right monitor orientation on vbox guest machine
- change in vbox - video input screent - 1 to host 2monitor, 2 monitor to host1 monitor - I HAVE NO IDEA WHY THIS WORKS

### Nerd Dictation (Voice to Text)
Offline voice-to-text using Vosk speech recognition.

1. **Install dependencies:**
   ```bash
   sudo apt-get install python3-pip portaudio19-dev python3-pyaudio xdotool
   ```

2. **Clone and install nerd-dictation:**
   ```bash
   git clone https://github.com/ideasman42/nerd-dictation.git ~/tools/nerd-dictation
   pip3 install vosk
   ```

3. **Download Vosk model:**
   ```bash
   mkdir -p ~/.config/nerd-dictation
   cd ~/.config/nerd-dictation
   # Small English model (~50MB) - faster, less accurate
   wget https://alphacephei.com/vosk/models/vosk-model-small-en-us-0.15.zip
   unzip vosk-model-small-en-us-0.15.zip
   mv vosk-model-small-en-us-0.15 model

   # OR Large English model (~1.8GB) - slower, more accurate
   # wget https://alphacephei.com/vosk/models/vosk-model-en-us-0.22.zip
   # unzip vosk-model-en-us-0.22.zip
   # mv vosk-model-en-us-0.22 model
   ```

4. **Usage:**
   ```bash
   # Start dictation
   ~/tools/nerd-dictation/nerd-dictation begin --vosk-model-dir ~/.config/nerd-dictation/model

   # Stop dictation
   ~/tools/nerd-dictation/nerd-dictation end
   ```

5. **Optional - add aliases to .zshrc:**
   ```bash
   alias dictate='~/tools/nerd-dictation/nerd-dictation begin --vosk-model-dir ~/.config/nerd-dictation/model'
   alias dictate-stop='~/tools/nerd-dictation/nerd-dictation end'
   ```

6. **Optional - bind to i3 keybindings in ~/.config/i3/config:**
   ```
   bindsym $mod+d exec ~/tools/nerd-dictation/nerd-dictation begin --vosk-model-dir ~/.config/nerd-dictation/model
   bindsym $mod+Shift+d exec ~/tools/nerd-dictation/nerd-dictation end
   ```
