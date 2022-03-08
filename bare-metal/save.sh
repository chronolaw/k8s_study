#!/bin/bash

# chrono @ 2022-05
# backup all images in docker

mkdir -p tar

images=`docker images | grep -v TAG | awk '{print $1":"$2}'`

for image in $images
do
    fname=`echo $image | sed "s/:/_/g" - | sed "s/\//_/g" -`
    echo "saving $image to $fname"

    docker save "$image" -o "tar/$fname.tar"
done

echo "ok."
