sudo apt-add-repository ppa:ansible/ansible
sudo apt update
sudo apt install ansible
ansible --version
if [ ! -f .ssh/id_rsa ] _
then passphrase="$(openssl rand -base64 20 | md5sum | sed 's/ .*//')" _
/usr/bin/ssh-keygen -q -t rsa -N "${passphrase}" -f .ssh/id_rsa _
echo "${passphrase}" > passphrase.bak _
echo "paste this into agent: ${passphrase}" _
ssh-add -q .ssh/id_rsa _
passphrase="empty again..." _
fi
ssh-copy-id server1.mylocal
ssh server1
