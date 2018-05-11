#!/bin/bash
sudo apt-get update
sudo apt-get install -y  bison libbison-dev

sudo apt-get install -y build-essential libboost-all-dev flex 

sudo apt-get install -y libqt4-dev libxpm-dev libaudio-dev libxt-dev libpng-dev libglib2.0-dev libfreetype6-dev libxrender-dev libxext-dev libfontconfig-dev libxi-dev

sudo apt-get install -y git
sudo apt-get install -y automake

#安装 server
if [ -d rcssserver ]
then
	rm -r rcssserver
fi
git clone https://github.com/rcsoccersim/rcssserver.git
tar -zxvf  rcssserver
cd rcssserver
./bootstrap
./configure
make
sudo make install
cd ..

#安装monitor
if [ -d rcssmonitor ]
then
	rm  -r rcssmonitor
fi
git clone https://github.com/rcsoccersim/rcssmonitor.git
tar -zxvf rcssmonitor
cd rcssmonitor
./bootstrap
./configure
make 
sudo make install
cd .. 
sudo ldconfig
