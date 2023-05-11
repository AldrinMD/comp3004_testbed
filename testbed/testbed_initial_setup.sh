#!/bin/bash

# VM update
echo "Updating VM"
sudo apt-get update

# python Install Check
dpkg -s python &> /dev/null
if [ $? -eq 0 ]; then
	echo "python  already installed"
else
	echo "Installing python"
	sudo apt-get -y install python
	sudo apt-get -y install python-pip	
fi

# Git Install Check
dpkg -s git &> /dev/null
if [ $? -eq 0 ]; then
	echo "git  already installed"
else
	echo "Installing Git"
	sudo apt-get -y install git
fi

# mininet Install Check
dpkg -s mininet &> /dev/null
if [ $? -eq 0 ]; then
	echo "mininet  already installed"
else
	echo "Installing mininet"
	sudo apt-get -y install mininet	
	pip install mininet
	git clone https://github.com/mininet/mininet
fi

# Apache2 Install Check
dpkg -s apache2 &> /dev/null
if [ $? -eq 0 ]; then
	echo "apache2 already installed"
else
	echo "Installing apache2"
	sudo apt-get -y install apache2
fi

# Curl Install Check
dpkg -s curl &> /dev/null
if [ $? -eq 0 ]; then
	echo "curl  already installed"
else
	echo "Installing curl"
	sudo apt-get -y install curl
fi

# apache2-utils Install Check
dpkg -s apache2-utils &> /dev/null
if [ $? -eq 0 ]; then
	echo "apache2-utils  already installed"
else
	echo "Installing apache2-utils"
	sudo apt-get -y install apache2-utils 
fi

# httperf Install Check
dpkg -s httperf &> /dev/null
if [ $? -eq 0 ]; then
	echo "httperf  already installed"
else
	echo "Installing httperf"
	sudo apt-get -y install httperf 
fi

# x264 Install Check
dpkg -s x264 &> /dev/null
if [ $? -eq 0 ]; then
	echo "x264  already installed"
else
	echo "Installing x264"
	sudo apt-get -y install x264 
fi

# gpac Install Check
dpkg -s gpac &> /dev/null
if [ $? -eq 0 ]; then
	echo "gpac  already installed"
else
	echo "Installing gpac"
	sudo apt-get -y install gpac 
fi

# ffmpeg Install Check
dpkg -s ffmpeg &> /dev/null
if [ $? -eq 0 ]; then
	echo "ffmpeg  already installed"
else
	echo "Installing ffmpeg"
	sudo apt-get -y install ffmpeg 
fi

echo "VM IP:"
hostname -I | awk '{print $1}'