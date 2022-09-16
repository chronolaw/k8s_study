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

