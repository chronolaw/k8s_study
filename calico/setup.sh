#!/bin/bash
#
# wget https://projectcalico.docs.tigera.io/manifests/calico.yaml

# preload cni calico
docker pull calico/cni:v3.23.1
docker pull calico/node:v3.23.1
docker pull calico/kube-controllers:v3.23.1

mkdir -p cnitar

# backup
docker save calico/cni:v3.23.1 -o cnitar/cni.tar
docker save calico/node:v3.23.1 -o cnitar/node.tar
docker save calico/kube-controllers:v3.23.1 -o cnitar/ctl.tar

#kubectl apply -f calico.yaml
