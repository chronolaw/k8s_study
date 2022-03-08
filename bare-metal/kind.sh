#!/bin/sh

# chrono @ 2022-03

# https://kind.sigs.k8s.io/
# https://github.com/kubernetes-sigs/kind

# check cpu arch
s=`uname -a | grep 'x86'`

# install kind
if [ -n "$s" ]; then
    # x86 x86_64
    curl -Lo ./kind "https://kind.sigs.k8s.io/dl/v0.12.0/kind-$(uname)-amd64"

else
    # arm64 = aarch64
    curl -Lo ./kind "https://kind.sigs.k8s.io/dl/v0.12.0/kind-$(uname)-arm64"
fi

sudo install kind /usr/local/bin/

# kind create cluster

# install kubectl
curl -LO https://dl.k8s.io/release/v1.23.4/bin/linux/arm64/kubectl
sudo install kubectl /usr/local/bin/

kubectl get cluster-info

