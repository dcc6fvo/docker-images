#!/bin/sh

# Create a group and user
addgroup -S $1 && adduser -S $1 -G $1 -h /home/$1

# Copy SSH user key
mkdir /home/$1/.ssh
chown root:root /ansible/.ssh/id_rsa
mv /ansible/.ssh/id_rsa /home/$1/.ssh/id_rsa

# Fix file and folder permissions
chown $1:$1 /home/$1/.ssh
chmod 755 -R /home/$1/.ssh
chmod 600 /home/$1/.ssh/id_rsa

# Substitute ansible user
sed -i "s/ansible_user=.*/ansible_user=$1/g" /ansible/hosts

# Substitute ansible user ssh key path
sed -i "s/ansible_ssh_private_key_file=.*/ansible_ssh_private_key_file=\/home\/$1\/.ssh\/id_rsa/g" /ansible/hosts

# Container continue running
tail -f /dev/null
