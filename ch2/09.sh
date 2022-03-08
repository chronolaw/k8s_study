#!/bin/sh

# chrono @ 2022-04

minikube version

minikube start
# minikube start --kubernetes-version=v1.23.3

# check node
minikube node list

# check minikube container
docker ps

# login minikube node
minikube ssh

minikube kubectl -- version --short

# alias for convenice
#alias kubectl='minikube kubectl --'

#source <(kubectl completion bash)

kubectl run ngx --image=nginx:alpine

kubectl get pod

