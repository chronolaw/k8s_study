#!/bin/sh

# chrono @ 2022-06

kubectl create ns test-ns
kubectl get ns

kubectl get pod -n test-ns

kubectl delete ns test-ns


kubectl explain quota.spec

kubectl create job echo1 -n dev-ns --image=busybox -- echo hello
kubectl create job echo2 -n dev-ns --image=busybox -- echo hello

kubectl run ngx --image=nginx:alpine -n dev-ns

kubectl explain limits.spec.limits

kubectl describe limitranges -n dev-ns
