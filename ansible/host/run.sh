#!/bin/bash

# add a master public key to authorized_keys on host in order to allow SSH connections
whoami
cat /usr/share/ansible/master_key >> /etc/ssh/ssh_host_rsa_key
ls -la /usr/share/ansible
ssh -i /etc/ssh/ssh_host_rsa_key master01
#cat /etc/ssh/ssh_host_rsa_key
ls -la /etc/ssh/ssh_host_rsa_key
chmod 600 /etc/ssh/ssh_host_rsa_key
mkdir -p /root/.ssh
cat /usr/share/ansible/master_key.pub >> /root/.ssh/authorized_keys

# start SSH server
#bash
/usr/sbin/sshd -D
