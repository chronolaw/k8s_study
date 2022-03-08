#!/bin/sh

# chrono @ 2022-03

# check version
docker version

# check info
# os/cpu/memory/overlay2/cgroups driver
docker info

# pull image
docker pull alpine

# list image
docker images

# run container from image
docker run -it alpine sh

# check os info
# cat /etc/os-release

# same linux core as host
# uname -a

# try to install some apps
# apk update
# apk add vim
# apk add curl

# list container
docker ps -a
#docker rm xxx

# pull image
docker pull ubuntu:18.04

# run container from image
docker run -it ubuntu:18.04 sh

# try to install some apps
# cat /etc/os-release
# apt update
# apt install -y wget redis
# redis-server &

# pull image
docker pull centos:7

# run container from image
docker run -it centos:7 sh

# same linux core as host
# uname -a

# try to install some apps
# yum update
# yum install vim
# yum install curl

# run and delete after using
docker run -it --rm alpine sh

