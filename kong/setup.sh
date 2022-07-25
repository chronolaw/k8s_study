#!/bin/bash
#
# https://github.com/Kong/kubernetes-ingress-controller

wget https://github.com/Kong/kubernetes-ingress-controller/archive/refs/tags/v2.6.0.tar.gz

kubectl apply -f all-in-one-dbless.yaml

kubectl get ns
kubectl get pod -n kong

kubectl exec -it -n kong ingress-kong-7c4bd5dc74-vgg9n -- sh
wget -O- 127.1:8100/status

# nodeport svc
curl 192.168.10.210:30777 -I
curl 192.168.10.210:30777 |jq
