#!/bin/bash

echo "### link to tmp"
ln -s "$(pwd)/" /tmp/desktop-bootstrap

echo "### Grub verboso"
sudo sed -i -e 's/quiet splash//g' /etc/default/grub
update-grub

echo "### System update"
sudo pacman -Syu

echo "### Install default programs"
sudo pacman -S yay
sudo pacman -Sy snapd
sudo systemctl enable snapd.service
sudo systemctl start snapd.service
sudo pacman -Sy jdk-openjdk

sudo pacman -Sy openssh
sudo systemctl enable sshd.service
sudo systemctl start sshd.service

sudo pacman -Sy dstat

sudo modprobe zram
sudo sh -c "echo 'lz4' > /sys/block/zram0/comp_algorithm"
sudo sh -c "echo '2G' > /sys/block/zram0/disksize"
sudo mkswap --label zram0 /dev/zram0
sudo swapon --priority 100 /dev/zram0
sudo cat /tmp/desktop-bootstrap/files/zram.service > /etc/systemd/system/zram.service
sudo systemctl enable zram

sudo pacman -Sy flatpak

echo "### Docker"
sudo pacman -Sy docker
sudo pacman -Sy docker-compose
sudo systemctl start docker
sudo systemctl enable docker

echo "### freeOffice"
sudo pacman -Sy freeoffice

#Calculadora cientifica
echo  "### SpeedCrunch CALC"
sudo pacman -Sy speedcrunch


echo "### ATOM"
sudo pacman -Sy atom

echo "### ARDUINO"
sudo pacman -Sy arduino

echo "### Install nextcloud"
sudo pacman -Sy nextcloud-client

echo "### Install keepassXC"
sudo pacman -Sy keepassxc

echo "### Install Acess programs"
sudo pacman -Sy vnc-viewer
yay teamviewer #option 1
systemctl enable teamviewerd
yay anydesk #option 1
sudo pacman -Sy remmina

echo "### Install graphic editors"
sudo pacman -Sy gimp
sudo pacman -Sy inkscape
sudo pacman -Sy kdenlive
sudo pacman -Sy blender
sudo pacman -Sy obs-studio
snap install opentoonz

echo "### Install audio editor"
snap install audacity

echo "### Enable monitor detect"
optirun intel-virtual-output

echo "Pronto você já pode aproveitar dos seus novos recursos instalados!"
bash -x ./tmp/desktop-bootstrap/complementos/bat.sh
bash -x ./tmp/desktop-bootstrap/complementos/printers.sh
bash -x ./tmp/desktop-bootstrap/complementos/nvimIde.sh
bash -x ./tmp/desktop-bootstrap/complementos/virtualBox.sh
