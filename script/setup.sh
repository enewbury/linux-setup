#!/bin/bash
cd "$(dirname "$0")/.."

script/copy.sh
script/install.sh

# Load system settings
dconf load /org/gnome/ <.config/dconf/settings.dconf

if [[ -e ${HOME}/Downloads/desktop-assets/wallpaper.jpg ]]; then
    gsettings set org.gnome.desktop.background picture-uri "file://${HOME}/Downloads/desktop-assets/wallpaper.jpg"
fi

# Enable Wayland
if [[ -e /etc/gdm3/custom.conf ]]; then
    sudo sed -i -e 's|.*WaylandEnable=false|#WaylandEnable=false|g' /etc/gdm3/custom.conf
fi

if ! grep -q "MOZ_ENABLE_WAYLAND" "/etc/environment"; then
    sudo echo "MOZ_ENABLE_WAYLAND=1" >>/etc/environment
fi

chsh -s $(which zsh)

rcup -d ~/src/github.com/enewbury/dotfiles rcrc && rcup
