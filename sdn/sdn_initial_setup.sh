#!/bin/bash

# VM update
echo "Updating VM"
sudo apt-get update

# java Install Check
dpkg -s java &> /dev/null
if [ $? -eq 0 ]; then
	echo "java  already installed"
else
	echo "Installing java"
	sudo apt -y install default-jdk
fi

export JAVA_HOME=/usr/lib/jvm/
export JAVA_HOME=/usr/lib/jvm/
export JAVA_HOME=/usr/lib/jvm/java-7-openjdk-i386

