#!/bin/sh

# chrono @ 2022-05

# ensure nfs data path is there
mkdir -p /tmp/nfs

export out="--dry-run=client -o yaml"

# change kind to StatefulSet, add field 'serviceName'
kubectl create deploy redis-sts --image=redis:5-alpine $out \
  | sed 's/Deployment/StatefulSet/g' - \
  | sed '/replicas/i\  serviceName: x-svc' -

kubectl apply -f redis-sts.yml

# enter a sts pod
kubectl exec -it redis-sts-0 -- sh

echo $HOSTNAME

# pod-name.svc-name
ping redis-sts-0.redis-svc
ping redis-sts-1.redis-svc

# create a temporary pod
kubectl run dummy --image=nginx:alpine

# create a svc template, then add clusterIP=None
kubectl expose pod dummy --port=6379 $out

# create sts with pv
kubectl apply -f redis-pv-sts.yml

# check redis kv store
kubectl exec -it redis-pv-sts-0 -- redis-cli
set a 111
set b 222

# delete the pod
kubectl delete pod redis-pv-sts-0

