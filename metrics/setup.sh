#!/bin/bash
#

# https://github.com/kubernetes-sigs/metrics-server
# wget https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml
# sed '/args:/a\        - --kubelet-insecure-tls' components.yaml

# download and change yaml
# wget -O- https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml \
#   | sed '/args:/a\        - --kubelet-insecure-tls' - > components.yaml

# use ali registry to speed up
repo=registry.aliyuncs.com/google_containers

name=k8s.gcr.io/metrics-server/metrics-server:v0.6.1

# remove prefix
#src_name=${name#k8s.gcr.io/}
#src_name=${name#metrics-server/}
src_name=metrics-server:v0.6.1

docker pull $repo/$src_name

# rename to fit k8s
docker tag $repo/$src_name $name
docker rmi $repo/$src_name

# add args: - --kubelet-insecure-tls
kubectl apply -f components.yaml
