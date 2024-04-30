az group create --name igsys-Ansible-rg --location eastus2
az vm create --resource-group igsys-Ansible-rg --name igsys-Ansible-vm --image CentOS85Gen2 --admin-username igsysuser --admin-password 112amc112AMC
az vm show -d -g igsys-Ansible-rg -n igsys-Ansible-vm --query publicIps -o tsv
ssh igsysuser@52.184.192.46
===============
#!/bin/bash

# Update all packages that have available updates.
sudo yum update -y

# Install Python 3 and pip.
sudo yum install -y python3-pip

# Upgrade pip3.
sudo pip3 install --upgrade pip

# Install Ansible.
pip3 install "ansible==2.9.17"

# Install Ansible azure_rm module for interacting with Azure.
pip3 install ansible[azure]
================
#!/bin/bash

# Update all packages that have available updates.
sudo yum update -y

# Install Python 3 and pip.
sudo yum install -y python3-pip

# Upgrade pip3.
sudo pip3 install --upgrade pip

# Install Ansible az collection for interacting with Azure.
ansible-galaxy collection install azure.azcollection

# Install Ansible modules for Azure
sudo pip3 install -r ~/.ansible/collections/ansible_collections/azure/azcollection/requirements-azure.txt
=================


