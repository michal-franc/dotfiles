To install vim with python support

sudo apt-get install vim-nox-py2

removing XFCE 
----------------------------------------------------
In my case (Mint with cinnamon and XFCE) I did:

sudo apt-get -f install
sudo apt-get clean
sudo apt-get autoclean
sudo apt-get update
THEN:

sudo apt-get purge xfce4  # failed
THEN:

sudo apt-get purge xfconf
sudo apt-get autoremove
sudo apt-get -f install
sudo apt-get clean
sudo apt-get autoclean
sudo apt-get update

----------------------------------------------------------
Termite installation

https://github.com/Corwind/termite-install/blob/master/termite-install.sh

curl https://raw.githubusercontent.com/Corwind/termite-install/master/termite-install.sh > termite_install.sh

add to /.config/i3/config

sudo apt-get install rofi
----------------------------------------------------------
script 

sudo mv .config/i3/config .config/i3/copy_config
sudo ln dotfiles/unix/.config/i3/config .config/i3/config

------------------------------------------------------------
Termite install

mkdir .config/termite
sudo ln dotfiles/unix/.config/termite/config .config/termite/config

---------------------------------------
sudo apt-get install zsh

https://github.com/robbyrussell/oh-my-zsh
https://github.com/denysdovhan/spaceship-zsh-theme -> move tmp to themes folder and rename

ln .zshrc from gi


xset r rate 150 20 - to auto


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
