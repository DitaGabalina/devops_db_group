#!/bin/bash
echo "sysops ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/sysops
sudo apt -y update
sudo apt -y upgrade
sudo apt -y install mc
sudo apt -y install openjdk-11-jre-headless
java -version
sudo apt -y install apt-transport-https
wget -q -O - https://www.apache.org/dist/cassandra/KEYS | sudo apt-key add -
echo "deb http://www.apache.org/dist/cassandra/debian 40x main" | sudo tee -a /etc/apt/sources.list.d/cassandra.sources.list
sudo apt -y update
sudo apt -y install cassandra
systemctl status cassandra