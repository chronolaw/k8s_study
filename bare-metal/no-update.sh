#!/bin/sh

# chrono @ 2022-05

arch=`uname -p`
release=`uname -r`

# disable ubuntu's auto upgrade
if [ "$arch" = "aarch64" ]; then

    sudo sed -i 's/"1"/"0"/g' /etc/apt/apt.conf.d/10periodic
    sudo sed -i 's/"1"/"0"/g' /etc/apt/apt.conf.d/20auto-upgrades

fi

