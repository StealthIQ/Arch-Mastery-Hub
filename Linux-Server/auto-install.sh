#!/bin/bash

# Date Created 31/4/2022
# Ubuntu Vultr VPS - #4

# Define color variables
declare -A colors=(
  [0]="black"
  [1]="red"
  [2]="green"
  [3]="yellow"
  [4]="blue"
  [5]="magenta"
  [6]="cyan"
  [7]="white"
)

# Update system
sudo apt update -y && sudo apt upgrade -y

# Setting bashrc
rm .bashrc
wget -O .zshrc https://raw.githubusercontent.com/9jc/dots-ubuntu/main/.zshrc

# Create separate directories
mkdir Programs Scripts Vpn Downloads Bots Tools >> log.txt

# Install necessary applications
sudo add-apt-repository ppa:neovim-ppa/unstable -y
sudo apt-get update -y
sudo apt-get install neovim nano htop neofetch speedtest-cli doas bleachbit lynis aria2c ripgrep mlocate nyx zsh zoxide -y

# Install exa
EXA_VERSION=$(curl -s "https://api.github.com/repos/ogham/exa/releases/latest" | grep -Po '"tag_name": "v\K[0-9.]+')
curl -Lo exa.zip "https://github.com/ogham/exa/releases/latest/download/exa-linux-x86_64-v${EXA_VERSION}.zip"
sudo unzip -q exa.zip bin/exa -d /usr/local
rm exa.zip

# Install yt-dlp and bashtop
pip install yt-dlp
git clone https://github.com/aristocratos/bashtop.git && cd bashtop && sudo make install > /dev/null
cd .. && rm -rf bashtop/

# Install NvChad
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1
nvim

# Additional tips
echo ""
echo "$(tput setaf 3)--------------------------------------[ TIPS ]------------------------------------------"
echo "$(tput setaf 1)---[ Make sure to change the server's default password ]---$"
echo "$(tput setaf 6)---- [ Run lynis --forensics / lynis audit system ] -----$"
echo "$(tput setaf 2)--[ Clean Your System With Bleachbit ; cmd=cleanup" ]--$"
echo "$(tput setaf 3)----------------------------------------------------------------------------------------"

# Oh My Zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "------[ Now Exit ]-----"
