#!/bin/bash
echo upgrading and updating base package
apt-get install build-essential
apt-get update -y
apt-get upgrade -y
apt-get dist-upgrade -y

apt-get install linux-headers-generic # linux headers generic required for mint on vm 
# depedencies for maim and a lot of different things
apt-get install cmake libglm-dev libxrandr-dev libglew-dev libjpeg-dev -y

