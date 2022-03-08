#!/bin/sh

# chrono @ 2022-05

cd ../admin

# setup docker/iptabls/fstab/swap
./prepare.sh

# install kubeadm
./admin.sh

# pull k8s imags
./images.sh

# setup master node
./master.sh

# setup flannel
./network.sh

# setup worker node
#./worker.sh
