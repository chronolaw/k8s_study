#!/bin/sh

# chrono @ 2022-03

# pull images
docker pull alpine:3.15
docker pull ubuntu:jammy
docker pull nginx:1.21-alpine
docker pull nginx:alpine
docker pull redis

# list images
docker images

# set and show hostname
docker run -h srv alpine hostname

# run nginx
docker run -d nginx:alpine

# list container
docker ps

# check logs
#docker logs xxx

# enter container
docker exec -it xxx sh

# stop container
#docker stop xxx

# check container
docker ps
docker ps -a

# delete container
#docker rm xxx

# delete image
docker rmi nginx:alpine

