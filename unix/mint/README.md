Take the mint with xfce (not cinammon) image and install it just like usual.

Dont install third party software - we are generating smallest possible Mint installation. We dont need that.
Pick English US keyboard

Before procedding install Guest Additions and make sure software rendering message is gone

Sometimes To be able to install Additions you need to run
* sudo apt-get install build-essential
* sudo apt-get update -y
* sudo apt-get upgrade -y
* sudo apt-get dist-upgrade -y
* sudo apt-get install linux-headers-generic

Virtual box 5.14 had a bug with 'generic' kernel ( mint is generic ) - so make sure you use VBox > 5.14

This is the tutorial on how to convert Mint installation to system with I3WM.

Installing Guest Addtions is simple - just add image and in terminal on admin rights run the sh. Then restart.

removing XFCE  
----------------------------------------------------
In my case (Mint with cinnamon and XFCE) I did: 
* sudo apt-get install i3

reboot and switch to i3 from logon screen
Just logout and select i3 as your interface

* sudo apt-get remove --purge xfce*
* sudo apt-get remove --purge libreoffice*
* sudo apt-get remove --purge thunderbird*
* sudo apt-get remove --purge gimp*
* sudo apt-get remove --purge firefox*
* sudo apt-get clean
* sudo apt-get autoremove

* sudo rm -rf /usr/share/backgrounds 
* sudo rm -rf /usr/share/icons

* sudo apt-get install git
* sudo apt-get install xclip

Configure Github ssh key

cat id_rsa.pub | xclip -selection c
This will copy your ssh key to clipboard - use it on github

Clone dotfiles to main ~

Create Tools Folder.

----------------------------------------------------------
Termite installation 

From tools folder run
curl https://raw.githubusercontent.com/Corwind/termite-install/master/termite-install.sh > termite_install.sh 

mkdir .config/termite 
* sudo ln dotfiles/unix/.config/termite/config .config/termite/config 

* sudo apt-get install rofi 

* sudo ln dotfiles/unix/.config/i3/config .config/i3/config 


ZSH 
---------------------------------------
* sudo apt-get install zsh 

https://github.com/robbyrussell/oh-my-zsh 

* https://github.com/zplug/zplug

* zplug install

ln dotfiles/unix/.zshrc ~/.zshrc

xset r rate 150 40 - to auto 

My i3 config uses i3-vim-nav for navigation beetwen panels. This soft is used to easilly navigate to i3 context using same controls. This step is necessary now to enable pane jumpiong.

---------------------
Installing go and GOPATH for i3-vim-nav
---------------------
Go Installation

https://github.com/golang/go/wiki/Ubuntu

When installing new version you need to setup proper path

export  PATH="$PATH:/user/lib/go-1.9/bin"
this is also added .zshrc so will be added automaticaly after all the other steps are finished :P


//THIS is at the moment broken and optional
----------------------
If you want to test i3-vim-nav uncommet special config in i3

sudo apt-get install libxdo-dev
sudo apt-get install xdotool

https://github.com/termhn/i3-vim-nav

go get -u github.com/michal-franc/i3-vim-nav

if it cant find GOPATH remember that sudo might be using different ENV variables

-----------------------
install VIM
sudo apt-get install vim.nox-py2

ln dotfiles/unix/_vimrc _vimrc

install plug
https://github.com/junegunn/vim-plug

run PlugInstall

--------------------------------------
Go to main site download deb and use sudo dpkg -i on poackage 
-------------------------------------------
Install Chrome 
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb 
sudo dpkg -i google-chrome-stable_current_amd64.deb 

--------------------------------------------

dotnet installation 
--------------------------------
https://www.microsoft.com/net/core#linuxubuntu 


Installing VBox guest addtions 
------------------------------------
http://www.techrepublic.com/article/how-to-install-virtualbox-guest-additions-on-a-gui-less-ubuntu-server-host/ 

when mounting and /mount/cdrom is missing -> just create this folder with mkdir

you still need to do this step from cli

ln .xinitrc -> script 


RipgRep instlal 
----------------
download package  -> ripgrep x86_64
unpack 
tar -xvzf community_images.tar.gz 

move to tools 
ln rg /usr/bin/rg 


Linking all the settings
--------------------------

ln dotfiles/unix/.xinitrc .xinitrc
ln dotfiles/unix/.Xresources .Xresources

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

* sudo apt-get install tig

----------------------
Fonts
----------------------

only inconsolata is used at the moment
sudo apt-get install fonts-inconsolata


#https://github.com/source-foundry/Hack

----------------------
Great Tools
----------------------

sudo apt-get install entr -> auto running files on file change:


----------------------
Python
---------------------

sudo apt-get install python-pip 
sudo apt-get install python3-pip 

pip install setuptools 
pip install locust 

Docker
------------------
https://docs.docker.com/engine/installation/linux/ubuntu/#install-using-the-repository

beacuse you are using mint you need to check on release page which ubuntu build your version derive from and then replace lsb_release with the name of ubuntu
for instance sylvia -> based on xenial then use xenial

If getting docker socket permission then run

sudo usermod -a -G docker $USER


MiniKube
------------------
https://kubernetes.io/docs/tasks/tools/install-kubectl/

Follow installation guide and remember to use --vm-driver=none
https://github.com/kubernetes/minikube

Chrome Extensions and setup
--------------------------

Install lastpass, vimium -> set up account login withut any synchronization
