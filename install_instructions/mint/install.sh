#!/bin/bash

echo upgraading and updating base package
apt-get install build-essential
apt-get update -y
apt-get upgrade -y
apt-get dist-upgrade -y

echo installing i3
apt-get install i3 libanyevent-i3-perl -y

echo installing essential tools
apt-get install git xclip zsh vim.nox-py2 -y

apt-get install libxdo-dev install xdotool -y
