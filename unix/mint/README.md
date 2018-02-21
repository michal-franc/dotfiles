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

----------------------------------------------------------
Termite installation 

https://github.com/Corwind/termite-install/blob/master/termite-install.sh 

curl https://raw.githubusercontent.com/Corwind/termite-install/master/termite-install.sh > termite_install.sh 

add to /.config/i3/config 

* sudo apt-get install rofi 
----------------------------------------------------------
script  

* sudo mv .config/i3/config .config/i3/copy_config 
* sudo ln dotfiles/unix/.config/i3/config .config/i3/config 

------------------------------------------------------------
Termite install 

* sudo apt-get install git

mkdir .config/termite 
* sudo ln dotfiles/unix/.config/termite/config .config/termite/config 

---------------------------------------
* sudo apt-get install zsh 

https://github.com/robbyrussell/oh-my-zsh 
https://github.com/denysdovhan/spaceship-zsh-theme -> move tmp to themes folder and rename 

ln .zshrc from gi 


xset r rate 150 40 - to auto 


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

ln .xinitrc -> script 


RipgRep instlal 
----------------
download package 
unpack 
tar -xvzf community_images.tar.gz 

move to tools 
ln to /usr/bin/rg 


Installing Mono 
------------------
https://github.com/OmniSharp/omnisharp-server/wiki 

Installing Omnisharp 
https://github.com/OmniSharp/omnisharp-server/wiki 
https://vamseek.com/blog/2016/04/23/error-building-omnisharp-vim-on-ubuntu-xenialxerus/ 
https://askubuntu.com/questions/575505/glibcxx-3-4-20-not-found-how-to-fix-this-error 


------------------
Visual Studio Code Settings file

Docker
------------------
https://docs.docker.com/engine/installation/linux/ubuntu/#install-using-the-repository

#### VIM
VIM from one of the graphical packages to have + clipboard and python

http://todolist.site/#installation


Dont forget to install tig :)

* sudo apt-get install tig


---------------------
Installing go and GOPATH for i3-vim-nav
---------------------
https://github.com/termhn/i3-vim-nav

setting GOPATH

create a folder ~/go

go get -u github.com/michal-franc/i3-vim-nav

if it cant find GOPATH remember that sudo might be using different ENV variables

sudo ln -s <your installation folder> /usr/local/bin

in order to use i3-vim-nav and i get the error sorry the commang is not supported in this VIM
You will need to install vim.nox-py2 and make sure 
that sudo update-alternatives --config vim and select vim.nox

----------------------
Fonts
----------------------
sudo apt-get install fonts-inconsolata
https://github.com/source-foundry/Hack

----------------------
Great Tools
----------------------

sudo apt-get install entr -> auto running files on file change:
