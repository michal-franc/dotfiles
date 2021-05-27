# change termite to alacritty
# polybar i3-gaps from apt
# keyboard language settings
# dracula theme chrome

#!/bin/bash
echo upgrading and updating base package
apt-get install build-essential
apt-get update -y
apt-get upgrade -y
apt-get dist-upgrade -y

apt-get install linux-headers-generic # linux headers generic required for mint on vm 
# depedencies for maim and a lot of different things
apt-get install cmake libglm-dev libxrandr-dev libglew-dev libjpeg-dev -y
apt-get install maim

echo installing i3
apt-get install i3 libanyevent-i3-perl -y # libanyevent i3-perl required for saving layouts

echo installing rofi for i3
add-apt-repository ppa:jasonpleau/rofi
apt update
apt install rofi

echo installing essential tools
apt-get install git xclip zsh curl jq tig entr taskwarrior feh ncdu zathura -y
# install vim with clipboard
#apt-get install mutt vim-gnome
#apt-get install mutt vim-gtk
apt-get install htop bats -y
apt-get install libxdo-dev xdotool compton -y

echo installing hunspell
# required for spell checking in vscode
apt-get install hunspell

echo installing vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo installing ohmyzsh
# https://github.com/robbyrussell/oh-my-zsh 
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
# zplug https://github.com/zplug/zplug
curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh

# TODO: revert zshrc change as it will be overwritten by zplug install
source ~/.zshrc
zplug install

echo installing essential software
snap install slack --classic

echo installing termite
apt install libtool  # requirement for termite
apt-get install libgtk2.0-dev

#TODO if termite already installed ignore this step
#mkdir -p ~/tools
#pushd ~/tools
#  curl https://raw.githubusercontent.com/Corwind/termite-install/master/termite-install.sh > termite_install.sh 
#  sudo bash ./termite_install.sh
#popd

#echo installing chrome
#pushd ~/Downloads
#  wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb 
#  dpkg -i google-chrome-stable_current_amd64.deb 
#popd

#echo installing zoom
#pushd ~/Downloads
#  wget https://zoom.us/client/latest/zoom_amd64.deb
#  dpkg -i zoom_amd64.deb 
#  apt --fix-broken install # to install missing packages
#popd

# TODO take the version from env variable and let the user decide which one to use
#echo installing golang 1.12.6
#pushd ~/Downloads
#  wget https://dl.google.com/go/go1.12.6.linux-amd64.tar.gz
#  tar -C /usr/local -xzf go1.12.6.linux-amd64.tar.gz
#  go get -u golang.org/x/lint/golint
#  go get golang.org/x/tools/cmd/godoc
#  go get github.com/michal-franc/i3-vim-nav # custom go app for jumping from go to vim etc
#  go get github.com/kevinschoon/pomo # pomodoro script
#  go get github.com/michal-franc/mf-cli # cli app with helper scripts
#popd

echo installing ripgrep
pushd ~/Downloads
  wget https://github.com/BurntSushi/ripgrep/releases/download/0.10.0/ripgrep_0.10.0_amd64.deb
  sudo dpkg -i ripgrep_0.10.0_amd64.deb
popd

echo installing python tools
sudo apt-get install python-pip python3-pip python-dev python3-dev -y
pip install setuptools locust httpie

#echo installing xviewer
#sudo add-apt-repository ppa:embrosyn/xapps
#sudo apt-get update
#sudo apt-get install xviewer -y

echo isntalling docker and dive

sudo apt-get install docker-compose -y

pushd ~/Downloads
  wget https://github.com/wagoodman/dive/releases/download/v0.7.0/dive_0.7.0_linux_amd64.deb
  sudo apt install ./dive_0.7.0_linux_amd64.deb
popd

# deps for i3gaps and polybar
apt-get install libxcb1-dev libxcb-keysyms1-dev libpango1.0-dev \
libxcb-util0-dev libxcb-icccm4-dev libyajl-dev \
libstartup-notification0-dev libxcb-randr0-dev \
libev-dev libxcb-cursor-dev libxcb-xinerama0-dev \
libxcb-xkb-dev libxkbcommon-dev libxkbcommon-x11-dev \
autoconf libxcb-xrm0 libxcb-xrm-dev automake libxcb-shape0-dev \
libxcb-ewmh-dev libasound2-dev libxcb-composite0-dev libxcb-image0-dev -y

# https://github.com/jaagr/polybar
echo installing polybar
sudo apt install python-xcbgen xcb-proto -y

pushd ~/Downloads
  git clone git@github.com:jaagr/polybar.git
  pushd ~/Downloads/polybar
    mkdir build
    cd build
    cmake ..
    make -j$(nproc)
    make install
  popd
popd

# https://github.com/Airblader/i3/wiki/Compiling-&-Installing
echo installing i3gaps
sudo apt install libxcb1-dev libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev libxcb-icccm4-dev libyajl-dev libstartup-notification0-dev libxcb-randr0-dev libev-dev libxcb-cursor-dev libxcb-xinerama0-dev libxcb-xkb-dev libxkbcommon-dev libxkbcommon-x11-dev autoconf xutils-dev libtool automake
pushd ~/Downloads
  git clone https://www.github.com/Airblader/i3 i3-gaps
  pushd ~/Downloads/i3-gaps
    autoreconf --force --install
    rm -rf build/
    mkdir -p build && cd build/
    ../configure --prefix=/usr --sysconfdir=/etc --disable-sanitizers
    make 
    make install
  popd
popd

# https://github.com/sharkdp/bat#installation
echo installing bat
pushd ~/Downloads
  wget https://github.com/sharkdp/bat/releases/download/v0.18.1/bat_0.18.1_amd64.deb
  dpkg -i bat_0.18.1_amd64.deb
popd

# https://www.rust-lang.org/en-US/install.html
echo installing rust
curl https://sh.rustup.rs -sSf | sh

# https://docs.docker.com/install/linux/docker-ce/ubuntu/
echo installing docker
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    gnupg-agent \
    software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
apt-key fingerprint 0EBFCD88
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

apt-get update
apt-get install docker-ce docker-ce-cli containerd.io

# If getting docker socket permission then run
usermod -a -G docker $USER

# https://code.visualstudio.com/docs/setup/linux
echo installing vs code
pushd /tmp/
  curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
  install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
  sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
popd

apt-get install apt-transport-https
apt-get update
apt-get install code # or code-insiders

echo AWS
apt install aws -y

echo installing shutter
apt-get install shutter gnome-web-photo libgoo-canvas-perl
