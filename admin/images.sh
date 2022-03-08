#!/bin/bash

# chrono @ 2022-04

# kubeadm config images list --kubernetes-version v1.23.3
# k8s.gcr.io/kube-apiserver:v1.23.3
# k8s.gcr.io/kube-controller-manager:v1.23.3
# k8s.gcr.io/kube-scheduler:v1.23.3
# k8s.gcr.io/kube-proxy:v1.23.3
# k8s.gcr.io/pause:3.6
# k8s.gcr.io/etcd:3.5.1-0
# k8s.gcr.io/coredns/coredns:v1.8.6

# use ali registry to speed up
repo=registry.aliyuncs.com/google_containers

for name in `kubeadm config images list --kubernetes-version v1.23.3`;
do
    # remove prefix
    src_name=${name#k8s.gcr.io/}
    src_name=${src_name#coredns/}

    docker pull $repo/$src_name

    # rename to fit k8s
    docker tag $repo/$src_name $name
    docker rmi $repo/$src_name
done

# flannel images
for name in `grep image flannel.yml |grep -v '#image' | sed 's/image://g' -`;
do
    docker pull $name
done

# check
docker images
