#!/bin/sh

# chrono @ 2022-04

export out="--dry-run=client -o yaml"

kubectl create cm info --from-literal=k=v $out

kubectl apply -f cm.yml

kubectl get cm
kubectl describe cm info


kubectl create secret generic user --from-literal=name=root $out

echo -n "123456" | base64
echo -n "mysql" | base64

kubectl apply  -f secret.yml

kubectl explain pod.spec.containers.env.valueFrom

kubectl run env-pod --image=busybox $out

kubectl apply -f env-pod.yml
kubectl get pod
kubectl exec -it env-pod -- sh

kubectl apply -f vol-pod.yml
kubectl get pod
kubectl exec -it vol-pod -- sh
