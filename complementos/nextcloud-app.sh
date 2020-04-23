mkdir ~/nextcloud

sudo apt-get install davfs2
sudo dpkg-reconfigure davfs2

sudo echo "http://nextcloud-app/remote.php/dav/files/fesnavarro/ /home/fesnavarro/nextcloud davfs user,noauto,file_mode=600,dir_mode=700 0 1" >> /etc/fstab

sudo usermod -aG davfs2 $USER

mount ~/nextcloud
