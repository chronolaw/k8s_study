# chrono @ 2022-05

# server
sudo apt -y install nfs-kernel-server

# nfs dir
mkdir -p /tmp/nfs

# config
cat << EOF | sudo tee -a /etc/exports
/tmp/nfs 192.168.10.0/24(rw,sync,no_subtree_check,no_root_squash,insecure)
EOF

# start
sudo exportfs -ra
sudo exportfs -v

#sudo systemctl start  rpcbind
#sudo systemctl enable rpcbind
#sudo systemctl status rpcbind

# start svc
sudo systemctl start  nfs-server
sudo systemctl enable nfs-server
sudo systemctl status nfs-server

# check
showmount -e 127.0.0.1
