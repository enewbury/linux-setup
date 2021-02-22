#!/bin/bash
cd "$(dirname "$0")/.."

script/copy.sh
script/install.sh

# Load system settings
dconf load /org/gnome/ <.config/dconf/settings.dconf
gsettings set org.gnome.desktop.background picture-uri "file://${HOME}/Downloads/desktop-assets/wallpaper.jpg"

# Enable Wayland
if [[ -e /etc/gdm3/custom.conf ]]; then
    sudo sed -i -e 's|.*WaylandEnable=false|#WaylandEnable=false|g' /etc/gdm3/custom.conf
fi

if ! grep -q "MOZ_ENABLE_WAYLAND" "/etc/environment"; then
    sudo echo "MOZ_ENABLE_WAYLAND=1" >>/etc/environment
fi

rcup -d ~/src/github.com/enewbury/dotfiles rcrc && rcup
