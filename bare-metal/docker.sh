#!/bin/sh

# chrono @ 2022-03

# https://docs.docker.com/engine/install/ubuntu/
# curl -fsSL https://get.docker.com -o get-docker.sh
# DRY_RUN=1 sh ./get-docker.sh

# check ubuntu version
#s=`grep Jammy /etc/os-release`
#
#if [ -z "$s" ]; then
#    # 20.04/18.04/...
#    curl -fsSL https://get.docker.com | bash -s docker --mirror Aliyun
#else
#    # 22.04
#    sudo apt install -y docker.io
#fi

# install docker from ubuntu repo
sudo apt install -y docker.io

sudo service docker start
sudo usermod -aG docker ${USER}

echo "install docker finished."
echo "please logout then login again."
