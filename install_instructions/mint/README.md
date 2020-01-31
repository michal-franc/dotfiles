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
Termite - https://askubuntu.com/questions/739163/how-to-install-termite

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

#install antivirus
https://www.sophos.com/en-us/products/free-tools/sophos-antivirus-for-linux.aspx

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
