pamac install manjaro-printer
udo gpasswd -a $USER sys
sudo systemctl enable --now org.cups.cupsd.service
