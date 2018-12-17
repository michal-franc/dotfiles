Take the mint with xfce (not cinammon) image and install it just like usual.

Dont install third party software - we are generating smallest possible Mint installation. We dont need that.

Pick English US keyboard

Before procedding install Guest Additions and make sure software rendering message is gone

Sometimes To be able to install Additions you need to run

```bash
sudo apt-get install build-essential
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get dist-upgrade -y
sudo apt-get install linux-headers-generic
```

Virtual box 5.14 had a bug with 'generic' kernel ( mint is generic ) - so make sure you use VBox > 5.14

This is the tutorial on how to convert Mint installation to system with I3WM.

Installing Guest Addtions is simple - just add image and in terminal on admin rights run the sh. Then restart.

removing XFCE  
----------------------------------------------------

In my case (Mint with cinnamon and XFCE) I did: 

```bash
sudo apt-get install i3
sudo apt-get install libanyevent-i3-perl <- required for saving workspaces
```

reboot and switch to i3 from logon screen
Just logout and select i3 as your interface

```bash
sudo apt-get remove --purge xfce*
sudo apt-get remove --purge libreoffice*
sudo apt-get remove --purge thunderbird*
sudo apt-get remove --purge gimp*
sudo apt-get remove --purge firefox*
sudo apt-get clean
sudo apt-get autoremove

sudo rm -rf /usr/share/backgrounds 
sudo rm -rf /usr/share/icons

sudo apt-get install git
sudo apt-get install xclip
```

Configure Github ssh key

```bash
cat id_rsa.pub | xclip -selection c
```

This will copy your ssh key to clipboard - use it on github

Clone dotfiles to main ~

```bash
cd ~
git clone https://github.com/michal-franc.com/dotfiles
```

Create Tools Folder.

----------------------------------------------------------
Termite installation 

From tools folder run

```bash
mkdir -p ~/tools
cd $_
curl https://raw.githubusercontent.com/Corwind/termite-install/master/termite-install.sh > termite_install.sh 
sudo apt install libtool 

sudo add-apt-repository ppa:jasonpleau/rofi
sudo apt update
sudo apt install rofi

sudo ./termite_install.shk
cd ~
mkdir .config/termite 
sudo ln dotfiles/unix/.config/termite/config .config/termite/config 
sudo ln dotfiles/unix/.config/i3/config .config/i3/config 
```

if problems https://askubuntu.com/questions/739163/how-to-install-termite

ZSH 
---------------------------------------

```bash
sudo apt-get install zsh 
```

* https://github.com/robbyrussell/oh-my-zsh 
* https://github.com/zplug/zplug

```bash
zplug install
ln dotfiles/unix/.zshrc ~/.zshrc

xset r rate 150 40 - to auto 
```

My i3 config uses i3-vim-nav for navigation beetwen panels. This soft is used to easilly navigate to i3 context using same controls. This step is necessary now to enable pane jumpiong.

---------------------
Installing go and GOPATH for i3-vim-nav
---------------------

Go Installation

https://github.com/golang/go/wiki/Ubuntu

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

or

```bash
sudo apt-get install gtk-py2 -> has clipboard

ln dotfiles/unix/_vimrc _vimrc
```

install plug
https://github.com/junegunn/vim-plug

run PlugInstall

Install vim 8

```bash
sudo add-apt-repository ppa:jonathonf/vim
sudo apt update
sudo apt install vim
```

youcompleteme - requires compliation of ycm server -> https://github.com/Valloric/YouCompleteMe#installation

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
sudo apt-get install cmake
sudo apt-get install libglm-dev
sudo apt-get install librandr-dev
sudo apt-get install libglew-dev
sudo apt-get install libjpeg-dev
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

PDF viewer zathura
sudo apt-get install zathura or dpkg
