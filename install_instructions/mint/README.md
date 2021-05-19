### Mint install process
Take the mint with xfce (not cinammon) image and install it just like usual.
Pick English US keyboard. Install third party software. Enable encryption - pick a passphrase.

### SETTINGS - TODO env variable passed by user or in config file:
- pick go version
- pick ripgrep version
  - https://github.com/BurntSushi/ripgrep/releases

### install_base.sh

Run install.sh. It does.
- upgrades the base kernel, distro
- installs xclip, git, zsh, vim, i3, termite, rofi, maim, zoom, chrome, slack, ohmyzsh and more

#### If running on VM - install Guest Additions
Before procedding install Guest Additions and make sure software rendering message is gone
Installing Guest Addtions is simple - just add image and in terminal on admin rights run the sh. Then restart.

### Run install_additions.sh

### Github SSH
Configure Github ssh key

```bash
ssh-keygen -t rsa -b 4096 -C "email"
cat ~/.ssh/id_rsa.pub | xclip -selection c
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

### JAVA
Use SDkman to manage java
https://sdkman.io/install

NVIDIA DRIVErs
sudo add-apt-repository ppa:graphics-drivers
sudo apt-get install nvidia-xxx

installing GPG key from 1pass or last pass to sign commits
copy paste key to /tmp
`gpg --import key` -> passphrase should be stored somewhere
git config --global commit.gpgsign true
git config --global user.signingkey <fingerprint>
git config --global user.name ""
git config --global user.email ""
git config --global core.editor vim

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
