#!/bin/bash
#
# https://github.com/kubernetes/dashboard
# https://github.com/kubernetes/dashboard/tree/master/docs/user/access-control

# get dashboard yaml, change token ttl to 24 hours
#wget https://raw.githubusercontent.com/kubernetes/dashboard/v2.6.0/aio/deploy/recommended.yaml -O- \
#  | sed '/args/a\            - --token-ttl=86400' \
#  > dashboard.yaml

# generate cert: rsa2048, sha256, 1 year
openssl req -x509 -days 365 -out k8s.test.crt -keyout k8s.test.key \
  -newkey rsa:2048 -nodes -sha256 \
    -subj '/CN=k8s.test' -extensions EXT -config <( \
       printf "[dn]\nCN=k8s.test\n[req]\ndistinguished_name = dn\n[EXT]\nsubjectAltName=DNS:k8s.test\nkeyUsage=digitalSignature\nextendedKeyUsage=serverAuth")

# generate secret tls, in namespace kubernetes-dashboard
export out="--dry-run=client -o yaml"
kubectl create secret tls dash-tls -n kubernetes-dashboard --cert=k8s.test.crt --key=k8s.test.key $out > cert.yml

# create and check
kubectl apply -f cert.yml
kubectl get secrets -n kubernetes-dashboard

# create ingress
kubectl apply -f ingress.yml -f kic.yml

# in mac, test dashboard nodeport
# curl https://k8s.test:32368 -kv

# kubectl get pod -n kubernetes-dashboard -o wide
# in kic pod, test dashboard endpoint
# curl --resolve k8s.test:8443:10.10.0.26 https://k8s.test:8443 -k

# test with curl, map local 8443 to kic 443
# kubectl port-forward -n nginx-ingress dash-kic-dep-5d8f57df4f-64q8s 8443:443 &
# curl --resolve k8s.test:8443:127.0.0.1 https://k8s.test:8443 -kv

# create a admin user
kubectl apply -f admin.yml

# get access token
# kubectl get secret -n kubernetes-dashboard
# kubectl describe secrets -n kubernetes-dashboard admin-user-token-hnb4d

# in Chrome/Safari
# https://k8s.test:30443

