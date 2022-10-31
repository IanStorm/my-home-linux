#!/bin/bash

# ⬇️	Configure
sudo timedatectl set-timezone Europe/Berlin

# ⬇️	Install
sudo apt update
# 	⬇️	Enable auto-update
sudo apt install -y unattended-upgrades
# 	⬇️	Install Docker
# 	⬇️	👀 https://linuxhint.com/install_docker_on_raspbian_os/
sudo apt-get install -y raspberrypi-kernel raspberrypi-kernel-headers
curl -sSL https://get.docker.com | sh
sudo usermod -aG docker pi
# 	⬇️	Install docker-compose
sudo apt-get install -y docker-compose

# ⬇️	Clone
mkdir -p ~/GitHub/IanStorm/
cd ~/GitHub/IanStorm/
git clone https://github.com/IanStorm/my-home-raspi.git

# ⬇️	Map folder
sudo mkdir -p /opt/IanStorm/
sudo ln --symbolic /home/pi/GitHub/IanStorm/my-home-raspi/my-home-dns/opt/IanStorm/my-home-raspi/ /opt/IanStorm/

# ⬇️	Restart Ras Pi
sudo reboot
