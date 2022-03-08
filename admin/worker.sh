#!/bin/bash

# chrono @ 2022-04

# use ali registry to speed up
repo=registry.aliyuncs.com/google_containers

for name in `kubeadm config images list --kubernetes-version v1.23.3`;
do

    # remove prefix
    src_name=${name#k8s.gcr.io/}
    src_name=${src_name#coredns/}

    # worker only needs kube-proxy/pause
    if [[ "$src_name" =~ "kube-proxy" ]] ||
       [[ "$src_name" =~ "pause" ]] ||
       [[ "$src_name" =~ "coredns" ]] ; then

        docker pull $repo/$src_name

        # rename to fit k8s
        docker tag $repo/$src_name $name
        docker rmi $repo/$src_name
    fi

done

# enable network
docker pull rancher/mirrored-flannelcni-flannel-cni-plugin:v1.0.1
docker pull rancher/mirrored-flannelcni-flannel:v0.17.0

# copy kubeadm join cmd here, with sudo
# sudo \
# kubeadm join 192.168.10.210:6443 --token tlx8h6.nqq9ae0x6n311ur2 \
#   --discovery-token-ca-cert-hash sha256:3ad1e8a51484ec125e2394f03eb3c0429f467a88b432a9408faef6d00f197e87

# get join token
# kubeadm token list
# kubeadm token create --print-join-command
# openssl x509 -pubkey -in /etc/kubernetes/pki/ca.crt | openssl rsa -pubin -outform der 2>/dev/null | openssl dgst -sha256 -hex | sed 's/^.* //'


