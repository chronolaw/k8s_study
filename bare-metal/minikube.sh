#!/bin/sh

# chrono @ 2022-03

# https://minikube.sigs.k8s.io/docs/start/
# https://github.com/kubernetes/minikube

# check cpu arch
s=`uname -a | grep 'x86'`

# install minikube
if [ -n "$s" ]; then
    # x86 x86_64
    #curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
    #sudo install minikube-linux-amd64 /usr/local/bin/minikube
    curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64

else
    # arm64 = aarch64
    #curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-arm64
    #sudo install minikube-linux-arm64 /usr/local/bin/minikube
    curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-arm64
fi

sudo install minikube /usr/local/bin/

# install kubectl
minikube kubectl -- version --client

# alias for convenice
#alias kubectl='minikube kubectl --'

# minikube start
# minikube start --kubernetes-version=v1.23.3
# minikube start --container-runtime=containerd
# minikube start --image-mirror-country=cn
# minikube start --registry-mirror=http://hub-mirror.c.163.com
# minikube start --image-repository=registry.cn-hangzhou.aliyuncs.com/google_containers/

