sudo apt update
sudo apt-add-repository --yes --update ppa:ansible/ansible
sudo apt install ansible

ssh-keygen -t rsa
ssh-copy-id 127.0.0.1
