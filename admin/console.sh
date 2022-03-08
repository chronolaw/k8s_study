#!/bin/bash

# chrono @ 2022-04

# https://kubernetes.io/zh/docs/tasks/tools/install-kubectl-linux/

#curl -LO https://dl.k8s.io/release/v1.23.3/bin/linux/amd64/kubectl
curl -LO https://dl.k8s.io/release/v1.23.3/bin/linux/arm64/kubectl

sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

# alias kubectl="$HOME/.minikube/cache/linux/arm64/v1.23.3/kubectl"
# scp .kube/config chrono@192.168.10.208:~/.kube/config.adm

