#!/bin/sh

# chrono @ 2022-04

# in browser:
# http://192.168.10.208:80/api/v1/namespaces/kubernetes-dashboard/services/http:kubernetes-dashboard:/proxy/

# minikube dashboard --port=30080 --url=true

cat << "EOF" > /tmp/proxy.conf
server {
  listen 80;
  default_type text/html;

  location / {
      proxy_http_version 1.1;
      proxy_set_header Host localhost;

      proxy_pass http://127.0.0.1:30080;
  }
}
EOF

docker run -d --rm \
    --net=host \
    -v /tmp/proxy.conf:/etc/nginx/conf.d/default.conf \
    nginx:alpine

