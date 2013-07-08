#!/bin/bash
# Script Name: devops_setup.sh 
# Author Name: Darry Tse
# Date: 07/07/2013
# Description: 
# Coursera Startup Engineering course setup combined with github.com/startup-class/setup/setup.sh

#
# configurations
#

# install git-core, make, gcc
echo "apt-get update then install git-core, make, gcc"
sudo apt-get update
sudo apt-get install -y git-core make gcc


echo "install python-software-properties, python, g++, and node.js"
sudo apt-get install -y python-software-properties python g++
sudo add-apt-repository ppa:chris-lea/node.js
sudo apt-get update
sudo apt-get install -y nodejs

echo "install heroku toolbelt"
wget -qO- https://toolbelt.heroku.com/install-ubuntu.sh | sh
which git
which heroku

read -p "Heroku will ask for email and password. Press ENTER to continue " REPLY
heroku login

read -p "ssh-keygen will ask for passphrase. leave empty and press ENTER to continue. " REPLY
ssh-keygen -t rsa
echo "adding ssh key to heroku"
heroku keys:add
echo "installing emacs and devops settings"
git clone https://github.com/startup-class/setup.git
./setup/setup.sh
