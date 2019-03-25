sudo apt-add-repository ppa:ansible/ansible
sudo apt update
sudo apt install ansible
ansible --version
if [ ! -f ~/.ssh/id_rsa ]; then /usr/bin/ssh-keygen -q -t rsa -N '' -f ~/.ssh/id_rsa; fi
ssh-copy-id server1.mylocal
ssh server1
