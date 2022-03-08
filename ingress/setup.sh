#!/bin/sh

kubectl apply -f common/ns-and-sa.yaml
kubectl apply -f rbac

kubectl apply -f common
kubectl apply -f common/crds




