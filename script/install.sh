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

install gimp
install gnome-tweaks
install neofetch
install postgresql-client
install rcm
install slack-desktop
install vim
install zsh

flatpak install com.spotify.Client -y
flatpak install us.zoom.Zoom -y

# Run all scripts in programs/
for f in script/programs/*.sh; do bash "$f" -H; done

# Install Starship prompt
which starship &>/dev/null
if [ $? -ne 0]; then
  sudo curl -fsSL https://starship.rs/install.sh | sudo bash -s -- -y
fi

# Install Sheldon zsh plugin manager
which sheldon &>/dev/null
if [ $? -ne 0]; then
  sudo curl --proto '=https' -fLsS https://rossmacarthur.github.io/install/crate.sh |
    sudo bash -s -- --repo rossmacarthur/sheldon --to /usr/local/bin
fi

# Get all upgrades
sudo apt upgrade -y
sudo apt autoremove -y
