#!/bin/bash

# https://github.com/sharkdp/bat#installation
echo installing bat
pushd ~/Downloads
  wget https://github.com/sharkdp/bat/releases/download/v0.18.1/bat_0.18.1_amd64.deb
  dpkg -i bat_0.18.1_amd64.deb
popd


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

echo installing shutter
sudo apt install shutter

# https://github.com/jdx/mise
curl https://mise.run | sh
