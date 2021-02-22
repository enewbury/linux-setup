#!/bin/bash
cd "$(dirname "$0")/.."

script/copy.sh
script/install.sh

# Load system settings
dconf load /org/gnome/ <.config/dconf/settings.dconf
gsettings set org.gnome.desktop.background picture-uri "file://${HOME}/Downloads/desktop-assets/wallpaper.jpg"

rcup -d ~/src/github.com/enewbury/dotfiles rcrc && rcup
