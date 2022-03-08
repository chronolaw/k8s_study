#!/bin/sh

# chrono @ 2022-04
# https://docs.docker.com/registry/
# https://docs.docker.com/registry/spec/api/

docker pull registry

docker run -d --rm -p 5000:5000 registry

# docker run -d -p 5000:5000 \
#     -v /tmp/registry:/var/lib/registry \
#     registry

docker tag nginx:alpine 127.0.0.1:5000/nginx:alpine
docker push 127.0.0.1:5000/nginx:alpine

# check image list
curl 127.1:5000/v2/_catalog | jq

# docker run -d --rm registry

# nginx proxy
# docker run -d --rm \
#     -p 80:80 \
#     -v `pwd`/reg.conf:/etc/nginx/conf.d/default.conf \
#     nginx:alpine

# docker tag nginx:alpine 127.0.0.1:80/nginx:alpine
# docker push 127.0.0.1:80/nginx:alpine
# curl 127.1/v2/_catalog | jq
# curl 127.1/v2/nginx/tags/list
