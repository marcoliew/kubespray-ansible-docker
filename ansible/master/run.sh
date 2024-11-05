#!/bin/bash

# generate RSA key pair to allow master to communicate with managed nodes
# default private key passphrase is '12345' (not a good idea for production environment ;)

# Handling users 

RUN adduser ansible

RUN echo "root:1234" | chpasswd
RUN echo "ansible:1234" | chpasswd

#ssh-keygen -t rsa -N 12345 -C "master key" -f ~/.ssh/master_key

# DO NOT USE RSA, it's not support, and file name must use "id_ed25519"
ssh-keygen -t ed25519 -C "ansible default" -f ~/.ssh/id_ed25519
eval $(ssh-agent)
ssh-add id_ed25519

# copy public key to volume for copy to target server
cp ~/.ssh/id_ed25519.pub /var/ans/
#chmod 600 ~/.ssh/master_key
#chmod 777 /var/ans/master_key.pub

# start SSH server
/usr/sbin/sshd -D