#!/bin/sh

# chrono @ 2022-05

export out="--dry-run=client -o yaml"

kubectl create deploy ngx-dep --image=nginx:alpine $out

kubectl apply -f ngx-dep.yml

kubectl get deploy
kubectl get pod

kubectl scale --replicas=5 deploy ngx-dep

kubectl get pod -l app=nginx
kubectl get pod -l 'app in (ngx, nginx, ngx-dep)'
