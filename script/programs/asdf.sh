#!/bin/bash

echo "🐋 Installing ASDF"
which asdf &>/dev/null

if [ $? -eq 0 ]; then
    echo "Already installed: ${1}"
else
    git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.8.0

    less asdf-plugins | xargs -n 1 asdf plugin add

    ${ASDF_DATA_DIR:=$HOME/.asdf}/plugins/nodejs/bin/import-release-team-keyring

    asdf install
fi
