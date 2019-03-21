#!/bin/bash
echo upgrading and updating base package
apt-get install build-essential
apt-get update -y
apt-get upgrade -y
apt-get dist-upgrade -y

sudo apt-get install linux-headers-generic # linux headers generic required for mint on vm 

echo installing i3
apt-get install i3 libanyevent-i3-perl -y # libanyevent i3-perl required for saving layouts

echo installing rofi for i3
sudo add-apt-repository ppa:jasonpleau/rofi
sudo apt update
sudo apt install rofi

echo installing termite
sudo apt install libtool  # requirement for termite

mkdir -p ~/tools
pushd ~/tools
  curl https://raw.githubusercontent.com/Corwind/termite-install/master/termite-install.sh > termite_install.sh 
  sudo ./termite_install.sh
popd

echo installing essential tools
apt-get install git xclip zsh vim.nox-py2 -y
apt-get install libxdo-dev xdotool -y
