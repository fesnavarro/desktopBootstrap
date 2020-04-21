#!/bin/bash

echo "### link to tmp"
ln -s "$(pwd)/" /tmp/desktop-bootstrap

echo "### Grub verboso"
sudo sed -i -e 's/quiet splash//g' /etc/default/grub
update-grub

echo "### System update"
sudo apt update && sudo apt autoremove -y && sudo apt upgrade -y && sudo apt dist-upgrade -y && sudo apt autoclean


echo "### Install default programs"
sudo apt install snapd -y
sudo systemctl enable snapd.service
sudo systemctl start snapd.service
sudo apt install jdk-openjdk -y

sudo apt install openssh -y
sudo systemctl enable sshd.service
sudo systemctl start sshd.service

sudo apt install dstat -y
sudo apt install htop -y

sudo modprobe zram
sudo sh -c "echo 'lz4' > /sys/block/zram0/comp_algorithm"
sudo sh -c "echo '2G' > /sys/block/zram0/disksize"
sudo mkswap --label zram0 /dev/zram0
sudo swapon --priority 100 /dev/zram0
sudo cat /tmp/desktop-bootstrap/files/zram.service > /etc/systemd/system/zram.service
sudo systemctl enable zram

sudo apt install flatpak -y
 
echo "### Docker"
sudo apt install docker -y
sudo apt install docker-compose -y
sudo systemctl start docker
sudo systemctl enable docker

echo "### freeOffice"
sudo apt install freeoffice -y

#Calculadora cientifica
echo  "### SpeedCrunch CALC"
sudo apt install speedcrunch -y


echo "### VSCODE"
sudo apt install software-properties-common apt-transport-https wget
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
sudo apt install code

echo "### ARDUINO"
sudo apt install arduino -y

echo "### Install keepassXC"
snap install keepassxc

echo "### Install Acess programs"
sudo apt install vnc-viewer -y
sudo apt install teamviewer -y
sudo apt install  anydesk -y
sudo apt install remmina -y

echo "### Install graphic editors"
sudo apt install gimp
sudo apt install inkscape
sudo apt install blender
sudo apt install obs-studio
snap install opentoonz

echo "### Install audio editor"
snap install audacity

echo "Pronto você já pode aproveitar dos seus novos recursos instalados!"
bash -x ./tmp/desktop-bootstrap/complementos/bat.sh
bash -x ./tmp/desktop-bootstrap/complementos/printers.sh
bash -x ./tmp/desktop-bootstrap/complementos/nvimIde.sh
bash -x ./tmp/desktop-bootstrap/complementos/virtualBox.sh
