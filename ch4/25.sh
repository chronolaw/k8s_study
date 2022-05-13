#!/bin/sh

# chrono @ 2022-05

export out="--dry-run=client -o yaml"

# change kind to DaemonSet
kubectl create deploy redis-sts --image=redis:5-alpine $out \
  | sed 's/Deployment/StatefulSet/g' -

