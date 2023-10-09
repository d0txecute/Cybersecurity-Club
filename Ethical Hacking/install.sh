#!/bin/bash

if (( $EUID != 0 )); then
    echo "[-] Please run as root"
    exit
fi

grn=$'\e[1;32m'
yel=$'\e[1;33m'
end=$'\e[0m'

echo -e "${yel}Updating System${end}\n"
sudo apt-get update -y && sudo apt-get upgrade

echo -e "${yel}Installing Docker${end}\n"

# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl gnupg
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

# Add the repository to Apt sources:
echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install docker.io docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin git curl wget node npm

echo -e "${yel}Downloading Labs${end}\n"
mkdir -p /opt/labs/web
cd /opt/labs/web
git clone https://github.com/vulhub/vulhub
git clone https://github.com/NeuraLegion/brokencrystals

echo -e "${yel}Installing Tools${end}\n"

docker volume create openvas
docker run --detach --publish 8880:9392 -e PASSWORD='password123' --volume openvas:/data --name openvas immauss/openvas
curl https://raw.githubusercontent.com/Lavender-exe/ICS-Lab/main/setup/kali-setup.sh | sudo bash
