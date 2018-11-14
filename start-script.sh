#!/usr/bin/env bash

#This is a script to install python-pip and Ansible
#It then clones an Ansible playbook from GitLab and runs a play to install packages for a DevOps workstation


#Written by: Luke Edgley
#2018-11-14
#Ver-0.1

#Check if pip is installed, if not, install.
type -p pip --version > /dev/null

if [ $? -ne 0 ]; then
	echo -e "Pip is not installed - now installing"
	sudo sudo -H easy_install pip
else
	echo "Pip is already installed"
fi

#Check if Ansible is installed, if not, install.
type -p ansible --version > /dev/null

if [ $? -ne 0 ]; then
	echo -e "Ansible is not installed - now installing"
	sudo -H pip install ansible
else
	echo "Ansible is already installed"
fi

#Install Homebrew package manager
#This can be done either here (pre Ansible play) or using Ansible, but is required to use the homebrew modules with Ansible
#yes | /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

#Run the Ansible playbook to install required packages.
ansible-playbook -K ~/osx-setup/install-pkgs.yml
