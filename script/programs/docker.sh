#!/bin/bash

echo "🐋 Installing Docker"
which docker &> /dev/null

if [ $? -eq 0 ]; then
    echo "Already installed: ${1}"
else
    sudo apt update
    sudo apt-get install -y \
        apt-transport-https \
        ca-certificates \
        curl \
        gnupg-agent \
        software-properties-common
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
    sudo add-apt-repository \
    "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) \
    stable"
    sudo apt update
    sudo apt install -y docker-ce docker-ce-cli containerd.io
    sudo docker run hello-world

    echo "Installing Docker Compose"
    sudo curl -L "https://github.com/docker/compose/releases/download/1.28.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
fi

