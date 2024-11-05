#!/bin/bash

mkdir /home/ansible/.ssh/



# add a master public key to authorized_keys on host in order to allow SSH connections

cat /var/ans/id_ed25519.pub >> /home/ansible/.ssh/authorized_keys
cat /var/ans/id_ed25519.pub >> ~/.ssh/authorized_keys

# chown -R ansible:ansible /home/ansible/.ssh

# chmod 700 /home/ansible/.ssh
# chmod 644 /home/ansible/.ssh/authorized_keys

# start SSH server
/usr/sbin/sshd -D