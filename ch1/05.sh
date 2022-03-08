#!/bin/sh

# chrono @ 2022-04

# offical image
docker pull library/nginx

# verified publisher image
docker pull bitnami/nginx
docker pull ubuntu/nginx

# openresty offical image
docker pull openresty/openresty

# docker build -t ngx-app .
docker tag ngx-app chronolaw/ngx-app:1.0

# docker login
docker push chronolaw/ngx-app:1.0
# docker logout

# save & load
docker save ngx-app:latest -o ngx.tar
docker rmi ngx-app:latest
docker load -i ngx.tar
