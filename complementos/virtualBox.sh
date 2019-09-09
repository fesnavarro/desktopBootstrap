pamac install virtualbox $(pacman -Qsq "^linux" | grep "^linux[0-9]*[-rt]*$" | awk '{print $1"-virtualbox-host-modules"}' ORS=' ')
sudo vboxreload
pamac build virtualbox-ext-oracle
sudo gpasswd -a $USER vboxusers
sudo pacman -Sy virtualbox-guest-iso
#/usr/lib/virtualbox/additions/VBoxGuestAdditions.iso
