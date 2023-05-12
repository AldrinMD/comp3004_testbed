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

# iperf Install Check
dpkg -s iperf &> /dev/null
if [ $? -eq 0 ]; then
	echo "iperf  already installed"
else
	echo "Installing iperf"
	sudo apt-get -y install iperf 
fi

echo "VM IP:"
hostname -I | awk '{print $1}'
wget https://nexus.opendaylight.org/content/repositories/public/org/opendaylight/integration/distribution-karaf/0.4.4-Beryllium-SR4/distribution-karaf-0.4.4-Beryllium-SR4.zip
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64

# feature:install odl-restconf odl-l2switch-switch odl-mdsal-apidocs odl-dlux-all odl-openflowplugin-all

