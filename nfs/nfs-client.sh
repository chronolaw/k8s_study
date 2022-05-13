# chrono @ 2022-05

# client
sudo apt -y install nfs-common

# check nfs
showmount -e 192.168.10.208

# mount test
mkdir -p /tmp/test
sudo mount -t nfs 192.168.10.208:/tmp/nfs /tmp/test

# umount
#sudo umount /tmp/test
