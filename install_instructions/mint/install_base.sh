# change termite to alacritty
# polybar i3-gaps from apt
# keyboard language settings
# dracula theme chrome

#!/bin/bash




echo isntalling docker and dive

sudo apt-get install docker-compose -y

pushd ~/Downloads
  wget https://github.com/wagoodman/dive/releases/download/v0.7.0/dive_0.7.0_linux_amd64.deb
  sudo apt install ./dive_0.7.0_linux_amd64.deb
popd


# https://github.com/sharkdp/bat#installation
echo installing bat
pushd ~/Downloads
  wget https://github.com/sharkdp/bat/releases/download/v0.18.1/bat_0.18.1_amd64.deb
  dpkg -i bat_0.18.1_amd64.deb
popd


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
