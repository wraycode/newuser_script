#!/bin/bash

## ADD NEW USER TO SUDO AND WWW-DATA SET PUBLIC KEY
## TAKES PUBLIC KEY and USERNAME

USERNAME="$1"
KEY="$2"

echo "USER = $USERNAME"
echo "KEY =  $KEY"

# ADD USER
sudo adduser $USERNAME
sudo echo /home/$USERNAME

# CREATE sSSH DIR / FILES
sudo mkdir -p /home/$USERNAME/.ssh
sudo touch /home/$USERNAME/.ssh/authorized_keys

# SET PERMISSIONS
sudo usermod -aG sudo $USERNAME
sudo usermod -aG www-data $USERNAME
sudo chown -R $USERNAME:$USERNAME /home/$USERNAME
sudo chmod 700 /home/$USERNAME/.ssh
sudo chmod 644 /home/$USERNAME/.ssh/authorized_keys

# ADD KEY TO AUTHORIZED KEYS
sudo sed "1 a  ${KEY}" /home/$USERNAME/.ssh/authorized_keys
