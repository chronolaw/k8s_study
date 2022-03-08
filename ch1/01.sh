#!/bin/sh

# chrono @ 2022-03

#sudo apt-get install -y docker.io
#sudo service docker start
#sudo usermod -aG docker ${USER}

# check version
docker version

# check info
# os/cpu/memory/overlay2/cgroups driver
docker info

# list container
docker ps

# pull image
docker pull busybox

# list image
docker images

# run busybox
docker run busybox echo hello world

# list container
docker ps -a

# official example
docker run hello-world
