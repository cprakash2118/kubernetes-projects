#!/bin/bash
sudo yum install -y nfs-utils
sudo mkdir -p /srv/nfs/kubedata
sudo chown nobody:nogroup /srv/nfs/kubedata
sudo chmod 777 /srv/nfs/kubedata

echo "/srv/nfs/kubedata *(rw,sync,no_subtree_check,no_root_squash)" >> /etc/exports

sudo exportfs -rav
sudo systemctl enable --now nfs-server

