#!/bin/bash

cp -r .config ${HOME}
cp -r .icons ${HOME}
cp -r .themes ${HOME}

if [ ! -f "$HOME/.hex/hex.config" ]; then
    cp $HOME/Downloads/desktop-assets/hex.config $HOME/.hex/hex.config
fi

if [ ! -f "$HOME/.gitconfig" ]; then
    cp $HOME/Downloads/desktop-assets/.gitconfig $HOME/.gitconfig
fi
