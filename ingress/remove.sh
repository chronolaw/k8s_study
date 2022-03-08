#!/bin/bash

# remove ingress
kubectl delete namespace nginx-ingress
kubectl delete clusterrole nginx-ingress
kubectl delete clusterrolebinding nginx-ingress

kubectl delete -f common/crds/

