#!/bin/bash

#Update apt packages and Install Ansible
sudo apt-get update
sudo apt-get install -y software-properties-common python-apt-common
sudo apt install ansible -y

#Create files and folders
mkdir ansible 
cd ansible 
touch ansible.cfg 
touch host-inventory.ini 
touch playbook.yml 








