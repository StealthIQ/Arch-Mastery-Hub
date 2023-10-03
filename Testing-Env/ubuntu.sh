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
  type "$1" >/dev/null 2>&1
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

main() {
  # Update the system
  color_echo "Updating and upgrading the system..." "cyan"
  sudo apt update -y && sudo apt upgrade -y

  # Setting up the zshrc file
  color_echo "Setting up .zshrc configuration..." "cyan"
  rm -f ~/.bashrc
  if wget -qO ~/.zshrc --timeout=6 https://raw.githubusercontent.com/9jc/dots-ubuntu/main/.zshrc; then
      echo "Downloaded .zshrc successfully."
  else
      echo "Initial download of .zshrc failed. Trying an alternative method..."
      cp .zshrc ~/  # Copy .zshrc from the current directory to ~/ (home directory) as an alternative
      # Switches to ZSH easily
      sudo chsh $USER -s /bin/zsh && echo 'Now log out.'
  fi

  # Create a directory for tools
  color_echo "Creating a tools directory..." "cyan"
  mkdir -p ~/tools

  # Install necessary applications
  color_echo "Installing essential packages..." "cyan"
  sudo add-apt-repository ppa:neovim-ppa/unstable -y
  sudo apt-get update -y
  install_package build-essential
  install_package git
  install_package curl
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
  install_package allacritty
  install_package fonts-powerline
  install_package kitty
  install_package subversion

  # Check if the directory has already been cloned; if not, copy the config files using the standard method.
  current_directory=$(pwd)
  if [ "$current_directory" != "Testing-Env" ]; then
      svn export https://github.com/StealthIQ/Arch-Mastery-Hub.git/trunk/Testing-Env $HOME/Downloads/
      cp $HOME/Downloads/Testing-Env/.config/* $HOME/.config
      cp $HOME/Downloads/Testing-Env/.zshrc $HOME/
  else
      cp $current_directory/Testing-Env/.config/* $HOME/.config
      cp $current_directory/Testing-Env/.zshrc $HOME/
  fi

  # Install exa (a modern replacement for ls)
  color_echo "Installing exa..." "cyan"
  if ! command_exists exa; then
    EXA_VERSION=$(curl -s "https://api.gitcargo install alacrittyhub.com/repos/ogham/exa/releases/latest" | grep -Po '"tag_name": "v\K[0-9.]+')
    wget "https://github.com/ogham/exa/releases/download/v$EXA_VERSION/exa-linux-x86_64" -O ~/tools/exa
    chmod +x ~/tools/exa
  else
    color_echo "exa is already installed." "green"
  fi

  # Installing NVchad
  git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1 
  color_echo "Run nvim to finish the nvchad setup" "yellow"

  # Installing p10k ZSH
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
  echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc

  # Install Oh my zsh
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

  # Set the default terminal to kitty
  sudo update-alternatives --config x-terminal-emulator

  color_echo "Installation and setup complete." "green"
  color_echo "Do a restart if you have just updated your system" "red"
}

# Run the main function
main
