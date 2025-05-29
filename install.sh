#!/usr/bin/env bash

# Check for Debian-based OS
if [ -f /etc/debian_version ]; then
	sudo apt install software-properties-common
	sudo apt-add-repository --yes --update ppa:ansible/ansible
	sudo apt install ansible
	
	sudo ansible-playbook apt/local.yml

elif [ -f /etc/arch-release ]; then
    sudo pacman -S --noconfirm ansible

    ansible-playbook pacman/local.yml

else
    echo "Unsupported or unknown Linux distribution."
    exit 1
fi
