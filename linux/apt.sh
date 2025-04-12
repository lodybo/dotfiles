#!/bin/bash

# This script is used to update the system using apt package manager.
sudo apt update
sudo apt upgrade -y

# Install common packages
sudo apt install -y \
    eza
