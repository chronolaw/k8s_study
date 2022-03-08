#!/bin/sh

# chrono @ 2022-03

# python setuptools
sudo apt install -y python3-setuptools

# download or copy tarball
if [ ! -f "1.29.2.tar.gz" ]; then
    wget https://github.com/docker/compose/archive/refs/tags/1.29.2.tar.gz
fi

# unzip
tar xfz 1.29.2.tar.gz

# install
cd compose-1.29.2/
sudo python3 setup.py install

# clean
cd ..
sudo rm -rf compose-1.29.2/

echo "install compose finished"
