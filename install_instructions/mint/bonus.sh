#!/bin/bash

# echo installing hunspell
# required for spell checking in vscode
# apt-get install hunspell

echo installing essential software
snap install slack --classic


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

#echo installing xviewer
#sudo add-apt-repository ppa:embrosyn/xapps
#sudo apt-get update
#sudo apt-get install xviewer -y