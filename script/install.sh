#!/bin/bash

# Update Ubuntu and get standard repository programs
sudo apt update && sudo apt full-upgrade -y

function install() {
  dpkg -s $1 &>/dev/null

  if [ $? -ne 0 ]; then
    echo "Installing: ${1}..."
    sudo apt install -y $1
  else
    echo "Already installed: ${1}"
  fi
}

# Basics

install compinit
install gimp
install gnome-tweaks
install neofetch
install postgresql-client
install rcm
install slack-desktop
install vim
install zsh

flatpak install spotify -y
flatpak install zoom -y

# Run all scripts in programs/
for f in script/programs/*.sh; do bash "$f" -H; done

# Install Starship prompt
sudo curl -fsSL https://starship.rs/install.sh | bash -s -- -y

# Install Sheldon zsh plugin manager
sudo curl --proto '=https' -fLsS https://rossmacarthur.github.io/install/crate.sh |
  bash -s -- --repo rossmacarthur/sheldon --to /usr/local/bin

# Get all upgrades
sudo apt upgrade -y
sudo apt autoremove -y
