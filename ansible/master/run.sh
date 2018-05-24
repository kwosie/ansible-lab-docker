#!/bin/bash

git clone -b localdev https://amjenkins:xxxx@gitlab.platform.is/oss/automationandmessaging/is-jboss-assembly.git
cd is-jboss-assembly
git reset --hard origin/localdev
git pull
cd ansible
echo 'password' > dev-password
echo 'ansible-playbook -i inventories/docker/hosts --vault-password-file dev-password amq.yml'
echo 'ansible-playbook -i inventories/docker/hosts --vault-password-file dev-password fuse.yml'

/usr/sbin/sshd -D