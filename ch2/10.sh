#!/bin/sh

# chrono @ 2022-04

kubectl get node

kubectl get pod -n kube-system

minikube ssh

# docker ps |grep kube-proxy
# ps -ef|grep kubelet

minikube addons list

kubectl run ngx --image=nginx:alpine

minikube dashboard --url=true
