#!/bin/bash

# chrono @ 2022-05
# restore images from saved tar files

#eg: ./load.sh ~/tmp/tar

files=`ls $1`

for f in $files
do
    fname=$1/$f
    echo "loading $fname"

    #docker load -i "$fname"
done

echo "ok."
