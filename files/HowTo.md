#### See the ID from activities to use on shortcuts

qdbus org.kde.ActivityManager /ActivityManager/Activities ListActivities
qdbus org.kde.ActivityManager /ActivityManager/Activities CurrentActivity


#### Making nushell my default shell
command -v nu | sudo tee -a /etc/shells
chsh -s /home/$USER/.cargo/bin/nu $USER
