#!/bin/sh
set -xe

MEM=2048M
CPUS=2
DISK=20G

echo "Creating and launching instance"
multipass launch --name primary -c $CPUS -m $MEM -d $DISK --cloud-init cloud-init.yml

echo "Mounting $HOME into remote instance: primary"
multipass mount ${HOME} primary:/Users/${USER}

PRIMARY_INSTANCE=$(multipass info primary | grep IPv4 | awk '{split($0,a," "); print a[2]}')

echo "Success! in your bash profile add this:"
echo "export DOCKER_HOST=tcp://$PRIMARY_INSTANCE:2375"
