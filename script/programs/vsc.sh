#!/bin/bash

# https://code.visualstudio.com/docs/setup/linux
echo "⌨️  Installing VSCode"
which code &>/dev/null

if [ $? -eq 0 ]; then
  echo "Already installed: ${1}"
else
  sudo apt install -y code
  function install() {
    name="${1}"
    code --install-extension ${name} --force
  }

  install samuel-pordeus.elixir-test
  install iampeterbanjo.elixirlinter
  install jakebecker.elixir-ls
  install eamodio.gitlens
  install foxundermoon.shell-format
  install ms-azuretools.vscode-docker
  install streetsidesoftware.code-spell-checker

fi
