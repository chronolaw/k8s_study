#!/bin/bash
#
# https://github.com/Kong/kubernetes-ingress-controller

#wget https://github.com/Kong/kubernetes-ingress-controller/archive/refs/tags/v2.7.0.tar.gz

kubectl apply -f all-in-one-dbless.yaml

kubectl get ns
kubectl get pod -n kong

kubectl exec -it -n kong ingress-kong-7c4bd5dc74-vgg9n -- sh
wget -O- 127.1:8100/status

# nodeport svc
curl 192.168.10.210:30777 -I
curl 192.168.10.210:30777 |jq

# replace 30612 to real nodeport
curl $(minikube ip):30777 -H 'host: kong.test' -i
curl $(minikube ip):30777 -H 'host: kong.dev' -i
curl $(minikube ip):30777 -H 'host: kong.ops' -i

# port-forward
kubectl port-forward -n kong ingress-kong-dep-dc785bd49-2f7dw 8000 &

curl --resolve kong.dev:8000:127.0.0.1 kong.dev:8000 -v
curl --resolve kong.ops:8000:127.0.0.1 kong.ops:8000 -v
