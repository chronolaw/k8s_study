#!/bin/sh

# chrono @ 2022-05

wget https://github.com/nginxinc/kubernetes-ingress/archive/refs/tags/v2.2.0.tar.gz

tar xfz v2.2.0.tar.gz

kubectl get ns

docker pull nginx/nginx-ingress:2.2-alpine

export out="--dry-run=client -o yaml"

kubectl create ing ngx-ing --rule="ngx.test/=ngx-svc:80" --class=ngx-ink $out

kubectl apply -f ingress.yml

kubectl get ingressclass
kubectl get ing

kubectl describe ing ngx-ing

kubectl apply -f kic.yml

kubectl get ing

kubectl get pod -n nginx-ingress

kubectl port-forward -n nginx-ingress ngx-kic-dep-5956f8f878-fk2vw 8080:80 &

curl --resolve ngx.test:8080:127.0.0.1 http://ngx.test:8080

kubectl scale --replicas=5 deploy ngx-dep

kubectl describe svc ngx-svc

curl --resolve ngx.test:8080:127.0.0.1 ngx.test:8080

