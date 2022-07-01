#!/bin/sh

# chrono @ 2022-07

sudo apt install net-tools -y
sudo apt install tshark -y

# work on MASTER node

# bridge
brctl show

# cni0     : 10.10.0.0
# flannel.1: 10.10.1.0
route

# 10.10.1.0 -> 9a:23:ea:5f:a4:c8
ip neighbor |grep 10.10.1

# 9a:23:ea:5f:a4:c8 -> 192.168.10.220
bridge fdb |grep flannel

# create 3 pods
kubectl create deploy ngx-dep --image=nginx:alpine --replicas=3

# see ip addr
kubectl get pod -o wide

# check eth0@ifXX
kubectl exec -it ngx-dep-bfbb5f64b-77w94 -- ip addr

# check the first number, get the veth
ip link

# dump cni0
sudo tcpdump port 80 -i cni0 -w a.pcap
tcpdump -r a.pcap -e -X

# dump flannel.1
sudo tcpdump port 80 -i flannel.1  -w a.pcap
