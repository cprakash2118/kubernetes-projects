#!/bin/bash

#curl -LO https://get.helm.sh/helm-v3.11.2-linux-amd64.tar.gz
#tar -zxvf helm-v3.11.2-linux-amd64.tar.gz
#sudo mv linux-amd64/helm /usr/local/bin/helm
#helm version
#############

helm repo add nfs-subdir-external-provisioner https://kubernetes-sigs.github.io/nfs-subdir-external-provisioner/
helm repo update
kubectl create namespace nfs-provisioner

#Install the NFS provisioner using Helm:
helm install nfs-subdir-external-provisioner nfs-subdir-external-provisioner/nfs-subdir-external-provisioner --namespace nfs-provisioner --set nfs.server=172.25.231.145 --set nfs.path=/srv/nfs/kubedata

#Note: Install NFS Server on the node you want to use (e.g., 172.25.231.145):
#--set nfs.server=172.25.231.145 - replace with your NFS server IP [hostnae -I]


#Create an NFS StorageClass -Create a file named nfs-storageclass.yaml
#kubectl apply -f nfs-storageclass.yaml


#Create a PersistentVolumeClaim definition: -Create a file named nfs-pvc.yaml:
#kubectl apply -f nfs-pvc.yaml

#Verify
#Check if the PVC is bound:
#kubectl get pvc

#######################
#Step 7: Use the PVC in Your Deployments

#You can now use the nfs-pvc in your Kubernetes deployments and pods to have persistent storage backed by your NFS server. 
#kubectl apply -f nfs-test-pod.yaml
