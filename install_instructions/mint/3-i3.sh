#!/bin/bash

curl https://baltocdn.com/i3-window-manager/signing.asc | sudo apt-key add -
sudo apt install apt-transport-https --yes
echo "deb https://baltocdn.com/i3-window-manager/i3/i3-autobuild-ubuntu/ all main" | sudo tee /etc/apt/sources.list.d/i3-autobuild.list
sudo apt update
sudo apt install i3

echo installing i3
apt-get libanyevent-i3-perl -y # libanyevent i3-perl required for saving layouts

echo installing rofi for i3
add-apt-repository ppa:jasonpleau/rofi
apt update
apt install rofi
apt-get install libxdo-dev xdotool compton -y

# required for polybar
sudo apt-get install python3-sphinx
sudo apt-get install libuc

echo installing alacritty
add-apt-repository ppa:aslatter/ppa -y
apt update
apt install alacritty

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
sudo apt install python3-xcbgen xcb-proto -y
sudo apt-get install libjsoncpp-dev 
sudo apt-get install libuv1.dev

pushd ~/Downloads
  git clone git@github.com:jaagr/polybar.git --recursive
  pushd ~/Downloads/polybar
    mkdir build
    cd build
    cmake ..
    sudo make -j$(nproc)
    sudo make install
  popd
popd
