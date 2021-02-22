#!/bin/bash

echo "🗳️ Installing ProtonMail Bridge"
which protonmail-bridge > /dev/null
if [ $? -eq 0 ]; then
    echo "Already installed"
else
    protonmail_deb=protonmail-bridge_1.6.3-1_amd64.deb
    wget -P ~/Downloads "https://protonmail.com/download/bridge/$protonmail_deb"
    sudo apt install "~/Downloads/$protonmail_deb"
    rm "~/Downloads/$protonmail_deb"
fi
