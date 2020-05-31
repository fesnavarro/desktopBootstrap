#### See the ID from activities to use on shortcuts

qdbus org.kde.ActivityManager /ActivityManager/Activities ListActivities
qdbus org.kde.ActivityManager /ActivityManager/Activities CurrentActivity


#### Making nushell my default shell
command -v nu | sudo tee -a /etc/shells
chsh -s /home/$USER/.cargo/bin/nu $USER

#### Making git remain my login
git config --global credential.helper cache
#### Set git to use the credential memory cache
To change the default password cache timeout, enter the following:

git config --global credential.helper 'cache --timeout=36000'
* Set the cache to timeout after 10 hour (setting is in seconds)

#### Retro shell
sudo add-apt-repository ppa:vantuz/cool-retro-term
sudo apt update
sudo apt install cool-retro-term
