#!/bin/bash

echo "### link to tmp"
ln -s "$(pwd)/" /tmp/desktop-bootstrap

echo "### Grub verboso"
sudo sed -i -e 's/quiet splash//g' /etc/default/grub
update-grub

 
echo "### Docker"
sudo usermod -aG docker $USER
sudo apt install gnupg2 pass

curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -

echo "Pronto você já pode aproveitar dos seus novos recursos instalados!"
bash -x ./tmp/desktop-bootstrap/complementos/bat.sh
bash -x ./tmp/desktop-bootstrap/complementos/trash.sh
bash -x ./tmp/desktop-bootstrap/complementos/engineering.sh
bash -x ./tmp/desktop-bootstrap/complementos/virtualBox.sh
bash -x ./tmp/desktop-bootstrap/complementos/nextcloud-app.sh
