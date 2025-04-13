#!/bin/bash

# This script is used to update the system using apt package manager.
sudo apt update
sudo apt upgrade -y

# Install common packages
sudo apt install -y \
    gpg \

# Install eza
sudo mkdir -p /etc/apt/keyrings
curl -s https://raw.githubusercontent.com/eza-community/eza/main/deb.asc | sudo gpg --dearmor -o /etc/apt/keyrings/gierens.gpg
echo "deb [signed-by=/etc/apt/keyrings/gierens.gpg] http://deb.gierens.de stable main" | sudo tee /etc/apt/sources.list.d/gierens.list
sudo chmod 644 /etc/apt/keyrings/gierens.gpg /etc/apt/sources.list.d/gierens.list
sudo apt update
sudo apt install -y eza
