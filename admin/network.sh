#!/bin/bash

# chrono @ 2022-04

# https://github.com/flannel-io/flannel

# cni flannel
docker pull rancher/mirrored-flannelcni-flannel-cni-plugin:v1.0.1
docker pull rancher/mirrored-flannelcni-flannel:v0.17.0

kubectl apply -f flannel.yml

echo "waiting network ready ..."

sleep 1

kubectl get node

# kubectl taint node k8s-master node-role.kubernetes.io/master:NoSchedule-
#kubectl taint nodes --all node-role.kubernetes.io/master-

# test pod
kubectl run ngx --image=nginx:alpine

