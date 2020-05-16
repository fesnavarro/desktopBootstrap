#!/bin/bash

echo "### link to tmp"
ln -s "$(pwd)/" /tmp/desktop-bootstrap

echo "### Grub verboso"
sudo sed -i -e 's/quiet splash//g' /etc/default/grub
update-grub

echo "### System update"
sudo apt update && sudo apt autoremove -y && sudo apt upgrade -y && sudo apt dist-upgrade -y && sudo apt autoclean

echo "### Terminal"
add-apt-repository ppa:mmstick76/alacritty
apt install alacritty -y

echo "### Install default programs"
sudo apt install git -y
sudo apt install curl -y
sudo apt install snapd -y
sudo apt install synaptic -y

sudo apt install openssh-server -y

sudo apt install dstat -y
sudo apt install htop -y

sudo apt install flatpak -y

echo "### Brave Browser
curl -s https://brave-browser-apt-release.s3.brave.com/brave-core.asc | sudo apt-key --keyring /etc/apt/trusted.gpg.d/brave-browser-release.gpg add -
echo "deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt update
sudo apt install brave-browser
 
echo "### Docker"
sudo apt install docker -y
sudo apt install docker-compose -y
sudo usermod -aG docker $USER
sudo apt install gnupg2 pass

echo "### freeOffice"
sudo apt install libreoffice -y

#Calculadora cientifica
echo  "### SpeedCrunch CALC"
sudo apt install speedcrunch -y

echo "### ARDUINO"
sudo apt install arduino -y

echo "### Install keepassXC"
snap install keepassxc

echo "### Install Acess programs"
sudo apt install vnc-viewer -y
sudo apt install teamviewer -y
sudo apt install  anydesk -y
sudo apt install remmina -y

echo "### Install editors"
sudo apt install gimp -y
sudo apt install inkscape -y
sudo apt install blender -y
sudo apt install obs-studio -y
snap install opentoonz -y

sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt install neovim -y

echo "### VSCODE"
sudo apt install code

echo "### Install audio editor"
sudo apt install audacity -y

echo "### Dropbox Client
echo "deb [arch=i386,amd64] http://linux.dropbox.com/ubuntu bionic main"  > /etc/apt/sources.list.d/dropbox.list
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 1C61A2656FB57B7E4DE0F4C1FC918B335044912E
sudo apt update
sudo apt install python3-gpg dropbox

echo "### Nodejs"
sudo apt-get install curl
curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
apt install nodejs

echo "Pronto você já pode aproveitar dos seus novos recursos instalados!"
bash -x ./tmp/desktop-bootstrap/complementos/bat.sh
bash -x ./tmp/desktop-bootstrap/complementos/trash.sh
bash -x ./tmp/desktop-bootstrap/complementos/engineering.sh
bash -x ./tmp/desktop-bootstrap/complementos/virtualBox.sh
bash -x ./tmp/desktop-bootstrap/complementos/nextcloud-app.sh
