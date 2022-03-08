#!/bin/sh

# chrono @ 2022-04

# in browser:
# http://192.168.10.208:80

# kubectl port-forward wp-pod 8080:80 &
# kubectl port-forward proxy-pod 8080:80 &

cat << "EOF" > /tmp/proxy.conf
server {
  listen 80;
  default_type text/html;

  location / {
      proxy_http_version 1.1;
      proxy_set_header Host $host;

      proxy_pass http://127.0.0.1:8080;
  }
}
EOF

docker run -d --rm \
    --net=host \
    -v /tmp/proxy.conf:/etc/nginx/conf.d/default.conf \
    nginx:alpine

