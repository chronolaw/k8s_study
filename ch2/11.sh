#!/bin/sh

# chrono @ 2022-04

kubectl api-resources

kubectl get pod --v=9

kubectl apply -f ngx-pod.yml

kubectl explain pod
kubectl explain pod.metadata
kubectl explain pod.spec
kubectl explain pod.spec.containers

# export out="--dry-run=client -o yaml"

kubectl run ngx --image=nginx:alpine --dry-run=client -o yaml

kubectl delete -f ngx-pod.yml

