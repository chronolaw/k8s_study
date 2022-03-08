#!/bin/sh

# chrono @ 2022-04

docker build -f Dockerfile.busybox .

docker images

# docker inspect b61
# docker run b61

# check dockerignore
cat .dockerignore

docker build -t ngx-app .

docker build -t ngx-app:1.0 .

docker run -it ngx-app sh


