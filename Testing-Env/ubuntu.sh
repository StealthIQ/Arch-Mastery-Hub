#!/bin/bash

# Define color variables for colored output
declare -A colors=(
  [black]="\e[30m"
  [red]="\e[31m"
  [green]="\e[32m"
  [yellow]="\e[33m"
  [blue]="\e[34m"
  [magenta]="\e[35m"
  [cyan]="\e[36m"
  [white]="\e[37m"
  [reset]="\e[0m"
)

# Function to display colored output
color_echo() {
  local text="$1"
  local color="${colors[$2]}"
  echo -e "$color$text${colors[reset]}"
}

# Function to check if a command is available
command_exists() {
  command -v "$1" >/dev/null 2>&1
}

# Function to install packages if not already installed
install_package() {
  local package_name="$1"
  if ! command_exists "$package_name"; then
    color_echo "Installing $package_name..." "cyan"
    sudo apt-get install "$package_name" -y
  else
    color_echo "$package_name is already installed." "green"
  fi
}

# Update the system
color_echo "Updating and upgrading the system..." "cyan"
sudo apt update -y && sudo apt upgrade -y

# Setting up the bashrc file
color_echo "Setting up .zshrc configuration..." "cyan"
rm -f ~/.bashrc
wget -O ~/.zshrc https://raw.githubusercontent.com/9jc/dots-ubuntu/main/.zshrc
 
# Create a directory for tools
color_echo "Creating a tools directory..." "cyan"
mkdir -p ~/tools

# Install necessary applications
color_echo "Installing essential packages..." "cyan"
sudo add-apt-repository ppa:neovim-ppa/unstable -y
sudo apt-get update -y
install_package git
install_package neovim
install_package htop
install_package neofetch
install_package doas
install_package bleachbit
install_package ripgrep
install_package mlocate
install_package nyx
install_package zsh
install_package zoxide
install_package exa
install_package fzf

# Install exa (a modern replacement for ls)
color_echo "Installing exa..." "cyan"
if ! command_exists exa; then
  EXA_VERSION=$(curl -s "https://api.github.com/repos/ogham/exa/releases/latest" | grep -Po '"tag_name": "v\K[0-9.]+')
  wget "https://github.com/ogham/exa/releases/download/v$EXA_VERSION/exa-linux-x86_64" -O ~/tools/exa
  chmod +x ~/tools/exa
else
  color_echo "exa is already installed." "green"
fi

color_echo "Installation and setup complete." "green"
