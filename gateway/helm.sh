#!/bin/sh

# chrono @ 2023-11

# https://github.com/helm/helm/releases

# VER=v3.13.2
# ARCH=arm64
# wget https://get.helm.sh/helm-${VER}-linux-${ARCH}.tar.gz
# tar xfz helm-${VER}-linux-${ARCH}.tar.gz
# sudo install linux-${ARCH}/helm /usr/local/bin

# install helm
curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash

# install kong gateway
helm repo add kong https://charts.konghq.com
helm repo update

helm repo list
helm search repo kong

#helm install kong kong/ingress -n kong --create-namespace

# enable http queries
# traditional_compatible or expressions
helm install \
    kong kong/ingress \
    -n kong \
    --create-namespace \
    --set gateway.env.router_flavor=expressions


