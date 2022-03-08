#!/bin/sh

# chrono @ 2022-04

export out="--dry-run=client -o yaml"

kubectl explain job

kubectl create job echo-job --image=busybox $out

kubectl apply -f job.yml

kubectl get job
kubectl get pod

#kubectl logs echo-job-pb5gh

kubectl apply -f sleep-job.yml

kubectl get job
kubectl get pod

kubectl delete -f sleep-job.yml

kubectl create cj echo-cj --image=busybox --schedule="" $out

kubectl apply -f cronjob.yml

kubectl get cj
kubectl get pod

kubectl delete -f cronjob.yml
