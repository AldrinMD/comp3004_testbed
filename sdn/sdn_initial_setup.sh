#!/bin/bash

# VM update
echo "Updating VM"
sudo apt-get update

# java Install Check
dpkg -s openjdk-8-jdk &> /dev/null
if [ $? -eq 0 ]; then
	echo "java  already installed"
else
	echo "Installing java"
	java -version
	sudo apt -y install openjdk-8-jdk
fi

echo "VM IP:"
hostname -I | awk '{print $1}'
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64

# feature:install odl-restconf odl-l2switch-switch odl-mdsal-apidocs odl-dlux-all odl-openflowplugin-all

