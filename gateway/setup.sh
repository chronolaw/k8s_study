#!/bin/bash

wget https://github.com/kubernetes-sigs/gateway-api/releases/download/v0.5.0/standard-install.yaml
wget https://github.com/kubernetes-sigs/gateway-api/releases/download/v0.5.0/experimental-install.yaml

kubectl applf -f standard-install.yaml -f experimental-install.yaml
