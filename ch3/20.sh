#!/bin/sh

# chrono @ 2022-05

export out="--dry-run=client -o yaml"

kubectl expose deploy ngx-dep --port=80 $out

kubectl apply -f svc.yml

kubectl describe svc ngx-svc

kubectl get pod -o wide

kubectl exec -it ngx-dep-785b6bbbd7-7hmtv -- sh
