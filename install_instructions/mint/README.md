### Mint install process
Take the mint with xfce (not cinammon) image and install it just like usual.
Pick English US keyboard. Install third party software. Enable encryption - pick a passphrase.

### install_base.sh

Run install.sh. It does.
- upgrades the base kernel, distro
- installs xclip, git, zsh, vim, i3, termite, rofi

#### If running on VM - install Guest Additions
Before procedding install Guest Additions and make sure software rendering message is gone
Installing Guest Addtions is simple - just add image and in terminal on admin rights run the sh. Then restart.

### Run install_additions.sh

### Github SSH

Configure Github ssh key

```bash
cat id_rsa.pub | xclip -selection c
```

### Cloning doftiles
Clone dotfiles to main ~ by creatin empty repo and adding remote and feetching all :)

```bash
cd ~
git init
git remote add origin https://github.com/michal-franc.com/dotfiles
git fetch --all
```

### Troubleshooting
Termite - https://askubuntu.com/questions/739163/how-to-install-termite


#### Down Below spam :)

ZSH 
---------------------------------------

* https://github.com/robbyrussell/oh-my-zsh 
* https://github.com/zplug/zplug

```bash
zplug install
ln dotfiles/unix/.zshrc ~/.zshrc
```

---------------------
Installing go and GOPATH for i3-vim-nav
---------------------

Go Installation

https://github.com/golang/go/wiki/Ubuntu
dont install with apt-get just take the binary

When installing new version you need to setup proper path

```bash
export PATH="$PATH:/user/lib/go-1.9/bin"
```

this is also added .zshrc so will be added automaticaly after all the other steps are finished :P

```bash
go get -u golang.org/x/lint/golint
```

install go watcher from github

install godoc https://michaelheap.com/installing-godoc-for-golang-go-1-2/

```bash
go get golang.org/x/tools/cmd/godoc
```

//THIS is at the moment broken and optional
----------------------

If you want to test i3-vim-nav uncommet special config in i3

```bash
sudo apt-get install libxdo-dev
sudo apt-get install xdotool
```

https://github.com/termhn/i3-vim-nav

```bash
go get -u github.com/michal-franc/i3-vim-nav
```

if it cant find GOPATH remember that sudo might be using different ENV variables

-----------------------

install VIM

```bash
sudo apt-get install vim.nox-py2
```

install plug
https://github.com/junegunn/vim-plug

run PlugInstall

Install vim 8

--------------------------------------
Go to main site download deb and use sudo dpkg -i on poackage 
-------------------------------------------
Install Chrome 

```bash
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb 
sudo dpkg -i google-chrome-stable_current_amd64.deb 
```

--------------------------------------------

dotnet installation 
--------------------------------
https://www.microsoft.com/net/core#linuxubuntu 


Installing VBox guest addtions 
------------------------------------
http://www.techrepublic.com/article/how-to-install-virtualbox-guest-additions-on-a-gui-less-ubuntu-server-host/ 

when mounting and /mount/cdrom is missing -> just create this folder with mkdir

you still need to do this step from cli

```bash
ln .xinitrc -> script 
```


RipgRep instlal 
----------------
download package  -> ripgrep x86_64
unpack 

```bash
tar -xvzf community_images.tar.gz 
```

move to tools 

```bash
ln rg /usr/bin/rg 
```

Linking all the settings
--------------------------

```bash
ln dotfiles/unix/.xinitrc .xinitrc
ln dotfiles/unix/.Xresources .Xresources
```

Installing Mono 
------------------
https://github.com/OmniSharp/omnisharp-server/wiki 

Installing Omnisharp 
https://github.com/OmniSharp/omnisharp-server/wiki 
https://vamseek.com/blog/2016/04/23/error-building-omnisharp-vim-on-ubuntu-xenialxerus/ 
https://askubuntu.com/questions/575505/glibcxx-3-4-20-not-found-how-to-fix-this-error 


------------------
Visual Studio Code Settings file

Dont forget to install tig :)

```bash
sudo apt-get install tig
```

----------------------
Fonts
----------------------

only inconsolata is used at the moment

```bash
sudo apt-get install fonts-inconsolata
```

#https://github.com/source-foundry/Hack

----------------------
Great Tools
----------------------

```bash
sudo apt-get install entr -> auto running files on file change:
pip install grip -> great tool to preview github readme files
```

----------------------
Python
---------------------

```bash
sudo apt-get install python-pip 
sudo apt-get install python3-pip 

sudo apt-get install python-dev
sudo apt-get install python3-dev

pip install setuptools 
pip install locust 

sudo apt-get install pylint
sudo ln dotfiles/unix/.pylintrc .pylintrc


Usefull libs:
https://github.com/joowani/binarytree
```

Docker
------------------
https://docs.docker.com/engine/installation/linux/ubuntu/#install-using-the-repository

beacuse you are using mint you need to check on release page which ubuntu build your version derive from and then replace lsb_release with the name of ubuntu
for instance sylvia -> based on xenial then use xenial

If getting docker socket permission then run

```bash
sudo usermod -a -G docker $USER
```


MiniKube
------------------
https://kubernetes.io/docs/tasks/tools/install-kubectl/

Follow installation guide and remember to use --vm-driver=none
https://github.com/kubernetes/minikube

Chrome Extensions and setup
--------------------------

Install lastpass, vimium -> set up account login withut any synchronization

Things Needed for the BLog
---------------------------

```bash
sudo apt-get install ruby-dev
sudo apt-get install nodejs
gem install jekyll bundler
```

Dropbox
-----------------------------
Mostly using dropbox to sync files from host or other machines in a simple way

Install from dropbox instruction
then run the script

and https://unix.stackexchange.com/questions/35624/how-to-run-dropbox-daemon-in-background

Workflow used to send images from windows box to the unix box assumes that github repo kept in Dropbox/blog/ is used to create blog posts

Maim
------------------------------

```bash
sudo apt-get install cmake libglm-dev libxrandr-dev libglew-dev libjpeg-dev
```

https://github.com/naelstrof/maim

usage:

```bash
maim --noopengl -s | xclip -selection clipboard -t image/png
```

TaskWarrior - local todo
--------------------------------

```bash
sudo apt-get install taskwarrior
```

In every repo project i create a folder .todo this folder is used to keep todo list per project
Then i have an alias in bashrc to use taskwarrior with overrider folder .todo

tasksh is a usefull packagee you will need to manually install it with dpkg
Install instructions
https://github.com/GothenburgBitFactory/taskwarrior/issues/2003

you will also need to install libreaddline7 deb - download it somewhere :)

I3blocks
------------------------------------

```bash
sudo apt-get install i3blocks

ln dotfiles/unix/.config/i3/i3blocks.conf ~/.config/i3/i3blocks.conf
```

htop - mem usage and cpu
--------------------------------

```bash
sudo apt-get install htop
```

Bash
-------------------
bats

```bash
sudo apt-get install bats 
```

Rust:
------------------
https://www.rust-lang.org/en-US/install.html

Json parsing tool
-------------------------

```bash
sudo apt-get install jqk
```

WeeChat for slack
-------------------

```bash
sudo apt-get install weechat-curses weechat-plugins
```

https://github.com/wee-slack/wee-slack

C#
-------------------

```bash
sudo apt-get install mono-xbuild
```

https://remysharp.com/2018/08/23/cli-improved

bat - good replacement for cat:
-------------------
https://github.com/sharkdp/bat#installation
create aliast to use bat instead of cat

prettyping - replacement for ping:
-------------------
http://denilson.sa.nom.br/prettyping/

fzf - ctrl+p replacement
-------------------

Scripts in the zsh:
- prlist -> hub pr list through all the folders
- autotest (python, rust, bash) -> sets entr automation that runs unit tests if if file changes (requries cargo, python unit test and bats)
- screen -> uses maim  - enables screen selection and copies scren to clipboard
- screenf -> uses maim -> saves screen to folder (Pictures by default with date as filename, or current folder with filename)
- calendar -> shortuct for calw 
- n -> used to open or append .notes file
- t -> alias for taskwarrior using local .todo folder


i3gaps
----------------
https://github.com/Airblader/i3/wiki/Compiling-&-Installing

i3polybar
----------------
```bash
sudo apt-get install libxcb-ewmh-dev
sudo apt install python-xcbgen
sudo apt install xcb-proto
```
https://github.com/jaagr/polybar

compton
sudo apt-get instlal compton

PDF viewer zathura
sudo apt-get install zathura or dpkg

# usefull for traccing where the files are getting lost
sudo apt-get install ncdu

# dive usefull tool for Docker
https://github.com/wagoodman/dive

# required for i3 layouts saving
sudo apt-get install libanyevent-i3-perl

WTF
---
https://github.com/wtfutil/wtf

Pomo
----
https://kevinschoon.github.io/pomo/

Mutt
----
install mutt a great email client

FEH
---
required for wallpapers 
sudo apt-get install feh


BlueTooth:
-----

Use - sudo bluez.bluetoothctl
- pair, connect, disconnect

on Xubuntu install Xviewer
---
sudo add-apt-repository ppa:embrosyn/xapps
sudo apt-get update

sudo apt-get install xviewer

RUBY ENV
---
https://stackoverflow.com/questions/37720892/you-dont-have-write-permissions-for-the-var-lib-gems-2-3-0-directory -> just do the clones paths and eval is already in .zshrc
