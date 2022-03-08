#!/bin/sh

# chrono @ 2022-04

kubectl apply -f busy-pod.yml

kubectl logs busy-pod

kubectl delete -f busy-pod.yaml
#kubectl delete pod busy-pod

kubectl apply -f ngx-pod.yml

kubectl describe pod ngx-pod

kubectl edit pod ngx-pod

kubectl logs ngx-pod

# echo 'aaa' > a.txt
kubectl cp a.txt ngx-pod:/tmp

kubectl exec -it ngx-pod -- sh

kubectl get pod -o wide

minikube ssh
curl 172.17.0.4 -I
