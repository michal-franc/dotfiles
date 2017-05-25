### Arch Anywhere as a base
During installation select
zsh, i3

pacman -Syyu // updating pacman database

pacman -S ripgrep git vim chromium curl httpie
pacman -S google-chrome visual-studio-code
pacman -S rofi // nice soft to start applications quickly
pacman -S termite // terminal emulator

pacman -S artwiz-fonts // fonts

alias google-chrome-stable -> chrome

pacman -S tig // great awewsom git
pacman -S base-devel // 5 - fakeroot is needed , 19 - patch is neede 

sudo pacman -Sy yaourt

### More things to Install
- node

- nvm installation
https://github.com/creationix/nvm#installation
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.2/install.sh | bash

nvm install 7.10.0

- dotnet

yaourt dotnet
yaourt dotnet-cli
yaourt dotnet-sdk

VirtualBox installation
------------------------
pacman -S virtualbox-guest-utils
pacman -S virtualbox-guest-modules-arch

VBoxClient-all // right now i have to run it manually

# modprobe -a vboxguest vboxsf vboxvideo


.i3config
----------------------------
bindsym $mod+Return exec termite
bindsym $mod+f exec "rofi -show run"

.zshrc
----------------------------
unsetopt correct_all

pacman.conf
----------------------------
SigLevel = None

[aur-archlinux]
SigLevel = Optional TrustAll
Server = https://repo.itmettke.de/aur/$repo/$arch

[aurpackages]
SigLevel = Optional TrustAll
Server = https://r.mikroskeem.eu

[aur-archlinux]
SigLevel = Optional TrustAll
Server = https://repo.itmettke.de/aur/$repo/$arch

~/.xinitrc:
---------------------
VBoxClient-all
exec i3

### Terminal Terminator + i3 as a replacement for TMUX


### How to use

google-chrome-stable url -> opens in url

### key 

$mod = windows

$mod + enter = new window
$mod + d = dmenu // quick start
$mod + f = fullscreen selected window
$mod + number = create new workspace 
$mod + shift + number = move current window to new workspace
$mod + shift + r = reload i3



TODO:
----------------
- ohmyzsh
- SAve a workspace in I3 and reload the window layouts + paths
- install vim 
- install docker
- configure base folder structure
- configure vim and vimrc


iInstall virtual Vox
----------------------------------
Install the virtualbox-guest-utils package from the Arch repo.
Then do
# modprobe -a vboxguest vboxsf vboxvideo
# nano /etc/modules-load.d/virtualbox.conf
Add these three lines in that file:
vboxguest
vboxsf
vboxvideo
Add this to autostart when you start X
VBoxClient-all
And that's it! This works absolutely fine on my Windows machine running Arch x86_64 with DWM.


### Terminal Colors links
http://terminal.sexy/


### Xresource
! Dracula Xresources palette
*.foreground: #F8F8F2
*.background: #282A36
*.color0:     #000000
*.color8:     #4D4D4D
*.color1:     #FF5555
*.color9:     #FF6E67
*.color2:     #50FA7B
*.color10:    #5AF78E
*.color3:     #F1FA8C
*.color11:    #F4F99D
*.color4:     #BD93F9
*.color12:    #CAA9FA
*.color5:     #FF79C6
*.color13:    #FF92D0
*.color6:     #8BE9FD
*.color14:    #9AEDFE
*.color7:     #BFBFBF
*.color15:    #E6E6E6
