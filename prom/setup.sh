#!/bin/bash
#
# https://github.com/prometheus-operator/kube-prometheus/

wget https://github.com/prometheus-operator/kube-prometheus/archive/refs/tags/v0.11.0.tar.gz
tar xfz v0.11.0.tar.gz

cd kube-prometheus-0.11.0/manifests

# use NodePort Service
sed '/spec/a\  type: NodePort' -i grafana-service.yaml
sed '/spec/a\  type: NodePort' -i prometheus-service.yaml
sed 's/k8s.gcr.io\/kube-state-metrics/chronolaw/' -i kubeStateMetrics-deployment.yaml
sed 's/k8s.gcr.io\/prometheus-adapter/chronolaw/' -i prometheusAdapter-deployment.yaml

# in kube-prometheus-0.11.0
cd ..

kubectl create -f manifests/setup

kubectl get pod -n monitoring

# waiting

#kubectl create -f manifests
#kubectl get deploy -n monitoring

