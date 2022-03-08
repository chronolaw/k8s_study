#!/bin/sh

# chrono @ 2022-05

export out="--dry-run=client -o yaml"

# change kind to DaemonSet
kubectl create deploy redis-ds --image=redis:5-alpine $out \
  | sed 's/Deployment/DaemonSet/g' - \
  | sed -e '/replicas/d' -

kubectl explain ds.spec
kubectl explain ds.spec.template

kubectl apply -f redis-ds.yml

# kubectl taint node master node-role.kubernetes.io/master:NoSchedule
# kubectl taint node master node-role.kubernetes.io/master:NoSchedule-

kubectl get ds

kubectl describe node master
kubectl describe node worker

